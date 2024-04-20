let locators = {}
let dataFile = {}

const locatorsFilePath = "cypress/pages/WorkQueue/SchedulingAssetPickup-locators.json";
const quotationDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"

class SchedulingAssetPickup {

    /**
     * this method reads Data and Locator files for User Profile
     */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
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
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('be.visible')
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

} export const schedulingAssetPickup = new SchedulingAssetPickup()