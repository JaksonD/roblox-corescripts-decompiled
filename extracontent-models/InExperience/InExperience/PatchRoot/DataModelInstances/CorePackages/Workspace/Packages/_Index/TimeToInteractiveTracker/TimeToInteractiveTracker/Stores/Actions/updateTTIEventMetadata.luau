local l_Parent_0 = script:FindFirstAncestor("TimeToInteractiveTracker").Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local _ = require(script.Parent.Parent.types);
local v3 = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata);
return function(v4) --[[ Line: 16 ]]
    -- upvalues: l_FFlagAXTTIEnableMilestones_0 (copy), v3 (copy)
    return function(v5, v6) --[[ Line: 17 ]]
        -- upvalues: v4 (copy), l_FFlagAXTTIEnableMilestones_0 (ref), v3 (ref)
        v4(function(v7) --[[ Line: 18 ]]
            -- upvalues: v5 (copy), l_FFlagAXTTIEnableMilestones_0 (ref), v3 (ref), v6 (copy)
            local v8 = v7[v5];
            if v8 == nil then
                warn((("TimeToInteractiveTracker.updateMetadata called before trackStart for eventName=%*"):format(v5)));
                return v7;
            else
                local v9 = table.clone(v7);
                if l_FFlagAXTTIEnableMilestones_0 then
                    local v10 = table.clone(v8);
                    v10.metadata = v3(v8.metadata, v6);
                    v9[v5] = v10;
                    return v9;
                else
                    v9[v5] = {
                        startTime = v8.startTime, 
                        endTime = v8.endTime, 
                        deltaMs = v8.deltaMs, 
                        sent = v8.sent, 
                        metadata = v3(v8.metadata, v6)
                    };
                    return v9;
                end;
            end;
        end);
    end;
end;