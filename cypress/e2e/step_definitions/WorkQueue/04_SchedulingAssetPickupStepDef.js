import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { schedulingAssetPickup } from "../../../pages/WorkQueue/SchedulingAssetPickup.spec";


When("I read data and locator files for Scheduling Asset Pickup", () => {
    schedulingAssetPickup.readLocatorAndDataFile()
})

When("I click on {string} for Schedule Asset Pickup", (locatorKey) => {
    schedulingAssetPickup.buttonClick(locatorKey)
})

When("I enter orderID in {string} for Schedule Asset Pickup", () => {
    schedulingAssetPickup.orderIDFilterInput()
})

Then("I verify {string} should be visible for Schedule Asset Pickup", (locatorKey) => {
    schedulingAssetPickup.assertElementVisible(locatorKey)
})

Then("I verify {string} should have {string} for Schedule Asset Pickup", (locatorKey, value) => {
    schedulingAssetPickup.assertElementText(locatorKey, value)
})

When("I double click on {string} fo Schedule Asset Pickup", (locatorKey) => {
    schedulingAssetPickup.doubleClick(locatorKey)
})