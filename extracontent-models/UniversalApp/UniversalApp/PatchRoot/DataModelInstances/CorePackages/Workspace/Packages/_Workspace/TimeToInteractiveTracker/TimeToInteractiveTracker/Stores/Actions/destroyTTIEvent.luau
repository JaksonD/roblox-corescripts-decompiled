local _ = require(script.Parent.Parent.types);
return function(v1) --[[ Line: 7 ]]
    return function(v2) --[[ Line: 8 ]]
        -- upvalues: v1 (copy)
        v1(function(v3) --[[ Line: 9 ]]
            -- upvalues: v2 (copy)
            if v3[v2] == nil then
                return v3;
            else
                local v4 = table.clone(v3);
                v4[v2] = nil;
                return v4;
            end;
        end);
    end;
end;