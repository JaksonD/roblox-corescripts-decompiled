local _ = require(script.Parent.Parent.types);
local v1 = require(script.Parent.Parent.Parent.Utils.now);
return function(v2) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 10 ]]
        -- upvalues: v2 (copy), v1 (ref)
        v2(function(v4) --[[ Line: 11 ]]
            -- upvalues: v3 (copy), v1 (ref)
            local v5 = v4[v3];
            local v6 = v1();
            local v7 = table.clone(v4);
            v7[v3] = {
                startTime = v6, 
                endTime = nil, 
                deltaMs = nil, 
                sent = nil, 
                metadata = if v5 ~= nil then table.clone(v5.metadata) else {}
            };
            return v7;
        end);
    end;
end;