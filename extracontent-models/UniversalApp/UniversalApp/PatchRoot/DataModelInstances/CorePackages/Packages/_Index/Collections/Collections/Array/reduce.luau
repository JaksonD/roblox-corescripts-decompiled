local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v3, v4, v5) --[[ Line: 26 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        if typeof(v3) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(v3))));
        end;
        if typeof(v4) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v6 = #v3;
    local v7 = nil;
    local v8 = 1;
    if v5 ~= nil then
        v7 = v5;
    else
        v8 = 2;
        if v6 == 0 then
            error("reduce of empty array with no initial value");
        end;
        v7 = v3[1];
    end;
    for v9 = v8, v6 do
        v7 = v4(v7, v3[v9], v9, v3);
    end;
    return v7;
end;