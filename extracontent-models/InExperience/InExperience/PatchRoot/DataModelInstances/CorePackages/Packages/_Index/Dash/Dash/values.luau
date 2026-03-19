local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
return function(v3) --[[ Line: 14 ]] --[[ Name: values ]]
    -- upvalues: l_insert_0 (copy)
    local v4 = {};
    for _, v6 in v3 do
        l_insert_0(v4, v6);
    end;
    return v4;
end;