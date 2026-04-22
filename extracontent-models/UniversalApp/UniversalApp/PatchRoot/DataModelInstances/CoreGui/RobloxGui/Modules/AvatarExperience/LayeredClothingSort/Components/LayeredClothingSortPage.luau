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
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v22 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_logOnOverlayClosed_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v28 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList);
local v29 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.ResetButton);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v31 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v33 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort);
local v34 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v35 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v36 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v37 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v38 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_FullView_0 = v20.Enums.FullView;
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v43 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v44 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered);
local v45 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v46 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.hasClassicAccessories);
local v47 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v48 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v49 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
local v50 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates);
local v51 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v52 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v53 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v55 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local v56 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v57 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v58 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v56.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v61 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v62 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateLayeredClothingSortPageToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCustomizeMakeupSupport_0 = v61.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXHideUndoRedoOnLayeredPages_0 = v61.FFlagAXHideUndoRedoOnLayeredPages;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v68 = {
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt
};
local function v75(v69, v70, v71) --[[ Line: 102 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v57 (copy), v68 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v58 (copy)
    local v72 = v57.useEventMap(v68, v69);
    local v74 = v4.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v58 (ref), v70 (copy), v71 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v58.onRelease(function(v73) --[[ Line: 107 ]]
                    -- upvalues: v70 (ref)
                    v73.cancelled = true;
                    v70();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenLayeredClothingSortResetPrompt] = if v71 then {
                handler = v58.onRelease(v71)
            } else nil
        };
    end, {
        v70, 
        v71
    });
    return v57.useEventHandlerMap(v74, v72);
end;
local v76 = {
    toastMessage = "Feature.Avatar.Message.LCSortClassicWarning", 
    isLocalized = false, 
    toastType = v38.InformationMessage
};
local v77 = l_Images_0["icons/menu/about_large"];
local v78 = UDim.new(0, 10);
local v79 = v5.PureComponent:extend("LayeredClothingSortPage");
v79.validateProps = v10.strictInterface({
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
v79.init = function(v80) --[[ Line: 169 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), l_IsVRAppBuild_0 (copy), l_isGamepadInput_0 (copy), l_UserInputService_0 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_AvatarScreen_0 (copy), l_logOnOverlayClosed_0 (copy), v32 (copy)
    v80.numAssetsUponPageEntry = nil;
    v80.frameRef = v5.createRef();
    v80.verticalClothingListRef = v5.createRef();
    v80.topBarRef = v5.createRef();
    v80.refinementNavBarRef = v5.createRef();
    v80.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createFocusController();
    v80:setState({
        lastInputIsGamepad = not l_IsVRAppBuild_0() and l_isGamepadInput_0(l_UserInputService_0:GetLastInputType()), 
        isDragging = false
    });
    if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
        v80.props.setWrapperIsGamepad(not l_IsVRAppBuild_0() and l_isGamepadInput_0(l_UserInputService_0:GetLastInputType()));
    end;
    v80.onBackFromTopBar = function() --[[ Line: 188 ]]
        -- upvalues: v80 (copy), l_AvatarScreen_0 (ref)
        v80.props.unlockCharacterUpdates();
        v80.props.navigation.pop();
        v80.props.sendAnalytics(v80.props.analytics.avatarRefineGoBack);
        v80.props.setEntryPage(l_AvatarScreen_0.None);
    end;
    v80.lastInputTypeChangedCallback = function(v81) --[[ Line: 207 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v80 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (ref)
        local v82 = l_isGamepadInput_0(v81);
        if v82 ~= v80.state.lastInputIsGamepad then
            v80:setState({
                lastInputIsGamepad = v82
            });
            if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
                v80.props.setWrapperIsGamepad(v82);
            end;
        end;
    end;
    v80.onOverlayClosed = function() --[[ Line: 219 ]]
        -- upvalues: v80 (copy), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return function() --[[ Line: 220 ]]
            -- upvalues: v80 (ref), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            if v80.state.lastInputIsGamepad and v80.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
                l_logOnOverlayClosed_0("LayeredClothingSort");
                if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    v80.focusController.captureFocus();
                end;
            end;
        end;
    end;
    v80.onDragChange = function(v83) --[[ Line: 233 ]]
        -- upvalues: v80 (copy)
        v80:setState({
            isDragging = v83
        });
    end;
    v80.backButton = v32(v80.onBackFromTopBar);
end;
v79.saveSortOnPageEnter = function(v84) --[[ Line: 242 ]] --[[ Name: saveSortOnPageEnter ]]
    local v85 = {};
    for _, v87 in v84.props.equippedLCAssetIdsOrdered do
        if v84.props.equippedAssets[v87.typeId] and v84.props.equippedAssets[v87.typeId][v87.id] then
            v87.equipped = true;
        end;
        table.insert(v85, v87);
    end;
    v84.props.setLastSavedSort(v85);
    v84.props.setCurrentSort(v84.props.equippedLCAssetIdsOrdered);
    v84.numAssetsUponPageEntry = #v84.props.equippedLCAssetIdsOrdered;
end;
v79.onPageEntry = function(v88) --[[ Line: 268 ]] --[[ Name: onPageEntry ]]
    -- upvalues: l_FullView_0 (copy), v76 (copy)
    v88:saveSortOnPageEnter();
    v88.props.setFullView(v88.props.avatarExperienceAnalytics, l_FullView_0.SceneFullView);
    if v88.props.hasClassicAccessories then
        v88.props.setCurrentToastMessage(v76);
    end;
end;
v79.renderTopBar = function(v89) --[[ Line: 277 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), v31 (copy)
    return l_withLocalization_0({
        clothingSorting = "Feature.Avatar.Title.LCSortPage"
    })(function(v90) --[[ Line: 280 ]]
        -- upvalues: v5 (ref), v31 (ref), v89 (copy)
        return v5.createElement(v31.Container, {
            titleText = v90.clothingSorting, 
            transparentBackground = true, 
            hideSiteMessageBanner = v89.props.isPortrait, 
            leftItem = v89.backButton, 
            ZIndex = 1, 
            [v5.Ref] = v89.topBarRef, 
            NextSelectionRight = v89.verticalClothingListRef, 
            NextSelectionDown = v89.refinementNavBarRef
        });
    end);
end;
v79.render = function(v91) --[[ Line: 294 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v92) --[[ Line: 295 ]]
        -- upvalues: l_withLocalization_0 (ref), v91 (copy)
        return l_withLocalization_0({
            noItemText = "Feature.Avatar.Message.LCSortNoEquipped"
        })(function(v93) --[[ Line: 298 ]]
            -- upvalues: v91 (ref), v92 (copy)
            return v91:renderWithProviders(v92, v93);
        end);
    end);
end;
v79.renderWithProviders = function(v94, v95, v96) --[[ Line: 304 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v5 (copy), v30 (copy), v6 (copy), v28 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v29 (copy), l_IsVRAppBuild_0 (copy), v41 (copy), v43 (copy), v78 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_ImageSetLabel_0 (copy), v77 (copy), v62 (copy), v4 (copy), v53 (copy), l_FFlagAXHideUndoRedoOnLayeredPages_0 (copy), v52 (copy), v40 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v42 (copy), l_AvatarScreen_0 (copy), v55 (copy)
    local l_Font_0 = v95.Font;
    local l_Theme_0 = v95.Theme;
    local v99 = #v94.props.equippedLCAssetIdsOrdered > 0;
    local v100 = not v99 and v94.numAssetsUponPageEntry == 0;
    local v101 = if v99 then v94.verticalClothingListRef else v94.topBarRef;
    local v102 = v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -v94.props.topBarHeight), 
        Position = UDim2.fromOffset(0, v94.props.topBarHeight), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, {
        SceneInteractionFrame = v5.createElement(v30), 
        VerticalClothingList = not v100 and v5.createElement(v6.Focusable[v28], {
            [v5.Ref] = v94.verticalClothingListRef, 
            NextSelectionLeft = v94.refinementNavBarRef, 
            lastInputIsGamepad = v94.state.lastInputIsGamepad, 
            topBarRef = v94.topBarRef, 
            focusControllerProp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v94.focusController, 
            onDragChange = v94.onDragChange
        }), 
        ResetButton = not v100 and v5.createElement(v29, {
            lastInputIsGamepad = v94.state.lastInputIsGamepad, 
            isDragging = v94.state.isDragging
        }), 
        VRAvatarRotateHandler = if l_IsVRAppBuild_0() then v5.createElement(v41) else nil, 
        NoItemsMessage = v100 and v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, v43.NoItem.BottomPadding), 
            Size = if l_IsVRAppBuild_0() then UDim2.new(1, 0, 0, 50) else UDim2.new(1, 0, 0, 100), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_IsVRAppBuild_0() and 0 or 1
        }, {
            UICorner = if l_IsVRAppBuild_0() then v5.createElement("UICorner", {
                CornerRadius = v78
            }) else nil, 
            NoItemsTextLabel = v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0, 0), 
                Text = v96.noItemText, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v94.props.tokens.Typography.BodyMedium.FontSize else v43.NoItem.TextSize, 
                TextColor3 = l_Theme_0.IconEmphasis.Color, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                NoItemsIcon = v5.createElement(l_ImageSetLabel_0, {
                    Image = v77, 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, -2, 0.5, 0), 
                    Size = UDim2.fromOffset(v43.NoItem.IconSize, v43.NoItem.IconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        })
    });
    local v103 = {
        TopBar = v94:renderTopBar(v96), 
        RefinementControlBar = if v62() then v4.createElement(v53, {
            ref = v94.refinementNavBarRef, 
            NextSelectionUp = v94.topBarRef, 
            NextSelectionRight = v94.verticalClothingListRef, 
            hideUndoRedo = l_FFlagAXHideUndoRedoOnLayeredPages_0 and true or nil
        }) else nil, 
        RefinementNavBar = if v62() then nil else v5.createElement(v52, {
            defaultChildRef = v94.refinementNavBarRef, 
            NextSelectionUp = v94.topBarRef, 
            NextSelectionRight = v94.verticalClothingListRef
        }), 
        LayeredClothingSortPageFrame = v102, 
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v40, {
            focusController = v94.focusController, 
            captureFocusOnMount = true
        }), 
        LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v94.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v42)
    };
    if l_IsVRAppBuild_0() then
        return v102;
    else
        return v5.createElement(v6.Focusable.Frame, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v94.focusController, 
            [v5.Ref] = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v94.props.wrappedFrameRef else v94.frameRef, 
            defaultChild = v101, 
            inputBindings = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then nil else {
                Back = v6.Input.onBegin(Enum.KeyCode.ButtonB, v94.onBackFromTopBar), 
                OpenResetPrompt = not v100 and v6.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 419 ]]
                    -- upvalues: v94 (copy), l_AvatarScreen_0 (ref)
                    v94.props.navigation.navigate(l_AvatarScreen_0.ResetLayeredItemsSortPrompt, {
                        onOverlayClosed = v94.onOverlayClosed()
                    });
                end, {
                    key = "CommonUI.Messages.Action.Reset"
                }) or nil
            }
        }, {
            SceneGamepadHandler = v5.createElement(v55, nil, v103)
        });
    end;
end;
v79.didMount = function(v104) --[[ Line: 434 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AvatarScreen_0 (copy)
    if l_FFlagAXCustomizeMakeupSupport_0 then
        if v104.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
            v104:onPageEntry();
            return;
        end;
    else
        v104:onPageEntry();
    end;
end;
v79.didUpdate = function(v105, v106, _) --[[ Line: 444 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    if v105.props.avatarRoute.opaque.name ~= v106.avatarRoute.opaque.name and v105.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
        v105:onPageEntry();
    end;
    if v105.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort and v105.props.avatarRoute.isVisible and not v106.avatarRoute.isVisible then
        v105:onPageEntry();
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v105.state.lastInputIsGamepad and #v105.props.equippedLCAssetIdsOrdered == 0 and #v106.equippedLCAssetIdsOrdered > 0 then
        v105.focusController.moveFocusTo(v105.topBarRef);
    end;
end;
v79.willUnmount = function(v108) --[[ Line: 479 ]] --[[ Name: willUnmount ]]
    v108.props.unlockCharacterUpdates();
end;
local function v113(v109, _) --[[ Line: 483 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v45 (copy), l_IsVRAppBuild_0 (copy), v44 (copy), v46 (copy)
    local v111 = nil;
    local v112 = nil;
    v111 = v45(v109);
    v112 = l_IsVRAppBuild_0() and 0 or v109.TopBar.topBarHeight;
    return {
        isPortrait = v111, 
        topBarHeight = v112, 
        equippedLCAssetIdsOrdered = v44(v109), 
        equippedAssets = v109.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        hasClassicAccessories = v46(v109), 
        removedList = v109.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList, 
        isLocalUserSoothSayer = v109.IsLocalUserSoothsayer
    };
end;
local function v122(v114) --[[ Line: 502 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v33 (copy), v34 (copy), v35 (copy), v36 (copy), l_AvatarScreen_0 (copy), v51 (copy), v49 (copy), v37 (copy), v50 (copy)
    return {
        setLastSavedSort = function(v115) --[[ Line: 504 ]] --[[ Name: setLastSavedSort ]]
            -- upvalues: v114 (copy), v33 (ref)
            v114(v33(v115));
        end, 
        setCurrentSort = function(v116) --[[ Line: 507 ]] --[[ Name: setCurrentSort ]]
            -- upvalues: v114 (copy), v34 (ref)
            v114(v34(v116));
        end, 
        setCurrentToastMessage = function(v117) --[[ Line: 510 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v114 (copy), v35 (ref)
            v114(v35(v117));
        end, 
        setFullView = function(v118, v119) --[[ Line: 513 ]] --[[ Name: setFullView ]]
            -- upvalues: v114 (copy), v36 (ref), l_AvatarScreen_0 (ref)
            v114(v36(v118, l_AvatarScreen_0.LayeredClothingSort, v119));
        end, 
        sendAnalytics = function(v120) --[[ Line: 516 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v114 (copy), v51 (ref)
            v114(v51(v120));
        end, 
        setEntryPage = function(v121) --[[ Line: 519 ]] --[[ Name: setEntryPage ]]
            -- upvalues: v114 (copy), v49 (ref)
            v114(v49(v121));
        end, 
        clearRemovedItems = function() --[[ Line: 522 ]] --[[ Name: clearRemovedItems ]]
            -- upvalues: v114 (copy), v37 (ref)
            v114(v37());
        end, 
        unlockCharacterUpdates = function() --[[ Line: 525 ]] --[[ Name: unlockCharacterUpdates ]]
            -- upvalues: v114 (copy), v50 (ref)
            v114(v50());
        end
    };
end;
v79 = l_RoactServices_0.connect({
    analytics = v48, 
    avatarExperienceAnalytics = v47
})(v79);
v79 = v27((v25((v26((v7.connect(v113, v122)(v79)))))));
if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
    return function(v123) --[[ Line: 543 ]]
        -- upvalues: v4 (copy), l_useSelector_0 (copy), v44 (copy), l_useDispatch_0 (copy), v22 (copy), v48 (copy), l_useAvatarRoute_0 (copy), l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 (copy), l_useTokens_0 (copy), v50 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v51 (copy), v49 (copy), l_AvatarScreen_0 (copy), l_logOnOverlayClosed_0 (copy), v75 (copy), l_useTableWrappedCallbackRef_0 (copy), v3 (copy), v79 (ref)
        local v124, v125 = v4.useState(false);
        local v126 = v4.useRef(nil);
        local v127 = l_useSelector_0(v44);
        local v128 = l_useDispatch_0();
        local v129 = v22(v48);
        local v130 = l_useAvatarRoute_0();
        local v131 = nil;
        if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then
            v131 = l_useTokens_0();
        end;
        local v132 = v4.useCallback(function() --[[ Line: 557 ]]
            -- upvalues: v128 (copy), v50 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v123 (copy), v51 (ref), v129 (copy), v49 (ref), l_AvatarScreen_0 (ref)
            v128(v50());
            if l_FFlagAXCustomizeMakeupSupport_0 then
                v123.navigation.popToTop();
            else
                v123.navigation.pop();
            end;
            v128(v51(v129.avatarRefineGoBack));
            v128(v49(l_AvatarScreen_0.None));
        end, {
            v128, 
            v123.navigation, 
            v129
        });
        local v134 = v4.useCallback(function() --[[ Line: 579 ]]
            -- upvalues: v124 (copy), v130 (copy), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref), v123 (copy)
            local function v133() --[[ Line: 580 ]]
                -- upvalues: v124 (ref), v130 (ref), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref)
                if v124 and v130.opaque.name == l_AvatarScreen_0.LayeredClothingSort then
                    l_logOnOverlayClosed_0("LayeredClothingSort");
                end;
            end;
            v123.navigation.navigate(l_AvatarScreen_0.ResetLayeredItemsSortPrompt, {
                onOverlayClosed = v133
            });
        end, {
            v123.navigation, 
            v124, 
            v130
        });
        local v135 = v75(v126, v132, if #v127 > 0 then v134 else nil);
        local v136 = l_useTableWrappedCallbackRef_0(v135);
        local v137 = v3.Dictionary.join(v123, {
            wrappedFrameRef = v136, 
            setWrapperIsGamepad = v125, 
            tokens = if l_FFlagAXMigrateLayeredClothingSortPageToFocusNavigation_0 then v131 else nil
        });
        return v4.createElement(v79, v137);
    end;
else
    return v79;
end;