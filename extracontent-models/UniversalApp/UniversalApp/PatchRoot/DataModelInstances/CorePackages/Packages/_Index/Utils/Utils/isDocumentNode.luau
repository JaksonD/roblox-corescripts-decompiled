local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
v2.isDocumentNode = function(v4) --[[ Line: 18 ]] --[[ Name: isDocumentNode ]]
    -- upvalues: l_Boolean_0 (copy), l_Kind_0 (copy)
    return l_Boolean_0.toJSBoolean(v4) and typeof(v4) == "table" and l_Boolean_0.toJSBoolean(v4.kind) and v4.kind == l_Kind_0.DOCUMENT;
end;
return v2;