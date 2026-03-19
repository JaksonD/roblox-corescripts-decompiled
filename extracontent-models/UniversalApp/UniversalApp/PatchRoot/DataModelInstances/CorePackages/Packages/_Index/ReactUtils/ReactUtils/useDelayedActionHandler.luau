local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: useDelayedActionHandler ]]
    -- upvalues: v1 (copy)
    local v5 = v1.useRef(nil);
    local v6 = v1.useRef(0);
    local function v9() --[[ Line: 15 ]] --[[ Name: handleAction ]]
        -- upvalues: v3 (copy), v6 (copy), v5 (copy), v2 (copy), v4 (copy)
        local v7 = os.clock();
        if v3 ~= nil and v6.current ~= nil and v7 - v6.current < v3 then
            return;
        else
            v6.current = v7;
            local l_current_0 = v5.current;
            if l_current_0 ~= nil then
                task.cancel(l_current_0);
            end;
            v5.current = task.delay(v2, function() --[[ Line: 33 ]]
                -- upvalues: v4 (ref)
                v4();
            end);
            return;
        end;
    end;
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v5 (copy)
        return function() --[[ Line: 39 ]]
            -- upvalues: v5 (ref)
            local l_current_1 = v5.current;
            if l_current_1 ~= nil then
                task.cancel(l_current_1);
            end;
        end;
    end, {
        v5
    });
    return v9;
end;