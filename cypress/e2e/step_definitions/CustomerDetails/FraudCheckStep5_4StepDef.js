import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
import { fraudCheck } from "../../../pages/CustomerDetails/FraudCheckStep5_4.spec"


When("I read data and Locator files for Fraud Check Step 5.4", () => {
    fraudCheck.readLocatorsAndDataFile()
})

Then("I verify {string} should be enabled after Fraud Check", (locatorKey) => {
    fraudCheck.assertElementEnabled(locatorKey)
})

Then("I verify fraud check is {string} based on Fraud Check API response", (fraudCheckKey) => {
    fraudCheck.validateFraudCheckResponse(fraudCheckKey)
})

When("I enter existing customer email for FraudCheck", () => {
    fraudCheck.inputExistingCustomerEmail()
})