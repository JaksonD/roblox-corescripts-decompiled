local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getExpectedPartSize);
return function(v3, v4, v5) --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    local v6 = {};
    for _, v8 in v3 do
        local v9 = v4(v8);
        v6[v8] = v2(v9, v5) / v2(v9, v5, true);
    end;
    return v6;
end;