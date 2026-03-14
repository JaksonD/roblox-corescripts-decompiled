local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v14.Style.withStyle;
local l_Images_0 = v14.App.ImageSet.Images;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v27 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList);
local v28 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.ResetButton);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v30 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v32 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort);
local v33 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v34 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v35 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v36 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v37 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v38 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v42 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v43 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered);
local v44 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v45 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.hasClassicAccessories);
local v46 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v47 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v48 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v49 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates);
local v50 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v51 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v52 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v54 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local v55 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v56 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v57 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v55.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v60 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateLayeredClothingSortPageToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCustomizeMakeupSupport_0 = v60.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXHideUndoRedoOnLayeredPages_0 = v60.FFlagAXHideUndoRedoOnLayeredPages;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v67 = {
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt
};
local function v74(v68, v69, v70) --[[ Line: 101 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v56 (copy), v67 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v57 (copy)
    local v71 = v56.useEventMap(v67, v68);
    local v73 = v4.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v57 (ref), v69 (copy), v70 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v57.onRelease(function(v72) --[[ Line: 106 ]]
                    -- upvalues: v69 (ref)
                    v72.cancelled = true;
                    v69();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt] = if v70 then {
                handler = v57.onRelease(v70)
            } else nil
        };
    end, {
        v69, 
        v70
    });
    return v56.useEventHandlerMap(v73, v71);
end;
local v75 = {
    toastMessage = "Feature.Avatar.Message.LCSortClassicWarning", 
    isLocalized = false, 
    toastType = v37.InformationMessage
};
local v76 = l_Images_0["icons/menu/about_large"];
local v77 = UDim.new(0, 10);
local v78 = v5.PureComponent:extend("LayeredClothingSortPage");
v78.validateProps = v10.strictInterface({
    wrappedFrameRef = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v10.table else nil, 
    setWrapperIsGamepad = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v10.callback else nil, 
    tokens = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v10.table else nil, 
    isPortrait = v10.boolean, 
    topBarHeight = v10.number, 
    equippedLCAssetIdsOrdered = v10.table, 
    equippedAssets = v10.table, 
    hasClassicAccessories = v10.boolean, 
    removedList = v10.optional(v10.table), 
    isLocalUserSoothSayer = v10.optional(v10.boolean), 
    setLastSavedSort = v10.callback, 
    setCurrentToastMessage = v10.callback, 
    setFullView = v10.callback, 
    setCurrentSort = v10.callback, 
    sendAnalytics = v10.callback, 
    setEntryPage = v10.callback, 
    clearRemovedItems = v10.callback, 
    unlockCharacterUpdates = v10.callback, 
    navigation = v10.table, 
    avatarRoute = v10.table, 
    avatarExperienceAnalytics = v10.table, 
    analytics = v10.table
});
v78.init = function(v79) --[[ Line: 168 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), l_IsVRAppBuild_0 (copy), l_isGamepadInput_0 (copy), l_UserInputService_0 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_AvatarScreen_0 (copy), v23 (copy), v31 (copy)
    v79.numAssetsUponPageEntry = nil;
    v79.frameRef = v5.createRef();
    v79.verticalClothingListRef = v5.createRef();
    v79.topBarRef = v5.createRef();
    v79.refinementNavBarRef = v5.createRef();
    v79.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createFocusController();
    v79:setState({
        lastInputIsGamepad = not l_IsVRAppBuild_0() and l_isGamepadInput_0(l_UserInputService_0:GetLastInputType()), 
        isDragging = false
    });
    if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
        v79.props.setWrapperIsGamepad(not l_IsVRAppBuild_0() and l_isGamepadInput_0(l_UserInputService_0:GetLastInputType()));
    end;
    v79.onBackFromTopBar = function() --[[ Line: 187 ]]
        -- upvalues: v79 (copy), l_AvatarScreen_0 (ref)
        v79.props.unlockCharacterUpdates();
        v79.props.navigation.pop();
        v79.props.sendAnalytics(v79.props.analytics.avatarRefineGoBack);
        v79.props.setEntryPage(l_AvatarScreen_0.None);
    end;
    v79.lastInputTypeChangedCallback = function(v80) --[[ Line: 206 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v79 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (ref)
        local v81 = l_isGamepadInput_0(v80);
        if v81 ~= v79.state.lastInputIsGamepad then
            v79:setState({
                lastInputIsGamepad = v81
            });
            if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
                v79.props.setWrapperIsGamepad(v81);
            end;
        end;
    end;
    v79.onOverlayClosed = function() --[[ Line: 218 ]]
        -- upvalues: v79 (copy), l_AvatarScreen_0 (ref), v23 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return function() --[[ Line: 219 ]]
            -- upvalues: v79 (ref), l_AvatarScreen_0 (ref), v23 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            if v79.state.lastInputIsGamepad and v79.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
                v23("LayeredClothingSort");
                if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    v79.focusController.captureFocus();
                end;
            end;
        end;
    end;
    v79.onDragChange = function(v82) --[[ Line: 232 ]]
        -- upvalues: v79 (copy)
        v79:setState({
            isDragging = v82
        });
    end;
    v79.backButton = v31(v79.onBackFromTopBar);
end;
v78.saveSortOnPageEnter = function(v83) --[[ Line: 241 ]] --[[ Name: saveSortOnPageEnter ]]
    local v84 = {};
    for _, v86 in v83.props.equippedLCAssetIdsOrdered do
        if v83.props.equippedAssets[v86.typeId] and v83.props.equippedAssets[v86.typeId][v86.id] then
            v86.equipped = true;
        end;
        table.insert(v84, v86);
    end;
    v83.props.setLastSavedSort(v84);
    v83.props.setCurrentSort(v83.props.equippedLCAssetIdsOrdered);
    v83.numAssetsUponPageEntry = #v83.props.equippedLCAssetIdsOrdered;
end;
v78.onPageEntry = function(v87) --[[ Line: 267 ]] --[[ Name: onPageEntry ]]
    -- upvalues: v38 (copy), v75 (copy)
    v87:saveSortOnPageEnter();
    v87.props.setFullView(v87.props.avatarExperienceAnalytics, v38.SceneFullView);
    if v87.props.hasClassicAccessories then
        v87.props.setCurrentToastMessage(v75);
    end;
end;
v78.renderTopBar = function(v88) --[[ Line: 276 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), v30 (copy)
    return l_withLocalization_0({
        clothingSorting = "Feature.Avatar.Title.LCSortPage"
    })(function(v89) --[[ Line: 279 ]]
        -- upvalues: v5 (ref), v30 (ref), v88 (copy)
        return v5.createElement(v30.Container, {
            titleText = v89.clothingSorting, 
            transparentBackground = true, 
            hideSiteMessageBanner = v88.props.isPortrait, 
            leftItem = v88.backButton, 
            ZIndex = 1, 
            [v5.Ref] = v88.topBarRef, 
            NextSelectionRight = v88.verticalClothingListRef, 
            NextSelectionDown = v88.refinementNavBarRef
        });
    end);
end;
v78.render = function(v90) --[[ Line: 293 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v91) --[[ Line: 294 ]]
        -- upvalues: l_withLocalization_0 (ref), v90 (copy)
        return l_withLocalization_0({
            noItemText = "Feature.Avatar.Message.LCSortNoEquipped"
        })(function(v92) --[[ Line: 297 ]]
            -- upvalues: v90 (ref), v91 (copy)
            return v90:renderWithProviders(v91, v92);
        end);
    end);
end;
v78.renderWithProviders = function(v93, v94, v95) --[[ Line: 303 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v5 (copy), v29 (copy), v6 (copy), v27 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v28 (copy), l_IsVRAppBuild_0 (copy), v40 (copy), v42 (copy), v77 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_ImageSetLabel_0 (copy), v76 (copy), v61 (copy), v4 (copy), v52 (copy), l_FFlagAXHideUndoRedoOnLayeredPages_0 (copy), v51 (copy), v39 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v41 (copy), l_AvatarScreen_0 (copy), v54 (copy)
    local l_Font_0 = v94.Font;
    local l_Theme_0 = v94.Theme;
    local v98 = #v93.props.equippedLCAssetIdsOrdered > 0;
    local v99 = not v98 and v93.numAssetsUponPageEntry == 0;
    local v100 = if v98 then v93.verticalClothingListRef else v93.topBarRef;
    local v101 = v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v93.props.topBarHeight), 
        Position = UDim2.fromOffset(0, v93.props.topBarHeight), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, {
        SceneInteractionFrame = v5.createElement(v29), 
        VerticalClothingList = not v99 and v5.createElement(v6.Focusable[v27], {
            [v5.Ref] = v93.verticalClothingListRef, 
            NextSelectionLeft = v93.refinementNavBarRef, 
            lastInputIsGamepad = v93.state.lastInputIsGamepad, 
            topBarRef = v93.topBarRef, 
            focusControllerProp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v93.focusController, 
            onDragChange = v93.onDragChange
        }), 
        ResetButton = not v99 and v5.createElement(v28, {
            lastInputIsGamepad = v93.state.lastInputIsGamepad, 
            isDragging = v93.state.isDragging
        }), 
        VRAvatarRotateHandler = if l_IsVRAppBuild_0() then v5.createElement(v40) else nil, 
        NoItemsMessage = v99 and v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, v42.NoItem.BottomPadding), 
            Size = if l_IsVRAppBuild_0() then UDim2.new(1, 0, 0, 50) else UDim2.new(1, 0, 0, 100), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_IsVRAppBuild_0() and 0 or 1
        }, {
            UICorner = if l_IsVRAppBuild_0() then v5.createElement("UICorner", {
                CornerRadius = v77
            }) else nil, 
            NoItemsTextLabel = v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0, 0), 
                Text = v95.noItemText, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v93.props.tokens.Typography.BodyMedium.FontSize else v42.NoItem.TextSize, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                NoItemsIcon = v5.createElement(l_ImageSetLabel_0, {
                    Image = v76, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, -2, 0.5, 0), 
                    Size = UDim2.fromOffset(v42.NoItem.IconSize, v42.NoItem.IconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        })
    });
    local v102 = {
        TopBar = v93:renderTopBar(v95), 
        RefinementControlBar = if v61() then v4.createElement(v52, {
            ref = v93.refinementNavBarRef, 
            NextSelectionUp = v93.topBarRef, 
            NextSelectionRight = v93.verticalClothingListRef, 
            hideUndoRedo = l_FFlagAXHideUndoRedoOnLayeredPages_0 and true or nil
        }) else nil, 
        RefinementNavBar = if v61() then nil else v5.createElement(v51, {
            defaultChildRef = v93.refinementNavBarRef, 
            NextSelectionUp = v93.topBarRef, 
            NextSelectionRight = v93.verticalClothingListRef
        }), 
        LayeredClothingSortPageFrame = v101, 
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v39, {
            focusController = v93.focusController, 
            captureFocusOnMount = true
        }), 
        LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v93.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v41)
    };
    if l_IsVRAppBuild_0() then
        return v101;
    else
        return v5.createElement(v6.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v93.focusController, 
            [v5.Ref] = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v93.props.wrappedFrameRef else v93.frameRef, 
            defaultChild = v100, 
            inputBindings = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then nil else {
                Back = v6.Input.onBegin(Enum.KeyCode.ButtonB, v93.onBackFromTopBar), 
                OpenResetPrompt = not v99 and v6.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 418 ]]
                    -- upvalues: v93 (copy), l_AvatarScreen_0 (ref)
                    v93.props.navigation.navigate(l_AvatarScreen_0.ResetLayeredItemsSortPrompt, {
                        onOverlayClosed = v93.onOverlayClosed()
                    });
                end, {
                    key = "CommonUI.Messages.Action.Reset"
                }) or nil
            }
        }, {
            SceneGamepadHandler = v5.createElement(v54, nil, v102)
        });
    end;
end;
v78.didMount = function(v103) --[[ Line: 433 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AvatarScreen_0 (copy)
    if l_FFlagAXCustomizeMakeupSupport_0 then
        if v103.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
            v103:onPageEntry();
            return;
        end;
    else
        v103:onPageEntry();
    end;
end;
v78.didUpdate = function(v104, v105, _) --[[ Line: 443 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    if v104.props.avatarRoute.opaque.name ~= v105.avatarRoute.opaque.name and v104.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
        v104:onPageEntry();
    end;
    if v104.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort and v104.props.avatarRoute.isVisible and not v105.avatarRoute.isVisible then
        v104:onPageEntry();
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v104.state.lastInputIsGamepad and #v104.props.equippedLCAssetIdsOrdered == 0 and #v105.equippedLCAssetIdsOrdered > 0 then
        v104.focusController.moveFocusTo(v104.topBarRef);
    end;
end;
v78.willUnmount = function(v107) --[[ Line: 478 ]] --[[ Name: willUnmount ]]
    v107.props.unlockCharacterUpdates();
end;
local function v112(v108, _) --[[ Line: 482 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v44 (copy), l_IsVRAppBuild_0 (copy), v43 (copy), v45 (copy)
    local v110 = nil;
    local v111 = nil;
    v110 = v44(v108);
    v111 = l_IsVRAppBuild_0() and 0 or v108.TopBar.topBarHeight;
    return {
        isPortrait = v110, 
        topBarHeight = v111, 
        equippedLCAssetIdsOrdered = v43(v108), 
        equippedAssets = v108.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        hasClassicAccessories = v45(v108), 
        removedList = v108.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList, 
        isLocalUserSoothSayer = v108.IsLocalUserSoothsayer
    };
end;
local function v121(v113) --[[ Line: 501 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v32 (copy), v33 (copy), v34 (copy), v35 (copy), l_AvatarScreen_0 (copy), v50 (copy), v48 (copy), v36 (copy), v49 (copy)
    return {
        setLastSavedSort = function(v114) --[[ Line: 503 ]] --[[ Name: setLastSavedSort ]]
            -- upvalues: v113 (copy), v32 (ref)
            v113(v32(v114));
        end, 
        setCurrentSort = function(v115) --[[ Line: 506 ]] --[[ Name: setCurrentSort ]]
            -- upvalues: v113 (copy), v33 (ref)
            v113(v33(v115));
        end, 
        setCurrentToastMessage = function(v116) --[[ Line: 509 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v113 (copy), v34 (ref)
            v113(v34(v116));
        end, 
        setFullView = function(v117, v118) --[[ Line: 512 ]] --[[ Name: setFullView ]]
            -- upvalues: v113 (copy), v35 (ref), l_AvatarScreen_0 (ref)
            v113(v35(v117, l_AvatarScreen_0.LayeredClothingSort, v118));
        end, 
        sendAnalytics = function(v119) --[[ Line: 515 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v113 (copy), v50 (ref)
            v113(v50(v119));
        end, 
        setEntryPage = function(v120) --[[ Line: 518 ]] --[[ Name: setEntryPage ]]
            -- upvalues: v113 (copy), v48 (ref)
            v113(v48(v120));
        end, 
        clearRemovedItems = function() --[[ Line: 521 ]] --[[ Name: clearRemovedItems ]]
            -- upvalues: v113 (copy), v36 (ref)
            v113(v36());
        end, 
        unlockCharacterUpdates = function() --[[ Line: 524 ]] --[[ Name: unlockCharacterUpdates ]]
            -- upvalues: v113 (copy), v49 (ref)
            v113(v49());
        end
    };
end;
v78 = l_RoactServices_0.connect({
    analytics = v47, 
    avatarExperienceAnalytics = v46
})(v78);
v78 = v26((v24((v25((v7.connect(v112, v121)(v78)))))));
if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
    return function(v122) --[[ Line: 542 ]]
        -- upvalues: v4 (copy), l_useSelector_0 (copy), v43 (copy), l_useDispatch_0 (copy), v21 (copy), v47 (copy), l_useAvatarRoute_0 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_useTokens_0 (copy), v49 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v50 (copy), v48 (copy), l_AvatarScreen_0 (copy), v23 (copy), v74 (copy), l_useTableWrappedCallbackRef_0 (copy), v3 (copy), v78 (ref)
        local v123, v124 = v4.useState(false);
        local v125 = v4.useRef(nil);
        local v126 = l_useSelector_0(v43);
        local v127 = l_useDispatch_0();
        local v128 = v21(v47);
        local v129 = l_useAvatarRoute_0();
        local v130 = nil;
        if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
            v130 = l_useTokens_0();
        end;
        local v131 = v4.useCallback(function() --[[ Line: 556 ]]
            -- upvalues: v127 (copy), v49 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v122 (copy), v50 (ref), v128 (copy), v48 (ref), l_AvatarScreen_0 (ref)
            v127(v49());
            if l_FFlagAXCustomizeMakeupSupport_0 then
                v122.navigation.popToTop();
            else
                v122.navigation.pop();
            end;
            v127(v50(v128.avatarRefineGoBack));
            v127(v48(l_AvatarScreen_0.None));
        end, {
            v127, 
            v122.navigation, 
            v128
        });
        local v133 = v4.useCallback(function() --[[ Line: 578 ]]
            -- upvalues: v123 (copy), v129 (copy), l_AvatarScreen_0 (ref), v23 (ref), v122 (copy)
            local function v132() --[[ Line: 579 ]]
                -- upvalues: v123 (ref), v129 (ref), l_AvatarScreen_0 (ref), v23 (ref)
                if v123 and v129.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
                    v23("LayeredClothingSort");
                end;
            end;
            v122.navigation.navigate(l_AvatarScreen_0.ResetLayeredItemsSortPrompt, {
                onOverlayClosed = v132
            });
        end, {
            v122.navigation, 
            v123, 
            v129
        });
        local v134 = v74(v125, v131, if #v126 > 0 then v133 else nil);
        local v135 = l_useTableWrappedCallbackRef_0(v134);
        local v136 = v3.Dictionary.join(v122, {
            wrappedFrameRef = v135, 
            setWrapperIsGamepad = v124, 
            tokens = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v130 else nil
        });
        return v4.createElement(v78, v136);
    end;
else
    return v78;
end;