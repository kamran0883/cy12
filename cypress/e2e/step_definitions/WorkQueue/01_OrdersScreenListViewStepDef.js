import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { listView } from "../../../pages/WorkQueue/OrdersScreenListView.spec";
import { declinedOrderCancelled } from "../../../pages/OrderCancelled/DeclinedOrderCancelled.spec";

When("I read data and Locator files for Work Queue Orders Screen List View", () => {
    listView.readLocatorAndDataFile()
})

When("I click on {string} button for List View on Orders Screen", (locatorKey) => {
    listView.buttonClick(locatorKey)
})

When("I double click on filtered Order row in List View on Order Screen", () => {
    declinedOrderCancelled.doubleClick()
})

Then("I verify {string} should {string} visible for List View on Orders Screen", (locatorKey, visiblityKey) => {
    listView.assertElementVisible(locatorKey, visiblityKey)
})

Then("I verify {string} should have {string} for List View on Orders Screen", (locatorKey, dataValue) => {
    listView.assertElementText(locatorKey, dataValue)
})

Then("I verify {string} filter should be visible for List View on Orders Screen", (locatorKey) => {
    listView.assertFiltersVisibility(locatorKey)
})

Then("I verify asset {string} should be {string} in List View on Orders Screen", (locatorKey, value) => {
    listView.verifyAssetInfoInListView(locatorKey, value)
})

Then("I verify {string} in List View on Orders Screen", (locatorKey) => {
    listView.verifyOrderInfoInListView(locatorKey)
})

Then("I verify {string} in Customer Name Column in List View on Orders Screen", (locatorKey) => {
    listView.verifyCustomerDetailsInListView(locatorKey)
})

Then("I verify {string} in Finance Type Column in List View on Orders Screen", (locatorKey) => {
    listView.getFinanceTypeFromDataFile(locatorKey)
})

Then("I verify {string} in Selling Price Column in List View on Orders Screen", (locatorKey) => {
    listView.getSellingPriceFromDataFile(locatorKey)
})

Then("I verify Order Creation Date in List View on Orders Screen", () => {
    listView.verifyOrderCreationDate()
})

Then("I verify {string} button on Ellipsis Menu Options for List View on Orders Screen", (dataValue) => {
    listView.verifyEllipsisMenuOptions(dataValue)
})

When("I select {string} from {string} Options in List View on Orders Screen", (value, locatorKey) => {
    listView.selectFromEllipsisMenuOptions(value, locatorKey)
})

When("I input {string} in Search Area Input Field", (dataValue) => {
    listView.inputIntoSearchArea(dataValue)
})

Then("I verify {string} on card for List View on Orders Screen", (dataValue) => {
    listView.verifyFilterResults(dataValue)
})

When("I input {string} in {string} filter for List View on Orders Screen", (inputValue, locatorKey) => {
    listView.inputIntoFilters(inputValue, locatorKey)
})