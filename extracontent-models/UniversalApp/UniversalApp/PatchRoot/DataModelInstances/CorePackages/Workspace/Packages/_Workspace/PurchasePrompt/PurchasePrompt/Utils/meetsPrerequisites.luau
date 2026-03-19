local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local v3 = require(l_Parent_0.Misc.Constants);
local v4 = require(l_Parent_0.Enums.PurchaseError);
local v5 = require(l_Parent_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
return function(v6, v7, v8, v9, v10) --[[ Line: 17 ]] --[[ Name: meetsPrerequisites ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), l_Players_0 (copy), l_Workspace_0 (copy)
    local v11 = v6.ProductType == v3.ProductType.CollectibleItem;
    local v12 = if v6.CollectiblesItemDetails then v6.CollectiblesItemDetails.IsLimited else nil;
    if v11 then
        if not v12 and v7 then
            return false, v4.AlreadyOwn;
        end;
    elseif v7 then
        return false, v4.AlreadyOwn;
    end;
    if v10 == nil and not v6.IsForSale and not v6.IsPublicDomain then
        return false, v4.NotForSale;
    elseif v5() and v6.IsFiatPriced == true then
        return false, v4.NotForSale;
    elseif v10 == nil and v9.GetFFlagEnableRestrictedAssetSaleLocationPurchasePrompt() and v6.CanBeSoldInThisGame == false then
        return false, v4.NotForSaleHere;
    elseif v10 == nil and (v11 and v12 or v6.IsLimited or v6.IsLimitedUnique) and (v6.Remaining == nil or v6.Remaining == 0) then
        return false, v4.Limited;
    elseif v6.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and l_Players_0.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
        return false, v4.PremiumOnly;
    elseif v6.ContentRatingTypeId == 1 and l_Players_0.LocalPlayer:GetUnder13() then
        return false, v4.Under13;
    else
        local v13 = true;
        v13 = if v9.getLuaUseThirdPartyPermissions() then v9.isThirdPartyPurchaseAllowed() else l_Workspace_0.AllowThirdPartySales;
        if v6.ProductType ~= v3.ProductType.DeveloperProduct and v8 and not v13 then
            local v14 = game.CreatorType == Enum.CreatorType.Group;
            local v15 = v6.Creator.CreatorType == "Group";
            local v16 = tonumber(v6.Creator.CreatorTargetId);
            if v16 ~= 1 and (v14 ~= v15 or v16 ~= game.CreatorId) then
                warn(("AllowThirdPartySales has blocked the purchase prompt for %d created by %d. To sell this asset made by a different %s, you will need to enable AllowThirdPartySales."):format(v6.AssetId, v16, v14 and "group" or "user"));
                return false, v4.ThirdPartyDisabled;
            end;
        end;
        return true, nil;
    end;
end;