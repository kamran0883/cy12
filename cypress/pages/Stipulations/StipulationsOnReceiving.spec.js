let dataFile = {}
let locators = {}
const locatorFilePath = "cypress/pages/Stipulations/StipulationOnReceiving-locators.json"
const dataFilePath = "cypress/fixtures/Stipulations/StipulationsOnReceiving.json"
const insuranceDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_6.json"
class StipulationsOnReceiving {

    /**
     * this method reads Data and Locator files for User Profile
     */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }
    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('be.visible')
    }

    /**
     * this method will verify the stipulations text displayed
     * @param {string} locatorKey key to pass locator
     * @param {string} textValue value of the element to be verified 
     */
    verifyStipulationsContent = (locatorKey, textValue) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('include.text', dataFile[textValue])
    }

    /**
     * this method will be used to perform button click action
     * @param {string} locatorKey key to pass locator 
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).click()
    }

    /**
     * this method will upload proof of insurance document
     */
    uploadInsuranceDoc = () => {
        cy.readFile(insuranceDataFilePath).then((file) => {
            cy.get(".file-upload-label").selectFile(file.insuranceImagePath)
        })
    }

} export const stipulationsHandling = new StipulationsOnReceiving()