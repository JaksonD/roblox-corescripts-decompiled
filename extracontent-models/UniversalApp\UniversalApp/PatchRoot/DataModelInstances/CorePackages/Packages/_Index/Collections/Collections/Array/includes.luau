local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
local v2 = require(script.Parent.indexOf);
return function(v3, v4, v5) --[[ Line: 22 ]]
    -- upvalues: v2 (copy)
    return v2(v3, v4, v5) ~= -1;
end;