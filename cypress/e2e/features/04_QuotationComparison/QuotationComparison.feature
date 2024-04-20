Feature: Order Creation In Dealer Portal - Quotation parameters and Comparison Step 3

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane
        And I read data files for Quotation Comparison
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

    #------TC-5668--TC-5670--TC-5671----are-pending-as-these-funcionalitites-are-not-developed-yet--#

    @lane-regression
    Scenario: Validate Create Quotation screen from Order Creation in Dealer Portal
        Then I verify 'activeScreenBtn' should be visible on Create Quotation screen
        And I verify 'expiryDateHeader' should be visible on Create Quotation screen
        And I verify 'productDetailsHeader' should be visible on Create Quotation screen
        And I verify 'quotationParameters' should be visible on Create Quotation screen
        And I verify 'selectQuoteBtn' should be visible on Create Quotation screen
        And I verify 'saveOrderBtn' should be visible on Create Quotation screen

    @lane-regression
    Scenario: Validate View Vehicle Details button on Create Quotation Screen
        When I click on "viewVehicleDetailsBtn" Button on Create Quotation Screen
        Then I verify 'vehicleDetailsHeader' should be visible on Create Quotation screen
        And I verify 'vehicleNameHeader' should contain 'assetName' on Vehicle Details Popup
        And I verify 'vehiclePriceInfoHeader' should contain 'sellingPriceHeaderText' on Create Quotation screen
        And I verify 'imageOnVehicleDetailsPopup' should be visible on Create Quotation screen
        And I verify 'featuresHeader' should be visible on Create Quotation screen

    @lane-regression
    Scenario: Validate Configure Quotation button from Create Quotation screen in Dealer Portal
        Then I verify 'quotationParametersHeader' should be visible on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        And I verify 'defaultTerms' of 'dealerProfile' at '' on Quotation Drawer
        And I verify 'leaseDownPaymentInput' on Quotation Drawer
        And I verify 'financeDownPaymentInput' on Quotation Drawer
        And I verify 'creditScore' of 'direct' at '' on Quotation Drawer
        And I verify 'vehicleMileage' of 'direct' at '' on Quotation Drawer
        And I verify 'paymentFrequency' of 'programs' at '0' on Quotation Drawer
        And I verify 'assetUsage' of 'direct' at '' on Quotation Drawer
        And I verify 'scheduleOption' of 'dealerProfile' at '' on Quotation Drawer

    @lane-regression
    Scenario: Validate Configure Quotation pop-up from Create Quotation screen in Dealer Portal
        Then I verify 'quotationParametersHeader' should contain 'quotationHeaderText' on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I edit downpayment of 'leaseDownPaymentInput' on Quotation Drawer
        And I edit downpayment of 'financeDownPaymentInput' on Quotation Drawer
        And I select 'selectCreditScore' value of 'direct' of 'creditScore' at '' on Quotation Drawer
        And I select 'selectMileage' value of 'dealerProfile' of 'vehicleMileage' at '' on Quotation Drawer
        And I select 'selectFrequency' value of 'programs' of 'paymentFrequency' at '0' on Quotation Drawer
        And I select 'selectAssetUsage' value of 'direct' of 'assetUsage' at '' on Quotation Drawer
        And I select 'selectScehuleOption' value of 'dealerProfile' of 'scheduleOption' at '' on Quotation Drawer
        Then I verify 'updateQuotationBtn' should be visible on Create Quotation screen

    @lane-regression
    Scenario: Validate Update Quotation button from Create Quotation screen in Dealer Portal
        Then I verify 'quotationParametersHeader' should contain 'quotationHeaderText' on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I edit downpayment of 'leaseDownPaymentInput' on Quotation Drawer
        And I edit downpayment of 'financeDownPaymentInput' on Quotation Drawer
        And I select 'selectCreditScore' value of 'direct' of 'creditScore' at '' on Quotation Drawer
        And I select 'selectMileage' value of 'dealerProfile' of 'vehicleMileage' at '' on Quotation Drawer
        And I select 'selectFrequency' value of 'programs' of 'paymentFrequency' at '0' on Quotation Drawer
        And I select 'selectAssetUsage' value of 'direct' of 'assetUsage' at '' on Quotation Drawer
        And I select 'selectScehuleOption' value of 'dealerProfile' of 'scheduleOption' at '' on Quotation Drawer
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'termsInFinanceProg' has udpated value of 'selectTerms' from 'dealerProfile' at '' on Quotation Parameters
        And I verify downpayment value in 'downPaymentInFinance' on Quotation Parameters
        And I verify downpayment value in 'downPaymentInLease' on Quotation Parameters
        And I verify 'termsInLeaseProg' has udpated value of 'selectTerms' from 'dealerProfile' at '' on Quotation Parameters
        And I verify 'mileageInLeaseProg' has udpated value of 'selectMileage' from 'dealerProfile' at '' on Quotation Parameters

    @lane-sanity   @lane-regression
    Scenario: Validate Quotation Validity Date from Create Quotation screen in Dealer Portal
        Then I verify Quotation Validity Date

    @lane-regression
    Scenario: Validate User is able to go back from Create Quotation screen and select another asset
        Then I verify 'vinNumber' of Selected Asset on Vehicle Details Section
        When I visit Index and get details of 'second' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        Then I verify Consent Checkbox should 'not' auto-checked
        When I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I select multiple filters and click Apply filters button
        And I hover over the shortlisted vehicle card
        And I Select and Continue with any of the shortlisted asset
        And I land on Create Quotation screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'vinNumber' of Selected Asset on Vehicle Details Section

    @lane-regression
    Scenario: Validate 'Choose' button from Create Quotation screen in Dealer Portal
        When I save 'financeProgramName' as 'programName' in data file
        And I click on 'selectFinanceQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        And I verify selected finance type
        When I click on 'createQuotationScreenBtn' from Customer Details Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I save 'orderID' as 'orderID' in data file
        And I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Validate 'Save Order' button from Create Quotation screen in Dealer Portal
        Then I verify 'saveOrderBtn' should be visible on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I edit downpayment of 'leaseDownPaymentInput' on Quotation Drawer
        And I edit downpayment of 'financeDownPaymentInput' on Quotation Drawer
        And I select 'selectCreditScore' value of 'direct' of 'creditScore' at '' on Quotation Drawer
        And I select 'selectMileage' value of 'dealerProfile' of 'vehicleMileage' at '' on Quotation Drawer
        And I select 'selectFrequency' value of 'programs' of 'paymentFrequency' at '0' on Quotation Drawer
        And I select 'selectAssetUsage' value of 'direct' of 'assetUsage' at '' on Quotation Drawer
        And I select 'selectScehuleOption' value of 'dealerProfile' of 'scheduleOption' at '' on Quotation Drawer
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I click on "workQueueScreenBtn" Button on Create Quotation Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestStatusValue' should be 'draftStatusValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression @lane-sanity
    Scenario: Validate 'Save Order' button from Create Quotation screen in Dealer Portal
        When I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'listingStatusValue' should have 'notListedStatusValue'
        And I verify 'assetAvailablityStatus' should have 'assetNotAvailableStatusValue'
        When I visit Lane Work Queue Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestStatusValue' should be 'draftStatusValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Validate 'Cancel' button from Create Quotation screen in Dealer Portal
        Then I verify 'saveOrderBtn' should be visible on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I edit downpayment of 'leaseDownPaymentInput' on Quotation Drawer
        And I edit downpayment of 'financeDownPaymentInput' on Quotation Drawer
        And I select 'selectCreditScore' value of 'direct' of 'creditScore' at '' on Quotation Drawer
        And I select 'selectMileage' value of 'dealerProfile' of 'vehicleMileage' at '' on Quotation Drawer
        And I select 'selectFrequency' value of 'programs' of 'paymentFrequency' at '0' on Quotation Drawer
        And I select 'selectAssetUsage' value of 'direct' of 'assetUsage' at '' on Quotation Drawer
        And I select 'selectScehuleOption' value of 'dealerProfile' of 'scheduleOption' at '' on Quotation Drawer
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I click on 'ellipsisBtnOnQuotationScreen' Button on Create Quotation Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledOnQuotationToast'
        When I click on 'cancelledOrdersGridViewBtn' from Orders Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'cancelledReasonText' should be 'cancelledReasonValue' in Work Queue

    @lane-regression
    Scenario: Validate system behavior upon leaving Create Quotation screen without Saving Order
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I edit downpayment of 'leaseDownPaymentInput' on Quotation Drawer
        And I edit downpayment of 'financeDownPaymentInput' on Quotation Drawer
        And I select 'selectCreditScore' value of 'direct' of 'creditScore' at '' on Quotation Drawer
        And I select 'selectMileage' value of 'dealerProfile' of 'vehicleMileage' at '' on Quotation Drawer
        And I select 'selectFrequency' value of 'programs' of 'paymentFrequency' at '0' on Quotation Drawer
        And I select 'selectAssetUsage' value of 'direct' of 'assetUsage' at '' on Quotation Drawer
        And I select 'selectScehuleOption' value of 'dealerProfile' of 'scheduleOption' at '' on Quotation Drawer
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        Then I verify 'vinNumber' of Selected Asset on Vehicle Details Section
        When I click on 'chooseAssetScreenBtn' Button on Create Quotation Screen
        And I visit Index and get details of 'second' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        Then I verify Consent Checkbox should 'not' auto-checked
        When I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I select multiple filters and click Apply filters button
        And I hover over the shortlisted vehicle card
        And I Select and Continue with any of the shortlisted asset
        And I land on Create Quotation screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'createQuotationScreenHeader' should contain 'createQuotationScreenHdrText'