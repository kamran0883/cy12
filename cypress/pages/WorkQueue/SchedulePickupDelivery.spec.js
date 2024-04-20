let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/WorkQueue/SchedulePickupDelivery-locators.json"
const dataFilePath = "cypress/fixtures/WorkQueue/SchedulePickupDelivery.json"
const quotationDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json"

class PickupDelivery {

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
     * this method clicks on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
    }
    /**
     * this method performs double click action on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    doubleClick = (locatorKey) => {
        cy.get(locators[locatorKey]).dblclick()
    }

    /**
     * this method will verify the specified element's text
     * @param {string} locatorKey key to pass locator 
     * @param {string} dataValue key to pas value to be asserted
     */
    assertElementText = (locatorKey, dataValue) => {
        cy.get(locators[locatorKey]).should('have.text', dataFile[dataValue])
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible')
    }

    /**
     * this method will assert list view filters
     * @param {string} locatorKey key to pass locator 
     */
    assertFilterVisibility = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).scrollIntoView().should('be.visible')
    }

    /**
     * Generates the full name of the customer based on the first name and last name
     * @returns {string} the full name of the customer
     */
    getCustomerName = () => {
        const firstName = customerDetailsData.firstName;
        const middleName = customerDetailsData.middleName
        const lastName = customerDetailsData.lastName;
        return `${firstName}${middleName}${lastName}`;
    };

    /**
     * this method will verify the order info in the Card View
     * @param {string} dataValue key to pass data value
     */
    verifyOrderInfoOnCard = (dataValue) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quotationDataFilePath).then((file) => {
                    cy.get(locators.orderIdOnCard).should('have.text', file.orderID)
                })
                break;
            case 'vehicleName':
                cy.readFile(assetSelectionDataFilePath).then((obj) => {
                    const assetName = obj.vehicleName.split(" ")
                    const assetYearMake = assetName.slice(0, 2).join(" ")
                    const assetModelTrim = assetName.slice(2, 4).join(" ")
                    cy.get(locators.assetYearAndMakeOnCard).should('have.text', assetYearMake)
                    cy.get(locators.assetModelAndTrimOnCard).should('have.text', assetModelTrim)
                })
                break;
            case 'vinNumber':
                cy.readFile(assetSelectionDataFilePath).then((file) => {
                    cy.get(locators.vinNumberOnCard).should('include.text', file[dataValue])
                })
                break;
            case 'customerName':
                const customerName = this.getCustomerName()
                cy.get(locators.customerNameOnCard).should('have.text', customerName)
                break;
            case 'orderStatus':
                cy.get(locators.statusOnCard).should('have.text', dataFile.orderStatus)
                break
        }
    }

    /**
     * this method is used for filters input
     * @param {string} dataValue value to be input into in input field
     * @param {string} locatorKey key to pass locator
     */
    inputIntoFilters = (dataValue, locatorKey) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quotationDataFilePath).then((file) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).clear().type(file[dataValue]).blur()
                })
                break
        }
    }

    /**
     * this method is used to calculate the future date
     * @returns formattedNextDate a future date to be used for Pickup/Delivery scheduling
     */
    getNextDate = () => {
        const currentDate = new Date();
        const nextDate = new Date(currentDate);
        nextDate.setDate(currentDate.getDate() + 1);
        const options = {
            month: '2-digit',
            day: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true
        };
        const formattedNextDate = nextDate.toLocaleString('en-US', options);
        return formattedNextDate
    }

    /**
     * this method is used to input Pickup/Delivery time and Date
     * @param {string} locatorKey key to pass locator
     */
    pickupDeliveryDateInput = (locatorKey) => {
        cy.readFile(dataFilePath).then((file) => {
            const pickupDeliveryDate = this.getNextDate()
            file["assetPickup_DeliveryDate"] = pickupDeliveryDate
            cy.writeFile(dataFilePath, file)
            cy.get(locators[locatorKey]).clear().type(pickupDeliveryDate.toString().replace(',', ""))
        })
    }

} export const pickupDelivery = new PickupDelivery()