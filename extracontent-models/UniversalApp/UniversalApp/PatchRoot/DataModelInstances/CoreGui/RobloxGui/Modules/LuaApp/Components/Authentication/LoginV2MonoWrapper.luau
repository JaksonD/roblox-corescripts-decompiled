local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v3 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_CorePackages_0.Packages.React);
local l_LoginV2Container_0 = require(l_CorePackages_0.Workspace.Packages.LoginV2).Components.LoginV2Container;
return function() --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_LoginV2Container_0 (copy), v1 (copy), v2 (copy), v3 (copy)
    return v5.createElement(l_LoginV2Container_0, {
        monoDeps = {
            LaunchApp = v1, 
            ResetAppState = v2, 
            Logout = v3
        }
    });
end;