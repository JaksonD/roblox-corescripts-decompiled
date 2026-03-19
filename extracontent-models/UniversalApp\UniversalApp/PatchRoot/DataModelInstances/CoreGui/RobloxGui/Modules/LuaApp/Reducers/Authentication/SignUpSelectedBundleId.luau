local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpSelectedBundleId);
return v2.createReducer("", {
    [v4.name] = function(_, v6) --[[ Line: 9 ]]
        -- upvalues: v3 (copy)
        local l_bundleId_0 = v6.bundleId;
        v3.isTypeOrNil(l_bundleId_0, "string", "action.bundleId from SetSignUpSelectedBundleId");
        return l_bundleId_0;
    end
});