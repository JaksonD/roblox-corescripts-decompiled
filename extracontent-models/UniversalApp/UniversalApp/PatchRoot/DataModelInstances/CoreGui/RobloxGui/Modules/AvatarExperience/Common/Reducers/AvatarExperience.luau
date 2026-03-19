local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarScene);
local v4 = require(l_Modules_0.AvatarExperience.Common.Reducers.ExternalNavigationRequest);
local v5 = require(l_Modules_0.AvatarExperience.Common.Reducers.Common);
local v6 = require(l_Modules_0.AvatarExperience.Common.Reducers.AnalyticsMetadata);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.AvatarEditor);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Catalog);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Reducers.ProfilePictureEditor);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.AvatarAutocompleteSuggestions);
local v11 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Reducers.AccessoryAdjustment);
local v12 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Reducers.LayeredClothingSort);
local v13 = require(l_Modules_0.AvatarExperience.Common.Reducers.CameraButton);
return v2.combineReducers({
    AnalyticsMetadata = v6, 
    AvatarEditor = v7, 
    Catalog = v8, 
    ProfilePictureEditor = v9, 
    Common = v5, 
    AvatarScene = v3, 
    ExternalNavigationRequest = v4, 
    AvatarAutocompleteSuggestions = v10, 
    AccessoryAdjustment = v11, 
    LayeredClothingSort = v12, 
    CameraButton = v13
});