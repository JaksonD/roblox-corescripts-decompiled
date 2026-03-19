local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBundles);
return v2.createReducer({}, {
    [v3.name] = function(_, v5) --[[ Line: 8 ]]
        return v5.bundles;
    end
});