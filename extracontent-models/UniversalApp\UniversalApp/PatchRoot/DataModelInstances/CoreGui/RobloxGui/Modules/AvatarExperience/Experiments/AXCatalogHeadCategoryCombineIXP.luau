local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v4 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableHeadCombineHeadPickerIXPTogether);
game:DefineFastFlag("AXHeadCategoryCombineEnabled4", false);
game:DefineFastFlag("AXHeadCategoryCombineEnabledForAll4", false);
return v4.defineIXPTest({
    name = "AvatarMarketplace.Catalog.HeadCategoryCombine", 
    layer = l_AppUserLayers_0.AvatarExperienceUACustomizeView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v6) --[[ Line: 34 ]] --[[ Name: getIsUserInExperiment ]]
        return v6.enableHeadCategoryCombination ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 38 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 42 ]] --[[ Name: getEnabledFlag ]]
        -- upvalues: v5 (copy)
        return game:GetFastFlag("AXHeadCategoryCombineEnabled4") or v5();
    end, 
    getEnabledForAllFlag = function() --[[ Line: 46 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXHeadCategoryCombineEnabledForAll4");
    end, 
    variables = {
        EnableHeadCategoryCombination = function(v7, v8) --[[ Line: 52 ]] --[[ Name: EnableHeadCategoryCombination ]]
            return v8 or v7.enableHeadCategoryCombination or false;
        end
    }
});