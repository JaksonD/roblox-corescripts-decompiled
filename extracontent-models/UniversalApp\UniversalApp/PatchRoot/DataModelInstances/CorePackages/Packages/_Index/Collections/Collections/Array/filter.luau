local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v3, v4, v5) --[[ Line: 27 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        if typeof(v3) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(v3))));
        end;
        if typeof(v4) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v6 = #v3;
    local v7 = {};
    local v8 = 1;
    if v5 == nil then
        for v9 = 1, v6 do
            local v10 = v3[v9];
            if v10 ~= nil and v4(v10, v9, v3) then
                v7[v8] = v10;
                v8 = v8 + 1;
            end;
        end;
        return v7;
    else
        for v11 = 1, v6 do
            local v12 = v3[v11];
            if v12 ~= nil and v4(v5, v12, v11, v3) then
                v7[v8] = v12;
                v8 = v8 + 1;
            end;
        end;
        return v7;
    end;
end;