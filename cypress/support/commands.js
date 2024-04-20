// Ignore uncaught:exception
Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false here prevents Cypress from
    // failing the test
    return false;
});

/**
 * This method will create random email with ulas as prefix and domain
 * @param {string} length will define the length of random characters
 */
Cypress.Commands.add("createRandomEmail", (length) => {
    var strValues = "abcdefghijklmnopqrstuvwxyz1234567890";
    var strEmail = "";
    var strTmp;
    for (var i = 0; i < length; i++) {
        strTmp = strValues.charAt(Math.round(strValues.length * Math.random()));
        strEmail = strEmail + strTmp;
    }
    return "ulas" + strEmail + "@ulas.com"
});

/**
 * This method will generate random user name
 * @param {string} length will define the length of random characters
 */
Cypress.Commands.add('generatRandomUserName', (length) => {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    let userName = '';
    for (let i = 0; i < length; i++) {
        userName += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return userName;
})