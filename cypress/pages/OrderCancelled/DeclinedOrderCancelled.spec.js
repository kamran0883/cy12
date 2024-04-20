let locators = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/OrderCancelled/DeclinedOrderCancelled-locators.json"
const dataFilePath = "cypress/fixtures/OrderCancelled/DeclinedOrderCancelled.json";
const quoteComparisonFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json";
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json";
const customerDetailsFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"
const insuranceDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_6.json"
const tradeInDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_4.json"
import { orderSummary } from "../../pages/OrderSummary/OrderSummaryStep7.spec";



class DeclinedOrderCancelled {

    /**
     * this method will read data and locator files for Cancelled Order Flow Steps
     */
    readDataAndLocatorFiles() {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
     * this method will input payment amount in input field
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass data file values
     */
    inputSellingAmount(locatorKey, dataValue) {
        cy.get(locators[locatorKey]).clear().type(dataFile[dataValue])
    }

    /**
     * this method will click on button
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).click()
    }

    /**
     * this method will input data value in filter field
     * @param {string} dataValue key to pass data file values
     * @param {string} locatorKey key to pass locator
     */
    applyFilters(dataValue, locatorKey) {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            cy.get(locators[locatorKey]).clear().type(obj[dataValue]).blur()
        })
    }

    /**
     * this will double click on cancelled order row in search filter
     */
    doubleClick() {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            cy.contains('td', obj.orderID, { timeout: dataFile.minWaitTime }).dblclick();
        })
    }

    /**
     * this method will verify order ID on Cancelled Order Screen
     */
    verifyOrderIDOnSummaryScreen = () => {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            cy.get(locators.orderID).should('include.text', obj.orderID)
        })
    }

    /** 
     * this method will verify the Cancellation Reason on Cancelled Order Screen
     * @param {string} locatorKey key to pass locator
     */
    assertCancellationReason(locatorKey) {
        cy.readFile(dataFilePath).then((obj) => {
            const CancellationReason = {
                'cancellationReason': obj.expectedReason
            }
            cy.get(locators[locatorKey]).should('include.text', CancellationReason[locatorKey])
        })
    }

    /**
     * this method will verify vehicle info on the header of the Cancelled Order Screen
     */
    verifyAssetInfoOnSummaryScreen = () => {
        cy.readFile(assetSelectionDataFilePath).then((obj) => {
            cy.get(locators.assetYearMakeModel).should('be.visible').invoke("text").then((carName) => {
                expect(obj.vehicleName.startsWith(carName), `Assert vehicle Year, Make and Model`).to.be.true
            })
            cy.get(locators.assetTrim).should('be.visible').invoke("text").then((carName) => {
                expect(obj.vehicleName.endsWith(carName), `Assert vehicle Trim`).to.be.true
            })
            cy.get(locators.vinNumber).should('have.text', obj.vinNumber)
        })
    }

    /**
     * this method will verify financial info on the header of the Cancelled Order Screen
     * @param {string} locatorKey key to pass locator of element
     */
    assertFinancialDetails = (locatorKey) => {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            const financialDetailsOnHeader = {
                'netFinancedAmount': obj.leaseProgFinanceAmount,
                'periodicPaymentOnHeader': obj.leaseEstimatedPeriodicPayment
            }
            cy.get(locators[locatorKey]).should('include.text', financialDetailsOnHeader[locatorKey])
        })
    }

    /**
     * this method uses getCustomerFullName and getCustomerFullAddress methods from orderSummary class
     * this method will assert customer details on Cancelled Order Screen
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyCustomerDetails = (locatorKey, dataValue) => {
        const customerName = orderSummary.getCustomerFullName()
        const customerAddress = orderSummary.getCustomerFullAddress()

        switch (locatorKey) {
            case 'customerName':
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('contain.text', customerName);
                break;

            case 'customerAddress':
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(customerAddress);
                break;

            default:
                cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('contain.text', obj[dataValue]);
                break;
        }
    }

    /** 
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisibility(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible');
    }

    /**
     * this  method will assert the Order details in order section on Cancelled Order Screen
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyOrderDetails = (locatorKey, dataValue) => {
        cy.readFile(customerDetailsFilePath).then((obj) => {
            const contractTerms = obj.programType.split(" ")[0]
            const productType = obj.programType.split(" ")[2]

            switch (locatorKey) {
                case 'productType':
                    cy.get(locators[locatorKey]).should('have.text', productType)
                    break;
                case 'contractTerms':
                    cy.get(locators[locatorKey]).should('have.text', contractTerms)
                    break;
                default:
                    cy.get(locators[locatorKey]).should('have.text', file[dataValue])
            }
        })
    }

    /**
     * This method will verify the insurance details on the Cancelled Order Screen
     * @param {string} elementSelector Key to pass locator
     */
    verifyInsuranceDetails = (elementSelector) => {
        cy.readFile(insuranceDataFilePath).then((insuranceData) => {
            const addressLineOne = insuranceData.addressLineOne;
            const city = insuranceData.city;
            const state = insuranceData.stateAlias;
            const zipCode = insuranceData.zipCode;
            const address = `${addressLineOne}, ${city}, ${state}, ${zipCode}`;
            const insuranceProvider = insuranceData.insuranceProviderName;
            const insuranceContact = insuranceData.insuranceContact;
            const policyNumber = insuranceData.policyNumber;

            switch (elementSelector) {
                case 'insuranceProvider':
                    cy.get(locators[elementSelector]).should('have.text', insuranceProvider);
                    break;
                case 'insuranceContact':
                    cy.get(locators[elementSelector]).should('have.text', `1${insuranceContact}`);
                    break;
                case 'policyNumber':
                    cy.get(locators[elementSelector]).should('have.text', policyNumber);
                    break;
                case 'insuranceAddress':
                    cy.get(locators[elementSelector]).should('have.text', address);
                    break;
            }
        });
    };

    /**
     * This method will verify Trade-In Asset Year, Make, Model and Trim
     */
    verifyTradeInAssetName = () => {
        cy.readFile(tradeInDataFilePath).then((tradeInData) => {
            const trim = tradeInData.tradeInTrim;
            const year = tradeInData.tradeInYear;
            const make = tradeInData.tradeInMake;
            const model = tradeInData.tradeInModel;
            const assetYearMakeModel = `${year} ${make} ${model}`;
            cy.get(locators.tradeInAssetYearMakeModel).invoke("text").then((obj) => {
                expect(obj).to.equal(assetYearMakeModel, `Assert Trade-In Asset Year Make Model`);
            });

            // Assert Trade-In Asset Trim
            cy.get(locators.tradeInTrim).invoke("text").then((assetTrim) => {
                expect(assetTrim).to.equal(trim, `Assert Trade-In Asset Trim`);
            });
        });
    };


} export const declinedOrderCancelled = new DeclinedOrderCancelled()
