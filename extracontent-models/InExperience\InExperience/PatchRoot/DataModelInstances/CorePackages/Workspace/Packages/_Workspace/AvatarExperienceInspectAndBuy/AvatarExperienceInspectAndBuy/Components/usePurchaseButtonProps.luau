local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks.useConvertedItemData);
local v4 = require(l_script_FirstAncestor_0.Hooks.useItemStatusLocalization);
local v5 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local v7 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.Types);
local v9 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local v10 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils);
local l_isCollectible_0 = v10.isCollectible;
local l_calculatePurchaseStatusForItem_0 = v10.calculatePurchaseStatusForItem;
local l_getPriceInRobux_0 = v10.getPriceInRobux;
local v14 = require(l_script_FirstAncestor_0.Utils.formatNumber);
local v15 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXFormatPDPPriceLabel_0 = v15.FFlagAXFormatPDPPriceLabel;
local l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 = v15.FFlagAXHideInspectAndBuyPriceIfUnavailable;
return function(v18) --[[ Line: 43 ]] --[[ Name: usePurchaseButtonProps ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy), v7 (copy), v9 (copy), l_isCollectible_0 (copy), l_calculatePurchaseStatusForItem_0 (copy), l_FFlagAXFormatPDPPriceLabel_0 (copy), v14 (copy), l_getPriceInRobux_0 (copy), l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 (copy)
    local v19 = v3(v18.selectedItem);
    local v20 = v5(v19);
    local v21 = v4(v19);
    local v22 = v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v18 (copy), v7 (ref)
        return {
            purchaseButtonText = v18.purchaseButtonText, 
            onPurchase = v18.onBulkPurchase, 
            isDisabled = v18.isDisabled, 
            showRobuxIcon = false, 
            variant = v7.Enums.ButtonVariant.Emphasis
        };
    end, {
        v18
    });
    local v26 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v20 (copy), v9 (ref), v21 (copy), v7 (ref), v19 (copy), l_isCollectible_0 (ref), l_calculatePurchaseStatusForItem_0 (ref), v18 (copy)
        local v23 = true;
        if v20 ~= v9.Free then
            v23 = true;
            if v20 ~= v9.PurchaseFromRoblox then
                v23 = v20 == v9.PurchaseFromResale;
            end;
        end;
        return {
            purchaseButtonText = v21[v20], 
            isDisabled = not v23, 
            variant = if not v23 then v7.Enums.ButtonVariant.Standard else v7.Enums.ButtonVariant.Emphasis, 
            onPurchase = function() --[[ Line: 73 ]] --[[ Name: onPurchase ]]
                -- upvalues: v19 (ref), l_isCollectible_0 (ref), l_calculatePurchaseStatusForItem_0 (ref), v20 (ref), v18 (ref)
                if v19 then
                    local v24 = l_isCollectible_0(v19);
                    local v25 = l_calculatePurchaseStatusForItem_0(v19, v20);
                    v18.onPromptPurchase(v19.id, v19.itemType, v25.collectibleItemId, v25.collectibleLowestAvailableResaleProductId, v25.collectibleLowestAvailableResaleItemInstanceId, v25.collectibleLowestResalePrice, v24);
                end;
            end
        };
    end, {
        v18, 
        v20, 
        v19
    });
    if v18.selectedItem then
        return {
            purchaseButtonProps = v26, 
            priceLabel = {
                leftLabel = v18.localizedStrings.total or "", 
                priceInRobux = if l_FFlagAXFormatPDPPriceLabel_0 then v14(l_getPriceInRobux_0(v19, v20)) else tostring(l_getPriceInRobux_0(v19, v20))
            }, 
            priceStatus = if l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 then v20 else nil
        };
    else
        return {
            purchaseButtonProps = v22, 
            priceLabel = {
                leftLabel = v18.localizedStrings.totalItems or "", 
                priceInRobux = v18.formattedTotalPrice
            }
        };
    end;
end;