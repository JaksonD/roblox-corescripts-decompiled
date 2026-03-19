local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceExperiments").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
game:DefineFastFlag("AXRemoveBackButtonDesktopClientsEnabled", false);
game:DefineFastFlag("AXRemoveBackButtonDesktopClientsEnabledForAll", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.RemoveBackButtonOnDesktopClients", 
    recordExposure = false, 
    layer = l_AppUserLayers_0.AvatarExperienceUAAllViews, 
    getIsUserInExperiment = function(v3) --[[ Line: 21 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.removeBackButtonOnDesktopClients ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 25 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 29 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXRemoveBackButtonDesktopClientsEnabled");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 33 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXRemoveBackButtonDesktopClientsEnabledForAll");
    end, 
    variables = {
        RemoveBackButtonForUser = function(v4, v5) --[[ Line: 38 ]] --[[ Name: RemoveBackButtonForUser ]]
            return v5 or v4.removeBackButtonOnDesktopClients;
        end
    }
});