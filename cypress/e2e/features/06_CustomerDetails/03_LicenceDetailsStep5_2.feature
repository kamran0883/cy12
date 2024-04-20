Feature: Order Creation in Dealer Portal - Applicant License Information Step 5.1

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
        When I click on 'licenseDetailsPageBtn' Button on license Details Page

    #--- TC-24983 - TC-24984 - TC-24989 are not automated due to missing implementation

    @lane-regression
    Scenario: Verify the contents of the License Details page
        Then I verify 'licenseBackImageSideDialogBox' is visible on License Details page
        And I verify 'licenseFirstName' is visible on License Details page
        And I verify 'licenseLastName' is visible on License Details page
        And I verify 'licenseNumber' is visible on License Details page
        And I verify 'licenseIssueStateParentEl' is visible on License Details page
        And I verify 'licenseExpirationDate' is visible on License Details page
        And I verify 'dateofBirth' is visible on License Details page
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that validation should appear on all input fields by just clicking "Save & Continue" button
        When I input 'licenseFirstName' in 'licenseFirstName' feild on License Details Page
        And I click on 'saveLicenseDetailsBtn' Button on license Details Page
        Then I verify 'lastNameValidationMsg' is visible on License Details page
        And I verify 'licenseNumberValidationMsg' is visible on License Details page
        And I verify 'licenseStateValidationMsg' is visible on License Details page
        And I verify 'expirationValidatioMsg' is visible on License Details page
        And I verify 'dateOfBirthValidationMsg' is visible on License Details page
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify user should be able to add the customer's license details by uploading the both front and back images
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
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify dealer user should be able to add the customer's license details without uploading the license images
        When I input 'licenseFirstName' in 'licenseFirstName' feild on License Details Page
        And I input 'licenseLastName' in 'licenseLastName' feild on License Details Page
        And I input 'licenseNumber' in 'licenseNumber' feild on License Details Page
        And I select 'stateListValue' from 'stateDropDown' dropdown list of 'licenseIssueState' on License Details Screen
        And I input 'licenseExpirationDate' in 'licenseExpirationDate' feild on License Details Page
        And I input 'dateofBirth' in 'dateofBirth' feild on License Details Page
        And I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify user should be able to change/remove the customer's license details after uploading
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
        When I input 'newFirstName' in 'licenseFirstName' feild on License Details Page
        And I input 'newLastName' in 'licenseLastName' feild on License Details Page
        And I input 'newLicenseNumber' in 'licenseNumber' feild on License Details Page
        And I select 'newLicenseIssueState' from 'stateDropDown' dropdown list of 'licenseIssueState' on License Details Screen
        And I input 'newLicenseExpirationDate' in 'licenseExpirationDate' feild on License Details Page
        And I input 'newDateOfBirth' in 'dateofBirth' feild on License Details Page
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify that the DOB should not be equal to or greater than current date
        When I upload 'licenseFront' image on 'licenseFrontImageSideDialogBox' on License Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        And I click on 'removeLicenseBackImage' Button on license Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        Then I verify license-verification API response
        And I verify 'dateofBirth' should have the value of 'dateofBirth' on License Details Page
        And I verify Date of Birth should not be greater than the current Date
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the License Expiry Date should not be less than or equal to current date
        When I upload 'licenseFront' image on 'licenseFrontImageSideDialogBox' on License Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        And I click on 'removeLicenseBackImage' Button on license Details Page
        And I upload 'licenseBack' image on 'licenseBackImageSideDialogBox' on License Details Page
        Then I verify license-verification API response
        And I verify 'licenseExpirationDate' should have the value of 'licenseExpirationDate' on License Details Page
        And I verify License Expiry Date is always greater than Current Date
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the license verification with MiTek after uploading the license
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
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the default information displayed on the header
        Then I verify Application Expiry Date on 'Customer Details' Screen
        And I verify 'assetDetails' should be visible on Contact Details Screen
        And I verify 'financialDetails' should be visible on Contact Details Screen
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the contents of the ellipsis button on the License page
        Then I verify 'licenseFrontImageSideDialogBox' is visible on License Details page
        Then I verify 'licenseBackImageSideDialogBox' is visible on License Details page
        And I verify 'licenseFirstName' is visible on License Details page
        And I verify 'licenseLastName' is visible on License Details page
        And I verify 'licenseNumber' is visible on License Details page
        And I verify 'licenseIssueStateParentEl' is visible on License Details page
        And I verify 'licenseExpirationDate' is visible on License Details page
        And I verify 'dateofBirth' is visible on License Details page
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'

    @lane-regression
    Scenario: Verify the behavior of the Cancel Order button
        When I save 'orderID' as 'orderID' in data file
        When I click on 'ellipsisBtnOnCustomerDetails' on Customer Details Screen
        Then I verify 'cancelOrderBtnOnCustomerDetails' should be visible on Contact Details Screen
        When I click on 'cancelOrderBtnOnCustomerDetails' on Customer Details Screen
        And I click on 'cancelOrderBtn' from Orders Screen
        Then I verify 'orderCancelledToast' toast should have text of 'orderCancelledOnQuotationToast'
        When I click on 'cancelledOrdersGridViewBtn' from Orders Screen
        Then I verify 'ordersHeader' should contain 'ordersHeaderText'
        When I enter orderID in 'orderIDFilter' on Orders Screen
        Then I verify order 'cancelledReasonText' should be 'cancelledReasonValue' in Work Queue