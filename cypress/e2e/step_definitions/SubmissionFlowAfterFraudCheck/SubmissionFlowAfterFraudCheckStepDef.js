import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { submissionFlowAfterFraudCheck } from "../../../pages/SubmissionFlowAfterFraudCheck/SubmissionFlowAfterFraudCheckStep6.spec";

When("I read data and Locator files for Submission Flow after Fraud Check Step 6", () => {
    submissionFlowAfterFraudCheck.readDataAndLocatorFile()
})

When("I click on {string} for Submission Flow After Fraud Check", (locatorKey) => {
    submissionFlowAfterFraudCheck.buttonClick(locatorKey)
})

Then("I validate if Order Status is {string} based upon Credit Request API response", (decisionKey) => {
    submissionFlowAfterFraudCheck.assertCreditRequest(decisionKey)
})

Then("I verify {string} should have the text of {string}", (locatorKey, textValue) => {
    submissionFlowAfterFraudCheck.assertElementText(locatorKey, textValue)
})