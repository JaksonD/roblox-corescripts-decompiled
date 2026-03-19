local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Actions.SetCountryCodeList);
return function(v2, v3) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {};
    assert(v2, "");
    if v3.type == v1.name then
        v2 = v3.countryCodeList;
    end;
    return v2;
end;