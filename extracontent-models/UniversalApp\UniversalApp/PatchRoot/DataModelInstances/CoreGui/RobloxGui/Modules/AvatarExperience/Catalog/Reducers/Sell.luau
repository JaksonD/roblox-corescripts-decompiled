local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.AvailableToSellAssets);
local v4 = require(l_Parent_0.CurrentlySellingAssets);
return v1.combineReducers({
    AvailableToSellAssets = v3, 
    CurrentlySellingAssets = v4
});