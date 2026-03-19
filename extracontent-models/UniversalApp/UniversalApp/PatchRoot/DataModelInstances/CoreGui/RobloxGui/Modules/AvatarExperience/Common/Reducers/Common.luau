local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.AssetInfos);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.BundleInfos);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.Collectibles);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsExpanded);
local v7 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsPeekView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperienceLoaded);
local v9 = require(l_Modules_0.AvatarExperience.Common.Reducers.PlayEmoteInBackground);
local v10 = require(l_Modules_0.AvatarExperience.Common.Reducers.FullView);
local v11 = require(l_Modules_0.AvatarExperience.Common.Reducers.Widgets);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.combineReducers({
    AssetInfos = v3, 
    BundleInfos = v4, 
    Collectibles = v5, 
    ItemDetailsExpanded = v6, 
    ItemDetailsPeekView = v7, 
    AvatarExperienceLoaded = v8, 
    PlayEmoteInBackground = v9, 
    FullView = v10, 
    Widgets = v11
});