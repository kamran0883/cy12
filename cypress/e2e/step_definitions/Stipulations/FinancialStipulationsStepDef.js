import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { financialStipulations } from "../../../pages/Stipulations/FinancialStipulations.spec";

When("I read data and Locator files for Financial Stipulations", () => {
    financialStipulations.readDataAndLocatorFiles()
});

When("I input {string} in {string} field on Configure Quotation page for Conditioned Order", (dataValue, locatorKey) => {
    financialStipulations.inputSellingAmount(locatorKey, dataValue)
});

Then("I verify {string} should have the {string} on Stipulations Screen for Financial Stipulations", (locatorKey, textValue) => {
    financialStipulations.verifyStipulationsContent(locatorKey, textValue)
});

When("I click on {string} on Financial Stipulations in Stipulations Screen", (locatorKey) => {
    financialStipulations.buttonClick(locatorKey)
});

When("I input {string} in {string} field in financial stipulation for Conditioned Order", (locatorKey, dataValue) => {
    financialStipulations.inputSellingAmount(locatorKey, dataValue)
});

Then("I verify {string} should be visible on Financial Stipulations Screen", (locatorKey) => {
    financialStipulations.assertElementVisibility(locatorKey)
});