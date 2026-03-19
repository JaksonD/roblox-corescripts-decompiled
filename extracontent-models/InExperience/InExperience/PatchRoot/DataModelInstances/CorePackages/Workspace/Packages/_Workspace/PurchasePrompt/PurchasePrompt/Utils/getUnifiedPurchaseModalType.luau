local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UnifiedPurchaseModalTypeEnum_0 = require(l_Parent_0.IAPExperience).Enums.UnifiedPurchaseModalTypeEnum;
local v3 = require(l_script_FirstAncestor_0.Utils.isMultiItemPurchase);
local v4 = require(l_script_FirstAncestor_0.Enums.RequestType);
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
return function(v6) --[[ Line: 12 ]] --[[ Name: getUnifiedPurchaseModalType ]]
    -- upvalues: v4 (copy), l_UnifiedPurchaseModalTypeEnum_0 (copy), v3 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    if v6 == v4.Experience then
        return l_UnifiedPurchaseModalTypeEnum_0.Experience;
    elseif v3(v6) then
        return l_UnifiedPurchaseModalTypeEnum_0.MultiItem;
    elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v6 == v4.DeveloperSubscription then
        return l_UnifiedPurchaseModalTypeEnum_0.DeveloperSubscription;
    else
        return l_UnifiedPurchaseModalTypeEnum_0.SingleItem;
    end;
end;