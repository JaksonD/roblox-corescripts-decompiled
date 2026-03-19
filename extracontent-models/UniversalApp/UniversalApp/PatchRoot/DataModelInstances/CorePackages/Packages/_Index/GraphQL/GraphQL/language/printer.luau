local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script.Parent.ast);
local l_visit_0 = require(script.Parent.visitor).visit;
local l_printBlockString_0 = require(script.Parent.blockString).printBlockString;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local function v15(v14) --[[ Line: 75 ]] --[[ Name: print_ ]]
    -- upvalues: l_visit_0 (copy), v6 (ref)
    return l_visit_0(v14, {
        leave = v6
    });
end;
v7 = function(v16) --[[ Line: 83 ]] --[[ Name: addDescription ]]
    -- upvalues: v8 (ref)
    return function(_, v18) --[[ Line: 85 ]]
        -- upvalues: v8 (ref), v16 (copy)
        return v8({
            v18.description, 
            v16(v18)
        }, "\n");
    end;
end;
v6 = {
    Name = function(_, v20) --[[ Line: 92 ]] --[[ Name: Name ]]
        return v20.value;
    end, 
    Variable = function(_, v22) --[[ Line: 96 ]] --[[ Name: Variable ]]
        return "$" .. tostring(v22.name);
    end, 
    Document = function(_, v24) --[[ Line: 102 ]] --[[ Name: Document ]]
        -- upvalues: v8 (ref)
        return v8(v24.definitions, "\n\n") .. "\n";
    end, 
    OperationDefinition = function(_, v26) --[[ Line: 106 ]] --[[ Name: OperationDefinition ]]
        -- upvalues: v10 (ref), v8 (ref)
        local l_operation_0 = v26.operation;
        local l_name_0 = v26.name;
        local v29 = v10("(", v8(v26.variableDefinitions, ", "), ")");
        local v30 = v8(v26.directives, " ");
        local l_selectionSet_0 = v26.selectionSet;
        if not l_name_0 and (not v30 or v30 == "") and (not v29 or v29 == "") and l_operation_0 == "query" then
            return l_selectionSet_0;
        else
            return v8({
                l_operation_0, 
                v8({
                    l_name_0, 
                    v29
                }), 
                v30, 
                l_selectionSet_0
            }, " ");
        end;
    end, 
    VariableDefinition = function(_, v33) --[[ Line: 131 ]] --[[ Name: VariableDefinition ]]
        -- upvalues: v10 (ref), v8 (ref)
        local l_variable_0 = v33.variable;
        local l_type_0 = v33.type;
        local l_defaultValue_0 = v33.defaultValue;
        local l_directives_0 = v33.directives;
        return tostring(l_variable_0) .. ": " .. tostring(l_type_0) .. v10(" = ", l_defaultValue_0) .. v10(" ", v8(l_directives_0, " "));
    end, 
    SelectionSet = function(_, v39) --[[ Line: 143 ]] --[[ Name: SelectionSet ]]
        -- upvalues: v9 (ref)
        return v9(v39.selections);
    end, 
    Field = function(_, v41) --[[ Line: 147 ]] --[[ Name: Field ]]
        -- upvalues: v10 (ref), v8 (ref), v11 (ref)
        local l_alias_0 = v41.alias;
        local l_name_1 = v41.name;
        local l_arguments_0 = v41.arguments;
        local l_directives_1 = v41.directives;
        local l_selectionSet_1 = v41.selectionSet;
        local v47 = v10("", l_alias_0, ": ") .. tostring(l_name_1);
        local v48 = v47 .. v10("(", v8(l_arguments_0, ", "), ")");
        local v49 = utf8.len(v48);
        assert(v49 ~= nil, "invalid utf8 string");
        if v49 > 80 then
            v48 = v47 .. v10("(\n", v11(v8(l_arguments_0, "\n")), "\n)");
        end;
        return v8({
            v48, 
            v8(l_directives_1, " "), 
            l_selectionSet_1
        }, " ");
    end, 
    Argument = function(_, v51) --[[ Line: 168 ]] --[[ Name: Argument ]]
        local l_name_2 = v51.name;
        local l_value_0 = v51.value;
        return tostring(l_name_2) .. ": " .. tostring(l_value_0);
    end, 
    FragmentSpread = function(_, v55) --[[ Line: 176 ]] --[[ Name: FragmentSpread ]]
        -- upvalues: v10 (ref), v8 (ref)
        local l_name_3 = v55.name;
        local l_directives_2 = v55.directives;
        return "..." .. tostring(l_name_3) .. v10(" ", v8(l_directives_2, " "));
    end, 
    InlineFragment = function(_, v59) --[[ Line: 182 ]] --[[ Name: InlineFragment ]]
        -- upvalues: v8 (ref), v10 (ref)
        local l_typeCondition_0 = v59.typeCondition;
        local l_directives_3 = v59.directives;
        local l_selectionSet_2 = v59.selectionSet;
        return v8({
            "...", 
            v10("on ", l_typeCondition_0), 
            v8(l_directives_3, " "), 
            l_selectionSet_2
        }, " ");
    end, 
    FragmentDefinition = function(_, v64) --[[ Line: 193 ]] --[[ Name: FragmentDefinition ]]
        -- upvalues: v10 (ref), v8 (ref)
        local l_name_4 = v64.name;
        local l_typeCondition_1 = v64.typeCondition;
        local l_variableDefinitions_0 = v64.variableDefinitions;
        local l_directives_4 = v64.directives;
        local l_selectionSet_3 = v64.selectionSet;
        return "fragment " .. tostring(l_name_4) .. v10("(", v8(l_variableDefinitions_0, ", "), ")") .. " " .. "on " .. tostring(l_typeCondition_1) .. " " .. v10("", v8(l_directives_4, " "), " ") .. tostring(l_selectionSet_3);
    end, 
    IntValue = function(_, v71) --[[ Line: 216 ]] --[[ Name: IntValue ]]
        return v71.value;
    end, 
    FloatValue = function(_, v73) --[[ Line: 220 ]] --[[ Name: FloatValue ]]
        return v73.value;
    end, 
    StringValue = function(_, v75, v76) --[[ Line: 224 ]] --[[ Name: StringValue ]]
        -- upvalues: l_printBlockString_0 (copy), l_HttpService_0 (copy)
        local l_value_1 = v75.value;
        if v75.block then
            return (l_printBlockString_0(l_value_1, v76 == "description" and "" or "  "));
        else
            return (l_HttpService_0:JSONEncode(l_value_1));
        end;
    end, 
    BooleanValue = function(_, v79) --[[ Line: 231 ]] --[[ Name: BooleanValue ]]
        if v79.value then
            return "true";
        else
            return "false";
        end;
    end, 
    NullValue = function(_, _) --[[ Line: 239 ]] --[[ Name: NullValue ]]
        return "null";
    end, 
    EnumValue = function(_, v83) --[[ Line: 242 ]] --[[ Name: EnumValue ]]
        return v83.value;
    end, 
    ListValue = function(_, v85) --[[ Line: 246 ]] --[[ Name: ListValue ]]
        -- upvalues: v8 (ref)
        local l_values_0 = v85.values;
        return "[" .. v8(l_values_0, ", ") .. "]";
    end, 
    ObjectValue = function(_, v88) --[[ Line: 250 ]] --[[ Name: ObjectValue ]]
        -- upvalues: v8 (ref)
        local l_fields_0 = v88.fields;
        return "{" .. v8(l_fields_0, ", ") .. "}";
    end, 
    ObjectField = function(_, v91) --[[ Line: 254 ]] --[[ Name: ObjectField ]]
        return v91.name .. ": " .. v91.value;
    end, 
    Directive = function(_, v93) --[[ Line: 262 ]] --[[ Name: Directive ]]
        -- upvalues: v10 (ref), v8 (ref)
        local l_name_5 = v93.name;
        local l_arguments_1 = v93.arguments;
        return "@" .. tostring(l_name_5) .. v10("(", v8(l_arguments_1, ", "), ")");
    end, 
    NamedType = function(_, v97) --[[ Line: 270 ]] --[[ Name: NamedType ]]
        return v97.name;
    end, 
    ListType = function(_, v99) --[[ Line: 274 ]] --[[ Name: ListType ]]
        return "[" .. tostring(v99.type) .. "]";
    end, 
    NonNullType = function(_, v101) --[[ Line: 278 ]] --[[ Name: NonNullType ]]
        return tostring(v101.type) .. "!";
    end, 
    SchemaDefinition = v7(function(v102) --[[ Line: 286 ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_directives_5 = v102.directives;
        local l_operationTypes_0 = v102.operationTypes;
        return v8({
            "schema", 
            v8(l_directives_5, " "), 
            v9(l_operationTypes_0)
        }, " ");
    end), 
    OperationTypeDefinition = function(_, v106) --[[ Line: 293 ]] --[[ Name: OperationTypeDefinition ]]
        local l_operation_1 = v106.operation;
        local l_type_1 = v106.type;
        return tostring(l_operation_1) .. ": " .. tostring(l_type_1);
    end, 
    ScalarTypeDefinition = v7(function(v109) --[[ Line: 299 ]]
        -- upvalues: v8 (ref)
        local l_name_6 = v109.name;
        local l_directives_6 = v109.directives;
        return v8({
            "scalar", 
            l_name_6, 
            v8(l_directives_6, " ")
        }, " ");
    end), 
    ObjectTypeDefinition = v7(function(v112) --[[ Line: 306 ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref)
        local l_name_7 = v112.name;
        local l_interfaces_0 = v112.interfaces;
        local l_directives_7 = v112.directives;
        local l_fields_1 = v112.fields;
        return v8({
            "type", 
            l_name_7, 
            v10("implements ", v8(l_interfaces_0, " & ")), 
            v8(l_directives_7, " "), 
            v9(l_fields_1)
        }, " ");
    end), 
    FieldDefinition = v7(function(v117) --[[ Line: 320 ]]
        -- upvalues: v13 (ref), v10 (ref), v11 (ref), v8 (ref)
        local l_name_8 = v117.name;
        local l_arguments_2 = v117.arguments;
        local l_type_2 = v117.type;
        local l_directives_8 = v117.directives;
        return tostring(l_name_8) .. (if v13(l_arguments_2) then v10("(\n", v11(v8(l_arguments_2, "\n")), "\n)") else v10("(", v8(l_arguments_2, ", "), ")")) .. ": " .. tostring(l_type_2) .. v10(" ", v8(l_directives_8, " "));
    end), 
    InputValueDefinition = v7(function(v122) --[[ Line: 334 ]]
        -- upvalues: v8 (ref), v10 (ref)
        local l_name_9 = v122.name;
        local l_type_3 = v122.type;
        local l_defaultValue_1 = v122.defaultValue;
        local l_directives_9 = v122.directives;
        return v8({
            tostring(l_name_9) .. ": " .. tostring(l_type_3), 
            v10("= ", l_defaultValue_1), 
            v8(l_directives_9, " ")
        }, " ");
    end), 
    InterfaceTypeDefinition = v7(function(v127) --[[ Line: 346 ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref)
        local l_name_10 = v127.name;
        local l_interfaces_1 = v127.interfaces;
        local l_directives_10 = v127.directives;
        local l_fields_2 = v127.fields;
        return v8({
            "interface", 
            l_name_10, 
            v10("implements ", v8(l_interfaces_1, " & ")), 
            v8(l_directives_10, " "), 
            v9(l_fields_2)
        }, " ");
    end), 
    UnionTypeDefinition = v7(function(v132) --[[ Line: 361 ]]
        -- upvalues: v8 (ref)
        local l_name_11 = v132.name;
        local l_directives_11 = v132.directives;
        local l_types_0 = v132.types;
        return v8({
            "union", 
            l_name_11, 
            v8(l_directives_11, " "), 
            if l_types_0 and #l_types_0 ~= 0 then "= " .. v8(l_types_0, " | ") else ""
        }, " ");
    end), 
    EnumTypeDefinition = v7(function(v136) --[[ Line: 374 ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_name_12 = v136.name;
        local l_directives_12 = v136.directives;
        local l_values_1 = v136.values;
        return v8({
            "enum", 
            l_name_12, 
            v8(l_directives_12, " "), 
            v9(l_values_1)
        }, " ");
    end), 
    EnumValueDefinition = v7(function(v140) --[[ Line: 387 ]]
        -- upvalues: v8 (ref)
        local l_name_13 = v140.name;
        local l_directives_13 = v140.directives;
        return v8({
            l_name_13, 
            v8(l_directives_13, " ")
        }, " ");
    end), 
    InputObjectTypeDefinition = v7(function(v143) --[[ Line: 397 ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_name_14 = v143.name;
        local l_directives_14 = v143.directives;
        local l_fields_3 = v143.fields;
        return v8({
            "input", 
            l_name_14, 
            v8(l_directives_14, " "), 
            v9(l_fields_3)
        }, " ");
    end), 
    DirectiveDefinition = v7(function(v147) --[[ Line: 410 ]]
        -- upvalues: v13 (ref), v10 (ref), v11 (ref), v8 (ref)
        local l_name_15 = v147.name;
        local l_arguments_3 = v147.arguments;
        local l_repeatable_0 = v147.repeatable;
        local l_locations_0 = v147.locations;
        return "directive @" .. tostring(l_name_15) .. (if v13(l_arguments_3) then v10("(\n", v11(v8(l_arguments_3, "\n")), "\n)") else v10("(", v8(l_arguments_3, ", "), ")")) .. (l_repeatable_0 and " repeatable" or "") .. " on " .. v8(l_locations_0, " | ");
    end), 
    SchemaExtension = function(_, v153) --[[ Line: 425 ]] --[[ Name: SchemaExtension ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_directives_15 = v153.directives;
        local l_operationTypes_1 = v153.operationTypes;
        return v8({
            "extend schema", 
            v8(l_directives_15, " "), 
            v9(l_operationTypes_1)
        }, " ");
    end, 
    ScalarTypeExtension = function(_, v157) --[[ Line: 436 ]] --[[ Name: ScalarTypeExtension ]]
        -- upvalues: v8 (ref)
        local l_name_16 = v157.name;
        local l_directives_16 = v157.directives;
        return v8({
            "extend scalar", 
            l_name_16, 
            v8(l_directives_16, " ")
        }, " ");
    end, 
    ObjectTypeExtension = function(_, v161) --[[ Line: 447 ]] --[[ Name: ObjectTypeExtension ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref)
        local l_name_17 = v161.name;
        local l_interfaces_2 = v161.interfaces;
        local l_directives_17 = v161.directives;
        local l_fields_4 = v161.fields;
        return v8({
            "extend type", 
            l_name_17, 
            v10("implements ", v8(l_interfaces_2, " & ")), 
            v8(l_directives_17, " "), 
            v9(l_fields_4)
        }, " ");
    end, 
    InterfaceTypeExtension = function(_, v167) --[[ Line: 462 ]] --[[ Name: InterfaceTypeExtension ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref)
        local l_name_18 = v167.name;
        local l_interfaces_3 = v167.interfaces;
        local l_directives_18 = v167.directives;
        local l_fields_5 = v167.fields;
        return v8({
            "extend interface", 
            l_name_18, 
            v10("implements ", v8(l_interfaces_3, " & ")), 
            v8(l_directives_18, " "), 
            v9(l_fields_5)
        }, " ");
    end, 
    UnionTypeExtension = function(_, v173) --[[ Line: 477 ]] --[[ Name: UnionTypeExtension ]]
        -- upvalues: v8 (ref)
        local l_name_19 = v173.name;
        local l_directives_19 = v173.directives;
        local l_types_1 = v173.types;
        return v8({
            "extend union", 
            l_name_19, 
            v8(l_directives_19, " "), 
            if l_types_1 and #l_types_1 ~= 0 then "= " .. v8(l_types_1, " | ") else ""
        }, " ");
    end, 
    EnumTypeExtension = function(_, v178) --[[ Line: 490 ]] --[[ Name: EnumTypeExtension ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_name_20 = v178.name;
        local l_directives_20 = v178.directives;
        local l_values_2 = v178.values;
        return v8({
            "extend enum", 
            l_name_20, 
            v8(l_directives_20, " "), 
            v9(l_values_2)
        }, " ");
    end, 
    InputObjectTypeExtension = function(_, v183) --[[ Line: 503 ]] --[[ Name: InputObjectTypeExtension ]]
        -- upvalues: v8 (ref), v9 (ref)
        local l_name_21 = v183.name;
        local l_directives_21 = v183.directives;
        local l_fields_6 = v183.fields;
        return v8({
            "extend input", 
            l_name_21, 
            v8(l_directives_21, " "), 
            v9(l_fields_6)
        }, " ");
    end
};
v8 = function(v187, v188) --[[ Line: 521 ]] --[[ Name: join ]]
    -- upvalues: l_Array_0 (copy)
    v188 = v188 or "";
    if v187 then
        return l_Array_0.join(l_Array_0.filter(v187, function(v189) --[[ Line: 525 ]]
            return tostring(v189) and v189 ~= "";
        end), v188);
    else
        return "";
    end;
end;
v9 = function(v190) --[[ Line: 539 ]] --[[ Name: block ]]
    -- upvalues: v10 (ref), v11 (ref), v8 (ref)
    return v10("{\n", v11(v8(v190, "\n")), "\n}");
end;
v10 = function(v191, v192, v193) --[[ Line: 546 ]] --[[ Name: wrap ]]
    v193 = v193 or "";
    if v192 ~= nil and v192 ~= "" then
        return v191 .. tostring(v192) .. tostring(v193);
    else
        return "";
    end;
end;
v11 = function(v194) --[[ Line: 556 ]] --[[ Name: indent ]]
    -- upvalues: v10 (ref)
    local v195 = v194:gsub("\n", "\n  ");
    return v10("  ", v195);
end;
v12 = function(v196) --[[ Line: 563 ]] --[[ Name: isMultiline ]]
    return string.find(tostring(v196), "\n") ~= nil;
end;
v13 = function(v197) --[[ Line: 567 ]] --[[ Name: hasMultilineItems ]]
    -- upvalues: l_Array_0 (copy), v12 (ref)
    local v198 = false;
    if v197 ~= nil then
        v198 = l_Array_0.some(v197, v12);
    end;
    return v198;
end;
return {
    print = v15
};