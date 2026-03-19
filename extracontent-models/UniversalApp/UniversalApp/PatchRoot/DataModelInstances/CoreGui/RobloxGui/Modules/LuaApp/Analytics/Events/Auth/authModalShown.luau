local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_authModalShown_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authModalShown;
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseModuleAuthEventsForMonolithAuthEvents);
return function(v5, v6, v7) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), l_authModalShown_0 (copy), l_Logging_0 (copy)
    if v4() then
        l_authModalShown_0(v6, v7);
        return;
    else
        local v8 = {};
        if v7 then
            if type(v7) ~= "string" then
                l_Logging_0.warn("Failure logging authModalShown: Expected state to be a string but got " .. type(v7));
                return;
            else
                v8.state = v7;
            end;
        end;
        v5:setRBXEventStream(v6, "authModalShown", v8);
        return;
    end;
end;