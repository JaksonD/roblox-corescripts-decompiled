local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTileEnums_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTileEnums;
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v10 = {};
local v17 = l_memoize_0(function(v11) --[[ Line: 21 ]]
    -- upvalues: v6 (copy), l_ItemTileEnums_0 (copy)
    if not v11 then
        return nil, nil;
    elseif #v11 == 0 then
        return nil, nil;
    else
        local v12 = {};
        for _, v14 in v11 do
            v12[v14] = true;
        end;
        local v15 = nil;
        local v16 = nil;
        if v12[v6.ItemStatus.Sale] then
            return l_ItemTileEnums_0.StatusStyle.Alert, v6.ItemStatusLocale.Sale;
        else
            if v12[v6.ItemStatus.New] then
                v15 = l_ItemTileEnums_0.StatusStyle.Info;
                v16 = v6.ItemStatusLocale.New;
            end;
            return v15, v16;
        end;
    end;
end);
local v19 = l_memoize_0(function(v18) --[[ Line: 47 ]]
    -- upvalues: v6 (copy)
    if not v18 then
        return nil;
    elseif v18[v6.ItemRestrictions.Limited] then
        return true;
    elseif v18[v6.ItemRestrictions.LimitedUnique] then
        return true;
    elseif v18[v6.ItemRestrictions.Collectible] then
        return false;
    else
        return nil;
    end;
end);
local v25 = l_memoize_0(function(v20, v21) --[[ Line: 61 ]]
    -- upvalues: v6 (copy)
    local v22 = v21 and v21[v6.ItemRestrictions.Limited];
    local v23 = v21 and v21[v6.ItemRestrictions.LimitedUnique];
    local v24 = v21 and v21[v6.ItemRestrictions.Collectible];
    return v22 or v24 or v23 and v20 and v20 == 0;
end);
local v28 = l_memoize_0(function(v26, _) --[[ Line: 71 ]]
    -- upvalues: v6 (copy)
    if v26 then
        return v26[v6.ItemRestrictions.Collectible] ~= nil;
    else
        return false;
    end;
end);
v10.fromOutfitInfo = l_memoize_0(function(v29) --[[ Line: 78 ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v30 = {};
    for _, v32 in v29.assets do
        for v33, _ in v32 do
            table.insert(v30, {
                id = v33, 
                type = v4.ItemType.Asset
            });
        end;
    end;
    return {
        itemType = v4.ItemType.Outfit, 
        itemId = v29.outfitId, 
        name = v29.name, 
        hasPremiumBenefits = false, 
        isPremiumExclusive = false, 
        isEditable = v29.isEditable, 
        hasAttribution = v29.creatingUniverseId and true or false, 
        updateCounter = v29.updateCounter, 
        itemSubType = v29.outfitType, 
        itemIconType = v8.getItemIconTypeFromOutfit(v29), 
        includedItems = v30, 
        outfitInfo = v29
    };
end);
v10.fromAssetInfo = l_memoize_0(function(v35) --[[ Line: 110 ]]
    -- upvalues: v17 (copy), v28 (copy), v4 (copy), v19 (copy), v25 (copy)
    local v36, v37 = v17(v35.itemStatus);
    local v38 = v28(v35.itemRestrictions, v35.collectibleItemId);
    return {
        itemType = v4.ItemType.Asset, 
        itemId = v35.id, 
        name = v35.name, 
        description = v35.description, 
        isEditable = false, 
        itemSubType = v35.assetType, 
        priceInRobux = v35.priceInRobux, 
        priceStatus = v35.priceStatus, 
        productId = v35.product and v35.product.id, 
        collectibleItemId = v35.collectibleItemId, 
        statusStyle = v36, 
        statusText = v37, 
        resellerUserAssetIds = v35.resellerUserAssetIds, 
        receivedCatalogData = v35.receivedCatalogData, 
        lowestPrice = v35.lowestPrice, 
        isOwned = v35.isOwned, 
        isTradeable = v19(v35.itemRestrictions), 
        isResellable = v25(v35.numberRobloxHasAvailable, v35.itemRestrictions), 
        hasAttribution = v35.creatingUniverseId and true or false, 
        expectedSellerId = v35.expectedSellerId, 
        creator = v35.creator, 
        receivedRecommendedData = v35.receivedRecommendedData, 
        recommendedItemSummaries = v35.recommendedItemSummaries, 
        favoriteCount = v35.favoriteCount, 
        soldCount = v35.soldCount, 
        totalQuantity = v35.totalQuantity, 
        originalPrice = v35.originalPrice, 
        averagePrice = v35.averagePrice, 
        creatingUniverseId = v35.creatingUniverseId, 
        isForRent = v35.isForRent, 
        isPurchasable = v35.isPurchasable, 
        isLimitedCollectible = v38, 
        assetInfo = v35
    };
end);
v10.fromBundleInfo = l_memoize_0(function(v39) --[[ Line: 154 ]]
    -- upvalues: v17 (copy), v28 (copy), v4 (copy), v19 (copy), v25 (copy), l_ItemTileEnums_0 (copy)
    local v40, v41 = v17(v39.itemStatus);
    local l_collectibleItemId_0 = v39.collectibleItemId;
    local v43 = v28(v39.itemRestrictions, v39.collectibleItemId);
    return {
        itemType = v4.ItemType.Bundle, 
        itemId = v39.id, 
        name = v39.name, 
        description = v39.description, 
        hasPremiumBenefits = false, 
        isPremiumExclusive = false, 
        isEditable = false, 
        itemSubType = v39.bundleType, 
        priceInRobux = v39.priceInRobux, 
        priceStatus = v39.priceStatus, 
        productId = v39.product and v39.product.id, 
        statusStyle = v40, 
        statusText = v41, 
        receivedCatalogData = v39.receivedCatalogData, 
        lowestPrice = v39.lowestPrice, 
        isOwned = v39.isOwned, 
        isTradeable = v19(v39.itemRestrictions), 
        isResellable = v25(v39.numberRobloxHasAvailable, v39.itemRestrictions), 
        itemIconType = l_ItemTileEnums_0.ItemIconType.Bundle, 
        expectedSellerId = v39.expectedSellerId, 
        creator = v39.creator, 
        receivedRecommendedData = v39.receivedRecommendedData, 
        recommendedItemSummaries = v39.recommendedItemSummaries, 
        favoriteCount = v39.favoriteCount, 
        includedItems = v39.items, 
        isForRent = v39.isForRent, 
        isPurchasable = v39.isPurchasable, 
        collectibleItemId = l_collectibleItemId_0, 
        isLimitedCollectible = v43, 
        bundleInfo = v39
    };
end);
v10.Validator = v5.strictInterface({
    itemType = v5.string, 
    itemId = v5.optional(v5.string), 
    name = v5.optional(v5.string), 
    description = v5.optional(v5.string), 
    itemSubType = v5.optional(v5.string), 
    priceInRobux = v5.optional(v5.number), 
    priceStatus = v5.optional(v5.string), 
    productId = v5.optional(v5.string), 
    collectibleItemId = v5.optional(v5.string), 
    statusStyle = v5.optional(v5.string), 
    statusText = v5.optional(v5.string), 
    resellerUserAssetIds = v5.optional(v5.table), 
    lowestPrice = v5.optional(v5.number), 
    premiumPricing = v5.optional(v5.table), 
    tileRestrictionsMap = v5.optional(v5.table), 
    updateCounter = v5.optional(v5.number), 
    itemIconType = v5.optional(v5.userdata), 
    expectedSellerId = v5.optional(v5.string), 
    creator = v5.optional(v5.table), 
    recommendedItemSummaries = v5.optional(v5.table), 
    favoriteCount = v5.optional(v5.number), 
    includedItems = v5.optional(v5.table), 
    soldCount = v5.optional(v5.number), 
    totalQuantity = v5.optional(v5.number), 
    originalPrice = v5.optional(v5.number), 
    averagePrice = v5.optional(v5.number), 
    creatingUniverseId = v5.optional(v5.string), 
    hasAttribution = v5.optional(v5.boolean), 
    hasPremiumBenefits = v5.optional(v5.boolean), 
    isEditable = v5.optional(v5.boolean), 
    isForRent = v5.optional(v5.boolean), 
    isLimitedCollectible = v5.optional(v5.boolean), 
    isLimitedBundle = v5.optional(v5.boolean), 
    isOwned = v5.optional(v5.boolean), 
    isPremiumExclusive = v5.optional(v5.boolean), 
    isPurchasable = v5.optional(v5.boolean), 
    isResellable = v5.optional(v5.boolean), 
    isTradeable = v5.optional(v5.boolean), 
    receivedCatalogData = v5.optional(v5.boolean), 
    receivedRecommendedData = v5.optional(v5.boolean), 
    assetInfo = v5.optional(v5.table), 
    bundleInfo = v5.optional(v5.table), 
    outfitInfo = v5.optional(v5.table)
});
return v10;