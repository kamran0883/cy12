import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
import { cardView } from "../../../pages/WorkQueue/OrdersScreenCardView.spec"

When("I read data and Locator files for Work Queue Orders Screen Card View", () => {
    cardView.readLocatorAndDataFile()
})

When("I click on {string} button for Card View on Orders Screen", (locatorKey) => {
    cardView.buttonClick(locatorKey)
})

Then("I verify {string} should have {string} for Card View on Orders Screen", (locatorKey, dataValue,) => {
    cardView.assertElementText(locatorKey, dataValue)
})

Then("I verify {string} should be visible for Card View on Orders Screen", (locatorKey) => {
    cardView.assertElementVisible(locatorKey)
})

When("I double click on {string} for Card View on Orders Screen", (locatorKey) => {
    cardView.doubleClick(locatorKey)
})

When("I hover over the {string} on Card View on Order Screen", (locatorKey) => {
    cardView.mouseOverEvent(locatorKey)
})

When("I verify ellipsis menu options have the {string} options on Card View on Orders Screen", (dataValue) => {
    cardView.verifyEllipsiMenuOptions(dataValue)
})

When("I select {string} from {string} Options for Card View on Orders Screen", (dataValue, locatorKey) => {
    cardView.selectFromEllipisiMenuOptions(dataValue, locatorKey)
})