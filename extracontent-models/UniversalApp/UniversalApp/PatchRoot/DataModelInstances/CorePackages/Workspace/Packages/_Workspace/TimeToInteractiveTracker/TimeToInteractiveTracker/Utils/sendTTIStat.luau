local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("TimeToInteractiveTracker").Parent;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Dash);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local v9 = require(script.Parent.ttiDebugLog);
local _ = require(script.Parent.Parent.Stores.types);
local v11 = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric");
local v12 = game:DefineFastFlag("AXTTIAddNumElementsRendered", false);
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0);
local function v16(v13) --[[ Line: 33 ]] --[[ Name: getDefaultMetadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v6 (copy)
    local v14 = tostring(l_UserInputService_0:GetPlatform());
    if l_isSpatial_0() then
        v14 = "VR";
    end;
    local v15 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = v14
    };
    return v6.assign(v15, v13);
end;
return function(v17) --[[ Line: 56 ]] --[[ Name: sendTTIStat ]]
    -- upvalues: l_RunService_0 (copy), v16 (copy), l_default_0 (copy), v12 (copy), v5 (copy), v11 (copy), v9 (copy)
    if math.clamp(if v17.samplingRateOverride ~= nil then v17.samplingRateOverride else game:GetFastInt("TimeToInteractiveTrackerSampleRate"), 0, 1000) < math.random(1, 1000) and not l_RunService_0:IsStudio() then
        return;
    else
        local v18 = {
            eventName = v17.statName, 
            backends = {
                "RobloxTelemetryStat"
            }, 
            lastUpdated = {
                2026, 
                1, 
                14
            }, 
            description = "Stat to track Time-To-Interactive (TTI) latency metrics.", 
            links = ""
        };
        local v19 = v16(v17.metaData);
        l_default_0:logRobloxTelemetryStat(v18, v17.deltaMs, v19);
        local v20 = {
            deltaMs = v17.deltaMs, 
            metricName = v17.statName
        };
        if v17.metaData then
            v20.coldStart = v17.metaData.coldStart;
            v20.category = v17.metaData.category;
            v20.subcategory = v17.metaData.subcategory;
            v20.page = v17.metaData.page;
            v20.opaquePage = v17.metaData.opaquePage;
            if v12 then
                v20.num_elements_rendered = v17.metaData.numElementsRendered;
            end;
        end;
        local v21 = v16({});
        v20.appVersion = v21.AppVersion;
        v20.userAgent = v21.UserAgent;
        v20.coreScriptVersion = v21.CoreScriptVersion;
        v20.platform = v21.Platform;
        v5.EventStream:sendEventDeferred(v17.statName, v11, v20);
        v9("sendTTIStat", v17.statName, v17.deltaMs, v20);
        return;
    end;
end;