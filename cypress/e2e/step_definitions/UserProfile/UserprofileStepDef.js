import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { userProfile } from "../../../pages/UserProfile/UserProfile.spec";

When("I read data and locator files for User Profile", () => {
    userProfile.readLocatorAndDataFile()
})

When("I click on {string} for User Profile", (locatorKey) => {
    userProfile.buttonClick(locatorKey)
})

Then("I verify {string} should have the text {string} for User Profile", (locatorKey, textValue) => {
    userProfile.assrtElementText(locatorKey, textValue)
})

When("I select {string} from Profile Options Dropdown", (optionsValue) => {
    userProfile.selectFromProfileOptions(optionsValue)
})

Then("I verify {string} should be visible on User Profile Screen", (locatorKey) => {
    userProfile.assertElementVisible(locatorKey)
})

When("I input {string} in {string} field on User Pofile Screen", (dataValue, locatorKey) => {
    userProfile.inputIntoInputField(dataValue, locatorKey)
})

When("I generate random user name for User Profile", () => {
    userProfile.writeRandomUserNameIntoDataFile()
})

When("I get user initials and save them into Data File", () => {
    userProfile.getUserInitials()
})

Then("I verify email field is disbaled", () => {
    userProfile.verifyEmailFieldDisabled()
})

When("I generate random {string} for User Profile", (key) => {
    userProfile.generateRandomName(key)
})

Then("I verify {string} has preloaded {string} on User Profile Page", (locatorKey, dataValue) => {
    userProfile.verifyPreloadedUserInfo(locatorKey, dataValue)
})

When("I save random password as {string} in Login Data File", (key) => {
    userProfile.saveRandomPasswordInDataFile(key)
})

When("I input {string} in {string} on Change Your Password Section", (dataValue, locatorKey) => {
    userProfile.updatePassword(dataValue, locatorKey)
})

When("I input different new password in {string} Input Field", (locatorKey) => {
    userProfile.inputDifferentNewPassword(locatorKey)
})