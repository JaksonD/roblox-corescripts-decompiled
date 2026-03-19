local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: mergeProps ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.join(v2, v3);
end;