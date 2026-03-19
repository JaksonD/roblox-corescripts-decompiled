local l_Parent_0 = script.Parent.Parent;
local l_NaN_0 = require(l_Parent_0.Number).NaN;
return function(v2, v3) --[[ Line: 10 ]]
    -- upvalues: l_NaN_0 (copy)
    if typeof(v3) ~= "number" then
        v3 = 1;
    end;
    local v4, v5 = utf8.len(v2);
    assert(v4 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v2, (tostring(v5))));
    if v4 < v3 or v3 < 1 then
        return l_NaN_0;
    else
        local v6 = utf8.offset(v2, v3);
        local v7 = utf8.codepoint(v2, v6, v6);
        if v7 == nil then
            return l_NaN_0;
        else
            return v7;
        end;
    end;
end;