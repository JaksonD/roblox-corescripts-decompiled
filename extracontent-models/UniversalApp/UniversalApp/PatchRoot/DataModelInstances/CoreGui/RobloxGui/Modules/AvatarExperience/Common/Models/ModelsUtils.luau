local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTileEnums_0 = v4.Tile.ItemTileEnums;
local v8 = require(l_CorePackages_0.Packages.tutils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXHydrateAssetFromBundleItems_0 = v10.FFlagAXHydrateAssetFromBundleItems;
local l_FFlagAXDurablesSupport_0 = v10.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForPermanent_0 = v10.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v10.FFlagAXMISEnableMultiShopping;
local l_FFlagAXUseTaxonomyInItemDetailsType_0 = v10.FFlagAXUseTaxonomyInItemDetailsType;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v23 = {
    CreateRestrictionInfo = function(v17) --[[ Line: 39 ]] --[[ Name: CreateRestrictionInfo ]]
        -- upvalues: v2 (copy), v6 (copy), l_ItemTileEnums_0 (copy)
        if not v17 then
            return nil, nil;
        else
            local v18 = v2.List.toSet(v17);
            local v19 = v18[v6.ItemRestrictions.Limited];
            local v20 = v18[v6.ItemRestrictions.LimitedUnique];
            local v21 = v18[v6.ItemRestrictions.Collectible];
            local v22 = nil;
            if v19 or v20 or v21 then
                v22 = {
                    [l_ItemTileEnums_0.Restriction.Limited] = v19, 
                    [l_ItemTileEnums_0.Restriction.LimitedUnique] = v20, 
                    [l_ItemTileEnums_0.Restriction.Collectible] = v21
                };
            end;
            return v18, v22;
        end;
    end
};
v23.itemDataFromAssetInfo = function(v24, v25) --[[ Line: 63 ]] --[[ Name: itemDataFromAssetInfo ]]
    -- upvalues: v8 (copy), v23 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy), v3 (copy), l_FFlagAXUseTaxonomyInItemDetailsType_0 (copy)
    local v26 = v8.deepCopy(v25 or {});
    local v27, v28 = v23.CreateRestrictionInfo(v24.itemRestrictions);
    local v29 = if v24.productId then {
        id = tostring(v24.productId)
    } else nil;
    local v30 = if v24.creatorTargetId then {
        id = tostring(v24.creatorTargetId), 
        name = v24.creatorName, 
        type = v24.creatorType, 
        hasVerifiedBadge = v24.creatorHasVerifiedBadge
    } else nil;
    local v31 = nil;
    if l_FFlagAXDurablesSupport_0 and v24.timedOptions then
        v31 = v24.timedOptions;
        local v32 = nil;
        if l_FFlagAXDurablesSupportForPermanent_0 then
            v32 = false;
            for _, v34 in v31 do
                if v34.selected then
                    v32 = true;
                end;
            end;
        end;
        table.insert(v31, {
            days = 0, 
            price = v24.price, 
            selected = l_FFlagAXDurablesSupportForPermanent_0 and not v32 or nil
        });
    end;
    return (v3.join(v26, {
        id = if v24.id then tostring(v24.id) else nil, 
        assetType = if v24.assetType then tostring(v24.assetType) else nil, 
        name = v24.name, 
        description = v24.description, 
        product = v29, 
        genres = v24.genres, 
        creator = v30, 
        priceInRobux = v24.price, 
        lowestPrice = v24.lowestPrice, 
        lowestResalePrice = v24.lowestResalePrice, 
        favoriteCount = v24.favoriteCount, 
        itemStatus = v24.itemStatus, 
        itemRestrictions = v27, 
        tileRestrictionsMap = v28, 
        priceStatus = v24.priceStatus, 
        numberRobloxHasAvailable = v24.unitsAvailableForConsumption or v24.numberRobloxHasAvailable, 
        totalQuantity = v24.totalQuantity, 
        isForRent = v24.isForRent, 
        isOwned = v24.owned, 
        isPurchasable = v24.isPurchasable, 
        expectedSellerId = if v24.expectedSellerId then tostring(v24.expectedSellerId) else nil, 
        premiumPricing = v24.premiumPricing, 
        collectibleItemId = v24.collectibleItemId, 
        saleLocationType = v24.saleLocationType, 
        hasResellers = v24.hasResellers, 
        isOffSale = v24.isOffSale, 
        isPBR = v24.isPBR, 
        variantAttributes = if l_FFlagAXDurablesSupport_0 then v24.variantAttributes else nil, 
        timedOptions = if l_FFlagAXDurablesSupport_0 then v31 else nil, 
        creatingUniverseId = if v24.creatingUniverseId then tostring(v24.creatingUniverseId) else nil, 
        taxonomy = if l_FFlagAXUseTaxonomyInItemDetailsType_0 then v24.taxonomy else nil
    }));
end;
v23.itemDataFromBundleInfo = function(v35, v36, v37) --[[ Line: 145 ]] --[[ Name: itemDataFromBundleInfo ]]
    -- upvalues: v8 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v23 (copy), l_FFlagAXHydrateAssetFromBundleItems_0 (copy), v2 (copy), v3 (copy), l_FFlagAXUseTaxonomyInItemDetailsType_0 (copy)
    local v38 = v8.deepCopy(v37 or {});
    local v39 = {};
    if l_FFlagAXMISEnableMultiShopping_0 and v38.items then
        for _, v41 in v38.items do
            v39[v41.id] = v41;
        end;
    end;
    local v42, v43 = v23.CreateRestrictionInfo(v35.itemRestrictions);
    local v44 = if v35.productId then {
        id = tostring(v35.productId)
    } else nil;
    local v45 = if v35.creatorTargetId then {
        id = tostring(v35.creatorTargetId), 
        name = v35.creatorName, 
        type = v35.creatorType, 
        hasVerifiedBadge = v35.creatorHasVerifiedBadge
    } else nil;
    local v46 = nil;
    if v35.bundledItems then
        v46 = {};
        for _, v48 in v35.bundledItems do
            local v49 = {
                id = tostring(v48.id), 
                assetType = if l_FFlagAXHydrateAssetFromBundleItems_0 and v48.assetType then tostring(v48.assetType) else nil, 
                type = v48.type
            };
            if l_FFlagAXMISEnableMultiShopping_0 then
                local v50 = v39[tostring(v48.id)];
                if v50 then
                    v49 = v2.Dictionary.join(v50, v49);
                end;
            end;
            table.insert(v46, v49);
        end;
    end;
    return (v3.join(v38, {
        id = if v35.id then tostring(v35.id) else nil, 
        itemType = v35.itemType, 
        bundleType = v36, 
        name = v35.name, 
        description = v35.description, 
        product = v44, 
        genres = v35.genres, 
        creator = v45, 
        priceInRobux = v35.price, 
        favoriteCount = v35.favoriteCount, 
        itemStatus = v35.itemStatus, 
        itemRestrictions = v42, 
        tileRestrictionsMap = v43, 
        lowestPrice = v35.lowestPrice, 
        lowestResalePrice = v35.lowestResalePrice, 
        priceStatus = v35.priceStatus, 
        numberRobloxHasAvailable = v35.unitsAvailableForConsumption or v35.numberRobloxHasAvailable, 
        isForRent = v35.isForRent, 
        isOwned = v35.owned, 
        isPurchasable = v35.isPurchasable, 
        expectedSellerId = if v35.expectedSellerId then tostring(v35.expectedSellerId) else nil, 
        items = v46, 
        totalQuantity = v35.totalQuantity, 
        premiumPricing = v35.premiumPricing, 
        collectibleItemId = v35.collectibleItemId, 
        saleLocationType = v35.saleLocationType, 
        hasResellers = v35.hasResellers, 
        isOffSale = v35.isOffSale, 
        isRecolorable = v35.isRecolorable, 
        isPBR = v35.isPBR, 
        taxonomy = if l_FFlagAXUseTaxonomyInItemDetailsType_0 then v35.taxonomy else nil
    }));
end;
return v23;