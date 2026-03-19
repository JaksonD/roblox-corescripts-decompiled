local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v3 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
game:DefineFastFlag("AXShareButtonOnActionBarIXPEnabled", false);
game:DefineFastFlag("AXShareButtonOnActionBarIXPEnabledForAll", false);
return v3.defineIXPTest({
    name = "AvatarMarketplace.ItemDetails.ShareButtonProfileration", 
    layer = l_AppUserLayers_0.AvatarExperienceUAActionBarView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v6) --[[ Line: 31 ]] --[[ Name: getIsUserInExperiment ]]
        return v6.showShareButtonOnActionBar ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 35 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 39 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXShareButtonOnActionBarIXPEnabled");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 43 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXShareButtonOnActionBarIXPEnabledForAll");
    end, 
    variables = {
        ShowShareButtonOnActionBar = function(v7, v8) --[[ Line: 48 ]] --[[ Name: ShowShareButtonOnActionBar ]]
            -- upvalues: l_sendAXCounterV2_0 (copy), v5 (copy)
            l_sendAXCounterV2_0(v5.Counter.ShareButtonProfileration.Experiment, {
                variant = v7.showShareButtonOnActionBar == nil and "nil" or v7.showShareButtonOnActionBar and "treatment" or "control"
            });
            return v8 or v7.showShareButtonOnActionBar;
        end
    }
});