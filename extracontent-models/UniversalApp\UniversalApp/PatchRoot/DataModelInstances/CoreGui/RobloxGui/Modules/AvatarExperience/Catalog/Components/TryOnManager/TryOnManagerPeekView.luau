local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local l_useAXAnimateScrollFrame_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local v14 = require(l_CorePackages_0.Packages.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v23 = require(l_Modules_0.AvatarExperience.Common.Util.getShouldShowPeekViewShadow);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v28 = require(l_Modules_0.LuaApp.Constants);
local v29 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v31 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Components.TryOnManager.TryOnManagerElement);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.TryOnManager.TryOnManagerBottomBar);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v37 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v38 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v41 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v43 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v44 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v45 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v43.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_withStyle_0 = v13.Style.withStyle;
local l_Images_0 = v13.App.ImageSet.Images;
local l_ImageSetButton_0 = v13.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = v13.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v13.App.SelectionImage.CursorKind;
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixClosingTryOnManagerPeekViewForLooks);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateLookDetailsPeekViewToFocusNavigation;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_ActionBarHeight_0 = v27.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v27.ActionBar.ActionBarGradientHeight;
local v60 = l_Images_0["icons/navigation/close"];
local v61 = l_GuiService_0:IsTenFootInterface();
local function v63(v62) --[[ Line: 103 ]]
    return v62.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v65(v64) --[[ Line: 106 ]]
    return v64.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v69(v66) --[[ Line: 109 ]]
    local l_LookId_0 = v66.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    local l_Looks_0 = v66.AvatarExperience.AvatarScene.Looks;
    if l_Looks_0 and l_LookId_0 and l_Looks_0[l_LookId_0] then
        return l_Looks_0[l_LookId_0];
    else
        return nil;
    end;
end;
local v70 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOnManager
};
local function v77(v71, v72, v73) --[[ Line: 125 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v44 (copy), v70 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v45 (copy)
    local v74 = v44.useEventMap(v70, v71);
    local v76 = v4.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v45 (ref), v72 (copy), v73 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v45.onRelease(function(v75) --[[ Line: 130 ]]
                    -- upvalues: v72 (ref)
                    v75.cancelled = true;
                    v72();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = {
                handler = v45.onRelease(v73)
            }
        };
    end, {
        v72, 
        v73
    });
    return v44.useEventHandlerMap(v76, v74);
end;
local v78 = v5.PureComponent:extend("TryOnManagerPeekView");
v78.validateProps = v12.strictInterface({
    resolvedFocusNavigationRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v12.table else nil, 
    resolvedActionBarRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v12.table else nil, 
    scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v12.table else nil, 
    navigation = v12.table, 
    avatarRoute = v12.table, 
    isPortrait = v12.boolean, 
    topBarHeight = v12.number, 
    tryOnItems = v12.optional(v12.table), 
    lookId = v12.optional(v12.string), 
    lookDetails = v12.optional(v12.table), 
    globalGuiInset = v12.table, 
    screenSize = v12.Vector2, 
    fullView = v12.optional(v12.userdata), 
    boundInputs = v12.optional(v12.table), 
    peekViewState = v12.optional(v12.valueOf(l_PeekViewState_0)), 
    removeUnselectedItemsFromTryOn = v12.callback, 
    removeLookItemsFromTryOn = v12.callback, 
    setTryOnManagerPeekViewState = v12.callback, 
    catalogAnalytics = v12.table, 
    namedRefs = v12.table, 
    lastInputGroup = v12.string
});
local function _(v79) --[[ Line: 181 ]] --[[ Name: isMouseAndKeyboard ]]
    -- upvalues: v28 (copy)
    return v28.InputTypeMap[v79] == v28.InputType.MouseAndKeyboard;
end;
v78.init = function(v81) --[[ Line: 185 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), v28 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v5 (copy), v9 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_PeekViewState_0 (copy), v53 (copy), v36 (copy)
    local v82 = {};
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v82.isMouseAndKeyboard = v28.InputTypeMap[l_l_UserInputService_0_LastInputType_0] == v28.InputType.MouseAndKeyboard;
    v81:setState(v82);
    v81.frameRef = v81.props.namedRefs[l_AvatarScreen_0.TryOnManager];
    v81.actionBarRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then nil else v5.createRef();
    v81.itemsListRef = v5.createRef();
    v81.closeButtonRef = v5.createRef();
    v81.tryOnElementRefCache = v9.createRefCache();
    v81.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v9.createFocusController();
    v81.contentFrameRef = v5.createRef();
    v81.onPeekViewClosed = function() --[[ Line: 203 ]]
        -- upvalues: v81 (copy)
        if v81.props.lookId ~= nil then
            v81.props.removeLookItemsFromTryOn(v81.props.lookId, v81.props.lookDetails);
            return;
        else
            v81.props.removeUnselectedItemsFromTryOn();
            return;
        end;
    end;
    v81.viewStateChanged = function(v84, v85) --[[ Line: 211 ]]
        -- upvalues: v81 (copy), l_PeekViewState_0 (ref), v53 (ref), v36 (ref)
        v81.props.setTryOnManagerPeekViewState(v84);
        local l_catalogAnalytics_0 = v81.props.catalogAnalytics;
        if v84 == l_PeekViewState_0.Closed then
            v81.onPeekViewClosed();
            if not v53() then
                v36.closeFocusedScreen(v81.props.navigation);
            end;
        end;
        if v84 == l_PeekViewState_0.Brief then
            if v85 == l_PeekViewState_0.Full or v85 == l_PeekViewState_0.Extended then
                l_catalogAnalytics_0.resizeOutfitScreen("minimize");
                return;
            end;
        elseif v84 == l_PeekViewState_0.Full and v85 == l_PeekViewState_0.Brief then
            l_catalogAnalytics_0.resizeOutfitScreen("expand");
        end;
    end;
    v81.onCloseButtonPressed = function() --[[ Line: 233 ]]
        -- upvalues: v81 (copy), l_PeekViewState_0 (ref)
        v81.props.setTryOnManagerPeekViewState(l_PeekViewState_0.SuperBrief);
    end;
end;
v78.getActionBarTotalHeight = function(v87, v88) --[[ Line: 238 ]] --[[ Name: getActionBarTotalHeight ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v61 (copy), v28 (copy), v14 (copy), l_PeekViewState_0 (copy)
    local l_l_ActionBarHeight_0_0 = l_ActionBarHeight_0;
    local v90 = 0;
    local v91 = 0;
    if v61 and v87.props.lastInputGroup == v28.InputType.Gamepad and not v14.isEmpty(v87.props.boundInputs) then
        v90 = v28.GAMEPAD_BOTTOM_BAR_SIZE;
    elseif v87.props.lookId ~= nil then
        v91 = 20;
    end;
    local v92 = if v87.props.peekViewState == l_PeekViewState_0.SuperBrief then v88.Tokens.Global.Space_200 else -v88.Tokens.Global.Space_100;
    return l_l_ActionBarHeight_0_0 + v90 + v91 - v92;
end;
v78.getBriefViewHeight = function(v93) --[[ Line: 262 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v26 (copy)
    local l_Offset_0 = l_getSafeAreaSize_0(v93.props.screenSize, v93.props.globalGuiInset).Y.Offset;
    if v93.props.isPortrait then
        local v95 = l_Offset_0 * v26.PortraitSceneHeight;
        return l_Offset_0 - v93.props.topBarHeight - v95 - 25;
    else
        return (l_Offset_0 - v93.props.topBarHeight - 25) * 0.5;
    end;
end;
v78.renderActionBar = function(v96, v97) --[[ Line: 276 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_PeekViewState_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v35 (copy), l_ActionBarGradientHeight_0 (copy)
    local l_Theme_0 = v97.Theme;
    local v99 = v96:getActionBarTotalHeight(v97);
    local v100 = v96.props.peekViewState == l_PeekViewState_0.SuperBrief;
    local v101 = if v100 then UDim.new(0, -v97.Tokens.Global.Space_175) else UDim.new(0, v97.Tokens.Global.Space_125);
    return v5.createFragment({
        BottomContainer = v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, v99), 
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            ZIndex = 2, 
            ref = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v96.props.resolvedActionBarRef else v96.actionBarRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v96.itemsListRef
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = v101
            }), 
            TryOnManagerBottomBar = v5.createElement(v35, {
                lookId = v96.props.lookId, 
                showMoreButton = v100
            })
        }), 
        TopFrame = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 3), 
            Position = UDim2.new(0, 0, 1, -v99), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }), 
        Gradient = if v100 then nil else v5.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
            Position = UDim2.new(0, 0, 1, -v99 - 3), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        })
    });
end;
v78.renderTopContent = function(v102, v103, v104, v105) --[[ Line: 335 ]] --[[ Name: renderTopContent ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ImageSetButton_0 (copy), l_Focusable_0 (copy), v60 (copy), l_CursorKind_0 (copy)
    local l_Theme_1 = v103.Theme;
    local l_Font_0 = v103.Font;
    return v5.createFragment({
        UIPadding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 25)
        }), 
        CloseButton = v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 15, 0.5, 0), 
            Size = UDim2.fromOffset(40, 40), 
            Image = v60, 
            ImageColor3 = l_Theme_1.SystemPrimaryDefault.Color, 
            ImageTransparency = l_Theme_1.SystemPrimaryDefault.Transparency, 
            [v5.Event.Activated] = v102.onCloseButtonPressed, 
            ref = v102.closeButtonRef, 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v102.itemsListRef, 
            SelectionImageObject = v105(l_CursorKind_0.RoundedRectNoInset)
        }), 
        Title = v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 36), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = v104.yourTryOns, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
            Font = l_Font_0.Header1.Font, 
            TextColor3 = l_Theme_1.IconEmphasis.Color, 
            TextTransparency = l_Theme_1.IconEmphasis.Transparency, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
v78.orderTryOns = function(v108, v109) --[[ Line: 379 ]] --[[ Name: orderTryOns ]]
    -- upvalues: v26 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v110 = {};
    for _, v112 in v109 do
        table.insert(v110, v112);
    end;
    if v108.props.lookId and v108.props.lookDetails then
        local v113 = v108.props.lookDetails[v108.props.lookId];
        if v113 and (v113.lookType == v26.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and v113.lookType == v26.LookType.Makeup) then
            table.sort(v110, function(v114, v115) --[[ Line: 395 ]]
                return v114.itemRecency < v115.itemRecency;
            end);
            return v110;
        end;
    else
        table.sort(v110, function(v116, v117) --[[ Line: 401 ]]
            return v116.itemRecency > v117.itemRecency;
        end);
    end;
    return v110;
end;
v78.renderTryOnItemContents = function(v118, _, _, v121) --[[ Line: 409 ]] --[[ Name: renderTryOnItemContents ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v34 (copy)
    local v122 = {
        ListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 20)
        })
    };
    local v123 = 1;
    local v124 = v118:orderTryOns(v118.props.tryOnItems);
    for v125, v126 in v124 do
        local v127 = nil;
        local v128 = nil;
        if v123 > 1 then
            v127 = v118.tryOnElementRefCache[v124[v125 - 1].itemId];
        elseif v121 then
            v127 = v118.closeButtonRef;
        end;
        v128 = if v123 < #v124 then v118.tryOnElementRefCache[v124[v125 + 1].itemId] else if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v118.props.resolvedActionBarRef else v118.actionBarRef;
        v122[v126.itemId] = v5.createElement(v34, {
            tryOnItem = v126, 
            layoutOrder = v123, 
            allowAutomaticPeekViewStateChanges = v118.props.lookId == nil, 
            elementRef = v118.tryOnElementRefCache[v126.itemId], 
            NextSelectionUp = v127, 
            NextSelectionDown = v128
        });
        v123 = v123 + 1;
    end;
    return v122;
end;
v78.renderWithProviders = function(v129, v130, v131, v132) --[[ Line: 456 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v26 (copy), l_PeekViewState_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v37 (copy), v29 (copy), v33 (copy), l_ImageSetButton_0 (copy), v60 (copy), l_PeekView_0 (copy), v23 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v28 (copy), v9 (copy), v36 (copy)
    local l_Theme_2 = v130.Theme;
    local v134 = UDim2.fromOffset(0, v129.props.topBarHeight);
    local v135 = UDim2.new(1, 0, 1, -v129.props.topBarHeight);
    if not v129.props.isPortrait then
        v134 = UDim2.new(v26.LandscapeNavWidth, 0, 0, v129.props.topBarHeight);
        v135 = UDim2.new(v26.LandscapeSceneWidth, 0, 1, -v129.props.topBarHeight);
    end;
    local v136 = v129:getBriefViewHeight();
    local v137 = if v129.props.lookId ~= nil then v129:getActionBarTotalHeight(v130) else nil;
    local v138 = v129:getActionBarTotalHeight(v130);
    local v139 = v129.props.screenSize.Y - v129.props.topBarHeight - v129.props.globalGuiInset.bottom;
    local v140 = true;
    if v129.props.peekViewState ~= l_PeekViewState_0.Full then
        v140 = v129.props.peekViewState == l_PeekViewState_0.Extended;
    end;
    local v141 = v129.state.isMouseAndKeyboard and v129.props.peekViewState == l_PeekViewState_0.Brief;
    local v142 = true;
    local v143 = v129.props.peekViewState == l_PeekViewState_0.SuperBrief;
    if v142 then
        v142 = not v143;
    end;
    if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v135, 
            Position = v134, 
            Visible = v129.props.fullView ~= v37.SceneFullView, 
            ref = v129.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.props.resolvedActionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.props.namedRefs[v129.props.avatarRoute.opaque.name .. v29.ItemsList]
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v33, {
                focusController = v129.focusController, 
                captureFocusOnMount = true
            }), 
            TryOnManagerTopBar = v140 and v5.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v129.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v129.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v129:renderTopContent(v130, v131, v132)
            }), 
            CloseButton = v141 and v5.createElement(l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 15, 1, -v129:getBriefViewHeight() - 36), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v60, 
                ImageColor3 = l_Theme_2.SystemPrimaryDefault.Color, 
                [v5.Event.Activated] = v129.onCloseButtonPressed
            }), 
            PeekViewContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3, 
                ClipsDescendants = true
            }, {
                PeekView = v5.createElement(l_PeekView_0, {
                    briefViewContentHeight = UDim.new(0, v136), 
                    mountAnimation = true, 
                    mountAsFullView = false, 
                    canDragFullViewToBrief = true, 
                    showDraggerInClosedState = false, 
                    returnToFullView = true, 
                    thumbstickScrollEnabled = true, 
                    viewStateChanged = v129.viewStateChanged, 
                    showDropShadow = v23(v129.props.peekViewState), 
                    superBriefViewContentHeight = if v129.props.lookId ~= nil then UDim.new(0, v137) else nil, 
                    stateOnMount = if v129.props.lookId then v129.props.peekViewState else nil, 
                    bottomDockedContainerHeight = v138, 
                    bottomDockedContainerContent = v129:renderActionBar(v130), 
                    backgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                    backgroundTransparency = l_Theme_2.BackgroundUIDefault.Transparency, 
                    peekHeaderClose = false, 
                    isScrollingEnabled = v142, 
                    peekViewState = v129.props.peekViewState, 
                    hideDraggerInSuperBrief = true, 
                    minimizeToSuperBrief = true, 
                    shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                    scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v129.props.scrollingFrameRef else nil
                }, v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ClipsDescendants = true, 
                    [v5.Ref] = v129.props.resolvedFocusNavigationRef
                }, {
                    Padding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8)
                    }), 
                    TryOnManagerContainer = v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v139), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        ref = v129.itemsListRef, 
                        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                    }, v129:renderTryOnItemContents(v130, v131, v140))
                }))
            }), 
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v144) --[[ Line: 596 ]] --[[ Name: callback ]]
                    -- upvalues: v28 (ref), v129 (copy)
                    if v144 then
                        local v145 = v28.InputTypeMap[v144] == v28.InputType.MouseAndKeyboard;
                        if v145 ~= v129.state.isMouseAndKeyboard then
                            v129:setState({
                                isMouseAndKeyboard = v145
                            });
                        end;
                    end;
                end
            })
        });
    else
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v135, 
            Position = v134, 
            Visible = v129.props.fullView ~= v37.SceneFullView, 
            ref = v129.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.actionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129.props.namedRefs[v129.props.avatarRoute.opaque.name .. v29.ItemsList], 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                NavigateBack = v9.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 628 ]]
                    -- upvalues: v129 (copy), v36 (ref)
                    v129.onPeekViewClosed();
                    v36.closeFocusedScreen(v129.props.navigation);
                end), 
                OpenCloseTryOnManager = v9.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 633 ]]
                    -- upvalues: v129 (copy), l_PeekViewState_0 (ref)
                    local l_peekViewState_0 = v129.props.peekViewState;
                    if l_peekViewState_0 == l_PeekViewState_0.Full or l_peekViewState_0 == l_PeekViewState_0.Extended then
                        v129.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v129.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v33, {
                focusController = v129.focusController, 
                captureFocusOnMount = true
            }), 
            TryOnManagerTopBar = v140 and v5.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v129.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v129.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v129:renderTopContent(v130, v131, v132)
            }), 
            CloseButton = v141 and v5.createElement(l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 15, 1, -v129:getBriefViewHeight() - 36), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v60, 
                ImageColor3 = l_Theme_2.SystemPrimaryDefault.Color, 
                [v5.Event.Activated] = v129.onCloseButtonPressed
            }), 
            PeekViewContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3, 
                ClipsDescendants = true
            }, {
                PeekView = v5.createElement(l_PeekView_0, {
                    briefViewContentHeight = UDim.new(0, v136), 
                    mountAnimation = true, 
                    mountAsFullView = false, 
                    canDragFullViewToBrief = true, 
                    showDraggerInClosedState = false, 
                    returnToFullView = true, 
                    thumbstickScrollEnabled = true, 
                    viewStateChanged = v129.viewStateChanged, 
                    showDropShadow = v23(v129.props.peekViewState), 
                    superBriefViewContentHeight = if v129.props.lookId ~= nil then UDim.new(0, v137) else nil, 
                    stateOnMount = if v129.props.lookId then v129.props.peekViewState else nil, 
                    shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                    bottomDockedContainerHeight = v138, 
                    bottomDockedContainerContent = v129:renderActionBar(v130), 
                    backgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                    backgroundTransparency = l_Theme_2.BackgroundUIDefault.Transparency, 
                    peekHeaderClose = false, 
                    isScrollingEnabled = v142, 
                    peekViewState = v129.props.peekViewState, 
                    hideDraggerInSuperBrief = true, 
                    minimizeToSuperBrief = true, 
                    scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v129.props.scrollingFrameRef else nil
                }, {
                    Padding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8)
                    }), 
                    TryOnManagerContainer = v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v139), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        ref = v129.itemsListRef, 
                        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                    }, v129:renderTryOnItemContents(v130, v131, v140))
                })
            }), 
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v147) --[[ Line: 729 ]] --[[ Name: callback ]]
                    -- upvalues: v28 (ref), v129 (copy)
                    if v147 then
                        local v148 = v28.InputTypeMap[v147] == v28.InputType.MouseAndKeyboard;
                        if v148 ~= v129.state.isMouseAndKeyboard then
                            v129:setState({
                                isMouseAndKeyboard = v148
                            });
                        end;
                    end;
                end
            })
        });
    end;
end;
v78.render = function(v149) --[[ Line: 744 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v150) --[[ Line: 745 ]]
        -- upvalues: l_withLocalization_0 (ref), l_withSelectionCursorProvider_0 (ref), v149 (copy)
        return l_withLocalization_0({
            yourTryOns = "Feature.Avatar.Title.YourTryOns"
        })(function(v151) --[[ Line: 748 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v149 (ref), v150 (copy)
            return l_withSelectionCursorProvider_0(function(v152) --[[ Line: 749 ]]
                -- upvalues: v149 (ref), v150 (ref), v151 (copy)
                return v149:renderWithProviders(v150, v151, v152);
            end);
        end);
    end);
end;
v78.didUpdate = function(v153, v154, v155) --[[ Line: 756 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_wasLastInputGamepad_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy)
    if v154.lookId and not v153.props.lookId then
        v153.onPeekViewClosed();
        v153.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        if not l_wasLastInputGamepad_0() then
            return;
        elseif v153.props.peekViewState ~= v155.peekViewState and v153.props.peekViewState ~= l_PeekViewState_0.Closed then
            v153.focusController.captureFocus();
            if v153.props.peekViewState == l_PeekViewState_0.Brief then
                v153.focusController.moveFocusTo(if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v153.props.resolvedActionBarRef else v153.actionBarRef);
            end;
        end;
    end;
end;
local function v160(v156, v157) --[[ Line: 788 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v41 (copy)
    local v158 = v156.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_name_0 = v157.avatarRoute.opaque.name;
    return {
        isPortrait = v158, 
        topBarHeight = v156.TopBar.topBarHeight, 
        tryOnItems = v156.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v156.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        lookDetails = v156.AvatarExperience.AvatarScene.Looks, 
        globalGuiInset = v156.GlobalGuiInset, 
        screenSize = v156.ScreenSize, 
        fullView = v41(v156, l_name_0), 
        boundInputs = v156.GamepadBottomBar.boundInputs, 
        peekViewState = v156.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
    };
end;
local function v169(v161) --[[ Line: 807 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v30 (copy), v31 (copy), v32 (copy)
    return {
        removeUnselectedItemsFromTryOn = function() --[[ Line: 809 ]] --[[ Name: removeUnselectedItemsFromTryOn ]]
            -- upvalues: v161 (copy), v30 (ref)
            return v161(v30());
        end, 
        removeLookItemsFromTryOn = function(v162, v163) --[[ Line: 813 ]] --[[ Name: removeLookItemsFromTryOn ]]
            -- upvalues: v161 (copy), v31 (ref)
            if v162 and v163 and v163[v162] then
                local v164 = {};
                for v165 in v163[v162].lookAssetInfos do
                    table.insert(v164, v165);
                end;
                local v166 = {};
                for v167 in v163[v162].lookBundleInfos do
                    table.insert(v166, v167);
                end;
                return v161(v31(v162, v164, v166));
            else
                return;
            end;
        end, 
        setTryOnManagerPeekViewState = function(v168) --[[ Line: 829 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v161 (copy), v32 (ref)
            v161(v32(v168));
        end
    };
end;
v78 = v39((v38((l_RoactServices_0.connect({
    catalogAnalytics = v25
})(v78)))));
v78 = v8.connect(v160, v169)(v78);
if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
    return v38(function(v170) --[[ Line: 845 ]] --[[ Name: TryOnManagerPeekViewContainer ]]
        -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v65 (copy), v69 (copy), v63 (copy), v4 (copy), v31 (copy), v30 (copy), l_PeekViewState_0 (copy), v32 (copy), v77 (copy), l_AvatarScreen_0 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v78 (ref), v14 (copy)
        local v171 = l_useDispatch_0();
        local v172 = l_useSelector_0(v65);
        local v173 = l_useSelector_0(v69);
        local v174 = l_useSelector_0(v63);
        local v179 = v4.useCallback(function() --[[ Line: 852 ]]
            -- upvalues: v172 (copy), v173 (copy), v171 (copy), v31 (ref), v30 (ref)
            if v172 ~= nil and v173 then
                local v175 = {};
                for v176 in v173.lookAssetInfos do
                    table.insert(v175, v176);
                end;
                local v177 = {};
                if v173.lookBundleInfos then
                    for v178 in v173.lookBundleInfos do
                        table.insert(v177, v178);
                    end;
                end;
                v171(v31(v172, v175, v177));
                return;
            else
                v171(v30());
                return;
            end;
        end, {
            v170.navigation, 
            v171, 
            v172, 
            v173
        });
        local v180 = v4.useCallback(function() --[[ Line: 871 ]]
            -- upvalues: v174 (copy), l_PeekViewState_0 (ref), v171 (copy), v32 (ref)
            if v174 == l_PeekViewState_0.Full or v174 == l_PeekViewState_0.Extended then
                v171(v32(l_PeekViewState_0.Brief));
                return;
            else
                v171(v32(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v174, 
            v171
        });
        local v181 = v77(v170.namedRefs[l_AvatarScreen_0.LookDetails], v179, v180);
        local v182 = l_useTableWrappedCallbackRef_0(v181);
        local v183 = v77(nil, v179, v180);
        local v184 = l_useTableWrappedCallbackRef_0(v183);
        local v185 = nil;
        if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
            v185 = v4.useRef(nil);
            l_useAXAnimateScrollFrame_0(v185);
        end;
        return v4.createElement(v78, v14.Dictionary.join({
            resolvedFocusNavigationRef = v182, 
            resolvedActionBarRef = v184, 
            scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v185 else nil
        }, v170));
    end);
else
    return v78;
end;