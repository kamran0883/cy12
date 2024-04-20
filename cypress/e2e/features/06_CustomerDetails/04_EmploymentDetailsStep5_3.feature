Feature: Order Creation in Dealer Portal - Employment & Other Information Step 5.2

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

    @lane-regression
    Scenario: Verify all the fields under employment and employment address details sections
        When I click on 'employmentDetailsBtn' on Employment Details Screen
        Then I verify 'employmentType' should be visible on Employment Details Screen
        And I verify 'defaultAnnualOtherIncomeFeild' should be visible on Employment Details Screen
        And I verify 'defaultSourceOfOtherIncome' should be visible on Employment Details Screen
        And I verify 'employmentAddressLineOne' should be visible on Employment Details Screen
        And I verify 'employmentAddressCity' should be visible on Employment Details Screen
        And I verify 'employmentAddressState' should be visible on Employment Details Screen
        And I verify 'employmentAddressZipCode' should be visible on Employment Details Screen
        And I verify 'employmentAddressCounty' should be visible on Employment Details Screen
        And I verify 'saveEmploymentDetailsBtn' should be visible on Employment Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Validate the properties and constraints of all the fields when Employed is selected for Employment Type
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
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Validate the properties and constraints of all the fields when Self Employed is selected for Employment Type
        When I click on 'employmentDetailsBtn' on Employment Details Screen
        Then I verify 'employmentType' should be visible on Employment Details Screen
        When I select 'employmentType' from 'dropdownList' dropdown of 'employmentType' at index '1' on Employment Details Screen
        And I input 'selfEmpAnnualOtherIncome' in 'selfEmpAnnualOtherIncome' at index '1' on Employment Details Screen
        And I input 'selfEmpSourceOfOtherIncome' in 'selfEmpSourceOfOtherIncome' at index '1' on Employment Details Screen
        And I input 'employmentAddressLineOne' in 'employmentAddressLineOne' at index '1' on Employment Details Screen
        And I input 'employmentAddressCity' in 'employmentAddressCity' at index '1' on Employment Details Screen
        And I select 'employmentAddressState' from 'dropdownList' dropdown of 'employmentAddressState' at index '1' on Employment Details Screen
        And I input 'employmentAddressZipCode' in 'employmentAddressZipCode' at index '1' on Employment Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        Then I verify 'saveEmploymentDetailsBtn' should be visible on Employment Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Validate the properties and constraints of all the fields when Retired is selected for Employment Type
        When I click on 'employmentDetailsBtn' on Employment Details Screen
        Then I verify 'employmentType' should be visible on Employment Details Screen
        When I select 'employmentType' from 'dropdownList' dropdown of 'employmentType' at index '2' on Employment Details Screen
        And I input 'selfEmpAnnualOtherIncome' in 'selfEmpAnnualOtherIncome' at index '2' on Employment Details Screen
        And I input 'selfEmpSourceOfOtherIncome' in 'selfEmpSourceOfOtherIncome' at index '2' on Employment Details Screen
        And I input 'employmentAddressLineOne' in 'employmentAddressLineOne' at index '2' on Employment Details Screen
        And I input 'employmentAddressCity' in 'employmentAddressCity' at index '2' on Employment Details Screen
        And I select 'employmentAddressState' from 'dropdownList' dropdown of 'employmentAddressState' at index '2' on Employment Details Screen
        And I input 'employmentAddressZipCode' in 'employmentAddressZipCode' at index '2' on Employment Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        Then I verify 'saveEmploymentDetailsBtn' should be visible on Employment Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Validate the properties and constraints of all the fields when Not Employed is selected for Employment Type
        When I click on 'employmentDetailsBtn' on Employment Details Screen
        Then I verify 'employmentType' should be visible on Employment Details Screen
        When I select 'employmentType' from 'dropdownList' dropdown of 'employmentType' at index '3' on Employment Details Screen
        And I input 'selfEmpAnnualOtherIncome' in 'selfEmpAnnualOtherIncome' at index '3' on Employment Details Screen
        And I input 'selfEmpSourceOfOtherIncome' in 'selfEmpSourceOfOtherIncome' at index '3' on Employment Details Screen
        And I input 'employmentAddressLineOne' in 'employmentAddressLineOne' at index '3' on Employment Details Screen
        And I input 'employmentAddressCity' in 'employmentAddressCity' at index '3' on Employment Details Screen
        And I select 'employmentAddressState' from 'dropdownList' dropdown of 'employmentAddressState' at index '3' on Employment Details Screen
        And I input 'employmentAddressZipCode' in 'employmentAddressZipCode' at index '3' on Employment Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        Then I verify 'saveEmploymentDetailsBtn' should be visible on Employment Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'