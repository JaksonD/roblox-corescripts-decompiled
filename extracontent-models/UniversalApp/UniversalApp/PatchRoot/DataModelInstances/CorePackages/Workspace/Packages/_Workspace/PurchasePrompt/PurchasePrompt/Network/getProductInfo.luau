local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.Network.getAssetInfo);
local v4 = require(l_Parent_0.Network.getCreatorStoreProductInfo);
local _ = require(l_Parent_0.Misc.Constants);
local v6 = require(l_Parent_0.Utils.isCreatorStoreAssetType);
local v7 = require(l_Parent_0.Utils.getAssetInfoUtil);
local v8 = require(l_Parent_0.Utils.getCreatorStoreProductInfoUtil);
local v9 = require(l_Parent_0.Utils.getExperienceProductInfoUtil);
local l_ProductTypeEnum_0 = require(l_Parent_0.types).ProductTypeEnum;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
return function(v13, v14, v15, v16) --[[ Line: 17 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v1 (copy), v6 (copy), v4 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ProductTypeEnum_0 (copy), v9 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if v15 == Enum.InfoType.Asset then
        return v3(v13, v14):andThen(function(v17) --[[ Line: 20 ]]
            -- upvalues: v7 (ref), v2 (ref), v1 (ref), v6 (ref), v4 (ref), v13 (copy), v14 (copy), v8 (ref), v15 (copy)
            local v18 = nil;
            if v17 and v17.data and v17.data[1] then
                if not v7.isAssetValid(v17.data[1]) then
                    return v2.reject(v1.UnknownFailureNoItemName);
                else
                    v18 = v7.fromAsset(v17.data[1]);
                end;
            end;
            local v19 = v18 and v18.type or "";
            if v6(v19) then
                return v4(v13, v14, v19):andThen(function(v20) --[[ Line: 31 ]]
                    -- upvalues: v8 (ref), v18 (ref), v19 (copy)
                    local v21 = v8.fromProduct(v20);
                    return {
                        AssetId = v18.id, 
                        AssetType = v19, 
                        AssetTypeId = v18.typeId, 
                        Creator = {
                            CreatorTargetId = v18.creator.targetId, 
                            CreatorType = v18.creator.type
                        }, 
                        Description = v18.description, 
                        IsFiatPriced = v21.basePrice and v21.basePrice.quantity and v21.basePrice.quantity.significand ~= 0, 
                        IsForSale = v21.purchasable, 
                        IsPublicDomain = v18.isPublicDomainEnabled, 
                        Name = v18.name, 
                        PriceInRobux = 0, 
                        ProductId = v18.id
                    };
                end);
            else
                return v13.getProductInfo(v14, v15):catch(function(_) --[[ Line: 55 ]]
                    -- upvalues: v2 (ref), v1 (ref)
                    return v2.reject(v1.UnknownFailureNoItemName);
                end);
            end;
        end):catch(function(_) --[[ Line: 60 ]]
            -- upvalues: v2 (ref), v1 (ref)
            return v2.reject(v1.UnknownFailureNoItemName);
        end);
    elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v15 == l_ProductTypeEnum_0.Experience then
        return v13.getExperienceProductInfo(v14):andThen(function(v24) --[[ Line: 66 ]]
            -- upvalues: v16 (copy), v9 (ref), v2 (ref), v1 (ref)
            if v24 and v24.data and v24.data[1] and v16.name and v16.imageUrl then
                local v25 = v9.fromProduct(v24.data[1]);
                return {
                    IsForSale = v25.isForSale, 
                    PriceInRobux = v25.price, 
                    ProductId = v25.productId, 
                    SellerId = v25.sellerId, 
                    Name = v16.name, 
                    ImageUrl = v16.imageUrl
                };
            else
                return v2.reject(v1.UnknownFailureNoItemName);
            end;
        end):catch(function(_) --[[ Line: 86 ]]
            -- upvalues: v2 (ref), v1 (ref)
            return v2.reject(v1.UnknownFailureNoItemName);
        end);
    elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v15 == l_ProductTypeEnum_0.Look then
        return v2.resolve({
            PriceInRobux = v16.expectedPrice, 
            IsForSale = true, 
            Name = "Looks"
        });
    elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v15 == l_ProductTypeEnum_0.DeveloperSubscription then
        return v13.getSubscriptionProductInfo(v14):andThen(function(v27) --[[ Line: 99 ]]
            -- upvalues: l_ProductTypeEnum_0 (ref), v2 (ref), v1 (ref)
            if v27 and v27.Name then
                return {
                    Name = v27.Name, 
                    Description = v27.Description, 
                    IconImageAssetId = v27.IconImageAssetId, 
                    IsForSale = v27.IsForSale, 
                    DisplayPrice = v27.DisplayPrice, 
                    DisplaySubscriptionPeriod = v27.DisplaySubscriptionPeriod, 
                    SubscriptionProviderName = v27.SubscriptionProviderName, 
                    PriceInRobux = v27.PriceInRobux, 
                    PriceTier = v27.PriceTier, 
                    ProductType = l_ProductTypeEnum_0.DeveloperSubscription
                };
            else
                return v2.reject(v1.UnknownFailureNoItemName);
            end;
        end):catch(function(_) --[[ Line: 116 ]]
            -- upvalues: v2 (ref), v1 (ref)
            return v2.reject(v1.UnknownFailureNoItemName);
        end);
    else
        return v13.getProductInfo(v14, v15):catch(function(_) --[[ Line: 120 ]]
            -- upvalues: v2 (ref), v1 (ref)
            return v2.reject(v1.UnknownFailureNoItemName);
        end);
    end;
end;