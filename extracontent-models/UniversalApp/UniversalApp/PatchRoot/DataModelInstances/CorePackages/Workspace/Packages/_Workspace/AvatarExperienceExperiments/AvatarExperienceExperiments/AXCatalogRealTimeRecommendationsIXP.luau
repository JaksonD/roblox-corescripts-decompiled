local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceExperiments").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
local v3 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPV2", false);
local v4 = game:DefineFastFlag("AXCatalogRealTimeRecommendationsIXPEnabledForAllV2", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.PerfCatalogRealTimeRecommendations", 
    layer = l_AppUserLayers_0.AvatarExperienceUAMarketplaceView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v5) --[[ Line: 26 ]] --[[ Name: getIsUserInExperiment ]]
        return v5.catalogRealTimeRecommendations ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 30 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 34 ]] --[[ Name: getEnabledFlag ]]
        -- upvalues: v3 (copy)
        return v3;
    end, 
    getEnabledForAllFlag = function() --[[ Line: 38 ]] --[[ Name: getEnabledForAllFlag ]]
        -- upvalues: v4 (copy)
        return v4;
    end, 
    variables = {
        UserIsInExperiment = function(v6, v7) --[[ Line: 43 ]] --[[ Name: UserIsInExperiment ]]
            return v7 or v6.catalogRealTimeRecommendations ~= nil;
        end, 
        EnabledForUser = function(v8, v9) --[[ Line: 46 ]] --[[ Name: EnabledForUser ]]
            return v9 or v8.catalogRealTimeRecommendations or false;
        end
    }
});