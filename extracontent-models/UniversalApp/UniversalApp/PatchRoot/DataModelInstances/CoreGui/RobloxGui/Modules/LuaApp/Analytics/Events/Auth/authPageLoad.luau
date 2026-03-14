local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_authPageload_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authPageload;
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseModuleAuthEventsForMonolithAuthEvents);
return function(v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), l_authPageload_0 (copy), l_Logging_0 (copy)
    if v4() then
        l_authPageload_0(v6, v7, v8);
        return;
    else
        local v9 = {};
        if v7 then
            if type(v7) ~= "string" then
                l_Logging_0.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(v7));
                return;
            else
                v9.state = v7;
            end;
        end;
        if v8 ~= nil then
            if type(v8) ~= "boolean" then
                l_Logging_0.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(v8));
                return;
            else
                v9.is_alt_attempt = v8;
            end;
        end;
        v5:setRBXEventStream(v6, "authPageload", v9);
        return;
    end;
end;