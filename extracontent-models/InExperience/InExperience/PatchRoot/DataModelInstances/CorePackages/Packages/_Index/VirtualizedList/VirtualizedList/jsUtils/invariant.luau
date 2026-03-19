local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
return function(v2, v3, ...) --[[ Line: 24 ]] --[[ Name: invariant ]]
    -- upvalues: l_Error_0 (copy)
    if not v2 then
        error(l_Error_0(string.format(v3, ...)));
    end;
end;