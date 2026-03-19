local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 14 ]] --[[ Name: useRefs ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef({});
    local v5 = v1.useRef(v2);
    if #v4.current < v2 then
        for _ = 1, v2 - #v4.current do
            local v7 = v1.createRef();
            v7.current = v3;
            table.insert(v4.current, v7);
        end;
    elseif v2 < v5.current then
        for v8 = v2 + 1, v5.current do
            v4.current[v8].current = v3;
        end;
    end;
    v5.current = v2;
    return (v1.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v4 (copy), v2 (copy)
        return table.move(v4.current, 1, v2, 1, {});
    end, {
        v2
    }));
end;