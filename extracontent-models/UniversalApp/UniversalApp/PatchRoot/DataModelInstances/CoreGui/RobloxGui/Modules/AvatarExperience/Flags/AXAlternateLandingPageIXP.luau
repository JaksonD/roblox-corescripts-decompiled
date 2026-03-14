local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v3 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP);
game:DefineFastFlag("AXDefaultAvatarToShopEnabled3", false);
game:DefineFastFlag("AXDefaultAvatarToShopEnabledForAll3", false);
game:DefineFastString("AXDefaultAvatarToShopLayer3", l_AppUserLayers_0.AvatarMarketplaceUILayer);
game:DefineFastFlag("AXDefaultAvatarToShopWidgetEnabled3", false);
if v4() then
    return nil;
else
    return v3.defineIXPTest({
        name = "AXDefaultAvatarToShop", 
        layer = game:GetFastString("AXDefaultAvatarToShopLayer3"), 
        getDependentFlagsEnabled = function() --[[ Line: 40 ]] --[[ Name: getDependentFlagsEnabled ]]
            return true;
        end, 
        getEnabledFlag = function() --[[ Line: 44 ]] --[[ Name: getEnabledFlag ]]
            return game:GetFastFlag("AXDefaultAvatarToShopEnabled3");
        end, 
        getEnabledForAllFlag = function() --[[ Line: 48 ]] --[[ Name: getEnabledForAllFlag ]]
            return game:GetFastFlag("AXDefaultAvatarToShopEnabledForAll3");
        end, 
        cacheVariables = true, 
        variables = {
            EnabledForUser = function(v5, v6) --[[ Line: 57 ]] --[[ Name: EnabledForUser ]]
                local l_avatarExperienceLandingPage_0 = v5.avatarExperienceLandingPage;
                return v6 or l_avatarExperienceLandingPage_0 and l_avatarExperienceLandingPage_0 ~= "default" or false;
            end, 
            GetFullScreenEnabled = function(v8, v9) --[[ Line: 77 ]] --[[ Name: GetFullScreenEnabled ]]
                return v9 or v8.avatarExperienceLandingPage == "shopFullscreen";
            end, 
            Row = function(_, _) --[[ Line: 81 ]] --[[ Name: Row ]]
                return 2;
            end, 
            WidgetEnabled = function(_, _) --[[ Line: 85 ]] --[[ Name: WidgetEnabled ]]
                return game:GetFastFlag("AXDefaultAvatarToShopWidgetEnabled3");
            end
        }
    });
end;