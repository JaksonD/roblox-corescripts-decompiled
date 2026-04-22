local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_GenerateStringId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GenerateStringId;
local l_ItemTileEnums_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTileEnums;
local v5 = require(l_CorePackages_0.Packages.tutils);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(script.Parent.ModelsUtils);
local v13 = game:DefineFastFlag("FixEmptyLimitedBadges", false);
local l_FFlagAXHydrateAssetFromBundleItems_0 = v6.FFlagAXHydrateAssetFromBundleItems;
local l_FFlagAXDurablesSupportForRFYMigration_0 = v6.FFlagAXDurablesSupportForRFYMigration;
local l_FFlagAXBlackbirdRoot_0 = v6.FFlagAXBlackbirdRoot;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesSupport_0 = v6.FFlagAXInventoryDurablesSupport;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXFixRecommendedItemCreatorType_0 = v6.FFlagAXFixRecommendedItemCreatorType;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v6.FFlagAXInventoryDurablesExpiredFilter;
local v52 = {
    mock = function() --[[ Line: 38 ]] --[[ Name: mock ]]
        -- upvalues: v11 (copy), l_GenerateStringId_0 (copy)
        return {
            receivedCatalogData = false, 
            receivedRecommendedData = false, 
            receivedFromRecommendedData = false, 
            receivedFromBundleItemData = false, 
            receivedFromInventoryFetch = false, 
            receivedFromOutfitDetails = false, 
            receivedFromResaleData = false, 
            receivedFromVersionData = false, 
            name = "", 
            description = "", 
            creatorName = "", 
            assetType = v11.AssetTypeIdStrings.Hat, 
            id = l_GenerateStringId_0(), 
            priceInRobux = 1, 
            creator = {
                id = l_GenerateStringId_0(), 
                name = "", 
                type = "", 
                targetId = "", 
                hasVerifiedBadge = false
            }, 
            created = "", 
            updated = "", 
            genres = {}, 
            minimumMembershipLevel = 0, 
            product = {
                id = l_GenerateStringId_0(), 
                type = "", 
                isForSale = true
            }, 
            recommendedItemSummaries = {}, 
            favoriteCount = 0, 
            priceStatus = "", 
            itemRestrictions = {}, 
            itemStatus = {}, 
            lowestPrice = nil, 
            numberRobloxHasAvailable = nil, 
            totalQuantity = nil, 
            resellerUserAssetIds = {}, 
            soldCount = 0, 
            averagePrice = 0, 
            originalPrice = 0, 
            isForRent = false, 
            isOwned = false, 
            supportsHeadShapes = false, 
            isPurchasable = false, 
            expectedSellerId = l_GenerateStringId_0(), 
            creatingUniverseId = nil, 
            collectibleItemId = "0", 
            moderationStatus = nil
        };
    end, 
    fromRecommendedItemSummaries = function(v22, v23) --[[ Line: 114 ]] --[[ Name: fromRecommendedItemSummaries ]]
        -- upvalues: v5 (copy)
        local v24 = v5.deepCopy(v23 or {});
        v24.receivedRecommendedData = true;
        v24.recommendedItemSummaries = v22;
        return v24;
    end, 
    fromGetRecommendedItemsDataV2 = function(v25, v26, v27) --[[ Line: 126 ]] --[[ Name: fromGetRecommendedItemsDataV2 ]]
        -- upvalues: v12 (copy)
        local v28 = v12.itemDataFromAssetInfo(v25, v27);
        v28.receivedFromRecommendedData = true;
        if v26 then
            v28.assetType = v26;
        end;
        return v28;
    end, 
    fromHydrateWidgetInfo = function(v29, v30) --[[ Line: 140 ]] --[[ Name: fromHydrateWidgetInfo ]]
        -- upvalues: v5 (copy), v11 (copy), v13 (copy), l_ItemTileEnums_0 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy)
        local v31 = v5.deepCopy(v30 or {});
        v31.id = tostring(v29.id);
        if v29.failedToHydrate then
            v31.failedToHydrate = true;
            return v31;
        else
            v31.name = v29.name;
            v31.creator = {
                name = if v29.creator then v29.creator.name else v29.creatorName, 
                hasVerifiedBadge = if v29.creator then v29.creator.hasVerifiedBadge else nil
            };
            v31.assetType = v11.AssetTypeIdStrings[tostring(v29.assetType)];
            v31.priceInRobux = v29.price;
            v31.receivedWidgetHydration = true;
            local v32 = if v13 then nil else {};
            if v29.isLimited or v29.isLimitedUnique or v29.isCollectible then
                v32 = {
                    [l_ItemTileEnums_0.Restriction.Limited] = v29.isLimited and true or false, 
                    [l_ItemTileEnums_0.Restriction.LimitedUnique] = v29.isLimitedUnique and true or false, 
                    [l_ItemTileEnums_0.Restriction.Collectible] = v29.isCollectible and true or false
                };
            end;
            v31.tileRestrictionsMap = v32;
            if l_FFlagAXDurablesSupportForRFYMigration_0 and v29.timedOptions then
                local v33 = {};
                for _, v35 in v29.timedOptions do
                    table.insert(v33, {
                        days = v35.days, 
                        price = v35.price, 
                        selected = v35.selected
                    });
                end;
                v31.timedOptions = v33;
            end;
            return v31;
        end;
    end, 
    fromGetRecommendedItemsData = function(v36, v37, v38) --[[ Line: 192 ]] --[[ Name: fromGetRecommendedItemsData ]]
        -- upvalues: v5 (copy), l_FFlagAXFixRecommendedItemCreatorType_0 (copy)
        local v39 = v5.deepCopy(v38 or {});
        v39.receivedFromRecommendedData = true;
        if v36.item then
            v39.name = v36.item.name;
            v39.id = tostring(v36.item.assetId);
            v39.priceInRobux = v36.item.price;
        end;
        if v36.product and v36.product.isFree then
            v39.priceInRobux = 0;
        end;
        if v36.product then
            v39.product = {
                id = tostring(v36.product.id)
            };
        end;
        if v36.creator then
            v39.creator = {
                id = tostring(v36.creator.creatorId), 
                name = v36.creator.name, 
                type = if l_FFlagAXFixRecommendedItemCreatorType_0 then v36.creator.creatorType else v36.creator.type
            };
        end;
        if v37 then
            v39.assetType = v37;
        end;
        return v39;
    end, 
    fromGetCatalogItemData = function(v40, v41) --[[ Line: 233 ]] --[[ Name: fromGetCatalogItemData ]]
        -- upvalues: v12 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), l_FFlagAXBlackbirdRoot_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v11 (copy)
        local v42 = v12.itemDataFromAssetInfo(v40, v41);
        if not l_FFlagAXInventoryDurablesExpiredFilter_0 or not v40.skipReceivedCatalogData then
            v42.receivedCatalogData = true;
        end;
        if v40.timedOptions then
            local v43 = {};
            for _, v45 in v40.timedOptions do
                table.insert(v43, {
                    days = v45.days, 
                    price = v45.price, 
                    discountInformation = if l_FFlagAXBlackbirdRoot_0 and v45.days ~= 0 then v45.discountInformation else v40.discountInformation, 
                    selected = v45.selected
                });
            end;
            v42.timedOptions = v43;
        end;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v42.expirationTime = v40.expirationTime;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 then
            v42.assetType = if tonumber(v40.assetType) then tostring(v40.assetType) else v11.AssetTypeIdStrings[tostring(v40.assetType)];
            return v42;
        else
            v42.assetType = v11.AssetTypeIdStrings[tostring(v40.assetType)];
            return v42;
        end;
    end, 
    fromBundleItemData = function(v46, v47) --[[ Line: 275 ]] --[[ Name: fromBundleItemData ]]
        -- upvalues: v5 (copy)
        local v48 = v5.deepCopy(v47 or {});
        v48.receivedFromBundleItemData = true;
        v48.id = tostring(v46.id);
        v48.name = v46.name;
        v48.isOwned = v46.owned;
        return v48;
    end, 
    fromSortResults = function(v49, v50) --[[ Line: 286 ]] --[[ Name: fromSortResults ]]
        -- upvalues: v12 (copy)
        local v51 = v12.itemDataFromAssetInfo(v49, v50);
        v51.receivedFromSortResults = true;
        return v51;
    end
};
if l_FFlagAXHydrateAssetFromBundleItems_0 then
    v52.fromBundledItems = function(v53, v54) --[[ Line: 293 ]] --[[ Name: fromBundledItems ]]
        -- upvalues: v12 (copy)
        return v12.itemDataFromAssetInfo(v53, v54);
    end;
end;
v52.fromInventoryFetch = function(v55, v56) --[[ Line: 298 ]] --[[ Name: fromInventoryFetch ]]
    -- upvalues: v5 (copy), v11 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    local v57 = v5.deepCopy(v56 or {});
    v57.receivedFromInventoryFetch = true;
    v57.id = tostring(v55.assetId);
    v57.name = v55.name;
    v57.assetType = v11.AssetTypeIdStrings[v55.assetType];
    if v55.moderationStatus then
        v57.moderationStatus = v55.moderationStatus;
    end;
    if v55.creatingUniverseId then
        v57.creatingUniverseId = v55.creatingUniverseId;
    end;
    if l_FFlagAXInventoryDurablesSupport_0 and v55.expirationTime then
        v57.expirationTime = v55.expirationTime;
    end;
    return v57;
end;
v52.fromAssetGrant = function(v58, v59, v60) --[[ Line: 323 ]] --[[ Name: fromAssetGrant ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v61 = v5.deepCopy(v60 or {});
    v2.isType(v58, "string", "AssetInfo.fromAssetGrant expects assetId to be a string");
    v2.isType(v59, "string", "AssetInfo.fromAssetGrant expects assetType to be a string");
    v61.id = v58;
    v61.assetType = v59;
    v61.moderationStatus = Enum.ModerationStatus.NotReviewed;
    return v61;
end;
v52.fromModerationStatusUpdate = function(v62, v63, v64, v65, v66, v67) --[[ Line: 340 ]] --[[ Name: fromModerationStatusUpdate ]]
    -- upvalues: v5 (copy)
    local v68 = v5.deepCopy(v67 or {});
    v68.moderationStatus = v62;
    v68.updateCounter = v63;
    v68.id = v64;
    v68.name = v65;
    v68.creatingUniverseId = v66;
    return v68;
end;
v52.fromOutfitDetails = function(v69, v70, v71) --[[ Line: 358 ]] --[[ Name: fromOutfitDetails ]]
    -- upvalues: v5 (copy), l_FFlagDynamicHeadsMigration_0 (copy)
    local v72 = v5.deepCopy(v70 or {});
    v72.receivedFromOutfitDetails = true;
    v72.id = tostring(v69.id);
    v72.name = v69.name;
    v72.assetType = tostring(v69.assetType.id);
    v72.outfitModerationStatus = v71;
    if l_FFlagDynamicHeadsMigration_0 and v69.supportsHeadShapes ~= nil then
        v72.supportsHeadShapes = v69.supportsHeadShapes;
    end;
    return v72;
end;
v52.fromGetResellers = function(v73, v74) --[[ Line: 382 ]] --[[ Name: fromGetResellers ]]
    -- upvalues: v5 (copy)
    local v75 = v5.deepCopy(v74 or {});
    v75.resellerUserAssetIds = v73;
    return v75;
end;
v52.fromLowestPrice = function(v76, v77) --[[ Line: 390 ]] --[[ Name: fromLowestPrice ]]
    -- upvalues: v5 (copy)
    local v78 = v5.deepCopy(v77 or {});
    v78.lowestPrice = v76;
    return v78;
end;
v52.fromResaleData = function(v79, v80) --[[ Line: 398 ]] --[[ Name: fromResaleData ]]
    -- upvalues: v5 (copy)
    local v81 = v5.deepCopy(v80 or {});
    v81.receivedFromResaleData = true;
    v81.soldCount = v79.sales;
    v81.averagePrice = v79.recentAveragePrice;
    v81.originalPrice = v79.originalPrice;
    return v81;
end;
v52.fromIsOwned = function(v82, v83) --[[ Line: 409 ]] --[[ Name: fromIsOwned ]]
    -- upvalues: v5 (copy)
    local v84 = v5.deepCopy(v83 or {});
    v84.isOwned = v82;
    return v84;
end;
v52.fromReceivedAvatarData = function(v85) --[[ Line: 416 ]] --[[ Name: fromReceivedAvatarData ]]
    return {
        id = tostring(v85.id), 
        name = v85.name, 
        assetType = tostring(v85.assetType.id)
    };
end;
v52.fromVersionData = function(v86, v87) --[[ Line: 436 ]] --[[ Name: fromVersionData ]]
    -- upvalues: v5 (copy)
    local v88 = v5.deepCopy(v87 or {});
    local v89 = v86.data[1];
    v88.receivedFromVersionData = true;
    v88.creatingUniverseId = if v89.creatingUniverseId then tostring(v89.creatingUniverseId) else nil;
    return v88;
end;
return v52;