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
local v15 = require(l_script_FirstAncestor_0.State.Actions.SetSelectedTimedOption);
local l_Constants_0 = v8.Constants;
local _ = require(l_script_FirstAncestor_0.Requests.PurchaseItems.PurchaseItemsTypes);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_ToastType_0 = v9.Enums.ToastType;
local v20 = require(l_script_FirstAncestor_0.Requests.PurchaseItems);
local v21 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.mapPurchaseItemsResponse);
local v22 = require(l_script_FirstAncestor_0.Utils.TryOns.getEquippableAssetsFromTryOnItems);
local l_getTryOnItemReducerKey_0 = v8.Utils.getTryOnItemReducerKey;
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
local v25 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.getIsInsufficientRobuxError);
local v26 = require(l_script_FirstAncestor_0.Context.useAXCatalogStoreContext);
local l_useSignalState_0 = v6.useSignalState;
local l_useNetworking_0 = v8.Hooks.useNetworking;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v36 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXDurablesForMIS_0 = v36.FFlagAXDurablesForMIS;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v36.FFlagAXEnableExpiredUserLookCheckout;
local function v40(v39) --[[ Line: 50 ]] --[[ Name: selectTryOnLookId ]]
    return v39.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v42(v41) --[[ Line: 54 ]] --[[ Name: selectAvatarSceneLooks ]]
    return v41.AvatarExperience.AvatarScene.Looks;
end;
local function v44(v43) --[[ Line: 58 ]] --[[ Name: selectTryOnItems ]]
    return v43.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v46(v45) --[[ Line: 62 ]] --[[ Name: selectTryOnBodyColor3s ]]
    return v45.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
end;
local function v48(v47) --[[ Line: 66 ]] --[[ Name: selectTryOnBodyScales ]]
    return v47.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
end;
local function v50(v49) --[[ Line: 70 ]] --[[ Name: selectTryOnBodyPartColorRangeIds ]]
    return v49.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds;
end;
local function _(v51) --[[ Line: 74 ]] --[[ Name: selectAssetInfos ]]
    return v51.AvatarExperience.Common.AssetInfos or {};
end;
local function _(v53) --[[ Line: 78 ]] --[[ Name: selectBundleInfos ]]
    return v53.AvatarExperience.Common.BundleInfos or {};
end;
local function _(v55) --[[ Line: 82 ]] --[[ Name: selectCollectibles ]]
    return v55.AvatarExperience.Common.Collectibles or {};
end;
local function v58(v57) --[[ Line: 86 ]] --[[ Name: selectLocalUserId ]]
    return v57.LocalUserId;
end;
local function v60(v59) --[[ Line: 90 ]] --[[ Name: selectShouldTryOnWithoutEquippedItems ]]
    return v59.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
end;
local function v63(v61) --[[ Line: 94 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v61.LocalUserId;
    if not l_LocalUserId_0 or not v61.UserRobux then
        return nil;
    else
        return v61.UserRobux[l_LocalUserId_0];
    end;
end;
local function v76(v64) --[[ Line: 106 ]] --[[ Name: selectItemInfoForTryOnItems ]]
    -- upvalues: l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local l_TryOnItems_0 = v64.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v66 = v64.AvatarExperience.Common.AssetInfos or {};
    local v67 = v64.AvatarExperience.Common.BundleInfos or {};
    local v68 = v64.AvatarExperience.Common.Collectibles or {};
    local v69 = {};
    for _, v71 in l_TryOnItems_0 do
        if v71.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
            table.insert(v69, {
                itemId = v71.itemId, 
                itemType = v71.itemType, 
                itemData = v71.itemData, 
                collectibleItemId = v71.itemId, 
                ordering = v71.itemRecency
            });
        else
            local v72 = if v71.itemType == Enum.AvatarItemType.Asset.Name then v66[v71.itemId] else v67[v71.itemId];
            local v73 = if v72 then v72.collectibleItemId else nil;
            local v74 = if v73 and v68.CollectiblesItemInfo then v68.CollectiblesItemInfo[v73] else nil;
            if v72 and v73 and v74 then
                local v75 = if v68.CollectiblesResellableInstances then v68.CollectiblesResellableInstances[v73] else nil;
                table.insert(v69, {
                    itemId = v71.itemId, 
                    itemType = v71.itemType, 
                    itemData = v72, 
                    collectibleItemId = v73, 
                    ordering = v71.itemRecency, 
                    collectibleItemInfo = v74, 
                    resellableInstances = v75, 
                    selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v71.selectedTimedOptionIndex else nil
                });
            end;
        end;
    end;
    return v69;
end;
return function(v77) --[[ Line: 171 ]] --[[ Name: useCheckoutPageViewModel ]]
    -- upvalues: v26 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useNetworking_0 (copy), l_useDispatch_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_useSelector_0 (copy), v44 (copy), v3 (copy), v46 (copy), v48 (copy), v50 (copy), v40 (copy), v42 (copy), v76 (copy), v60 (copy), v58 (copy), v63 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v15 (copy), l_ToastType_0 (copy), l_SetCurrentToastMessage_0 (copy), v13 (copy), l_getTryOnItemReducerKey_0 (copy), v22 (copy), v12 (copy), v20 (copy), v21 (copy), v25 (copy)
    local l_shoppingCartStore_0 = v26().shoppingCartStore;
    local v79 = l_useNavigation_0();
    local v80 = l_useAvatarRoute_0();
    local v81 = l_useNetworking_0();
    local v82 = l_useDispatch_0();
    local v83 = l_useSignalState_0(l_shoppingCartStore_0.getItems);
    local v84 = l_useSignalState_0(l_shoppingCartStore_0.getCanPurchase);
    local v85 = l_useSignalState_0(l_shoppingCartStore_0.getPurchasableItemsTotalPriceInRobux);
    local v86 = l_useSignalState_0(l_shoppingCartStore_0.getErroredItemCount);
    local v87, v88 = v2.useState(true);
    local v89, v90 = v2.useState(false);
    local v91, v92 = v2.useState(false);
    local v93 = l_useSelector_0(v44, v3.deepEqual);
    local v94 = l_useSelector_0(v46, v3.deepEqual);
    local v95 = l_useSelector_0(v48, v3.deepEqual);
    local v96 = l_useSelector_0(v50, v3.deepEqual);
    local v97 = l_useSelector_0(v40);
    local v98 = l_useSelector_0(v42, v3.deepEqual);
    local v99 = l_useSelector_0(v76, v3.deepEqual);
    local v100 = l_useSelector_0(v60);
    local v101 = l_useSelector_0(v58);
    local v102 = l_useSelector_0(v63);
    local v103 = l_useLocalization_0({
        purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular", 
        purchaseFailedTitlePlural = {
            "Feature.Catalog.Title.Checkout.PurchaseFailedPlural"; 
            count = #v83
        }, 
        purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        purchaseFailedButton = "Feature.Avatar.Action.GotIt", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved"
    });
    local v105 = l_useAppPolicy_0(function(v104) --[[ Line: 211 ]]
        return v104.getDisableResellingCollectiblesForCompliance();
    end);
    local v106 = v2.useRef(false);
    local v107 = l_useNavigationFocus_0();
    v2.useEffect(function() --[[ Line: 223 ]]
        -- upvalues: v77 (copy), v102 (copy)
        if v77.fetchUserRobux and not v102 then
            v77.fetchUserRobux();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 231 ]]
        -- upvalues: v107 (copy), v106 (copy), v77 (copy)
        if v107 and v106.current and v77.fetchUserRobux then
            v77.fetchUserRobux();
            v106.current = false;
        end;
    end, {
        v107, 
        v77.fetchUserRobux
    });
    v2.useLayoutEffect(function() --[[ Line: 240 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v99 (copy), v105 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v80 (copy), l_AvatarScreen_0 (ref), v79 (copy)
        l_shoppingCartStore_0.syncFromTryOns(v99, v105);
        local v108 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v80 and v80.current and v80.current.name else nil;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            if v99 and #v99 <= 0 and v108 == l_AvatarScreen_0.Checkout then
                v79.goBack();
                return;
            end;
        elseif v99 and #v99 <= 0 then
            v79.goBack();
        end;
    end, {
        l_shoppingCartStore_0, 
        v99, 
        v105, 
        v79, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v80 else nil
    });
    local v116 = v2.useMemo(function() --[[ Line: 271 ]]
        -- upvalues: v83 (copy), v10 (ref), l_Constants_0 (ref), v77 (copy), l_FFlagAXDurablesForMIS_0 (ref), l_shoppingCartStore_0 (copy), v82 (copy), v15 (ref)
        local v109 = {};
        for _, v111 in v83 do
            table.insert(v109, v10.Dictionary.join(v111, {
                onActivated = function() --[[ Line: 277 ]] --[[ Name: onActivated ]]
                    -- upvalues: v111 (copy), l_Constants_0 (ref), v77 (ref)
                    if v111.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                        return;
                    else
                        if v77.onOpenItemDetailsPage then
                            v77.onOpenItemDetailsPage(v111.itemId, v111.itemType, v111.itemSubType);
                        end;
                        return;
                    end;
                end, 
                onRemove = function() --[[ Line: 286 ]] --[[ Name: onRemove ]]
                    -- upvalues: v77 (ref), v111 (copy)
                    if v77.onRemoveItem then
                        v77.onRemoveItem(v111.itemId, v111.itemType);
                    end;
                end, 
                onTimedOptionPriceChanged = l_FFlagAXDurablesForMIS_0 and function(v112, v113) --[[ Line: 292 ]]
                    -- upvalues: l_shoppingCartStore_0 (ref), v111 (copy), v10 (ref), v82 (ref), v15 (ref)
                    if l_shoppingCartStore_0.updateItemPrice then
                        if v111.timedOptions then
                            local v115 = v10.List.findWhere(v111.timedOptions, function(v114) --[[ Line: 297 ]]
                                -- upvalues: v113 (copy)
                                return v114.days == v113;
                            end) or #v111.timedOptions;
                            v82(v15({
                                itemId = v111.itemId, 
                                itemType = v111.itemType, 
                                selectedTimedOptionIndex = v115
                            }));
                        end;
                        l_shoppingCartStore_0.updateItemPrice(v111.itemId, v111.itemType, v112, v113);
                    end;
                end or nil
            }));
        end;
        return v109;
    end, {
        v83, 
        v77.onOpenItemDetailsPage, 
        v77.onRemoveItem, 
        if l_FFlagAXDurablesForMIS_0 then l_shoppingCartStore_0 else nil, 
        if l_FFlagAXDurablesForMIS_0 then v82 else nil
    });
    local v119 = v2.useMemo(function() --[[ Line: 332 ]]
        -- upvalues: v80 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), l_AvatarScreen_0 (ref)
        local v117 = v80 and v80.current and v80.current.name;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v118 = true;
            if v117 ~= l_AvatarScreen_0.ExpiredUserLookCheckout then
                v118 = v117 == l_AvatarScreen_0.Checkout;
            end;
            return v118;
        else
            return v117 == l_AvatarScreen_0.Checkout;
        end;
    end, {
        v80
    });
    local v120 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v2.useMemo(function() --[[ Line: 342 ]]
        -- upvalues: v80 (copy), l_AvatarScreen_0 (ref)
        return (v80 and v80.current and v80.current.name) == l_AvatarScreen_0.ExpiredUserLookCheckout;
    end, {
        v80
    }) else nil;
    local v124 = v2.useCallback(function(v121, v122, _) --[[ Line: 348 ]]
        -- upvalues: v77 (copy)
        if v77.onRemoveItem then
            v77.onRemoveItem(v121, v122);
        end;
    end, {
        v77.onRemoveItem, 
        v93, 
        v79
    });
    local v128 = v2.useCallback(function(v125, v126, v127) --[[ Line: 354 ]]
        -- upvalues: v77 (copy)
        if v77.onOpenItemDetailsPage then
            v77.onOpenItemDetailsPage(v125, v126, v127);
        end;
    end, {
        v77.onOpenItemDetailsPage
    });
    local v129 = v2.useCallback(function() --[[ Line: 360 ]]
        -- upvalues: v79 (copy), l_AvatarScreen_0 (ref)
        v79.navigate(l_AvatarScreen_0.CartUnavailableItemsPrompt);
    end, {
        v79
    });
    local v130 = v2.useCallback(function() --[[ Line: 364 ]]
        -- upvalues: v88 (copy), v87 (copy)
        v88(not v87);
    end, {
        v87
    });
    local v131 = v2.useCallback(function() --[[ Line: 368 ]]
        -- upvalues: v90 (copy), v89 (copy)
        v90(not v89);
    end, {
        v89
    });
    local v135 = v2.useCallback(function() --[[ Line: 372 ]]
        -- upvalues: v83 (copy), l_Constants_0 (ref), l_FFlagAXDurablesForMIS_0 (ref)
        local v132 = {};
        for _, v134 in v83 do
            if v134.itemId ~= l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                table.insert(v132, {
                    agreedPriceRobux = v134.priceInRobux, 
                    collectibleProductId = v134.collectibleProductId, 
                    rentalOption = if l_FFlagAXDurablesForMIS_0 and v134.selectedTimedOptionDays and v134.selectedTimedOptionDays > 0 then {
                        durationDays = v134.selectedTimedOptionDays
                    } else nil
                });
            end;
        end;
        return v132;
    end, {
        v83
    });
    local v137 = v2.useCallback(function() --[[ Line: 395 ]]
        -- upvalues: v103 (copy), l_ToastType_0 (ref), v82 (copy), l_SetCurrentToastMessage_0 (ref)
        local v136 = {
            isLocalized = true, 
            toastMessage = v103.characterSavedHeading, 
            toastSubMessage = v103.characterSavedMsg, 
            toastType = l_ToastType_0.SuccessConfirmation
        };
        v82(l_SetCurrentToastMessage_0(v136));
    end, {
        v82, 
        v103
    });
    local v140 = v2.useCallback(function(v138) --[[ Line: 405 ]]
        -- upvalues: v98 (copy), v97 (copy), v82 (copy), v13 (ref), v77 (copy), v137 (copy)
        local v139 = "Avatar";
        if v98 and v98[v97] and v98[v97].name then
            v139 = v98[v97].name;
        end;
        v82(v13(v139, v77.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v138, v137));
    end, {
        v82, 
        v137, 
        v77.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, 
        v98, 
        v97
    });
    local v154 = v2.useCallback(function(v141) --[[ Line: 429 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v77 (copy), v82 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), l_getTryOnItemReducerKey_0 (ref), v93 (copy), v89 (copy), v140 (copy), v87 (copy), v22 (ref), v12 (ref), v100 (copy), v94 (copy), v95 (copy), v96 (copy)
        local v142 = l_shoppingCartStore_0.updateCartFromPurchaseResponse(v141);
        local l_boughtItems_0 = v142.boughtItems;
        local l_equippableItems_0 = v142.equippableItems;
        for _, v146 in v142.needDataRefeshItems do
            if v77.fetchItemData then
                v77.fetchItemData(v146.itemId, v146.itemType);
            end;
        end;
        v82(l_SetCurrentToastMessage_0({
            toastMessage = ("%* Items Purchased"):format(#l_boughtItems_0), 
            isLocalized = true, 
            toastType = l_ToastType_0.InformationMessage
        }));
        local v147 = {};
        for _, v149 in l_equippableItems_0 do
            local v150 = v93[l_getTryOnItemReducerKey_0(v149.itemId, v149.itemType)];
            if v150 then
                table.insert(v147, v150);
            end;
        end;
        if v89 then
            v140(v147);
        end;
        for _, v152 in l_equippableItems_0 do
            if v77.onRemoveItem then
                v77.onRemoveItem(v152.itemId, v152.itemType);
            end;
        end;
        local v153 = {};
        if v87 then
            v153 = v22(v147);
        end;
        v82(v12(l_boughtItems_0, v153, v100, v94, v95, v96, v147, v77.getBundleOutfitInfoFromProvidedTryOns));
    end, {
        l_shoppingCartStore_0.updateCartFromPurchaseResponse, 
        v77.onRemoveItem, 
        v87, 
        v89, 
        v94, 
        v95, 
        v96, 
        v93, 
        v100
    });
    local v155 = v2.useCallback(function() --[[ Line: 502 ]]
        -- upvalues: v79 (copy), l_AvatarScreen_0 (ref), v106 (copy)
        v79.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt);
        v106.current = true;
    end, {
        v79
    });
    local v160 = v2.useCallback(function() --[[ Line: 509 ]]
        -- upvalues: v92 (copy), v20 (ref), v81 (copy), v101 (copy), v97 (copy), v135 (copy), v21 (ref), v154 (copy), v77 (copy), v25 (ref), v155 (copy), v79 (copy), l_AvatarScreen_0 (ref), v83 (copy), v103 (copy)
        v92(true);
        v20({
            networkImpl = v81, 
            userId = v101, 
            lookId = v97, 
            lineItems = v135()
        }):andThen(function(v156) --[[ Line: 517 ]]
            -- upvalues: v21 (ref), v154 (ref), v77 (ref)
            if v156.isJSONValid and v156.responseCode == 200 then
                local l_responseBody_0 = v156.responseBody;
                local v158 = v21(l_responseBody_0);
                v154(v158);
                if v77.fetchUserRobux then
                    v77.fetchUserRobux();
                end;
            end;
        end):catch(function(v159) --[[ Line: 528 ]]
            -- upvalues: v25 (ref), v155 (ref), v79 (ref), l_AvatarScreen_0 (ref), v83 (ref), v103 (ref)
            if v25(v159) then
                v155();
                return;
            else
                v79.navigate(l_AvatarScreen_0.GenericPrompt, {
                    titleText = if #v83 == 1 then v103.purchaseFailedTitle else v103.purchaseFailedTitlePlural, 
                    bodyText = v103.purchaseFailedUnknownError, 
                    buttonText = v103.purchaseFailedButton
                });
                return;
            end;
        end):finally(function() --[[ Line: 541 ]]
            -- upvalues: v92 (ref)
            v92(false);
        end);
    end, {
        v135, 
        v101, 
        v81, 
        v155, 
        v77.fetchUserRobux, 
        v154, 
        v83, 
        v103, 
        v79, 
        v97
    });
    local v161 = v2.useCallback(function() --[[ Line: 559 ]]
        -- upvalues: v102 (copy), v85 (copy), v155 (copy), v160 (copy)
        if v102 and v102 < v85 then
            v155();
            return;
        else
            v160();
            return;
        end;
    end, {
        v102, 
        v85, 
        v160, 
        v155
    });
    return {
        canPurchase = v84, 
        cartItems = v116, 
        erroredItemCount = v86, 
        isPurchasing = v91, 
        isVisible = v119, 
        hideBuyOptions = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v120 else nil, 
        isWearAfterPurchaseChecked = v87, 
        isAddToMyAvatarsChecked = v89, 
        onCheckoutButtonActivated = v161, 
        onOpenItemDetailsPage = v128, 
        onRemoveItem = v124, 
        onUnavailableButtonActivated = v129, 
        onWearAfterPurchaseToggle = v130, 
        onAddToMyAvatarsToggle = v131, 
        purchasableItemsTotalPriceInRobux = v85
    };
end;