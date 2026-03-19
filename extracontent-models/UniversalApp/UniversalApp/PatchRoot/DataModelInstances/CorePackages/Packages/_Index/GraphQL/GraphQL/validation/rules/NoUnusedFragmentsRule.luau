local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    NoUnusedFragmentsRule = function(v2) --[[ Line: 20 ]] --[[ Name: NoUnusedFragmentsRule ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v3 = {};
        local v4 = {};
        return {
            OperationDefinition = function(_, v6) --[[ Line: 25 ]] --[[ Name: OperationDefinition ]]
                -- upvalues: v3 (copy)
                table.insert(v3, v6);
                return false;
            end, 
            FragmentDefinition = function(_, v8) --[[ Line: 29 ]] --[[ Name: FragmentDefinition ]]
                -- upvalues: v4 (copy)
                table.insert(v4, v8);
                return false;
            end, 
            Document = {
                leave = function() --[[ Line: 34 ]] --[[ Name: leave ]]
                    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_GraphQLError_0 (ref)
                    local v9 = {};
                    for _, v11 in ipairs(v3) do
                        for _, v13 in ipairs(v2:getRecursivelyReferencedFragments(v11)) do
                            v9[v13.name.value] = true;
                        end;
                    end;
                    for _, v15 in ipairs(v4) do
                        local l_value_0 = v15.name.value;
                        if v9[l_value_0] ~= true then
                            v2:reportError(l_GraphQLError_0.new(("Fragment \"%s\" is never used."):format(l_value_0), v15));
                        end;
                    end;
                end
            }
        };
    end
};