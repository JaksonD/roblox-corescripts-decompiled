local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.tutils);
local l_GenerateStringId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GenerateStringId;
local l_ItemTileEnums_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTileEnums;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(script.Parent.ModelsUtils);
local v9 = game:DefineFastFlag("FixEmptyLimitedBadgesForBundles", false);
local v10 = game:DefineFastFlag("AXFixBundleVerifiedBadgeInWidgets", false);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = {
    mock = function() --[[ Line: 26 ]] --[[ Name: mock ]]
        -- upvalues: l_GenerateStringId_0 (copy)
        return {
            receivedCatalogData = false, 
            receivedRecommendedData = false, 
            receivedFromRecommendedData = false, 
            name = "", 
            description = "", 
            bundleType = "", 
            id = "", 
            items = {}, 
            creator = {
                id = l_GenerateStringId_0(), 
                name = "", 
                type = "", 
                hasVerifiedBadge = false
            }, 
            priceInRobux = 1, 
            isPublicDomain = true, 
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
            isForRent = false, 
            isOwned = false, 
            isPurchasable = false, 
            expectedSellerId = l_GenerateStringId_0(), 
            collectibleItemId = "0", 
            totalQuantity = nil, 
            soldCount = 0, 
            averagePrice = 0, 
            originalPrice = 0, 
            premiumPricing = nil
        };
    end
};
local function v15(v13) --[[ Line: 88 ]] --[[ Name: getBundleType ]]
    -- upvalues: v6 (copy)
    local _ = nil;
    if v13 == Enum.BundleType.BodyParts.Name then
        return v6.BundleTypeIdStrings.BodyParts;
    elseif v13 == "AvatarAnimaions" then
        return v6.BundleTypeIdStrings.Animations;
    elseif v13 == Enum.BundleType.Animations.Name then
        return v6.BundleTypeIdStrings.Animations;
    elseif v13 == Enum.BundleType.DynamicHead.Name then
        return v6.BundleTypeIdStrings.DynamicHead;
    elseif v13 == Enum.BundleType.Shoes.Name then
        return v6.BundleTypeIdStrings.Shoes;
    else
        return (tostring(v13));
    end;
end;
v12.fromGetRecommendedItemsDataV2 = function(v16, v17) --[[ Line: 109 ]] --[[ Name: fromGetRecommendedItemsDataV2 ]]
    -- upvalues: v15 (copy), v8 (copy)
    local v18 = v15(v16.bundleType);
    local v19 = v8.itemDataFromBundleInfo(v16, v18, v17);
    v19.receivedFromRecommendedData = true;
    return v19;
end;
v12.fromHydrateWidgetInfo = function(v20, v21) --[[ Line: 120 ]] --[[ Name: fromHydrateWidgetInfo ]]
    -- upvalues: v2 (copy), v10 (copy), v15 (copy), v9 (copy), l_ItemTileEnums_0 (copy)
    local v22 = v2.deepCopy(v21 or {});
    v22.id = tostring(v20.id);
    if v20.failedToHydrate then
        v22.failedToHydrate = true;
        return v22;
    else
        v22.name = v20.name;
        if v20.creatorName then
            v22.creator = {
                name = v20.creatorName, 
                hasVerifiedBadge = if v10 and v20.creator then v20.creator.hasVerifiedBadge else nil
            };
        end;
        v22.bundleType = v15(v20.bundleType);
        v22.priceInRobux = v20.price;
        v22.receivedWidgetHydration = true;
        local v23 = if v9 then nil else {};
        if v20.isLimited or v20.isLimitedUnique or v20.isCollectible then
            v23 = {
                [l_ItemTileEnums_0.Restriction.Limited] = v20.isLimited and true or false, 
                [l_ItemTileEnums_0.Restriction.LimitedUnique] = v20.isLimitedUnique and true or false, 
                [l_ItemTileEnums_0.Restriction.Collectible] = v20.isCollectible and true or false
            };
        end;
        v22.tileRestrictionsMap = v23;
        return v22;
    end;
end;
v12.fromGetCatalogItemData = function(v24, v25) --[[ Line: 158 ]] --[[ Name: fromGetCatalogItemData ]]
    -- upvalues: v8 (copy), v15 (copy)
    local v26 = v8.itemDataFromBundleInfo(v24, v15(v24.bundleType), v25);
    v26.receivedCatalogData = true;
    return v26;
end;
v12.fromRecommendedItemSummaries = function(v27, v28) --[[ Line: 165 ]] --[[ Name: fromRecommendedItemSummaries ]]
    -- upvalues: v2 (copy)
    local v29 = v2.deepCopy(v28 or {});
    v29.receivedRecommendedData = true;
    v29.recommendedItemSummaries = v27;
    return v29;
end;
v12.fromSortResults = function(v30, v31) --[[ Line: 177 ]] --[[ Name: fromSortResults ]]
    -- upvalues: v8 (copy), v15 (copy)
    local v32 = v8.itemDataFromBundleInfo(v30, v15(v30.bundleType), v31);
    v32.receivedFromSortResults = true;
    return v32;
end;
v12.fromIsOwned = function(v33, v34) --[[ Line: 184 ]] --[[ Name: fromIsOwned ]]
    -- upvalues: v2 (copy)
    local v35 = v2.deepCopy(v34 or {});
    v35.isOwned = v33;
    return v35;
end;
return v12;