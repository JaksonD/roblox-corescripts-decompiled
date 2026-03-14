local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function() --[[ Line: 7 ]] --[[ Name: useClock ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.useBinding(0);
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v5 = task.spawn(function() --[[ Line: 11 ]]
            -- upvalues: v3 (ref), v2 (ref)
            while true do
                local v4 = task.wait();
                v3(v2:getValue() + v4);
            end;
        end);
        return function() --[[ Line: 18 ]]
            -- upvalues: v5 (copy)
            task.cancel(v5);
        end;
    end, {});
    return v2;
end;