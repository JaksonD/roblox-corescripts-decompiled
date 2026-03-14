local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.FitFrame);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_FitTextLabel_0 = v9.FitTextLabel;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Constants);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v28 = require(l_Modules_0.LuaApp.mutedError);
local l_FFlagAXAddManageOutfitClickTracking_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixDeselectOutfitInManage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage;
local l_Images_0 = v8.App.ImageSet.Images;
local l_withStyle_0 = v8.Style.withStyle;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_IconButton_0 = v8.App.Button.IconButton;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local l_Focusable_0 = v10.Focusable;
local v39 = l_Images_0["icons/navigation/close"];
local v40 = l_GuiService_0:IsTenFootInterface();
local v41 = v5.PureComponent:extend("ManageOutfitPage");
v41.validateProps = v6.strictInterface({
    navigateWithLock = v6.callback, 
    navigation = v6.table, 
    avatarRoute = v6.table, 
    showCustomOutfitNames = v6.boolean, 
    avatarEditorAnalytics = v6.table
});
v41.init = function(v42) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v10 (copy), v5 (copy), l_withStyle_0 (copy), l_IconButton_0 (copy), v39 (copy), l_IconSize_0 (copy), v26 (copy), v20 (copy), l_FFlagAXAddManageOutfitClickTracking_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), v28 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v44 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    v42:setState({
        multiSelectionEnabled = false, 
        outfitGridCanScroll = false, 
        selectedOutfits = {}, 
        exitButtonPosition = Vector2.new(0, 0), 
        isGamepad = v44
    });
    v42.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v10.createFocusController();
    v42.exitButtonRef = v5.createRef();
    v42.selectButtonRef = v5.createRef();
    v42.gridViewRef = v5.createRef();
    v42.actionBarRef = v5.createRef();
    v42.peekViewRef = v5.createRef();
    v42.outfitDetailsPeekViewRefs = v10.createRefCache();
    v42.navigateBack = function() --[[ Line: 103 ]]
        -- upvalues: v42 (copy)
        v42.props.navigation.goBack();
    end;
    v42.selectedOutfitUpdated = function(v45) --[[ Line: 107 ]]
        -- upvalues: v42 (copy)
        if typeof(v45) == "string" then
            v42:setState({
                selectedOutfits = {
                    v45
                }
            });
            return;
        else
            v42:setState({
                selectedOutfits = v45 or {}
            });
            return;
        end;
    end;
    v42.exitButtonPositionChanged = function(v46) --[[ Line: 119 ]]
        -- upvalues: v42 (copy)
        if v46.AbsolutePosition ~= v42.state.exitButtonPosition then
            v42:setState({
                exitButtonPosition = v46.AbsolutePosition
            });
        end;
    end;
    v42.renderExitButton = function() --[[ Line: 127 ]]
        -- upvalues: l_withStyle_0 (ref), v5 (ref), l_IconButton_0 (ref), v39 (ref), l_IconSize_0 (ref), v42 (copy)
        return l_withStyle_0(function(v47) --[[ Line: 128 ]]
            -- upvalues: v5 (ref), l_IconButton_0 (ref), v39 (ref), l_IconSize_0 (ref), v42 (ref)
            local l_Theme_0 = v47.Theme;
            return v5.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v39, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v42.navigateBack, 
                buttonRef = v42.exitButtonRef, 
                NextSelectionDown = v42.gridViewRef, 
                NextSelectionRight = v42.selectButtonRef, 
                onAbsolutePositionChanged = v42.exitButtonPositionChanged
            });
        end);
    end;
    v42.selectButtonPressed = function() --[[ Line: 147 ]]
        -- upvalues: v42 (copy), v26 (ref)
        v42:setState({
            multiSelectionEnabled = not v42.state.multiSelectionEnabled
        });
        v26.closeFiltersAndItemDetails(v42.props.navigation);
    end;
    v42.outfitGridCanScrollUpdated = function(v49) --[[ Line: 155 ]]
        -- upvalues: v42 (copy)
        if v42.state.outfitGridCanScroll ~= v49 then
            v42:setState({
                outfitGridCanScroll = v49
            });
        end;
    end;
    v42.onPeekViewClosed = function() --[[ Line: 163 ]]
        -- upvalues: v42 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        v42:setState({
            selectedOutfits = {}
        });
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v42.state.isGamepad then
            v42.focusController.captureFocus();
        end;
    end;
    v42.onOverlayClosed = function() --[[ Line: 174 ]]
        -- upvalues: v42 (copy), v20 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_isGamepad_0 = v42.state.isGamepad;
        v20("ManageOutfitPage", l_isGamepad_0);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_isGamepad_0 then
            v42.focusController.captureFocus();
        end;
    end;
    v42.deleteOutfit = function() --[[ Line: 184 ]]
        -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v42 (copy), l_AvatarScreen_0 (ref)
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackDeleteAvatarAttemptClick(v42.state.multiSelectionEnabled);
        end;
        local function v51() --[[ Line: 189 ]] --[[ Name: onDeleteOverlayClosed ]]
            -- upvalues: v42 (ref)
            if v42.state.multiSelectionEnabled then
                v42:setState({
                    multiSelectionEnabled = false
                });
            end;
            v42.onOverlayClosed();
        end;
        v42.props.navigation.navigate(l_AvatarScreen_0.DeleteOutfitPrompt, {
            outfitIds = v42.state.selectedOutfits, 
            onOverlayClosed = v51
        });
    end;
    v42.renameOutfit = function() --[[ Line: 208 ]]
        -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (ref), v42 (copy), v28 (ref), l_AvatarScreen_0 (ref)
        if l_FFlagAXFixDeselectOutfitInManage_0 and (not v42.state.selectedOutfits or not v42.state.selectedOutfits[1]) then
            v28("Tried to rename an outfit with no outfit selected", v42.state.selectedOutfits);
            return;
        else
            v42.props.navigation.navigate(l_AvatarScreen_0.RenameOutfitPrompt, {
                costumeId = v42.state.selectedOutfits[1], 
                onOverlayClosed = v42.onOverlayClosed
            });
            return;
        end;
    end;
    v42.lastInputTypeChangedCallback = function() --[[ Line: 220 ]]
        -- upvalues: l_UserInputService_0 (ref), l_isGamepadInput_0 (ref), v42 (copy)
        local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
        local v53 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_1);
        if v53 ~= v42.state.isGamepad then
            v42:setState({
                isGamepad = v53
            });
        end;
    end;
    v42.onToggleOutfitCard = function(v54, v55) --[[ Line: 230 ]]
        -- upvalues: v42 (copy), v26 (ref), l_AvatarScreen_0 (ref)
        local l_navigation_0 = v42.props.navigation;
        if v54 then
            local v57 = {
                outfitId = v55, 
                ZIndex = 2, 
                onPeekViewClosed = v42.onPeekViewClosed, 
                exitButtonPosition = v42.state.exitButtonPosition, 
                deleteOutfit = v42.deleteOutfit, 
                renameOutfit = v42.renameOutfit, 
                NextSelectionLeft = not v42.props.isPortrait and v42.gridViewRef or nil, 
                outfitDetailsPeekViewRefs = v42.outfitDetailsPeekViewRefs
            };
            local function v58() --[[ Line: 244 ]]
                -- upvalues: v26 (ref), l_navigation_0 (copy), l_AvatarScreen_0 (ref), v57 (copy)
                v26.closeFiltersAndItemDetails(l_navigation_0);
                v26.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(l_AvatarScreen_0.OutfitDetails, v57);
            end;
            v42.props.navigateWithLock(v58);
            return;
        else
            v26.closeFiltersAndItemDetails(l_navigation_0);
            return;
        end;
    end;
end;
v41.renderRightTopBarButton = function(v59, v60, v61, v62) --[[ Line: 260 ]] --[[ Name: renderRightTopBarButton ]]
    -- upvalues: v5 (copy), l_Focusable_0 (copy), l_FitTextLabel_0 (copy), l_CursorKind_0 (copy)
    local l_select_0 = v60.select;
    if v59.state.multiSelectionEnabled then
        l_select_0 = v60.cancel;
    end;
    local l_Font_0 = v61.Font.Header2.Font;
    local v65 = v61.Font.BaseSize * v61.Font.Header2.RelativeSize;
    return v5.createElement(l_Focusable_0[l_FitTextLabel_0], {
        width = l_FitTextLabel_0.Width.FitToText, 
        onActivated = v59.selectButtonPressed, 
        BackgroundTransparency = 1, 
        Text = l_select_0, 
        Font = l_Font_0, 
        LayoutOrder = 1, 
        TextColor3 = v61.Theme.TextEmphasis.Color, 
        TextSize = v65, 
        SelectionImageObject = v62(l_CursorKind_0.RoundedRect), 
        NextSelectionLeft = v59.exitButtonRef, 
        NextSelectionDown = v59.gridViewRef, 
        [v5.Ref] = v59.selectButtonRef
    });
end;
v41.renderWithProviders = function(v66, v67, v68, v69) --[[ Line: 287 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v40 (copy), v15 (copy), v5 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v10 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v21 (copy), v23 (copy), v24 (copy), l_AvatarScreen_0 (copy), v25 (copy)
    local v70 = false;
    if not v66.state.multiSelectionEnabled and #v66.state.selectedOutfits == 1 then
        v70 = true;
    end;
    local v71 = not v66.state.multiSelectionEnabled and v66.props.showCustomOutfitNames and #v66.state.selectedOutfits == 1;
    local v72 = nil;
    if v66.state.isGamepad and v40 then
        v72 = v15.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v73 = if v70 then v66.peekViewRef else nil;
    if v70 then
        local l_key_0 = v66.props.avatarRoute.current.key;
        v73 = v66.outfitDetailsPeekViewRefs[l_key_0];
    end;
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v66.focusController, 
        defaultChild = v66.gridViewRef, 
        restorePreviousChildFocus = true, 
        inputBindings = {
            NavigateBack = v10.Input.onBegin(Enum.KeyCode.ButtonB, v66.navigateBack), 
            ToggleMultiSelect = if not v70 then v10.Input.onBegin(Enum.KeyCode.ButtonL3, v66.selectButtonPressed, {
                key = v66.state.multiSelectionEnabled and "Feature.Avatar.Action.CancelSelection" or "Feature.Avatar.Action.SelectMultipleItems"
            }) else nil, 
            Delete = if #v66.state.selectedOutfits > 0 then v10.Input.onBegin(Enum.KeyCode.ButtonX, v66.deleteOutfit, {
                key = "Feature.Avatar.Action.Delete"
            }) else nil, 
            Rename = if v71 then v10.Input.onBegin(Enum.KeyCode.ButtonY, v66.renameOutfit, {
                key = "Feature.Avatar.Action.Rename"
            }) else nil
        }
    }, {
        LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v66.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v21), 
        NavOverlayPageContainer = v5.createElement(v23, {
            headerBarProps = {
                title = v67.manage, 
                renderLeft = v66.renderExitButton, 
                renderRight = function() --[[ Line: 349 ]] --[[ Name: renderRight ]]
                    -- upvalues: v66 (copy), v67 (copy), v68 (copy), v69 (copy)
                    return v66:renderRightTopBarButton(v67, v68, v69);
                end
            }, 
            ZIndex = 1, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v66.focusController, 
            onDismiss = v66.navigateBack
        }, {
            OutfitSelectionGrid = v5.createElement(v24, {
                onToggleOutfitCard = v66.onToggleOutfitCard, 
                selectedOutfits = v66.state.selectedOutfits, 
                selectionUpdated = v66.selectedOutfitUpdated, 
                canScrollUpdated = v66.outfitGridCanScrollUpdated, 
                multiSelect = v66.state.multiSelectionEnabled, 
                goBack = v66.navigateBack, 
                pageOwner = l_AvatarScreen_0.ManageOutfitPage, 
                NextSelectionUp = v66.exitButtonRef, 
                NextSelectionDown = if v66.state.multiSelectionEnabled then v66.actionBarRef else nil, 
                NextSelectionRight = v73, 
                [v5.Ref] = v66.gridViewRef
            }), 
            ManageActionBar = v66.state.multiSelectionEnabled and v5.createElement(v25, {
                gradientFade = v66.state.outfitGridCanScroll, 
                multiSelect = true, 
                selectedOutfits = v66.state.selectedOutfits, 
                bottomPadding = v72, 
                deleteOutfit = v66.deleteOutfit, 
                renameOutfit = v66.renameOutfit, 
                ZIndex = 2, 
                NextSelectionUp = v66.gridViewRef, 
                [v5.Ref] = v66.actionBarRef
            }) or nil
        })
    });
end;
v41.render = function(v75) --[[ Line: 394 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        manage = "Feature.Avatar.Heading.Manage", 
        select = "Feature.Avatar.Action.Select", 
        cancel = "Feature.Avatar.Action.Cancel"
    })(function(v76) --[[ Line: 399 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v75 (copy)
        return l_withStyle_0(function(v77) --[[ Line: 400 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v75 (ref), v76 (copy)
            return l_withSelectionCursorProvider_0(function(v78) --[[ Line: 401 ]]
                -- upvalues: v75 (ref), v76 (ref), v77 (copy)
                return v75:renderWithProviders(v76, v77, v78);
            end);
        end);
    end);
end;
v41.didUpdate = function(v79, _, v81) --[[ Line: 408 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (copy), v26 (copy)
    local v82 = false;
    if #v79.state.selectedOutfits ~= 1 then
        v82 = #v81.selectedOutfits == 1;
    end;
    if not v79.state.multiSelectionEnabled and v82 then
        if l_FFlagAXFixDeselectOutfitInManage_0 then
            v26.closeAllDialogs(v79.props.navigation);
        end;
        v26.closeFiltersAndItemDetails(v79.props.navigation);
    end;
end;
v41 = v4.connect(nil, function(v83) --[[ Line: 418 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v27 (copy)
    return {
        navigateWithLock = function(v84) --[[ Line: 420 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v83 (copy), v27 (ref)
            v83(v27(v84));
        end
    };
end)(v41);
v41 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v19
})(v41);
return (v17((l_RoactAppPolicy_0.connect(function(v85, _) --[[ Line: 432 ]]
    return {
        showCustomOutfitNames = v85.getCustomOutfitNames()
    };
end)(v41))));