import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_1 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_1.spec";

When("I read data files for Quotation Comparison Step 3.1", () => {
    quotationComparisonStep3_1.readDatFile()
})

Then("I verify {string} in {string} at {string} has value of {string}", (element, parent, index, child) => {
    quotationComparisonStep3_1.assertQuotationParameters(element, parent, index, child)
})

Then("I verify {string} should be visible in Quotation Parameters", (locatorKey) => {
    quotationComparisonStep3_1.assertElementVisible(locatorKey)
})

Then("I verify {string} has configured range of values of {string} and {string}", (locatorKey, startValue, endValue) => {
    quotationComparisonStep3_1.assertConfiguredRangeofValues(locatorKey, startValue, endValue)
})

When("I click on {string} Button in Quotation Parameters", (locatorKey) => {
    quotationComparisonStep3_1.buttonClick(locatorKey)
})

When("I clear {string} and input {string} value from {string} at ''", (locatorKey, value, parent, programIndex) => {
    quotationComparisonStep3_1.inputNextValue(locatorKey, value, parent, programIndex)
})

Then("I verify {string} field has a new value", (locatorKey) => {
    quotationComparisonStep3_1.assertNewEnteredValue(locatorKey)
})

Then("I verify {string} value is readOnly", (locatorKey) => {
    quotationComparisonStep3_1.assertValueReadOnly(locatorKey)
})

Then("I verify {string} value is editable", () => {
    quotationComparisonStep3_1.assertValueEditable()
})

When("I verify {string} has text of {string}", (locatorKey, value) => {
    quotationComparisonStep3_1.assertHeader(locatorKey, value)
})

Then("I verify {string} for {string} program has value of {string}", (locatorKey, program, value) => {
    quotationComparisonStep3_1.assertOptionsValue(locatorKey, program, value)
})

Then("I verify {string} has updated value of {string}", (locatorKey, value) => {
    quotationComparisonStep3_1.assertUpdatedValue(locatorKey, value)
})

Then("I verify {string} field for {string} porgam has individual value of {string}", (locatorKey, program, feesName) => {
    quotationComparisonStep3_1.assertFeesValues(locatorKey, program, feesName)
})
