local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Overlay_0 = v3.App.Dialog.Overlay;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
return (v10((v9(function(v13) --[[ Line: 33 ]] --[[ Name: AccessoryAdjustmentUnsavedPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), l_useScreenSize_0 (copy), v2 (copy), l_Focusable_0 (copy), l_Overlay_0 (copy), l_InteractiveAlert_0 (copy), v11 (copy), l_ButtonType_0 (copy)
    local v14 = l_useLocalization_0({
        cancel = "Feature.Avatar.Action.Cancel", 
        title = "Feature.Avatar.Title.UnsavedChanges", 
        bodyText = "Feature.Avatar.Message.LeaveAccessoryAdjustmentWarning", 
        discard = "Feature.Avatar.Action.Discard"
    });
    local v15 = l_useScreenSize_0();
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 100
    }, {
        Overlay = v2.createElement(l_Overlay_0, {
            ZIndex = -1, 
            showGradient = false
        }), 
        InteractiveAlert = v2.createElement(l_InteractiveAlert_0, {
            title = v14.title, 
            bodyText = v14.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = function() --[[ Line: 58 ]] --[[ Name: onActivated ]]
                                -- upvalues: v11 (ref), v13 (copy)
                                v11.closeOverlay(v13.navigation);
                            end, 
                            text = v14.cancel
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                                -- upvalues: v11 (ref), v13 (copy)
                                v11.closeOverlay(v13.navigation);
                                v13.exitCallback();
                            end, 
                            text = v14.discard
                        }, 
                        isDefaultChild = false
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v15, 
            defaultChildRef = v13.defaultChildRef
        })
    });
end))));