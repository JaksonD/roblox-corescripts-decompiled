local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3, v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: calculateNumColumns ]]
    -- upvalues: v1 (copy)
    v1.assert(v2 >= 1);
    v1.assert(v3 >= 0);
    local v8 = math.floor((v6 + v3) / (v2 + v3));
    if v7 then
        v8 = math.floor(v8 * 0.5) * 2;
    end;
    return (math.min(v5, (math.max(v4, v8))));
end;