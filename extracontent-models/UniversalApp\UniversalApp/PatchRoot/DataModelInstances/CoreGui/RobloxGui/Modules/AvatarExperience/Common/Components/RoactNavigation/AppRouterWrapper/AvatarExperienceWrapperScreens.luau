local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetailsScreen);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.ResellersPage);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellPage);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.ItemOwnershipPage);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemPeekView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.TryOnItemScreen);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarBackground);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
return {
    [l_AvatarScreen_0.ItemDetails] = v4, 
    [l_AvatarScreen_0.ResellersPage] = v6, 
    [l_AvatarScreen_0.SellItemPage] = v7, 
    [l_AvatarScreen_0.TryOnItem] = v10, 
    [l_AvatarScreen_0.ItemOwnershipPage] = v8, 
    [l_AvatarScreen_0.SellItemPeekView] = v9, 
    [l_AvatarScreen_0.AvatarBackground] = v12(v11), 
    [l_AvatarScreen_0.OutfitDetails] = v5
};