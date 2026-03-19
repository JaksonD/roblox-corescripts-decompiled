local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4) --[[ Line: 20 ]] --[[ Name: useThrottledCallback ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.useRef(v3);
    local v6 = v1.useRef(v4);
    v5.current = v3;
    v6.current = v4;
    local v7 = v1.useRef(nil);
    local v8 = v1.useRef(0);
    local v12 = v1.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v7 (copy), v6 (copy), v8 (copy), v5 (copy), v2 (ref)
        if v7.current then
            return;
        else
            local v9 = v6.current or 0;
            local v10 = v8.current + v9 - tick();
            local function v11() --[[ Line: 39 ]] --[[ Name: runCallback ]]
                -- upvalues: v5 (ref), v8 (ref), v7 (ref)
                v5.current();
                v8.current = tick();
                v7.current = nil;
            end;
            if v10 > 0 then
                v7.current = v2.delay(v10):andThen(v11);
                return;
            else
                v5.current();
                v8.current = tick();
                v7.current = nil;
                return;
            end;
        end;
    end);
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v7 (copy), v5 (copy)
        return function() --[[ Line: 54 ]]
            -- upvalues: v7 (ref), v5 (ref)
            local l_current_0 = v7.current;
            if l_current_0 then
                l_current_0:cancel();
                v5.current();
            end;
        end;
    end, {});
    return v12;
end;