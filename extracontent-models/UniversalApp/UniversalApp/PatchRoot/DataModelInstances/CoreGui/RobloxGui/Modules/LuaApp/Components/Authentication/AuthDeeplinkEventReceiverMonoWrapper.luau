local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.React);
local l_AuthDeeplinkEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.AuthDeeplinkEventReceiver;
return function() --[[ Line: 13 ]]
    -- upvalues: v4 (copy), l_AuthDeeplinkEventReceiver_0 (copy), v1 (copy), v2 (copy)
    return v4.createElement(l_AuthDeeplinkEventReceiver_0, {
        monoDeps = {
            LaunchApp = v1, 
            ResetAppState = v2
        }
    });
end;