local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.tryYield);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy)
    v2(v4);
    return pcall(v3);
end;