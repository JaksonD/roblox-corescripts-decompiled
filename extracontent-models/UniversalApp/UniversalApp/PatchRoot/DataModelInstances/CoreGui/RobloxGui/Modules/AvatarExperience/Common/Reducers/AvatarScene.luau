local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Character);
local v5 = require(l_Parent_0.TryOn);
local v6 = require(l_Parent_0.AvatarRoute);
local v7 = require(l_Parent_0.OutfitTryOn);
local v8 = require(l_Parent_0.Looks);
local v9 = require(l_Parent_0.LastSavedTriedOnOutfit);
local l_HeadRefinementReducer_0 = v2.Reducers.HeadRefinementReducer;
return v1.combineReducers({
    Character = v4, 
    TryOn = v5, 
    AvatarRoute = v6, 
    OutfitTryOn = v7, 
    Looks = v8, 
    LastSavedTriedOnOutfit = v9, 
    HeadRefinement = l_HeadRefinementReducer_0
});