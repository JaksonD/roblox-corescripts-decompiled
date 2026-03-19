local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
return function(v3, v4) --[[ Line: 18 ]] --[[ Name: collectArray ]]
    -- upvalues: l_insert_0 (copy)
    local v5 = {};
    for v6, v7 in v3 do
        local v8 = v4(v6, v7);
        if v8 ~= nil then
            l_insert_0(v5, v8);
        end;
    end;
    return v5;
end;