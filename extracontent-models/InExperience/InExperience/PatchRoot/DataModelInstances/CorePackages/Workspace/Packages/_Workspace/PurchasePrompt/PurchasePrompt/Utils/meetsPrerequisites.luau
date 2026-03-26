local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_0.Misc.Constants);
local v5 = require(l_Parent_0.Enums.PurchaseError);
local l_ProductTypeEnum_0 = require(l_Parent_0.types).ProductTypeEnum;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_1.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v8 = require(l_Parent_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
return function(v9, v10, v11, v12, v13) --[[ Line: 20 ]] --[[ Name: meetsPrerequisites ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), l_Players_0 (copy), l_Workspace_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_ProductTypeEnum_0 (copy)
    local v14 = v9.ProductType == v4.ProductType.CollectibleItem;
    local v15 = if v9.CollectiblesItemDetails then v9.CollectiblesItemDetails.IsLimited else nil;
    if v14 then
        if not v15 and v10 then
            return false, v5.AlreadyOwn;
        end;
    elseif v10 then
        return false, v5.AlreadyOwn;
    end;
    if v13 == nil and not v9.IsForSale and not v9.IsPublicDomain then
        return false, v5.NotForSale;
    elseif v8() and v9.IsFiatPriced == true then
        return false, v5.NotForSale;
    elseif v13 == nil and v12.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt() and v9.CanBeSoldInThisGame == false then
        return false, v5.NotForSaleHere;
    elseif v13 == nil and (v14 and v15 or v9.IsLimited or v9.IsLimitedUnique) and (v9.Remaining == nil or v9.Remaining == 0) then
        return false, v5.Limited;
    elseif v9.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and l_Players_0.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
        return false, v5.PremiumOnly;
    elseif v9.ContentRatingTypeId == 1 and l_Players_0.LocalPlayer:GetUnder13() then
        return false, v5.Under13;
    else
        local v16 = true;
        v16 = if v12.getLuaUseThirdPartyPermissions() then v12.isThirdPartyPurchaseAllowed() else l_Workspace_0.AllowThirdPartySales;
        local v17 = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v9.ProductType == l_ProductTypeEnum_0.DeveloperSubscription;
        if v9.ProductType ~= v4.ProductType.DeveloperProduct and not v17 and v11 and not v16 then
            local v18 = game.CreatorType == Enum.CreatorType.Group;
            local v19 = v9.Creator.CreatorType == "Group";
            local v20 = tonumber(v9.Creator.CreatorTargetId);
            if v20 ~= 1 and (v18 ~= v19 or v20 ~= game.CreatorId) then
                warn(("AllowThirdPartySales has blocked the purchase prompt for %d created by %d. To sell this asset made by a different %s, you will need to enable AllowThirdPartySales."):format(v9.AssetId, v20, v18 and "group" or "user"));
                return false, v5.ThirdPartyDisabled;
            end;
        end;
        return true, nil;
    end;
end;