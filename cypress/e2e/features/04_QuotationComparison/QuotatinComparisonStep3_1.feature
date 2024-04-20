Feature: Order Creation In Dealer Portal - Quotation parameters and Comparison Step 3.1

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
        And I read data files for Quotation Comparison Step 3.1
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
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeProgramName' in 'programs' at '0' has value of 'financeType'
        And I verify 'leasePorgramName' in 'programs' at '1' has value of 'financeType'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeProgramAPR' in 'charts' at '' has value of 'margin'
        And I verify 'leaseProgramAPR' in 'charts' at '' has value of 'margin'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeEstimatedPeriodicPayment' in 'programs' at '0' has value of 'estimatedPeriodicPayment'
        And I verify 'leaseEstimatedPeriodicPayment' in 'programs' at '1' has value of 'estimatedPeriodicPayment'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'leaseAnnualMileage' in 'dealerProfile' at '' has value of 'deafultMileage'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeDownpayment' in 'charts' at '' has value of 'downPayment'
        When I click on 'financeDownpaymentEditBtn' Button in Quotation Parameters
        Then I verify 'financeDownpaymentCaption' has configured range of values of 'downPaymentStart' and 'downPaymentEnd'
        When I clear 'inputFieldInParameters' and input 'selectDownpayment' value from 'charts' at ''
        And I click on 'saveDownPaymentInputBtn' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        Then I verify 'financeDownpayment' field has a new value
        When I click on 'leaseDownpaymentEditBtn' Button in Quotation Parameters
        Then I verify 'leaseDownpaymentCaption' has configured range of values of 'downPaymentStart' and 'downPaymentEnd'
        When I clear 'inputFieldInParameters' and input 'selectDownpayment' value from 'charts' at ''
        And I click on 'saveDownPaymentInputBtn' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        Then I verify 'leaseDownpayment' field has a new value

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeDueAtSigningValue' in 'programs' at '0' has value of 'dueAtSigning'
        And I verify 'leaseDueAtSigningValue' in 'programs' at '1' has value of 'dueAtSigning'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeSellingPrice' in 'manageInventory' at '0' has value of 'sellingPrice'
        And I verify 'leaseSellingPrice' in 'manageInventory' at '0' has value of 'sellingPrice'

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeRVBalloonAmount' in 'charts' at '' has value of 'balloonAmount'
        And I verify 'financeRVBalloonAmount' value is readOnly
        And I verify 'leaseRVBalloonAmount' in 'charts' at '' has value of 'balloonAmount'
        And I verify 'leaseRVBalloonAmount' value is readOnly
        When I click on 'expandRVButton' Button in Quotation Parameters
        Then I verify 'endOfTermPaymentInFinance' in 'charts' at '' has value of 'endOfTermPayment'
        When I click on 'editFinanceEndOfTermPayment' Button in Quotation Parameters
        Then I verify 'financeEndOfTermPaymentCaption' has configured range of values of 'endOfTermStart' and 'endOfTermEnd'
        When I clear 'inputFieldInParameters' and input 'selectEndOfTermPayment' value from 'charts' at ''
        And I click on 'saveEndOfTermPayment' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandRVButton' Button in Quotation Parameters
        Then I verify 'endOfTermPaymentInFinance' field has a new value
        And I verify 'endOfTermPaymentInLease' in 'charts' at '' has value of 'endOfTermPayment'
        When I click on 'editLeaeEndOfTermPayment' Button in Quotation Parameters
        Then I verify 'leaseEndOfTermPaymentCaption' has configured range of values of 'endOfTermStart' and 'endOfTermEnd'
        When I clear 'inputFieldInParameters' and input 'selectEndOfTermPayment' value from 'charts' at ''
        And I click on 'saveEndOfTermPayment' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandRVButton' Button in Quotation Parameters
        Then I verify 'endOfTermPaymentInLease' field has a new value

    @lane-sanity @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeProgFinanceAmount' in 'programs' at '0' has value of 'financedAmount'
        And I verify 'financeProgFinanceAmount' value is readOnly
        And I verify 'leaseProgFinanceAmount' in 'programs' at '1' has value of 'financedAmount'
        And I verify 'leaseProgFinanceAmount' value is readOnly

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'financeOptionsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'financeOptionsValue' value is readOnly
        And I verify 'leaseOptionsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'leaseOptionsValue' value is readOnly
        When I click on 'expandOptionsDropdownBtn' Button in Quotation Parameters
        Then I verify 'financeOptionalAddOnsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        And I verify 'leaseOptionalAddOnsValue' in 'dealerProfile' at '' has value of 'optionsAmount'
        When I click on 'financeOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandOptionsDropdownBtn' Button in Quotation Parameters
        Then I verify 'financeOptionalAddOnsValue' field has a new value
        When I click on 'leaseOptionalAddOnsValueEditBtn' Button in Quotation Parameters
        And I clear 'inputFieldInParameters' and input 'selectOptionsAmount' value from 'dealerProfile' at ''
        And I click on 'saveOptionsInputBtn' Button in Quotation Parameters
        And I click on 'recalculateQuotationBtn' Button in Quotation Parameters
        And I wait for Quotation Calculation calls to complete
        And I click on 'expandOptionsDropdownBtn' Button in Quotation Parameters
        Then I verify 'leaseOptionalAddOnsValue' field has a new value

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        When I click on 'expandFeesDropDownBtn' Button in Quotation Parameters
        Then I verify 'processingFeeInFinanceValue' in 'dealerProfile' at '' has value of 'processingFeeAmount'
        And I verify 'evaluationFeeInFinanceValue' in 'dealerProfile' at '' has value of 'evaluationFeeAmount'
        And I verify 'processingFeeInLeaseValue' in 'dealerProfile' at '' has value of 'processingFeeAmount'
        And I verify 'evaluationFeeInLeaseValue' in 'dealerProfile' at '' has value of 'evaluationFeeAmount'
        And I verify 'totalFeesInFinance' in 'dealerProfile' at '' has value of 'totalFees'
        And I verify 'totalFeesInLease' in 'dealerProfile' at '' has value of 'totalFees'


    #-----------------TC-5883-------------Failing--Due--to----Bug--#28090-------

    @lane-regression
    Scenario: Validate Discard Changes feature from Create Quotation screen in Dealer Portal
        Then I verify 'financeProgramAPR' in 'charts' at '' has value of 'margin'
        And I verify 'leaseProgramAPR' in 'charts' at '' has value of 'margin'
        And I verify 'financeDownpayment' in 'charts' at '' has value of 'downPayment'
        When I click on 'financeDownpaymentEditBtn' Button in Quotation Parameters
        Then I verify 'financeDownpaymentCaption' has configured range of values of 'downPaymentStart' and 'downPaymentEnd'
        When I clear 'inputFieldInParameters' and input 'selectDownpayment' value from 'charts' at ''
        And I click on 'saveDownPaymentInputBtn' Button in Quotation Parameters
        Then I verify 'disclaimer' should be visible in Quotation Parameters
        And I verify 'discardChangesBtn' should be visible in Quotation Parameters
        And I verify 'recalculateQuotationBtn' should be visible in Quotation Parameters
        When I click on 'discardChangesBtn' Button in Quotation Parameters
        Then I verify 'financeDownpayment' in 'charts' at '' has value of 'downPayment'