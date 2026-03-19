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
local l_FFlagAXDurablesSupport_0 = v6.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForRFYMigration_0 = v6.FFlagAXDurablesSupportForRFYMigration;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesSupport_0 = v6.FFlagAXInventoryDurablesSupport;
local l_FFlagDynamicHeadsMigration_0 = v6.FFlagDynamicHeadsMigration;
local l_FFlagAXFixRecommendedItemCreatorType_0 = v6.FFlagAXFixRecommendedItemCreatorType;
local v51 = {
    mock = function() --[[ Line: 37 ]] --[[ Name: mock ]]
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
    fromRecommendedItemSummaries = function(v21, v22) --[[ Line: 113 ]] --[[ Name: fromRecommendedItemSummaries ]]
        -- upvalues: v5 (copy)
        local v23 = v5.deepCopy(v22 or {});
        v23.receivedRecommendedData = true;
        v23.recommendedItemSummaries = v21;
        return v23;
    end, 
    fromGetRecommendedItemsDataV2 = function(v24, v25, v26) --[[ Line: 125 ]] --[[ Name: fromGetRecommendedItemsDataV2 ]]
        -- upvalues: v12 (copy)
        local v27 = v12.itemDataFromAssetInfo(v24, v26);
        v27.receivedFromRecommendedData = true;
        if v25 then
            v27.assetType = v25;
        end;
        return v27;
    end, 
    fromHydrateWidgetInfo = function(v28, v29) --[[ Line: 139 ]] --[[ Name: fromHydrateWidgetInfo ]]
        -- upvalues: v5 (copy), v11 (copy), v13 (copy), l_ItemTileEnums_0 (copy), l_FFlagAXDurablesSupportForRFYMigration_0 (copy)
        local v30 = v5.deepCopy(v29 or {});
        v30.id = tostring(v28.id);
        if v28.failedToHydrate then
            v30.failedToHydrate = true;
            return v30;
        else
            v30.name = v28.name;
            v30.creator = {
                name = if v28.creator then v28.creator.name else v28.creatorName, 
                hasVerifiedBadge = if v28.creator then v28.creator.hasVerifiedBadge else nil
            };
            v30.assetType = v11.AssetTypeIdStrings[tostring(v28.assetType)];
            v30.priceInRobux = v28.price;
            v30.receivedWidgetHydration = true;
            local v31 = if v13 then nil else {};
            if v28.isLimited or v28.isLimitedUnique or v28.isCollectible then
                v31 = {
                    [l_ItemTileEnums_0.Restriction.Limited] = v28.isLimited and true or false, 
                    [l_ItemTileEnums_0.Restriction.LimitedUnique] = v28.isLimitedUnique and true or false, 
                    [l_ItemTileEnums_0.Restriction.Collectible] = v28.isCollectible and true or false
                };
            end;
            v30.tileRestrictionsMap = v31;
            if l_FFlagAXDurablesSupportForRFYMigration_0 and v28.timedOptions then
                local v32 = {};
                for _, v34 in v28.timedOptions do
                    table.insert(v32, {
                        days = v34.days, 
                        price = v34.price, 
                        selected = v34.selected
                    });
                end;
                v30.timedOptions = v32;
            end;
            return v30;
        end;
    end, 
    fromGetRecommendedItemsData = function(v35, v36, v37) --[[ Line: 191 ]] --[[ Name: fromGetRecommendedItemsData ]]
        -- upvalues: v5 (copy), l_FFlagAXFixRecommendedItemCreatorType_0 (copy)
        local v38 = v5.deepCopy(v37 or {});
        v38.receivedFromRecommendedData = true;
        if v35.item then
            v38.name = v35.item.name;
            v38.id = tostring(v35.item.assetId);
            v38.priceInRobux = v35.item.price;
        end;
        if v35.product and v35.product.isFree then
            v38.priceInRobux = 0;
        end;
        if v35.product then
            v38.product = {
                id = tostring(v35.product.id)
            };
        end;
        if v35.creator then
            v38.creator = {
                id = tostring(v35.creator.creatorId), 
                name = v35.creator.name, 
                type = if l_FFlagAXFixRecommendedItemCreatorType_0 then v35.creator.creatorType else v35.creator.type
            };
        end;
        if v36 then
            v38.assetType = v36;
        end;
        return v38;
    end, 
    fromGetCatalogItemData = function(v39, v40) --[[ Line: 232 ]] --[[ Name: fromGetCatalogItemData ]]
        -- upvalues: v12 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v11 (copy)
        local v41 = v12.itemDataFromAssetInfo(v39, v40);
        v41.receivedCatalogData = true;
        if l_FFlagAXDurablesSupport_0 and v39.timedOptions then
            local v42 = {};
            for _, v44 in v39.timedOptions do
                table.insert(v42, {
                    days = v44.days, 
                    price = v44.price, 
                    selected = v44.selected
                });
            end;
            v41.timedOptions = v42;
        end;
        if l_FFlagAXInventoryDurablesSupport_0 then
            v41.expirationTime = v39.expirationTime;
        end;
        if l_FFlagAXMISEnableMultiShopping_0 then
            v41.assetType = if tonumber(v39.assetType) then tostring(v39.assetType) else v11.AssetTypeIdStrings[tostring(v39.assetType)];
            return v41;
        else
            v41.assetType = v11.AssetTypeIdStrings[tostring(v39.assetType)];
            return v41;
        end;
    end, 
    fromBundleItemData = function(v45, v46) --[[ Line: 268 ]] --[[ Name: fromBundleItemData ]]
        -- upvalues: v5 (copy)
        local v47 = v5.deepCopy(v46 or {});
        v47.receivedFromBundleItemData = true;
        v47.id = tostring(v45.id);
        v47.name = v45.name;
        v47.isOwned = v45.owned;
        return v47;
    end, 
    fromSortResults = function(v48, v49) --[[ Line: 279 ]] --[[ Name: fromSortResults ]]
        -- upvalues: v12 (copy)
        local v50 = v12.itemDataFromAssetInfo(v48, v49);
        v50.receivedFromSortResults = true;
        return v50;
    end
};
if l_FFlagAXHydrateAssetFromBundleItems_0 then
    v51.fromBundledItems = function(v52, v53) --[[ Line: 286 ]] --[[ Name: fromBundledItems ]]
        -- upvalues: v12 (copy)
        return v12.itemDataFromAssetInfo(v52, v53);
    end;
end;
v51.fromInventoryFetch = function(v54, v55) --[[ Line: 291 ]] --[[ Name: fromInventoryFetch ]]
    -- upvalues: v5 (copy), v11 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy)
    local v56 = v5.deepCopy(v55 or {});
    v56.receivedFromInventoryFetch = true;
    v56.id = tostring(v54.assetId);
    v56.name = v54.name;
    v56.assetType = v11.AssetTypeIdStrings[v54.assetType];
    if v54.moderationStatus then
        v56.moderationStatus = v54.moderationStatus;
    end;
    if v54.creatingUniverseId then
        v56.creatingUniverseId = v54.creatingUniverseId;
    end;
    if l_FFlagAXInventoryDurablesSupport_0 and v54.expirationTime then
        v56.expirationTime = v54.expirationTime;
    end;
    return v56;
end;
v51.fromAssetGrant = function(v57, v58, v59) --[[ Line: 316 ]] --[[ Name: fromAssetGrant ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v60 = v5.deepCopy(v59 or {});
    v2.isType(v57, "string", "AssetInfo.fromAssetGrant expects assetId to be a string");
    v2.isType(v58, "string", "AssetInfo.fromAssetGrant expects assetType to be a string");
    v60.id = v57;
    v60.assetType = v58;
    v60.moderationStatus = Enum.ModerationStatus.NotReviewed;
    return v60;
end;
v51.fromModerationStatusUpdate = function(v61, v62, v63, v64, v65, v66) --[[ Line: 333 ]] --[[ Name: fromModerationStatusUpdate ]]
    -- upvalues: v5 (copy)
    local v67 = v5.deepCopy(v66 or {});
    v67.moderationStatus = v61;
    v67.updateCounter = v62;
    v67.id = v63;
    v67.name = v64;
    v67.creatingUniverseId = v65;
    return v67;
end;
v51.fromOutfitDetails = function(v68, v69, v70) --[[ Line: 351 ]] --[[ Name: fromOutfitDetails ]]
    -- upvalues: v5 (copy), l_FFlagDynamicHeadsMigration_0 (copy)
    local v71 = v5.deepCopy(v69 or {});
    v71.receivedFromOutfitDetails = true;
    v71.id = tostring(v68.id);
    v71.name = v68.name;
    v71.assetType = tostring(v68.assetType.id);
    v71.outfitModerationStatus = v70;
    if l_FFlagDynamicHeadsMigration_0 and v68.supportsHeadShapes ~= nil then
        v71.supportsHeadShapes = v68.supportsHeadShapes;
    end;
    return v71;
end;
v51.fromGetResellers = function(v72, v73) --[[ Line: 375 ]] --[[ Name: fromGetResellers ]]
    -- upvalues: v5 (copy)
    local v74 = v5.deepCopy(v73 or {});
    v74.resellerUserAssetIds = v72;
    return v74;
end;
v51.fromLowestPrice = function(v75, v76) --[[ Line: 383 ]] --[[ Name: fromLowestPrice ]]
    -- upvalues: v5 (copy)
    local v77 = v5.deepCopy(v76 or {});
    v77.lowestPrice = v75;
    return v77;
end;
v51.fromResaleData = function(v78, v79) --[[ Line: 391 ]] --[[ Name: fromResaleData ]]
    -- upvalues: v5 (copy)
    local v80 = v5.deepCopy(v79 or {});
    v80.receivedFromResaleData = true;
    v80.soldCount = v78.sales;
    v80.averagePrice = v78.recentAveragePrice;
    v80.originalPrice = v78.originalPrice;
    return v80;
end;
v51.fromIsOwned = function(v81, v82) --[[ Line: 402 ]] --[[ Name: fromIsOwned ]]
    -- upvalues: v5 (copy)
    local v83 = v5.deepCopy(v82 or {});
    v83.isOwned = v81;
    return v83;
end;
v51.fromReceivedAvatarData = function(v84) --[[ Line: 409 ]] --[[ Name: fromReceivedAvatarData ]]
    return {
        id = tostring(v84.id), 
        name = v84.name, 
        assetType = tostring(v84.assetType.id)
    };
end;
v51.fromVersionData = function(v85, v86) --[[ Line: 429 ]] --[[ Name: fromVersionData ]]
    -- upvalues: v5 (copy)
    local v87 = v5.deepCopy(v86 or {});
    local v88 = v85.data[1];
    v87.receivedFromVersionData = true;
    v87.creatingUniverseId = if v88.creatingUniverseId then tostring(v88.creatingUniverseId) else nil;
    return v87;
end;
return v51;