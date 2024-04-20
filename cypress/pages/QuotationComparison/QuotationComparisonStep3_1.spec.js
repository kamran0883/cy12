
let locators = {}
let dataFile = {}
let configFile = {}
const step3_1LocatorFilepath = "cypress/pages/QuotationComparison/QuotationComparisonStep3_1-locators.json";
const step3_1DataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparisonStep3_1.json";
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationComparisonStep3_1 {

    /**
     * this method reads locators file and data file for Quote Comparison Step 3.1
     */
    readDatFile() {
        cy.readFile(step3_1LocatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(step3_1DataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => [
            configFile = obj
        ])
    }

    /**
     * this method asserts element's visibility
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).should('be.visible')
    }

    /**
     * this method clicks on specified button
     * @param {string} locatorKey key attribute to pass locator
     */
    buttonClick(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).scrollIntoView().should('be.visible').click()
    }

    /**
     * this method asserts configured range of amount for endOfTermPayment and downpayment
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} startValue first value of configured range
     * @param {string} endValue last value of configured range
     */
    assertConfiguredRangeofValues(locatorKey, startValue, endValue) {
        const firstValue = configFile.charts[startValue].replace(".00", "")
        const lastValue = configFile.charts[endValue].replace(".00", "")
        cy.get(locators[locatorKey]).invoke("text").then((textValue) => {
            expect(textValue.split(" ")[5].replace("%", "")).to.eq(firstValue)
            expect(textValue.split(" ")[7].replace("%", "")).to.eq(lastValue)
        })
    }

    /**
     * this method will assert Names of Finance Programs  fetched
     * @param {string} element key attribute to pass element locator
     * @param {string} parent key to pass parent key in configFile
     * @param {string} programIndex key to pass key index under parent key in configFile
     * @param {string} child key to pass child key in configFile
     */
    assertQuotationParameters(element, parent, programIndex, child) {
        const index = parseInt(programIndex);
        let value = "";
        switch (parent) {
            case "dealerProfile":
            case "charts":
                value = configFile[parent][child];
                break;
            case "programs":
                value = configFile.programs[index][child]
                break;
            case 'manageInventory':
                value = configFile[parent][index][child]
                break;
            case "direct":
                value = configFile[child];
        }
        cy.get(locators[element], { timeout: dataFile.minWaitTime }).contains(value.replace("K", ",000"))
    }

    /**
     * this method asserts preselected value of specified element
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} program key to pass program name
     * @param {string} value key to pass value
     */
    assertPreSelectedValue(locatorKey, program, value) {
        const selectedValue = configFile.assetCatalogue.configuredPrograms[program][value].preSelected
        cy.get(locators[locatorKey], { timeout: dataFile.minWaitTime }).contains(selectedValue)
    }

    /**
     * this method uses getNextValue method and will input this value in specified feild
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value key to pass value
     * @param {string} parent key to pass parent key in configFile
     * @param {string} programIndex key to pass key index under parent key in configFile
     */
    inputNextValue(locatorKey, value, parent, programIndex) {
        cy.readFile(step3_1DataFilePath).then((file) => {
            const index = parseInt(programIndex);
            let nextValue = "";
            switch (parent) {
                case "dealerProfile":
                case "charts":
                    nextValue = configFile[parent][value];
                    break;
                case "programs":
                    nextValue = configFile.programs[index][value]
                    break;
                case "direct":
                    nextValue = configFile[value];
            }
            file["nextValue"] = nextValue
            cy.writeFile(step3_1DataFilePath, file)
            cy.get(locators[locatorKey]).clear().type(nextValue)
        })
    }

    /**
     * this method will assert the new value in quotation parameters
     * @param {string} locatorKey key attribute to pass locator
     */
    assertNewEnteredValue(locatorKey) {
        cy.readFile(step3_1DataFilePath).then((file) => {
            cy.get(locators[locatorKey]).contains(file.nextValue)
        })
    }

    /**
     * this method will assert the default values after the Program name
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} program key to pass program name
     * @param {string} value key to pass value
     */
    assertDefaultValues(locatorKey, program, value) {
        const defaultValue = configFile.assetCatalogue.configuredPrograms[program][value]
        cy.get(locators[locatorKey]).contains(defaultValue)
    }

    /**
     * this method asserts the specified element is ReadOnly
     * @param {string} locatorKey key attribute to pass locator
     */
    assertValueReadOnly(locatorKey) {
        cy.get(locators[locatorKey]).should('not.have.descendants', 'button')
    }

    /**
     * this method asserts the specified element is Editable
     * @param {string} locatorKey key attribute to pass locator
     */
    assertValueEditable(locatorKey) {
        cy.get(locators[locatorKey]).should('have.descendants', 'button')
    }

    /**
     * this method will assert element's text
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value key to pass value
     */
    assertHeader(locatorKey, value) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[value])
    }

    /**
     * this method will assert Optional Add Ons value for specified program
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} program key to pass program name
     * @param {string} value key to pass value
     */
    assertOptionsValue(locatorKey, program, value) {
        const optionsValue = configFile.assetCatalogue.configuredPrograms[program].Options.Optional[value]
        cy.get(locators[locatorKey]).contains(optionsValue)
    }

    /**
     * this method will input specified value in specified feild
     * @param {string} value key to pass value
     * @param {string} locatorKey key to pass locator
     */
    inputValue(value, locatorKey) {
        cy.get(locators[locatorKey]).clear().type(dataFile[value])
    }

    /**
     * this method will assert specified feild contains specified value
     * @param {string} locatorKey key to pass locator
     * @param {string} value key to pass value
     */
    assertUpdatedValue(locatorKey, value) {
        cy.get(locators[locatorKey]).contains(dataFile[value])
    }

    /**
     * this method asserts specified fees value
     * @param {string} locatorKey key to pass locator
     * @param {string} program key to pass program name
     * @param {string} feesName key to pass feesName
     */
    assertFeesValues(locatorKey, program, feesName) {
        const feesValue = configFile.assetCatalogue.configuredPrograms[program].Fees[feesName]
        cy.get(locators[locatorKey]).contains(feesValue)
    }


} export const quotationComparisonStep3_1 = new QuotationComparisonStep3_1()