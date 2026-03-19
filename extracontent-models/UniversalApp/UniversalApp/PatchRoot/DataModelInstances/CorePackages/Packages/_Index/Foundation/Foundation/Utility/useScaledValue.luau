local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Logger);
local v2 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v3) --[[ Line: 6 ]] --[[ Name: useScaledValue ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2();
    local v5 = v3 * v4.Config.UI.Scale;
    if v5 <= v4.Size.Size_3000 then
        v1:warning("useScaledValue should be used for values larger than Size tokens. For smaller values, please align to a Size or derivative token.");
    end;
    return v5;
end;