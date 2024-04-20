
let locators = {}
let configFile = {}
let dataFile = {}
const step3_5LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_5-locators.json";
const step3_5DataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_5.json"
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_5 {

    /**
      * this method reads data and locator files for Quotation Comparison Step3.5 Options
      */
    readDataAndLocatorFile() {
        cy.readFile(step3_5LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
        cy.readFile(step3_5DataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey]).scrollIntoView().should('be.visible')
    }

    /**
     * this method will assert the specified element does not exist
     * @param {string} locatorKey key to pass locator
     */
    assertCollapsedByDefault(locatorKey) {
        cy.get(locators[locatorKey]).should('not.exist')
    }

    /**
     * this method will click on the specifed element
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this metod will assert the specified element's value
     * @param {string} locatorKey key to pass locator
     * @param {string} value value of the element to be verified
     * @param {string} index index of value in configuration file
     */
    assertOptionsValues(locatorKey, value, index) {
        const optionsValue = configFile.dealerProfile.dealerOptions[index][value]
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(optionsValue)
    }

    /**
     * this method will verify the element's text
     * @param {string} locatorKey key to pass locator
     * @param {string} value text value of the element to be verified
     */
    assertElementText(locatorKey, value) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[value])
    }

    /**
     * this method will calculate the updated value of Options
     * and will verify this value in the specified element
     * @param {string} locatorKey key to pass locator
     */
    calculateUpdatedValueOfOpions(locatorKey) {
        const optionalAddOnPrice = parseFloat(configFile.dealerProfile.dealerOptions[0].price)
        const preinstalledAddonPrice = configFile.dealerProfile.dealerOptions[1].price
        const updatedValue = (optionalAddOnPrice + preinstalledAddonPrice).toLocaleString("en-US", {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2,
        })
        cy.get(locators[locatorKey]).should('have.text', `$${updatedValue}`)
    }

} export const quotationComparisonStep3_5 = new QuotationComparisonStep3_5()