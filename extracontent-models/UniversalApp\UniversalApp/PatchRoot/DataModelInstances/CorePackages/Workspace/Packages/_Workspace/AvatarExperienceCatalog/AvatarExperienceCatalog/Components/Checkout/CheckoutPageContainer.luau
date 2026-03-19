local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutPage);
local v4 = require(l_script_FirstAncestor_0.Components.Checkout.useCheckoutPageViewModel);
return function(v5) --[[ Line: 10 ]] --[[ Name: CheckoutPageContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = v4(v5);
    return v2.createElement(v3, v6);
end;