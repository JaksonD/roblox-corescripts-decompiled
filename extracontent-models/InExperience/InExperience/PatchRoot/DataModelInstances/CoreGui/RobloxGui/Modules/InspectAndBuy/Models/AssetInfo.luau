local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.MockId);
local v7 = require(l_Parent_0.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_ItemRestrictions_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions;
local v10 = require(l_CoreGui_0.RobloxGui.Modules.Flags.FFlagEnableRestrictedAssetSaleLocationInspectAndBuy);
local v11 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v12 = require(l_Parent_0.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog);
local l_FFlagIBV2Attribution_0 = v1.FFlagIBV2Attribution;
local v14 = {};
local function _(v15) --[[ Line: 64 ]]
    return math.round(v15 * 100) / 100;
end;
v14.new = function() --[[ Line: 68 ]] --[[ Name: new ]]
    return {};
end;
v14.mock = function() --[[ Line: 74 ]] --[[ Name: mock ]]
    -- upvalues: v14 (copy), v6 (copy), v11 (copy)
    local v17 = v14.new();
    v17.name = "";
    v17.assetId = v6();
    v17.assetTypeId = "";
    v17.creatorId = "";
    v17.creatorName = "";
    v17.creatorHasVerifiedBadge = false;
    v17.owned = false;
    v17.isForSale = false;
    v17.description = "";
    v17.price = "";
    v17.productId = "";
    v17.isLimited = false;
    v17.isLimitedUnique = not v11() and nil;
    v17.collectibleIsLimited = not v11() and nil;
    v17.bundlesAssetIsIn = {};
    v17.parentBundleId = nil;
    v17.numFavorites = 0;
    v17.minimumMembershipLevel = 0;
    v17.collectibleItemId = "";
    v17.collectibleProductId = "";
    v17.collectibleLowestResalePrice = 0;
    v17.collectibleLowestAvailableResaleProductId = "";
    v17.collectibleLowestAvailableResaleItemInstanceId = "";
    v17.collectibleQuantityLimitPerUser = 0;
    v17.remaining = 0;
    v17.creatingUniverseId = nil;
    return v17;
end;
v14.fromBulkPurchaseResult = function(v18, v19) --[[ Line: 116 ]] --[[ Name: fromBulkPurchaseResult ]]
    -- upvalues: v14 (copy), l_ItemRestrictions_0 (copy)
    local v20 = v14.new();
    local v21 = if v19 and v19.itemRestrictions then v19.itemRestrictions else {};
    v20.resellableCount = if v19 and v19.resellableCount then v19.resellableCount else 0;
    if v18.status == Enum.MarketplaceItemPurchaseStatus.Success and v18.type == Enum.MarketplaceProductType.AvatarAsset then
        v20.owned = true;
        if v21[l_ItemRestrictions_0.Collectible] or v21[l_ItemRestrictions_0.Limited] or v21[l_ItemRestrictions_0.LimitedUnique] then
            v20.resellableCount = v20.resellableCount + 1;
        end;
    end;
    return v20;
end;
v14.fromAvatarPreviewItem = function(v22) --[[ Line: 138 ]] --[[ Name: fromAvatarPreviewItem ]]
    -- upvalues: v14 (copy)
    local v23 = v14.new();
    v23.name = v22.name;
    v23.description = v22.description;
    v23.price = v22.priceInRobux;
    v23.productId = tostring(v22.productId);
    v23.collectibleItemId = v22.collectibleItemId;
    v23.owned = v22.quantityOwned > 0;
    v23.resellableCount = v22.quantityOwned;
    v23.creatorId = tostring(v22.creator.id);
    v23.creatorName = v22.creator.name;
    v23.creatorHasVerifiedBadge = v22.creator.hasVerifiedBadge;
    v23.assetId = tostring(v22.id);
    v23.assetTypeId = tostring(v22.assetType);
    v23.productId = tostring(v22.productId);
    v23.isForSale = v22.isPurchasable;
    v23.noPriceStatus = v22.noPriceStatus;
    v23.meta = v22.meta;
    if v22.itemRestrictions then
        local v24 = {};
        for _, v26 in v22.itemRestrictions do
            v24[v26] = true;
        end;
        v23.itemRestrictions = v24;
    end;
    return v23;
end;
v14.fromGetProductInfo = function(v27) --[[ Line: 169 ]] --[[ Name: fromGetProductInfo ]]
    -- upvalues: v14 (copy), v7 (copy), v11 (copy)
    local v28 = v14.new();
    v28.name = v27.Name;
    v28.description = v27.Description;
    v28.price = v27.PriceInRobux;
    v28.productType = v27.ProductType;
    v28.remaining = v27.Remaining;
    v28.creatorId = tostring(v27.Creator.Id);
    v28.creatorName = v27.Creator.Name;
    v28.assetId = tostring(v27.AssetId);
    v28.assetTypeId = tostring(v27.AssetTypeId);
    v28.productId = tostring(v27.ProductId);
    v28.isForSale = v27.IsForSale;
    v28.canBeSoldInThisGame = v27.CanBeSoldInThisGame;
    v28.saleLocation = v27.SaleLocation;
    v28.remaining = v27.Remaining or 0;
    if v28.productType == v7.ProductType.CollectibleItem then
        v28.collectibleItemId = v27.CollectibleItemId or "";
        v28.collectibleProductId = v27.CollectibleProductId or "";
        if v27.CollectiblesItemDetails then
            v28.collectibleLowestResalePrice = v27.CollectiblesItemDetails.CollectibleLowestResalePrice or 0;
            v28.collectibleLowestAvailableResaleProductId = v27.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or "";
            v28.collectibleLowestAvailableResaleItemInstanceId = v27.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or "";
            v28.collectibleQuantityLimitPerUser = v27.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0;
            v28.collectibleIsLimited = v27.CollectiblesItemDetails.IsLimited;
        end;
    end;
    v28.creatorHasVerifiedBadge = v27.Creator.HasVerifiedBadge;
    if v11() then
        v28.isLimited = v27.IsLimited;
        v28.isLimitedUnique = v27.IsLimitedUnique;
        return v28;
    else
        v28.isLimited = v27.IsLimited or v27.IsLimitedUnique;
        return v28;
    end;
end;
v14.fromHumanoidDescription = function(v29) --[[ Line: 214 ]] --[[ Name: fromHumanoidDescription ]]
    -- upvalues: v14 (copy)
    local v30 = v14.new();
    v30.assetId = tostring(v29);
    return v30;
end;
v14.fromHumanoidDescriptionAccessory = function(v31) --[[ Line: 222 ]] --[[ Name: fromHumanoidDescriptionAccessory ]]
    -- upvalues: v14 (copy)
    local v32 = v14.new();
    v32.assetId = tostring(v31.AssetId);
    v32.meta = {};
    v32.meta.position = {
        x = math.round(v31.Position.X * 100) / 100, 
        y = math.round(v31.Position.Y * 100) / 100, 
        z = math.round(v31.Position.Z * 100) / 100
    };
    v32.meta.rotation = {
        x = math.round(v31.Rotation.X * 100) / 100, 
        y = math.round(v31.Rotation.Y * 100) / 100, 
        z = math.round(v31.Rotation.Z * 100) / 100
    };
    v32.meta.scale = {
        x = math.round(v31.Scale.X * 100) / 100, 
        y = math.round(v31.Scale.Y * 100) / 100, 
        z = math.round(v31.Scale.Z * 100) / 100
    };
    if v31.IsLayered then
        v32.meta.order = v31.Order;
    end;
    return v32;
end;
v14.fromGetAssetBundles = function(v33, v34) --[[ Line: 252 ]] --[[ Name: fromGetAssetBundles ]]
    -- upvalues: v14 (copy)
    local v35 = v14.new();
    v35.assetId = tostring(v33);
    v35.bundlesAssetIsIn = v34;
    return v35;
end;
v14.fromGetFavoriteForAsset = function(v36, v37) --[[ Line: 262 ]] --[[ Name: fromGetFavoriteForAsset ]]
    -- upvalues: v14 (copy)
    local v38 = v14.new();
    v38.assetId = tostring(v36);
    v38.isFavorited = v37;
    return v38;
end;
v14.fromBundleInfo = function(v39, v40) --[[ Line: 269 ]] --[[ Name: fromBundleInfo ]]
    -- upvalues: v14 (copy), v7 (copy)
    local v41 = v14.new();
    v41.assetId = tostring(v39);
    v41.parentBundleId = v40.bundleId;
    v41.bundlesAssetIsIn = {
        v40.bundleId
    };
    v41.collectibleItemId = v40.collectibleItemId;
    v41.collectibleProductId = v40.collectibleProductId;
    v41.collectibleLowestResalePrice = v40.collectibleLowestResalePrice;
    v41.collectibleLowestAvailableResaleProductId = v40.collectibleLowestAvailableResaleProductId;
    v41.collectibleLowestAvailableResaleItemInstanceId = v40.collectibleLowestAvailableResaleItemInstanceId;
    v41.collectibleQuantityLimitPerUser = v40.collectibleQuantityLimitPerUser;
    v41.collectibleIsLimited = v40.collectibleIsLimited;
    v41.isForSale = v40.isForSale;
    v41.remaining = v40.remaining;
    v41.owned = v40.owned;
    if not v41.collectibleIsLimited then
        v41.isForSale = v41.isForSale and not v41.owned;
    end;
    v41.description = v40.description or "";
    v41.productType = v7.ProductType.CollectibleItem;
    if v40.price then
        v41.price = v40.price;
    end;
    return v41;
end;
v14.fromGetAssetFavoriteCount = function(v42, v43) --[[ Line: 311 ]] --[[ Name: fromGetAssetFavoriteCount ]]
    -- upvalues: v14 (copy)
    local v44 = v14.new();
    v44.assetId = tostring(v42);
    v44.numFavorites = v43;
    return v44;
end;
v14.fromGetEconomyProductInfo = function(v45, v46, v47, v48, v49) --[[ Line: 320 ]] --[[ Name: fromGetEconomyProductInfo ]]
    -- upvalues: v14 (copy)
    local v50 = v14.new();
    v50.assetId = tostring(v45.assetId);
    v50.owned = v46;
    if v47 then
        v50.price = v47;
    end;
    v50.isForSale = v48;
    v50.premiumPricing = v49;
    return v50;
end;
v14.fromGetItemDetailsV2 = function(v51) --[[ Line: 334 ]] --[[ Name: fromGetItemDetailsV2 ]]
    -- upvalues: v14 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy)
    local v52 = v14.new();
    v52.assetId = tostring(v51.id);
    v52.isForSale = v51.isPurchasable;
    v52.price = v51.price or 0;
    v52.hasResellers = v51.hasResellers;
    v52.collectibleItemId = v51.collectibleItemId;
    local v53 = {};
    if v51.itemRestrictions then
        for _, v55 in v51.itemRestrictions do
            v53[v55] = true;
        end;
        v52.itemRestrictions = v53;
    end;
    v52.saleLocationType = v51.saleLocationType;
    v52.remaining = v51.unitsAvailableForConsumption;
    v52.collectibleTotalQuantity = v51.totalQuantity;
    v52.collectibleLowestResalePrice = v51.lowestResalePrice;
    v52.isOffSale = v51.isOffSale;
    v52.saleLocationType = v51.saleLocationType;
    v52.numFavorites = v51.favoriteCount;
    v52.catalogPriceStatus = v51.priceStatus;
    if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then
        v52.timedOptions = v51.timedOptions;
    end;
    return v52;
end;
v14.fromGetItemDetails = function(v56) --[[ Line: 367 ]] --[[ Name: fromGetItemDetails ]]
    -- upvalues: v14 (copy), v12 (copy), l_FFlagIBV2Attribution_0 (copy)
    local v57 = v14.new();
    v57.assetId = tostring(v56.Id);
    v57.owned = v56.Owned;
    v57.isForSale = v56.IsPurchasable;
    v57.price = v56.Price or 0;
    v57.hasResellers = v56.HasResellers;
    v57.collectibleItemId = v56.CollectibleItemId;
    if v12 then
        local v58 = {};
        if v56.ItemRestrictions then
            for _, v60 in v56.ItemRestrictions do
                v58[v60] = true;
            end;
            v57.itemRestrictions = v58;
        end;
        v57.saleLocationType = v56.SaleLocationType;
        v57.remaining = v56.UnitsAvailableForConsumption;
        v57.collectibleTotalQuantity = v56.TotalQuantity;
        v57.collectibleLowestResalePrice = v56.LowestResalePrice;
        v57.isOffSale = v56.IsOffSale;
        v57.saleLocationType = v56.SaleLocationType;
        v57.numFavorites = v56.FavoriteCount;
        v57.catalogPriceStatus = v56.PriceStatus;
    end;
    if l_FFlagIBV2Attribution_0 then
        v57.creatingUniverseId = v56.CreatingUniverseId;
    end;
    return v57;
end;
v14.fromPurchaseSuccess = function(v61) --[[ Line: 403 ]] --[[ Name: fromPurchaseSuccess ]]
    -- upvalues: v14 (copy)
    local v62 = v14.new();
    v62.assetId = tostring(v61);
    v62.owned = true;
    return v62;
end;
v14.fromGetVersionInfo = function(v63, v64) --[[ Line: 416 ]] --[[ Name: fromGetVersionInfo ]]
    -- upvalues: v14 (copy)
    local v65 = v14.new();
    v65.assetId = tostring(v63);
    v65.creatingUniverseId = if v64.creatingUniverseId then tostring(v64.creatingUniverseId) else nil;
    return v65;
end;
v14.getSaleDetailsForCollectibles = function(v66) --[[ Line: 427 ]] --[[ Name: getSaleDetailsForCollectibles ]]
    -- upvalues: v3 (copy), v7 (copy), v10 (copy)
    local v67 = v3.joinDeep({}, v66);
    local l_saleLocation_0 = v66.saleLocation;
    if v66.productType == v7.ProductType.CollectibleItem then
        local v69 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v7.SaleLocationType.ShopOnly;
        local v70 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v7.SaleLocationType.ShopAndExperiencesById;
        local v71 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType == v7.SaleLocationType.ShopAndExperiencesById and type(l_saleLocation_0.UniverseIds) == "table" and table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
        local v72 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v7.SaleLocationType.ExperiencesDevApiOnly;
        v67.isForSale = v66.isForSale and v66.canBeSoldInThisGame and v69 and (v70 or v71) and v72;
        if not v66.collectibleIsLimited then
            v67.isForSale = v67.isForSale and not v67.owned;
            return v67;
        end;
    elseif v10 then
        v67.isForSale = v66.isForSale and v66.canBeSoldInThisGame;
        if v66.canBeSoldInThisGame == nil then
            v67.isForSale = v66.isForSale;
            return v67;
        end;
    else
        v67.isForSale = v66.isForSale;
    end;
    return v67;
end;
return v14;