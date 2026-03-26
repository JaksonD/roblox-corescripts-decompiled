local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
return function() --[[ Line: 7 ]] --[[ Name: shouldShowBlackbirdUpsell ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy)
    if l_getAppFeaturePolicies_0().getDisableBlackbirdEntrypoints() then
        return false;
    else
        return true;
    end;
end;