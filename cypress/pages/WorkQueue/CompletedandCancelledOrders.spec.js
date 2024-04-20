let locators = {}
let dataFile = {}
let customerData = {}
const locatorsFilePath = "cypress/pages/WorkQueue/CompletedandCancelledOrders-locators.json"
const dataFilePath = "cypress/fixtures/WorkQueue/CompletedandCancelledOrders.json"
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json";
const quoteComparisonDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const customerDetailsFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"


class CompletedandCancelledOrders {

    /**
     * this method will read data and locator files for Completed and Cancelled Orders
     */
    readDataAndLocatorFiles() {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
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
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible')
    }

    /**
     * this method will verify the cancelled order details on Card View
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyFilterResults = (dataValue) => {
        switch (dataValue) {
            case 'orderID':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators.orderIDOnCard).should('have.text', obj.orderID)
                })
                break
            case 'sellingPrice':
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    const sellingPrice = obj.leaseSellingPrice.replace('$', "")
                    cy.get(locators.sellingPriceOnCard).should('include.text', sellingPrice)
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
            case 'declineOrderReason':
                cy.readFile(dataFilePath).then((obj) => {
                    cy.get(locators.reasonOnCard).should('have.text', obj.declineOrderReason)
                })
                break
            case 'cancelledOrderReason':
                cy.readFile(dataFilePath).then((obj) => {
                    cy.get(locators.reasonOnCard).should('include.text', obj.cancelledOrderReason)
                })
                break
        }
    }

    /**
     * this method will verify the visibility of List View Filters
     * @param {string} locatorKey key to pass locator
     */
    assertFiltersVisibility = (locatorKey) => {
        cy.get(locators[locatorKey]).scrollIntoView().should('be.visible')
    }

    /**
     * this method will verify asset details in List View
     * @param {string} locatorKey key to pass locator
     * @param {string} value key to pass value to be asserted
     */
    verifyAssetInfoInListView(locatorKey, value) {
        cy.readFile(assetSelectionDataFilePath).then((obj) => {
            cy.get(locators[locatorKey]).should('have.text', obj[value])
        })
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
     * this method will verify Cancelled Order details in List View
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyOrderInfoInListView = (locatorKey, dataValue) => {
        cy.get(locators[locatorKey]).should('have.text', dataValue)
    }

    /**
     * this method will verify order creation date in List View
     * @param {string} locatorKey key to pass locator 
     */
    verifyOrderCreationDate = (locatorKey) => {
        cy.readFile(quoteComparisonDataFilePath).then((obj) => {
            const creationDate = obj.orderCreationDate
            cy.get(locators[locatorKey]).should('have.text', creationDate)

        })
    }

    /**
     * this method will input data in filters of Cancelled Order Queue
     * @param {string} dataValue key to pass value to be asserted
     * @param {string} locatorKey key to pass locator 
     */
    applyFilters(dataValue, locatorKey) {
        switch (dataValue) {
            case 'customerName':
                const customerName = this.getCustomerFullName();
                cy.get(locators.customerNameFilter, { timeout: dataFile.minWaitTime }).clear().type(customerName).blur({ timeout: dataFile.minWaitTime });
                break;
            case 'vinNumber':
                cy.readFile(assetSelectionDataFilePath).then((obj) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(obj[dataValue]).blur({ timeout: dataFile.minWaitTime })
                });
                break;
            case 'stockNumber':
                cy.readFile(assetSelectionDataFilePath).then((obj) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(obj[dataValue]).blur({ timeout: dataFile.minWaitTime })
                });
                break;
            case 'assetCondition':
                cy.readFile(assetSelectionDataFilePath).then((obj) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(obj[dataValue]).blur({ timeout: dataFile.minWaitTime })
                });
                break;
            case 'declineOrderReason':
                cy.readFile(dataFilePath).then((obj) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(obj[dataValue]).blur()
                });
                break;
            default:
                cy.readFile(quoteComparisonDataFilePath).then((obj) => {
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).clear().type(obj[dataValue]).blur()
                });
                break;
        }
    }

} export const completedandCancelledOrders = new CompletedandCancelledOrders()