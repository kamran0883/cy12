Feature: Approved: Payment Received Indicator and Documents

    Background: User should be able Submit the Order for Credit Approval
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
        And I read data and locator files for Payment Indicator and Contracting Documents
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
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should be visible on Contact Details Screen
        And I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
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
        Then I verify duration of stay for Contact Details Screen
        When I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
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

    #---------------------TC-25124-------------------#
    #---------------------TC-25126-------------------#
    #---------------------TC-25127-------------------#
    #---------------------TC-25128-------------------#
    #---------------------TC-25129-------------------#
    #---------------------TC-25130-------------------#
    @lane-regression
    Scenario: Verify Contracting Documents and Perform On Screen Signature
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I verify order 'requestStatusValue' should be 'approvedRequestStatusValue' in Work Queue
        And I click on 'ellipsisBtn' from Orders Screen
        And I select 'viewEditOrderOption' from 'ellipsisMenueOptions' Options in List View on Orders Screen
        Then I verify 'orderSummaryPageHeader' should have 'orderApprovedHdrTxt' for List View on Orders Screen
        And I verify 'contractingDocumentsSection' should be visible for Contracting Documents and Payment Indicator
        And I verify 'paymentDetailsSection' should be visible for Contracting Documents and Payment Indicator
        And I verify payment Checkbox should 'not' checked
        When I click on 'financialServicesEllipsisBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signatureCanvas' on Contracting Documents and Payment Indicator Screen
        And I click on 'confirmSignatureBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signatureCanvas' on Contracting Documents and Payment Indicator Screen
        And I click on 'confirmSignatureBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify signature are placed on the Documents
        When I click on 'purchaseAgreementEllipsisBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify signature are placed on the Documents
        When I click on 'paymentCheckBox' on Contracting Documents and Payment Indicator Screen
        And I click on 'saveOrderBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify 'schedulePickupHdr' should be visible for Contracting Documents and Payment Indicator
        When I click on 'ellipsisBtnOnScheduleScreen' on Contracting Documents and Payment Indicator Screen
        And I click on 'cancelOrderOption' on Contracting Documents and Payment Indicator Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    #---------------------TC-25132-------------------#
    #---------------------TC-25133-------------------#
    #---------------------TC-25137-------------------#
    @lane-regression
    Scenario: Verify Schedule Order and the Cancel Order Option
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I verify order 'requestStatusValue' should be 'approvedRequestStatusValue' in Work Queue
        And I click on 'ellipsisBtn' from Orders Screen
        And I select 'viewEditOrderOption' from 'ellipsisMenueOptions' Options in List View on Orders Screen
        Then I verify 'orderSummaryPageHeader' should have 'orderApprovedHdrTxt' for List View on Orders Screen
        And I verify 'contractingDocumentsSection' should be visible for Contracting Documents and Payment Indicator
        And I verify 'paymentDetailsSection' should be visible for Contracting Documents and Payment Indicator
        And I verify payment Checkbox should 'not' checked
        When I click on 'financialServicesEllipsisBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signatureCanvas' on Contracting Documents and Payment Indicator Screen
        And I click on 'confirmSignatureBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signatureCanvas' on Contracting Documents and Payment Indicator Screen
        And I click on 'confirmSignatureBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify signature are placed on the Documents
        When I click on 'purchaseAgreementEllipsisBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'signBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify signature are placed on the Documents
        When I click on 'paymentCheckBox' on Contracting Documents and Payment Indicator Screen
        And I click on 'saveOrderBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify 'schedulePickupHdr' should be visible for Contracting Documents and Payment Indicator
        When I click on 'scheduleAppointmentBtn' on Contracting Documents and Payment Indicator Screen
        Then I verify 'inStorePickupBtn' should be visible for Contracting Documents and Payment Indicator
        And I verify 'deliveryToAddress' should be visible for Contracting Documents and Payment Indicator
        When I click on 'closeDialogBtn' on Contracting Documents and Payment Indicator Screen
        And I click on 'ellipsisBtnOnSummaryScreen' on Contracting Documents and Payment Indicator Screen
        And I click on 'cancelOrderOption' on Contracting Documents and Payment Indicator Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'