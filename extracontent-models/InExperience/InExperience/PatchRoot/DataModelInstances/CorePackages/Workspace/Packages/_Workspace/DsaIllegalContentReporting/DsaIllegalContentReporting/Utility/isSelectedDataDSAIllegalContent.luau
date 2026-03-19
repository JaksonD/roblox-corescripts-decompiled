local l_script_FirstAncestor_0 = script:FindFirstAncestor("DsaIllegalContentReporting");
local v1 = require(l_script_FirstAncestor_0.Utility.Constants);
return function(v2) --[[ Line: 6 ]] --[[ Name: isSelectedDataDSAIllegalContent ]]
    -- upvalues: v1 (copy)
    if v2 == nil then
        return false;
    else
        local v3 = v2[#v2];
        local v4 = false;
        if v3 ~= nil then
            v4 = v3.tagValues[1] == v1.DSA_TAG_VALUE;
        end;
        return v4;
    end;
end;