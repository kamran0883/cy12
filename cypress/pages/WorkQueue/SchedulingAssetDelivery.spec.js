let locators = {}
let dataFile = {}

const locatorsFilePath = "cypress/pages/WorkQueue/SchedulingAssetDelivery-locators.json";
const dataFilePath = "cypress/fixtures/WorkQueue/SchedulingAssetDelivery.json"
const quoteComparisonDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const customerDetailsFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"
const schedulePickupDeliveryFilePath = "cypress/fixtures/WorkQueue/SchedulePickupDelivery.json"

import 'cypress-real-events'

class AssetDelivery {

    /**
    * this method reads Data and Locator files for User Profile
    */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will perform click action on specified element
     * @param {string} locatorKey key to pass locator
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
    }

    /**
     * this method will assert the specified element's visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementNotVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('not.exist')
    }

    /**
    * this method will verify the element's text
    * @param {string} locatorKey key to pass locator
    * @param {string} value text value of the element to be verified
    */
    assertElementText(locatorKey, value) {
        if (value == 'orderID') {
            cy.readFile(quotationDataFilePath).then((file) => {
                cy.get(locators[locatorKey]).should('have.text', file[value])
            })
        }
    }

    /**
    * this method will input orderID in orderID filter on Appointments Queue
    */
    orderIDFilterInput() {
        cy.readFile(quotationDataFilePath).then((id) => {
            cy.get(locators.orderIDFilterForAppointments, { timeout: dataFile.minWaitTime }).clear().type(id.orderID).blur()
        })
    }

    /**
     * this will double click on cancelled order row in search filter
     */
    doubleClick = (locatorKey) => {
        cy.get(locators[locatorKey]).dblclick()
    }

    /**
    * this method will verify the filter result on List view
    * @param {string} dataValue value to be verified in on the filtered record
    */
    verifyOrderDetailsOnCard = (dataValue) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.orderIdOnCard).should('have.text', obj.orderID)
                })
                break
            case 'assetPickup_DeliveryDate':
                cy.readFile(schedulePickupDeliveryFilePath).then((obj) => {
                    const assetPickupDeliveryDate = obj.assetPickup_DeliveryDate.replace(",", "")
                    cy.get(locators.assetPickup_DeliveryDate).should('include.text', assetPickupDeliveryDate)
                })
                break
        }
    }

    /**
     * this method will verify user address on Schedule Asset Delivery screen
     * @param {string} locatorKey key to pass locator
     */
    verifyUserAddress = (locatorKey) => {
        cy.readFile(customerDetailsFilePath).then((obj) => {
            const address = {
                "mailingAddressLineOne": obj.mailingAddressLineOne,
                "mailingAddressCity": obj.mailingAddressCity,
                "mailingAddressState": obj.mailingAddressState,
                "mailingAddressZipCode": obj.mailingAddressZipCode,
                "mailingAddressCounty": obj.mailingAddressCounty
            }
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('include.value', address[locatorKey])
        })
    }

    /**
     * this method will input specified data value into specified input field
     * @param {string} dataValue value to be input into specified input field 
     * @param {string} locatorKey key to pass locator of the input field
     */
    inputIntoAddressFields = (dataValue, locatorKey) => {
        if (locatorKey == 'stateSelector') {
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
            cy.get(locators.listOfAvailableStates).find('li').contains(dataFile[dataValue]).click()
        }
        else {
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(dataFile[dataValue])
        }
    }

    /**
     * this method will perform the mouse over event on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    performRealHoverEvent = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).realHover()
    }

} export const assetDelivery = new AssetDelivery()