import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { quotationComparison } from "../../../pages/QuotationComparison/QuotationComparison.spec";
import { assetSelection } from "../../../pages/AssetSelection/AssetSelection.spec"
import { login } from "../../../pages/LogIn/login";


When("I read data files for Quotation Comparison", () => {
    quotationComparison.readData()
})

When("I wait for Quotation Calculation calls to complete", () => {
    quotationComparison.waitForQuotationCalls()
})

Then("I verify {string} should be visible on Create Quotation screen", (locatorKey) => {
    quotationComparison.assertElementVisible(locatorKey)
})

Then("I verify filtered orders Length on WorkQueue", () => {
    quotationComparison.verifyFilteredOrder()
})

When("I click on {string} Button on Create Quotation Screen", (btnKey) => {
    quotationComparison.buttonClickOnQuotationScreen(btnKey)
})

Then("I verify {string} should contain {string} on Create Quotation screen", (locatorKey, headerText) => {
    quotationComparison.assertHeaderTitle(locatorKey, headerText)
})

Then("I verify {string} should contain {string} on Vehicle Details Popup", () => {
    quotationComparison.verifyVehicleMakeModelTrim()
})

Then("I verify {string} on Quotation Drawer", (locatorKey) => {
    quotationComparison.assertDownPayemntInDrawer(locatorKey)
})

Then("I verify {string} of {string} at {string} on Quotation Drawer", (child, parent, programIndex) => {
    quotationComparison.assertPreSelectedButton(parent, child, programIndex)
})

When("I select {string} value of {string} of {string} at {string} on Quotation Drawer", (element, parent, child, programIndex) => {
    quotationComparison.selectNextValue(element, parent, child, programIndex)
})

Then("I verify {string} has udpated value of {string} from {string} at {string} on Quotation Parameters", (element, child, parent, programIndex) => {
    quotationComparison.verifyUpdatedValues(element, child, parent, programIndex)
})

Then("I verify downpayment value in {string} on Quotation Parameters", (locatorKey) => {
    quotationComparison.verifyDownPayment(locatorKey)
})

When("I edit {string} on Quotation Drawer", (element) => {
    quotationComparison.selectNextValue(element)
})
When("I edit downpayment of {string} on Quotation Drawer", (locatorKey) => {
    quotationComparison.editDownPaymentOnDrawer(locatorKey)
})

Then("I verify Quotation Validity Date", () => {
    quotationComparison.assertQuotationExpiryDate()
})

Then("I verify 'vinNumber' of Selected Asset on Vehicle Details Section", () => {
    quotationComparison.verifyVehicleVinOnVehicleDetails()
})


When("I save {string} as {string} in data file", (locatorKey, key) => {
    quotationComparison.saveDataInDataFile(locatorKey, key)
})

Then("I verify {string} should contain {string}", (locatorKey, headerText) => {
    quotationComparison.assertHeaderTitle(locatorKey, headerText)
})

Then("I verify {string} toast should have text of {string}", (locatorKey, headerText) => {
    quotationComparison.verifyToastMessage(locatorKey, headerText)
})

Then("I verify selected finance type", () => {
    quotationComparison.assertSelectedFinanceType()
})

When("I click on {string} from Customer Details Screen", (btnKey) => {
    quotationComparison.buttonClickOnQuotationScreen(btnKey)
})

When("I click on {string} from Orders Screen", (btnKey) => {
    quotationComparison.buttonClickFromOrdersScreen(btnKey)
})

When("I enter orderID in {string} on Orders Screen", () => {
    quotationComparison.orderIDFilterInput()
})

When("I click on {string} from Ellipsis button Menu options", (btnKey) => {
    quotationComparison.selectOptionFromEllipsisMenu(btnKey)
})

Then("I verify order {string} should be {string} in Work Queue", (locatorKey, value) => {
    quotationComparison.assertApplicationStatusOnWorkQueue(locatorKey, value)
})

When("I visit Index and input vinNumber in VIN Search Feild", () => {
    assetSelection.visitIndexInventory()
    quotationComparison.inputVinNumberInVinSearchField()
})

Then("I verify {string} should have {string}", (locatorKey, value) => {
    quotationComparison.assertAssetStatusInInventory(locatorKey, value)
})

When("I visit Lane Work Queue Screen", () => {
    login.visitLane()
})

Then("I verify Dealer Options should be visible on Quotation Screen", () => {
    quotationComparison.verifyDealerOptionIsVisible()
})

When("I save Order Creation Date in Quotation Data File", () => {
    quotationComparison.saveOrderCreationDate()
})