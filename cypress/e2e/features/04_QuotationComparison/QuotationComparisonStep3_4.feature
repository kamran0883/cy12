Feature: Order Creation In Dealer Portal - Quotation parameters and Comparison Step 3.4 - Trade-in Details

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
        And I read data files for Quotation Comparison Step 3.1
        And I read data files for Quotation Comparison Step 3.2
        And I read data files for Quotation Comparison Step 3.4
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
    Scenario: Validate that Trade-In section should be visible on Quotation Comparison page
        Then I verify 'tradeInHeaderTitle' has text of 'tradeInHeaderText' in Trade-In Section

    @lane-regression
    Scenario: Validate when user clicks on Configure Quotation Button Trade In Section should be visible
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section

    @lane-regression
    Scenario: Validate the fields on Trade-In popup
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        And I verify 'yearInputField' is visible on Trade-In Popup
        And I verify 'makeInputField' is visible on Trade-In Popup
        And I verify 'modelInputField' is visible on Trade-In Popup
        And I verify 'trimInputField' is visible on Trade-In Popup
        And I verify 'mileageInputField' is visible on Trade-In Popup
        And I verify 'conditionDropDown' is visible on Trade-In Popup
        And I verify 'tradeInAmountInputField' is visible on Trade-In Popup
        And I verify 'fileUploadArea' is visible on Trade-In Popup
        And I verify 'continueBtn' is visible on Trade-In Popup

    @lane-regression
    Scenario: Validate the positive trade-in equity will be deducted while calculating the finance amount
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        When I input 'tradeInYear' in 'yearInputField' on Trade-In Details Popup
        And I input 'tradeInMake' in 'makeInputField' on Trade-In Details Popup
        And I input 'tradeInModel' in 'modelInputField' on Trade-In Details Popup
        And I input 'tradeInTrim' in 'trimInputField' on Trade-In Details Popup
        And I input 'tradeInCurrentMileage' in 'mileageInputField' on Trade-In Details Popup
        And I input 'tradeInVIN' in 'vinInputField' on Trade-In Details Popup
        And I select 'conditionDropDown' and select 'tradeInCondition' on Trade-In Details Popup
        And I input 'tradeInAmount' in 'tradeInAmountInputField' on Trade-In Details Popup
        And I get 'assetEntitledToCustomer' section and check 'entitledToCustomer' value on Trade-In Details Popup
        And I get 'leaseBalancee' section and check 'leaseBalance' value on Trade-In Details Popup
        And I upload Trade-In Asset Image on Trade-In Details Popup
        Then I verify 'filePreview' is visible on Trade-In Popup
        When I click on 'continueBtn' Button
        Then I verify 'assetNameOnDrawer' in Trade-In Section on Quotation Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify Updated value of Financed Amount with 'leaseBalance' in 'FinancedAmountInFinance'
        And I verify Updated value of Financed Amount with 'leaseBalance' in 'FinancedAmountInLease'

    @lane-regression
    Scenario: Validate when customer has lease/loan balance additional fields should be visible
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        And I verify 'yearInputField' is visible on Trade-In Popup
        And I verify 'makeInputField' is visible on Trade-In Popup
        And I verify 'modelInputField' is visible on Trade-In Popup
        And I verify 'trimInputField' is visible on Trade-In Popup
        And I verify 'mileageInputField' is visible on Trade-In Popup
        And I verify 'conditionDropDown' is visible on Trade-In Popup
        And I verify 'tradeInAmountInputField' is visible on Trade-In Popup
        When I get 'leaseBalancee' section and check 'payOffBalance' value on Trade-In Details Popup
        Then I verify 'contractNumberFeild' is visible on Trade-In Popup
        And I verify 'lenderNameFeild' is visible on Trade-In Popup
        And I verify 'lenderAddressFeild' is visible on Trade-In Popup
        And I verify 'lenderContactFeild' is visible on Trade-In Popup
        And I verify 'paymentTypeDropDown' is visible on Trade-In Popup
        And I verify 'payOffAmountFeild' is visible on Trade-In Popup
        And I verify 'fileUploadArea' is visible on Trade-In Popup
        And I verify 'continueBtn' is visible on Trade-In Popup

    @lane-regression
    Scenario: Validate the negative trade-in equity will be added while calculating the finance amount
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        When I input 'tradeInYear' in 'yearInputField' on Trade-In Details Popup
        And I input 'tradeInMake' in 'makeInputField' on Trade-In Details Popup
        And I input 'tradeInModel' in 'modelInputField' on Trade-In Details Popup
        And I input 'tradeInTrim' in 'trimInputField' on Trade-In Details Popup
        And I input 'tradeInCurrentMileage' in 'mileageInputField' on Trade-In Details Popup
        And I input 'tradeInVIN' in 'vinInputField' on Trade-In Details Popup
        And I select 'conditionDropDown' and select 'tradeInCondition' on Trade-In Details Popup
        And I input 'tradeInAmount' in 'tradeInAmountInputField' on Trade-In Details Popup
        And I get 'assetEntitledToCustomer' section and check 'entitledToCustomer' value on Trade-In Details Popup
        And I get 'leaseBalancee' section and check 'payOffBalance' value on Trade-In Details Popup
        And I input 'contractNumber' in 'contractNumberFeild' on Trade-In Details Popup
        And I input 'lenderName' in 'lenderNameFeild' on Trade-In Details Popup
        And I input 'lenderAddress' in 'lenderAddressFeild' on Trade-In Details Popup
        And I input 'lenderContact' in 'lenderContactFeild' on Trade-In Details Popup
        And I select 'paymentTypeDropDown' and select 'paymentType' on Trade-In Details Popup
        And I input 'payOffAmount' in 'payOffAmountFeild' on Trade-In Details Popup
        And I upload Trade-In Asset Image on Trade-In Details Popup
        Then I verify 'filePreview' is visible on Trade-In Popup
        When I click on 'continueBtn' Button
        Then I verify 'assetNameOnDrawer' in Trade-In Section on Quotation Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify Updated value of Financed Amount with 'payOffBalance' in 'FinancedAmountInFinance'
        And I verify Updated value of Financed Amount with 'payOffBalance' in 'FinancedAmountInLease'

    @lane-regression @lane-sanity
    Scenario: Validate the system behavior on clicking the Update Quotation Button
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        When I input 'tradeInYear' in 'yearInputField' on Trade-In Details Popup
        And I input 'tradeInMake' in 'makeInputField' on Trade-In Details Popup
        And I input 'tradeInModel' in 'modelInputField' on Trade-In Details Popup
        And I input 'tradeInTrim' in 'trimInputField' on Trade-In Details Popup
        And I input 'tradeInCurrentMileage' in 'mileageInputField' on Trade-In Details Popup
        And I input 'tradeInVIN' in 'vinInputField' on Trade-In Details Popup
        And I select 'conditionDropDown' and select 'tradeInCondition' on Trade-In Details Popup
        And I input 'tradeInAmount' in 'tradeInAmountInputField' on Trade-In Details Popup
        And I get 'assetEntitledToCustomer' section and check 'entitledToCustomer' value on Trade-In Details Popup
        And I get 'leaseBalancee' section and check 'leaseBalance' value on Trade-In Details Popup
        And I upload Trade-In Asset Image on Trade-In Details Popup
        Then I verify 'filePreview' is visible on Trade-In Popup
        When I click on 'continueBtn' Button
        Then I verify 'assetNameOnDrawer' in Trade-In Section on Quotation Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify trade-in amount with 'leaseBalance' in 'tradeInForFinance'
        And I verify trade-in amount with 'leaseBalance' in 'tradeInForLease'
        And I verify Updated value of Financed Amount with 'leaseBalance' in 'FinancedAmountInFinance'
        And I verify Updated value of Financed Amount with 'leaseBalance' in 'FinancedAmountInLease'