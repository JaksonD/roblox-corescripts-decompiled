local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAbuseReportMenuV2_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAbuseReportMenuV2;
local v2 = require(script.Components.AbuseReportMenuNew);
local v3 = if l_FFlagAbuseReportMenuV2_0 then require(script.V2.AbuseReportMenu) else nil;
local v4 = require(script.Analytics.ReportAbuseAnalytics);
return {
    AbuseReportMenu = v2, 
    AbuseReportMenuV2 = v3, 
    ReportAbuseAnalytics = v4, 
    ["jest.config"] = script["jest.config"]
};