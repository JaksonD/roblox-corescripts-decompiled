local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_AccountRecoveryContainer_0 = require(l_CorePackages_0.Workspace.Packages.AccountRecovery).Components.AccountRecoveryContainer;
return function() --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_AccountRecoveryContainer_0 (copy), v1 (copy)
    return v3.createElement(l_AccountRecoveryContainer_0, {
        monoDeps = {
            LaunchApp = v1
        }
    });
end;