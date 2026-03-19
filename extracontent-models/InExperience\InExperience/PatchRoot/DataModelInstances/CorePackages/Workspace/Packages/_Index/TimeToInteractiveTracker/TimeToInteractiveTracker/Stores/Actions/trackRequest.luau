local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local _ = require(script.Parent.Parent.types);
local v2 = require(l_script_FirstAncestor_0.Utils.now);
local v3 = require(l_script_FirstAncestor_0.Utils.Util);
return function(v4, v5) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v6, v7, v8) --[[ Line: 17 ]]
        -- upvalues: v2 (ref), v4 (copy), v5 (copy), v3 (ref)
        local v9 = v2();
        local v10 = v4(false)[v6];
        if not v10 or not v10.startTime then
            warn((("TimeToInteractiveTracker.trackRequest called before trackStart for eventName=%*"):format(v6)));
            return;
        else
            local v11 = (v9 - v10.startTime) * 1000;
            local v12 = {
                name = v8, 
                timestamp = v9, 
                deltaMs = v11
            };
            v5(function(v13) --[[ Line: 34 ]]
                -- upvalues: v6 (copy), v3 (ref), v7 (copy), v12 (copy)
                local v14 = v13[v6];
                if not v14 or not v14.milestones then
                    return v13;
                else
                    local v15 = v3.findLastMilestoneIndex(v14.milestones, v7);
                    if not v15 then
                        warn((("TimeToInteractiveTracker.trackRequest: no milestone \"%*\" found for eventName=%*"):format(v7, v6)));
                        return v13;
                    else
                        local v16 = table.clone(v13);
                        local v17 = table.clone(v14);
                        local v18 = table.clone(v14.milestones);
                        local v19 = table.clone(v18[v15]);
                        local v20 = if v19.requests then table.clone(v19.requests) else {};
                        table.insert(v20, v12);
                        v19.requests = v20;
                        v18[v15] = v19;
                        v17.milestones = v18;
                        v16[v6] = v17;
                        return v16;
                    end;
                end;
            end);
            return;
        end;
    end;
end;