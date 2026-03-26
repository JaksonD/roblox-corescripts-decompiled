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
local l_WearTimeOptionsCarousel_0 = v59.Components.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v59.Components.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v59.Utils.isDurableItemExpired;
local v63 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_FriendsOwnedChip_0 = require(l_CorePackages_0.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip;
local v65 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v66 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v69 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v71 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v72 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v73 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v74 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 = v13.FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation;
local v77 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXItemDetailsIxpExposure_0 = v77.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXDurablesSupport_0 = v77.FFlagAXDurablesSupport;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXInventoryDurablesSupport_0 = v77.FFlagAXInventoryDurablesSupport;
local l_FFlagAXTryOnScreenFixes_0 = v77.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v77.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v77.FFlagAXCustomizeMakeupSupport;
local v87 = game:DefineFastFlag("AXFixLocalizationGsub", false);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v77.CombinedFFlagShouldUseLegacyGamepadFocus;
local v89 = v3.PureComponent:extend("ItemDetailsContainer");
v89.validateProps = v11.strictInterface({
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
    setItemDetailsScrollingEnabled = if v71() then v11.optional(v11.callback) else nil, 
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
    itemData = v11.optional(v66), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v67() then v11.optional(v11.boolean) else nil, 
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
v89.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v89.init = function(v90) --[[ Line: 205 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v3 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v69 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), v72 (copy), v12 (copy), v73 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy)
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v90.requestImpressionsSignal = l_Signal_0.new();
        v90.itemDetailsContainerRef = v3.createRef();
    end;
    v90.expandableTextRef = v3.createRef();
    v90.wearTimeCarouselRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v3.createRef() else nil;
    v90.ownershipButtonRef = if v69() then v3.createRef() else nil;
    v90.resellerRef = v3.createRef();
    v90.attributionRef = v3.createRef();
    v90.recommendedItemsGridRef = v3.createRef();
    v90.socialProofRef = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createRef() else nil;
    v90.state = {
        width = 0, 
        is3DPreviewEnabled = v72.isEnabled() and v12.readTestVariable(v72.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v73() and nil, 
        socialProofChipRendered = not l_FFlagEnableSocialProofOnItemDetails_0 and nil
    };
    v90.fetchAssetOrBundleInfo = function() --[[ Line: 239 ]]
        -- upvalues: v90 (copy)
        local l_networking_0 = v90.props.networking;
        local l_appAnalytics_0 = v90.props.appAnalytics;
        local v93 = tostring(v90.props.itemId);
        local l_itemType_0 = v90.props.itemType;
        return v90.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v93, l_itemType_0);
    end;
    if v72.isEnabled() then
        v90.onItemViewportLoadingFailed = function() --[[ Line: 249 ]]
            -- upvalues: v90 (copy)
            v90:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v90:updateDurability();
    local v95, v96 = v3.createBinding(false);
    v90.itemHeaderVisibleBinding = v95;
    v90.updateItemHeaderVisibleBinding = v96;
    v90.onTryOnActivated = function() --[[ Line: 259 ]]
        -- upvalues: v90 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v97 = {
            itemId = v90.props.itemId, 
            itemType = v90.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v90.props.itemDetailsPeekViewRefs, 
            resultsListRef = v90.props.resultsListRef
        };
        local v98 = v97.itemType .. v97.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v97.itemSubType = v90.props.itemSubType;
        else
            v90.props.toggleTryOn(v90.props.networking, v90.props.catalogAnalytics, v90.props.itemType, v90.props.itemSubType, v90.props.itemId, true, nil, nil);
        end;
        v90.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v98, v97);
    end;
    v90.onItemOwnershipButtonActivated = function() --[[ Line: 288 ]]
        -- upvalues: v90 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v90.props.itemData.collectibleItemId;
        v90.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v90.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v90.props.itemType
        });
    end;
    v90.onItemHeaderMoved = function(v100) --[[ Line: 298 ]]
        -- upvalues: v90 (copy)
        if not v90.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v90.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v102 = l_current_0.AbsolutePosition.Y > v100.AbsolutePosition.Y;
                l_current_0.Visible = not v102;
                v90.updateItemHeaderVisibleBinding(v102);
                return;
            end;
        end;
    end;
    v90.hasCalledOnItemInvalid = false;
    if v73() then
        v90.onFetchRecommendationsFailed = function() --[[ Line: 320 ]]
            -- upvalues: v90 (copy)
            v90:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v89.canItemDescriptionExpand = function(v103, v104) --[[ Line: 328 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v103.props.itemData;
    local v106 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v106 = l_itemData_0.description;
        local v107 = v103.state.width - 48;
        return l_GetCanExpand_0(v104, v107, v106, 3);
    end;
end;
v89.updateDurability = function(v108) --[[ Line: 340 ]] --[[ Name: updateDurability ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy)
    if l_FFlagAXDurablesSupport_0 and v108.props.itemData and v108.props.itemData.timedOptions then
        v108.wearTimeOptions = v108.props.itemData.timedOptions;
    end;
end;
v89.didMount = function(v109) --[[ Line: 346 ]] --[[ Name: didMount ]]
    v109.fetchAssetOrBundleInfo();
end;
v89.didUpdate = function(v110, v111) --[[ Line: 350 ]] --[[ Name: didUpdate ]]
    -- upvalues: v19 (copy), v73 (copy)
    v110:updateDurability();
    local l_itemData_1 = v110.props.itemData;
    local l_fetchingState_0 = v110.props.fetchingState;
    local l_onItemInvalid_0 = v110.props.onItemInvalid;
    local v115 = false;
    if l_fetchingState_0 == v19.Done then
        v115 = l_itemData_1 == nil;
    end;
    local v116 = not v110.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v116 and v115 then
        l_onItemInvalid_0();
        v110.hasCalledOnItemInvalid = true;
    end;
    if v73() and (v111.itemType ~= v110.props.itemType or v111.itemId ~= v110.props.itemId) then
        v110:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
if l_FFlagEnableSocialProofOnItemDetails_0 then
    v89.setSocialProofChipRendered = function(v117, v118) --[[ Line: 378 ]] --[[ Name: setSocialProofChipRendered ]]
        v117:setState({
            socialProofChipRendered = v118
        });
    end;
end;
v89.shouldShowRecommendedItems = function(v119, v120) --[[ Line: 392 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v42 (copy), v73 (copy)
    if v120 then
        return false;
    elseif v119.props.assetType and not v42.doesAssetTypeHaveCatalogPage(v119.props.assetType) then
        return false;
    else
        local l_itemData_2 = v119.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v73() and v119.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v89.renderDetailsWithProviders = function(v122, v123) --[[ Line: 416 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v42 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v72 (copy), v44 (copy), v74 (copy), v67 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v69 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v3 (copy), l_LinkButton_0 (copy), v87 (copy), l_MenuDirection_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v23 (copy), v71 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v50 (copy), l_FriendsOwnedChip_0 (copy), v45 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v46 (copy), v47 (copy), v48 (copy), v49 (copy), v73 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v124 = tostring(v122.props.itemId);
    local l_itemType_1 = v122.props.itemType;
    local l_listPadding_0 = v122.props.listPadding;
    local l_itemSubType_0 = v122.props.itemSubType;
    local l_itemData_3 = v122.props.itemData;
    local v129 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v122.props.peekViewState;
    local l_width_0 = v122.state.width;
    local v132 = v42.GetRbxThumbType(l_itemType_1);
    local v133 = l_getRbxthumbWithTypeSizeAndOptions_0(v124, v132, 420);
    local v134 = v42.IsResellable(l_itemData_3);
    local v135 = v42.HasAttribution(l_itemData_3);
    local v136 = l_itemData_3 and l_itemData_3.isOwned and v134;
    local v137 = if l_FFlagAXDurablesSupport_0 then v122.wearTimeOptions and #v122.wearTimeOptions > 0 else nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v138 = l_itemData_3 and l_itemData_3.isOwned;
        local v139 = l_itemData_3 and l_itemData_3.isOwned and l_itemData_3.expirationTime;
        v137 = v137 and (not v138 or v139);
    end;
    local v140 = if l_FFlagAXRemoveExpiredItemsFromInventory_0 then l_itemData_3 and l_itemData_3.expirationTime and not l_isDurableItemExpired_0(l_itemData_3.expirationTime) else nil;
    local v141 = nil;
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    local v145 = nil;
    if v72.isEnabled() then
        v142 = l_itemData_3 and l_itemData_3.assetType;
        v143 = l_itemData_3 and l_itemData_3.bundleType;
        v145 = l_itemData_3 and l_itemData_3.items;
        v141 = v122.state.is3DPreviewEnabled;
        if l_itemType_1 == v44.ItemType.Asset then
            v141 = v141 and v44.ItemViewportAssetTypes[v142];
        elseif l_itemType_1 == v44.ItemType.Bundle then
            v141 = v141 and v44.ItemViewportBundleTypes[v143];
        end;
        if not v74() and v145 then
            for _, v147 in v145 do
                if v147.type == v44.ItemType.Outfit then
                    v144 = v147.id;
                    break;
                end;
            end;
        end;
    end;
    if v67() then
        v136 = v136 and v122.props.isCollectiblesEnabled;
    end;
    local v148 = v122.state.width * 9 / 16;
    local v149 = v122.props.showFullWithNoPeekView and v122.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v150) --[[ Line: 487 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v122 (copy), v69 (ref), v136 (ref), v134 (copy), v135 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 (ref), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v123 (copy), l_TextService_0 (ref), v3 (ref), l_LinkButton_0 (ref), v87 (ref), v42 (ref), l_MenuDirection_0 (ref), l_Focusable_0 (ref), l_FitFrameVertical_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v8 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v148 (copy), v72 (ref), v141 (ref), v23 (ref), v124 (copy), l_itemType_1 (copy), v143 (ref), v74 (ref), v144 (ref), v145 (ref), v71 (ref), l_LoadableImage_0 (ref), v133 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v44 (ref), v50 (ref), l_FriendsOwnedChip_0 (ref), v45 (ref), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref), v137 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v140 (copy), v4 (ref), l_ItemExpirationDisplay_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_WearTimeOptionsCarousel_0 (ref), v46 (ref), l_width_0 (copy), v47 (ref), v129 (copy), v48 (ref), v49 (ref), l_itemSubType_0 (copy), v73 (ref), v149 (copy), l_TagBasedImpressionsDetector_0 (ref)
        local l_Theme_0 = v150.Theme;
        local l_Font_0 = v150.Font;
        local v153 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v154 = if l_itemData_3 then l_itemData_3.name else nil;
        local l_Font_1 = l_Font_0.Header1.Font;
        local v156 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Full then
            v156 = l_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v157 = v122:canItemDescriptionExpand(l_Font_0);
        local v158 = if v157 then v122.expandableTextRef else if v69() and v136 then v122.ownershipButtonRef else if v134 then v122.resellerRef else if v135 then v122.attributionRef else v122.recommendedItemsGridRef;
        local v159 = nil;
        local v160 = nil;
        if l_itemData_3 then
            v159 = l_itemData_3.description;
            v160 = l_itemData_3.favoriteCount;
        end;
        local v161 = if v159 then v158 else nil;
        local v162 = if l_FFlagEnableSocialProofOnItemDetails_0 and v122.state.socialProofChipRendered then v122.socialProofRef else v122.props.NextSelectionUp;
        local v164 = l_FFlagEnableSocialProofOnItemDetails_0 and l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 and function(v163) --[[ Line: 522 ]]
            -- upvalues: v122 (ref)
            v122:setSocialProofChipRendered(v163);
        end or nil;
        local v165 = v122.props.navigation.getParam("fromProfile");
        local v166 = v122.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v166 = v122.props.simpleView or false;
        end;
        local v167 = v122:shouldShowRecommendedItems(v166);
        local l_tryOn_0 = v123.tryOn;
        local v169 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v170 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v169, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v171 = v122.props.collectibleData and v122.props.collectibleData.unitsAvailableForConsumption == 0;
        local v172 = not v166 and v122.props.enableAggregateLikesFavoritesCount;
        local v173 = nil;
        if v122.props.experiences then
            v173 = v3.createElement(l_LinkButton_0, {
                text = if v122.props.experiences and #v122.props.experiences == 1 and v122.props.experiences[1].name then if v87 then v123.inSpecificExperience else v123.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v122.props.experiences[1].name) else if v87 then v123.inMultipleExperiences else v123.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v122.props.experiences), 
                onActivated = function() --[[ Line: 565 ]] --[[ Name: onActivated ]]
                    -- upvalues: v122 (ref), l_AvatarScreen_0 (ref), v42 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v122.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v122.props.collectibleData, 
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
            defaultChild = v161, 
            restorePreviousChildFocus = true, 
            [v3.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v122.itemDetailsContainerRef else nil, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                MoveToTop = v8.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 597 ]]
                    -- upvalues: v122 (ref), v161 (copy)
                    v122.props.peekViewFocusController.moveFocusTo(v161);
                end), 
                MoveToRecItemsGrid = v8.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 600 ]]
                    -- upvalues: v122 (ref)
                    v122.props.peekViewFocusController.moveFocusTo(v122.recommendedItemsGridRef);
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
                    [v3.Change.AbsolutePosition] = v122.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v154 then v3.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v122.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v154, 
                        TextSize = v153, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v3.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v153)
                    }), 
                    RefUpdater = v3.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v3.Ref] = function(v174) --[[ Line: 643 ]]
                            -- upvalues: v122 (ref)
                            if v174 and v174.Parent then
                                v122.onItemHeaderMoved(v174.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v122.props.experiences then v3.createElement("Frame", {
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
                    ExperienceLink = v173, 
                    DashDivider = if v171 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v171 then v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v123.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v148), 
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
                    ItemViewport = if v72.isEnabled() and v141 then v3.createElement(v23, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v124, 
                        itemType = l_itemType_1, 
                        bundleType = v143, 
                        outfitId = if not v74() then v144 else nil, 
                        bundleItems = if v74() then v145 else nil, 
                        setParentScrollingEnabled = if v71() then v122.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v122.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v72.isEnabled() and v141 then nil else v3.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v133, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v148, v148), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v165 then v3.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v170 - 8, 1, -44), 
                            size = UDim2.fromOffset(v170, 36), 
                            text = l_tryOn_0, 
                            onActivated = v122.onTryOnActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v166 and l_itemType_1 == v44.ItemType.Bundle then v3.createElement(v50, {
                itemId = v124, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v3.createElement(l_FriendsOwnedChip_0, {
                itemId = v124, 
                itemType = l_itemType_1, 
                fromProfile = v165, 
                layoutOrder = 3, 
                ref = v122.socialProofRef, 
                chipIsRenderedCallback = if l_FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation_0 then v164 else nil, 
                NextSelectionUp = v122.props.NextSelectionUp, 
                NextSelectionDown = v122.expandableTextRef
            }) else nil, 
            ItemDescription = v3.createElement(v45, {
                compactNumberOfLines = 3, 
                descriptionText = v159, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v3.Ref] = v122.expandableTextRef, 
                NextSelectionUp = if v69() then if l_FFlagEnableSocialProofOnItemDetails_0 then v162 else v122.props.NextSelectionUp else nil, 
                NextSelectionDown = if v69() then if v156 and v136 then v122.ownershipButtonRef else if v156 and v134 then v122.resellerRef else if v156 and v135 then v122.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v156 and v137 then v122.wearTimeCarouselRef else if v156 then v122.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v137 then v122.wearTimeCarouselRef else v122.props.NextSelectionDown else if v156 then if v134 then v122.resellerRef else if v135 then v122.attributionRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v137 then v122.wearTimeCarouselRef else v122.recommendedItemsGridRef else if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v137 then v122.wearTimeCarouselRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v122.props.itemData and v122.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v140 then v4.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v122.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if l_FFlagAXDurablesSupport_0 and v137 then v3.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v122.wearTimeOptions, 
                onOptionActivated = v122.props.onWearTimeSelection, 
                useWrapping = true, 
                firstOptionRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v122.wearTimeCarouselRef else nil, 
                nextSelectionDown = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v122.recommendedItemsGridRef else nil
            }) else nil, 
            ItemStatistics = v172 and v3.createElement(v46, {
                favoritesCount = v160, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 5 or 4) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v136 then v3.createElement(v47, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagAXDurablesSupport_0 and 6 or 5) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                itemId = v124, 
                isLimitedCollectible = v122.props.isLimitedCollectible, 
                collectibleItemId = v129, 
                onActivated = v122.onItemOwnershipButtonActivated, 
                ref = if v69() then v122.ownershipButtonRef else nil, 
                NextSelectionUp = if v69() then if v156 and v157 then v122.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v162 else v122.props.NextSelectionUp else nil, 
                NextSelectionDown = if v69() then if v156 and v134 then v122.resellerRef else if v156 and v135 then v122.attributionRef else if v156 then v122.recommendedItemsGridRef else v122.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v166 and v3.createElement(v48, {
                itemId = v124, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 7 or 6) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                resellerRef = v122.resellerRef, 
                attributionRef = v122.attributionRef, 
                NextSelectionUp = if v69() then if v156 and v136 then v122.ownershipButtonRef else if v156 and v157 then v122.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v162 else v122.props.NextSelectionUp else v156 and v157 and v122.expandableTextRef or nil, 
                NextSelectionDown = if v69() then if v156 then v122.recommendedItemsGridRef else v122.props.NextSelectionDown else v156 and v122.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v167 and v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 9 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v123.recommendedLabel, 
                TextSize = v153, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v122.state.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v167 and v3.createElement(v49, {
                itemId = v124, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v73() then v122.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 9, 
                [v3.Ref] = v122.recommendedItemsGridRef, 
                NextSelectionUp = if v156 and v135 then v122.attributionRef else if v69() then if v156 and v134 then v122.resellerRef else if v156 and v136 then v122.ownershipButtonRef else if v156 and v157 then v122.expandableTextRef else if l_FFlagEnableSocialProofOnItemDetails_0 then v162 else v122.props.NextSelectionUp else v134 and v122.resellerRef or v157 and v122.expandableTextRef or nil, 
                NextSelectionDown = v122.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v122.props.itemDetailsPeekViewRefs, 
                resultsListRef = v122.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v149 and v3.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10 + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v122.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v3.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v122.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 964 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v122 (ref)
                    return v122.props.navigation.state.key == v122.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v122.requestImpressionsSignal, 
                extensions = v122.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v89.renderDetails = function(v175) --[[ Line: 978 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy), v87 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = if v87 then {
            "Feature.Catalog.Label.InMultipleExperiences"; 
            NUM_EXPERIENCES = if v175.props.experiences then #v175.props.experiences else 0
        } else "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = if v87 then {
            "Feature.Catalog.Label.InSpecificExperience"; 
            EXPERIENCE_NAME = if v175.props.experiences then v175.props.experiences[1].name else ""
        } else "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v176) --[[ Line: 996 ]]
        -- upvalues: v175 (copy)
        return v175:renderDetailsWithProviders(v176);
    end);
end;
v89.renderOnFailed = function(v177) --[[ Line: 1001 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v43 (copy), l_withLocalization_0 (copy), v3 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v177.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v177.props.globalGuiInset;
    local l_screenSize_0 = v177.props.screenSize;
    local v181 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v182 = v43.ActionBar.ActionBarHeight + v43.ActionBar.ActionBarGradientHeight;
    local v184 = l_withLocalization_0({
        emptyText = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v183) --[[ Line: 1012 ]]
        -- upvalues: v3 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v3.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v183.emptyText
        });
    end);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v181.Y.Scale, v181.Y.Offset - v182)
    }, {
        EmptyStatePage = v184
    });
end;
v89.render = function(v185) --[[ Line: 1027 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v3 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v185.props.clipDetails;
    local l_fetchingState_1 = v185.props.fetchingState;
    return l_withStyle_0(function(v188) --[[ Line: 1031 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v3 (ref), v185 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v188.Theme;
        local v190 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v190 = "Frame";
        end;
        return v3.createElement(v190, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v3.Ref] = v185.props.forwardRef, 
            [v3.Change.AbsoluteSize] = function(v191) --[[ Line: 1057 ]]
                -- upvalues: v185 (ref)
                if v185.state.width ~= v191.AbsoluteSize.X then
                    v185:setState({
                        width = v191.AbsoluteSize.X
                    });
                end;
            end, 
            [v3.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1066 ]]
                -- upvalues: v185 (ref)
                v185.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v3.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1073 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v185 (ref)
                    return v185:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1076 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v185 (ref)
                    return v185:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1079 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v185 (ref)
                    return v185:renderOnFailed();
                end
            })
        });
    end);
end;
v89 = v7.connect(function(v193, v194) --[[ Line: 1088 ]]
    -- upvalues: l_PerformFetch_0 (copy), v42 (copy), v19 (copy), v65 (copy), l_AvatarScreen_0 (copy), v67 (copy)
    local v195 = l_PerformFetch_0.GetStatus(v193, v42.GetItemDetailsKey(v194.itemId, v194.itemType));
    local v196 = nil;
    if v195 ~= v19.NotStarted then
        v196 = v65(v193.AvatarExperience.Common, v194.itemId, v194.itemType);
    end;
    if v194.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v196 ~= nil and v196.name == nil then
        v196 = nil;
    end;
    local v197 = nil;
    local v198 = nil;
    local v199 = if (if v196 then v196.collectibleItemId else nil) and v196 then v193.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v196.collectibleItemId] else nil;
    local v200 = v42.GetItemSubType(v194.itemType, v196);
    if v199 ~= nil then
        v197 = v199.experiences;
    end;
    if v67() then
        v198 = v193.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v201 = v42.isLimitedCollectible(v196);
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
end, function(v202, _) --[[ Line: 1133 ]]
    -- upvalues: v63 (copy), v40 (copy), v53 (copy)
    return {
        fetchAssetOrBundleInfo = function(v204, v205, v206, v207) --[[ Line: 1135 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v202 (copy), v63 (ref)
            return v202(v63(v204, v205, v206, v207));
        end, 
        navigateDownToAvatarScreen = function(v208, v209, v210) --[[ Line: 1138 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v202 (copy), v40 (ref)
            return v202(v40(v208, v209, v210));
        end, 
        toggleTryOn = function(v211, v212, v213, v214, v215, v216, v217, v218) --[[ Line: 1141 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v202 (copy), v53 (ref)
            v202(v53(v211, v212, v213, v214, v215, v216, v217, v218));
        end
    };
end)(v89);
v89 = l_RoactAppPolicy_0.connect(function(v219, _) --[[ Line: 1169 ]]
    return {
        enableAggregateLikesFavoritesCount = v219.getEnableAggregateLikesFavoritesCount()
    };
end)(v89);
v89 = v14.withNavigation(v89);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v89 = v55(v89);
end;
v89 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v22, 
    networking = v18
})(v89);
return v3.forwardRef(function(v221, v222) --[[ Line: 1187 ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v4 (copy), v51 (copy), v3 (copy), v89 (ref), v5 (copy)
    local v223 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v224 = l_useUnifiedEventImpressionsReporter_0();
        v223 = v4.useMemo(function() --[[ Line: 1191 ]]
            -- upvalues: v224 (copy), v51 (ref)
            return {
                v224, 
                v51
            };
        end, {
            v224, 
            v51
        });
    end;
    return v3.createElement(v89, v5.Dictionary.join(v221, {
        forwardRef = v222, 
        tagBasedImpressionsDetectorExtensions = v223
    }));
end);