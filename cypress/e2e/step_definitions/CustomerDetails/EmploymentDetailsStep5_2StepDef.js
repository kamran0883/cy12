import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { employmentDetails } from "../../../pages/CustomerDetails/EmploymentDetailsStep5_2.spec";

When("I read data and locator files for Employment Details Step 5_2", () => {
    employmentDetails.readDataAndLocatorFiles()
})

When("I click on {string} on Employment Details Screen", (locatorKey) => {
    employmentDetails.buttonClick(locatorKey)
})

Then("I verify {string} should be visible on Employment Details Screen", (locatorKey) => {
    employmentDetails.assertElementVisible(locatorKey)
})

When("I select {string} from {string} dropdown of {string} at index {string} on Employment Details Screen", (listValue, listLocator, parent, index) => {
    employmentDetails.selectFromDropDownList(listValue, listLocator, parent, index)
})

When("I input {string} in {string} at index {string} on Employment Details Screen", (dataValue, locatorKey, index) => {
    employmentDetails.inputEmploymentInfo(dataValue, locatorKey, index)
})

Then("I verify text of {string} at {string} on Employment Details Screen", (locatorAndDataKey, index) => {
    employmentDetails.verifyElementText(locatorAndDataKey, index)
})

Then("I verify duration of employment for Employment Details Screen", () => {
    employmentDetails.verifyEmploymentDuration()
})