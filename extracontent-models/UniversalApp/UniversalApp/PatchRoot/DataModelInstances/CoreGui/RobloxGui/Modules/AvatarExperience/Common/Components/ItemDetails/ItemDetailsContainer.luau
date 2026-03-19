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
local v30 = require(l_CorePackages_0.Packages.Foundation);
local l_Skeleton_0 = v30.Skeleton;
local v32 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v32.Style.withStyle;
local l_LoadableImage_0 = v32.App.Loading.LoadableImage;
local l_GetCanExpand_0 = v32.Core.Text.ExpandableText.GetCanExpand;
local l_LoadingStateContainer_0 = v32.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v32.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v32.App.Indicator.EmptyState;
local l_Button_0 = v32.App.Button.Button;
local l_ButtonType_0 = v32.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v32.App.Button.LinkButton;
local l_MenuDirection_0 = v32.App.Menu.MenuDirection;
local l_StyledTextLabel_0 = v32.App.Text.StyledTextLabel;
local l_useStyle_0 = v32.Core.Style.useStyle;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v51 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v52 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v53 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v54 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDescription);
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton);
local v57 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v58 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v59 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid);
local v60 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.logItemDetailsIxpLayerExposure);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v62 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v63 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
local l_FriendsOwnedChip_0 = require(l_CorePackages_0.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip;
local v65 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v66 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v67 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local v68 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_WearTimeOptionsCarousel_0 = v68.Components.WearTimeOptionsCarousel;
local l_ItemExpirationDisplay_0 = v68.Components.ItemExpirationDisplay;
local l_isDurableItemExpired_0 = v68.Utils.isDurableItemExpired;
local l_useTableWrappedCallbackRef_0 = v68.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v73 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v75 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.useItemDetailsContainerFocusNavigationBindings);
local v76 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v78 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v79 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v81 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v82 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v13.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagUpdateNoInternetConnectionText_0 = v82.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXItemDetailsIxpExposure_0 = v82.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXDurablesSupport_0 = v82.FFlagAXDurablesSupport;
local l_FFlagAXInventoryDurablesSupport_0 = v82.FFlagAXInventoryDurablesSupport;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagEnableSocialProofOnItemDetails_0 = v13.FFlagEnableSocialProofOnItemDetails;
local l_FFlagAXMISEnableMultiShopping_0 = v82.FFlagAXMISEnableMultiShopping;
local v91 = game:DefineFastFlag("AXFixItemDetailsContainerGuiInsetType", false);
local l_FFlagAXTryOnScreenImprovements_0 = v13.FFlagAXTryOnScreenImprovements;
local l_FFlagAXTryOnScreenFixes_0 = v82.FFlagAXTryOnScreenFixes;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = v82.FFlagAXRemoveExpiredItemsFromInventory;
local l_FFlagAXCustomizeMakeupSupport_0 = v82.FFlagAXCustomizeMakeupSupport;
local v96 = v4.PureComponent:extend("ItemDetailsContainer");
v96.validateProps = v11.strictInterface({
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
    setItemDetailsScrollingEnabled = if v78() then v11.optional(v11.callback) else nil, 
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
        left = if v91 then v11.number else v11.integer, 
        top = if v91 then v11.number else v11.integer, 
        right = if v91 then v11.number else v11.integer, 
        bottom = if v91 then v11.number else v11.integer
    }), 
    screenSize = v11.Vector2, 
    fetchingState = v11.string, 
    itemData = v11.optional(v67), 
    peekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    experiences = v11.optional(v11.table), 
    collectibleData = v11.optional(v11.table), 
    isCollectiblesEnabled = if v73() then v11.optional(v11.boolean) else nil, 
    isLimitedCollectible = v11.optional(v11.boolean), 
    avatarRoute = if l_FFlagAXItemDetailsIxpExposure_0 then l_AvatarRoute_0.Interface else nil, 
    fetchAssetOrBundleInfo = v11.callback, 
    navigateDownToAvatarScreen = v11.callback, 
    toggleTryOn = v11.optional(v11.callback), 
    toggleTryOnThunk = if l_FFlagAXMISEnableMultiShopping_0 then v11.callback else nil, 
    closeMatchingScreens = if l_FFlagAXMISEnableMultiShopping_0 then v11.callback else nil, 
    navigation = v11.table, 
    networking = v11.callback, 
    appAnalytics = v11.table, 
    catalogAnalytics = v11.table, 
    showPremiumContent = v11.optional(v11.boolean), 
    enableAggregateLikesFavoritesCount = v11.boolean
});
v96.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v96.init = function(v97) --[[ Line: 224 ]] --[[ Name: init ]]
    -- upvalues: v79 (copy), v12 (copy), v80 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_Signal_0 (copy), v4 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v51 (copy)
    v97.state = {
        is3DPreviewEnabled = v79.isEnabled() and v12.readTestVariable(v79.EnableItemDetails3DPreview) and true or nil, 
        fetchRecommendationsFailed = not v80() and nil
    };
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v97.requestImpressionsSignal = l_Signal_0.new();
    end;
    v97.fetchAssetOrBundleInfo = function() --[[ Line: 237 ]]
        -- upvalues: v97 (copy)
        local l_networking_0 = v97.props.networking;
        local l_appAnalytics_0 = v97.props.appAnalytics;
        local v100 = tostring(v97.props.itemId);
        local l_itemType_0 = v97.props.itemType;
        return v97.props.fetchAssetOrBundleInfo(l_networking_0, l_appAnalytics_0, v100, l_itemType_0);
    end;
    if v79.isEnabled() then
        v97.onItemViewportLoadingFailed = function() --[[ Line: 247 ]]
            -- upvalues: v97 (copy)
            v97:setState({
                is3DPreviewEnabled = false
            });
        end;
    end;
    v97:updateDurability();
    local v102, v103 = v4.createBinding(false);
    v97.itemHeaderVisibleBinding = v102;
    v97.updateItemHeaderVisibleBinding = v103;
    v97.onTryOnActivated = function() --[[ Line: 257 ]]
        -- upvalues: v97 (copy), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref)
        local v104 = {
            itemId = v97.props.itemId, 
            itemType = v97.props.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v97.props.itemDetailsPeekViewRefs, 
            resultsListRef = v97.props.resultsListRef
        };
        local v105 = v104.itemType .. v104.itemId;
        if l_FFlagAXTryOnScreenImprovements_0 then
            v104.itemSubType = v97.props.itemSubType;
        else
            v97.props.toggleTryOn(v97.props.networking, v97.props.catalogAnalytics, v97.props.itemType, v97.props.itemSubType, v97.props.itemId, true, nil, nil);
        end;
        v97.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v105, v104);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        v97.onRecommendedItemDetailsTryOnButtonActivated = function() --[[ Line: 287 ]]
            -- upvalues: v51 (ref), v97 (copy), l_AvatarScreen_0 (ref)
            local v106 = v51.GetItemSubType(v97.props.itemType, v97.props.itemData);
            v97.props.toggleTryOnThunk(v97.props.networking, v97.props.catalogAnalytics, v97.props.itemType, v106, v97.props.itemId, true, v97.props.avatarRoute, v97.props.navigation);
            v97.props.closeMatchingScreens(v97.props.navigation, {
                l_AvatarScreen_0.Checkout, 
                l_AvatarScreen_0.ItemDetails
            });
        end;
    end;
    v97.onItemOwnershipButtonActivated = function() --[[ Line: 308 ]]
        -- upvalues: v97 (copy), l_AvatarScreen_0 (ref)
        local l_collectibleItemId_0 = v97.props.itemData.collectibleItemId;
        v97.props.navigation.navigate(l_AvatarScreen_0.ItemOwnershipPage, {
            itemId = v97.props.itemId, 
            collectibleItemId = l_collectibleItemId_0, 
            itemType = v97.props.itemType
        });
    end;
    v97.onItemHeaderMoved = function(v108) --[[ Line: 318 ]]
        -- upvalues: v97 (copy)
        if not v97.props.actionBarHeaderRef then
            return;
        else
            local l_current_0 = v97.props.actionBarHeaderRef.current;
            if not l_current_0 then
                return;
            else
                local v110 = l_current_0.AbsolutePosition.Y > v108.AbsolutePosition.Y;
                l_current_0.Visible = not v110;
                v97.updateItemHeaderVisibleBinding(v110);
                return;
            end;
        end;
    end;
    v97.hasCalledOnItemInvalid = false;
    if v80() then
        v97.onFetchRecommendationsFailed = function() --[[ Line: 340 ]]
            -- upvalues: v97 (copy)
            v97:setState({
                fetchRecommendationsFailed = true
            });
        end;
    end;
end;
v96.canItemDescriptionExpand = function(v111, v112) --[[ Line: 348 ]] --[[ Name: canItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local l_itemData_0 = v111.props.itemData;
    local v114 = nil;
    if not l_itemData_0 or not l_itemData_0.description then
        return false;
    else
        v114 = l_itemData_0.description;
        local v115 = v111.props.width - 48;
        return l_GetCanExpand_0(v112, v115, v114, 3);
    end;
end;
v96.updateDurability = function(v116) --[[ Line: 360 ]] --[[ Name: updateDurability ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy)
    if l_FFlagAXDurablesSupport_0 and v116.props.itemData and v116.props.itemData.timedOptions then
        v116.wearTimeOptions = v116.props.itemData.timedOptions;
    end;
end;
v96.didMount = function(v117) --[[ Line: 366 ]] --[[ Name: didMount ]]
    v117.fetchAssetOrBundleInfo();
end;
v96.didUpdate = function(v118, v119) --[[ Line: 370 ]] --[[ Name: didUpdate ]]
    -- upvalues: v23 (copy), v80 (copy)
    v118:updateDurability();
    local l_itemData_1 = v118.props.itemData;
    local l_fetchingState_0 = v118.props.fetchingState;
    local l_onItemInvalid_0 = v118.props.onItemInvalid;
    local v123 = false;
    if l_fetchingState_0 == v23.Done then
        v123 = l_itemData_1 == nil;
    end;
    local v124 = not v118.hasCalledOnItemInvalid;
    if l_onItemInvalid_0 ~= nil and v124 and v123 then
        l_onItemInvalid_0();
        v118.hasCalledOnItemInvalid = true;
    end;
    if v80() and (v119.itemType ~= v118.props.itemType or v119.itemId ~= v118.props.itemId) then
        v118:setState({
            fetchRecommendationsFailed = false
        });
    end;
end;
v96.shouldShowRecommendedItems = function(v125, v126) --[[ Line: 404 ]] --[[ Name: shouldShowRecommendedItems ]]
    -- upvalues: v51 (copy), v80 (copy)
    if v126 then
        return false;
    elseif v125.props.assetType and not v51.doesAssetTypeHaveCatalogPage(v125.props.assetType) then
        return false;
    else
        local l_itemData_2 = v125.props.itemData;
        if l_itemData_2 and l_itemData_2.receivedRecommendedData and (l_itemData_2.recommendedItemSummaries == nil or #l_itemData_2.recommendedItemSummaries == 0) then
            return false;
        elseif v80() and v125.state.fetchRecommendationsFailed then
            return false;
        else
            return true;
        end;
    end;
end;
v96.renderDetailsWithProviders = function(v128, v129) --[[ Line: 428 ]] --[[ Name: renderDetailsWithProviders ]]
    -- upvalues: v51 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy), l_isDurableItemExpired_0 (copy), v79 (copy), v53 (copy), v81 (copy), v73 (copy), l_withStyle_0 (copy), l_PeekViewState_0 (copy), v76 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v49 (copy), l_AvatarScreen_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_TextService_0 (copy), v4 (copy), l_LinkButton_0 (copy), l_MenuDirection_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_IsVRAppBuild_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_StyledTextLabel_0 (copy), v27 (copy), v78 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v30 (copy), v59 (copy), l_FFlagEnableSocialProofOnItemDetails_0 (copy), l_FriendsOwnedChip_0 (copy), v54 (copy), v3 (copy), l_ItemExpirationDisplay_0 (copy), l_WearTimeOptionsCarousel_0 (copy), v55 (copy), v56 (copy), v57 (copy), v58 (copy), v80 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v130 = tostring(v128.props.itemId);
    local l_itemType_1 = v128.props.itemType;
    local l_listPadding_0 = v128.props.listPadding;
    local l_itemSubType_0 = v128.props.itemSubType;
    local l_itemData_3 = v128.props.itemData;
    local v135 = if l_itemData_3 then l_itemData_3.collectibleItemId else nil;
    local l_peekViewState_0 = v128.props.peekViewState;
    local l_width_0 = v128.props.width;
    local v138 = v51.GetRbxThumbType(l_itemType_1);
    local v139 = l_getRbxthumbWithTypeSizeAndOptions_0(v130, v138, 420);
    local v140 = v51.IsResellable(l_itemData_3);
    local v141 = v51.HasAttribution(l_itemData_3);
    local v142 = l_itemData_3 and l_itemData_3.isOwned and v140;
    local v143 = if l_FFlagAXDurablesSupport_0 then v128.wearTimeOptions and #v128.wearTimeOptions > 0 else nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        local v144 = l_itemData_3 and l_itemData_3.isOwned;
        local v145 = l_itemData_3 and l_itemData_3.isOwned and l_itemData_3.expirationTime;
        v143 = v143 and (not v144 or v145);
    end;
    local v146 = if l_FFlagAXRemoveExpiredItemsFromInventory_0 then l_itemData_3 and l_itemData_3.expirationTime and not l_isDurableItemExpired_0(l_itemData_3.expirationTime) else nil;
    local v147 = nil;
    local v148 = nil;
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    if v79.isEnabled() then
        v148 = l_itemData_3 and l_itemData_3.assetType;
        v149 = l_itemData_3 and l_itemData_3.bundleType;
        v151 = l_itemData_3 and l_itemData_3.items;
        v147 = v128.state.is3DPreviewEnabled;
        if l_itemType_1 == v53.ItemType.Asset then
            v147 = v147 and v53.ItemViewportAssetTypes[v148];
        elseif l_itemType_1 == v53.ItemType.Bundle then
            v147 = v147 and v53.ItemViewportBundleTypes[v149];
        end;
        if not v81() and v151 then
            for _, v153 in v151 do
                if v153.type == v53.ItemType.Outfit then
                    v150 = v153.id;
                    break;
                end;
            end;
        end;
    end;
    if v73() then
        v142 = v142 and v128.props.isCollectiblesEnabled;
    end;
    local v154 = v128.props.width * 9 / 16;
    local v155 = v128.props.showFullWithNoPeekView and v128.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v156) --[[ Line: 498 ]]
        -- upvalues: l_itemData_3 (copy), l_peekViewState_0 (copy), l_PeekViewState_0 (ref), v128 (copy), v76 (ref), v142 (ref), v140 (copy), v141 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v49 (ref), l_AvatarScreen_0 (ref), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), v129 (copy), l_TextService_0 (ref), v4 (ref), l_LinkButton_0 (ref), v51 (ref), l_MenuDirection_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FitFrameVertical_0 (ref), l_Focusable_0 (ref), l_listPadding_0 (copy), l_RoactFitComponents_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_IsVRAppBuild_0 (ref), l_FitTextLabel_0 (ref), l_Skeleton_0 (ref), l_StyledTextLabel_0 (ref), v154 (copy), v79 (ref), v147 (ref), v27 (ref), v130 (copy), l_itemType_1 (copy), v149 (ref), v81 (ref), v150 (ref), v151 (ref), v78 (ref), l_LoadableImage_0 (ref), v139 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v30 (ref), v53 (ref), v59 (ref), l_FFlagEnableSocialProofOnItemDetails_0 (ref), l_FriendsOwnedChip_0 (ref), v54 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), l_FFlagAXRemoveExpiredItemsFromInventory_0 (ref), v146 (copy), v3 (ref), l_ItemExpirationDisplay_0 (ref), l_FFlagAXDurablesSupport_0 (ref), v143 (ref), l_WearTimeOptionsCarousel_0 (ref), v55 (ref), l_width_0 (copy), v56 (ref), v135 (copy), v57 (ref), v58 (ref), l_itemSubType_0 (copy), v80 (ref), v155 (copy), l_TagBasedImpressionsDetector_0 (ref)
        local l_Theme_0 = v156.Theme;
        local l_Font_0 = v156.Font;
        local v159 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v160 = if l_itemData_3 then l_itemData_3.name else nil;
        local l_Font_1 = l_Font_0.Header1.Font;
        local v162 = true;
        if l_peekViewState_0 ~= l_PeekViewState_0.Full then
            v162 = l_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v163 = v128:canItemDescriptionExpand(l_Font_0);
        local v164 = if v163 then v128.props.expandableTextRef else if v76() and v142 then v128.props.ownershipButtonRef else if v140 then v128.props.resellerRef else if v141 then v128.props.attributionRef else v128.props.recommendedItemsGridRef;
        local v165 = nil;
        local v166 = nil;
        if l_itemData_3 then
            v165 = l_itemData_3.description;
            v166 = l_itemData_3.favoriteCount;
        end;
        local v167 = if v165 then v164 else nil;
        local v168 = if l_FFlagAXMISEnableMultiShopping_0 then v49.isFirstItemDetailsPage(v128.props.navigation) else nil;
        local v169 = v128.props.navigation.getParam("fromProfile");
        local v170 = v128.props.navigation.state.routeName == l_AvatarScreen_0.TryOnItem;
        if l_FFlagAXEnableHomeTryOnComplexView_0 or l_FFlagAXTryOnScreenImprovements_0 then
            v170 = v128.props.simpleView or false;
        end;
        local v171 = v128:shouldShowRecommendedItems(v170);
        local l_tryOn_0 = v129.tryOn;
        local v173 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v174 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v173, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v175 = v128.props.collectibleData and v128.props.collectibleData.unitsAvailableForConsumption == 0;
        local v176 = not v170 and v128.props.enableAggregateLikesFavoritesCount;
        local v177 = nil;
        if v128.props.experiences then
            v177 = v4.createElement(l_LinkButton_0, {
                text = if v128.props.experiences and #v128.props.experiences == 1 and v128.props.experiences[1].name then v129.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v128.props.experiences[1].name) else v129.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v128.props.experiences), 
                onActivated = function() --[[ Line: 561 ]] --[[ Name: onActivated ]]
                    -- upvalues: v128 (ref), l_AvatarScreen_0 (ref), v51 (ref), l_itemData_3 (ref), l_MenuDirection_0 (ref)
                    v128.props.navigation.navigate(l_AvatarScreen_0.ItemExperiencesMenu, {
                        collectibleData = v128.props.collectibleData, 
                        isLimited = v51.isLimitedCollectible(l_itemData_3), 
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
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v167, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            [v4.Ref] = if l_FFlagAXItemDetailsIxpExposure_0 then v128.props.itemDetailsContainerRef else nil
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
                    [v4.Change.AbsolutePosition] = v128.onItemHeaderMoved
                }, {
                    TextLabel = if l_IsVRAppBuild_0() then nil else if v160 then v4.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v128.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v160, 
                        TextSize = v159, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {}) else v4.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v159)
                    }), 
                    RefUpdater = v4.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v4.Ref] = function(v178) --[[ Line: 633 ]]
                            -- upvalues: v128 (ref)
                            if v178 and v178.Parent then
                                v128.onItemHeaderMoved(v178.Parent);
                            end;
                        end
                    })
                }), 
                ExperienceLinkDetails = if v128.props.experiences then v4.createElement("Frame", {
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
                    ExperienceLink = v177, 
                    DashDivider = if v175 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }) else nil, 
                    SoldOutText = if v175 then v4.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v129.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    }) else nil
                }) else nil, 
                ItemImageFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v154), 
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
                    ItemViewport = if v79.isEnabled() and v147 then v4.createElement(v27, {
                        anchorPoint = Vector2.new(0.5, 0), 
                        position = UDim2.fromScale(0.5, 0), 
                        size = UDim2.new(1, 48, 1, 0), 
                        itemId = v130, 
                        itemType = l_itemType_1, 
                        bundleType = v149, 
                        outfitId = if not v81() then v150 else nil, 
                        bundleItems = if v81() then v151 else nil, 
                        setParentScrollingEnabled = if v78() then v128.props.setItemDetailsScrollingEnabled else nil, 
                        onLoadingFailed = v128.onItemViewportLoadingFailed
                    }) else nil, 
                    Image = if v79.isEnabled() and v147 then nil else v4.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v139, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v154, v154), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if v169 then v4.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v174 - 8, 1, -44), 
                            size = UDim2.fromOffset(v174, 36), 
                            text = l_tryOn_0, 
                            onActivated = v128.onTryOnActivated
                        })
                    }) else nil, 
                    RecommendedItemDetailsTryOnButtonFrame = if if l_FFlagAXTryOnScreenImprovements_0 then l_FFlagAXMISEnableMultiShopping_0 and not v169 and not v168 and v128.props.navigation.state.routeName ~= l_AvatarScreen_0.TryOnItem else l_FFlagAXMISEnableMultiShopping_0 and not v169 and not v168 then v4.createElement(v30.View, {
                        ZIndex = 2, 
                        tag = "size-full", 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v4.createElement(v30.Button, {
                            Position = UDim2.new(1, -v174 - 8, 1, -44), 
                            text = l_tryOn_0, 
                            onActivated = v128.onRecommendedItemDetailsTryOnButtonActivated
                        })
                    }) else nil
                })
            }), 
            IncludedItems = if not v170 and l_itemType_1 == v53.ItemType.Bundle then v4.createElement(v59, {
                itemId = v130, 
                itemType = l_itemType_1, 
                LayoutOrder = 2
            }) else nil, 
            ItemSocialProof = if l_FFlagEnableSocialProofOnItemDetails_0 then v4.createElement(l_FriendsOwnedChip_0, {
                itemId = v130, 
                itemType = l_itemType_1, 
                fromProfile = v169, 
                layoutOrder = 3
            }) else nil, 
            ItemDescription = v4.createElement(v54, {
                compactNumberOfLines = 3, 
                descriptionText = v165, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 4 or 3, 
                [v4.Ref] = v128.props.expandableTextRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then v128.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then if v162 and v142 then v128.props.ownershipButtonRef else if v162 and v140 then v128.props.resellerRef else if v162 and v141 then v128.props.attributionRef else if v162 then v128.props.recommendedItemsGridRef else v128.props.NextSelectionDown else if v162 then if v140 then v128.props.resellerRef else if v141 then v128.props.attributionRef else v128.props.recommendedItemsGridRef else nil
            }), 
            ExpirationTimeContainer = if not (not (l_FFlagAXInventoryDurablesSupport_0 and v128.props.itemData and v128.props.itemData.expirationTime) or l_FFlagAXRemoveExpiredItemsFromInventory_0) or l_FFlagAXRemoveExpiredItemsFromInventory_0 and v146 then v3.createElement(l_ItemExpirationDisplay_0, {
                expirationTime = v128.props.itemData.expirationTime, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 5 or 4
            }) else nil, 
            WearTimeOptionsCarousel = if l_FFlagAXDurablesSupport_0 and v143 then v4.createElement(l_WearTimeOptionsCarousel_0, {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 6 or 5, 
                options = v128.wearTimeOptions, 
                onOptionActivated = v128.props.onWearTimeSelection, 
                useWrapping = true
            }) else nil, 
            ItemStatistics = v176 and v4.createElement(v55, {
                favoritesCount = v166, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 5 or 4) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if v142 then v4.createElement(v56, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = (l_FFlagAXDurablesSupport_0 and 6 or 5) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 0), 
                itemId = v130, 
                isLimitedCollectible = v128.props.isLimitedCollectible, 
                collectibleItemId = v135, 
                onActivated = v128.onItemOwnershipButtonActivated, 
                ref = if v76() then v128.props.ownershipButtonRef else nil, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then if v162 and v163 then v128.props.expandableTextRef else v128.props.NextSelectionUp else nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then if v162 and v140 then v128.props.resellerRef else if v162 and v141 then v128.props.attributionRef else if v162 then v128.props.recommendedItemsGridRef else v128.props.NextSelectionDown else nil
            }) else nil, 
            ItemInfoList = not v170 and v4.createElement(v57, {
                itemId = v130, 
                itemType = l_itemType_1, 
                LayoutOrder = (l_FFlagAXDurablesSupport_0 and 7 or 6) + (l_FFlagEnableSocialProofOnItemDetails_0 and 1 or 0) + (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0), 
                resellerRef = v128.props.resellerRef, 
                attributionRef = v128.props.attributionRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then if v162 and v142 then v128.props.ownershipButtonRef else if v162 and v163 then v128.props.expandableTextRef else v128.props.NextSelectionUp else v162 and v163 and v128.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v76() then if v162 then v128.props.recommendedItemsGridRef else v128.props.NextSelectionDown else v162 and v128.props.recommendedItemsGridRef or nil
            }), 
            RecommendedLabel = v171 and v4.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 9 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v129.recommendedLabel, 
                TextSize = v159, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UISizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(math.max(v128.props.width - 24, 0), 1e999)
                })
            }), 
            RecommendedItemsGrid = v171 and v4.createElement(v58, {
                itemId = v130, 
                itemSubType = l_itemSubType_0, 
                itemType = l_itemType_1, 
                onFetchRecommendationsFailed = if v80() then v128.onFetchRecommendationsFailed else nil, 
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 10 or (l_FFlagAXInventoryDurablesSupport_0 and 1 or 0) + 9, 
                [v4.Ref] = v128.props.recommendedItemsGridRef, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v162 and v141 then v128.props.attributionRef else if v76() then if v162 and v140 then v128.props.resellerRef else if v162 and v142 then v128.props.ownershipButtonRef else if v162 and v163 then v128.props.expandableTextRef else v128.props.NextSelectionUp else v140 and v128.props.resellerRef or v163 and v128.props.expandableTextRef or nil, 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v128.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v128.props.itemDetailsPeekViewRefs, 
                resultsListRef = v128.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v155 and v4.createElement("Frame", {
                LayoutOrder = l_FFlagEnableSocialProofOnItemDetails_0 and 11 or 10, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v128.props.bottomDockedContainerHeight), 
                Active = false
            }), 
            UnifiedImpressionsReporter = if l_FFlagAXItemDetailsIxpExposure_0 then v4.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v128.props.itemDetailsContainerRef, 
                pageFilter = function() --[[ Line: 970 ]] --[[ Name: pageFilter ]]
                    -- upvalues: v128 (ref)
                    return v128.props.navigation.state.key == v128.props.avatarRoute.current.key;
                end, 
                requestImpressionsSignal = v128.requestImpressionsSignal, 
                extensions = v128.props.tagBasedImpressionsDetectorExtensions
            }) else nil
        });
    end);
end;
v96.renderDetails = function(v179) --[[ Line: 985 ]] --[[ Name: renderDetails ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        recommendedLabel = "Feature.Catalog.Label.Recommendations", 
        resellLabel = "Feature.Catalog.Heading.Sellers", 
        tryOn = "Feature.Avatar.Action.TryOn", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
        soldOut = "Feature.Catalog.Label.SoldOut"
    })(function(v180) --[[ Line: 993 ]]
        -- upvalues: v179 (copy)
        return v179:renderDetailsWithProviders(v180);
    end);
end;
v96.renderOnFailed = function(v181) --[[ Line: 998 ]] --[[ Name: renderOnFailed ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v52 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v4 (copy), l_EmptyState_0 (copy)
    local l_fetchAssetOrBundleInfo_0 = v181.fetchAssetOrBundleInfo;
    local l_globalGuiInset_0 = v181.props.globalGuiInset;
    local l_screenSize_0 = v181.props.screenSize;
    local v185 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v186 = v52.ActionBar.ActionBarHeight + v52.ActionBar.ActionBarGradientHeight;
    local v188 = l_withLocalization_0({
        emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v187) --[[ Line: 1011 ]]
        -- upvalues: v4 (ref), l_EmptyState_0 (ref), l_fetchAssetOrBundleInfo_0 (copy)
        return v4.createElement(l_EmptyState_0, {
            onActivated = l_fetchAssetOrBundleInfo_0, 
            text = v187.emptyText
        });
    end);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v185.Y.Scale, v185.Y.Offset - v186)
    }, {
        EmptyStatePage = v188
    });
end;
v96.render = function(v189) --[[ Line: 1026 ]] --[[ Name: render ]]
    -- upvalues: l_FitFrameVertical_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v4 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), l_withStyle_0 (copy)
    local l_clipDetails_0 = v189.props.clipDetails;
    local l_fetchingState_1 = v189.props.fetchingState;
    return l_withStyle_0(function(v192) --[[ Line: 1030 ]]
        -- upvalues: l_clipDetails_0 (copy), l_FitFrameVertical_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v4 (ref), v189 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref), l_fetchingState_1 (copy)
        local l_Theme_1 = v192.Theme;
        local v194 = l_clipDetails_0 and "Frame" or l_FitFrameVertical_0;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v194 = "Frame";
        end;
        return v4.createElement(v194, {
            width = if not not l_clipDetails_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if l_clipDetails_0 then UDim2.new(1, 0, 0, 0) else if l_FFlagAXCustomizeMakeupSupport_0 then UDim2.new(1, 0, 1, 0) else nil, 
            AutomaticSize = if l_FFlagAXCustomizeMakeupSupport_0 then if l_clipDetails_0 then nil else Enum.AutomaticSize.Y else nil, 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v4.Ref] = v189.props.forwardRef, 
            [v4.Change.AbsoluteSize] = function(v195) --[[ Line: 1056 ]]
                -- upvalues: v189 (ref)
                if v189.props.width ~= v195.AbsoluteSize.X then
                    v189.props.setWidth(v195.AbsoluteSize.X);
                end;
            end, 
            [v4.Change.AbsolutePosition] = l_FFlagAXItemDetailsIxpExposure_0 and function(_) --[[ Line: 1063 ]]
                -- upvalues: v189 (ref)
                v189.requestImpressionsSignal:fire();
            end or nil
        }, {
            LoadingState = v4.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function() --[[ Line: 1070 ]] --[[ Name: renderOnLoading ]]
                    -- upvalues: v189 (ref)
                    return v189:renderDetails();
                end, 
                renderOnLoaded = function() --[[ Line: 1073 ]] --[[ Name: renderOnLoaded ]]
                    -- upvalues: v189 (ref)
                    return v189:renderDetails();
                end, 
                renderOnFailed = function() --[[ Line: 1076 ]] --[[ Name: renderOnFailed ]]
                    -- upvalues: v189 (ref)
                    return v189:renderOnFailed();
                end
            })
        });
    end);
end;
v96 = v7.connect(function(v197, v198) --[[ Line: 1085 ]]
    -- upvalues: l_PerformFetch_0 (copy), v51 (copy), v23 (copy), v66 (copy), l_AvatarScreen_0 (copy), v73 (copy)
    local v199 = l_PerformFetch_0.GetStatus(v197, v51.GetItemDetailsKey(v198.itemId, v198.itemType));
    local v200 = nil;
    if v199 ~= v23.NotStarted then
        v200 = v66(v197.AvatarExperience.Common, v198.itemId, v198.itemType);
    end;
    if v198.navigation.state.routeName == l_AvatarScreen_0.TryOnItem and v200 ~= nil and v200.name == nil then
        v200 = nil;
    end;
    local v201 = nil;
    local v202 = nil;
    local v203 = if (if v200 then v200.collectibleItemId else nil) and v200 then v197.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v200.collectibleItemId] else nil;
    local v204 = v51.GetItemSubType(v198.itemType, v200);
    if v203 ~= nil then
        v201 = v203.experiences;
    end;
    if v73() then
        v202 = v197.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    end;
    local v205 = v51.isLimitedCollectible(v200);
    return {
        globalGuiInset = v197.GlobalGuiInset, 
        screenSize = v197.ScreenSize, 
        fetchingState = v199, 
        itemData = v200, 
        itemSubType = v204, 
        peekViewState = v197.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        experiences = v201, 
        collectibleData = v203, 
        isCollectiblesEnabled = v202, 
        isLimitedCollectible = v205
    };
end, function(v206, _) --[[ Line: 1130 ]]
    -- upvalues: v65 (copy), v48 (copy), v62 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v63 (copy)
    return {
        fetchAssetOrBundleInfo = function(v208, v209, v210, v211) --[[ Line: 1132 ]] --[[ Name: fetchAssetOrBundleInfo ]]
            -- upvalues: v206 (copy), v65 (ref)
            return v206(v65(v208, v209, v210, v211));
        end, 
        navigateDownToAvatarScreen = function(v212, v213, v214) --[[ Line: 1135 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v206 (copy), v48 (ref)
            return v206(v48(v212, v213, v214));
        end, 
        toggleTryOn = function(v215, v216, v217, v218, v219, v220, v221, v222) --[[ Line: 1138 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v206 (copy), v62 (ref)
            v206(v62(v215, v216, v217, v218, v219, v220, v221, v222));
        end, 
        toggleTryOnThunk = l_FFlagAXMISEnableMultiShopping_0 and function(v223, v224, v225, v226, v227, v228, v229, v230) --[[ Line: 1162 ]]
            -- upvalues: v206 (copy), v62 (ref)
            v206(v62(v223, v224, v225, v226, v227, v228, v229, v230));
        end or nil, 
        closeMatchingScreens = l_FFlagAXMISEnableMultiShopping_0 and function(v231, v232) --[[ Line: 1187 ]]
            -- upvalues: v206 (copy), v63 (ref)
            v206(v63(v231, v232));
        end or nil
    };
end)(v96);
v96 = l_RoactAppPolicy_0.connect(function(v233, _) --[[ Line: 1196 ]]
    return {
        enableAggregateLikesFavoritesCount = v233.getEnableAggregateLikesFavoritesCount()
    };
end)(v96);
v96 = v17.withNavigation(v96);
if l_FFlagAXItemDetailsIxpExposure_0 then
    v96 = v15(v96);
end;
v96 = l_RoactServices_0.connect({
    appAnalytics = v6, 
    catalogAnalytics = v26, 
    networking = v22
})(v96);
checkCanItemDescriptionExpand = function(v235, v236, v237) --[[ Line: 1214 ]] --[[ Name: checkCanItemDescriptionExpand ]]
    -- upvalues: l_GetCanExpand_0 (copy)
    local v238 = nil;
    if not v235 or not v235.description then
        return false;
    else
        v238 = v235.description;
        local v239 = v237 - 48;
        return l_GetCanExpand_0(v236, v239, v238, 3);
    end;
end;
return v3.forwardRef(function(v240, v241) --[[ Line: 1225 ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useSelector_0 (copy), v66 (copy), v51 (copy), v76 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v75 (copy), l_useTableWrappedCallbackRef_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v60 (copy), v96 (ref), v5 (copy)
    local v242, v243 = v3.useState(0);
    local v244 = l_useStyle_0();
    local v245 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        v245 = v3.useRef(nil);
    end;
    local v246 = v3.useRef(nil);
    local v247 = v3.useRef(nil);
    local v248 = v3.useRef(nil);
    local v249 = v3.useRef(nil);
    local v250 = v3.useRef(nil);
    local v252 = l_useSelector_0(function(v251) --[[ Line: 1250 ]]
        -- upvalues: v66 (ref), v240 (copy)
        return v66(v251.AvatarExperience.Common, v240.itemId, v240.itemType);
    end);
    local v253 = v51.IsResellable(v252);
    local v254 = v51.HasAttribution(v252);
    local v255 = v252 and v252.isOwned and v253;
    local v256 = checkCanItemDescriptionExpand(v252, v244.Font, v242);
    local v257 = if v252 and v252.description then v252.description else nil;
    local v258 = if v256 then v246 else if v76() and v255 then v247 else if v253 then v248 else if v254 then v249 else v250;
    local v259 = if v257 then v258 else nil;
    local v260 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v261 = v3.useCallback(function() --[[ Line: 1272 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v260 (copy), v259 (copy), v240 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v260 and v259 and v259.current then
                v260(v259.current);
                return;
            end;
        else
            v240.peekViewFocusController.moveFocusTo(v259);
        end;
    end, {
        v259, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v260 else v240.peekViewFocusController
    });
    local v262 = v3.useCallback(function() --[[ Line: 1284 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v260 (copy), v250 (copy), v240 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v260 and v250 and v250.current then
                v260(v250.current);
                return;
            end;
        else
            v240.peekViewFocusController.moveFocusTo(v250);
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v260 else v240.peekViewFocusController
    });
    local v263 = v75(v241, {
        onMoveToTop = v261, 
        onMoveToRecItems = v262
    });
    local v264 = l_useTableWrappedCallbackRef_0(v263);
    local v265 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v266 = l_useUnifiedEventImpressionsReporter_0();
        v265 = v3.useMemo(function() --[[ Line: 1304 ]]
            -- upvalues: v266 (copy), v60 (ref)
            return {
                v266, 
                v60
            };
        end, {
            v266, 
            v60
        });
    end;
    return v3.createElement(v96, v5.Dictionary.join(v240, {
        width = v242, 
        setWidth = v243, 
        itemDetailsContainerRef = v245, 
        expandableTextRef = v246, 
        ownershipButtonRef = v247, 
        resellerRef = v248, 
        attributionRef = v249, 
        recommendedItemsGridRef = v250, 
        forwardRef = v264, 
        tagBasedImpressionsDetectorExtensions = v265
    }));
end);