local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local l_insert_0 = table.insert;
return function(v3, v4) --[[ Line: 17 ]] --[[ Name: groupBy ]]
    -- upvalues: l_insert_0 (copy)
    local v5 = {};
    for v6, v7 in v3 do
        local v8 = nil;
        v8 = if typeof(v4) == "function" then v4(v7, v6) else v7[v4];
        if v8 ~= nil then
            if v5[v8] ~= nil then
                l_insert_0(v5[v8], v7);
            else
                v5[v8] = {
                    v7
                };
            end;
        end;
    end;
    return v5;
end;