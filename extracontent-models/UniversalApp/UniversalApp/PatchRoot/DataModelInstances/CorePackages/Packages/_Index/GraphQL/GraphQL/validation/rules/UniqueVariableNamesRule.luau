local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueVariableNamesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        return {
            OperationDefinition = function() --[[ Line: 22 ]] --[[ Name: OperationDefinition ]]
                -- upvalues: v3 (ref)
                v3 = {};
            end, 
            VariableDefinition = function(_, v5) --[[ Line: 25 ]] --[[ Name: VariableDefinition ]]
                -- upvalues: v3 (ref), v2 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v5.variable.name.value;
                if v3[l_value_0] then
                    v2:reportError(l_GraphQLError_0.new(("There can be only one variable named \"$%s\"."):format(l_value_0), {
                        v3[l_value_0], 
                        v5.variable.name
                    }));
                    return;
                else
                    v3[l_value_0] = v5.variable.name;
                    return;
                end;
            end
        };
    end
};