let locators = {}
let dataFile = {}
let insuranceData = {}
let tradeInData = {}
const locatorsFilePath = "cypress/pages/WorkQueue/Scheduling-locators.json"
const dataFilePath = "cypress/fixtures/WorkQueue/Scheduling.json"
const quotationDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json"
const customerDataFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"
const customerCheckDataFilePath = "cypress/fixtures/CustomerCheck/CustomerCheck.json"
const insuranceDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_6.json"
const tradeInDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_4.json"
import { orderSummary } from "../OrderSummary/OrderSummaryStep7.spec"


class Scheduling {
    /**
     * this method reads Data and Locator files for User Profile
     */
    readLocatorAndDataFile = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(insuranceDataFilePath).then((obj) => {
            insuranceData = obj
        })
        cy.readFile(tradeInDataFilePath).then((obj) => {
            tradeInData = obj
        })
    }

    /**
    * this method will assert header info at the header of the screen
    */
    verifyAssetInfoOnScheduleScreen = () => {
        cy.readFile(assetSelectionDataFilePath).then((obj) => {
            const assetName = obj.vehicleName.split(" ")
            const assetYearMakeModel = assetName.slice(0, 3).join(" ")
            const assetTrim = assetName.slice(3, 4).join(" ")
            cy.get(locators.assetYearMakeModel).should('include.text', assetYearMakeModel)
            cy.get(locators.assetName).contains(assetTrim)
        })
    }


    /**
     * this  method will assert the financial details over the header
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyOrderDetails = (locatorKey, dataValue) => {
        cy.readFile(customerDataFilePath).then((file) => {
            const contractTerms = file.programType.split(" ")[0]
            const productType = file.programType.split(" ")[2]

            switch (locatorKey) {
                case 'productType':
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('have.text', productType)
                    break;
                case 'contractTerms':
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('have.text', contractTerms)
                    break;
                default:
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('have.text', file[dataValue])
            }
        })
    }

    /**
    * this method will assert customer details on Summary Screen
    * @param {string} locatorKey key to pass locator
    * @param {string} dataValue key to pass value to be asserted
   */
    verifyCustomerDetails = (locatorKey, dataValue) => {
        let customerEmail = ''
        const customerName = orderSummary.getCustomerFullName()
        const customerAddress = orderSummary.getCustomerFullAddress()

        switch (locatorKey) {
            case 'customerName':
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('contain.text', customerName);
                break;

            case 'customerAddress':
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(customerAddress);
                break;

            case 'customerEmail':
                cy.readFile(customerCheckDataFilePath).then((file) => {
                    customerEmail = file.newCustomerEmail
                    cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('contain.text', customerEmail);
                })
                break;

            default:
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('contain.text', obj[dataValue]);
                break;
        }
    }

    /**
     * this method will verify the insurance details on Summary Screen
     * @param {string} elementSelector key to pass locator
     */
    verifyInsuranceDetails = (elementSelector) => {
        const address = orderSummary.getInsuranceAddress()
        const insuranceProvider = insuranceData.insuranceProviderName
        const insuranceContact = insuranceData.insuranceContact
        const policyNumber = insuranceData.policyNumber

        switch (elementSelector) {
            case 'insuranceProvider':
                cy.get(locators[elementSelector], { timeout: dataFile.minWaitTime }).should('have.text', insuranceProvider)
                break;
            case 'insuranceContact':
                cy.get(locators[elementSelector], { timeout: dataFile.minWaitTime }).should('have.text', `1${insuranceContact}`)
                break;
            case 'policyNumber':
                cy.get(locators[elementSelector], { timeout: dataFile.minWaitTime }).should('have.text', policyNumber)
                break;
            case 'insuranceAddress':
                cy.get(locators[elementSelector], { timeout: dataFile.minWaitTime }).contains(address)
                break;
        }
    }

    /**
    * this method will verify Trade-In Asset Year, Make, Model and Trim
    */
    verifyTradeInAssetName = () => {
        const trim = tradeInData.tradeInTrim
        const assetYearMakeModel = orderSummary.getTradeInYearMakeModel()
        cy.get(".container > .MuiGrid-grid-sm-12 > :nth-child(6) > .container > div > .label").invoke("text").then(
            (tradeInYearMakeModel) => {
                expect(assetYearMakeModel.startsWith(tradeInYearMakeModel), `Assert Trade-In Asset Year Make Model`).to.be.true
            })
        cy.get(".container > .MuiGrid-grid-sm-12 > :nth-child(6) > .container > div > .card-title").invoke("text").then(
            (assetTrim) => {
                expect(assetTrim.endsWith(trim), `Assert Trade-In Asset Trim`).to.be.true
            })
    }

} export const scheduling = new Scheduling()