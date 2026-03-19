local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 11 ]] --[[ Name: iterable ]]
    local v3 = 1;
    local v4 = true;
    local v5 = nil;
    local _ = nil;
    return function() --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v2 (copy), v3 (ref), v5 (ref)
        if v4 then
            local v7 = v2[v3];
            if v7 == nil then
                v4 = false;
            else
                local l_v3_0 = v3;
                v3 = v3 + 1;
                return l_v3_0, v7;
            end;
        end;
        repeat
            v5 = next(v2, v5);
        until typeof(v5) ~= "number" or v5 <= 0 or v5 >= v3 or v5 % 1 ~= 0;
        if v5 == nil then
            return nil;
        else
            return v5, v2[v5];
        end;
    end;
end;