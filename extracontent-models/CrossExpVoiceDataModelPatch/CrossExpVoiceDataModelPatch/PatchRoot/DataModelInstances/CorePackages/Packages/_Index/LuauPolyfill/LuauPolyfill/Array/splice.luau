local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4, ...) --[[ Line: 9 ]]
    if #v2 < v3 then
        for v5 = 1, select("#", ...) do
            table.insert(v2, (select(v5, ...)));
        end;
        return {};
    else
        local v6 = #v2;
        if v3 < 1 then
            v3 = math.max(v6 - math.abs(v3), 1);
        end;
        local v7 = {};
        local v8 = v4 or v6;
        if v8 > 0 then
            for _ = v3, math.min(v6, v3 + math.max(0, v8 - 1)) do
                table.insert(v7, (table.remove(v2, v3)));
            end;
        end;
        for v10 = select("#", ...), 1, -1 do
            table.insert(v2, v3, (select(v10, ...)));
        end;
        return v7;
    end;
end;