local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: collect ]]
    local v4 = {};
    for v5, v6 in v2 do
        local v7, v8 = v3(v5, v6);
        if v7 ~= nil then
            v4[v7] = v8;
        end;
    end;
    return v4;
end;