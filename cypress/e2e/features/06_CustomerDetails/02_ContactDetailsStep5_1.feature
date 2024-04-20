Feature: Order Creation in Dealer Portal - Contact Details & Address Step 5

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

    # ---Test Cases 25243, 25245, 25247 are not automated due to missing functonality---
    # ---Should be automated when functionality is implemented---

    @lane-regression
    Scenario: Verify the contents of the Contact Details page
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'prefix' should be visible on Contact Details Screen
        And I verify 'firstName' should be visible on Contact Details Screen
        And I verify 'middleName' should be visible on Contact Details Screen
        And I verify 'lastName' should be visible on Contact Details Screen
        And I verify 'suffix' should be visible on Contact Details Screen
        And I verify 'socialSecurityNumber' should be visible on Contact Details Screen
        And I verify 'emailAddress' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the optional fields of the Contact Details page
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'optionalFeild' of 'middleName' contains the text of 'optional'
        Then I verify 'optionalFeild' of 'suffix' contains the text of 'optional'
        Then I verify 'optionalFeild' of 'homePhoneNumber' contains the text of 'optional'
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the Email feild should be prepopulated and feild should be disbaled
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'emailAddress' should be disabled on Contact Details Screen
        And I verify 'emailAddress' should have the value of customer Email Address
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify user should be able to add Mailing Address
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
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify duration after Move in Date Input
        When I save 'orderID' as 'orderID' in data file
        And I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        Then I verify 'emailAddress' should have the value of customer Email Address
        When I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
        And I input 'mailingAddressCity' in 'mailingAddressCity' feild on Customer Details Screen
        And I select 'mailingAddressState' from 'stateDropDown' dropdown list of 'mailingAddressState' on Customer Details Screen
        And I input 'mailingAddressZipCode' in 'mailingAddressZipCode' feild on Customer Details Screen
        And I input 'moveInDate' in 'moveInDate' feild on Customer Details Screen
        Then I verify duration of stay for Contact Details Screen
        When I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that user should have the option to select Garaging Address is same as Mailing Address
        When I save 'orderID' as 'orderID' in data file
        And I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        Then I verify 'emailAddress' should have the value of customer Email Address
        When I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
        And I input 'mailingAddressCity' in 'mailingAddressCity' feild on Customer Details Screen
        And I select 'mailingAddressState' from 'stateDropDown' dropdown list of 'mailingAddressState' on Customer Details Screen
        And I input 'mailingAddressZipCode' in 'mailingAddressZipCode' feild on Customer Details Screen
        And I input 'moveInDate' in 'moveInDate' feild on Customer Details Screen
        Then I verify duration of stay for Contact Details Screen
        When I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I select Garaging Address same as Mailing Address Checkbox
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that user should be able to add different Garaging Address
        When I save 'orderID' as 'orderID' in data file
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        Then I verify 'emailAddress' should have the value of customer Email Address
        And I verify 'mailingAddressLineOne' should be visible on Contact Details Screen
        When I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
        And I input 'mailingAddressCity' in 'mailingAddressCity' feild on Customer Details Screen
        And I select 'mailingAddressState' from 'stateDropDown' dropdown list of 'mailingAddressState' on Customer Details Screen
        And I input 'mailingAddressZipCode' in 'mailingAddressZipCode' feild on Customer Details Screen
        And I input 'moveInDate' in 'moveInDate' feild on Customer Details Screen
        Then I verify duration of stay for Contact Details Screen
        When I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I input 'garagingAddressLineOne' in 'garagingAddressLineOne' feild on Customer Details Screen
        And I input 'garagingAddressCity' in 'garagingAddressCity' feild on Customer Details Screen
        And I select 'garaginAddressState' from 'stateDropDown' dropdown list of 'garagingAddresState' on Customer Details Screen
        And I input 'garagingAddressZipCode' in 'garagingAddressZipCode' feild on Customer Details Screen
        And I click on 'verifyAddressBtn' on Customer Details Screen
        Then I verify 'confirmAddressBtn' should be visible on Contact Details Screen
        When I click on 'confirmAddressBtn' on Customer Details Screen
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify for existing customer all information will be pre-populated except Social Security Number
        When I save 'orderID' as 'orderID' in data file
        And I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        Then I verify 'emailAddress' should have the value of customer Email Address
        When I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
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
        Then I verify 'licenseDetailsHdr' should be visible on Contact Details Screen
        When I click on "workQueueScreenBtn" Button on Create Quotation Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify filtered orders Length on WorkQueue
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        And I verify 'firstName' contains value of 'firstName' on Customer Details Screen
        And I verify 'middleName' contains value of 'middleName' on Customer Details Screen
        And I verify 'lastName' contains value of 'lastName' on Customer Details Screen
        And I verify 'mailingAddressLineOne' contains value of 'mailingAddressLineOne' on Customer Details Screen
        And I verify 'mailingAddressCity' contains value of 'mailingAddressCity' on Customer Details Screen
        And I verify 'mailingAddressStateValue' contains value of 'mailingAddressState' on Customer Details Screen
        And I verify 'mailingAddressZipCode' contains value of 'mailingAddressZipCode' on Customer Details Screen
        And I verify 'mailingAddressCounty' contains value of 'mailingAddressCounty' on Customer Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that existing user will have to re-enter SSN before proceeding
        When I save 'orderID' as 'orderID' in data file
        And I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
        And I input 'firstName' in 'firstName' feild on Customer Details Screen
        And I input 'middleName' in 'middleName' feild on Customer Details Screen
        And I input 'lastName' in 'lastName' feild on Customer Details Screen
        And I generate new Social Security Number
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        And I input 'mobileNumber' in 'mobileNumber' feild on Customer Details Screen
        Then I verify 'emailAddress' should have the value of customer Email Address
        When I input 'mailingAddressLineOne' in 'mailingAddressLineOne' feild on Customer Details Screen
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
        Then I verify 'licenseDetailsHdr' should be visible on Contact Details Screen
        When I click on "workQueueScreenBtn" Button on Create Quotation Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I click on 'gridViewBtn' from Orders Screen
        And I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify filtered orders Length on WorkQueue
        And I click on 'ellipsisBtn' from Orders Screen
        And I click on 'viewEditOrderText' from Ellipsis button Menu options
        And I input 'socialSecurityNumber' in 'socialSecurityNumber' feild on Customer Details Screen
        When I click on 'saveContactDetailsBtn' on Customer Details Screen
        Then I verify 'licenseDetailsHdr' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the default info should always be shown at the header of the screen
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        And I verify Application Expiry Date on 'Customer Details' Screen
        And I verify 'assetDetails' should be visible on Contact Details Screen
        And I verify 'financialDetails' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that Ellipsis button options are placed at the top right corner
        Then I verify 'ellipsisBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that if Order is cancelled, it should be moved to Cancelled Queue
        When I save 'orderID' as 'orderID' in data file
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        And I verify 'ellipsisBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'
        When I click on "workQueueScreenBtn" Button on Create Quotation Screen
        And I click on 'cancelledOrdersGridViewBtn' from Orders Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'cancelledReasonText' should be 'cancelledReasonValue' in Work Queue