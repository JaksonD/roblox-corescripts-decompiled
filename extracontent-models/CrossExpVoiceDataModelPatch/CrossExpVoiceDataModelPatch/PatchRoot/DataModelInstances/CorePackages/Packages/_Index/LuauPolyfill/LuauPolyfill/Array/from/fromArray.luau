local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 11 ]]
    local v5 = {};
    if v3 then
        local v6 = #v2;
        v5 = table.create(v6);
        for v7 = 1, v6 do
            if v4 ~= nil then
                v5[v7] = v3(v4, v2[v7], v7);
            else
                v5[v7] = v3(v2[v7], v7);
            end;
        end;
        return v5;
    else
        return (table.clone(v2));
    end;
end;