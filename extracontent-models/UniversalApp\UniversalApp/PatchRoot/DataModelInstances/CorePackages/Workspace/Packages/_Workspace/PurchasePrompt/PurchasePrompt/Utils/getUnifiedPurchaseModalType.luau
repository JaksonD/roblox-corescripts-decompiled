local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UnifiedPurchaseModalTypeEnum_0 = require(l_Parent_0.IAPExperience).Enums.UnifiedPurchaseModalTypeEnum;
local v3 = require(l_script_FirstAncestor_0.Utils.isMultiItemPurchase);
local v4 = require(l_script_FirstAncestor_0.Enums.RequestType);
return function(v5) --[[ Line: 10 ]] --[[ Name: getUnifiedPurchaseModalType ]]
    -- upvalues: v4 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy), v3 (copy)
    if v5 == v4.Experience then
        return l_UnifiedPurchaseModalTypeEnum_0.Experience;
    elseif v3(v5) then
        return l_UnifiedPurchaseModalTypeEnum_0.MultiItem;
    else
        return l_UnifiedPurchaseModalTypeEnum_0.SingleItem;
    end;
end;