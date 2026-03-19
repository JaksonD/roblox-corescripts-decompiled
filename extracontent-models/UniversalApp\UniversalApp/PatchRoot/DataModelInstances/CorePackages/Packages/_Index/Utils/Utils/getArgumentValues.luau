local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.GraphQL);
local l_valueFromAST_0 = v6.valueFromAST;
local l_isNonNullType_0 = v6.isNonNullType;
local l_Kind_0 = v6.Kind;
local l_print_0 = v6.print;
local l_createGraphQLError_0 = require(script.Parent.errors).createGraphQLError;
local l_inspect_0 = require(script.Parent.inspect).inspect;
v5.getArgumentValues = function(v13, v14, v15) --[[ Line: 48 ]] --[[ Name: getArgumentValues ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_isNonNullType_0 (copy), l_createGraphQLError_0 (copy), l_inspect_0 (copy), l_Kind_0 (copy), l_valueFromAST_0 (copy), l_print_0 (copy)
    local v16 = if v15 ~= nil then v15 else {};
    local v21 = l_Array_0.reduce(l_Object_0.entries(v16), function(v17, v18) --[[ Line: 58 ]]
        -- upvalues: l_Object_0 (ref)
        local v19, v20 = table.unpack(v18, 1, 2);
        return l_Object_0.assign({}, v17, {
            [tostring(v19)] = v20
        });
    end, {});
    local v22 = {};
    local v23 = if v14.arguments ~= nil then v14.arguments else {};
    local v26 = l_Array_0.reduce(v23, function(v24, v25) --[[ Line: 71 ]]
        -- upvalues: l_Object_0 (ref)
        return l_Object_0.assign({}, v24, {
            [tostring(v25.name.value)] = v25
        });
    end, {});
    for _, v28 in v13.args do
        local l_name_0 = v28.name;
        local l_type_0 = v28.type;
        local l_defaultValue_0 = v28.defaultValue;
        local v32 = v26[tostring(l_name_0)];
        if not l_Boolean_0.toJSBoolean(v32) then
            if l_defaultValue_0 ~= nil then
                v22[tostring(l_name_0)] = l_defaultValue_0;
            elseif l_Boolean_0.toJSBoolean(l_isNonNullType_0(l_type_0)) then
                error(l_createGraphQLError_0(("Argument \"%s\" of required type \"%s\" "):format(tostring(l_name_0), (tostring(l_inspect_0(l_type_0)))) .. "was not provided.", {
                    nodes = {
                        v14
                    }
                }));
            end;
        else
            local l_value_0 = v32.value;
            local v34 = l_value_0.kind == l_Kind_0.NULL;
            if l_value_0.kind == l_Kind_0.VARIABLE then
                local l_value_1 = l_value_0.name.value;
                if v16 == nil or v21[tostring(l_value_1)] == nil then
                    if l_defaultValue_0 ~= nil then
                        v22[tostring(l_name_0)] = l_defaultValue_0;
                        continue;
                    elseif l_Boolean_0.toJSBoolean(l_isNonNullType_0(l_type_0)) then
                        error(l_createGraphQLError_0(("Argument \"%s\" of required type \"%s\" "):format(tostring(l_name_0), (tostring(l_inspect_0(l_type_0)))) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format((tostring(l_value_1))), {
                            nodes = {
                                l_value_0
                            }
                        }));
                        continue;
                    else
                        continue;
                    end;
                else
                    v34 = v16[tostring(l_value_1)] == nil;
                end;
            end;
            if v34 and l_isNonNullType_0(l_type_0) then
                error(l_createGraphQLError_0(("Argument \"%s\" of non-null type \"%s\" "):format(tostring(l_name_0), (tostring(l_inspect_0(l_type_0)))) .. "must not be null.", {
                    nodes = {
                        l_value_0
                    }
                }));
            end;
            local v36 = l_valueFromAST_0(l_value_0, l_type_0, v16);
            if v36 == nil then
                error(l_createGraphQLError_0(("Argument \"%s\" has invalid value %s."):format(tostring(l_name_0), (tostring(l_print_0(l_value_0)))), {
                    nodes = {
                        l_value_0
                    }
                }));
            end;
            v22[tostring(l_name_0)] = v36;
        end;
    end;
    return v22;
end;
return v5;