Feature: Order Creation in Dealer Portal - WorkQueue (Orders screen) - List View

    Background: User should be able to View Orders Screen
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
        And I read data and locator files for Customer Contact Details Step 5
        And I read data and Locator files for License Details Step 5.1
        And I read data and locator files for Employment Details Step 5_2
        And I read data and Locator files for Personal Finance Step 5.3
        And I read data and Locator files for Fraud Check Step 5.4
        And I read data and Locator files for Submission Flow after Fraud Check Step 6
        And I read data and Locator files for Order Summary Step 7
        And I read data and Locator files for Cancelled Order Flow
        And I read data and Locator files for Work Queue Orders Screen List View
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
        Then I verify Dealer Options should be visible on Quotation Screen
        And I save 'leaseEstimatedPeriodicPayment' as 'leaseEstimatedPeriodicPayment' in data file
        And I save 'leaseDueAtSigningValue' as 'leaseDueAtSigningValue' in data file
        And I save 'leaseAnnualMileage' as 'leaseAnnualMileage' in data file
        And I save 'leaseSellingPrice' as 'leaseSellingPrice' in data file
        And I save 'leaseDownpaymentValue' as 'leaseDownpaymentValue' in data file
        And I save 'leaseOptionsValue' as 'leaseOptionsValue' in data file
        And I save 'totalFeesInLease' as 'totalFeesInLease' in data file
        And I save 'leaseProgFinanceAmount' as 'leaseProgFinanceAmount' in data file
        And I click on 'saveOrderBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save Order Creation Date in Quotation Data File
        And I verify Quotation Validity Date
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I save 'orderID' as 'orderID' in data file
        And I get the program type and save it in Data File
        And I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        And I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
        And I input 'mailingAddressCity' in 'mailingAddressCity' feild on Customer Details Screen
        And I select 'mailingAddressState' from 'stateDropDown' dropdown list of 'mailingAddressState' on Customer Details Screen
        And I input 'mailingAddressZipCode' in 'mailingAddressZipCode' feild on Customer Details Screen
        And I input 'moveInDate' in 'moveInDate' feild on Customer Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        Then I verify duration of stay for Contact Details Screen
        When I select Garaging Address same as Mailing Address Checkbox
        And I click on 'saveContactDetailsBtn' on Customer Details Screen
        Then I verify 'licenseDetailsHdr' is visible on License Details page
        When I upload 'licenseFront' image on 'licenseFrontImageSideDialogBox' on License Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        And I click on 'removeLicenseBackImage' Button on license Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        Then I verify license-verification API response
        When I click on 'saveLicenseDetailsBtn' Button on license Details Page
        Then I verify 'employmentDetailsHdr' is visible on License Details page
        And I verify 'employmentType' should be visible on Employment Details Screen
        When I select 'employmentType' from 'dropdownList' dropdown of 'employmentType' at index '0' on Employment Details Screen
        And I input 'employerName' in 'employerName' at index '0' on Employment Details Screen
        And I input 'employerPhoneNumber' in 'employerPhoneNumber' at index '0' on Employment Details Screen
        And I input 'occupation' in 'occupation' at index '0' on Employment Details Screen
        And I input 'employedSince' in 'employedSince' at index '0' on Employment Details Screen
        Then I verify duration of employment for Employment Details Screen
        When I input 'annualEmploymentIncome' in 'annualEmploymentIncome' at index '0' on Employment Details Screen
        And I input 'annualOtherIncome' in 'annualOtherIncome' at index '0' on Employment Details Screen
        And I input 'sourceOfOtherIncome' in 'sourceOfOtherIncome' at index '0' on Employment Details Screen
        And I input 'employmentAddressLineOne' in 'employmentAddressLineOne' at index '0' on Employment Details Screen
        And I input 'employmentAddressCity' in 'employmentAddressCity' at index '0' on Employment Details Screen
        And I select 'employmentAddressState' from 'dropdownList' dropdown of 'employmentAddressState' at index '0' on Employment Details Screen
        And I input 'employmentAddressZipCode' in 'employmentAddressZipCode' at index '0' on Employment Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I click on 'saveEmploymentDetailsBtn' on Employment Details Screen
        Then I verify 'personalDetailsHeader' is visible on Personal Finance page
        When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
        Then I verify 'residence' is visible on Personal Finance page
        When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '2' and verify monthly payment field existence
        Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
        When I get 'bankRadioBtn' section and check 'bankRadioBtn' at index '2' on Personal Finance page
        And I click on 'saveFinanceDetailsBtn' on Personal Finance Screen
        Then I verify 'submitOrderBtn' should be enabled on Personal Finance Details
        When I click on 'submitOrderBtn' on Personal Finance Screen
        Then I verify fraud check is 'passed' based on Fraud Check API response
        And I verify 'submitCreditAppBtn' should be enabled after Fraud Check
        When I click on 'submitCreditAppBtn' for Submission Flow After Fraud Check
        Then I validate if Order Status is 'Approved' based upon Credit Request API response

    #---------------------TC-24579-------------------#
    @lane-regression
    Scenario: Verify user can double click the List to open the quotation
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'switchViewBtn' button for List View on Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        When I double click on filtered Order row in List View on Order Screen
        Then I verify 'orderSummaryPageHeader' should 'be' visible for List View on Orders Screen
        When I click on 'ellipsisBtnOnApprovedOrder' button for List View on Orders Screen
        And I select 'cancelOrderOption' from 'ellipsisMenuOptionsOnApprovedOrder' Options in List View on Orders Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledOnQuotationToast'

    #---------------------TC-24680-------------------#
    @lane-regression
    Scenario: Verify the columns in the List View
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'switchViewBtn' button for List View on Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify 'listViewTable' should 'be' visible for List View on Orders Screen
        And I verify 'requestTypeFilter' filter should be visible for List View on Orders Screen
        And I verify 'orderIdFilter' filter should be visible for List View on Orders Screen
        And I verify 'requestStatusFilter' filter should be visible for List View on Orders Screen
        And I verify 'yearMakeModelTrimFilter' filter should be visible for List View on Orders Screen
        And I verify 'vinFilter' filter should be visible for List View on Orders Screen
        And I verify 'stockNumberFilter' filter should be visible for List View on Orders Screen
        And I verify 'customerNameFilter' filter should be visible for List View on Orders Screen
        And I verify 'financeTypeFilter' filter should be visible for List View on Orders Screen
        And I verify 'sellingPriceFilter' filter should be visible for List View on Orders Screen
        And I verify 'programNameFilter' filter should be visible for List View on Orders Screen
        And I verify 'creationDateFilter' filter should be visible for List View on Orders Screen
        And I verify 'expiryDateFilter' filter should be visible for List View on Orders Screen
        When I click on 'ellipsisBtn' button for List View on Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderSummaryPageHeader' should 'be' visible for List View on Orders Screen
        And I verify 'orderSummaryPageHeader' should have 'orderCancelledHdrText' for List View on Orders Screen

    #---------------------TC-24681-------------------#
    #---------------------TC-24682-------------------#
    #---------------------TC-24685-------------------#
    #---------------------TC-24686-------------------#
    #---------------------TC-24687-------------------#
    #---------------------TC-24688-------------------#
    #---------------------TC-24690-------------------#
    #---------------------TC-24693-------------------#
    #---------------------TC-24696-------------------#
    #---------------------TC-24701-------------------#
    #---------------------TC-24702-------------------#
    @lane-regression
    Scenario: Verify Request Type, Request Status, Asset Info, Finance Type, Selling Price, Order Creation Date and Ellipsi Menu Options
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'switchViewBtn' button for List View on Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeApplicationValue' in Work Queue
        And I verify order 'requestStatusValue' should be 'approvedRequestStatusValue' in Work Queue
        And I verify asset 'yearMakeModelTrim' should be 'vehicleName' in List View on Orders Screen
        And I verify asset 'vinNumber' should be 'vinNumber' in List View on Orders Screen
        And I verify asset 'stockNumber' should be 'stockNumber' in List View on Orders Screen
        And I verify 'customerName' in Customer Name Column in List View on Orders Screen
        And I verify 'financeType' in Finance Type Column in List View on Orders Screen
        And I verify 'selllingPrice' in Selling Price Column in List View on Orders Screen
        And I verify Order Creation Date in List View on Orders Screen
        When I click on 'ellipsisBtn' button for List View on Orders Screen
        Then I verify 'viewEditOrderOption' button on Ellipsis Menu Options for List View on Orders Screen
        And I verify 'orderSummaryOption' button on Ellipsis Menu Options for List View on Orders Screen
        And I verify 'cancelOrderOption' button on Ellipsis Menu Options for List View on Orders Screen
        When I select 'viewEditOrderOption' from 'ellipsisMenueOptions' Options in List View on Orders Screen
        Then I verify 'orderSummaryPageHeader' should 'be' visible for List View on Orders Screen
        When I click on 'ellipsisBtnOnApprovedOrder' button for List View on Orders Screen
        And I select 'cancelOrderOption' from 'ellipsisMenuOptionsOnApprovedOrder' Options in List View on Orders Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' should contain 'orderCancelledOnQuotationToast'

    #---------------------TC-24705-------------------#
    @lane-regression
    Scenario: Verify Cancel Option
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'switchViewBtn' button for List View on Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'requestType' should be 'requestTypeApplicationValue' in Work Queue
        When I click on 'ellipsisBtn' button for List View on Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderSummaryPageHeader' should have 'orderCancelledHdrText' for List View on Orders Screen

    #---------------------TC-33682-------------------#
    @lane-regression
    Scenario: Work Queue Screen Filters
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByOrderID' from 'searchListBox' Options in List View on Orders Screen
        And I input 'orderID' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        Then I verify 'orderID' on card for List View on Orders Screen
        When I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByCreationDate' from 'searchListBox' Options in List View on Orders Screen
        And I input 'creationDate' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        When I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByExpiryDate' from 'searchListBox' Options in List View on Orders Screen
        And I input 'expiryDate' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        # Then I verify 'expiryDate' on card for List View on Orders Screen
        When I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchBySellingPrice' from 'searchListBox' Options in List View on Orders Screen
        And I input 'sellingPrice' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        Then I verify 'sellingPrice' on card for List View on Orders Screen