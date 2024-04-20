let locators = {}
let configFile = {}
let dataFile = {}
const locatorsFilePath = "cypress/pages/QuotationToApplication/QuotationToApplication-locators.json";
const dataFilePath = "cypress/fixtures/QuotationToApplication/QuotationToApplication.json"
const configFilePath = "cypress/fixtures/Configurations/LenderConfigurations.json";

class QuotationToApplication {

    /**
    * this method reads data and locator files for Quotation To Application
    */
    readDataAndLocatorFile() {
        cy.readFile(locatorsFilePath).then((obj) => {
            locators = obj
        })
        cy.readFile(configFilePath).then((obj) => {
            configFile = obj
        })
        cy.readFile(dataFilePath).then((obj) => {
            dataFile = obj
        })
    }
    
} export const quotationToApplication = new QuotationToApplication()