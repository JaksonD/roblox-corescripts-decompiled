local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 11 ]]
    if _G.__DEV__ then
        if typeof(v2) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(v2))));
        end;
        if typeof(v3) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v5 = #v2;
    local v6 = {};
    local v7 = 1;
    if v4 == nil then
        for v8 = 1, v5 do
            local v9 = v2[v8];
            if v9 ~= nil and v3(v9, v8, v2) then
                v6[v7] = v9;
                v7 = v7 + 1;
            end;
        end;
        return v6;
    else
        for v10 = 1, v5 do
            local v11 = v2[v10];
            if v11 ~= nil and v3(v4, v11, v10, v2) then
                v6[v7] = v11;
                v7 = v7 + 1;
            end;
        end;
        return v6;
    end;
end;