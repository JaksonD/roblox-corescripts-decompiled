local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.makeIntervalImpl);
return l_Object_0.assign({
    Object = require(script.Object)
}, v2(delay));