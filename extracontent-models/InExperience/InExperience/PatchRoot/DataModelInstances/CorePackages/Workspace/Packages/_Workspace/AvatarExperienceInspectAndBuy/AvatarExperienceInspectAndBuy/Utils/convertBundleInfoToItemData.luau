local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Parent.AXCommon);
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
local l_SalesLocationType_0 = v3.Enums.SalesLocationType;
local v6 = require(l_Parent_0.tutils);
return function(v7, v8) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), l_ItemTypeEnum_0 (copy), l_SalesLocationType_0 (copy)
    local v9 = 0;
    if v8 then
        v9 = v6.fieldCount(v8);
    end;
    local v10 = {};
    if v7.assetsInBundle then
        for _, v12 in v7.assetsInBundle do
            table.insert(v10, {
                id = tostring(v12.id), 
                assetType = tostring(v12.assetType), 
                isIncluded = v12.isIncluded, 
                meta = v12.meta, 
                name = v12.name
            });
        end;
    end;
    return {
        id = v7.bundleId, 
        name = v7.name, 
        description = v7.description, 
        itemType = l_ItemTypeEnum_0.Bundle, 
        itemSubType = v7.bundleType, 
        creator = {
            creatorId = v7.creatorId or "", 
            creatorName = v7.creatorName or "", 
            creatorHasVerifiedBadge = v7.creatorHasVerifiedBadge or false
        }, 
        saleLocationType = v7.saleLocationType or l_SalesLocationType_0.Invalid, 
        itemRestrictions = v7.itemRestrictions or {}, 
        priceInRobux = v7.price, 
        noPriceStatus = v7.noPriceStatus, 
        catalogPriceStatus = v7.catalogPriceStatus, 
        isOwned = v7.owned, 
        hasResellers = v7.hasResellers, 
        isOffSale = v7.isOffSale, 
        collectibleItemId = v7.collectibleItemId, 
        collectibleItemDetails = {
            quantityLimitPerUser = v7.collectibleQuantityLimitPerUser, 
            collectibleLowestAvailableResaleProductId = v7.collectibleLowestAvailableResaleProductId, 
            collectibleLowestAvailableResaleItemInstanceId = v7.collectibleLowestAvailableResaleItemInstanceId, 
            unitsAvailableForConsumption = v7.remaining, 
            hasResellers = v7.hasResellers, 
            lowestResalePrice = v7.collectibleLowestResalePrice, 
            resellableCount = v7.resellableCount or v9, 
            totalQuantity = v7.collectibleTotalQuantity or 0
        }, 
        assetsInBundle = v10, 
        favoritesDetails = {
            isFavorited = v7.isFavorited, 
            numFavorites = v7.numFavorites
        }
    };
end;