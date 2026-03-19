local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v14 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v16 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig);
local v17 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local function v19(v18) --[[ Line: 37 ]] --[[ Name: selectScreenSize ]]
    return v18.ScreenSize;
end;
local function v21(v20) --[[ Line: 41 ]] --[[ Name: selectPpeState ]]
    return v20.AvatarExperience.ProfilePictureEditor;
end;
return (v11((v10(function(v22) --[[ Line: 45 ]] --[[ Name: ProfilePictureEditorRevertToDefaultPrompt ]]
    -- upvalues: l_useDispatch_0 (copy), v6 (copy), v17 (copy), l_useSelector_0 (copy), v19 (copy), v21 (copy), v12 (copy), v15 (copy), v16 (copy), v14 (copy), l_AvatarScreen_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v23 = l_useDispatch_0();
    local v24 = v6(v17);
    local v25 = l_useSelector_0(v19);
    local v26 = l_useSelector_0(v21);
    local function v27() --[[ Line: 52 ]]
        -- upvalues: v12 (ref), v22 (copy)
        v12.closeOverlay(v22.navigation);
    end;
    local function v32() --[[ Line: 56 ]]
        -- upvalues: v26 (copy), v15 (ref), v23 (copy), v16 (ref), v24 (copy), v14 (ref)
        local l_lastSuccessfulPoseEmoteAssetId_0 = v26.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
        local l_rotateSliderValue_0 = v26.CameraSliders.rotateSliderValue;
        local v30 = v15.getYRotDegFromSliderValue(l_rotateSliderValue_0);
        local v31 = v26.ProfilePictureParams.fieldOfViewDeg or 30;
        v23(v16(v24, v14.Closeup, l_lastSuccessfulPoseEmoteAssetId_0, -1, v30, v31));
        v23(v16(v24, v14.FullBody, l_lastSuccessfulPoseEmoteAssetId_0, -1, v30, v31));
    end;
    local function v33() --[[ Line: 90 ]]
        -- upvalues: v32 (copy), v22 (copy), l_AvatarScreen_0 (ref)
        v32();
        if v22.onBack then
            v22.onBack();
            return;
        else
            v22.navigation.navigate(l_AvatarScreen_0.Catalog);
            return;
        end;
    end;
    local v34 = l_useLocalization_0({
        titleText = "Feature.Avatar.Title.RevertToDefault", 
        bodyText = "Feature.Avatar.Message.RevertToDefault", 
        revertButtonText = "Feature.Avatar.Action.Revert", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v34.titleText, 
        bodyText = v34.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v27, 
                        text = v34.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v33, 
                        text = v34.revertButtonText
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        screenSize = v25
    });
end))));