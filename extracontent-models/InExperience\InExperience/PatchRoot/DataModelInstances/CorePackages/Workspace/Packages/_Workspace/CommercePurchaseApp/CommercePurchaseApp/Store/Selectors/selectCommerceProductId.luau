local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v2) --[[ Line: 7 ]] --[[ Name: selectCommerceProductId ]]
    return v2.commercePurchaseState.commerceProductId;
end;