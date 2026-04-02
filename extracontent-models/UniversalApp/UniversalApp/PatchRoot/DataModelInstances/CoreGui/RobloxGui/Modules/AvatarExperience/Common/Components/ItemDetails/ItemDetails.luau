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
local l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 = v82.FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess;
local v103 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v103 = 4;
end;
local v104 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v23.InformationMessage
};
local v105 = l_GuiService_0:IsTenFootInterface();
local function v107(v106) --[[ Line: 173 ]]
    return v106.AvatarExperience.Common.ItemDetailsExpanded;
end;
local function v109(v108) --[[ Line: 177 ]]
    -- upvalues: l_FormFactor_0 (copy)
    return v108.FormFactor == l_FormFactor_0.WIDE;
end;
local v110 = v5.PureComponent:extend("ItemDetails");
v110.validateProps = v21.strictInterface({
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
    fromSurface = if not not l_FFlagAXFixPurchaseSurfaceLogging_0 or l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then v21.optional(v21.number) else nil, 
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
v110.init = function(v111) --[[ Line: 263 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v87 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v12 (copy), v46 (copy), v104 (copy), l_memoize_0 (copy), l_PeekViewState_0 (copy), v75 (copy), l_AvatarScreen_0 (copy)
    v111.actionBarHeaderRef = v5.createRef();
    v111.backButtonRef = v5.createRef();
    local v112 = if v87() then {
        scrollingEnabled = true
    } else nil;
    if l_FFlagAXDurablesSupport_0 and v111.props.itemData and v111.props.itemData.timedOptions then
        for _, v114 in v111.props.itemData.timedOptions do
            if v114.selected then
                local l_days_0 = v114.days;
                if l_days_0 == 0 then
                    l_days_0 = nil;
                end;
                v112.selectedTimedOptionDays = l_days_0;
                break;
            end;
        end;
    end;
    v111.state = v112;
    if v111.props.showRobuxBalance then
        v111.robuxBalanceRef = v5.createRef();
    end;
    if l_FFlagAXDurablesSupport_0 then
        v111.timedOptionDeeplinkUpdated = false;
        v111.onTimedOptionSelected = function(v116) --[[ Line: 293 ]]
            -- upvalues: v111 (copy), v5 (ref), l_FFlagAXDurablesForMIS_0 (ref)
            local v117 = v111.props.itemData.timedOptions[v116] and v111.props.itemData.timedOptions[v116].days or 0;
            if v117 == 0 then
                v117 = v5.None;
            end;
            v111:setState({
                selectedTimedOptionDays = v117
            });
            if l_FFlagAXDurablesForMIS_0 then
                v111.timedOptionDeeplinkUpdated = true;
            end;
        end;
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v111.updateTimedOptionSelection = function() --[[ Line: 309 ]]
            -- upvalues: v12 (ref), v111 (copy), v46 (ref)
            local v119 = v12.List.findWhere(v111.props.itemData.timedOptions, function(v118) --[[ Line: 310 ]]
                -- upvalues: v111 (ref)
                return v118.days == v111.state.selectedTimedOptionDays;
            end) or #v111.props.itemData.timedOptions;
            v111.props.setSelectedTimedOption(v111.props.itemId, v111.props.itemType, v119);
            v46.closeFocusedScreen(v111.props.navigation);
        end;
    end;
    v111.closeBriefView = function() --[[ Line: 323 ]]
        -- upvalues: v111 (copy)
        local l_analytics_0 = v111.props.analytics;
        local l_itemId_0 = v111.props.itemId;
        local l_itemType_0 = v111.props.itemType;
        l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        v111.props.closeFiltersAndItemDetails(v111.props.navigation);
    end;
    v111.onItemInvalid = function() --[[ Line: 334 ]]
        -- upvalues: v111 (copy), v104 (ref)
        if v111.isMounted then
            v111.closeBriefView();
            v111.props.setCurrentToastMessage(v104);
        end;
    end;
    v111.renderContentCallback = function() --[[ Line: 341 ]]
        -- upvalues: v111 (copy)
        return v111:renderContent();
    end;
    v111.getRenderTopBarCallback = l_memoize_0(function(v123) --[[ Line: 345 ]]
        -- upvalues: v111 (copy)
        return function() --[[ Line: 346 ]]
            -- upvalues: v111 (ref), v123 (copy)
            return v111:renderTopBar(v123);
        end;
    end);
    v111.getRenderActionBarCallback = l_memoize_0(function(v124, v125, v126, v127, v128) --[[ Line: 352 ]]
        -- upvalues: v111 (copy)
        return function() --[[ Line: 353 ]]
            -- upvalues: v111 (ref), v124 (copy), v125 (copy), v126 (copy), v127 (copy), v128 (copy)
            return v111:renderActionBar(v124, v125, v126, v127, v128);
        end;
    end);
    v111.setPeekViewState = function(v129) --[[ Line: 365 ]]
        -- upvalues: v111 (copy)
        if v111:getIsTryOnPage() then
            v111.props.setItemTryOnPeekViewState(v129);
            return;
        else
            v111.props.setItemDetailsPeekViewState(v129);
            return;
        end;
    end;
    v111.closePeekView = function() --[[ Line: 375 ]]
        -- upvalues: v111 (copy), l_PeekViewState_0 (ref)
        v111.setPeekViewState(l_PeekViewState_0.Brief);
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v111.getShouldShowSecondaryButton = function() --[[ Line: 380 ]]
            -- upvalues: v111 (copy), l_FFlagAXDurablesSupport_0 (ref)
            if v111.props.fromProfile then
                return false;
            elseif l_FFlagAXDurablesSupport_0 and v111.props.itemData and v111.props.itemData.timedOptions and v111.props.numberOfTryOnItems > 1 then
                return true;
            elseif not v111.props.isCurrentItemInTryOns then
                return true;
            else
                return false;
            end;
        end;
        v111.onTryOnSecondaryButtonActivated = function() --[[ Line: 398 ]]
            -- upvalues: v75 (ref), v111 (copy), v12 (ref), l_AvatarScreen_0 (ref)
            local v130 = v75.GetItemSubType(v111.props.itemType, v111.props.itemData);
            local v131 = nil;
            if v111.props.itemData.timedOptions then
                v131 = v12.List.findWhere(v111.props.itemData.timedOptions, function(v132) --[[ Line: 403 ]]
                    -- upvalues: v111 (ref)
                    return v132.days == v111.state.selectedTimedOptionDays;
                end) or #v111.props.itemData.timedOptions;
            end;
            v111.props.toggleTryOnThunk(v111.props.networking, v111.props.analytics, v111.props.itemType, v130, v111.props.itemId, true, v111.props.avatarRoute, v111.props.navigation, v131);
            v111.props.closeMatchingScreens(v111.props.navigation, {
                l_AvatarScreen_0.Checkout, 
                l_AvatarScreen_0.ItemDetails
            });
        end;
    end;
    if v87() then
        v111.setItemDetailsScrollingEnabled = function(v133) --[[ Line: 432 ]]
            -- upvalues: v111 (copy)
            v111:setState({
                scrollingEnabled = v133
            });
        end;
    end;
end;
v110.getBriefViewHeight = function(v134) --[[ Line: 440 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: v22 (copy), v105 (copy), v77 (copy)
    local v135 = 0;
    if v134.props.lastInputGroup == v22.InputType.Gamepad and v105 then
        v135 = v22.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return v77.ActionBar.ActionBarHeight + v77.ActionBar.ActionBarGradientHeight + v135 + 20;
end;
v110.renderTopBar = function(v136, v137) --[[ Line: 452 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), v5 (copy), l_IsVRAppBuild_0 (copy), v44 (copy), v43 (copy), v95 (copy)
    local l_Theme_0 = v137.Theme;
    local l_fromProfile_0 = v136.props.fromProfile;
    local l_topBarHeight_0 = v136.props.topBarHeight;
    local v141 = nil;
    if v136.props.itemData then
        v141 = v136.props.itemData.name;
    end;
    local v142 = nil;
    v142 = if v136:getIsTryOnPage() then v136.props.itemDetailsTryOnViewState else v136.props.itemDetailsViewState;
    local v143 = nil;
    v143 = l_fromProfile_0 and 0 or v136.props.showDropDownTopBar and (not (v142 ~= l_PeekViewState_0.Full) or l_FFlagAXEnableHomeTryOnComplexView_0 and v142 == l_PeekViewState_0.Extended) and 0 or 1;
    return v5.createElement("Frame", {
        BackgroundTransparency = v143, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v136.topBarNavVisible
    }, {
        TopBar = if l_IsVRAppBuild_0() then v5.createElement(v44, {
            topBarHeight = l_topBarHeight_0, 
            title = v141, 
            closeFocusedScreen = v136.props.closeFocusedScreen, 
            navigation = v136.props.navigation
        }) else v5.createElement(v43, {
            [v5.Ref] = v136.backButtonRef, 
            NextSelectionDown = if v95 then nil else v136.props.contentFrameRef, 
            itemId = v136.props.itemId, 
            itemType = v136.props.itemType, 
            itemData = v136.props.itemData, 
            dropDownTopBar = v136.props.showDropDownTopBar, 
            peekViewState = v142, 
            closePeekView = v136.closePeekView, 
            showRobuxBalance = v136.props.showRobuxBalance
        })
    });
end;
v110.renderActionBar = function(v144, _, v146, v147, v148, v149) --[[ Line: 515 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v76 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v103 (ref), l_Skeleton_0 (copy)
    local l_itemId_1 = v144.props.itemId;
    local l_itemType_1 = v144.props.itemType;
    local l_Theme_1 = v146.Theme;
    local l_Font_0 = v146.Font;
    local v154 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v155 = v148 and v148.name;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v157 = nil;
    v157 = if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 then v144.state.selectedTimedOptionDays else v149;
    return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v147), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v5.Ref] = v144.props.actionBarContainerRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144.props.contentFrameRef
    }, {
        BuyActionBar = v5.createElement(v76, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            showTimedOptionInBuyButton = l_FFlagAXDurablesSupport_0 and v148 and v148.timedOptions and true or nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v148 and v148.timedOptions and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v144.state then v157 else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v144.onTimedOptionSelected else nil, 
            showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v144:getShouldShowSecondaryButton() else nil, 
            secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then if v144.props.isCurrentItemInTryOns then v144.props.localization.updateSecondaryButtonText else v144.props.localization.tryOnSecondaryButtonText else nil, 
            onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then if v144.props.isCurrentItemInTryOns then v144.updateTimedOptionSelection else v144.onTryOnSecondaryButtonActivated else nil, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v103 else nil, 
            ZIndex = 1
        }), 
        ActionBarHeader = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v154), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v5.Ref] = v144.actionBarHeaderRef
        }, {
            NameLabel = v155 and v5.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v154), 
                Text = v155, 
                TextSize = v154, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v5.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v154)
            })
        })
    });
end;
v110.renderContent = function(v158) --[[ Line: 601 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 (copy), v41 (copy), v42 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v87 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_itemId_2 = v158.props.itemId;
    local l_itemType_2 = v158.props.itemType;
    local l_itemSubType_0 = v158.props.itemSubType;
    local l_itemDetailsPeekViewRefs_0 = v158.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v158.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v158.props.peekViewFullViewEnabled;
    local l_assetType_0 = v158.props.assetType;
    local v166 = v158:getIsTryOnPage();
    if not l_itemId_2 then
        return nil;
    else
        local v167 = if l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 then v41 else v42;
        return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v167 else l_Focusable_0[v167], {
            actionBarHeaderRef = v158.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_2, 
            itemType = l_itemType_2, 
            itemSubType = l_itemSubType_0, 
            assetType = l_assetType_0, 
            onItemInvalid = v158.onItemInvalid, 
            showFullWithNoPeekView = v158.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v158:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v158:getFocusController(), 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v158.props.actionBarContainerRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v158.backButtonRef, 
            ref = if v158.props.showFullWithNoPeekView then v158.props.contentFrameRef else nil, 
            setItemDetailsScrollingEnabled = if v87() then v158.setItemDetailsScrollingEnabled else nil, 
            simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v158.props.simpleView else if l_FFlagAXEnableHomeTryOnComplexView_0 then v166 and not v158.props.fromHome else nil, 
            onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v158.onTimedOptionSelected else nil
        });
    end;
end;
v110.getIsTryOnPage = function(v168) --[[ Line: 645 ]] --[[ Name: getIsTryOnPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v168.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
end;
v110.getItemDetailsComponent = function(v169, v170) --[[ Line: 649 ]] --[[ Name: getItemDetailsComponent ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v64 (copy), v63 (copy), v62 (copy)
    if l_IsVRAppBuild_0() then
        return v64;
    elseif v170 then
        return v63;
    elseif v169.props.showFullWithNoPeekView then
        return v64;
    else
        return v62;
    end;
end;
v110.render = function(v171) --[[ Line: 663 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v172) --[[ Line: 664 ]]
        -- upvalues: l_withStyle_0 (ref), v171 (copy)
        return l_withStyle_0(function(v173) --[[ Line: 665 ]]
            -- upvalues: v171 (ref), v172 (copy)
            return v171:renderWithProviders(v172, v173);
        end);
    end);
end;
v110.renderWithProviders = function(v174, v175, v176) --[[ Line: 671 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v38 (copy), l_PeekViewState_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v45 (copy), v86 (copy), v80 (copy), v84 (copy), v88 (copy), v37 (copy), v40 (copy), v101 (copy), v87 (copy)
    local l_isSceneFullView_0 = v174.props.isSceneFullView;
    local l_itemId_3 = v174.props.itemId;
    local l_key_0 = v174.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v174.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v174.props.resultsListRef;
    local v182 = v174:getIsTryOnPage();
    local l_wideMode_0 = v174.props.wideMode;
    local v184 = if v182 then v174.props.itemDetailsTryOnViewState else v174.props.itemDetailsViewState;
    if not l_itemId_3 then
        return;
    else
        local l_fromProfile_1 = v174.props.fromProfile;
        local v186 = l_wideMode_0 and l_fromProfile_1 and not v182;
        local l_isPortrait_0 = v174.props.isPortrait;
        local v188 = true;
        local v189 = UDim2.fromScale(0, 0);
        local v190 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if l_fromProfile_1 or v182 then
                local l_screenSize_0 = v174.props.screenSize;
                local l_globalGuiInset_0 = v174.props.globalGuiInset;
                local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset;
                local v194 = math.min(l_Offset_0, 640);
                if v182 and v194 < l_Offset_0 then
                    v188 = false;
                end;
                v189 = UDim2.fromOffset((l_Offset_0 - v194) / 2, 0);
                v190 = UDim2.new(0, v194, 1, 0);
            else
                v189 = UDim2.fromScale(v38.LandscapeNavWidth, 0);
                v190 = UDim2.fromScale(v38.LandscapeSceneWidth, 1);
            end;
        end;
        local v195 = v174:getBriefViewHeight();
        local v196 = v174.props.mountAsFullView and (v184 == l_PeekViewState_0.Full or v184 == l_PeekViewState_0.Extended);
        local v197 = v174:getItemDetailsComponent(v186);
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v5.Ref] = l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v174:getFocusController(), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v196 and v174.props.contentFrameRef or v174.props.actionBarContainerRef, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v45, {
                focusController = v174:getFocusController()
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
            ItemDetailsContent = v5.createElement(v197, {
                renderBottomBar = v174.getRenderActionBarCallback(v175, v176, v195, v174.props.itemData, if v101 then if v174.state then v174.state.selectedTimedOptionDays else nil else v174.state.selectedTimedOptionDays), 
                renderContent = v174.renderContentCallback, 
                renderTopBar = v174.getRenderTopBarCallback(v176), 
                isTryOnPage = v182, 
                peekViewState = v184, 
                setPeekViewState = v174.setPeekViewState, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v174:getFocusController(), 
                actionBarContainerRef = v174.props.actionBarContainerRef, 
                contentFrameRef = v174.props.contentFrameRef, 
                closeBriefView = v174.closeBriefView, 
                viewPosition = v189, 
                viewSize = v190, 
                briefViewHeight = v195, 
                showDropShadow = v188, 
                analytics = v174.props.analytics, 
                avatarRoute = v174.props.avatarRoute, 
                closeAllPeekViews = v174.props.closeAllPeekViews, 
                closeFocusedScreen = v174.props.closeFocusedScreen, 
                fromProfile = v174.props.fromProfile, 
                itemDetailsExpanded = v174.props.itemDetailsExpanded, 
                itemId = v174.props.itemId, 
                itemType = v174.props.itemType, 
                lastInputGroup = v174.props.lastInputGroup, 
                mountAnimation = v174.props.mountAnimation, 
                mountAsFullView = v174.props.mountAsFullView, 
                navigation = v174.props.navigation, 
                peekViewFullViewEnabled = v174.props.peekViewFullViewEnabled, 
                peekViewShowing = v174.props.peekViewShowing, 
                setItemDetailsExpanded = v174.props.setItemDetailsExpanded, 
                topBarHeight = v174.props.topBarHeight, 
                scrollingEnabled = if v87() then v174.state.scrollingEnabled else nil
            })
        });
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v110.getFocusController = function(v198) --[[ Line: 812 ]] --[[ Name: getFocusController ]]
        return v198.props.focusController;
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v110.didUpdate = function(v199, v200, _) --[[ Line: 818 ]] --[[ Name: didUpdate ]]
        -- upvalues: v22 (copy), v66 (copy)
        local l_key_1 = v199.props.avatarRoute.current.key;
        local l_key_2 = v200.avatarRoute.current.key;
        local l_key_3 = v199.props.navigation.state.key;
        if v199.props.lastInputGroup == v22.InputType.Gamepad then
            if l_key_1 == l_key_3 and not v199.props.avatarRoute.isOverlayVisible and v200.avatarRoute.isOverlayVisible then
                v199:getFocusController().captureFocus();
            end;
            if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
                v66:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
                v199:getFocusController().captureFocus();
            end;
        end;
    end;
else
    v110.didUpdate = function(v205, v206, _) --[[ Line: 840 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy)
        if l_FFlagAXDurablesSupport_0 and not v205.timedOptionDeeplinkUpdated and v205.props.itemData and v205.props.itemData.timedOptions then
            for v208, v209 in v205.props.itemData.timedOptions do
                if v209.selected then
                    if v209.days == 0 then
                        local _ = nil;
                    end;
                    v205.onTimedOptionSelected(v208);
                    if not l_FFlagAXDurablesForMIS_0 then
                        v205.timedOptionDeeplinkUpdated = true;
                        break;
                    else
                        break;
                    end;
                end;
            end;
        end;
        if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 and v205.props.itemData and v205.props.itemData.timedOptions and v205.props.itemData.isOwned and (not v206.itemData or not v206.itemData.isOwned) then
            for v211, v212 in v205.props.itemData.timedOptions do
                if v212.selected then
                    v205.onTimedOptionSelected(v211);
                    return;
                end;
            end;
        end;
    end;
end;
v110.didMount = function(v213) --[[ Line: 879 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v46 (copy), v22 (copy), v66 (copy), v85 (copy), l_PeekViewState_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v214 = v46.isFirstItemDetailsPage(v213.props.navigation);
        if v213.props.lastInputGroup == v22.InputType.Gamepad and not v214 then
            v66:debug("gamepad captureFocus: ItemDetails, didMount");
            v213:getFocusController().captureFocus();
        end;
    end;
    if v213.props.redeemQRCodeItem and v85 then
        v213.props.redeemQRCodeItemPrompt(v213.props.networking, v213.props.analytics, v213.props.itemId, v213.props.itemType);
    end;
    if v213.props.showFullWithNoPeekView then
        v213.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v213.isMounted = true;
end;
v110.willUnmount = function(v215) --[[ Line: 906 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy), v46 (copy), l_PeekViewState_0 (copy)
    v215.isMounted = false;
    local v216 = v215.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
    local v217 = v215.props.navigation.state.routeName == l_AvatarScreen_0.ItemDetails;
    local v218 = not (v216 and v217);
    if v46.isFirstItemDetailsPage(v215.props.navigation) and v218 then
        v215.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v215.props.onItemDetailsClosed ~= nil then
            v215.props.onItemDetailsClosed();
        end;
    end;
end;
local function v230(v219, v220) --[[ Line: 928 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v59 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreen_0 (copy), v39 (copy), l_FormFactor_0 (copy), v54 (copy), v4 (copy)
    local l_itemId_4 = v220.itemId;
    local l_itemType_3 = v220.itemType;
    local v223 = v59(v219.AvatarExperience.Common, l_itemId_4, l_itemType_3);
    local v224 = if l_FFlagAXDurablesForMIS_0 then v219.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil;
    local v225 = if l_FFlagAXDurablesForMIS_0 then v224 and v224[l_getTryOnItemReducerKey_0(l_itemId_4, l_itemType_3)] ~= nil else nil;
    local l_key_4 = v220.navigation.state.key;
    local l_avatarRoute_0 = v220.avatarRoute;
    local l_key_5 = l_avatarRoute_0.current.key;
    local v229 = v220.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    if v229 and v223 ~= nil and v223.name == nil then
        v223 = nil;
    end;
    return {
        isSceneFullView = v39.getIsSceneFullViewFromState(v219, l_avatarRoute_0), 
        itemData = if v229 and v223 ~= nil and v223.name == nil then nil else v223, 
        wideMode = v219.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_key_5 == l_key_4, 
        topBarHeight = v39.getTopBarHeightAvatarScene(v219), 
        itemDetailsExpanded = v219.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = v219.Users[v219.LocalUserId] and v219.Users[v219.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v219.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v219.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v219.ScreenSize, 
        globalGuiInset = v219.GlobalGuiInset, 
        isPortrait = v54(v219), 
        numberOfTryOnItems = if l_FFlagAXDurablesForMIS_0 then v4.fieldCount(v224) else nil, 
        isCurrentItemInTryOns = if l_FFlagAXDurablesForMIS_0 then v225 else nil
    };
end;
local function v262(v231) --[[ Line: 971 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v55 (copy), v56 (copy), v35 (copy), v60 (copy), v29 (copy), v67 (copy), v78 (copy), v61 (copy), v79 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_SetSelectedTimedOption_0 (copy), v58 (copy), v57 (copy)
    return {
        closeAllPeekViews = function(v232) --[[ Line: 973 ]] --[[ Name: closeAllPeekViews ]]
            -- upvalues: v231 (copy), v55 (ref)
            v231(v55(v232));
        end, 
        closeFiltersAndItemDetails = function(v233) --[[ Line: 977 ]] --[[ Name: closeFiltersAndItemDetails ]]
            -- upvalues: v231 (copy), v56 (ref)
            v231(v56(v233));
        end, 
        closeFocusedScreen = function(v234) --[[ Line: 981 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v231 (copy), v35 (ref)
            v231(v35(v234));
        end, 
        setItemDetailsExpanded = function(v235) --[[ Line: 985 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v231 (copy), v60 (ref)
            v231(v60(v235));
        end, 
        setCurrentToastMessage = function(v236) --[[ Line: 989 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v231 (copy), v29 (ref)
            v231(v29(v236));
        end, 
        openItemPrompt = function(v237, v238, v239, v240, v241) --[[ Line: 993 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v231 (copy), v67 (ref)
            v231(v67(v237, v238, v239, v240, v241));
        end, 
        redeemQRCodeItemPrompt = function(v242, v243, v244, v245) --[[ Line: 997 ]] --[[ Name: redeemQRCodeItemPrompt ]]
            -- upvalues: v231 (copy), v78 (ref)
            v231(v78(v242, v243, v244, v245));
        end, 
        setItemDetailsPeekViewState = function(v246) --[[ Line: 1001 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v231 (copy), v61 (ref)
            v231(v61(v246));
        end, 
        setItemTryOnPeekViewState = function(v247) --[[ Line: 1005 ]] --[[ Name: setItemTryOnPeekViewState ]]
            -- upvalues: v231 (copy), v79 (ref)
            v231(v79(v247));
        end, 
        setSelectedTimedOption = l_FFlagAXDurablesForMIS_0 and function(v248, v249, v250) --[[ Line: 1010 ]]
            -- upvalues: v231 (copy), l_SetSelectedTimedOption_0 (ref)
            v231(l_SetSelectedTimedOption_0({
                itemId = v248, 
                itemType = v249, 
                selectedTimedOptionIndex = v250
            }));
        end or nil, 
        closeMatchingScreens = l_FFlagAXDurablesForMIS_0 and function(v251, v252) --[[ Line: 1020 ]]
            -- upvalues: v231 (copy), v58 (ref)
            v231(v58(v251, v252));
        end or nil, 
        toggleTryOnThunk = l_FFlagAXDurablesForMIS_0 and function(v253, v254, v255, v256, v257, v258, v259, v260, v261) --[[ Line: 1026 ]]
            -- upvalues: v231 (copy), v57 (ref)
            v231(v57(v253, v254, v255, v256, v257, v258, v259, v260, nil, false, false, v261));
        end or nil
    };
end;
v110 = v65(v110);
v110 = v52((v9.connect(v230, v262)(v110)));
v110 = l_RoactAppPolicy_0.connect(function(v263, _) --[[ Line: 1064 ]]
    return {
        peekViewFullViewEnabled = v263.getItemDetailsFullView(), 
        showPremiumContent = v263.getShowCatalogPremiumContent()
    };
end)(v110);
return function(v265) --[[ Line: 1071 ]] --[[ Name: ItemDetailsPageContainer ]]
    -- upvalues: l_useSelector_0 (copy), v107 (copy), v109 (copy), l_AvatarScreen_0 (copy), v16 (copy), v19 (copy), v74 (copy), l_useDispatch_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v18 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v69 (copy), v68 (copy), l_FocusNavigationEventNameEnum_0 (copy), v79 (copy), v61 (copy), v46 (copy), v67 (copy), l_PeekViewState_0 (copy), v72 (copy), l_useTableWrappedCallbackRef_0 (copy), v12 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v93 (copy), v5 (copy), v94 (copy), v110 (ref)
    local v266 = l_useSelector_0(v107);
    local v267 = l_useSelector_0(v109);
    local l_fromProfile_2 = v265.navigation.state.params.fromProfile;
    local v269 = v265.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    local v270 = v267 and l_fromProfile_2 and not v269;
    local l_showFullWithNoPeekView_0 = v265.navigation.state.params.showFullWithNoPeekView;
    local l_itemId_5 = v265.navigation.state.params.itemId;
    local l_itemType_4 = v265.navigation.state.params.itemType;
    local v274 = v16(v19);
    local v275 = v16(v74);
    local v276 = l_useDispatch_0();
    local v277 = if l_FFlagAXDurablesForMIS_0 then v18({
        updateSecondaryButtonText = "Feature.Avatar.Action.Update", 
        tryOnSecondaryButtonText = "Feature.Avatar.Action.TryOn"
    }) else nil;
    local v278 = v7.useRef(nil);
    local v279 = v7.useRef(nil);
    local v280 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useRef(v6.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v265.focusController then
        v280 = v265.focusController;
    end;
    local v281 = v69(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v280);
    local v282 = v68({
        overlayClosedCallback = v281
    });
    local v283 = v7.useMemo(function() --[[ Line: 1106 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v266 (copy)
        return {
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt, 
            [Enum.KeyCode.ButtonY] = if v266 then l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView else l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView, 
            [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
            [Enum.KeyCode.ButtonL2] = l_FocusNavigationEventNameEnum_0.MoveToItemDetails
        };
    end, {
        v266
    });
    local v285 = v7.useCallback(function(v284) --[[ Line: 1118 ]]
        -- upvalues: v269 (copy), v276 (copy), v79 (ref), v61 (ref)
        if v269 then
            v276(v79(v284));
            return;
        else
            v276(v61(v284));
            return;
        end;
    end, {
        v276, 
        v269
    });
    local v286 = v7.useCallback(function() --[[ Line: 1126 ]]
        -- upvalues: v46 (ref), v265 (copy)
        v46.closeFocusedScreen(v265.navigation);
    end, {
        v265.navigation
    });
    local v287 = v7.useCallback(function() --[[ Line: 1130 ]]
        -- upvalues: v276 (copy), v67 (ref), v274 (copy), v275 (copy), v281 (copy), v265 (copy)
        v276(v67(v274, v275, v281, v265.navigation, v265.avatarRoute));
    end, {
        v276, 
        v274, 
        v275, 
        v281, 
        v265.navigation, 
        v265.avatarRoute
    });
    local v288 = v7.useCallback(function() --[[ Line: 1134 ]]
        -- upvalues: v285 (copy), l_PeekViewState_0 (ref)
        v285(l_PeekViewState_0.Full);
    end, {
        v285
    });
    local v289 = v7.useCallback(function() --[[ Line: 1138 ]]
        -- upvalues: v285 (copy), l_PeekViewState_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v280 (ref), v278 (copy)
        v285(l_PeekViewState_0.Brief);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v280.moveFocusTo(v278);
        end;
    end, {
        v285, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v280
    });
    local v290 = v7.useCallback(function() --[[ Line: 1145 ]]
        -- upvalues: v265 (copy), l_AvatarScreen_0 (ref), l_itemId_5 (copy), l_itemType_4 (copy), v281 (copy), l_fromProfile_2 (copy), v269 (copy)
        v265.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
            itemId = l_itemId_5, 
            itemType = l_itemType_4, 
            onOverlayClosed = v281, 
            centered = l_fromProfile_2 or v269
        });
    end, {
        v265.navigation, 
        l_itemId_5, 
        l_itemType_4, 
        v281, 
        l_fromProfile_2, 
        v269
    });
    local v291 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useCallback(function() --[[ Line: 1156 ]]
        -- upvalues: v280 (ref)
        v280.moveFocusUp();
    end, {
        v280
    });
    local v292 = {
        onGoBack = v286, 
        onOpenItemPrompt = v287, 
        onOpenPeekView = if not not v270 or l_showFullWithNoPeekView_0 or v266 then nil else v288, 
        onClosePeekView = if not (not not v270 or l_showFullWithNoPeekView_0) and v266 then v289 else nil, 
        onOpenCatalogContextMenu = if not l_showFullWithNoPeekView_0 then v290 else nil
    };
    local v293 = v72(v279, v283, v292);
    v279 = l_useTableWrappedCallbackRef_0(v293);
    v292.onMoveToItemDetails = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v291;
    local v294 = v72(v278, v283, v292);
    v294 = l_useTableWrappedCallbackRef_0(v294);
    local v295 = v12.Dictionary.join(v265, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v280, 
        actionBarContainerRef = v294, 
        contentFrameRef = v279, 
        overlayClosedCallback = v281, 
        networking = v274, 
        analytics = v275, 
        itemDetailsExpanded = v266, 
        localization = if l_FFlagAXDurablesForMIS_0 then v277 else nil
    });
    local v296 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v297 = l_useNavigation_0();
        local v298 = l_useAvatarRoute_0();
        local v299 = true;
        if v297.state.rnKey ~= v298.current.key then
            v299 = v93 and v297.state.key == v298.current.key;
        end;
        v296 = v299;
    end;
    return v5.createElement("Frame", {
        [v5.Ref] = if v94 then nil else v282, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v296 else nil
    }, {
        ItemDetails = v7.createElement(v110, v295)
    });
end;