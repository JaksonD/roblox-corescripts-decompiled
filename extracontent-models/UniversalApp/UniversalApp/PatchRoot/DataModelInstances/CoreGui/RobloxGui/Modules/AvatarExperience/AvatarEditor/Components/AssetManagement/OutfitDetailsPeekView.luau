local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local v11 = require(l_CorePackages_0.Packages.React);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v16 = require(l_Modules_0.LuaApp.Constants);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v20.Enums.AvatarScreen;
local l_AvatarRoute_0 = v20.AvatarRoute.AvatarRoute;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsContainer);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v30 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v31 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v36 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local v37 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v39 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v40 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v41 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v39.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v44 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateOutfitDetailsPeekViewToFocusNavigation", false);
local l_withStyle_0 = v9.Style.withStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local v49 = l_Images_0["icons/navigation/close"];
local v50 = UDim.new(1, 0);
local v51 = l_GuiService_0:IsTenFootInterface();
local l_Focusable_0 = v10.Focusable;
local v53 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v59(v54, v55) --[[ Line: 96 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v40 (copy), v53 (copy), v11 (copy), l_FocusNavigationEventNameEnum_0 (copy), v41 (copy)
    local v56 = v40.useEventMap(v53, v54);
    local v58 = v11.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v41 (ref), v55 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v41.onRelease(function(v57) --[[ Line: 101 ]]
                    -- upvalues: v55 (ref)
                    v57.cancelled = true;
                    v55();
                end)
            }
        };
    end, {
        v55
    });
    return v40.useEventHandlerMap(v58, v56);
end;
local _ = function(v60, v61) --[[ Line: 111 ]] --[[ Name: useOnScrollEffect ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    v11.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v61 (copy), l_RunService_0 (ref), v60 (copy), l_UserInputService_0 (ref)
        local v62 = nil;
        local v63 = nil;
        if v61 then
            local v64 = nil;
            do
                local l_v64_0 = v64;
                v62 = l_RunService_0.Heartbeat:Connect(function(v66) --[[ Line: 121 ]]
                    -- upvalues: l_v64_0 (ref), v60 (ref)
                    if l_v64_0 and l_v64_0.KeyCode == Enum.KeyCode.Thumbstick2 then
                        v60(l_v64_0, v66);
                    end;
                end);
                v63 = l_UserInputService_0.InputChanged:Connect(function(v67, _) --[[ Line: 126 ]]
                    -- upvalues: l_v64_0 (ref)
                    if v67.KeyCode == Enum.KeyCode.Thumbstick2 then
                        if v67.UserInputState == Enum.UserInputState.Change then
                            l_v64_0 = v67;
                            return;
                        elseif v67.UserInputState == Enum.UserInputState.End then
                            l_v64_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 137 ]]
            -- upvalues: v62 (ref), v63 (ref)
            if v62 then
                v62:Disconnect();
            end;
            if v63 then
                v63:Disconnect();
            end;
        end;
    end, {
        v60, 
        v61
    });
end;
local v70 = v6.PureComponent:extend("OutfitDetailsPeekView");
v70.validateProps = v8.strictInterface({
    outfitId = v8.string, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.optional(v8.table), 
    ZIndex = v8.optional(v8.integer), 
    onPeekViewClosed = v8.optional(v8.callback), 
    exitButtonPosition = v8.optional(v8.Vector2), 
    deleteOutfit = v8.optional(v8.callback), 
    renameOutfit = v8.optional(v8.callback), 
    showFullWithNoPeekView = v8.optional(v8.boolean), 
    renderBottomBar = v8.optional(v8.boolean), 
    NextSelectionLeft = v8.optional(v8.table), 
    outfitDetailsPeekViewRefs = v8.optional(v8.table), 
    navigation = v8.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    overlayClosedCallback = v8.callback, 
    peekViewContainerFocusNavigationRef = if v44 then v8.callback else nil, 
    swipeScrollingFrameRef = if v44 then v8.table else nil, 
    isPortrait = v8.boolean, 
    topBarHeight = v8.number, 
    itemDetailsExpanded = v8.boolean, 
    statusBarHeight = v8.number, 
    outfitInfo = v8.optional(v8.table), 
    setItemDetailsExpanded = v8.callback, 
    fetchOutfitDetails = v8.callback, 
    avatarEditorAnalytics = v8.table
});
v70.defaultProps = {
    showFullWithNoPeekView = false, 
    renderBottomBar = true
};
v70.init = function(v71) --[[ Line: 197 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v44 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_PeekViewState_0 (copy), v33 (copy), l_IsVRAppBuild_0 (copy)
    v71.actionBarRef = v6.createRef();
    v71.exitButtonRef = v6.createRef();
    if not v44 then
        v71.swipeScrollingFrameRef = v6.createRef();
    end;
    v71.itemsGridRef = v6.createRef();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v71:setState({
        isGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v71.viewStateChanged = function(v73, _) --[[ Line: 213 ]]
        -- upvalues: l_PeekViewState_0 (ref), v71 (copy), v33 (ref)
        if v73 == l_PeekViewState_0.Closed then
            if v71.props.onPeekViewClosed then
                v71.props.onPeekViewClosed();
            end;
            v33.closeFiltersAndItemDetails(v71.props.navigation);
        end;
        if v73 == l_PeekViewState_0.Full or v73 == l_PeekViewState_0.Extended then
            v71.props.setItemDetailsExpanded(true);
            return;
        else
            v71.props.setItemDetailsExpanded(false);
            return;
        end;
    end;
    v71.lastInputTypeChangedCallback = function() --[[ Line: 229 ]]
        -- upvalues: l_UserInputService_0 (ref), l_isGamepadInput_0 (ref), v71 (copy)
        local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
        local v76 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_1);
        if v76 ~= v71.state.isGamepad then
            v71:setState({
                isGamepad = v76
            });
        end;
    end;
    v71.onExitButtonPressed = function() --[[ Line: 239 ]]
        -- upvalues: v71 (copy), v33 (ref)
        if v71.props.onPeekViewClosed then
            v71.props.onPeekViewClosed();
        end;
        v33.closeFiltersAndItemDetails(v71.props.navigation);
    end;
    local v77;
    l_l_UserInputService_0_LastInputType_0, v77 = v6.createBinding(Vector2.new(0, 0));
    v71.absolutePositionBinding = l_l_UserInputService_0_LastInputType_0;
    v71.updateAbsolutePositionBinding = v77;
    v71.containerPositionChanged = function(v78) --[[ Line: 248 ]]
        -- upvalues: v71 (copy)
        v71.updateAbsolutePositionBinding(v78.AbsolutePosition);
    end;
    v71.getExitButtonUDim2Pos = function() --[[ Line: 252 ]]
        -- upvalues: v71 (copy)
        if v71.props.isPortrait then
            return UDim2.fromScale(15, v71.props.statusBarHeight);
        else
            return UDim2.new(0, 15, 0, -44 - (v71.props.topBarHeight - 44) / 2);
        end;
    end;
    v71.getRef = function() --[[ Line: 266 ]]
        -- upvalues: v71 (copy)
        local l_key_0 = v71.props.navigation.state.key;
        local v80 = v71:getOutfitDetailsPeekViewRefs();
        if v80 and l_key_0 then
            return v80[l_key_0];
        else
            return nil;
        end;
    end;
    v71.shouldRenderFullScreen = function() --[[ Line: 276 ]]
        -- upvalues: v71 (copy), l_IsVRAppBuild_0 (ref)
        return v71.props.showFullWithNoPeekView or l_IsVRAppBuild_0();
    end;
end;
v70.getOutfitDetailsPeekViewRefs = function(v81) --[[ Line: 281 ]] --[[ Name: getOutfitDetailsPeekViewRefs ]]
    -- upvalues: v10 (copy)
    if v81.props.outfitDetailsPeekViewRefs then
        return v81.props.outfitDetailsPeekViewRefs;
    else
        if not v81.outfitDetailsPeekViewRefs then
            v81.outfitDetailsPeekViewRefs = v10.createRefCache();
        end;
        return v81.outfitDetailsPeekViewRefs;
    end;
end;
v70.renderActionBar = function(v82, v83) --[[ Line: 292 ]] --[[ Name: renderActionBar ]]
    -- upvalues: v6 (copy), v27 (copy)
    return v6.createElement(v27, {
        gradientFade = true, 
        multiSelect = false, 
        selectedOutfits = {
            v82.props.outfitId
        }, 
        ZIndex = 2, 
        bottomPadding = v83, 
        deleteOutfit = v82.props.deleteOutfit, 
        renameOutfit = v82.props.renameOutfit, 
        NextSelectionUp = v82.props.isPortrait and v82.exitButtonRef or nil, 
        [v6.Ref] = v82.actionBarRef
    });
end;
v70.renderWithProviders = function(v84, v85) --[[ Line: 309 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v26 (copy), v51 (copy), v16 (copy), v6 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v44 (copy), v10 (copy), v33 (copy), l_GamepadUtils_0 (copy), v50 (copy), v34 (copy), v35 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_IconButton_0 (copy), v49 (copy), l_IconSize_0 (copy), l_PeekView_0 (copy), v28 (copy)
    local l_Theme_0 = v85.Theme;
    local v87 = UDim2.fromOffset(0, v84.props.topBarHeight);
    local v88 = UDim2.new(1, 0, 1, -v84.props.topBarHeight);
    local v89 = not v84.props.isPortrait and not l_IsVRAppBuild_0();
    if v89 then
        v87 = UDim2.new(v26.LandscapeNavWidth, 0, 0, v84.props.topBarHeight);
        v88 = UDim2.new(v26.LandscapeSceneWidth, 0, 1, -v84.props.topBarHeight);
    end;
    local v90 = 64;
    if not v89 then
        v90 = v90 + 24;
    end;
    local v91 = nil;
    if v84.state.isGamepad and v51 then
        v91 = v16.GAMEPAD_BOTTOM_BAR_SIZE;
        v90 = v90 + v16.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local l_exitButtonPosition_0 = v84.props.exitButtonPosition;
    local v93 = nil;
    if l_exitButtonPosition_0 then
        v93 = v84.absolutePositionBinding:map(function(v94) --[[ Line: 334 ]]
            -- upvalues: l_exitButtonPosition_0 (copy)
            return UDim2.fromOffset(l_exitButtonPosition_0.X - v94.X, l_exitButtonPosition_0.Y - v94.Y);
        end);
    end;
    local v95 = nil;
    if not l_exitButtonPosition_0 then
        v95 = v84.getExitButtonUDim2Pos();
    end;
    local v96 = v84.props.itemDetailsExpanded and (v84.props.isPortrait or v84.shouldRenderFullScreen());
    local v97 = v84.getRef();
    return v6.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        ZIndex = v84.props.ZIndex, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v88, 
        Position = v87, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v84.props.NextSelectionLeft, 
        [v6.Ref] = v97, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v84.props.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v84.props.renderBottomBar then v84.actionBarRef else nil, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v44 then nil else {
            Close = v10.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 370 ]]
                -- upvalues: v33 (ref), v84 (copy)
                v33.closeFiltersAndItemDetails(v84.props.navigation);
                if v84.props.onPeekViewClosed then
                    v84.props.onPeekViewClosed();
                end;
            end), 
            ScrollPeekView = if v84.swipeScrollingFrameRef and v84.swipeScrollingFrameRef.current ~= nil then v10.Input.onStep(Enum.KeyCode.Thumbstick2, function(v98, v99) --[[ Line: 378 ]]
                -- upvalues: v84 (copy), l_GamepadUtils_0 (ref), v50 (ref)
                local l_Position_0 = v98.Position;
                local l_current_0 = v84.swipeScrollingFrameRef.current;
                local v102 = l_current_0.CanvasPosition.Y + v99 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
                if v102 <= l_current_0.AbsoluteCanvasSize.Y * v50.Scale + v50.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v102);
                end;
            end) else nil
        }, 
        [v6.Change.AbsolutePosition] = v84.containerPositionChanged
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createElement(v34, {
            focusController = v84.props.focusController
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createElement(v35), 
        LastInputTypeChangedConnection = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v84.lastInputTypeChangedCallback
        }), 
        Background = if v84.props.itemDetailsExpanded then v6.createElement("TextButton", {
            BackgroundTransparency = v84.props.isPortrait and l_Theme_0.Overlay.Transparency or 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.new(1, 0, 1, v84.props.topBarHeight), 
            Position = UDim2.fromOffset(0, -v84.props.topBarHeight), 
            ZIndex = 1, 
            Text = "", 
            AutoButtonColor = false
        }) else nil, 
        ExitButton = v96 and v6.createElement(l_IconButton_0, {
            position = if l_exitButtonPosition_0 then v93 else v95, 
            size = UDim2.fromOffset(44, 44), 
            icon = v49, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onActivated = v84.onExitButtonPressed, 
            buttonRef = v84.exitButtonRef, 
            NextSelectionDown = if v84.props.renderBottomBar then v84.actionBarRef else v84.itemsGridRef
        }), 
        PeekViewContainer = if not v84.shouldRenderFullScreen() then v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ClipsDescendants = true, 
            ZIndex = 3, 
            [v6.Ref] = if v44 then v84.props.peekViewContainerFocusNavigationRef else nil
        }, {
            PeekView = v6.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, v90), 
                mountAnimation = true, 
                mountAsFullView = true, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v84.viewStateChanged, 
                bottomDockedContainerHeight = v90, 
                bottomDockedContainerContent = if v84.props.renderBottomBar then v84:renderActionBar(v91) else nil, 
                backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                peekHeaderClose = true, 
                isScrollingEnabled = true, 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
            }, {
                OutfitDetailsContainer = v6.createElement(v28, {
                    outfitId = v84.props.outfitId, 
                    itemsGridRef = v84.itemsGridRef, 
                    NextSelectionUp = v84.exitButtonRef
                })
            })
        }) else nil, 
        ScrollingContent = if v84.shouldRenderFullScreen() then v6.createElement("ScrollingFrame", {
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.fromScale(1, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ZIndex = 3, 
            [v6.Ref] = if v44 then v84.props.swipeScrollingFrameRef else v84.swipeScrollingFrameRef
        }, {
            OutfitDetailsContainer = v6.createElement(v28, {
                outfitId = v84.props.outfitId, 
                itemsGridRef = v84.itemsGridRef, 
                NextSelectionUp = v84.exitButtonRef
            })
        }) else nil
    });
end;
v70.render = function(v103) --[[ Line: 502 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v104) --[[ Line: 503 ]]
        -- upvalues: v103 (copy)
        return v103:renderWithProviders(v104);
    end);
end;
local function _(v105) --[[ Line: 508 ]] --[[ Name: isOutfitInfoEmpty ]]
    return not v105 or not v105.assets or #v105.assets == 0;
end;
v70.didMount = function(v107) --[[ Line: 512 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local v108 = v107.getRef();
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v107.state.isGamepad and v107.props.isPortrait then
        v107.props.focusController.moveFocusTo(v108);
    end;
    if v108:getValue() then
        v107.containerPositionChanged(v108:getValue());
    end;
    v107.props.setItemDetailsExpanded(true);
    local l_outfitInfo_0 = v107.props.outfitInfo;
    if not l_outfitInfo_0 or not l_outfitInfo_0.assets or #l_outfitInfo_0.assets == 0 then
        v107.props.fetchOutfitDetails(v107.props.outfitId);
    end;
end;
v70.didUpdate = function(v110, v111, v112) --[[ Line: 531 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v113 = v110.getRef();
        if v110.state.isGamepad and not v112.isGamepad and v110.props.isPortrait then
            v110.props.focusController.moveFocusTo(v113);
        end;
        if v110.props.isPortrait and v111.isPortrait and v110.state.isGamepad then
            v110.props.focusController.moveFocusTo(v113);
        end;
    end;
    if v110.props.outfitId ~= v111.outfitId then
        local l_outfitInfo_1 = v110.props.outfitInfo;
        if not l_outfitInfo_1 or not l_outfitInfo_1.assets or #l_outfitInfo_1.assets == 0 then
            v110.props.fetchOutfitDetails(v110.props.outfitId);
        end;
    end;
end;
v70.willUnmount = function(v115) --[[ Line: 552 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    if v115.props.avatarRoute.current.name ~= l_AvatarScreen_0.OutfitDetails or v115.props.avatarRoute.current.key == v115.props.navigation.state.key then
        v115.props.setItemDetailsExpanded(false);
    end;
end;
v70 = v7.connect(function(v116, v117) --[[ Line: 561 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v37 (copy)
    local v118 = v116.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    return {
        outfitInfo = v116.AvatarExperience.AvatarEditor.OutfitInfos[v117.outfitId], 
        isPortrait = v118, 
        topBarHeight = v37.getTopBarHeightAvatarScene(v116), 
        itemDetailsExpanded = v116.AvatarExperience.Common.ItemDetailsExpanded, 
        statusBarHeight = v116.TopBar.statusBarHeight
    };
end, function(v119) --[[ Line: 576 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v36 (copy), v15 (copy)
    return {
        setItemDetailsExpanded = function(v120) --[[ Line: 578 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v119 (copy), v36 (ref)
            v119(v36(v120));
        end, 
        fetchOutfitDetails = function(v121) --[[ Line: 581 ]] --[[ Name: fetchOutfitDetails ]]
            -- upvalues: v119 (copy), v15 (ref)
            v119(v15(v121));
        end
    };
end)(v70);
if not v44 then
    v70 = v32(v70);
end;
v70 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v29
})(v70);
local function v127(v122) --[[ Line: 597 ]] --[[ Name: OutfitDetailsPageContainer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), v10 (copy), v31 (copy), v30 (copy), v5 (copy), v6 (copy), v70 (ref)
    local v123 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.useRef(v10.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v122.focusController then
        v123 = v122.focusController;
    end;
    local v124 = v31(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v123);
    local v125 = v30({
        overlayClosedCallback = v124
    });
    local v126 = v5.Dictionary.join(v122, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v123, 
        overlayClosedCallback = v124
    });
    return v6.createElement("Frame", {
        [v6.Ref] = v125, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        OutfitDetailsPeekView = v11.createElement(v70, v126)
    });
end;
local function v151(v128) --[[ Line: 624 ]] --[[ Name: OutfitDetailsPageContainerNew ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), v10 (copy), v31 (copy), v30 (copy), v33 (copy), l_GamepadUtils_0 (copy), v50 (copy), l_IsVRAppBuild_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v59 (copy), l_useTableWrappedCallbackRef_0 (copy), v5 (copy), v6 (copy), v70 (ref)
    local v129 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.useRef(v10.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v128.focusController then
        v129 = v128.focusController;
    end;
    local v130 = v31(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129);
    local v131 = v30({
        overlayClosedCallback = v130
    });
    local v132 = v11.useRef(nil);
    local v133 = v11.useCallback(function() --[[ Line: 640 ]]
        -- upvalues: v33 (ref), v128 (copy)
        v33.closeFiltersAndItemDetails(v128.navigation);
        if v128.onPeekViewClosed then
            v128.onPeekViewClosed();
        end;
    end, {
        v128.navigation, 
        v128.onPeekViewClosed
    });
    local v138 = v11.useCallback(function(v134, v135) --[[ Line: 647 ]]
        -- upvalues: v132 (copy), l_GamepadUtils_0 (ref), v50 (ref)
        local v136 = Vector2.new(v134.Position.X, v134.Position.Y);
        if v132.current then
            local v137 = v132.current.CanvasPosition.Y + v135 * -l_GamepadUtils_0.normalizeStickByDeadzone(v136).Y * 1000;
            if v137 <= v132.current.AbsoluteCanvasSize.Y * v50.Scale + v50.Offset then
                v132.current.CanvasPosition = Vector2.new(0, v137);
            end;
        end;
    end, {});
    local v139 = v128.showFullWithNoPeekView or l_IsVRAppBuild_0();
    v11.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v139 (copy), l_RunService_0 (ref), v138 (copy), l_UserInputService_0 (ref)
        local v140 = nil;
        local v141 = nil;
        if v139 then
            local v142 = nil;
            do
                local l_v142_0 = v142;
                v140 = l_RunService_0.Heartbeat:Connect(function(v144) --[[ Line: 121 ]]
                    -- upvalues: l_v142_0 (ref), v138 (ref)
                    if l_v142_0 and l_v142_0.KeyCode == Enum.KeyCode.Thumbstick2 then
                        v138(l_v142_0, v144);
                    end;
                end);
                v141 = l_UserInputService_0.InputChanged:Connect(function(v145, _) --[[ Line: 126 ]]
                    -- upvalues: l_v142_0 (ref)
                    if v145.KeyCode == Enum.KeyCode.Thumbstick2 then
                        if v145.UserInputState == Enum.UserInputState.Change then
                            l_v142_0 = v145;
                            return;
                        elseif v145.UserInputState == Enum.UserInputState.End then
                            l_v142_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 137 ]]
            -- upvalues: v140 (ref), v141 (ref)
            if v140 then
                v140:Disconnect();
            end;
            if v141 then
                v141:Disconnect();
            end;
        end;
    end, {
        v138, 
        v139
    });
    local v147 = v59(v132, v133);
    local v148 = l_useTableWrappedCallbackRef_0(v147);
    local v149 = v59(nil, v133);
    local v150 = v5.Dictionary.join(v128, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129, 
        overlayClosedCallback = v130, 
        peekViewContainerFocusNavigationRef = v149, 
        swipeScrollingFrameRef = v148
    });
    return v6.createElement("Frame", {
        [v6.Ref] = v131, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        OutfitDetailsPeekView = v11.createElement(v70, v150)
    });
end;
if v44 then
    return v32(v151);
else
    return v127;
end;