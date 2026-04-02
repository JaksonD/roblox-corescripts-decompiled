local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.AssetInfos);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.BundleInfos);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.Collectibles);
local v7 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsExpanded);
local v8 = require(l_Modules_0.AvatarExperience.Common.Reducers.ItemDetailsPeekView);
local l_AvatarExperienceLoaded_0 = v3.Reducers.AvatarExperienceLoaded;
local v10 = require(l_Modules_0.AvatarExperience.Common.Reducers.PlayEmoteInBackground);
local v11 = require(l_Modules_0.AvatarExperience.Common.Reducers.FullView);
local v12 = require(l_Modules_0.AvatarExperience.Common.Reducers.Widgets);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.combineReducers({
    AssetInfos = v4, 
    BundleInfos = v5, 
    Collectibles = v6, 
    ItemDetailsExpanded = v7, 
    ItemDetailsPeekView = v8, 
    AvatarExperienceLoaded = l_AvatarExperienceLoaded_0, 
    PlayEmoteInBackground = v10, 
    FullView = v11, 
    Widgets = v12
});