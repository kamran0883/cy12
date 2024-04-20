
let locators = {};
let dataFile = {};
const locatorFilepath = "cypress/pages/LogIn/login-locators.json";
const loginDataFilePath = "cypress/fixtures/Login/login.json";

class Login {


   
    visitLane() {
    
        cy.visit(Cypress.env('LANE_URL'), { failOnStatusCode: false });
    
    }

    clickLoginButton() {
        cy.get('.text-primary').click();
      }

      loginemail() {
        cy.wait(3000)
        cy.get('a.inline-flex').click();
      }
  
      username() {
        const email = Cypress.env("user")
        cy.xpath('//*[@id=":r0:-form-item"]/input').type(email)
      }
  
      password() {
        const password = Cypress.env("password")
        cy.xpath('//*[@id=":r1:-form-item"]/input').type(password)
      }
  
      loginButton() {
        cy.get('.bg-primary').click();
      }
  
      clickSignUpButton() {
        cy.get('.container > div.flex > .bg-primary').click();
        cy.wait(15000)
        cy.get('a.inline-flex').click();
        cy.wait(10000)
      };
  
      firstname(fname) {
        cy.xpath('//*[@id=":r0:-form-item"]/input').type(fname)
      };
  
      lastname(lname) {
        cy.xpath('//*[@id=":r1:-form-item"]/input').type(lname)
      };
  
      eaddress() {
        const email = 10000 + Math.floor(Math.random() * 90000);
    
        const emailad = `kamran.yousaf${email}@gmail.com`
        cy.log(emailad)
        cy.xpath('//*[@id=":r2:-form-item"]/input').type(emailad)
      };
  
      company(cname) {
        cy.xpath('//*[@id=":r3:-form-item"]/input').type(cname)
      };
  
      psswrd(pswrd) {
        cy.xpath('//*[@id=":r4:-form-item"]/input').type(pswrd)
      };
  
      cpassword(pswrd) {
        cy.wait(1000)
        cy.xpath('//*[@id=":r5:-form-item"]/input').type(pswrd)
      };
  
      term() {
        cy.xpath('//*[@id=":r6:-form-item"]/button').click()
      };
  
      newsletter() {
        cy.xpath('//*[@id=":r7:-form-item"]/button').click()
      };
  
      signup() {
        cy.xpath('/html/body/div[1]/main/div[2]/section/form/button').click()
      };
    

      
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
        
        this.visitLane();
    }
}

export const login = new Login();