local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    NoFragmentCyclesRule = function(v4) --[[ Line: 18 ]]
        -- upvalues: l_Array_0 (copy), l_GraphQLError_0 (copy)
        local v5 = {};
        local v6 = {};
        local v7 = {};
        local function v8(v9) --[[ Line: 31 ]] --[[ Name: detectCycleRecursive ]]
            -- upvalues: v5 (copy), v4 (copy), v7 (copy), v6 (copy), v8 (copy), l_Array_0 (ref), l_GraphQLError_0 (ref)
            if v5[v9.name.value] then
                return;
            else
                local l_value_0 = v9.name.value;
                v5[l_value_0] = true;
                local v11 = v4:getFragmentSpreads(v9.selectionSet);
                if #v11 == 0 then
                    return;
                else
                    v7[l_value_0] = #v6;
                    for _, v13 in ipairs(v11) do
                        local l_value_1 = v13.name.value;
                        local v15 = v7[l_value_1];
                        table.insert(v6, v13);
                        if v15 == nil then
                            local v16 = v4:getFragment(l_value_1);
                            if v16 then
                                v8(v16);
                            end;
                        else
                            local v17 = l_Array_0.slice(v6, v15 + 1);
                            local v19 = table.concat(l_Array_0.map(l_Array_0.slice(v17, 1, #v17), function(v18) --[[ Line: 61 ]]
                                return "\"" .. v18.name.value .. "\"";
                            end), ", ");
                            v4:reportError(l_GraphQLError_0.new(("Cannot spread fragment \"%s\" within itself"):format(l_value_1) .. (v19 ~= "" and (" via %s."):format(v19) or "."), v17));
                        end;
                        table.remove(v6);
                    end;
                    v7[l_value_0] = nil;
                    return;
                end;
            end;
        end;
        return {
            OperationDefinition = function() --[[ Line: 82 ]] --[[ Name: OperationDefinition ]]
                return false;
            end, 
            FragmentDefinition = function(_, v21) --[[ Line: 85 ]] --[[ Name: FragmentDefinition ]]
                -- upvalues: v8 (copy)
                v8(v21);
                return false;
            end
        };
    end
};