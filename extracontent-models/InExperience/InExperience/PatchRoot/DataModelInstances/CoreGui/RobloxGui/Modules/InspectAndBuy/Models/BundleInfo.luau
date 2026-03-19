local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_ItemRestrictions_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions;
local v6 = require(l_Parent_0.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog);
local v7 = require(script.Parent.Parent.MockId);
local v8 = {
    new = function() --[[ Line: 41 ]] --[[ Name: new ]]
        return {};
    end
};
v8.mock = function() --[[ Line: 47 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy), v7 (copy)
    local v9 = v8.new();
    v9.name = "";
    v9.bundleId = v7();
    v9.description = "";
    v9.bundleType = "";
    v9.creatorId = "";
    v9.creatorName = "";
    v9.productId = "";
    v9.isForSale = false;
    v9.price = "";
    v9.assetIds = {};
    v9.numFavorites = 0;
    v9.costumeId = "";
    v9.owned = false;
    v9.isForSale = false;
    v9.collectibleItemId = "";
    v9.collectibleIsLimited = nil;
    v9.collectibleProductId = "";
    v9.collectibleLowestResalePrice = 0;
    v9.collectibleLowestAvailableResaleProductId = "";
    v9.collectibleLowestAvailableResaleItemInstanceId = "";
    v9.collectibleQuantityLimitPerUser = 0;
    v9.remaining = 0;
    v9.productType = "";
    return v9;
end;
v8.fromBulkPurchaseResult = function(v10, v11) --[[ Line: 80 ]] --[[ Name: fromBulkPurchaseResult ]]
    -- upvalues: v8 (copy), l_ItemRestrictions_0 (copy)
    local v12 = v8.new();
    local v13 = if v11 and v11.itemRestrictions then v11.itemRestrictions else {};
    v12.resellableCount = if v11 and v11.resellableCount then v11.resellableCount else 0;
    if v10.status == Enum.MarketplaceItemPurchaseStatus.Success and v10.type == Enum.MarketplaceProductType.AvatarBundle then
        v12.owned = true;
        if v13[l_ItemRestrictions_0.Collectible] or v13[l_ItemRestrictions_0.Limited] or v13[l_ItemRestrictions_0.LimitedUnique] then
            v12.resellableCount = v12.resellableCount + 1;
        end;
    end;
    return v12;
end;
v8.fromGetFavoriteForAsset = function(v14, v15) --[[ Line: 109 ]] --[[ Name: fromGetFavoriteForAsset ]]
    -- upvalues: v8 (copy)
    local v16 = v8.new();
    v16.bundleId = tostring(v14);
    v16.isFavorited = v15;
    return v16;
end;
v8.fromAvatarPreviewItem = function(v17) --[[ Line: 116 ]] --[[ Name: fromAvatarPreviewItem ]]
    -- upvalues: v8 (copy)
    local v18 = v8.new();
    v18.name = v17.name;
    v18.description = v17.description;
    v18.price = v17.priceInRobux;
    v18.isForSale = v17.isPurchasable;
    v18.productId = tostring(v17.productId);
    v18.collectibleItemId = v17.collectibleItemId;
    v18.collectibleProductId = v17.collectibleProductId;
    v18.owned = v17.quantityOwned > 0;
    v18.resellableCount = v17.quantityOwned;
    v18.creatorId = tostring(v17.creator.id);
    v18.creatorName = v17.creator.name;
    v18.creatorHasVerifiedBadge = v17.creator.hasVerifiedBadge;
    v18.bundleId = tostring(v17.id);
    v18.bundleType = tostring(v17.bundleType);
    v18.noPriceStatus = v17.noPriceStatus;
    local v19 = {};
    if v17.assetsInBundle then
        for _, v21 in v17.assetsInBundle do
            table.insert(v19, {
                id = tostring(v21.id), 
                assetType = tostring(v21.assetType), 
                isIncluded = v21.isIncluded, 
                meta = v21.meta
            });
        end;
    end;
    v18.assetsInBundle = v19;
    if v17.itemRestrictions then
        local v22 = {};
        for _, v24 in v17.itemRestrictions do
            v22[v24] = true;
        end;
        v18.itemRestrictions = v22;
    end;
    return v18;
end;
v8.fromGetAssetBundles = function(v25) --[[ Line: 161 ]] --[[ Name: fromGetAssetBundles ]]
    -- upvalues: v8 (copy), v3 (copy)
    local v26 = v8.new();
    v26.name = v25.name;
    v26.bundleId = tostring(v25.id);
    v26.description = v25.description;
    v26.bundleType = v25.bundleType;
    v26.creatorId = tostring(v25.creator.id);
    v26.creatorName = v25.creator.name;
    v26.productId = tostring(v25.product.id);
    if v25.collectibleItemDetail then
        v26.isForSale = v25.collectibleItemDetail.saleStatus == v3.SaleStatus.OnSale;
        v26.collectibleItemId = v25.collectibleItemDetail.collectibleItemId or "";
        v26.collectibleProductId = v25.collectibleItemDetail.collectibleProductId or "";
        v26.collectibleLowestResalePrice = v25.collectibleItemDetail.lowestResalePrice or 0;
        v26.collectibleLowestAvailableResaleProductId = v25.collectibleItemDetail.lowestAvailableResaleProductId or "";
        v26.collectibleLowestAvailableResaleItemInstanceId = v25.collectibleItemDetail.lowestAvailableResaleItemInstanceId or "";
        v26.collectibleQuantityLimitPerUser = v25.collectibleItemDetail.quantityLimitPerUser or 0;
        v26.productType = v3.ProductType.CollectibleItem;
        v26.price = v25.collectibleItemDetail.price;
        v26.remaining = v25.collectibleItemDetail.unitsAvailable or 0;
        v26.collectibleIsLimited = v25.collectibleItemDetail.collectibleItemType == "Limited";
        v26.saleLocation = v25.collectibleItemDetail.saleLocation;
    end;
    v26.assetIds = {};
    for _, v28 in pairs(v25.items) do
        if v28.type == "UserOutfit" then
            v26.costumeId = tostring(v28.id);
        else
            table.insert(v26.assetIds, (tostring(v28.id)));
        end;
    end;
    return v26;
end;
v8.fromGetItemDetailsV2 = function(v29) --[[ Line: 208 ]] --[[ Name: fromGetItemDetailsV2 ]]
    -- upvalues: v8 (copy)
    local v30 = v8.new();
    v30.bundleId = tostring(v29.id);
    v30.isForSale = v29.isPurchasable;
    v30.price = v29.price or 0;
    v30.hasResellers = v29.hasResellers;
    v30.collectibleItemId = v29.collectibleItemId;
    v30.remaining = v29.unitsAvailableForConsumption;
    v30.collectibleTotalQuantity = v29.totalQuantity;
    v30.collectibleLowestResalePrice = v29.lowestResalePrice;
    v30.isOffSale = v29.isOffSale;
    v30.saleLocationType = v29.saleLocationType;
    v30.numFavorites = v29.favoriteCount;
    v30.catalogPriceStatus = v29.priceStatus;
    local v31 = {};
    if v29.bundledItems then
        for _, v33 in v29.bundledItems do
            table.insert(v31, {
                id = tostring(v33.id), 
                name = v33.name
            });
        end;
    end;
    v30.assetsInBundle = v31;
    return v30;
end;
v8.fromGetItemDetails = function(v34) --[[ Line: 240 ]] --[[ Name: fromGetItemDetails ]]
    -- upvalues: v8 (copy), v6 (copy)
    local v35 = v8.new();
    v35.bundleId = tostring(v34.Id);
    v35.owned = v34.Owned;
    v35.isForSale = v34.IsPurchasable;
    v35.price = v34.Price or 0;
    v35.hasResellers = v34.HasResellers;
    v35.collectibleItemId = v34.CollectibleItemId;
    if v6 then
        v35.remaining = v34.UnitsAvailableForConsumption;
        v35.collectibleTotalQuantity = v34.TotalQuantity;
        v35.collectibleLowestResalePrice = v34.LowestResalePrice;
        v35.isOffSale = v34.IsOffSale;
        v35.saleLocationType = v34.SaleLocationType;
        v35.numFavorites = v34.FavoriteCount;
        v35.catalogPriceStatus = v34.PriceStatus;
        local v36 = {};
        for _, v38 in v34.BundledItems do
            table.insert(v36, {
                id = tostring(v38.Id), 
                name = v38.Name
            });
        end;
        v35.assetsInBundle = v36;
    end;
    return v35;
end;
v8.fromGetBundleFavoriteCount = function(v39, v40) --[[ Line: 273 ]] --[[ Name: fromGetBundleFavoriteCount ]]
    -- upvalues: v8 (copy)
    local v41 = v8.new();
    v41.bundleId = tostring(v39);
    v41.numFavorites = v40;
    return v41;
end;
v8.fromGetEconomyProductInfo = function(v42, v43, v44, v45) --[[ Line: 280 ]] --[[ Name: fromGetEconomyProductInfo ]]
    -- upvalues: v8 (copy)
    local v46 = v8.new();
    v46.bundleId = tostring(v43);
    v46.owned = v42;
    v46.price = v44;
    v46.isForSale = v45;
    return v46;
end;
v8.fromPurchaseSuccess = function(v47) --[[ Line: 289 ]] --[[ Name: fromPurchaseSuccess ]]
    -- upvalues: v8 (copy)
    local v48 = v8.new();
    v48.bundleId = tostring(v47);
    v48.owned = true;
    return v48;
end;
v8.getSaleDetailsForCollectibles = function(v49) --[[ Line: 296 ]] --[[ Name: getSaleDetailsForCollectibles ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v50 = v1.joinDeep({}, v49);
    if v49.productType == v3.ProductType.CollectibleItem then
        local l_saleLocation_0 = v50.saleLocation;
        local v52 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ShopOnly;
        local v53 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ShopAndExperiencesById;
        local v54 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId == v3.SaleLocationType.ShopAndExperiencesById and type(l_saleLocation_0.universeIds) == "table" and table.find(l_saleLocation_0.universeIds, game.GameId) ~= nil;
        local v55 = l_saleLocation_0 and l_saleLocation_0.saleLocationTypeId ~= v3.SaleLocationType.ExperiencesDevApiOnly;
        v50.isForSale = v50.isForSale and v52 and (v53 or v54) and v55;
        if not v49.collectibleIsLimited then
            v50.isForSale = v50.isForSale and not v50.owned;
        end;
    end;
    return v50;
end;
return v8;