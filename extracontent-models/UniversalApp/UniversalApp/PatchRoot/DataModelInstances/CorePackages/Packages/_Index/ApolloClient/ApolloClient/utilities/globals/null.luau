local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {
    __value = "null"
};
return {
    NULL = v2, 
    toJSBoolean = function(v3) --[[ Line: 19 ]] --[[ Name: toJSBoolean ]]
        -- upvalues: l_Boolean_0 (copy), v2 (copy)
        return l_Boolean_0.toJSBoolean(v3) and v3 ~= v2;
    end
};