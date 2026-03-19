local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_getNamedType_0 = require(l_Parent_0.type.definition).getNamedType;
local l_isIntrospectionType_0 = require(l_Parent_0.type.introspection).isIntrospectionType;
return {
    NoSchemaIntrospectionCustomRule = function(v4) --[[ Line: 27 ]]
        -- upvalues: l_getNamedType_0 (copy), l_isIntrospectionType_0 (copy), l_GraphQLError_0 (copy)
        return {
            Field = function(_, v6) --[[ Line: 29 ]] --[[ Name: Field ]]
                -- upvalues: l_getNamedType_0 (ref), v4 (copy), l_isIntrospectionType_0 (ref), l_GraphQLError_0 (ref)
                local v7 = l_getNamedType_0(v4:getType());
                if v7 and l_isIntrospectionType_0(v7) then
                    v4:reportError(l_GraphQLError_0.new(("GraphQL introspection has been disabled, but the requested query contained the field \"%s\"."):format(v6.name.value), v6));
                end;
            end
        };
    end
};