local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
return function(v2) --[[ Line: 6 ]] --[[ Name: buildRootValue ]]
    -- upvalues: l_Object_0 (copy)
    local v3 = v2.Query or {};
    local v4 = v2.Mutation or {};
    return (l_Object_0.assign({}, v3, v4));
end;