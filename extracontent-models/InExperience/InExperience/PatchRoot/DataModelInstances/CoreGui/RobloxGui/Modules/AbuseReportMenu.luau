local v0 = require(script.Components.AbuseReportMenuNew);
local v1 = require(script.Analytics.ReportAbuseAnalytics);
return {
    AbuseReportMenu = v0, 
    ReportAbuseAnalytics = v1, 
    ["jest.config"] = script["jest.config"]
};