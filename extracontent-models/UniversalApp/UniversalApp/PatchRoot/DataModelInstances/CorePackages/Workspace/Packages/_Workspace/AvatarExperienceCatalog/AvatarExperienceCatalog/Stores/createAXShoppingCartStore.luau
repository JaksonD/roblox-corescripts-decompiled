local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.tutils);
local v4 = require(l_Parent_0.AvatarExperienceCommon);
local v5 = require(l_script_FirstAncestor_0.Enums.PurchaseItemsErrorStatusMap);
local v6 = require(l_Parent_0.Cryo);
local l_ItemTileEnums_0 = require(l_Parent_0.UIBlox).Tile.ItemTileEnums;
local _ = require(l_script_FirstAncestor_0.Requests.PurchaseItems.PurchaseItemsTypes);
local l_getTryOnItemReducerKey_0 = v4.Utils.getTryOnItemReducerKey;
local l_Constants_0 = v4.Constants;
local l_FFlagAXDurablesForMIS_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesForMIS;
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local l_getItemPurchaseActionType_0 = v4.Utils.getItemPurchaseActionType;
local l_ItemPurchaseActionTypeEnum_0 = v4.Enums.ItemPurchaseActionTypeEnum;
local function _(v16) --[[ Line: 24 ]] --[[ Name: getItemRestrictionFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v17 = if v16 then v16.tileRestrictionsMap else nil;
    if v17 then
        if v17[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v17[l_ItemTileEnums_0.Restriction.LimitedUnique] or v17[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local v19 = {
    UNKNOWN = "UNKNOWN", 
    PENDING = "PENDING", 
    RESERVED = "RESERVED", 
    SUCCEEDED = "SUCCEEDED", 
    FAILED = "FAILED"
};
local function v44(v20, v21) --[[ Line: 105 ]] --[[ Name: getItemCartData ]]
    -- upvalues: l_Constants_0 (copy), v5 (copy), v3 (copy), l_getItemPurchaseActionType_0 (copy), l_ItemPurchaseActionTypeEnum_0 (copy), l_FFlagAXDurablesForMIS_0 (copy), l_ItemTileEnums_0 (copy)
    if v20.itemId == l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
        return {
            itemId = v20.itemId, 
            itemType = v20.itemType, 
            itemSubType = "1", 
            ordering = v20.ordering, 
            creatorName = "Roblox", 
            creatorVerified = true, 
            collectibleProductId = v20.itemId, 
            status = v5.ALREADY_OWNED, 
            priceInRobux = 0, 
            name = "Default Body"
        };
    else
        local l_itemData_0 = v20.itemData;
        local l_collectibleItemId_0 = v20.collectibleItemId;
        local l_collectibleItemInfo_0 = v20.collectibleItemInfo;
        local l_resellableInstances_0 = v20.resellableInstances;
        local v26 = if l_resellableInstances_0 then v3.fieldCount(l_resellableInstances_0) else 0;
        local v27 = not (v21 and l_collectibleItemId_0);
        local v28 = l_getItemPurchaseActionType_0(l_itemData_0, l_collectibleItemInfo_0, v26, v27);
        local v29 = v28 == l_ItemPurchaseActionTypeEnum_0.PurchaseFromResale;
        local v30 = if v29 then l_itemData_0.lowestResalePrice else l_itemData_0.priceInRobux;
        local v31 = if l_collectibleItemInfo_0 then if v29 then l_collectibleItemInfo_0.lowestAvailableResaleProductId else l_collectibleItemInfo_0.collectibleProductId else nil;
        local v32 = if v20.itemType == Enum.AvatarItemType.Asset.Name then l_itemData_0.assetType else l_itemData_0.bundleType;
        local v33 = l_itemData_0.creator or {};
        local l_name_0 = v33.name;
        local l_hasVerifiedBadge_0 = v33.hasVerifiedBadge;
        local l_name_1 = l_itemData_0.name;
        local v37 = nil;
        if v28 == l_ItemPurchaseActionTypeEnum_0.SoldOut then
            v37 = v5.SOLD_OUT;
        elseif v28 == l_ItemPurchaseActionTypeEnum_0.CustomizeLink then
            v37 = v5.ALREADY_OWNED;
        elseif v28 == l_ItemPurchaseActionTypeEnum_0.ExperienceLink then
            v37 = v5.EXPERIENCE_LINK;
        elseif v28 == l_ItemPurchaseActionTypeEnum_0.Disabled then
            v37 = v5.NOT_FOR_SALE;
        end;
        local v38 = nil;
        if l_FFlagAXDurablesForMIS_0 and l_itemData_0.timedOptions then
            if v20.selectedTimedOptionIndex ~= nil then
                local v39 = l_itemData_0.timedOptions[v20.selectedTimedOptionIndex];
                if v39 then
                    v38 = v39.days;
                    v30 = v39.price;
                end;
            else
                for _, v41 in l_itemData_0.timedOptions do
                    if v41.selected then
                        v38 = v41.days;
                        v30 = v41.price;
                        break;
                    end;
                end;
            end;
        end;
        local v42 = {
            itemId = v20.itemId, 
            itemType = v20.itemType, 
            itemSubType = v32
        };
        local v43 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v42.itemRestriction = if v43 then v43[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v43[l_ItemTileEnums_0.Restriction.LimitedUnique] or v43[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
        v42.ordering = v20.ordering;
        v42.creatorName = l_name_0;
        v42.creatorVerified = l_hasVerifiedBadge_0;
        v42.collectibleProductId = v31;
        v42.status = v37;
        v42.priceInRobux = v30;
        v42.name = l_name_1;
        v42.timedOptions = if l_FFlagAXDurablesForMIS_0 then l_itemData_0.timedOptions else nil;
        v42.selectedTimedOptionDays = if l_FFlagAXDurablesForMIS_0 then v38 else nil;
        v42.selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v20.selectedTimedOptionIndex else nil;
        return v42;
    end;
end;
local _ = function(v45, v46) --[[ Line: 202 ]] --[[ Name: areCartItemsDifferent ]]
    -- upvalues: v3 (copy)
    if v3.fieldCount(v45) ~= v3.fieldCount(v46) then
        return true;
    else
        for v47, _ in v46 do
            if v45[v47] == nil then
                return true;
            end;
        end;
        return false;
    end;
end;
return function() --[[ Line: 217 ]] --[[ Name: createAXShoppingCartStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), v5 (copy), v3 (copy), l_getTryOnItemReducerKey_0 (copy), v44 (copy), v6 (copy), v19 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local v50, v51 = l_createSignal_0({});
    local v52, v53 = l_createSignal_0(0);
    local v55 = l_createComputed_0(function(v54) --[[ Line: 221 ]]
        -- upvalues: v52 (copy)
        return v52(v54);
    end);
    local v63 = l_createComputed_0(function(v56) --[[ Line: 225 ]]
        -- upvalues: v50 (copy), v5 (ref)
        local v57 = v50(v56);
        local v58 = {};
        for _, v60 in v57 do
            table.insert(v58, v60);
        end;
        table.sort(v58, function(v61, v62) --[[ Line: 234 ]]
            -- upvalues: v5 (ref)
            if v61.status == v5.ALREADY_OWNED and v62.status ~= v5.ALREADY_OWNED then
                return false;
            elseif v62.status == v5.ALREADY_OWNED and v61.status ~= v5.ALREADY_OWNED then
                return true;
            else
                return v61.ordering > v62.ordering;
            end;
        end);
        return v58;
    end, v3.deepEqual);
    local v69 = l_createComputed_0(function(v64) --[[ Line: 252 ]]
        -- upvalues: v50 (copy), v5 (ref), v3 (ref)
        local v65 = v50(v64);
        local v66 = 0;
        for _, v68 in v65 do
            if v68.status == v5.ALREADY_OWNED then
                v66 = v66 + 1;
            end;
            if v68.status ~= nil and v68.status ~= v5.ALREADY_OWNED and v68.status ~= v5.PRICE_MISMATCH then
                return false;
            end;
        end;
        if v66 == v3.fieldCount(v65) then
            return false;
        else
            return true;
        end;
    end);
    local v75 = l_createComputed_0(function(v70) --[[ Line: 286 ]]
        -- upvalues: v50 (copy), v5 (ref)
        local v71 = v50(v70);
        local v72 = 0;
        for _, v74 in v71 do
            if v74.status ~= v5.ALREADY_OWNED then
                v72 = v72 + v74.priceInRobux;
            end;
        end;
        return v72;
    end);
    local function v89(v76, v77) --[[ Line: 299 ]] --[[ Name: syncFromTryOns ]]
        -- upvalues: v50 (copy), l_getTryOnItemReducerKey_0 (ref), v44 (ref), v6 (ref), v3 (ref), v51 (copy), v53 (copy)
        local v78 = false;
        local v79 = v50(false);
        local v80 = {};
        for _, v82 in v76 do
            local v83 = l_getTryOnItemReducerKey_0(v82.itemId, v82.itemType);
            local v84 = v79[v83];
            local v85 = v44(v82, v77);
            v80[v83] = if v84 then v6.Dictionary.join(v84, v85) else v85;
        end;
        if not v3.deepEqual(v79, v80) then
            v51(v80);
        end;
        local v86;
        if v3.fieldCount(v79) ~= v3.fieldCount(v80) then
            v86 = true;
        else
            for v87, _ in v80 do
                if v79[v87] == nil then
                    v86 = true;
                    v78 = true;
                end;
                if v78 then
                    break;
                end;
            end;
            if not v78 then
                v86 = false;
            end;
        end;
        v78 = false;
        if v86 then
            v53(0);
        end;
    end;
    local function v104(v90) --[[ Line: 321 ]] --[[ Name: updateCartFromPurchaseResponse ]]
        -- upvalues: v50 (copy), v5 (ref), v19 (ref), v6 (ref), v51 (copy), v53 (copy)
        local v91 = v50(false);
        local v92 = {};
        local v93 = {};
        local v94 = {};
        local v95 = {};
        local v96 = 0;
        local l_lineItems_0 = v90.lineItems;
        for v98, v99 in v91 do
            local v100 = l_lineItems_0[v98];
            local v101 = v99.status == v5.ALREADY_OWNED;
            if v100 and v100.status ~= v19.SUCCEEDED and not v101 then
                local v102 = v5[v100.errorReason] or v5.UNKNOWN;
                local v103 = nil;
                if v102 == v5.PRICE_MISMATCH then
                    v103 = {
                        oldPriceInRobux = v99.priceInRobux
                    };
                    table.insert(v95, v99);
                end;
                v92[v98] = v6.Dictionary.join(v99, {
                    status = v102, 
                    priceMismatchMetadata = v103
                });
                v96 = v96 + 1;
            else
                table.insert(v94, v99);
                if not v101 then
                    table.insert(v93, v99);
                end;
            end;
        end;
        v51(v92);
        v53(v96);
        return {
            boughtItems = v93, 
            equippableItems = v94, 
            needDataRefeshItems = v95
        };
    end;
    local function v112(v105, v106, v107, v108) --[[ Line: 371 ]] --[[ Name: updateItemPrice ]]
        -- upvalues: l_FFlagAXDurablesForMIS_0 (ref), v50 (copy), l_getTryOnItemReducerKey_0 (ref), v51 (copy), v6 (ref)
        if not l_FFlagAXDurablesForMIS_0 then
            return;
        else
            local v109 = v50(false);
            local v110 = l_getTryOnItemReducerKey_0(v105, v106);
            local v111 = v109[v110];
            if v111 and (v111.priceInRobux ~= v107 or v111.selectedTimedOptionDays ~= v108) then
                v51(v6.Dictionary.join(v109, {
                    [v110] = v6.Dictionary.join(v111, {
                        priceInRobux = v107, 
                        selectedTimedOptionDays = if v108 == nil then v6.None else v108
                    })
                }));
            end;
            return;
        end;
    end;
    return {
        getCanPurchase = v69, 
        getErroredItemCount = v55, 
        getItems = v63, 
        getPurchasableItemsTotalPriceInRobux = v75, 
        syncFromTryOns = v89, 
        updateCartFromPurchaseResponse = v104, 
        updateItemPrice = if l_FFlagAXDurablesForMIS_0 then v112 else nil
    };
end;