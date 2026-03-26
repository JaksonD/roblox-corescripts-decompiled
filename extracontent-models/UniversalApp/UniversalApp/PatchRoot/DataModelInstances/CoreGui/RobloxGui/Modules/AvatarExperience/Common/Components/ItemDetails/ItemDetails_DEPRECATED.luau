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
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v19 = require(l_CorePackages_0.Packages.t);
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_withStyle_0 = v10.Style.withStyle;
local v24 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v29 = require(l_Common_0.Thunks.CloseFocusedScreen);
local _ = require(l_Common_0.AvatarExperienceState);
local v31 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v32 = require(l_Common_0.Constants);
local v33 = require(l_Common_0.Utils);
local v34 = require(l_Common_0.Components.BoundInputsUpdater);
local v35 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer);
local v36 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer_DEPRECATED);
local v37 = require(l_Common_0.Components.ItemDetails.PeekViewTopBar);
local v38 = require(l_Common_0.Components.ItemDetails.VRItemDetailsTopBar);
local v39 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v40 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local l_SetSelectedTimedOption_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).State.Actions.SetSelectedTimedOption;
local v42 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v42.Enums.AvatarScreen;
local l_AvatarRoute_0 = v42.AvatarRoute.AvatarRoute;
local v45 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local v46 = require(l_Common_0.Validators.ItemDataValidator);
local v47 = require(l_Common_0.Selectors.selectIsPortrait);
local v48 = require(l_Common_0.Thunks.CloseAllPeekViews);
local v49 = require(l_Common_0.Thunks.CloseAllItemDetails);
local v50 = require(l_Common_0.Thunks.ToggleTryOnThunk);
local v51 = require(l_Common_0.Thunks.CloseMatchingScreens);
local v52 = require(l_Common_0.Selectors.ItemData);
local v53 = require(l_Common_0.Actions.SetItemDetailsExpanded);
local v54 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v55 = require(l_Common_0.Components.ItemDetails.ItemDetailsPeekView);
local v56 = require(l_Common_0.Components.ItemDetails.ItemDetailsModal);
local v57 = require(l_Common_0.Components.ItemDetails.ItemDetailsFull);
local v58 = require(l_Common_0.Components.withLastInputGroup);
local v59 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails");
local v60 = require(l_Common_0.Thunks.OpenItemPrompt);
local v61 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v62 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_getTryOnItemReducerKey_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getTryOnItemReducerKey;
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v65 = require(l_Catalog_0.Services.Analytics);
local v66 = require(l_Catalog_0.CatalogUtils);
local v67 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v68 = require(l_Catalog_0.CatalogConstants);
local v69 = require(l_Catalog_0.Thunks.RedeemQRCodeItem);
local v70 = require(l_Catalog_0.Actions.SetItemTryOnPeekViewState);
local v71 = require(l_Catalog_0.Components.OnFocusExposureLogger);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v73 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v74 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v75 = require(l_Flags_0.AvatarMarketplaceBackendIXPTests);
local v76 = require(l_Flags_0.FFlagQRCodeItemRedemptionEnabled);
local v77 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableItemDetailsPageLayerExposure);
local v78 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v79 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v74.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXMISEnableMultiShopping_0 = v73.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXDurablesForMIS_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local l_FFlagAXDurablesSupportForRFYMigration_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportForRFYMigration;
local l_FFlagAXDurablesSupportWithPostPurchaseFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportWithPostPurchaseFix;
local l_FFlagAXTryOnScreenImprovements_0 = v74.FFlagAXTryOnScreenImprovements;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v74.FFlagAXFixPurchaseSurfaceLogging;
local v90 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v90 = 4;
end;
local v91 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v21.InformationMessage
};
local v92 = l_GuiService_0:IsTenFootInterface();
local v93 = v5.PureComponent:extend("ItemDetails");
v93.validateProps = v19.strictInterface({
    itemId = v19.string, 
    itemType = v19.string, 
    itemSubType = v19.optional(v19.string), 
    isFirstItemDetails = v19.optional(v19.boolean), 
    fromContentFeed = v19.optional(v19.boolean), 
    fromProfile = v19.optional(v19.boolean), 
    showDropDownTopBar = v19.optional(v19.boolean), 
    showRobuxBalance = v19.optional(v19.boolean), 
    fromHome = if l_FFlagAXTryOnScreenImprovements_0 then nil else v19.optional(v19.boolean), 
    simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v19.optional(v19.boolean) else nil, 
    hideTab = if l_FFlagAXTryOnScreenImprovements_0 then v19.optional(v19.boolean) else nil, 
    shouldNavigateDown = if l_FFlagAXTryOnScreenImprovements_0 then v19.optional(v19.boolean) else nil, 
    fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v19.optional(v19.number) else nil, 
    itemSubTypeName = v19.optional(v19.string), 
    mountAsFullView = v19.optional(v19.boolean), 
    assetType = v19.optional(v19.string), 
    mountAnimation = v19.optional(v19.boolean), 
    itemDetailsPeekViewRefs = v19.optional(v19.table), 
    resultsListRef = v19.optional(v19.table), 
    detail = v19.optional(v19.string), 
    prevNavPage = v19.optional(v19.string), 
    prevNavHistory = v19.optional(v19.table), 
    showFullWithNoPeekView = v19.optional(v19.boolean), 
    widgetInfo = v19.optional(v19.table), 
    onItemDetailsClosed = v19.optional(v19.callback), 
    navigation = v19.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    isSceneFullView = v19.boolean, 
    itemData = v19.optional(v46), 
    peekViewShowing = v19.boolean, 
    topBarHeight = v19.number, 
    itemDetailsExpanded = v19.boolean, 
    playerMembership = v19.optional(v19.enum(Enum.MembershipType)), 
    lastInputGroup = v19.string, 
    itemDetailsTryOnViewState = v19.any, 
    itemDetailsViewState = v19.any, 
    screenSize = v19.Vector2, 
    globalGuiInset = v19.table, 
    wideMode = v19.boolean, 
    numberOfTryOnItems = if l_FFlagAXDurablesForMIS_0 then v19.number else nil, 
    isCurrentItemInTryOns = if l_FFlagAXDurablesForMIS_0 then v19.boolean else nil, 
    closeAllPeekViews = v19.callback, 
    closeFiltersAndItemDetails = v19.callback, 
    closeFocusedScreen = v19.callback, 
    setItemDetailsExpanded = v19.callback, 
    setCurrentToastMessage = v19.callback, 
    openItemPrompt = v19.callback, 
    redeemQRCodeItemPrompt = v19.callback, 
    setItemDetailsPeekViewState = v19.callback, 
    setItemTryOnPeekViewState = v19.callback, 
    isPortrait = v19.optional(v19.boolean), 
    setSelectedTimedOption = if l_FFlagAXDurablesForMIS_0 then v19.callback else nil, 
    toggleTryOnThunk = if l_FFlagAXDurablesForMIS_0 then v19.callback else nil, 
    closeMatchingScreens = if l_FFlagAXDurablesForMIS_0 then v19.callback else nil, 
    networking = v19.callback, 
    analytics = v19.table, 
    peekViewFullViewEnabled = v19.boolean, 
    showPremiumContent = v19.boolean, 
    overlayClosedCallback = v19.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v19.table, 
    localization = if l_FFlagAXDurablesForMIS_0 then v19.table else nil
});
v93.init = function(v94) --[[ Line: 232 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v78 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v12 (copy), v40 (copy), v91 (copy), l_memoize_0 (copy), l_PeekViewState_0 (copy), v66 (copy), l_AvatarScreen_0 (copy)
    v94.contentFrameRef = v5.createRef();
    v94.actionBarContainerRef = v5.createRef();
    v94.actionBarHeaderRef = v5.createRef();
    v94.backButtonRef = v5.createRef();
    local v95 = if v78() then {
        scrollingEnabled = true
    } else nil;
    if l_FFlagAXDurablesSupport_0 and v94.props.itemData and v94.props.itemData.timedOptions then
        for _, v97 in v94.props.itemData.timedOptions do
            if v97.selected then
                local l_days_0 = v97.days;
                if l_days_0 == 0 then
                    l_days_0 = nil;
                end;
                v95.selectedTimedOptionDays = l_days_0;
                break;
            end;
        end;
    end;
    v94.state = v95;
    if v94.props.showRobuxBalance then
        v94.robuxBalanceRef = v5.createRef();
    end;
    if l_FFlagAXDurablesSupportForRFYMigration_0 then
        v94.timedOptionDeeplinkUpdated = false;
        v94.onTimedOptionSelected = function(v99) --[[ Line: 264 ]]
            -- upvalues: v94 (copy), v5 (ref), l_FFlagAXDurablesForMIS_0 (ref)
            local l_days_1 = v94.props.itemData.timedOptions[v99].days;
            if l_days_1 == 0 then
                l_days_1 = v5.None;
            end;
            v94:setState({
                selectedTimedOptionDays = l_days_1
            });
            if l_FFlagAXDurablesForMIS_0 then
                v94.timedOptionDeeplinkUpdated = true;
            end;
        end;
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v94.updateTimedOptionSelection = function() --[[ Line: 280 ]]
            -- upvalues: v12 (ref), v94 (copy), v40 (ref)
            local v102 = v12.List.findWhere(v94.props.itemData.timedOptions, function(v101) --[[ Line: 281 ]]
                -- upvalues: v94 (ref)
                return v101.days == v94.state.selectedTimedOptionDays;
            end) or #v94.props.itemData.timedOptions;
            v94.props.setSelectedTimedOption(v94.props.itemId, v94.props.itemType, v102);
            v40.closeFocusedScreen(v94.props.navigation);
        end;
    end;
    v94.closeBriefView = function() --[[ Line: 294 ]]
        -- upvalues: v94 (copy)
        local l_analytics_0 = v94.props.analytics;
        local l_itemId_0 = v94.props.itemId;
        local l_itemType_0 = v94.props.itemType;
        l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        v94.props.closeFiltersAndItemDetails(v94.props.navigation);
    end;
    v94.onItemInvalid = function() --[[ Line: 305 ]]
        -- upvalues: v94 (copy), v91 (ref)
        if v94.isMounted then
            v94.closeBriefView();
            v94.props.setCurrentToastMessage(v91);
        end;
    end;
    v94.renderContentCallback = function() --[[ Line: 312 ]]
        -- upvalues: v94 (copy)
        return v94:renderContent();
    end;
    v94.getRenderTopBarCallback = l_memoize_0(function(v106) --[[ Line: 316 ]]
        -- upvalues: v94 (copy)
        return function() --[[ Line: 317 ]]
            -- upvalues: v94 (ref), v106 (copy)
            return v94:renderTopBar(v106);
        end;
    end);
    v94.getRenderActionBarCallback = l_memoize_0(function(v107, v108, v109, v110, v111) --[[ Line: 323 ]]
        -- upvalues: v94 (copy)
        return function() --[[ Line: 324 ]]
            -- upvalues: v94 (ref), v107 (copy), v108 (copy), v109 (copy), v110 (copy), v111 (copy)
            return v94:renderActionBar(v107, v108, v109, v110, v111);
        end;
    end);
    v94.setPeekViewState = function(v112) --[[ Line: 336 ]]
        -- upvalues: v94 (copy)
        if v94:getIsTryOnPage() then
            v94.props.setItemTryOnPeekViewState(v112);
            return;
        else
            v94.props.setItemDetailsPeekViewState(v112);
            return;
        end;
    end;
    v94.closePeekView = function() --[[ Line: 346 ]]
        -- upvalues: v94 (copy), l_PeekViewState_0 (ref)
        v94.setPeekViewState(l_PeekViewState_0.Brief);
    end;
    if l_FFlagAXDurablesForMIS_0 then
        v94.getShouldShowSecondaryButton = function() --[[ Line: 351 ]]
            -- upvalues: l_FFlagAXDurablesSupport_0 (ref), v94 (copy)
            if l_FFlagAXDurablesSupport_0 and v94.props.itemData and v94.props.itemData.timedOptions and v94.props.numberOfTryOnItems > 1 then
                return true;
            elseif not v94.props.isCurrentItemInTryOns then
                return true;
            else
                return false;
            end;
        end;
        v94.onTryOnSecondaryButtonActivated = function() --[[ Line: 366 ]]
            -- upvalues: v66 (ref), v94 (copy), v12 (ref), l_AvatarScreen_0 (ref)
            local v113 = v66.GetItemSubType(v94.props.itemType, v94.props.itemData);
            local v114 = nil;
            if v94.props.itemData.timedOptions then
                v114 = v12.List.findWhere(v94.props.itemData.timedOptions, function(v115) --[[ Line: 371 ]]
                    -- upvalues: v94 (ref)
                    return v115.days == v94.state.selectedTimedOptionDays;
                end) or #v94.props.itemData.timedOptions;
            end;
            v94.props.toggleTryOnThunk(v94.props.networking, v94.props.analytics, v94.props.itemType, v113, v94.props.itemId, true, v94.props.avatarRoute, v94.props.navigation, v114);
            v94.props.closeMatchingScreens(v94.props.navigation, {
                l_AvatarScreen_0.Checkout, 
                l_AvatarScreen_0.ItemDetails
            });
        end;
    end;
    if v78() then
        v94.setItemDetailsScrollingEnabled = function(v116) --[[ Line: 400 ]]
            -- upvalues: v94 (copy)
            v94:setState({
                scrollingEnabled = v116
            });
        end;
    end;
end;
v93.getBriefViewHeight = function(v117) --[[ Line: 408 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: v20 (copy), v92 (copy), v68 (copy)
    local v118 = 0;
    if v117.props.lastInputGroup == v20.InputType.Gamepad and v92 then
        v118 = v20.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return v68.ActionBar.ActionBarHeight + v68.ActionBar.ActionBarGradientHeight + v118 + 20;
end;
v93.renderTopBar = function(v119, v120) --[[ Line: 420 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), v5 (copy), l_IsVRAppBuild_0 (copy), v38 (copy), v37 (copy)
    local l_Theme_0 = v120.Theme;
    local l_fromProfile_0 = v119.props.fromProfile;
    local l_topBarHeight_0 = v119.props.topBarHeight;
    local v124 = nil;
    if v119.props.itemData then
        v124 = v119.props.itemData.name;
    end;
    local v125 = nil;
    v125 = if v119:getIsTryOnPage() then v119.props.itemDetailsTryOnViewState else v119.props.itemDetailsViewState;
    local v126 = nil;
    v126 = l_fromProfile_0 and 0 or v119.props.showDropDownTopBar and (not (v125 ~= l_PeekViewState_0.Full) or l_FFlagAXEnableHomeTryOnComplexView_0 and v125 == l_PeekViewState_0.Extended) and 0 or 1;
    return v5.createElement("Frame", {
        BackgroundTransparency = v126, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v119.topBarNavVisible
    }, {
        TopBar = if l_IsVRAppBuild_0() then v5.createElement(v38, {
            topBarHeight = l_topBarHeight_0, 
            title = v124, 
            closeFocusedScreen = v119.props.closeFocusedScreen, 
            navigation = v119.props.navigation
        }) else v5.createElement(v37, {
            [v5.Ref] = v119.backButtonRef, 
            NextSelectionDown = v119.contentFrameRef, 
            itemId = v119.props.itemId, 
            itemType = v119.props.itemType, 
            itemData = v119.props.itemData, 
            dropDownTopBar = v119.props.showDropDownTopBar, 
            peekViewState = v125, 
            closePeekView = v119.closePeekView, 
            showRobuxBalance = v119.props.showRobuxBalance
        })
    });
end;
v93.renderActionBar = function(v127, _, v129, v130, v131, v132) --[[ Line: 481 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v6 (copy), v67 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v90 (ref), l_Skeleton_0 (copy)
    local l_itemId_1 = v127.props.itemId;
    local l_itemType_1 = v127.props.itemType;
    local l_Theme_1 = v129.Theme;
    local l_Font_0 = v129.Font;
    local v137 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v138 = v131 and v131.name;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v140 = nil;
    v140 = if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 then v127.state.selectedTimedOptionDays else v132;
    return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v130), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v5.Ref] = v127.actionBarContainerRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v127.contentFrameRef, 
        inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
            MoveToItemDetailsContainer = v6.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 512 ]]
                -- upvalues: v127 (copy)
                v127:getFocusController().moveFocusUp();
            end)
        }
    }, {
        BuyActionBar = v5.createElement(v67, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            showTimedOptionInBuyButton = l_FFlagAXDurablesSupport_0 and v131 and v131.timedOptions and true or nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v131 and v131.timedOptions and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v127.state then v140 else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v127.onTimedOptionSelected else nil, 
            showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v127:getShouldShowSecondaryButton() else nil, 
            secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then if v127.props.isCurrentItemInTryOns then v127.props.localization.updateSecondaryButtonText else v127.props.localization.tryOnSecondaryButtonText else nil, 
            onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then if v127.props.isCurrentItemInTryOns then v127.updateTimedOptionSelection else v127.onTryOnSecondaryButtonActivated else nil, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v90 else nil, 
            ZIndex = 1
        }), 
        ActionBarHeader = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v137), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v5.Ref] = v127.actionBarHeaderRef
        }, {
            NameLabel = v138 and v5.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v137), 
                Text = v138, 
                TextSize = v137, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v5.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v137)
            })
        })
    });
end;
v93.renderContent = function(v141) --[[ Line: 574 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 (copy), v35 (copy), v36 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v78 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_itemId_2 = v141.props.itemId;
    local l_itemType_2 = v141.props.itemType;
    local l_itemSubType_0 = v141.props.itemSubType;
    local l_itemDetailsPeekViewRefs_0 = v141.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v141.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v141.props.peekViewFullViewEnabled;
    local l_assetType_0 = v141.props.assetType;
    local v149 = v141:getIsTryOnPage();
    if not l_itemId_2 then
        return nil;
    else
        local v150 = if l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 then v35 else v36;
        return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v150 else l_Focusable_0[v150], {
            actionBarHeaderRef = v141.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_2, 
            itemType = l_itemType_2, 
            itemSubType = l_itemSubType_0, 
            assetType = l_assetType_0, 
            onItemInvalid = v141.onItemInvalid, 
            showFullWithNoPeekView = v141.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v141:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v141:getFocusController(), 
            NextSelectionDown = v141.actionBarContainerRef, 
            NextSelectionUp = v141.backButtonRef, 
            ref = if v141.props.showFullWithNoPeekView then v141.contentFrameRef else nil, 
            setItemDetailsScrollingEnabled = if v78() then v141.setItemDetailsScrollingEnabled else nil, 
            simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v141.props.simpleView else if l_FFlagAXEnableHomeTryOnComplexView_0 then v149 and not v141.props.fromHome else nil, 
            onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v141.onTimedOptionSelected else nil
        });
    end;
end;
v93.getIsTryOnPage = function(v151) --[[ Line: 618 ]] --[[ Name: getIsTryOnPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v151.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
end;
v93.getItemDetailsComponent = function(v152, v153) --[[ Line: 622 ]] --[[ Name: getItemDetailsComponent ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v57 (copy), v56 (copy), v55 (copy)
    if l_IsVRAppBuild_0() then
        return v57;
    elseif v153 then
        return v56;
    elseif v152.props.showFullWithNoPeekView then
        return v57;
    else
        return v55;
    end;
end;
v93.render = function(v154) --[[ Line: 636 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v155) --[[ Line: 637 ]]
        -- upvalues: l_withStyle_0 (ref), v154 (copy)
        return l_withStyle_0(function(v156) --[[ Line: 638 ]]
            -- upvalues: v154 (ref), v155 (copy)
            return v154:renderWithProviders(v155, v156);
        end);
    end);
end;
v93.renderWithProviders = function(v157, v158, v159) --[[ Line: 644 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v32 (copy), l_PeekViewState_0 (copy), v5 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v6 (copy), v40 (copy), l_AvatarScreen_0 (copy), v39 (copy), v77 (copy), v71 (copy), v75 (copy), v79 (copy), v31 (copy), v34 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy), v78 (copy)
    local l_isSceneFullView_0 = v157.props.isSceneFullView;
    local l_itemId_3 = v157.props.itemId;
    local l_itemType_3 = v157.props.itemType;
    local l_key_0 = v157.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v157.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v157.props.resultsListRef;
    local v166 = v157:getIsTryOnPage();
    local l_wideMode_0 = v157.props.wideMode;
    local v168 = if v166 then v157.props.itemDetailsTryOnViewState else v157.props.itemDetailsViewState;
    if not l_itemId_3 then
        return;
    else
        local l_fromProfile_1 = v157.props.fromProfile;
        local v170 = l_wideMode_0 and l_fromProfile_1 and not v166;
        local l_isPortrait_0 = v157.props.isPortrait;
        local v172 = true;
        local v173 = UDim2.fromScale(0, 0);
        local v174 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if l_fromProfile_1 or v166 then
                local l_screenSize_0 = v157.props.screenSize;
                local l_globalGuiInset_0 = v157.props.globalGuiInset;
                local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset;
                local v178 = math.min(l_Offset_0, 640);
                if v166 and v178 < l_Offset_0 then
                    v172 = false;
                end;
                v173 = UDim2.fromOffset((l_Offset_0 - v178) / 2, 0);
                v174 = UDim2.new(0, v178, 1, 0);
            else
                v173 = UDim2.fromScale(v32.LandscapeNavWidth, 0);
                v174 = UDim2.fromScale(v32.LandscapeSceneWidth, 1);
            end;
        end;
        local v179 = v157:getBriefViewHeight();
        local v180 = v157.props.mountAsFullView and (v168 == l_PeekViewState_0.Full or v168 == l_PeekViewState_0.Extended);
        local v181 = v157:getItemDetailsComponent(v170);
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v5.Ref] = l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157:getFocusController(), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v180 and v157.contentFrameRef or v157.actionBarContainerRef, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 715 ]]
                    -- upvalues: v40 (ref), v157 (copy)
                    v40.closeFocusedScreen(v157.props.navigation);
                end), 
                OpenItemPrompt = v6.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 718 ]]
                    -- upvalues: v157 (copy)
                    v157.props.openItemPrompt(v157.props.networking, v157.props.analytics, v157.props.overlayClosedCallback, v157.props.navigation, v157.props.avatarRoute);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenClosePeekView = if not not v170 or v157.props.showFullWithNoPeekView then nil else v6.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 730 ]]
                    -- upvalues: v157 (copy), l_PeekViewState_0 (ref)
                    if v157.props.itemDetailsExpanded then
                        v157.setPeekViewState(l_PeekViewState_0.Brief);
                        v157:getFocusController().moveFocusTo(v157.actionBarContainerRef);
                        return;
                    else
                        v157.setPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = v157.props.itemDetailsExpanded and "Feature.Catalog.Action.CloseDetails" or "Feature.Catalog.Action.OpenDetails"
                }), 
                OpenCatalogContextMenu = if not v157.props.showFullWithNoPeekView then v6.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 743 ]]
                    -- upvalues: v157 (copy), l_AvatarScreen_0 (ref), l_itemId_3 (copy), l_itemType_3 (copy), l_fromProfile_1 (copy), v166 (copy)
                    v157.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_itemId_3, 
                        itemType = l_itemType_3, 
                        onOverlayClosed = v157.props.overlayClosedCallback, 
                        centered = l_fromProfile_1 or v166
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                }) else nil
            }, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v39, {
                focusController = v157:getFocusController()
            }), 
            ItemDetailsExposure = if v77() then nil else v5.createElement(v71, {
                ixpTest = v75.ItemDetailsPage
            }), 
            ItemDetails3DPreviewExposure = if v79.isEnabled() then v5.createElement(v71, {
                ixpTest = v79
            }) else nil, 
            NavigationEventsLogger = v5.createElement(v31, {
                pageName = "ItemDetails:" .. l_key_0
            }), 
            BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v34), 
            ItemDetailsContent = v5.createElement(v181, {
                renderBottomBar = v157.getRenderActionBarCallback(v158, v159, v179, v157.props.itemData, if l_FFlagAXDurablesSupportForRFYMigration_0 then v157.state.selectedTimedOptionDays else nil), 
                renderContent = v157.renderContentCallback, 
                renderTopBar = v157.getRenderTopBarCallback(v159), 
                isTryOnPage = v166, 
                peekViewState = v168, 
                setPeekViewState = v157.setPeekViewState, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157:getFocusController(), 
                actionBarContainerRef = v157.actionBarContainerRef, 
                contentFrameRef = v157.contentFrameRef, 
                closeBriefView = v157.closeBriefView, 
                viewPosition = v173, 
                viewSize = v174, 
                briefViewHeight = v179, 
                showDropShadow = v172, 
                analytics = v157.props.analytics, 
                avatarRoute = v157.props.avatarRoute, 
                closeAllPeekViews = v157.props.closeAllPeekViews, 
                closeFocusedScreen = v157.props.closeFocusedScreen, 
                fromProfile = v157.props.fromProfile, 
                itemDetailsExpanded = v157.props.itemDetailsExpanded, 
                itemId = v157.props.itemId, 
                itemType = v157.props.itemType, 
                lastInputGroup = v157.props.lastInputGroup, 
                mountAnimation = v157.props.mountAnimation, 
                mountAsFullView = v157.props.mountAsFullView, 
                navigation = v157.props.navigation, 
                peekViewFullViewEnabled = v157.props.peekViewFullViewEnabled, 
                peekViewShowing = v157.props.peekViewShowing, 
                setItemDetailsExpanded = v157.props.setItemDetailsExpanded, 
                topBarHeight = v157.props.topBarHeight, 
                scrollingEnabled = if v78() then v157.state.scrollingEnabled else nil
            })
        });
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v93.getFocusController = function(v182) --[[ Line: 827 ]] --[[ Name: getFocusController ]]
        return v182.props.focusController;
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v93.didUpdate = function(v183, v184, _) --[[ Line: 832 ]] --[[ Name: didUpdate ]]
        -- upvalues: v20 (copy), v59 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy), l_FFlagAXDurablesForMIS_0 (copy)
        local l_key_1 = v183.props.avatarRoute.current.key;
        local l_key_2 = v184.avatarRoute.current.key;
        local l_key_3 = v183.props.navigation.state.key;
        if v183.props.lastInputGroup == v20.InputType.Gamepad then
            if l_key_1 == l_key_3 and not v183.props.avatarRoute.isOverlayVisible and v184.avatarRoute.isOverlayVisible then
                v183:getFocusController().captureFocus();
            end;
            if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
                v59:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
                v183:getFocusController().captureFocus();
            end;
        end;
        if l_FFlagAXDurablesSupportForRFYMigration_0 and not v183.timedOptionDeeplinkUpdated and v183.props.itemData and v183.props.itemData.timedOptions then
            for v189, v190 in v183.props.itemData.timedOptions do
                if v190.selected then
                    if v190.days == 0 then
                        local _ = nil;
                    end;
                    v183.onTimedOptionSelected(v189);
                    if not l_FFlagAXDurablesForMIS_0 then
                        v183.timedOptionDeeplinkUpdated = true;
                        return;
                    else
                        break;
                    end;
                end;
            end;
        end;
    end;
else
    v93.didUpdate = function(v192, v193, _) --[[ Line: 876 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_FFlagAXDurablesSupportForRFYMigration_0 (copy), l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy)
        if l_FFlagAXDurablesSupportForRFYMigration_0 and not v192.timedOptionDeeplinkUpdated and v192.props.itemData and v192.props.itemData.timedOptions then
            for v195, v196 in v192.props.itemData.timedOptions do
                if v196.selected then
                    if v196.days == 0 then
                        local _ = nil;
                    end;
                    v192.onTimedOptionSelected(v195);
                    v192.timedOptionDeeplinkUpdated = true;
                    break;
                end;
            end;
        end;
        if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 and v192.props.itemData and v192.props.itemData.timedOptions and v192.props.itemData.isOwned and (not v193.itemData or not v193.itemData.isOwned) then
            for v198, v199 in v192.props.itemData.timedOptions do
                if v199.selected then
                    v192.onTimedOptionSelected(v198);
                    return;
                end;
            end;
        end;
    end;
end;
v93.didMount = function(v200) --[[ Line: 913 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v40 (copy), v20 (copy), v59 (copy), v76 (copy), l_PeekViewState_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v201 = v40.isFirstItemDetailsPage(v200.props.navigation);
        if v200.props.lastInputGroup == v20.InputType.Gamepad and not v201 then
            v59:debug("gamepad captureFocus: ItemDetails, didMount");
            v200:getFocusController().captureFocus();
        end;
    end;
    if v200.props.redeemQRCodeItem and v76 then
        v200.props.redeemQRCodeItemPrompt(v200.props.networking, v200.props.analytics, v200.props.itemId, v200.props.itemType);
    end;
    if v200.props.showFullWithNoPeekView then
        v200.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v200.isMounted = true;
end;
v93.willUnmount = function(v202) --[[ Line: 940 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy), v40 (copy), l_PeekViewState_0 (copy)
    v202.isMounted = false;
    local v203 = v202.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
    local v204 = v202.props.navigation.state.routeName == l_AvatarScreen_0.ItemDetails;
    local v205 = not (v203 and v204);
    if v40.isFirstItemDetailsPage(v202.props.navigation) and v205 then
        v202.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v202.props.onItemDetailsClosed ~= nil then
            v202.props.onItemDetailsClosed();
        end;
    end;
end;
local function v217(v206, v207) --[[ Line: 962 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v52 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_getTryOnItemReducerKey_0 (copy), l_AvatarScreen_0 (copy), v33 (copy), l_FormFactor_0 (copy), v47 (copy), v4 (copy)
    local l_itemId_4 = v207.itemId;
    local l_itemType_4 = v207.itemType;
    local v210 = v52(v206.AvatarExperience.Common, l_itemId_4, l_itemType_4);
    local v211 = if l_FFlagAXDurablesForMIS_0 then v206.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil;
    local v212 = if l_FFlagAXDurablesForMIS_0 then v211 and v211[l_getTryOnItemReducerKey_0(l_itemId_4, l_itemType_4)] ~= nil else nil;
    local l_key_4 = v207.navigation.state.key;
    local l_avatarRoute_0 = v207.avatarRoute;
    local l_key_5 = l_avatarRoute_0.current.key;
    local v216 = v207.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    if v216 and v210 ~= nil and v210.name == nil then
        v210 = nil;
    end;
    return {
        isSceneFullView = v33.getIsSceneFullViewFromState(v206, l_avatarRoute_0), 
        itemData = if v216 and v210 ~= nil and v210.name == nil then nil else v210, 
        wideMode = v206.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_key_5 == l_key_4, 
        topBarHeight = v33.getTopBarHeightAvatarScene(v206), 
        itemDetailsExpanded = v206.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = v206.Users[v206.LocalUserId] and v206.Users[v206.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v206.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v206.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v206.ScreenSize, 
        globalGuiInset = v206.GlobalGuiInset, 
        isPortrait = v47(v206), 
        numberOfTryOnItems = if l_FFlagAXDurablesForMIS_0 then v4.fieldCount(v211) else nil, 
        isCurrentItemInTryOns = if l_FFlagAXDurablesForMIS_0 then v212 else nil
    };
end;
local function v249(v218) --[[ Line: 1005 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v48 (copy), v49 (copy), v29 (copy), v53 (copy), v24 (copy), v60 (copy), v69 (copy), v54 (copy), v70 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_SetSelectedTimedOption_0 (copy), v51 (copy), v50 (copy)
    return {
        closeAllPeekViews = function(v219) --[[ Line: 1007 ]] --[[ Name: closeAllPeekViews ]]
            -- upvalues: v218 (copy), v48 (ref)
            v218(v48(v219));
        end, 
        closeFiltersAndItemDetails = function(v220) --[[ Line: 1011 ]] --[[ Name: closeFiltersAndItemDetails ]]
            -- upvalues: v218 (copy), v49 (ref)
            v218(v49(v220));
        end, 
        closeFocusedScreen = function(v221) --[[ Line: 1015 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v218 (copy), v29 (ref)
            v218(v29(v221));
        end, 
        setItemDetailsExpanded = function(v222) --[[ Line: 1019 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v218 (copy), v53 (ref)
            v218(v53(v222));
        end, 
        setCurrentToastMessage = function(v223) --[[ Line: 1023 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v218 (copy), v24 (ref)
            v218(v24(v223));
        end, 
        openItemPrompt = function(v224, v225, v226, v227, v228) --[[ Line: 1027 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v218 (copy), v60 (ref)
            v218(v60(v224, v225, v226, v227, v228));
        end, 
        redeemQRCodeItemPrompt = function(v229, v230, v231, v232) --[[ Line: 1031 ]] --[[ Name: redeemQRCodeItemPrompt ]]
            -- upvalues: v218 (copy), v69 (ref)
            v218(v69(v229, v230, v231, v232));
        end, 
        setItemDetailsPeekViewState = function(v233) --[[ Line: 1035 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v218 (copy), v54 (ref)
            v218(v54(v233));
        end, 
        setItemTryOnPeekViewState = function(v234) --[[ Line: 1039 ]] --[[ Name: setItemTryOnPeekViewState ]]
            -- upvalues: v218 (copy), v70 (ref)
            v218(v70(v234));
        end, 
        setSelectedTimedOption = l_FFlagAXDurablesForMIS_0 and function(v235, v236, v237) --[[ Line: 1044 ]]
            -- upvalues: v218 (copy), l_SetSelectedTimedOption_0 (ref)
            v218(l_SetSelectedTimedOption_0({
                itemId = v235, 
                itemType = v236, 
                selectedTimedOptionIndex = v237
            }));
        end or nil, 
        closeMatchingScreens = l_FFlagAXDurablesForMIS_0 and function(v238, v239) --[[ Line: 1054 ]]
            -- upvalues: v218 (copy), v51 (ref)
            v218(v51(v238, v239));
        end or nil, 
        toggleTryOnThunk = l_FFlagAXDurablesForMIS_0 and function(v240, v241, v242, v243, v244, v245, v246, v247, v248) --[[ Line: 1060 ]]
            -- upvalues: v218 (copy), v50 (ref)
            v218(v50(v240, v241, v242, v243, v244, v245, v246, v247, nil, false, false, v248));
        end or nil
    };
end;
v93 = v58(v93);
v93 = l_RoactServices_0.connect({
    networking = v17, 
    analytics = v65
})(v93);
v93 = v45((v9.connect(v217, v249)(v93)));
v93 = l_RoactAppPolicy_0.connect(function(v250, _) --[[ Line: 1103 ]]
    return {
        peekViewFullViewEnabled = v250.getItemDetailsFullView(), 
        showPremiumContent = v250.getShowCatalogPremiumContent()
    };
end)(v93);
return function(v252) --[[ Line: 1110 ]] --[[ Name: ItemDetailsPageContainer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), v6 (copy), l_FFlagAXDurablesForMIS_0 (copy), v16 (copy), v62 (copy), v61 (copy), v12 (copy), v5 (copy), v93 (ref)
    local v253 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useRef(v6.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v252.focusController then
        v253 = v252.focusController;
    end;
    local v254 = if l_FFlagAXDurablesForMIS_0 then v16({
        updateSecondaryButtonText = "Feature.Avatar.Action.Update", 
        tryOnSecondaryButtonText = "Feature.Avatar.Action.TryOn"
    }) else nil;
    local v255 = v62(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v253);
    local v256 = v61({
        overlayClosedCallback = v255
    });
    local v257 = v12.Dictionary.join(v252, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v253, 
        overlayClosedCallback = v255, 
        localization = if l_FFlagAXDurablesForMIS_0 then v254 else nil
    });
    return v5.createElement("Frame", {
        [v5.Ref] = v256, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        ItemDetails = v7.createElement(v93, v257)
    });
end;