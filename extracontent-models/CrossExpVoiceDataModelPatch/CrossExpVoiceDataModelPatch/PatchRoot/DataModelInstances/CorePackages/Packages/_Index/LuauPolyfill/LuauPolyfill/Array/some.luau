local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2, v3, v4) --[[ Line: 13 ]]
    if typeof(v2) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(v2))));
    end;
    if typeof(v3) ~= "function" then
        error("callback is not a function");
    end;
    for v5, v6 in v2 do
        if v4 ~= nil then
            if v6 ~= nil and v3(v4, v6, v5, v2) then
                return true;
            end;
        elseif v6 ~= nil and v3(v6, v5, v2) then
            return true;
        end;
    end;
    return false;
end;