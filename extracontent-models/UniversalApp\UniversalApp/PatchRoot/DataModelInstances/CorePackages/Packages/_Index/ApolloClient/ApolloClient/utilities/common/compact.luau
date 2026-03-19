local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
v0.compact = function(...) --[[ Line: 13 ]] --[[ Name: compact ]]
    -- upvalues: l_Object_0 (copy)
    return l_Object_0.assign({}, ...);
end;
return v0;