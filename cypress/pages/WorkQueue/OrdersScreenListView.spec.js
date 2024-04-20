let locators = {}
let datafile = {}
let customerData = {}
const locatorsFilePath = "cypress/pages/WorkQueue/OrdersScreenListView-locators.json"
const dataFilePath = "cypress/fixtures/WorkQueue/OrdersScreenListView.json"
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json";
const quoteComparisonDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const customerDetailsFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"

class ListView {

    /**
     * this method reads Data and Locator files for User Profile
     */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            datafile = obj
        })
        cy.readFile(customerDetailsFilePath).then((obj) => {
            customerData = obj
        })
    }

    /**
     * this method clicks on the specified element
     * @param {string} locatorKey key to pass locator 
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method will verify the specified element's text
     * @param {string} locatorKey key to pass locator 
     * @param {string} dataValue key to pas value to be asserted
     */
    assertElementText = (locatorKey, dataValue) => {
        cy.get(locators[locatorKey]).should('have.text', datafile[dataValue])
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} visibilityKey key to pass visibility check
     */
    assertElementVisible = (locatorKey, visiblityKey) => {
        if (visiblityKey == 'not')
            cy.get(locators[locatorKey], { timeout: datafile.midWaitTime }).should('not.be.visible')
        else
            cy.get(locators[locatorKey], { timeout: datafile.midWaitTime }).should('be.visible')
    }

    /**
     * this method will perform the double click action on specified element
     * @param {string} locatorKey key to pass locator
     */
    doubleClick = (locatorKey) => {
        cy.get(locators[locatorKey]).dblclick()
    }

    /**
     * this method will verify the visibility of List View Filters
     * @param {string} locatorKey key to pass locator
     */
    assertFiltersVisibility = (locatorKey) => {
        cy.get(locators[locatorKey]).scrollIntoView().should('be.visible')
    }

    /**
     * this method will assert Request Status on WorkQueue
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value value of Request Status on WorkQueue
     */
    verifyAssetInfoInListView(locatorKey, value) {
        cy.readFile(assetSelectionDataFilePath).then((obj) => {
            cy.get(locators[locatorKey]).should('have.text', obj[value])
        })
    }

    /**
     * this method will be used for Input into Filters on List View Screen
     * @param {string} locatorKey 
     * @param {string} inputValue 
     */
    inputIntoFilters = (inputValue, locatorKey) => {
        cy.get(locators[locatorKey]).clear().type(datafile[inputValue]).blur()
    }

    /**
     * Generates the full name of the customer based on the first name, middle name and last name
     * @returns {string} the full name of the customer
     */
    getCustomerFullName = () => {
        const firstName = customerData.firstName;
        const middleName = customerData.middleName;
        const lastName = customerData.lastName;
        return `${firstName} ${middleName} ${lastName}`;
    }

    /**
     * this method will verify customer details in List View
     * @param {string} locatorKey key to pass locator
     */
    verifyCustomerDetailsInListView = (locatorKey) => {
        const customerName = this.getCustomerFullName()
        cy.get(locators[locatorKey]).should('have.text', customerName)
    }


    /**
     * this method will verify Finance Type in List View
     * @param {string} locatorKey key to pass locator
     */
    getFinanceTypeFromDataFile = (locatorKey) => {
        cy.readFile(customerDetailsFilePath).then((obj) => {
            const financeType = obj.programType.split(" ")[2]
            this.verifyOrderInfoInListView(locatorKey, financeType)
        })
    }

    /**
     * this method will verify selling price in List View
     * @param {string} locatorKey key to pass locator
     */
    getSellingPriceFromDataFile = (locatorKey) => {
        cy.readFile(quoteComparisonDataFilePath).then((file) => {
            const sellingPrice = file.leaseSellingPrice.replace('$', '')
            this.verifyOrderInfoInListView(locatorKey, sellingPrice)
        })
    }

    /**
     * method to verify financial details in List View
     * @param {string} locatorKey key to pass locator
     */
    verifyOrderInfoInListView = (locatorKey, dataValue) => {
        cy.get(locators[locatorKey]).should('have.text', dataValue)
    }

    /**
     * this method will verify order creation date in List View
     */
    verifyOrderCreationDate = () => {
        cy.readFile(quoteComparisonDataFilePath).then((obj) => {
            const creationDate = obj.orderCreationDate
            cy.get(locators.creataionDate).should('have.text', creationDate)
        })
    }

    /**
     * this method will verify ellipsis menu options
     * @param {string} dataValue value of the list item to be verified
     */
    verifyEllipsisMenuOptions = (dataValue) => {
        cy.get(locators.ellipsisMenueOptions).find('li').contains(datafile[dataValue])
    }

    /**
     * this method will select the list item based on its content
     * @param {string} value value of the list item to be selected
     * @param {string} locatorKey key to pass locator
     */
    selectFromEllipsisMenuOptions = (value, locatorKey) => {
        cy.get(locators[locatorKey]).find('li').contains(datafile[value]).click()
    }

    /**
     * this method will input the value passed into search area Filter Input
     * @param {string} dataValue value to be input in Search Area
     */
    inputIntoSearchArea = (dataValue) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.searchAreaInput).clear().type(obj.orderID)
                })
                break
            case 'creationDate':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.searchAreaInput).clear().type(obj.orderCreationDate)
                })
                break
            case 'sellingPrice':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    const sellingPrice = obj.leaseSellingPrice.replace('$', "")
                    cy.get(locators.searchAreaInput).clear().type(sellingPrice)
                })
                break
            case 'expiryDate':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.searchAreaInput).clear().type(obj.quotationExpiryDate)
                })
                break

        }
    }

    /**
     * this method will verify the filter result on List view
     * @param {string} dataValue value to be verified in on the filtered record
     */
    verifyFilterResults = (dataValue) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.orderIdOnCard).should('have.text', obj.orderID)
                })
                break
            case 'sellingPrice':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    const sellingPrice = obj.leaseSellingPrice.replace('$', "")
                    cy.get(locators.sellingPriceOnCard).should('include.text', sellingPrice)
                })
                break
            case 'expiryDate':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.expiryDateOnCard).should('have.text', obj.quotationExpiryDate)
                })
                break
            case 'assetName':
                cy.readFile(assetSelectionDataFilePath).then((obj) => {
                    const assetName = obj.vehicleName.split(" ")
                    const assetyearMake = assetName.slice(0, 2).join(" ")
                    const assetModelTrim = assetName.slice(2, 4).join(" ")
                    cy.get(locators.assetYearAndMakeOnCard).should('have.text', assetyearMake)
                    cy.get(locators.assetModelAndTrimOnCard).should('have.text', assetModelTrim)
                })
                break
        }
    }

} export const listView = new ListView()