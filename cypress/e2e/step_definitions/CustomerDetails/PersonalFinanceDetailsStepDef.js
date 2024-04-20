import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { personalFinanceDetails } from "../../../pages/CustomerDetails/PersonalFinanceDetailsStep5_3.spec";


When("I read data and Locator files for Personal Finance Step 5.3", () => [
    personalFinanceDetails.readDataAndLocatorFiles()
])

When("I click on {string} on Personal Finance Screen", (btnKey) => {
    personalFinanceDetails.buttonClick(btnKey)
})

Then("I verify {string} is visible on Personal Finance page", (locatorKey) => {
    personalFinanceDetails.assertElementVisible(locatorKey)
})

Then("I select {string} from {string} dropdown of {string} at index {string} and verify monthly payment field existence", (listValue, listLocator, parent, index) => {
    personalFinanceDetails.selectFromDropDownList(listValue, listLocator, parent, index)
})

Then("I verify the Radio button for {string} should be selected by Default", (radioBtnKey) => {
    personalFinanceDetails.assertRadioButtonSelectedByDefault(radioBtnKey)
});

When("I get {string} section and check {string} value on bankruptcy Question", (radioBtnKey, radioBtnValue) => {
    personalFinanceDetails.assertRadioButtonSelection(radioBtnKey, radioBtnValue)
});

When("I input {string} in {string} at index {string} on Personal Finance page", (locatorKey, dataValue, index) => {
    personalFinanceDetails.inputPaymentInfo(locatorKey, dataValue, index)
});

When("I get {string} section and check {string} at index {string} on Personal Finance page", (locatorKey, radioBtnValue, index) => {
    personalFinanceDetails.selectFromBankQuestion(locatorKey, radioBtnValue, index)
});

Then("I verify {string} should be enabled on Personal Finance Details", (locatorKey) => {
    personalFinanceDetails.assertElementIsEnabled(locatorKey)
})

Then("I validate Fraud Check API response", () => {
    personalFinanceDetails.validateFraudCheckResponse()
})

