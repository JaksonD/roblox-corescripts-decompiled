local l_Parent_0 = script:FindFirstAncestor("TimeToInteractiveTracker").Parent;
local l_FFlagAXTTIEnableColdWarmDetection_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableColdWarmDetection;
local _ = require(script.Parent.Parent.types);
local v3 = require(script.Parent.Parent.Parent.Utils.now);
return function(v4) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_FFlagAXTTIEnableColdWarmDetection_0 (copy)
    local v5 = {};
    return function(v6, v7) --[[ Line: 22 ]]
        -- upvalues: v4 (copy), v3 (ref), l_FFlagAXTTIEnableColdWarmDetection_0 (ref), v5 (copy)
        v4(function(v8) --[[ Line: 23 ]]
            -- upvalues: v6 (copy), v3 (ref), l_FFlagAXTTIEnableColdWarmDetection_0 (ref), v7 (copy), v5 (ref)
            local v9 = v8[v6];
            local v10 = v3();
            local v11 = table.clone(v8);
            v11[v6] = {
                startTime = v10, 
                endTime = nil, 
                deltaMs = nil, 
                sent = nil, 
                metadata = if v9 ~= nil then table.clone(v9.metadata) else {}
            };
            if l_FFlagAXTTIEnableColdWarmDetection_0 and v7 then
                v11[v6].metadata.coldStart = not v5[v6];
                v5[v6] = true;
            end;
            return v11;
        end);
    end;
end;