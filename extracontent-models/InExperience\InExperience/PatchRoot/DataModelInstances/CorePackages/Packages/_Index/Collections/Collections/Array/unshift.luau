local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
return function(v5, ...) --[[ Line: 23 ]]
    -- upvalues: l___DEV___0 (copy), v3 (copy)
    if l___DEV___0 and not v3(v5) then
        error(string.format("Array.unshift called on non-array %s", (typeof(v5))));
    end;
    local v6 = select("#", ...);
    if v6 > 0 then
        for v7 = v6, 1, -1 do
            table.insert(v5, 1, (select(v7, ...)));
        end;
    end;
    return #v5;
end;