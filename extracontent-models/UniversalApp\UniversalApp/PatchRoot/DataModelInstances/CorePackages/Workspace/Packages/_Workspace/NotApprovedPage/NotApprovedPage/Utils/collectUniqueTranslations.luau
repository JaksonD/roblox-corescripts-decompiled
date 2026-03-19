local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 20 ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for _, v6 in v2 do
        local v7 = if v3 then v3[v6] else v6;
        if v7 and v7 ~= "" then
            v4[v7] = true;
        end;
    end;
    return v1.Dictionary.keys(v4);
end;