local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.AvatarType);
local v5 = require(l_Parent_0.AvatarScales);
local v6 = require(l_Parent_0.BodyPartRangeIds);
local v7 = require(l_Parent_0.BodyColor3s);
local v8 = require(l_Parent_0.OwnedItemIdsBySubtype);
local v9 = require(l_Parent_0.EquippedAssets);
local v10 = require(l_Parent_0.OutfitOrAsset);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.combineReducers({
    AvatarType = v4, 
    AvatarScales = v5, 
    BodyColor3s = v7, 
    BodyPartRangeIds = v6, 
    EquippedAssets = v9, 
    OwnedItemIdsBySubtype = v8, 
    OutfitOrAsset = v10
});