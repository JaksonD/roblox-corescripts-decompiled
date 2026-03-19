local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueFragmentNamesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        return {
            OperationDefinition = function() --[[ Line: 23 ]] --[[ Name: OperationDefinition ]]
                return false;
            end, 
            FragmentDefinition = function(_, v5) --[[ Line: 26 ]] --[[ Name: FragmentDefinition ]]
                -- upvalues: v3 (copy), v2 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v5.name.value;
                if v3[l_value_0] then
                    v2:reportError(l_GraphQLError_0.new(("There can be only one fragment named \"%s\"."):format(l_value_0), {
                        v3[l_value_0], 
                        v5.name
                    }));
                else
                    v3[l_value_0] = v5.name;
                end;
                return false;
            end
        };
    end
};