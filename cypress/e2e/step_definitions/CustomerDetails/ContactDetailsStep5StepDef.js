import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { customerDetails } from "../../../pages/CustomerDetails/CustomerDetailsStep5.spec";

When("I read data and locator files for Customer Contact Details Step 5", () => {
    customerDetails.readDataAndLocatorFiles()
})

Then("I verify {string} should be visible on Contact Details Screen", (locatorKey) => {
    customerDetails.assertElementVisible(locatorKey)
})

Then("I verify {string} of {string} contains the text of {string}", (sibling, parent, dataValue) => {
    customerDetails.assertOptionalFeilds(sibling, parent, dataValue)
})

Then("I verify {string} should be disabled on Contact Details Screen", (locatorKey) => {
    customerDetails.verifyDisabledElements(locatorKey)
})

Then("I verify {string} should have the value of customer Email Address", (locatorKey) => {
    customerDetails.verifyContactEmailAddress(locatorKey)
})

When("I input {string} in {string} feild on Customer Details Screen", (dataValue, locatorKey) => {
    customerDetails.inputCustomerDetails(dataValue, locatorKey)
})

When("I select {string} from {string} dropdown list of {string} on Customer Details Screen", (listValue, listLocator, parent) => {
    customerDetails.selectFromDropDownList(listValue, listLocator, parent)
})

When("I click on {string} on Customer Details Screen", (locatorKey) => {
    customerDetails.buttonClick(locatorKey)
})

Then("I verify text content of {string} on Customer Details Screen", (locatorAndDataKey) => {
    customerDetails.verifyElementText(locatorAndDataKey)
})

When("I select Garaging Address same as Mailing Address Checkbox", () => {
    customerDetails.checkGaragingAddressCheckbox()
})

Then("I verify {string} contains value of {string} on Customer Details Screen", (locatorKey, dataValue) => {
    customerDetails.verifyPrepopulatedContactInfo(locatorKey, dataValue)
})

When("I generate new Social Security Number", () => {
    customerDetails.generateRandomSSN()
})

Then("I verify Application Expiry Date on {string} Screen", () => {
    customerDetails.verifyApplicationExpiryDate()
})

When("I get the program type and save it in Data File", () => {
    customerDetails.getProgramType()
})

Then("I verify duration of stay for Contact Details Screen", () => {
    customerDetails.verifyDurationOfStay()
})