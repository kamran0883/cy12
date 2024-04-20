import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { paymentIndicator } from "../../../pages/OrderSummary/PaymentIndicatorAndDocuments.spec";

When("I read data and locator files for Payment Indicator and Contracting Documents", () => {
    paymentIndicator.readLocatorsAndDataFiles()
})

Then("I verify {string} should be visible for Contracting Documents and Payment Indicator", (locatorKey) => {
    paymentIndicator.assertElementVisibility(locatorKey)
})

Then("I verify payment Checkbox should {string} checked", (checkFlag) => {
    paymentIndicator.verifyPaymentCheckBoxUnchecked(checkFlag)
})

When("I click on {string} on Contracting Documents and Payment Indicator Screen", (locatorKey) => {
    paymentIndicator.buttonClick(locatorKey)
})

Then("I verify {string} should be {string} on Contracting Documents and Payment Indicator Screen", (locatorKey, keyFlag) => {
    paymentIndicator.assertElementEnabled(locatorKey, keyFlag)
})

Then("I verify signature are placed on the Documents", () => {
    paymentIndicator.verifySignatureMark()
})