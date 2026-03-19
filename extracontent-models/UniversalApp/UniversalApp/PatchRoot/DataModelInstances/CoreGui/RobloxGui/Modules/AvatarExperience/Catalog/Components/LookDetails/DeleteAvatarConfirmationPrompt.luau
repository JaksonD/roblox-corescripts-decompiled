local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.DeleteAvatar);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v17 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v17.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v17.App.Button.Enum.ButtonType;
return (v9((v10(function(v20) --[[ Line: 34 ]] --[[ Name: DeleteAvatarConfirmationPrompt ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v13 (copy), v6 (copy), v5 (copy), v7 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v12 (copy), l_AvatarScreen_0 (copy), v8 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v21 = l_useDispatch_0();
    local v22 = l_useNavigation_0();
    local v23 = v13(v6);
    local v24 = v13(v5);
    local v25 = v7({
        titleText = "Feature.Catalog.Action.DeleteAvatar", 
        messageText = "Feature.Catalog.Label.DeleteAvatarConfirmationPromptMessage", 
        deleteButtonText = "Feature.Catalog.Action.Delete", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    });
    local v26, v27 = v3.useState(false);
    local v29 = l_useSelector_0(function(v28) --[[ Line: 48 ]]
        return v28.ScreenSize;
    end);
    local v30 = v3.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v11 (ref), v22 (copy)
        v11.closeOverlay(v22);
    end, {
        v22
    });
    local v35 = v3.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v27 (copy), v20 (copy), v24 (copy), v21 (copy), v12 (ref), v23 (copy), v11 (ref), v22 (copy), l_AvatarScreen_0 (ref), v8 (ref)
        v27(true);
        local l_lookId_0 = v20.lookId;
        local l_onOverlayClosed_0 = v20.onOverlayClosed;
        local l_v24_0 = v24;
        v21(v12(v23, l_lookId_0)):andThen(function() --[[ Line: 63 ]]
            -- upvalues: v11 (ref), v22 (ref), l_onOverlayClosed_0 (copy), l_AvatarScreen_0 (ref)
            v11.closeOverlay(v22);
            l_onOverlayClosed_0();
            v11.closeTryOnManager(v22, {
                l_AvatarScreen_0.LookDetails
            });
        end):catch(function(_) --[[ Line: 68 ]]
            -- upvalues: l_v24_0 (copy), v8 (ref)
            l_v24_0.sendAXCounterV2(v8.Counter.MySharedAvatars.MySharedAvatarsDeleteAvatarError);
        end):finally(function() --[[ Line: 71 ]]
            -- upvalues: v27 (ref)
            v27(false);
        end);
    end, {
        v20.lookId, 
        v20.onOverlayClosed, 
        v23, 
        v24, 
        v22, 
        v26
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v25.titleText, 
        bodyText = v25.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v30, 
                        text = v25.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v35, 
                        text = v25.deleteButtonText, 
                        isLoading = v26
                    }
                }
            }
        }, 
        screenSize = v29
    });
end))));