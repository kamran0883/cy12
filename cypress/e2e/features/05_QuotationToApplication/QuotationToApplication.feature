Feature: Order Creation in Dealer Portal - Quotation To Application Step 4

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
        And I read data and Locator files for Quotation Comparison Step 3.6
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

    #--The Feature Statements being used in this file are reused from QuotationComaprison.feature
    #--and QuotationComparisonStep3_1.feature files
    #--Therefore no Spec file or StepDef file was written for automation of QuotationToApplication feature

    @lane-regression
    Scenario: Verify Saving Quote Comparison
        Then I verify 'saveOrderBtn' should be visible on Create Quotation screen
        When I click on 'saveOrderBtn' Button on Create Quotation Screen
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

    @lane-regression
    Scenario: Verify Quote Comparison in Work Queue
        When I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I click on "workQueueScreenBtn" Button on Create Quotation Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeQuotationValue' in Work Queue
        And I verify order 'requestStatusValue' should be 'draftStatusValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Verify Reference Number on Unsaved Quote Conversion
        When I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
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
    Scenario: Verify selecting Quote for Application
        When I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I save 'orderID' as 'orderID' in data file
        And I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeApplicationValue' in Work Queue
        And I verify order 'requestStatusValue' should be 'draftStatusValue' in Work Queue
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Verify Asset Availablity for Application
        When I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'
        When I visit Lane Work Queue Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeQuotationValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        And I wait for Quotation Calculation calls to complete
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Verify Application Request Type Change
        When I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'orderID' as 'orderID' in data file
        And I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeQuotationValue' in Work Queue
        And I verify order 'requestStatusValue' should be 'draftStatusValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        And I wait for Quotation Calculation calls to complete
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeApplicationValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'

    @lane-regression
    Scenario: Verify Asset Status Change on Application
        When I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I save 'orderID' as 'orderID' in data file
        And I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetNotAvailableStatusValue'
        When I visit Lane Work Queue Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    @lane-regression
    Scenario: Verify Application Stage Handling
        When I click on 'selectFinanceQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I click on 'createQuotationScreenBtn' from Customer Details Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeApplicationValue' in Work Queue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledToastMsg'