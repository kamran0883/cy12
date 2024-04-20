import { When, Given } from "@badeball/cypress-cucumber-preprocessor";
import { login } from "../../../pages/LogIn/login";


Given("I read data file for Lane Login",()=>{
    login.readDataFile()
})

When("I login to MarketPlace and save session",()=>{
    login.loginAndSaveSession()
})