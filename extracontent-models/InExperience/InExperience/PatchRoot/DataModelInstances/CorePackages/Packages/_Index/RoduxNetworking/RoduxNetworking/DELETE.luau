local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.makeRequestApi);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return v1(v2, "DELETE");
end;