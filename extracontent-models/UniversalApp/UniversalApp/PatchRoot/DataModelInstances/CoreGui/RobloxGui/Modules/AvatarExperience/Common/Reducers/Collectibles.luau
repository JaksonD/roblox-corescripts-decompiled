local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesMarketplaceResaleParameters);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
return v2.combineReducers({
    CollectiblesItemInfo = v3, 
    CollectiblesResellableInstances = v4, 
    CollectiblesMarketplaceResaleParameters = v5, 
    CollectiblesResellersInstances = v6
});