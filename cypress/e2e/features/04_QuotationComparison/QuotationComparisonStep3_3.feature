Feature: Order Creation in Dealer Portal - Quotation Parameters and Comparison Step 3.3 - F&I Products

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
        And I read data files for Quotation Comparison Step 3.1
        And I read data files for Quotation Comparison Step 3.2
        And I read data and locator files for Quotation Comparison Step 3.3
        And I visit Index and get details of 'first' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        Then I verify Consent Checkbox should 'not' auto-checked
        When I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I input VIN Number and click Apply Filters Button
        And I hover over the shortlisted vehicle card
        And I Select and Continue with any of the shortlisted asset
        And I land on Create Quotation screen
        And I wait for Quotation Calculation calls to complete

    @lane-regression
    Scenario: Verify that enabled F&I Products should be visible on F&I Popup
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        Then I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '0' on F&I Dialog
        And I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '1' on F&I Dialog
        And I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '2' on F&I Dialog
        And I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '3' on F&I Dialog
        And I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '4' on F&I Dialog

    @lane-regression
    Scenario: Verify that enabled F&I Products should be visible on F&I Popup
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        Then I verify 'productsTabList' has 'productType' which is marked as 'Enabled' at index '5' on F&I Dialog

    @lane-regression
    Scenario: Verify that selected F&I Product should be displayed in Quotation Drawer
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        And I click on 'financeProgram' button for F&I Products
        And I click on 'leaseProgram' button for F&I Products
        And I wait for Coverage rates to be available
        And I click on 'addBtn' button for F&I Products
        Then I verify 'addBtn' has text of 'removeFnIBtnText' on F&I Section
        When I click on 'continueBtn' button for F&I Products
        Then I verify 'productNameOnDrawer' has 'productName' of '0' in F&I Section on Drawer

    @lane-regression
    Scenario: Verify F&I Products section should display the sum of F&I products attached
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        And I click on 'financeProgram' button for F&I Products
        And I click on 'leaseProgram' button for F&I Products
        And I wait for Coverage rates to be available
        And I click on 'addBtn' button for F&I Products
        Then I verify 'addBtn' has text of 'removeFnIBtnText' on F&I Section
        When I click on 'continueBtn' button for F&I Products
        Then I verify 'productNameOnDrawer' has 'productName' of '0' in F&I Section on Drawer
        And I verify 'totalPriceOnDrawer' has 'coverageRate' of '0' in F&I Section on Drawer

    @lane-regression
    Scenario: Verify F&I Section should be collapsed by default
        Then I verify 'FnICollapsed' is collapsed by default in F&I section

    @lane-regression
    Scenario: Verify F&I individual value shall be editable
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        And I click on 'financeProgram' button for F&I Products
        And I click on 'leaseProgram' button for F&I Products
        And I wait for Coverage rates to be available
        And I click on 'addBtn' button for F&I Products
        Then I verify 'addBtn' has text of 'removeFnIBtnText' on F&I Section
        When I click on 'continueBtn' button for F&I Products
        Then I verify 'productNameOnDrawer' has 'productName' of '0' in F&I Section on Drawer
        And I verify 'totalPriceOnDrawer' has 'coverageRate' of '0' in F&I Section on Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFnIBtn' button for F&I Products
        And I click on 'editFnIAmount' button for F&I Products
        And I input 'selectCoverageRate' value in 'fniInputFeild' at index '0' in F&I Section
        And I click on 'saveFnIAmount' button for F&I Products
        Then I verify 'FnIAmountInQuoteParameters' has value of 'selectCoverageRate' from index '0' in F&I Section

    @lane-regression
    Scenario: Validate Recalculate/Discard Changes bar should appear on making the changes
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        And I click on 'financeProgram' button for F&I Products
        And I click on 'leaseProgram' button for F&I Products
        And I wait for Coverage rates to be available
        And I click on 'addBtn' button for F&I Products
        Then I verify 'addBtn' has text of 'removeFnIBtnText' on F&I Section
        When I click on 'continueBtn' button for F&I Products
        Then I verify 'productNameOnDrawer' has 'productName' of '0' in F&I Section on Drawer
        And I verify 'totalPriceOnDrawer' has 'coverageRate' of '0' in F&I Section on Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFnIBtn' button for F&I Products
        And I click on 'editFnIAmount' button for F&I Products
        And I input 'selectCoverageRate' value in 'fniInputFeild' at index '0' in F&I Section
        And I click on 'saveFnIAmount' button for F&I Products
        Then I verify 'saveOrDiscardChangesDialog' button should be visible on Quotation Drawer

    @lane-regression
    Scenario: Verify that update Quotation button should be visible
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addFnIProductsBtn' button for F&I Products
        Then I verify 'dialogTitle' has text of 'dialogTitleText' on F&I Section
        When I click on 'leaseProgram' button for F&I Products
        And I click on 'financeProgram' button for F&I Products
        And I click on 'leaseProgram' button for F&I Products
        And I wait for Coverage rates to be available
        And I click on 'addBtn' button for F&I Products
        Then I verify 'addBtn' has text of 'removeFnIBtnText' on F&I Section
        When I click on 'continueBtn' button for F&I Products
        Then I verify 'productNameOnDrawer' has 'productName' of '0' in F&I Section on Drawer
        And I verify 'totalPriceOnDrawer' has 'coverageRate' of '0' in F&I Section on Drawer
        Then I verify 'updateQuotationBtn' should be visible on Create Quotation screen