local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("AXItemDetails3DPreviewEnabled", false);
game:DefineFastFlag("AXItemDetails3DPreviewEnabledForAll", false);
game:DefineFastString("AXItemDetails3DPreviewIXPLayer", l_AppUserLayers_0.AvatarExperienceUAItemDetailsView);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.AXItemDetails3DPreview", 
    layer = game:GetFastString("AXItemDetails3DPreviewIXPLayer"), 
    recordExposure = false, 
    getIsUserInExperiment = function(v3) --[[ Line: 30 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.enableItemDetails3DPreview ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 34 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 38 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXItemDetails3DPreviewEnabled");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 42 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXItemDetails3DPreviewEnabledForAll");
    end, 
    variables = {
        EnableItemDetails3DPreview = function(v4, v5) --[[ Line: 47 ]] --[[ Name: EnableItemDetails3DPreview ]]
            return v5 or v4.enableItemDetails3DPreview or false;
        end
    }
});