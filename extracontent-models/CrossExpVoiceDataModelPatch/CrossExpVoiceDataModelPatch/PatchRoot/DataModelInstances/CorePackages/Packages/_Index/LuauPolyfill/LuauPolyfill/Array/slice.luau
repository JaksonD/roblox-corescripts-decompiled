local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 9 ]]
    if typeof(v2) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(v2))));
    end;
    local v5 = #v2;
    local v6 = v3 or 1;
    local v7 = nil;
    v7 = if not (v4 ~= nil) or v5 + 1 < v4 then v5 + 1 else v4;
    if v5 + 1 < v6 then
        return {};
    else
        local v8 = {};
        if v6 < 1 then
            v6 = math.max(v5 - math.abs(v6), 1);
        end;
        if v7 < 1 then
            v7 = math.max(v5 - math.abs(v7), 1);
        end;
        local l_v6_0 = v6;
        local v10 = 1;
        while l_v6_0 < v7 do
            v8[v10] = v2[l_v6_0];
            l_v6_0 = l_v6_0 + 1;
            v10 = v10 + 1;
        end;
        return v8;
    end;
end;