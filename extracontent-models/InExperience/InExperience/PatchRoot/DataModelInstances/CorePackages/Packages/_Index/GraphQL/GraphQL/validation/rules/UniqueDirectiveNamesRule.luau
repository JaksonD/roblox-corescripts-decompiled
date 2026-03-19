local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueDirectiveNamesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        local v4 = v2:getSchema();
        return {
            DirectiveDefinition = function(_, v6) --[[ Line: 24 ]] --[[ Name: DirectiveDefinition ]]
                -- upvalues: v4 (copy), v2 (copy), l_GraphQLError_0 (ref), v3 (copy)
                local l_value_0 = v6.name.value;
                if v4 and v4:getDirective(l_value_0) then
                    v2:reportError(l_GraphQLError_0.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(l_value_0), v6.name));
                    return;
                else
                    if v3[l_value_0] then
                        v2:reportError(l_GraphQLError_0.new(("There can be only one directive named \"@%s\"."):format(l_value_0), {
                            v3[l_value_0], 
                            v6.name
                        }));
                    else
                        v3[l_value_0] = v6.name;
                    end;
                    return false;
                end;
            end
        };
    end
};