local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = v1(v2, "keys");
    local v4 = v1(v2, "values");
    local v5 = nil;
    for _, v7 in pairs(v3) do
        if v4[v7] and v4[v7].previousMessageId == nil then
            return v7;
        end;
    end;
    return v5;
end;