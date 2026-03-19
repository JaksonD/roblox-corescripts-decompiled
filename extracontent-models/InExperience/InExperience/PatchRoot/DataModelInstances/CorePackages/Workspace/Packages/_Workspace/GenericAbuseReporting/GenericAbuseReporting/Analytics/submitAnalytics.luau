local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.AnalyticsReducer);
local v8 = require(l_script_FirstAncestor_0.Logger):new("AbuseReport Analytics");
local v9 = {
    ReportTimeSpent = game:DefineFastString("GenericAbuseReportingTimeSpentStat", "TimeSpent"), 
    SubmittedAbuseType = game:DefineFastString("GenericAbuseReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
};
local v10 = {
    "Unspecified", 
    "Submit", 
    "Abandon"
};
return function(v11, v12) --[[ Line: 22 ]] --[[ Name: submitAnalytics ]]
    -- upvalues: v5 (copy), v9 (copy), v6 (copy), v10 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v8 (copy)
    local l_Diag_0 = v5.Diag;
    l_Diag_0:reportStats(v11.context .. "_" .. v9.ReportTimeSpent, v11.accumulated_time_ms);
    local v14 = v11.context .. "_" .. v9.SubmittedAbuseType .. "_" .. v11.reason_selection;
    l_Diag_0:reportCounter(v14, 1);
    local v15 = math.floor(workspace:GetServerTimeNow() * 1000 - v11.accumulated_time_ms);
    local v16 = v6.Dictionary.union(v11, {
        accumulated_time_ms = v15, 
        interaction_type = (table.find(v10, v12) or 1) - 1
    });
    l_EventIngest_0.new(l_EventIngestService_0):sendEventDeferred(v11.context, v11.event_type, v16);
    v8:info("Submitted. context: {} interaction_type: {} abuseTypeCategory: {} timeSpent (ms): {}", v11.context, v12, v14, v15);
end;