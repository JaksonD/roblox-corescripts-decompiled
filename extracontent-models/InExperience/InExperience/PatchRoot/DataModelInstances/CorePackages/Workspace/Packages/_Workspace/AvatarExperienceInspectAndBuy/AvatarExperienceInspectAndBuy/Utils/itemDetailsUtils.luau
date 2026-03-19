local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ItemRestrictions_0 = require(l_Parent_0.AXCommon).Enums.ItemRestrictions;
local v3 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local v4 = require(l_Parent_0.VerifiedBadges);
local v5 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Types);
return {
    isCollectible = function(v7) --[[ Line: 17 ]] --[[ Name: isCollectible ]]
        -- upvalues: l_ItemRestrictions_0 (copy)
        if not v7 then
            return false;
        elseif not v7.itemRestrictions then
            return false;
        else
            local v8 = v7.itemRestrictions[l_ItemRestrictions_0.Collectible];
            local v9 = v7.itemRestrictions[l_ItemRestrictions_0.Limited];
            local v10 = v7.itemRestrictions[l_ItemRestrictions_0.LimitedUnique];
            if v8 or v9 or v10 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    isInExperienceCreationPlayable = function(v11) --[[ Line: 37 ]] --[[ Name: isInExperienceCreationPlayable ]]
        -- upvalues: v5 (copy)
        local v12 = if v11 then v11.playabilityStatus else nil;
        if v12 and v5.ShowPlayableAttributionMapper[v12] then
            return true;
        else
            return false;
        end;
    end, 
    isTradeable = function(v13) --[[ Line: 76 ]] --[[ Name: isTradeable ]]
        -- upvalues: l_ItemRestrictions_0 (copy)
        return v13 and v13.itemRestrictions and (v13.itemRestrictions[l_ItemRestrictions_0.Limited] or v13.itemRestrictions[l_ItemRestrictions_0.LimitedUnique]);
    end, 
    getPriceInRobux = function(v14, v15) --[[ Line: 85 ]] --[[ Name: getPriceInRobux ]]
        -- upvalues: v3 (copy)
        if v14 and v15 == v3.PurchaseFromResale and v14.collectibleItemDetails then
            return v14.collectibleItemDetails.lowestResalePrice;
        elseif v14 then
            return v14.priceInRobux;
        else
            return nil;
        end;
    end, 
    getItemWidth = function(v16, v17, v18) --[[ Line: 93 ]] --[[ Name: getItemWidth ]]
        local v19 = math.floor((v16 - (v17 - 1) * v18) / v17);
        if v19 < 0 then
            return 0;
        else
            return v19;
        end;
    end, 
    getCreatorName = function(v20) --[[ Line: 103 ]] --[[ Name: getCreatorName ]]
        -- upvalues: v4 (copy)
        if v20 and v20.creator and v20.creator.creatorHasVerifiedBadge and v20.creator.creatorName then
            return (("%*%*"):format(v20.creator.creatorName, v4.emoji.verified));
        elseif v20 and v20.creator and v20.creator.creatorName then
            return v20.creator.creatorName;
        else
            return "";
        end;
    end, 
    getOriginalPrice = function(v21, v22, v23) --[[ Line: 113 ]] --[[ Name: getOriginalPrice ]]
        if v21 and v21.isOffSale then
            return v22;
        elseif v21 and v21.priceInRobux then
            return v23(v21.priceInRobux);
        else
            return "";
        end;
    end, 
    getQuantitySold = function(v24, v25) --[[ Line: 123 ]] --[[ Name: getQuantitySold ]]
        if v24 and v24.collectibleItemDetails and v24.collectibleItemDetails.totalQuantity and v24.collectibleItemDetails.unitsAvailableForConsumption then
            return v25(v24.collectibleItemDetails.totalQuantity - v24.collectibleItemDetails.unitsAvailableForConsumption) .. "/" .. v25(v24.collectibleItemDetails.totalQuantity);
        else
            return "";
        end;
    end, 
    calculatePurchaseStatusForItem = function(v26, v27) --[[ Line: 55 ]] --[[ Name: calculatePurchaseStatusForItem ]]
        -- upvalues: v3 (copy)
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if v27 == v3.PurchaseFromResale and v26.collectibleItemDetails then
            v28 = v26.collectibleItemDetails.lowestResalePrice;
            v29 = v26.collectibleItemDetails.collectibleLowestAvailableResaleProductId;
            v30 = v26.collectibleItemDetails.collectibleLowestAvailableResaleItemInstanceId;
        end;
        return {
            collectibleItemId = v26.collectibleItemId, 
            collectibleLowestResalePrice = v28, 
            collectibleLowestAvailableResaleProductId = v29, 
            collectibleLowestAvailableResaleItemInstanceId = v30
        };
    end, 
    shouldShowPriceLabel = function(v31) --[[ Line: 147 ]] --[[ Name: shouldShowPriceLabel ]]
        -- upvalues: v3 (copy)
        local v32 = true;
        if v31 ~= nil then
            v32 = true;
            if v31 ~= v3.PurchaseFromResale then
                v32 = v31 == v3.PurchaseFromRoblox;
            end;
        end;
        return v32;
    end
};