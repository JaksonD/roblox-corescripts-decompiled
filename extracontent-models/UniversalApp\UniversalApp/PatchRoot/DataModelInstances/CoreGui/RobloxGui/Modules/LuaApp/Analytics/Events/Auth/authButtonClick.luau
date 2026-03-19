local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_authButtonClick_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authButtonClick;
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseModuleAuthEventsForMonolithAuthEvents);
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), l_authButtonClick_0 (copy), l_Logging_0 (copy)
    if v4() then
        l_authButtonClick_0(v6, v7, v8, v9, v10);
        return;
    else
        local v11 = {};
        if v7 then
            if type(v7) ~= "string" then
                l_Logging_0.warn("Failure logging authButtonClick: Expected btn to be a string but got " .. type(v7));
                return;
            else
                v11.btn = v7;
            end;
        end;
        if v8 then
            if type(v8) ~= "string" then
                l_Logging_0.warn("Failure logging authButtonClick: Expected state to be a string but got " .. type(v8));
                return;
            else
                v11.state = v8;
            end;
        end;
        if v9 then
            if type(v9) ~= "string" then
                l_Logging_0.warn("Failure logging authButtonClick: Expected url to be a string but got " .. type(v9));
                return;
            else
                v11.url = v9;
            end;
        end;
        if v10 ~= nil then
            if type(v10) ~= "boolean" then
                l_Logging_0.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(v10));
                return;
            else
                v11.is_alt_attempt = v10;
            end;
        end;
        v5:setRBXEventStream(v6, "authButtonClick", v11);
        return;
    end;
end;