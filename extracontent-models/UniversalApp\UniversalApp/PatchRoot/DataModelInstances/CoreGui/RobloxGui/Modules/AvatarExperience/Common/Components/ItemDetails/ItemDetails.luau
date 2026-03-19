local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local v10 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v18 = require(l_CorePackages_0.Packages.t);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_withStyle_0 = v9.Style.withStyle;
local v23 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local _ = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v23.FocusNavigationEventNameEnum;
local l_ShimmerPanel_0 = v9.App.Loading.ShimmerPanel;
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v33 = require(l_Common_0.Thunks.CloseFocusedScreen);
local _ = require(l_Common_0.AvatarExperienceState);
local v35 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v36 = require(l_Common_0.Constants);
local v37 = require(l_Common_0.Utils);
local v38 = require(l_Common_0.Components.BoundInputsUpdater);
local v39 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer);
local v40 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer_DEPRECATED);
local v41 = require(l_Common_0.Components.ItemDetails.PeekViewTopBar);
local v42 = require(l_Common_0.Components.ItemDetails.VRItemDetailsTopBar);
local v43 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v44 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v45 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v45.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v45.Enums.AvatarScreen;
local l_AvatarRoute_0 = v45.AvatarRoute.AvatarRoute;
local v49 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local v50 = require(l_Common_0.Validators.ItemDataValidator);
local v51 = require(l_Common_0.Selectors.selectIsPortrait);
local v52 = require(l_Common_0.Thunks.CloseAllPeekViews);
local v53 = require(l_Common_0.Thunks.CloseAllItemDetails);
local v54 = require(l_Common_0.Selectors.ItemData);
local v55 = require(l_Common_0.Actions.SetItemDetailsExpanded);
local v56 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v57 = require(l_Common_0.Components.ItemDetails.ItemDetailsPeekView);
local v58 = require(l_Common_0.Components.ItemDetails.ItemDetailsModal);
local v59 = require(l_Common_0.Components.ItemDetails.ItemDetailsFull);
local v60 = require(l_Common_0.Components.withLastInputGroup);
local v61 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails");
local v62 = require(l_Common_0.Thunks.OpenItemPrompt);
local v63 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v64 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v66 = require(l_Common_0.Components.ItemDetails.useItemDetailsFocusNavigationBindings);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v68 = require(l_Catalog_0.Services.Analytics);
local v69 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v70 = require(l_Catalog_0.CatalogConstants);
local v71 = require(l_Catalog_0.Thunks.RedeemQRCodeItem);
local v72 = require(l_Catalog_0.Actions.SetItemTryOnPeekViewState);
local v73 = require(l_Catalog_0.Components.OnFocusExposureLogger);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v75 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v76 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v77 = require(l_Flags_0.AvatarMarketplaceBackendIXPTests);
local v78 = require(l_Flags_0.FFlagQRCodeItemRedemptionEnabled);
local v79 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableItemDetailsPageLayerExposure);
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v81 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v76.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXMISEnableMultiShopping_0 = v75.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v86 = game:DefineFastFlag("AXExternalItemDetailsOverlay", false);
local v87 = game:DefineFastFlag("AXItemDetailsShouldNotHaveQuickMenuButton", false);
local v88 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXPeekViewContentShouldNotBeSelectable", false);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportWithPostPurchaseFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportWithPostPurchaseFix;
local l_FFlagAXTryOnScreenImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXTryOnScreenImprovements;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v76.FFlagAXFixPurchaseSurfaceLogging;
local v93 = game:DefineFastFlag("FixSelectedTimedOptionDaysAccess", false);
local v94 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v94 = 4;
end;
local v95 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v20.InformationMessage
};
local v96 = l_GuiService_0:IsTenFootInterface();
local function v98(v97) --[[ Line: 160 ]]
    return v97.AvatarExperience.Common.ItemDetailsExpanded;
end;
local function v100(v99) --[[ Line: 164 ]]
    -- upvalues: l_FormFactor_0 (copy)
    return v99.FormFactor == l_FormFactor_0.WIDE;
end;
local v101 = v4.PureComponent:extend("ItemDetails");
v101.validateProps = v18.strictInterface({
    itemId = v18.string, 
    itemType = v18.string, 
    itemSubType = v18.optional(v18.string), 
    isFirstItemDetails = v18.optional(v18.boolean), 
    fromContentFeed = v18.optional(v18.boolean), 
    fromProfile = v18.optional(v18.boolean), 
    showDropDownTopBar = v18.optional(v18.boolean), 
    showRobuxBalance = v18.optional(v18.boolean), 
    fromHome = if l_FFlagAXTryOnScreenImprovements_0 then nil else v18.optional(v18.boolean), 
    simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v18.optional(v18.boolean) else nil, 
    hideTab = if l_FFlagAXTryOnScreenImprovements_0 then v18.optional(v18.boolean) else nil, 
    shouldNavigateDown = if l_FFlagAXTryOnScreenImprovements_0 then v18.optional(v18.boolean) else nil, 
    fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v18.optional(v18.number) else nil, 
    itemSubTypeName = v18.optional(v18.string), 
    mountAsFullView = v18.optional(v18.boolean), 
    assetType = v18.optional(v18.string), 
    mountAnimation = v18.optional(v18.boolean), 
    itemDetailsPeekViewRefs = v18.optional(v18.table), 
    resultsListRef = v18.optional(v18.table), 
    detail = v18.optional(v18.string), 
    prevNavPage = v18.optional(v18.string), 
    prevNavHistory = v18.optional(v18.table), 
    showFullWithNoPeekView = v18.optional(v18.boolean), 
    widgetInfo = v18.optional(v18.table), 
    onItemDetailsClosed = v18.optional(v18.callback), 
    itemDetailsExpanded = v18.boolean, 
    actionBarContainerRef = v18.table, 
    contentFrameRef = v18.table, 
    navigation = v18.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    isSceneFullView = v18.boolean, 
    itemData = v18.optional(v50), 
    peekViewShowing = v18.boolean, 
    topBarHeight = v18.number, 
    playerMembership = v18.optional(v18.enum(Enum.MembershipType)), 
    lastInputGroup = v18.string, 
    itemDetailsTryOnViewState = v18.any, 
    itemDetailsViewState = v18.any, 
    screenSize = v18.Vector2, 
    globalGuiInset = v18.table, 
    wideMode = v18.boolean, 
    closeAllPeekViews = v18.callback, 
    closeFiltersAndItemDetails = v18.callback, 
    closeFocusedScreen = v18.callback, 
    setItemDetailsExpanded = v18.callback, 
    setCurrentToastMessage = v18.callback, 
    openItemPrompt = v18.callback, 
    redeemQRCodeItemPrompt = v18.callback, 
    setItemDetailsPeekViewState = v18.callback, 
    setItemTryOnPeekViewState = v18.callback, 
    isPortrait = v18.optional(v18.boolean), 
    networking = v18.callback, 
    analytics = v18.table, 
    peekViewFullViewEnabled = v18.boolean, 
    showPremiumContent = v18.boolean, 
    overlayClosedCallback = v18.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v18.table
});
v101.init = function(v102) --[[ Line: 242 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v80 (copy), l_FFlagAXDurablesSupport_0 (copy), v95 (copy), l_memoize_0 (copy), l_PeekViewState_0 (copy)
    v102.actionBarHeaderRef = v4.createRef();
    v102.backButtonRef = v4.createRef();
    local v103 = if v80() then {
        scrollingEnabled = true
    } else nil;
    if l_FFlagAXDurablesSupport_0 and v102.props.itemData and v102.props.itemData.timedOptions then
        for _, v105 in v102.props.itemData.timedOptions do
            if v105.selected then
                local l_days_0 = v105.days;
                if l_days_0 == 0 then
                    l_days_0 = nil;
                end;
                v103.selectedTimedOptionDays = l_days_0;
                break;
            end;
        end;
    end;
    v102.state = v103;
    if v102.props.showRobuxBalance then
        v102.robuxBalanceRef = v4.createRef();
    end;
    if l_FFlagAXDurablesSupport_0 then
        v102.timedOptionDeeplinkUpdated = false;
        v102.onTimedOptionSelected = function(v107) --[[ Line: 272 ]]
            -- upvalues: v102 (copy), v4 (ref)
            local v108 = v102.props.itemData.timedOptions[v107] and v102.props.itemData.timedOptions[v107].days or 0;
            if v108 == 0 then
                v108 = v4.None;
            end;
            v102:setState({
                selectedTimedOptionDays = v108
            });
        end;
    end;
    v102.closeBriefView = function() --[[ Line: 284 ]]
        -- upvalues: v102 (copy)
        local l_analytics_0 = v102.props.analytics;
        local l_itemId_0 = v102.props.itemId;
        local l_itemType_0 = v102.props.itemType;
        l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        v102.props.closeFiltersAndItemDetails(v102.props.navigation);
    end;
    v102.onItemInvalid = function() --[[ Line: 295 ]]
        -- upvalues: v102 (copy), v95 (ref)
        if v102.isMounted then
            v102.closeBriefView();
            v102.props.setCurrentToastMessage(v95);
        end;
    end;
    v102.renderContentCallback = function() --[[ Line: 302 ]]
        -- upvalues: v102 (copy)
        return v102:renderContent();
    end;
    v102.getRenderTopBarCallback = l_memoize_0(function(v112) --[[ Line: 306 ]]
        -- upvalues: v102 (copy)
        return function() --[[ Line: 307 ]]
            -- upvalues: v102 (ref), v112 (copy)
            return v102:renderTopBar(v112);
        end;
    end);
    v102.getRenderActionBarCallback = l_memoize_0(function(v113, v114, v115, v116, v117) --[[ Line: 313 ]]
        -- upvalues: v102 (copy)
        return function() --[[ Line: 314 ]]
            -- upvalues: v102 (ref), v113 (copy), v114 (copy), v115 (copy), v116 (copy), v117 (copy)
            return v102:renderActionBar(v113, v114, v115, v116, v117);
        end;
    end);
    v102.setPeekViewState = function(v118) --[[ Line: 326 ]]
        -- upvalues: v102 (copy)
        if v102:getIsTryOnPage() then
            v102.props.setItemTryOnPeekViewState(v118);
            return;
        else
            v102.props.setItemDetailsPeekViewState(v118);
            return;
        end;
    end;
    v102.closePeekView = function() --[[ Line: 336 ]]
        -- upvalues: v102 (copy), l_PeekViewState_0 (ref)
        v102.setPeekViewState(l_PeekViewState_0.Brief);
    end;
    if v80() then
        v102.setItemDetailsScrollingEnabled = function(v119) --[[ Line: 341 ]]
            -- upvalues: v102 (copy)
            v102:setState({
                scrollingEnabled = v119
            });
        end;
    end;
end;
v101.getBriefViewHeight = function(v120) --[[ Line: 349 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: v19 (copy), v96 (copy), v70 (copy)
    local v121 = 0;
    if v120.props.lastInputGroup == v19.InputType.Gamepad and v96 then
        v121 = v19.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return v70.ActionBar.ActionBarHeight + v70.ActionBar.ActionBarGradientHeight + v121 + 20;
end;
v101.renderTopBar = function(v122, v123) --[[ Line: 361 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), v4 (copy), l_IsVRAppBuild_0 (copy), v42 (copy), v41 (copy), v88 (copy)
    local l_Theme_0 = v123.Theme;
    local l_fromProfile_0 = v122.props.fromProfile;
    local l_topBarHeight_0 = v122.props.topBarHeight;
    local v127 = nil;
    if v122.props.itemData then
        v127 = v122.props.itemData.name;
    end;
    local v128 = nil;
    v128 = if v122:getIsTryOnPage() then v122.props.itemDetailsTryOnViewState else v122.props.itemDetailsViewState;
    local v129 = nil;
    v129 = l_fromProfile_0 and 0 or v122.props.showDropDownTopBar and (not (v128 ~= l_PeekViewState_0.Full) or l_FFlagAXEnableHomeTryOnComplexView_0 and v128 == l_PeekViewState_0.Extended) and 0 or 1;
    return v4.createElement("Frame", {
        BackgroundTransparency = v129, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v122.topBarNavVisible
    }, {
        TopBar = if l_IsVRAppBuild_0() then v4.createElement(v42, {
            topBarHeight = l_topBarHeight_0, 
            title = v127, 
            closeFocusedScreen = v122.props.closeFocusedScreen, 
            navigation = v122.props.navigation
        }) else v4.createElement(v41, {
            [v4.Ref] = v122.backButtonRef, 
            NextSelectionDown = if v88 then nil else v122.props.contentFrameRef, 
            itemId = v122.props.itemId, 
            itemType = v122.props.itemType, 
            itemData = v122.props.itemData, 
            dropDownTopBar = v122.props.showDropDownTopBar, 
            peekViewState = v128, 
            closePeekView = v122.closePeekView, 
            showRobuxBalance = v122.props.showRobuxBalance
        })
    });
end;
v101.renderActionBar = function(v130, _, v132, v133, v134, v135) --[[ Line: 424 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v69 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v94 (ref), l_ShimmerPanel_0 (copy)
    local l_itemId_1 = v130.props.itemId;
    local l_itemType_1 = v130.props.itemType;
    local l_Theme_1 = v132.Theme;
    local l_Font_0 = v132.Font;
    local v140 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v141 = v134 and v134.name;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v143 = nil;
    v143 = if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 then v130.state.selectedTimedOptionDays else v135;
    return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v133), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v4.Ref] = v130.props.actionBarContainerRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v130.props.contentFrameRef
    }, {
        BuyActionBar = v4.createElement(v69, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            showTimedOptionInBuyButton = l_FFlagAXDurablesSupport_0 and v134 and v134.timedOptions and true or nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v134 and v134.timedOptions and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v130.state then v143 else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v130.onTimedOptionSelected else nil, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v94 else nil, 
            ZIndex = 1
        }), 
        ActionBarHeader = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v140), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v4.Ref] = v130.actionBarHeaderRef
        }, {
            NameLabel = v141 and v4.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v140), 
                Text = v141, 
                TextSize = v140, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v4.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 0, v140)
            })
        })
    });
end;
v101.renderContent = function(v144) --[[ Line: 498 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 (copy), v39 (copy), v40 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v80 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_itemId_2 = v144.props.itemId;
    local l_itemType_2 = v144.props.itemType;
    local l_itemSubType_0 = v144.props.itemSubType;
    local l_itemDetailsPeekViewRefs_0 = v144.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v144.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v144.props.peekViewFullViewEnabled;
    local l_assetType_0 = v144.props.assetType;
    local v152 = v144:getIsTryOnPage();
    if not l_itemId_2 then
        return nil;
    else
        local v153 = if l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 then v39 else v40;
        return v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v153 else l_Focusable_0[v153], {
            actionBarHeaderRef = v144.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_2, 
            itemType = l_itemType_2, 
            itemSubType = l_itemSubType_0, 
            assetType = l_assetType_0, 
            onItemInvalid = v144.onItemInvalid, 
            showFullWithNoPeekView = v144.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v144:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144:getFocusController(), 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144.props.actionBarContainerRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144.backButtonRef, 
            ref = if v144.props.showFullWithNoPeekView then v144.props.contentFrameRef else nil, 
            setItemDetailsScrollingEnabled = if v80() then v144.setItemDetailsScrollingEnabled else nil, 
            simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v144.props.simpleView else if l_FFlagAXEnableHomeTryOnComplexView_0 then v152 and not v144.props.fromHome else nil, 
            onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v144.onTimedOptionSelected else nil
        });
    end;
end;
v101.getIsTryOnPage = function(v154) --[[ Line: 542 ]] --[[ Name: getIsTryOnPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v154.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
end;
v101.getItemDetailsComponent = function(v155, v156) --[[ Line: 546 ]] --[[ Name: getItemDetailsComponent ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v59 (copy), v58 (copy), v57 (copy)
    if l_IsVRAppBuild_0() then
        return v59;
    elseif v156 then
        return v58;
    elseif v155.props.showFullWithNoPeekView then
        return v59;
    else
        return v57;
    end;
end;
v101.render = function(v157) --[[ Line: 560 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v158) --[[ Line: 561 ]]
        -- upvalues: l_withStyle_0 (ref), v157 (copy)
        return l_withStyle_0(function(v159) --[[ Line: 562 ]]
            -- upvalues: v157 (ref), v158 (copy)
            return v157:renderWithProviders(v158, v159);
        end);
    end);
end;
v101.renderWithProviders = function(v160, v161, v162) --[[ Line: 568 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v36 (copy), l_PeekViewState_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v43 (copy), v79 (copy), v73 (copy), v77 (copy), v81 (copy), v35 (copy), v38 (copy), v93 (copy), v80 (copy)
    local l_isSceneFullView_0 = v160.props.isSceneFullView;
    local l_itemId_3 = v160.props.itemId;
    local l_key_0 = v160.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v160.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v160.props.resultsListRef;
    local v168 = v160:getIsTryOnPage();
    local l_wideMode_0 = v160.props.wideMode;
    local v170 = if v168 then v160.props.itemDetailsTryOnViewState else v160.props.itemDetailsViewState;
    if not l_itemId_3 then
        return;
    else
        local l_fromProfile_1 = v160.props.fromProfile;
        local v172 = l_wideMode_0 and l_fromProfile_1 and not v168;
        local l_isPortrait_0 = v160.props.isPortrait;
        local v174 = true;
        local v175 = UDim2.fromScale(0, 0);
        local v176 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if l_fromProfile_1 or v168 then
                local l_screenSize_0 = v160.props.screenSize;
                local l_globalGuiInset_0 = v160.props.globalGuiInset;
                local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset;
                local v180 = math.min(l_Offset_0, 640);
                if v168 and v180 < l_Offset_0 then
                    v174 = false;
                end;
                v175 = UDim2.fromOffset((l_Offset_0 - v180) / 2, 0);
                v176 = UDim2.new(0, v180, 1, 0);
            else
                v175 = UDim2.fromScale(v36.LandscapeNavWidth, 0);
                v176 = UDim2.fromScale(v36.LandscapeSceneWidth, 1);
            end;
        end;
        local v181 = v160:getBriefViewHeight();
        local v182 = v160.props.mountAsFullView and (v170 == l_PeekViewState_0.Full or v170 == l_PeekViewState_0.Extended);
        local v183 = v160:getItemDetailsComponent(v172);
        return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v4.Ref] = l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v160:getFocusController(), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v182 and v160.props.contentFrameRef or v160.props.actionBarContainerRef, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v43, {
                focusController = v160:getFocusController()
            }), 
            ItemDetailsExposure = if v79() then nil else v4.createElement(v73, {
                ixpTest = v77.ItemDetailsPage
            }), 
            ItemDetails3DPreviewExposure = if v81.isEnabled() then v4.createElement(v73, {
                ixpTest = v81
            }) else nil, 
            NavigationEventsLogger = v4.createElement(v35, {
                pageName = "ItemDetails:" .. l_key_0
            }), 
            BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v38), 
            ItemDetailsContent = v4.createElement(v183, {
                renderBottomBar = v160.getRenderActionBarCallback(v161, v162, v181, v160.props.itemData, if v93 then if v160.state then v160.state.selectedTimedOptionDays else nil else v160.state.selectedTimedOptionDays), 
                renderContent = v160.renderContentCallback, 
                renderTopBar = v160.getRenderTopBarCallback(v162), 
                isTryOnPage = v168, 
                peekViewState = v170, 
                setPeekViewState = v160.setPeekViewState, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v160:getFocusController(), 
                actionBarContainerRef = v160.props.actionBarContainerRef, 
                contentFrameRef = v160.props.contentFrameRef, 
                closeBriefView = v160.closeBriefView, 
                viewPosition = v175, 
                viewSize = v176, 
                briefViewHeight = v181, 
                showDropShadow = v174, 
                analytics = v160.props.analytics, 
                avatarRoute = v160.props.avatarRoute, 
                closeAllPeekViews = v160.props.closeAllPeekViews, 
                closeFocusedScreen = v160.props.closeFocusedScreen, 
                fromProfile = v160.props.fromProfile, 
                itemDetailsExpanded = v160.props.itemDetailsExpanded, 
                itemId = v160.props.itemId, 
                itemType = v160.props.itemType, 
                lastInputGroup = v160.props.lastInputGroup, 
                mountAnimation = v160.props.mountAnimation, 
                mountAsFullView = v160.props.mountAsFullView, 
                navigation = v160.props.navigation, 
                peekViewFullViewEnabled = v160.props.peekViewFullViewEnabled, 
                peekViewShowing = v160.props.peekViewShowing, 
                setItemDetailsExpanded = v160.props.setItemDetailsExpanded, 
                topBarHeight = v160.props.topBarHeight, 
                scrollingEnabled = if v80() then v160.state.scrollingEnabled else nil
            })
        });
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v101.getFocusController = function(v184) --[[ Line: 709 ]] --[[ Name: getFocusController ]]
        return v184.props.focusController;
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v101.didUpdate = function(v185, v186, _) --[[ Line: 715 ]] --[[ Name: didUpdate ]]
        -- upvalues: v19 (copy), v61 (copy)
        local l_key_1 = v185.props.avatarRoute.current.key;
        local l_key_2 = v186.avatarRoute.current.key;
        local l_key_3 = v185.props.navigation.state.key;
        if v185.props.lastInputGroup == v19.InputType.Gamepad then
            if l_key_1 == l_key_3 and not v185.props.avatarRoute.isOverlayVisible and v186.avatarRoute.isOverlayVisible then
                v185:getFocusController().captureFocus();
            end;
            if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
                v61:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
                v185:getFocusController().captureFocus();
            end;
        end;
    end;
else
    v101.didUpdate = function(v191, v192, _) --[[ Line: 737 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy)
        if l_FFlagAXDurablesSupport_0 and not v191.timedOptionDeeplinkUpdated and v191.props.itemData and v191.props.itemData.timedOptions then
            for v194, v195 in v191.props.itemData.timedOptions do
                if v195.selected then
                    if v195.days == 0 then
                        local _ = nil;
                    end;
                    v191.onTimedOptionSelected(v194);
                    v191.timedOptionDeeplinkUpdated = true;
                    break;
                end;
            end;
        end;
        if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 and v191.props.itemData and v191.props.itemData.timedOptions and v191.props.itemData.isOwned and (not v192.itemData or not v192.itemData.isOwned) then
            for v197, v198 in v191.props.itemData.timedOptions do
                if v198.selected then
                    v191.onTimedOptionSelected(v197);
                    return;
                end;
            end;
        end;
    end;
end;
v101.didMount = function(v199) --[[ Line: 774 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v44 (copy), v19 (copy), v61 (copy), v78 (copy), l_PeekViewState_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v200 = v44.isFirstItemDetailsPage(v199.props.navigation);
        if v199.props.lastInputGroup == v19.InputType.Gamepad and not v200 then
            v61:debug("gamepad captureFocus: ItemDetails, didMount");
            v199:getFocusController().captureFocus();
        end;
    end;
    if v199.props.redeemQRCodeItem and v78 then
        v199.props.redeemQRCodeItemPrompt(v199.props.networking, v199.props.analytics, v199.props.itemId, v199.props.itemType);
    end;
    if v199.props.showFullWithNoPeekView then
        v199.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v199.isMounted = true;
end;
v101.willUnmount = function(v201) --[[ Line: 801 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy), v44 (copy), l_PeekViewState_0 (copy)
    v201.isMounted = false;
    local v202 = v201.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
    local v203 = v201.props.navigation.state.routeName == l_AvatarScreen_0.ItemDetails;
    local v204 = not (v202 and v203);
    if v44.isFirstItemDetailsPage(v201.props.navigation) and v204 then
        v201.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v201.props.onItemDetailsClosed ~= nil then
            v201.props.onItemDetailsClosed();
        end;
    end;
end;
local function v214(v205, v206) --[[ Line: 823 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v54 (copy), l_AvatarScreen_0 (copy), v37 (copy), l_FormFactor_0 (copy), v51 (copy)
    local l_itemId_4 = v206.itemId;
    local l_itemType_3 = v206.itemType;
    local v209 = v54(v205.AvatarExperience.Common, l_itemId_4, l_itemType_3);
    local l_key_4 = v206.navigation.state.key;
    local l_avatarRoute_0 = v206.avatarRoute;
    local l_key_5 = l_avatarRoute_0.current.key;
    local v213 = v206.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    if v213 and v209 ~= nil and v209.name == nil then
        v209 = nil;
    end;
    return {
        isSceneFullView = v37.getIsSceneFullViewFromState(v205, l_avatarRoute_0), 
        itemData = if v213 and v209 ~= nil and v209.name == nil then nil else v209, 
        wideMode = v205.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_key_5 == l_key_4, 
        topBarHeight = v37.getTopBarHeightAvatarScene(v205), 
        itemDetailsExpanded = v205.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = v205.Users[v205.LocalUserId] and v205.Users[v205.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v205.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v205.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v205.ScreenSize, 
        globalGuiInset = v205.GlobalGuiInset, 
        isPortrait = v51(v205)
    };
end;
local function v232(v215) --[[ Line: 860 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v52 (copy), v53 (copy), v33 (copy), v55 (copy), v27 (copy), v62 (copy), v71 (copy), v56 (copy), v72 (copy)
    return {
        closeAllPeekViews = function(v216) --[[ Line: 862 ]] --[[ Name: closeAllPeekViews ]]
            -- upvalues: v215 (copy), v52 (ref)
            v215(v52(v216));
        end, 
        closeFiltersAndItemDetails = function(v217) --[[ Line: 866 ]] --[[ Name: closeFiltersAndItemDetails ]]
            -- upvalues: v215 (copy), v53 (ref)
            v215(v53(v217));
        end, 
        closeFocusedScreen = function(v218) --[[ Line: 870 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v215 (copy), v33 (ref)
            v215(v33(v218));
        end, 
        setItemDetailsExpanded = function(v219) --[[ Line: 874 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v215 (copy), v55 (ref)
            v215(v55(v219));
        end, 
        setCurrentToastMessage = function(v220) --[[ Line: 878 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v215 (copy), v27 (ref)
            v215(v27(v220));
        end, 
        openItemPrompt = function(v221, v222, v223, v224, v225) --[[ Line: 882 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v215 (copy), v62 (ref)
            v215(v62(v221, v222, v223, v224, v225));
        end, 
        redeemQRCodeItemPrompt = function(v226, v227, v228, v229) --[[ Line: 886 ]] --[[ Name: redeemQRCodeItemPrompt ]]
            -- upvalues: v215 (copy), v71 (ref)
            v215(v71(v226, v227, v228, v229));
        end, 
        setItemDetailsPeekViewState = function(v230) --[[ Line: 890 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v215 (copy), v56 (ref)
            v215(v56(v230));
        end, 
        setItemTryOnPeekViewState = function(v231) --[[ Line: 894 ]] --[[ Name: setItemTryOnPeekViewState ]]
            -- upvalues: v215 (copy), v72 (ref)
            v215(v72(v231));
        end
    };
end;
v101 = v60(v101);
v101 = v49((v8.connect(v214, v232)(v101)));
v101 = l_RoactAppPolicy_0.connect(function(v233, _) --[[ Line: 906 ]]
    return {
        peekViewFullViewEnabled = v233.getItemDetailsFullView(), 
        showPremiumContent = v233.getShowCatalogPremiumContent()
    };
end)(v101);
return function(v235) --[[ Line: 913 ]] --[[ Name: ItemDetailsPageContainer ]]
    -- upvalues: l_useSelector_0 (copy), v98 (copy), v100 (copy), l_AvatarScreen_0 (copy), v14 (copy), v16 (copy), v68 (copy), l_useDispatch_0 (copy), v6 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v64 (copy), v63 (copy), l_FocusNavigationEventNameEnum_0 (copy), v72 (copy), v56 (copy), v44 (copy), v62 (copy), l_PeekViewState_0 (copy), v66 (copy), l_useTableWrappedCallbackRef_0 (copy), v10 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v86 (copy), v4 (copy), v87 (copy), v101 (ref)
    local v236 = l_useSelector_0(v98);
    local v237 = l_useSelector_0(v100);
    local l_fromProfile_2 = v235.navigation.state.params.fromProfile;
    local v239 = v235.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    local v240 = v237 and l_fromProfile_2 and not v239;
    local l_showFullWithNoPeekView_0 = v235.navigation.state.params.showFullWithNoPeekView;
    local l_itemId_5 = v235.navigation.state.params.itemId;
    local l_itemType_4 = v235.navigation.state.params.itemType;
    local v244 = v14(v16);
    local v245 = v14(v68);
    local v246 = l_useDispatch_0();
    local v247 = v6.useRef(nil);
    local v248 = v6.useRef(nil);
    local v249 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v235.focusController then
        v249 = v235.focusController;
    end;
    local v250 = v64(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v249);
    local v251 = v63({
        overlayClosedCallback = v250
    });
    local v252 = v6.useMemo(function() --[[ Line: 942 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v236 (copy)
        return {
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt, 
            [Enum.KeyCode.ButtonY] = if v236 then l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView else l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView, 
            [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
            [Enum.KeyCode.ButtonL2] = l_FocusNavigationEventNameEnum_0.MoveToItemDetails
        };
    end, {
        v236
    });
    local v254 = v6.useCallback(function(v253) --[[ Line: 954 ]]
        -- upvalues: v239 (copy), v246 (copy), v72 (ref), v56 (ref)
        if v239 then
            v246(v72(v253));
            return;
        else
            v246(v56(v253));
            return;
        end;
    end, {
        v246, 
        v239
    });
    local v255 = v6.useCallback(function() --[[ Line: 962 ]]
        -- upvalues: v44 (ref), v235 (copy)
        v44.closeFocusedScreen(v235.navigation);
    end, {
        v235.navigation
    });
    local v256 = v6.useCallback(function() --[[ Line: 966 ]]
        -- upvalues: v246 (copy), v62 (ref), v244 (copy), v245 (copy), v250 (copy), v235 (copy)
        v246(v62(v244, v245, v250, v235.navigation, v235.avatarRoute));
    end, {
        v246, 
        v244, 
        v245, 
        v250, 
        v235.navigation, 
        v235.avatarRoute
    });
    local v257 = v6.useCallback(function() --[[ Line: 970 ]]
        -- upvalues: v254 (copy), l_PeekViewState_0 (ref)
        v254(l_PeekViewState_0.Full);
    end, {
        v254
    });
    local v258 = v6.useCallback(function() --[[ Line: 974 ]]
        -- upvalues: v254 (copy), l_PeekViewState_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v249 (ref), v247 (copy)
        v254(l_PeekViewState_0.Brief);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v249.moveFocusTo(v247);
        end;
    end, {
        v254, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v249
    });
    local v259 = v6.useCallback(function() --[[ Line: 981 ]]
        -- upvalues: v235 (copy), l_AvatarScreen_0 (ref), l_itemId_5 (copy), l_itemType_4 (copy), v250 (copy), l_fromProfile_2 (copy), v239 (copy)
        v235.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
            itemId = l_itemId_5, 
            itemType = l_itemType_4, 
            onOverlayClosed = v250, 
            centered = l_fromProfile_2 or v239
        });
    end, {
        v235.navigation, 
        l_itemId_5, 
        l_itemType_4, 
        v250, 
        l_fromProfile_2, 
        v239
    });
    local v260 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useCallback(function() --[[ Line: 992 ]]
        -- upvalues: v249 (ref)
        v249.moveFocusUp();
    end, {
        v249
    });
    local v261 = {
        onGoBack = v255, 
        onOpenItemPrompt = v256, 
        onOpenPeekView = if not not v240 or l_showFullWithNoPeekView_0 or v236 then nil else v257, 
        onClosePeekView = if not (not not v240 or l_showFullWithNoPeekView_0) and v236 then v258 else nil, 
        onOpenCatalogContextMenu = if not l_showFullWithNoPeekView_0 then v259 else nil
    };
    local v262 = v66(v248, v252, v261);
    v248 = l_useTableWrappedCallbackRef_0(v262);
    v261.onMoveToItemDetails = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v260;
    local v263 = v66(v247, v252, v261);
    v263 = l_useTableWrappedCallbackRef_0(v263);
    local v264 = v10.Dictionary.join(v235, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v249, 
        actionBarContainerRef = v263, 
        contentFrameRef = v248, 
        overlayClosedCallback = v250, 
        networking = v244, 
        analytics = v245, 
        itemDetailsExpanded = v236
    });
    local v265 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v266 = l_useNavigation_0();
        local v267 = l_useAvatarRoute_0();
        local v268 = true;
        if v266.state.rnKey ~= v267.current.key then
            v268 = v86 and v266.state.key == v267.current.key;
        end;
        v265 = v268;
    end;
    return v4.createElement("Frame", {
        [v4.Ref] = if v87 then nil else v251, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v265 else nil
    }, {
        ItemDetails = v6.createElement(v101, v264)
    });
end;