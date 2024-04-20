import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { declinedOrderCancelled } from "../../../pages/OrderCancelled/DeclinedOrderCancelled.spec";
import { orderSummary } from "../../../pages/OrderSummary/OrderSummaryStep7.spec";

When("I read data and Locator files for Cancelled Order Flow", () => [
    declinedOrderCancelled.readDataAndLocatorFiles()
]);

When("I select {string} on Configure Quotation page", (locatorKey) => {
    declinedOrderCancelled.buttonClick(locatorKey)
});

When("I input {string} in {string} field on Configure Quotation page", (locatorKey, dataValue) => {
    declinedOrderCancelled.inputSellingAmount(locatorKey, dataValue)
});

When("I click on {string} button on Cancelled Queue on Work Queue Screen", (locatorKey) => {
    declinedOrderCancelled.buttonClick(locatorKey)
});

When("I input {string} in {string} filter on Cancelled Queue", (dataValue,locatorKey) => {
    declinedOrderCancelled.applyFilters(dataValue,locatorKey)
});

When("I double click on cancelled Order ID Row in filter on Cancelled Orders Queue", () => {
    declinedOrderCancelled.doubleClick("cancelledOrderRow")
});

Then("I verify Order ID on Summary Screen of Cancelled Order", () => {
    declinedOrderCancelled.verifyOrderIDOnSummaryScreen()
});

Then("I verify {string} in Order Details on Cancelled Order Screen", (expectedReason) => {
    declinedOrderCancelled.assertCancellationReason(expectedReason)
});

Then("I verify selected Asset's Name on the Header of Cancelled Order Screen", () => {
    declinedOrderCancelled.verifyAssetInfoOnSummaryScreen();
});

Then("I verify {string} in Contract Details over the header on Cancelled Order Screen", (locatorKey) => {
    declinedOrderCancelled.assertFinancialDetails(locatorKey)
});

Then("I verify {string} from {string} in Customer Details section on Cancelled Order Screen", (locatorKey, dataValue) => {
    declinedOrderCancelled.verifyCustomerDetails(locatorKey, dataValue)
});

Then("I verify {string} in Order Details section header on Cancelled Order Screen", (locatorKey) => {
    declinedOrderCancelled.assertElementVisibility(locatorKey)
});

Then("I verify {string} from {string} in Order Details on Cancelled Order Screen", (locatorKey, dataValue) => {
    declinedOrderCancelled.verifyOrderDetails(locatorKey, dataValue)
});

Then("I verify {string} in Insurance Section on Cancelled Order Screen", (elementSelector) => {
    declinedOrderCancelled.verifyInsuranceDetails(elementSelector)
});

Then("I verify Trade-In Asset Name in Trade-In Section on Cancelled Order Screen", () => {
    declinedOrderCancelled.verifyTradeInAssetName()
});

Then("I verify {string} image should be visible on Cancelled Order Screen", (locatorKey) => {
    declinedOrderCancelled.assertElementVisibility(locatorKey)
});

Then("I verify {string} in Payment Break Down Details on Cancelled Order Screen", (locatorKey) => {
    orderSummary.verifyContractDetails(locatorKey)
});