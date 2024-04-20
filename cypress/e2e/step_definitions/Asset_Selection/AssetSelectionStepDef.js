import { When, Then, Given } from "@badeball/cypress-cucumber-preprocessor";
import { assetSelection } from "../../../pages/AssetSelection/AssetSelection.spec";


When("I read data file for Asset Selection on Lane", () => {
    assetSelection.readDataFile()
})

Then("I verify user should be able to see Asset Selection screen", () => {
    assetSelection.validateHeaders("chooseAssetHeader", "headerTitle")
})

When("I check Consent Checkbox", () => {
    assetSelection.checkConsentBox()
})

When("I click on Save & Initiate Order Button", () => {
    assetSelection.initiateOrderButton()
})

When("I visit Index and check for available assets in Inventory and visit Lane", () => {
    assetSelection.checkIndexInventory()
})

Then("I verify All listed assets should be available on Choose Asset Screen", () => {
    assetSelection.validateHeaders("vinFilterHeader", "vinHeaderTitle")
    assetSelection.checkListedAssets()
})

When("I hover over the shortlisted vehicle card", () => {
    assetSelection.mouseOverEvent("vehicleCard")
})


Then("I verify Eye and Select & Continue buttons should be visible", () => {
    assetSelection.verifyEyeAndSelectAssetBtn()
})

When("I click on Eye Button", () => {
    assetSelection.buttonClick("eyeBtn")
})

Then("Asset details should be displayed in the popup", () => {
    assetSelection.validateHeaders("assetPopupHeader", "vehicleDialogTitle")
    assetSelection.validateHeaders("assetFeaturesHeader", "vehicleFeatureTitle")
})

Then("All filters should be visible to the user", () => {
    assetSelection.validateHeaders("assetConditonHeader", "assetConditionFilterTitle")
    assetSelection.validateHeaders("sellingPriceHeader", "sellingPriceFilterTitle")
    assetSelection.validateHeaders("yearFilterHeader", "yearFilterTitle")
    assetSelection.validateHeaders("makeModelFilterHeader", "makeModelTrimFilterTitle")
    assetSelection.validateHeaders("vinFilterHeader", "vinHeaderTitle")
    assetSelection.validateHeaders("stockFilterHeader", "stockNumberHeaderTitle")
})

When("I visit Index and get details of {string} available vehicle from Inventory", (assetIndex) => {
    assetSelection.visitIndexInventory()
    assetSelection.getVehicleDetailsFromIndex(assetIndex)
})

When("I select multiple filters and click Apply filters button", () => {
    assetSelection.assetConditionFilterInput()
    assetSelection.assetMakeFilterInput()
    assetSelection.assetModelFilterInput()
    assetSelection.assetTrimFilterInput()
    assetSelection.assetVinFilterInput()
    assetSelection.assetStockFilterInput()
    assetSelection.buttonClick("applyFiltersBtn")
})

When("I input VIN Number and click Apply Filters Button", () => {
    assetSelection.assetVinFilterInput()
    assetSelection.assetStockFilterInput()
    assetSelection.buttonClick("applyFiltersBtn")
})

Then("I verify the shortlisted asset on Choose Asset Screen", () => {
    assetSelection.getVinOnCard("vinOnCard", "vinNumber")
})

Then("I click on Hide Filter button and all available filters should be hidden", () => {
    assetSelection.hideAvailableFilters()
})

When("I click on Reset Filters button", () => {
    assetSelection.buttonClick("resetFiltersBtn")
})

When("I Select and Continue with any of the shortlisted asset", () => {
    assetSelection.buttonClick("selectAssetBtn")
})

Then("I land on Create Quotation screen", () => {
    assetSelection.validateHeaders("createQuotationHeader", "createQuotationHeaderTitle")
})

Given("I visit Index and get Selling Price of available assets from Inventory", () => {
    assetSelection.visitIndexInventory()
    assetSelection.getSellingPriceFromIndexInventory("priceInInventory")
})

When("I click on Sort By button", () => {
    assetSelection.buttonClick("sortByBtn")
})

When("I click on select Selling Price High To Low option", () => {
    assetSelection.buttonClick("sellingPriceHightoLow")
})

Then("I verify cards are sorted with Selling Price High to Low", () => {
    assetSelection.sortSellingPriceHightoLow("priceOnCard")
    assetSelection.verifyPriceArray()
})