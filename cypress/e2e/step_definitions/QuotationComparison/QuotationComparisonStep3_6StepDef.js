import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_6 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_6.spec";

When("I read data and Locator files for Quotation Comparison Step 3.6", () => {
    quotationComparisonStep3_6.readDataAndLocatorFile()
})

When("I click on {string} Button in Insurance Section", (locatorKey) => {
    quotationComparisonStep3_6.buttonClick(locatorKey)
})

Then("I verify {string} has text of {string} on Insurance Dialog", (locatorKey, value) => {
    quotationComparisonStep3_6.verifyElementText(locatorKey, value)
})

Then("I verify {string} is visible on Insurance Dialog", (locatorKey) => {
    quotationComparisonStep3_6.assertElementVisible(locatorKey)
})

When("I input {string} in {string} field on Insurance Dialog", (inputValue, locatorKey) => {
    quotationComparisonStep3_6.inputInsuranceDetails(inputValue, locatorKey)
})

When("I click on {string} and select {string} on Insurance Dialog", (locatorKey, stateName) => {
    quotationComparisonStep3_6.selectStateFromDropDown(locatorKey, stateName)
})

When("I upload proof of Insurance Image", () => {
    quotationComparisonStep3_6.uploadProofOfInsurance()
})

Then("I verify {string} contains {string} on Quotation Drawer", (locatorKey, value) => {
    quotationComparisonStep3_6.verifyInsuranceDetailsOnDrawer(locatorKey, value)
})

Then("I verify {string} has background color of {string} on Insurance Dialog", (locatorKey, color) => {
    quotationComparisonStep3_6.verifyElementsColor(locatorKey, color)
})