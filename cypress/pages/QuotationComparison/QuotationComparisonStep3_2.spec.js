
let locators = {}
let dataFile = {}
let configFile = {}
const step3_2LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_2-locators.json";
const step3_2DataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_2.json";
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_2 {

    /**
     * tis method reads data form data files
     */
    readData() {
        cy.readFile(step3_2LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(step3_2DataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
     * this method will assert fee section is collapsed by deafult
     * @param {string} locatorKey key to pass locator
     */
    assertCollapsedByDefault(locatorKey) {
        cy.get(locators[locatorKey]).should('not.exist')
    }

    /**
     * this method will click on specified button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).scrollIntoView().should('be.visible').click()
    }

} export const quotationComparisonStep3_2 = new QuotationComparisonStep3_2()