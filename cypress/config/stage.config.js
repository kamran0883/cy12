const { defineConfig } = require("cypress");
const setupNodeEvents = require("./setupNodEvent").setupNodeEvent;

module.exports = defineConfig({
  e2e: {
    setupNodeEvents,
    specPattern: "cypress/e2e/features/*/*.feature",
    baseUrl: "https://stage.netsolapp.io/",
    retries: {
      runMode: 1,
      openMode: 0
    },
    video: false,
    viewportHeight: 1000,
    viewportWidth: 1280,
    env: {
      "MARKETPLACE_URL": "https://stage.netsolapp.io",
      "LANE_URL": "https://stage.netsolapp.io/dms/workqueue",
      "API_BASE_URL": "https://api-stage.netsolapp.io",
      "DMS_API_BASE_URL": "https://dms-api-stage.netsolapp.io/",
      "INDEX_INVENTORY_MANAGEMENT": "https://dev.netsolapp.io/configuration/inventory-management",
      "INDEX_INVENTORY_FILTER_URL": "https://config-api-stage.netsolapp.io/config/inventory/filter*",
      "LICENSE_VERIFICATION_URL": "https://dms-api-stage.netsolapp.io/dms/customer/license-verification",
      "DOWNLOAD_DOCUMENT": "https://unity-generated-documents.s3.amazonaws.com/",
      "UPLOAD_SIGNED_DOCUMENT_URL": "dms/order/upload-signed-document/OD-E0000EY5",
      "VERIFY_SIGNED_DOCUMENT_UPLOAD": "dms/order/order-verify-document/OD-E0000EY5"
    },
  },
});
