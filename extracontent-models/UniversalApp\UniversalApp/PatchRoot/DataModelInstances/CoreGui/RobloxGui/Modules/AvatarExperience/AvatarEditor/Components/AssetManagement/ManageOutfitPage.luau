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
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v34 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.useManageOutfitPageFocusNavigationBindings);
local l_FFlagAXAddManageOutfitClickTracking_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixManageOutfitPageFocusLostBehind;
local l_FFlagAXFixDeselectOutfitInManage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage;
local v40 = require(l_Modules_0.LuaApp.mutedError);
local l_Images_0 = v10.App.ImageSet.Images;
local l_withStyle_0 = v10.Style.withStyle;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v10.App.SelectionImage.CursorKind;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Focusable_0 = v12.Focusable;
local v48 = l_Images_0["icons/navigation/close"];
local v49 = l_GuiService_0:IsTenFootInterface();
local v50 = v7.PureComponent:extend("ManageOutfitPage");
v50.validateProps = v8.strictInterface({
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
v50.init = function(v51) --[[ Line: 110 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v12 (copy), l_withStyle_0 (copy), l_IconButton_0 (copy), v48 (copy), l_IconSize_0 (copy), v33 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v27 (copy), l_FFlagAXAddManageOutfitClickTracking_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), v40 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy)
    v51.exitButtonRef = v7.createRef();
    v51.selectButtonRef = v7.createRef();
    v51.gridViewRef = v7.createRef();
    v51.actionBarRef = v7.createRef();
    v51.peekViewRef = v7.createRef();
    v51.outfitDetailsPeekViewRefs = v12.createRefCache();
    v51.navigateBack = function() --[[ Line: 118 ]]
        -- upvalues: v51 (copy)
        v51.props.navigation.goBack();
    end;
    v51.selectedOutfitUpdated = function(v52) --[[ Line: 122 ]]
        -- upvalues: v51 (copy)
        if typeof(v52) == "string" then
            v51.props.setSelectedOutfits({
                v52
            });
            return;
        else
            v51.props.setSelectedOutfits(v52 or {});
            return;
        end;
    end;
    v51.exitButtonPositionChanged = function(v53) --[[ Line: 130 ]]
        -- upvalues: v51 (copy)
        if v53.AbsolutePosition ~= v51.props.exitButtonPosition then
            v51.props.setExitButtonPosition(v53.AbsolutePosition);
        end;
    end;
    v51.renderExitButton = function() --[[ Line: 136 ]]
        -- upvalues: l_withStyle_0 (ref), v7 (ref), l_IconButton_0 (ref), v48 (ref), l_IconSize_0 (ref), v51 (copy)
        return l_withStyle_0(function(v54) --[[ Line: 137 ]]
            -- upvalues: v7 (ref), l_IconButton_0 (ref), v48 (ref), l_IconSize_0 (ref), v51 (ref)
            local l_Theme_0 = v54.Theme;
            return v7.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v48, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v51.navigateBack, 
                buttonRef = v51.exitButtonRef, 
                NextSelectionDown = v51.gridViewRef, 
                NextSelectionRight = v51.selectButtonRef, 
                onAbsolutePositionChanged = v51.exitButtonPositionChanged
            });
        end);
    end;
    v51.selectButtonPressed = function() --[[ Line: 156 ]]
        -- upvalues: v51 (copy), v33 (ref)
        v51.props.setMultiSelectionEnabled(not v51.props.multiSelectionEnabled);
        v33.closeFiltersAndItemDetails(v51.props.navigation);
    end;
    v51.outfitGridCanScrollUpdated = function(v56) --[[ Line: 161 ]]
        -- upvalues: v51 (copy)
        if v51.props.outfitGridCanScroll ~= v56 then
            v51.props.setOutfitGridCanScroll(v56);
        end;
    end;
    v51.onPeekViewClosed = function() --[[ Line: 167 ]]
        -- upvalues: v51 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        v51.props.setSelectedOutfits({});
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v51.props.isGamepad then
            v51.props.focusController.captureFocus();
        end;
    end;
    v51.onOverlayClosed = function() --[[ Line: 176 ]]
        -- upvalues: v51 (copy), v27 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_isGamepad_0 = v51.props.isGamepad;
        v27("ManageOutfitPage", l_isGamepad_0);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_isGamepad_0 then
            v51.props.focusController.captureFocus();
        end;
    end;
    v51.deleteOutfit = function() --[[ Line: 186 ]]
        -- upvalues: l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v51 (copy), l_AvatarScreen_0 (ref)
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackDeleteAvatarAttemptClick(v51.state.multiSelectionEnabled);
        end;
        local function v58() --[[ Line: 191 ]] --[[ Name: onDeleteOverlayClosed ]]
            -- upvalues: v51 (ref)
            if v51.props.multiSelectionEnabled then
                v51.props.setMultiSelectionEnabled(false);
            end;
            v51.onOverlayClosed();
        end;
        v51.props.navigation.navigate(l_AvatarScreen_0.DeleteOutfitPrompt, {
            outfitIds = v51.props.selectedOutfits, 
            onOverlayClosed = v58
        });
    end;
    v51.renameOutfit = function() --[[ Line: 208 ]]
        -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (ref), v51 (copy), v40 (ref), l_AvatarScreen_0 (ref)
        if l_FFlagAXFixDeselectOutfitInManage_0 and (not v51.props.selectedOutfits or not v51.props.selectedOutfits[1]) then
            v40("Tried to rename an outfit with no outfit selected", v51.props.selectedOutfits);
            return;
        else
            v51.props.navigation.navigate(l_AvatarScreen_0.RenameOutfitPrompt, {
                costumeId = v51.props.selectedOutfits[1], 
                onOverlayClosed = v51.onOverlayClosed
            });
            return;
        end;
    end;
    v51.lastInputTypeChangedCallback = function() --[[ Line: 220 ]]
        -- upvalues: l_UserInputService_0 (ref), l_isGamepadInput_0 (ref), v51 (copy)
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v60 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
        if v60 ~= v51.props.isGamepad then
            v51.props.setIsGamepad(v60);
        end;
    end;
    v51.onToggleOutfitCard = function(v61, v62) --[[ Line: 228 ]]
        -- upvalues: v51 (copy), v33 (ref), l_AvatarScreen_0 (ref)
        local l_navigation_0 = v51.props.navigation;
        if v61 then
            local v64 = {
                outfitId = v62, 
                ZIndex = 2, 
                onPeekViewClosed = v51.onPeekViewClosed, 
                exitButtonPosition = v51.props.exitButtonPosition, 
                deleteOutfit = v51.deleteOutfit, 
                renameOutfit = v51.renameOutfit, 
                NextSelectionLeft = not v51.props.isPortrait and v51.gridViewRef or nil, 
                outfitDetailsPeekViewRefs = v51.outfitDetailsPeekViewRefs
            };
            local function v65() --[[ Line: 242 ]]
                -- upvalues: v33 (ref), l_navigation_0 (copy), l_AvatarScreen_0 (ref), v64 (copy)
                v33.closeFiltersAndItemDetails(l_navigation_0);
                v33.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(l_AvatarScreen_0.OutfitDetails, v64);
            end;
            v51.props.navigateWithLock(v65);
            return;
        else
            v33.closeFiltersAndItemDetails(l_navigation_0);
            return;
        end;
    end;
end;
v50.renderRightTopBarButton = function(v66, v67, v68, v69) --[[ Line: 258 ]] --[[ Name: renderRightTopBarButton ]]
    -- upvalues: v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitTextLabel_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy)
    local l_select_0 = v67.select;
    if v66.props.multiSelectionEnabled then
        l_select_0 = v67.cancel;
    end;
    local l_Font_0 = v68.Font.Header2.Font;
    local v72 = v68.Font.BaseSize * v68.Font.Header2.RelativeSize;
    return v7.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitTextLabel_0 else l_Focusable_0[l_FitTextLabel_0], {
        width = l_FitTextLabel_0.Width.FitToText, 
        onActivated = v66.selectButtonPressed, 
        BackgroundTransparency = 1, 
        Text = l_select_0, 
        Font = l_Font_0, 
        LayoutOrder = 1, 
        TextColor3 = v68.Theme.TextEmphasis.Color, 
        TextSize = v72, 
        SelectionImageObject = v69(l_CursorKind_0.RoundedRect), 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v66.exitButtonRef, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v66.gridViewRef, 
        [v7.Ref] = v66.selectButtonRef
    });
end;
v50.renderWithProviders = function(v73, v74, v75, v76) --[[ Line: 285 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v49 (copy), v16 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v28 (copy), v30 (copy), v31 (copy), l_AvatarScreen_0 (copy), v32 (copy)
    local v77 = false;
    if not v73.props.multiSelectionEnabled and #v73.props.selectedOutfits == 1 then
        v77 = true;
    end;
    local v78 = nil;
    if v73.props.isGamepad and v49 then
        v78 = v16.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v79 = if v77 then v73.peekViewRef else nil;
    if v77 then
        local l_key_0 = v73.props.avatarRoute.current.key;
        v79 = v73.outfitDetailsPeekViewRefs[l_key_0];
    end;
    return v7.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v73.props.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v73.gridViewRef, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
    }, {
        LastInputTypeChangedConnection = v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v73.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.createElement(v28), 
        NavOverlayPageContainer = v7.createElement(v30, {
            headerBarProps = {
                title = v74.manage, 
                renderLeft = v73.renderExitButton, 
                renderRight = function() --[[ Line: 319 ]] --[[ Name: renderRight ]]
                    -- upvalues: v73 (copy), v74 (copy), v75 (copy), v76 (copy)
                    return v73:renderRightTopBarButton(v74, v75, v76);
                end
            }, 
            forwardRef = v73.props.focusNavigationRef, 
            ZIndex = 1, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v73.props.focusController, 
            onDismiss = v73.navigateBack
        }, {
            OutfitSelectionGrid = v7.createElement(v31, {
                onToggleOutfitCard = v73.onToggleOutfitCard, 
                selectedOutfits = v73.props.selectedOutfits, 
                selectionUpdated = v73.selectedOutfitUpdated, 
                canScrollUpdated = v73.outfitGridCanScrollUpdated, 
                multiSelect = v73.props.multiSelectionEnabled, 
                goBack = v73.navigateBack, 
                pageOwner = l_AvatarScreen_0.ManageOutfitPage, 
                NextSelectionUp = v73.exitButtonRef, 
                NextSelectionDown = if v73.props.multiSelectionEnabled then v73.actionBarRef else nil, 
                NextSelectionRight = v79, 
                [v7.Ref] = v73.gridViewRef
            }), 
            ManageActionBar = v73.props.multiSelectionEnabled and v7.createElement(v32, {
                gradientFade = v73.props.outfitGridCanScroll, 
                multiSelect = true, 
                selectedOutfits = v73.props.selectedOutfits, 
                bottomPadding = v78, 
                deleteOutfit = v73.deleteOutfit, 
                renameOutfit = v73.renameOutfit, 
                ZIndex = 2, 
                NextSelectionUp = v73.gridViewRef, 
                [v7.Ref] = v73.actionBarRef
            }) or nil
        })
    });
end;
v50.render = function(v81) --[[ Line: 366 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withLocalization_0({
        manage = "Feature.Avatar.Heading.Manage", 
        select = "Feature.Avatar.Action.Select", 
        cancel = "Feature.Avatar.Action.Cancel"
    })(function(v82) --[[ Line: 371 ]]
        -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v81 (copy)
        return l_withStyle_0(function(v83) --[[ Line: 372 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v81 (ref), v82 (copy)
            return l_withSelectionCursorProvider_0(function(v84) --[[ Line: 373 ]]
                -- upvalues: v81 (ref), v82 (ref), v83 (copy)
                return v81:renderWithProviders(v82, v83, v84);
            end);
        end);
    end);
end;
v50.didUpdate = function(v85, v86, _) --[[ Line: 380 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (copy), v33 (copy)
    local v88 = false;
    if #v85.props.selectedOutfits ~= 1 then
        v88 = #v86.selectedOutfits == 1;
    end;
    if not v85.props.multiSelectionEnabled and v88 then
        if l_FFlagAXFixDeselectOutfitInManage_0 then
            v33.closeAllDialogs(v85.props.navigation);
        end;
        v33.closeFiltersAndItemDetails(v85.props.navigation);
    end;
end;
v50 = v24((v5.connect(nil, function(v89) --[[ Line: 390 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v34 (copy)
    return {
        navigateWithLock = function(v90) --[[ Line: 392 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v89 (copy), v34 (ref)
            v89(v34(v90));
        end
    };
end)(v50)));
return function(v91) --[[ Line: 402 ]]
    -- upvalues: v18 (copy), v26 (copy), v17 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v12 (copy), l_FFlagAXFixManageOutfitPageFocusLostBehind_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v33 (copy), v27 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), v40 (copy), v35 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v50 (ref), v6 (copy)
    local v92 = v18(v26);
    local v94 = v17(function(v93) --[[ Line: 404 ]]
        return v93.getCustomOutfitNames();
    end);
    local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
    local v96 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_1);
    local v97 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.useMemo(function() --[[ Line: 411 ]]
        -- upvalues: v12 (ref)
        return v12.createFocusController();
    end, {});
    local v98, v99 = v4.useState(false);
    local v100, v101 = v4.useState(false);
    local v102, v103 = v4.useState({});
    local v104, v105 = v4.useState(Vector2.new(0, 0));
    local v106, v107 = v4.useState(v96);
    local v108 = if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then v4.useRef(nil) else nil;
    local v109 = v4.useMemo(function() --[[ Line: 423 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v98 (copy)
        return {
            [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonL3] = if v98 then l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect else l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect, 
            [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete, 
            [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ManageOutfitsRename
        };
    end, {
        v98
    });
    local v110 = v4.useCallback(function() --[[ Line: 437 ]]
        -- upvalues: v91 (copy)
        v91.navigation.goBack();
    end, {
        v91.navigation.goBack
    });
    local v111 = v4.useCallback(function() --[[ Line: 441 ]]
        -- upvalues: v99 (copy), v33 (ref), v91 (copy)
        v99(true);
        v33.closeFiltersAndItemDetails(v91.navigation);
    end, {
        v91.navigation
    });
    local v112 = v4.useCallback(function() --[[ Line: 446 ]]
        -- upvalues: v99 (copy), v33 (ref), v91 (copy)
        v99(false);
        v33.closeFiltersAndItemDetails(v91.navigation);
    end, {
        v91.navigation
    });
    local v115 = v4.useCallback(function() --[[ Line: 452 ]]
        -- upvalues: v98 (copy), v99 (copy), v106 (copy), v27 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (copy), v91 (copy), l_AvatarScreen_0 (ref), v102 (copy)
        local function v114() --[[ Line: 453 ]] --[[ Name: onDeleteOverlayClosed ]]
            -- upvalues: v98 (ref), v99 (ref), v106 (ref), v27 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (ref)
            if v98 then
                v99(false);
            end;
            local l_v106_0 = v106;
            v27("ManageOutfitPage", l_v106_0);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v106_0 then
                v97.captureFocus();
            end;
        end;
        v91.navigation.navigate(l_AvatarScreen_0.DeleteOutfitPrompt, {
            outfitIds = v102, 
            onOverlayClosed = v114
        });
    end, {
        v102, 
        v98, 
        v106, 
        v91.navigation, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v97
    });
    local v118 = v4.useCallback(function() --[[ Line: 482 ]]
        -- upvalues: l_FFlagAXFixDeselectOutfitInManage_0 (ref), v102 (copy), v40 (ref), v106 (copy), v27 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (copy), v91 (copy), l_AvatarScreen_0 (ref)
        if l_FFlagAXFixDeselectOutfitInManage_0 and (not v102 or not v102[1]) then
            v40("Tried to rename an outfit with no outfit selected", v102);
            return;
        else
            local function v117() --[[ Line: 487 ]]
                -- upvalues: v106 (ref), v27 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (ref)
                local l_v106_1 = v106;
                v27("ManageOutfitPage", l_v106_1);
                if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_v106_1 then
                    v97.captureFocus();
                end;
            end;
            v91.navigation.navigate(l_AvatarScreen_0.RenameOutfitPrompt, {
                costumeId = v102[1], 
                onOverlayClosed = v117
            });
            return;
        end;
    end, {
        v91.navigation, 
        v102, 
        v106, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v97
    });
    local v119 = not v98 and #v102 == 1;
    local v120 = not v98 and v94 and #v102 == 1;
    local v121 = v35(if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then v108 else nil, v109, {
        onGoBack = v110, 
        onToggleMultiselect = if not not v119 or v98 then nil else v111, 
        onCancelMultiselect = if not v119 and v98 then v112 else nil, 
        onDelete = if #v102 > 0 then v115 else nil, 
        onRename = if v120 then v118 else nil
    });
    if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then
        l_useFocusNavigableSurfaceRegistryConnection_0(v108 and v108.current, l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView);
    end;
    return v4.createElement(v50, v6.Dictionary.join(v91, {
        multiSelectionEnabled = v98, 
        setMultiSelectionEnabled = v99, 
        outfitGridCanScroll = v100, 
        setOutfitGridCanScroll = v101, 
        selectedOutfits = v102, 
        setSelectedOutfits = v103, 
        exitButtonPosition = v104, 
        setExitButtonPosition = v105, 
        isGamepad = v106, 
        setIsGamepad = v107, 
        focusNavigationRef = v121, 
        avatarEditorAnalytics = v92, 
        showCustomOutfitNames = v94, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v97
    }));
end;