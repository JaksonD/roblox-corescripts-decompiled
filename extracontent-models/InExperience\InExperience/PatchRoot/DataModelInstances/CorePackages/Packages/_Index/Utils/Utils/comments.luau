local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v8.Array;
local l_Boolean_0 = v8.Boolean;
local l_Object_0 = v8.Object;
local v12 = {};
local _ = require(script.Parent.types);
local v14 = require(l_Parent_0.GraphQL);
local l_visit_0 = v14.visit;
local l_TokenKind_0 = v14.TokenKind;
local _ = require(l_Parent_0.GraphQL);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local l_String_0 = v8.String;
local v27 = {};
v12.resetComments = function() --[[ Line: 62 ]] --[[ Name: resetComments ]]
    -- upvalues: v27 (ref)
    v27 = {};
end;
v12.collectComment = function(v28) --[[ Line: 66 ]] --[[ Name: collectComment ]]
    -- upvalues: v18 (ref), l_Boolean_0 (copy), v19 (ref)
    local v29 = if typeof(v28.name) == "table" then v28.name.value else nil;
    if v29 == nil then
        return;
    else
        v18(v28, v29);
        local l_kind_0 = v28.kind;
        if l_kind_0 == "EnumTypeDefinition" then
            if l_Boolean_0.toJSBoolean(v28.values) then
                for _, v32 in v28.values do
                    v18(v32, v29, v32.name.value);
                end;
                return;
            end;
        elseif (l_kind_0 == "ObjectTypeDefinition" or l_kind_0 == "InputObjectTypeDefinition" or l_kind_0 == "InterfaceTypeDefinition") and l_Boolean_0.toJSBoolean(v28.fields) then
            for _, v34 in v28.fields do
                v18(v34, v29, v34.name.value);
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local v36 = v19(v34);
                if l_toJSBoolean_0(if l_Boolean_0.toJSBoolean(v36) then v34.arguments else v36) then
                    for _, v38 in v34.arguments do
                        v18(v38, v29, v34.name.value, v38.name.value);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v18 = function(v39, v40, v41, v42) --[[ Line: 123 ]] --[[ Name: pushComment ]]
    -- upvalues: v20 (ref), l_Boolean_0 (copy), l_Array_0 (copy), v27 (ref)
    local v43 = v20(v39);
    if typeof(v43) ~= "string" or #v43 == 0 then
        return;
    else
        local v44 = {
            v40
        };
        if l_Boolean_0.toJSBoolean(v41) then
            table.insert(v44, v41);
            if l_Boolean_0.toJSBoolean(v42) then
                table.insert(v44, v42);
            end;
        end;
        local v45 = l_Array_0.join(v44, ".");
        if not l_Boolean_0.toJSBoolean(v27[tostring(v45)]) then
            v27[tostring(v45)] = {};
        end;
        table.insert(v27[v45], v43);
        return;
    end;
end;
v12.pushComment = v18;
local function v47(v46) --[[ Line: 155 ]] --[[ Name: printComment ]]
    return "\n# " .. v46:gsub("\n", "\n# ");
end;
v12.printComment = v47;
local function v51(v48, v49) --[[ Line: 183 ]] --[[ Name: join ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v48) then
        return (l_Array_0.join(l_Array_0.filter(v48, function(v50) --[[ Line: 195 ]]
            -- upvalues: l_Boolean_0 (ref)
            return l_Boolean_0.toJSBoolean(v50);
        end), l_Boolean_0.toJSBoolean(v49) and v49 or ""));
    else
        return "";
    end;
end;
local function _(v52) --[[ Line: 205 ]] --[[ Name: hasMultilineItems ]]
    -- upvalues: l_Array_0 (copy), l_String_0 (copy)
    local v54 = if typeof(v52) == "table" then l_Array_0.some(v52, function(v53) --[[ Line: 212 ]]
        -- upvalues: l_String_0 (ref)
        return l_String_0.includes(v53, "\n");
    end) else nil;
    if v54 ~= nil then
        return v54;
    else
        return false;
    end;
end;
local function _(v56) --[[ Line: 229 ]] --[[ Name: addDescription ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_String_0 (copy), v27 (ref), v51 (copy), v47 (copy)
    return function(v57, v58, v59, v60, v61, v62) --[[ Line: 230 ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), l_Boolean_0 (ref), l_String_0 (ref), v27 (ref), v51 (ref), v47 (ref), v56 (copy)
        local v63 = {};
        local v66 = l_Array_0.reduce(v61, function(v64, v65) --[[ Line: 258 ]]
            -- upvalues: l_Object_0 (ref), l_Array_0 (ref), l_Boolean_0 (ref), v63 (copy)
            if v65 ~= l_Object_0.None and l_Array_0.includes({
                "fields", 
                "arguments", 
                "values"
            }, v65) and l_Boolean_0.toJSBoolean(v64.name) then
                table.insert(v63, v64.name.value);
            end;
            if v64 == l_Object_0.None then
                return v65;
            else
                return v64[v65];
            end;
        end, v62[1] or l_Object_0.None);
        local v67 = l_Array_0.join(l_Array_0.filter(l_Array_0.concat({}, v63, {
            if typeof(if typeof(v66) == "table" then v66.name else nil) == "table" then (if typeof(v66) == "table" then v66.name else nil).value else nil
        }), l_Boolean_0.toJSBoolean), ".");
        local v68 = {};
        if l_String_0.includes(v58.kind, "Definition") and l_Boolean_0.toJSBoolean(v27[v67]) then
            v68 = l_Array_0.concat(v68, v27[v67]);
        end;
        return (v51(l_Array_0.concat({}, l_Array_0.map(v68, v47), {
            v58.description or "", 
            (v56(v57, v58, v59, v60, v61, v62))
        }), "\n"));
    end;
end;
local function v71(v70) --[[ Line: 320 ]] --[[ Name: indent ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v70) then
        return ("  %s"):format((v70:gsub("\n", "\n  ")));
    else
        return v70;
    end;
end;
local function _(v72) --[[ Line: 344 ]] --[[ Name: block ]]
    -- upvalues: v71 (copy), v51 (copy)
    if v72 and #v72 ~= 0 then
        return (("{\n%s\n}"):format(v71((v51(v72, "\n")))));
    else
        return "";
    end;
end;
local function _(v74, v75, v76) --[[ Line: 363 ]] --[[ Name: wrap ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v75) then
        return v74 .. tostring(v75) .. (l_Boolean_0.toJSBoolean(v76) and v76 or "");
    else
        return "";
    end;
end;
local function v82(v78, v79) --[[ Line: 377 ]] --[[ Name: printBlockString ]]
    -- upvalues: l_String_0 (copy), l_Boolean_0 (copy)
    local v80 = v79 ~= nil and v79;
    local v81 = v78:gsub("\"", "\\\"\"\"");
    if (v78:sub(1, 1) == " " or v78:sub(1, 1) == "\t") and l_String_0.indexOf(v78, "\n") == -1 then
        return ("\"\"\"%s\"\"\""):format((v81:gsub("\"$", "\"\n")));
    else
        return ("\"\"\"\n%s\n\"\"\""):format(if l_Boolean_0.toJSBoolean(v80) then v81 else if l_Boolean_0.toJSBoolean(v81) then ("  %s"):format((v81:gsub("\n", "\n  "))) else v81);
    end;
end;
local v374 = {
    Name = {
        leave = function(_, v84) --[[ Line: 417 ]] --[[ Name: leave ]]
            return v84.value;
        end
    }, 
    Variable = {
        leave = function(_, v86) --[[ Line: 425 ]] --[[ Name: leave ]]
            return "$" .. tostring(v86.name);
        end
    }, 
    Document = {
        leave = function(_, v88) --[[ Line: 434 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            return (v51(v88.definitions, "\n\n"));
        end
    }, 
    OperationDefinition = {
        leave = function(_, v90) --[[ Line: 442 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local v91 = v51(v90.variableDefinitions, ", ");
            local v92 = if l_Boolean_0.toJSBoolean(v91) then "(" .. tostring(v91) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "";
            return tostring((v51({
                v90.operation, 
                v51({
                    v90.name, 
                    v92
                }), 
                (v51(v90.directives, " "))
            }, " "))) .. " " .. tostring(v90.selectionSet);
        end
    }, 
    VariableDefinition = {
        leave = function(_, v94) --[[ Line: 452 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (copy), v51 (copy)
            local l_variable_0 = v94.variable;
            local l_type_0 = v94.type;
            local l_defaultValue_0 = v94.defaultValue;
            local l_directives_0 = v94.directives;
            local v99 = tostring(l_variable_0);
            local v100 = ": ";
            local v101 = tostring(l_type_0);
            local v102;
            if l_Boolean_0.toJSBoolean(l_defaultValue_0) then
                local v103 = " = ";
                local v104 = tostring(l_defaultValue_0);
                v102 = if l_Boolean_0.toJSBoolean(nil) then v103 .. v104 .. "" else v103 .. v104 .. "";
            else
                v102 = "";
            end;
            local v105 = tostring(v102);
            v102 = v51(l_directives_0, " ");
            local v106;
            if l_Boolean_0.toJSBoolean(v102) then
                local v107 = " ";
                local v108 = tostring(v102);
                v106 = if l_Boolean_0.toJSBoolean(nil) then v107 .. v108 .. "" else v107 .. v108 .. "";
            else
                v106 = "";
            end;
            return v99 .. v100 .. v101 .. v105 .. tostring(v106);
        end
    }, 
    SelectionSet = {
        leave = function(_, v110) --[[ Line: 466 ]] --[[ Name: leave ]]
            -- upvalues: v71 (copy), v51 (copy)
            local l_selections_0 = v110.selections;
            if l_selections_0 and #l_selections_0 ~= 0 then
                return (("{\n%s\n}"):format(v71((v51(l_selections_0, "\n")))));
            else
                return "";
            end;
        end
    }, 
    Field = {
        leave = function(_, v113) --[[ Line: 473 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (copy), v51 (copy)
            local l_alias_0 = v113.alias;
            local l_name_0 = v113.name;
            local l_arguments_0 = v113.arguments;
            local l_directives_1 = v113.directives;
            local l_selectionSet_0 = v113.selectionSet;
            local v119 = (if l_Boolean_0.toJSBoolean(l_alias_0) then "" .. tostring(l_alias_0) .. (l_Boolean_0.toJSBoolean(": ") and ": " or "") else "") .. l_name_0;
            local l_v119_0 = v119;
            local v121 = v51(l_arguments_0, ", ");
            local v122 = l_v119_0 .. if l_Boolean_0.toJSBoolean(v121) then "(" .. tostring(v121) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "";
            if v122.length > 80 then
                l_v119_0 = v119;
                local v123 = v51(l_arguments_0, "\n");
                v121 = if l_Boolean_0.toJSBoolean(v123) then ("  %s"):format((v123:gsub("\n", "\n  "))) else v123;
                v122 = l_v119_0 .. if l_Boolean_0.toJSBoolean(v121) then "(\n" .. tostring(v121) .. (l_Boolean_0.toJSBoolean("\n)") and "\n)" or "") else "";
            end;
            return (v51({
                v122, 
                v51(l_directives_1, " "), 
                l_selectionSet_0
            }, " "));
        end
    }, 
    Argument = {
        leave = function(_, v125) --[[ Line: 497 ]] --[[ Name: leave ]]
            local l_name_1 = v125.name;
            local l_value_0 = v125.value;
            return tostring(l_name_1) .. ": " .. tostring(l_value_0);
        end
    }, 
    FragmentSpread = {
        leave = function(_, v129) --[[ Line: 507 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_2 = v129.name;
            local l_directives_2 = v129.directives;
            local v132 = "...";
            local v133 = tostring(l_name_2);
            local v134 = v51(l_directives_2, " ");
            local v135;
            if l_Boolean_0.toJSBoolean(v134) then
                local v136 = " ";
                local v137 = tostring(v134);
                v135 = if l_Boolean_0.toJSBoolean(nil) then v136 .. v137 .. "" else v136 .. v137 .. "";
            else
                v135 = "";
            end;
            return v132 .. v133 .. tostring(v135);
        end
    }, 
    InlineFragment = {
        leave = function(_, v139) --[[ Line: 516 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_typeCondition_0 = v139.typeCondition;
            local l_directives_3 = v139.directives;
            local l_selectionSet_1 = v139.selectionSet;
            local l_v51_0 = v51;
            local v144 = {};
            local v145 = "...";
            local v146;
            if l_Boolean_0.toJSBoolean(l_typeCondition_0) then
                local v147 = "on ";
                local v148 = tostring(l_typeCondition_0);
                v146 = if l_Boolean_0.toJSBoolean(nil) then v147 .. v148 .. "" else v147 .. v148 .. "";
            else
                v146 = "";
            end;
            local v149 = v51(l_directives_3, " ");
            local l_l_selectionSet_1_0 = l_selectionSet_1;
            v6(v144, 1, v145, v146, v149, l_l_selectionSet_1_0);
            return (l_v51_0(v144, " "));
        end
    }, 
    FragmentDefinition = {
        leave = function(_, v152) --[[ Line: 525 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_3 = v152.name;
            local l_typeCondition_1 = v152.typeCondition;
            local l_variableDefinitions_0 = v152.variableDefinitions;
            local l_directives_4 = v152.directives;
            local l_selectionSet_2 = v152.selectionSet;
            local v158 = "fragment %s%s ";
            local v159 = tostring(l_name_3);
            local v160 = v51(l_variableDefinitions_0, ", ");
            local v161 = v158:format(v159, if l_Boolean_0.toJSBoolean(v160) then "(" .. tostring(v160) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "");
            v158 = "on %s %s";
            v159 = tostring(l_typeCondition_1);
            local v162 = v51(l_directives_4, " ");
            return v161 .. v158:format(v159, (tostring(if l_Boolean_0.toJSBoolean(v162) then "" .. tostring(v162) .. (l_Boolean_0.toJSBoolean(" ") and " " or "") else ""))) .. tostring(l_selectionSet_2);
        end
    }, 
    IntValue = {
        leave = function(_, v164) --[[ Line: 545 ]] --[[ Name: leave ]]
            return v164.value;
        end
    }, 
    FloatValue = {
        leave = function(_, v166) --[[ Line: 554 ]] --[[ Name: leave ]]
            return v166.value;
        end
    }, 
    StringValue = {
        leave = function(_, v168) --[[ Line: 563 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (copy), v82 (copy)
            local l_value_1 = v168.value;
            local l_block_0 = v168.block;
            if l_Boolean_0.toJSBoolean(l_block_0) then
                return v82(l_value_1);
            else
                return "'" .. l_value_1:gsub("'", "\\'") .. "'";
            end;
        end
    }, 
    BooleanValue = {
        leave = function(_, v172) --[[ Line: 579 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (copy)
            local l_value_2 = v172.value;
            if l_Boolean_0.toJSBoolean(l_value_2) then
                return "true";
            else
                return "false";
            end;
        end
    }, 
    NullValue = {
        leave = function() --[[ Line: 586 ]] --[[ Name: leave ]]
            return "null";
        end
    }, 
    EnumValue = {
        leave = function(_, v175) --[[ Line: 593 ]] --[[ Name: leave ]]
            return v175.value;
        end
    }, 
    ListValue = {
        leave = function(_, v177) --[[ Line: 602 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            local l_values_0 = v177.values;
            return "[" .. tostring((v51(l_values_0, ", "))) .. "]";
        end
    }, 
    ObjectValue = {
        leave = function(_, v180) --[[ Line: 611 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            local l_fields_0 = v180.fields;
            return "{" .. tostring((v51(l_fields_0, ", "))) .. "}";
        end
    }, 
    ObjectField = {
        leave = function(_, v183) --[[ Line: 620 ]] --[[ Name: leave ]]
            local l_name_4 = v183.name;
            local l_value_3 = v183.value;
            return tostring(l_name_4) .. ": " .. tostring(l_value_3);
        end
    }, 
    Directive = {
        leave = function(_, v187) --[[ Line: 630 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_5 = v187.name;
            local l_arguments_1 = v187.arguments;
            local v190 = "@";
            local v191 = tostring(l_name_5);
            local v192 = v51(l_arguments_1, ", ");
            return v190 .. v191 .. tostring(if l_Boolean_0.toJSBoolean(v192) then "(" .. tostring(v192) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "");
        end
    }, 
    NamedType = {
        leave = function(_, v194) --[[ Line: 640 ]] --[[ Name: leave ]]
            return v194.name;
        end
    }, 
    ListType = {
        leave = function(_, v196) --[[ Line: 649 ]] --[[ Name: leave ]]
            return "[" .. tostring(v196.type) .. "]";
        end
    }, 
    NonNullType = {
        leave = function(_, v198) --[[ Line: 658 ]] --[[ Name: leave ]]
            return tostring(v198.type) .. "!";
        end
    }, 
    SchemaDefinition = {
        leave = function(_, v200) --[[ Line: 668 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_directives_5 = v200.directives;
            local l_operationTypes_0 = v200.operationTypes;
            return (v51({
                "schema", 
                v51(l_directives_5, " "), 
                if l_operationTypes_0 and #l_operationTypes_0 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_operationTypes_0, "\n")))) else ""
            }, " "));
        end
    }, 
    OperationTypeDefinition = {
        leave = function(_, v204) --[[ Line: 677 ]] --[[ Name: leave ]]
            local l_operation_0 = v204.operation;
            local l_type_1 = v204.type;
            return tostring(l_operation_0) .. ": " .. tostring(l_type_1);
        end
    }, 
    ScalarTypeDefinition = {
        leave = function(_, v208) --[[ Line: 686 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            local l_name_6 = v208.name;
            local l_directives_6 = v208.directives;
            return (v51({
                "scalar", 
                l_name_6, 
                (v51(l_directives_6, " "))
            }, " "));
        end
    }, 
    ObjectTypeDefinition = {
        leave = function(_, v212) --[[ Line: 695 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy), v71 (copy)
            local l_name_7 = v212.name;
            local l_interfaces_0 = v212.interfaces;
            local l_directives_7 = v212.directives;
            local l_fields_1 = v212.fields;
            local l_v51_1 = v51;
            local v218 = {};
            local v219 = "type";
            local l_l_name_7_0 = l_name_7;
            local v221 = v51(l_interfaces_0, " & ");
            local v222;
            if l_Boolean_0.toJSBoolean(v221) then
                local v223 = "implements ";
                local v224 = tostring(v221);
                v222 = if l_Boolean_0.toJSBoolean(nil) then v223 .. v224 .. "" else v223 .. v224 .. "";
            else
                v222 = "";
            end;
            v221 = v51(l_directives_7, " ");
            local v225 = if l_fields_1 and #l_fields_1 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_1, "\n")))) else "";
            v6(v218, 1, v219, l_l_name_7_0, v222, v221, v225);
            return (l_v51_1(v218, " "));
        end
    }, 
    FieldDefinition = {
        leave = function(_, v227) --[[ Line: 710 ]] --[[ Name: leave ]]
            -- upvalues: l_Array_0 (copy), l_String_0 (copy), v51 (copy), l_Boolean_0 (copy)
            local l_name_8 = v227.name;
            local l_arguments_2 = v227.arguments;
            local l_type_2 = v227.type;
            local l_directives_8 = v227.directives;
            local v232 = tostring(l_name_8);
            local v234 = if typeof(l_arguments_2) == "table" then l_Array_0.some(l_arguments_2, function(v233) --[[ Line: 212 ]]
                -- upvalues: l_String_0 (ref)
                return l_String_0.includes(v233, "\n");
            end) else nil;
            local v235;
            if v234 ~= nil and v234 then
                v234 = v51(l_arguments_2, "\n");
                local v236 = if l_Boolean_0.toJSBoolean(v234) then ("  %s"):format((v234:gsub("\n", "\n  "))) else v234;
                v235 = if l_Boolean_0.toJSBoolean(v236) then "(\n" .. tostring(v236) .. (l_Boolean_0.toJSBoolean("\n)") and "\n)" or "") else "";
            else
                local v237 = v51(l_arguments_2, ", ");
                v235 = if l_Boolean_0.toJSBoolean(v237) then "(" .. tostring(v237) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "";
            end;
            local v238 = ": ";
            local v239 = tostring(l_type_2);
            local v240 = v51(l_directives_8, " ");
            local v241;
            if l_Boolean_0.toJSBoolean(v240) then
                v234 = " ";
                local v242 = tostring(v240);
                v241 = if l_Boolean_0.toJSBoolean(nil) then v234 .. v242 .. "" else v234 .. v242 .. "";
            else
                v241 = "";
            end;
            return v232 .. v235 .. v238 .. v239 .. v241;
        end
    }, 
    InputValueDefinition = {
        leave = function(_, v244) --[[ Line: 735 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_9 = v244.name;
            local l_type_3 = v244.type;
            local l_defaultValue_1 = v244.defaultValue;
            local l_directives_9 = v244.directives;
            local l_v51_2 = v51;
            local v250 = {};
            local v251 = tostring(l_name_9) .. ": " .. tostring(l_type_3);
            local v252;
            if l_Boolean_0.toJSBoolean(l_defaultValue_1) then
                local v253 = "= ";
                local v254 = tostring(l_defaultValue_1);
                v252 = if l_Boolean_0.toJSBoolean(nil) then v253 .. v254 .. "" else v253 .. v254 .. "";
            else
                v252 = "";
            end;
            local v255 = v51(l_directives_9, " ");
            v6(v250, 1, v251, v252, v255);
            return (l_v51_2(v250, " "));
        end
    }, 
    InterfaceTypeDefinition = {
        leave = function(_, v257) --[[ Line: 748 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy), v71 (copy)
            local l_name_10 = v257.name;
            local l_interfaces_1 = v257.interfaces;
            local l_directives_10 = v257.directives;
            local l_fields_2 = v257.fields;
            local l_v51_3 = v51;
            local v263 = {};
            local v264 = "interface";
            local l_l_name_10_0 = l_name_10;
            local v266 = v51(l_interfaces_1, " & ");
            local v267;
            if l_Boolean_0.toJSBoolean(v266) then
                local v268 = "implements ";
                local v269 = tostring(v266);
                v267 = if l_Boolean_0.toJSBoolean(nil) then v268 .. v269 .. "" else v268 .. v269 .. "";
            else
                v267 = "";
            end;
            v266 = v51(l_directives_10, " ");
            local v270 = if l_fields_2 and #l_fields_2 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_2, "\n")))) else "";
            v6(v263, 1, v264, l_l_name_10_0, v267, v266, v270);
            return (l_v51_3(v263, " "));
        end
    }, 
    UnionTypeDefinition = {
        leave = function(_, v272) --[[ Line: 763 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_11 = v272.name;
            local l_directives_11 = v272.directives;
            local l_types_0 = v272.types;
            local l_v51_4 = v51;
            local v277 = {};
            local v278 = "union";
            local l_l_name_11_0 = l_name_11;
            local v280 = v51(l_directives_11, " ");
            local v281 = v51(l_types_0, " | ");
            local v282;
            if l_Boolean_0.toJSBoolean(v281) then
                local v283 = "= ";
                local v284 = tostring(v281);
                v282 = if l_Boolean_0.toJSBoolean(nil) then v283 .. v284 .. "" else v283 .. v284 .. "";
            else
                v282 = "";
            end;
            v6(v277, 1, v278, l_l_name_11_0, v280, v282);
            return (l_v51_4(v277, " "));
        end
    }, 
    EnumTypeDefinition = {
        leave = function(_, v286) --[[ Line: 772 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_name_12 = v286.name;
            local l_directives_12 = v286.directives;
            local l_values_1 = v286.values;
            return (v51({
                "enum", 
                l_name_12, 
                v51(l_directives_12, " "), 
                if l_values_1 and #l_values_1 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_values_1, "\n")))) else ""
            }, " "));
        end
    }, 
    EnumValueDefinition = {
        leave = function(_, v291) --[[ Line: 781 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            local l_name_13 = v291.name;
            local l_directives_13 = v291.directives;
            return (v51({
                l_name_13, 
                (v51(l_directives_13, " "))
            }, " "));
        end
    }, 
    InputObjectTypeDefinition = {
        leave = function(_, v295) --[[ Line: 790 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_name_14 = v295.name;
            local l_directives_14 = v295.directives;
            local l_fields_3 = v295.fields;
            return (v51({
                "input", 
                l_name_14, 
                v51(l_directives_14, " "), 
                if l_fields_3 and #l_fields_3 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_3, "\n")))) else ""
            }, " "));
        end
    }, 
    DirectiveDefinition = {
        leave = function(_, v300) --[[ Line: 799 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_String_0 (copy), v51 (copy)
            local l_name_15 = v300.name;
            local l_arguments_3 = v300.arguments;
            local l_repeatable_0 = v300.repeatable;
            local l_locations_0 = v300.locations;
            local v305 = "directive @";
            local v306 = tostring(l_name_15);
            local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
            local v309 = if typeof(l_arguments_3) == "table" then l_Array_0.some(l_arguments_3, function(v308) --[[ Line: 212 ]]
                -- upvalues: l_String_0 (ref)
                return l_String_0.includes(v308, "\n");
            end) else nil;
            local v310;
            if l_toJSBoolean_1(v309 ~= nil and v309) then
                local v311 = v51(l_arguments_3, "\n");
                l_toJSBoolean_1 = if l_Boolean_0.toJSBoolean(v311) then ("  %s"):format((v311:gsub("\n", "\n  "))) else v311;
                v310 = if l_Boolean_0.toJSBoolean(l_toJSBoolean_1) then "(\n" .. tostring(l_toJSBoolean_1) .. (l_Boolean_0.toJSBoolean("\n)") and "\n)" or "") else "";
            else
                l_toJSBoolean_1 = v51(l_arguments_3, ", ");
                v310 = if l_Boolean_0.toJSBoolean(l_toJSBoolean_1) then "(" .. tostring(l_toJSBoolean_1) .. (l_Boolean_0.toJSBoolean(")") and ")" or "") else "";
            end;
            return v305 .. v306 .. tostring(v310) .. (l_Boolean_0.toJSBoolean(l_repeatable_0) and " repeatable" or "") .. " on " .. tostring((v51(l_locations_0, " | ")));
        end
    }, 
    SchemaExtension = {
        leave = function(_, v313) --[[ Line: 817 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_directives_15 = v313.directives;
            local l_operationTypes_1 = v313.operationTypes;
            return (v51({
                "extend schema", 
                v51(l_directives_15, " "), 
                if l_operationTypes_1 and #l_operationTypes_1 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_operationTypes_1, "\n")))) else ""
            }, " "));
        end
    }, 
    ScalarTypeExtension = {
        leave = function(_, v317) --[[ Line: 826 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy)
            local l_name_16 = v317.name;
            local l_directives_16 = v317.directives;
            return (v51({
                "extend scalar", 
                l_name_16, 
                (v51(l_directives_16, " "))
            }, " "));
        end
    }, 
    ObjectTypeExtension = {
        leave = function(_, v321) --[[ Line: 835 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy), v71 (copy)
            local l_name_17 = v321.name;
            local l_interfaces_2 = v321.interfaces;
            local l_directives_17 = v321.directives;
            local l_fields_4 = v321.fields;
            local l_v51_5 = v51;
            local v327 = {};
            local v328 = "extend type";
            local l_l_name_17_0 = l_name_17;
            local v330 = v51(l_interfaces_2, " & ");
            local v331;
            if l_Boolean_0.toJSBoolean(v330) then
                local v332 = "implements ";
                local v333 = tostring(v330);
                v331 = if l_Boolean_0.toJSBoolean(nil) then v332 .. v333 .. "" else v332 .. v333 .. "";
            else
                v331 = "";
            end;
            v330 = v51(l_directives_17, " ");
            local v334 = if l_fields_4 and #l_fields_4 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_4, "\n")))) else "";
            v6(v327, 1, v328, l_l_name_17_0, v331, v330, v334);
            return (l_v51_5(v327, " "));
        end
    }, 
    InterfaceTypeExtension = {
        leave = function(_, v336) --[[ Line: 850 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy), v71 (copy)
            local l_name_18 = v336.name;
            local l_interfaces_3 = v336.interfaces;
            local l_directives_18 = v336.directives;
            local l_fields_5 = v336.fields;
            local l_v51_6 = v51;
            local v342 = {};
            local v343 = "extend interface";
            local l_l_name_18_0 = l_name_18;
            local v345 = v51(l_interfaces_3, " & ");
            local v346;
            if l_Boolean_0.toJSBoolean(v345) then
                local v347 = "implements ";
                local v348 = tostring(v345);
                v346 = if l_Boolean_0.toJSBoolean(nil) then v347 .. v348 .. "" else v347 .. v348 .. "";
            else
                v346 = "";
            end;
            v345 = v51(l_directives_18, " ");
            local v349 = if l_fields_5 and #l_fields_5 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_5, "\n")))) else "";
            v6(v342, 1, v343, l_l_name_18_0, v346, v345, v349);
            return (l_v51_6(v342, " "));
        end
    }, 
    UnionTypeExtension = {
        leave = function(_, v351) --[[ Line: 865 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), l_Boolean_0 (copy)
            local l_name_19 = v351.name;
            local l_directives_19 = v351.directives;
            local l_types_1 = v351.types;
            local l_v51_7 = v51;
            local v356 = {};
            local v357 = "extend union";
            local l_l_name_19_0 = l_name_19;
            local v359 = v51(l_directives_19, " ");
            local v360 = v51(l_types_1, " | ");
            local v361;
            if l_Boolean_0.toJSBoolean(v360) then
                local v362 = "= ";
                local v363 = tostring(v360);
                v361 = if l_Boolean_0.toJSBoolean(nil) then v362 .. v363 .. "" else v362 .. v363 .. "";
            else
                v361 = "";
            end;
            v6(v356, 1, v357, l_l_name_19_0, v359, v361);
            return (l_v51_7(v356, " "));
        end
    }, 
    EnumTypeExtension = {
        leave = function(_, v365) --[[ Line: 874 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_name_20 = v365.name;
            local l_directives_20 = v365.directives;
            local l_values_2 = v365.values;
            return (v51({
                "extend enum", 
                l_name_20, 
                v51(l_directives_20, " "), 
                if l_values_2 and #l_values_2 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_values_2, "\n")))) else ""
            }, " "));
        end
    }, 
    InputObjectTypeExtension = {
        leave = function(_, v370) --[[ Line: 883 ]] --[[ Name: leave ]]
            -- upvalues: v51 (copy), v71 (copy)
            local l_name_21 = v370.name;
            local l_directives_21 = v370.directives;
            local l_fields_6 = v370.fields;
            return (v51({
                "extend input", 
                l_name_21, 
                v51(l_directives_21, " "), 
                if l_fields_6 and #l_fields_6 ~= 0 then ("{\n%s\n}"):format(v71((v51(l_fields_6, "\n")))) else ""
            }, " "));
        end
    }
};
local v395 = l_Array_0.reduce(l_Object_0.keys(v374), function(v375, v376) --[[ Line: 900 ]]
    -- upvalues: l_Object_0 (copy), v374 (copy), l_Array_0 (copy), l_Boolean_0 (copy), l_String_0 (copy), v27 (ref), v51 (copy), v47 (copy)
    local l_assign_0 = l_Object_0.assign;
    local v378 = {};
    local l_v375_0 = v375;
    local v380 = {};
    local v381 = {};
    local l_leave_0 = v374[v376].leave;
    v381.leave = function(v383, v384, v385, v386, v387, v388) --[[ Line: 230 ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), l_Boolean_0 (ref), l_String_0 (ref), v27 (ref), v51 (ref), v47 (ref), l_leave_0 (copy)
        local v389 = {};
        local v392 = l_Array_0.reduce(v387, function(v390, v391) --[[ Line: 258 ]]
            -- upvalues: l_Object_0 (ref), l_Array_0 (ref), l_Boolean_0 (ref), v389 (copy)
            if v391 ~= l_Object_0.None and l_Array_0.includes({
                "fields", 
                "arguments", 
                "values"
            }, v391) and l_Boolean_0.toJSBoolean(v390.name) then
                table.insert(v389, v390.name.value);
            end;
            if v390 == l_Object_0.None then
                return v391;
            else
                return v390[v391];
            end;
        end, v388[1] or l_Object_0.None);
        local v393 = l_Array_0.join(l_Array_0.filter(l_Array_0.concat({}, v389, {
            if typeof(if typeof(v392) == "table" then v392.name else nil) == "table" then (if typeof(v392) == "table" then v392.name else nil).value else nil
        }), l_Boolean_0.toJSBoolean), ".");
        local v394 = {};
        if l_String_0.includes(v384.kind, "Definition") and l_Boolean_0.toJSBoolean(v27[v393]) then
            v394 = l_Array_0.concat(v394, v27[v393]);
        end;
        return (v51(l_Array_0.concat({}, l_Array_0.map(v394, v47), {
            v384.description or "", 
            (l_leave_0(v383, v384, v385, v386, v387, v388))
        }), "\n"));
    end;
    v380[v376] = v381;
    return (l_assign_0(v378, l_v375_0, v380));
end, {});
v12.printWithComments = function(v396) --[[ Line: 914 ]] --[[ Name: printWithComments ]]
    -- upvalues: l_visit_0 (copy), v395 (copy)
    return (l_visit_0(v396, v395));
end;
v19 = function(v397) --[[ Line: 920 ]] --[[ Name: isFieldDefinitionNode ]]
    return v397.kind == "FieldDefinition";
end;
v12.getDescription = function(v398, v399) --[[ Line: 926 ]] --[[ Name: getDescription ]]
    -- upvalues: l_Boolean_0 (copy), v20 (ref)
    if v398.description ~= nil then
        return v398.description.value;
    elseif l_Boolean_0.toJSBoolean(if typeof(v399) == "table" then v399.commentDescriptions else nil) then
        return v20(v398);
    else
        return nil;
    end;
end;
v20 = function(v400) --[[ Line: 945 ]] --[[ Name: getComment ]]
    -- upvalues: v21 (ref), v22 (ref)
    local v401 = v21(v400);
    if v401 ~= nil then
        return v22(("\n%s"):format((tostring(v401))));
    else
        return nil;
    end;
end;
v12.getComment = v20;
v21 = function(v402) --[[ Line: 958 ]] --[[ Name: getLeadingCommentBlock ]]
    -- upvalues: l_Boolean_0 (copy), l_TokenKind_0 (copy), l_Array_0 (copy)
    local l_loc_0 = v402.loc;
    if not l_Boolean_0.toJSBoolean(l_loc_0) then
        return;
    else
        local v404 = {};
        local l_prev_0 = l_loc_0.startToken.prev;
        while l_prev_0 ~= nil and l_prev_0.kind == l_TokenKind_0.COMMENT and l_prev_0.next ~= nil and l_prev_0.prev ~= nil and l_prev_0.line + 1 == l_prev_0.next.line and l_prev_0.line ~= l_prev_0.prev.line do
            table.insert(v404, (tostring(l_prev_0.value)));
            l_prev_0 = l_prev_0.prev;
        end;
        if #v404 > 0 then
            return (l_Array_0.join(l_Array_0.reverse(v404), "\n"));
        else
            return nil;
        end;
    end;
end;
v12.getLeadingCommentBlock = v21;
v22 = function(v406) --[[ Line: 995 ]] --[[ Name: dedentBlockStringValue ]]
    -- upvalues: l_String_0 (copy), v23 (ref), v24 (ref), l_Array_0 (copy)
    local v407 = l_String_0.split(v406, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v408 = v23(v407);
    if v408 ~= 0 then
        local v409 = 2;
        while v409 <= #v407 do
            v407[v409] = l_String_0.slice(v407[v409], v408 + 1);
            v409 = v409 + 1;
        end;
    end;
    while #v407 > 0 and v24(v407[1]) do
        table.remove(v407, 1);
    end;
    while #v407 > 0 and v24(v407[#v407]) do
        table.remove(v407);
    end;
    return l_Array_0.join(v407, "\n");
end;
v12.dedentBlockStringValue = v22;
v23 = function(v410) --[[ Line: 1060 ]] --[[ Name: getBlockStringIndentation ]]
    -- upvalues: v25 (ref)
    local v411 = nil;
    local v412 = 2;
    while v412 <= #v410 do
        local v413 = v410[v412];
        local v414 = v25(v413);
        if v414 == #v413 then
            v412 = v412 + 1;
        else
            if v411 == nil or v414 < v411 then
                v411 = v414;
                if v411 == 0 then
                    break;
                end;
            end;
            v412 = v412 + 1;
        end;
    end;
    if v411 == nil then
        return 0;
    else
        return v411;
    end;
end;
v12.getBlockStringIndentation = v23;
v25 = function(v415) --[[ Line: 1107 ]] --[[ Name: leadingWhitespace ]]
    local v416 = 0;
    while v416 < #v415 and (v415:sub(v416 + 1, v416 + 1) == " " or v415:sub(v416 + 1, v416 + 1) == "\t") do
        v416 = v416 + 1;
    end;
    return v416;
end;
v24 = function(v417) --[[ Line: 1123 ]] --[[ Name: isBlank ]]
    -- upvalues: v25 (ref)
    return v25(v417) == #v417;
end;
return v12;