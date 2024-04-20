Feature: Order Creation In Dealer Portal - Asset Selection

    Background: Lender Profile should be available on Lane
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data file for Asset Selection on Lane
        And I read data file for Create Order on Lane

    @lane-regression
    Scenario: The Asset Selection screen should be available to user after providing mandatory info
        Given I click on 'Create New Order' button
        When I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        Then I verify user should be able to see Asset Selection screen

    @lane-regression
    Scenario: Validate the assets available are for the specific selected dealer
        When I visit Index and check for available assets in Inventory and visit Lane
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        Then I verify All listed assets should be available on Choose Asset Screen

    @lane-regression
    Scenario: Validate Asset Details popup is available against each asset
        When I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I verify user should be able to see Asset Selection screen
        When I hover over the shortlisted vehicle card
        Then I verify Eye and Select & Continue buttons should be visible
        And I click on Eye Button
        Then Asset details should be displayed in the popup

    @lane-sanity @lane-regression
    Scenario: Validate the Filters are available for the user
        When I visit Index and get details of 'first' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I verify user should be able to see Asset Selection screen
        And All filters should be visible to the user
        And I select multiple filters and click Apply filters button
        Then I verify the shortlisted asset on Choose Asset Screen

    @lane-regression
    Scenario: Validate the filters hide on clicking 'Hide Filters' button
        When I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I verify user should be able to see Asset Selection screen
        And All filters should be visible to the user
        Then I click on Hide Filter button and all available filters should be hidden

    @lane-regression
    Scenario: Validate that the Apply and Reset Filters button is available for the user
        When I visit Index and get details of 'first' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I verify user should be able to see Asset Selection screen
        And All filters should be visible to the user
        And I select multiple filters and click Apply filters button
        Then I click on Reset Filters button

    @lane-sanity @lane-regression
    Scenario: Validate that the user is able to select one of the shortlisted assets
        Given I visit Index and get details of 'first' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        And I verify user should be able to see Asset Selection screen
        And All filters should be visible to the user
        When I select multiple filters and click Apply filters button
        And I hover over the shortlisted vehicle card
        And I Select and Continue with any of the shortlisted asset
        Then I land on Create Quotation screen

    @lane-regression
    Scenario: Validate the sorting of Cards
        Given I visit Index and get details of 'first' available vehicle from Inventory
        And I click on 'Create New Order' button
        And I enter a 'new' email address
        And I verify Consent Checkbox should 'not' auto-checked
        And I check Consent Checkbox
        And I click on Save & Initiate Order Button
        When I verify user should be able to see Asset Selection screen
        And I click on Sort By button
        And I click on select Selling Price High To Low option
        Then I verify cards are sorted with Selling Price High to Low

