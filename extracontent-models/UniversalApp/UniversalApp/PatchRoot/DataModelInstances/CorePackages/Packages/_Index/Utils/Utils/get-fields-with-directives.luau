local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_valueFromASTUntyped_0 = require(l_Parent_0.GraphQL).valueFromASTUntyped;
local _ = require(script.Parent.types);
v5.getFieldsWithDirectives = function(v8, v9) --[[ Line: 35 ]] --[[ Name: getFieldsWithDirectives ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_valueFromASTUntyped_0 (copy)
    local v10 = if v9 ~= nil then v9 else {};
    local v11 = {};
    local v12 = {
        "ObjectTypeDefinition", 
        "ObjectTypeExtension"
    };
    if l_Boolean_0.toJSBoolean(v10.includeInputTypes) then
        v12 = l_Array_0.concat({}, v12, {
            "InputObjectTypeDefinition", 
            "InputObjectTypeExtension"
        });
    end;
    for _, v15 in (l_Array_0.filter(v8.definitions, function(v13) --[[ Line: 45 ]]
        -- upvalues: l_Array_0 (ref), v12 (ref)
        return l_Array_0.includes(v12, v13.kind);
    end)) do
        local l_value_0 = v15.name.value;
        if v15.fields ~= nil then
            for _, v18 in v15.fields do
                if l_Boolean_0.toJSBoolean(v18.directives) and #v18.directives > 0 then
                    local l_value_1 = v18.name.value;
                    local v20 = ("%s.%s"):format(tostring(l_value_0), (tostring(l_value_1)));
                    local v24 = l_Array_0.map(v18.directives, function(v21) --[[ Line: 70 ]]
                        -- upvalues: l_Array_0 (ref), l_Boolean_0 (ref), l_Object_0 (ref), l_valueFromASTUntyped_0 (ref)
                        return {
                            name = v21.name.value, 
                            args = l_Array_0.reduce(l_Boolean_0.toJSBoolean(v21.arguments) and v21.arguments or {}, function(v22, v23) --[[ Line: 77 ]]
                                -- upvalues: l_Object_0 (ref), l_valueFromASTUntyped_0 (ref)
                                return l_Object_0.assign({}, v22, {
                                    [v23.name.value] = l_valueFromASTUntyped_0(v23.value, nil)
                                });
                            end, {})
                        };
                    end);
                    v11[tostring(v20)] = v24;
                end;
            end;
        end;
    end;
    return v11;
end;
return v5;