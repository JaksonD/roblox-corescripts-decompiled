local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Focusable_0 = v7.Focusable;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Overlay_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.Overlay;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v16.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v16.App.Button.Enum.ButtonType;
local l_withSelectionCursorProvider_0 = v16.App.SelectionImage.withSelectionCursorProvider;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local v32 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad;
local l_FFlagAXCharacterToAvatarStrings_0 = v32.FFlagAXCharacterToAvatarStrings;
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = v32.FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local l_FFlagAXFixCustomOutfitNamesDisabled_0 = v32.FFlagAXFixCustomOutfitNamesDisabled;
local v37 = v4.PureComponent:extend("SaveOutfitPrompt");
v37.validateProps = v6.strictInterface({
    lookId = v6.optional(v6.string), 
    onComplete = v6.optional(v6.callback), 
    containerWidth = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v6.optional(v6.number), 
    defaultChildRef = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v6.optional(v6.table), 
    focusController = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v6.optional(v6.table), 
    showCustomOutfitNames = v6.boolean, 
    avatarEditorAnalytics = v6.table, 
    onOverlayClosed = v6.optional(v6.callback), 
    navigation = v6.table, 
    screenSize = v6.Vector2, 
    fetchingState = v6.string, 
    shouldPreloadEditableCostumes = v6.boolean, 
    ownedItemIdsBySubtype = v6.table, 
    outfitInfos = v6.table, 
    combinedTryOnHumanoidDescription = v6.optional(v6.Instance), 
    createOutfit = v6.callback, 
    getEditableUserCostumes = v6.callback, 
    forwardRef = v6.optional(v6.table)
});
v37.init = function(v38) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXFixCustomOutfitNamesDisabled_0 (copy), v24 (copy), v10 (copy), l_AvatarScreen_0 (copy), v21 (copy), v4 (copy), v27 (copy), l_UserInputService_0 (copy)
    v38.getShowCustomCostumeNames = function() --[[ Line: 94 ]]
        -- upvalues: v38 (copy)
        return v38.props.showCustomOutfitNames;
    end;
    v38.outfitName = v38.getShowCustomCostumeNames() and "" or nil;
    v38.isMounted = false;
    v38.checkIsMounted = function() --[[ Line: 101 ]]
        -- upvalues: v38 (copy)
        return v38.isMounted;
    end;
    v38.state = {
        isKeyboardRepositioned = false, 
        isNameInvalid = v38.getShowCustomCostumeNames() and true or false
    };
    v38.saveOutfit = function() --[[ Line: 110 ]]
        -- upvalues: v38 (copy), l_FFlagAXFixCustomOutfitNamesDisabled_0 (ref), v24 (ref), v10 (ref), l_AvatarScreen_0 (ref), v21 (ref)
        if v38.state.isNameInvalid then
            return;
        elseif not v38.getShowCustomCostumeNames() then
            v38.props.createOutfit(l_FFlagAXFixCustomOutfitNamesDisabled_0 and "" or v38.outfitName, v38.props.avatarEditorAnalytics, v38.checkIsMounted, v38.props.onComplete, if v38.props.lookId ~= nil then v38.props.combinedTryOnHumanoidDescription else nil);
            return;
        elseif v24.isDuplicateOutfitName(v38.props.ownedItemIdsBySubtype, v38.props.outfitInfos, v38.outfitName) then
            local l_outfitName_0 = v38.outfitName;
            local function v40() --[[ Line: 134 ]] --[[ Name: saveCallback ]]
                -- upvalues: v38 (ref), l_outfitName_0 (copy)
                v38.props.createOutfit(l_outfitName_0, v38.props.avatarEditorAnalytics, v38.checkIsMounted, v38.props.onComplete, if v38.props.lookId ~= nil then v38.props.combinedTryOnHumanoidDescription else nil);
            end;
            v10.navigateToNextOverlay(v38.props.navigation, l_AvatarScreen_0.DuplicateOutfitNamePrompt, {
                outfitName = v38.outfitName, 
                sourcePrompt = l_AvatarScreen_0.SaveOutfitPrompt, 
                sourceParams = {}, 
                saveCallback = v40, 
                saveFetchingStateKey = v21.CreateOutfitKey
            });
            return;
        else
            v38.props.createOutfit(v38.outfitName, v38.props.avatarEditorAnalytics, v38.checkIsMounted, v38.props.onComplete, if v38.props.lookId ~= nil then v38.props.combinedTryOnHumanoidDescription else nil);
            return;
        end;
    end;
    v38.onOutfitNameUpdated = function(v41, v42) --[[ Line: 164 ]]
        -- upvalues: v38 (copy)
        if not v38.isMounted then
            return;
        else
            v38.outfitName = v41;
            v38:setState({
                isNameInvalid = v42
            });
            return;
        end;
    end;
    v38.renderMiddleContent = function() --[[ Line: 175 ]]
        -- upvalues: v4 (ref), v27 (ref), v38 (copy)
        return v4.createElement(v27, {
            onOutfitNameUpdated = v38.onOutfitNameUpdated
        });
    end;
    v38.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 181 ]]
        -- upvalues: v38 (copy), l_UserInputService_0 (ref)
        if not v38.isMounted then
            return;
        else
            if not v38.state.isKeyboardRepositioned and l_UserInputService_0.OnScreenKeyboardVisible then
                v38:setState({
                    isKeyboardRepositioned = true
                });
            end;
            return;
        end;
    end);
    v38.closePrompt = function() --[[ Line: 192 ]]
        -- upvalues: v10 (ref), v38 (copy)
        v10.closeOverlay(v38.props.navigation);
        if v38.props.onComplete then
            v38.props.onComplete();
        end;
    end;
end;
v37.checkFetchEditableOutfits = function(v43) --[[ Line: 200 ]] --[[ Name: checkFetchEditableOutfits ]]
    if v43.props.shouldPreloadEditableCostumes then
        v43.props.getEditableUserCostumes();
    end;
end;
v37.didMount = function(v44) --[[ Line: 207 ]] --[[ Name: didMount ]]
    v44.isMounted = true;
    v44:checkFetchEditableOutfits();
end;
v37.willUpdate = function(v45, v46, _) --[[ Line: 213 ]] --[[ Name: willUpdate ]]
    -- upvalues: v23 (copy)
    if v23.isFetchingDoneOrFailed(v45.props.fetchingState, v46.fetchingState) then
        v45.closePrompt();
    end;
end;
v37.renderAlertLocalized = function(v48, v49) --[[ Line: 219 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: l_UserInputService_0 (copy), v4 (copy), l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (copy), l_Overlay_0 (copy), l_Focusable_0 (copy), v7 (copy), l_InteractiveAlert_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_ButtonType_0 (copy), l_RetrievalStatus_0 (copy)
    local v50 = v48.getShowCustomCostumeNames();
    local l_screenSize_0 = v48.props.screenSize;
    local v52 = UDim2.new(0.5, 0, 0.5, 0);
    if v48.state.isKeyboardRepositioned then
        v52 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
    end;
    return v4.createElement(if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then l_Overlay_0 else l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else {
            NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, v48.closePrompt), 
            Confirm = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 239 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v4.createElement(l_InteractiveAlert_0, {
            isRoactGamepadEnabled = not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 and nil, 
            title = v49.titleText, 
            bodyText = if l_FFlagAXCharacterToAvatarStrings_0 then nil else v50 and v49.messageText or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v48.closePrompt, 
                            text = v49.cancelButtonText
                        }, 
                        isDefaultChild = not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 or nil
                    }, 
                    {
                        buttonType = if l_FFlagAXCharacterToAvatarStrings_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v48.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            isDisabled = v50 and v48.state.isNameInvalid or false, 
                            onActivated = v48.saveOutfit, 
                            text = v49.confirmButtonText
                        }
                    }
                }
            }, 
            middleContent = v50 and v48.renderMiddleContent or nil, 
            isMiddleContentFocusable = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v50, 
            position = v52, 
            screenSize = v48.props.screenSize, 
            defaultChildRef = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v48.props.defaultChildRef
        })
    });
end;
v37.render = function(v53) --[[ Line: 285 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        titleText = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Title.AvatarName" or "Feature.Avatar.Heading.SaveCostume", 
        messageText = "Feature.Avatar.Label.EnterCostumeName", 
        confirmButtonText = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Add" or "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Action.Cancel", 
        warningText = "Feature.Avatar.Label.CostumeWarning"
    })(function(v54) --[[ Line: 296 ]]
        -- upvalues: l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (ref), v53 (copy), l_withSelectionCursorProvider_0 (ref)
        if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then
            return v53:renderAlertLocalized(v54);
        else
            return l_withSelectionCursorProvider_0(function(v55) --[[ Line: 300 ]]
                -- upvalues: v53 (ref), v54 (copy)
                return v53:renderAlertLocalized(v54, v55);
            end);
        end;
    end);
end;
v37.didUpdate = function(v56, _, _) --[[ Line: 306 ]] --[[ Name: didUpdate ]]
    v56:checkFetchEditableOutfits();
end;
v37.willUnmount = function(v59) --[[ Line: 310 ]] --[[ Name: willUnmount ]]
    v59.keyboardConnection:disconnect();
    v59.keyboardConnection = nil;
    v59.isMounted = false;
end;
v37 = v5.connect(function(v60, v61) --[[ Line: 316 ]]
    -- upvalues: v22 (copy), l_PerformFetch_0 (copy), v21 (copy), v29 (copy)
    local v62 = if v61.lookId ~= nil then v22.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v60) else nil;
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v60, v21.CreateOutfitKey), 
        screenSize = v60.ScreenSize, 
        shouldPreloadEditableCostumes = v29(v60), 
        ownedItemIdsBySubtype = v60.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        outfitInfos = v60.AvatarExperience.AvatarEditor.OutfitInfos, 
        combinedTryOnHumanoidDescription = v62
    };
end, function(v63) --[[ Line: 328 ]]
    -- upvalues: v30 (copy), v31 (copy)
    return {
        createOutfit = function(v64, v65, v66, v67, v68) --[[ Line: 330 ]] --[[ Name: createOutfit ]]
            -- upvalues: v63 (copy), v30 (ref)
            v63(v30(v64, v65, v66, v67, v68));
        end, 
        getEditableUserCostumes = function() --[[ Line: 333 ]] --[[ Name: getEditableUserCostumes ]]
            -- upvalues: v63 (copy), v31 (ref)
            return v63(v31());
        end
    };
end)(v37);
v37 = l_RoactAppPolicy_0.connect(function(v69, _) --[[ Line: 339 ]]
    return {
        showCustomOutfitNames = v69.getCustomOutfitNames()
    };
end)(v37);
v37 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v28
})(v37);
if not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then
    v37 = v26(v37);
end;
v37 = v25(v37);
return v4.forwardRef(function(v71, v72) --[[ Line: 355 ]]
    -- upvalues: v4 (copy), v37 (ref), v3 (copy)
    return v4.createElement(v37, v3.Dictionary.join(v71, {
        forwardRef = v72
    }));
end);