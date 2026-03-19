local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.GraphQL);
v0.graphQLResultHasError = function(v4) --[[ Line: 18 ]] --[[ Name: graphQLResultHasError ]]
    -- upvalues: l_Boolean_0 (copy)
    return l_Boolean_0.toJSBoolean(v4.errors) and #v4.errors > 0 or false;
end;
return v0;