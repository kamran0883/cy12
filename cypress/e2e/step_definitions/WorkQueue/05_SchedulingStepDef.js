import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { scheduling } from "../../../pages/WorkQueue/Scheduling.spec";


When("I read data and locator files for Scheduling", () => {
    scheduling.readLocatorAndDataFile()

})
When("I verify selected Asset's Name on the Header on Scheduling Summary Screen", () => {
    scheduling.verifyAssetInfoOnScheduleScreen()
})

Then("I verify {string} from {string} on Scheduling Screen", (locatorKey, dataValue) => {
    scheduling.verifyOrderDetails(locatorKey, dataValue)
})

Then("I verify {string} is {string} in Customer Details section on Scheduling Screen", (locatorKey, dataValue) => {
    scheduling.verifyCustomerDetails(locatorKey, dataValue)
})

Then("I verify {string} in Insurance Section on Scheduling Screen", (elementSelector) => {
    scheduling.verifyInsuranceDetails(elementSelector)
})

Then("I verify Trade-In Asset Name in Trade-In Section on Scheduling Screen", () => {
    scheduling.verifyTradeInAssetName()
})