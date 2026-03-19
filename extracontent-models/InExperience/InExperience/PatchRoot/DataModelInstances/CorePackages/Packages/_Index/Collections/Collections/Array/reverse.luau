local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2) --[[ Line: 22 ]]
    local v3 = #v2;
    local v4 = 1;
    while v4 < v3 do
        local v5 = v2[v3];
        local v6 = v2[v4];
        v2[v4] = v5;
        v2[v3] = v6;
        v4 = v4 + 1;
        v3 = v3 - 1;
    end;
    return v2;
end;