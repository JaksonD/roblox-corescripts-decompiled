local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return v3(function(v10) --[[ Line: 28 ]] --[[ Name: GenericPrompt ]]
    -- upvalues: l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v4 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v12 = l_useSelector_0(function(v11) --[[ Line: 29 ]]
        return v11.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v13 = v4.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v2 (ref), v10 (copy)
        v2.closeOverlay(v10.navigation);
    end, {
        v10.navigation
    });
    return v4.createElement(l_InteractiveAlert_0, {
        title = v10.navigation.state.params.titleText, 
        bodyText = v10.navigation.state.params.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v13, 
                        text = v10.navigation.state.params.buttonText
                    }
                }
            }
        }, 
        screenSize = v12
    });
end);