local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    UniqueOperationNamesRule = function(v2) --[[ Line: 19 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        return {
            OperationDefinition = function(_, v5) --[[ Line: 22 ]] --[[ Name: OperationDefinition ]]
                -- upvalues: v3 (copy), v2 (copy), l_GraphQLError_0 (ref)
                local l_name_0 = v5.name;
                if l_name_0 then
                    if v3[l_name_0.value] then
                        v2:reportError(l_GraphQLError_0.new(("There can be only one operation named \"%s\"."):format(l_name_0.value), {
                            v3[l_name_0.value], 
                            l_name_0
                        }));
                    else
                        v3[l_name_0.value] = l_name_0;
                    end;
                end;
                return false;
            end, 
            FragmentDefinition = function() --[[ Line: 40 ]] --[[ Name: FragmentDefinition ]]
                return false;
            end
        };
    end
};