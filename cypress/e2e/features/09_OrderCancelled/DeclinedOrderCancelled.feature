Feature: Order Creation in Dealer Portal - Declined: Order Cancelled

    Background: User should be able to Read data files related to order creation flow
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
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I select 'terms' on Configure Quotation page
        And I input 'sellingAmount' in 'sellingAmount' field on Configure Quotation page
        And I click on 'addInsuranceDetailsBtn' Button in Insurance Section
        Then I verify 'insuranceDialogeHeader' has text of 'insuranceDialogHeaderTitle' on Insurance Dialog
        When I input 'insuranceProviderName' in 'insuranceProvider' field on Insurance Dialog
        And I input 'agentName' in 'insuranceAgent' field on Insurance Dialog
        And I input 'policyNumber' in 'policyNumber' field on Insurance Dialog
        And I input 'expiryDate' in 'expiryDateInput' field on Insurance Dialog
        And I input 'addressLineOne' in 'addressLineOne' field on Insurance Dialog
        And I input 'city' in 'city' field on Insurance Dialog
        And I click on 'stateDropDown' and select 'state' on Insurance Dialog
        And I input 'zipCode' in 'zipCode' field on Insurance Dialog
        And I input 'county' in 'county' field on Insurance Dialog
        And I input 'insuranceContact' in 'insuranceContact' field on Insurance Dialog
        And I click on 'continueBtn' Button in Insurance Section
        Then I verify 'dragIconText' has background color of 'dragIconTextColor' on Insurance Dialog
        When I upload proof of Insurance Image
        Then I verify 'fileName' has text of 'proofOfInsuranceFileName' on Insurance Dialog
        When I click on 'continueBtn' Button in Insurance Section
        Then I verify 'insuranceProviderOnDrawer' contains 'insuranceProviderName' on Quotation Drawer
        And I verify 'policyNumberOnDrawer' contains 'policyNumber' on Quotation Drawer
        And I verify 'expiryDateOnDrawer' contains 'expiryDate' on Quotation Drawer
        When I click on 'addTradeInBtn' Button
        Then I verify 'tradeInPoupHeader' has text of 'tradeInPopUpHeaderText' in Trade-In Section
        When I input 'tradeInYear' in 'yearInputField' on Trade-In Details Popup
        And I input 'tradeInMake' in 'makeInputField' on Trade-In Details Popup
        And I input 'tradeInModel' in 'modelInputField' on Trade-In Details Popup
        And I input 'tradeInTrim' in 'trimInputField' on Trade-In Details Popup
        And I input 'tradeInCurrentMileage' in 'mileageInputField' on Trade-In Details Popup
        And I input 'tradeInVIN' in 'vinInputField' on Trade-In Details Popup
        And I select 'conditionDropDown' and select 'tradeInCondition' on Trade-In Details Popup
        And I input 'tradeInAmount' in 'tradeInAmountInputField' on Trade-In Details Popup
        And I get 'assetEntitledToCustomer' section and check 'entitledToCustomer' value on Trade-In Details Popup
        And I get 'leaseBalancee' section and check 'leaseBalance' value on Trade-In Details Popup
        And I upload Trade-In Asset Image on Trade-In Details Popup
        Then I verify 'filePreview' is visible on Trade-In Popup
        When I click on 'continueBtn' Button
        Then I verify 'assetNameOnDrawer' in Trade-In Section on Quotation Drawer
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        And I save 'leaseEstimatedPeriodicPayment' as 'leaseEstimatedPeriodicPayment' in data file
        And I save 'leaseDueAtSigningValue' as 'leaseDueAtSigningValue' in data file
        And I save 'leaseAnnualMileage' as 'leaseAnnualMileage' in data file
        And I save 'leaseSellingPrice' as 'leaseSellingPrice' in data file
        And I save 'leaseDownpaymentValue' as 'leaseDownpaymentValue' in data file
        And I save 'leaseOptionsValue' as 'leaseOptionsValue' in data file
        And I save 'totalFeesInLease' as 'totalFeesInLease' in data file
        And I save 'leaseProgFinanceAmount' as 'leaseProgFinanceAmount' in data file
        And I click on 'selectLeaseQuoteBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'customerDetailsScreenHdr' should contain 'customerDetailsScreenHdrTxt'
        When I select 'prefix' from 'prefixListBox' dropdown list of 'prefix' on Customer Details Screen
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
        When I save 'orderID' as 'orderID' in data file
        And I get the program type and save it in Data File
        And I click on 'submitCreditAppBtn' for Submission Flow After Fraud Check
        Then I validate if Order Status is 'Cancelled' based upon Credit Request API response


    #---------------TC-24445---------------#
    #---------------TC-24443---------------#
    #---------------TC-24444---------------#

    @lane-regression
    Scenario: Validate that order is moved to Cancelled Queue and cancellation reason marked as 'Credit Application Declined'
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24446---------------#
    #---------------TC-24450---------------#

    @lane-regression
    Scenario: Validate that Vehicle details and Order summary information visible to user on Cancelled Order Screen
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify selected Asset's Name on the Header of Cancelled Order Screen
        And I verify 'netFinancedAmount' in Contract Details over the header on Cancelled Order Screen
        And I verify 'periodicPaymentOnHeader' in Contract Details over the header on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24454---------------#

    @lane-regression
    Scenario: Validate that Customer Details visible to user on Cancelled Order Screen
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify 'customerName' from 'customerName' in Customer Details section on Cancelled Order Screen
        And I verify 'customerAddress' from 'customerAddress' in Customer Details section on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24456---------------#

    @lane-regression
    Scenario: Validate that Order Details are visible to user on Cancelled Order Screen
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify 'orderDetailsText' in Order Details section header on Cancelled Order Screen
        And I verify 'contractTerms' from 'programType' in Order Details on Cancelled Order Screen
        And I verify 'productType' from 'productType' in Order Details on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24457---------------#
    #---------------TC-24452---------------#

    @lane-regression
    Scenario: Validate that Insurance section is visible to user on cancelled order screen if it was added to order in earlier stage
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify 'insuranceProvider' in Insurance Section on Cancelled Order Screen
        And I verify 'insuranceContact' in Insurance Section on Cancelled Order Screen
        And I verify 'policyNumber' in Insurance Section on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24458---------------#
    #---------------TC-24554---------------#

    @lane-regression
    Scenario: Validate that Trade-in information is visible to user on cancelled order screen if it was added to order in earlier stage
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify Trade-In Asset Name in Trade-In Section on Cancelled Order Screen
        And I verify 'tradeInAssetImage' image should be visible on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'

    #---------------TC-24460---------------#

    @lane-regression
    Scenario: Validate that complete payment break down Details visible to user on Cancelled Order Screen
        When I click on "workQueueScreenBtn" from Customer Details Screen
        And I click on 'cancelledQueueSearchBtn' button on Cancelled Queue on Work Queue Screen
        And I input 'orderID' in 'cancelledQueueSearchFilter' filter on Cancelled Queue
        And I double click on cancelled Order ID Row in filter on Cancelled Orders Queue
        Then I verify Order ID on Summary Screen of Cancelled Order
        And I verify 'cancellationReason' in Order Details on Cancelled Order Screen
        And I verify 'periodicPayment' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'annualMileage' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'sellingPrice' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'downPayment' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'optionsValue' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'feesValue' in Payment Break Down Details on Cancelled Order Screen
        And I verify 'financedAmount' in Payment Break Down Details on Cancelled Order Screen
        When I visit Index and input vinNumber in VIN Search Feild
        Then I verify 'assetAvailablityStatus' should have 'assetAvailableStatusValue'