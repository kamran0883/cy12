let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/Stipulations/FinancialStipulations-locators.json"
const dataFilePath = "cypress/fixtures/Stipulations/FinancialStipulations.json";


class FinancialStipulations {

    /**
     * this method will read data and locator files for Financial Stipulations Received on Conditioned Orders
     */
    readDataAndLocatorFiles() {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will input payment amount in input field
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass data file values
     */
    inputSellingAmount(locatorKey, dataValue) {
        cy.get(locators[locatorKey]).clear().type(dataFile[dataValue])
    }

     /**
     * this method will verify the stipulations text displayed on Screen
     * @param {string} locatorKey key to pass locator
     * @param {string} textValue value of the element to be verified 
     */
     verifyStipulationsContent = (locatorKey, textValue) => {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('include.text', dataFile[textValue])
    }

    /**
     * this method will click on button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click();
    }

    /** 
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisibility(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible');
    }


} export const financialStipulations = new FinancialStipulations()