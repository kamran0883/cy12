import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { licenseDetails } from "../../../pages/CustomerDetails/LicenseDetailsStep5_1.spec";


When("I read data and Locator files for License Details Step 5.1", () => [
    licenseDetails.readData()
])

When("I click on {string} Button on license Details Page", (btnKey) => {
    licenseDetails.buttonClick(btnKey)
})

Then("I verify {string} is visible on License Details page", (locatorKey) => {
    licenseDetails.assertElementVisible(locatorKey)
})

When("I input {string} in {string} feild on License Details Page", (dataValue, locatorKey) => {
    licenseDetails.inputLicenseDetails(dataValue, locatorKey)
})

When("I upload {string} image on {string} on License Details Page", (imageFilePath, locatorKey) => {
    licenseDetails.uploadLicenseImage(imageFilePath, locatorKey)
})

Then("I verify license-verification API response", () => {
    licenseDetails.assertLicenseInformation()
})

Then("I verify {string} should have the value of {string} on License Details Page", (locatorKey, valueKey) => {
    licenseDetails.verifyLicenseInfo(locatorKey, valueKey)
})

When("I select {string} from {string} dropdown list of {string} on License Details Screen", (listValue, listLocator, parent) => {
    licenseDetails.selectFromDropDownList(listValue, listLocator, parent)
})

Then("I verify Date of Birth should not be greater than the current Date", () => {
    licenseDetails.dateOfBirthAndCurrentDateComparison()
})

When("I get the list of available states from License Issue List Dropdown", () => {
    licenseDetails.getLicenseIssueStateList()
})

Then("I verify License Expiry Date is always greater than Current Date", () => {
    licenseDetails.licenceExpiryDateAndCurrentDateComparison()
})