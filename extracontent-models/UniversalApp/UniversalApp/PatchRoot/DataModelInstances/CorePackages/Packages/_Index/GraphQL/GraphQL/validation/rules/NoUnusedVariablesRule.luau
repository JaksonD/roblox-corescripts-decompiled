local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    NoUnusedVariablesRule = function(v2) --[[ Line: 20 ]] --[[ Name: NoUnusedVariablesRule ]]
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
                    local v6 = {};
                    local v7 = v2:getRecursiveVariableUsages(v5);
                    for _, v9 in ipairs(v7) do
                        v6[v9.node.name.value] = true;
                    end;
                    for _, v11 in ipairs(v3) do
                        local l_value_0 = v11.variable.name.value;
                        if v6[l_value_0] ~= true then
                            v2:reportError(l_GraphQLError_0.new(v5.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(l_value_0, v5.name.value) or ("Variable \"$%s\" is never used."):format(l_value_0), v11));
                        end;
                    end;
                end
            }, 
            VariableDefinition = function(_, v14) --[[ Line: 55 ]] --[[ Name: VariableDefinition ]]
                -- upvalues: v3 (ref)
                table.insert(v3, v14);
            end
        };
    end
};