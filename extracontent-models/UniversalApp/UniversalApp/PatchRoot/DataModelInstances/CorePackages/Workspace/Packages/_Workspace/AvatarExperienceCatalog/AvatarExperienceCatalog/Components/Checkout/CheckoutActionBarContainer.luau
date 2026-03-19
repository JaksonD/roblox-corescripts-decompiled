local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Checkout.useCheckoutActionBarProps);
local v4 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutActionBar);
local v8 = v2.forwardRef(function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v7 = v3(v5, v6);
    return v2.createElement(v4, v7);
end);
return v2.memo(v8);