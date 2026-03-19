local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: addMockResolvers ]]
    -- upvalues: l_Object_0 (copy)
    local v4 = l_Object_0.assign({}, v2, v3);
    local v5 = l_Object_0.assign({}, v2.Query or {}, v3.Query or {});
    local v6 = l_Object_0.assign({}, v2.Mutation or {}, v3.Mutation or {});
    l_Object_0.assign(v4, {
        Query = v5, 
        Mutation = v6
    });
    return v4;
end;