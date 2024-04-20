Feature: Order Creation in Dealer Portal - Personal Finance Details Step 5.3

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
              And I read data and locator files for Employment Details Step 5_2
              And I read data and Locator files for Personal Finance Step 5.3
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

       #---------------TC-24331---------------#
       @lane-regression
       Scenario: To validate the constraints of the fields
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '0' and verify monthly payment field existence
              And I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '1' and verify monthly payment field existence
              And I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '2' and verify monthly payment field existence
              And I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '3' and verify monthly payment field existence
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              And I verify the Radio button for 'noRadioButton' should be selected by Default
              And I verify 'saveFinanceDetailsBtn' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24333---------------#
       @lane-regression
       Scenario: Validate that user is able to select Mortgage, input amount and check bank question
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '0' and verify monthly payment field existence
              And I input 'monthlyPayment' in 'monthlyPayment' at index '0' on Personal Finance page
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              When I get 'bankRadioBtn' section and check 'bankRadioBtn' at index '0' on Personal Finance page
              Then I verify 'saveFinanceDetailsBtn' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24337---------------#
       @lane-regression
       Scenario: Validate that user is able to select Renting, input amount and check bank question
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '1' and verify monthly payment field existence
              And I input 'monthlyPayment' in 'monthlyPayment' at index '1' on Personal Finance page
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              When I get 'bankRadioBtn' section and check 'bankRadioBtn' at index '1' on Personal Finance page
              Then I verify 'saveFinanceDetailsBtn' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24327---------------#
       @lane-regression
       Scenario: Validate that user is able to select Personal Ownership and check bank question
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '2' and verify monthly payment field existence
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              When I get 'bankRadioBtn' section and check 'bankRadioBtn' at index '2' on Personal Finance page
              Then I verify 'saveFinanceDetailsBtn' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24327---------------#
       @lane-regression
       Scenario: Validate that user is able to select With Relatives and check bank question
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '3' and verify monthly payment field existence
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              When I get 'bankRadioBtn' section and check 'bankRadioBtn' at index '3' on Personal Finance page
              Then I verify 'saveFinanceDetailsBtn' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24326---------------#
       @lane-regression
       Scenario: User should land on Personal Finance Details after completing Employment Details
              When I click on 'employmentDetailsBtn' on Employment Details Screen
              Then I verify 'employmentType' should be visible on Employment Details Screen
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
              When I click on 'verifyAddressBtn' on Customer Details Screen
              Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
              When I click on 'confirmAddressBtn' on Customer Details Screen
              And I click on 'saveEmploymentDetailsBtn' on Employment Details Screen
              Then I verify 'personalDetailsHeader' is visible on Personal Finance page
              When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

       #---------------TC-24340---------------#
       #---------------TC-24339---------------#
       @lane-regression
       Scenario: To verify the application is submitted for fraud check if configured
              When I click on 'personalFinanceDetailsBtn' on Personal Finance Screen
              Then I verify 'residence' is visible on Personal Finance page
              When I select 'residence' from 'residenceDropDownList' dropdown of 'residence' at index '2' and verify monthly payment field existence
              Then I verify 'bankruptcyQuestion' is visible on Personal Finance page
              And I verify the Radio button for 'noRadioButton' should be selected by Default
              When I click on 'saveFinanceDetailsBtn' on Personal Finance Screen
              And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
              Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
              When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
              And I click on 'cancelOrderBtn' from Orders Screen
              Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'