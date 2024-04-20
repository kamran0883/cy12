import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { pickupDelivery } from "../../../pages/WorkQueue/SchedulePickupDelivery.spec";

When("I read data and locator files for Schedule Pickup Pickup and Delivery", () => {
    pickupDelivery.readLocatorAndDataFile()
})
When("I click on {string} for Schedule and Pickup Delivery Queue", (locatorKey) => {
    pickupDelivery.buttonClick(locatorKey)
})

When("I double click on {string} on Schedule Pickup Delivery Queue", (locatorKey) => {
    pickupDelivery.doubleClick(locatorKey)
})

Then("I verify {string} should be visible on Schedule Pickup Delivery Queue", (locatorKey) => {
    pickupDelivery.assertElementVisible(locatorKey)
})

Then("I verify {string} on Card View in Schedule Pickup Delivery Queue", (dataValue, locatorKey) => {
    pickupDelivery.verifyOrderInfoOnCard(dataValue, locatorKey)
})

Then("I verify {string} should be visible on List View in Schedule Pickup Delivery Queue", (locatorKey) => {
    pickupDelivery.assertFilterVisibility(locatorKey)
})

When("I input {string} in {string} on  Schedule Pickup Delivery Queue", (dataValue, locatorKey) => {
    pickupDelivery.inputIntoFilters(dataValue, locatorKey)
})

When("I input Pickup Delivery date and time in {string} on Schedule Pickup Delivery Queue", (locatorKey) => {
    pickupDelivery.pickupDeliveryDateInput(locatorKey)
})
