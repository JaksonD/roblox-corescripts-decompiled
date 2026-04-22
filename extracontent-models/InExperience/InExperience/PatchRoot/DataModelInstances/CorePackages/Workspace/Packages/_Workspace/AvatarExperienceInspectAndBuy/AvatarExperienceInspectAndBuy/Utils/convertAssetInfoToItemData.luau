local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Parent.AXCommon);
local v4 = require(l_Parent_0.tutils);
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase;
return function(v7, v8) --[[ Line: 22 ]]
    -- upvalues: v4 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy)
    local v9 = 0;
    if v8 then
        v9 = v4.fieldCount(v8);
    end;
    return {
        id = v7.assetId, 
        name = v7.name, 
        meta = v7.meta, 
        description = v7.description, 
        itemType = l_ItemTypeEnum_0.Asset, 
        itemSubType = v7.assetTypeId, 
        creator = {
            creatorId = v7.creatorId or "", 
            creatorName = v7.creatorName or "", 
            creatorHasVerifiedBadge = v7.creatorHasVerifiedBadge or false
        }, 
        saleLocationType = v7.saleLocationType, 
        itemRestrictions = v7.itemRestrictions or {}, 
        priceInRobux = v7.price, 
        noPriceStatus = v7.noPriceStatus, 
        catalogPriceStatus = v7.catalogPriceStatus, 
        isOwned = v7.owned, 
        isOffSale = v7.isOffSale, 
        collectibleItemId = v7.collectibleItemId, 
        creatingUniverseId = v7.creatingUniverseId, 
        collectibleItemDetails = {
            quantityLimitPerUser = v7.collectibleQuantityLimitPerUser, 
            resellableCount = v7.resellableCount or v9, 
            collectibleLowestAvailableResaleProductId = v7.collectibleLowestAvailableResaleProductId, 
            collectibleLowestAvailableResaleItemInstanceId = v7.collectibleLowestAvailableResaleItemInstanceId, 
            unitsAvailableForConsumption = v7.remaining, 
            hasResellers = v7.hasResellers or v7.collectibleLowestAvailableResaleProductId ~= nil and (v7.collectibleLowestAvailableResaleProductId ~= "" or false), 
            lowestResalePrice = v7.collectibleLowestResalePrice or 0, 
            totalQuantity = v7.collectibleTotalQuantity or 0, 
            experiences = v7 and v7.saleLocation and v7.saleLocation.UniverseIds or {}
        }, 
        favoritesDetails = {
            numFavorites = v7.numFavorites, 
            isFavorited = v7.isFavorited
        }, 
        timedOptions = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v7.timedOptions else nil
    };
end;