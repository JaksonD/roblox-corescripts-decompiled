local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
return function(v3, v4) --[[ Line: 11 ]] --[[ Name: useOptimisticUpdateStatus ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        return function() --[[ Line: 19 ]]
            -- upvalues: v5 (ref)
            if v5.current then
                v5.current();
            end;
        end;
    end, {});
    return v1.useCallback(function(...) --[[ Line: 27 ]]
        -- upvalues: v5 (copy), v3 (copy), v2 (ref), v4 (copy)
        if v5.current then
            v5.current();
            v5.current = nil;
        end;
        local v6 = v3(...);
        if v6 then
            v5.current = v2.createEffect(function(v7) --[[ Line: 39 ]]
                -- upvalues: v6 (copy), v4 (ref)
                local v8 = v6(v7);
                if v8 ~= nil then
                    v4(v8);
                end;
            end);
        end;
    end, {
        v3, 
        v4
    });
end;