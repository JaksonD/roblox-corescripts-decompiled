local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Settings.Pages.ShareGame.AppReducer);
return v1.Store.new(v3, nil, {
    v1.thunkMiddleware
});