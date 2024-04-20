Feature: User Profile

    Background: User should be able to acces Dealer Profile
        Given I read data file for Lane Login
        When I login to MarketPlace and save session
        And I read data and locator files for User Profile
        And I read data files for Quotation Comparison
        And I click on 'profileAvatar' for User Profile

    #---------------------TC-25302-------------------#
    @lane-regression
    Scenario: Verify that Logged in user is able to view the Profile
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen

    #---------------------TC-25303-------------------#
    @lane-regression
    Scenario: Verify the Logged In User is able to edit profile
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I generate random user name for User Profile
        And I input 'firstName' in 'firstNameInputField' field on User Pofile Screen
        And I input 'lastName' in 'lastNameInputField' field on User Pofile Screen
        And I click on 'updateProfileBtn' for User Profile
        Then I verify 'recordUpdatedToast' toast should have text of 'profileUpdatedToastMsg'

    #---------------------TC-25312-------------------#
    @lane-regression
    Scenario: Verify that initials of User are shown in Profile Icon
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I get user initials and save them into Data File
        Then I verify 'profileAvatar' should have the text 'userInitials' for User Profile

    #---------------------TC-25314-------------------#
    @lane-regression
    Scenario: Verify that profile menu have two menu items i.e My Prfile and Logout
        Then I verify 'profileOptionsDropDown' should have the text 'profileOptionText' for User Profile
        And I verify 'profileOptionsDropDown' should have the text 'logoutOptionText' for User Profile

    #---------------------TC-25315-------------------#
    @lane-regression
    Scenario: Verify that when user click logout button, User should be logged out and land on Login Screen
        When I select 'logoutOptionText' from Profile Options Dropdown
        Then I verify 'loginPageHeader' should have the text 'loginPageHeaderTxt' for User Profile
        And I verify 'userNameInputField' should be visible on User Profile Screen

    #---------------------TC-25316-------------------#
    @lane-regression
    Scenario: Verify that email field is disbaled by default and user is not able to edit email field
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        And I verify email field is disbaled

    #---------------------TC-25317-------------------#
    @lane-regression
    Scenario: Verify the First Name and Last Name fields have character limit of 30 Applied
        When I select 'profileOptionText' from Profile Options Dropdown
        And I generate random 'randomFirstName' for User Profile
        And I input 'randomFirstName' in 'firstNameInputField' field on User Pofile Screen
        And I generate random 'randomLastName' for User Profile
        And I input 'randomLastName' in 'lastNameInputField' field on User Pofile Screen
        And I click on 'updateProfileBtn' for User Profile
        Then I verify 'firstNameHelperText' should have the text 'firstNameLimitWarningText' for User Profile
        And I verify 'lastNameHelperText' should have the text 'lastNameLimitWarningText' for User Profile

    #---------------------TC-25319-------------------#
    @lane-regression
    Scenario: Verify that Profile details screen have auto populated data from User's Profile
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        And I verify 'firstNameInputField' has preloaded 'firstName' on User Profile Page
        And I verify 'lastNameInputField' has preloaded 'lastName' on User Profile Page
        And I verify 'emailInputField' has preloaded 'userName' on User Profile Page

    #---------------------TC-25325-------------------#
    @lane-regression
    Scenario: Verify that When user change password Existing Password, New Password and Re-Enter New Password fields would be mandatory
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I click on 'updatePasswordBtn' for User Profile
        Then I verify 'currentPasswordHelperText' should be visible on User Profile Screen
        And I verify 'newPasswordHelperText' should be visible on User Profile Screen
        And I verify 'confirmNewPasswordHelperText' should be visible on User Profile Screen

    #---------------------TC-25330-------------------#
    @lane-regression
    Scenario: Verify that If user doesn't meet the Required policies for password then User prompted with Password policy
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I input 'password' in 'currentPasswordInputField' field on User Pofile Screen
        And I input 'newPassword' in 'newPasswordInputField' field on User Pofile Screen
        And I input 'newPassword' in 'confirmPasswordInputField' field on User Pofile Screen
        And I click on 'updatePasswordBtn' for User Profile
        And I verify 'newPasswordHelperText' should have the text 'passworLengthPolicyText' for User Profile

    #---------------------TC-25332-------------------#
    @lane-regression
    Scenario: Verify that when New Password and Re-Enter Password doesn't match, Prompt/Error message will appear of Password not matched
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I input 'password' in 'currentPasswordInputField' on Change Your Password Section
        And I input 'newPassword' in 'newPasswordInputField' on Change Your Password Section
        And I input different new password in 'confirmPasswordInputField' Input Field
        And I click on 'updatePasswordBtn' for User Profile
        Then I verify 'confirmNewPasswordHelperText' should have the text 'confirmPasswordNotMatchHelperText' for User Profile

    #---------------------TC-25335-------------------#
    Scenario: Verify that user is able to change password by clicking "Update my password" button
        When I select 'profileOptionText' from Profile Options Dropdown
        Then I verify 'yourProfileHdrText' should be visible on User Profile Screen
        When I input 'password' in 'currentPasswordInputField' on Change Your Password Section
        And I save random password as 'newPassword' in Login Data File
        And I input 'newPassword' in 'newPasswordInputField' on Change Your Password Section
        And I input 'newPassword' in 'confirmPasswordInputField' on Change Your Password Section
        And I click on 'updatePasswordBtn' for User Profile
        Then I verify 'recordUpdatedToast' toast should have text of 'passwordChangedToastMsg'
        When I input 'newPassword' in 'currentPasswordInputField' on Change Your Password Section
        And I input 'password' in 'newPasswordInputField' on Change Your Password Section
        And I input 'password' in 'confirmPasswordInputField' on Change Your Password Section
        And I click on 'updatePasswordBtn' for User Profile
        Then I verify 'recordUpdatedToast' toast should have text of 'passwordChangedToastMsg'