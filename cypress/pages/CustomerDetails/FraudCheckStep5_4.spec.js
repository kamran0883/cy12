let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/CustomerDetails/FraudCheckStep5_4-locators.json"
const dataFilePath = "cypress/fixtures/CustomerDetails/FraudCheck.json"
import CustomerCheck from "../CustomerCheck/CustomerCheck.spec";
const customerCheck = new CustomerCheck()

class FraudCheckStep5_4 {

    /**
     * this method reads data and locator files for Fraud Check Step5.4
     */
    readLocatorsAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will assert ele
     * @param {string} locatorKey key to pass locator
     */
    assertElementEnabled = (locatorKey) => {
        cy.get(locators[locatorKey]).should('be.enabled')
    }

    /**
    * this method will assert fraud-check API response
    * @param {string} fraudKey key to filter Fraud Check API Response
    */
    validateFraudCheckResponse = (fraudKey) => {
        cy.intercept(Cypress.env("DMS_API_BASE_URL") + "/dms/customer/fraud-check").as("fraudCheck")
        cy.wait("@fraudCheck", { timeout: dataFile.midWaitTime }).then((fraudCheck) => {
            expect(fraudCheck.response.statusCode).to.eq(201)
            if (fraudKey === 'passed') {
                cy.get(locators.kycStatus).should('have.text', dataFile.fraudCheckPassed)
            }
            else if (fraudKey === 'failed') {
                cy.get(locators.kycStatus).should('have.text', dataFile.fraudCheckFailed)
                cy.get(locators.goToOrderPageBtn).should('be.visible')
            }
        })
    }

    /**
     * this method will input existing user email
     */
    inputExistingCustomerEmail = () => {
        const existingEmail = dataFile.existingCustomerEmail
        customerCheck.emailInput(existingEmail)
    }


} export const fraudCheck = new FraudCheckStep5_4()