local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.LoggingProtocol);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v6 = require(l_Parent_0.t);
local _ = require(l_script_FirstAncestor_0.Analytics.VideoAnalyticsTypes);
local l_VideoEngagementEvents_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoEngagementEvents;
local v9 = game:DefineFastInt("VideoEngagementEventHundredthsPercent", 0);
local v10 = {};
local v11 = v6.strictInterface({
    videoAssetId = v6.string, 
    source = v6.string, 
    sourceId = v6.string, 
    impressionId = v6.optional(v6.string), 
    playbackSessionId = v6.optional(v6.string), 
    videoAssetDuration = v6.optional(v6.number), 
    isVisible = v6.optional(v6.boolean), 
    isAudible = v6.optional(v6.boolean), 
    isFullscreen = v6.optional(v6.boolean), 
    volumeLevel = v6.optional(v6.number)
});
local v12 = v6.strictInterface({
    loadTime = v6.optional(v6.number), 
    scrubStartTime = v6.optional(v6.number), 
    scrubEndTime = v6.optional(v6.number), 
    destination = v6.optional(v6.string)
});
local v13 = {
    eventName = "videoEngagementEvent", 
    backends = {
        v4.TelemetryBackends.Points, 
        v4.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v9, 
    lastUpdated = {
        25, 
        6, 
        25
    }, 
    description = "Fire when video engagement event is triggered", 
    links = ""
};
return {
    reportVideoAction = function(v14, v15, v16, v17) --[[ Line: 59 ]] --[[ Name: reportVideoAction ]]
        -- upvalues: v11 (copy), l_reportWarning_0 (copy), v4 (copy), v12 (copy), v3 (copy), l_VideoEngagementEvents_0 (copy), v10 (copy), v13 (copy), l_TelemetryService_0 (copy)
        local v18, v19 = v11(v16);
        if not v18 then
            l_reportWarning_0(v4.default, "EventLogging", v19);
        end;
        if v17 then
            local v20, v21 = v12(v17);
            if not v20 then
                l_reportWarning_0(v4.default, "EventLogging", v21);
            end;
        end;
        local v22 = v3.Dictionary.join(v16, {
            videoEngagementEventType = l_VideoEngagementEvents_0.VIDEO_ACTION, 
            actionType = v14
        }, v17 or v10);
        local v23 = v3.Dictionary.join(v13, {
            eventContext = v15
        });
        l_TelemetryService_0:LogEvent(v23, {
            standardizedFields = {
                "addSessionInfo", 
                v4.StandardizedFields.addOsInfo
            }, 
            customFields = v22
        });
    end
};