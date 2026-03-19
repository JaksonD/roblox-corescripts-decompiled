local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local _ = require(script.Parent.Parent.types);
local v2 = require(l_script_FirstAncestor_0.Utils.now);
return function(v3, v4) --[[ Line: 15 ]]
    -- upvalues: v2 (copy)
    return function(v5, v6, v7) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy)
        local v8 = v2();
        local v9 = v3(false)[v5];
        if not v9 or not v9.startTime then
            warn((("TimeToInteractiveTracker.trackMilestone called before trackStart for eventName=%*"):format(v5)));
            return;
        else
            local v10 = (v8 - v9.startTime) * 1000;
            local v11 = {
                name = v6, 
                id = if v7 then v7.id else nil, 
                timestamp = v8, 
                deltaMs = v10
            };
            v4(function(v12) --[[ Line: 34 ]]
                -- upvalues: v5 (copy), v11 (copy)
                local v13 = v12[v5];
                if not v13 then
                    return v12;
                else
                    local v14 = table.clone(v12);
                    local v15 = table.clone(v13);
                    local v16 = if v15.milestones then table.clone(v15.milestones) else {};
                    table.insert(v16, v11);
                    v15.milestones = v16;
                    v14[v5] = v15;
                    return v14;
                end;
            end);
            return;
        end;
    end;
end;