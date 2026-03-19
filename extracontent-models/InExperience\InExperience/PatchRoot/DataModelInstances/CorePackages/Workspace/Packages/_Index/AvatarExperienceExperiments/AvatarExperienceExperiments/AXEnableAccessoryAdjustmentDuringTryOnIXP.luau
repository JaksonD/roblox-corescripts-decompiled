local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceExperiments").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2", false);
game:DefineFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.EnableAccessoryAdjustmentDuringTryOn2", 
    layer = l_AppUserLayers_0.AvatarExperienceUAAllViews, 
    recordExposure = false, 
    getIsUserInExperiment = function(v3) --[[ Line: 22 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 27 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 31 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOn2");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 35 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXEnableAccessoryAdjustmentDuringTryOnForAll2");
    end, 
    variables = {
        EnabledForUser = function(v4, v5) --[[ Line: 40 ]] --[[ Name: EnabledForUser ]]
            return v5 or v4.enableAccessoryAdjustmentQuickEntryButtonDuringTryOn or false;
        end
    }
});