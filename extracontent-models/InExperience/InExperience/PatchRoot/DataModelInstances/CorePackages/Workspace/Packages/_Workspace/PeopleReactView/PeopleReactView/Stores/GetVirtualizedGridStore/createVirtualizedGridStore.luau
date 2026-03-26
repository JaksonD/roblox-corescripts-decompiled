local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = game:DefineFastInt("PeoplePageVirtualizedGridBuffer", 200);
return function() --[[ Line: 23 ]] --[[ Name: createVirtualizedGridStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.createSignal(1);
    local v5, v6 = v1.createSignal(0);
    local v8 = v1.createComputed(function(v7) --[[ Line: 27 ]]
        -- upvalues: v5 (copy), v3 (copy)
        return v5(v7) - v3(v7) + 1;
    end);
    local function v17(v9, v10, _, v12, v13, v14) --[[ Line: 33 ]]
        -- upvalues: v2 (ref), v4 (copy), v6 (copy)
        local v15 = math.max(1, math.floor((v9 - v2) / (v12 + v14)) * v13 + 1);
        local v16 = v15 + math.ceil((v10 + 2 * v2) / (v12 + v14)) * v13 - 1;
        v4(v15);
        v6(v16);
    end;
    return {
        getMinVirtualizedIndex = v3, 
        getMaxVirtualizedIndex = v5, 
        getNumVirtualizedItems = v8, 
        calculateVirtualizedGridLimits = v17
    };
end;