local _ = require(script.Parent.Parent.types);
local v1 = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return function(v3, v4) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v1 (ref)
        v2(function(v5) --[[ Line: 12 ]]
            -- upvalues: v3 (copy), v1 (ref), v4 (copy)
            local v6 = v5[v3];
            if v6 == nil then
                warn((("TimeToInteractiveTracker.updateMetadata called before trackStart for eventName=%*"):format(v3)));
                return v5;
            else
                local v7 = table.clone(v5);
                v7[v3] = {
                    startTime = v6.startTime, 
                    endTime = v6.endTime, 
                    deltaMs = v6.deltaMs, 
                    sent = v6.sent, 
                    metadata = v1(v6.metadata, v4)
                };
                return v7;
            end;
        end);
    end;
end;