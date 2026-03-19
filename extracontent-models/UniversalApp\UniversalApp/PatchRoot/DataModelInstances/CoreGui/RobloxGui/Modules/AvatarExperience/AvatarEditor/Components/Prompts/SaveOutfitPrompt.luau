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
local l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad;
local l_FFlagAXCharacterToAvatarStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings;
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local v35 = v4.PureComponent:extend("SaveOutfitPrompt");
v35.validateProps = v6.strictInterface({
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
v35.init = function(v36) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v10 (copy), l_AvatarScreen_0 (copy), v21 (copy), v4 (copy), v27 (copy), l_UserInputService_0 (copy)
    v36.getShowCustomCostumeNames = function() --[[ Line: 94 ]]
        -- upvalues: v36 (copy)
        return v36.props.showCustomOutfitNames;
    end;
    v36.outfitName = v36.getShowCustomCostumeNames() and "" or nil;
    v36.isMounted = false;
    v36.checkIsMounted = function() --[[ Line: 101 ]]
        -- upvalues: v36 (copy)
        return v36.isMounted;
    end;
    v36.state = {
        isKeyboardRepositioned = false, 
        isNameInvalid = v36.getShowCustomCostumeNames() and true or false
    };
    v36.saveOutfit = function() --[[ Line: 110 ]]
        -- upvalues: v36 (copy), v24 (ref), v10 (ref), l_AvatarScreen_0 (ref), v21 (ref)
        if v36.state.isNameInvalid then
            return;
        elseif not v36.getShowCustomCostumeNames() then
            v36.props.createOutfit(v36.outfitName, v36.props.avatarEditorAnalytics, v36.checkIsMounted, v36.props.onComplete, if v36.props.lookId ~= nil then v36.props.combinedTryOnHumanoidDescription else nil);
            return;
        elseif v24.isDuplicateOutfitName(v36.props.ownedItemIdsBySubtype, v36.props.outfitInfos, v36.outfitName) then
            local l_outfitName_0 = v36.outfitName;
            local function v38() --[[ Line: 134 ]] --[[ Name: saveCallback ]]
                -- upvalues: v36 (ref), l_outfitName_0 (copy)
                v36.props.createOutfit(l_outfitName_0, v36.props.avatarEditorAnalytics, v36.checkIsMounted, v36.props.onComplete, if v36.props.lookId ~= nil then v36.props.combinedTryOnHumanoidDescription else nil);
            end;
            v10.navigateToNextOverlay(v36.props.navigation, l_AvatarScreen_0.DuplicateOutfitNamePrompt, {
                outfitName = v36.outfitName, 
                sourcePrompt = l_AvatarScreen_0.SaveOutfitPrompt, 
                sourceParams = {}, 
                saveCallback = v38, 
                saveFetchingStateKey = v21.CreateOutfitKey
            });
            return;
        else
            v36.props.createOutfit(v36.outfitName, v36.props.avatarEditorAnalytics, v36.checkIsMounted, v36.props.onComplete, if v36.props.lookId ~= nil then v36.props.combinedTryOnHumanoidDescription else nil);
            return;
        end;
    end;
    v36.onOutfitNameUpdated = function(v39, v40) --[[ Line: 164 ]]
        -- upvalues: v36 (copy)
        if not v36.isMounted then
            return;
        else
            v36.outfitName = v39;
            v36:setState({
                isNameInvalid = v40
            });
            return;
        end;
    end;
    v36.renderMiddleContent = function() --[[ Line: 175 ]]
        -- upvalues: v4 (ref), v27 (ref), v36 (copy)
        return v4.createElement(v27, {
            onOutfitNameUpdated = v36.onOutfitNameUpdated
        });
    end;
    v36.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 181 ]]
        -- upvalues: v36 (copy), l_UserInputService_0 (ref)
        if not v36.isMounted then
            return;
        else
            if not v36.state.isKeyboardRepositioned and l_UserInputService_0.OnScreenKeyboardVisible then
                v36:setState({
                    isKeyboardRepositioned = true
                });
            end;
            return;
        end;
    end);
    v36.closePrompt = function() --[[ Line: 192 ]]
        -- upvalues: v10 (ref), v36 (copy)
        v10.closeOverlay(v36.props.navigation);
        if v36.props.onComplete then
            v36.props.onComplete();
        end;
    end;
end;
v35.checkFetchEditableOutfits = function(v41) --[[ Line: 200 ]] --[[ Name: checkFetchEditableOutfits ]]
    if v41.props.shouldPreloadEditableCostumes then
        v41.props.getEditableUserCostumes();
    end;
end;
v35.didMount = function(v42) --[[ Line: 207 ]] --[[ Name: didMount ]]
    v42.isMounted = true;
    v42:checkFetchEditableOutfits();
end;
v35.willUpdate = function(v43, v44, _) --[[ Line: 213 ]] --[[ Name: willUpdate ]]
    -- upvalues: v23 (copy)
    if v23.isFetchingDoneOrFailed(v43.props.fetchingState, v44.fetchingState) then
        v43.closePrompt();
    end;
end;
v35.renderAlertLocalized = function(v46, v47) --[[ Line: 219 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: l_UserInputService_0 (copy), v4 (copy), l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (copy), l_Overlay_0 (copy), l_Focusable_0 (copy), v7 (copy), l_InteractiveAlert_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_ButtonType_0 (copy), l_RetrievalStatus_0 (copy)
    local v48 = v46.getShowCustomCostumeNames();
    local l_screenSize_0 = v46.props.screenSize;
    local v50 = UDim2.new(0.5, 0, 0.5, 0);
    if v46.state.isKeyboardRepositioned then
        v50 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
    end;
    return v4.createElement(if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then l_Overlay_0 else l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else {
            NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, v46.closePrompt), 
            Confirm = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 239 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v4.createElement(l_InteractiveAlert_0, {
            isRoactGamepadEnabled = not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 and nil, 
            title = v47.titleText, 
            bodyText = if l_FFlagAXCharacterToAvatarStrings_0 then nil else v48 and v47.messageText or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v46.closePrompt, 
                            text = v47.cancelButtonText
                        }, 
                        isDefaultChild = not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 or nil
                    }, 
                    {
                        buttonType = if l_FFlagAXCharacterToAvatarStrings_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v46.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            isDisabled = v48 and v46.state.isNameInvalid or false, 
                            onActivated = v46.saveOutfit, 
                            text = v47.confirmButtonText
                        }
                    }
                }
            }, 
            middleContent = v48 and v46.renderMiddleContent or nil, 
            isMiddleContentFocusable = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v48, 
            position = v50, 
            screenSize = v46.props.screenSize, 
            defaultChildRef = if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then nil else v46.props.defaultChildRef
        })
    });
end;
v35.render = function(v51) --[[ Line: 285 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        titleText = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Title.AvatarName" or "Feature.Avatar.Heading.SaveCostume", 
        messageText = "Feature.Avatar.Label.EnterCostumeName", 
        confirmButtonText = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Add" or "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Action.Cancel", 
        warningText = "Feature.Avatar.Label.CostumeWarning"
    })(function(v52) --[[ Line: 296 ]]
        -- upvalues: l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 (ref), v51 (copy), l_withSelectionCursorProvider_0 (ref)
        if l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then
            return v51:renderAlertLocalized(v52);
        else
            return l_withSelectionCursorProvider_0(function(v53) --[[ Line: 300 ]]
                -- upvalues: v51 (ref), v52 (copy)
                return v51:renderAlertLocalized(v52, v53);
            end);
        end;
    end);
end;
v35.didUpdate = function(v54, _, _) --[[ Line: 306 ]] --[[ Name: didUpdate ]]
    v54:checkFetchEditableOutfits();
end;
v35.willUnmount = function(v57) --[[ Line: 310 ]] --[[ Name: willUnmount ]]
    v57.keyboardConnection:disconnect();
    v57.keyboardConnection = nil;
    v57.isMounted = false;
end;
v35 = v5.connect(function(v58, v59) --[[ Line: 316 ]]
    -- upvalues: v22 (copy), l_PerformFetch_0 (copy), v21 (copy), v29 (copy)
    local v60 = if v59.lookId ~= nil then v22.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v58) else nil;
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v58, v21.CreateOutfitKey), 
        screenSize = v58.ScreenSize, 
        shouldPreloadEditableCostumes = v29(v58), 
        ownedItemIdsBySubtype = v58.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        outfitInfos = v58.AvatarExperience.AvatarEditor.OutfitInfos, 
        combinedTryOnHumanoidDescription = v60
    };
end, function(v61) --[[ Line: 328 ]]
    -- upvalues: v30 (copy), v31 (copy)
    return {
        createOutfit = function(v62, v63, v64, v65, v66) --[[ Line: 330 ]] --[[ Name: createOutfit ]]
            -- upvalues: v61 (copy), v30 (ref)
            v61(v30(v62, v63, v64, v65, v66));
        end, 
        getEditableUserCostumes = function() --[[ Line: 333 ]] --[[ Name: getEditableUserCostumes ]]
            -- upvalues: v61 (copy), v31 (ref)
            return v61(v31());
        end
    };
end)(v35);
v35 = l_RoactAppPolicy_0.connect(function(v67, _) --[[ Line: 339 ]]
    return {
        showCustomOutfitNames = v67.getCustomOutfitNames()
    };
end)(v35);
v35 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v28
})(v35);
if not l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 then
    v35 = v26(v35);
end;
v35 = v25(v35);
return v4.forwardRef(function(v69, v70) --[[ Line: 355 ]]
    -- upvalues: v4 (copy), v35 (ref), v3 (copy)
    return v4.createElement(v35, v3.Dictionary.join(v69, {
        forwardRef = v70
    }));
end);