import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
import { completedandCancelledOrders } from "../../../pages/WorkQueue/CompletedandCancelledOrders.spec"

When("I read data and Locator files for Completed and Cancelled Orders Queue", () => {
    completedandCancelledOrders.readDataAndLocatorFiles()
});

When("I click on {string} of Cancelled Queue from Work Queue Screen", (locatorKey) => {
    completedandCancelledOrders.buttonClick(locatorKey)
});

Then("I verify {string} should be visible for Cancelled Queue on Work Queue Screen", (locatorKey) => {
    completedandCancelledOrders.assertElementVisible(locatorKey)
});

Then("I verify {string} should be visible on Card View in Cancelled Order Queue", (dataValue) => {
    completedandCancelledOrders.verifyFilterResults(dataValue)
});

Then("I verify {string} filter should be visible for List View on Cancelled Order Queue", (locatorKey) => {
    completedandCancelledOrders.assertFiltersVisibility(locatorKey)
});

Then("I verify asset {string} should be {string} in List View on Cancelled Order Queue", (locatorKey, value) => {
    completedandCancelledOrders.verifyAssetInfoInListView(locatorKey, value)
});

Then("I verify {string} in Customer Name Column  in List View on Cancelled Order Queue", (locatorKey) => {
    completedandCancelledOrders.verifyCustomerDetailsInListView(locatorKey)
});

Then("I verify {string} in Finance Type Column  in List View on Cancelled Order Queue", (locatorKey) => {
    completedandCancelledOrders.getFinanceTypeFromDataFile(locatorKey)
});

Then("I verify {string} in Selling Price Column  in List View on Cancelled Order Queue", (locatorKey) => {
    completedandCancelledOrders.getSellingPriceFromDataFile(locatorKey)
});

Then("I verify {string} in List View on Cancelled Order Queue", (locatorKey) => {
    completedandCancelledOrders.verifyOrderCreationDate(locatorKey)
});

When("I input {string} in {string} filter on Cancelled Order Queue", (dataValue,locatorKey) => {
    completedandCancelledOrders.applyFilters(dataValue,locatorKey)
});
