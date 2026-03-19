local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v3, v4, v5) --[[ Line: 27 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        if typeof(v3) ~= "table" then
            error(string.format("Array.map called on %s", (typeof(v3))));
        end;
        if typeof(v4) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v6 = #v3;
    local v7 = {};
    local v8 = 1;
    while v8 <= v6 do
        local v9 = v3[v8];
        if v9 ~= nil then
            local _ = nil;
            v7[v8] = if v5 ~= nil then v4(v5, v9, v8, v3) else v4(v9, v8, v3);
        end;
        v8 = v8 + 1;
    end;
    return v7;
end;