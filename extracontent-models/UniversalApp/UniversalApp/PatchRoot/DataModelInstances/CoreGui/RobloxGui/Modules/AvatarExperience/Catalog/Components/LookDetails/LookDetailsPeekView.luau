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
local l_selectTryOnsLookId_0 = v20.State.Selectors.selectTryOnsLookId;
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v26 = require(l_Modules_0.AvatarExperience.Common.Util.getShouldShowPeekViewShadow);
local v27 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v28 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v28.useFocusGuiObject;
local v30 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v27.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v34 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v37 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v39 = require(l_Modules_0.LuaApp.Constants);
local v40 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v41 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v42 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnElement);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBar);
local v47 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.DraftLookBottomBar);
local v48 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v49 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v50 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v52 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v53 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v54 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.TabBar.TabBarUnderlined);
local v55 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookDetailsPeekViewSelectedTab);
local l_Images_0 = v11.App.ImageSet.Images;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local v60 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookDetailsContainerInnards);
local v61 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseFocusedScreen);
local l_useAnimatedVisibility_0 = v20.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local l_withStyle_0 = v11.Style.withStyle;
local l_ImageSetButton_0 = v11.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = v11.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v11.App.SelectionImage.CursorKind;
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions);
local v68 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v69 = game:DefineFastFlag("AXDisableNonFullviewAnimation", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateLookDetailsPeekViewToFocusNavigation;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXHideMenuOnScroll_0 = v34.FFlagAXHideMenuOnScroll;
local l_ActionBarHeight_0 = v38.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v38.ActionBar.ActionBarGradientHeight;
local v78 = l_Images_0["icons/navigation/close"];
local v79 = l_Images_0["icons/actions/truncationExpand"];
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v81 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsTryOnTopContent);
local v82 = v4.PureComponent:extend("LookDetailsPeekView");
local v84 = l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 and function(v83) --[[ Line: 131 ]]
    -- upvalues: v37 (copy)
    if v83.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType == v37.LookType.Makeup then
        return v83.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId;
    else
        return v83.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    end;
end or nil;
local function v86(v85) --[[ Line: 142 ]]
    return v85.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v88(v87) --[[ Line: 145 ]]
    return v87.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v92(v89) --[[ Line: 148 ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v84 (copy)
    local v90 = if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then v84(v89) else v89.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    local l_Looks_0 = v89.AvatarExperience.AvatarScene.Looks;
    if l_Looks_0 and v90 and l_Looks_0[v90] then
        return l_Looks_0[v90];
    else
        return nil;
    end;
end;
local v93 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOnManager
};
local function v100(v94, v95, v96) --[[ Line: 167 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v28 (copy), v93 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v30 (copy)
    local v97 = v28.useEventMap(v93, v94);
    local v99 = v3.useMemo(function() --[[ Line: 169 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v30 (ref), v95 (copy), v96 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v30.onRelease(function(v98) --[[ Line: 172 ]]
                    -- upvalues: v95 (ref)
                    v98.cancelled = true;
                    v95();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = {
                handler = v30.onRelease(v96)
            }
        };
    end, {
        v95, 
        v96
    });
    return v28.useEventHandlerMap(v99, v97);
end;
v82.validateProps = v10.interface({
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
local function _(v101) --[[ Line: 237 ]] --[[ Name: isMouseAndKeyboard ]]
    -- upvalues: v39 (copy)
    return v39.InputTypeMap[v101] == v39.InputType.MouseAndKeyboard;
end;
v82.init = function(v103) --[[ Line: 241 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), v39 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v4 (copy), v8 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_PeekViewState_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v37 (copy), l_FFlagAXHideMenuOnScroll_0 (copy)
    local v104 = {};
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v104.isMouseAndKeyboard = v39.InputTypeMap[l_l_UserInputService_0_LastInputType_0] == v39.InputType.MouseAndKeyboard;
    v103:setState(v104);
    v103.frameRef = v103.props.namedRefs[l_AvatarScreen_0.LookDetails];
    v103.actionBarRef = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then nil else v4.createRef();
    v103.itemsListRef = v4.createRef();
    v103.closeButtonRef = v4.createRef();
    v103.tryOnElementRefCache = v8.createRefCache();
    v103.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.createFocusController();
    v103.contentFrameRef = v4.createRef();
    v103.robuxBalanceRef = v4.createRef();
    v103.onPeekViewClosed = function() --[[ Line: 261 ]]
        -- upvalues: v103 (copy)
        if v103.props.lookId ~= nil then
            v103.props.removeLookItemsFromTryOn(v103.props.lookId, v103.props.lookDetails);
            return;
        else
            v103.props.removeUnselectedItemsFromTryOn();
            return;
        end;
    end;
    v103.navigateBack = function() --[[ Line: 269 ]]
        -- upvalues: v103 (copy)
        v103.onPeekViewClosed();
        v103.props.closeFocusedScreen(v103.props.navigation);
    end;
    v103.viewStateChanged = function(v106, v107) --[[ Line: 274 ]]
        -- upvalues: v103 (copy), l_PeekViewState_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref)
        v103.props.setTryOnManagerPeekViewState(v106);
        local l_catalogAnalytics_0 = v103.props.catalogAnalytics;
        if v106 == l_PeekViewState_0.Closed then
            if l_FFlagAXMISEnableMultiShopping_0 then
                v103.props.closeFocusedScreen(v103.props.navigation);
            else
                v103.onPeekViewClosed();
            end;
        end;
        local v109 = v103.props.avatarRoute.opaque.name == l_AvatarScreen_0.MySharedAvatars;
        if l_FFlagAXMISEnableMultiShopping_0 and v106 == l_PeekViewState_0.SuperBrief and not v103.props.isTryOn and not v109 then
            v103.props.closeFocusedScreen(v103.props.navigation);
        end;
        if v106 == l_PeekViewState_0.Brief then
            if v107 == l_PeekViewState_0.Full or v107 == l_PeekViewState_0.Extended then
                l_catalogAnalytics_0.resizeOutfitScreen("minimize");
                return;
            end;
        elseif v106 == l_PeekViewState_0.Full and v107 == l_PeekViewState_0.Brief then
            l_catalogAnalytics_0.resizeOutfitScreen("expand");
        end;
    end;
    v103.onCloseButtonPressed = function() --[[ Line: 309 ]]
        -- upvalues: v103 (copy), v37 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_PeekViewState_0 (ref)
        if v103.props.lookId ~= v37.DraftLookId then
            if l_FFlagAXMISEnableMultiShopping_0 then
                v103.props.closeFocusedScreen(v103.props.navigation);
                return;
            else
                v103.props.setTryOnManagerPeekViewState(l_PeekViewState_0.SuperBrief);
                return;
            end;
        else
            v103.onPeekViewClosed();
            v103.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
            return;
        end;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        v103.peekHeaderPositionYChange = function(v110) --[[ Line: 324 ]]
            -- upvalues: v103 (copy)
            v103.scrollingFrameCanvasY = v110;
        end;
    end;
end;
v82.getActionBarTotalHeight = function(v111, v112) --[[ Line: 330 ]] --[[ Name: getActionBarTotalHeight ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v39 (copy), v12 (copy), l_PeekViewState_0 (copy)
    local v113 = if v112 then v112.Tokens.Global.Size_250 else 20;
    local l_l_ActionBarHeight_0_0 = l_ActionBarHeight_0;
    local v115 = 0;
    local v116 = 0;
    if v111.props.is10ftUI and v111.props.lastInputGroup == v39.InputType.Gamepad and not v12.isEmpty(v111.props.boundInputs) then
        v115 = v39.GAMEPAD_BOTTOM_BAR_SIZE;
    elseif v111.props.lookId ~= nil then
        v116 = v113;
    end;
    local v117 = if v111.props.peekViewState == l_PeekViewState_0.SuperBrief then v112.Tokens.Global.Space_200 else -v112.Tokens.Global.Space_100;
    if v111.props.showPeekViewInSuperBrief then
        v117 = 0;
    end;
    return l_l_ActionBarHeight_0_0 + v115 + v116 - v117;
end;
v82.getBriefViewHeight = function(v118, v119) --[[ Line: 362 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v37 (copy)
    local l_Offset_0 = l_getSafeAreaSize_0(v118.props.screenSize, v118.props.globalGuiInset).Y.Offset;
    local l_Size_300_0 = v119.Tokens.Global.Size_300;
    if v118.props.isPortrait then
        local v122 = l_Offset_0 * v37.PortraitSceneHeight;
        return l_Offset_0 - v118.props.topBarHeight - v122 - l_Size_300_0;
    else
        return (l_Offset_0 - v118.props.topBarHeight - l_Size_300_0) * 0.5;
    end;
end;
v82.renderActionBar = function(v123, v124) --[[ Line: 378 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_PeekViewState_0 (copy), v37 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v47 (copy), v46 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_ActionBarGradientHeight_0 (copy)
    local l_Theme_0 = v124.Theme;
    local v126 = v123:getActionBarTotalHeight(v124);
    local v127 = v123.props.peekViewState == l_PeekViewState_0.SuperBrief;
    local v128 = if not v127 or v123.props.showPeekViewInSuperBrief then UDim.new(0, v124.Tokens.Global.Space_125) else UDim.new(0, -v124.Tokens.Global.Space_175);
    local l_Size_50_0 = v124.Tokens.Global.Size_50;
    local v130 = v123.props.lookId == v37.DraftLookId;
    return v4.createFragment({
        BottomContainer = v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 0, v126), 
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            ZIndex = 2, 
            ref = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v123.props.resolvedActionBarRef else v123.actionBarRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v123.itemsListRef
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = v128
            }), 
            DraftLookBottomBar = v130 and v4.createElement(v47), 
            LookDetailsBottomBar = not v130 and v4.createElement(v46, {
                hideDescriptor = true, 
                centered = v123.props.isTryOn and true or nil, 
                isTryOnFromOutsideAX = v123.props.isTryOn, 
                alwaysBuyAll = l_FFlagAXMISEnableMultiShopping_0 and not v123.props.isTryOn or false
            })
        }), 
        TopFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Size_50_0), 
            Position = UDim2.new(0, 0, 1, -v126), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }), 
        Gradient = if v127 and v123.props.showPeekViewInSuperBrief then nil else v4.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
            Position = UDim2.new(0, 0, 1, -v126 - l_Size_50_0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        })
    });
end;
v82.renderTopContent = function(v131, v132, v133, v134) --[[ Line: 443 ]] --[[ Name: renderTopContent ]]
    -- upvalues: v37 (copy), v4 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ImageSetButton_0 (copy), l_Focusable_0 (copy), v78 (copy), l_CursorKind_0 (copy), v68 (copy)
    local l_Theme_1 = v132.Theme;
    local l_Font_0 = v132.Font;
    local l_Size_450_0 = v132.Tokens.Global.Size_450;
    local l_Space_175_0 = v132.Tokens.Global.Space_175;
    local l_Space_50_0 = v132.Tokens.Global.Space_50;
    local v140 = v131.props.lookId == v37.DraftLookId;
    local v141 = if v140 and v131.props.isPortrait then v132.Tokens.Global.Space_500 else v132.Tokens.Global.Space_300;
    local v142 = if v140 then v4.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        iconSize = l_IconSize_0.Medium, 
        icon = l_Images_0["icons/navigation/close"], 
        position = UDim2.new(0, v132.Tokens.Global.Space_300, 0.5, 0), 
        onActivated = v131.onCloseButtonPressed, 
        anchorPoint = Vector2.new(0, 0.5)
    }) else nil;
    return v4.createFragment({
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v141)
        }), 
        CloseButton = if v140 then v142 else v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ImageSetButton_0 else l_Focusable_0[l_ImageSetButton_0], {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, l_Space_175_0, 0.5, 0), 
            Size = UDim2.fromOffset(l_Size_450_0 + l_Space_50_0, l_Size_450_0 + l_Space_50_0), 
            Image = v78, 
            ImageColor3 = l_Theme_1.SystemPrimaryDefault.Color, 
            ImageTransparency = l_Theme_1.SystemPrimaryDefault.Transparency, 
            [v4.Event.Activated] = v131.onCloseButtonPressed, 
            ref = v131.closeButtonRef, 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v131.itemsListRef, 
            SelectionImageObject = v134(l_CursorKind_0.RoundedRectNoInset)
        }), 
        Title = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_Size_450_0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Text = if v140 then if v68() then v133.previewHeader else "Preview" else "", 
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
v82.orderTryOns = function(v143, v144) --[[ Line: 506 ]] --[[ Name: orderTryOns ]]
    -- upvalues: v37 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v145 = {};
    for _, v147 in v144 do
        table.insert(v145, v147);
    end;
    if v143.props.lookId and v143.props.lookDetails then
        local l_lookDetails_0 = v143.props.lookDetails;
        if l_lookDetails_0 and (l_lookDetails_0.lookType == v37.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and l_lookDetails_0.lookType == v37.LookType.Makeup) then
            table.sort(v145, function(v149, v150) --[[ Line: 522 ]]
                if v149.itemRecency and v150.itemRecency then
                    return v149.itemRecency < v150.itemRecency;
                else
                    return false;
                end;
            end);
        end;
    end;
    return v145;
end;
v82.renderTryOnManagerContents = function(v151, v152, _, v154) --[[ Line: 535 ]] --[[ Name: renderTryOnManagerContents ]]
    -- upvalues: v37 (copy), v4 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v55 (copy), v45 (copy)
    local l_Theme_2 = v152.Theme;
    local l_Space_200_0 = v152.Tokens.Global.Space_200;
    local v157 = v151.props.lookId == v37.DraftLookId;
    local v158 = {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 20)
        })
    };
    if v151.props.lookDetails == nil then
        return v158;
    else
        local v159 = 1;
        v158["list-header-padding"] = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 5), 
            LayoutOrder = v159
        });
        v159 = v159 + 1;
        local v160 = v151:orderTryOns(v151.props.tryOnItems);
        local v161 = false;
        local l_v159_0 = v159;
        for v163, v164 in v160 do
            local v165 = nil;
            local v166 = nil;
            if l_v159_0 < v159 then
                v165 = v151.tryOnElementRefCache[v160[v163 - 1].itemId];
            elseif v154 then
                v165 = v151.closeButtonRef;
            end;
            v166 = if v159 < #v160 and v160[v163 + 1] then v151.tryOnElementRefCache[v160[v163 + 1].itemId] else if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v151.props.resolvedActionBarRef else v151.actionBarRef;
            local v167 = nil;
            if v164.itemType == v37.ItemType.Asset then
                v167 = v151.props.lookDetails.lookAssetInfos[v164.itemId];
            elseif v164.itemType == v37.ItemType.Bundle then
                v167 = v151.props.lookDetails.lookBundleInfos[v164.itemId];
            else
                continue;
            end;
            local v168 = v55.isItemSelectable(v167);
            if v163 > 1 and v161 ~= v168 then
                v158["divider-" .. v159] = v4.createElement("Frame", {
                    BackgroundColor3 = l_Theme_2.Divider.Color, 
                    BackgroundTransparency = l_Theme_2.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -(l_Space_200_0 * 2), 0, 1), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    LayoutOrder = v159
                });
                v159 = v159 + 1;
            end;
            if v167 then
                v158[v164.itemId] = v4.createElement(v45, {
                    tryOnItem = v164, 
                    itemInfo = v167, 
                    layoutOrder = v159, 
                    allowAutomaticPeekViewStateChanges = v151.props.lookId == nil, 
                    disableInteractions = v157, 
                    forceShowPrice = v157, 
                    horizontalPadding = l_Space_200_0, 
                    elementRef = v151.tryOnElementRefCache[v164.itemId], 
                    NextSelectionUp = v165, 
                    NextSelectionDown = v166
                });
                v159 = v159 + 1;
            end;
            v161 = v55.isItemSelectable(v167);
        end;
        return v158;
    end;
end;
v82.renderDetailsContents = function(v169) --[[ Line: 639 ]] --[[ Name: renderDetailsContents ]]
    -- upvalues: v4 (copy), v60 (copy), v67 (copy)
    return {
        LookDetails = v4.createElement(v60, {
            lookId = v169.props.lookId, 
            width = if v67() then nil else 500, 
            listPadding = v169.props.listPadding, 
            lookDetails = v169.props.lookDetails, 
            isTryOn = v169.props.isTryOn
        })
    };
end;
v82.renderWithProviders = function(v170, v171, v172, v173) --[[ Line: 654 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v37 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_PeekViewState_0 (copy), l_AvatarScreen_0 (copy), v69 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v48 (copy), v40 (copy), v44 (copy), v81 (copy), l_ImageSetButton_0 (copy), v79 (copy), v78 (copy), l_PeekView_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), v26 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v54 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v39 (copy), v8 (copy)
    local l_Theme_3 = v171.Theme;
    local l_Size_450_1 = v171.Tokens.Global.Size_450;
    local l_Space_175_1 = v171.Tokens.Global.Space_175;
    local l_Size_6000_0 = v171.Tokens.Global.Size_6000;
    local l_Size_600_0 = v171.Tokens.Global.Size_600;
    local l_Space_400_0 = v171.Tokens.Global.Space_400;
    local l_isTryOn_0 = v170.props.isTryOn;
    local v181 = if l_isTryOn_0 then UDim2.new(0.5, 0, 0, v170.props.topBarHeight) else UDim2.fromOffset(0, v170.props.topBarHeight);
    local v182 = UDim2.new(1, 0, 1, -v170.props.topBarHeight);
    if not v170.props.isPortrait then
        if not l_isTryOn_0 then
            v181 = UDim2.new(v37.LandscapeNavWidth, 0, 0, v170.props.topBarHeight);
        end;
        v182 = UDim2.new(v37.LandscapeSceneWidth, 0, 1, -v170.props.topBarHeight);
    end;
    local v183 = v170:getBriefViewHeight(v171);
    local v184 = if v170.props.lookId ~= nil then v170:getActionBarTotalHeight(v171) else nil;
    local v185 = v170:getActionBarTotalHeight(v171);
    local v189 = if l_FFlagAXHideMenuOnScroll_0 then v170.props.visibilityRatioBinding:map(function(v186) --[[ Line: 681 ]]
        -- upvalues: v170 (copy)
        local v187 = v170.scrollingFrameCanvasY or 0;
        local v188 = math.floor((1 - v186) * v187);
        return UDim2.new(0, 0, 0, v188);
    end) else nil;
    local v190 = v170.props.screenSize.Y - v170.props.topBarHeight - v170.props.globalGuiInset.bottom;
    local v191 = "none";
    if v170.props.peekViewState == l_PeekViewState_0.Full or v170.props.peekViewState == l_PeekViewState_0.Extended then
        v191 = "regular";
    end;
    local v192 = v170.state.isMouseAndKeyboard and v170.props.peekViewState == l_PeekViewState_0.Brief;
    local v193 = true;
    local v194 = v170.props.peekViewState == l_PeekViewState_0.SuperBrief;
    local v195 = v170.props.lookId == v37.DraftLookId;
    local v196 = v170.props.avatarRoute.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    if v195 and v170.props.peekViewState ~= l_PeekViewState_0.Closed then
        v191 = "regular";
    end;
    local v197 = true;
    if v170.props.peekViewState ~= l_PeekViewState_0.Full then
        v197 = v170.props.peekViewState == l_PeekViewState_0.Extended;
    end;
    if v170.props.isTryOn then
        v191 = "tryOn";
    end;
    if v193 and not v170.props.showPeekViewInSuperBrief then
        v193 = not v194;
    end;
    if v195 then
        v192 = false;
    end;
    local v198 = not v69 or v170.props.peekViewState == l_PeekViewState_0.Full;
    if v195 then
        v198 = false;
    end;
    if v170.props.isTryOn then
        v198 = false;
    end;
    local function v200(v199) --[[ Line: 737 ]]
        -- upvalues: v170 (copy)
        v170.props.setSelectedTab(v199);
    end;
    local l_detailsTabTitle_0 = v172.detailsTabTitle;
    local v202 = 0;
    if v170.props.tryOnItems then
        for _, _ in pairs(v170.props.tryOnItems) do
            v202 = v202 + 1;
        end;
    end;
    local v205 = v172.tryOnTabTitle:gsub("{numItems}", v202);
    local v206 = {
        {
            Title = l_detailsTabTitle_0, 
            Name = "Details"
        }, 
        {
            Title = v205, 
            Name = "TryOns"
        }
    };
    if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
        local l_createElement_0 = v4.createElement;
        local v208 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame;
        local v209 = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v182, 
            Position = v181, 
            AnchorPoint = if l_isTryOn_0 then Vector2.new(0.5, 0) else nil, 
            Visible = v170.props.fullView ~= v48.SceneFullView, 
            SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            ref = v170.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.props.resolvedActionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.props.namedRefs[v170.props.avatarRoute.opaque.name .. v40.ItemsList]
        };
        local v210 = {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v44, {
                focusController = v170.focusController, 
                captureFocusOnMount = true
            })
        };
        local v211 = false;
        if v191 == "tryOn" then
            v211 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = v197 and 0 or 1, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v170.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v170.props.topBarHeight), 
                BorderSizePixel = 0
            }, {
                TopContent = v4.createElement(v81, {
                    stylePalette = v171, 
                    showDropDownButton = v197, 
                    navigateBack = v170.navigateBack, 
                    onCloseButtonPressed = v170.onCloseButtonPressed, 
                    robuxBalanceRef = v170.robuxBalanceRef
                })
            });
        end;
        v210.LookDetailsTryOnTopBar = v211;
        v211 = false;
        if v191 == "regular" then
            v211 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v170.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v170.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v170:renderTopContent(v171, v172, v173)
            });
        end;
        v210.LookDetailsTopBar = v211;
        v210.CloseButton = v192 and v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Space_175_1, 1, -v170:getBriefViewHeight(v171) - if v170.props.isTryOn then l_Space_400_0 else l_Size_450_1), 
            Size = UDim2.new(0, if v170.props.isTryOn then l_Size_6000_0 else l_Size_450_1, 0, if v170.props.isTryOn then l_Size_600_0 else l_Size_450_1), 
            Image = if v170.props.isTryOn then v79 else v78, 
            ImageColor3 = l_Theme_3.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = v170.onCloseButtonPressed
        });
        v210.PeekViewContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = if l_FFlagAXHideMenuOnScroll_0 then v189 else nil, 
            ZIndex = 3, 
            ClipsDescendants = true
        }, {
            PeekView = v4.createElement(l_PeekView_0, {
                peekHeaderPositionYChange = if l_FFlagAXHideMenuOnScroll_0 then v170.peekHeaderPositionYChange else nil, 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v170.props.scrollingFrameRef else nil, 
                briefViewContentHeight = UDim.new(0, v183), 
                mountAnimation = v198, 
                mountAsFullView = false, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v170.viewStateChanged, 
                showDropShadow = not v170.props.isTryOn and v26(v170.props.peekViewState), 
                superBriefViewContentHeight = if v170.props.lookId ~= nil then UDim.new(0, v184) else nil, 
                stateOnMount = if v170.props.initialPeekViewState then v170.props.initialPeekViewState else if v170.props.lookId then v170.props.peekViewState else nil, 
                bottomDockedContainerHeight = v185, 
                bottomDockedContainerContent = v170:renderActionBar(v171), 
                backgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_3.BackgroundUIDefault.Transparency, 
                peekHeaderClose = false, 
                isScrollingEnabled = v193, 
                peekViewState = v170.props.peekViewState, 
                hideDraggerInSuperBrief = not v170.props.showPeekViewInSuperBrief, 
                customBackground = l_Theme_3.BackgroundDefault.Color, 
                minimizeToSuperBrief = v170.props.lookId ~= v37.DraftLookId
            }, v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ClipsDescendants = true, 
                [v4.Ref] = v170.props.resolvedFocusNavigationRef
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
                NavBar = if not l_FFlagAXMISEnableMultiShopping_0 or v195 or v196 or v170.props.isTryOn then v4.createElement(v54, {
                    layoutOrderMain = 1, 
                    navHeightMain = v37.LooksDetailsTabBarHeight, 
                    tabs = v206, 
                    selectedTabIndex = v170.props.selectedTab, 
                    selectTab = v200, 
                    NextSelectionUp = v170.props.NextSelectionUp, 
                    NextSelectionDown = v170.props.NextSelectionDown
                }) else nil, 
                DetailsContainer = if v170.props.selectedTab == 1 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v190), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v170:renderDetailsContents()) else nil, 
                TryOnManagerContainer = if v170.props.selectedTab == 2 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v190), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = v170.itemsListRef, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v170:renderTryOnManagerContents(v171, v172, v191 == "regular")) else nil
            }))
        });
        v210.LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v212) --[[ Line: 946 ]] --[[ Name: callback ]]
                -- upvalues: v39 (ref), v170 (copy)
                if v212 then
                    local v213 = v39.InputTypeMap[v212] == v39.InputType.MouseAndKeyboard;
                    if v213 ~= v170.state.isMouseAndKeyboard then
                        v170:setState({
                            isMouseAndKeyboard = v213
                        });
                    end;
                end;
            end
        });
        return l_createElement_0(v208, v209, v210);
    else
        local l_createElement_1 = v4.createElement;
        local v215 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame;
        local v217 = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v182, 
            Position = v181, 
            AnchorPoint = if l_isTryOn_0 then Vector2.new(0.5, 0) else nil, 
            Visible = v170.props.fullView ~= v48.SceneFullView, 
            ref = v170.frameRef, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.focusController, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.actionBarRef, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170.props.namedRefs[v170.props.avatarRoute.opaque.name .. v40.ItemsList], 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 979 ]]
                    -- upvalues: v170 (copy)
                    v170.navigateBack();
                end), 
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 983 ]]
                    -- upvalues: v170 (copy), l_PeekViewState_0 (ref)
                    local l_peekViewState_0 = v170.props.peekViewState;
                    if l_peekViewState_0 == l_PeekViewState_0.Full or l_peekViewState_0 == l_PeekViewState_0.Extended then
                        v170.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v170.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }
        };
        local v218 = {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v44, {
                focusController = v170.focusController, 
                captureFocusOnMount = true
            })
        };
        local v219 = false;
        if v191 == "tryOn" then
            v219 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = v197 and 0 or 1, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v170.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v170.props.topBarHeight), 
                BorderSizePixel = 0
            }, {
                TopContent = v4.createElement(v81, {
                    stylePalette = v171, 
                    showDropDownButton = v197, 
                    navigateBack = v170.navigateBack, 
                    onCloseButtonPressed = v170.onCloseButtonPressed, 
                    robuxBalanceRef = v170.robuxBalanceRef
                })
            });
        end;
        v218.LookDetailsTryOnTopBar = v219;
        v219 = false;
        if v191 == "regular" then
            v219 = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                Size = UDim2.new(1, 0, 0, v170.props.topBarHeight), 
                Position = UDim2.fromOffset(0, -v170.props.topBarHeight), 
                BorderSizePixel = 0, 
                Active = true
            }, {
                TopContent = v170:renderTopContent(v171, v172, v173)
            });
        end;
        v218.LookDetailsTopBar = v219;
        v218.CloseButton = v192 and v4.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Space_175_1, 1, -v170:getBriefViewHeight(v171) - if v170.props.isTryOn then l_Space_400_0 else l_Size_450_1), 
            Size = UDim2.new(0, if v170.props.isTryOn then l_Size_6000_0 else l_Size_450_1, 0, if v170.props.isTryOn then l_Size_600_0 else l_Size_450_1), 
            Image = if v170.props.isTryOn then v79 else v78, 
            ImageColor3 = l_Theme_3.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = v170.onCloseButtonPressed
        });
        v218.PeekViewContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 3, 
            Position = if l_FFlagAXHideMenuOnScroll_0 then v189 else nil, 
            ClipsDescendants = true
        }, {
            PeekView = v4.createElement(l_PeekView_0, {
                peekHeaderPositionYChange = if l_FFlagAXHideMenuOnScroll_0 then v170.peekHeaderPositionYChange else nil, 
                scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v170.props.scrollingFrameRef else nil, 
                briefViewContentHeight = UDim.new(0, v183), 
                mountAnimation = v198, 
                mountAsFullView = false, 
                canDragFullViewToBrief = true, 
                showDraggerInClosedState = false, 
                returnToFullView = true, 
                thumbstickScrollEnabled = true, 
                viewStateChanged = v170.viewStateChanged, 
                showDropShadow = not v170.props.isTryOn and v26(v170.props.peekViewState), 
                superBriefViewContentHeight = if v170.props.lookId ~= nil then UDim.new(0, v184) else nil, 
                stateOnMount = if v170.props.initialPeekViewState then v170.props.initialPeekViewState else if v170.props.lookId then v170.props.peekViewState else nil, 
                bottomDockedContainerHeight = v185, 
                bottomDockedContainerContent = v170:renderActionBar(v171), 
                shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                backgroundColor3 = l_Theme_3.BackgroundDefault.Color, 
                backgroundTransparency = l_Theme_3.BackgroundUIDefault.Transparency, 
                peekHeaderClose = false, 
                isScrollingEnabled = v193, 
                peekViewState = v170.props.peekViewState, 
                hideDraggerInSuperBrief = not v170.props.showPeekViewInSuperBrief, 
                customBackground = l_Theme_3.BackgroundDefault.Color, 
                minimizeToSuperBrief = v170.props.lookId ~= v37.DraftLookId
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
                NavBar = if not l_FFlagAXMISEnableMultiShopping_0 or v195 or v196 or v170.props.isTryOn then v4.createElement(v54, {
                    layoutOrderMain = 1, 
                    navHeightMain = v37.LooksDetailsTabBarHeight, 
                    tabs = v206, 
                    selectedTabIndex = v170.props.selectedTab, 
                    selectTab = v200, 
                    NextSelectionUp = v170.props.NextSelectionUp, 
                    NextSelectionDown = v170.props.NextSelectionDown
                }) else nil, 
                DetailsContainer = if v170.props.selectedTab == 1 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v190), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v170:renderDetailsContents()) else nil, 
                TryOnManagerContainer = if v170.props.selectedTab == 2 then v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v190), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = v170.itemsListRef, 
                    restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                }, v170:renderTryOnManagerContents(v171, v172, v191 == "regular")) else nil
            })
        });
        v218.LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v220) --[[ Line: 1149 ]] --[[ Name: callback ]]
                -- upvalues: v39 (ref), v170 (copy)
                if v220 then
                    local v221 = v39.InputTypeMap[v220] == v39.InputType.MouseAndKeyboard;
                    if v221 ~= v170.state.isMouseAndKeyboard then
                        v170:setState({
                            isMouseAndKeyboard = v221
                        });
                    end;
                end;
            end
        });
        return l_createElement_1(v215, v217, v218);
    end;
end;
v82.render = function(v222) --[[ Line: 1164 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v68 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v223) --[[ Line: 1165 ]]
        -- upvalues: l_withLocalization_0 (ref), v68 (ref), l_withSelectionCursorProvider_0 (ref), v222 (copy)
        return l_withLocalization_0({
            detailsTabTitle = "Feature.Catalog.Label.Details", 
            tryOnTabTitle = "Feature.Catalog.Label.TryOnsMultiple", 
            previewHeader = v68() and "Feature.Avatar.Title.Preview" or nil
        })(function(v224) --[[ Line: 1170 ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v222 (ref), v223 (copy)
            return l_withSelectionCursorProvider_0(function(v225) --[[ Line: 1171 ]]
                -- upvalues: v222 (ref), v223 (ref), v224 (copy)
                return v222:renderWithProviders(v223, v224, v225);
            end);
        end);
    end);
end;
v82.didUpdate = function(v226, v227, _) --[[ Line: 1178 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_PeekViewState_0 (copy), l_wasLastInputGamepad_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy)
    if v227.lookId and not v226.props.lookId then
        v226.onPeekViewClosed();
        v226.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
    end;
    if not l_wasLastInputGamepad_0() then
        return;
    else
        if v226.props.peekViewState ~= v227.peekViewState and v226.props.peekViewState ~= l_PeekViewState_0.Closed then
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v226.focusController.captureFocus();
            end;
            if v226.props.peekViewState == l_PeekViewState_0.Brief then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    local v229 = if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v226.props.resolvedActionBarRef.current else v226.actionBarRef.current;
                    if v226.props.focusGuiObject and v229 then
                        v226.props.focusGuiObject(v229);
                        return;
                    end;
                else
                    v226.focusController.moveFocusTo(if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then v226.props.resolvedActionBarRef else v226.actionBarRef);
                end;
            end;
        end;
        return;
    end;
end;
local function v238(v230, v231) --[[ Line: 1218 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v52 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v84 (copy), v53 (copy)
    local v232 = v52(v230);
    local l_name_0 = v231.avatarRoute.opaque.name;
    local v234 = if l_FFlagAXMISEnableMultiShopping_0 and l_FFlagAXCatalogMakeupSupport_0 then v84(v230) else v230.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    local l_Looks_1 = v230.AvatarExperience.AvatarScene.Looks;
    local v236 = l_Looks_1 and v234 and l_Looks_1[v234];
    local l_TryOnItems_0 = v230.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return {
        isPortrait = v232, 
        topBarHeight = v230.TopBar.topBarHeight, 
        tryOnItems = l_TryOnItems_0, 
        lookId = v234, 
        lookDetails = v236, 
        globalGuiInset = v230.GlobalGuiInset, 
        screenSize = v230.ScreenSize, 
        fullView = v53(v230, l_name_0), 
        boundInputs = v230.GamepadBottomBar.boundInputs, 
        peekViewState = v230.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        selectedTab = v230.AvatarExperience.Common.ItemDetailsPeekView.lookDetailsSelectedTab
    };
end;
local function v249(v239) --[[ Line: 1244 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v41 (copy), v42 (copy), v43 (copy), v56 (copy), v61 (copy)
    return {
        removeUnselectedItemsFromTryOn = function() --[[ Line: 1246 ]] --[[ Name: removeUnselectedItemsFromTryOn ]]
            -- upvalues: v239 (copy), v41 (ref)
            return v239(v41());
        end, 
        removeLookItemsFromTryOn = function(v240, v241) --[[ Line: 1250 ]] --[[ Name: removeLookItemsFromTryOn ]]
            -- upvalues: v239 (copy), v42 (ref)
            if v240 and v241 then
                local v242 = {};
                for v243 in v241.lookAssetInfos do
                    table.insert(v242, v243);
                end;
                local v244 = {};
                for v245 in v241.lookBundleInfos do
                    table.insert(v244, v245);
                end;
                return v239(v42(v240, v242, v244));
            else
                return;
            end;
        end, 
        setTryOnManagerPeekViewState = function(v246) --[[ Line: 1266 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v239 (copy), v43 (ref)
            v239(v43(v246));
        end, 
        setSelectedTab = function(v247) --[[ Line: 1270 ]] --[[ Name: setSelectedTab ]]
            -- upvalues: v239 (copy), v56 (ref)
            return v239(v56(v247));
        end, 
        closeFocusedScreen = function(v248) --[[ Line: 1274 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v239 (copy), v61 (ref)
            v239(v61(v248));
        end
    };
end;
v82 = v50((v49((l_RoactServices_0.connect({
    catalogAnalytics = v36
})(v82)))));
v82 = v7.connect(v238, v249)(v82);
local function v272(v250) --[[ Line: 1289 ]] --[[ Name: LookDetailsPeekViewContainer ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v16 (copy), v3 (copy), l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_selectTryOnsLookId_0 (copy), v88 (copy), v92 (copy), v86 (copy), v42 (copy), v41 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_PeekViewState_0 (copy), v43 (copy), v100 (copy), l_AvatarScreen_0 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v4 (copy), v82 (ref), v12 (copy)
    local v251 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v252 = nil;
    local v253 = nil;
    local v254 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v255 = l_useAnimatedVisibility_0();
        v254 = if v255 then v16.useSignalBinding(v255.animatedMenusStore.getVisibilityRatio) else v3.createBinding(1);
    end;
    if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
        local v256 = l_useDispatch_0();
        local v257 = l_useSelector_0(if l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 then l_selectTryOnsLookId_0 else v88);
        local v258 = l_useSelector_0(v92);
        local v259 = l_useSelector_0(v86);
        local l_v257_0 = v257 --[[ copy: 7 -> 14 ]];
        local l_v256_0 = v256 --[[ copy: 6 -> 15 ]];
        local v266 = v3.useCallback(function() --[[ Line: 1316 ]]
            -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (ref), v250 (copy), l_v257_0 (copy), v258 (copy), l_v256_0 (copy), v42 (ref), v41 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
            if not l_FFlagAXMISEnableMultiShopping_0 or v250.isTryOn then
                if l_v257_0 ~= nil and v258 then
                    local v262 = {};
                    for v263 in v258.lookAssetInfos do
                        table.insert(v262, v263);
                    end;
                    local v264 = {};
                    if v258.lookBundleInfos then
                        for v265 in v258.lookBundleInfos do
                            table.insert(v264, v265);
                        end;
                    end;
                    l_v256_0(v42(l_v257_0, v262, v264));
                else
                    l_v256_0(v41());
                end;
            end;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v250.navigation.goBack();
            end;
        end, {
            v250.navigation, 
            v256, 
            v257, 
            v258
        });
        local v267 = v3.useCallback(function() --[[ Line: 1340 ]]
            -- upvalues: v259 (copy), l_PeekViewState_0 (ref), l_v256_0 (copy), v43 (ref)
            if v259 == l_PeekViewState_0.Full or v259 == l_PeekViewState_0.Extended then
                l_v256_0(v43(l_PeekViewState_0.Brief));
                return;
            else
                l_v256_0(v43(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v259, 
            v256
        });
        local v268 = v100(v250.namedRefs[l_AvatarScreen_0.LookDetails], v266, v267);
        v252 = l_useTableWrappedCallbackRef_0(v268);
        local v269 = v100(nil, v266, v267);
        v253 = l_useTableWrappedCallbackRef_0(v269);
    end;
    local v270 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v271 = nil;
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        v271 = v3.useRef(nil);
        l_useAXAnimateScrollFrame_0(v271);
    end;
    return v4.createElement(v82, v12.Dictionary.join({
        is10ftUI = v251, 
        resolvedFocusNavigationRef = v252, 
        resolvedActionBarRef = v253, 
        focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v270 else nil, 
        scrollingFrameRef = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then v271 else nil, 
        visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v254 else nil
    }, v250));
end;
if l_FFlagAXMigrateLookDetailsPeekViewToFocusNavigation_0 then
    return v49(v272);
else
    return v272;
end;