import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_4 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_4.spec";

When("I read data files for Quotation Comparison Step 3.4", () => {
    quotationComparisonStep3_4.readData()
})

Then("I verify {string} has text of {string} in Trade-In Section", (locatorKey, textValue) => {
    quotationComparisonStep3_4.assertHeaderTitle(locatorKey, textValue)
})

When("I click on {string} Button", (locatorKey) => {
    quotationComparisonStep3_4.buttonClick(locatorKey)
})

Then("I verify {string} is visible on Trade-In Popup", (locatorKey) => {
    quotationComparisonStep3_4.assertElementVisible(locatorKey)
})

When("I input {string} in {string} on Trade-In Details Popup", (inputValue, locatorKey) => {
    quotationComparisonStep3_4.inputTradeInDetails(inputValue, locatorKey)
})

When("I select {string} and select {string} on Trade-In Details Popup", (locatorKey, conditionValue) => {
    quotationComparisonStep3_4.selectTradeInAssetCondition(locatorKey, conditionValue)
})

When("I get {string} section and check {string} value on Trade-In Details Popup", (locatorKey, checkBoxValue) => {
    quotationComparisonStep3_4.selectFromCheckBoxOnTradeInPopup(locatorKey, checkBoxValue)
})

When("I upload Trade-In Asset Image on Trade-In Details Popup", () => {
    quotationComparisonStep3_4.uploadTradeInAssetImage()
})

Then("I verify {string} in Trade-In Section on Quotation Drawer", (locatorKey) => {
    quotationComparisonStep3_4.assertAssetNameOnDrawer(locatorKey)
})

Then("I verify Updated value of Financed Amount with {string} in {string}", (keyFlag, locatorKey) => {
    quotationComparisonStep3_4.assertUpdatedFinancedAmount(keyFlag, locatorKey)
})

Then("I verify trade-in amount with {string} in {string}", (keyFlag, locatorKey) => {
    quotationComparisonStep3_4.verifyTradeInAmount(keyFlag, locatorKey)
})