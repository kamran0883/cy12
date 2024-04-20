const report = require("multiple-cucumber-html-reporter");

const date = new Date();
let nextDate = new Date();
nextDate.setHours(date.getHours() + 4);
const endDate = nextDate;

report.generate({
    jsonDir: "./cypress/reports/json",
    reportPath: "./cypress/reports/html",
    metadata: {
        browser: {
            name: "chrome",
            version: "119",
        },
        device: "Dev Environment",
        platform: {
            name: "windows",
            version: "11",
        },
    },
    customData: {
        title: "Run info",
        data: [
            { label: "Project", value: "Unity Lane Automation Suite" },
            { label: "Release", value: "1.0.0" },
            { label: "Cycle", value: "SP44" },
            { label: "Execution Start Date", value: date },
            { label: "Execution End Date", value: endDate },
        ],
    },
});