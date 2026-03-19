local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Focusable_0 = v5.Focusable;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RenameOutfit);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local l_FFlagAXCharacterToAvatarStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXFixDeselectOutfitInManage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage;
local v33 = v3.PureComponent:extend("RenameOutfitPrompt");
v33.validateProps = v7.strictInterface({
    costumeId = v7.string, 
    containerWidth = v7.optional(v7.number), 
    defaultChildRef = v7.optional(v7.table), 
    onOverlayClosed = v7.optional(v7.callback), 
    focusController = v7.optional(v7.table), 
    avatarEditorAnalytics = v7.table, 
    navigation = v7.table, 
    screenSize = v7.Vector2, 
    fetchingState = v7.string, 
    shouldPreloadEditableCostumes = v7.boolean, 
    ownedItemIdsBySubtype = v7.table, 
    outfitInfos = v7.table, 
    renameOutfit = v7.callback, 
    getEditableUserCostumes = v7.callback
});
v33.init = function(v34) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), v21 (copy), v13 (copy), l_AvatarScreen_0 (copy), v3 (copy), v26 (copy), l_UserInputService_0 (copy)
    v34:setState({
        isKeyboardRepositioned = false, 
        costumeName = "", 
        isNameInvalid = true
    });
    v34.renameOutfit = function() --[[ Line: 91 ]]
        -- upvalues: v34 (copy), v23 (ref), v21 (ref), v13 (ref), l_AvatarScreen_0 (ref)
        if v34.state.isNameInvalid then
            return;
        else
            local l_costumeName_0 = v34.state.costumeName;
            if v23.isDuplicateOutfitName(v34.props.ownedItemIdsBySubtype, v34.props.outfitInfos, l_costumeName_0) then
                local l_costumeId_0 = v34.props.costumeId;
                local function v37() --[[ Line: 106 ]]
                    -- upvalues: v34 (ref), l_costumeId_0 (copy), l_costumeName_0 (copy)
                    v34.props.renameOutfit(v34.props.avatarEditorAnalytics, l_costumeId_0, l_costumeName_0);
                end;
                local v38 = v21.RenameOutfitKey .. l_costumeId_0;
                v13.navigateToNextOverlay(v34.props.navigation, l_AvatarScreen_0.DuplicateOutfitNamePrompt, {
                    outfitName = l_costumeName_0, 
                    sourcePrompt = l_AvatarScreen_0.RenameOutfitPrompt, 
                    sourceParams = {
                        costumeId = v34.props.costumeId
                    }, 
                    saveCallback = v37, 
                    saveFetchingStateKey = v38
                });
                return;
            else
                v34.props.renameOutfit(v34.props.avatarEditorAnalytics, v34.props.costumeId, l_costumeName_0);
                return;
            end;
        end;
    end;
    v34.onOutfitNameUpdated = function(v39, v40) --[[ Line: 127 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            costumeName = v39, 
            isNameInvalid = v40
        });
    end;
    v34.renderMiddleContent = function() --[[ Line: 134 ]]
        -- upvalues: v3 (ref), v26 (ref), v34 (copy)
        return v3.createElement(v26, {
            onOutfitNameUpdated = v34.onOutfitNameUpdated
        });
    end;
    v34.onScreenKeyboardVisibleChanged = function() --[[ Line: 140 ]]
        -- upvalues: v34 (copy), l_UserInputService_0 (ref)
        if v34.state.isKeyboardRepositioned ~= l_UserInputService_0.OnScreenKeyboardVisible then
            v34:setState({
                isKeyboardRepositioned = l_UserInputService_0.OnScreenKeyboardVisible
            });
        end;
    end;
    v34.closePrompt = function() --[[ Line: 148 ]]
        -- upvalues: v13 (ref), v34 (copy)
        v13.closeOverlay(v34.props.navigation);
    end;
end;
v33.checkFetchEditableCostumes = function(v41) --[[ Line: 153 ]] --[[ Name: checkFetchEditableCostumes ]]
    if v41.props.shouldPreloadEditableCostumes then
        v41.props.getEditableUserCostumes();
    end;
end;
v33.didMount = function(v42) --[[ Line: 160 ]] --[[ Name: didMount ]]
    v42:checkFetchEditableCostumes();
end;
v33.willUpdate = function(v43, v44, _) --[[ Line: 164 ]] --[[ Name: willUpdate ]]
    -- upvalues: v22 (copy)
    if v22.isFetchingDoneOrFailed(v43.props.fetchingState, v44.fetchingState) then
        v43.closePrompt();
    end;
end;
v33.renderWithProviders = function(v46, v47) --[[ Line: 170 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_InteractiveAlert_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_ButtonType_0 (copy), l_RetrievalStatus_0 (copy)
    local l_screenSize_0 = v46.props.screenSize;
    local v49 = UDim2.new(0.5, 0, 0.5, 0);
    if v46.state.isKeyboardRepositioned then
        v49 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
    end;
    return v3.createElement(if l_FFlagAXFixDeselectOutfitInManage_0 then l_Focusable_0.TextButton else l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        AutoButtonColor = not l_FFlagAXFixDeselectOutfitInManage_0 and nil, 
        Text = l_FFlagAXFixDeselectOutfitInManage_0 and "" or nil, 
        Selectable = not l_FFlagAXFixDeselectOutfitInManage_0 and nil, 
        [v3.Event.Activated] = if l_FFlagAXFixDeselectOutfitInManage_0 then v46.closePrompt else nil, 
        [v3.Ref] = v46.props.focusNavigationRef, 
        inputBindings = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then nil else {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, v46.closePrompt), 
            Confirm = v5.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 195 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        KeyboardConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"), 
            callback = v46.onScreenKeyboardVisibleChanged
        }), 
        Alert = v3.createElement(l_InteractiveAlert_0, {
            title = v47.titleText, 
            bodyText = if l_FFlagAXCharacterToAvatarStrings_0 then nil else v47.messageText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v46.closePrompt, 
                            text = v47.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = if l_FFlagAXCharacterToAvatarStrings_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v46.state.isNameInvalid, 
                            isLoading = v46.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            onActivated = v46.renameOutfit, 
                            text = v47.confirmButtonText
                        }
                    }
                }
            }, 
            middleContent = v46.renderMiddleContent, 
            isMiddleContentFocusable = true, 
            position = v49, 
            screenSize = v46.props.screenSize, 
            defaultChildRef = v46.props.defaultChildRef
        })
    });
end;
v33.render = function(v50) --[[ Line: 239 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy)
    return l_withLocalization_0({
        titleText = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Title.AvatarName" or "Feature.Avatar.Heading.RenameCharacter", 
        messageText = "Feature.Avatar.Label.EnterNewCostumeName", 
        confirmButtonText = "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v51) --[[ Line: 247 ]]
        -- upvalues: v50 (copy)
        return v50:renderWithProviders(v51);
    end);
end;
v33.didUpdate = function(v52, _, _) --[[ Line: 252 ]] --[[ Name: didUpdate ]]
    v52:checkFetchEditableCostumes();
end;
v33 = v4.connect(function(v55, v56) --[[ Line: 256 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v21 (copy), l_PerformFetch_0 (copy), v27 (copy)
    local v57 = v21.RenameOutfitKey .. v56.costumeId;
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v55, v57), 
        screenSize = v55.ScreenSize, 
        shouldPreloadEditableCostumes = v27(v55), 
        ownedItemIdsBySubtype = v55.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        outfitInfos = v55.AvatarExperience.AvatarEditor.OutfitInfos
    };
end, function(v58) --[[ Line: 270 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), v29 (copy)
    return {
        renameOutfit = function(v59, v60, v61) --[[ Line: 272 ]] --[[ Name: renameOutfit ]]
            -- upvalues: v58 (copy), v28 (ref)
            v58(v28(v59, v60, v61));
        end, 
        getEditableUserCostumes = function() --[[ Line: 275 ]] --[[ Name: getEditableUserCostumes ]]
            -- upvalues: v58 (copy), v29 (ref)
            return v58(v29());
        end
    };
end)(v33);
return (v25((v24((l_RoactServices_0.connect({
    avatarEditorAnalytics = v17
})(v33))))));