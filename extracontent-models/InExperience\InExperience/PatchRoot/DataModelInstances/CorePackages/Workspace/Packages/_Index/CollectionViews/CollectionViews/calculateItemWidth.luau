local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
return function(v3, v4, v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: calculateItemWidth ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    if v3 <= 0 then
        return 0;
    else
        v1.assert(v3 >= 1);
        if l_FFlagLuaAppCompositionSupport_0 then
            local v9 = v4 * (v3 - 1);
            return (math.max(1, (v6 - (v5 * 2 + (v8 or 0)) - v9) / (v3 + v7)));
        else
            v1.assert(v7 >= 0);
            local v10 = if v7 == 0 then v4 * (v3 - 1) else v4 * v3;
            return (math.max(1, (math.floor((v6 - (if v7 == 0 then v5 * 2 else v5) - v10) / (v3 + v7)))));
        end;
    end;
end;