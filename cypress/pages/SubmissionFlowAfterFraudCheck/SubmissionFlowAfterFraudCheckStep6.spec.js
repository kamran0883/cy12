let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/SubmissionFlowAfterFraudCheck/SubmissionFlowAfterFraudCheckStep6-locators.json";
const dataFilePath = "cypress/fixtures/SubmissionFlowAfterFraudCheck/SubmissionFlowAfterFraudCheck.json"

class SubmissionFlowAfterFraudCheck {

    /**
    * this method reads data and locator files for Submission Flow After Fraud Check Step 6
    */
    readDataAndLocatorFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will click on specified element
     * @param {string} locatorKey key to pass locator
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method will assert the element text
     * @param {string} locatorKey key to pass locator
     * @param {string} textValue key to pass text value to be asserted 
     */
    assertElementText = (locatorKey, textValue) => {
        cy.get(locators[locatorKey]).should('include.text', dataFile[textValue])
    }

    /**
     * this method will assert order status based on Credit Request API Response
     * @param {string} decisionKey key to check order status 
     */
    assertCreditRequest = (decisionKey) => {
        cy.intercept(Cypress.env("DMS_API_BASE_URL") + "/dms/credit-request").as("creditRequest")
        cy.wait("@creditRequest", { timeout: dataFile.minWaitTime }).then((creditRequest) => {
            expect(creditRequest.response.statusCode).to.eq(200)
            if (decisionKey == 'Approved') {
                cy.get(locators.orderStatusOnSummaryScreen, { timeout: dataFile.midWaitTime }).should('include.text', dataFile.orderApprovedHdrText)
            }
            else if (decisionKey == 'Cancelled') {
                cy.get(locators.orderStatusOnSummaryScreen, { timeout: dataFile.midWaitTime }).should('include.text', dataFile.orderCancelledHdrText)

            }
            else if (decisionKey == 'Conditioned') {
                expect(creditRequest.response.body.decision_status_code).to.eq("003")
                cy.get(locators.orderStatusOnSummaryScreen, { timeout: dataFile.midWaitTime }).should('include.text', dataFile.orderConditionedHdrText)
            }
        })
    }


} export const submissionFlowAfterFraudCheck = new SubmissionFlowAfterFraudCheck()