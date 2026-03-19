local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 5 ]] --[[ Name: useGetAndSetRef ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(v2);
    return v1.useCallback(function() --[[ Line: 7 ]]
        -- upvalues: v3 (copy)
        return v3.current;
    end, {}), (v1.useCallback(function(v4) --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        if typeof(v4) == "function" then
            v3.current = v4(v3.current);
            return;
        else
            v3.current = v4;
            return;
        end;
    end, {}));
end;