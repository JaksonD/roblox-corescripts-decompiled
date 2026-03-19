local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("TimeToInteractiveTracker").Parent;
local v5 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v6 = require(l_Parent_0.Dash);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v8 = require(l_Parent_0.AppCommonLib);
local v9 = require(l_Parent_0.TelemetryService).EventStreamReporter.new(l_default_0);
local l_isSpatial_0 = v8.isSpatial;
local v11 = require(script.Parent.ttiDebugLog);
local v12 = require(script.Parent.Util);
local _ = require(script.Parent.Parent.Stores.types);
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local v15 = game:DefineFastString("TTIMetricsTableName", "marketplacePerformanceMetric");
local v16 = game:DefineFastFlag("AXTTIAddNumElementsRendered", false);
game:DefineFastInt("TimeToInteractiveTrackerSampleRate", 0);
local function v20(v17) --[[ Line: 41 ]] --[[ Name: getDefaultMetadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v6 (copy)
    local v18 = tostring(l_UserInputService_0:GetPlatform());
    if l_isSpatial_0() then
        v18 = "VR";
    end;
    local v19 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = v18
    };
    return v6.assign(v19, v17);
end;
return function(v21) --[[ Line: 65 ]] --[[ Name: sendTTIStat ]]
    -- upvalues: l_RunService_0 (copy), v20 (copy), l_default_0 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v12 (copy), v16 (copy), l_HttpService_0 (copy), v9 (copy), v15 (copy), v5 (copy), v11 (copy)
    if math.clamp(if v21.samplingRateOverride ~= nil then v21.samplingRateOverride else game:GetFastInt("TimeToInteractiveTrackerSampleRate"), 0, 1000) < math.random(1, 1000) and not l_RunService_0:IsStudio() then
        return;
    else
        local v22 = {
            eventName = v21.statName, 
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
        local v23 = v20(v21.metaData);
        l_default_0:logRobloxTelemetryStat(v22, v21.deltaMs, v23);
        if l_FFlagAXTTIEnableMilestones_0 and v21.milestones then
            for _, v25 in (v12.generateMilestoneStats(v21.statName, v21.milestones)) do
                local v26 = table.clone(v22);
                v26.eventName = v25.eventName;
                l_default_0:logRobloxTelemetryStat(v26, v25.deltaMs, v23);
            end;
        end;
        local v27 = {
            deltaMs = v21.deltaMs, 
            metricName = v21.statName
        };
        if v21.metaData then
            v27.coldStart = v21.metaData.coldStart;
            v27.category = v21.metaData.category;
            v27.subcategory = v21.metaData.subcategory;
            v27.page = v21.metaData.page;
            v27.opaquePage = v21.metaData.opaquePage;
            if v16 then
                v27.num_elements_rendered = v21.metaData.numElementsRendered;
            end;
        end;
        local v28 = v20({});
        v27.appVersion = v28.AppVersion;
        v27.userAgent = v28.UserAgent;
        v27.coreScriptVersion = v28.CoreScriptVersion;
        v27.platform = v28.Platform;
        if l_FFlagAXTTIEnableMilestones_0 and v21.milestones then
            local v29 = v12.milestonesToProto(v21.milestones);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
                -- upvalues: l_HttpService_0 (ref), v29 (copy)
                return l_HttpService_0:JSONEncode(v29);
            end);
            if l_status_0 then
                v27.milestones_json = l_result_0;
            end;
        end;
        if l_FFlagAXTTIEnableMilestones_0 then
            v9:sendTelemetryEvent(v15, v15, v27);
        else
            v5.EventStream:sendEventDeferred(v21.statName, v15, v27);
        end;
        v11("sendTTIStat", v21.statName, v21.deltaMs, v27, if l_FFlagAXTTIEnableMilestones_0 then v21.milestones else nil);
        return;
    end;
end;