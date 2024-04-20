let locators = {}
let dataFile = {}
let vinNumbers = []
let sellingPrice = []
let priceOnCard = []
let assetCondition
const locatorFilepath = "cypress/pages/AssetSelection/AssetSelection-locators.json";
const orderDataFilePath = "cypress/fixtures/AssetSelection/AssetSelection.json"

import 'cypress-real-events'
class AssetSelection {

    /*
    * this method reads locators file and data file for create Order journey
    */
    readDataFile() {
        cy.readFile(locatorFilepath).then((obj) => {
            locators = obj
        })
        cy.readFile(orderDataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
    * this method will check consent checkbox
    */
    checkConsentBox() {
        cy.get(locators.consentCheckBox).check()
    }

    /*
    * this method will click Save & Initiate Order Button 
    */
    initiateOrderButton() {
        cy.get(locators.initiateOrderBtn).click()
    }

    /**
     * this method will verify Choose Asset Screen headers
     * @param {string} key key attribute to pass locators from locators file
     * @param {string} dataKey the data value to be input in the input field
     */
    validateHeaders(key, dataKey) {
        cy.get(locators[key], { timeout: dataFile.minWaitTime }).should('have.text', dataFile[dataKey])
    }

    /*
    * this method will validate listed assets 
    * on Choose Asset Screen on Lane
    */
    checkListedAssets() {
        cy.get(locators.vinFilterHeader).should('contain', `${dataFile.vinHeaderTitle}`)
        cy.readFile(orderDataFilePath).then(file => {
            let vinData = file.availableVinNumbers
            for (let i = 0; i < vinData.length; i++) {
                cy.get(locators.vinSearchField).scrollIntoView().clear().type(`${vinData[i]}`)
                cy.get(locators.applyFilterBtn).scrollIntoView().click()
                cy.get(locators.vinOnCard, { timeout: dataFile.midWaitTime }).contains(`${vinData[i]}`)
            }

        })
    }

    /**
    * this method will visit dealer configuration page on Index
    * and will route to Dealer Inventory
    * and will get listed assets from inventory 
    */
    checkIndexInventory() {
        this.visitIndexInventory()
        this.getVinNumberFromIndex("availableVinNumbers")
    }

    /*
    * this method will visit Inventory Management page on Index
    */
    visitIndexInventory() {
        cy.visit(Cypress.env('INDEX_INVENTORY_MANAGEMENT'))
    }

    /**
     * this will get available and listed assets in dealer inventory on Index
     * and save VIN numbers of available assets
     * then it will route to Work Queue screen on Lane
     * @param {string} key key attribute specify array name
     */
    getVinNumberFromIndex(key) {
        cy.readFile(orderDataFilePath).then(file => {
            cy.get('.u-table-body tr', { timeout: dataFile.maxWaitTime }).should('be.visible')
            cy.intercept({ method: 'GET', url: Cypress.env("INDEX_INVENTORY_FILTER_URL") }).as("filterInventory");
            cy.get(locators.listingStatusFilter, { timeout: dataFile.maxWaitTime }).type(dataFile.listingStatusFilter)
            cy.get(locators.listingStatusFilter).type(dataFile.listingStatusFilter)
            cy.get(locators.statusFitler).type(dataFile.statusFitler).blur()
            cy.wait("@filterInventory", { timeout: dataFile.maxWaitTime })
            cy.wait(2000)
            cy.get(locators.inventoryTable).find('tr').then((row) => {
                for (let i = 0; i < row.length; i++) {
                    cy.get(locators.inventoryTR, { timeout: dataFile.maxWaitTime }).eq(`${i}`).find(locators.inventoryTD).eq(3).invoke("text")
                        .then((obj) => {
                            vinNumbers.push(obj)
                            file[key] = vinNumbers
                            cy.writeFile(orderDataFilePath, file)
                        })
                }
            })
        })
        cy.visit(Cypress.env('LANE_URL'))
    }

    /**
     * this method will perform Mouse over event
     * @param {string} locatorKey key attribute to pass locator
     */
    mouseOverEvent(locatorKey) {
        cy.get(locators[locatorKey], { timeout: dataFile.midWaitTime }).realHover()
    }

    /*
    * this method will verify both eye
    * and Select & Continue buttons are visible
    */
    verifyEyeAndSelectAssetBtn() {
        cy.get(locators.selectAssetBtn).should('be.visible')
        cy.get(locators.eyeBtn).should('be.visible')
    }

    /*
    * this method will get available and listed vehicles in Index Inventory table
    * and getVehicleDataFromIndexInventory method will write vehicle details to specified json file
    */
    getVehicleDetailsFromIndex(assetIndex) {
        cy.get('.u-table-body tr', { timeout: dataFile.maxWaitTime }).should('be.visible')
        cy.intercept({ method: 'GET', url: Cypress.env("INDEX_INVENTORY_FILTER_URL") }).as("filterInventory");
        cy.get(locators.listingStatusFilter, { timeout: dataFile.maxWaitTime }).type(dataFile.listingStatusFilter)
        cy.get(locators.statusFitler).type(dataFile.statusFitler).blur()
        cy.wait("@filterInventory", { timeout: dataFile.maxWaitTime })
        cy.get(locators.inventoryTable, { timeout: dataFile.maxWaitTime }).find('tr').then(() => {
            this.getVehicleDataFromIndexInventory(assetIndex, 1, "vehicleName")
            this.getVehicleDataFromIndexInventory(assetIndex, 2, "stockNumber")
            this.getVehicleDataFromIndexInventory(assetIndex, 3, "vinNumber")
            this.getVehicleDataFromIndexInventory(assetIndex, 6, "assetCondition")
        })
        cy.visit(Cypress.env('LANE_URL'))
    }

    /**
    * this method will get first asset data in index inventory table
    * and write it to InventorytableData.json file
    * @param {number} elIndex column number in index inventory table
    * @param {string} key key attribute to get to specify coumn name of index inventory table
    * @param {string} assetIndex row index number in index inventory table
    */
    getVehicleDataFromIndexInventory(assetIndex, elIndex, key) {
        cy.readFile(orderDataFilePath).then(file => {
            cy.get(locators.inventoryTR, { timeout: dataFile.maxWaitTime }).eq(`${dataFile[assetIndex]}`).find(locators.inventoryTD).eq(`${elIndex}`).invoke("text")
                .then((obj) => {
                    file[key] = obj;
                    cy.writeFile("cypress/fixtures/AssetSelection/AssetSelection.json", file)
                })
        })
    }

    /**
     * this method will select Asset Condtion in Asset Condition filter section 
     */
    assetConditionFilterInput() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then(file => {
            assetCondition = file.assetCondition
            this.assetConditionFilter(assetCondition)
        })
    }

    /**
     * this method will select Asset Make in Make/Model/Trim filter section
     */
    assetMakeFilterInput() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then(file => {
            const assetMake = file.vehicleName.split(' ')[1]
            this.assetMakeModelTrimFilter("makeInput", assetMake)
        })
    }

    /**
     * this method will select Asset Model in Make/Model/Trim filter section
     */
    assetModelFilterInput() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then(file => {
            const assetModel = file.vehicleName.split(' ')[2]
            this.assetMakeModelTrimFilter("modelInput", assetModel)
        })
    }
    /**
     * this method will select Asset Trim in Make/Model/Trim filter section
     */
    assetTrimFilterInput() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then(file => {
            const assetTrim = file.vehicleName.split(' ')[3]
            this.assetMakeModelTrimFilter("trimInput", assetTrim)
        })
    }

    /**
     * this method will input Asset Vin Number in VIN filter section
     */
    assetVinFilterInput() {
        cy.readFile("cypress/fixtures/AssetSelection/AssetSelection.json").then(file => {
            const assetVin = file.vinNumber
            this.vinAndStockFilter("vinFilterInput", assetVin)
        })
    }

    /**
     * this method will input Stock Number in Stock filter section
     */
    assetStockFilterInput() {
        cy.readFile(orderDataFilePath).then(file => {
            const assetStockNumber = file.stockNumber
            this.vinAndStockFilter("stockFilterInput", assetStockNumber)
        })
    }


    /**
     * this method will check for Asset condition
     * and will check the relative drop-down of Asset Condition 
     * @param {string} condition key to check if asset condition is Used or New
     */
    assetConditionFilter(condition) {
        if (condition == 'Used') {
            cy.get(locators.assetUsedCheckbox, { timeout: dataFile.maxWaitTime }).check()
        }
        else if (condition == "New") {
            cy.get(locators.assetNewCheckbox, { timeout: dataFile.maxWaitTime }).check()
        }
    }

    /**
     * this method will check Asset's Make Model and Trim drop-down 
     * in asset filters available on Choose Asset Screen
     * @param {string} locatorKey key attribute to pass locator
     * @param {string} value value attribute to pass the value of dropdown menu 
     */
    assetMakeModelTrimFilter(locatorKey, value) {
        cy.get(locators[locatorKey]).parent().click()
        cy.get(`[data-value='${value}']`).click()
        cy.get("body").click()
    }

    /**
     * this method will clear the input field
     * and will type the value passed 
     * @param {string} key key attribute to pass locator 
     * @param {string} dataKey the data value to be input in the input field
     */
    vinAndStockFilter(key, dataKey) {
        cy.get(locators[key], { timeout: dataFile.midWaitTime }).clear().type(dataKey)
    }

    /**
     * method for button click
     * @param {string} btnKey key attribute to pass button locator
     */
    buttonClick(btnKey) {
        cy.get(locators[btnKey]).should('be.visible').click()
    }

    /**
     * this method will verify vin on vehicle card
     * @param {string} vinKey key attribute to pass vin locator
     * @param {string} vinNumber key attribute to pass vin Number
     */
    getVinOnCard(vinKey, vinNumber) {
        cy.get(locators[vinKey]).scrollIntoView().should('have.text', dataFile[vinNumber])
    }

    /**
     * this method will click on Hide Filters button
     * and will verify Hide Filters button Text
     */
    hideAvailableFilters() {
        this.buttonClick("hideFiltersBtn")
        cy.get(locators.hideFiltersBtn).should('contain', dataFile.showFiltersBtnTxt)
    }

    /**
     * this method will compare array containing Selling price 
     * of available assets in index inventory
     * with array containing Selling Price of sorted assets on
     * Choose Asset screen
     */
    verifyPriceArray() {
        cy.readFile(orderDataFilePath).then((obj) => {
            expect(obj.priceInInventory.sort()).to.deep.eq(obj.priceOnCard)
        })
    }

    /**
     * this method will get first asset selling price in index inventory table
     * and write it to AssetSelection.json file 
     * @param {string} key key attribute specify array name
     */
    sortSellingPriceHightoLow(key) {
        cy.readFile(orderDataFilePath).then(file => {
            for (let i = 0; i < sellingPrice.length; i++) {
                cy.get(locators.vehicleCard, { timeout: dataFile.maxWaitTime }).eq(`${i}`).find(locators.sellingPriceOnCard).invoke('text')
                    .then((price) => {
                        const slp = price.replace("$", '').trim()
                        const newSlp = slp.replace(".00", '')
                        priceOnCard.push(newSlp)
                        file[key] = priceOnCard.sort()
                        cy.writeFile(orderDataFilePath, file)
                    })
            }
        })
    }

    /**
     * this will get available and listed assets in dealer inventory on Index
     * and save Selling Price of available assets
     * then it will route to Work Queue screen on Lane
     * @param {string} key key attribute specify array name
     */
    getSellingPriceFromIndexInventory(key) {
        cy.readFile(orderDataFilePath).then(file => {
            cy.get('.u-table-body tr', { timeout: dataFile.maxWaitTime }).should('be.visible')
            cy.intercept({ method: 'GET', url: Cypress.env("INDEX_INVENTORY_FILTER_URL") }).as("filterInventory");
            cy.get(locators.listingStatusFilter).type(dataFile.listingStatusFilter)
            cy.get(locators.statusFitler).type(dataFile.statusFitler).blur()
            cy.wait("@filterInventory", { timeout: dataFile.maxWaitTime })
            cy.get(locators.inventoryTable, { timeout: dataFile.maxWaitTime }).find('tr').then((row) => {
                for (let i = 0; i < row.length; i++) {
                    cy.get(locators.inventoryTR).eq(`${i}`).children().eq(10).invoke("text")
                        .then((obj) => {
                            const selp = obj.replace("$ ", '').trim()
                            sellingPrice.push(selp)
                            file[key] = sellingPrice
                            cy.writeFile(orderDataFilePath, file)
                        })
                }
            })
        })
        cy.visit(Cypress.env('LANE_URL'))
    }
}
export const assetSelection = new AssetSelection()