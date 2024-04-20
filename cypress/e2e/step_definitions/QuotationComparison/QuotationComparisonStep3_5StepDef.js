import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_5 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_5.spec";

When("I read data and Locator files for Quotation Comparison Step 3.5", () => {
    quotationComparisonStep3_5.readDataAndLocatorFile()
})

Then("I verify {string} is visible in Options section", (locatorKey) => {
    quotationComparisonStep3_5.assertElementVisible(locatorKey)
})

Then("I verify {string} is collapsed by default in Fee section", (locatorKey) => {
    quotationComparisonStep3_5.assertCollapsedByDefault(locatorKey)
})

When("I click on {string} Button in Options Section", (locatorKey) => {
    quotationComparisonStep3_5.buttonClick(locatorKey)
})

Then("I verify {string} has {string} from dealerOptions at index of {string} in Options Section", (locatorKey, value, index) => {
    quotationComparisonStep3_5.assertOptionsValues(locatorKey, value, index)
})

Then("I verify {string} has text of {string} in Options Section", (locatorKey, value) => {
    quotationComparisonStep3_5.assertElementText(locatorKey, value)
})

Then("I verify {string} has updated value of Options", (locatorKey) => {
    quotationComparisonStep3_5.calculateUpdatedValueOfOpions(locatorKey)
})