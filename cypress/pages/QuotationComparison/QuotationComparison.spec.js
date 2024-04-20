
let locators = {}
let dataFile = {}
let configFile = {}
const locatorFilepath = "cypress/pages/QuotationComparison/QuotationComparison-locators.json";
const orderDataFilePath = "cypress/fixtures/QuotationComparison/QuotationComparison.json";
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";
const assetSelectionData = "cypress/fixtures/AssetSelection/AssetSelection.json"

class QuotationComparison {

    /**
     * this method reads locators file and data file for Quote Comparison
     */
    readData() {
        cy.readFile(locatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(orderDataFilePath).then((obj) => {
            dataFile = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
    }

    /**
     * this method wil wait for quotation calculation calls to complete 
     * when user lands on Create Quotation screen
     */
    waitForQuotationCalls() {
        cy.get(locators.quoteCalculationSuccessToast, { timeout: dataFile.maxWaitTime })
            .should('have.text', dataFile.quoteCalculationSuccessToast)
        cy.get(locators.quoteCalculationInfoToast, { timeout: dataFile.maxWaitTime }).should('not.exist')
    }
    /**
     * this method will assert specified element's header title
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} headerText the title text to be asserted
     */
    assertHeaderTitle(locatorKey, headerText) {
        cy.get(locators[locatorKey], { timeout: dataFile.maxWaitTime }).contains(dataFile[headerText])
    }

    /**
     * this method will assert specified toast' header title
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} headerText the title text to be asserted
     */
    verifyToastMessage(locatorKey, headerText) {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('have.text', dataFile[headerText])
    }

    /**
     * this method will assert if the specified element is visible
     * @param {string} locatorKey key attribute to pass locator
     */
    assertElementVisible(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).should('be.visible')
    }

    /**
     * this method click on specified button
     * @param {string} btnKey key attribute to pass locator
     */
    buttonClickOnQuotationScreen(btnKey) {
        cy.get(locators[btnKey], { timeout: dataFile.midWaitTime }).scrollIntoView().should('be.visible').click()
    }

    /**
     * this method click on specified button
     * @param {string} btnKey key attribute to pass locator
     */
    buttonClickFromOrdersScreen(btnKey) {
        cy.get(locators[btnKey], { timeout: dataFile.midWaitTime }).should('be.visible').click()
    }

    /**
     * this method will verify the filtered orders length in workqueue
     */
    verifyFilteredOrder() {
        cy.get(locators.filteredOrderRowInOrdersQueue, { timeout: dataFile.minWaitTime }).should('have.length', 1)
    }

    /**
     * this method reads Fixture file of Asset Selection Feature 
     * and will assert the Vehicle Name on Vehicle Details Popup
     */
    verifyVehicleMakeModelTrim() {
        cy.readFile(assetSelectionData).then((obj) => {
            cy.get(".vc-type-name p").invoke("text").then((text) => {
                expect(obj.vehicleName.startsWith(text)).to.be.true
            })
            cy.get(".vc-type-name h3").invoke("text").then((text) => {
                expect(obj.vehicleName.endsWith(text)).to.be.true
            })
        })
    }

    /**
     * this method verified if a specified element is selected based on its background color
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value text content of the element to be asserted
     */
    assertSelectedElement(locatorKey, value) {
        cy.get(locators[locatorKey]).find('button', { timeout: dataFile.midWaitTime }).contains(value)
            .should('have.css', 'background-color', dataFile.selectedElementBGColor);
    }

    /**
     * this method asserts pre-selected button matches the expected value
     * @param {string} parent key to pass parent key of child in configFile
     * @param {string} child key attribute to pass element locator and key in configFile
     * @param {string} programIndex key to pass index of child key of parent key in configFile
     */
    assertPreSelectedButton(parent, child, programIndex) {
        const index = parseInt(programIndex);
        let preSelectedValue = "";
        switch (parent) {
            case "dealerProfile":
            case "charts":
                preSelectedValue = configFile[parent][child];
                break;
            case "programs":
                preSelectedValue = configFile.programs[index][child]
                break;
            case "direct":
                preSelectedValue = configFile[child];
        }
        this.assertSelectedElement(child, preSelectedValue.replace("000", "K").replace("0", ""));
    }

    /**
     * this method will assert down payment value in 
     * Select Down Payment input on Quotation Drawer
     */
    assertDownPayemntInDrawer(locatorKey) {
        cy.get(locators[locatorKey]).should('have.value', `${configFile.charts.downPayment}`)
    }

    /**
     * this method will input next value of downPayment on Quotation Drawer
     * @param {string} locatorKey key to pass locator
     */
    editDownPaymentOnDrawer(locatorKey) {
        cy.readFile(orderDataFilePath).then((file) => {
            const path = configFile.charts.downPaymentChart.downPaymentRange
            const value = configFile.charts.downPayment
            const index = path.indexOf(value)
            const nextValue = path[index + 1]
            file["downpayment"] = nextValue
            cy.writeFile(orderDataFilePath, file)
            cy.get(locators[locatorKey]).clear().type(nextValue)
        })
    }

    /**
     * this method will verify updated downPayment value on Quotation Parameters
     * @param {string} locatorKey key to pass locator
     */
    verifyDownPayment(locatorKey) {
        cy.readFile(orderDataFilePath).then((file) => {
            cy.get(locators[locatorKey]).contains(file.downpayment)
        })
    }

    /**
     * this method will click the element containing specified value  
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value text content of the element to be asserted
     */
    selectElementOnDrawer(locatorKey, value) {
        cy.get(locators[locatorKey]).find('button', { timeout: dataFile.midWaitTime }).contains(value).click()
    }

    /**
     * thi method will select the element containing next value from preSelected Value
     * @param {string} child key to pass child attribute for configFile
     * @param {string} parent key to pass parent attribute for configFile
     * @param {string} element key attribute to pass element locator 
     * @param {string} programIndex key to pass index of child attribute within parent attribute
     */
    selectNextValue(child, parent, element, programIndex) {
        const index = parseInt(programIndex);
        let nextValue = ""
        switch (parent) {
            case "dealerProfile":
            case "charts":
                nextValue = configFile[parent][child];
                break;
            case "programs":
                nextValue = configFile.programs[index][child]
                break;
            case "direct":
                nextValue = configFile[child];
        }
        this.selectElementOnDrawer(element, nextValue)
    }

    /**
     * this method verifies updated values on Quotation Parameters
     * @param {string} element key attribute to pass element locator
     * @param {string} child key to pass child attribute for configFile
     * @param {string} parent key to pass parent attribute for configFile
     * @param {string} programIndex key to pass index of child attribute within parent attribute
     */
    verifyUpdatedValues(element, child, parent, programIndex) {
        const index = parseInt(programIndex);
        let nextValue = ""
        switch (parent) {
            case "dealerProfile":
            case "charts":
                nextValue = configFile[parent][child];
                break;
            case "programs":
                nextValue = configFile.programs[index][child]
                break;
            case "direct":
                nextValue = configFile[child];
        }
        cy.get(locators[element]).contains(nextValue.replace("K", ",000"))
    }

    /**
     * this method reads quoteExpiryDate from data file, add quote expiry days to current date
     * and write the new date to data file in specified format
     * @param {string} key key attribute specify object name 
     */
    calcualteQuoteExpiryDate(key) {
        cy.readFile(orderDataFilePath).then((file) => {
            const expiryDays = configFile.dealerProfile.prefrences.quotationExpiryDays
            const currentDate = new Date()
            currentDate.setDate(currentDate.getDate() + expiryDays)
            const month = (currentDate.getMonth() + 1).toString().padStart("2", "0");
            const day = currentDate.getDate().toString().padStart("2", "0");
            const year = currentDate.getFullYear();
            file[key] = month + '/' + day + '/' + year;
            cy.writeFile(orderDataFilePath, file)
        })
    }

    /**
     * this method will get quote expiry date from  data file 
     * and match with Expiry Date displayed at Create Quotation Screen
     */
    assertQuotationExpiryDate() {
        this.calcualteQuoteExpiryDate("quotationExpiryDate")
        cy.readFile(orderDataFilePath).then((res) => {
            cy.get(locators.expiryDateHeader).contains(res.quotationExpiryDate).children().should('have.length', '0')
        })
    }

    /**
     * this method reads Fixture file of Asset Selection Feature 
     * and will assert the Vehicle VinNumber on Vehicle Details Section
     */
    verifyVehicleVinOnVehicleDetails() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then((obj) => {
            cy.get(locators.assetVINonVehicleDetails).should('have.text', obj.vinNumber)
        })
    }

    /**
     * this method will save orderID in data file
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} key key attribute to pass locator
     */
    saveDataInDataFile(locatorKey, key) {
        cy.readFile(orderDataFilePath).then((file) => {
            cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).invoke('text').then((value) => {
                file[key] = value
                cy.writeFile(orderDataFilePath, file)
            })
        })
    }

    /**
     * this method will assert Finance Program Type on Customer Details Screen
     */
    assertSelectedFinanceType() {
        cy.readFile(orderDataFilePath).then((value) => {
            cy.get(locators.selectedFinanceType, { timeout: dataFile.minWaitTime }).contains(value.programName)
        })
    }

    /**
     * this method will input orderID in orderID filter on Orders Screen
     */
    orderIDFilterInput() {
        cy.readFile(orderDataFilePath).then((id) => {
            cy.get(locators.orderIDFilter, { timeout: dataFile.minWaitTime }).clear().type(id.orderID).blur()
        })
    }

    /**
     * this method will click passed option from ellipsis button menu options
     * @param {string} btnKey key attribute to pass locator text
     */
    selectOptionFromEllipsisMenu(btnKey) {
        cy.get(locators.ellipsisMenuOptions).find('li').contains(`${dataFile[btnKey]}`).click()
    }

    /**
     * this method will assert Request Status on WorkQueue
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value value of Request Status on WorkQueue
     */
    assertApplicationStatusOnWorkQueue(locatorKey, value) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[value])
    }

    /**
     * this method will input vinNumber in Vin Search field
     */
    inputVinNumberInVinSearchField() {
        cy.readFile(assetSelectionData).then((vin) => {
            cy.get('.u-table-body tr', { timeout: dataFile.midWaitTime }).should('be.visible')
            cy.intercept({ method: 'GET', url: Cypress.env("INDEX_INVENTORY_FILTER_URL") }).as("filterInventory")
            cy.get(locators.vinSearchField).type(vin.vinNumber).blur()
        })
    }

    /**
     * this method will assert the asset status in specified inventory column
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value value of Request Status on WorkQueue
     */
    assertAssetStatusInInventory(locatorKey, value) {
        cy.get(locators[locatorKey]).should('have.text', dataFile[value])
    }

    /**
     * this method will reload the page if dealer fees id not visible
     */
    verifyDealerOptionIsVisible = () => {
        const dealerOptions = cy.get(locators.financeOptionsValue).should('be.visible')
        if (!dealerOptions) {
            cy.reload()
        }
    }

    /**
     * this method will return order creation date 
     * @returns order creation date, based on day, month and year
     */
    getOrderCreationDate = () => {
        const currentDate = new Date()
        const day = String(currentDate.getDate()).padStart(2, '0')
        const month = String(currentDate.getMonth() + 1).padStart(2, '0')
        const year = currentDate.getFullYear()
        return `${month}/${day}/${year}`
    }

    /**
     * this method will save the order creation date in Data File
     */
    saveOrderCreationDate = () => {
        cy.readFile(orderDataFilePath).then((file) => {
            file["orderCreationDate"] = this.getOrderCreationDate()
            cy.writeFile(orderDataFilePath, file)
        })
    }


} export const quotationComparison = new QuotationComparison()