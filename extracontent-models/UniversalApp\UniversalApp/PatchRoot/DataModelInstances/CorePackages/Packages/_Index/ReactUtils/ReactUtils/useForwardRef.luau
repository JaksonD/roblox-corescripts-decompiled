local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 29 ]] --[[ Name: useForwardRef ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef(nil);
    local v5 = v1.useRef(nil);
    local v7 = v1.useCallback(function(v6) --[[ Line: 33 ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (copy)
        if v5.current then
            v5.current();
            v5.current = nil;
        end;
        if v6 then
            v4.current = v6;
            v5.current = v3(v6);
        end;
    end, {
        v3
    });
    v1.useImperativeHandle(v2, function() --[[ Line: 44 ]]
        -- upvalues: v4 (copy)
        return v4.current;
    end);
    return v7;
end;