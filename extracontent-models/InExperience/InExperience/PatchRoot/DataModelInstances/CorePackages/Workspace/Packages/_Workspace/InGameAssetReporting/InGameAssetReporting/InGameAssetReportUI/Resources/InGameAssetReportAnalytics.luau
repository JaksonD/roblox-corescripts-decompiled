local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Types);
local v8 = {
    ReportTimeSpent = game:DefineFastString("InGameAssetReportingTimeSpentStat", "TimeSpent"), 
    SubmittedAbuseType = game:DefineFastString("InGameAssetReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
};
submitAnalytics = function(v9, v10) --[[ Line: 17 ]] --[[ Name: submitAnalytics ]]
    -- upvalues: l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v5 (copy), v6 (copy), v8 (copy)
    local v11 = l_EventIngest_0.new(l_EventIngestService_0);
    local l_Diag_0 = v5.Diag;
    local v13 = math.floor(workspace:GetServerTimeNow() * 1000 - v9.accumulated_time_ms);
    local v14 = v6.Dictionary.join(v9, {
        accumulated_time_ms = v13, 
        interaction_type = v10
    });
    local v15 = v9.context .. "_" .. v8.ReportTimeSpent;
    local v16 = v9.context .. "_" .. v8.SubmittedAbuseType .. "_" .. v9.reason_selection;
    l_Diag_0:reportStats(v15, v13);
    l_Diag_0:reportCounter(v16, 1);
    v11:sendEventDeferred(v9.context, v9.event_type, v14);
end;
return submitAnalytics;