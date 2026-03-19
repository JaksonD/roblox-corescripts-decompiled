local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.types);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    if _G.__DEV__ and not v1(v4) then
        error(string.format("Array.shift called on non-array %s", (typeof(v4))));
    end;
    if #v4 > 0 then
        return table.remove(v4, 1);
    else
        return nil;
    end;
end;