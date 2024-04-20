import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
import { assetDelivery } from "../../../pages/WorkQueue/SchedulingAssetDelivery.spec"

When("I read data and locator files for Scheduling Asset Delivery", () => {
    assetDelivery.readLocatorAndDataFile()
})

When("I click on {string} for Scheduling Asset Delivery", (locatorKey) => {
    assetDelivery.buttonClick(locatorKey)
})

Then("I verify {string} on card for Scheduling Asset Delivery", (locatorKey) => {
    assetDelivery.verifyOrderDetailsOnCard(locatorKey)
})

Then("I verify {string} in Customer Address on Scheduling Asset Delivery Screen", (locatorKey) => {
    assetDelivery.verifyUserAddress(locatorKey)
})

When("I input {string} into {string} field on Scheduling Asset Delivery Screen", (dataValue, locatorKey) => {
    assetDelivery.inputIntoAddressFields(dataValue, locatorKey)
})

When("I hover over the {string} on Scheduling Asset Delivery Screen", (locatorKey) => {
    assetDelivery.performRealHoverEvent(locatorKey)
})

Then("I verify {string} should be visible for Asset Delivery Screen", (locatorKey) => {
    assetDelivery.assertElementText(locatorKey)
})

Then("I verify {string} should not be visible on Asset Delivery Screen", (locatorKey) => {
    assetDelivery.assertElementNotVisible(locatorKey)
})