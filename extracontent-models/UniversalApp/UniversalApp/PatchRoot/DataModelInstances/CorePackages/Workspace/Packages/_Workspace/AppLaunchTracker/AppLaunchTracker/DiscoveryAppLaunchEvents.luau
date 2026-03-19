local l_Parent_0 = script:FindFirstAncestor("AppLaunchTracker").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local _ = require(script.Parent.AppLaunchTrackerTypes);
local v3 = game:DefineFastInt("DiscoveryAppLaunchMilestonesHundredthsPercent", 0);
local v4 = game:DefineFastInt("DiscoveryAppLaunchErrorHundredthsPercent", 0);
local v5 = {
    eventName = "DiscoveryAppLaunch_Milestones", 
    backends = {
        v1.TelemetryBackends.Points, 
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v3, 
    lastUpdated = {
        24, 
        11, 
        4
    }, 
    description = "App launch rodux actions", 
    links = ""
};
local v6 = {
    eventName = "DiscoveryAppLaunch_Error", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        24, 
        11, 
        4
    }, 
    description = "Error related to discovery app launch metric tracking"
};
return {
    reportStatsforMilestone = function(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 37 ]] --[[ Name: reportStatsforMilestone ]]
        -- upvalues: v3 (copy), v5 (copy)
        assert(v7, "LoggingProtocol must exist");
        if v3 > 0 then
            local v17 = {
                milestone = v8, 
                milestoneSpan = ("%*-%*"):format(v9, v8), 
                durationMs = v10, 
                numTilesInit = v12, 
                numTileRenders = v13, 
                numFeedItems = v14, 
                numFeedRenders = v15, 
                totalSduiDurationMs = v16
            };
            for v18, v19 in v11 do
                v17[v18] = v19;
            end;
            v7:logRobloxTelemetryEvent(v5, {
                v7.StandardizedFields.addOsInfo
            }, v17);
        end;
    end, 
    reportError = function(v20, v21) --[[ Line: 72 ]] --[[ Name: reportError ]]
        -- upvalues: v6 (copy)
        v20:logRobloxTelemetryCounter(v6, 1, {
            errorTag = v21
        });
    end
};