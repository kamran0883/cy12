import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparisonStep3_2 } from "../../../pages/QuotationComparison/QuotationComparisonStep3_2.spec";


When("I read data files for Quotation Comparison Step 3.2", () => {
    quotationComparisonStep3_2.readData()
})

Then("I verify {string} is collapsed by default", (locatorKey) => {
    quotationComparisonStep3_2.assertCollapsedByDefault(locatorKey)
})

When("I click on {string} Button in Fees Section", (locatorKey) => {
    quotationComparisonStep3_2.buttonClick(locatorKey)
})