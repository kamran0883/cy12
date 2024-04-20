
let locators = {}
let configFile = {}
let dataFile = {}
const step3_6LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_6-locators.json"
const step4_6TestDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_6.json"
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_6 {

    /**
      * this method reads data and locator files for Quotation Comparison Step3.5 Options
      */
    readDataAndLocatorFile() {
        cy.readFile(step3_6LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(step4_6TestDataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
    * this method will click on the specifed element
    * @param {string} locatorKey key to pass locator
    */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method will verify the element's text
     * @param {string} locatorKey key to pass locator
     * @param {string} value text value of the element to be verified
     */
    verifyElementText(locatorKey, value) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[value])
    }

    /**
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey]).scrollIntoView().should('be.visible')
    }

    /**
    * this method will input provided value in the specified input field
    * @param {string} locatorKey key to pass locator
    * @param {string} inputValue value to be input in input field
    */
    inputInsuranceDetails(inputValue, locatorKey) {
        cy.get(locators[locatorKey]).clear().type(dataFile[inputValue])
    }

    /**
     * this method will select specified state form State Dropdown on Insurance Dialog
     * @param {string} locatorKey key to pass locator
     * @param {string} stateName name of state to be selected
     */
    selectStateFromDropDown(locatorKey, stateName) {
        // cy.get(locators[locatorKey]).click()
        cy.get(locators[locatorKey]).click()
        cy.get(locators.dropDownList).contains(`${dataFile[stateName]}`).click()
    }

    /**
     * this method will upload Proof of Insurance image
     */
    uploadProofOfInsurance() {
        cy.get(locators.fileUploadSection).selectFile(dataFile.insuranceImagePath)
    }

    /**
    * this method will verify insurance details on Quotation Drawer
    * @param {string} locatorKey key to pass locator
    * @param {string} value text value of the element
    */
    verifyInsuranceDetailsOnDrawer(locatorKey, value) {
        cy.get(locators[locatorKey]).scrollIntoView().contains(dataFile[value])
    }

    /**
     * this method will verify specified element's color
     * @param {string} locatorKey key to pass locator
     * @param {string} color key to specify color value of the element
     */
    verifyElementsColor(locatorKey, color) {
        cy.get(locators[locatorKey]).should('have.css', 'color', dataFile[color])
    }


} export const quotationComparisonStep3_6 = new QuotationComparisonStep3_6()