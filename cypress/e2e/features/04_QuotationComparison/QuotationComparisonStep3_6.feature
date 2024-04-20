Feature: Order Creation in Dealer Portal - Quotation parameters and Comparison (Step 3.6) - Third Party Insurance Details

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

    @lane-regression
    Scenario: Verify Insurance Details Capture
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I click on 'addInsuranceDetailsBtn' Button in Insurance Section
        Then I verify 'insuranceDialogeHeader' has text of 'insuranceDialogHeaderTitle' on Insurance Dialog
        And I verify 'insuranceProvider' is visible on Insurance Dialog
        And I verify 'insuranceAgent' is visible on Insurance Dialog
        And I verify 'policyNumber' is visible on Insurance Dialog
        And I verify 'expiryDateInput' is visible on Insurance Dialog
        And I verify 'addressLineOne' is visible on Insurance Dialog
        And I verify 'addressLineTwo' is visible on Insurance Dialog
        And I verify 'city' is visible on Insurance Dialog
        And I verify 'stateDropDown' is visible on Insurance Dialog
        And I verify 'zipCode' is visible on Insurance Dialog
        And I verify 'county' is visible on Insurance Dialog
        And I verify 'insuranceContact' is visible on Insurance Dialog
        And I verify 'fileUploadSection' is visible on Insurance Dialog

    @lane-regression
    Scenario: Verify Input of Insurance Details
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
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
        And I upload proof of Insurance Image
        Then I verify 'fileName' has text of 'proofOfInsuranceFileName' on Insurance Dialog
        When I click on 'continueBtn' Button in Insurance Section
        Then I verify 'insuranceProviderOnDrawer' contains 'insuranceProviderName' on Quotation Drawer
        And I verify 'policyNumberOnDrawer' contains 'policyNumber' on Quotation Drawer
        And I verify 'expiryDateOnDrawer' contains 'expiryDate' on Quotation Drawer

    @lane-regression
    Scenario: Verify Mandatory Proof of Insurance
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
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

    @lane-regression
    Scenario: Verify Insurance Details Saving for Orders without Insurance
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
        And I click on 'addInsuranceDetailsBtn' Button in Insurance Section
        Then I verify 'insuranceDialogeHeader' has text of 'insuranceDialogHeaderTitle' on Insurance Dialog
        When I click on 'continueBtn' Button in Insurance Section
        And I click on 'closeDialogBtn' Button in Insurance Section
        And I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'createQuotationScreenHeader' should contain 'createQuotationScreenHdrText'

    @lane-regression
    Scenario: Verify Button Availability and Saving
        When I click on "configureQuotationBtn" Button on Create Quotation Screen
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
        When I click on 'updateQuotationBtn' Button on Create Quotation Screen
        And I wait for Quotation Calculation calls to complete
        Then I verify 'createQuotationScreenHeader' should contain 'createQuotationScreenHdrText'