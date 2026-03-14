local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_isNonNullType_0 = require(l_Parent_0.type.definition).isNonNullType;
local l_utilities_0 = l_Parent_0.utilities;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_isTypeSubTypeOf_0 = require(l_utilities_0.typeComparators).isTypeSubTypeOf;
local v8 = {};
local v9 = nil;
v8.VariablesInAllowedPositionRule = function(v10) --[[ Line: 27 ]]
    -- upvalues: l_typeFromAST_0 (copy), v9 (ref), l_inspect_0 (copy), l_GraphQLError_0 (copy)
    local v11 = {};
    return {
        OperationDefinition = {
            enter = function() --[[ Line: 32 ]] --[[ Name: enter ]]
                -- upvalues: v11 (ref)
                v11 = {};
            end, 
            leave = function(_, v13) --[[ Line: 35 ]] --[[ Name: leave ]]
                -- upvalues: v10 (copy), v11 (ref), l_typeFromAST_0 (ref), v9 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
                local v14 = v10:getRecursiveVariableUsages(v13);
                for _, v16 in ipairs(v14) do
                    local l_node_0 = v16.node;
                    local l_type_0 = v16.type;
                    local l_defaultValue_0 = v16.defaultValue;
                    local l_value_0 = l_node_0.name.value;
                    local v21 = v11[l_value_0];
                    if v21 and l_type_0 then
                        local v22 = v10:getSchema();
                        local v23 = l_typeFromAST_0(v22, v21.type);
                        if v23 and not v9(v22, v23, v21.defaultValue, l_type_0, l_defaultValue_0) then
                            local v24 = l_inspect_0(v23);
                            local v25 = l_inspect_0(l_type_0);
                            v10:reportError(l_GraphQLError_0.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(l_value_0, v24, v25), {
                                v21, 
                                l_node_0
                            }));
                        end;
                    end;
                end;
            end
        }, 
        VariableDefinition = function(_, v27) --[[ Line: 79 ]] --[[ Name: VariableDefinition ]]
            -- upvalues: v11 (ref)
            v11[v27.variable.name.value] = v27;
        end
    };
end;
v9 = function(v28, v29, v30, v31, v32) --[[ Line: 90 ]] --[[ Name: allowedVariableUsage ]]
    -- upvalues: l_isNonNullType_0 (copy), l_Kind_0 (copy), l_isTypeSubTypeOf_0 (copy)
    if l_isNonNullType_0(v31) and not l_isNonNullType_0(v29) then
        local v33 = false;
        if v30 ~= nil then
            v33 = v30.kind ~= l_Kind_0.NULL;
        end;
        local v34 = v32 ~= nil;
        if not v33 and not v34 then
            return false;
        else
            local l_ofType_0 = v31.ofType;
            return l_isTypeSubTypeOf_0(v28, v29, l_ofType_0);
        end;
    else
        return l_isTypeSubTypeOf_0(v28, v29, v31);
    end;
end;
return v8;