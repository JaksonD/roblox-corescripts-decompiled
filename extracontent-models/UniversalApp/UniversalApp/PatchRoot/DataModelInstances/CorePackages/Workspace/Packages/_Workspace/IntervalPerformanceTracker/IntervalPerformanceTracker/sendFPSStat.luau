local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("IntervalPerformanceTracker").Parent;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Dash);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local function v12(v9) --[[ Line: 18 ]] --[[ Name: getDefaultMetadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v6 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v11 = {
        appVersion = l_RunService_0:GetRobloxVersion(), 
        userAgent = l_HttpService_0:GetUserAgent(), 
        coreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        platform = l_l_UserInputService_0_Platform_0
    };
    return (v6.assign(v11, v9));
end;
return function(v13) --[[ Line: 43 ]] --[[ Name: sendFPSStat ]]
    -- upvalues: v12 (copy), l_default_0 (copy), v5 (copy)
    local v14 = v13.excludeEventStream ~= false;
    local v15 = v12(v13.metaData);
    if not v13.excludeStat then
        local v16 = {
            eventName = v13.statName, 
            backends = {
                "RobloxTelemetryStat"
            }, 
            lastUpdated = {
                2025, 
                4, 
                28
            }, 
            description = "Stat to track FPS metrics.", 
            links = ""
        };
        l_default_0:logRobloxTelemetryStat(v16, v13.interval, v15);
    end;
    if not v14 and v13.eventStreamName then
        v5.EventStream:sendEventDeferred(v13.eventStreamName, "robloxFPSMetrics", v15);
    end;
end;