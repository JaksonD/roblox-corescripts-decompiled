local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.MockId);
local v6 = require(l_Parent_0.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_ItemRestrictions_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions;
local v9 = require(l_CoreGui_0.RobloxGui.Modules.Flags.FFlagEnableRestrictedAssetSaleLocationInspectAndBuy);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v11 = require(l_Parent_0.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog);
local l_FFlagIBV2Attribution_0 = v1.FFlagIBV2Attribution;
local v13 = {};
local function _(v14) --[[ Line: 62 ]]
    return math.round(v14 * 100) / 100;
end;
v13.new = function() --[[ Line: 66 ]] --[[ Name: new ]]
    return {};
end;
v13.mock = function() --[[ Line: 72 ]] --[[ Name: mock ]]
    -- upvalues: v13 (copy), v5 (copy), v10 (copy)
    local v16 = v13.new();
    v16.name = "";
    v16.assetId = v5();
    v16.assetTypeId = "";
    v16.creatorId = "";
    v16.creatorName = "";
    v16.creatorHasVerifiedBadge = false;
    v16.owned = false;
    v16.isForSale = false;
    v16.description = "";
    v16.price = "";
    v16.productId = "";
    v16.isLimited = false;
    v16.isLimitedUnique = not v10() and nil;
    v16.collectibleIsLimited = not v10() and nil;
    v16.bundlesAssetIsIn = {};
    v16.parentBundleId = nil;
    v16.numFavorites = 0;
    v16.minimumMembershipLevel = 0;
    v16.collectibleItemId = "";
    v16.collectibleProductId = "";
    v16.collectibleLowestResalePrice = 0;
    v16.collectibleLowestAvailableResaleProductId = "";
    v16.collectibleLowestAvailableResaleItemInstanceId = "";
    v16.collectibleQuantityLimitPerUser = 0;
    v16.remaining = 0;
    v16.creatingUniverseId = nil;
    return v16;
end;
v13.fromBulkPurchaseResult = function(v17, v18) --[[ Line: 114 ]] --[[ Name: fromBulkPurchaseResult ]]
    -- upvalues: v13 (copy), l_ItemRestrictions_0 (copy)
    local v19 = v13.new();
    local v20 = if v18 and v18.itemRestrictions then v18.itemRestrictions else {};
    v19.resellableCount = if v18 and v18.resellableCount then v18.resellableCount else 0;
    if v17.status == Enum.MarketplaceItemPurchaseStatus.Success and v17.type == Enum.MarketplaceProductType.AvatarAsset then
        v19.owned = true;
        if v20[l_ItemRestrictions_0.Collectible] or v20[l_ItemRestrictions_0.Limited] or v20[l_ItemRestrictions_0.LimitedUnique] then
            v19.resellableCount = v19.resellableCount + 1;
        end;
    end;
    return v19;
end;
v13.fromAvatarPreviewItem = function(v21) --[[ Line: 136 ]] --[[ Name: fromAvatarPreviewItem ]]
    -- upvalues: v13 (copy)
    local v22 = v13.new();
    v22.name = v21.name;
    v22.description = v21.description;
    v22.price = v21.priceInRobux;
    v22.productId = tostring(v21.productId);
    v22.collectibleItemId = v21.collectibleItemId;
    v22.owned = v21.quantityOwned > 0;
    v22.resellableCount = v21.quantityOwned;
    v22.creatorId = tostring(v21.creator.id);
    v22.creatorName = v21.creator.name;
    v22.creatorHasVerifiedBadge = v21.creator.hasVerifiedBadge;
    v22.assetId = tostring(v21.id);
    v22.assetTypeId = tostring(v21.assetType);
    v22.productId = tostring(v21.productId);
    v22.isForSale = v21.isPurchasable;
    v22.noPriceStatus = v21.noPriceStatus;
    v22.meta = v21.meta;
    if v21.itemRestrictions then
        local v23 = {};
        for _, v25 in v21.itemRestrictions do
            v23[v25] = true;
        end;
        v22.itemRestrictions = v23;
    end;
    return v22;
end;
v13.fromGetProductInfo = function(v26) --[[ Line: 167 ]] --[[ Name: fromGetProductInfo ]]
    -- upvalues: v13 (copy), v6 (copy), v10 (copy)
    local v27 = v13.new();
    v27.name = v26.Name;
    v27.description = v26.Description;
    v27.price = v26.PriceInRobux;
    v27.productType = v26.ProductType;
    v27.remaining = v26.Remaining;
    v27.creatorId = tostring(v26.Creator.Id);
    v27.creatorName = v26.Creator.Name;
    v27.assetId = tostring(v26.AssetId);
    v27.assetTypeId = tostring(v26.AssetTypeId);
    v27.productId = tostring(v26.ProductId);
    v27.isForSale = v26.IsForSale;
    v27.canBeSoldInThisGame = v26.CanBeSoldInThisGame;
    v27.saleLocation = v26.SaleLocation;
    v27.remaining = v26.Remaining or 0;
    if v27.productType == v6.ProductType.CollectibleItem then
        v27.collectibleItemId = v26.CollectibleItemId or "";
        v27.collectibleProductId = v26.CollectibleProductId or "";
        if v26.CollectiblesItemDetails then
            v27.collectibleLowestResalePrice = v26.CollectiblesItemDetails.CollectibleLowestResalePrice or 0;
            v27.collectibleLowestAvailableResaleProductId = v26.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or "";
            v27.collectibleLowestAvailableResaleItemInstanceId = v26.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or "";
            v27.collectibleQuantityLimitPerUser = v26.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0;
            v27.collectibleIsLimited = v26.CollectiblesItemDetails.IsLimited;
        end;
    end;
    v27.creatorHasVerifiedBadge = v26.Creator.HasVerifiedBadge;
    if v10() then
        v27.isLimited = v26.IsLimited;
        v27.isLimitedUnique = v26.IsLimitedUnique;
        return v27;
    else
        v27.isLimited = v26.IsLimited or v26.IsLimitedUnique;
        return v27;
    end;
end;
v13.fromHumanoidDescription = function(v28) --[[ Line: 212 ]] --[[ Name: fromHumanoidDescription ]]
    -- upvalues: v13 (copy)
    local v29 = v13.new();
    v29.assetId = tostring(v28);
    return v29;
end;
v13.fromHumanoidDescriptionAccessory = function(v30) --[[ Line: 220 ]] --[[ Name: fromHumanoidDescriptionAccessory ]]
    -- upvalues: v13 (copy)
    local v31 = v13.new();
    v31.assetId = tostring(v30.AssetId);
    v31.meta = {};
    v31.meta.position = {
        x = math.round(v30.Position.X * 100) / 100, 
        y = math.round(v30.Position.Y * 100) / 100, 
        z = math.round(v30.Position.Z * 100) / 100
    };
    v31.meta.rotation = {
        x = math.round(v30.Rotation.X * 100) / 100, 
        y = math.round(v30.Rotation.Y * 100) / 100, 
        z = math.round(v30.Rotation.Z * 100) / 100
    };
    v31.meta.scale = {
        x = math.round(v30.Scale.X * 100) / 100, 
        y = math.round(v30.Scale.Y * 100) / 100, 
        z = math.round(v30.Scale.Z * 100) / 100
    };
    if v30.IsLayered then
        v31.meta.order = v30.Order;
    end;
    return v31;
end;
v13.fromGetAssetBundles = function(v32, v33) --[[ Line: 250 ]] --[[ Name: fromGetAssetBundles ]]
    -- upvalues: v13 (copy)
    local v34 = v13.new();
    v34.assetId = tostring(v32);
    v34.bundlesAssetIsIn = v33;
    return v34;
end;
v13.fromGetFavoriteForAsset = function(v35, v36) --[[ Line: 260 ]] --[[ Name: fromGetFavoriteForAsset ]]
    -- upvalues: v13 (copy)
    local v37 = v13.new();
    v37.assetId = tostring(v35);
    v37.isFavorited = v36;
    return v37;
end;
v13.fromBundleInfo = function(v38, v39) --[[ Line: 267 ]] --[[ Name: fromBundleInfo ]]
    -- upvalues: v13 (copy), v6 (copy)
    local v40 = v13.new();
    v40.assetId = tostring(v38);
    v40.parentBundleId = v39.bundleId;
    v40.bundlesAssetIsIn = {
        v39.bundleId
    };
    v40.collectibleItemId = v39.collectibleItemId;
    v40.collectibleProductId = v39.collectibleProductId;
    v40.collectibleLowestResalePrice = v39.collectibleLowestResalePrice;
    v40.collectibleLowestAvailableResaleProductId = v39.collectibleLowestAvailableResaleProductId;
    v40.collectibleLowestAvailableResaleItemInstanceId = v39.collectibleLowestAvailableResaleItemInstanceId;
    v40.collectibleQuantityLimitPerUser = v39.collectibleQuantityLimitPerUser;
    v40.collectibleIsLimited = v39.collectibleIsLimited;
    v40.isForSale = v39.isForSale;
    v40.remaining = v39.remaining;
    v40.owned = v39.owned;
    if not v40.collectibleIsLimited then
        v40.isForSale = v40.isForSale and not v40.owned;
    end;
    v40.description = v39.description or "";
    v40.productType = v6.ProductType.CollectibleItem;
    if v39.price then
        v40.price = v39.price;
    end;
    return v40;
end;
v13.fromGetAssetFavoriteCount = function(v41, v42) --[[ Line: 309 ]] --[[ Name: fromGetAssetFavoriteCount ]]
    -- upvalues: v13 (copy)
    local v43 = v13.new();
    v43.assetId = tostring(v41);
    v43.numFavorites = v42;
    return v43;
end;
v13.fromGetEconomyProductInfo = function(v44, v45, v46, v47, v48) --[[ Line: 318 ]] --[[ Name: fromGetEconomyProductInfo ]]
    -- upvalues: v13 (copy)
    local v49 = v13.new();
    v49.assetId = tostring(v44.assetId);
    v49.owned = v45;
    if v46 then
        v49.price = v46;
    end;
    v49.isForSale = v47;
    v49.premiumPricing = v48;
    return v49;
end;
v13.fromGetItemDetailsV2 = function(v50) --[[ Line: 332 ]] --[[ Name: fromGetItemDetailsV2 ]]
    -- upvalues: v13 (copy)
    local v51 = v13.new();
    v51.assetId = tostring(v50.id);
    v51.isForSale = v50.isPurchasable;
    v51.price = v50.price or 0;
    v51.hasResellers = v50.hasResellers;
    v51.collectibleItemId = v50.collectibleItemId;
    local v52 = {};
    if v50.itemRestrictions then
        for _, v54 in v50.itemRestrictions do
            v52[v54] = true;
        end;
        v51.itemRestrictions = v52;
    end;
    v51.saleLocationType = v50.saleLocationType;
    v51.remaining = v50.unitsAvailableForConsumption;
    v51.collectibleTotalQuantity = v50.totalQuantity;
    v51.collectibleLowestResalePrice = v50.lowestResalePrice;
    v51.isOffSale = v50.isOffSale;
    v51.saleLocationType = v50.saleLocationType;
    v51.numFavorites = v50.favoriteCount;
    v51.catalogPriceStatus = v50.priceStatus;
    return v51;
end;
v13.fromGetItemDetails = function(v55) --[[ Line: 361 ]] --[[ Name: fromGetItemDetails ]]
    -- upvalues: v13 (copy), v11 (copy), l_FFlagIBV2Attribution_0 (copy)
    local v56 = v13.new();
    v56.assetId = tostring(v55.Id);
    v56.owned = v55.Owned;
    v56.isForSale = v55.IsPurchasable;
    v56.price = v55.Price or 0;
    v56.hasResellers = v55.HasResellers;
    v56.collectibleItemId = v55.CollectibleItemId;
    if v11 then
        local v57 = {};
        if v55.ItemRestrictions then
            for _, v59 in v55.ItemRestrictions do
                v57[v59] = true;
            end;
            v56.itemRestrictions = v57;
        end;
        v56.saleLocationType = v55.SaleLocationType;
        v56.remaining = v55.UnitsAvailableForConsumption;
        v56.collectibleTotalQuantity = v55.TotalQuantity;
        v56.collectibleLowestResalePrice = v55.LowestResalePrice;
        v56.isOffSale = v55.IsOffSale;
        v56.saleLocationType = v55.SaleLocationType;
        v56.numFavorites = v55.FavoriteCount;
        v56.catalogPriceStatus = v55.PriceStatus;
    end;
    if l_FFlagIBV2Attribution_0 then
        v56.creatingUniverseId = v55.CreatingUniverseId;
    end;
    return v56;
end;
v13.fromPurchaseSuccess = function(v60) --[[ Line: 397 ]] --[[ Name: fromPurchaseSuccess ]]
    -- upvalues: v13 (copy)
    local v61 = v13.new();
    v61.assetId = tostring(v60);
    v61.owned = true;
    return v61;
end;
v13.fromGetVersionInfo = function(v62, v63) --[[ Line: 410 ]] --[[ Name: fromGetVersionInfo ]]
    -- upvalues: v13 (copy)
    local v64 = v13.new();
    v64.assetId = tostring(v62);
    v64.creatingUniverseId = if v63.creatingUniverseId then tostring(v63.creatingUniverseId) else nil;
    return v64;
end;
v13.getSaleDetailsForCollectibles = function(v65) --[[ Line: 421 ]] --[[ Name: getSaleDetailsForCollectibles ]]
    -- upvalues: v3 (copy), v6 (copy), v9 (copy)
    local v66 = v3.joinDeep({}, v65);
    local l_saleLocation_0 = v65.saleLocation;
    if v65.productType == v6.ProductType.CollectibleItem then
        local v68 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v6.SaleLocationType.ShopOnly;
        local v69 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v6.SaleLocationType.ShopAndExperiencesById;
        local v70 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType == v6.SaleLocationType.ShopAndExperiencesById and type(l_saleLocation_0.UniverseIds) == "table" and table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
        local v71 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v6.SaleLocationType.ExperiencesDevApiOnly;
        v66.isForSale = v65.isForSale and v65.canBeSoldInThisGame and v68 and (v69 or v70) and v71;
        if not v65.collectibleIsLimited then
            v66.isForSale = v66.isForSale and not v66.owned;
            return v66;
        end;
    elseif v9 then
        v66.isForSale = v65.isForSale and v65.canBeSoldInThisGame;
        if v65.canBeSoldInThisGame == nil then
            v66.isForSale = v65.isForSale;
            return v66;
        end;
    else
        v66.isForSale = v65.isForSale;
    end;
    return v66;
end;
return v13;