local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Parent.AXCommon);
local v4 = require(l_Parent_0.tutils);
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
return function(v6, v7) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), l_ItemTypeEnum_0 (copy)
    local v8 = 0;
    if v7 then
        v8 = v4.fieldCount(v7);
    end;
    return {
        id = v6.assetId, 
        name = v6.name, 
        meta = v6.meta, 
        description = v6.description, 
        itemType = l_ItemTypeEnum_0.Asset, 
        itemSubType = v6.assetTypeId, 
        creator = {
            creatorId = v6.creatorId or "", 
            creatorName = v6.creatorName or "", 
            creatorHasVerifiedBadge = v6.creatorHasVerifiedBadge or false
        }, 
        saleLocationType = v6.saleLocationType, 
        itemRestrictions = v6.itemRestrictions or {}, 
        priceInRobux = v6.price, 
        noPriceStatus = v6.noPriceStatus, 
        catalogPriceStatus = v6.catalogPriceStatus, 
        isOwned = v6.owned, 
        isOffSale = v6.isOffSale, 
        collectibleItemId = v6.collectibleItemId, 
        creatingUniverseId = v6.creatingUniverseId, 
        collectibleItemDetails = {
            quantityLimitPerUser = v6.collectibleQuantityLimitPerUser, 
            resellableCount = v6.resellableCount or v8, 
            collectibleLowestAvailableResaleProductId = v6.collectibleLowestAvailableResaleProductId, 
            collectibleLowestAvailableResaleItemInstanceId = v6.collectibleLowestAvailableResaleItemInstanceId, 
            unitsAvailableForConsumption = v6.remaining, 
            hasResellers = v6.hasResellers or v6.collectibleLowestAvailableResaleProductId ~= nil and (v6.collectibleLowestAvailableResaleProductId ~= "" or false), 
            lowestResalePrice = v6.collectibleLowestResalePrice or 0, 
            totalQuantity = v6.collectibleTotalQuantity or 0, 
            experiences = v6 and v6.saleLocation and v6.saleLocation.UniverseIds or {}
        }, 
        favoritesDetails = {
            numFavorites = v6.numFavorites, 
            isFavorited = v6.isFavorited
        }
    };
end;