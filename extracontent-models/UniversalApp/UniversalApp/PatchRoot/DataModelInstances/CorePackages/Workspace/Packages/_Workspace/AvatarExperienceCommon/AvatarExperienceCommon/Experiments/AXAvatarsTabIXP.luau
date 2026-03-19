local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXAvatarsTabIXP_0 = v3.FFlagAXAvatarsTabIXP;
local l_FFlagAXAvatarsTabIXPEnabledForAll_0 = v3.FFlagAXAvatarsTabIXPEnabledForAll;
return v2.defineIXPTest({
    name = "AvatarExperience.UA.MarketplaceView.AvatarsTab", 
    layer = l_AppUserLayers_0.AvatarExperienceUAMarketplaceView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v6) --[[ Line: 27 ]] --[[ Name: getIsUserInExperiment ]]
        return v6.IsAvatarsTabEnabled ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 31 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 35 ]] --[[ Name: getEnabledFlag ]]
        -- upvalues: l_FFlagAXAvatarsTabIXP_0 (copy)
        return l_FFlagAXAvatarsTabIXP_0;
    end, 
    getEnabledForAllFlag = function() --[[ Line: 39 ]] --[[ Name: getEnabledForAllFlag ]]
        -- upvalues: l_FFlagAXAvatarsTabIXPEnabledForAll_0 (copy)
        return l_FFlagAXAvatarsTabIXPEnabledForAll_0;
    end, 
    variables = {
        EnabledForUser = function(v7, v8) --[[ Line: 44 ]] --[[ Name: EnabledForUser ]]
            return v8 or v7.IsAvatarsTabEnabled or false;
        end
    }
});