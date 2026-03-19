local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 10 ]]
    if _G.__DEV__ then
        if typeof(v2) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(v2))));
        end;
        if typeof(v3) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v5 = #v2;
    local v6 = nil;
    local v7 = 1;
    if v4 ~= nil then
        v6 = v4;
    else
        v7 = 2;
        if v5 == 0 then
            error("reduce of empty array with no initial value");
        end;
        v6 = v2[1];
    end;
    for v8 = v7, v5 do
        v6 = v3(v6, v2[v8], v8, v2);
    end;
    return v6;
end;