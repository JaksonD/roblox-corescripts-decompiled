local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2) --[[ Line: 24 ]]
    assert(v2 ~= nil, "cannot get entries from a nil value");
    local v3 = typeof(v2);
    local v4 = {};
    if v3 == "table" then
        for v5, v6 in pairs(v2) do
            table.insert(v4, {
                v5, 
                v6
            });
        end;
        return v4;
    else
        if v3 == "string" then
            for v7 = 1, string.len(v2) do
                v4[v7] = {
                    tostring(v7), 
                    (string.sub(v2, v7, v7))
                };
            end;
        end;
        return v4;
    end;
end;