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
local l_WearTimeOptionsCarousel_0 = v65.Components.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v65.Components.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v65.Utils.isDurableItemExpired;
local l_useTableWrappedCallbackRef_0 = v65.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v72 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.useItemDetailsContainerFocusNavigationBindings);
local v73 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v75 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v76 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v77 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v78 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v79 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagUpdateNoInternetConnectionText_0 = v79.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXItemDetailsIxpExposure_0 = v79.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXDurablesSupport_0 = v79.FFlagAXDurablesSupport;
local l_FFlagAXInventoryDurablesSupport_0 = v79.FFlagAXInventoryDurablesSupport;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local v87 = game:DefineFastFlag("AXFixItemDetailsContainerGuiInsetType", false);
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXTryOnScreenFixes_0 = v79.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v79.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v79.FFlagAXCustomizeMakeupSupport;
local v92 = v4.PureComponent:extend("ItemDetailsContainer");
v92.validateProps = v11.strictInterface({
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
    setItemDetailsScrollingEnabled = if v75() then v11.optional(v11.callback) else nil, 
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
    onWearTimeSelection = if l_FFlagAXDurablesSupport_0 then v11.optional(v11.callback) else nil, 
    globalGuiInset = v11.strictInterface({
        left = if v87 then v11.number else v11.integer, 
        top = if v87 then v11.number else v11.integer, 
        right = if v87 then v11.number else v11.integer, 
        bottom = if v87 then v11.number else v11.integer
    }), 
    screenSize = v11.Vector2, 
    fetchingState = v11.string, 
    itemData = v11.optional(v64), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v70() then v11.optional(v11.boolean) else nil, 
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
v92.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v92.init = function(v93) --[[ Line: 219 ]] --[[ Name: init ]]
    -- upvalues: v76 (copy), v12 (copy), v77 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v4 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy)
    v93.state = {
        is3DPreviewEnabled = v76.isEnabled() and v12.readTestVariable(v76.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v77() and nil
    };
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v93.requestImpressionsSignal = l_Signal_0.new();
    end;
    v93.fetchAssetOrBundleInfo = function() --[[ Line: 232 ]]
        -- upvalues: v93 (copy)
        local l_networking_0 = v93.props.networking;
        local l_appAnalytics_0 = v93.props.appAnalytics;
        local v96 = tostring(v93.props.itemId);
        local l_itemType_0 = v93.props.itemType;
        return v93.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v96, l_itemType_0);
    end;
    if v76.isEnabled() then
        v93.onItemViewportLoadingFailed = function() --[[ Line: 242 ]]
            -- upvalues: v93 (copy)
            v93:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v93:updateDurability();
    local v98, v99 = v4.createBinding(false);
    v93.itemHeaderVisibleBinding = v98;
    v93.updateItemHeaderVisibleBinding = v99;
    v93.onTryOnActivated = function() --[[ Line: 252 ]]
        -- upvalues: v93 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v100 = {
            itemId = v93.props.itemId, 
            itemType = v93.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v93.props.itemDetailsPeekViewRefs, 
            resultsListRef = v93.props.resultsListRef
        };
        local v101 = v100.itemType .. v100.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v100.itemSubType = v93.props.itemSubType;
        else
            v93.props.toggleTryOn(v93.props.networking, v93.props.catalogAnalytics, v93.props.itemType, v93.props.itemSubType, v93.props.itemId, true, nil, nil);
        end;
        v93.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v101, v100);
    end;
    v93.onItemOwnershipButtonActivated = function() --[[ Line: 281 ]]
        -- upvalues: v93 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v93.props.itemData.collectibleItemId;
        v93.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v93.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v93.props.itemType
        });
    end;
    v93.onItemHeaderMoved = function(v103) --[[ Line: 291 ]]
        -- upvalues: v93 (copy)
        if not v93.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v93.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v105 = l_current_0.AbsolutePosition.Y > v103.AbsolutePosition.Y;
                l_current_0.Visible = not v105;
                v93.updateItemHeaderVisibleBinding(v105);
                return;
            end;
        end;
    end;
    v93.hasCalledOnItemInvalid = false;
    if v77() then
        v93.onFetchRecommendationsFailed = function() --[[ Line: 313 ]]
            -- upvalues: v93 (copy)
            v93:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v92.canItemDescriptionExpand = function(v106, v107) --[[ Line: 321 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v106.props.itemData;
    local v109 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v109 = l_itemData_0.description;
        local v110 = v106.props.width - 48;
        return l_GetCanExpand_0(v107, v110, v109, 3);
    end;
end;
v92.updateDurability = function(v111) --[[ Line: 333 ]] --[[ Name: updateDurability ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy)
    if l_FFlagAXDurablesSupport_0 and v111.props.itemData and v111.props.itemData.timedOptions then
        v111.wearTimeOptions = v111.props.itemData.timedOptions;
    end;
end;
v92.didMount = function(v112) --[[ Line: 339 ]] --[[ Name: didMount ]]
    v112.fetchAssetOrBundleInfo();
end;
v92.didUpdate = function(v113, v114) --[[ Line: 343 ]] --[[ Name: didUpdate ]]
    -- upvalues: v23 (copy), v77 (copy)
    v113:updateDurability();
    local l_itemData_1 = v113.props.itemData;
    local l_fetchingState_0 = v113.props.fetchingState;
    local l_onItemInvalid_0 = v113.props.onItemInvalid;
    local v118 = false;
    if l_fetchingState_0 == v23.Done then
        v118 = l_itemData_1 == nil;
    end;
    local v119 = not v113.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v119 and v118 then
        l_onItemInvalid_0();
        v113.hasCalledOnItemInvalid = true;
    end;
    if v77() and (v114.itemType ~= v113.props.itemType or v114.itemId ~= v113.props.itemId) then
        v113:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
v92.shouldShowRecommendedItems = function(v120, v121) --[[ Line: 377 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v49 (copy), v77 (copy)
    if v121 then
        return false;
    elseif v120.props.assetType and not v49.doesAssetTypeHaveCatalogPage(v120.props.assetType) then
        return false;
    else
        local l_itemData_2 = v120.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v77() and v120.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v92.renderDetailsWithProviders = function(v123, v124) --[[ Line: 401 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v49 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v76 (copy), v51 (copy), v78 (copy), v70 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v73 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v4 (copy), l_LinkButton_0 (copy), l_MenuDirection_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v27 (copy), v75 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v57 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FriendsOwnedChip_0 (copy), v52 (copy), v3 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v53 (copy), v54 (copy), v55 (copy), v56 (copy), v77 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v125 = tostring(v123.props.itemId);
    local l_itemType_1 = v123.props.itemType;
    local l_listPadding_0 = v123.props.listPadding;
    local l_itemSubType_0 = v123.props.itemSubType;
    local l_itemData_3 = v123.props.itemData;
    local v130 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v123.props.peekViewState;
    local l_width_0 = v123.props.width;
    local v133 = v49.GetRbxThumbType(l_itemType_1);
    local v134 = l_getRbxthumbWithTypeSizeAndOptions_0(v125, v133, 420);
    local v135 = v49.IsResellable(l_itemData_3);
    local v136 = v49.HasAttribution(l_itemData_3);
    local v137 = l_itemData_3 and l_itemData_3.isOwned and v135;
    local v138 = if l_FFlagAXDurablesSupport_0 then v123.wearTimeOptions and #v123.wearTimeOptions > 0 else nil;
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
    if v76.isEnabled() then
        v143 = l_itemData_3 and l_itemData_3.assetType;
        v144 = l_itemData_3 and l_itemData_3.bundleType;
        v146 = l_itemData_3 and l_itemData_3.items;
        v142 = v123.state.is3DPreviewEnabled;
        if l_itemType_1 == v51.ItemType.Asset then
            v142 = v142 and v51.ItemViewportAssetTypes[v143];
        elseif l_itemType_1 == v51.ItemType.Bundle then
            v142 = v142 and v51.ItemViewportBundleTypes[v144];
        end;
        if not v78() and v146 then
            for _, v148 in v146 do
                if v148.type == v51.ItemType.Outfit then
                    v145 = v148.id;
                    break;
                end;
            end;
        end;
    end;
    if v70() then
        v137 = v137 and v123.props.isCollectiblesEnabled;
    end;
    local v149 = v123.props.width * 9 / 16;
    local v150 = v123.props.showFullWithNoPeekView and v123.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v151) --[[ Line: 471 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v123 (copy), v73 (ref), v137 (ref), v135 (copy), v136 (copy), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v124 (copy), l_TextService_0 (ref), v4 (ref), l_LinkButton_0 (ref), v49 (ref), l_MenuDirection_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FitFrameVertical_0 (ref), l_Focusable_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v149 (copy), v76 (ref), v142 (ref), v27 (ref), v125 (copy), l_itemType_1 (copy), v144 (ref), v78 (ref), v145 (ref), v146 (ref), v75 (ref), l_LoadableImage_0 (ref), v134 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v51 (ref), v57 (ref), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FriendsOwnedChip_0 (ref), v52 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v141 (copy), v3 (ref), l_ItemExpirationDisplay_0 (ref), l_FFlagAXDurablesSupport_0 (ref), v138 (ref), l_WearTimeOptionsCarousel_0 (ref), v53 (ref), l_width_0 (copy), v54 (ref), v130 (copy), v55 (ref), v56 (ref), l_itemSubType_0 (copy), v77 (ref), v150 (copy), l_TagBasedImpressionsDetector_0 (ref)
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
        local v159 = if v158 then v123.props.expandableTextRef else if v73() and v137 then v123.props.ownershipButtonRef else if v135 then v123.props.resellerRef else if v136 then v123.props.attributionRef else v123.props.recommendedItemsGridRef;
        local v160 = nil;
        local v161 = nil;
        if l_itemData_3 then
            v160 = l_itemData_3.description;
            v161 = l_itemData_3.favoriteCount;
        end;
        local v162 = if v160 then v159 else nil;
        local v163 = v123.props.navigation.getParam("fromProfile");
        local v164 = v123.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v164 = v123.props.simpleView or false;
        end;
        local v165 = v123:shouldShowRecommendedItems(v164);
        local l_tryOn_0 = v124.tryOn;
        local v167 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v168 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v167, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v169 = v123.props.collectibleData and v123.props.collectibleData.unitsAvailableForConsumption == 0;
        local v170 = not v164 and v123.props.enableAggregateLikesFavoritesCount;
        local v171 = nil;
        if v123.props.experiences then
            v171 = v4.createElement(l_LinkButton_0, {
                text = if v123.props.experiences and #v123.props.experiences == 1 and v123.props.experiences[1].name then v124.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v123.props.experiences[1].name) else v124.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v123.props.experiences), 
                onActivated = function() --[[ Line: 531 ]] --[[ Name: onActivated ]]
                    -- upvalues: v123 (ref), l_AvatarScreen_0 (ref), v49 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v123.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v123.props.collectibleData, 
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
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v162, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            [v4.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v123.props.itemDetailsContainerRef else nil
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
                    [v4.Change.AbsolutePosition] = v123.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v155 then v4.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v123.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v155, 
                        TextSize = v154, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v4.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v154)
                    }), 
                    RefUpdater = v4.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v4.Ref] = function(v172) --[[ Line: 603 ]]
                            -- upvalues: v123 (ref)
                            if v172 and v172.Parent then
                                v123.onItemHeaderMoved(v172.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v123.props.experiences then v4.createElement("Frame", {
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
                    ExperienceLink = v171, 
                    DashDivider = if v169 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v169 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v124.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v149), 
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
                    ItemViewport = if v76.isEnabled() and v142 then v4.createElement(v27, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v125, 
                        itemType = l_itemType_1, 
                        bundleType = v144, 
                        outfitId = if not v78() then v145 else nil, 
                        bundleItems = if v78() then v146 else nil, 
                        setParentScrollingEnabled = if v75() then v123.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v123.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v76.isEnabled() and v142 then nil else v4.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v134, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v149, v149), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v163 then v4.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v168 - 8, 1, -44), 
                            size = UDim2.fromOffset(v168, 36), 
                            text = l_tryOn_0, 
                            onActivated = v123.onTryOnActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v164 and l_itemType_1 == v51.ItemType.Bundle then v4.createElement(v57, {
                itemId = v125, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v4.createElement(l_FriendsOwnedChip_0, {
                itemId = v125, 
                itemType = l_itemType_1, 
                fromProfile = v163, 
                layoutOrder = 3
            }) else nil, 
            ItemDescription = v4.createElement(v52, {
                compactNumberOfLines = 3, 
                descriptionText = v160, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v4.Ref] = v123.props.expandableTextRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then v123.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then if v157 and v137 then v123.props.ownershipButtonRef else if v157 and v135 then v123.props.resellerRef else if v157 and v136 then v123.props.attributionRef else if v157 then v123.props.recommendedItemsGridRef else v123.props.NextSelectionDown else if v157 then if v135 then v123.props.resellerRef else if v136 then v123.props.attributionRef else v123.props.recommendedItemsGridRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v123.props.itemData and v123.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v141 then v3.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v123.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if l_FFlagAXDurablesSupport_0 and v138 then v4.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v123.wearTimeOptions, 
                onOptionActivated = v123.props.onWearTimeSelection, 
                useWrapping = true
            }) else nil, 
            ItemStatistics = v170 and v4.createElement(v53, {
                favoritesCount = v161, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 5 or 4) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v137 then v4.createElement(v54, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagAXDurablesSupport_0 and 6 or 5) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                itemId = v125, 
                isLimitedCollectible = v123.props.isLimitedCollectible, 
                collectibleItemId = v130, 
                onActivated = v123.onItemOwnershipButtonActivated, 
                ref = if v73() then v123.props.ownershipButtonRef else nil, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then if v157 and v158 then v123.props.expandableTextRef else v123.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then if v157 and v135 then v123.props.resellerRef else if v157 and v136 then v123.props.attributionRef else if v157 then v123.props.recommendedItemsGridRef else v123.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v164 and v4.createElement(v55, {
                itemId = v125, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 7 or 6) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or 0) + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                resellerRef = v123.props.resellerRef, 
                attributionRef = v123.props.attributionRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then if v157 and v137 then v123.props.ownershipButtonRef else if v157 and v158 then v123.props.expandableTextRef else v123.props.NextSelectionUp else v157 and v158 and v123.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v73() then if v157 then v123.props.recommendedItemsGridRef else v123.props.NextSelectionDown else v157 and v123.props.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v165 and v4.createElement(l_FitTextLabel_0, {
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
                UISizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v123.props.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v165 and v4.createElement(v56, {
                itemId = v125, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v77() then v123.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 9, 
                [v4.Ref] = v123.props.recommendedItemsGridRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v157 and v136 then v123.props.attributionRef else if v73() then if v157 and v135 then v123.props.resellerRef else if v157 and v137 then v123.props.ownershipButtonRef else if v157 and v158 then v123.props.expandableTextRef else v123.props.NextSelectionUp else v135 and v123.props.resellerRef or v158 and v123.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v123.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v123.props.itemDetailsPeekViewRefs, 
                resultsListRef = v123.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v150 and v4.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v123.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v4.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v123.props.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 908 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v123 (ref)
                    return v123.props.navigation.state.key == v123.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v123.requestImpressionsSignal, 
                extensions = v123.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v92.renderDetails = function(v173) --[[ Line: 923 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v174) --[[ Line: 931 ]]
        -- upvalues: v173 (copy)
        return v173:renderDetailsWithProviders(v174);
    end);
end;
v92.renderOnFailed = function(v175) --[[ Line: 936 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v50 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v4 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v175.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v175.props.globalGuiInset;
    local l_screenSize_0 = v175.props.screenSize;
    local v179 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v180 = v50.ActionBar.ActionBarHeight + v50.ActionBar.ActionBarGradientHeight;
    local v182 = l_withLocalization_0({
        emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v181) --[[ Line: 949 ]]
        -- upvalues: v4 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v4.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v181.emptyText
        });
    end);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v179.Y.Scale, v179.Y.Offset - v180)
    }, {
        EmptyStatePage = v182
    });
end;
v92.render = function(v183) --[[ Line: 964 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v4 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v183.props.clipDetails;
    local l_fetchingState_1 = v183.props.fetchingState;
    return l_withStyle_0(function(v186) --[[ Line: 968 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v4 (ref), v183 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v186.Theme;
        local v188 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v188 = "Frame";
        end;
        return v4.createElement(v188, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v4.Ref] = v183.props.forwardRef, 
            [v4.Change.AbsoluteSize] = function(v189) --[[ Line: 994 ]]
                -- upvalues: v183 (ref)
                if v183.props.width ~= v189.AbsoluteSize.X then
                    v183.props.setWidth(v189.AbsoluteSize.X);
                end;
            end, 
            [v4.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1001 ]]
                -- upvalues: v183 (ref)
                v183.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v4.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1008 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v183 (ref)
                    return v183:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1011 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v183 (ref)
                    return v183:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1014 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v183 (ref)
                    return v183:renderOnFailed();
                end
            })
        });
    end);
end;
v92 = v7.connect(function(v191, v192) --[[ Line: 1023 ]]
    -- upvalues: l_PerformFetch_0 (copy), v49 (copy), v23 (copy), v63 (copy), l_AvatarScreen_0 (copy), v70 (copy)
    local v193 = l_PerformFetch_0.GetStatus(v191, v49.GetItemDetailsKey(v192.itemId, v192.itemType));
    local v194 = nil;
    if v193 ~= v23.NotStarted then
        v194 = v63(v191.AvatarExperience.Common, v192.itemId, v192.itemType);
    end;
    if v192.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v194 ~= nil and v194.name == nil then
        v194 = nil;
    end;
    local v195 = nil;
    local v196 = nil;
    local v197 = if (if v194 then v194.collectibleItemId else nil) and v194 then v191.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v194.collectibleItemId] else nil;
    local v198 = v49.GetItemSubType(v192.itemType, v194);
    if v197 ~= nil then
        v195 = v197.experiences;
    end;
    if v70() then
        v196 = v191.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v199 = v49.isLimitedCollectible(v194);
    return {
        globalGuiInset = v191.GlobalGuiInset, 
        screenSize = v191.ScreenSize, 
        fetchingState = v193, 
        itemData = v194, 
        itemSubType = v198, 
        peekViewState = v191.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        experiences = v195, 
        collectibleData = v197, 
        isCollectiblesEnabled = v196, 
        isLimitedCollectible = v199
    };
end, function(v200, _) --[[ Line: 1068 ]]
    -- upvalues: v62 (copy), v47 (copy), v60 (copy)
    return {
        fetchAssetOrBundleInfo = function(v202, v203, v204, v205) --[[ Line: 1070 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v200 (copy), v62 (ref)
            return v200(v62(v202, v203, v204, v205));
        end, 
        navigateDownToAvatarScreen = function(v206, v207, v208) --[[ Line: 1073 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v200 (copy), v47 (ref)
            return v200(v47(v206, v207, v208));
        end, 
        toggleTryOn = function(v209, v210, v211, v212, v213, v214, v215, v216) --[[ Line: 1076 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v200 (copy), v60 (ref)
            v200(v60(v209, v210, v211, v212, v213, v214, v215, v216));
        end
    };
end)(v92);
v92 = l_RoactAppPolicy_0.connect(function(v217, _) --[[ Line: 1104 ]]
    return {
        enableAggregateLikesFavoritesCount = v217.getEnableAggregateLikesFavoritesCount()
    };
end)(v92);
v92 = v17.withNavigation(v92);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v92 = v15(v92);
end;
v92 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v26, 
    networking = v22
})(v92);
checkCanItemDescriptionExpand = function(v219, v220, v221) --[[ Line: 1122 ]] --[[ Name: checkCanItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local v222 = nil;
    if not v219 or not v219.description then
        return false;
    else
        v222 = v219.description;
        local v223 = v221 - 48;
        return l_GetCanExpand_0(v220, v223, v222, 3);
    end;
end;
return v3.forwardRef(function(v224, v225) --[[ Line: 1133 ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useSelector_0 (copy), v63 (copy), v49 (copy), v73 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v72 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v58 (copy), v92 (ref), v5 (copy)
    local v226, v227 = v3.useState(0);
    local v228 = l_useStyle_0();
    local v229 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v229 = v3.useRef(nil);
    end;
    local v230 = v3.useRef(nil);
    local v231 = v3.useRef(nil);
    local v232 = v3.useRef(nil);
    local v233 = v3.useRef(nil);
    local v234 = v3.useRef(nil);
    local v236 = l_useSelector_0(function(v235) --[[ Line: 1158 ]]
        -- upvalues: v63 (ref), v224 (copy)
        return v63(v235.AvatarExperience.Common, v224.itemId, v224.itemType);
    end);
    local v237 = v49.IsResellable(v236);
    local v238 = v49.HasAttribution(v236);
    local v239 = v236 and v236.isOwned and v237;
    local v240 = checkCanItemDescriptionExpand(v236, v228.Font, v226);
    local v241 = if v236 and v236.description then v236.description else nil;
    local v242 = if v240 then v230 else if v73() and v239 then v231 else if v237 then v232 else if v238 then v233 else v234;
    local v243 = if v241 then v242 else nil;
    local v244 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v245 = v3.useCallback(function() --[[ Line: 1180 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v244 (copy), v243 (copy), v224 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v244 and v243 and v243.current then
                v244(v243.current);
                return;
            end;
        else
            v224.peekViewFocusController.moveFocusTo(v243);
        end;
    end, {
        v243, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v244 else v224.peekViewFocusController
    });
    local v246 = v3.useCallback(function() --[[ Line: 1192 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v244 (copy), v234 (copy), v224 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v244 and v234 and v234.current then
                v244(v234.current);
                return;
            end;
        else
            v224.peekViewFocusController.moveFocusTo(v234);
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v244 else v224.peekViewFocusController
    });
    local v247 = v72(v225, {
        onMoveToTop = v245, 
        onMoveToRecItems = v246
    });
    local v248 = l_useTableWrappedCallbackRef_0(v247);
    local v249 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v250 = l_useUnifiedEventImpressionsReporter_0();
        v249 = v3.useMemo(function() --[[ Line: 1212 ]]
            -- upvalues: v250 (copy), v58 (ref)
            return {
                v250, 
                v58
            };
        end, {
            v250, 
            v58
        });
    end;
    return v3.createElement(v92, v5.Dictionary.join(v224, {
        width = v226, 
        setWidth = v227, 
        itemDetailsContainerRef = v229, 
        expandableTextRef = v230, 
        ownershipButtonRef = v231, 
        resellerRef = v232, 
        attributionRef = v233, 
        recommendedItemsGridRef = v234, 
        forwardRef = v248, 
        tagBasedImpressionsDetectorExtensions = v249
    }));
end);