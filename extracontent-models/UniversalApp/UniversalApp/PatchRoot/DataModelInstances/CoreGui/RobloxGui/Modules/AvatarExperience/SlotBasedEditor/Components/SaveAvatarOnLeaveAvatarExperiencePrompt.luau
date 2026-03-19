local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_Actions_0 = v5.Actions;
local l_SlotBasedEditorAnalytics_0 = v6.Surfaces.SlotBasedEditorAnalytics;
local l_FFlagAXUpdateSaveStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSaveStrings;
local v16 = game:DefineFastFlag("AXEnableCloseButtonOnBlockingSavePrompt", false);
local v17 = game:DefineFastFlag("AXEnableBackgroundCloseBlockingSavePrompt", false);
local function v19(v18) --[[ Line: 32 ]] --[[ Name: selectScreenSize ]]
    return v18.ScreenSize;
end;
return (v12(function(_) --[[ Line: 36 ]] --[[ Name: SaveAvatarOnLeaveAvatarExperiencePrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_useSelector_0 (copy), v19 (copy), l_useLocalization_0 (copy), l_FFlagAXUpdateSaveStrings_0 (copy), l_useCallback_0 (copy), l_Actions_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v2 (copy), v17 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v16 (copy)
    local v21 = l_useNavigation_0();
    local v22 = l_useSelector_0(v19);
    local v23 = v21.getParam("saveAndContinue");
    local v24 = v21.getParam("continueWithoutSave");
    local v25 = l_useLocalization_0({
        saveButtonLabel = "Feature.Avatar.Action.Save", 
        leaveButtonLabel = "Feature.Avatar.Action.Leave", 
        saveTitle = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Title.BlockingSavePrompt" or nil, 
        saveBodyText = l_FFlagAXUpdateSaveStrings_0 and "Feature.Avatar.Label.Message.BlockingSavePrompt" or nil
    });
    local v26 = l_useCallback_0(function() --[[ Line: 49 ]]
        -- upvalues: v21 (copy), l_Actions_0 (ref)
        v21.dispatch(l_Actions_0.back({
            immediate = true
        }));
    end, {
        v21
    });
    local v27 = l_useCallback_0(function() --[[ Line: 55 ]]
        -- upvalues: v23 (copy), l_SlotBasedEditorAnalytics_0 (ref), v26 (copy)
        if v23 then
            v23();
        end;
        l_SlotBasedEditorAnalytics_0.trackSaveBlockPromptSaveClick();
        v26();
    end, {
        v23, 
        v26
    });
    local v28 = l_useCallback_0(function() --[[ Line: 63 ]]
        -- upvalues: v24 (copy), l_SlotBasedEditorAnalytics_0 (ref), v26 (copy)
        if v24 then
            v24();
        end;
        l_SlotBasedEditorAnalytics_0.trackSaveBlockPromptLeaveClick();
        v26();
    end, {
        v24, 
        v26
    });
    return v2.createElement("TextButton", {
        Text = "", 
        AutoButtonColor = false, 
        Selectable = false, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Event.Activated] = function() --[[ Line: 81 ]]
            -- upvalues: v17 (ref), v26 (copy)
            if v17 then
                v26();
            end;
        end, 
        ZIndex = 3
    }, {
        SaveOnLeavePrompt = v2.createElement(l_InteractiveAlert_0, {
            title = if l_FFlagAXUpdateSaveStrings_0 then v25.saveTitle else "Save Avatar?", 
            bodyText = if l_FFlagAXUpdateSaveStrings_0 then v25.saveBodyText else "If you don't save now, you'll lose all changes.", 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v28, 
                            text = v25.leaveButtonLabel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v27, 
                            text = v25.saveButtonLabel
                        }
                    }
                }
            }, 
            screenSize = v22, 
            onCloseClicked = if v16 then v26 else nil
        })
    });
end));