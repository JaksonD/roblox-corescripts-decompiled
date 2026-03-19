local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: collectSet ]]
    local v4 = {};
    for v5, v6 in v2 do
        local v7 = nil;
        v7 = if v3 == nil then v6 else v3(v5, v6);
        if v7 ~= nil then
            v4[v7] = true;
        end;
    end;
    return v4;
end;