local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v2 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
game:DefineFastFlag("AXEditorRecommendationCarouselEnabled", false);
game:DefineFastFlag("AXEditorRecommendationCarouselEnabledForAll", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.Editor.RecommendationCarousel", 
    layer = l_AppUserLayers_0.AvatarExperienceUACustomizeView, 
    recordExposure = false, 
    getIsUserInExperiment = function(v3) --[[ Line: 28 ]] --[[ Name: getIsUserInExperiment ]]
        return v3.enableAvatarEditorRecommendationCarousel ~= nil;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 32 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 36 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXEditorRecommendationCarouselEnabled");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 40 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXEditorRecommendationCarouselEnabledForAll");
    end, 
    variables = {
        EnableAvatarEditorRecommendationCarousel = function(v4, _) --[[ Line: 45 ]] --[[ Name: EnableAvatarEditorRecommendationCarousel ]]
            local l_enableAvatarEditorRecommendationCarousel_0 = v4.enableAvatarEditorRecommendationCarousel;
            local v7 = true;
            if l_enableAvatarEditorRecommendationCarousel_0 ~= true then
                v7 = false;
            end;
            return v7;
        end
    }
});