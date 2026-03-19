local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksIXPLogging);
local v6 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure);
local v7 = game:DefineFastString("WidgetLayer", "AvatarMarketplace.WidgetPlatform");
local function v9(v8) --[[ Line: 21 ]] --[[ Name: dummyTest ]]
    -- upvalues: v4 (copy)
    return v4.defineIXPTest({
        name = v8 .. "DummyTest", 
        layer = v8, 
        recordExposure = false, 
        getDependentFlagsEnabled = function() --[[ Line: 30 ]] --[[ Name: getDependentFlagsEnabled ]]
            return true;
        end, 
        getEnabledFlag = function() --[[ Line: 34 ]] --[[ Name: getEnabledFlag ]]
            return true;
        end, 
        getEnabledForAllFlag = function() --[[ Line: 38 ]] --[[ Name: getEnabledForAllFlag ]]
            return false;
        end, 
        variables = {}
    });
end;
return {
    Editor = v9(l_AppUserLayers_0.AvatarMarketplaceEditor), 
    RelevanceRecommendations = v9("AvatarMarketplace.RelevanceRecommendations"), 
    RecommendationsAndSearch = v9(l_AppUserLayers_0.AvatarMarketplaceDefaultRecSearchLayer), 
    ItemDetailsPage = v9(l_AppUserLayers_0.AvatarMarketplaceItemDetailsPage), 
    Widgets = v9(v7), 
    SearchWidgets = if v5() then v9("AvatarMarketplace.SearchPageWidgetPlatform") else nil, 
    Sorts = if not v5() and v6() then nil else v9("AvatarMarketplace.Sorts")
};