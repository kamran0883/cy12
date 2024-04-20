Feature: Financial Stipulations Handling on Receiving

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
        And I read data and Locator files for Submission Flow after Fraud Check Step 6
        And I read data and Locator files for Financial Stipulations
        And I read data and Locator files for Stipulations Handling on Receiving
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
        Then I verify 'quotationParametersHeader' should be visible on Create Quotation screen
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        Then I verify 'drawerHeader' should contain 'drawerHeaderText' on Create Quotation screen
        When I select 'selectTermsForConditioned' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I input 'sellingAmount' in 'sellingAmount' field on Configure Quotation page for Conditioned Order
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        Then I verify 'customerDetailsScreenHdr' should be visible on Contact Details Screen
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
        And I verify 'submitCreditAppBtn' should be enabled after Fraud Check
        When I click on 'submitCreditAppBtn' for Submission Flow After Fraud Check
        Then I validate if Order Status is 'Conditioned' based upon Credit Request API response

    # ---Test Case 24822 is not automated because non-financial stipulation functionality is blocked, bug is not resolved yet---
    #---- Test Cases 24819,24808, 24813 are not automated due to missing functonality---
    # ---Should be automated when functionality is implemented---


    #---------------------TC-24807-------------------#
    #---------------------TC-24810-------------------#
    #---------------------TC-24820-------------------#

    @lane-regression
    Scenario: Verify Financial Stipulations Received on Terms in Conditioned Order
        When I click on "workQueueScreenBtn" Button on Create Quotation Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify filtered orders Length on WorkQueue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        Then I verify 'financialStipulationsHdr' should be visible on Stipulations Screen
        And I verify 'nonFinancialStipulationsHdr' should be visible on Stipulations Screen
        And I verify 'termsStipulations' should have the 'termsStipulationsText' on Stipulations Screen for Financial Stipulations
        When I click on 'termsStipulations' on Financial Stipulations in Stipulations Screen
        And I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I select 'defaultTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I input 'lessSellingAmount' in 'sellingAmount' field on Configure Quotation page for Conditioned Order
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'ellipsisBtn' on Stipulations Screen
        And I click on 'saveOrderOptionsTxt' on Stipulations Screen
        And I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'cancelledOrderSummaryHdr' should be visible on Stipulations Screen

    #---------------------TC-24815-------------------#
    #---------------------TC-24817-------------------#
    #---------------------TC-24804-------------------#
    #---------------------TC-24821-------------------#
    #---------------------TC-24809-------------------#

    @lane-regression
    Scenario: Verify Financial Stipulations Received on Financed Amount in Conditioned Order
        When I click on "workQueueScreenBtn" Button on Create Quotation Screen
        And I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify filtered orders Length on WorkQueue
        When I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        Then I verify 'financialStipulationsHdr' should be visible on Stipulations Screen
        And I verify 'nonFinancialStipulationsHdr' should be visible on Stipulations Screen
        And I verify 'termsStipulations' should have the 'termsStipulationsText' on Stipulations Screen for Financial Stipulations
        And I verify 'financedAmountStipulations' should have the 'financedAmountStipulationsText' on Stipulations Screen for Financial Stipulations
        When I click on 'financedAmountStipulations' on Financial Stipulations in Stipulations Screen
        Then I verify 'estimatePaymentInfo' should be visible on Financial Stipulations Screen
        And I verify 'dueAtSigningInfo' should be visible on Financial Stipulations Screen
        And I verify 'termsInfo' should be visible on Financial Stipulations Screen
        And I verify 'rateInfo' should be visible on Financial Stipulations Screen
        And I verify 'annualMileageInfo' should be visible on Financial Stipulations Screen
        And I verify 'financedAmountInfo' should be visible on Financial Stipulations Screen
       And I verify 'financeAmountToolTipError' should be visible on Financial Stipulations Screen
       When I click on 'financeAmountToolTipError' on Financial Stipulations in Stipulations Screen
        Then I verify 'toolTipInfo' should have the 'toolTipInfoText' on Stipulations Screen for Financial Stipulations
        When I click on 'sellingPriceEditBtn' on Financial Stipulations in Stipulations Screen
        And I input 'lessSellingAmount' in 'sellingPrice' field on Configure Quotation page for Conditioned Order
        And I click on 'saveSellingPriceBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'downPaymentEditBtn' on Financial Stipulations in Stipulations Screen
        And I input 'downPayment' in 'downPayment' field on Configure Quotation page for Conditioned Order
        And I click on 'saveDownPaymentBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'rvBallonToggleBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'optionToggleBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'optionEditBtn' on Financial Stipulations in Stipulations Screen
        And I input 'option' in 'option' field on Configure Quotation page for Conditioned Order
        And I click on 'saveOptionsBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'feesToggleBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'processingFeeEditBtn' on Financial Stipulations in Stipulations Screen
        And I input 'processingFee' in 'processingFee' field on Configure Quotation page for Conditioned Order
        And I click on 'saveProcessingFeeBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'evaluationFeeEditBtn' on Financial Stipulations in Stipulations Screen
        And I input 'evaluationFee' in 'evaluationFee' field on Configure Quotation page for Conditioned Order
        And I click on 'saveEvaluationFeeBtn' on Financial Stipulations in Stipulations Screen
        And I click on 'recalculateBtn' on Financial Stipulations in Stipulations Screen
        And I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I select 'defaultTerms' value of 'dealerProfile' of 'defaultTerms' at '' on Quotation Drawer
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I click on 'ellipsisBtn' on Stipulations Screen
        And I click on 'saveOrderOptionsTxt' on Stipulations Screen
        And I click on "workQueueScreenBtn" from Customer Details Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'cancelOrderOptionText' from Ellipsis button Menu options
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'cancelledOrderSummaryHdr' should be visible on Stipulations Screen


