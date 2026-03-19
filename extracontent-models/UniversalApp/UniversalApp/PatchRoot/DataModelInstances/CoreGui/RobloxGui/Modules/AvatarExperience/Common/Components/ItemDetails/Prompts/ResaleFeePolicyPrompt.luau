local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return v7(function(v11) --[[ Line: 23 ]] --[[ Name: ResaleFeePolicyPrompt ]]
    -- upvalues: l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v6 (copy), l_useLocalization_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v13 = l_useSelector_0(function(v12) --[[ Line: 24 ]]
        return v12.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v14 = v2.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v6 (ref), v11 (copy)
        v6.closeOverlay(v11.navigation);
    end, {
        v11.navigation
    });
    local v15 = l_useLocalization_0({
        titleText = "Feature.Catalog.Label.ResaleFeePolicy", 
        bodyText = "Feature.Catalog.Message.ResaleFeePolicy", 
        gotItButtonText = "Feature.Avatar.Action.GotIt"
    });
    local v16 = v15.bodyText:gsub("({yourSharePercent})", v11.navigation.state.params.yourSharePercent):gsub("({robloxFeePercent})", v11.navigation.state.params.robloxFeePercent);
    return v2.createElement(l_InteractiveAlert_0, {
        title = v15.titleText, 
        bodyText = v16, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14, 
                        text = v15.gotItButtonText
                    }
                }
            }
        }, 
        screenSize = v13
    });
end);