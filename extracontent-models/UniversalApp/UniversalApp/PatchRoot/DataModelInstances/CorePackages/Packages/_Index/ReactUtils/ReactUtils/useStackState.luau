local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_LUAU_ANALYZE_ERROR_0 = l_script_FirstAncestor_0.LUAU_ANALYZE_ERROR;
return function(v4) --[[ Line: 9 ]] --[[ Name: useStackState ]]
    -- upvalues: v2 (copy), l_LUAU_ANALYZE_ERROR_0 (copy)
    local v5 = v2.useRef(v4 or {});
    assert(v5.current ~= nil, l_LUAU_ANALYZE_ERROR_0);
    local v6, v7 = v2.useState(#v5.current);
    local v9 = v2.useCallback(function(v8) --[[ Line: 21 ]]
        -- upvalues: v5 (copy), v7 (copy)
        table.insert(v5.current, v8);
        v7(#v5.current);
    end, {});
    local v11 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v10 = table.remove(v5.current);
        v7(#v5.current);
        return v10;
    end, {});
    local v12 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v5 (copy)
        return v5.current[#v5.current];
    end, {});
    local v13 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v5 (copy), v7 (copy)
        table.clear(v5.current);
        v7(0);
    end, {});
    return {
        push = v9, 
        pop = v11, 
        getTop = v12, 
        clear = v13, 
        size = v6
    };
end;