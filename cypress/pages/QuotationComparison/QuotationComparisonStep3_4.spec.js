
let locators = {}
let dataFile = {}
let configFile = {}
const step3_4LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_4-locators.json";
const step3_4DataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_4.json";
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_4 {

    /**
     * this method reads data files for Quotation Comparison Step3.4 Trade-in Details
     */
    readData() {
        cy.readFile(step3_4LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(step3_4DataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
     * this method will assert element text
     * @param {string} locatorKey key to pass locator
     * @param {string} textValue text value of element to assert
     */
    assertHeaderTitle(locatorKey, textValue) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[textValue])
    }

    /**
     * this method will click on the specifed element
     * @param {string} locatorKey key to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey]).click()
    }

    /**
     * this method will assert element visibility
     * @param {string} locatorKey key to pass locator
     */
    assertElementVisible(locatorKey) {
        if (locatorKey == 'fileUploadArea' || 'continueBtn') {
            cy.get(locators[locatorKey]).scrollIntoView().should('be.visible')

        }
        else
            cy.get(locators[locatorKey]).should('be.visible')
    }

    /**
     * this method will input provided value in the specified input field
     * @param {string} locatorKey key to pass locator
     * @param {string} inputValue value to be input in input field
     */
    inputTradeInDetails(inputValue, locatorKey) {
        cy.get(locators[locatorKey]).clear().type(dataFile[inputValue])
    }

    /**
     * this method will select specified assetConidtion list item from AssetCondition Dropdown
     * @param {string} locatorKey key to pass locator
     * @param {string} conditionValue key to select assetCondition from dwopdown list
     */
    selectTradeInAssetCondition(locatorKey, conditionValue) {
        cy.get(locators[locatorKey]).click()
        cy.get(`[data-value='${dataFile[conditionValue]}']`).click()
    }

    /**
     * this method will check specified value of specified locator
     * @param {string} locatorKey key to pass locator
     * @param {boolean} checkBoxValue key to check value from checkbox 
     */
    selectFromCheckBoxOnTradeInPopup(locatorKey, checkBoxValue) {
        cy.get(`${locators[locatorKey]} [value='${dataFile[checkBoxValue]}']`).check()
    }

    /**
     * this method will upload Trade-in Asset image
     */
    uploadTradeInAssetImage() {
        cy.get("[for='file-upload']").selectFile(dataFile.tradeInAssetImage)
    }

    /**
     * this method will assert trade-in asset image on Quotation Drawer
     * @param {string} locatorKey key to pass locator
     */
    assertAssetNameOnDrawer(locatorKey) {
        const assetName = dataFile.tradeInMake + " " + dataFile.tradeInModel + " " + dataFile.tradeInYear + " "
        cy.get(locators[locatorKey]).should('have.text', assetName)
    }

    /**
     * this method will assert the financed Amount when trade-in is added to quotation
     * @param {string} locatorKey key to pass locator
     * @param {string} keyFlag key to validate Inequity or Equity
     */
    assertUpdatedFinancedAmount(keyFlag, locatorKey) {
        let updatedFinanceAmount
        let formattedAmount
        const financedAmount = configFile.programs[0].financedAmount.replace(",", "")
        const tradeInAmount = dataFile.tradeInAmount
        const payOffAmount = dataFile.tradeInInEquity

        if (keyFlag == 'leaseBalance') {
            updatedFinanceAmount = financedAmount - tradeInAmount
        }
        else if (keyFlag == 'payOffBalance') {
            updatedFinanceAmount = financedAmount - payOffAmount
        }
        formattedAmount = updatedFinanceAmount.toLocaleString("en-US", {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2,
        })
        cy.get(locators[locatorKey]).should('have.text', `$${formattedAmount}`)
    }

    /**
     * this method will verify trade-In amount on Quotation Parameters
     * @param {string} keyFlag key to validate Inequity or Equity
     * @param {string} locatorKey key to pass locator
     */
    verifyTradeInAmount(keyFlag, locatorKey) {
        let amount
        if (keyFlag == 'leaseBalance') {
            amount = dataFile.tradeInAmount
        }
        else if (keyFlag == 'payOffBalance') {
            amount = dataFile.tradeInInEquity
        }
        cy.get(locators[locatorKey]).should("have.text", `$${amount}`)
    }

} export const quotationComparisonStep3_4 = new QuotationComparisonStep3_4()