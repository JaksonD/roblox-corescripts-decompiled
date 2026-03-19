local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local _ = require(l_Parent_0.core);
local _ = require(script.Parent.types);
local l_useQuery_0 = require(script.Parent.Parent.hooks).useQuery;
v0.Query = function(v9) --[[ Line: 27 ]] --[[ Name: Query ]]
    -- upvalues: l_Object_0 (copy), l_useQuery_0 (copy), l_Boolean_0 (copy)
    local l_children_0 = v9.children;
    local l_query_0 = v9.query;
    local v12 = l_Object_0.assign({}, v9, {
        children = l_Object_0.None, 
        query = l_Object_0.None
    });
    local v13 = l_useQuery_0(l_query_0, v12);
    if l_Boolean_0.toJSBoolean(v13) then
        return l_children_0(v13);
    else
        return nil;
    end;
end;
return v0;