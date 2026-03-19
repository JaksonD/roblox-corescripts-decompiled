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
local v43 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTableWrappedCallbackRef_0 = v43.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_useAXAnimateScrollFrame_0 = v43.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local v46 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateOutfitDetailsPeekViewToFocusNavigation", false);
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement;
local v48 = require(script.Parent.AssetManagementConstants);
local l_withStyle_0 = v9.Style.withStyle;
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local v53 = l_Images_0["icons/navigation/close"];
local v54 = UDim.new(1, 0);
local v55 = l_GuiService_0:IsTenFootInterface();
local l_Focusable_0 = v10.Focusable;
local v57 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v63(v58, v59) --[[ Line: 100 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v40 (copy), v57 (copy), v11 (copy), l_FocusNavigationEventNameEnum_0 (copy), v41 (copy)
    local v60 = v40.useEventMap(v57, v58);
    local v62 = v11.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v41 (ref), v59 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v41.onRelease(function(v61) --[[ Line: 105 ]]
                    -- upvalues: v59 (ref)
                    v61.cancelled = true;
                    v59();
                end)
            }
        };
    end, {
        v59
    });
    return v40.useEventHandlerMap(v62, v60);
end;
local _ = function(v64, v65) --[[ Line: 115 ]] --[[ Name: useOnScrollEffect ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    v11.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v65 (copy), l_RunService_0 (ref), v64 (copy), l_UserInputService_0 (ref)
        local v66 = nil;
        local v67 = nil;
        if v65 then
            local v68 = nil;
            do
                local l_v68_0 = v68;
                v66 = l_RunService_0.Heartbeat:Connect(function(v70) --[[ Line: 125 ]]
                    -- upvalues: l_v68_0 (ref), v64 (ref)
                    if l_v68_0 and l_v68_0.KeyCode == Enum.KeyCode.Thumbstick2 then
                        v64(l_v68_0, v70);
                    end;
                end);
                v67 = l_UserInputService_0.InputChanged:Connect(function(v71, _) --[[ Line: 130 ]]
                    -- upvalues: l_v68_0 (ref)
                    if v71.KeyCode == Enum.KeyCode.Thumbstick2 then
                        if v71.UserInputState == Enum.UserInputState.Change then
                            l_v68_0 = v71;
                            return;
                        elseif v71.UserInputState == Enum.UserInputState.End then
                            l_v68_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 141 ]]
            -- upvalues: v66 (ref), v67 (ref)
            if v66 then
                v66:Disconnect();
            end;
            if v67 then
                v67:Disconnect();
            end;
        end;
    end, {
        v64, 
        v65
    });
end;
local v74 = v6.PureComponent:extend("OutfitDetailsPeekView");
v74.validateProps = v8.strictInterface({
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
    peekViewContainerFocusNavigationRef = if v46 then v8.callback else nil, 
    swipeScrollingFrameRef = if v46 then v8.table else nil, 
    isPortrait = v8.boolean, 
    topBarHeight = v8.number, 
    itemDetailsExpanded = v8.boolean, 
    statusBarHeight = v8.number, 
    outfitInfo = v8.optional(v8.table), 
    setItemDetailsExpanded = v8.callback, 
    fetchOutfitDetails = v8.callback, 
    avatarEditorAnalytics = v8.table
});
v74.defaultProps = {
    showFullWithNoPeekView = false, 
    renderBottomBar = true
};
v74.init = function(v75) --[[ Line: 201 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v46 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_PeekViewState_0 (copy), v33 (copy), l_IsVRAppBuild_0 (copy)
    v75.actionBarRef = v6.createRef();
    v75.exitButtonRef = v6.createRef();
    if not v46 then
        v75.swipeScrollingFrameRef = v6.createRef();
    end;
    v75.itemsGridRef = v6.createRef();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v75:setState({
        isGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v75.viewStateChanged = function(v77, _) --[[ Line: 217 ]]
        -- upvalues: l_PeekViewState_0 (ref), v75 (copy), v33 (ref)
        if v77 == l_PeekViewState_0.Closed then
            if v75.props.onPeekViewClosed then
                v75.props.onPeekViewClosed();
            end;
            v33.closeFiltersAndItemDetails(v75.props.navigation);
        end;
        if v77 == l_PeekViewState_0.Full or v77 == l_PeekViewState_0.Extended then
            v75.props.setItemDetailsExpanded(true);
            return;
        else
            v75.props.setItemDetailsExpanded(false);
            return;
        end;
    end;
    v75.lastInputTypeChangedCallback = function() --[[ Line: 233 ]]
        -- upvalues: l_UserInputService_0 (ref), l_isGamepadInput_0 (ref), v75 (copy)
        local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
        local v80 = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_1);
        if v80 ~= v75.state.isGamepad then
            v75:setState({
                isGamepad = v80
            });
        end;
    end;
    v75.onExitButtonPressed = function() --[[ Line: 243 ]]
        -- upvalues: v75 (copy), v33 (ref)
        if v75.props.onPeekViewClosed then
            v75.props.onPeekViewClosed();
        end;
        v33.closeFiltersAndItemDetails(v75.props.navigation);
    end;
    local v81;
    l_l_UserInputService_0_LastInputType_0, v81 = v6.createBinding(Vector2.new(0, 0));
    v75.absolutePositionBinding = l_l_UserInputService_0_LastInputType_0;
    v75.updateAbsolutePositionBinding = v81;
    v75.containerPositionChanged = function(v82) --[[ Line: 252 ]]
        -- upvalues: v75 (copy)
        v75.updateAbsolutePositionBinding(v82.AbsolutePosition);
    end;
    v75.getExitButtonUDim2Pos = function() --[[ Line: 256 ]]
        -- upvalues: v75 (copy)
        if v75.props.isPortrait then
            return UDim2.fromScale(15, v75.props.statusBarHeight);
        else
            return UDim2.new(0, 15, 0, -44 - (v75.props.topBarHeight - 44) / 2);
        end;
    end;
    v75.getRef = function() --[[ Line: 270 ]]
        -- upvalues: v75 (copy)
        local l_key_0 = v75.props.navigation.state.key;
        local v84 = v75:getOutfitDetailsPeekViewRefs();
        if v84 and l_key_0 then
            return v84[l_key_0];
        else
            return nil;
        end;
    end;
    v75.shouldRenderFullScreen = function() --[[ Line: 280 ]]
        -- upvalues: v75 (copy), l_IsVRAppBuild_0 (ref)
        return v75.props.showFullWithNoPeekView or l_IsVRAppBuild_0();
    end;
end;
v74.getOutfitDetailsPeekViewRefs = function(v85) --[[ Line: 285 ]] --[[ Name: getOutfitDetailsPeekViewRefs ]]
    -- upvalues: v10 (copy)
    if v85.props.outfitDetailsPeekViewRefs then
        return v85.props.outfitDetailsPeekViewRefs;
    else
        if not v85.outfitDetailsPeekViewRefs then
            v85.outfitDetailsPeekViewRefs = v10.createRefCache();
        end;
        return v85.outfitDetailsPeekViewRefs;
    end;
end;
v74.renderActionBar = function(v86, v87) --[[ Line: 296 ]] --[[ Name: renderActionBar ]]
    -- upvalues: v6 (copy), v27 (copy)
    return v6.createElement(v27, {
        gradientFade = true, 
        multiSelect = false, 
        selectedOutfits = {
            v86.props.outfitId
        }, 
        ZIndex = 2, 
        bottomPadding = v87, 
        deleteOutfit = v86.props.deleteOutfit, 
        renameOutfit = v86.props.renameOutfit, 
        NextSelectionUp = v86.props.isPortrait and v86.exitButtonRef or nil, 
        [v6.Ref] = v86.actionBarRef
    });
end;
v74.renderWithProviders = function(v88, v89) --[[ Line: 313 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v26 (copy), v48 (copy), v55 (copy), v16 (copy), v6 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v46 (copy), v10 (copy), v33 (copy), l_GamepadUtils_0 (copy), v54 (copy), v34 (copy), v35 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_IconButton_0 (copy), v53 (copy), l_IconSize_0 (copy), l_PeekView_0 (copy), v28 (copy)
    local l_Theme_0 = v89.Theme;
    local v91 = UDim2.fromOffset(0, v88.props.topBarHeight);
    local v92 = UDim2.new(1, 0, 1, -v88.props.topBarHeight);
    local v93 = not v88.props.isPortrait and not l_IsVRAppBuild_0();
    if v93 then
        v91 = UDim2.new(v26.LandscapeNavWidth, 0, 0, v88.props.topBarHeight);
        v92 = UDim2.new(v26.LandscapeSceneWidth, 0, 1, -v88.props.topBarHeight);
    end;
    local l_ActionBarHeight_0 = v48.ActionBarHeight;
    if not v93 then
        l_ActionBarHeight_0 = l_ActionBarHeight_0 + 24;
    end;
    local v95 = nil;
    if v88.state.isGamepad and v55 then
        v95 = v16.GAMEPAD_BOTTOM_BAR_SIZE;
        l_ActionBarHeight_0 = l_ActionBarHeight_0 + v16.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local l_exitButtonPosition_0 = v88.props.exitButtonPosition;
    local v97 = nil;
    if l_exitButtonPosition_0 then
        v97 = v88.absolutePositionBinding:map(function(v98) --[[ Line: 338 ]]
            -- upvalues: l_exitButtonPosition_0 (copy)
            return UDim2.fromOffset(l_exitButtonPosition_0.X - v98.X, l_exitButtonPosition_0.Y - v98.Y);
        end);
    end;
    local v99 = nil;
    if not l_exitButtonPosition_0 then
        v99 = v88.getExitButtonUDim2Pos();
    end;
    local v100 = v88.props.itemDetailsExpanded and (v88.props.isPortrait or v88.shouldRenderFullScreen());
    local v101 = v88.getRef();
    return v6.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        ZIndex = v88.props.ZIndex, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v92, 
        Position = v91, 
        SelectionGroup = l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 and true or nil, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v88.props.NextSelectionLeft, 
        [v6.Ref] = v101, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v88.props.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v88.props.renderBottomBar then v88.actionBarRef else nil, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v46 then nil else {
            Close = v10.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 375 ]]
                -- upvalues: v33 (ref), v88 (copy)
                v33.closeFiltersAndItemDetails(v88.props.navigation);
                if v88.props.onPeekViewClosed then
                    v88.props.onPeekViewClosed();
                end;
            end), 
            ScrollPeekView = if v88.swipeScrollingFrameRef and v88.swipeScrollingFrameRef.current ~= nil then v10.Input.onStep(Enum.KeyCode.Thumbstick2, function(v102, v103) --[[ Line: 383 ]]
                -- upvalues: v88 (copy), l_GamepadUtils_0 (ref), v54 (ref)
                local l_Position_0 = v102.Position;
                local l_current_0 = v88.swipeScrollingFrameRef.current;
                local v106 = l_current_0.CanvasPosition.Y + v103 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
                if v106 <= l_current_0.AbsoluteCanvasSize.Y * v54.Scale + v54.Offset then
                    l_current_0.CanvasPosition = Vector2.new(0, v106);
                end;
            end) else nil
        }, 
        [v6.Change.AbsolutePosition] = v88.containerPositionChanged
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createElement(v34, {
            focusController = v88.props.focusController
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.createElement(v35), 
        LastInputTypeChangedConnection = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v88.lastInputTypeChangedCallback
        }), 
        Background = if v88.props.itemDetailsExpanded then v6.createElement("TextButton", {
            BackgroundTransparency = v88.props.isPortrait and l_Theme_0.Overlay.Transparency or 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.new(1, 0, 1, v88.props.topBarHeight), 
            Position = UDim2.fromOffset(0, -v88.props.topBarHeight), 
            ZIndex = 1, 
            Text = "", 
            AutoButtonColor = false
        }) else nil, 
        ExitButton = v100 and v6.createElement(l_IconButton_0, {
            position = if l_exitButtonPosition_0 then v97 else v99, 
            size = UDim2.fromOffset(44, 44), 
            icon = v53, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onActivated = v88.onExitButtonPressed, 
            buttonRef = v88.exitButtonRef, 
            NextSelectionDown = if v88.props.renderBottomBar then v88.actionBarRef else v88.itemsGridRef
        }), 
        PeekViewContainer = if not v88.shouldRenderFullScreen() then v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ClipsDescendants = true, 
            ZIndex = 3, 
            [v6.Ref] = if v46 then v88.props.peekViewContainerFocusNavigationRef else nil
        }, {
            PeekView = v6.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, l_ActionBarHeight_0), 
                mountAnimation = true, 
                mountAsFullView = true, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v88.viewStateChanged, 
                bottomDockedContainerHeight = l_ActionBarHeight_0, 
                bottomDockedContainerContent = if v88.props.renderBottomBar then v88:renderActionBar(v95) else nil, 
                backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                peekHeaderClose = true, 
                isScrollingEnabled = true, 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                scrollingFrameRef = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v88.props.swipeScrollingFrameRef else nil
            }, {
                OutfitDetailsContainer = v6.createElement(v28, {
                    outfitId = v88.props.outfitId, 
                    itemsGridRef = v88.itemsGridRef, 
                    NextSelectionUp = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then nil else v88.exitButtonRef, 
                    bottomPadding = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v48.ActionBarHeight + (v95 or 0) else nil
                })
            })
        }) else nil, 
        ScrollingContent = if v88.shouldRenderFullScreen() then v6.createElement("ScrollingFrame", {
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
            [v6.Ref] = if v46 then v88.props.swipeScrollingFrameRef else v88.swipeScrollingFrameRef
        }, {
            OutfitDetailsContainer = v6.createElement(v28, {
                outfitId = v88.props.outfitId, 
                itemsGridRef = v88.itemsGridRef, 
                NextSelectionUp = v88.exitButtonRef
            })
        }) else nil
    });
end;
v74.render = function(v107) --[[ Line: 515 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v108) --[[ Line: 516 ]]
        -- upvalues: v107 (copy)
        return v107:renderWithProviders(v108);
    end);
end;
local function _(v109) --[[ Line: 521 ]] --[[ Name: isOutfitInfoEmpty ]]
    return not v109 or not v109.assets or #v109.assets == 0;
end;
v74.didMount = function(v111) --[[ Line: 525 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local v112 = v111.getRef();
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v111.state.isGamepad and v111.props.isPortrait then
        v111.props.focusController.moveFocusTo(v112);
    end;
    if v112:getValue() then
        v111.containerPositionChanged(v112:getValue());
    end;
    v111.props.setItemDetailsExpanded(true);
    local l_outfitInfo_0 = v111.props.outfitInfo;
    if not l_outfitInfo_0 or not l_outfitInfo_0.assets or #l_outfitInfo_0.assets == 0 then
        v111.props.fetchOutfitDetails(v111.props.outfitId);
    end;
end;
v74.didUpdate = function(v114, v115, v116) --[[ Line: 544 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v117 = v114.getRef();
        if v114.state.isGamepad and not v116.isGamepad and v114.props.isPortrait then
            v114.props.focusController.moveFocusTo(v117);
        end;
        if v114.props.isPortrait and v115.isPortrait and v114.state.isGamepad then
            v114.props.focusController.moveFocusTo(v117);
        end;
    end;
    if v114.props.outfitId ~= v115.outfitId then
        local l_outfitInfo_1 = v114.props.outfitInfo;
        if not l_outfitInfo_1 or not l_outfitInfo_1.assets or #l_outfitInfo_1.assets == 0 then
            v114.props.fetchOutfitDetails(v114.props.outfitId);
        end;
    end;
end;
v74.willUnmount = function(v119) --[[ Line: 565 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    if v119.props.avatarRoute.current.name ~= l_AvatarScreen_0.OutfitDetails or v119.props.avatarRoute.current.key == v119.props.navigation.state.key then
        v119.props.setItemDetailsExpanded(false);
    end;
end;
v74 = v7.connect(function(v120, v121) --[[ Line: 574 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v37 (copy)
    local v122 = v120.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    return {
        outfitInfo = v120.AvatarExperience.AvatarEditor.OutfitInfos[v121.outfitId], 
        isPortrait = v122, 
        topBarHeight = v37.getTopBarHeightAvatarScene(v120), 
        itemDetailsExpanded = v120.AvatarExperience.Common.ItemDetailsExpanded, 
        statusBarHeight = v120.TopBar.statusBarHeight
    };
end, function(v123) --[[ Line: 589 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v36 (copy), v15 (copy)
    return {
        setItemDetailsExpanded = function(v124) --[[ Line: 591 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v123 (copy), v36 (ref)
            v123(v36(v124));
        end, 
        fetchOutfitDetails = function(v125) --[[ Line: 594 ]] --[[ Name: fetchOutfitDetails ]]
            -- upvalues: v123 (copy), v15 (ref)
            v123(v15(v125));
        end
    };
end)(v74);
if not v46 then
    v74 = v32(v74);
end;
v74 = l_RoactServices_0.connect({
    avatarEditorAnalytics = v29
})(v74);
local function v131(v126) --[[ Line: 610 ]] --[[ Name: OutfitDetailsPageContainer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), v10 (copy), v31 (copy), v30 (copy), v5 (copy), v6 (copy), v74 (ref)
    local v127 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.useRef(v10.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v126.focusController then
        v127 = v126.focusController;
    end;
    local v128 = v31(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v127);
    local v129 = v30({
        overlayClosedCallback = v128
    });
    local v130 = v5.Dictionary.join(v126, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v127, 
        overlayClosedCallback = v128
    });
    return v6.createElement("Frame", {
        [v6.Ref] = v129, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        OutfitDetailsPeekView = v11.createElement(v74, v130)
    });
end;
local function v155(v132) --[[ Line: 637 ]] --[[ Name: OutfitDetailsPageContainerNew ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v11 (copy), v10 (copy), v31 (copy), v30 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v33 (copy), l_GamepadUtils_0 (copy), v54 (copy), l_IsVRAppBuild_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v63 (copy), l_useTableWrappedCallbackRef_0 (copy), v5 (copy), v6 (copy), v74 (ref)
    local v133 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.useRef(v10.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v132.focusController then
        v133 = v132.focusController;
    end;
    local v134 = v31(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v133);
    local v135 = v30({
        overlayClosedCallback = v134
    });
    local v136 = v11.useRef(nil);
    if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then
        l_useAXAnimateScrollFrame_0(v136);
    end;
    local v137 = v11.useCallback(function() --[[ Line: 655 ]]
        -- upvalues: v33 (ref), v132 (copy)
        v33.closeFiltersAndItemDetails(v132.navigation);
        if v132.onPeekViewClosed then
            v132.onPeekViewClosed();
        end;
    end, {
        v132.navigation, 
        v132.onPeekViewClosed
    });
    local v142 = v11.useCallback(function(v138, v139) --[[ Line: 662 ]]
        -- upvalues: v136 (copy), l_GamepadUtils_0 (ref), v54 (ref)
        local v140 = Vector2.new(v138.Position.X, v138.Position.Y);
        if v136.current then
            local v141 = v136.current.CanvasPosition.Y + v139 * -l_GamepadUtils_0.normalizeStickByDeadzone(v140).Y * 1000;
            if v141 <= v136.current.AbsoluteCanvasSize.Y * v54.Scale + v54.Offset then
                v136.current.CanvasPosition = Vector2.new(0, v141);
            end;
        end;
    end, {});
    local v143 = v132.showFullWithNoPeekView or l_IsVRAppBuild_0();
    v11.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v143 (copy), l_RunService_0 (ref), v142 (copy), l_UserInputService_0 (ref)
        local v144 = nil;
        local v145 = nil;
        if v143 then
            local v146 = nil;
            do
                local l_v146_0 = v146;
                v144 = l_RunService_0.Heartbeat:Connect(function(v148) --[[ Line: 125 ]]
                    -- upvalues: l_v146_0 (ref), v142 (ref)
                    if l_v146_0 and l_v146_0.KeyCode == Enum.KeyCode.Thumbstick2 then
                        v142(l_v146_0, v148);
                    end;
                end);
                v145 = l_UserInputService_0.InputChanged:Connect(function(v149, _) --[[ Line: 130 ]]
                    -- upvalues: l_v146_0 (ref)
                    if v149.KeyCode == Enum.KeyCode.Thumbstick2 then
                        if v149.UserInputState == Enum.UserInputState.Change then
                            l_v146_0 = v149;
                            return;
                        elseif v149.UserInputState == Enum.UserInputState.End then
                            l_v146_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 141 ]]
            -- upvalues: v144 (ref), v145 (ref)
            if v144 then
                v144:Disconnect();
            end;
            if v145 then
                v145:Disconnect();
            end;
        end;
    end, {
        v142, 
        v143
    });
    local v151 = v63(v136, v137);
    local v152 = l_useTableWrappedCallbackRef_0(v151);
    local v153 = v63(nil, v137);
    local v154 = v5.Dictionary.join(v132, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v133, 
        overlayClosedCallback = v134, 
        peekViewContainerFocusNavigationRef = v153, 
        swipeScrollingFrameRef = v152
    });
    return v6.createElement("Frame", {
        [v6.Ref] = v135, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        OutfitDetailsPeekView = v11.createElement(v74, v154)
    });
end;
if v46 then
    return v32(v155);
else
    return v131;
end;