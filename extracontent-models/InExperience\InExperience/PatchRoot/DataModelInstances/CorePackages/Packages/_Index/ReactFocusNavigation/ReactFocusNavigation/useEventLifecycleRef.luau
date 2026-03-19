local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: useEventLifecycleRef ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef(nil);
    return (v1.useCallback(function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy)
        if v4.current and v3 then
            v3(v4.current);
        end;
        if v5 then
            v2(v5);
        end;
        v4.current = v5;
    end, {
        v2, 
        v3
    }));
end;