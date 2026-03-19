local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2, v3, v4) --[[ Line: 27 ]]
    local v5 = v4 or 1;
    local v6 = #v2;
    if v5 < 1 then
        v5 = math.max(v6 - math.abs(v5), 1);
    end;
    for v7 = v5, v6 do
        if v2[v7] == v3 then
            return v7;
        end;
    end;
    return -1;
end;