import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { orderSummary } from "../../../pages/OrderSummary/OrderSummaryStep7.spec";

When("I read data and Locator files for Order Summary Step 7", () => {
    orderSummary.readLocatorsAndDataFiles()
})
Then("I verify {string} should be visible on Order Summary Screen", (locatorKey) => {
    orderSummary.assertElementVisibility(locatorKey)
})

When("I click on {string} on Order Summary Screen", (locatorKey) => {
    orderSummary.buttonClick(locatorKey)
})

Then("I verify selected Asset's Name on the Header", (locatorKey) => {
    orderSummary.verifyAssetInfoOnSummaryScreen(locatorKey)
})

Then("I verify Order ID on Summary Screen", () => {
    orderSummary.verifyOrderIDOnSummaryScreen()
})

When("I verify {string} in Contract Details over the header on Order Summary Screen", (locatorKey) => {
    orderSummary.assertFinancialDetails(locatorKey)
})

Then("I verify {string} is {string} in Customer Details section on Order Summary Screen", (locatorKey, dataValue) => {
    orderSummary.verifyCustomerDetails(locatorKey, dataValue)
})

Then("I verify {string} from {string} on Order Summary Screen", (locatorKey, dataValue) => {
    orderSummary.verifyFinancialDetails(locatorKey, dataValue)
})

Then("I verify {string} in Insurance Section on Order Summary Screen", (elementSelector) => {
    orderSummary.verifyInsuranceDetails(elementSelector)
})

Then("I verify Trade-In Asset Name in Trade-In Section on Order Summary Screen", () => {
    orderSummary.verifyTradeInAssetName()
})

Then("I verify {string} in TradeIn Details section on Order Summary Screen", (locatorKey) => {
    orderSummary.verifyTradeInDetails(locatorKey)
})

Then("I verify {string} in Contract Details on Order Summary Screen", (locatorKey) => {
    orderSummary.verifyContractDetails(locatorKey)
})