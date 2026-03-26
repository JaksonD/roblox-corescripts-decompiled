local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.tutils);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v6.Focusable;
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v12 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v18 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v21 = require(l_CorePackages_0.Packages.t);
local v22 = require(l_Modules_0.LuaApp.Constants);
local v23 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_withStyle_0 = v10.Style.withStyle;
local v26 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local _ = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v26.FocusNavigationEventNameEnum;
local v29 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v35 = require(l_Common_0.Thunks.CloseFocusedScreen);
local _ = require(l_Common_0.AvatarExperienceState);
local v37 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v38 = require(l_Common_0.Constants);
local v39 = require(l_Common_0.Utils);
local v40 = require(l_Common_0.Components.BoundInputsUpdater);
local v41 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer);
local v42 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer_DEPRECATED);
local v43 = require(l_Common_0.Components.ItemDetails.PeekViewTopBar);
local v44 = require(l_Common_0.Components.ItemDetails.VRItemDetailsTopBar);
local v45 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v46 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local l_SetSelectedTimedOption_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).State.Actions.SetSelectedTimedOption;
local v48 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v48.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v48.Enums.AvatarScreen;
local l_AvatarRoute_0 = v48.AvatarRoute.AvatarRoute;
local v52 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local v53 = require(l_Common_0.Validators.ItemDataValidator);
local v54 = require(l_Common_0.Selectors.selectIsPortrait);
local v55 = require(l_Common_0.Thunks.CloseAllPeekViews);
local v56 = require(l_Common_0.Thunks.CloseAllItemDetails);
local v57 = require(l_Common_0.Thunks.ToggleTryOnThunk);
local v58 = require(l_Common_0.Thunks.CloseMatchingScreens);
local v59 = require(l_Common_0.Selectors.ItemData);
local v60 = require(l_Common_0.Actions.SetItemDetailsExpanded);
local v61 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v62 = require(l_Common_0.Components.ItemDetails.ItemDetailsPeekView);
local v63 = require(l_Common_0.Components.ItemDetails.ItemDetailsModal);
local v64 = require(l_Common_0.Components.ItemDetails.ItemDetailsFull);
local v65 = require(l_Common_0.Components.withLastInputGroup);
local v66 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails");
local v67 = require(l_Common_0.Thunks.OpenItemPrompt);
local v68 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v69 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_getTryOnItemReducerKey_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getTryOnItemReducerKey;
local v72 = require(l_Common_0.Components.ItemDetails.useItemDetailsFocusNavigationBindings);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v74 = require(l_Catalog_0.Services.Analytics);
local v75 = require(l_Catalog_0.CatalogUtils);
local v76 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v77 = require(l_Catalog_0.CatalogConstants);
local v78 = require(l_Catalog_0.Thunks.RedeemQRCodeItem);
local v79 = require(l_Catalog_0.Actions.SetItemTryOnPeekViewState);
local v80 = require(l_Catalog_0.Components.OnFocusExposureLogger);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v82 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v83 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v84 = require(l_Flags_0.AvatarMarketplaceBackendIXPTests);
local v85 = require(l_Flags_0.FFlagQRCodeItemRedemptionEnabled);
local v86 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableItemDetailsPageLayerExposure);
local v87 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v88 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v83.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXMISEnableMultiShopping_0 = v82.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v93 = game:DefineFastFlag("AXExternalItemDetailsOverlay", false);
local v94 = game:DefineFastFlag("AXItemDetailsShouldNotHaveQuickMenuButton", false);
local v95 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXPeekViewContentShouldNotBeSelectable", false);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXDurablesForMIS_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local l_FFlagAXDurablesSupportWithPostPurchaseFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportWithPostPurchaseFix;
local l_FFlagAXTryOnScreenImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXTryOnScreenImprovements;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v83.FFlagAXFixPurchaseSurfaceLogging;
local v101 = game:DefineFastFlag("FixSelectedTimedOptionDaysAccess", false);
local v102 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v102 = 4;
end;
local v103 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v23.InformationMessage
};
local v104 = l_GuiService_0:IsTenFootInterface();
local function v106(v105) --[[ Line: 171 ]]
    return v105.AvatarExperience.Common.ItemDetailsExpanded;
end;
local function v108(v107) --[[ Line: 175 ]]
    -- upvalues: l_FormFactor_0 (copy)
    return v107.FormFactor == l_FormFactor_0.WIDE;
end;
local v109 = v5.PureComponent:extend("ItemDetails");
v109.validateProps = v21.strictInterface({
    itemId = v21.string, 
    itemType = v21.string, 
    itemSubType = v21.optional(v21.string), 
    isFirstItemDetails = v21.optional(v21.boolean), 
    fromContentFeed = v21.optional(v21.boolean), 
    fromProfile = v21.optional(v21.boolean), 
    showDropDownTopBar = v21.optional(v21.boolean), 
    showRobuxBalance = v21.optional(v21.boolean), 
    fromHome = if l_FFlagAXTryOnScreenImprovements_0 then nil else v21.optional(v21.boolean), 
    simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v21.optional(v21.boolean) else nil, 
    hideTab = if l_FFlagAXTryOnScreenImprovements_0 then v21.optional(v21.boolean) else nil, 
    shouldNavigateDown = if l_FFlagAXTryOnScreenImprovements_0 then v21.optional(v21.boolean) else nil, 
    fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v21.optional(v21.number) else nil, 
    itemSubTypeName = v21.optional(v21.string), 
    mountAsFullView = v21.optional(v21.boolean), 
    assetType = v21.optional(v21.string), 
    mountAnimation = v21.optional(v21.boolean), 
    itemDetailsPeekViewRefs = v21.optional(v21.table), 
    resultsListRef = v21.optional(v21.table), 
    detail = v21.optional(v21.string), 
    prevNavPage = v21.optional(v21.string), 
    prevNavHistory = v21.optional(v21.table), 
    showFullWithNoPeekView = v21.optional(v21.boolean), 
    widgetInfo = v21.optional(v21.table), 
    onItemDetailsClosed = v21.optional(v21.callback), 
    itemDetailsExpanded = v21.boolean, 
    actionBarContainerRef = v21.table, 
    contentFrameRef = v21.table, 
    navigation = v21.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    isSceneFullView = v21.boolean, 
    itemData = v21.optional(v53), 
    peekViewShowing = v21.boolean, 
    topBarHeight = v21.number, 
    playerMembership = v21.optional(v21.enum(Enum.MembershipType)), 
    lastInputGroup = v21.string, 
    itemDetailsTryOnViewState = v21.any, 
    itemDetailsViewState = v21.any, 
    screenSize = v21.Vector2, 
    globalGuiInset = v21.table, 
    wideMode = v21.boolean, 
    numberOfTryOnItems = if l_FFlagAXDurablesForMIS_0 then v21.number else nil, 
    isCurrentItemInTryOns = if l_FFlagAXDurablesForMIS_0 then v21.boolean else nil, 
    closeAllPeekViews = v21.callback, 
    closeFiltersAndItemDetails = v21.callback, 
    closeFocusedScreen = v21.callback, 
    setItemDetailsExpanded = v21.callback, 
    setCurrentToastMessage = v21.callback, 
    openItemPrompt = v21.callback, 
    redeemQRCodeItemPrompt = v21.callback, 
    setItemDetailsPeekViewState = v21.callback, 
    setItemTryOnPeekViewState = v21.callback, 
    isPortrait = v21.optional(v21.boolean), 
    setSelectedTimedOption = if l_FFlagAXDurablesForMIS_0 then v21.callback else nil, 
    toggleTryOnThunk = if l_FFlagAXDurablesForMIS_0 then v21.callback else nil, 
    closeMatchingScreens = if l_FFlagAXDurablesForMIS_0 then v21.callback else nil, 
    networking = v21.callback, 
    analytics = v21.table, 
    peekViewFullViewEnabled = v21.boolean, 
    showPremiumContent = v21.boolean, 
    overlayClosedCallback = v21.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v21.table, 
    localization = if l_FFlagAXDurablesForMIS_0 then v21.table else nil
});
v109.init = function(v110) --[[ Line: 259 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v87 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v12 (copy), v46 (copy), v103 (copy), l_memoize_0 (copy), l_PeekViewState_0 (copy), v75 (copy), l_AvatarScreen_0 (copy)
    v110.actionBarHeaderRef = v5.createRef();
    v110.backButtonRef = v5.createRef();
    local v111 = if v87() then {
        scrollingEnabled = true
    } else nil;
    if l_FFlagAXDurablesSupport_0 and v110.props.itemData and v110.props.itemData.timedOptions then
        for _, v113 in v110.props.itemData.timedOptions do
            if v113.selected then
                local l_days_0 = v113.days;
                if l_days_0 == 0 then
                    l_days_0 = nil;
                end;
                v111.selectedTimedOptionDays = l_days_0;
                break;
            end;
        end;
    end;
    v110.state = v111;
    if v110.props.showRobuxBalance then
        v110.robuxBalanceRef = v5.createRef();
    end;
    if l_FFlagAXDurablesSupport_0 then
        v110.timedOptionDeeplinkUpdated = false;
        v110.onTimedOptionSelected = function(v115) --[[ Line: 289 ]]
            -- upvalues: v110 (copy), v5 (ref), l_FFlagAXDurablesForMIS_0 (ref)
            local v116 = v110.props.itemData.timedOptions[v115] and v110.props.itemData.timedOptions[v115].days or 0;
            if v116 == 0 then
                v116 = v5.None;
            end;
            v110:setState({
                selectedTimedOptionDays = v116
            });
            if l_FFlagAXDurablesForMIS_0 then
                v110.timedOptionDeeplinkUpdated = true;
            end;
        end;
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v110.updateTimedOptionSelection = function() --[[ Line: 305 ]]
            -- upvalues: v12 (ref), v110 (copy), v46 (ref)
            local v118 = v12.List.findWhere(v110.props.itemData.timedOptions, function(v117) --[[ Line: 306 ]]
                -- upvalues: v110 (ref)
                return v117.days == v110.state.selectedTimedOptionDays;
            end) or #v110.props.itemData.timedOptions;
            v110.props.setSelectedTimedOption(v110.props.itemId, v110.props.itemType, v118);
            v46.closeFocusedScreen(v110.props.navigation);
        end;
    end;
    v110.closeBriefView = function() --[[ Line: 319 ]]
        -- upvalues: v110 (copy)
        local l_analytics_0 = v110.props.analytics;
        local l_itemId_0 = v110.props.itemId;
        local l_itemType_0 = v110.props.itemType;
        l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        v110.props.closeFiltersAndItemDetails(v110.props.navigation);
    end;
    v110.onItemInvalid = function() --[[ Line: 330 ]]
        -- upvalues: v110 (copy), v103 (ref)
        if v110.isMounted then
            v110.closeBriefView();
            v110.props.setCurrentToastMessage(v103);
        end;
    end;
    v110.renderContentCallback = function() --[[ Line: 337 ]]
        -- upvalues: v110 (copy)
        return v110:renderContent();
    end;
    v110.getRenderTopBarCallback = l_memoize_0(function(v122) --[[ Line: 341 ]]
        -- upvalues: v110 (copy)
        return function() --[[ Line: 342 ]]
            -- upvalues: v110 (ref), v122 (copy)
            return v110:renderTopBar(v122);
        end;
    end);
    v110.getRenderActionBarCallback = l_memoize_0(function(v123, v124, v125, v126, v127) --[[ Line: 348 ]]
        -- upvalues: v110 (copy)
        return function() --[[ Line: 349 ]]
            -- upvalues: v110 (ref), v123 (copy), v124 (copy), v125 (copy), v126 (copy), v127 (copy)
            return v110:renderActionBar(v123, v124, v125, v126, v127);
        end;
    end);
    v110.setPeekViewState = function(v128) --[[ Line: 361 ]]
        -- upvalues: v110 (copy)
        if v110:getIsTryOnPage() then
            v110.props.setItemTryOnPeekViewState(v128);
            return;
        else
            v110.props.setItemDetailsPeekViewState(v128);
            return;
        end;
    end;
    v110.closePeekView = function() --[[ Line: 371 ]]
        -- upvalues: v110 (copy), l_PeekViewState_0 (ref)
        v110.setPeekViewState(l_PeekViewState_0.Brief);
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v110.getShouldShowSecondaryButton = function() --[[ Line: 376 ]]
            -- upvalues: l_FFlagAXDurablesSupport_0 (ref), v110 (copy)
            if l_FFlagAXDurablesSupport_0 and v110.props.itemData and v110.props.itemData.timedOptions and v110.props.numberOfTryOnItems > 1 then
                return true;
            elseif not v110.props.isCurrentItemInTryOns then
                return true;
            else
                return false;
            end;
        end;
        v110.onTryOnSecondaryButtonActivated = function() --[[ Line: 391 ]]
            -- upvalues: v75 (ref), v110 (copy), v12 (ref), l_AvatarScreen_0 (ref)
            local v129 = v75.GetItemSubType(v110.props.itemType, v110.props.itemData);
            local v130 = nil;
            if v110.props.itemData.timedOptions then
                v130 = v12.List.findWhere(v110.props.itemData.timedOptions, function(v131) --[[ Line: 396 ]]
                    -- upvalues: v110 (ref)
                    return v131.days == v110.state.selectedTimedOptionDays;
                end) or #v110.props.itemData.timedOptions;
            end;
            v110.props.toggleTryOnThunk(v110.props.networking, v110.props.analytics, v110.props.itemType, v129, v110.props.itemId, true, v110.props.avatarRoute, v110.props.navigation, v130);
            v110.props.closeMatchingScreens(v110.props.navigation, {
                l_AvatarScreen_0.Checkout, 
                l_AvatarScreen_0.ItemDetails
            });
        end;
    end;
    if v87() then
        v110.setItemDetailsScrollingEnabled = function(v132) --[[ Line: 425 ]]
            -- upvalues: v110 (copy)
            v110:setState({
                scrollingEnabled = v132
            });
        end;
    end;
end;
v109.getBriefViewHeight = function(v133) --[[ Line: 433 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: v22 (copy), v104 (copy), v77 (copy)
    local v134 = 0;
    if v133.props.lastInputGroup == v22.InputType.Gamepad and v104 then
        v134 = v22.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return v77.ActionBar.ActionBarHeight + v77.ActionBar.ActionBarGradientHeight + v134 + 20;
end;
v109.renderTopBar = function(v135, v136) --[[ Line: 445 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), v5 (copy), l_IsVRAppBuild_0 (copy), v44 (copy), v43 (copy), v95 (copy)
    local l_Theme_0 = v136.Theme;
    local l_fromProfile_0 = v135.props.fromProfile;
    local l_topBarHeight_0 = v135.props.topBarHeight;
    local v140 = nil;
    if v135.props.itemData then
        v140 = v135.props.itemData.name;
    end;
    local v141 = nil;
    v141 = if v135:getIsTryOnPage() then v135.props.itemDetailsTryOnViewState else v135.props.itemDetailsViewState;
    local v142 = nil;
    v142 = l_fromProfile_0 and 0 or v135.props.showDropDownTopBar and (not (v141 ~= l_PeekViewState_0.Full) or l_FFlagAXEnableHomeTryOnComplexView_0 and v141 == l_PeekViewState_0.Extended) and 0 or 1;
    return v5.createElement("Frame", {
        BackgroundTransparency = v142, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v135.topBarNavVisible
    }, {
        TopBar = if l_IsVRAppBuild_0() then v5.createElement(v44, {
            topBarHeight = l_topBarHeight_0, 
            title = v140, 
            closeFocusedScreen = v135.props.closeFocusedScreen, 
            navigation = v135.props.navigation
        }) else v5.createElement(v43, {
            [v5.Ref] = v135.backButtonRef, 
            NextSelectionDown = if v95 then nil else v135.props.contentFrameRef, 
            itemId = v135.props.itemId, 
            itemType = v135.props.itemType, 
            itemData = v135.props.itemData, 
            dropDownTopBar = v135.props.showDropDownTopBar, 
            peekViewState = v141, 
            closePeekView = v135.closePeekView, 
            showRobuxBalance = v135.props.showRobuxBalance
        })
    });
end;
v109.renderActionBar = function(v143, _, v145, v146, v147, v148) --[[ Line: 508 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v76 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v102 (ref), l_Skeleton_0 (copy)
    local l_itemId_1 = v143.props.itemId;
    local l_itemType_1 = v143.props.itemType;
    local l_Theme_1 = v145.Theme;
    local l_Font_0 = v145.Font;
    local v153 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v154 = v147 and v147.name;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v156 = nil;
    v156 = if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 then v143.state.selectedTimedOptionDays else v148;
    return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v146), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v5.Ref] = v143.props.actionBarContainerRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v143.props.contentFrameRef
    }, {
        BuyActionBar = v5.createElement(v76, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            showTimedOptionInBuyButton = l_FFlagAXDurablesSupport_0 and v147 and v147.timedOptions and true or nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v147 and v147.timedOptions and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v143.state then v156 else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v143.onTimedOptionSelected else nil, 
            showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v143:getShouldShowSecondaryButton() else nil, 
            secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then if v143.props.isCurrentItemInTryOns then v143.props.localization.updateSecondaryButtonText else v143.props.localization.tryOnSecondaryButtonText else nil, 
            onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then if v143.props.isCurrentItemInTryOns then v143.updateTimedOptionSelection else v143.onTryOnSecondaryButtonActivated else nil, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v102 else nil, 
            ZIndex = 1
        }), 
        ActionBarHeader = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v153), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v5.Ref] = v143.actionBarHeaderRef
        }, {
            NameLabel = v154 and v5.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v153), 
                Text = v154, 
                TextSize = v153, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v5.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v153)
            })
        })
    });
end;
v109.renderContent = function(v157) --[[ Line: 594 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 (copy), v41 (copy), v42 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v87 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_itemId_2 = v157.props.itemId;
    local l_itemType_2 = v157.props.itemType;
    local l_itemSubType_0 = v157.props.itemSubType;
    local l_itemDetailsPeekViewRefs_0 = v157.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v157.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v157.props.peekViewFullViewEnabled;
    local l_assetType_0 = v157.props.assetType;
    local v165 = v157:getIsTryOnPage();
    if not l_itemId_2 then
        return nil;
    else
        local v166 = if l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 then v41 else v42;
        return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v166 else l_Focusable_0[v166], {
            actionBarHeaderRef = v157.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_2, 
            itemType = l_itemType_2, 
            itemSubType = l_itemSubType_0, 
            assetType = l_assetType_0, 
            onItemInvalid = v157.onItemInvalid, 
            showFullWithNoPeekView = v157.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v157:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157:getFocusController(), 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157.props.actionBarContainerRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157.backButtonRef, 
            ref = if v157.props.showFullWithNoPeekView then v157.props.contentFrameRef else nil, 
            setItemDetailsScrollingEnabled = if v87() then v157.setItemDetailsScrollingEnabled else nil, 
            simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v157.props.simpleView else if l_FFlagAXEnableHomeTryOnComplexView_0 then v165 and not v157.props.fromHome else nil, 
            onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v157.onTimedOptionSelected else nil
        });
    end;
end;
v109.getIsTryOnPage = function(v167) --[[ Line: 638 ]] --[[ Name: getIsTryOnPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v167.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
end;
v109.getItemDetailsComponent = function(v168, v169) --[[ Line: 642 ]] --[[ Name: getItemDetailsComponent ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v64 (copy), v63 (copy), v62 (copy)
    if l_IsVRAppBuild_0() then
        return v64;
    elseif v169 then
        return v63;
    elseif v168.props.showFullWithNoPeekView then
        return v64;
    else
        return v62;
    end;
end;
v109.render = function(v170) --[[ Line: 656 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v171) --[[ Line: 657 ]]
        -- upvalues: l_withStyle_0 (ref), v170 (copy)
        return l_withStyle_0(function(v172) --[[ Line: 658 ]]
            -- upvalues: v170 (ref), v171 (copy)
            return v170:renderWithProviders(v171, v172);
        end);
    end);
end;
v109.renderWithProviders = function(v173, v174, v175) --[[ Line: 664 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v38 (copy), l_PeekViewState_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v45 (copy), v86 (copy), v80 (copy), v84 (copy), v88 (copy), v37 (copy), v40 (copy), v101 (copy), v87 (copy)
    local l_isSceneFullView_0 = v173.props.isSceneFullView;
    local l_itemId_3 = v173.props.itemId;
    local l_key_0 = v173.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v173.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v173.props.resultsListRef;
    local v181 = v173:getIsTryOnPage();
    local l_wideMode_0 = v173.props.wideMode;
    local v183 = if v181 then v173.props.itemDetailsTryOnViewState else v173.props.itemDetailsViewState;
    if not l_itemId_3 then
        return;
    else
        local l_fromProfile_1 = v173.props.fromProfile;
        local v185 = l_wideMode_0 and l_fromProfile_1 and not v181;
        local l_isPortrait_0 = v173.props.isPortrait;
        local v187 = true;
        local v188 = UDim2.fromScale(0, 0);
        local v189 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if l_fromProfile_1 or v181 then
                local l_screenSize_0 = v173.props.screenSize;
                local l_globalGuiInset_0 = v173.props.globalGuiInset;
                local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset;
                local v193 = math.min(l_Offset_0, 640);
                if v181 and v193 < l_Offset_0 then
                    v187 = false;
                end;
                v188 = UDim2.fromOffset((l_Offset_0 - v193) / 2, 0);
                v189 = UDim2.new(0, v193, 1, 0);
            else
                v188 = UDim2.fromScale(v38.LandscapeNavWidth, 0);
                v189 = UDim2.fromScale(v38.LandscapeSceneWidth, 1);
            end;
        end;
        local v194 = v173:getBriefViewHeight();
        local v195 = v173.props.mountAsFullView and (v183 == l_PeekViewState_0.Full or v183 == l_PeekViewState_0.Extended);
        local v196 = v173:getItemDetailsComponent(v185);
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v5.Ref] = l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v173:getFocusController(), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v195 and v173.props.contentFrameRef or v173.props.actionBarContainerRef, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v45, {
                focusController = v173:getFocusController()
            }), 
            ItemDetailsExposure = if v86() then nil else v5.createElement(v80, {
                ixpTest = v84.ItemDetailsPage
            }), 
            ItemDetails3DPreviewExposure = if v88.isEnabled() then v5.createElement(v80, {
                ixpTest = v88
            }) else nil, 
            NavigationEventsLogger = v5.createElement(v37, {
                pageName = "ItemDetails:" .. l_key_0
            }), 
            BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v40), 
            ItemDetailsContent = v5.createElement(v196, {
                renderBottomBar = v173.getRenderActionBarCallback(v174, v175, v194, v173.props.itemData, if v101 then if v173.state then v173.state.selectedTimedOptionDays else nil else v173.state.selectedTimedOptionDays), 
                renderContent = v173.renderContentCallback, 
                renderTopBar = v173.getRenderTopBarCallback(v175), 
                isTryOnPage = v181, 
                peekViewState = v183, 
                setPeekViewState = v173.setPeekViewState, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v173:getFocusController(), 
                actionBarContainerRef = v173.props.actionBarContainerRef, 
                contentFrameRef = v173.props.contentFrameRef, 
                closeBriefView = v173.closeBriefView, 
                viewPosition = v188, 
                viewSize = v189, 
                briefViewHeight = v194, 
                showDropShadow = v187, 
                analytics = v173.props.analytics, 
                avatarRoute = v173.props.avatarRoute, 
                closeAllPeekViews = v173.props.closeAllPeekViews, 
                closeFocusedScreen = v173.props.closeFocusedScreen, 
                fromProfile = v173.props.fromProfile, 
                itemDetailsExpanded = v173.props.itemDetailsExpanded, 
                itemId = v173.props.itemId, 
                itemType = v173.props.itemType, 
                lastInputGroup = v173.props.lastInputGroup, 
                mountAnimation = v173.props.mountAnimation, 
                mountAsFullView = v173.props.mountAsFullView, 
                navigation = v173.props.navigation, 
                peekViewFullViewEnabled = v173.props.peekViewFullViewEnabled, 
                peekViewShowing = v173.props.peekViewShowing, 
                setItemDetailsExpanded = v173.props.setItemDetailsExpanded, 
                topBarHeight = v173.props.topBarHeight, 
                scrollingEnabled = if v87() then v173.state.scrollingEnabled else nil
            })
        });
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v109.getFocusController = function(v197) --[[ Line: 805 ]] --[[ Name: getFocusController ]]
        return v197.props.focusController;
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v109.didUpdate = function(v198, v199, _) --[[ Line: 811 ]] --[[ Name: didUpdate ]]
        -- upvalues: v22 (copy), v66 (copy)
        local l_key_1 = v198.props.avatarRoute.current.key;
        local l_key_2 = v199.avatarRoute.current.key;
        local l_key_3 = v198.props.navigation.state.key;
        if v198.props.lastInputGroup == v22.InputType.Gamepad then
            if l_key_1 == l_key_3 and not v198.props.avatarRoute.isOverlayVisible and v199.avatarRoute.isOverlayVisible then
                v198:getFocusController().captureFocus();
            end;
            if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
                v66:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
                v198:getFocusController().captureFocus();
            end;
        end;
    end;
else
    v109.didUpdate = function(v204, v205, _) --[[ Line: 833 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy)
        if l_FFlagAXDurablesSupport_0 and not v204.timedOptionDeeplinkUpdated and v204.props.itemData and v204.props.itemData.timedOptions then
            for v207, v208 in v204.props.itemData.timedOptions do
                if v208.selected then
                    if v208.days == 0 then
                        local _ = nil;
                    end;
                    v204.onTimedOptionSelected(v207);
                    if not l_FFlagAXDurablesForMIS_0 then
                        v204.timedOptionDeeplinkUpdated = true;
                        break;
                    else
                        break;
                    end;
                end;
            end;
        end;
        if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 and v204.props.itemData and v204.props.itemData.timedOptions and v204.props.itemData.isOwned and (not v205.itemData or not v205.itemData.isOwned) then
            for v210, v211 in v204.props.itemData.timedOptions do
                if v211.selected then
                    v204.onTimedOptionSelected(v210);
                    return;
                end;
            end;
        end;
    end;
end;
v109.didMount = function(v212) --[[ Line: 872 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v46 (copy), v22 (copy), v66 (copy), v85 (copy), l_PeekViewState_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v213 = v46.isFirstItemDetailsPage(v212.props.navigation);
        if v212.props.lastInputGroup == v22.InputType.Gamepad and not v213 then
            v66:debug("gamepad captureFocus: ItemDetails, didMount");
            v212:getFocusController().captureFocus();
        end;
    end;
    if v212.props.redeemQRCodeItem and v85 then
        v212.props.redeemQRCodeItemPrompt(v212.props.networking, v212.props.analytics, v212.props.itemId, v212.props.itemType);
    end;
    if v212.props.showFullWithNoPeekView then
        v212.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v212.isMounted = true;
end;
v109.willUnmount = function(v214) --[[ Line: 899 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy), v46 (copy), l_PeekViewState_0 (copy)
    v214.isMounted = false;
    local v215 = v214.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
    local v216 = v214.props.navigation.state.routeName == l_AvatarScreen_0.ItemDetails;
    local v217 = not (v215 and v216);
    if v46.isFirstItemDetailsPage(v214.props.navigation) and v217 then
        v214.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v214.props.onItemDetailsClosed ~= nil then
            v214.props.onItemDetailsClosed();
        end;
    end;
end;
local function v229(v218, v219) --[[ Line: 921 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v59 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreen_0 (copy), v39 (copy), l_FormFactor_0 (copy), v54 (copy), v4 (copy)
    local l_itemId_4 = v219.itemId;
    local l_itemType_3 = v219.itemType;
    local v222 = v59(v218.AvatarExperience.Common, l_itemId_4, l_itemType_3);
    local v223 = if l_FFlagAXDurablesForMIS_0 then v218.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil;
    local v224 = if l_FFlagAXDurablesForMIS_0 then v223 and v223[l_getTryOnItemReducerKey_0(l_itemId_4, l_itemType_3)] ~= nil else nil;
    local l_key_4 = v219.navigation.state.key;
    local l_avatarRoute_0 = v219.avatarRoute;
    local l_key_5 = l_avatarRoute_0.current.key;
    local v228 = v219.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    if v228 and v222 ~= nil and v222.name == nil then
        v222 = nil;
    end;
    return {
        isSceneFullView = v39.getIsSceneFullViewFromState(v218, l_avatarRoute_0), 
        itemData = if v228 and v222 ~= nil and v222.name == nil then nil else v222, 
        wideMode = v218.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_key_5 == l_key_4, 
        topBarHeight = v39.getTopBarHeightAvatarScene(v218), 
        itemDetailsExpanded = v218.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = v218.Users[v218.LocalUserId] and v218.Users[v218.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v218.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v218.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v218.ScreenSize, 
        globalGuiInset = v218.GlobalGuiInset, 
        isPortrait = v54(v218), 
        numberOfTryOnItems = if l_FFlagAXDurablesForMIS_0 then v4.fieldCount(v223) else nil, 
        isCurrentItemInTryOns = if l_FFlagAXDurablesForMIS_0 then v224 else nil
    };
end;
local function v261(v230) --[[ Line: 964 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v55 (copy), v56 (copy), v35 (copy), v60 (copy), v29 (copy), v67 (copy), v78 (copy), v61 (copy), v79 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_SetSelectedTimedOption_0 (copy), v58 (copy), v57 (copy)
    return {
        closeAllPeekViews = function(v231) --[[ Line: 966 ]] --[[ Name: closeAllPeekViews ]]
            -- upvalues: v230 (copy), v55 (ref)
            v230(v55(v231));
        end, 
        closeFiltersAndItemDetails = function(v232) --[[ Line: 970 ]] --[[ Name: closeFiltersAndItemDetails ]]
            -- upvalues: v230 (copy), v56 (ref)
            v230(v56(v232));
        end, 
        closeFocusedScreen = function(v233) --[[ Line: 974 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v230 (copy), v35 (ref)
            v230(v35(v233));
        end, 
        setItemDetailsExpanded = function(v234) --[[ Line: 978 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v230 (copy), v60 (ref)
            v230(v60(v234));
        end, 
        setCurrentToastMessage = function(v235) --[[ Line: 982 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v230 (copy), v29 (ref)
            v230(v29(v235));
        end, 
        openItemPrompt = function(v236, v237, v238, v239, v240) --[[ Line: 986 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v230 (copy), v67 (ref)
            v230(v67(v236, v237, v238, v239, v240));
        end, 
        redeemQRCodeItemPrompt = function(v241, v242, v243, v244) --[[ Line: 990 ]] --[[ Name: redeemQRCodeItemPrompt ]]
            -- upvalues: v230 (copy), v78 (ref)
            v230(v78(v241, v242, v243, v244));
        end, 
        setItemDetailsPeekViewState = function(v245) --[[ Line: 994 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v230 (copy), v61 (ref)
            v230(v61(v245));
        end, 
        setItemTryOnPeekViewState = function(v246) --[[ Line: 998 ]] --[[ Name: setItemTryOnPeekViewState ]]
            -- upvalues: v230 (copy), v79 (ref)
            v230(v79(v246));
        end, 
        setSelectedTimedOption = l_FFlagAXDurablesForMIS_0 and function(v247, v248, v249) --[[ Line: 1003 ]]
            -- upvalues: v230 (copy), l_SetSelectedTimedOption_0 (ref)
            v230(l_SetSelectedTimedOption_0({
                itemId = v247, 
                itemType = v248, 
                selectedTimedOptionIndex = v249
            }));
        end or nil, 
        closeMatchingScreens = l_FFlagAXDurablesForMIS_0 and function(v250, v251) --[[ Line: 1013 ]]
            -- upvalues: v230 (copy), v58 (ref)
            v230(v58(v250, v251));
        end or nil, 
        toggleTryOnThunk = l_FFlagAXDurablesForMIS_0 and function(v252, v253, v254, v255, v256, v257, v258, v259, v260) --[[ Line: 1019 ]]
            -- upvalues: v230 (copy), v57 (ref)
            v230(v57(v252, v253, v254, v255, v256, v257, v258, v259, nil, false, false, v260));
        end or nil
    };
end;
v109 = v65(v109);
v109 = v52((v9.connect(v229, v261)(v109)));
v109 = l_RoactAppPolicy_0.connect(function(v262, _) --[[ Line: 1057 ]]
    return {
        peekViewFullViewEnabled = v262.getItemDetailsFullView(), 
        showPremiumContent = v262.getShowCatalogPremiumContent()
    };
end)(v109);
return function(v264) --[[ Line: 1064 ]] --[[ Name: ItemDetailsPageContainer ]]
    -- upvalues: l_useSelector_0 (copy), v106 (copy), v108 (copy), l_AvatarScreen_0 (copy), v16 (copy), v19 (copy), v74 (copy), l_useDispatch_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v18 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v69 (copy), v68 (copy), l_FocusNavigationEventNameEnum_0 (copy), v79 (copy), v61 (copy), v46 (copy), v67 (copy), l_PeekViewState_0 (copy), v72 (copy), l_useTableWrappedCallbackRef_0 (copy), v12 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v93 (copy), v5 (copy), v94 (copy), v109 (ref)
    local v265 = l_useSelector_0(v106);
    local v266 = l_useSelector_0(v108);
    local l_fromProfile_2 = v264.navigation.state.params.fromProfile;
    local v268 = v264.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    local v269 = v266 and l_fromProfile_2 and not v268;
    local l_showFullWithNoPeekView_0 = v264.navigation.state.params.showFullWithNoPeekView;
    local l_itemId_5 = v264.navigation.state.params.itemId;
    local l_itemType_4 = v264.navigation.state.params.itemType;
    local v273 = v16(v19);
    local v274 = v16(v74);
    local v275 = l_useDispatch_0();
    local v276 = if l_FFlagAXDurablesForMIS_0 then v18({
        updateSecondaryButtonText = "Feature.Avatar.Action.Update", 
        tryOnSecondaryButtonText = "Feature.Avatar.Action.TryOn"
    }) else nil;
    local v277 = v7.useRef(nil);
    local v278 = v7.useRef(nil);
    local v279 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useRef(v6.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v264.focusController then
        v279 = v264.focusController;
    end;
    local v280 = v69(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v279);
    local v281 = v68({
        overlayClosedCallback = v280
    });
    local v282 = v7.useMemo(function() --[[ Line: 1099 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v265 (copy)
        return {
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt, 
            [Enum.KeyCode.ButtonY] = if v265 then l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView else l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView, 
            [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
            [Enum.KeyCode.ButtonL2] = l_FocusNavigationEventNameEnum_0.MoveToItemDetails
        };
    end, {
        v265
    });
    local v284 = v7.useCallback(function(v283) --[[ Line: 1111 ]]
        -- upvalues: v268 (copy), v275 (copy), v79 (ref), v61 (ref)
        if v268 then
            v275(v79(v283));
            return;
        else
            v275(v61(v283));
            return;
        end;
    end, {
        v275, 
        v268
    });
    local v285 = v7.useCallback(function() --[[ Line: 1119 ]]
        -- upvalues: v46 (ref), v264 (copy)
        v46.closeFocusedScreen(v264.navigation);
    end, {
        v264.navigation
    });
    local v286 = v7.useCallback(function() --[[ Line: 1123 ]]
        -- upvalues: v275 (copy), v67 (ref), v273 (copy), v274 (copy), v280 (copy), v264 (copy)
        v275(v67(v273, v274, v280, v264.navigation, v264.avatarRoute));
    end, {
        v275, 
        v273, 
        v274, 
        v280, 
        v264.navigation, 
        v264.avatarRoute
    });
    local v287 = v7.useCallback(function() --[[ Line: 1127 ]]
        -- upvalues: v284 (copy), l_PeekViewState_0 (ref)
        v284(l_PeekViewState_0.Full);
    end, {
        v284
    });
    local v288 = v7.useCallback(function() --[[ Line: 1131 ]]
        -- upvalues: v284 (copy), l_PeekViewState_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v279 (ref), v277 (copy)
        v284(l_PeekViewState_0.Brief);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v279.moveFocusTo(v277);
        end;
    end, {
        v284, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v279
    });
    local v289 = v7.useCallback(function() --[[ Line: 1138 ]]
        -- upvalues: v264 (copy), l_AvatarScreen_0 (ref), l_itemId_5 (copy), l_itemType_4 (copy), v280 (copy), l_fromProfile_2 (copy), v268 (copy)
        v264.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
            itemId = l_itemId_5, 
            itemType = l_itemType_4, 
            onOverlayClosed = v280, 
            centered = l_fromProfile_2 or v268
        });
    end, {
        v264.navigation, 
        l_itemId_5, 
        l_itemType_4, 
        v280, 
        l_fromProfile_2, 
        v268
    });
    local v290 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useCallback(function() --[[ Line: 1149 ]]
        -- upvalues: v279 (ref)
        v279.moveFocusUp();
    end, {
        v279
    });
    local v291 = {
        onGoBack = v285, 
        onOpenItemPrompt = v286, 
        onOpenPeekView = if not not v269 or l_showFullWithNoPeekView_0 or v265 then nil else v287, 
        onClosePeekView = if not (not not v269 or l_showFullWithNoPeekView_0) and v265 then v288 else nil, 
        onOpenCatalogContextMenu = if not l_showFullWithNoPeekView_0 then v289 else nil
    };
    local v292 = v72(v278, v282, v291);
    v278 = l_useTableWrappedCallbackRef_0(v292);
    v291.onMoveToItemDetails = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v290;
    local v293 = v72(v277, v282, v291);
    v293 = l_useTableWrappedCallbackRef_0(v293);
    local v294 = v12.Dictionary.join(v264, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v279, 
        actionBarContainerRef = v293, 
        contentFrameRef = v278, 
        overlayClosedCallback = v280, 
        networking = v273, 
        analytics = v274, 
        itemDetailsExpanded = v265, 
        localization = if l_FFlagAXDurablesForMIS_0 then v276 else nil
    });
    local v295 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v296 = l_useNavigation_0();
        local v297 = l_useAvatarRoute_0();
        local v298 = true;
        if v296.state.rnKey ~= v297.current.key then
            v298 = v93 and v296.state.key == v297.current.key;
        end;
        v295 = v298;
    end;
    return v5.createElement("Frame", {
        [v5.Ref] = if v94 then nil else v281, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v295 else nil
    }, {
        ItemDetails = v7.createElement(v109, v294)
    });
end;