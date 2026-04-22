local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_normalize_0 = require(l_Parent_0.AvatarExperienceCommon).Utils.normalize;
local l_normalizeBoolean_0 = l_normalize_0.normalizeBoolean;
local l_normalizeString_0 = l_normalize_0.normalizeString;
local l_normalizeNumber_0 = l_normalize_0.normalizeNumber;
local l_makeNormalizeTableFn_0 = l_normalize_0.makeNormalizeTableFn;
local v7 = require(l_script_FirstAncestor_0.Utils.convertToPascalCase);
local l_ASSET_TYPE_ID_STRING_TO_NAME_0 = require(l_Parent_0.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_NAME;
local _ = require(l_script_FirstAncestor_0.Models.CatalogV2SearchItemDetails);
local v10 = {
    [1] = "BodyParts", 
    [2] = "Animations", 
    [3] = "Shoes", 
    [4] = "DynamicHead"
};
local function _(v11) --[[ Line: 31 ]] --[[ Name: normalizeBundledItem ]]
    -- upvalues: l_normalizeNumber_0 (copy), l_normalizeString_0 (copy)
    return {
        Id = l_normalizeNumber_0(v11.id), 
        Name = l_normalizeString_0(v11.name), 
        Type = l_normalizeString_0(v11.type)
    };
end;
local function v17(v13) --[[ Line: 39 ]] --[[ Name: normalizeBundledItems ]]
    -- upvalues: l_normalizeNumber_0 (copy), l_normalizeString_0 (copy)
    if typeof(v13) ~= "table" then
        return nil;
    else
        local v14 = {};
        for _, v16 in v13 do
            table.insert(v14, {
                Id = l_normalizeNumber_0(v16.id), 
                Name = l_normalizeString_0(v16.name), 
                Type = l_normalizeString_0(v16.type)
            });
        end;
        return v14;
    end;
end;
local function v22(v18) --[[ Line: 52 ]] --[[ Name: normalizeTimedOptions ]]
    -- upvalues: l_normalizeNumber_0 (copy), l_normalizeBoolean_0 (copy)
    local v19 = nil;
    if v18.timedOptions then
        v19 = {};
        for _, v21 in v18.timedOptions do
            table.insert(v19, {
                days = l_normalizeNumber_0(v21.days), 
                price = l_normalizeNumber_0(v21.price), 
                selected = if v21.selected then l_normalizeBoolean_0(v21.selected) else nil
            });
        end;
    end;
    return v19;
end;
local function v27(v23) --[[ Line: 67 ]] --[[ Name: normalizeItem ]]
    -- upvalues: l_ASSET_TYPE_ID_STRING_TO_NAME_0 (copy), v10 (copy), l_normalizeString_0 (copy), v17 (copy), l_normalizeBoolean_0 (copy), l_normalizeNumber_0 (copy), v22 (copy), v7 (copy)
    if type(v23) ~= "table" then
        return nil, "Item must be a table";
    else
        local v24 = if v23.assetType then l_ASSET_TYPE_ID_STRING_TO_NAME_0[tostring(v23.assetType)] else nil;
        local v25 = nil;
        v25 = if type(v23.bundleType) == "number" then v10[v23.bundleType] or tostring(v23.bundleType) else v23.bundleType;
        local v26 = {
            assetType = l_normalizeString_0(v24), 
            bundleType = l_normalizeString_0(v25), 
            bundledItems = v17(v23.bundledItems), 
            collectibleItemId = l_normalizeString_0(v23.collectibleItemId), 
            creatorHasVerifiedBadge = l_normalizeBoolean_0(v23.creatorHasVerifiedBadge), 
            creatorName = l_normalizeString_0(v23.creatorName), 
            creatorTargetId = l_normalizeNumber_0(v23.creatorTargetId), 
            creatorType = l_normalizeString_0(v23.creatorType), 
            description = l_normalizeString_0(v23.description), 
            favoriteCount = l_normalizeNumber_0(v23.favoriteCount), 
            hasResellers = l_normalizeBoolean_0(v23.hasResellers), 
            id = l_normalizeNumber_0(v23.id), 
            isRecolorable = l_normalizeBoolean_0(v23.isRecolorable), 
            itemRestrictions = v23.itemRestrictions or {}, 
            itemStatus = v23.itemStatus or {}, 
            itemType = l_normalizeString_0(v23.itemType), 
            lowestPrice = l_normalizeNumber_0(v23.lowestPrice), 
            lowestResalePrice = l_normalizeNumber_0(v23.lowestResalePrice), 
            name = l_normalizeString_0(v23.name), 
            price = l_normalizeNumber_0(v23.price), 
            productId = l_normalizeNumber_0(v23.productId), 
            priceStatus = l_normalizeString_0(v23.priceStatus), 
            saleLocationType = l_normalizeString_0(v23.saleLocationType), 
            totalQuantity = l_normalizeNumber_0(v23.totalQuantity), 
            unitsAvailableForConsumption = l_normalizeNumber_0(v23.unitsAvailableForConsumption), 
            offSaleDeadline = l_normalizeString_0(v23.offSaleDeadline), 
            quantityLimitPerUser = l_normalizeNumber_0(v23.quantityLimitPerUser), 
            isOffSale = l_normalizeBoolean_0(v23.isOffSale), 
            timedOptions = v22(v23)
        };
        return v7(v26), nil;
    end;
end;
return (l_makeNormalizeTableFn_0({
    data = function(v28) --[[ Line: 119 ]] --[[ Name: normalizeItemsData ]]
        -- upvalues: v27 (copy)
        if typeof(v28) ~= "table" then
            return nil, nil;
        else
            local v29 = {};
            local v30 = {};
            for v31, v32 in v28 do
                local v33, v34 = v27(v32);
                table.insert(v30, v34);
                v29[v31] = v33;
            end;
            local v35 = nil;
            if next(v30) then
                v35 = table.concat(v30, " ");
            end;
            return v29, v35;
        end;
    end, 
    nextPageCursor = l_normalizeString_0
}));