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
local function v43(v20, v21) --[[ Line: 104 ]] --[[ Name: getItemCartData ]]
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
            for _, v40 in l_itemData_0.timedOptions do
                if v40.selected then
                    v38 = v40.days;
                    v30 = v40.price;
                    break;
                end;
            end;
        end;
        local v41 = {
            itemId = v20.itemId, 
            itemType = v20.itemType, 
            itemSubType = v32
        };
        local v42 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v41.itemRestriction = if v42 then v42[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v42[l_ItemTileEnums_0.Restriction.LimitedUnique] or v42[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
        v41.ordering = v20.ordering;
        v41.creatorName = l_name_0;
        v41.creatorVerified = l_hasVerifiedBadge_0;
        v41.collectibleProductId = v31;
        v41.status = v37;
        v41.priceInRobux = v30;
        v41.name = l_name_1;
        v41.timedOptions = if l_FFlagAXDurablesForMIS_0 then l_itemData_0.timedOptions else nil;
        v41.selectedTimedOptionDays = if l_FFlagAXDurablesForMIS_0 then v38 else nil;
        return v41;
    end;
end;
local _ = function(v44, v45) --[[ Line: 191 ]] --[[ Name: areCartItemsDifferent ]]
    -- upvalues: v3 (copy)
    if v3.fieldCount(v44) ~= v3.fieldCount(v45) then
        return true;
    else
        for v46, _ in v45 do
            if v44[v46] == nil then
                return true;
            end;
        end;
        return false;
    end;
end;
return function() --[[ Line: 206 ]] --[[ Name: createAXShoppingCartStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), v5 (copy), v3 (copy), l_getTryOnItemReducerKey_0 (copy), v43 (copy), v6 (copy), v19 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    local v49, v50 = l_createSignal_0({});
    local v51, v52 = l_createSignal_0(0);
    local v54 = l_createComputed_0(function(v53) --[[ Line: 210 ]]
        -- upvalues: v51 (copy)
        return v51(v53);
    end);
    local v62 = l_createComputed_0(function(v55) --[[ Line: 214 ]]
        -- upvalues: v49 (copy), v5 (ref)
        local v56 = v49(v55);
        local v57 = {};
        for _, v59 in v56 do
            table.insert(v57, v59);
        end;
        table.sort(v57, function(v60, v61) --[[ Line: 222 ]]
            -- upvalues: v5 (ref)
            if v60.status == v5.ALREADY_OWNED and v61.status ~= v5.ALREADY_OWNED then
                return false;
            elseif v61.status == v5.ALREADY_OWNED and v60.status ~= v5.ALREADY_OWNED then
                return true;
            else
                return v60.ordering < v61.ordering;
            end;
        end);
        return v57;
    end, v3.deepEqual);
    local v68 = l_createComputed_0(function(v63) --[[ Line: 240 ]]
        -- upvalues: v49 (copy), v5 (ref), v3 (ref)
        local v64 = v49(v63);
        local v65 = 0;
        for _, v67 in v64 do
            if v67.status == v5.ALREADY_OWNED then
                v65 = v65 + 1;
            end;
            if v67.status ~= nil and v67.status ~= v5.ALREADY_OWNED and v67.status ~= v5.PRICE_MISMATCH then
                return false;
            end;
        end;
        if v65 == v3.fieldCount(v64) then
            return false;
        else
            return true;
        end;
    end);
    local v74 = l_createComputed_0(function(v69) --[[ Line: 274 ]]
        -- upvalues: v49 (copy), v5 (ref)
        local v70 = v49(v69);
        local v71 = 0;
        for _, v73 in v70 do
            if v73.status ~= v5.ALREADY_OWNED then
                v71 = v71 + v73.priceInRobux;
            end;
        end;
        return v71;
    end);
    local function v88(v75, v76) --[[ Line: 287 ]] --[[ Name: syncFromTryOns ]]
        -- upvalues: v49 (copy), l_getTryOnItemReducerKey_0 (ref), v43 (ref), v6 (ref), v3 (ref), v50 (copy), v52 (copy)
        local v77 = false;
        local v78 = v49(false);
        local v79 = {};
        for _, v81 in v75 do
            local v82 = l_getTryOnItemReducerKey_0(v81.itemId, v81.itemType);
            local v83 = v78[v82];
            local v84 = v43(v81, v76);
            v79[v82] = if v83 then v6.Dictionary.join(v83, v84) else v84;
        end;
        if not v3.deepEqual(v78, v79) then
            v50(v79);
        end;
        local v85;
        if v3.fieldCount(v78) ~= v3.fieldCount(v79) then
            v85 = true;
        else
            for v86, _ in v79 do
                if v78[v86] == nil then
                    v85 = true;
                    v77 = true;
                end;
                if v77 then
                    break;
                end;
            end;
            if not v77 then
                v85 = false;
            end;
        end;
        v77 = false;
        if v85 then
            v52(0);
        end;
    end;
    local function v103(v89) --[[ Line: 309 ]] --[[ Name: updateCartFromPurchaseResponse ]]
        -- upvalues: v49 (copy), v5 (ref), v19 (ref), v6 (ref), v50 (copy), v52 (copy)
        local v90 = v49(false);
        local v91 = {};
        local v92 = {};
        local v93 = {};
        local v94 = {};
        local v95 = 0;
        local l_lineItems_0 = v89.lineItems;
        for v97, v98 in v90 do
            local v99 = l_lineItems_0[v97];
            local v100 = v98.status == v5.ALREADY_OWNED;
            if v99 and v99.status ~= v19.SUCCEEDED and not v100 then
                local v101 = v5[v99.errorReason] or v5.UNKNOWN;
                local v102 = nil;
                if v101 == v5.PRICE_MISMATCH then
                    v102 = {
                        oldPriceInRobux = v98.priceInRobux
                    };
                    table.insert(v94, v98);
                end;
                v91[v97] = v6.Dictionary.join(v98, {
                    status = v101, 
                    priceMismatchMetadata = v102
                });
                v95 = v95 + 1;
            else
                table.insert(v93, v98);
                if not v100 then
                    table.insert(v92, v98);
                end;
            end;
        end;
        v50(v91);
        v52(v95);
        return {
            boughtItems = v92, 
            equippableItems = v93, 
            needDataRefeshItems = v94
        };
    end;
    local function v111(v104, v105, v106, v107) --[[ Line: 359 ]] --[[ Name: updateItemPrice ]]
        -- upvalues: l_FFlagAXDurablesForMIS_0 (ref), v49 (copy), l_getTryOnItemReducerKey_0 (ref), v50 (copy), v6 (ref)
        if not l_FFlagAXDurablesForMIS_0 then
            return;
        else
            local v108 = v49(false);
            local v109 = l_getTryOnItemReducerKey_0(v104, v105);
            local v110 = v108[v109];
            if v110 and (v110.priceInRobux ~= v106 or v110.selectedTimedOptionDays ~= v107) then
                v50(v6.Dictionary.join(v108, {
                    [v109] = v6.Dictionary.join(v110, {
                        priceInRobux = v106, 
                        selectedTimedOptionDays = if v107 == nil then v6.None else v107
                    })
                }));
            end;
            return;
        end;
    end;
    return {
        getCanPurchase = v68, 
        getErroredItemCount = v54, 
        getItems = v62, 
        getPurchasableItemsTotalPriceInRobux = v74, 
        syncFromTryOns = v88, 
        updateCartFromPurchaseResponse = v103, 
        updateItemPrice = if l_FFlagAXDurablesForMIS_0 then v111 else nil
    };
end;