local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Parent_0.FavoriteAssets);
local v4 = require(l_Parent_0.FavoriteBundles);
return v2.combineReducers({
    assets = v3, 
    bundles = v4
});