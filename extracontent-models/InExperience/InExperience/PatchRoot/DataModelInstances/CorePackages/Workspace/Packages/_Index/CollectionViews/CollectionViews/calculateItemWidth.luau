local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3, v4, v5, v6) --[[ Line: 8 ]] --[[ Name: calculateItemWidth ]]
    -- upvalues: v1 (copy)
    if v2 <= 0 then
        return 0;
    else
        v1.assert(v2 >= 1);
        v1.assert(v6 >= 0);
        local v7 = if v6 == 0 then v3 * (v2 - 1) else v3 * v2;
        return (math.max(1, (math.floor((v5 - (if v6 == 0 then v4 * 2 else v4) - v7) / (v2 + v6)))));
    end;
end;