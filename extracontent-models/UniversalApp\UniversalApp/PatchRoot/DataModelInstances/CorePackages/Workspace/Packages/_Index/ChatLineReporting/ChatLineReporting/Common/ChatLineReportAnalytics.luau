local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v8 = {
    ReportTimeSpent = game:DefineFastString("ChatLineReportingTimeSpentStat", "TimeSpent"), 
    SubmittedAbuseType = game:DefineFastString("ChatLineReportingSubmittedAbuseTypeStat", "SubmittedAbuseType")
};
submitAnalytics = function(v9, v10, v11) --[[ Line: 17 ]] --[[ Name: submitAnalytics ]]
    -- upvalues: l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v5 (copy), v6 (copy), v8 (copy)
    local v12 = l_EventIngest_0.new(l_EventIngestService_0);
    local l_Diag_0 = v5.Diag;
    local v14 = math.floor(workspace:GetServerTimeNow() * 1000 - v9.accumulated_time_ms);
    local v15 = v6.Dictionary.join(v9, {
        accumulated_time_ms = v14, 
        interaction_type = v10, 
        mute_button_clicked = v11
    });
    local v16 = v9.context .. "_" .. v8.ReportTimeSpent;
    local v17 = v9.context .. "_" .. v8.SubmittedAbuseType .. "_" .. v9.reason_selection;
    l_Diag_0:reportStats(v16, v14);
    l_Diag_0:reportCounter(v17, 1);
    v12:sendEventDeferred(v9.context, v9.event_type, v15);
end;
return submitAnalytics;