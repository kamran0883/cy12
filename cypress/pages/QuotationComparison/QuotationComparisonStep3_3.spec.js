let locators = {}
let dataFile = {}
let configFile = {}
const step3_3LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_3-locators.json";
const step3_3DataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_3.json";
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_3 {

    /**
     * tis method reads data and locators from data and locator files
     */
    readDataAndLocatorFile() {
        cy.readFile(step3_3LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(step3_3DataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
     * this method will click on specified button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
    }

    /**
     * this method will verify the element's text
     * @param {string} locatorKey key to pass locator
     * @param {string} value text value of the element to be verified
     */
    verifyElementText(locatorKey, value) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('have.text', dataFile[value])
    }

    /**
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('be.visible')
    }

    /**
     * this method will verify the F&I Products on F&I Dialog
     * @param {string} locatorKey key to pass locator
     * @param {string} productType key to select productType key from configFile
     * @param {string} index key to pass index of object within productType is to be selected
     */
    verifyAvailableProducts(locatorKey, productType, key, index) {
        const productName = configFile.FnIProducts[index][productType]
        if (key == 'Enabled') {
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).find('button').contains(productName)
        }
        else {
            cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).find('button').contains(productName).should('not.exist')
        }
    }

    /**
     * this method will verify F&I products on Quotation Drawer
     * @param {string} locatorKey key to pass locator 
     * @param {string} keyName key to be selected from configFile
     * @param {string} index index of object from which keyName is to be selected
     */
    verifyFnIProductOnDrawer(locatorKey, keyName, index) {
        const productKey = configFile.FnIProducts[index][keyName]
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(productKey)
    }

    /**
     * this method will intercept get-rates API
     */
    assertGetRatesApiResponse() {
        cy.intercept(Cypress.env('INTEGRATION_API_BASE_URL') + "/get-rates").as("getRatesAPI")
        cy.wait("@getRatesAPI", { timeout: dataFile.midWaitTime }).should(apiCall => {
            expect(apiCall.response.statusCode).to.eq(200)
        })

    }

    /**
     * this method will assert if coverage rates are available for F&I products
     */
    waitForCoverageRates() {
        cy.get(locators.emptyCoverageRatesSign, { timeout: dataFile.maxWaitTime }).should('not.contain', dataFile.emptyCoverageSign)
    }

    /**
     * this method will assert the specified element does not exist
     * @param {string} locatorKey key to pass locator
     */
    assertCollapsedByDefault(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('not.exist')
    }

    /**
     * this method will edit F&I value on Quotation Comparison Page 
     * @param {string} value new value to input for F&I Product 
     * @param {string} locatorKey key to pass locator
     * @param {string} index index of object from which keyName is to be selected
     */
    editFnIAmount(value, locatorKey, index) {
        const newAmount = configFile.FnIProducts[index][value]
        cy.get(locators[locatorKey]).clear().type(newAmount)
    }

    /**
     * this method will verify the specified element contains the relative value
     * @param {string} value value to be verified for F&I Product 
     * @param {string} locatorKey key to pass locator
     * @param {string} index index of object from which keyName is to be selected
     */
    veriyFnIOnQuotationComparison(locatorKey, value, index) {
        const newValue = configFile.FnIProducts[index][value]
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(newValue)
    }

} export const quotationComparisonStep3_3 = new QuotationComparisonStep3_3()