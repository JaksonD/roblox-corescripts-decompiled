local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local function v13(v12) --[[ Line: 20 ]] --[[ Name: selectScreenSize ]]
    return v12.ScreenSize;
end;
return (v11((v10(function(v14) --[[ Line: 24 ]] --[[ Name: LooksConfirmationPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_useSelector_0 (copy), v13 (copy), l_useLocalization_0 (copy), v2 (copy), v7 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v15 = l_useNavigation_0();
    local v16 = l_useSelector_0(v13);
    local v17 = l_useLocalization_0({
        confirmationModalTitle = "Feature.Avatar.Title.UnsavedChanges", 
        confirmationModalDescription = "Feature.Avatar.Message.LeavingComposerWithoutSave", 
        confirmationModalLeftButton = "Feature.Avatar.Action.Stay", 
        confirmationModalRightButton = "Feature.Avatar.Action.Leave"
    });
    local v18 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v15 (copy)
        v7.closeFocusedScreen(v15);
    end, {
        v15
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v17.confirmationModalTitle, 
        bodyText = v17.confirmationModalDescription, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v18, 
                        text = v17.confirmationModalLeftButton
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14.onOverlayClosed, 
                        text = v17.confirmationModalRightButton
                    }
                }
            }
        }, 
        screenSize = v16
    });
end))));