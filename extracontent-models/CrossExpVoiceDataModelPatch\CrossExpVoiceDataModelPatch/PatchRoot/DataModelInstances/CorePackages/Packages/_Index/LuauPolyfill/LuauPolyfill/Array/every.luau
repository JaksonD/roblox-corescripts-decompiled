local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 11 ]]
    if _G.__DEV__ then
        if typeof(v2) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(v2))));
        end;
        if typeof(v3) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v5 = #v2;
    local v6 = 1;
    while true do
        if v6 <= v5 then
            local v7 = v2[v6];
            local _ = nil;
            if v7 ~= nil and not if v4 ~= nil then v3(v4, v7, v6, v2) else v3(v7, v6, v2) then
                return false;
            else
                v6 = v6 + 1;
            end;
        else
            return true;
        end;
    end;
end;