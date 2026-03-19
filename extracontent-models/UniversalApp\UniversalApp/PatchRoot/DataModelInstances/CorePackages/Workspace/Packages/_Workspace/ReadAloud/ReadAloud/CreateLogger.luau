local l_Parent_0 = script:FindFirstAncestor("ReadAloud").Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v2) --[[ Line: 10 ]]
    -- upvalues: l_Logger_0 (copy)
    return l_Logger_0:new("ReadAloud." .. v2);
end;