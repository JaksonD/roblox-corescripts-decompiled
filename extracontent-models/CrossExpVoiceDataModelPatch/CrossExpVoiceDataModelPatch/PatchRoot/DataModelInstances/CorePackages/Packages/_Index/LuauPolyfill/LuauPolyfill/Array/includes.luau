local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
local v2 = require(script.Parent.indexOf);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    return v2(v3, v4, v5) ~= -1;
end;