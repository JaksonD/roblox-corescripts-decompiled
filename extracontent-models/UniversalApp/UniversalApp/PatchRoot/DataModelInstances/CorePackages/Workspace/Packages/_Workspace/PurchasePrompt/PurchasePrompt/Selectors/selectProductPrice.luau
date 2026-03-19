local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
return function(v4) --[[ Line: 25 ]] --[[ Name: selectProductPrice ]]
    -- upvalues: v2 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy)
    local l_collectibleItemInstanceId_0 = v4.promptRequest.collectibleItemInstanceId;
    local l_expectedPrice_0 = v4.promptRequest.expectedPrice;
    local v7 = v4.accountInfo.membershipType == 4;
    local v8 = v2(v4.productInfo, v7);
    if l_collectibleItemInstanceId_0 and l_collectibleItemInstanceId_0 ~= "" or l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v4.productPayload and v4.productPayload.timedOptionDays ~= nil then
        v8 = l_expectedPrice_0;
    end;
    return v8;
end;