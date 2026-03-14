local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("AXCombineGetOutfitDispatchesIXP3", false);
game:DefineFastFlag("AXCombineGetOutfitDispatchesIXPForAll3", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.CombineGetOutfitDispatches", 
    layer = game:DefineFastString("AXCombineGetOutfitDispatchesIXPLayer3", l_AppUserLayers_0.AvatarExperienceUACustomizeView), 
    recordExposure = false, 
    getIsUserInExperiment = function(v3) --[[ Line: 29 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.combineGetOutfitDispatches ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 33 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 37 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXCombineGetOutfitDispatchesIXP3");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 41 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXCombineGetOutfitDispatchesIXPForAll3");
    end, 
    variables = {
        EnabledForUser = function(v4, v5) --[[ Line: 46 ]] --[[ Name: EnabledForUser ]]
            return v5 or v4.combineGetOutfitDispatches or false;
        end
    }
});