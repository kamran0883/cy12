import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_3 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_3.spec";

When("I read data and locator files for Quotation Comparison Step 3.3", () => {
    quotationComparisonStep3_3.readDataAndLocatorFile()
})

When("I click on {string} button for F&I Products", (locatorKey) => {
    quotationComparisonStep3_3.buttonClick(locatorKey)
})

Then("I verify {string} has text of {string} on F&I Section", (locatorKey, value) => {
    quotationComparisonStep3_3.verifyElementText(locatorKey, value)
})

Then("I verify {string} button should be visible on Quotation Drawer", (locatorKey) => {
    quotationComparisonStep3_3.assertElementVisible(locatorKey)
})

Then("I wait for Coverage rates to be available", () => {
    quotationComparisonStep3_3.waitForCoverageRates()
})

Then("I verify {string} has {string} which is marked as {string} at index {string} on F&I Dialog", (locatorKey, productType, key, index) => {
    quotationComparisonStep3_3.verifyAvailableProducts(locatorKey, productType, key, index)
})

Then("I verify {string} has {string} of {string} in F&I Section on Drawer", (locatorKey, keyName, index) => {
    quotationComparisonStep3_3.verifyFnIProductOnDrawer(locatorKey, keyName, index)
})

Then("I verify {string} is collapsed by default in F&I section", (locatorKey) => {
    quotationComparisonStep3_3.assertCollapsedByDefault(locatorKey)
})

When("I input {string} value in {string} at index {string} in F&I Section", (value, locatorKey, index) => {
    quotationComparisonStep3_3.editFnIAmount(value, locatorKey, index)
})

Then("I verify {string} has value of {string} from index {string} in F&I Section", (locatorKey, value, index) => {
    quotationComparisonStep3_3.veriyFnIOnQuotationComparison(locatorKey, value, index)
})
