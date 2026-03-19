local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v3, v4, v5) --[[ Line: 27 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        if typeof(v3) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(v3))));
        end;
        if typeof(v4) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v6 = #v3;
    local v7 = 1;
    while true do
        if v7 <= v6 then
            local v8 = v3[v7];
            local _ = nil;
            if v8 ~= nil and not if v5 ~= nil then v4(v5, v8, v7, v3) else v4(v8, v7, v3) then
                return false;
            else
                v7 = v7 + 1;
            end;
        else
            return true;
        end;
    end;
end;