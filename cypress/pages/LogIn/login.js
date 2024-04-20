
let locators = {};
let dataFile = {};
const locatorFilepath = "cypress/pages/LogIn/login-locators.json";
const loginDataFilePath = "cypress/fixtures/Login/login.json";

class Login {


    /** This method will read the locators file and data file for Lane Login
     */
    readDataFile() {
        cy.readFile(locatorFilepath).then((obj) => {
            locators = obj
        })

        cy.readFile(loginDataFilePath).then((obj) => {
            dataFile = obj
        })
    }

    /**
   * This method will first wait for markeplace page to be loaded
   * then visit the  configurations page
   * will wait for loader to disappear
   */
    visitLane() {
        cy.wait(dataFile.staticWait);
        cy.visit(Cypress.env('LANE_URL'), { failOnStatusCode: false });
        cy.waitForLoader(dataFile.loaderWait);
    }

    /**
   * loginForm method to login to marketplace
   * usig userName and password from login.json file
   */
    loginForm() {
        cy.get(locators.userName).type(dataFile.userName);
        cy.get(locators.submitBtn).click();
        cy.get(locators.password, { timeout: dataFile.passwordWait }).type(dataFile.password);
        cy.get(locators.submitBtn).click();
        cy.get(locators.profileDummy, { timeout: dataFile.loaderWait }).should('not.exist');
    }

    /**
        * visitMarketplaceSignupPage visit link to login to signup lane from marketplace
        */
    visitMarketplaceSignupPage() {
        cy.visit(Cypress.env('MARKETPLACE_URL'));
        cy.waitForLoader(dataFile.loaderWait);
        cy.get(locators.profileBtn).click();
        cy.get(locators.loginBtn).eq(1).click();
    }

/**
 * loginAndSaveSession this method will login the user and visit lane then save the session 
 */

    loginAndSaveSession() {
        cy.session(`user: ${dataFile.userName}/${dataFile.password}`, () => {
            this.visitMarketplaceSignupPage();
            this.loginForm();
        });
        this.visitLane();
    }
}
export const login = new Login();