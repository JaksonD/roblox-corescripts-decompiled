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
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v11 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v17 = require(l_CorePackages_0.Packages.t);
local v18 = require(l_Modules_0.LuaApp.Constants);
local v19 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_withStyle_0 = v9.Style.withStyle;
local v22 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v27 = require(l_Common_0.Thunks.CloseFocusedScreen);
local _ = require(l_Common_0.AvatarExperienceState);
local v29 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v30 = require(l_Common_0.Constants);
local v31 = require(l_Common_0.Utils);
local v32 = require(l_Common_0.Components.BoundInputsUpdater);
local v33 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer);
local v34 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer_DEPRECATED);
local v35 = require(l_Common_0.Components.ItemDetails.PeekViewTopBar);
local v36 = require(l_Common_0.Components.ItemDetails.VRItemDetailsTopBar);
local v37 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v38 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v39 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v39.Enums.AvatarScreen;
local l_AvatarRoute_0 = v39.AvatarRoute.AvatarRoute;
local v42 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local v43 = require(l_Common_0.Validators.ItemDataValidator);
local v44 = require(l_Common_0.Selectors.selectIsPortrait);
local v45 = require(l_Common_0.Thunks.CloseAllPeekViews);
local v46 = require(l_Common_0.Thunks.CloseAllItemDetails);
local v47 = require(l_Common_0.Selectors.ItemData);
local v48 = require(l_Common_0.Actions.SetItemDetailsExpanded);
local v49 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v50 = require(l_Common_0.Components.ItemDetails.ItemDetailsPeekView);
local v51 = require(l_Common_0.Components.ItemDetails.ItemDetailsModal);
local v52 = require(l_Common_0.Components.ItemDetails.ItemDetailsFull);
local v53 = require(l_Common_0.Components.withLastInputGroup);
local v54 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails");
local v55 = require(l_Common_0.Thunks.OpenItemPrompt);
local v56 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v57 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v59 = require(l_Catalog_0.Services.Analytics);
local v60 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v61 = require(l_Catalog_0.CatalogConstants);
local v62 = require(l_Catalog_0.Thunks.RedeemQRCodeItem);
local v63 = require(l_Catalog_0.Actions.SetItemTryOnPeekViewState);
local v64 = require(l_Catalog_0.Components.OnFocusExposureLogger);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v66 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v67 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v68 = require(l_Flags_0.AvatarMarketplaceBackendIXPTests);
local v69 = require(l_Flags_0.FFlagQRCodeItemRedemptionEnabled);
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableItemDetailsPageLayerExposure);
local v71 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v72 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v67.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXMISEnableMultiShopping_0 = v66.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForRFYMigration_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportForRFYMigration;
local l_FFlagAXDurablesSupportWithPostPurchaseFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportWithPostPurchaseFix;
local l_FFlagAXTryOnScreenImprovements_0 = v67.FFlagAXTryOnScreenImprovements;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v67.FFlagAXFixPurchaseSurfaceLogging;
local v82 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v82 = 4;
end;
local v83 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v19.InformationMessage
};
local v84 = l_GuiService_0:IsTenFootInterface();
local v85 = v4.PureComponent:extend("ItemDetails");
v85.validateProps = v17.strictInterface({
    itemId = v17.string, 
    itemType = v17.string, 
    itemSubType = v17.optional(v17.string), 
    isFirstItemDetails = v17.optional(v17.boolean), 
    fromContentFeed = v17.optional(v17.boolean), 
    fromProfile = v17.optional(v17.boolean), 
    showDropDownTopBar = v17.optional(v17.boolean), 
    showRobuxBalance = v17.optional(v17.boolean), 
    fromHome = if l_FFlagAXTryOnScreenImprovements_0 then nil else v17.optional(v17.boolean), 
    simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v17.optional(v17.boolean) else nil, 
    hideTab = if l_FFlagAXTryOnScreenImprovements_0 then v17.optional(v17.boolean) else nil, 
    shouldNavigateDown = if l_FFlagAXTryOnScreenImprovements_0 then v17.optional(v17.boolean) else nil, 
    fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v17.optional(v17.number) else nil, 
    itemSubTypeName = v17.optional(v17.string), 
    mountAsFullView = v17.optional(v17.boolean), 
    assetType = v17.optional(v17.string), 
    mountAnimation = v17.optional(v17.boolean), 
    itemDetailsPeekViewRefs = v17.optional(v17.table), 
    resultsListRef = v17.optional(v17.table), 
    detail = v17.optional(v17.string), 
    prevNavPage = v17.optional(v17.string), 
    prevNavHistory = v17.optional(v17.table), 
    showFullWithNoPeekView = v17.optional(v17.boolean), 
    widgetInfo = v17.optional(v17.table), 
    onItemDetailsClosed = v17.optional(v17.callback), 
    navigation = v17.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    isSceneFullView = v17.boolean, 
    itemData = v17.optional(v43), 
    peekViewShowing = v17.boolean, 
    topBarHeight = v17.number, 
    itemDetailsExpanded = v17.boolean, 
    playerMembership = v17.optional(v17.enum(Enum.MembershipType)), 
    lastInputGroup = v17.string, 
    itemDetailsTryOnViewState = v17.any, 
    itemDetailsViewState = v17.any, 
    screenSize = v17.Vector2, 
    globalGuiInset = v17.table, 
    wideMode = v17.boolean, 
    closeAllPeekViews = v17.callback, 
    closeFiltersAndItemDetails = v17.callback, 
    closeFocusedScreen = v17.callback, 
    setItemDetailsExpanded = v17.callback, 
    setCurrentToastMessage = v17.callback, 
    openItemPrompt = v17.callback, 
    redeemQRCodeItemPrompt = v17.callback, 
    setItemDetailsPeekViewState = v17.callback, 
    setItemTryOnPeekViewState = v17.callback, 
    isPortrait = v17.optional(v17.boolean), 
    networking = v17.callback, 
    analytics = v17.table, 
    peekViewFullViewEnabled = v17.boolean, 
    showPremiumContent = v17.boolean, 
    overlayClosedCallback = v17.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v17.table
});
v85.init = function(v86) --[[ Line: 216 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v71 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy), v83 (copy), l_memoize_0 (copy), l_PeekViewState_0 (copy)
    v86.contentFrameRef = v4.createRef();
    v86.actionBarContainerRef = v4.createRef();
    v86.actionBarHeaderRef = v4.createRef();
    v86.backButtonRef = v4.createRef();
    local v87 = if v71() then {
        scrollingEnabled = true
    } else nil;
    if l_FFlagAXDurablesSupport_0 and v86.props.itemData and v86.props.itemData.timedOptions then
        for _, v89 in v86.props.itemData.timedOptions do
            if v89.selected then
                local l_days_0 = v89.days;
                if l_days_0 == 0 then
                    l_days_0 = nil;
                end;
                v87.selectedTimedOptionDays = l_days_0;
                break;
            end;
        end;
    end;
    v86.state = v87;
    if v86.props.showRobuxBalance then
        v86.robuxBalanceRef = v4.createRef();
    end;
    if l_FFlagAXDurablesSupportForRFYMigration_0 then
        v86.timedOptionDeeplinkUpdated = false;
        v86.onTimedOptionSelected = function(v91) --[[ Line: 248 ]]
            -- upvalues: v86 (copy), v4 (ref)
            local l_days_1 = v86.props.itemData.timedOptions[v91].days;
            if l_days_1 == 0 then
                l_days_1 = v4.None;
            end;
            v86:setState({
                selectedTimedOptionDays = l_days_1
            });
        end;
    end;
    v86.closeBriefView = function() --[[ Line: 260 ]]
        -- upvalues: v86 (copy)
        local l_analytics_0 = v86.props.analytics;
        local l_itemId_0 = v86.props.itemId;
        local l_itemType_0 = v86.props.itemType;
        l_analytics_0.closeItemDetailPage(l_itemId_0, l_itemType_0);
        v86.props.closeFiltersAndItemDetails(v86.props.navigation);
    end;
    v86.onItemInvalid = function() --[[ Line: 271 ]]
        -- upvalues: v86 (copy), v83 (ref)
        if v86.isMounted then
            v86.closeBriefView();
            v86.props.setCurrentToastMessage(v83);
        end;
    end;
    v86.renderContentCallback = function() --[[ Line: 278 ]]
        -- upvalues: v86 (copy)
        return v86:renderContent();
    end;
    v86.getRenderTopBarCallback = l_memoize_0(function(v96) --[[ Line: 282 ]]
        -- upvalues: v86 (copy)
        return function() --[[ Line: 283 ]]
            -- upvalues: v86 (ref), v96 (copy)
            return v86:renderTopBar(v96);
        end;
    end);
    v86.getRenderActionBarCallback = l_memoize_0(function(v97, v98, v99, v100, v101) --[[ Line: 289 ]]
        -- upvalues: v86 (copy)
        return function() --[[ Line: 290 ]]
            -- upvalues: v86 (ref), v97 (copy), v98 (copy), v99 (copy), v100 (copy), v101 (copy)
            return v86:renderActionBar(v97, v98, v99, v100, v101);
        end;
    end);
    v86.setPeekViewState = function(v102) --[[ Line: 302 ]]
        -- upvalues: v86 (copy)
        if v86:getIsTryOnPage() then
            v86.props.setItemTryOnPeekViewState(v102);
            return;
        else
            v86.props.setItemDetailsPeekViewState(v102);
            return;
        end;
    end;
    v86.closePeekView = function() --[[ Line: 312 ]]
        -- upvalues: v86 (copy), l_PeekViewState_0 (ref)
        v86.setPeekViewState(l_PeekViewState_0.Brief);
    end;
    if v71() then
        v86.setItemDetailsScrollingEnabled = function(v103) --[[ Line: 317 ]]
            -- upvalues: v86 (copy)
            v86:setState({
                scrollingEnabled = v103
            });
        end;
    end;
end;
v85.getBriefViewHeight = function(v104) --[[ Line: 325 ]] --[[ Name: getBriefViewHeight ]]
    -- upvalues: v18 (copy), v84 (copy), v61 (copy)
    local v105 = 0;
    if v104.props.lastInputGroup == v18.InputType.Gamepad and v84 then
        v105 = v18.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    return v61.ActionBar.ActionBarHeight + v61.ActionBar.ActionBarGradientHeight + v105 + 20;
end;
v85.renderTopBar = function(v106, v107) --[[ Line: 337 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_PeekViewState_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), v4 (copy), l_IsVRAppBuild_0 (copy), v36 (copy), v35 (copy)
    local l_Theme_0 = v107.Theme;
    local l_fromProfile_0 = v106.props.fromProfile;
    local l_topBarHeight_0 = v106.props.topBarHeight;
    local v111 = nil;
    if v106.props.itemData then
        v111 = v106.props.itemData.name;
    end;
    local v112 = nil;
    v112 = if v106:getIsTryOnPage() then v106.props.itemDetailsTryOnViewState else v106.props.itemDetailsViewState;
    local v113 = nil;
    v113 = l_fromProfile_0 and 0 or v106.props.showDropDownTopBar and (not (v112 ~= l_PeekViewState_0.Full) or l_FFlagAXEnableHomeTryOnComplexView_0 and v112 == l_PeekViewState_0.Extended) and 0 or 1;
    return v4.createElement("Frame", {
        BackgroundTransparency = v113, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v106.topBarNavVisible
    }, {
        TopBar = if l_IsVRAppBuild_0() then v4.createElement(v36, {
            topBarHeight = l_topBarHeight_0, 
            title = v111, 
            closeFocusedScreen = v106.props.closeFocusedScreen, 
            navigation = v106.props.navigation
        }) else v4.createElement(v35, {
            [v4.Ref] = v106.backButtonRef, 
            NextSelectionDown = v106.contentFrameRef, 
            itemId = v106.props.itemId, 
            itemType = v106.props.itemType, 
            itemData = v106.props.itemData, 
            dropDownTopBar = v106.props.showDropDownTopBar, 
            peekViewState = v112, 
            closePeekView = v106.closePeekView, 
            showRobuxBalance = v106.props.showRobuxBalance
        })
    });
end;
v85.renderActionBar = function(v114, _, v116, v117, v118, v119) --[[ Line: 398 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v5 (copy), v60 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v82 (ref), l_Skeleton_0 (copy)
    local l_itemId_1 = v114.props.itemId;
    local l_itemType_1 = v114.props.itemType;
    local l_Theme_1 = v116.Theme;
    local l_Font_0 = v116.Font;
    local v124 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v125 = v118 and v118.name;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v127 = nil;
    v127 = if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 then v114.state.selectedTimedOptionDays else v119;
    return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v117), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v4.Ref] = v114.actionBarContainerRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v114.contentFrameRef, 
        inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
            MoveToItemDetailsContainer = v5.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 429 ]]
                -- upvalues: v114 (copy)
                v114:getFocusController().moveFocusUp();
            end)
        }
    }, {
        BuyActionBar = v4.createElement(v60, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            showTimedOptionInBuyButton = l_FFlagAXDurablesSupport_0 and v118 and v118.timedOptions and true or nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v118 and v118.timedOptions and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v114.state then v127 else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v114.onTimedOptionSelected else nil, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v82 else nil, 
            ZIndex = 1
        }), 
        ActionBarHeader = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v124), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v4.Ref] = v114.actionBarHeaderRef
        }, {
            NameLabel = v125 and v4.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v124), 
                Text = v125, 
                TextSize = v124, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v4.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v124)
            })
        })
    });
end;
v85.renderContent = function(v128) --[[ Line: 479 ]] --[[ Name: renderContent ]]
    -- upvalues: l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 (copy), v33 (copy), v34 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v71 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_itemId_2 = v128.props.itemId;
    local l_itemType_2 = v128.props.itemType;
    local l_itemSubType_0 = v128.props.itemSubType;
    local l_itemDetailsPeekViewRefs_0 = v128.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v128.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v128.props.peekViewFullViewEnabled;
    local l_assetType_0 = v128.props.assetType;
    local v136 = v128:getIsTryOnPage();
    if not l_itemId_2 then
        return nil;
    else
        local v137 = if l_FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation_0 then v33 else v34;
        return v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v137 else l_Focusable_0[v137], {
            actionBarHeaderRef = v128.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_2, 
            itemType = l_itemType_2, 
            itemSubType = l_itemSubType_0, 
            assetType = l_assetType_0, 
            onItemInvalid = v128.onItemInvalid, 
            showFullWithNoPeekView = v128.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v128:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v128:getFocusController(), 
            NextSelectionDown = v128.actionBarContainerRef, 
            NextSelectionUp = v128.backButtonRef, 
            ref = if v128.props.showFullWithNoPeekView then v128.contentFrameRef else nil, 
            setItemDetailsScrollingEnabled = if v71() then v128.setItemDetailsScrollingEnabled else nil, 
            simpleView = if l_FFlagAXTryOnScreenImprovements_0 then v128.props.simpleView else if l_FFlagAXEnableHomeTryOnComplexView_0 then v136 and not v128.props.fromHome else nil, 
            onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v128.onTimedOptionSelected else nil
        });
    end;
end;
v85.getIsTryOnPage = function(v138) --[[ Line: 523 ]] --[[ Name: getIsTryOnPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v138.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
end;
v85.getItemDetailsComponent = function(v139, v140) --[[ Line: 527 ]] --[[ Name: getItemDetailsComponent ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v52 (copy), v51 (copy), v50 (copy)
    if l_IsVRAppBuild_0() then
        return v52;
    elseif v140 then
        return v51;
    elseif v139.props.showFullWithNoPeekView then
        return v52;
    else
        return v50;
    end;
end;
v85.render = function(v141) --[[ Line: 541 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), l_withStyle_0 (copy)
    return l_withSelectionCursorProvider_0(function(v142) --[[ Line: 542 ]]
        -- upvalues: l_withStyle_0 (ref), v141 (copy)
        return l_withStyle_0(function(v143) --[[ Line: 543 ]]
            -- upvalues: v141 (ref), v142 (copy)
            return v141:renderWithProviders(v142, v143);
        end);
    end);
end;
v85.renderWithProviders = function(v144, v145, v146) --[[ Line: 549 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v30 (copy), l_PeekViewState_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v5 (copy), v38 (copy), l_AvatarScreen_0 (copy), v37 (copy), v70 (copy), v64 (copy), v68 (copy), v72 (copy), v29 (copy), v32 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy), v71 (copy)
    local l_isSceneFullView_0 = v144.props.isSceneFullView;
    local l_itemId_3 = v144.props.itemId;
    local l_itemType_3 = v144.props.itemType;
    local l_key_0 = v144.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v144.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v144.props.resultsListRef;
    local v153 = v144:getIsTryOnPage();
    local l_wideMode_0 = v144.props.wideMode;
    local v155 = if v153 then v144.props.itemDetailsTryOnViewState else v144.props.itemDetailsViewState;
    if not l_itemId_3 then
        return;
    else
        local l_fromProfile_1 = v144.props.fromProfile;
        local v157 = l_wideMode_0 and l_fromProfile_1 and not v153;
        local l_isPortrait_0 = v144.props.isPortrait;
        local v159 = true;
        local v160 = UDim2.fromScale(0, 0);
        local v161 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if l_fromProfile_1 or v153 then
                local l_screenSize_0 = v144.props.screenSize;
                local l_globalGuiInset_0 = v144.props.globalGuiInset;
                local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset;
                local v165 = math.min(l_Offset_0, 640);
                if v153 and v165 < l_Offset_0 then
                    v159 = false;
                end;
                v160 = UDim2.fromOffset((l_Offset_0 - v165) / 2, 0);
                v161 = UDim2.new(0, v165, 1, 0);
            else
                v160 = UDim2.fromScale(v30.LandscapeNavWidth, 0);
                v161 = UDim2.fromScale(v30.LandscapeSceneWidth, 1);
            end;
        end;
        local v166 = v144:getBriefViewHeight();
        local v167 = v144.props.mountAsFullView and (v155 == l_PeekViewState_0.Full or v155 == l_PeekViewState_0.Extended);
        local v168 = v144:getItemDetailsComponent(v157);
        return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v4.Ref] = l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144:getFocusController(), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167 and v144.contentFrameRef or v144.actionBarContainerRef, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 620 ]]
                    -- upvalues: v38 (ref), v144 (copy)
                    v38.closeFocusedScreen(v144.props.navigation);
                end), 
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 623 ]]
                    -- upvalues: v144 (copy)
                    v144.props.openItemPrompt(v144.props.networking, v144.props.analytics, v144.props.overlayClosedCallback, v144.props.navigation, v144.props.avatarRoute);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenClosePeekView = if not not v157 or v144.props.showFullWithNoPeekView then nil else v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 635 ]]
                    -- upvalues: v144 (copy), l_PeekViewState_0 (ref)
                    if v144.props.itemDetailsExpanded then
                        v144.setPeekViewState(l_PeekViewState_0.Brief);
                        v144:getFocusController().moveFocusTo(v144.actionBarContainerRef);
                        return;
                    else
                        v144.setPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = v144.props.itemDetailsExpanded and "Feature.Catalog.Action.CloseDetails" or "Feature.Catalog.Action.OpenDetails"
                }), 
                OpenCatalogContextMenu = if not v144.props.showFullWithNoPeekView then v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 648 ]]
                    -- upvalues: v144 (copy), l_AvatarScreen_0 (ref), l_itemId_3 (copy), l_itemType_3 (copy), l_fromProfile_1 (copy), v153 (copy)
                    v144.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_itemId_3, 
                        itemType = l_itemType_3, 
                        onOverlayClosed = v144.props.overlayClosedCallback, 
                        centered = l_fromProfile_1 or v153
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                }) else nil
            }, 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v37, {
                focusController = v144:getFocusController()
            }), 
            ItemDetailsExposure = if v70() then nil else v4.createElement(v64, {
                ixpTest = v68.ItemDetailsPage
            }), 
            ItemDetails3DPreviewExposure = if v72.isEnabled() then v4.createElement(v64, {
                ixpTest = v72
            }) else nil, 
            NavigationEventsLogger = v4.createElement(v29, {
                pageName = "ItemDetails:" .. l_key_0
            }), 
            BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v32), 
            ItemDetailsContent = v4.createElement(v168, {
                renderBottomBar = v144.getRenderActionBarCallback(v145, v146, v166, v144.props.itemData, if l_FFlagAXDurablesSupportForRFYMigration_0 then v144.state.selectedTimedOptionDays else nil), 
                renderContent = v144.renderContentCallback, 
                renderTopBar = v144.getRenderTopBarCallback(v146), 
                isTryOnPage = v153, 
                peekViewState = v155, 
                setPeekViewState = v144.setPeekViewState, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v144:getFocusController(), 
                actionBarContainerRef = v144.actionBarContainerRef, 
                contentFrameRef = v144.contentFrameRef, 
                closeBriefView = v144.closeBriefView, 
                viewPosition = v160, 
                viewSize = v161, 
                briefViewHeight = v166, 
                showDropShadow = v159, 
                analytics = v144.props.analytics, 
                avatarRoute = v144.props.avatarRoute, 
                closeAllPeekViews = v144.props.closeAllPeekViews, 
                closeFocusedScreen = v144.props.closeFocusedScreen, 
                fromProfile = v144.props.fromProfile, 
                itemDetailsExpanded = v144.props.itemDetailsExpanded, 
                itemId = v144.props.itemId, 
                itemType = v144.props.itemType, 
                lastInputGroup = v144.props.lastInputGroup, 
                mountAnimation = v144.props.mountAnimation, 
                mountAsFullView = v144.props.mountAsFullView, 
                navigation = v144.props.navigation, 
                peekViewFullViewEnabled = v144.props.peekViewFullViewEnabled, 
                peekViewShowing = v144.props.peekViewShowing, 
                setItemDetailsExpanded = v144.props.setItemDetailsExpanded, 
                topBarHeight = v144.props.topBarHeight, 
                scrollingEnabled = if v71() then v144.state.scrollingEnabled else nil
            })
        });
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v85.getFocusController = function(v169) --[[ Line: 732 ]] --[[ Name: getFocusController ]]
        return v169.props.focusController;
    end;
end;
if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    v85.didUpdate = function(v170, v171, _) --[[ Line: 737 ]] --[[ Name: didUpdate ]]
        -- upvalues: v18 (copy), v54 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy)
        local l_key_1 = v170.props.avatarRoute.current.key;
        local l_key_2 = v171.avatarRoute.current.key;
        local l_key_3 = v170.props.navigation.state.key;
        if v170.props.lastInputGroup == v18.InputType.Gamepad then
            if l_key_1 == l_key_3 and not v170.props.avatarRoute.isOverlayVisible and v171.avatarRoute.isOverlayVisible then
                v170:getFocusController().captureFocus();
            end;
            if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
                v54:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
                v170:getFocusController().captureFocus();
            end;
        end;
        if l_FFlagAXDurablesSupportForRFYMigration_0 and not v170.timedOptionDeeplinkUpdated and v170.props.itemData and v170.props.itemData.timedOptions then
            for v176, v177 in v170.props.itemData.timedOptions do
                if v177.selected then
                    if v177.days == 0 then
                        local _ = nil;
                    end;
                    v170.onTimedOptionSelected(v176);
                    v170.timedOptionDeeplinkUpdated = true;
                    return;
                end;
            end;
        end;
    end;
else
    v85.didUpdate = function(v179, v180, _) --[[ Line: 779 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_FFlagAXDurablesSupportForRFYMigration_0 (copy), l_FFlagAXDurablesSupportWithPostPurchaseFix_0 (copy)
        if l_FFlagAXDurablesSupportForRFYMigration_0 and not v179.timedOptionDeeplinkUpdated and v179.props.itemData and v179.props.itemData.timedOptions then
            for v182, v183 in v179.props.itemData.timedOptions do
                if v183.selected then
                    if v183.days == 0 then
                        local _ = nil;
                    end;
                    v179.onTimedOptionSelected(v182);
                    v179.timedOptionDeeplinkUpdated = true;
                    break;
                end;
            end;
        end;
        if l_FFlagAXDurablesSupportWithPostPurchaseFix_0 and v179.props.itemData and v179.props.itemData.timedOptions and v179.props.itemData.isOwned and (not v180.itemData or not v180.itemData.isOwned) then
            for v185, v186 in v179.props.itemData.timedOptions do
                if v186.selected then
                    v179.onTimedOptionSelected(v185);
                    return;
                end;
            end;
        end;
    end;
end;
v85.didMount = function(v187) --[[ Line: 816 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v38 (copy), v18 (copy), v54 (copy), v69 (copy), l_PeekViewState_0 (copy)
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v188 = v38.isFirstItemDetailsPage(v187.props.navigation);
        if v187.props.lastInputGroup == v18.InputType.Gamepad and not v188 then
            v54:debug("gamepad captureFocus: ItemDetails, didMount");
            v187:getFocusController().captureFocus();
        end;
    end;
    if v187.props.redeemQRCodeItem and v69 then
        v187.props.redeemQRCodeItemPrompt(v187.props.networking, v187.props.analytics, v187.props.itemId, v187.props.itemType);
    end;
    if v187.props.showFullWithNoPeekView then
        v187.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v187.isMounted = true;
end;
v85.willUnmount = function(v189) --[[ Line: 843 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AvatarScreen_0 (copy), v38 (copy), l_PeekViewState_0 (copy)
    v189.isMounted = false;
    local v190 = v189.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
    local v191 = v189.props.navigation.state.routeName == l_AvatarScreen_0.ItemDetails;
    local v192 = not (v190 and v191);
    if v38.isFirstItemDetailsPage(v189.props.navigation) and v192 then
        v189.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v189.props.onItemDetailsClosed ~= nil then
            v189.props.onItemDetailsClosed();
        end;
    end;
end;
local function v202(v193, v194) --[[ Line: 865 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v47 (copy), l_AvatarScreen_0 (copy), v31 (copy), l_FormFactor_0 (copy), v44 (copy)
    local l_itemId_4 = v194.itemId;
    local l_itemType_4 = v194.itemType;
    local v197 = v47(v193.AvatarExperience.Common, l_itemId_4, l_itemType_4);
    local l_key_4 = v194.navigation.state.key;
    local l_avatarRoute_0 = v194.avatarRoute;
    local l_key_5 = l_avatarRoute_0.current.key;
    local v201 = v194.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
    if v201 and v197 ~= nil and v197.name == nil then
        v197 = nil;
    end;
    return {
        isSceneFullView = v31.getIsSceneFullViewFromState(v193, l_avatarRoute_0), 
        itemData = if v201 and v197 ~= nil and v197.name == nil then nil else v197, 
        wideMode = v193.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_key_5 == l_key_4, 
        topBarHeight = v31.getTopBarHeightAvatarScene(v193), 
        itemDetailsExpanded = v193.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = v193.Users[v193.LocalUserId] and v193.Users[v193.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v193.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v193.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v193.ScreenSize, 
        globalGuiInset = v193.GlobalGuiInset, 
        isPortrait = v44(v193)
    };
end;
local function v220(v203) --[[ Line: 902 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v45 (copy), v46 (copy), v27 (copy), v48 (copy), v22 (copy), v55 (copy), v62 (copy), v49 (copy), v63 (copy)
    return {
        closeAllPeekViews = function(v204) --[[ Line: 904 ]] --[[ Name: closeAllPeekViews ]]
            -- upvalues: v203 (copy), v45 (ref)
            v203(v45(v204));
        end, 
        closeFiltersAndItemDetails = function(v205) --[[ Line: 908 ]] --[[ Name: closeFiltersAndItemDetails ]]
            -- upvalues: v203 (copy), v46 (ref)
            v203(v46(v205));
        end, 
        closeFocusedScreen = function(v206) --[[ Line: 912 ]] --[[ Name: closeFocusedScreen ]]
            -- upvalues: v203 (copy), v27 (ref)
            v203(v27(v206));
        end, 
        setItemDetailsExpanded = function(v207) --[[ Line: 916 ]] --[[ Name: setItemDetailsExpanded ]]
            -- upvalues: v203 (copy), v48 (ref)
            v203(v48(v207));
        end, 
        setCurrentToastMessage = function(v208) --[[ Line: 920 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v203 (copy), v22 (ref)
            v203(v22(v208));
        end, 
        openItemPrompt = function(v209, v210, v211, v212, v213) --[[ Line: 924 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v203 (copy), v55 (ref)
            v203(v55(v209, v210, v211, v212, v213));
        end, 
        redeemQRCodeItemPrompt = function(v214, v215, v216, v217) --[[ Line: 928 ]] --[[ Name: redeemQRCodeItemPrompt ]]
            -- upvalues: v203 (copy), v62 (ref)
            v203(v62(v214, v215, v216, v217));
        end, 
        setItemDetailsPeekViewState = function(v218) --[[ Line: 932 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v203 (copy), v49 (ref)
            v203(v49(v218));
        end, 
        setItemTryOnPeekViewState = function(v219) --[[ Line: 936 ]] --[[ Name: setItemTryOnPeekViewState ]]
            -- upvalues: v203 (copy), v63 (ref)
            v203(v63(v219));
        end
    };
end;
v85 = v53(v85);
v85 = l_RoactServices_0.connect({
    networking = v15, 
    analytics = v59
})(v85);
v85 = v42((v8.connect(v202, v220)(v85)));
v85 = l_RoactAppPolicy_0.connect(function(v221, _) --[[ Line: 953 ]]
    return {
        peekViewFullViewEnabled = v221.getItemDetailsFullView(), 
        showPremiumContent = v221.getShowCatalogPremiumContent()
    };
end)(v85);
return function(v223) --[[ Line: 960 ]] --[[ Name: ItemDetailsPageContainer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v57 (copy), v56 (copy), v11 (copy), v4 (copy), v85 (ref)
    local v224 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v223.focusController then
        v224 = v223.focusController;
    end;
    local v225 = v57(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v224);
    local v226 = v56({
        overlayClosedCallback = v225
    });
    local v227 = v11.Dictionary.join(v223, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v224, 
        overlayClosedCallback = v225
    });
    return v4.createElement("Frame", {
        [v4.Ref] = v226, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        ItemDetails = v6.createElement(v85, v227)
    });
end;