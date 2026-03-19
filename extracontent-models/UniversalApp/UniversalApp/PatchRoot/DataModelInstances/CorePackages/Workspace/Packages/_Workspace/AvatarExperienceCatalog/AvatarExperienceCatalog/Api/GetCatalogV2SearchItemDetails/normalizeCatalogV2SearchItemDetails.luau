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
local l_FFlagAXDurablesSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v11 = {
    [1] = "BodyParts", 
    [2] = "Animations", 
    [3] = "Shoes", 
    [4] = "DynamicHead"
};
local function _(v12) --[[ Line: 34 ]] --[[ Name: normalizeBundledItem ]]
    -- upvalues: l_normalizeNumber_0 (copy), l_normalizeString_0 (copy)
    return {
        Id = l_normalizeNumber_0(v12.id), 
        Name = l_normalizeString_0(v12.name), 
        Type = l_normalizeString_0(v12.type)
    };
end;
local function v18(v14) --[[ Line: 42 ]] --[[ Name: normalizeBundledItems ]]
    -- upvalues: l_normalizeNumber_0 (copy), l_normalizeString_0 (copy)
    if typeof(v14) ~= "table" then
        return nil;
    else
        local v15 = {};
        for _, v17 in v14 do
            table.insert(v15, {
                Id = l_normalizeNumber_0(v17.id), 
                Name = l_normalizeString_0(v17.name), 
                Type = l_normalizeString_0(v17.type)
            });
        end;
        return v15;
    end;
end;
local function v23(v19) --[[ Line: 55 ]] --[[ Name: normalizeTimedOptions ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_normalizeNumber_0 (copy), l_normalizeBoolean_0 (copy)
    local v20 = nil;
    if l_FFlagAXDurablesSupport_0 and v19.timedOptions then
        v20 = {};
        for _, v22 in v19.timedOptions do
            table.insert(v20, {
                days = l_normalizeNumber_0(v22.days), 
                price = l_normalizeNumber_0(v22.price), 
                selected = if v22.selected then l_normalizeBoolean_0(v22.selected) else nil
            });
        end;
    end;
    return v20;
end;
local function v28(v24) --[[ Line: 72 ]] --[[ Name: normalizeItem ]]
    -- upvalues: l_ASSET_TYPE_ID_STRING_TO_NAME_0 (copy), v11 (copy), l_normalizeString_0 (copy), v18 (copy), l_normalizeBoolean_0 (copy), l_normalizeNumber_0 (copy), l_FFlagAXDurablesSupport_0 (copy), v23 (copy), v7 (copy)
    if type(v24) ~= "table" then
        return nil, "Item must be a table";
    else
        local v25 = if v24.assetType then l_ASSET_TYPE_ID_STRING_TO_NAME_0[tostring(v24.assetType)] else nil;
        local v26 = nil;
        v26 = if type(v24.bundleType) == "number" then v11[v24.bundleType] or tostring(v24.bundleType) else v24.bundleType;
        local v27 = {
            assetType = l_normalizeString_0(v25), 
            bundleType = l_normalizeString_0(v26), 
            bundledItems = v18(v24.bundledItems), 
            collectibleItemId = l_normalizeString_0(v24.collectibleItemId), 
            creatorHasVerifiedBadge = l_normalizeBoolean_0(v24.creatorHasVerifiedBadge), 
            creatorName = l_normalizeString_0(v24.creatorName), 
            creatorTargetId = l_normalizeNumber_0(v24.creatorTargetId), 
            creatorType = l_normalizeString_0(v24.creatorType), 
            description = l_normalizeString_0(v24.description), 
            favoriteCount = l_normalizeNumber_0(v24.favoriteCount), 
            hasResellers = l_normalizeBoolean_0(v24.hasResellers), 
            id = l_normalizeNumber_0(v24.id), 
            isRecolorable = l_normalizeBoolean_0(v24.isRecolorable), 
            itemRestrictions = v24.itemRestrictions or {}, 
            itemStatus = v24.itemStatus or {}, 
            itemType = l_normalizeString_0(v24.itemType), 
            lowestPrice = l_normalizeNumber_0(v24.lowestPrice), 
            lowestResalePrice = l_normalizeNumber_0(v24.lowestResalePrice), 
            name = l_normalizeString_0(v24.name), 
            price = l_normalizeNumber_0(v24.price), 
            productId = l_normalizeNumber_0(v24.productId), 
            priceStatus = l_normalizeString_0(v24.priceStatus), 
            saleLocationType = l_normalizeString_0(v24.saleLocationType), 
            totalQuantity = l_normalizeNumber_0(v24.totalQuantity), 
            unitsAvailableForConsumption = l_normalizeNumber_0(v24.unitsAvailableForConsumption), 
            offSaleDeadline = l_normalizeString_0(v24.offSaleDeadline), 
            quantityLimitPerUser = l_normalizeNumber_0(v24.quantityLimitPerUser), 
            isOffSale = l_normalizeBoolean_0(v24.isOffSale), 
            timedOptions = if l_FFlagAXDurablesSupport_0 then v23(v24) else nil
        };
        return v7(v27), nil;
    end;
end;
return (l_makeNormalizeTableFn_0({
    data = function(v29) --[[ Line: 124 ]] --[[ Name: normalizeItemsData ]]
        -- upvalues: v28 (copy)
        if typeof(v29) ~= "table" then
            return nil, nil;
        else
            local v30 = {};
            local v31 = {};
            for v32, v33 in v29 do
                local v34, v35 = v28(v33);
                table.insert(v31, v35);
                v30[v32] = v34;
            end;
            local v36 = nil;
            if next(v31) then
                v36 = table.concat(v31, " ");
            end;
            return v30, v36;
        end;
    end, 
    nextPageCursor = l_normalizeString_0
}));