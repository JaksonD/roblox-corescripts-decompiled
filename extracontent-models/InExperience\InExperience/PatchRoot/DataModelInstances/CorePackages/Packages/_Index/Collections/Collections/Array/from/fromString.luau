local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2, v3, v4) --[[ Line: 25 ]]
    local v5 = {};
    local v6 = #v2;
    v5 = table.create(v6);
    if v3 then
        for v7 = 1, v6 do
            if v4 ~= nil then
                v5[v7] = v3(v4, string.sub(v2, v7, v7), v7);
            else
                v5[v7] = v3(string.sub(v2, v7, v7), v7);
            end;
        end;
        return v5;
    else
        for v8 = 1, v6 do
            v5[v8] = string.sub(v2, v8, v8);
        end;
        return v5;
    end;
end;