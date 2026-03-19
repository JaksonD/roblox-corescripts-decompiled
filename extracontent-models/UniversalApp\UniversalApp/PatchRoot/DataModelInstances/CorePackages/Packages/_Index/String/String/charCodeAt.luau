local l_Parent_0 = script.Parent.Parent;
local l_NaN_0 = require(l_Parent_0.Number).NaN;
return function(v2, v3) --[[ Line: 24 ]]
    -- upvalues: l_NaN_0 (copy)
    if type(v3) ~= "number" then
        v3 = 1;
    end;
    local v4 = string.len(v2);
    if v3 < 1 or v4 < v3 then
        return l_NaN_0;
    else
        local v5 = utf8.offset(v2, v3);
        if v5 == nil or v4 < v5 then
            return l_NaN_0;
        else
            local v6 = utf8.codepoint(v2, v5, v5);
            if v6 == nil then
                return l_NaN_0;
            else
                return v6;
            end;
        end;
    end;
end;