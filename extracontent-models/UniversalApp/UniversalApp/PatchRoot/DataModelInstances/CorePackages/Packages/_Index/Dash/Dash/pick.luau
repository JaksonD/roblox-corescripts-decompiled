local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: pick ]]
    local v4 = {};
    for v5, v6 in v2 do
        if v3(v6, v5) then
            v4[v5] = v6;
        end;
    end;
    return v4;
end;