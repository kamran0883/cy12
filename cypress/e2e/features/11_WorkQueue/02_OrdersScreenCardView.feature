Feature: Order Creation in Dealer Portal - WorkQueue (Orders screen) - Card View

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
        And I read data and Locator files for Work Queue Orders Screen Card View
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
        When I save 'leaseEstimatedPeriodicPayment' as 'leaseEstimatedPeriodicPayment' in data file
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
        Then I verify 'customerDetailsScreenHdr' should be visible on Contact Details Screen
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
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I input 'moveInDate' in 'moveInDate' feild on Customer Details Screen
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

    #---------------------TC-24709-------------------#
    @lane-regression
    Scenario: Verify the Filters
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
        And I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByExpiryDate' from 'searchListBox' Options in List View on Orders Screen
        And I input 'expiryDate' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        And I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchBySellingPrice' from 'searchListBox' Options in List View on Orders Screen
        And I input 'sellingPrice' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        Then I verify 'sellingPrice' on card for List View on Orders Screen
        When I hover over the 'vehicleCard' on Card View on Order Screen
        And I click on 'ellipsisBtnOnCard' button for Card View on Orders Screen
        And I select 'cancelOrderOption' from 'cardEllpisMenuOptions' Options for Card View on Orders Screen
        And I click on 'cancelOrderBtn' button for Card View on Orders Screen
        Then I verify 'orderSummaryHeader' should have 'orderCancelledSummaryHdr' for Card View on Orders Screen

    #---------------------TC-24710-------------------#
    #---------------------TC-24711-------------------#
    #---------------------TC-24712-------------------#
    #---------------------TC-24717-------------------#
    #---------------------TC-24718-------------------#
    #---------------------TC-24723-------------------#
    @lane-regression
    Scenario: Verify the Card View and Order Details
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'gridViewBtn' from Orders Screen
        Then I verify 'listViewTable' should be visible for Card View on Orders Screen
        When I click on 'gridViewBtn' from Orders Screen
        Then I verify 'cardsList' should be visible for Card View on Orders Screen
        When I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByOrderID' from 'searchListBox' Options in List View on Orders Screen
        And I input 'orderID' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        Then I verify 'orderID' on card for List View on Orders Screen
        And I verify 'sellingPrice' on card for List View on Orders Screen
        And I verify 'assetName' on card for List View on Orders Screen
        When I hover over the 'vehicleCard' on Card View on Order Screen
        Then I verify 'viewEditOrderBtn' should be visible for Card View on Orders Screen
        And I verify 'ellipsisBtnOnCard' should be visible for Card View on Orders Screen
        When I click on 'ellipsisBtnOnCard' button for Card View on Orders Screen
        Then I verify 'cardEllpisMenuOptions' should be visible for Card View on Orders Screen
        And I verify ellipsis menu options have the 'orderSummaryOption' options on Card View on Orders Screen
        And I verify ellipsis menu options have the 'cancelOrderOption' options on Card View on Orders Screen
        When I select 'cancelOrderOption' from 'cardEllpisMenuOptions' Options for Card View on Orders Screen
        And I click on 'cancelOrderBtn' button for Card View on Orders Screen
        Then I verify 'orderSummaryHeader' should have 'orderCancelledSummaryHdr' for Card View on Orders Screen

    #---------------------TC-24720-------------------#
    #---------------------TC-24722-------------------#
    @lane-regression
    Scenario: Verify the View/Edit Option
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'searchBtn' button for List View on Orders Screen
        And I click on 'searchDropDownBtn' button for List View on Orders Screen
        And I select 'searchByOrderID' from 'searchListBox' Options in List View on Orders Screen
        And I input 'orderID' in Search Area Input Field
        And I click on 'applySearchBtn' button for List View on Orders Screen
        Then I verify 'orderID' on card for List View on Orders Screen
        When I hover over the 'vehicleCard' on Card View on Order Screen
        Then I verify 'viewEditOrderBtn' should be visible for Card View on Orders Screen
        When I click on 'viewEditOrderBtn' button for Card View on Orders Screen
        Then I verify 'orderSummaryHeader' should have 'orderApprovedSummaryHdr' for Card View on Orders Screen
        When I click on 'ellipsisBtnOnOrderDetailsScreen' button for Card View on Orders Screen
        And I select 'cancelOrderOption' from 'cardEllpisMenuOptions' Options for Card View on Orders Screen
        And I click on 'cancelOrderBtn' button for Card View on Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'