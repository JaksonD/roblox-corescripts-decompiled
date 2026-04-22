local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local _ = require(l_Parent_0.Http);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_0.AvatarExperienceNavigation);
local v9 = require(l_Parent_0.AvatarExperienceCommon);
local v10 = require(l_Parent_0.ToastRodux);
local v11 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutPage);
local v13 = require(l_script_FirstAncestor_0.State.Thunks.PurchaseItemsSuccessThunk);
local v14 = require(l_script_FirstAncestor_0.State.Thunks.SaveAsAvatarThunk);
local v15 = require(l_script_FirstAncestor_0.State.Thunks.SaveAsMakeupLookThunk);
local l_SetCurrentToastMessage_0 = v10.Actions.SetCurrentToastMessage;
local v17 = require(l_script_FirstAncestor_0.State.Actions.SetSelectedTimedOption);
local l_Constants_0 = v9.Constants;
local _ = require(l_script_FirstAncestor_0.Requests.PurchaseItems.PurchaseItemsTypes);
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_ToastType_0 = v10.Enums.ToastType;
local v22 = require(l_script_FirstAncestor_0.Requests.PurchaseItems);
local l_avatarLastEquippedStateStore_0 = v9.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v24 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.mapPurchaseItemsResponse);
local v25 = require(l_script_FirstAncestor_0.Utils.TryOns.getEquippableAssetsFromTryOnItems);
local v26 = require(l_script_FirstAncestor_0.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes);
local l_getTryOnItemReducerKey_0 = v9.Utils.getTryOnItemReducerKey;
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
local v29 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.getIsInsufficientRobuxError);
local v30 = require(l_script_FirstAncestor_0.Context.useAXCatalogStoreContext);
local l_useSignalState_0 = v7.useSignalState;
local l_useNetworking_0 = v9.Hooks.useNetworking;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local v41 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_sendUnifiedEventForDeferredAction_0 = v41.sendUnifiedEventForDeferredAction;
local l_sendUnifiedEventsForMultiItemShopping_0 = v41.sendUnifiedEventsForMultiItemShopping;
local l_getUnifiedEventsForMIS_0 = v41.Utils.getUnifiedEventsForMIS;
local l_UnifiedEventLogEnums_0 = v41.UnifiedEventLogEnums;
local l_CartIdService_0 = v41.Lib.CartIdService;
local v47 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXDurablesForMIS_0 = v47.FFlagAXDurablesForMIS;
local l_FFlagAXBlackbirdRoot_0 = v47.FFlagAXBlackbirdRoot;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v47.FFlagAXEnableExpiredUserLookCheckout;
local l_FFlagAXCatalogMakeupSupport_0 = v47.FFlagAXCatalogMakeupSupport;
local l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 = v47.FFlagAXFixAvatarLooksSaveWithMakeupItems;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v47.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v47.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local function v56(v55) --[[ Line: 71 ]] --[[ Name: selectTryOnLookId ]]
    return v55.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local v57 = nil;
if l_FFlagAXCatalogMakeupSupport_0 then
    v57 = function(v58) --[[ Line: 77 ]]
        return v58.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId;
    end;
end;
local v59 = nil;
local v60 = nil;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v59 = function(v61) --[[ Line: 84 ]]
        return v61.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end;
    v60 = function(v62) --[[ Line: 88 ]]
        return v62.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo;
    end;
end;
local function v64(v63) --[[ Line: 93 ]] --[[ Name: selectAvatarSceneLooks ]]
    return v63.AvatarExperience.AvatarScene.Looks;
end;
local function v66(v65) --[[ Line: 97 ]] --[[ Name: selectTryOnItems ]]
    return v65.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v68(v67) --[[ Line: 101 ]] --[[ Name: selectTryOnBodyColor3s ]]
    return v67.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
end;
local function v70(v69) --[[ Line: 105 ]] --[[ Name: selectTryOnBodyScales ]]
    return v69.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
end;
local function v72(v71) --[[ Line: 109 ]] --[[ Name: selectTryOnBodyPartColorRangeIds ]]
    return v71.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds;
end;
local function _(v73) --[[ Line: 113 ]] --[[ Name: selectAssetInfos ]]
    return v73.AvatarExperience.Common.AssetInfos or {};
end;
local function _(v75) --[[ Line: 117 ]] --[[ Name: selectBundleInfos ]]
    return v75.AvatarExperience.Common.BundleInfos or {};
end;
local function _(v77) --[[ Line: 121 ]] --[[ Name: selectCollectibles ]]
    return v77.AvatarExperience.Common.Collectibles or {};
end;
local function v80(v79) --[[ Line: 125 ]] --[[ Name: selectLocalUserId ]]
    return v79.LocalUserId;
end;
local function v82(v81) --[[ Line: 129 ]] --[[ Name: selectShouldTryOnWithoutEquippedItems ]]
    return v81.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
end;
local function v85(v83) --[[ Line: 133 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v83.LocalUserId;
    if not l_LocalUserId_0 or not v83.UserRobux then
        return nil;
    else
        return v83.UserRobux[l_LocalUserId_0];
    end;
end;
local function v98(v86) --[[ Line: 145 ]] --[[ Name: selectItemInfoForTryOnItems ]]
    -- upvalues: l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local l_TryOnItems_0 = v86.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v88 = v86.AvatarExperience.Common.AssetInfos or {};
    local v89 = v86.AvatarExperience.Common.BundleInfos or {};
    local v90 = v86.AvatarExperience.Common.Collectibles or {};
    local v91 = {};
    for _, v93 in l_TryOnItems_0 do
        if v93.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
            table.insert(v91, {
                itemId = v93.itemId, 
                itemType = v93.itemType, 
                itemData = v93.itemData, 
                collectibleItemId = v93.itemId, 
                ordering = v93.itemRecency
            });
        else
            local v94 = if v93.itemType == Enum.AvatarItemType.Asset.Name then v88[v93.itemId] else v89[v93.itemId];
            local v95 = if v94 then v94.collectibleItemId else nil;
            local v96 = if v95 and v90.CollectiblesItemInfo then v90.CollectiblesItemInfo[v95] else nil;
            if v94 and v95 and v96 then
                local v97 = if v90.CollectiblesResellableInstances then v90.CollectiblesResellableInstances[v95] else nil;
                table.insert(v91, {
                    itemId = v93.itemId, 
                    itemType = v93.itemType, 
                    itemData = v94, 
                    collectibleItemId = v95, 
                    ordering = v93.itemRecency, 
                    collectibleItemInfo = v96, 
                    resellableInstances = v97, 
                    selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v93.selectedTimedOptionIndex else nil
                });
            end;
        end;
    end;
    return v91;
end;
return function(v99) --[[ Line: 210 ]] --[[ Name: useCheckoutPageViewModel ]]
    -- upvalues: v30 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useNetworking_0 (copy), l_useDispatch_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_useSelector_0 (copy), v66 (copy), v3 (copy), v68 (copy), v70 (copy), v72 (copy), v56 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v57 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v59 (ref), v60 (ref), v64 (copy), v98 (copy), v82 (copy), v80 (copy), v85 (copy), l_useLocalization_0 (copy), l_LocalizationRoactContext_0 (copy), l_useAppPolicy_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), l_AvatarScreen_0 (copy), v11 (copy), l_Constants_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_CartIdService_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v17 (copy), l_ToastType_0 (copy), l_SetCurrentToastMessage_0 (copy), v26 (copy), v15 (copy), v14 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v25 (copy), l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 (copy), v13 (copy), l_sendUnifiedEventsForMultiItemShopping_0 (copy), l_getUnifiedEventsForMIS_0 (copy), l_mutedError_0 (copy), v22 (copy), v24 (copy), v29 (copy), l_FFlagAXBlackbirdRoot_0 (copy)
    local l_shoppingCartStore_0 = v30().shoppingCartStore;
    local v101 = l_useNavigation_0();
    local v102 = l_useAvatarRoute_0();
    local v103 = l_useNetworking_0();
    local v104 = l_useDispatch_0();
    local v105 = l_useSignalState_0(l_shoppingCartStore_0.getItems);
    local v106 = l_useSignalState_0(l_shoppingCartStore_0.getCanPurchase);
    local v107 = l_useSignalState_0(l_shoppingCartStore_0.getPurchasableItemsTotalPriceInRobux);
    local v108 = l_useSignalState_0(l_shoppingCartStore_0.getPurchasableItemsTotalOriginalPriceInRobux);
    local v109 = l_useSignalState_0(l_shoppingCartStore_0.getErroredItemCount);
    local v110, v111 = v2.useState(true);
    local v112, v113 = v2.useState(false);
    local v114, v115 = v2.useState(false);
    local v116 = l_useSelector_0(v66, v3.deepEqual);
    local v117 = l_useSelector_0(v68, v3.deepEqual);
    local v118 = l_useSelector_0(v70, v3.deepEqual);
    local v119 = l_useSelector_0(v72, v3.deepEqual);
    local v120 = l_useSelector_0(v56);
    local v121 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v57) else nil;
    local v122 = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_useSelector_0(v59) else nil;
    local v123 = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_useSelector_0(v60) else nil;
    local v124 = l_useSelector_0(v64, v3.deepEqual);
    local v125 = l_useSelector_0(v98, v3.deepEqual);
    local v126 = l_useSelector_0(v82);
    local v127 = l_useSelector_0(v80);
    local v128 = l_useSelector_0(v85);
    local v129 = l_useLocalization_0({
        purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular", 
        purchaseFailedTitlePlural = {
            "Feature.Catalog.Title.Checkout.PurchaseFailedPlural"; 
            count = #v105
        }, 
        purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        purchaseFailedButton = "Feature.Avatar.Action.GotIt", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved"
    });
    local v130 = v2.useContext(l_LocalizationRoactContext_0);
    local v132 = l_useAppPolicy_0(function(v131) --[[ Line: 260 ]]
        return v131.getDisableResellingCollectiblesForCompliance();
    end);
    local v133 = v2.useRef(false);
    local v134 = l_useNavigationFocus_0();
    v2.useEffect(function() --[[ Line: 272 ]]
        -- upvalues: v99 (copy), v128 (copy)
        if v99.fetchUserRobux and not v128 then
            v99.fetchUserRobux();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 280 ]]
        -- upvalues: v134 (copy), v133 (copy), v99 (copy)
        if v134 and v133.current and v99.fetchUserRobux then
            v99.fetchUserRobux();
            v133.current = false;
        end;
    end, {
        v134, 
        v99.fetchUserRobux
    });
    v2.useLayoutEffect(function() --[[ Line: 289 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v125 (copy), v132 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v102 (copy), l_AvatarScreen_0 (ref), v101 (copy)
        l_shoppingCartStore_0.syncFromTryOns(v125, v132);
        local v135 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v102 and v102.current and v102.current.name else nil;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            if v125 and #v125 <= 0 and v135 == l_AvatarScreen_0.Checkout then
                v101.goBack();
                return;
            end;
        elseif v125 and #v125 <= 0 then
            v101.goBack();
        end;
    end, {
        l_shoppingCartStore_0, 
        v125, 
        v132, 
        v101, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v102 else nil
    });
    local v144 = v2.useMemo(function() --[[ Line: 320 ]]
        -- upvalues: v105 (copy), v11 (ref), l_Constants_0 (ref), v99 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_CartIdService_0 (ref), l_FFlagAXDurablesForMIS_0 (ref), l_shoppingCartStore_0 (copy), v104 (copy), v17 (ref)
        local v136 = {};
        for _, v138 in v105 do
            table.insert(v136, v11.Dictionary.join(v138, {
                onActivated = function() --[[ Line: 326 ]] --[[ Name: onActivated ]]
                    -- upvalues: v138 (copy), l_Constants_0 (ref), v99 (ref)
                    if v138.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                        return;
                    else
                        if v99.onOpenItemDetailsPage then
                            v99.onOpenItemDetailsPage(v138.itemId, v138.itemType, v138.itemSubType);
                        end;
                        return;
                    end;
                end, 
                onRemove = function() --[[ Line: 335 ]] --[[ Name: onRemove ]]
                    -- upvalues: v99 (ref), v138 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_CartIdService_0 (ref)
                    if v99.onRemoveItem then
                        v99.onRemoveItem(v138.itemId, v138.itemType);
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                            local v139 = nil;
                            if v138.itemType == "Asset" then
                                v139 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET;
                            elseif v138.itemType == "Bundle" then
                                v139 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
                            end;
                            l_sendUnifiedEventForDeferredAction_0({
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED, 
                                cartId = l_CartIdService_0.getCartId(), 
                                itemId = v138.itemId, 
                                itemType = v139, 
                                assetType = if v138.itemType == "Asset" then v138.itemSubType else nil, 
                                bundleType = if v138.itemType == "Asset" then nil else v138.itemSubType
                            });
                        end;
                    end;
                end, 
                onTimedOptionPriceChanged = l_FFlagAXDurablesForMIS_0 and function(v140, v141) --[[ Line: 359 ]]
                    -- upvalues: l_shoppingCartStore_0 (ref), v138 (copy), v11 (ref), v104 (ref), v17 (ref)
                    if l_shoppingCartStore_0.updateItemPrice then
                        if v138.timedOptions then
                            local v143 = v11.List.findWhere(v138.timedOptions, function(v142) --[[ Line: 364 ]]
                                -- upvalues: v141 (copy)
                                return v142.days == v141;
                            end) or #v138.timedOptions;
                            v104(v17({
                                itemId = v138.itemId, 
                                itemType = v138.itemType, 
                                selectedTimedOptionIndex = v143
                            }));
                        end;
                        l_shoppingCartStore_0.updateItemPrice(v138.itemId, v138.itemType, v140, v141);
                    end;
                end or nil
            }));
        end;
        return v136;
    end, {
        v105, 
        v99.onOpenItemDetailsPage, 
        v99.onRemoveItem, 
        if l_FFlagAXDurablesForMIS_0 then l_shoppingCartStore_0 else nil, 
        if l_FFlagAXDurablesForMIS_0 then v104 else nil
    });
    local v147 = v2.useMemo(function() --[[ Line: 399 ]]
        -- upvalues: v102 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), l_AvatarScreen_0 (ref)
        local v145 = v102 and v102.current and v102.current.name;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v146 = true;
            if v145 ~= l_AvatarScreen_0.ExpiredUserLookCheckout then
                v146 = v145 == l_AvatarScreen_0.Checkout;
            end;
            return v146;
        else
            return v145 == l_AvatarScreen_0.Checkout;
        end;
    end, {
        v102
    });
    local v148 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v2.useMemo(function() --[[ Line: 409 ]]
        -- upvalues: v102 (copy), l_AvatarScreen_0 (ref)
        return (v102 and v102.current and v102.current.name) == l_AvatarScreen_0.ExpiredUserLookCheckout;
    end, {
        v102
    }) else nil;
    local v152 = v2.useCallback(function(v149, v150, _) --[[ Line: 415 ]]
        -- upvalues: v99 (copy)
        if v99.onRemoveItem then
            v99.onRemoveItem(v149, v150);
        end;
    end, {
        v99.onRemoveItem, 
        v116, 
        v101
    });
    local v156 = v2.useCallback(function(v153, v154, v155) --[[ Line: 421 ]]
        -- upvalues: v99 (copy)
        if v99.onOpenItemDetailsPage then
            v99.onOpenItemDetailsPage(v153, v154, v155);
        end;
    end, {
        v99.onOpenItemDetailsPage
    });
    local v157 = v2.useCallback(function() --[[ Line: 427 ]]
        -- upvalues: v101 (copy), l_AvatarScreen_0 (ref)
        v101.navigate(l_AvatarScreen_0.CartUnavailableItemsPrompt);
    end, {
        v101
    });
    local v158 = v2.useCallback(function() --[[ Line: 431 ]]
        -- upvalues: v111 (copy), v110 (copy)
        v111(not v110);
    end, {
        v110
    });
    local v159 = v2.useCallback(function() --[[ Line: 435 ]]
        -- upvalues: v113 (copy), v112 (copy)
        v113(not v112);
    end, {
        v112
    });
    local v163 = v2.useCallback(function() --[[ Line: 439 ]]
        -- upvalues: v105 (copy), l_Constants_0 (ref), l_FFlagAXDurablesForMIS_0 (ref)
        local v160 = {};
        for _, v162 in v105 do
            if v162.itemId ~= l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                table.insert(v160, {
                    agreedPriceRobux = v162.priceInRobux, 
                    collectibleProductId = v162.collectibleProductId, 
                    rentalOption = if l_FFlagAXDurablesForMIS_0 and v162.selectedTimedOptionDays and v162.selectedTimedOptionDays > 0 then {
                        durationDays = v162.selectedTimedOptionDays
                    } else nil
                });
            end;
        end;
        return v160;
    end, {
        v105
    });
    local v165 = v2.useCallback(function() --[[ Line: 462 ]]
        -- upvalues: v129 (copy), l_ToastType_0 (ref), v104 (copy), l_SetCurrentToastMessage_0 (ref)
        local v164 = {
            isLocalized = true, 
            toastMessage = v129.characterSavedHeading, 
            toastSubMessage = v129.characterSavedMsg, 
            toastType = l_ToastType_0.SuccessConfirmation
        };
        v104(l_SetCurrentToastMessage_0(v164));
    end, {
        v104, 
        v129
    });
    local v170 = v2.useCallback(function(v166) --[[ Line: 472 ]]
        -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (ref), v26 (ref), v124 (copy), v121 (copy), v120 (copy), v104 (copy), v15 (ref), v103 (copy), v14 (ref), v99 (copy), v165 (copy)
        if l_FFlagAXCatalogMakeupSupport_0 then
            local v167 = v26(v166);
            local v168 = v167 and "Makeup" or "Avatar";
            if v124 and v124[v121] and v124[v121].name then
                v168 = v124[v121].name;
            end;
            if v124 and v124[v120] and v124[v120].name then
                v168 = v124[v120].name;
            end;
            if v167 then
                v104(v15(v103, v168, v166));
                return;
            else
                v104(v14(v168, v99.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v166, v165));
                return;
            end;
        else
            local v169 = "Avatar";
            if v124 and v124[v120] and v124[v120].name then
                v169 = v124[v120].name;
            end;
            v104(v14(v169, v99.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v166, v165));
            return;
        end;
    end, {
        v104, 
        v165, 
        v99.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, 
        v124, 
        v120, 
        if l_FFlagAXCatalogMakeupSupport_0 then v103 else nil, 
        if l_FFlagAXCatalogMakeupSupport_0 then v121 else nil
    });
    local v188 = v2.useCallback(function(v171) --[[ Line: 525 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v124 (copy), v120 (copy), v121 (copy), v99 (copy), v104 (copy), l_SetCurrentToastMessage_0 (ref), v130 (copy), l_ToastType_0 (ref), l_getTryOnItemReducerKey_0 (ref), v116 (copy), v112 (copy), v170 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), v110 (copy), v25 (ref), l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 (ref), v13 (ref), v126 (copy), v117 (copy), v118 (copy), v119 (copy)
        local v172 = l_shoppingCartStore_0.updateCartFromPurchaseResponse(v171);
        local l_boughtItems_0 = v172.boughtItems;
        local l_equippableItems_0 = v172.equippableItems;
        local l_needDataRefeshItems_0 = v172.needDataRefeshItems;
        local v176 = nil;
        local v177 = nil;
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
            v176 = v124[v120];
            if v176 ~= nil then
                v176 = table.clone(v176);
                v176.itemId = v120;
            end;
            v177 = v124[v121];
            if v177 ~= nil then
                v177 = table.clone(v177);
                v177.itemId = v121;
            end;
        end;
        for _, v179 in l_needDataRefeshItems_0 do
            if v99.fetchItemData then
                v99.fetchItemData(v179.itemId, v179.itemType);
            end;
        end;
        v104(l_SetCurrentToastMessage_0({
            toastMessage = v130:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", {
                count = #l_boughtItems_0
            }), 
            isLocalized = true, 
            toastType = l_ToastType_0.InformationMessage
        }));
        local v180 = {};
        for _, v182 in l_equippableItems_0 do
            local v183 = v116[l_getTryOnItemReducerKey_0(v182.itemId, v182.itemType)];
            if v183 then
                table.insert(v180, v183);
            end;
        end;
        if v112 then
            v170(v180);
        end;
        for _, v185 in l_equippableItems_0 do
            if v99.onRemoveItem then
                v99.onRemoveItem(v185.itemId, v185.itemType);
            end;
        end;
        local v186 = {};
        if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
            l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
        end;
        if v110 then
            v186 = v25(v180);
        end;
        local v187 = if l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 then v121 ~= nil else nil;
        v104(v13(l_boughtItems_0, v186, v126, v117, v118, v119, v180, v99.getBundleOutfitInfoFromProvidedTryOns, if l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 then v187 else nil, if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v176 else nil, if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v177 else nil));
    end, {
        v104, 
        l_shoppingCartStore_0.updateCartFromPurchaseResponse, 
        v110, 
        v112, 
        v117, 
        v118, 
        v119, 
        v116, 
        v126, 
        v170, 
        v99.onRemoveItem, 
        v99.fetchItemData, 
        v99.getBundleOutfitInfoFromProvidedTryOns, 
        if l_FFlagAXFixAvatarLooksSaveWithMakeupItems_0 then v121 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v120 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v124 else nil
    });
    local v189 = v2.useCallback(function() --[[ Line: 636 ]]
        -- upvalues: v101 (copy), l_AvatarScreen_0 (ref), v133 (copy)
        v101.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt);
        v133.current = true;
    end, {
        v101
    });
    local v196 = v2.useCallback(function() --[[ Line: 643 ]]
        -- upvalues: v115 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v124 (copy), v120 (copy), v121 (copy), v122 (copy), v123 (copy), l_sendUnifiedEventsForMultiItemShopping_0 (ref), l_getUnifiedEventsForMIS_0 (ref), v105 (copy), v116 (copy), l_UnifiedEventLogEnums_0 (ref), l_mutedError_0 (ref), v22 (ref), v103 (copy), v127 (copy), v163 (copy), v24 (ref), v188 (copy), v99 (copy), v29 (ref), v189 (copy), v101 (copy), l_AvatarScreen_0 (ref), v129 (copy)
        v115(true);
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and not pcall(function() --[[ Line: 647 ]]
            -- upvalues: v124 (ref), v120 (ref), v121 (ref), v122 (ref), v123 (ref), l_sendUnifiedEventsForMultiItemShopping_0 (ref), l_getUnifiedEventsForMIS_0 (ref), v105 (ref), v116 (ref), l_UnifiedEventLogEnums_0 (ref)
            local v190 = v124[v120];
            if v190 ~= nil then
                v190 = table.clone(v190);
                v190.itemId = v120;
            end;
            local v191 = v124[v121];
            if v191 ~= nil then
                v191 = table.clone(v191);
                v191.itemId = v121;
            end;
            if v190 then
                v190.isOrganicLook = v122 == nil;
            end;
            if v191 then
                v191.isOrganicLook = v123 == nil;
            end;
            l_sendUnifiedEventsForMultiItemShopping_0(l_getUnifiedEventsForMIS_0(v105, v116, v190, v191, l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT));
        end) then
            l_mutedError_0("Failed to send unified events for multi-item shopping purchase attempt");
        end;
        v22({
            networkImpl = v103, 
            userId = v127, 
            lookId = v120, 
            makeupLookId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v121 else nil, 
            lineItems = v163()
        }):andThen(function(v192) --[[ Line: 695 ]]
            -- upvalues: v24 (ref), v188 (ref), v99 (ref)
            if v192.isJSONValid and v192.responseCode == 200 then
                local l_responseBody_0 = v192.responseBody;
                local v194 = v24(l_responseBody_0);
                v188(v194);
                if v99.fetchUserRobux then
                    v99.fetchUserRobux();
                end;
            end;
        end):catch(function(v195) --[[ Line: 706 ]]
            -- upvalues: v29 (ref), v189 (ref), v101 (ref), l_AvatarScreen_0 (ref), v105 (ref), v129 (ref)
            if v29(v195) then
                v189();
                return;
            else
                v101.navigate(l_AvatarScreen_0.GenericPrompt, {
                    titleText = if #v105 == 1 then v129.purchaseFailedTitle else v129.purchaseFailedTitlePlural, 
                    bodyText = v129.purchaseFailedUnknownError, 
                    buttonText = v129.purchaseFailedButton
                });
                return;
            end;
        end):finally(function() --[[ Line: 719 ]]
            -- upvalues: v115 (ref)
            v115(false);
        end);
    end, {
        v163, 
        v127, 
        v103, 
        v189, 
        v99.fetchUserRobux, 
        v188, 
        v105, 
        v129, 
        v101, 
        v120, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v121 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v124 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v116 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v122 else nil, 
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v123 else nil
    });
    local v197 = v2.useCallback(function() --[[ Line: 742 ]]
        -- upvalues: v128 (copy), v107 (copy), v189 (copy), v196 (copy)
        if v128 and v128 < v107 then
            v189();
            return;
        else
            v196();
            return;
        end;
    end, {
        v128, 
        v107, 
        v196, 
        v189
    });
    return {
        canPurchase = v106, 
        cartItems = v144, 
        erroredItemCount = v109, 
        isPurchasing = v114, 
        isVisible = v147, 
        hideBuyOptions = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v148 else nil, 
        isWearAfterPurchaseChecked = v110, 
        isAddToMyAvatarsChecked = v112, 
        onCheckoutButtonActivated = v197, 
        onOpenItemDetailsPage = v156, 
        onRemoveItem = v152, 
        onUnavailableButtonActivated = v157, 
        onWearAfterPurchaseToggle = v158, 
        onAddToMyAvatarsToggle = v159, 
        purchasableItemsTotalPriceInRobux = v107, 
        purchasableItemsTotalOriginalPriceInRobux = if l_FFlagAXBlackbirdRoot_0 then v108 else nil
    };
end;