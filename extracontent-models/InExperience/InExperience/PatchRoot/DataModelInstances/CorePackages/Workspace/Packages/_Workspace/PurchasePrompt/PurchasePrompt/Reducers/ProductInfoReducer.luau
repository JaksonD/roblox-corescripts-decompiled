local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Misc.Constants);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v5 = require(l_script_FirstAncestor_0.Actions.ProductInfoReceived);
local v6 = require(l_script_FirstAncestor_0.Actions.BundleProductInfoReceived);
local v7 = require(l_script_FirstAncestor_0.Enums.ItemType);
local v8 = require(l_script_FirstAncestor_0.getPreviewImageUrl);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace;
local v12 = require(l_script_FirstAncestor_0.Flags.GetFFlagTranslateDevProducts);
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixBundlePromptThumbnail);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local v17 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then require(l_script_FirstAncestor_0.Utils.normalizePriceDiscountDetails) else nil;
return (l_Rodux_0.createReducer({}, {
    [v5.name] = function(_, v19) --[[ Line: 33 ]]
        -- upvalues: l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (copy), v3 (copy), v12 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), v17 (copy), v8 (copy), v14 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_ProductTypeEnum_0 (copy)
        local l_productInfo_0 = v19.productInfo;
        local v21 = "";
        local v22 = "";
        local v23 = nil;
        if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then
            local v24 = true;
            if l_productInfo_0.ProductType ~= v3.ProductType.Asset then
                v24 = l_productInfo_0.ProductType == v3.ProductType.Bundle;
            end;
            v23 = v24;
        end;
        if l_productInfo_0.ProductType == v3.ProductType.CollectibleItem or l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 and v23 then
            v21 = l_productInfo_0.CollectibleItemId;
            v22 = l_productInfo_0.CollectibleProductId;
        end;
        return {
            name = v12() and (l_productInfo_0.DisplayName or l_productInfo_0.Name) or l_productInfo_0.Name, 
            description = l_productInfo_0.Description, 
            basePrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then l_productInfo_0.UserBasePriceInRobux or l_productInfo_0.BasePriceInRobux or l_productInfo_0.PriceInRobux or 0 else nil, 
            price = l_productInfo_0.PriceInRobux or 0, 
            priceDiscountDetails = if v17 then v17(l_productInfo_0.PriceDiscountDetails) else nil, 
            premiumPrice = l_productInfo_0.PremiumPriceInRobux, 
            imageUrl = v8(l_productInfo_0), 
            assetTypeId = l_productInfo_0.AssetTypeId, 
            assetType = if v14() then l_productInfo_0.AssetType else nil, 
            productId = l_productInfo_0.ProductId, 
            productType = l_productInfo_0.ProductType, 
            membershipTypeRequired = l_productInfo_0.MinimumMembershipLevel, 
            itemType = l_productInfo_0.AssetTypeId, 
            collectibleItemId = v21, 
            collectibleProductId = v22, 
            productTargetId = if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_productInfo_0.TargetId then l_productInfo_0.TargetId else nil, 
            displayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_productInfo_0.ProductType == l_ProductTypeEnum_0.DeveloperSubscription then l_productInfo_0.DisplayPrice else nil
        };
    end, 
    [v6.name] = function(_, v26) --[[ Line: 81 ]]
        -- upvalues: v13 (copy), v7 (copy), l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (copy), v8 (copy)
        local l_bundleProductInfo_0 = v26.bundleProductInfo;
        local v28 = nil;
        for _, v30 in ipairs(l_bundleProductInfo_0.items) do
            if v30.type == "UserOutfit" then
                v28 = v30.id;
                if v13() then
                    break;
                end;
            end;
        end;
        l_bundleProductInfo_0.costumeId = v28;
        l_bundleProductInfo_0.itemType = v7.Bundle;
        return {
            name = l_bundleProductInfo_0.name or if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then l_bundleProductInfo_0.Name else nil, 
            price = l_bundleProductInfo_0.product.priceInRobux or (if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then l_bundleProductInfo_0.PriceInRobux else nil) or 0, 
            imageUrl = v8(l_bundleProductInfo_0), 
            assetTypeId = nil, 
            productId = l_bundleProductInfo_0.product.id, 
            membershipTypeRequired = nil, 
            itemType = l_bundleProductInfo_0.itemType
        };
    end, 
    [v4.name] = function(_, _) --[[ Line: 111 ]]
        return {};
    end
}));