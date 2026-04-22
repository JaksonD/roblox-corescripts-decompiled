local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v10 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v17 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_RoactFitComponents_0 = v10.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v23 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.ItemViewport.ItemViewport);
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v31 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v31.Style.withStyle;
local l_LoadableImage_0 = v31.App.Loading.LoadableImage;
local l_GetCanExpand_0 = v31.Core.Text.ExpandableText.GetCanExpand;
local l_LoadingStateContainer_0 = v31.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v31.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v31.App.Indicator.EmptyState;
local l_Button_0 = v31.App.Button.Button;
local l_ButtonType_0 = v31.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v31.App.Button.LinkButton;
local l_MenuDirection_0 = v31.App.Menu.MenuDirection;
local l_StyledTextLabel_0 = v31.App.Text.StyledTextLabel;
local l_useStyle_0 = v31.Core.Style.useStyle;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v49 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v50 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v51 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v52 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDescription);
local v53 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local v54 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton);
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v57 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid);
local v58 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.logItemDetailsIxpLayerExposure);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v60 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local l_FriendsOwnedChip_0 = require(l_CorePackages_0.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip;
local v62 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v63 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v64 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local v65 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v66 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTimedOptions);
local l_WearTimeOptionsCarousel_0 = v66.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v66.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v65.Utils.isDurableItemExpired;
local l_useTableWrappedCallbackRef_0 = v65.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v71 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v73 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.useItemDetailsContainerFocusNavigationBindings);
local v74 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v77 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v78 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v79 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v81 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagUpdateNoInternetConnectionText_0 = v81.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXItemDetailsIxpExposure_0 = v81.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXThumbTypeNilCheck_0 = v81.FFlagAXThumbTypeNilCheck;
local l_FFlagAXInventoryDurablesSupport_0 = v81.FFlagAXInventoryDurablesSupport;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local v89 = game:DefineFastFlag("AXFixItemDetailsContainerGuiInsetType", false);
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXTryOnScreenFixes_0 = v81.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v81.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v81.FFlagAXCustomizeMakeupSupport;
local v94 = v4.PureComponent:extend("ItemDetailsContainer");
v94.validateProps = v11.strictInterface({
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
    setItemDetailsScrollingEnabled = if v77() then v11.optional(v11.callback) else nil, 
    itemSubType = v11.optional(v11.string), 
    assetType = v11.optional(v11.string), 
    simpleView = if not not l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenFixes_0 then v11.optional(v11.boolean) else nil, 
    width = v11.number, 
    setWidth = v11.callback, 
    itemDetailsContainerRef = if l_FFlagAXItemDetailsIxpExposure_0 then v11.table else nil, 
    expandableTextRef = v11.table, 
    ownershipButtonRef = v11.table, 
    resellerRef = v11.table, 
    attributionRef = v11.table, 
    recommendedItemsGridRef = v11.table, 
    tagBasedImpressionsDetectorExtensions = if l_FFlagAXItemDetailsIxpExposure_0 then v11.table else nil, 
    onWearTimeSelection = v11.optional(v11.callback), 
    globalGuiInset = v11.strictInterface({
        left = if v89 then v11.number else v11.integer, 
        top = if v89 then v11.number else v11.integer, 
        right = if v89 then v11.number else v11.integer, 
        bottom = if v89 then v11.number else v11.integer
    }), 
    screenSize = v11.Vector2, 
    fetchingState = v11.string, 
    itemData = v11.optional(v64), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v71() then v11.optional(v11.boolean) else nil, 
    isLimitedCollectible = v11.optional(v11.boolean), 
    avatarRoute = if l_FFlagAXItemDetailsIxpExposure_0 then l_AvatarRoute_0.Interface else nil, 
    fetchAssetOrBundleInfo = v11.callback, 
    navigateDownToAvatarScreen = v11.callback, 
    toggleTryOn = v11.optional(v11.callback), 
    navigation = v11.table, 
    networking = v11.callback, 
    appAnalytics = v11.table, 
    catalogAnalytics = v11.table, 
    showPremiumContent = v11.optional(v11.boolean), 
    enableAggregateLikesFavoritesCount = v11.boolean
});
v94.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v94.init = function(v95) --[[ Line: 221 ]] --[[ Name: init ]]
    -- upvalues: v78 (copy), v12 (copy), v79 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v4 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy)
    v95.state = {
        is3DPreviewEnabled = v78.isEnabled() and v12.readTestVariable(v78.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v79() and nil
    };
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v95.requestImpressionsSignal = l_Signal_0.new();
    end;
    v95.fetchAssetOrBundleInfo = function() --[[ Line: 234 ]]
        -- upvalues: v95 (copy)
        local l_networking_0 = v95.props.networking;
        local l_appAnalytics_0 = v95.props.appAnalytics;
        local v98 = tostring(v95.props.itemId);
        local l_itemType_0 = v95.props.itemType;
        return v95.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v98, l_itemType_0);
    end;
    if v78.isEnabled() then
        v95.onItemViewportLoadingFailed = function() --[[ Line: 244 ]]
            -- upvalues: v95 (copy)
            v95:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v95:updateDurability();
    local v100, v101 = v4.createBinding(false);
    v95.itemHeaderVisibleBinding = v100;
    v95.updateItemHeaderVisibleBinding = v101;
    v95.onTryOnActivated = function() --[[ Line: 254 ]]
        -- upvalues: v95 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v102 = {
            itemId = v95.props.itemId, 
            itemType = v95.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v95.props.itemDetailsPeekViewRefs, 
            resultsListRef = v95.props.resultsListRef
        };
        local v103 = v102.itemType .. v102.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v102.itemSubType = v95.props.itemSubType;
        else
            v95.props.toggleTryOn(v95.props.networking, v95.props.catalogAnalytics, v95.props.itemType, v95.props.itemSubType, v95.props.itemId, true, nil, nil);
        end;
        v95.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v103, v102);
    end;
    v95.onItemOwnershipButtonActivated = function() --[[ Line: 283 ]]
        -- upvalues: v95 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v95.props.itemData.collectibleItemId;
        v95.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v95.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v95.props.itemType
        });
    end;
    v95.onItemHeaderMoved = function(v105) --[[ Line: 293 ]]
        -- upvalues: v95 (copy)
        if not v95.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v95.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v107 = l_current_0.AbsolutePosition.Y > v105.AbsolutePosition.Y;
                l_current_0.Visible = not v107;
                v95.updateItemHeaderVisibleBinding(v107);
                return;
            end;
        end;
    end;
    v95.hasCalledOnItemInvalid = false;
    if v79() then
        v95.onFetchRecommendationsFailed = function() --[[ Line: 315 ]]
            -- upvalues: v95 (copy)
            v95:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v94.canItemDescriptionExpand = function(v108, v109) --[[ Line: 323 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v108.props.itemData;
    local v111 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v111 = l_itemData_0.description;
        local v112 = v108.props.width - 48;
        return l_GetCanExpand_0(v109, v112, v111, 3);
    end;
end;
v94.updateDurability = function(v113) --[[ Line: 335 ]] --[[ Name: updateDurability ]]
    if v113.props.itemData and v113.props.itemData.timedOptions then
        v113.wearTimeOptions = v113.props.itemData.timedOptions;
    end;
end;
v94.didMount = function(v114) --[[ Line: 341 ]] --[[ Name: didMount ]]
    v114.fetchAssetOrBundleInfo();
end;
v94.didUpdate = function(v115, v116) --[[ Line: 345 ]] --[[ Name: didUpdate ]]
    -- upvalues: v23 (copy), v79 (copy)
    v115:updateDurability();
    local l_itemData_1 = v115.props.itemData;
    local l_fetchingState_0 = v115.props.fetchingState;
    local l_onItemInvalid_0 = v115.props.onItemInvalid;
    local v120 = false;
    if l_fetchingState_0 == v23.Done then
        v120 = l_itemData_1 == nil;
    end;
    local v121 = not v115.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v121 and v120 then
        l_onItemInvalid_0();
        v115.hasCalledOnItemInvalid = true;
    end;
    if v79() and (v116.itemType ~= v115.props.itemType or v116.itemId ~= v115.props.itemId) then
        v115:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
v94.shouldShowRecommendedItems = function(v122, v123) --[[ Line: 379 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v49 (copy), v79 (copy)
    if v123 then
        return false;
    elseif v122.props.assetType and not v49.doesAssetTypeHaveCatalogPage(v122.props.assetType) then
        return false;
    else
        local l_itemData_2 = v122.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v79() and v122.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v94.renderDetailsWithProviders = function(v125, v126) --[[ Line: 403 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v49 (copy), l_FFlagAXThumbTypeNilCheck_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v78 (copy), v51 (copy), v80 (copy), v71 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v74 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v4 (copy), l_LinkButton_0 (copy), l_MenuDirection_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v27 (copy), v77 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v57 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FriendsOwnedChip_0 (copy), v52 (copy), v3 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v53 (copy), v54 (copy), v55 (copy), v56 (copy), v79 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v127 = tostring(v125.props.itemId);
    local l_itemType_1 = v125.props.itemType;
    local l_listPadding_0 = v125.props.listPadding;
    local l_itemSubType_0 = v125.props.itemSubType;
    local l_itemData_3 = v125.props.itemData;
    local v132 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v125.props.peekViewState;
    local l_width_0 = v125.props.width;
    local v135 = v49.GetRbxThumbType(l_itemType_1);
    local v136 = nil;
    v136 = if l_FFlagAXThumbTypeNilCheck_0 and v135 then l_getRbxthumbWithTypeSizeAndOptions_0(v127, v135, 420) else l_getRbxthumbWithTypeSizeAndOptions_0(v127, v135, 420);
    local v137 = v49.IsResellable(l_itemData_3);
    local v138 = v49.HasAttribution(l_itemData_3);
    local v139 = l_itemData_3 and l_itemData_3.isOwned and v137;
    local v140 = v125.wearTimeOptions and #v125.wearTimeOptions > 0;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v141 = l_itemData_3 and l_itemData_3.isOwned;
        local v142 = l_itemData_3 and l_itemData_3.isOwned and l_itemData_3.expirationTime;
        v140 = v140 and (not v141 or v142);
    end;
    local v143 = if l_FFlagAXRemoveExpiredItemsFromInventory_0 then l_itemData_3 and l_itemData_3.expirationTime and not l_isDurableItemExpired_0(l_itemData_3.expirationTime) else nil;
    local v144 = nil;
    local v145 = nil;
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    if v78.isEnabled() then
        v145 = l_itemData_3 and l_itemData_3.assetType;
        v146 = l_itemData_3 and l_itemData_3.bundleType;
        v148 = l_itemData_3 and l_itemData_3.items;
        v144 = v125.state.is3DPreviewEnabled;
        if l_itemType_1 == v51.ItemType.Asset then
            v144 = v144 and v51.ItemViewportAssetTypes[v145];
        elseif l_itemType_1 == v51.ItemType.Bundle then
            v144 = v144 and v51.ItemViewportBundleTypes[v146];
        end;
        if not v80() and v148 then
            for _, v150 in v148 do
                if v150.type == v51.ItemType.Outfit then
                    v147 = v150.id;
                    break;
                end;
            end;
        end;
    end;
    if v71() then
        v139 = v139 and v125.props.isCollectiblesEnabled;
    end;
    local v151 = v125.props.width * 9 / 16;
    local v152 = v125.props.showFullWithNoPeekView and v125.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v153) --[[ Line: 476 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v125 (copy), v74 (ref), v139 (ref), v137 (copy), v138 (copy), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v126 (copy), l_TextService_0 (ref), v4 (ref), l_LinkButton_0 (ref), v49 (ref), l_MenuDirection_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FitFrameVertical_0 (ref), l_Focusable_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v151 (copy), v78 (ref), v144 (ref), v27 (ref), v127 (copy), l_itemType_1 (copy), v146 (ref), v80 (ref), v147 (ref), v148 (ref), v77 (ref), l_LoadableImage_0 (ref), v136 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v51 (ref), v57 (ref), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FriendsOwnedChip_0 (ref), v52 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v143 (copy), v3 (ref), l_ItemExpirationDisplay_0 (ref), v140 (ref), l_WearTimeOptionsCarousel_0 (ref), v53 (ref), l_width_0 (copy), v54 (ref), v132 (copy), v55 (ref), v56 (ref), l_itemSubType_0 (copy), v79 (ref), v152 (copy), l_TagBasedImpressionsDetector_0 (ref)
        local l_Theme_0 = v153.Theme;
        local l_Font_0 = v153.Font;
        local v156 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v157 = if l_itemData_3 then l_itemData_3.name else nil;
        local l_Font_1 = l_Font_0.Header1.Font;
        local v159 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Full then
            v159 = l_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v160 = v125:canItemDescriptionExpand(l_Font_0);
        local v161 = if v160 then v125.props.expandableTextRef else if v74() and v139 then v125.props.ownershipButtonRef else if v137 then v125.props.resellerRef else if v138 then v125.props.attributionRef else v125.props.recommendedItemsGridRef;
        local v162 = nil;
        local v163 = nil;
        if l_itemData_3 then
            v162 = l_itemData_3.description;
            v163 = l_itemData_3.favoriteCount;
        end;
        local v164 = if v162 then v161 else nil;
        local v165 = v125.props.navigation.getParam("fromProfile");
        local v166 = v125.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v166 = v125.props.simpleView or false;
        end;
        local v167 = v125:shouldShowRecommendedItems(v166);
        local l_tryOn_0 = v126.tryOn;
        local v169 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v170 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v169, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v171 = v125.props.collectibleData and v125.props.collectibleData.unitsAvailableForConsumption == 0;
        local v172 = not v166 and v125.props.enableAggregateLikesFavoritesCount;
        local v173 = nil;
        if v125.props.experiences then
            v173 = v4.createElement(l_LinkButton_0, {
                text = if v125.props.experiences and #v125.props.experiences == 1 and v125.props.experiences[1].name then v126.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v125.props.experiences[1].name) else v126.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v125.props.experiences), 
                onActivated = function() --[[ Line: 536 ]] --[[ Name: onActivated ]]
                    -- upvalues: v125 (ref), l_AvatarScreen_0 (ref), v49 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v125.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v125.props.collectibleData, 
                        isLimited = v49.isLimitedCollectible(l_itemData_3), 
                        openPositionY = UDim.new(0, 100), 
                        menuDirection = l_MenuDirection_0.Down
                    });
                end, 
                minPaddingX = 0, 
                layoutOrder = 1
            });
        end;
        return v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitFrameVertical_0 else l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, l_listPadding_0), 
            margin = l_RoactFitComponents_0.Rect.square(24), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v164, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            [v4.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v125.props.itemDetailsContainerRef else nil
        }, {
            ItemThumbnail = v4.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                NameLabel = v4.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsolutePosition] = v125.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v157 then v4.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v125.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v157, 
                        TextSize = v156, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v4.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v156)
                    }), 
                    RefUpdater = v4.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v4.Ref] = function(v174) --[[ Line: 608 ]]
                            -- upvalues: v125 (ref)
                            if v174 and v174.Parent then
                                v125.onItemHeaderMoved(v174.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v125.props.experiences then v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Font_0.BaseSize * l_Font_0.Body.RelativeSize), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    ExperienceLink = v173, 
                    DashDivider = if v171 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v171 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v126.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v151), 
                    LayoutOrder = 1, 
                    ZIndex = 0
                }, {
                    ItemBackground = v4.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.new(1, 48, 1, 0), 
                        ZIndex = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                        BorderSizePixel = 0
                    }, {
                        UIGradient = v4.createElement("UIGradient", {
                            Rotation = -90, 
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1), 
                                NumberSequenceKeypoint.new(0.4, 0), 
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        })
                    }), 
                    ItemViewport = if v78.isEnabled() and v144 then v4.createElement(v27, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v127, 
                        itemType = l_itemType_1, 
                        bundleType = v146, 
                        outfitId = if not v80() then v147 else nil, 
                        bundleItems = if v80() then v148 else nil, 
                        setParentScrollingEnabled = if v77() then v125.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v125.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v78.isEnabled() and v144 then nil else v4.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v136, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v151, v151), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v165 then v4.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v170 - 8, 1, -44), 
                            size = UDim2.fromOffset(v170, 36), 
                            text = l_tryOn_0, 
                            onActivated = v125.onTryOnActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v166 and l_itemType_1 == v51.ItemType.Bundle then v4.createElement(v57, {
                itemId = v127, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v4.createElement(l_FriendsOwnedChip_0, {
                itemId = v127, 
                itemType = l_itemType_1, 
                fromProfile = v165, 
                layoutOrder = 3
            }) else nil, 
            ItemDescription = v4.createElement(v52, {
                compactNumberOfLines = 3, 
                descriptionText = v162, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v4.Ref] = v125.props.expandableTextRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then v125.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then if v159 and v139 then v125.props.ownershipButtonRef else if v159 and v137 then v125.props.resellerRef else if v159 and v138 then v125.props.attributionRef else if v159 then v125.props.recommendedItemsGridRef else v125.props.NextSelectionDown else if v159 then if v137 then v125.props.resellerRef else if v138 then v125.props.attributionRef else v125.props.recommendedItemsGridRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v125.props.itemData and v125.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v143 then v3.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v125.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if v140 then v4.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v125.wearTimeOptions, 
                onOptionActivated = v125.props.onWearTimeSelection, 
                useWrapping = true
            }) else nil, 
            ItemStatistics = v172 and v4.createElement(v53, {
                favoritesCount = v163, 
                LayoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0) + 5, 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v139 then v4.createElement(v54, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0) + 6, 
                itemId = v127, 
                isLimitedCollectible = v125.props.isLimitedCollectible, 
                collectibleItemId = v132, 
                onActivated = v125.onItemOwnershipButtonActivated, 
                ref = if v74() then v125.props.ownershipButtonRef else nil, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then if v159 and v160 then v125.props.expandableTextRef else v125.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then if v159 and v137 then v125.props.resellerRef else if v159 and v138 then v125.props.attributionRef else if v159 then v125.props.recommendedItemsGridRef else v125.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v166 and v4.createElement(v55, {
                itemId = v127, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or 0) + 7 + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                resellerRef = v125.props.resellerRef, 
                attributionRef = v125.props.attributionRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then if v159 and v139 then v125.props.ownershipButtonRef else if v159 and v160 then v125.props.expandableTextRef else v125.props.NextSelectionUp else v159 and v160 and v125.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v74() then if v159 then v125.props.recommendedItemsGridRef else v125.props.NextSelectionDown else v159 and v125.props.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v167 and v4.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 9 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v126.recommendedLabel, 
                TextSize = v156, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UISizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v125.props.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v167 and v4.createElement(v56, {
                itemId = v127, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v79() then v125.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 9, 
                [v4.Ref] = v125.props.recommendedItemsGridRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v159 and v138 then v125.props.attributionRef else if v74() then if v159 and v137 then v125.props.resellerRef else if v159 and v139 then v125.props.ownershipButtonRef else if v159 and v160 then v125.props.expandableTextRef else v125.props.NextSelectionUp else v137 and v125.props.resellerRef or v160 and v125.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v125.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v125.props.itemDetailsPeekViewRefs, 
                resultsListRef = v125.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v152 and v4.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v125.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v4.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v125.props.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 912 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v125 (ref)
                    return v125.props.navigation.state.key == v125.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v125.requestImpressionsSignal, 
                extensions = v125.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v94.renderDetails = function(v175) --[[ Line: 927 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v176) --[[ Line: 935 ]]
        -- upvalues: v175 (copy)
        return v175:renderDetailsWithProviders(v176);
    end);
end;
v94.renderOnFailed = function(v177) --[[ Line: 940 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v50 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v4 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v177.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v177.props.globalGuiInset;
    local l_screenSize_0 = v177.props.screenSize;
    local v181 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v182 = v50.ActionBar.ActionBarHeight + v50.ActionBar.ActionBarGradientHeight;
    local v184 = l_withLocalization_0({
        emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v183) --[[ Line: 953 ]]
        -- upvalues: v4 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v4.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v183.emptyText
        });
    end);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v181.Y.Scale, v181.Y.Offset - v182)
    }, {
        EmptyStatePage = v184
    });
end;
v94.render = function(v185) --[[ Line: 968 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v4 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v185.props.clipDetails;
    local l_fetchingState_1 = v185.props.fetchingState;
    return l_withStyle_0(function(v188) --[[ Line: 972 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v4 (ref), v185 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v188.Theme;
        local v190 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v190 = "Frame";
        end;
        return v4.createElement(v190, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v4.Ref] = v185.props.forwardRef, 
            [v4.Change.AbsoluteSize] = function(v191) --[[ Line: 998 ]]
                -- upvalues: v185 (ref)
                if v185.props.width ~= v191.AbsoluteSize.X then
                    v185.props.setWidth(v191.AbsoluteSize.X);
                end;
            end, 
            [v4.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1005 ]]
                -- upvalues: v185 (ref)
                v185.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v4.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1012 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v185 (ref)
                    return v185:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1015 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v185 (ref)
                    return v185:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1018 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v185 (ref)
                    return v185:renderOnFailed();
                end
            })
        });
    end);
end;
v94 = v7.connect(function(v193, v194) --[[ Line: 1027 ]]
    -- upvalues: l_PerformFetch_0 (copy), v49 (copy), v23 (copy), v63 (copy), l_AvatarScreen_0 (copy), v71 (copy)
    local v195 = l_PerformFetch_0.GetStatus(v193, v49.GetItemDetailsKey(v194.itemId, v194.itemType));
    local v196 = nil;
    if v195 ~= v23.NotStarted then
        v196 = v63(v193.AvatarExperience.Common, v194.itemId, v194.itemType);
    end;
    if v194.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v196 ~= nil and v196.name == nil then
        v196 = nil;
    end;
    local v197 = nil;
    local v198 = nil;
    local v199 = if (if v196 then v196.collectibleItemId else nil) and v196 then v193.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v196.collectibleItemId] else nil;
    local v200 = v49.GetItemSubType(v194.itemType, v196);
    if v199 ~= nil then
        v197 = v199.experiences;
    end;
    if v71() then
        v198 = v193.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v201 = v49.isLimitedCollectible(v196);
    return {
        globalGuiInset = v193.GlobalGuiInset, 
        screenSize = v193.ScreenSize, 
        fetchingState = v195, 
        itemData = v196, 
        itemSubType = v200, 
        peekViewState = v193.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        experiences = v197, 
        collectibleData = v199, 
        isCollectiblesEnabled = v198, 
        isLimitedCollectible = v201
    };
end, function(v202, _) --[[ Line: 1072 ]]
    -- upvalues: v62 (copy), v47 (copy), v60 (copy)
    return {
        fetchAssetOrBundleInfo = function(v204, v205, v206, v207) --[[ Line: 1074 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v202 (copy), v62 (ref)
            return v202(v62(v204, v205, v206, v207));
        end, 
        navigateDownToAvatarScreen = function(v208, v209, v210) --[[ Line: 1077 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v202 (copy), v47 (ref)
            return v202(v47(v208, v209, v210));
        end, 
        toggleTryOn = function(v211, v212, v213, v214, v215, v216, v217, v218) --[[ Line: 1080 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v202 (copy), v60 (ref)
            v202(v60(v211, v212, v213, v214, v215, v216, v217, v218));
        end
    };
end)(v94);
v94 = l_RoactAppPolicy_0.connect(function(v219, _) --[[ Line: 1108 ]]
    return {
        enableAggregateLikesFavoritesCount = v219.getEnableAggregateLikesFavoritesCount()
    };
end)(v94);
v94 = v17.withNavigation(v94);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v94 = v15(v94);
end;
v94 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v26, 
    networking = v22
})(v94);
checkCanItemDescriptionExpand = function(v221, v222, v223) --[[ Line: 1126 ]] --[[ Name: checkCanItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local v224 = nil;
    if not v221 or not v221.description then
        return false;
    else
        v224 = v221.description;
        local v225 = v223 - 48;
        return l_GetCanExpand_0(v222, v225, v224, 3);
    end;
end;
return v3.forwardRef(function(v226, v227) --[[ Line: 1137 ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useSelector_0 (copy), v63 (copy), v49 (copy), v74 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v73 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v58 (copy), v94 (ref), v5 (copy)
    local v228, v229 = v3.useState(0);
    local v230 = l_useStyle_0();
    local v231 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v231 = v3.useRef(nil);
    end;
    local v232 = v3.useRef(nil);
    local v233 = v3.useRef(nil);
    local v234 = v3.useRef(nil);
    local v235 = v3.useRef(nil);
    local v236 = v3.useRef(nil);
    local v238 = l_useSelector_0(function(v237) --[[ Line: 1162 ]]
        -- upvalues: v63 (ref), v226 (copy)
        return v63(v237.AvatarExperience.Common, v226.itemId, v226.itemType);
    end);
    local v239 = v49.IsResellable(v238);
    local v240 = v49.HasAttribution(v238);
    local v241 = v238 and v238.isOwned and v239;
    local v242 = checkCanItemDescriptionExpand(v238, v230.Font, v228);
    local v243 = if v238 and v238.description then v238.description else nil;
    local v244 = if v242 then v232 else if v74() and v241 then v233 else if v239 then v234 else if v240 then v235 else v236;
    local v245 = if v243 then v244 else nil;
    local v246 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v247 = v3.useCallback(function() --[[ Line: 1184 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v246 (copy), v245 (copy), v226 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v246 and v245 and v245.current then
                v246(v245.current);
                return;
            end;
        else
            v226.peekViewFocusController.moveFocusTo(v245);
        end;
    end, {
        v245, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v246 else v226.peekViewFocusController
    });
    local v248 = v3.useCallback(function() --[[ Line: 1196 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v246 (copy), v236 (copy), v226 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v246 and v236 and v236.current then
                v246(v236.current);
                return;
            end;
        else
            v226.peekViewFocusController.moveFocusTo(v236);
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v246 else v226.peekViewFocusController
    });
    local v249 = v73(v227, {
        onMoveToTop = v247, 
        onMoveToRecItems = v248
    });
    local v250 = l_useTableWrappedCallbackRef_0(v249);
    local v251 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v252 = l_useUnifiedEventImpressionsReporter_0();
        v251 = v3.useMemo(function() --[[ Line: 1216 ]]
            -- upvalues: v252 (copy), v58 (ref)
            return {
                v252, 
                v58
            };
        end, {
            v252, 
            v58
        });
    end;
    return v3.createElement(v94, v5.Dictionary.join(v226, {
        width = v228, 
        setWidth = v229, 
        itemDetailsContainerRef = v231, 
        expandableTextRef = v232, 
        ownershipButtonRef = v233, 
        resellerRef = v234, 
        attributionRef = v235, 
        recommendedItemsGridRef = v236, 
        forwardRef = v250, 
        tagBasedImpressionsDetectorExtensions = v251
    }));
end);