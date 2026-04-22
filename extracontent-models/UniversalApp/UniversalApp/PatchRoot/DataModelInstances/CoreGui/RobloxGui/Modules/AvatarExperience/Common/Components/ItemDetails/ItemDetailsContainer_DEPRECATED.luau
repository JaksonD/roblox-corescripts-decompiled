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
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v25 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v25.Style.withStyle;
local l_LoadableImage_0 = v25.App.Loading.LoadableImage;
local l_GetCanExpand_0 = v25.Core.Text.ExpandableText.GetCanExpand;
local l_LoadingStateContainer_0 = v25.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v25.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v25.App.Indicator.EmptyState;
local l_Button_0 = v25.App.Button.Button;
local l_ButtonType_0 = v25.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v25.App.Button.LinkButton;
local l_MenuDirection_0 = v25.App.Menu.MenuDirection;
local l_StyledTextLabel_0 = v25.App.Text.StyledTextLabel;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v42 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v44 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDescription);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v50 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid);
local v51 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.logItemDetailsIxpLayerExposure);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v53 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local v59 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v60 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTimedOptions);
local l_WearTimeOptionsCarousel_0 = v60.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v60.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v59.Utils.isDurableItemExpired;
local v64 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_FriendsOwnedChip_0 = require(l_CorePackages_0.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip;
local v66 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v67 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local v68 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v73 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v74 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v75 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v76 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 = v13.FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation;
local v79 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXItemDetailsIxpExposure_0 = v79.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXThumbTypeNilCheck_0 = v79.FFlagAXThumbTypeNilCheck;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXInventoryDurablesSupport_0 = v79.FFlagAXInventoryDurablesSupport;
local l_FFlagAXTryOnScreenFixes_0 = v79.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v79.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v79.FFlagAXCustomizeMakeupSupport;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v79.CombinedFFlagShouldUseLegacyGamepadFocus;
local v90 = v3.PureComponent:extend("ItemDetailsContainer");
v90.validateProps = v11.strictInterface({
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
    setItemDetailsScrollingEnabled = if v73() then v11.optional(v11.callback) else nil, 
    onWearTimeSelection = v11.optional(v11.callback), 
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
    itemData = v11.optional(v67), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v68() then v11.optional(v11.boolean) else nil, 
    isLimitedCollectible = v11.optional(v11.boolean), 
    fetchAssetOrBundleInfo = v11.callback, 
    navigateDownToAvatarScreen = v11.callback, 
    toggleTryOn = v11.optional(v11.callback), 
    navigation = v11.table, 
    avatarRoute = if l_FFlagAXItemDetailsIxpExposure_0 then l_AvatarRoute_0.Interface else nil, 
    networking = v11.callback, 
    appAnalytics = v11.table, 
    catalogAnalytics = v11.table, 
    showPremiumContent = v11.optional(v11.boolean), 
    enableAggregateLikesFavoritesCount = v11.boolean
});
v90.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v90.init = function(v91) --[[ Line: 206 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v3 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v70 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), v74 (copy), v12 (copy), v75 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy)
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v91.requestImpressionsSignal = l_Signal_0.new();
        v91.itemDetailsContainerRef = v3.createRef();
    end;
    v91.expandableTextRef = v3.createRef();
    v91.wearTimeCarouselRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v3.createRef() else nil;
    v91.ownershipButtonRef = if v70() then v3.createRef() else nil;
    v91.resellerRef = v3.createRef();
    v91.attributionRef = v3.createRef();
    v91.recommendedItemsGridRef = v3.createRef();
    v91.socialProofRef = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createRef() else nil;
    v91.state = {
        width = 0, 
        is3DPreviewEnabled = v74.isEnabled() and v12.readTestVariable(v74.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v75() and nil, 
        socialProofChipRendered = not l_FFlagEnableSocialProofOnItemDetails_0 and nil
    };
    v91.fetchAssetOrBundleInfo = function() --[[ Line: 240 ]]
        -- upvalues: v91 (copy)
        local l_networking_0 = v91.props.networking;
        local l_appAnalytics_0 = v91.props.appAnalytics;
        local v94 = tostring(v91.props.itemId);
        local l_itemType_0 = v91.props.itemType;
        return v91.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v94, l_itemType_0);
    end;
    if v74.isEnabled() then
        v91.onItemViewportLoadingFailed = function() --[[ Line: 250 ]]
            -- upvalues: v91 (copy)
            v91:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v91:updateDurability();
    local v96, v97 = v3.createBinding(false);
    v91.itemHeaderVisibleBinding = v96;
    v91.updateItemHeaderVisibleBinding = v97;
    v91.onTryOnActivated = function() --[[ Line: 260 ]]
        -- upvalues: v91 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v98 = {
            itemId = v91.props.itemId, 
            itemType = v91.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v91.props.itemDetailsPeekViewRefs, 
            resultsListRef = v91.props.resultsListRef
        };
        local v99 = v98.itemType .. v98.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v98.itemSubType = v91.props.itemSubType;
        else
            v91.props.toggleTryOn(v91.props.networking, v91.props.catalogAnalytics, v91.props.itemType, v91.props.itemSubType, v91.props.itemId, true, nil, nil);
        end;
        v91.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v99, v98);
    end;
    v91.onItemOwnershipButtonActivated = function() --[[ Line: 289 ]]
        -- upvalues: v91 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v91.props.itemData.collectibleItemId;
        v91.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v91.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v91.props.itemType
        });
    end;
    v91.onItemHeaderMoved = function(v101) --[[ Line: 299 ]]
        -- upvalues: v91 (copy)
        if not v91.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v91.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v103 = l_current_0.AbsolutePosition.Y > v101.AbsolutePosition.Y;
                l_current_0.Visible = not v103;
                v91.updateItemHeaderVisibleBinding(v103);
                return;
            end;
        end;
    end;
    v91.hasCalledOnItemInvalid = false;
    if v75() then
        v91.onFetchRecommendationsFailed = function() --[[ Line: 321 ]]
            -- upvalues: v91 (copy)
            v91:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v90.canItemDescriptionExpand = function(v104, v105) --[[ Line: 329 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v104.props.itemData;
    local v107 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v107 = l_itemData_0.description;
        local v108 = v104.state.width - 48;
        return l_GetCanExpand_0(v105, v108, v107, 3);
    end;
end;
v90.updateDurability = function(v109) --[[ Line: 341 ]] --[[ Name: updateDurability ]]
    if v109.props.itemData and v109.props.itemData.timedOptions then
        v109.wearTimeOptions = v109.props.itemData.timedOptions;
    end;
end;
v90.didMount = function(v110) --[[ Line: 347 ]] --[[ Name: didMount ]]
    v110.fetchAssetOrBundleInfo();
end;
v90.didUpdate = function(v111, v112) --[[ Line: 351 ]] --[[ Name: didUpdate ]]
    -- upvalues: v19 (copy), v75 (copy)
    v111:updateDurability();
    local l_itemData_1 = v111.props.itemData;
    local l_fetchingState_0 = v111.props.fetchingState;
    local l_onItemInvalid_0 = v111.props.onItemInvalid;
    local v116 = false;
    if l_fetchingState_0 == v19.Done then
        v116 = l_itemData_1 == nil;
    end;
    local v117 = not v111.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v117 and v116 then
        l_onItemInvalid_0();
        v111.hasCalledOnItemInvalid = true;
    end;
    if v75() and (v112.itemType ~= v111.props.itemType or v112.itemId ~= v111.props.itemId) then
        v111:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
if l_FFlagEnableSocialProofOnItemDetails_0 then
    v90.setSocialProofChipRendered = function(v118, v119) --[[ Line: 379 ]] --[[ Name: setSocialProofChipRendered ]]
        v118:setState({
            socialProofChipRendered = v119
        });
    end;
end;
v90.shouldShowRecommendedItems = function(v120, v121) --[[ Line: 393 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v42 (copy), v75 (copy)
    if v121 then
        return false;
    elseif v120.props.assetType and not v42.doesAssetTypeHaveCatalogPage(v120.props.assetType) then
        return false;
    else
        local l_itemData_2 = v120.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v75() and v120.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v90.renderDetailsWithProviders = function(v123, v124) --[[ Line: 417 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v42 (copy), l_FFlagAXThumbTypeNilCheck_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v74 (copy), v44 (copy), v76 (copy), v68 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v70 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v3 (copy), l_LinkButton_0 (copy), l_MenuDirection_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v23 (copy), v73 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v50 (copy), l_FriendsOwnedChip_0 (copy), v45 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v46 (copy), v47 (copy), v48 (copy), v49 (copy), v75 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v125 = tostring(v123.props.itemId);
    local l_itemType_1 = v123.props.itemType;
    local l_listPadding_0 = v123.props.listPadding;
    local l_itemSubType_0 = v123.props.itemSubType;
    local l_itemData_3 = v123.props.itemData;
    local v130 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v123.props.peekViewState;
    local l_width_0 = v123.state.width;
    local v133 = v42.GetRbxThumbType(l_itemType_1);
    local v134 = nil;
    v134 = if l_FFlagAXThumbTypeNilCheck_0 and v133 then l_getRbxthumbWithTypeSizeAndOptions_0(v125, v133, 420) else l_getRbxthumbWithTypeSizeAndOptions_0(v125, v133, 420);
    local v135 = v42.IsResellable(l_itemData_3);
    local v136 = v42.HasAttribution(l_itemData_3);
    local v137 = l_itemData_3 and l_itemData_3.isOwned and v135;
    local v138 = v123.wearTimeOptions and #v123.wearTimeOptions > 0;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v139 = l_itemData_3 and l_itemData_3.isOwned;
        local v140 = l_itemData_3 and l_itemData_3.isOwned and l_itemData_3.expirationTime;
        v138 = v138 and (not v139 or v140);
    end;
    local v141 = if l_FFlagAXRemoveExpiredItemsFromInventory_0 then l_itemData_3 and l_itemData_3.expirationTime and not l_isDurableItemExpired_0(l_itemData_3.expirationTime) else nil;
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    local v145 = nil;
    local v146 = nil;
    if v74.isEnabled() then
        v143 = l_itemData_3 and l_itemData_3.assetType;
        v144 = l_itemData_3 and l_itemData_3.bundleType;
        v146 = l_itemData_3 and l_itemData_3.items;
        v142 = v123.state.is3DPreviewEnabled;
        if l_itemType_1 == v44.ItemType.Asset then
            v142 = v142 and v44.ItemViewportAssetTypes[v143];
        elseif l_itemType_1 == v44.ItemType.Bundle then
            v142 = v142 and v44.ItemViewportBundleTypes[v144];
        end;
        if not v76() and v146 then
            for _, v148 in v146 do
                if v148.type == v44.ItemType.Outfit then
                    v145 = v148.id;
                    break;
                end;
            end;
        end;
    end;
    if v68() then
        v137 = v137 and v123.props.isCollectiblesEnabled;
    end;
    local v149 = v123.state.width * 9 / 16;
    local v150 = v123.props.showFullWithNoPeekView and v123.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v151) --[[ Line: 491 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v123 (copy), v70 (ref), v137 (ref), v135 (copy), v136 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v124 (copy), l_TextService_0 (ref), v3 (ref), l_LinkButton_0 (ref), v42 (ref), l_MenuDirection_0 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v8 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v149 (copy), v74 (ref), v142 (ref), v23 (ref), v125 (copy), l_itemType_1 (copy), v144 (ref), v76 (ref), v145 (ref), v146 (ref), v73 (ref), l_LoadableImage_0 (ref), v134 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v44 (ref), v50 (ref), l_FriendsOwnedChip_0 (ref), v45 (ref), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), v138 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v141 (copy), v4 (ref), l_ItemExpirationDisplay_0 (ref), l_WearTimeOptionsCarousel_0 (ref), v46 (ref), l_width_0 (copy), v47 (ref), v130 (copy), v48 (ref), v49 (ref), l_itemSubType_0 (copy), v75 (ref), v150 (copy), l_TagBasedImpressionsDetector_0 (ref)
        local l_Theme_0 = v151.Theme;
        local l_Font_0 = v151.Font;
        local v154 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v155 = if l_itemData_3 then l_itemData_3.name else nil;
        local l_Font_1 = l_Font_0.Header1.Font;
        local v157 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Full then
            v157 = l_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v158 = v123:canItemDescriptionExpand(l_Font_0);
        local v159 = if v158 then v123.expandableTextRef else if v70() and v137 then v123.ownershipButtonRef else if v135 then v123.resellerRef else if v136 then v123.attributionRef else v123.recommendedItemsGridRef;
        local v160 = nil;
        local v161 = nil;
        if l_itemData_3 then
            v160 = l_itemData_3.description;
            v161 = l_itemData_3.favoriteCount;
        end;
        local v162 = if v160 then v159 else nil;
        local v163 = if l_FFlagEnableSocialProofOnItemDetails_0 and v123.state.socialProofChipRendered then v123.socialProofRef else v123.props.NextSelectionUp;
        local v165 = l_FFlagEnableSocialProofOnItemDetails_0 and l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 and function(v164) --[[ Line: 526 ]]
            -- upvalues: v123 (ref)
            v123:setSocialProofChipRendered(v164);
        end or nil;
        local v166 = v123.props.navigation.getParam("fromProfile");
        local v167 = v123.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v167 = v123.props.simpleView or false;
        end;
        local v168 = v123:shouldShowRecommendedItems(v167);
        local l_tryOn_0 = v124.tryOn;
        local v170 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v171 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v170, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v172 = v123.props.collectibleData and v123.props.collectibleData.unitsAvailableForConsumption == 0;
        local v173 = not v167 and v123.props.enableAggregateLikesFavoritesCount;
        local v174 = nil;
        if v123.props.experiences then
            v174 = v3.createElement(l_LinkButton_0, {
                text = if v123.props.experiences and #v123.props.experiences == 1 and v123.props.experiences[1].name then v124.inSpecificExperience else v124.inMultipleExperiences, 
                onActivated = function() --[[ Line: 562 ]] --[[ Name: onActivated ]]
                    -- upvalues: v123 (ref), l_AvatarScreen_0 (ref), v42 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v123.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v123.props.collectibleData, 
                        isLimited = v42.isLimitedCollectible(l_itemData_3), 
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
            defaultChild = v162, 
            restorePreviousChildFocus = true, 
            [v3.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v123.itemDetailsContainerRef else nil, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                MoveToTop = v8.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 594 ]]
                    -- upvalues: v123 (ref), v162 (copy)
                    v123.props.peekViewFocusController.moveFocusTo(v162);
                end), 
                MoveToRecItemsGrid = v8.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 597 ]]
                    -- upvalues: v123 (ref)
                    v123.props.peekViewFocusController.moveFocusTo(v123.recommendedItemsGridRef);
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
                    [v3.Change.AbsolutePosition] = v123.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v155 then v3.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v123.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v155, 
                        TextSize = v154, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v154)
                    }), 
                    RefUpdater = v3.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v3.Ref] = function(v175) --[[ Line: 640 ]]
                            -- upvalues: v123 (ref)
                            if v175 and v175.Parent then
                                v123.onItemHeaderMoved(v175.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v123.props.experiences then v3.createElement("Frame", {
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
                    ExperienceLink = v174, 
                    DashDivider = if v172 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v172 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v124.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v149), 
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
                    ItemViewport = if v74.isEnabled() and v142 then v3.createElement(v23, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v125, 
                        itemType = l_itemType_1, 
                        bundleType = v144, 
                        outfitId = if not v76() then v145 else nil, 
                        bundleItems = if v76() then v146 else nil, 
                        setParentScrollingEnabled = if v73() then v123.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v123.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v74.isEnabled() and v142 then nil else v3.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v134, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v149, v149), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v166 then v3.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v171 - 8, 1, -44), 
                            size = UDim2.fromOffset(v171, 36), 
                            text = l_tryOn_0, 
                            onActivated = v123.onTryOnActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v167 and l_itemType_1 == v44.ItemType.Bundle then v3.createElement(v50, {
                itemId = v125, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createElement(l_FriendsOwnedChip_0, {
                itemId = v125, 
                itemType = l_itemType_1, 
                fromProfile = v166, 
                layoutOrder = 3, 
                ref = v123.socialProofRef, 
                chipIsRenderedCallback = if l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 then v165 else nil, 
                NextSelectionUp = v123.props.NextSelectionUp, 
                NextSelectionDown = v123.expandableTextRef
            }) else nil, 
            ItemDescription = v3.createElement(v45, {
                compactNumberOfLines = 3, 
                descriptionText = v160, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v3.Ref] = v123.expandableTextRef, 
                NextSelectionUp = if v70() then if l_FFlagEnableSocialProofOnItemDetails_0 then v163 else v123.props.NextSelectionUp else nil, 
                NextSelectionDown = if v70() then if v157 and v137 then v123.ownershipButtonRef else if v157 and v135 then v123.resellerRef else if v157 and v136 then v123.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v157 and v138 then v123.wearTimeCarouselRef else if v157 then v123.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v138 then v123.wearTimeCarouselRef else v123.props.NextSelectionDown else if v157 then if v135 then v123.resellerRef else if v136 then v123.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v138 then v123.wearTimeCarouselRef else v123.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v138 then v123.wearTimeCarouselRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v123.props.itemData and v123.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v141 then v4.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v123.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if v138 then v3.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v123.wearTimeOptions, 
                onOptionActivated = v123.props.onWearTimeSelection, 
                useWrapping = true, 
                firstOptionRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v123.wearTimeCarouselRef else nil, 
                nextSelectionDown = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v123.recommendedItemsGridRef else nil
            }) else nil, 
            ItemStatistics = v173 and v3.createElement(v46, {
                favoritesCount = v161, 
                LayoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0) + 5, 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v137 then v3.createElement(v47, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0) + 6, 
                itemId = v125, 
                isLimitedCollectible = v123.props.isLimitedCollectible, 
                collectibleItemId = v130, 
                onActivated = v123.onItemOwnershipButtonActivated, 
                ref = if v70() then v123.ownershipButtonRef else nil, 
                NextSelectionUp = if v70() then if v157 and v158 then v123.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v163 else v123.props.NextSelectionUp else nil, 
                NextSelectionDown = if v70() then if v157 and v135 then v123.resellerRef else if v157 and v136 then v123.attributionRef else if v157 then v123.recommendedItemsGridRef else v123.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v167 and v3.createElement(v48, {
                itemId = v125, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0) + 7, 
                resellerRef = v123.resellerRef, 
                attributionRef = v123.attributionRef, 
                NextSelectionUp = if v70() then if v157 and v137 then v123.ownershipButtonRef else if v157 and v158 then v123.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v163 else v123.props.NextSelectionUp else v157 and v158 and v123.expandableTextRef or nil, 
                NextSelectionDown = if v70() then if v157 then v123.recommendedItemsGridRef else v123.props.NextSelectionDown else v157 and v123.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v168 and v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 9 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v124.recommendedLabel, 
                TextSize = v154, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v123.state.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v168 and v3.createElement(v49, {
                itemId = v125, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v75() then v123.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 9, 
                [v3.Ref] = v123.recommendedItemsGridRef, 
                NextSelectionUp = if v157 and v136 then v123.attributionRef else if v70() then if v157 and v135 then v123.resellerRef else if v157 and v137 then v123.ownershipButtonRef else if v157 and v158 then v123.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v163 else v123.props.NextSelectionUp else v135 and v123.resellerRef or v158 and v123.expandableTextRef or nil, 
                NextSelectionDown = v123.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v123.props.itemDetailsPeekViewRefs, 
                resultsListRef = v123.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v150 and v3.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10 + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v123.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v3.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v123.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 961 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v123 (ref)
                    return v123.props.navigation.state.key == v123.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v123.requestImpressionsSignal, 
                extensions = v123.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v90.renderDetails = function(v176) --[[ Line: 975 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = {
            "Feature.Catalog.Label.InMultipleExperiences"; 
            NUM_EXPERIENCES = if v176.props.experiences then #v176.props.experiences else 0
        }, 
        inSpecificExperience = {
            "Feature.Catalog.Label.InSpecificExperience"; 
            EXPERIENCE_NAME = if v176.props.experiences then v176.props.experiences[1].name else ""
        }, 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v177) --[[ Line: 989 ]]
        -- upvalues: v176 (copy)
        return v176:renderDetailsWithProviders(v177);
    end);
end;
v90.renderOnFailed = function(v178) --[[ Line: 994 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v43 (copy), l_withLocalization_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v178.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v178.props.globalGuiInset;
    local l_screenSize_0 = v178.props.screenSize;
    local v182 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v183 = v43.ActionBar.ActionBarHeight + v43.ActionBar.ActionBarGradientHeight;
    local v185 = l_withLocalization_0({
        emptyText = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v184) --[[ Line: 1005 ]]
        -- upvalues: v3 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v3.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v184.emptyText
        });
    end);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v182.Y.Scale, v182.Y.Offset - v183)
    }, {
        EmptyStatePage = v185
    });
end;
v90.render = function(v186) --[[ Line: 1020 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v3 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v186.props.clipDetails;
    local l_fetchingState_1 = v186.props.fetchingState;
    return l_withStyle_0(function(v189) --[[ Line: 1024 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v3 (ref), v186 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v189.Theme;
        local v191 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v191 = "Frame";
        end;
        return v3.createElement(v191, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v3.Ref] = v186.props.forwardRef, 
            [v3.Change.AbsoluteSize] = function(v192) --[[ Line: 1050 ]]
                -- upvalues: v186 (ref)
                if v186.state.width ~= v192.AbsoluteSize.X then
                    v186:setState({
                        width = v192.AbsoluteSize.X
                    });
                end;
            end, 
            [v3.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1059 ]]
                -- upvalues: v186 (ref)
                v186.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v3.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1066 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v186 (ref)
                    return v186:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1069 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v186 (ref)
                    return v186:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1072 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v186 (ref)
                    return v186:renderOnFailed();
                end
            })
        });
    end);
end;
v90 = v7.connect(function(v194, v195) --[[ Line: 1081 ]]
    -- upvalues: l_PerformFetch_0 (copy), v42 (copy), v19 (copy), v66 (copy), l_AvatarScreen_0 (copy), v68 (copy)
    local v196 = l_PerformFetch_0.GetStatus(v194, v42.GetItemDetailsKey(v195.itemId, v195.itemType));
    local v197 = nil;
    if v196 ~= v19.NotStarted then
        v197 = v66(v194.AvatarExperience.Common, v195.itemId, v195.itemType);
    end;
    if v195.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v197 ~= nil and v197.name == nil then
        v197 = nil;
    end;
    local v198 = nil;
    local v199 = nil;
    local v200 = if (if v197 then v197.collectibleItemId else nil) and v197 then v194.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v197.collectibleItemId] else nil;
    local v201 = v42.GetItemSubType(v195.itemType, v197);
    if v200 ~= nil then
        v198 = v200.experiences;
    end;
    if v68() then
        v199 = v194.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v202 = v42.isLimitedCollectible(v197);
    return {
        globalGuiInset = v194.GlobalGuiInset, 
        screenSize = v194.ScreenSize, 
        fetchingState = v196, 
        itemData = v197, 
        itemSubType = v201, 
        peekViewState = v194.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        experiences = v198, 
        collectibleData = v200, 
        isCollectiblesEnabled = v199, 
        isLimitedCollectible = v202
    };
end, function(v203, _) --[[ Line: 1126 ]]
    -- upvalues: v64 (copy), v40 (copy), v53 (copy)
    return {
        fetchAssetOrBundleInfo = function(v205, v206, v207, v208) --[[ Line: 1128 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v203 (copy), v64 (ref)
            return v203(v64(v205, v206, v207, v208));
        end, 
        navigateDownToAvatarScreen = function(v209, v210, v211) --[[ Line: 1131 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v203 (copy), v40 (ref)
            return v203(v40(v209, v210, v211));
        end, 
        toggleTryOn = function(v212, v213, v214, v215, v216, v217, v218, v219) --[[ Line: 1134 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v203 (copy), v53 (ref)
            v203(v53(v212, v213, v214, v215, v216, v217, v218, v219));
        end
    };
end)(v90);
v90 = l_RoactAppPolicy_0.connect(function(v220, _) --[[ Line: 1162 ]]
    return {
        enableAggregateLikesFavoritesCount = v220.getEnableAggregateLikesFavoritesCount()
    };
end)(v90);
v90 = v14.withNavigation(v90);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v90 = v55(v90);
end;
v90 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v22, 
    networking = v18
})(v90);
return v3.forwardRef(function(v222, v223) --[[ Line: 1180 ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v4 (copy), v51 (copy), v3 (copy), v90 (ref), v5 (copy)
    local v224 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v225 = l_useUnifiedEventImpressionsReporter_0();
        v224 = v4.useMemo(function() --[[ Line: 1184 ]]
            -- upvalues: v225 (copy), v51 (ref)
            return {
                v225, 
                v51
            };
        end, {
            v225, 
            v51
        });
    end;
    return v3.createElement(v90, v5.Dictionary.join(v222, {
        forwardRef = v223, 
        tagBasedImpressionsDetectorExtensions = v224
    }));
end);