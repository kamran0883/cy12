const { Given, When, Then, } = require("@badeball/cypress-cucumber-preprocessor");
import CustomerCheck from "../../../pages/CustomerCheck/CustomerCheck.spec"

const customerCheck = new CustomerCheck()

Then("I read data file for Create Order on Lane", () => {
    customerCheck.readDataFile()
})

When("I enter a {string} email address", (emailFlag) => {
    customerCheck.customerInfo(emailFlag)
})

Then("I verify Consent Checkbox should {string} auto-checked", (checkFlag) => {
    customerCheck.checkCustomerStatus(checkFlag)
})

Given("I click on {string} button", () => {
    customerCheck.validateOrderButton()
})
