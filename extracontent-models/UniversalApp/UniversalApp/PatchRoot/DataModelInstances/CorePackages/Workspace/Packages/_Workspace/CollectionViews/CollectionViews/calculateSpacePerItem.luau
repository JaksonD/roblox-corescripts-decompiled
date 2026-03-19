local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3) --[[ Line: 15 ]] --[[ Name: calculateSpacePerItem ]]
    -- upvalues: v1 (copy)
    if v2 <= 1 then
        return {
            gapOffsetPerItem = 0, 
            adjustedGap = v3
        };
    else
        v1.assert(v2 >= 2);
        local v4 = v2 - 1;
        local v5 = math.floor(v4 / v2 * v3);
        local v6 = v3 + (v5 * v2 - v3 * v4) / v4;
        return {
            gapOffsetPerItem = v5, 
            adjustedGap = v6
        };
    end;
end;