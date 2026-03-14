local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("AXHighResolutionTallTilesEnabled", false);
game:DefineFastFlag("AXHighResolutionTallTilesEnabledForAll", false);
game:DefineFastString("AXHighResolutionTallTilesIXPLayer", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.AXHighResolutionTallTiles", 
    layer = game:GetFastString("AXHighResolutionTallTilesIXPLayer"), 
    getIsUserInExperiment = function(v3) --[[ Line: 27 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.enableHighResolutionTallTiles ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 31 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 35 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXHighResolutionTallTilesEnabled");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 39 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXHighResolutionTallTilesEnabledForAll");
    end, 
    variables = {
        EnableHighResolutionTallTiles = function(v4, v5) --[[ Line: 44 ]] --[[ Name: EnableHighResolutionTallTiles ]]
            return v5 or v4.enableHighResolutionTallTiles or false;
        end
    }
});