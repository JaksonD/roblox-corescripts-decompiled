local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Number);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return not not v2 and v2 ~= 0 and v2 ~= "" and not v1.isNaN(v2);
end;