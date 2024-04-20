Feature: Order Creation In Dealer Portal - Quotation parameters and Comparison Step 3.2 - Dealer Fee

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
        And I read data files for Quotation Comparison Step 3.1
        And I read data files for Quotation Comparison Step 3.2
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
    Scenario: Validate Fees section from Create Quotation screen in Lane
        Then I verify 'totalFeesInFinance' in 'dealerProfile' at '' has value of 'totalFees'
        And I verify 'totalFeesInLease' in 'dealerProfile' at '' has value of 'totalFees'
        And I verify 'expandedToggleBtn' is collapsed by default

    @lane-regression
    Scenario: Validate individual Fee values in Fee section 
        When I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'processingFeeInFinanceValue' in 'dealerProfile' at '' has value of 'processingFeeAmount'
        And I verify 'evaluationFeeInFinanceValue' in 'dealerProfile' at '' has value of 'evaluationFeeAmount'
        And I verify 'processingFeeInLeaseValue' in 'dealerProfile' at '' has value of 'processingFeeAmount'
        And I verify 'evaluationFeeInLeaseValue' in 'dealerProfile' at '' has value of 'evaluationFeeAmount'

    @lane-regression
    Scenario: Validate user is able to edit Fee Values for Finance in Fee section 
        When I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        And I click on 'editFinanceProcessingFee' Button in Fees Section
        And I clear 'inputFieldInParameters' and input 'selectPorcessingFeeAmount' value from 'dealerProfile' at ''
        And I click on 'saveFeeBtn' Button in Fees Section
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'processingFeeInFinanceValue' field has a new value
        When I click on 'editFinanceEvaluationFee' Button in Fees Section
        And I clear 'inputFieldInParameters' and input 'selectEvaluationFeeAmount' value from 'dealerProfile' at ''
        And I click on 'saveFeeBtn' Button in Fees Section
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'evaluationFeeInFinanceValue' field has a new value

    @lane-regression
    Scenario: Validate user is able to edit Fee Values for Lease in Fee section 
        When I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        And I click on 'editLeaseProcessingFee' Button in Fees Section
        And I clear 'inputFieldInParameters' and input 'selectPorcessingFeeAmount' value from 'dealerProfile' at ''
        And I click on 'saveFeeBtn' Button in Fees Section
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'processingFeeInLeaseValue' field has a new value
        When I click on 'editLeaseEvaluationFee' Button in Fees Section
        And I clear 'inputFieldInParameters' and input 'selectEvaluationFeeAmount' value from 'dealerProfile' at ''
        And I click on 'saveFeeBtn' Button in Fees Section
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'evaluationFeeInLeaseValue' field has a new value
