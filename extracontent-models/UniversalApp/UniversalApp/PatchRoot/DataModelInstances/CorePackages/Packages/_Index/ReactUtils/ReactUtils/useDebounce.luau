local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: useDebounce ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState(v2);
    v1.useLayoutEffect(function() --[[ Line: 10 ]]
        -- upvalues: v5 (copy), v2 (copy), v3 (copy)
        local function v6() --[[ Line: 11 ]] --[[ Name: updateValue ]]
            -- upvalues: v5 (ref), v2 (ref)
            v5(v2);
        end;
        if v3 == nil or v3 == 0 then
            v5(v2);
            return;
        else
            local v7 = task.delay(v3, v6);
            return function() --[[ Line: 22 ]]
                -- upvalues: v7 (copy)
                task.cancel(v7);
            end;
        end;
    end, {
        v2, 
        v3
    });
    return v4;
end;