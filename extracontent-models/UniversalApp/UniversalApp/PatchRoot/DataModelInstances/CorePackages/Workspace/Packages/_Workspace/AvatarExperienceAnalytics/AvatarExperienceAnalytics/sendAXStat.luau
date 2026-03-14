local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v4 = require(l_Parent_0.Dash);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v6 = require(script.Parent.AnalyticsService);
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local function v11(v8) --[[ Line: 16 ]] --[[ Name: getAXStatMetadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v10 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = l_l_UserInputService_0_Platform_0
    };
    if v8 and next(v8) ~= nil then
        v10 = v4.assign({}, v10, v8);
    end;
    return v10;
end;
return function(v12) --[[ Line: 46 ]] --[[ Name: sendAXStat ]]
    -- upvalues: v11 (copy), l_default_0 (copy), v6 (copy)
    if not v12.excludeStat then
        local v13 = {
            eventName = v12.statName, 
            backends = {
                "RobloxTelemetryStat"
            }, 
            lastUpdated = {
                2024, 
                11, 
                19
            }, 
            description = "Stat to track Avatar Experience latency.", 
            links = ""
        };
        local v14 = v11(v12.metaData);
        l_default_0:logRobloxTelemetryStat(v13, v12.deltaMs, v14);
    end;
    if not v12.excludeTelemetry then
        local v15 = {
            deltaMs = v12.deltaMs, 
            metricName = v12.statName
        };
        if v12.metaData then
            v15.coldStart = v12.metaData.ColdStart;
            v15.category = v12.metaData.Category;
            v15.subcategory = v12.metaData.Subcategory;
            v15.page = v12.metaData.Page;
            v15.opaquePage = v12.metaData.OpaquePage;
        end;
        local v16 = v11();
        v15.appVersion = v16.AppVersion;
        v15.userAgent = v16.UserAgent;
        v15.coreScriptVersion = v16.CoreScriptVersion;
        v15.platform = v16.Platform;
        local v17 = if v12.customEventStreamSchemaName then v12.customEventStreamSchemaName else "marketplacePerformanceMetric";
        v6.EventStream:sendEventDeferred(v12.statName, v17, v15);
    end;
end;