local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExternalAttribution");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local _ = require(l_Parent_0.AppStartup);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v9 = require(l_script_FirstAncestor_0.Utils);
local v10 = require(l_script_FirstAncestor_0.TelemetryConfigs);
local l_GetFFlagEnableLuaAppsAppsflyerIdCounter_0 = require(l_script_FirstAncestor_0.Flags).GetFFlagEnableLuaAppsAppsflyerIdCounter;
return {
    attributeV2 = function(v12, v13) --[[ Line: 24 ]]
        -- upvalues: v3 (copy), l_LinkingProtocol_0 (copy), l_GetFFlagEnableLuaAppsAppsflyerIdCounter_0 (copy), l_default_0 (copy), v10 (copy), l_HttpService_0 (copy), v9 (copy), l_Url_0 (copy)
        return v3.new(function(v14) --[[ Line: 25 ]]
            -- upvalues: l_LinkingProtocol_0 (ref), l_GetFFlagEnableLuaAppsAppsflyerIdCounter_0 (ref), l_default_0 (ref), v10 (ref), l_HttpService_0 (ref), v9 (ref), v13 (copy), l_Url_0 (ref), v12 (copy)
            local _, v16 = l_LinkingProtocol_0.default:getUID():await();
            if l_GetFFlagEnableLuaAppsAppsflyerIdCounter_0() then
                l_default_0:logRobloxTelemetryCounter(v10.AppsflyerIdTotalCounter);
                if v16 == nil or v16 == "" then
                    l_default_0:logRobloxTelemetryCounter(v10.AppsflyerIdFailureCounter);
                end;
            end;
            if v16 == nil then
                v16 = "";
            end;
            local v17 = l_HttpService_0:JSONEncode({
                appsflyerId = v16, 
                eventType = v9.parseLaunchContextToPostAuthenticationEventType(v13)
            });
            local v18 = string.format("%sattribution/v1/events/post-authentication", l_Url_0.APIS_URL);
            v12(v18, "POST", {
                postBody = v17
            }):await();
            v14();
        end);
    end
};