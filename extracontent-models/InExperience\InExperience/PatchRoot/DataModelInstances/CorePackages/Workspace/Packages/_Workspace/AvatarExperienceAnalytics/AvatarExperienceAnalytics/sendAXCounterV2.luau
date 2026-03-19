local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v5 = require(l_Parent_0.Dash);
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local function v10(v7) --[[ Line: 15 ]] --[[ Name: getAXCounterV2Metadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v5 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v9 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = l_l_UserInputService_0_Platform_0
    };
    if v7 and next(v7) ~= nil then
        v9 = v5.assign({}, v9, v7);
    end;
    return v9;
end;
return function(v11, v12) --[[ Line: 35 ]] --[[ Name: sendAXCounterV2 ]]
    -- upvalues: l_default_0 (copy), v10 (copy)
    local v13 = {
        eventName = "AvatarExperience_" .. v11, 
        backends = {
            l_default_0.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            10, 
            30
        }, 
        description = "Counter to track various Avatar Experience events.", 
        links = ""
    };
    local v14 = v10(v12);
    l_default_0:logRobloxTelemetryCounter(v13, 1, v14);
end;