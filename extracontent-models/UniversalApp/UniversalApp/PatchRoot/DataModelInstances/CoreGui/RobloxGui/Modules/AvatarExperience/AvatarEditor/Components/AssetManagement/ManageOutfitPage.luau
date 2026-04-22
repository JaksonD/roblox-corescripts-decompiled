local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.FitFrame);
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_FitTextLabel_0 = v11.FitTextLabel;
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v19 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local _ = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v19.FocusNavigationEventNameEnum;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v19.FocusNavigableSurfaceIdentifierEnum;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v19.useFocusNavigableSurfaceRegistryConnection;
local l_useFocusOnMountEffect_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Hooks.useFocusOnMountEffect;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_logOnOverlayClosed_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed;
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.useManageOutfitPageFocusNavigationBindings);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = v37.FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = v37.FFlagAXFixManageOutfitPageFocusLostBehind;
local v40 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXAddManageOutfitClickTracking_0 = v40.FFlagAXAddManageOutfitClickTracking;
local l_FFlagAXFixDeselectOutfitInManage_0 = v40.FFlagAXFixDeselectOutfitInManage;
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = v40.FFlagAXFixGamepadNavigationOnOutfitManagement;
local v44 = game:DefineFastFlag("AXFocusOnMountManageOutfitPage", false);
local v45 = require(l_Modules_0.LuaApp.mutedError);
local l_Images_0 = v10.App.ImageSet.Images;
local l_withStyle_0 = v10.Style.withStyle;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v10.App.SelectionImage.CursorKind;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Focusable_0 = v12.Focusable;
local v53 = l_Images_0["icons/navigation/close"];
local v54 = l_GuiService_0:IsTenFootInterface();
local v55 = v7.PureComponent:extend("ManageOutfitPage");
v55.validateProps = v8.strictInterface({
    navigateWithLock = v8.callback, 
    navigation = v8.table, 
    avatarRoute = v8.table, 
    showCustomOutfitNames = v8.boolean, 
    avatarEditorAnalytics = v8.table, 
    multiSelectionEnabled = v8.boolean, 
    setMultiSelectionEnabled = v8.callback, 
    outfitGridCanScroll = v8.boolean, 
    setOutfitGridCanScroll = v8.callback, 
    selectedOutfits = v8.table, 
    setSelectedOutfits = v8.callback, 
    exitButtonPosition = v8.Vector2, 
    setExitButtonPosition = v8.callback, 
    isGamepad = v8.boolean, 
    setIsGamepad = v8.callback, 
    focusNavigationRef = v8.union(v8.callback, v8.table), 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.table
});
v55.init = function(v56) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v12 (copy), l_withStyle_0 (copy), l_IconButton_0 (copy), v53 (copy), l_IconSize_0 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v34 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_logOnOverlayClosed_0 (copy), l_FFlagAXAddManageOutfitClickTracking_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), v45 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy)
    v56.exitButtonRef = v7.createRef();
    v56.selectButtonRef = v7.createRef();
    v56.gridViewRef = v7.createRef();
    v56.actionBarRef = v7.createRef();
    v56.peekViewRef = v7.createRef();
    v56.outfitDetailsPeekViewRefs = v12.createRefCache();
    v56.navigateBack = function() --[[ Line: 123 ]]
        -- upvalues: v56 (copy)
        v56.props.navigation.goBack();
    end;
    v56.selectedOutfitUpdated = function(v57) --[[ Line: 127 ]]
        -- upvalues: v56 (copy)
        if typeof(v57) == "string" then
            v56.props.setSelectedOutfits({
                v57
            });
            return;
        else
            v56.props.setSelectedOutfits(v57 or {});
            return;
        end;
    end;
    v56.exitButtonPositionChanged = function(v58) --[[ Line: 135 ]]
        -- upvalues: v56 (copy)
        if v58.AbsolutePosition ~= v56.props.exitButtonPosition then
            v56.props.setExitButtonPosition(v58.AbsolutePosition);
        end;
    end;
    v56.renderExitButton = function() --[[ Line: 141 ]]
        -- upvalues: l_withStyle_0 (ref), v7 (ref), l_IconButton_0 (ref), v53 (ref), l_IconSize_0 (ref), v56 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (ref)
        return l_withStyle_0(function(v59) --[[ Line: 142 ]]
            -- upvalues: v7 (ref), l_IconButton_0 (ref), v53 (ref), l_IconSize_0 (ref), v56 (ref), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (ref)
            local l_Theme_0 = v59.Theme;
            return v7.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v53, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v56.navigateBack, 
                buttonRef = v56.exitButtonRef, 
                NextSelectionDown = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v56.gridViewRef, 
                NextSelectionRight = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v56.selectButtonRef, 
                onAbsolutePositionChanged = v56.exitButtonPositionChanged
            });
        end);
    end;
    v56.selectButtonPressed = function() --[[ Line: 163 ]]
        -- upvalues: v56 (copy), v34 (ref)
        v56.props.setMultiSelectionEnabled(not v56.props.multiSelectionEnabled);
        v34.closeFiltersAndItemDetails(v56.props.navigation);
    end;
    v56.outfitGridCanScrollUpdated = function(v61) --[[ Line: 168 ]]
        -- upvalues: v56 (copy)
        if v56.props.outfitGridCanScroll ~= v61 then
            v56.props.setOutfitGridCanScroll(v61);
        end;
    end;
    v56.onPeekViewClosed = function() --[[ Line: 174 ]]
        -- upvalues: v56 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        v56.props.setSelectedOutfits({});
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v56.props.isGamepad then
            v56.props.focusController.captureFocus();
        end;
    end;
    v56.onOverlayClosed = function() --[[ Line: 183 ]]
        -- upvalues: v56 (copy), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_isGamepad_0 = v56.props.isGamepad;
        l_logOnOverlayClosed_0("ManageOutfitPage", l_isGamepad_0);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_isGamepad_0 then
            v56.props.focusController.captureFocus();
        end;
    end;
    v56.deleteOutfit = function() --[[ Line: 193 ]]
        -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v56 (copy), l_AvatarScreen_0 (ref)
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackDeleteAvatarAttemptClick(v56.state.multiSelectionEnabled);
        end;
        local function v63() --[[ Line: 198 ]] --[[ Name: onDeleteOverlayClosed ]]
            -- upvalues: v56 (ref)
            if v56.props.multiSelectionEnabled then
                v56.props.setMultiSelectionEnabled(false);
            end;
            v56.onOverlayClosed();
        end;
        v56.props.navigation.navigate(l_AvatarScreen_0.DeleteOutfitPrompt, {
            outfitIds = v56.props.selectedOutfits, 
            onOverlayClosed = v63
        });
    end;
    v56.renameOutfit = function() --[[ Line: 215 ]]
        -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (ref), v56 (copy), v45 (ref), l_AvatarScreen_0 (ref)
        if l_FFlagAXFixDeselectOutfitInManage_0 and (not v56.props.selectedOutfits or not v56.props.selectedOutfits[1]) then
            v45("Tried to rename an outfit with no outfit selected", v56.props.selectedOutfits);
            return;
        else
            v56.props.navigation.navigate(l_AvatarScreen_0.RenameOutfitPrompt, {
                costumeId = v56.props.selectedOutfits[1], 
                onOverlayClosed = v56.onOverlayClosed
            });
            return;
        end;
    end;
    v56.lastInputTypeChangedCallback = function() --[[ Line: 227 ]]
        -- upvalues: l_UserInputService_0 (ref), l_isGamepadInput_0 (ref), v56 (copy)
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v65 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
        if v65 ~= v56.props.isGamepad then
            v56.props.setIsGamepad(v65);
        end;
    end;
    v56.onToggleOutfitCard = function(v66, v67) --[[ Line: 235 ]]
        -- upvalues: v56 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (ref), v34 (ref), l_AvatarScreen_0 (ref)
        local l_navigation_0 = v56.props.navigation;
        if v66 then
            local v69 = {
                outfitId = v67, 
                ZIndex = 2, 
                onPeekViewClosed = v56.onPeekViewClosed, 
                exitButtonPosition = v56.props.exitButtonPosition, 
                deleteOutfit = v56.deleteOutfit, 
                renameOutfit = v56.renameOutfit, 
                NextSelectionLeft = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else not v56.props.isPortrait and v56.gridViewRef or nil, 
                outfitDetailsPeekViewRefs = v56.outfitDetailsPeekViewRefs
            };
            local function v70() --[[ Line: 251 ]]
                -- upvalues: v34 (ref), l_navigation_0 (copy), l_AvatarScreen_0 (ref), v69 (copy)
                v34.closeFiltersAndItemDetails(l_navigation_0);
                v34.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(l_AvatarScreen_0.OutfitDetails, v69);
            end;
            v56.props.navigateWithLock(v70);
            return;
        else
            v34.closeFiltersAndItemDetails(l_navigation_0);
            return;
        end;
    end;
end;
v55.renderRightTopBarButton = function(v71, v72, v73, v74) --[[ Line: 267 ]] --[[ Name: renderRightTopBarButton ]]
    -- upvalues: v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitTextLabel_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy)
    local l_select_0 = v72.select;
    if v71.props.multiSelectionEnabled then
        l_select_0 = v72.cancel;
    end;
    local l_Font_0 = v73.Font.Header2.Font;
    local v77 = v73.Font.BaseSize * v73.Font.Header2.RelativeSize;
    return v7.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitTextLabel_0 else l_Focusable_0[l_FitTextLabel_0], {
        width = l_FitTextLabel_0.Width.FitToText, 
        onActivated = v71.selectButtonPressed, 
        BackgroundTransparency = 1, 
        Text = l_select_0, 
        Font = l_Font_0, 
        LayoutOrder = 1, 
        TextColor3 = v73.Theme.TextEmphasis.Color, 
        TextSize = v77, 
        SelectionImageObject = v74(l_CursorKind_0.RoundedRect), 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71.exitButtonRef, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71.gridViewRef, 
        [v7.Ref] = v71.selectButtonRef
    });
end;
v55.renderWithProviders = function(v78, v79, v80, v81) --[[ Line: 294 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v54 (copy), v16 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v29 (copy), v31 (copy), v32 (copy), l_AvatarScreen_0 (copy), v33 (copy)
    local v82 = false;
    if not v78.props.multiSelectionEnabled and #v78.props.selectedOutfits == 1 then
        v82 = true;
    end;
    local v83 = nil;
    if v78.props.isGamepad and v54 then
        v83 = v16.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v84 = if v82 then v78.peekViewRef else nil;
    if v82 then
        local l_key_0 = v78.props.avatarRoute.current.key;
        v84 = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v78.outfitDetailsPeekViewRefs[l_key_0];
    end;
    return v7.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.props.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.gridViewRef, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
    }, {
        LastInputTypeChangedConnection = v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v78.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.createElement(v29), 
        NavOverlayPageContainer = v7.createElement(v31, {
            headerBarProps = {
                title = v79.manage, 
                renderLeft = v78.renderExitButton, 
                renderRight = function() --[[ Line: 330 ]] --[[ Name: renderRight ]]
                    -- upvalues: v78 (copy), v79 (copy), v80 (copy), v81 (copy)
                    return v78:renderRightTopBarButton(v79, v80, v81);
                end
            }, 
            forwardRef = v78.props.focusNavigationRef, 
            ZIndex = 1, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.props.focusController, 
            onDismiss = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v78.navigateBack
        }, {
            OutfitSelectionGrid = v7.createElement(v32, {
                onToggleOutfitCard = v78.onToggleOutfitCard, 
                selectedOutfits = v78.props.selectedOutfits, 
                selectionUpdated = v78.selectedOutfitUpdated, 
                canScrollUpdated = v78.outfitGridCanScrollUpdated, 
                multiSelect = v78.props.multiSelectionEnabled, 
                goBack = v78.navigateBack, 
                pageOwner = l_AvatarScreen_0.ManageOutfitPage, 
                NextSelectionUp = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v78.exitButtonRef, 
                NextSelectionDown = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else if v78.props.multiSelectionEnabled then v78.actionBarRef else nil, 
                NextSelectionRight = nil, 
                [v7.Ref] = v78.gridViewRef
            }), 
            ManageActionBar = v78.props.multiSelectionEnabled and v7.createElement(v33, {
                gradientFade = v78.props.outfitGridCanScroll, 
                multiSelect = true, 
                selectedOutfits = v78.props.selectedOutfits, 
                bottomPadding = v83, 
                deleteOutfit = v78.deleteOutfit, 
                renameOutfit = v78.renameOutfit, 
                ZIndex = 2, 
                NextSelectionUp = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v78.gridViewRef, 
                [v7.Ref] = v78.actionBarRef
            }) or nil
        })
    });
end;
v55.render = function(v86) --[[ Line: 379 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        manage = "Feature.Avatar.Heading.Manage", 
        select = "Feature.Avatar.Action.Select", 
        cancel = "Feature.Avatar.Action.Cancel"
    })(function(v87) --[[ Line: 384 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v86 (copy)
        return l_withStyle_0(function(v88) --[[ Line: 385 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v86 (ref), v87 (copy)
            return l_withSelectionCursorProvider_0(function(v89) --[[ Line: 386 ]]
                -- upvalues: v86 (ref), v87 (ref), v88 (copy)
                return v86:renderWithProviders(v87, v88, v89);
            end);
        end);
    end);
end;
v55.didUpdate = function(v90, v91, _) --[[ Line: 393 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (copy), v34 (copy)
    local v93 = false;
    if #v90.props.selectedOutfits ~= 1 then
        v93 = #v91.selectedOutfits == 1;
    end;
    if not v90.props.multiSelectionEnabled and v93 then
        if l_FFlagAXFixDeselectOutfitInManage_0 then
            v34.closeAllDialogs(v90.props.navigation);
        end;
        v34.closeFiltersAndItemDetails(v90.props.navigation);
    end;
end;
v55 = v25((v5.connect(nil, function(v94) --[[ Line: 403 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_NavigateWithLock_0 (copy)
    return {
        navigateWithLock = function(v95) --[[ Line: 405 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v94 (copy), l_NavigateWithLock_0 (ref)
            v94(l_NavigateWithLock_0(v95));
        end
    };
end)(v55)));
return function(v96) --[[ Line: 415 ]]
    -- upvalues: v18 (copy), v27 (copy), v17 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v12 (copy), l_FFlagAXFixManageOutfitPageFocusLostBehind_0 (copy), v44 (copy), l_FocusNavigationEventNameEnum_0 (copy), v34 (copy), l_logOnOverlayClosed_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), v45 (copy), v36 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useFocusOnMountEffect_0 (copy), v55 (ref), v6 (copy)
    local v97 = v18(v27);
    local v99 = v17(function(v98) --[[ Line: 417 ]]
        return v98.getCustomOutfitNames();
    end);
    local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
    local v101 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_1);
    local v102 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.useMemo(function() --[[ Line: 424 ]]
        -- upvalues: v12 (ref)
        return v12.createFocusController();
    end, {});
    local v103, v104 = v4.useState(false);
    local v105, v106 = v4.useState(false);
    local v107, v108 = v4.useState({});
    local v109, v110 = v4.useState(Vector2.new(0, 0));
    local v111, v112 = v4.useState(v101);
    local v113 = nil;
    if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 or v44 then
        v113 = v4.useRef(nil);
    end;
    local v114 = v4.useMemo(function() --[[ Line: 439 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v103 (copy)
        return {
            [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonL3] = if v103 then l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect else l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect, 
            [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete, 
            [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ManageOutfitsRename
        };
    end, {
        v103
    });
    local v115 = v4.useCallback(function() --[[ Line: 453 ]]
        -- upvalues: v96 (copy)
        v96.navigation.goBack();
    end, {
        v96.navigation.goBack
    });
    local v116 = v4.useCallback(function() --[[ Line: 457 ]]
        -- upvalues: v104 (copy), v34 (ref), v96 (copy)
        v104(true);
        v34.closeFiltersAndItemDetails(v96.navigation);
    end, {
        v96.navigation
    });
    local v117 = v4.useCallback(function() --[[ Line: 462 ]]
        -- upvalues: v104 (copy), v34 (ref), v96 (copy)
        v104(false);
        v34.closeFiltersAndItemDetails(v96.navigation);
    end, {
        v96.navigation
    });
    local v120 = v4.useCallback(function() --[[ Line: 468 ]]
        -- upvalues: v103 (copy), v104 (copy), v111 (copy), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v102 (copy), v96 (copy), l_AvatarScreen_0 (ref), v107 (copy)
        local function v119() --[[ Line: 469 ]] --[[ Name: onDeleteOverlayClosed ]]
            -- upvalues: v103 (ref), v104 (ref), v111 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v102 (ref)
            if v103 then
                v104(false);
            end;
            local l_v111_0 = v111;
            l_logOnOverlayClosed_0("ManageOutfitPage", l_v111_0);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v111_0 then
                v102.captureFocus();
            end;
        end;
        v96.navigation.navigate(l_AvatarScreen_0.DeleteOutfitPrompt, {
            outfitIds = v107, 
            onOverlayClosed = v119
        });
    end, {
        v107, 
        v103, 
        v111, 
        v96.navigation, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v102
    });
    local v123 = v4.useCallback(function() --[[ Line: 498 ]]
        -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (ref), v107 (copy), v45 (ref), v111 (copy), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v102 (copy), v96 (copy), l_AvatarScreen_0 (ref)
        if l_FFlagAXFixDeselectOutfitInManage_0 and (not v107 or not v107[1]) then
            v45("Tried to rename an outfit with no outfit selected", v107);
            return;
        else
            local function v122() --[[ Line: 503 ]]
                -- upvalues: v111 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v102 (ref)
                local l_v111_1 = v111;
                l_logOnOverlayClosed_0("ManageOutfitPage", l_v111_1);
                if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v111_1 then
                    v102.captureFocus();
                end;
            end;
            v96.navigation.navigate(l_AvatarScreen_0.RenameOutfitPrompt, {
                costumeId = v107[1], 
                onOverlayClosed = v122
            });
            return;
        end;
    end, {
        v96.navigation, 
        v107, 
        v111, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v102
    });
    local v124 = not v103 and #v107 == 1;
    local v125 = not v103 and v99 and #v107 == 1;
    local v126 = v36(if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then v113 else nil, v114, {
        onGoBack = v115, 
        onToggleMultiselect = if not not v124 or v103 then nil else v116, 
        onCancelMultiselect = if not v124 and v103 then v117 else nil, 
        onDelete = if #v107 > 0 then v120 else nil, 
        onRename = if v125 then v123 else nil
    });
    if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then
        l_useFocusNavigableSurfaceRegistryConnection_0(v113 and v113.current, l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView);
    end;
    if v44 then
        l_useFocusOnMountEffect_0(v113);
    end;
    return v4.createElement(v55, v6.Dictionary.join(v96, {
        multiSelectionEnabled = v103, 
        setMultiSelectionEnabled = v104, 
        outfitGridCanScroll = v105, 
        setOutfitGridCanScroll = v106, 
        selectedOutfits = v107, 
        setSelectedOutfits = v108, 
        exitButtonPosition = v109, 
        setExitButtonPosition = v110, 
        isGamepad = v111, 
        setIsGamepad = v112, 
        focusNavigationRef = v126, 
        avatarEditorAnalytics = v97, 
        showCustomOutfitNames = v99, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v102
    }));
end;