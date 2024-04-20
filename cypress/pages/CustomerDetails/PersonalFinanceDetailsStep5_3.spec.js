let locators = {}
let dataFile = {}
const locatorFilePath = "cypress/pages/CustomerDetails/PersonalFinanceDetailsStep5_3-locators.json"
const dataFilePath = "cypress/fixtures/CustomerDetails/PersonalFinanceDetails.json"


class PersonalFinanceDetails {

    /**
     * this method will read data and locator files for Personal Finance Details
     */
    readDataAndLocatorFiles() {
        cy.readFile(locatorFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
    * this will click on specified button
    * @param {string} locatorKey key to pass locator
    */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile[4].minWaitTime }).should('be.visible').click()
    }

    /**
   * this method will assert element visibility
   * @param {string} locatorKey key to pass locator
   */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile[4].midWaitTime }).should('be.visible')
    }

    /**
     * this method will assert the specified elemnt is enabled
     * @param {string} locatorKey key to pass locator
     */
    assertElementIsEnabled(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile[4].midWaitTime }).should('be.enabled')
    }

    /**
    * this method will select specified item from dropdown list 
    * and also verify that monthly payment field become visible accordingly
    * @param {string} parent key to pass locator of parent element
    * @param {string} listLocator key to pass locator of dropdown list
    * @param {string} listValue value to be selected from dropdown
    * @param {string} index value of option in dropdown list
    *     
    */
    selectFromDropDownList(listValue, listLocator, parent, index) {
        cy.get(locators[parent]).click()
        cy.get(locators[listLocator]).find('li').contains(dataFile[index][listValue]).scrollIntoView().click()
        if (dataFile[index][listValue] === 'Personal Ownership' || dataFile[index][listValue] === 'With Relatives') {
            cy.get(locators.monthlyPayment).should('not.exist')
        } else if (dataFile[index][listValue] === 'Renting' || dataFile[index][listValue] == 'Mortgage') {
            cy.get(locators.monthlyPayment).should('exist').and('be.enabled');
        }
    }

    /**
     * this method will assert that the NO radio button is selected by default.
     * @param {string} locatorKey key to pass locator
     */

    assertRadioButtonSelectedByDefault(radioBtnKey) {
        cy.get(locators[radioBtnKey]).should('be.checked');
    }

    /**
   * this method will input payment amount in input feild
   * @param {string} locatorKey key to pass locator
   * @param {string} dataValue key to pass data file values
   */
    inputPaymentInfo(locatorKey, dataValue, index) {
        cy.get(locators[locatorKey]).type(dataFile[index][dataValue])
    }

    /**
     * this method will check the selection of bankruptcy radioButton
     * @param {string} locatorKey key to pass locator
     * @param {string} radioBtnValue key to assert radioButton value
     * @param {string} index key to pass index of data object in dataFile
     */
    selectFromBankQuestion(locatorKey, radioBtnValue, index) {
        cy.get(`${locators[locatorKey]} [value='${dataFile[index][radioBtnValue]}']`).check()
    }

    /**
     * this method assert fraud-check API response
     */
    validateFraudCheckResponse() {
        cy.intercept(Cypress.env("DMS_API_BASE_URL") + "/dms/customer/fraud-check").as("fraudCheck")
        cy.wait("@fraudCheck", { timeout: dataFile[4].midWaitTime }).then((fraudCheck) => {
            expect(fraudCheck.response.statusCode).to.eq(201)
            if (fraudCheck.response.body.status === 'Reviewed') {
                cy.get(locators.kycStatus).should('have.text', dataFile[4].kycSuccess)
            }
            else if (fraudCheck.response.body.status === "KYC Unsuccessful") {
                cy.get(locators.kycStatus).should('have.text', dataFile[4].kycFailed)
            }
        })
    }

} export const personalFinanceDetails = new PersonalFinanceDetails()