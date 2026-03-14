local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("AXCatalogPerfReduxReductionIXP2", false);
game:DefineFastFlag("AXCatalogPerfReduxReductionIXPEnabledForAll2", false);
return v2.defineIXPTest({
    name = "AvatarExperience.UA.MarketplaceView.CatalogPerfReduxReduction", 
    layer = l_AppUserLayers_0.AvatarExperienceUAMarketplaceView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v3) --[[ Line: 28 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.reduceCatalogDispatches ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 32 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 36 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXCatalogPerfReduxReductionIXP2");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 40 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXCatalogPerfReduxReductionIXPEnabledForAll2");
    end, 
    variables = {
        EnabledForUser = function(v4, v5) --[[ Line: 46 ]] --[[ Name: EnabledForUser ]]
            return v5 or v4.reduceCatalogDispatches or false;
        end
    }
});