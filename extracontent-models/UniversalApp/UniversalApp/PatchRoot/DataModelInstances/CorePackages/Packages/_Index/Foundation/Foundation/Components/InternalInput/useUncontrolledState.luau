local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: useUncontrolledState ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState(v2 or false);
    v1.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v5 (copy)
        if v2 ~= nil then
            v5(v2);
        end;
    end, {
        v2
    });
    return v4, (v1.useCallback(function(v6) --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v5 (copy), v3 (copy)
        if v2 == nil then
            v5(v6);
        end;
        v3(v6);
    end, {
        v2, 
        v3
    }));
end;