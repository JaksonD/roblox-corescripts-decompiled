local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedParentalConsentDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Hooks.NetworkContext);
return function() --[[ Line: 7 ]] --[[ Name: useNetwork ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.useContext(v3);
end;