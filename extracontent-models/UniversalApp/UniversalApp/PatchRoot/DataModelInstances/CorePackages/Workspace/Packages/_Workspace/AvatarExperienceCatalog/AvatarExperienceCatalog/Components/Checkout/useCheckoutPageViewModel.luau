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
local v14 = require(l_script_FirstAncestor_0.State.Thunks.SaveAsMakeupLookThunk);
local l_SetCurrentToastMessage_0 = v9.Actions.SetCurrentToastMessage;
local v16 = require(l_script_FirstAncestor_0.State.Actions.SetSelectedTimedOption);
local l_Constants_0 = v8.Constants;
local _ = require(l_script_FirstAncestor_0.Requests.PurchaseItems.PurchaseItemsTypes);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_ToastType_0 = v9.Enums.ToastType;
local v21 = require(l_script_FirstAncestor_0.Requests.PurchaseItems);
local l_avatarLastEquippedStateStore_0 = v8.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v23 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.mapPurchaseItemsResponse);
local v24 = require(l_script_FirstAncestor_0.Utils.TryOns.getEquippableAssetsFromTryOnItems);
local v25 = require(l_script_FirstAncestor_0.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes);
local l_getTryOnItemReducerKey_0 = v8.Utils.getTryOnItemReducerKey;
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
local v28 = require(l_script_FirstAncestor_0.Requests.PurchaseItems.getIsInsufficientRobuxError);
local v29 = require(l_script_FirstAncestor_0.Context.useAXCatalogStoreContext);
local l_useSignalState_0 = v6.useSignalState;
local l_useNetworking_0 = v8.Hooks.useNetworking;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v39 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXDurablesForMIS_0 = v39.FFlagAXDurablesForMIS;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v39.FFlagAXEnableExpiredUserLookCheckout;
local l_FFlagAXCatalogMakeupSupport_0 = v39.FFlagAXCatalogMakeupSupport;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v39.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local function v45(v44) --[[ Line: 58 ]] --[[ Name: selectTryOnLookId ]]
    return v44.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local v46 = nil;
if l_FFlagAXCatalogMakeupSupport_0 then
    v46 = function(v47) --[[ Line: 64 ]]
        return v47.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId;
    end;
end;
local function v49(v48) --[[ Line: 69 ]] --[[ Name: selectAvatarSceneLooks ]]
    return v48.AvatarExperience.AvatarScene.Looks;
end;
local function v51(v50) --[[ Line: 73 ]] --[[ Name: selectTryOnItems ]]
    return v50.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v53(v52) --[[ Line: 77 ]] --[[ Name: selectTryOnBodyColor3s ]]
    return v52.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s;
end;
local function v55(v54) --[[ Line: 81 ]] --[[ Name: selectTryOnBodyScales ]]
    return v54.AvatarExperience.AvatarScene.OutfitTryOn.Scale;
end;
local function v57(v56) --[[ Line: 85 ]] --[[ Name: selectTryOnBodyPartColorRangeIds ]]
    return v56.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds;
end;
local function _(v58) --[[ Line: 89 ]] --[[ Name: selectAssetInfos ]]
    return v58.AvatarExperience.Common.AssetInfos or {};
end;
local function _(v60) --[[ Line: 93 ]] --[[ Name: selectBundleInfos ]]
    return v60.AvatarExperience.Common.BundleInfos or {};
end;
local function _(v62) --[[ Line: 97 ]] --[[ Name: selectCollectibles ]]
    return v62.AvatarExperience.Common.Collectibles or {};
end;
local function v65(v64) --[[ Line: 101 ]] --[[ Name: selectLocalUserId ]]
    return v64.LocalUserId;
end;
local function v67(v66) --[[ Line: 105 ]] --[[ Name: selectShouldTryOnWithoutEquippedItems ]]
    return v66.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems;
end;
local function v70(v68) --[[ Line: 109 ]] --[[ Name: selectUserRobux ]]
    local l_LocalUserId_0 = v68.LocalUserId;
    if not l_LocalUserId_0 or not v68.UserRobux then
        return nil;
    else
        return v68.UserRobux[l_LocalUserId_0];
    end;
end;
local function v83(v71) --[[ Line: 121 ]] --[[ Name: selectItemInfoForTryOnItems ]]
    -- upvalues: l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local l_TryOnItems_0 = v71.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v73 = v71.AvatarExperience.Common.AssetInfos or {};
    local v74 = v71.AvatarExperience.Common.BundleInfos or {};
    local v75 = v71.AvatarExperience.Common.Collectibles or {};
    local v76 = {};
    for _, v78 in l_TryOnItems_0 do
        if v78.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
            table.insert(v76, {
                itemId = v78.itemId, 
                itemType = v78.itemType, 
                itemData = v78.itemData, 
                collectibleItemId = v78.itemId, 
                ordering = v78.itemRecency
            });
        else
            local v79 = if v78.itemType == Enum.AvatarItemType.Asset.Name then v73[v78.itemId] else v74[v78.itemId];
            local v80 = if v79 then v79.collectibleItemId else nil;
            local v81 = if v80 and v75.CollectiblesItemInfo then v75.CollectiblesItemInfo[v80] else nil;
            if v79 and v80 and v81 then
                local v82 = if v75.CollectiblesResellableInstances then v75.CollectiblesResellableInstances[v80] else nil;
                table.insert(v76, {
                    itemId = v78.itemId, 
                    itemType = v78.itemType, 
                    itemData = v79, 
                    collectibleItemId = v80, 
                    ordering = v78.itemRecency, 
                    collectibleItemInfo = v81, 
                    resellableInstances = v82, 
                    selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v78.selectedTimedOptionIndex else nil
                });
            end;
        end;
    end;
    return v76;
end;
return function(v84) --[[ Line: 186 ]] --[[ Name: useCheckoutPageViewModel ]]
    -- upvalues: v29 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useNetworking_0 (copy), l_useDispatch_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_useSelector_0 (copy), v51 (copy), v3 (copy), v53 (copy), v55 (copy), v57 (copy), v45 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v46 (ref), v49 (copy), v83 (copy), v67 (copy), v65 (copy), v70 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), l_useNavigationFocus_0 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_Constants_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), v16 (copy), l_ToastType_0 (copy), l_SetCurrentToastMessage_0 (copy), v25 (copy), v14 (copy), v13 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v24 (copy), v12 (copy), v21 (copy), v23 (copy), v28 (copy)
    local l_shoppingCartStore_0 = v29().shoppingCartStore;
    local v86 = l_useNavigation_0();
    local v87 = l_useAvatarRoute_0();
    local v88 = l_useNetworking_0();
    local v89 = l_useDispatch_0();
    local v90 = l_useSignalState_0(l_shoppingCartStore_0.getItems);
    local v91 = l_useSignalState_0(l_shoppingCartStore_0.getCanPurchase);
    local v92 = l_useSignalState_0(l_shoppingCartStore_0.getPurchasableItemsTotalPriceInRobux);
    local v93 = l_useSignalState_0(l_shoppingCartStore_0.getErroredItemCount);
    local v94, v95 = v2.useState(true);
    local v96, v97 = v2.useState(false);
    local v98, v99 = v2.useState(false);
    local v100 = l_useSelector_0(v51, v3.deepEqual);
    local v101 = l_useSelector_0(v53, v3.deepEqual);
    local v102 = l_useSelector_0(v55, v3.deepEqual);
    local v103 = l_useSelector_0(v57, v3.deepEqual);
    local v104 = l_useSelector_0(v45);
    local v105 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v46) else nil;
    local v106 = l_useSelector_0(v49, v3.deepEqual);
    local v107 = l_useSelector_0(v83, v3.deepEqual);
    local v108 = l_useSelector_0(v67);
    local v109 = l_useSelector_0(v65);
    local v110 = l_useSelector_0(v70);
    local v111 = l_useLocalization_0({
        purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular", 
        purchaseFailedTitlePlural = {
            "Feature.Catalog.Title.Checkout.PurchaseFailedPlural"; 
            count = #v90
        }, 
        purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        purchaseFailedButton = "Feature.Avatar.Action.GotIt", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved"
    });
    local v113 = l_useAppPolicy_0(function(v112) --[[ Line: 227 ]]
        return v112.getDisableResellingCollectiblesForCompliance();
    end);
    local v114 = v2.useRef(false);
    local v115 = l_useNavigationFocus_0();
    v2.useEffect(function() --[[ Line: 239 ]]
        -- upvalues: v84 (copy), v110 (copy)
        if v84.fetchUserRobux and not v110 then
            v84.fetchUserRobux();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 247 ]]
        -- upvalues: v115 (copy), v114 (copy), v84 (copy)
        if v115 and v114.current and v84.fetchUserRobux then
            v84.fetchUserRobux();
            v114.current = false;
        end;
    end, {
        v115, 
        v84.fetchUserRobux
    });
    v2.useLayoutEffect(function() --[[ Line: 256 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v107 (copy), v113 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), v87 (copy), l_AvatarScreen_0 (ref), v86 (copy)
        l_shoppingCartStore_0.syncFromTryOns(v107, v113);
        local v116 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v87 and v87.current and v87.current.name else nil;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            if v107 and #v107 <= 0 and v116 == l_AvatarScreen_0.Checkout then
                v86.goBack();
                return;
            end;
        elseif v107 and #v107 <= 0 then
            v86.goBack();
        end;
    end, {
        l_shoppingCartStore_0, 
        v107, 
        v113, 
        v86, 
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then v87 else nil
    });
    local v124 = v2.useMemo(function() --[[ Line: 287 ]]
        -- upvalues: v90 (copy), v10 (ref), l_Constants_0 (ref), v84 (copy), l_FFlagAXDurablesForMIS_0 (ref), l_shoppingCartStore_0 (copy), v89 (copy), v16 (ref)
        local v117 = {};
        for _, v119 in v90 do
            table.insert(v117, v10.Dictionary.join(v119, {
                onActivated = function() --[[ Line: 293 ]] --[[ Name: onActivated ]]
                    -- upvalues: v119 (copy), l_Constants_0 (ref), v84 (ref)
                    if v119.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                        return;
                    else
                        if v84.onOpenItemDetailsPage then
                            v84.onOpenItemDetailsPage(v119.itemId, v119.itemType, v119.itemSubType);
                        end;
                        return;
                    end;
                end, 
                onRemove = function() --[[ Line: 302 ]] --[[ Name: onRemove ]]
                    -- upvalues: v84 (ref), v119 (copy)
                    if v84.onRemoveItem then
                        v84.onRemoveItem(v119.itemId, v119.itemType);
                    end;
                end, 
                onTimedOptionPriceChanged = l_FFlagAXDurablesForMIS_0 and function(v120, v121) --[[ Line: 308 ]]
                    -- upvalues: l_shoppingCartStore_0 (ref), v119 (copy), v10 (ref), v89 (ref), v16 (ref)
                    if l_shoppingCartStore_0.updateItemPrice then
                        if v119.timedOptions then
                            local v123 = v10.List.findWhere(v119.timedOptions, function(v122) --[[ Line: 313 ]]
                                -- upvalues: v121 (copy)
                                return v122.days == v121;
                            end) or #v119.timedOptions;
                            v89(v16({
                                itemId = v119.itemId, 
                                itemType = v119.itemType, 
                                selectedTimedOptionIndex = v123
                            }));
                        end;
                        l_shoppingCartStore_0.updateItemPrice(v119.itemId, v119.itemType, v120, v121);
                    end;
                end or nil
            }));
        end;
        return v117;
    end, {
        v90, 
        v84.onOpenItemDetailsPage, 
        v84.onRemoveItem, 
        if l_FFlagAXDurablesForMIS_0 then l_shoppingCartStore_0 else nil, 
        if l_FFlagAXDurablesForMIS_0 then v89 else nil
    });
    local v127 = v2.useMemo(function() --[[ Line: 348 ]]
        -- upvalues: v87 (copy), l_FFlagAXEnableExpiredUserLookCheckout_0 (ref), l_AvatarScreen_0 (ref)
        local v125 = v87 and v87.current and v87.current.name;
        if l_FFlagAXEnableExpiredUserLookCheckout_0 then
            local v126 = true;
            if v125 ~= l_AvatarScreen_0.ExpiredUserLookCheckout then
                v126 = v125 == l_AvatarScreen_0.Checkout;
            end;
            return v126;
        else
            return v125 == l_AvatarScreen_0.Checkout;
        end;
    end, {
        v87
    });
    local v128 = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v2.useMemo(function() --[[ Line: 358 ]]
        -- upvalues: v87 (copy), l_AvatarScreen_0 (ref)
        return (v87 and v87.current and v87.current.name) == l_AvatarScreen_0.ExpiredUserLookCheckout;
    end, {
        v87
    }) else nil;
    local v132 = v2.useCallback(function(v129, v130, _) --[[ Line: 364 ]]
        -- upvalues: v84 (copy)
        if v84.onRemoveItem then
            v84.onRemoveItem(v129, v130);
        end;
    end, {
        v84.onRemoveItem, 
        v100, 
        v86
    });
    local v136 = v2.useCallback(function(v133, v134, v135) --[[ Line: 370 ]]
        -- upvalues: v84 (copy)
        if v84.onOpenItemDetailsPage then
            v84.onOpenItemDetailsPage(v133, v134, v135);
        end;
    end, {
        v84.onOpenItemDetailsPage
    });
    local v137 = v2.useCallback(function() --[[ Line: 376 ]]
        -- upvalues: v86 (copy), l_AvatarScreen_0 (ref)
        v86.navigate(l_AvatarScreen_0.CartUnavailableItemsPrompt);
    end, {
        v86
    });
    local v138 = v2.useCallback(function() --[[ Line: 380 ]]
        -- upvalues: v95 (copy), v94 (copy)
        v95(not v94);
    end, {
        v94
    });
    local v139 = v2.useCallback(function() --[[ Line: 384 ]]
        -- upvalues: v97 (copy), v96 (copy)
        v97(not v96);
    end, {
        v96
    });
    local v143 = v2.useCallback(function() --[[ Line: 388 ]]
        -- upvalues: v90 (copy), l_Constants_0 (ref), l_FFlagAXDurablesForMIS_0 (ref)
        local v140 = {};
        for _, v142 in v90 do
            if v142.itemId ~= l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
                table.insert(v140, {
                    agreedPriceRobux = v142.priceInRobux, 
                    collectibleProductId = v142.collectibleProductId, 
                    rentalOption = if l_FFlagAXDurablesForMIS_0 and v142.selectedTimedOptionDays and v142.selectedTimedOptionDays > 0 then {
                        durationDays = v142.selectedTimedOptionDays
                    } else nil
                });
            end;
        end;
        return v140;
    end, {
        v90
    });
    local v145 = v2.useCallback(function() --[[ Line: 411 ]]
        -- upvalues: v111 (copy), l_ToastType_0 (ref), v89 (copy), l_SetCurrentToastMessage_0 (ref)
        local v144 = {
            isLocalized = true, 
            toastMessage = v111.characterSavedHeading, 
            toastSubMessage = v111.characterSavedMsg, 
            toastType = l_ToastType_0.SuccessConfirmation
        };
        v89(l_SetCurrentToastMessage_0(v144));
    end, {
        v89, 
        v111
    });
    local v150 = v2.useCallback(function(v146) --[[ Line: 421 ]]
        -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (ref), v25 (ref), v106 (copy), v105 (copy), v104 (copy), v89 (copy), v14 (ref), v88 (copy), v13 (ref), v84 (copy), v145 (copy)
        if l_FFlagAXCatalogMakeupSupport_0 then
            local v147 = v25(v146);
            local v148 = v147 and "Makeup" or "Avatar";
            if v106 and v106[v105] and v106[v105].name then
                v148 = v106[v105].name;
            end;
            if v106 and v106[v104] and v106[v104].name then
                v148 = v106[v104].name;
            end;
            if v147 then
                v89(v14(v88, v148, v146));
                return;
            else
                v89(v13(v148, v84.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v146, v145));
                return;
            end;
        else
            local v149 = "Avatar";
            if v106 and v106[v104] and v106[v104].name then
                v149 = v106[v104].name;
            end;
            v89(v13(v149, v84.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, v146, v145));
            return;
        end;
    end, {
        v89, 
        v145, 
        v84.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, 
        v106, 
        v104, 
        if l_FFlagAXCatalogMakeupSupport_0 then v88 else nil, 
        if l_FFlagAXCatalogMakeupSupport_0 then v105 else nil
    });
    local v164 = v2.useCallback(function(v151) --[[ Line: 474 ]]
        -- upvalues: l_shoppingCartStore_0 (copy), v84 (copy), v89 (copy), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), l_getTryOnItemReducerKey_0 (ref), v100 (copy), v96 (copy), v150 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), v94 (copy), v24 (ref), v12 (ref), v108 (copy), v101 (copy), v102 (copy), v103 (copy)
        local v152 = l_shoppingCartStore_0.updateCartFromPurchaseResponse(v151);
        local l_boughtItems_0 = v152.boughtItems;
        local l_equippableItems_0 = v152.equippableItems;
        for _, v156 in v152.needDataRefeshItems do
            if v84.fetchItemData then
                v84.fetchItemData(v156.itemId, v156.itemType);
            end;
        end;
        v89(l_SetCurrentToastMessage_0({
            toastMessage = ("%* Items Purchased"):format(#l_boughtItems_0), 
            isLocalized = true, 
            toastType = l_ToastType_0.InformationMessage
        }));
        local v157 = {};
        for _, v159 in l_equippableItems_0 do
            local v160 = v100[l_getTryOnItemReducerKey_0(v159.itemId, v159.itemType)];
            if v160 then
                table.insert(v157, v160);
            end;
        end;
        if v96 then
            v150(v157);
        end;
        for _, v162 in l_equippableItems_0 do
            if v84.onRemoveItem then
                v84.onRemoveItem(v162.itemId, v162.itemType);
            end;
        end;
        local v163 = {};
        if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
            l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
        end;
        if v94 then
            v163 = v24(v157);
        end;
        v89(v12(l_boughtItems_0, v163, v108, v101, v102, v103, v157, v84.getBundleOutfitInfoFromProvidedTryOns));
    end, {
        l_shoppingCartStore_0.updateCartFromPurchaseResponse, 
        v84.onRemoveItem, 
        v94, 
        v96, 
        v101, 
        v102, 
        v103, 
        v100, 
        v108
    });
    local v165 = v2.useCallback(function() --[[ Line: 553 ]]
        -- upvalues: v86 (copy), l_AvatarScreen_0 (ref), v114 (copy)
        v86.navigate(l_AvatarScreen_0.InsufficientRobuxPrompt);
        v114.current = true;
    end, {
        v86
    });
    local v170 = v2.useCallback(function() --[[ Line: 560 ]]
        -- upvalues: v99 (copy), v21 (ref), v88 (copy), v109 (copy), v104 (copy), v143 (copy), v23 (ref), v164 (copy), v84 (copy), v28 (ref), v165 (copy), v86 (copy), l_AvatarScreen_0 (ref), v90 (copy), v111 (copy)
        v99(true);
        v21({
            networkImpl = v88, 
            userId = v109, 
            lookId = v104, 
            lineItems = v143()
        }):andThen(function(v166) --[[ Line: 568 ]]
            -- upvalues: v23 (ref), v164 (ref), v84 (ref)
            if v166.isJSONValid and v166.responseCode == 200 then
                local l_responseBody_0 = v166.responseBody;
                local v168 = v23(l_responseBody_0);
                v164(v168);
                if v84.fetchUserRobux then
                    v84.fetchUserRobux();
                end;
            end;
        end):catch(function(v169) --[[ Line: 579 ]]
            -- upvalues: v28 (ref), v165 (ref), v86 (ref), l_AvatarScreen_0 (ref), v90 (ref), v111 (ref)
            if v28(v169) then
                v165();
                return;
            else
                v86.navigate(l_AvatarScreen_0.GenericPrompt, {
                    titleText = if #v90 == 1 then v111.purchaseFailedTitle else v111.purchaseFailedTitlePlural, 
                    bodyText = v111.purchaseFailedUnknownError, 
                    buttonText = v111.purchaseFailedButton
                });
                return;
            end;
        end):finally(function() --[[ Line: 592 ]]
            -- upvalues: v99 (ref)
            v99(false);
        end);
    end, {
        v143, 
        v109, 
        v88, 
        v165, 
        v84.fetchUserRobux, 
        v164, 
        v90, 
        v111, 
        v86, 
        v104
    });
    local v171 = v2.useCallback(function() --[[ Line: 610 ]]
        -- upvalues: v110 (copy), v92 (copy), v165 (copy), v170 (copy)
        if v110 and v110 < v92 then
            v165();
            return;
        else
            v170();
            return;
        end;
    end, {
        v110, 
        v92, 
        v170, 
        v165
    });
    return {
        canPurchase = v91, 
        cartItems = v124, 
        erroredItemCount = v93, 
        isPurchasing = v98, 
        isVisible = v127, 
        hideBuyOptions = if l_FFlagAXEnableExpiredUserLookCheckout_0 then v128 else nil, 
        isWearAfterPurchaseChecked = v94, 
        isAddToMyAvatarsChecked = v96, 
        onCheckoutButtonActivated = v171, 
        onOpenItemDetailsPage = v136, 
        onRemoveItem = v132, 
        onUnavailableButtonActivated = v137, 
        onWearAfterPurchaseToggle = v138, 
        onAddToMyAvatarsToggle = v139, 
        purchasableItemsTotalPriceInRobux = v92
    };
end;