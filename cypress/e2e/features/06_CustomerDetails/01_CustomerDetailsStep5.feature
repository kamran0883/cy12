Feature: Order Creation in Dealer Portal - Customer Details Step 5

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
        And I read data and locator files for Customer Contact Details Step 5
        And I read data and Locator files for License Details Step 5.1
        And I read data and locator files for Employment Details Step 5_2
        And I read data and Locator files for Personal Finance Step 5.3
        And I read data and Locator files for Fraud Check Step 5.4
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
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'

    @lane-regression @lane-sanity
    Scenario: Verify user is able to add Customer Details Successfully
        When I save 'orderID' as 'orderID' in data file
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
        And I select Garaging Address same as Mailing Address Checkbox
        And I click on 'saveContactDetailsBtn' on Customer Details Screen
        Then I verify 'licenseDetailsHdr' is visible on License Details page
        When I upload 'licenseFront' image on 'licenseFrontImageSideDialogBox' on License Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        And I click on 'removeLicenseBackImage' Button on license Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        Then I verify license-verification API response
        And I verify 'licenseFirstName' should have the value of 'licenseFirstName' on License Details Page
        And I verify 'licenseLastName' should have the value of 'licenseLastName' on License Details Page
        And I verify 'licenseNumber' should have the value of 'licenseNumber' on License Details Page
        And I verify 'licenseIssueState' should have the value of 'licenseIssueState' on License Details Page
        And I verify 'licenseExpirationDate' should have the value of 'licenseExpirationDate' on License Details Page
        And I verify 'dateofBirth' should have the value of 'dateofBirth' on License Details Page
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
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'