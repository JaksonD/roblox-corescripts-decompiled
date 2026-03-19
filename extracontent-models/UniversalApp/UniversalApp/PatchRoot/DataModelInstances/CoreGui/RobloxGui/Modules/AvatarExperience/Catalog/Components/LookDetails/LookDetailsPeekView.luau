local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v16 = require(l_CorePackages_0.Packages.SignalsReact);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useAXAnimateScrollFrame_0 = v20.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v25 = require(l_Modules_0.AvatarExperience.Common.Util.getShouldShowPeekViewShadow);
local v26 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v27 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v27.useFocusGuiObject;
local v29 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v26.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v33 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v36 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v38 = require(l_Modules_0.LuaApp.Constants);
local v39 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v40 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v41 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnElement);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBar);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.DraftLookBottomBar);
local v47 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v48 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v51 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v52 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v53 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.TabBar.TabBarUnderlined);
local v54 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v55 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookDetailsPeekViewSelectedTab);
local l_Images_0 = v11.App.ImageSet.Images;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local v59 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookDetailsContainerInnards);
local v60 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local l_useAnimatedVisibility_0 = v20.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local l_withStyle_0 = v11.Style.withStyle;
local l_ImageSetButton_0 = v11.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = v11.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v11.App.SelectionImage.CursorKind;
local v66 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v68 = game:DefineFastFlag("AXDisableNonFullviewAnimation", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateLookDetailsPeekViewToFocusNavigation;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXHideMenuOnScroll_0 = v33.FFlagAXHideMenuOnScroll;
local l_ActionBarHeight_0 = v37.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v37.ActionBar.ActionBarGradientHeight;
local v77 = l_Images_0["icons/navigation/close"];
local v78 = l_Images_0["icons/actions/truncationExpand"];
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v80 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnTopContent);
local v81 = v4.PureComponent:extend("LookDetailsPeekView");
local function v83(v82) --[[ Line: 129 ]]
    return v82.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v85(v84) --[[ Line: 132 ]]
    return v84.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v89(v86) --[[ Line: 135 ]]
    local l_LookId_0 = v86.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    local l_Looks_0 = v86.AvatarExperience.AvatarScene.Looks;
    if l_Looks_0 and l_LookId_0 and l_Looks_0[l_LookId_0] then
        return l_Looks_0[l_LookId_0];
    else
        return nil;
    end;
end;
local v90 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOnManager
};
local function v97(v91, v92, v93) --[[ Line: 151 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v27 (copy), v90 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v29 (copy)
    local v94 = v27.useEventMap(v90, v91);
    local v96 = v3.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v29 (ref), v92 (copy), v93 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v29.onRelease(function(v95) --[[ Line: 156 ]]
                    -- upvalues: v92 (ref)
                    v95.cancelled = true;
                    v92();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = {
                handler = v29.onRelease(v93)
            }
        };
    end, {
        v92, 
        v93
    });
    return v27.useEventHandlerMap(v96, v94);
end;
v81.validateProps = v10.interface({
    focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v10.optional(v10.callback) else nil, 
    isTryOn = v10.optional(v10.boolean), 
    is10ftUI = v10.boolean, 
    initialPeekViewState = v10.optional(v10.valueOf(l_PeekViewState_0)), 
    showPeekViewInSuperBrief = v10.optional(v10.boolean), 
    resolvedFocusNavigationRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v10.table else nil, 
    resolvedActionBarRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v10.table else nil, 
    scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v10.table else nil, 
    navigation = v10.table, 
    avatarRoute = v10.table, 
    isPortrait = v10.boolean, 
    topBarHeight = v10.number, 
    tryOnItems = v10.optional(v10.table), 
    lookId = v10.optional(v10.string), 
    lookDetails = v10.optional(v10.table), 
    globalGuiInset = v10.table, 
    screenSize = v10.Vector2, 
    fullView = v10.optional(v10.userdata), 
    boundInputs = v10.optional(v10.table), 
    peekViewState = v10.optional(v10.valueOf(l_PeekViewState_0)), 
    selectedTab = v10.optional(v10.number), 
    removeUnselectedItemsFromTryOn = v10.callback, 
    removeLookItemsFromTryOn = v10.callback, 
    setTryOnManagerPeekViewState = v10.callback, 
    setSelectedTab = v10.callback, 
    closeFocusedScreen = v10.callback, 
    catalogAnalytics = v10.table, 
    namedRefs = v10.table, 
    lastInputGroup = v10.string, 
    visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v10.table else nil
});
local function _(v98) --[[ Line: 221 ]] --[[ Name: isMouseAndKeyboard ]]
    -- upvalues: v38 (copy)
    return v38.InputTypeMap[v98] == v38.InputType.MouseAndKeyboard;
end;
v81.init = function(v100) --[[ Line: 225 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), v38 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v4 (copy), v8 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_PeekViewState_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v36 (copy), l_FFlagAXHideMenuOnScroll_0 (copy)
    local v101 = {};
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v101.isMouseAndKeyboard = v38.InputTypeMap[l_l_UserInputService_0_LastInputType_0] == v38.InputType.MouseAndKeyboard;
    v100:setState(v101);
    v100.frameRef = v100.props.namedRefs[l_AvatarScreen_0.LookDetails];
    v100.actionBarRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then nil else v4.createRef();
    v100.itemsListRef = v4.createRef();
    v100.closeButtonRef = v4.createRef();
    v100.tryOnElementRefCache = v8.createRefCache();
    v100.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.createFocusController();
    v100.contentFrameRef = v4.createRef();
    v100.robuxBalanceRef = v4.createRef();
    v100.onPeekViewClosed = function() --[[ Line: 245 ]]
        -- upvalues: v100 (copy)
        if v100.props.lookId ~= nil then
            v100.props.removeLookItemsFromTryOn(v100.props.lookId, v100.props.lookDetails);
            return;
        else
            v100.props.removeUnselectedItemsFromTryOn();
            return;
        end;
    end;
    v100.navigateBack = function() --[[ Line: 253 ]]
        -- upvalues: v100 (copy)
        v100.onPeekViewClosed();
        v100.props.closeFocusedScreen(v100.props.navigation);
    end;
    v100.viewStateChanged = function(v103, v104) --[[ Line: 258 ]]
        -- upvalues: v100 (copy), l_PeekViewState_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref)
        v100.props.setTryOnManagerPeekViewState(v103);
        local l_catalogAnalytics_0 = v100.props.catalogAnalytics;
        if v103 == l_PeekViewState_0.Closed then
            if l_FFlagAXMISEnableMultiShopping_0 then
                v100.props.closeFocusedScreen(v100.props.navigation);
            else
                v100.onPeekViewClosed();
            end;
        end;
        local v106 = v100.props.avatarRoute.opaque.name == l_AvatarScreen_0.MySharedAvatars;
        if l_FFlagAXMISEnableMultiShopping_0 and v103 == l_PeekViewState_0.SuperBrief and not v100.props.isTryOn and not v106 then
            v100.props.closeFocusedScreen(v100.props.navigation);
        end;
        if v103 == l_PeekViewState_0.Brief then
            if v104 == l_PeekViewState_0.Full or v104 == l_PeekViewState_0.Extended then
                l_catalogAnalytics_0.resizeOutfitScreen("minimize");
                return;
            end;
        elseif v103 == l_PeekViewState_0.Full and v104 == l_PeekViewState_0.Brief then
            l_catalogAnalytics_0.resizeOutfitScreen("expand");
        end;
    end;
    v100.onCloseButtonPressed = function() --[[ Line: 293 ]]
        -- upvalues: v100 (copy), v36 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_PeekViewState_0 (ref)
        if v100.props.lookId ~= v36.DraftLookId then
            if l_FFlagAXMISEnableMultiShopping_0 then
                v100.props.closeFocusedScreen(v100.props.navigation);
                return;
            else
                v100.props.setTryOnManagerPeekViewState(l_PeekViewState_0.SuperBrief);
                return;
            end;
        else
            v100.onPeekViewClosed();
            v100.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
            return;
        end;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        v100.peekHeaderPositionYChange = function(v107) --[[ Line: 308 ]]
            -- upvalues: v100 (copy)
            v100.scrollingFrameCanvasY = v107;
        end;
    end;
end;
v81.getActionBarTotalHeight = function(v108, v109) --[[ Line: 314 ]] --[[ Name: getActionBarTotalHeight ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v38 (copy), v12 (copy), l_PeekViewState_0 (copy)
    local v110 = if v109 then v109.Tokens.Global.Size_250 else 20;
    local l_l_ActionBarHeight_0_0 = l_ActionBarHeight_0;
    local v112 = 0;
    local v113 = 0;
    if v108.props.is10ftUI and v108.props.lastInputGroup == v38.InputType.Gamepad and not v12.isEmpty(v108.props.boundInputs) then
        v112 = v38.GAMEPAD_BOTTOM_BAR_SIZE;
    elseif v108.props.lookId ~= nil then
        v113 = v110;
    end;
    local v114 = if v108.props.peekViewState == l_PeekViewState_0.SuperBrief then v109.Tokens.Global.Space_200 else -v109.Tokens.Global.Space_100;
    if v108.props.showPeekViewInSuperBrief then
        v114 = 0;
    end;
    return l_l_ActionBarHeight_0_0 + v112 + v113 - v114;
end;
v81.getBriefViewHeight = function(v115, v116) --[[ Line: 346 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v36 (copy)
    local l_Offset_0 = l_getSafeAreaSize_0(v115.props.screenSize, v115.props.globalGuiInset).Y.Offset;
    local l_Size_300_0 = v116.Tokens.Global.Size_300;
    if v115.props.isPortrait then
        local v119 = l_Offset_0 * v36.PortraitSceneHeight;
        return l_Offset_0 - v115.props.topBarHeight - v119 - l_Size_300_0;
    else
        return (l_Offset_0 - v115.props.topBarHeight - l_Size_300_0) * 0.5;
    end;
end;
v81.renderActionBar = function(v120, v121) --[[ Line: 362 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_PeekViewState_0 (copy), v36 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v46 (copy), v45 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_ActionBarGradientHeight_0 (copy)
    local l_Theme_0 = v121.Theme;
    local v123 = v120:getActionBarTotalHeight(v121);
    local v124 = v120.props.peekViewState == l_PeekViewState_0.SuperBrief;
    local v125 = if not v124 or v120.props.showPeekViewInSuperBrief then UDim.new(0, v121.Tokens.Global.Space_125) else UDim.new(0, -v121.Tokens.Global.Space_175);
    local l_Size_50_0 = v121.Tokens.Global.Size_50;
    local v127 = v120.props.lookId == v36.DraftLookId;
    return v4.createFragment({
        BottomContainer = v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, v123), 
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            ZIndex = 2, 
            ref = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v120.props.resolvedActionBarRef else v120.actionBarRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v120.itemsListRef
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = v125
            }), 
            DraftLookBottomBar = v127 and v4.createElement(v46), 
            LookDetailsBottomBar = not v127 and v4.createElement(v45, {
                hideDescriptor = true, 
                centered = v120.props.isTryOn and true or nil, 
                isTryOnFromOutsideAX = v120.props.isTryOn, 
                alwaysBuyAll = l_FFlagAXMISEnableMultiShopping_0 and not v120.props.isTryOn or false
            })
        }), 
        TopFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Size_50_0), 
            Position = UDim2.new(0, 0, 1, -v123), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }), 
        Gradient = if v124 and v120.props.showPeekViewInSuperBrief then nil else v4.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
            Position = UDim2.new(0, 0, 1, -v123 - l_Size_50_0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        })
    });
end;
v81.renderTopContent = function(v128, v129, v130, v131) --[[ Line: 427 ]] --[[ Name: renderTopContent ]]
    -- upvalues: v36 (copy), v4 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ImageSetButton_0 (copy), l_Focusable_0 (copy), v77 (copy), l_CursorKind_0 (copy), v67 (copy)
    local l_Theme_1 = v129.Theme;
    local l_Font_0 = v129.Font;
    local l_Size_450_0 = v129.Tokens.Global.Size_450;
    local l_Space_175_0 = v129.Tokens.Global.Space_175;
    local l_Space_50_0 = v129.Tokens.Global.Space_50;
    local v137 = v128.props.lookId == v36.DraftLookId;
    local v138 = if v137 and v128.props.isPortrait then v129.Tokens.Global.Space_500 else v129.Tokens.Global.Space_300;
    local v139 = if v137 then v4.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        iconSize = l_IconSize_0.Medium, 
        icon = l_Images_0["icons/navigation/close"], 
        position = UDim2.new(0, v129.Tokens.Global.Space_300, 0.5, 0), 
        onActivated = v128.onCloseButtonPressed, 
        anchorPoint = Vector2.new(0, 0.5)
    }) else nil;
    return v4.createFragment({
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v138)
        }), 
        CloseButton = if v137 then v139 else v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, l_Space_175_0, 0.5, 0), 
            Size = UDim2.fromOffset(l_Size_450_0 + l_Space_50_0, l_Size_450_0 + l_Space_50_0), 
            Image = v77, 
            ImageColor3 = l_Theme_1.SystemPrimaryDefault.Color, 
            ImageTransparency = l_Theme_1.SystemPrimaryDefault.Transparency, 
            [v4.Event.Activated] = v128.onCloseButtonPressed, 
            ref = v128.closeButtonRef, 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v128.itemsListRef, 
            SelectionImageObject = v131(l_CursorKind_0.RoundedRectNoInset)
        }), 
        Title = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_Size_450_0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = if v137 then if v67() then v130.previewHeader else "Preview" else "", 
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
v81.orderTryOns = function(v140, v141) --[[ Line: 490 ]] --[[ Name: orderTryOns ]]
    -- upvalues: v36 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v142 = {};
    for _, v144 in v141 do
        table.insert(v142, v144);
    end;
    if v140.props.lookId and v140.props.lookDetails then
        local l_lookDetails_0 = v140.props.lookDetails;
        if l_lookDetails_0 and (l_lookDetails_0.lookType == v36.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and l_lookDetails_0.lookType == v36.LookType.Makeup) then
            table.sort(v142, function(v146, v147) --[[ Line: 506 ]]
                if v146.itemRecency and v147.itemRecency then
                    return v146.itemRecency < v147.itemRecency;
                else
                    return false;
                end;
            end);
        end;
    end;
    return v142;
end;
v81.renderTryOnManagerContents = function(v148, v149, _, v151) --[[ Line: 519 ]] --[[ Name: renderTryOnManagerContents ]]
    -- upvalues: v36 (copy), v4 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v54 (copy), v44 (copy)
    local l_Theme_2 = v149.Theme;
    local l_Space_200_0 = v149.Tokens.Global.Space_200;
    local v154 = v148.props.lookId == v36.DraftLookId;
    local v155 = {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 20)
        })
    };
    if v148.props.lookDetails == nil then
        return v155;
    else
        local v156 = 1;
        v155["list-header-padding"] = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 5), 
            LayoutOrder = v156
        });
        v156 = v156 + 1;
        local v157 = v148:orderTryOns(v148.props.tryOnItems);
        local v158 = false;
        local l_v156_0 = v156;
        for v160, v161 in v157 do
            local v162 = nil;
            local v163 = nil;
            if l_v156_0 < v156 then
                v162 = v148.tryOnElementRefCache[v157[v160 - 1].itemId];
            elseif v151 then
                v162 = v148.closeButtonRef;
            end;
            v163 = if v156 < #v157 and v157[v160 + 1] then v148.tryOnElementRefCache[v157[v160 + 1].itemId] else if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v148.props.resolvedActionBarRef else v148.actionBarRef;
            local v164 = nil;
            if v161.itemType == v36.ItemType.Asset then
                v164 = v148.props.lookDetails.lookAssetInfos[v161.itemId];
            elseif v161.itemType == v36.ItemType.Bundle then
                v164 = v148.props.lookDetails.lookBundleInfos[v161.itemId];
            else
                continue;
            end;
            local v165 = v54.isItemSelectable(v164);
            if v160 > 1 and v158 ~= v165 then
                v155["divider-" .. v156] = v4.createElement("Frame", {
                    BackgroundColor3 = l_Theme_2.Divider.Color, 
                    BackgroundTransparency = l_Theme_2.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -(l_Space_200_0 * 2), 0, 1), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    LayoutOrder = v156
                });
                v156 = v156 + 1;
            end;
            if v164 then
                v155[v161.itemId] = v4.createElement(v44, {
                    tryOnItem = v161, 
                    itemInfo = v164, 
                    layoutOrder = v156, 
                    allowAutomaticPeekViewStateChanges = v148.props.lookId == nil, 
                    disableInteractions = v154, 
                    forceShowPrice = v154, 
                    horizontalPadding = l_Space_200_0, 
                    elementRef = v148.tryOnElementRefCache[v161.itemId], 
                    NextSelectionUp = v162, 
                    NextSelectionDown = v163
                });
                v156 = v156 + 1;
            end;
            v158 = v54.isItemSelectable(v164);
        end;
        return v155;
    end;
end;
v81.renderDetailsContents = function(v166) --[[ Line: 623 ]] --[[ Name: renderDetailsContents ]]
    -- upvalues: v4 (copy), v59 (copy), v66 (copy)
    return {
        LookDetails = v4.createElement(v59, {
            lookId = v166.props.lookId, 
            width = if v66() then nil else 500, 
            listPadding = v166.props.listPadding, 
            lookDetails = v166.props.lookDetails, 
            isTryOn = v166.props.isTryOn
        })
    };
end;
v81.renderWithProviders = function(v167, v168, v169, v170) --[[ Line: 638 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v36 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_PeekViewState_0 (copy), l_AvatarScreen_0 (copy), v68 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v47 (copy), v39 (copy), v43 (copy), v80 (copy), l_ImageSetButton_0 (copy), v78 (copy), v77 (copy), l_PeekView_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), v25 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v53 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v38 (copy), v8 (copy)
    local l_Theme_3 = v168.Theme;
    local l_Size_450_1 = v168.Tokens.Global.Size_450;
    local l_Space_175_1 = v168.Tokens.Global.Space_175;
    local l_Size_6000_0 = v168.Tokens.Global.Size_6000;
    local l_Size_600_0 = v168.Tokens.Global.Size_600;
    local l_Space_400_0 = v168.Tokens.Global.Space_400;
    local l_isTryOn_0 = v167.props.isTryOn;
    local v178 = if l_isTryOn_0 then UDim2.new(0.5, 0, 0, v167.props.topBarHeight) else UDim2.fromOffset(0, v167.props.topBarHeight);
    local v179 = UDim2.new(1, 0, 1, -v167.props.topBarHeight);
    if not v167.props.isPortrait then
        if not l_isTryOn_0 then
            v178 = UDim2.new(v36.LandscapeNavWidth, 0, 0, v167.props.topBarHeight);
        end;
        v179 = UDim2.new(v36.LandscapeSceneWidth, 0, 1, -v167.props.topBarHeight);
    end;
    local v180 = v167:getBriefViewHeight(v168);
    local v181 = if v167.props.lookId ~= nil then v167:getActionBarTotalHeight(v168) else nil;
    local v182 = v167:getActionBarTotalHeight(v168);
    local v186 = if l_FFlagAXHideMenuOnScroll_0 then v167.props.visibilityRatioBinding:map(function(v183) --[[ Line: 665 ]]
        -- upvalues: v167 (copy)
        local v184 = v167.scrollingFrameCanvasY or 0;
        local v185 = math.floor((1 - v183) * v184);
        return UDim2.new(0, 0, 0, v185);
    end) else nil;
    local v187 = v167.props.screenSize.Y - v167.props.topBarHeight - v167.props.globalGuiInset.bottom;
    local v188 = "none";
    if v167.props.peekViewState == l_PeekViewState_0.Full or v167.props.peekViewState == l_PeekViewState_0.Extended then
        v188 = "regular";
    end;
    local v189 = v167.state.isMouseAndKeyboard and v167.props.peekViewState == l_PeekViewState_0.Brief;
    local v190 = true;
    local v191 = v167.props.peekViewState == l_PeekViewState_0.SuperBrief;
    local v192 = v167.props.lookId == v36.DraftLookId;
    local v193 = v167.props.avatarRoute.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    if v192 and v167.props.peekViewState ~= l_PeekViewState_0.Closed then
        v188 = "regular";
    end;
    local v194 = true;
    if v167.props.peekViewState ~= l_PeekViewState_0.Full then
        v194 = v167.props.peekViewState == l_PeekViewState_0.Extended;
    end;
    if v167.props.isTryOn then
        v188 = "tryOn";
    end;
    if v190 and not v167.props.showPeekViewInSuperBrief then
        v190 = not v191;
    end;
    if v192 then
        v189 = false;
    end;
    local v195 = not v68 or v167.props.peekViewState == l_PeekViewState_0.Full;
    if v192 then
        v195 = false;
    end;
    if v167.props.isTryOn then
        v195 = false;
    end;
    local function v197(v196) --[[ Line: 721 ]]
        -- upvalues: v167 (copy)
        v167.props.setSelectedTab(v196);
    end;
    local l_detailsTabTitle_0 = v169.detailsTabTitle;
    local v199 = 0;
    if v167.props.tryOnItems then
        for _, _ in pairs(v167.props.tryOnItems) do
            v199 = v199 + 1;
        end;
    end;
    local v202 = v169.tryOnTabTitle:gsub("{numItems}", v199);
    local v203 = {
        {
            Title = l_detailsTabTitle_0, 
            Name = "Details"
        }, 
        {
            Title = v202, 
            Name = "TryOns"
        }
    };
    if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
        local l_createElement_0 = v4.createElement;
        local v205 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame;
        local v206 = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v179, 
            Position = v178, 
            AnchorPoint = if l_isTryOn_0 then Vector2.new(0.5, 0) else nil, 
            Visible = v167.props.fullView ~= v47.SceneFullView, 
            SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            ref = v167.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.props.resolvedActionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.props.namedRefs[v167.props.avatarRoute.opaque.name .. v39.ItemsList]
        };
        local v207 = {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v43, {
                focusController = v167.focusController, 
                captureFocusOnMount = true
            })
        };
        local v208 = false;
        if v188 == "tryOn" then
            v208 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = v194 and 0 or 1, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v167.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v167.props.topBarHeight), 
                BorderSizePixel = 0
            }, {
                TopContent = v4.createElement(v80, {
                    stylePalette = v168, 
                    showDropDownButton = v194, 
                    navigateBack = v167.navigateBack, 
                    onCloseButtonPressed = v167.onCloseButtonPressed, 
                    robuxBalanceRef = v167.robuxBalanceRef
                })
            });
        end;
        v207.LookDetailsTryOnTopBar = v208;
        v208 = false;
        if v188 == "regular" then
            v208 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v167.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v167.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v167:renderTopContent(v168, v169, v170)
            });
        end;
        v207.LookDetailsTopBar = v208;
        v207.CloseButton = v189 and v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Space_175_1, 1, -v167:getBriefViewHeight(v168) - if v167.props.isTryOn then l_Space_400_0 else l_Size_450_1), 
            Size = UDim2.new(0, if v167.props.isTryOn then l_Size_6000_0 else l_Size_450_1, 0, if v167.props.isTryOn then l_Size_600_0 else l_Size_450_1), 
            Image = if v167.props.isTryOn then v78 else v77, 
            ImageColor3 = l_Theme_3.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = v167.onCloseButtonPressed
        });
        v207.PeekViewContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = if l_FFlagAXHideMenuOnScroll_0 then v186 else nil, 
            ZIndex = 3, 
            ClipsDescendants = true
        }, {
            PeekView = v4.createElement(l_PeekView_0, {
                peekHeaderPositionYChange = if l_FFlagAXHideMenuOnScroll_0 then v167.peekHeaderPositionYChange else nil, 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v167.props.scrollingFrameRef else nil, 
                briefViewContentHeight = UDim.new(0, v180), 
                mountAnimation = v195, 
                mountAsFullView = false, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v167.viewStateChanged, 
                showDropShadow = not v167.props.isTryOn and v25(v167.props.peekViewState), 
                superBriefViewContentHeight = if v167.props.lookId ~= nil then UDim.new(0, v181) else nil, 
                stateOnMount = if v167.props.initialPeekViewState then v167.props.initialPeekViewState else if v167.props.lookId then v167.props.peekViewState else nil, 
                bottomDockedContainerHeight = v182, 
                bottomDockedContainerContent = v167:renderActionBar(v168), 
                backgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_3.BackgroundUIDefault.Transparency, 
                peekHeaderClose = false, 
                isScrollingEnabled = v190, 
                peekViewState = v167.props.peekViewState, 
                hideDraggerInSuperBrief = not v167.props.showPeekViewInSuperBrief, 
                customBackground = l_Theme_3.BackgroundDefault.Color, 
                minimizeToSuperBrief = v167.props.lookId ~= v36.DraftLookId
            }, v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ClipsDescendants = true, 
                [v4.Ref] = v167.props.resolvedFocusNavigationRef
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                NavBar = if not l_FFlagAXMISEnableMultiShopping_0 or v192 or v193 or v167.props.isTryOn then v4.createElement(v53, {
                    layoutOrderMain = 1, 
                    navHeightMain = v36.LooksDetailsTabBarHeight, 
                    tabs = v203, 
                    selectedTabIndex = v167.props.selectedTab, 
                    selectTab = v197, 
                    NextSelectionUp = v167.props.NextSelectionUp, 
                    NextSelectionDown = v167.props.NextSelectionDown
                }) else nil, 
                DetailsContainer = if v167.props.selectedTab == 1 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v187), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v167:renderDetailsContents()) else nil, 
                TryOnManagerContainer = if v167.props.selectedTab == 2 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v187), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = v167.itemsListRef, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v167:renderTryOnManagerContents(v168, v169, v188 == "regular")) else nil
            }))
        });
        v207.LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v209) --[[ Line: 930 ]] --[[ Name: callback ]]
                -- upvalues: v38 (ref), v167 (copy)
                if v209 then
                    local v210 = v38.InputTypeMap[v209] == v38.InputType.MouseAndKeyboard;
                    if v210 ~= v167.state.isMouseAndKeyboard then
                        v167:setState({
                            isMouseAndKeyboard = v210
                        });
                    end;
                end;
            end
        });
        return l_createElement_0(v205, v206, v207);
    else
        local l_createElement_1 = v4.createElement;
        local v212 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame;
        local v214 = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v179, 
            Position = v178, 
            AnchorPoint = if l_isTryOn_0 then Vector2.new(0.5, 0) else nil, 
            Visible = v167.props.fullView ~= v47.SceneFullView, 
            ref = v167.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.actionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167.props.namedRefs[v167.props.avatarRoute.opaque.name .. v39.ItemsList], 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 963 ]]
                    -- upvalues: v167 (copy)
                    v167.navigateBack();
                end), 
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 967 ]]
                    -- upvalues: v167 (copy), l_PeekViewState_0 (ref)
                    local l_peekViewState_0 = v167.props.peekViewState;
                    if l_peekViewState_0 == l_PeekViewState_0.Full or l_peekViewState_0 == l_PeekViewState_0.Extended then
                        v167.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v167.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }
        };
        local v215 = {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v43, {
                focusController = v167.focusController, 
                captureFocusOnMount = true
            })
        };
        local v216 = false;
        if v188 == "tryOn" then
            v216 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = v194 and 0 or 1, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v167.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v167.props.topBarHeight), 
                BorderSizePixel = 0
            }, {
                TopContent = v4.createElement(v80, {
                    stylePalette = v168, 
                    showDropDownButton = v194, 
                    navigateBack = v167.navigateBack, 
                    onCloseButtonPressed = v167.onCloseButtonPressed, 
                    robuxBalanceRef = v167.robuxBalanceRef
                })
            });
        end;
        v215.LookDetailsTryOnTopBar = v216;
        v216 = false;
        if v188 == "regular" then
            v216 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v167.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v167.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v167:renderTopContent(v168, v169, v170)
            });
        end;
        v215.LookDetailsTopBar = v216;
        v215.CloseButton = v189 and v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Space_175_1, 1, -v167:getBriefViewHeight(v168) - if v167.props.isTryOn then l_Space_400_0 else l_Size_450_1), 
            Size = UDim2.new(0, if v167.props.isTryOn then l_Size_6000_0 else l_Size_450_1, 0, if v167.props.isTryOn then l_Size_600_0 else l_Size_450_1), 
            Image = if v167.props.isTryOn then v78 else v77, 
            ImageColor3 = l_Theme_3.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = v167.onCloseButtonPressed
        });
        v215.PeekViewContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 3, 
            Position = if l_FFlagAXHideMenuOnScroll_0 then v186 else nil, 
            ClipsDescendants = true
        }, {
            PeekView = v4.createElement(l_PeekView_0, {
                peekHeaderPositionYChange = if l_FFlagAXHideMenuOnScroll_0 then v167.peekHeaderPositionYChange else nil, 
                scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v167.props.scrollingFrameRef else nil, 
                briefViewContentHeight = UDim.new(0, v180), 
                mountAnimation = v195, 
                mountAsFullView = false, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v167.viewStateChanged, 
                showDropShadow = not v167.props.isTryOn and v25(v167.props.peekViewState), 
                superBriefViewContentHeight = if v167.props.lookId ~= nil then UDim.new(0, v181) else nil, 
                stateOnMount = if v167.props.initialPeekViewState then v167.props.initialPeekViewState else if v167.props.lookId then v167.props.peekViewState else nil, 
                bottomDockedContainerHeight = v182, 
                bottomDockedContainerContent = v167:renderActionBar(v168), 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                backgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_3.BackgroundUIDefault.Transparency, 
                peekHeaderClose = false, 
                isScrollingEnabled = v190, 
                peekViewState = v167.props.peekViewState, 
                hideDraggerInSuperBrief = not v167.props.showPeekViewInSuperBrief, 
                customBackground = l_Theme_3.BackgroundDefault.Color, 
                minimizeToSuperBrief = v167.props.lookId ~= v36.DraftLookId
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingBottom = UDim.new(0, 8)
                }), 
                NavBar = if not l_FFlagAXMISEnableMultiShopping_0 or v192 or v193 or v167.props.isTryOn then v4.createElement(v53, {
                    layoutOrderMain = 1, 
                    navHeightMain = v36.LooksDetailsTabBarHeight, 
                    tabs = v203, 
                    selectedTabIndex = v167.props.selectedTab, 
                    selectTab = v197, 
                    NextSelectionUp = v167.props.NextSelectionUp, 
                    NextSelectionDown = v167.props.NextSelectionDown
                }) else nil, 
                DetailsContainer = if v167.props.selectedTab == 1 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v187), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v167:renderDetailsContents()) else nil, 
                TryOnManagerContainer = if v167.props.selectedTab == 2 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v187), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = v167.itemsListRef, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v167:renderTryOnManagerContents(v168, v169, v188 == "regular")) else nil
            })
        });
        v215.LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v217) --[[ Line: 1133 ]] --[[ Name: callback ]]
                -- upvalues: v38 (ref), v167 (copy)
                if v217 then
                    local v218 = v38.InputTypeMap[v217] == v38.InputType.MouseAndKeyboard;
                    if v218 ~= v167.state.isMouseAndKeyboard then
                        v167:setState({
                            isMouseAndKeyboard = v218
                        });
                    end;
                end;
            end
        });
        return l_createElement_1(v212, v214, v215);
    end;
end;
v81.render = function(v219) --[[ Line: 1148 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v67 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v220) --[[ Line: 1149 ]]
        -- upvalues: l_withLocalization_0 (ref), v67 (ref), l_withSelectionCursorProvider_0 (ref), v219 (copy)
        return l_withLocalization_0({
            detailsTabTitle = "Feature.Catalog.Label.Details", 
            tryOnTabTitle = "Feature.Catalog.Label.TryOnsMultiple", 
            previewHeader = v67() and "Feature.Avatar.Title.Preview" or nil
        })(function(v221) --[[ Line: 1154 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v219 (ref), v220 (copy)
            return l_withSelectionCursorProvider_0(function(v222) --[[ Line: 1155 ]]
                -- upvalues: v219 (ref), v220 (ref), v221 (copy)
                return v219:renderWithProviders(v220, v221, v222);
            end);
        end);
    end);
end;
v81.didUpdate = function(v223, v224, _) --[[ Line: 1162 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_PeekViewState_0 (copy), l_wasLastInputGamepad_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy)
    if v224.lookId and not v223.props.lookId then
        v223.onPeekViewClosed();
        v223.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
    end;
    if not l_wasLastInputGamepad_0() then
        return;
    else
        if v223.props.peekViewState ~= v224.peekViewState and v223.props.peekViewState ~= l_PeekViewState_0.Closed then
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v223.focusController.captureFocus();
            end;
            if v223.props.peekViewState == l_PeekViewState_0.Brief then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    local v226 = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v223.props.resolvedActionBarRef.current else v223.actionBarRef.current;
                    if v223.props.focusGuiObject and v226 then
                        v223.props.focusGuiObject(v226);
                        return;
                    end;
                else
                    v223.focusController.moveFocusTo(if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v223.props.resolvedActionBarRef else v223.actionBarRef);
                end;
            end;
        end;
        return;
    end;
end;
local function v235(v227, v228) --[[ Line: 1202 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v51 (copy), v52 (copy)
    local v229 = v51(v227);
    local l_name_0 = v228.avatarRoute.opaque.name;
    local l_LookId_1 = v227.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    local l_Looks_1 = v227.AvatarExperience.AvatarScene.Looks;
    local v233 = l_Looks_1 and l_LookId_1 and l_Looks_1[l_LookId_1];
    local l_TryOnItems_0 = v227.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return {
        isPortrait = v229, 
        topBarHeight = v227.TopBar.topBarHeight, 
        tryOnItems = l_TryOnItems_0, 
        lookId = l_LookId_1, 
        lookDetails = v233, 
        globalGuiInset = v227.GlobalGuiInset, 
        screenSize = v227.ScreenSize, 
        fullView = v52(v227, l_name_0), 
        boundInputs = v227.GamepadBottomBar.boundInputs, 
        peekViewState = v227.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        selectedTab = v227.AvatarExperience.Common.ItemDetailsPeekView.lookDetailsSelectedTab
    };
end;
local function v246(v236) --[[ Line: 1225 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v40 (copy), v41 (copy), v42 (copy), v55 (copy), v60 (copy)
    return {
        removeUnselectedItemsFromTryOn = function() --[[ Line: 1227 ]] --[[ Name: removeUnselectedItemsFromTryOn ]]
            -- upvalues: v236 (copy), v40 (ref)
            return v236(v40());
        end, 
        removeLookItemsFromTryOn = function(v237, v238) --[[ Line: 1231 ]] --[[ Name: removeLookItemsFromTryOn ]]
            -- upvalues: v236 (copy), v41 (ref)
            if v237 and v238 then
                local v239 = {};
                for v240 in v238.lookAssetInfos do
                    table.insert(v239, v240);
                end;
                local v241 = {};
                for v242 in v238.lookBundleInfos do
                    table.insert(v241, v242);
                end;
                return v236(v41(v237, v239, v241));
            else
                return;
            end;
        end, 
        setTryOnManagerPeekViewState = function(v243) --[[ Line: 1247 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v236 (copy), v42 (ref)
            v236(v42(v243));
        end, 
        setSelectedTab = function(v244) --[[ Line: 1251 ]] --[[ Name: setSelectedTab ]]
            -- upvalues: v236 (copy), v55 (ref)
            return v236(v55(v244));
        end, 
        closeFocusedScreen = function(v245) --[[ Line: 1255 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v236 (copy), v60 (ref)
            v236(v60(v245));
        end
    };
end;
v81 = v49((v48((l_RoactServices_0.connect({
    catalogAnalytics = v35
})(v81)))));
v81 = v7.connect(v235, v246)(v81);
local function v269(v247) --[[ Line: 1270 ]] --[[ Name: LookDetailsPeekViewContainer ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v16 (copy), v3 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v85 (copy), v89 (copy), v83 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v41 (copy), v40 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_PeekViewState_0 (copy), v42 (copy), v97 (copy), l_AvatarScreen_0 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v4 (copy), v81 (ref), v12 (copy)
    local v248 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v249 = nil;
    local v250 = nil;
    local v251 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v252 = l_useAnimatedVisibility_0();
        v251 = if v252 then v16.useSignalBinding(v252.animatedMenusStore.getVisibilityRatio) else v3.createBinding(1);
    end;
    if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
        local v253 = l_useDispatch_0();
        local v254 = l_useSelector_0(v85);
        local v255 = l_useSelector_0(v89);
        local v256 = l_useSelector_0(v83);
        local l_v254_0 = v254 --[[ copy: 7 -> 14 ]];
        local l_v253_0 = v253 --[[ copy: 6 -> 15 ]];
        local v263 = v3.useCallback(function() --[[ Line: 1295 ]]
            -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (ref), v247 (copy), l_v254_0 (copy), v255 (copy), l_v253_0 (copy), v41 (ref), v40 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            if not l_FFlagAXMISEnableMultiShopping_0 or v247.isTryOn then
                if l_v254_0 ~= nil and v255 then
                    local v259 = {};
                    for v260 in v255.lookAssetInfos do
                        table.insert(v259, v260);
                    end;
                    local v261 = {};
                    if v255.lookBundleInfos then
                        for v262 in v255.lookBundleInfos do
                            table.insert(v261, v262);
                        end;
                    end;
                    l_v253_0(v41(l_v254_0, v259, v261));
                else
                    l_v253_0(v40());
                end;
            end;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v247.navigation.goBack();
            end;
        end, {
            v247.navigation, 
            v253, 
            v254, 
            v255
        });
        local v264 = v3.useCallback(function() --[[ Line: 1319 ]]
            -- upvalues: v256 (copy), l_PeekViewState_0 (ref), l_v253_0 (copy), v42 (ref)
            if v256 == l_PeekViewState_0.Full or v256 == l_PeekViewState_0.Extended then
                l_v253_0(v42(l_PeekViewState_0.Brief));
                return;
            else
                l_v253_0(v42(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v256, 
            v253
        });
        local v265 = v97(v247.namedRefs[l_AvatarScreen_0.LookDetails], v263, v264);
        v249 = l_useTableWrappedCallbackRef_0(v265);
        local v266 = v97(nil, v263, v264);
        v250 = l_useTableWrappedCallbackRef_0(v266);
    end;
    local v267 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v268 = nil;
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        v268 = v3.useRef(nil);
        l_useAXAnimateScrollFrame_0(v268);
    end;
    return v4.createElement(v81, v12.Dictionary.join({
        is10ftUI = v248, 
        resolvedFocusNavigationRef = v249, 
        resolvedActionBarRef = v250, 
        focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v267 else nil, 
        scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v268 else nil, 
        visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v251 else nil
    }, v247));
end;
if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
    return v48(v269);
else
    return v269;
end;