/**
 * This method will wait for the loader to disappear
 * @param {int} timeoutMillis number of miliseconds for loader to disappear
 */
Cypress.Commands.add("waitForLoader", (timeoutMillis) => {
    cy.get('.ring-item', { timeout: timeoutMillis }).should('not.exist');
});