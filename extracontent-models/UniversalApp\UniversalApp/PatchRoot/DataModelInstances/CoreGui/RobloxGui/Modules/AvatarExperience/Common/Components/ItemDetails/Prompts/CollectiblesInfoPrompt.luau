local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local function v12(v11) --[[ Line: 24 ]] --[[ Name: selectScreenSize ]]
    return v11.ScreenSize;
end;
return v9(function(v13) --[[ Line: 28 ]] --[[ Name: CollectiblesInfoPrompt ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), v8 (copy), l_useLocalization_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v14 = l_useSelector_0(v12, l_getUseSelectorDeepEquals_0());
    local v15 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v8 (ref), v13 (copy)
        v8.closeOverlay(v13.navigation);
    end, {
        v13.navigation
    });
    local v16 = l_useLocalization_0({
        titleText = "Feature.Catalog.Label.NewCollectibles", 
        bodyText = "Feature.Catalog.Message.CollectiblesInfo", 
        okButtonText = "CommonUI.Messages.Action.OK"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v16.titleText, 
        bodyText = v16.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v15, 
                        text = v16.okButtonText
                    }
                }
            }
        }, 
        screenSize = v14
    });
end);