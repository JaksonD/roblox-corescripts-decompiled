local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Enums.PurchaseWarning);
local v3 = require(l_Parent_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local function v4() --[[ Line: 14 ]] --[[ Name: getABTestGroup ]]
    -- upvalues: v1 (copy)
    return v1.resolve(false);
end;
local function v7(_, _) --[[ Line: 18 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        AssetId = 1, 
        AssetTypeId = 2, 
        ContentRatingTypeId = 0, 
        Creator = {
            CreatorType = "Group", 
            CreatorTargetId = 1, 
            Name = "ROBLOX", 
            Id = 1
        }, 
        Description = "This item isn't real!", 
        IconImageAssetId = 1, 
        IsForSale = true, 
        IsLimited = false, 
        IsLimitedUnique = false, 
        IsNew = false, 
        IsPublicDomain = false, 
        MinimumMembershipLevel = 0, 
        Name = "Test Item", 
        PriceInRobux = 100, 
        ProductId = 1
    });
end;
local function v11(_, _, _) --[[ Line: 43 ]] --[[ Name: getPlayerOwns ]]
    -- upvalues: v1 (copy)
    return v1.resolve(false);
end;
local function v16(_, _, _, _) --[[ Line: 47 ]] --[[ Name: performPurchase ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        success = true, 
        purchased = true, 
        receipt = "fake-receipt-hash"
    });
end;
local function v18(_) --[[ Line: 55 ]] --[[ Name: loadAssetForEquip ]]
    -- upvalues: v1 (copy)
    return v1.resolve(Instance.new("Tool"));
end;
local function v19() --[[ Line: 59 ]] --[[ Name: getAccountInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        isPremium = false
    });
end;
local function v20() --[[ Line: 65 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        robux = 2147483647
    });
end;
local function v22(_) --[[ Line: 71 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        id = 1, 
        name = "mock-name", 
        description = "mock-description", 
        items = {
            [1] = {
                id = 1, 
                name = "outfit-name", 
                type = "UserOutfit"
            }
        }, 
        creator = {
            id = 1, 
            name = "ROBLOX", 
            type = "User"
        }, 
        product = {
            id = 1, 
            isForSale = true, 
            priceInRobux = 100
        }
    });
end;
local function v24(_) --[[ Line: 96 ]] --[[ Name: getProductPurchasableDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        purchasable = false, 
        reason = "mock-reason", 
        price = 100
    });
end;
local function v27(_, _) --[[ Line: 104 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        bundleType = 1, 
        bundledItems = {
            [1] = {
                id = 10001, 
                name = "Mock bundle - Left Arm", 
                owned = true, 
                type = "Asset"
            }, 
            [2] = {
                id = 1002, 
                name = "Mock bundle - Right Leg", 
                owned = true, 
                type = "Asset"
            }, 
            [3] = {
                id = 1003, 
                name = "Mock bundle - Right Arm", 
                owned = true, 
                type = "Asset"
            }, 
            [4] = {
                id = 1004, 
                name = "Mock bundle - Left Leg", 
                owned = true, 
                type = "Asset"
            }, 
            [5] = {
                id = 1005, 
                name = "Mock bundle - Dynamic Head", 
                owned = true, 
                type = "Asset"
            }, 
            [6] = {
                id = 1006, 
                name = "Default Mood", 
                owned = true, 
                type = "Asset"
            }, 
            [7] = {
                id = 1007, 
                name = "Mock bundle - Torso", 
                owned = true, 
                type = "Asset"
            }, 
            [8] = {
                id = 1008, 
                name = "Mock item", 
                owned = true, 
                type = "UserOutfit"
            }, 
            [9] = {
                id = 1009, 
                name = "Mock bundle Head", 
                owned = true, 
                type = "UserOutfit"
            }
        }, 
        collectibleItemId = "random-collectible-item-id-123", 
        creatorHasVerifiedBadge = true, 
        creatorName = "mockRobloxCreator", 
        creatorTargetId = 123, 
        creatorType = "User", 
        description = "Mock bundle", 
        expectedSellerId = 123, 
        favoriteCount = 908, 
        hasReseller = false, 
        id = 123456, 
        isPurchasable = true, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = "Bundle", 
        lowestPrice = 175, 
        lowestResalePrice = 0, 
        name = "Roblox Collectible Bundle", 
        owned = false, 
        price = 175, 
        productId = 1.234567890123456E15, 
        purchaseCount = 0, 
        saleLocationType = "ShopAndAllExperiences", 
        totalQuantity = 0, 
        unitsAvailableForConsumption = 0
    });
end;
local function v34(_, _, _, _, _, _) --[[ Line: 190 ]] --[[ Name: getRobuxUpsellProductWithUniverseItemInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        roblox_product_id = 50, 
        provider_product_id = "robux50", 
        roblox_product_name = "providerRobux50", 
        robux_amount = 500
    });
end;
local function v35() --[[ Line: 206 ]] --[[ Name: postPremiumImpression ]]
    -- upvalues: v1 (copy)
    return v1.resolve();
end;
local function v36() --[[ Line: 210 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v1 (copy)
    return v1.resolve(true);
end;
local function v38(_) --[[ Line: 214 ]] --[[ Name: getPurchaseWarning ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.resolve({
        action = v2.NoAction
    });
end;
local function v39() --[[ Line: 220 ]] --[[ Name: postPurchaseWarningAcknowledge ]]
    -- upvalues: v1 (copy)
    return v1.resolve();
end;
local function v40() --[[ Line: 224 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        isEligible = false, 
        failureReason = "PurchaseNotEnabled"
    });
end;
local function v41() --[[ Line: 231 ]] --[[ Name: getUnifiedPurchaseFlowUserEligibility ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        isUserEligibleForUnifiedPurchaseFlow = true, 
        expiresInSeconds = 120
    });
end;
local function v43(_) --[[ Line: 238 ]] --[[ Name: getSubscriptionProductInfo ]]
    -- upvalues: v1 (copy)
    return v1.resolve({
        Name = "Mock Subscription", 
        Description = "A mock developer subscription", 
        IconImageAssetId = 12345, 
        IsForSale = true, 
        DisplayPrice = "$4.99", 
        DisplaySubscriptionPeriod = "/month", 
        SubscriptionProviderName = "MockGame", 
        PriceTier = 499, 
        PriceInRobux = 0
    });
end;
local v44 = {};
v44.__index = v44;
v44.new = function(v45, v46) --[[ Line: 255 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v7 (copy), v11 (copy), v16 (copy), v18 (copy), v19 (copy), v20 (copy), v22 (copy), v24 (copy), v27 (copy), v34 (copy), v35 (copy), v36 (copy), v38 (copy), v39 (copy), v40 (copy), v41 (copy), v43 (copy)
    local v47 = nil;
    if v46 or v45 then
        local function v48() --[[ Line: 259 ]]
            -- upvalues: v45 (copy), v1 (ref), v46 (copy)
            if v45 then
                return v1.resolve(v45);
            else
                return v1.reject(v46);
            end;
        end;
        v47 = {
            getABTestGroup = v48, 
            getProductInfo = v48, 
            getPlayerOwns = v48, 
            performPurchase = v48, 
            loadAssetForEquip = v48, 
            getAccountInfo = v48, 
            getBalanceInfo = v48, 
            getBundleDetails = v48, 
            getProductPurchasableDetails = v48, 
            getCatalogItemDetails = if v3() then v48 else nil, 
            getRobuxUpsellProductWithUniverseItemInfo = v48, 
            postPremiumImpression = v48, 
            getPremiumUpsellPrecheck = v48, 
            getPurchaseWarning = v48, 
            postPurchaseWarningAcknowledge = v48, 
            checkUserPurchaseSettings = v48, 
            getUnifiedPurchaseFlowUserEligibility = v48, 
            getSubscriptionProductInfo = v48
        };
    else
        v47 = {
            getABTestGroup = v4, 
            getProductInfo = v7, 
            getPlayerOwns = v11, 
            performPurchase = v16, 
            loadAssetForEquip = v18, 
            getAccountInfo = v19, 
            getBalanceInfo = v20, 
            getBundleDetails = v22, 
            getProductPurchasableDetails = v24, 
            getCatalogItemDetails = if v3() then v27 else nil, 
            getRobuxUpsellProductWithUniverseItemInfo = v34, 
            postPremiumImpression = v35, 
            getPremiumUpsellPrecheck = v36, 
            getPurchaseWarning = v38, 
            postPurchaseWarningAcknowledge = v39, 
            checkUserPurchaseSettings = v40, 
            getUnifiedPurchaseFlowUserEligibility = v41, 
            getSubscriptionProductInfo = v43
        };
    end;
    setmetatable(v47, {
        __tostring = function() --[[ Line: 312 ]] --[[ Name: __tostring ]]
            return "MockService(Network)";
        end
    });
    return v47;
end;
return v44;