Feature: Order Creation in Dealer Portal - Quotation parameters and Comparison (Step 3.5) - Options

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
        And I read data files for Quotation Comparison Step 3.1
        And I read data files for Quotation Comparison Step 3.2
        And I read data files for Quotation Comparison Step 3.4
        And I read data and Locator files for Quotation Comparison Step 3.5
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
    Scenario: Validate that Options section should be visible on Quotation Comparison page
        Then I verify 'optionsHeader' is visible in Options section

    @lane-regression
    Scenario: Validate the Options is collapsed by default and on click Pre-Installed and Optional sub sections should be visible with their details
        Then I verify 'optionsCollapsed' is collapsed by default in Fee section
        And I verify 'financeOptionsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'financeOptionsValue' value is readOnly
        And I verify 'leaseOptionsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'leaseOptionsValue' value is readOnly
        When I click on 'expandOptions' Button in Options Section
        Then I verify 'financeOptionalAddOnsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'leaseOptionalAddOnsValue' in 'dealerProfile' at '' has value of 'optionsAmount'

    @lane-regression
    Scenario: Validate that when user edit Options Amount, a toast will appear to Recalculate Quotation or Discard Changes
        When I click on 'expandOptions' Button in Options Section
        And I click on 'financeOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        Then I verify 'disclaimer' should be visible in Quotation Parameters
        When I click on 'leaseOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        Then I verify 'disclaimer' should be visible in Quotation Parameters

    @lane-regression
    Scenario: Validate when user edit data on Quotation Comparison page screen Save Order button should be visible
        When I click on 'expandOptions' Button in Options Section
        And I click on 'financeOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        Then I verify 'saveOrderBtn' should be visible on Create Quotation screen
        When I click on 'leaseOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        Then I verify 'saveOrderBtn' should be visible on Create Quotation screen

    @lane-regression
    Scenario: Validate the behavior when user changes value in one column
        When I click on 'expandOptions' Button in Options Section
        And I click on 'financeOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        Then I verify 'financeOptionalAddOnsValue' field has a new value
        Then I verify 'leaseOptionalAddOnsValue' field has a new value

    @lane-regression
    Scenario: Validate that Options section in Configure Quotation page should be visible along with details
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'optionsNameOnDrawer' has 'productName' from dealerOptions at index of '1' in Options Section
        And I verify 'optionsValueOnDrawer' has 'price' from dealerOptions at index of '1' in Options Section
        And I verify 'optionstotalAmountOnDrawer' has 'price' from dealerOptions at index of '1' in Options Section

    @lane-regression
    Scenario: Validate when user clicks on Add More Options button user can add more options from list of dealer options available
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I click on 'addOptionsBtn' Button in Options Section
        Then I verify 'preInstalledButtonInOptions' has 'installationMode' from dealerOptions at index of '1' in Options Section
        And I verify 'availableOptionsCategory' has 'category' from dealerOptions at index of '0' in Options Section
        When I click on 'availableOptionsCategory' Button in Options Section
        And I click on 'addOptionalAccessoryBtn' Button in Options Section
        Then I verify 'addOptionalAccessoryBtn' has text of 'removeOptionsBtnText' in Options Section
        When I click on 'continueBtn' Button in Options Section
        Then I verify 'totalValueOfOptionsOnDrawer' has updated value of Options

    @lane-regression
    Scenario: Validate that user can remove customer attached options
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I click on 'addOptionsBtn' Button in Options Section
        Then I verify 'preInstalledButtonInOptions' has 'installationMode' from dealerOptions at index of '1' in Options Section
        And I verify 'availableOptionsCategory' has 'category' from dealerOptions at index of '0' in Options Section
        When I click on 'availableOptionsCategory' Button in Options Section
        And I click on 'addOptionalAccessoryBtn' Button in Options Section
        Then I verify 'addOptionalAccessoryBtn' has text of 'removeOptionsBtnText' in Options Section
        When I click on 'continueBtn' Button in Options Section
        Then I verify 'totalValueOfOptionsOnDrawer' has updated value of Options
        When I click on 'addOptionsBtn' Button in Options Section
        And I click on 'availableOptionsCategory' Button in Options Section
        Then I verify 'addOptionalAccessoryBtn' has text of 'removeOptionsBtnText' in Options Section
        When I click on 'addOptionalAccessoryBtn' Button in Options Section
        And I click on 'continueBtn' Button in Options Section
        Then I verify 'totalValueOfOptionsOnDrawer' has 'price' from dealerOptions at index of '1' in Options Section

    @lane-regression
    Scenario:Validate the system behavior on clicking the Update Quotation Button
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I click on 'addOptionsBtn' Button in Options Section
        Then I verify 'preInstalledButtonInOptions' has 'installationMode' from dealerOptions at index of '1' in Options Section
        And I verify 'availableOptionsCategory' has 'category' from dealerOptions at index of '0' in Options Section
        When I click on 'availableOptionsCategory' Button in Options Section
        And I click on 'addOptionalAccessoryBtn' Button in Options Section
        Then I verify 'addOptionalAccessoryBtn' has text of 'removeOptionsBtnText' in Options Section
        When I click on 'continueBtn' Button in Options Section
        Then I verify 'totalValueOfOptionsOnDrawer' has updated value of Options
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I verify 'leaseOptionsValue' has updated value of Options