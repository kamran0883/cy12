let locators = {}
let customerDetailsData = {}
let customerCheckData = {}
let insuranceData = {}
let tradeInData = {}
let quotationData = {}
let assetYearMakeModel = ''
const locatorsFilePath = "cypress/pages/OrderSummary/OrderSummaryStep7-locators.json";
const assetSelectionDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json";
const quoteComparisonFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json"
const customerDetailsFilePath = "cypress/fixtures/CustomerDetails/CustomerDetailsStep5.json"
const customerCheckFilePath = "cypress/fixtures/CustomerCheck/CustomerCheck.json"
const insuranceDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_6.json"
const tradeInDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_4.json"

class OrderSummary {

    /**
     * this method reads data and locator files for Order Summary Screen
     */
    readLocatorsAndDataFiles = () => {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(customerDetailsFilePath).then((customerData) => {
            customerDetailsData = customerData
        })
        cy.readFile(customerCheckFilePath).then((obj) => {
            customerCheckData = obj
        })
        cy.readFile(insuranceDataFilePath).then((obj) => {
            insuranceData = obj
        })
        cy.readFile(tradeInDataFilePath).then((obj) => {
            tradeInData = obj
        })
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            quotationData = obj
        })

    }

    /**
     * this method will assert the element's visibility
     * @param {string} locatorKey key to pass locator 
     */
    assertElementVisibility = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('be.visible')
    }

    /**
     * this method will click on the specified element
     */
    buttonClick = (locatorKey) => {
        cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).click()
    }

    /**
     * this method will assert header info at the header of the screen
     */
    verifyAssetInfoOnSummaryScreen = () => {
        cy.readFile(assetSelectionDataFilePath).then((obj) => {
            const assetName = obj.vehicleName.split(" ")
            const assetYearMakeModel = assetName.slice(0, 3).join(" ")
            const assetTrim = assetName.slice(3, 4).join(" ")
            cy.get(locators.assetYearMakeModel, { timeout: quotationData.minWaitTime }).should('have.text', assetYearMakeModel)
            cy.get(locators.assetTrim, { timeout: quotationData.minWaitTime }).should('have.text', assetTrim)
            cy.get(locators.vinNumber, { timeout: quotationData.minWaitTime }).should('have.text', obj.vinNumber)
        })
    }

    /**
     * this method will verify order ID on Summary Screen
     */
    verifyOrderIDOnSummaryScreen = () => {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            cy.get(locators.orderID, { timeout: quotationData.minWaitTime }).should('include.text', obj.orderID)
        })
    }

    /**
     * this method will verify financial info on the summary screen
     * @param {string} element key to pass locator of element 
     * @param {string} parent key to pass parent object for config file 
     * @param {string} child key to pass child element for config file
     * @param {int} programIndex key to  pass index of child in cofig file
     */
    assertFinancialDetails = (locatorKey) => {
        cy.readFile(quoteComparisonFilePath).then((obj) => {
            const financialDetailsOnHeader = {
                'netFinancedAmount': obj.leaseProgFinanceAmount,
                'periodicPaymentOnHeader': obj.leaseEstimatedPeriodicPayment
            }
            cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('include.text', financialDetailsOnHeader[locatorKey])
        })
    }

    /**
     * Generates the full name of the customer based on the first name and last name
     * @returns {string} the full name of the customer
     */
    getCustomerFullName = () => {
        const firstName = customerDetailsData.firstName;
        const lastName = customerDetailsData.lastName;
        return `${firstName} ${lastName}`;
    };

    /**
     * return address of the customer based on the addressLineOne, mailingAddressCity,
     * mailingAddressState and mailingAddressZipCode
     * @returns {string} full address of customer
     */
    getCustomerFullAddress = () => {
        const addressLineOne = customerDetailsData.mailingAddressLineOne;
        const addressCity = customerDetailsData.mailingAddressCity;
        const addressState = customerDetailsData.mailingAddressState;
        const addressCode = customerDetailsData.mailingAddressZipCode;
        return `${addressLineOne} ${addressCity}, ${addressState} ${addressCode}`;
    };

    /**
     * this method will assert customer details on Summary Screen
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
    */
    verifyCustomerDetails = (locatorKey, dataValue) => {
        let customerEmail = ''
        const customerName = this.getCustomerFullName()
        const customerAddress = this.getCustomerFullAddress()

        switch (locatorKey) {
            case 'customerName':
                cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('contain.text', customerName);
                break;

            case 'customerAddress':
                cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).contains(customerAddress);
                break;

            case 'customerEmail':
                cy.readFile(customerCheckFilePath).then((obj) => {
                    customerEmail = obj.newCustomerEmail
                    cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('contain.text', customerEmail);
                })
                break;

            default:
                cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('contain.text', obj[dataValue]);
                break;
        }
    }

    /**
     * this  method will assert the financial details over the header
     * @param {string} locatorKey key to pass locator
     * @param {string} dataValue key to pass value to be asserted
     */
    verifyFinancialDetails = (locatorKey, dataValue) => {
        cy.readFile(customerDetailsFilePath).then((file) => {
            const programTypeHeader = file.programType.replace(/(\d+)\s/, '$1-')
            const contractTerms = file.programType.split(" ")[0]
            const productType = file.programType.split(" ")[2]

            switch (locatorKey) {
                case 'programTypeHeader':
                    cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('have.text', programTypeHeader)
                    break;
                case 'productType':
                    cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('have.text', productType)
                    break;
                case 'contractTerms':
                    cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('have.text', contractTerms)
                    break;
                default:
                    cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('have.text', file[dataValue])
            }
        })
    }

    /**
     * returns full address of Insurance Provider based on addressLineOne, city, zipCode
     * @returns full address of Insurance Provider
     */
    getInsuranceAddress = () => {
        const addressLineOne = insuranceData.addressLineOne
        const city = insuranceData.city
        const state = insuranceData.state
        const zipCode = insuranceData.zipCode
        return `${addressLineOne}, ${city}, ${state}, ${zipCode}`
    }

    /**
     * this method will verify the insurance details on Summary Screen
     * @param {string} elementSelector key to pass locator
     */
    verifyInsuranceDetails = (elementSelector) => {
        const address = this.getInsuranceAddress()
        const insuranceProvider = insuranceData.insuranceProviderName
        const insuranceContact = insuranceData.insuranceContact
        const policyNumber = insuranceData.policyNumber

        switch (elementSelector) {
            case 'insuranceProvider':
                cy.get(locators[elementSelector], { timeout: quotationData.minWaitTime }).should('have.text', insuranceProvider)
                break;
            case 'insuranceContact':
                cy.get(locators[elementSelector], { timeout: quotationData.minWaitTime }).should('have.text', `1${insuranceContact}`)
                break;
            case 'policyNumber':
                cy.get(locators[elementSelector], { timeout: quotationData.minWaitTime }).should('have.text', policyNumber)
                break;
            case 'insuranceAddress':
                cy.get(locators[elementSelector], { timeout: quotationData.minWaitTime }).contains(address)
                break;
        }
    }

    /**
     * return Trade-In Asset Year Make Model
     * @returns trade-in asset Year Make Model
     */
    getTradeInYearMakeModel = () => {
        const year = tradeInData.tradeInYear
        const make = tradeInData.tradeInMake
        const model = tradeInData.tradeInModel
        return assetYearMakeModel = `${year} ${make} ${model}`
    }

    /**
     * this method will verify Trade-In Asset Year, Make, Model and Trim
     */
    verifyTradeInAssetName = () => {
        const trim = tradeInData.tradeInTrim
        this.getTradeInYearMakeModel()
        cy.get("main.MuiBox-root > div > .MuiGrid-grid-md-8 > :nth-child(5) .container > :nth-child(1) > h3").invoke("text").then(
            (tradeInYearMakeModel) => {
                expect(assetYearMakeModel.startsWith(tradeInYearMakeModel), `Assert Trade-In Asset Year Make Model`).to.be.true
            })
        cy.get("main.MuiBox-root > div > .MuiGrid-grid-md-8 > :nth-child(5) .container > :nth-child(1) > .card-title").invoke("text").then(
            (assetTrim) => {
                expect(assetTrim.endsWith(trim), `Assert Trade-In Asset Trim`).to.be.true
            })
    }

    /**
     * this method will verify trade in details in TradeIn Section on Summary Screen
     * @param {string} locatorKey key to pass locator
     */
    verifyTradeInDetails = (locatorKey) => {
        const tradeInDetails = {
            'tradeInOffer': tradeInData.tradeInAmount,
            'tradeInMileage': tradeInData.tradeInCurrentMileage.toLocaleString(),
            'tradeInCondition': tradeInData.tradeInCondition,
        }
        cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('include.text', tradeInDetails[locatorKey])
    }

    /**
     * this method asserts contract information on Summary Screen
     * @param {string} locatorKey key to pass locator 
     */
    verifyContractDetails = (locatorKey) => {
        cy.readFile(quoteComparisonFilePath).then((quoteData) => {
            const contractData = {
                'periodicPayment': quoteData.leaseEstimatedPeriodicPayment,
                'annualMileage': quoteData.leaseAnnualMileage,
                'sellingPrice': quoteData.leaseSellingPrice,
                'downPayment': quoteData.leaseDownpaymentValue.split(" ")[1],
                'optionsValue': quoteData.leaseOptionsValue,
                'feesValue': quoteData.totalFeesInLease,
                'financedAmount': quoteData.leaseProgFinanceAmount
            }
            cy.get(locators[locatorKey], { timeout: quotationData.minWaitTime }).should('include.text', contractData[locatorKey])
        })
    }

} export const orderSummary = new OrderSummary()