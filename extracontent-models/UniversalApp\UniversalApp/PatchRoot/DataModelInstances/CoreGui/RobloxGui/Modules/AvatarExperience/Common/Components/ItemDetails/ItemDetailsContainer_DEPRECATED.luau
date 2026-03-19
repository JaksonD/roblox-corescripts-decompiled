local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v14 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_RoactFitComponents_0 = v10.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.ItemViewport.ItemViewport);
local v24 = require(l_CorePackages_0.Packages.Foundation);
local l_Skeleton_0 = v24.Skeleton;
local v26 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v26.Style.withStyle;
local l_LoadableImage_0 = v26.App.Loading.LoadableImage;
local l_GetCanExpand_0 = v26.Core.Text.ExpandableText.GetCanExpand;
local l_LoadingStateContainer_0 = v26.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v26.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v26.App.Indicator.EmptyState;
local l_Button_0 = v26.App.Button.Button;
local l_ButtonType_0 = v26.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v26.App.Button.LinkButton;
local l_MenuDirection_0 = v26.App.Menu.MenuDirection;
local l_StyledTextLabel_0 = v26.App.Text.StyledTextLabel;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v44 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v46 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDescription);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton);
local v50 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v51 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v52 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid);
local v53 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.logItemDetailsIxpLayerExposure);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v55 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v56 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v58 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local v62 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_WearTimeOptionsCarousel_0 = v62.Components.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v62.Components.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v62.Utils.isDurableItemExpired;
local v66 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_FriendsOwnedChip_0 = require(l_CorePackages_0.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip;
local v68 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v69 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v72 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v74 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v75 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v76 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v77 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 = v13.FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation;
local v80 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXItemDetailsIxpExposure_0 = v80.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXDurablesSupport_0 = v80.FFlagAXDurablesSupport;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMISEnableMultiShopping_0 = v80.FFlagAXMISEnableMultiShopping;
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXInventoryDurablesSupport_0 = v80.FFlagAXInventoryDurablesSupport;
local l_FFlagAXTryOnScreenFixes_0 = v80.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v80.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v80.FFlagAXCustomizeMakeupSupport;
local v91 = game:DefineFastFlag("AXFixLocalizationGsub", false);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v80.CombinedFFlagShouldUseLegacyGamepadFocus;
local v93 = v3.PureComponent:extend("ItemDetailsContainer");
v93.validateProps = v11.strictInterface({
    actionBarHeaderRef = v11.table, 
    clipDetails = v11.optional(v11.boolean), 
    listPadding = v11.optional(v11.numberPositive), 
    itemId = v11.string, 
    itemType = v11.string, 
    onItemInvalid = v11.optional(v11.callback), 
    showFullWithNoPeekView = v11.optional(v11.boolean), 
    bottomDockedContainerHeight = v11.optional(v11.number), 
    resultsListRef = v11.optional(v11.table), 
    itemDetailsPeekViewRefs = v11.optional(v11.table), 
    peekViewFocusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.table, 
    NextSelectionDown = v11.optional(v11.table), 
    NextSelectionUp = v11.optional(v11.table), 
    NextSelectionLeft = v11.optional(v11.table), 
    NextSelectionRight = v11.optional(v11.table), 
    forwardRef = v11.optional(v11.table), 
    setItemDetailsScrollingEnabled = if v74() then v11.optional(v11.callback) else nil, 
    onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v11.optional(v11.callback) else nil, 
    itemSubType = v11.optional(v11.string), 
    assetType = v11.optional(v11.string), 
    simpleView = if not not l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenFixes_0 then v11.optional(v11.boolean) else nil, 
    tagBasedImpressionsDetectorExtensions = if l_FFlagAXItemDetailsIxpExposure_0 then v11.table else nil, 
    globalGuiInset = v11.strictInterface({
        left = v11.integer, 
        top = v11.integer, 
        right = v11.integer, 
        bottom = v11.integer
    }), 
    screenSize = v11.Vector2, 
    fetchingState = v11.string, 
    itemData = v11.optional(v69), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v70() then v11.optional(v11.boolean) else nil, 
    isLimitedCollectible = v11.optional(v11.boolean), 
    fetchAssetOrBundleInfo = v11.callback, 
    navigateDownToAvatarScreen = v11.callback, 
    toggleTryOn = v11.optional(v11.callback), 
    toggleTryOnThunk = if l_FFlagAXMISEnableMultiShopping_0 then v11.callback else nil, 
    closeMatchingScreens = if l_FFlagAXMISEnableMultiShopping_0 then v11.callback else nil, 
    navigation = v11.table, 
    avatarRoute = if l_FFlagAXItemDetailsIxpExposure_0 then l_AvatarRoute_0.Interface else nil, 
    networking = v11.callback, 
    appAnalytics = v11.table, 
    catalogAnalytics = v11.table, 
    showPremiumContent = v11.optional(v11.boolean), 
    enableAggregateLikesFavoritesCount = v11.boolean
});
v93.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v93.init = function(v94) --[[ Line: 210 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v3 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v72 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), v75 (copy), v12 (copy), v76 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v44 (copy)
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v94.requestImpressionsSignal = l_Signal_0.new();
        v94.itemDetailsContainerRef = v3.createRef();
    end;
    v94.expandableTextRef = v3.createRef();
    v94.wearTimeCarouselRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v3.createRef() else nil;
    v94.ownershipButtonRef = if v72() then v3.createRef() else nil;
    v94.resellerRef = v3.createRef();
    v94.attributionRef = v3.createRef();
    v94.recommendedItemsGridRef = v3.createRef();
    v94.socialProofRef = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createRef() else nil;
    v94.state = {
        width = 0, 
        is3DPreviewEnabled = v75.isEnabled() and v12.readTestVariable(v75.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v76() and nil, 
        socialProofChipRendered = not l_FFlagEnableSocialProofOnItemDetails_0 and nil
    };
    v94.fetchAssetOrBundleInfo = function() --[[ Line: 244 ]]
        -- upvalues: v94 (copy)
        local l_networking_0 = v94.props.networking;
        local l_appAnalytics_0 = v94.props.appAnalytics;
        local v97 = tostring(v94.props.itemId);
        local l_itemType_0 = v94.props.itemType;
        return v94.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v97, l_itemType_0);
    end;
    if v75.isEnabled() then
        v94.onItemViewportLoadingFailed = function() --[[ Line: 254 ]]
            -- upvalues: v94 (copy)
            v94:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v94:updateDurability();
    local v99, v100 = v3.createBinding(false);
    v94.itemHeaderVisibleBinding = v99;
    v94.updateItemHeaderVisibleBinding = v100;
    v94.onTryOnActivated = function() --[[ Line: 264 ]]
        -- upvalues: v94 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v101 = {
            itemId = v94.props.itemId, 
            itemType = v94.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v94.props.itemDetailsPeekViewRefs, 
            resultsListRef = v94.props.resultsListRef
        };
        local v102 = v101.itemType .. v101.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v101.itemSubType = v94.props.itemSubType;
        else
            v94.props.toggleTryOn(v94.props.networking, v94.props.catalogAnalytics, v94.props.itemType, v94.props.itemSubType, v94.props.itemId, true, nil, nil);
        end;
        v94.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v102, v101);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        v94.onRecommendedItemDetailsTryOnButtonActivated = function() --[[ Line: 294 ]]
            -- upvalues: v44 (ref), v94 (copy), l_AvatarScreen_0 (ref)
            local v103 = v44.GetItemSubType(v94.props.itemType, v94.props.itemData);
            v94.props.toggleTryOnThunk(v94.props.networking, v94.props.catalogAnalytics, v94.props.itemType, v103, v94.props.itemId, true, v94.props.avatarRoute, v94.props.navigation);
            v94.props.closeMatchingScreens(v94.props.navigation, {
                l_AvatarScreen_0.Checkout, 
                l_AvatarScreen_0.ItemDetails
            });
        end;
    end;
    v94.onItemOwnershipButtonActivated = function() --[[ Line: 315 ]]
        -- upvalues: v94 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v94.props.itemData.collectibleItemId;
        v94.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v94.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v94.props.itemType
        });
    end;
    v94.onItemHeaderMoved = function(v105) --[[ Line: 325 ]]
        -- upvalues: v94 (copy)
        if not v94.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v94.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v107 = l_current_0.AbsolutePosition.Y > v105.AbsolutePosition.Y;
                l_current_0.Visible = not v107;
                v94.updateItemHeaderVisibleBinding(v107);
                return;
            end;
        end;
    end;
    v94.hasCalledOnItemInvalid = false;
    if v76() then
        v94.onFetchRecommendationsFailed = function() --[[ Line: 347 ]]
            -- upvalues: v94 (copy)
            v94:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v93.canItemDescriptionExpand = function(v108, v109) --[[ Line: 355 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v108.props.itemData;
    local v111 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v111 = l_itemData_0.description;
        local v112 = v108.state.width - 48;
        return l_GetCanExpand_0(v109, v112, v111, 3);
    end;
end;
v93.updateDurability = function(v113) --[[ Line: 367 ]] --[[ Name: updateDurability ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy)
    if l_FFlagAXDurablesSupport_0 and v113.props.itemData and v113.props.itemData.timedOptions then
        v113.wearTimeOptions = v113.props.itemData.timedOptions;
    end;
end;
v93.didMount = function(v114) --[[ Line: 373 ]] --[[ Name: didMount ]]
    v114.fetchAssetOrBundleInfo();
end;
v93.didUpdate = function(v115, v116) --[[ Line: 377 ]] --[[ Name: didUpdate ]]
    -- upvalues: v19 (copy), v76 (copy)
    v115:updateDurability();
    local l_itemData_1 = v115.props.itemData;
    local l_fetchingState_0 = v115.props.fetchingState;
    local l_onItemInvalid_0 = v115.props.onItemInvalid;
    local v120 = false;
    if l_fetchingState_0 == v19.Done then
        v120 = l_itemData_1 == nil;
    end;
    local v121 = not v115.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v121 and v120 then
        l_onItemInvalid_0();
        v115.hasCalledOnItemInvalid = true;
    end;
    if v76() and (v116.itemType ~= v115.props.itemType or v116.itemId ~= v115.props.itemId) then
        v115:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
if l_FFlagEnableSocialProofOnItemDetails_0 then
    v93.setSocialProofChipRendered = function(v122, v123) --[[ Line: 405 ]] --[[ Name: setSocialProofChipRendered ]]
        v122:setState({
            socialProofChipRendered = v123
        });
    end;
end;
v93.shouldShowRecommendedItems = function(v124, v125) --[[ Line: 419 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v44 (copy), v76 (copy)
    if v125 then
        return false;
    elseif v124.props.assetType and not v44.doesAssetTypeHaveCatalogPage(v124.props.assetType) then
        return false;
    else
        local l_itemData_2 = v124.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v76() and v124.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v93.renderDetailsWithProviders = function(v127, v128) --[[ Line: 443 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v44 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v75 (copy), v46 (copy), v77 (copy), v70 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v72 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v42 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v3 (copy), l_LinkButton_0 (copy), v91 (copy), l_MenuDirection_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v23 (copy), v74 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v24 (copy), v52 (copy), l_FriendsOwnedChip_0 (copy), v47 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v48 (copy), v49 (copy), v50 (copy), v51 (copy), v76 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v129 = tostring(v127.props.itemId);
    local l_itemType_1 = v127.props.itemType;
    local l_listPadding_0 = v127.props.listPadding;
    local l_itemSubType_0 = v127.props.itemSubType;
    local l_itemData_3 = v127.props.itemData;
    local v134 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v127.props.peekViewState;
    local l_width_0 = v127.state.width;
    local v137 = v44.GetRbxThumbType(l_itemType_1);
    local v138 = l_getRbxthumbWithTypeSizeAndOptions_0(v129, v137, 420);
    local v139 = v44.IsResellable(l_itemData_3);
    local v140 = v44.HasAttribution(l_itemData_3);
    local v141 = l_itemData_3 and l_itemData_3.isOwned and v139;
    local v142 = if l_FFlagAXDurablesSupport_0 then v127.wearTimeOptions and #v127.wearTimeOptions > 0 else nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v143 = l_itemData_3 and l_itemData_3.isOwned;
        local v144 = l_itemData_3 and l_itemData_3.isOwned and l_itemData_3.expirationTime;
        v142 = v142 and (not v143 or v144);
    end;
    local v145 = if l_FFlagAXRemoveExpiredItemsFromInventory_0 then l_itemData_3 and l_itemData_3.expirationTime and not l_isDurableItemExpired_0(l_itemData_3.expirationTime) else nil;
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    local v149 = nil;
    local v150 = nil;
    if v75.isEnabled() then
        v147 = l_itemData_3 and l_itemData_3.assetType;
        v148 = l_itemData_3 and l_itemData_3.bundleType;
        v150 = l_itemData_3 and l_itemData_3.items;
        v146 = v127.state.is3DPreviewEnabled;
        if l_itemType_1 == v46.ItemType.Asset then
            v146 = v146 and v46.ItemViewportAssetTypes[v147];
        elseif l_itemType_1 == v46.ItemType.Bundle then
            v146 = v146 and v46.ItemViewportBundleTypes[v148];
        end;
        if not v77() and v150 then
            for _, v152 in v150 do
                if v152.type == v46.ItemType.Outfit then
                    v149 = v152.id;
                    break;
                end;
            end;
        end;
    end;
    if v70() then
        v141 = v141 and v127.props.isCollectiblesEnabled;
    end;
    local v153 = v127.state.width * 9 / 16;
    local v154 = v127.props.showFullWithNoPeekView and v127.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v155) --[[ Line: 514 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v127 (copy), v72 (ref), v141 (ref), v139 (copy), v140 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v42 (ref), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v128 (copy), l_TextService_0 (ref), v3 (ref), l_LinkButton_0 (ref), v91 (ref), v44 (ref), l_MenuDirection_0 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v8 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v153 (copy), v75 (ref), v146 (ref), v23 (ref), v129 (copy), l_itemType_1 (copy), v148 (ref), v77 (ref), v149 (ref), v150 (ref), v74 (ref), l_LoadableImage_0 (ref), v138 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v24 (ref), v46 (ref), v52 (ref), l_FriendsOwnedChip_0 (ref), v47 (ref), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), v142 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v145 (copy), v4 (ref), l_ItemExpirationDisplay_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_WearTimeOptionsCarousel_0 (ref), v48 (ref), l_width_0 (copy), v49 (ref), v134 (copy), v50 (ref), v51 (ref), l_itemSubType_0 (copy), v76 (ref), v154 (copy), l_TagBasedImpressionsDetector_0 (ref)
        local l_Theme_0 = v155.Theme;
        local l_Font_0 = v155.Font;
        local v158 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v159 = if l_itemData_3 then l_itemData_3.name else nil;
        local l_Font_1 = l_Font_0.Header1.Font;
        local v161 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Full then
            v161 = l_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v162 = v127:canItemDescriptionExpand(l_Font_0);
        local v163 = if v162 then v127.expandableTextRef else if v72() and v141 then v127.ownershipButtonRef else if v139 then v127.resellerRef else if v140 then v127.attributionRef else v127.recommendedItemsGridRef;
        local v164 = nil;
        local v165 = nil;
        if l_itemData_3 then
            v164 = l_itemData_3.description;
            v165 = l_itemData_3.favoriteCount;
        end;
        local v166 = if v164 then v163 else nil;
        local v167 = if l_FFlagEnableSocialProofOnItemDetails_0 and v127.state.socialProofChipRendered then v127.socialProofRef else v127.props.NextSelectionUp;
        local v169 = l_FFlagEnableSocialProofOnItemDetails_0 and l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 and function(v168) --[[ Line: 549 ]]
            -- upvalues: v127 (ref)
            v127:setSocialProofChipRendered(v168);
        end or nil;
        local v170 = if l_FFlagAXMISEnableMultiShopping_0 then v42.isFirstItemDetailsPage(v127.props.navigation) else nil;
        local v171 = v127.props.navigation.getParam("fromProfile");
        local v172 = v127.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v172 = v127.props.simpleView or false;
        end;
        local v173 = v127:shouldShowRecommendedItems(v172);
        local l_tryOn_0 = v128.tryOn;
        local v175 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v176 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v175, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v177 = v127.props.collectibleData and v127.props.collectibleData.unitsAvailableForConsumption == 0;
        local v178 = not v172 and v127.props.enableAggregateLikesFavoritesCount;
        local v179 = nil;
        if v127.props.experiences then
            v179 = v3.createElement(l_LinkButton_0, {
                text = if v127.props.experiences and #v127.props.experiences == 1 and v127.props.experiences[1].name then if v91 then v128.inSpecificExperience else v128.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v127.props.experiences[1].name) else if v91 then v128.inMultipleExperiences else v128.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v127.props.experiences), 
                onActivated = function() --[[ Line: 595 ]] --[[ Name: onActivated ]]
                    -- upvalues: v127 (ref), l_AvatarScreen_0 (ref), v44 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v127.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v127.props.collectibleData, 
                        isLimited = v44.isLimitedCollectible(l_itemData_3), 
                        openPositionY = UDim.new(0, 100), 
                        menuDirection = l_MenuDirection_0.Down
                    });
                end, 
                minPaddingX = 0, 
                layoutOrder = 1
            });
        end;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, l_listPadding_0), 
            margin = l_RoactFitComponents_0.Rect.square(24), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            defaultChild = v166, 
            restorePreviousChildFocus = true, 
            [v3.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v127.itemDetailsContainerRef else nil, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                MoveToTop = v8.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 627 ]]
                    -- upvalues: v127 (ref), v166 (copy)
                    v127.props.peekViewFocusController.moveFocusTo(v166);
                end), 
                MoveToRecItemsGrid = v8.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 630 ]]
                    -- upvalues: v127 (ref)
                    v127.props.peekViewFocusController.moveFocusTo(v127.recommendedItemsGridRef);
                end)
            }
        }, {
            ItemThumbnail = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                NameLabel = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    [v3.Change.AbsolutePosition] = v127.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v159 then v3.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v127.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v159, 
                        TextSize = v158, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v158)
                    }), 
                    RefUpdater = v3.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v3.Ref] = function(v180) --[[ Line: 673 ]]
                            -- upvalues: v127 (ref)
                            if v180 and v180.Parent then
                                v127.onItemHeaderMoved(v180.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v127.props.experiences then v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Font_0.BaseSize * l_Font_0.Body.RelativeSize), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    ExperienceLink = v179, 
                    DashDivider = if v177 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v177 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v128.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v153), 
                    LayoutOrder = 1, 
                    ZIndex = 0
                }, {
                    ItemBackground = v3.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.new(1, 48, 1, 0), 
                        ZIndex = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                        BorderSizePixel = 0
                    }, {
                        UIGradient = v3.createElement("UIGradient", {
                            Rotation = -90, 
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1), 
                                NumberSequenceKeypoint.new(0.4, 0), 
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        })
                    }), 
                    ItemViewport = if v75.isEnabled() and v146 then v3.createElement(v23, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v129, 
                        itemType = l_itemType_1, 
                        bundleType = v148, 
                        outfitId = if not v77() then v149 else nil, 
                        bundleItems = if v77() then v150 else nil, 
                        setParentScrollingEnabled = if v74() then v127.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v127.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v75.isEnabled() and v146 then nil else v3.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v138, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v153, v153), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v171 then v3.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v176 - 8, 1, -44), 
                            size = UDim2.fromOffset(v176, 36), 
                            text = l_tryOn_0, 
                            onActivated = v127.onTryOnActivated
                        })
                    }) else nil, 
                    RecommendedItemDetailsTryOnButtonFrame = if if l_FFlagAXTryOnScreenImprovements_0 then l_FFlagAXMISEnableMultiShopping_0 and not v171 and not v170 and v127.props.navigation.state.routeName ~= l_AvatarScreen_0.TryOnItem else l_FFlagAXMISEnableMultiShopping_0 and not v171 and not v170 then v3.createElement(v24.View, {
                        ZIndex = 2, 
                        tag = "size-full", 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v3.createElement(v24.Button, {
                            Position = UDim2.new(1, -v176 - 8, 1, -44), 
                            text = l_tryOn_0, 
                            onActivated = v127.onRecommendedItemDetailsTryOnButtonActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v172 and l_itemType_1 == v46.ItemType.Bundle then v3.createElement(v52, {
                itemId = v129, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createElement(l_FriendsOwnedChip_0, {
                itemId = v129, 
                itemType = l_itemType_1, 
                fromProfile = v171, 
                layoutOrder = 3, 
                ref = v127.socialProofRef, 
                chipIsRenderedCallback = if l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 then v169 else nil, 
                NextSelectionUp = v127.props.NextSelectionUp, 
                NextSelectionDown = v127.expandableTextRef
            }) else nil, 
            ItemDescription = v3.createElement(v47, {
                compactNumberOfLines = 3, 
                descriptionText = v164, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v3.Ref] = v127.expandableTextRef, 
                NextSelectionUp = if v72() then if l_FFlagEnableSocialProofOnItemDetails_0 then v167 else v127.props.NextSelectionUp else nil, 
                NextSelectionDown = if v72() then if v161 and v141 then v127.ownershipButtonRef else if v161 and v139 then v127.resellerRef else if v161 and v140 then v127.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v161 and v142 then v127.wearTimeCarouselRef else if v161 then v127.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v142 then v127.wearTimeCarouselRef else v127.props.NextSelectionDown else if v161 then if v139 then v127.resellerRef else if v140 then v127.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v142 then v127.wearTimeCarouselRef else v127.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v142 then v127.wearTimeCarouselRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v127.props.itemData and v127.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v145 then v4.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v127.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if l_FFlagAXDurablesSupport_0 and v142 then v3.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v127.wearTimeOptions, 
                onOptionActivated = v127.props.onWearTimeSelection, 
                useWrapping = true, 
                firstOptionRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v127.wearTimeCarouselRef else nil, 
                nextSelectionDown = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v127.recommendedItemsGridRef else nil
            }) else nil, 
            ItemStatistics = v178 and v3.createElement(v48, {
                favoritesCount = v165, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 5 or 4) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v141 then v3.createElement(v49, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagAXDurablesSupport_0 and 6 or 5) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                itemId = v129, 
                isLimitedCollectible = v127.props.isLimitedCollectible, 
                collectibleItemId = v134, 
                onActivated = v127.onItemOwnershipButtonActivated, 
                ref = if v72() then v127.ownershipButtonRef else nil, 
                NextSelectionUp = if v72() then if v161 and v162 then v127.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v167 else v127.props.NextSelectionUp else nil, 
                NextSelectionDown = if v72() then if v161 and v139 then v127.resellerRef else if v161 and v140 then v127.attributionRef else if v161 then v127.recommendedItemsGridRef else v127.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v172 and v3.createElement(v50, {
                itemId = v129, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 7 or 6) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                resellerRef = v127.resellerRef, 
                attributionRef = v127.attributionRef, 
                NextSelectionUp = if v72() then if v161 and v141 then v127.ownershipButtonRef else if v161 and v162 then v127.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v167 else v127.props.NextSelectionUp else v161 and v162 and v127.expandableTextRef or nil, 
                NextSelectionDown = if v72() then if v161 then v127.recommendedItemsGridRef else v127.props.NextSelectionDown else v161 and v127.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v173 and v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 9 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v128.recommendedLabel, 
                TextSize = v158, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v127.state.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v173 and v3.createElement(v51, {
                itemId = v129, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v76() then v127.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or 9 + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                [v3.Ref] = v127.recommendedItemsGridRef, 
                NextSelectionUp = if v161 and v140 then v127.attributionRef else if v72() then if v161 and v139 then v127.resellerRef else if v161 and v141 then v127.ownershipButtonRef else if v161 and v162 then v127.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v167 else v127.props.NextSelectionUp else v139 and v127.resellerRef or v162 and v127.expandableTextRef or nil, 
                NextSelectionDown = v127.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v127.props.itemDetailsPeekViewRefs, 
                resultsListRef = v127.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v154 and v3.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10 + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v127.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v3.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v127.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 1021 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v127 (ref)
                    return v127.props.navigation.state.key == v127.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v127.requestImpressionsSignal, 
                extensions = v127.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v93.renderDetails = function(v181) --[[ Line: 1035 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy), v91 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = if v91 then {
            "Feature.Catalog.Label.InMultipleExperiences"; 
            NUM_EXPERIENCES = if v181.props.experiences then #v181.props.experiences else 0
        } else "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = if v91 then {
            "Feature.Catalog.Label.InSpecificExperience"; 
            EXPERIENCE_NAME = if v181.props.experiences then v181.props.experiences[1].name else ""
        } else "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v182) --[[ Line: 1053 ]]
        -- upvalues: v181 (copy)
        return v181:renderDetailsWithProviders(v182);
    end);
end;
v93.renderOnFailed = function(v183) --[[ Line: 1058 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v45 (copy), l_withLocalization_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v183.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v183.props.globalGuiInset;
    local l_screenSize_0 = v183.props.screenSize;
    local v187 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v188 = v45.ActionBar.ActionBarHeight + v45.ActionBar.ActionBarGradientHeight;
    local v190 = l_withLocalization_0({
        emptyText = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v189) --[[ Line: 1069 ]]
        -- upvalues: v3 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v3.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v189.emptyText
        });
    end);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v187.Y.Scale, v187.Y.Offset - v188)
    }, {
        EmptyStatePage = v190
    });
end;
v93.render = function(v191) --[[ Line: 1084 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v3 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v191.props.clipDetails;
    local l_fetchingState_1 = v191.props.fetchingState;
    return l_withStyle_0(function(v194) --[[ Line: 1088 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v3 (ref), v191 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v194.Theme;
        local v196 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v196 = "Frame";
        end;
        return v3.createElement(v196, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v3.Ref] = v191.props.forwardRef, 
            [v3.Change.AbsoluteSize] = function(v197) --[[ Line: 1114 ]]
                -- upvalues: v191 (ref)
                if v191.state.width ~= v197.AbsoluteSize.X then
                    v191:setState({
                        width = v197.AbsoluteSize.X
                    });
                end;
            end, 
            [v3.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1123 ]]
                -- upvalues: v191 (ref)
                v191.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v3.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1130 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v191 (ref)
                    return v191:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1133 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v191 (ref)
                    return v191:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1136 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v191 (ref)
                    return v191:renderOnFailed();
                end
            })
        });
    end);
end;
v93 = v7.connect(function(v199, v200) --[[ Line: 1145 ]]
    -- upvalues: l_PerformFetch_0 (copy), v44 (copy), v19 (copy), v68 (copy), l_AvatarScreen_0 (copy), v70 (copy)
    local v201 = l_PerformFetch_0.GetStatus(v199, v44.GetItemDetailsKey(v200.itemId, v200.itemType));
    local v202 = nil;
    if v201 ~= v19.NotStarted then
        v202 = v68(v199.AvatarExperience.Common, v200.itemId, v200.itemType);
    end;
    if v200.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v202 ~= nil and v202.name == nil then
        v202 = nil;
    end;
    local v203 = nil;
    local v204 = nil;
    local v205 = if (if v202 then v202.collectibleItemId else nil) and v202 then v199.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v202.collectibleItemId] else nil;
    local v206 = v44.GetItemSubType(v200.itemType, v202);
    if v205 ~= nil then
        v203 = v205.experiences;
    end;
    if v70() then
        v204 = v199.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v207 = v44.isLimitedCollectible(v202);
    return {
        globalGuiInset = v199.GlobalGuiInset, 
        screenSize = v199.ScreenSize, 
        fetchingState = v201, 
        itemData = v202, 
        itemSubType = v206, 
        peekViewState = v199.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        experiences = v203, 
        collectibleData = v205, 
        isCollectiblesEnabled = v204, 
        isLimitedCollectible = v207
    };
end, function(v208, _) --[[ Line: 1190 ]]
    -- upvalues: v66 (copy), v41 (copy), v55 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v56 (copy)
    return {
        fetchAssetOrBundleInfo = function(v210, v211, v212, v213) --[[ Line: 1192 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v208 (copy), v66 (ref)
            return v208(v66(v210, v211, v212, v213));
        end, 
        navigateDownToAvatarScreen = function(v214, v215, v216) --[[ Line: 1195 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v208 (copy), v41 (ref)
            return v208(v41(v214, v215, v216));
        end, 
        toggleTryOn = function(v217, v218, v219, v220, v221, v222, v223, v224) --[[ Line: 1198 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v208 (copy), v55 (ref)
            v208(v55(v217, v218, v219, v220, v221, v222, v223, v224));
        end, 
        toggleTryOnThunk = l_FFlagAXMISEnableMultiShopping_0 and function(v225, v226, v227, v228, v229, v230, v231, v232) --[[ Line: 1222 ]]
            -- upvalues: v208 (copy), v55 (ref)
            v208(v55(v225, v226, v227, v228, v229, v230, v231, v232));
        end or nil, 
        closeMatchingScreens = l_FFlagAXMISEnableMultiShopping_0 and function(v233, v234) --[[ Line: 1247 ]]
            -- upvalues: v208 (copy), v56 (ref)
            v208(v56(v233, v234));
        end or nil
    };
end)(v93);
v93 = l_RoactAppPolicy_0.connect(function(v235, _) --[[ Line: 1256 ]]
    return {
        enableAggregateLikesFavoritesCount = v235.getEnableAggregateLikesFavoritesCount()
    };
end)(v93);
v93 = v14.withNavigation(v93);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v93 = v58(v93);
end;
v93 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v22, 
    networking = v18
})(v93);
return v3.forwardRef(function(v237, v238) --[[ Line: 1274 ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v4 (copy), v53 (copy), v3 (copy), v93 (ref), v5 (copy)
    local v239 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v240 = l_useUnifiedEventImpressionsReporter_0();
        v239 = v4.useMemo(function() --[[ Line: 1278 ]]
            -- upvalues: v240 (copy), v53 (ref)
            return {
                v240, 
                v53
            };
        end, {
            v240, 
            v53
        });
    end;
    return v3.createElement(v93, v5.Dictionary.join(v237, {
        forwardRef = v238, 
        tagBasedImpressionsDetectorExtensions = v239
    }));
end);