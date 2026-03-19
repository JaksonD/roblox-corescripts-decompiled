local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
return function(v3, v4) --[[ Line: 14 ]] --[[ Name: union ]]
    -- upvalues: v1 (copy)
    local v5 = table.clone(v3);
    for v6, v7 in v4 do
        if v7 == v1 then
            v5[v6] = nil;
        else
            v5[v6] = v7;
        end;
    end;
    return v5;
end;