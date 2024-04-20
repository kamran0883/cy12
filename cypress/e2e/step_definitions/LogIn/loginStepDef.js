import { When, Given, And, Then } from "@badeball/cypress-cucumber-preprocessor";
import { login } from "../../../pages/LogIn/login";


Given("User will go to Euergo Academy Home Page",()=>{
    login.loginAndSaveSession()
})

When("User will click on Sign in button",()=>{
    login.clickLoginButton()
})

When("User will click Log in with Email", () => {
    login.loginemail();
  });

  When("User will enter user name", () => {
    login.username();
  });

  When("User will enter password", () => {
    login.password();
  });

Then("User will click on Log in button", () => {
    login.loginButton();
});

Given("User will click on Sign up button", () => {
  login.clickSignUpButton();
});

When("User will enter {string} first name", (fname) => {
    login.firstname(fname);
  });

  When("User will enter {string} last name", (lname) => {
    login.lastname(lname);
  });

  When("User will enter email address", () => {
    login.eaddress();
  });

  When("User will enter {string} company name", (cname) => {
    login.company(cname);
  });

  When("User will enter {string} password", (pswrd) => {
    login.psswrd(pswrd);
  });

  When("User will enter {string} confirm password", (pswrd) => {
    login.cpassword(pswrd);
  });

  When("User will mark I agree to receive Euregio Academy the Terms & Conditiontions", () => {
    login.term();
  });

  When("User will mark I agree to receive Euregio Academy the newsletter", () => {
    login.newsletter();
  });

  Then("User will click on Sign up button", () => {
    login.signup();
  });