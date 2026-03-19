local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Categories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Constants.Categories;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v14 = {
    [l_Categories_0.Animations] = {
        title = "Feature.Avatar.Title.ClearAnimationsConfirmation", 
        message = "Feature.Avatar.Message.ClearAnimations"
    }, 
    [l_Categories_0.Accessories] = {
        title = "Feature.Avatar.Title.ClearAccessoriesConfirmation", 
        message = "Feature.Avatar.Message.ClearAccessories"
    }, 
    [l_Categories_0.Body] = {
        title = "Feature.Avatar.Title.ClearBodyConfirmation", 
        message = "Feature.Avatar.Message.ClearBody"
    }, 
    [l_Categories_0.Clothing] = {
        title = "Feature.Avatar.Title.ClearClothesConfirmation", 
        message = "Feature.Avatar.Message.ClearClothes"
    }, 
    [l_Categories_0.Makeup] = if l_FFlagAXCustomizeMakeupSupport_0 then {
        title = "Feature.Avatar.Title.ClearMakeupConfirmation", 
        message = "Feature.Avatar.Message.ClearMakeupConfirmation"
    } else nil
};
local function v16(v15) --[[ Line: 51 ]] --[[ Name: selectScreenSize ]]
    return v15.ScreenSize;
end;
return (v12(function(_) --[[ Line: 55 ]] --[[ Name: SlotEditorClearAllConfirmationPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_useSelector_0 (copy), v16 (copy), l_useLocalization_0 (copy), v14 (copy), l_useCallback_0 (copy), v9 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = l_useSelector_0(v16);
    local v20 = v18.getParam("slotCategory");
    local v21 = v18.getParam("clearAll");
    local v22 = l_useLocalization_0({
        confirmationModalTitle = v14[v20].title, 
        confirmationModalDescription = v14[v20].message, 
        confirmationModalLeftButton = "Feature.Avatar.Action.Cancel", 
        confirmationModalRightButton = "Feature.Avatar.Action.Clear"
    });
    local v23 = l_useCallback_0(function() --[[ Line: 68 ]]
        -- upvalues: v9 (ref), v18 (copy)
        v9.closeFocusedScreen(v18);
    end, {
        v18
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v22.confirmationModalTitle, 
        bodyText = v22.confirmationModalDescription, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v23, 
                        text = v22.confirmationModalLeftButton
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
                            -- upvalues: v21 (copy), v23 (copy)
                            v21();
                            v23();
                        end, 
                        text = v22.confirmationModalRightButton
                    }
                }
            }
        }, 
        screenSize = v19
    });
end));