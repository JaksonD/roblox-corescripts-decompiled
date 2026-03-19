local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 17 ]] --[[ Name: useAsync ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState({
        status = "loading"
    });
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v2 (copy)
        v5({
            status = "loading"
        });
        local v7 = task.spawn(function() --[[ Line: 27 ]]
            -- upvalues: v5 (ref), v2 (ref)
            xpcall(function() --[[ Line: 28 ]]
                -- upvalues: v5 (ref), v2 (ref)
                v5({
                    status = "ok", 
                    value = v2()
                });
            end, function(v6) --[[ Line: 33 ]]
                -- upvalues: v5 (ref)
                v5({
                    status = "error", 
                    problem = v6
                });
            end);
        end);
        return function() --[[ Line: 41 ]]
            -- upvalues: v7 (copy)
            task.cancel(v7);
        end;
    end, v3);
    return v4;
end;