local _ = require(script.Parent.Parent.types);
return function(v1) --[[ Line: 7 ]]
    return function(v2) --[[ Line: 8 ]]
        -- upvalues: v1 (copy)
        v1(function(v3) --[[ Line: 9 ]]
            -- upvalues: v2 (copy)
            local v4 = v3[v2];
            if v4 == nil then
                return v3;
            else
                local v5 = table.clone(v3);
                v5[v2] = {
                    startTime = nil, 
                    endTime = nil, 
                    deltaMs = nil, 
                    sent = nil, 
                    metadata = table.clone(v4.metadata)
                };
                return v5;
            end;
        end);
    end;
end;