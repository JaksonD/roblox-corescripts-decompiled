local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Character);
local v6 = require(l_Parent_0.TryOn);
local l_AvatarRoute_0 = v3.Reducers.AvatarRoute;
local v8 = require(l_Parent_0.OutfitTryOn);
local v9 = require(l_Parent_0.Looks);
local v10 = require(l_Parent_0.LastSavedTriedOnOutfit);
local l_HeadRefinementReducer_0 = v2.Reducers.HeadRefinementReducer;
return v1.combineReducers({
    Character = v5, 
    TryOn = v6, 
    AvatarRoute = l_AvatarRoute_0, 
    OutfitTryOn = v8, 
    Looks = v9, 
    LastSavedTriedOnOutfit = v10, 
    HeadRefinement = l_HeadRefinementReducer_0
});