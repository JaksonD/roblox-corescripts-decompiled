local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    NoUndefinedVariablesRule = function(v2) --[[ Line: 20 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        return {
            OperationDefinition = {
                enter = function() --[[ Line: 25 ]] --[[ Name: enter ]]
                    -- upvalues: v3 (ref)
                    v3 = {};
                end, 
                leave = function(_, v5) --[[ Line: 28 ]] --[[ Name: leave ]]
                    -- upvalues: v2 (copy), v3 (ref), l_GraphQLError_0 (ref)
                    local v6 = v2:getRecursiveVariableUsages(v5);
                    for _, v8 in ipairs(v6) do
                        local l_node_0 = v8.node;
                        local l_value_0 = l_node_0.name.value;
                        if v3[l_value_0] ~= true then
                            v2:reportError(l_GraphQLError_0.new(v5.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(l_value_0, v5.name.value) or ("Variable \"$%s\" is not defined."):format(l_value_0), {
                                l_node_0, 
                                v5
                            }));
                        end;
                    end;
                end
            }, 
            VariableDefinition = function(_, v12) --[[ Line: 50 ]] --[[ Name: VariableDefinition ]]
                -- upvalues: v3 (ref)
                v3[v12.variable.name.value] = true;
            end
        };
    end
};