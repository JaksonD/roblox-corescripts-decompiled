local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.types);
return function(v4, ...) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    if _G.__DEV__ and not v1(v4) then
        error(string.format("Array.unshift called on non-array %s", (typeof(v4))));
    end;
    local v5 = select("#", ...);
    if v5 > 0 then
        for v6 = v5, 1, -1 do
            table.insert(v4, 1, (select(v6, ...)));
        end;
    end;
    return #v4;
end;