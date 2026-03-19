local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceExperiments").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
local v3 = game:DefineFastFlag("AXPrefetchMarketplaceIXP5", false);
local v4 = game:DefineFastFlag("AXPrefetchMarketplaceIXPEnabledForAll5", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.PrefetchMarketplace", 
    layer = l_AppUserLayers_0.AvatarExperienceUAMarketplaceView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v5) --[[ Line: 24 ]] --[[ Name: getIsUserInExperiment ]]
        return v5.enableMarketplacePrefetch ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 28 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 32 ]] --[[ Name: getEnabledFlag ]]
        -- upvalues: v3 (copy)
        return v3;
    end, 
    getEnabledForAllFlag = function() --[[ Line: 36 ]] --[[ Name: getEnabledForAllFlag ]]
        -- upvalues: v4 (copy)
        return v4;
    end, 
    variables = {
        UserIsInExperiment = function(v6, v7) --[[ Line: 41 ]] --[[ Name: UserIsInExperiment ]]
            return v7 or v6.enableMarketplacePrefetch ~= nil;
        end, 
        EnabledForUser = function(v8, v9) --[[ Line: 44 ]] --[[ Name: EnabledForUser ]]
            return v9 or v8.enableMarketplacePrefetch or false;
        end
    }
});