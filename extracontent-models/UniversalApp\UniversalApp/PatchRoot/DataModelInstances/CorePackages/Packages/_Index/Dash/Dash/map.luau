local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4) --[[ Line: 20 ]] --[[ Name: map ]]
    -- upvalues: v2 (copy)
    local v5 = {};
    for v6, v7 in v3 do
        local v8 = v4(v7, v6);
        v2(v8 == nil, false, "Returned nil from a Dash.map handler");
        v5[v6] = v8;
    end;
    return v5;
end;