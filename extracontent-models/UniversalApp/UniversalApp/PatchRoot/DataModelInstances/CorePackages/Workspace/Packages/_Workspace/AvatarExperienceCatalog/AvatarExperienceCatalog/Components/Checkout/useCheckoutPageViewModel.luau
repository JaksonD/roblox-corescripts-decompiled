local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local _ = require(l_Parent_0.Http);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_Parent_0.AvatarExperienceNavigation);
local v8 = require(l_Parent_0.AvatarExperienceCommon);
local v9 = require(l_Parent_0.ToastRodux);
local v10 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutPage);
local v12 = require(l_script_FirstAncestor_0.State.Thunks.PurchaseItemsSuccessThunk);
local v13 = require(l_script_FirstAncestor_0.State.Thunks.SaveAsAvatarThunk);
local l_SetCurrentToastMessage_0 = v9.Actions.SetCurrentToastMessage;
local l_Constants_0 = v8.Constants;
local _ = require(l_script_FirstAncestor_0.Requests.PurchaseItems.PurchaseItemsTypes);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_ToastType_0 = v9.Enums.ToastType;
local v19 = require(l_script_FirstAncestor_0.Requests.PurchaseItems);
local v20 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.mapPurchaseItemsResponse);
local v21 = require(l_script_FirstAncestor_0.Utils.TryOns.getEquippableAssetsFromTryOnItems);
local l_getTryOnItemReducerKey_0 = v8.Utils.getTryOnItemReducerKey;
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
local v24 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.getIsInsufficientRobuxError);
local v25 = require(l_script_FirstAncestor_0.Context.useAXCatalogStoreContext);
local l_useSignalState_0 = v6.useSignalState;
local l_useNetworking_0 = v8.Hooks.useNetworking;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v35 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXDurablesForMIS_0 = v35.FFlagAXDurablesForMIS;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v35.FFlagAXEnableExpiredUserLookCheckout;
local function v39(v38) --[[ Line: 49 ]] --[[ Name: selectTryOnLookId ]]
    return v38.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v41(v40) --[[ Line: 53 ]] --[[ Name: selectAvatarSceneLooks ]]
    return v40.AvatarExperience.AvatarScene.Looks;
end;
local function v43(v42) --[[ Line: 57 ]] --[[ Name: selectTryOnItems ]]
    return v42.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v45(v44) --[[ Line: 61 ]] --[[ Name: selectTryOnBodyColor3s ]]
    return v44.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
end;
local function v47(v46) --[[ Line: 65 ]] --[[ Name: selectTryOnBodyScales ]]
    return v46.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
end;
local function v49(v48) --[[ Line: 69 ]] --[[ Name: selectTryOnBodyPartColorRangeIds ]]
    return v48.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds;
end;
local function _(v50) --[[ Line: 73 ]] --[[ Name: selectAssetInfos ]]
    return v50.AvatarExperience.Common.AssetInfos or {};
end;
local function _(v52) --[[ Line: 77 ]] --[[ Name: selectBundleInfos ]]
    return v52.AvatarExperience.Common.BundleInfos or {};
end;
local function _(v54) --[[ Line: 81 ]] --[[ Name: selectCollectibles ]]
    return v54.AvatarExperience.Common.Collectibles or {};
end;
local function v57(v56) --[[ Line: 85 ]] --[[ Name: selectLocalUserId ]]
    return v56.LocalUserId;
end;
local function v59(v58) --[[ Line: 89 ]] --[[ Name: selectShouldTryOnWithoutEquippedItems ]]
    return v58.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
end;
local function v62(v60) --[[ Line: 93 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v60.LocalUserId;
    if not l_LocalUserId_0 or not v60.UserRobux then
        return nil;
    else
        return v60.UserRobux[l_LocalUserId_0];
    end;
end;
local function v75(v63) --[[ Line: 105 ]] --[[ Name: selectItemInfoForTryOnItems ]]
    -- upvalues: l_Constants_0 (copy)
    local l_TryOnItems_0 = v63.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v65 = v63.AvatarExperience.Common.AssetInfos or {};
    local v66 = v63.AvatarExperience.Common.BundleInfos or {};
    local v67 = v63.AvatarExperience.Common.Collectibles or {};
    local v68 = {};
    for _, v70 in l_TryOnItems_0 do
        if v70.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
            table.insert(v68, {
                itemId = v70.itemId, 
                itemType = v70.itemType, 
                itemData = v70.itemData, 
                collectibleItemId = v70.itemId, 
                ordering = v70.itemRecency
            });
        else
            local v71 = if v70.itemType == Enum.AvatarItemType.Asset.Name then v65[v70.itemId] else v66[v70.itemId];
            local v72 = if v71 then v71.collectibleItemId else nil;
            local v73 = if v72 and v67.CollectiblesItemInfo then v67.CollectiblesItemInfo[v72] else nil;
            if v71 and v72 and v73 then
                local v74 = if v67.CollectiblesResellableInstances then v67.CollectiblesResellableInstances[v72] else nil;
                table.insert(v68, {
                    itemId = v70.itemId, 
                    itemType = v70.itemType, 
                    itemData = v71, 
                    collectibleItemId = v72, 
                    ordering = v70.itemRecency, 
                    collectibleItemInfo = v73, 
                    resellableInstances = v74
                });
            end;
        end;
    end;
    return v68;
end;
return function(v76) --[[ Line: 169 ]] --[[ Name: useCheckoutPageViewModel ]]
    -- upvalues: v25 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useNetworking_0 (copy), l_useDispatch_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_useSelector_0 (copy), v43 (copy), v3 (copy), v45 (copy), v47 (copy), v49 (copy), v39 (copy), v41 (copy), v75 (copy), v59 (copy), v57 (copy), v62 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_ToastType_0 (copy), l_SetCurrentToastMessage_0 (copy), v13 (copy), l_getTryOnItemReducerKey_0 (copy), v21 (copy), v12 (copy), v19 (copy), v20 (copy), v24 (copy)
    local l_shoppingCartStore_0 = v25().shoppingCartStore;
    local v78 = l_useNavigation_0();
    local v79 = l_useAvatarRoute_0();
    local v80 = l_useNetworking_0();
    local v81 = l_useDispatch_0();
    local v82 = l_useSignalState_0(l_shoppingCartStore_0.getItems);
    local v83 = l_useSignalState_0(l_shoppingCartStore_0.getCanPurchase);
    local v84 = l_useSignalState_0(l_shoppingCartStore_0.getPurchasableItemsTotalPriceInRobux);
    local v85 = l_useSignalState_0(l_shoppingCartStore_0.getErroredItemCount);
    local v86, v87 = v2.useState(true);
    local v88, v89 = v2.useState(false);
    local v90, v91 = v2.useState(false);
    local v92 = l_useSelector_0(v43, v3.deepEqual);
    local v93 = l_useSelector_0(v45, v3.deepEqual);
    local v94 = l_useSelector_0(v47, v3.deepEqual);
    local v95 = l_useSelector_0(v49, v3.deepEqual);
    local v96 = l_useSelector_0(v39);
    local v97 = l_useSelector_0(v41, v3.deepEqual);
    local v98 = l_useSelector_0(v75, v3.deepEqual);
    local v99 = l_useSelector_0(v59);
    local v100 = l_useSelector_0(v57);
    local v101 = l_useSelector_0(v62);
    local v102 = l_useLocalization_0({
        purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular", 
        purchaseFailedTitlePlural = {
            "Feature.Catalog.Title.Checkout.PurchaseFailedPlural"; 
            count = #v82
        }, 
        purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        purchaseFailedButton = "Feature.Avatar.Action.GotIt", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved"
    });
    local v104 = l_useAppPolicy_0(function(v103) --[[ Line: 209 ]]
        return v103.getDisableResellingCollectiblesForCompliance();
    end);
    local v105 = v2.useRef(false);
    local v106 = l_useNavigationFocus_0();
    v2.useEffect(function() --[[ Line: 221 ]]
        -- upvalues: v76 (copy), v101 (copy)
        if v76.fetchUserRobux and not v101 then
            v76.fetchUserRobux();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 229 ]]
        -- upvalues: v106 (copy), v105 (copy), v76 (copy)
        if v106 and v105.current and v76.fetchUserRobux then
            v76.fetchUserRobux();
            v105.current = false;
        end;
    end, {
        v106, 
        v76.fetchUserRobux
    });
    v2.useLayoutEffect(function() --[[ Line: 238 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v98 (copy), v104 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v79 (copy), l_AvatarScreen_0 (ref), v78 (copy)
        l_shoppingCartStore_0.syncFromTryOns(v98, v104);
        local v107 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v79 and v79.current and v79.current.name else nil;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            if v98 and #v98 <= 0 and v107 == l_AvatarScreen_0.Checkout then
                v78.goBack();
                return;
            end;
        elseif v98 and #v98 <= 0 then
            v78.goBack();
        end;
    end, {
        l_shoppingCartStore_0, 
        v98, 
        v104, 
        v78, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v79 else nil
    });
    local v113 = v2.useMemo(function() --[[ Line: 269 ]]
        -- upvalues: v82 (copy), v10 (ref), l_Constants_0 (ref), v76 (copy), l_FFlagAXDurablesForMIS_0 (ref), l_shoppingCartStore_0 (copy)
        local v108 = {};
        for _, v110 in v82 do
            table.insert(v108, v10.Dictionary.join(v110, {
                onActivated = function() --[[ Line: 275 ]] --[[ Name: onActivated ]]
                    -- upvalues: v110 (copy), l_Constants_0 (ref), v76 (ref)
                    if v110.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                        return;
                    else
                        if v76.onOpenItemDetailsPage then
                            v76.onOpenItemDetailsPage(v110.itemId, v110.itemType, v110.itemSubType);
                        end;
                        return;
                    end;
                end, 
                onRemove = function() --[[ Line: 284 ]] --[[ Name: onRemove ]]
                    -- upvalues: v76 (ref), v110 (copy)
                    if v76.onRemoveItem then
                        v76.onRemoveItem(v110.itemId, v110.itemType);
                    end;
                end, 
                onTimedOptionPriceChanged = l_FFlagAXDurablesForMIS_0 and function(v111, v112) --[[ Line: 290 ]]
                    -- upvalues: l_shoppingCartStore_0 (ref), v110 (copy)
                    if l_shoppingCartStore_0.updateItemPrice then
                        l_shoppingCartStore_0.updateItemPrice(v110.itemId, v110.itemType, v111, v112);
                    end;
                end or nil
            }));
        end;
        return v108;
    end, {
        v82, 
        v76.onOpenItemDetailsPage, 
        v76.onRemoveItem, 
        if l_FFlagAXDurablesForMIS_0 then l_shoppingCartStore_0 else nil
    });
    local v116 = v2.useMemo(function() --[[ Line: 311 ]]
        -- upvalues: v79 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), l_AvatarScreen_0 (ref)
        local v114 = v79 and v79.current and v79.current.name;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v115 = true;
            if v114 ~= l_AvatarScreen_0.ExpiredUserLookCheckout then
                v115 = v114 == l_AvatarScreen_0.Checkout;
            end;
            return v115;
        else
            return v114 == l_AvatarScreen_0.Checkout;
        end;
    end, {
        v79
    });
    local v117 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v2.useMemo(function() --[[ Line: 321 ]]
        -- upvalues: v79 (copy), l_AvatarScreen_0 (ref)
        return (v79 and v79.current and v79.current.name) == l_AvatarScreen_0.ExpiredUserLookCheckout;
    end, {
        v79
    }) else nil;
    local v121 = v2.useCallback(function(v118, v119, _) --[[ Line: 327 ]]
        -- upvalues: v76 (copy)
        if v76.onRemoveItem then
            v76.onRemoveItem(v118, v119);
        end;
    end, {
        v76.onRemoveItem, 
        v92, 
        v78
    });
    local v125 = v2.useCallback(function(v122, v123, v124) --[[ Line: 333 ]]
        -- upvalues: v76 (copy)
        if v76.onOpenItemDetailsPage then
            v76.onOpenItemDetailsPage(v122, v123, v124);
        end;
    end, {
        v76.onOpenItemDetailsPage
    });
    local v126 = v2.useCallback(function() --[[ Line: 339 ]]
        -- upvalues: v78 (copy), l_AvatarScreen_0 (ref)
        v78.navigate(l_AvatarScreen_0.CartUnavailableItemsPrompt);
    end, {
        v78
    });
    local v127 = v2.useCallback(function() --[[ Line: 343 ]]
        -- upvalues: v87 (copy), v86 (copy)
        v87(not v86);
    end, {
        v86
    });
    local v128 = v2.useCallback(function() --[[ Line: 347 ]]
        -- upvalues: v89 (copy), v88 (copy)
        v89(not v88);
    end, {
        v88
    });
    local v132 = v2.useCallback(function() --[[ Line: 351 ]]
        -- upvalues: v82 (copy), l_Constants_0 (ref), l_FFlagAXDurablesForMIS_0 (ref)
        local v129 = {};
        for _, v131 in v82 do
            if v131.itemId ~= l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                table.insert(v129, {
                    agreedPriceRobux = v131.priceInRobux, 
                    collectibleProductId = v131.collectibleProductId, 
                    rentalOption = if l_FFlagAXDurablesForMIS_0 and v131.selectedTimedOptionDays then {
                        durationDays = v131.selectedTimedOptionDays
                    } else nil
                });
            end;
        end;
        return v129;
    end, {
        v82
    });
    local v134 = v2.useCallback(function() --[[ Line: 372 ]]
        -- upvalues: v102 (copy), l_ToastType_0 (ref), v81 (copy), l_SetCurrentToastMessage_0 (ref)
        local v133 = {
            isLocalized = true, 
            toastMessage = v102.characterSavedHeading, 
            toastSubMessage = v102.characterSavedMsg, 
            toastType = l_ToastType_0.SuccessConfirmation
        };
        v81(l_SetCurrentToastMessage_0(v133));
    end, {
        v81, 
        v102
    });
    local v137 = v2.useCallback(function(v135) --[[ Line: 382 ]]
        -- upvalues: v97 (copy), v96 (copy), v81 (copy), v13 (ref), v76 (copy), v134 (copy)
        local v136 = "Avatar";
        if v97 and v97[v96] and v97[v96].name then
            v136 = v97[v96].name;
        end;
        v81(v13(v136, v76.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v135, v134));
    end, {
        v81, 
        v134, 
        v76.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, 
        v97, 
        v96
    });
    local v151 = v2.useCallback(function(v138) --[[ Line: 406 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v76 (copy), v81 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), l_getTryOnItemReducerKey_0 (ref), v92 (copy), v88 (copy), v137 (copy), v86 (copy), v21 (ref), v12 (ref), v99 (copy), v93 (copy), v94 (copy), v95 (copy)
        local v139 = l_shoppingCartStore_0.updateCartFromPurchaseResponse(v138);
        local l_boughtItems_0 = v139.boughtItems;
        local l_equippableItems_0 = v139.equippableItems;
        for _, v143 in v139.needDataRefeshItems do
            if v76.fetchItemData then
                v76.fetchItemData(v143.itemId, v143.itemType);
            end;
        end;
        v81(l_SetCurrentToastMessage_0({
            toastMessage = ("%* Items Purchased"):format(#l_boughtItems_0), 
            isLocalized = true, 
            toastType = l_ToastType_0.InformationMessage
        }));
        local v144 = {};
        for _, v146 in l_equippableItems_0 do
            local v147 = v92[l_getTryOnItemReducerKey_0(v146.itemId, v146.itemType)];
            if v147 then
                table.insert(v144, v147);
            end;
        end;
        if v88 then
            v137(v144);
        end;
        for _, v149 in l_equippableItems_0 do
            if v76.onRemoveItem then
                v76.onRemoveItem(v149.itemId, v149.itemType);
            end;
        end;
        local v150 = {};
        if v86 then
            v150 = v21(v144);
        end;
        v81(v12(l_boughtItems_0, v150, v99, v93, v94, v95, v144, v76.getBundleOutfitInfoFromProvidedTryOns));
    end, {
        l_shoppingCartStore_0.updateCartFromPurchaseResponse, 
        v76.onRemoveItem, 
        v86, 
        v88, 
        v93, 
        v94, 
        v95, 
        v92, 
        v99
    });
    local v152 = v2.useCallback(function() --[[ Line: 479 ]]
        -- upvalues: v78 (copy), l_AvatarScreen_0 (ref), v105 (copy)
        v78.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt);
        v105.current = true;
    end, {
        v78
    });
    local v157 = v2.useCallback(function() --[[ Line: 486 ]]
        -- upvalues: v91 (copy), v19 (ref), v80 (copy), v100 (copy), v96 (copy), v132 (copy), v20 (ref), v151 (copy), v76 (copy), v24 (ref), v152 (copy), v78 (copy), l_AvatarScreen_0 (ref), v82 (copy), v102 (copy)
        v91(true);
        v19({
            networkImpl = v80, 
            userId = v100, 
            lookId = v96, 
            lineItems = v132()
        }):andThen(function(v153) --[[ Line: 494 ]]
            -- upvalues: v20 (ref), v151 (ref), v76 (ref)
            if v153.isJSONValid and v153.responseCode == 200 then
                local l_responseBody_0 = v153.responseBody;
                local v155 = v20(l_responseBody_0);
                v151(v155);
                if v76.fetchUserRobux then
                    v76.fetchUserRobux();
                end;
            end;
        end):catch(function(v156) --[[ Line: 505 ]]
            -- upvalues: v24 (ref), v152 (ref), v78 (ref), l_AvatarScreen_0 (ref), v82 (ref), v102 (ref)
            if v24(v156) then
                v152();
                return;
            else
                v78.navigate(l_AvatarScreen_0.GenericPrompt, {
                    titleText = if #v82 == 1 then v102.purchaseFailedTitle else v102.purchaseFailedTitlePlural, 
                    bodyText = v102.purchaseFailedUnknownError, 
                    buttonText = v102.purchaseFailedButton
                });
                return;
            end;
        end):finally(function() --[[ Line: 518 ]]
            -- upvalues: v91 (ref)
            v91(false);
        end);
    end, {
        v132, 
        v100, 
        v80, 
        v152, 
        v76.fetchUserRobux, 
        v151, 
        v82, 
        v102, 
        v78, 
        v96
    });
    local v158 = v2.useCallback(function() --[[ Line: 536 ]]
        -- upvalues: v101 (copy), v84 (copy), v152 (copy), v157 (copy)
        if v101 and v101 < v84 then
            v152();
            return;
        else
            v157();
            return;
        end;
    end, {
        v101, 
        v84, 
        v157, 
        v152
    });
    return {
        canPurchase = v83, 
        cartItems = v113, 
        erroredItemCount = v85, 
        isPurchasing = v90, 
        isVisible = v116, 
        hideBuyOptions = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v117 else nil, 
        isWearAfterPurchaseChecked = v86, 
        isAddToMyAvatarsChecked = v88, 
        onCheckoutButtonActivated = v158, 
        onOpenItemDetailsPage = v125, 
        onRemoveItem = v121, 
        onUnavailableButtonActivated = v126, 
        onWearAfterPurchaseToggle = v127, 
        onAddToMyAvatarsToggle = v128, 
        purchasableItemsTotalPriceInRobux = v84
    };
end;