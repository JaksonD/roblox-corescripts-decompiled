local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3, v4, v5) --[[ Line: 8 ]] --[[ Name: calculateRelativeColumnGap ]]
    -- upvalues: v1 (copy)
    if v2 < 2 then
        return 0;
    else
        v1.assert(v2 >= 2);
        local v6 = v2 * v4 + (v2 - 1) * v3 + v5 * 2;
        if v6 > 0 then
            return v3 / v6;
        else
            return 0;
        end;
    end;
end;