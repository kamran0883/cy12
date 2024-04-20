import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { stipulationsHandling } from "../../../pages/Stipulations/StipulationsOnReceiving.spec";

When("I read data and Locator files for Stipulations Handling on Receiving", () => {
    stipulationsHandling.readLocatorAndDataFile()
})

Then("I verify {string} should be visible on Stipulations Screen", (locatorKey) => {
    stipulationsHandling.assertElementVisible(locatorKey)
})

Then("I verify {string} should have the {string} on Stipulations Screen", (locatorKey, textValue) => {
    stipulationsHandling.verifyStipulationsContent(locatorKey, textValue)
})

When("I click on {string} on Stipulations Screen", (buttonClick) => {
    stipulationsHandling.buttonClick(buttonClick)
})

When("I upload Insurance Proof of Insurance Doc on Stipulations Screen", () => {
    stipulationsHandling.uploadInsuranceDoc()
})
