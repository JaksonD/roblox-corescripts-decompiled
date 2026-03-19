local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v7 = {};
local v8 = require(l_Parent_0.GraphQL);
local l_print_0 = v8.print;
local l_Kind_0 = v8.Kind;
local l_isSpecifiedScalarType_0 = v8.isSpecifiedScalarType;
local l_isIntrospectionType_0 = v8.isIntrospectionType;
local l_isSpecifiedDirective_0 = v8.isSpecifiedDirective;
local l_astFromValue_0 = v8.astFromValue;
local l_GraphQLDeprecatedDirective_0 = v8.GraphQLDeprecatedDirective;
local l_isObjectType_0 = v8.isObjectType;
local l_isInterfaceType_0 = v8.isInterfaceType;
local l_isUnionType_0 = v8.isUnionType;
local l_isInputObjectType_0 = v8.isInputObjectType;
local l_isEnumType_0 = v8.isEnumType;
local l_isScalarType_0 = v8.isScalarType;
local _ = require(script.Parent.types);
local l_astFromType_0 = require(script.Parent.astFromType).astFromType;
local l_getDirectivesInExtensions_0 = require(script.Parent["get-directives"]).getDirectivesInExtensions;
local l_astFromValueUntyped_0 = require(script.Parent.astFromValueUntyped).astFromValueUntyped;
local l_isSome_0 = require(script.Parent.helpers).isSome;
local l_getRootTypeMap_0 = require(script.Parent.rootTypes).getRootTypeMap;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local l_NULL_0 = v8.NULL;
local function v58(v45, v46) --[[ Line: 160 ]] --[[ Name: getDocumentNodeFromSchema ]]
    -- upvalues: v28 (ref), l_Boolean_0 (copy), l_isSpecifiedDirective_0 (copy), v29 (ref), l_isSpecifiedScalarType_0 (copy), l_isIntrospectionType_0 (copy), l_isObjectType_0 (copy), v32 (ref), l_isInterfaceType_0 (copy), v36 (ref), l_isUnionType_0 (copy), v37 (ref), l_isInputObjectType_0 (copy), v38 (ref), l_isEnumType_0 (copy), v39 (ref), l_isScalarType_0 (copy), v40 (ref), l_Error_0 (copy), l_Kind_0 (copy)
    local l_pathToDirectivesInExtensions_0 = (if v46 ~= nil then v46 else {}).pathToDirectivesInExtensions;
    local v48 = v45:getTypeMap();
    local v49 = v28(v45, l_pathToDirectivesInExtensions_0);
    local v50 = if v49 ~= nil then {
        v49
    } else {};
    for _, v52 in (v45:getDirectives()) do
        if not l_Boolean_0.toJSBoolean(l_isSpecifiedDirective_0(v52)) then
            table.insert(v50, v29(v52, v45, l_pathToDirectivesInExtensions_0));
        end;
    end;
    for _, v54 in v48 do
        local v55 = v48:get(v54[1]);
        local v56 = l_isSpecifiedScalarType_0(v55);
        local v57 = l_isIntrospectionType_0(v55);
        if not v56 and not v57 then
            if l_Boolean_0.toJSBoolean(l_isObjectType_0(v55)) then
                table.insert(v50, v32(v55, v45, l_pathToDirectivesInExtensions_0));
            elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v55)) then
                table.insert(v50, v36(v55, v45, l_pathToDirectivesInExtensions_0));
            elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(v55)) then
                table.insert(v50, v37(v55, v45, l_pathToDirectivesInExtensions_0));
            elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v55)) then
                table.insert(v50, v38(v55, v45, l_pathToDirectivesInExtensions_0));
            elseif l_Boolean_0.toJSBoolean(l_isEnumType_0(v55)) then
                table.insert(v50, v39(v55, v45, l_pathToDirectivesInExtensions_0));
            elseif l_Boolean_0.toJSBoolean(l_isScalarType_0(v55)) then
                table.insert(v50, v40(v55, v45, l_pathToDirectivesInExtensions_0));
            else
                error(l_Error_0.new(("Unknown type %s."):format((tostring(v55)))));
            end;
        end;
    end;
    return {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v50
    };
end;
v7.getDocumentNodeFromSchema = v58;
v7.printSchemaWithDirectives = function(v59, v60) --[[ Line: 244 ]] --[[ Name: printSchemaWithDirectives ]]
    -- upvalues: v58 (copy), l_print_0 (copy)
    local v61 = if v60 ~= nil then v60 else {};
    local v62 = v58(v59, v61);
    return l_print_0(v62);
end;
v28 = function(v63, v64) --[[ Line: 252 ]] --[[ Name: astFromSchema ]]
    -- upvalues: l_Map_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_getRootTypeMap_0 (copy), l_astFromType_0 (copy), l_Kind_0 (copy), l_Array_0 (copy), l_isSome_0 (copy), v31 (ref)
    local v65 = l_Map_0.new({
        {
            "query", 
            l_Object_0.None
        }, 
        {
            "mutation", 
            l_Object_0.None
        }, 
        {
            "subscription", 
            l_Object_0.None
        }
    });
    local v66 = {};
    if v63.astNode ~= nil then
        table.insert(v66, v63.astNode);
    end;
    if v63.extensionASTNodes ~= nil then
        for _, v68 in v63.extensionASTNodes do
            table.insert(v66, v68);
        end;
    end;
    for _, v70 in v66 do
        if l_Boolean_0.toJSBoolean(v70.operationTypes) then
            for _, v72 in v70.operationTypes do
                v65:set(v72.operation, v72);
            end;
        end;
    end;
    local v73 = l_getRootTypeMap_0(v63);
    for _, v75 in v65 do
        local v76, v77 = table.unpack(v75, 1, 2);
        local v78 = v73:get(v76);
        if v78 ~= nil then
            local v79 = l_astFromType_0(v78);
            if v77 ~= nil and v77 ~= l_Object_0.None then
                v77.type = v79;
            else
                v65:set(v76, {
                    kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                    operation = v76, 
                    type = v79
                });
            end;
        end;
    end;
    local v80 = l_Array_0.filter(l_Array_0.concat({}, v65:values()), l_isSome_0);
    local v81 = v31(v63, v63, v64);
    if not l_Boolean_0.toJSBoolean(#v80) and not l_Boolean_0.toJSBoolean(#v81) then
        return nil;
    else
        local v82 = {
            kind = if v80 ~= nil then l_Kind_0.SCHEMA_DEFINITION else l_Kind_0.SCHEMA_EXTENSION, 
            operationTypes = v80, 
            directives = v81
        };
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v84 = if typeof(v63.astNode) == "table" then v63.astNode.description else nil;
        v82.description = if l_toJSBoolean_0(if v84 ~= nil then v84 else v63.description ~= nil) then {
            kind = l_Kind_0.STRING, 
            value = v63.description, 
            block = true
        } else nil;
        return v82;
    end;
end;
v7.astFromSchema = v28;
v29 = function(v85, v86, v87) --[[ Line: 355 ]] --[[ Name: astFromDirective ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v41 (ref)
    local l_DIRECTIVE_DEFINITION_0 = l_Kind_0.DIRECTIVE_DEFINITION;
    local v89 = if typeof(v85.astNode) == "table" then v85.astNode.description else nil;
    local v90 = if v89 ~= nil then v89 else if l_Boolean_0.toJSBoolean(v85.description) then {
        kind = l_Kind_0.STRING, 
        value = v85.description
    } else nil;
    local v91 = {
        kind = l_Kind_0.NAME, 
        value = v85.name
    };
    local v93 = if typeof(v85.args) == "table" then l_Array_0.map(v85.args, function(v92) --[[ Line: 379 ]]
        -- upvalues: v41 (ref), v86 (copy), v87 (copy)
        return v41(v92, v86, v87);
    end) else nil;
    local l_isRepeatable_0 = v85.isRepeatable;
    local v96 = if typeof(v85.locations) == "table" then l_Array_0.map(v85.locations, function(v95) --[[ Line: 390 ]]
        -- upvalues: l_Kind_0 (ref)
        return {
            kind = l_Kind_0.NAME, 
            value = v95
        };
    end) else nil;
    local v97 = l_Boolean_0.toJSBoolean(v96) and v96 or {};
    return {
        kind = l_DIRECTIVE_DEFINITION_0, 
        description = v90, 
        name = v91, 
        arguments = v93, 
        repeatable = l_isRepeatable_0, 
        locations = v97
    };
end;
v7.astFromDirective = v29;
v31 = function(v98, v99, v100) --[[ Line: 418 ]] --[[ Name: getDirectiveNodes ]]
    -- upvalues: l_getDirectivesInExtensions_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v33 (ref), l_Boolean_0 (copy)
    local v101 = l_getDirectivesInExtensions_0(v98, v100);
    local v102 = {};
    if v98.astNode ~= nil then
        table.insert(v102, v98.astNode);
    end;
    if l_Array_0.indexOf(l_Object_0.keys(v98), "extensionASTNodes") ~= -1 and v98.extensionASTNodes ~= nil then
        v102 = l_Array_0.concat(v102, v98.extensionASTNodes);
    end;
    local v103 = nil;
    if v101 ~= nil then
        return (v33(v99, v101));
    else
        v103 = {};
        for _, v105 in v102 do
            if l_Boolean_0.toJSBoolean(v105.directives) then
                v103 = l_Array_0.concat(v103, v105.directives);
            end;
        end;
        return v103;
    end;
end;
v7.getDirectiveNodes = v31;
local function v116(v106, v107, v108) --[[ Line: 471 ]] --[[ Name: getDeprecatableDirectiveNodes ]]
    -- upvalues: l_getDirectivesInExtensions_0 (copy), v33 (ref), l_Array_0 (copy), v35 (ref)
    local v109 = {};
    local v110 = nil;
    local v111 = l_getDirectivesInExtensions_0(v106, v108);
    local v112 = nil;
    v112 = if v111 ~= nil then v33(v107, v111) else if typeof(v106.astNode) == "table" then v106.astNode.directives else nil;
    if v112 ~= nil then
        v109 = l_Array_0.filter(v112, function(v113) --[[ Line: 493 ]]
            return v113.name.value ~= "deprecated";
        end);
        if v106.deprecationReason ~= nil then
            v110 = if typeof(l_Array_0.filter(v112, function(v114) --[[ Line: 500 ]]
                return v114.name.value == "deprecated";
            end)) == "table" then l_Array_0.filter(v112, function(v115) --[[ Line: 504 ]]
                return v115.name.value == "deprecated";
            end)[1] else nil;
        end;
    end;
    if v106.deprecationReason ~= nil and v110 == nil then
        v110 = v35(v106.deprecationReason);
    end;
    if v110 == nil then
        return v109;
    else
        return (l_Array_0.concat({
            v110
        }, v109));
    end;
end;
v7.getDeprecatableDirectiveNodes = v116;
v41 = function(v117, v118, v119) --[[ Line: 528 ]] --[[ Name: astFromArg ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_astFromType_0 (copy), l_astFromValue_0 (copy), v116 (copy)
    local l_INPUT_VALUE_DEFINITION_0 = l_Kind_0.INPUT_VALUE_DEFINITION;
    local v121 = if typeof(v117.astNode) == "table" then v117.astNode.description else nil;
    local v122 = if v121 ~= nil then v121 else if l_Boolean_0.toJSBoolean(v117.description) then {
        kind = l_Kind_0.STRING, 
        value = v117.description, 
        block = true
    } else nil;
    return {
        kind = l_INPUT_VALUE_DEFINITION_0, 
        description = v122, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v117.name
        }, 
        type = l_astFromType_0(v117.type), 
        defaultValue = if v117.defaultValue ~= nil then l_astFromValue_0(v117.defaultValue, v117.type) else nil, 
        directives = v116(v117, v118, v119)
    };
end;
v7.astFromArg = v41;
v32 = function(v123, v124, v125) --[[ Line: 566 ]] --[[ Name: astFromObjectType ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v42 (ref), l_Object_0 (copy), l_astFromType_0 (copy), v31 (ref)
    local l_OBJECT_TYPE_DEFINITION_0 = l_Kind_0.OBJECT_TYPE_DEFINITION;
    local v127 = if typeof(v123.astNode) == "table" then v123.astNode.description else nil;
    local v128 = if v127 ~= nil then v127 else if l_Boolean_0.toJSBoolean(v123.description) then {
        kind = l_Kind_0.STRING, 
        value = v123.description, 
        block = true
    } else nil;
    return {
        kind = l_OBJECT_TYPE_DEFINITION_0, 
        description = v128, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v123.name
        }, 
        fields = l_Array_0.map(v123:getFields():values(), function(v129) --[[ Line: 592 ]]
            -- upvalues: v42 (ref), v124 (copy), v125 (copy)
            return v42(v129, v124, v125);
        end), 
        interfaces = l_Array_0.map(l_Object_0.values(v123:getInterfaces()), function(v130) --[[ Line: 596 ]]
            -- upvalues: l_astFromType_0 (ref)
            return (l_astFromType_0(v130));
        end), 
        directives = v31(v123, v124, v125)
    };
end;
v7.astFromObjectType = v32;
v36 = function(v131, v132, v133) --[[ Line: 605 ]] --[[ Name: astFromInterfaceType ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v42 (ref), v31 (ref), l_Object_0 (copy), l_astFromType_0 (copy)
    local l_INTERFACE_TYPE_DEFINITION_0 = l_Kind_0.INTERFACE_TYPE_DEFINITION;
    local v135 = if typeof(v131.astNode) == "table" then v131.astNode.description else nil;
    local v136 = if v135 ~= nil then v135 else if l_Boolean_0.toJSBoolean(v131.description) then {
        kind = l_Kind_0.STRING, 
        value = v131.description, 
        block = true
    } else nil;
    local v138 = {
        kind = l_INTERFACE_TYPE_DEFINITION_0, 
        description = v136, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v131.name
        }, 
        fields = l_Array_0.map(v131:getFields():values(), function(v137) --[[ Line: 631 ]]
            -- upvalues: v42 (ref), v132 (copy), v133 (copy)
            return v42(v137, v132, v133);
        end), 
        directives = v31(v131, v132, v133)
    };
    if v131.getInterfaces ~= nil then
        v138.interfaces = l_Array_0.map(l_Object_0.values(v131:getInterfaces()), function(v139) --[[ Line: 643 ]]
            -- upvalues: l_astFromType_0 (ref)
            return (l_astFromType_0(v139));
        end);
    end;
    return v138;
end;
v7.astFromInterfaceType = v36;
v37 = function(v140, v141, v142) --[[ Line: 653 ]] --[[ Name: astFromUnionType ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), v31 (ref), l_Array_0 (copy), l_astFromType_0 (copy)
    local l_UNION_TYPE_DEFINITION_0 = l_Kind_0.UNION_TYPE_DEFINITION;
    local v144 = if typeof(v140.astNode) == "table" then v140.astNode.description else nil;
    local v145 = if v144 ~= nil then v144 else if l_Boolean_0.toJSBoolean(v140.description) then {
        kind = l_Kind_0.STRING, 
        value = v140.description, 
        block = true
    } else nil;
    return {
        kind = l_UNION_TYPE_DEFINITION_0, 
        description = v145, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v140.name
        }, 
        directives = v31(v140, v141, v142), 
        types = l_Array_0.map(v140:getTypes(), function(v146) --[[ Line: 680 ]]
            -- upvalues: l_astFromType_0 (ref)
            return (l_astFromType_0(v146));
        end)
    };
end;
v7.astFromUnionType = v37;
v38 = function(v147, v148, v149) --[[ Line: 688 ]] --[[ Name: astFromInputObjectType ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v43 (ref), v31 (ref)
    local l_INPUT_OBJECT_TYPE_DEFINITION_0 = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION;
    local v151 = if typeof(v147.astNode) == "table" then v147.astNode.description else nil;
    local v152 = if v151 ~= nil then v151 else if l_Boolean_0.toJSBoolean(v147.description) then {
        kind = l_Kind_0.STRING, 
        value = v147.description, 
        block = true
    } else nil;
    return {
        kind = l_INPUT_OBJECT_TYPE_DEFINITION_0, 
        description = v152, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v147.name
        }, 
        fields = l_Array_0.map(v147:getFields():values(), function(v153) --[[ Line: 714 ]]
            -- upvalues: v43 (ref), v148 (copy), v149 (copy)
            return v43(v153, v148, v149);
        end), 
        directives = v31(v147, v148, v149)
    };
end;
v7.astFromInputObjectType = v38;
v39 = function(v154, v155, v156) --[[ Line: 725 ]] --[[ Name: astFromEnumType ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v34 (ref), v31 (ref)
    local l_ENUM_TYPE_DEFINITION_0 = l_Kind_0.ENUM_TYPE_DEFINITION;
    local v158 = if typeof(v154.astNode) == "table" then v154.astNode.description else nil;
    local v159 = if v158 ~= nil then v158 else if l_Boolean_0.toJSBoolean(v154.description) then {
        kind = l_Kind_0.STRING, 
        value = v154.description, 
        block = true
    } else nil;
    return {
        kind = l_ENUM_TYPE_DEFINITION_0, 
        description = v159, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v154.name
        }, 
        values = l_Array_0.map(l_Object_0.values(v154:getValues()), function(v160) --[[ Line: 749 ]]
            -- upvalues: v34 (ref), v155 (copy), v156 (copy)
            return v34(v160, v155, v156);
        end), 
        directives = v31(v154, v155, v156)
    };
end;
v7.astFromEnumType = v39;
v40 = function(v161, v162, v163) --[[ Line: 759 ]] --[[ Name: astFromScalarType ]]
    -- upvalues: l_getDirectivesInExtensions_0 (copy), l_Boolean_0 (copy), v33 (ref), l_Array_0 (copy), v30 (ref), l_Kind_0 (copy)
    local v164 = l_getDirectivesInExtensions_0(v161, v163);
    local v165 = if l_Boolean_0.toJSBoolean(v164) then v33(v162, v164) else (if typeof(v161.astNode) == "table" then v161.astNode.directives else nil) or {};
    local v166 = l_Boolean_0.toJSBoolean(v161.specifiedByUrl) and v161.specifiedByUrl or v161.specifiedByURL;
    if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v166) then not l_Boolean_0.toJSBoolean(l_Array_0.some(v165, function(v167) --[[ Line: 787 ]]
        return v167.name.value == "specifiedBy";
    end)) else v166) then
        local v168 = {
            url = v166
        };
        table.insert(v165, v30("specifiedBy", v168));
    end;
    local l_SCALAR_TYPE_DEFINITION_0 = l_Kind_0.SCALAR_TYPE_DEFINITION;
    local v170 = if typeof(v161.astNode) == "table" then v161.astNode.description else nil;
    local v171 = if v170 ~= nil then v170 else if l_Boolean_0.toJSBoolean(v161.description) then {
        kind = l_Kind_0.STRING, 
        value = v161.description, 
        block = true
    } else nil;
    return {
        kind = l_SCALAR_TYPE_DEFINITION_0, 
        description = v171, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v161.name
        }, 
        directives = v165
    };
end;
v7.astFromScalarType = v40;
v42 = function(v172, v173, v174) --[[ Line: 817 ]] --[[ Name: astFromField ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v41 (ref), l_astFromType_0 (copy), v116 (copy)
    local l_FIELD_DEFINITION_0 = l_Kind_0.FIELD_DEFINITION;
    local v176 = if typeof(v172.astNode) == "table" then v172.astNode.description else nil;
    local v177 = if v176 ~= nil then v176 else if l_Boolean_0.toJSBoolean(v172.description) then {
        kind = l_Kind_0.STRING, 
        value = v172.description, 
        block = true
    } else nil;
    return {
        kind = l_FIELD_DEFINITION_0, 
        description = v177, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v172.name
        }, 
        arguments = l_Array_0.map(v172.args, function(v178) --[[ Line: 838 ]]
            -- upvalues: v41 (ref), v173 (copy), v174 (copy)
            return v41(v178, v173, v174);
        end), 
        type = l_astFromType_0(v172.type), 
        directives = v116(v172, v173, v174)
    };
end;
v7.astFromField = v42;
v43 = function(v179, v180, v181) --[[ Line: 849 ]] --[[ Name: astFromInputField ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), l_astFromType_0 (copy), v116 (copy), l_astFromValue_0 (copy), l_NULL_0 (copy)
    local l_INPUT_VALUE_DEFINITION_1 = l_Kind_0.INPUT_VALUE_DEFINITION;
    local v183 = if typeof(v179.astNode) == "table" then v179.astNode.description else nil;
    local v184 = if v183 ~= nil then v183 else if l_Boolean_0.toJSBoolean(v179.description) then {
        kind = l_Kind_0.STRING, 
        value = v179.description, 
        block = true
    } else nil;
    local v185 = {
        kind = l_Kind_0.NAME, 
        value = v179.name
    };
    local v186 = l_astFromType_0(v179.type);
    local v187 = v116(v179, v180, v181);
    local v188 = l_astFromValue_0(v179.defaultValue, v179.type);
    local v189 = if v188 ~= nil and v188 ~= l_NULL_0 then v188 else nil;
    return {
        kind = l_INPUT_VALUE_DEFINITION_1, 
        description = v184, 
        name = v185, 
        type = v186, 
        directives = v187, 
        defaultValue = v189
    };
end;
v7.astFromInputField = v43;
v34 = function(v190, v191, v192) --[[ Line: 888 ]] --[[ Name: astFromEnumValue ]]
    -- upvalues: l_Kind_0 (copy), l_Boolean_0 (copy), v116 (copy)
    local l_ENUM_VALUE_DEFINITION_0 = l_Kind_0.ENUM_VALUE_DEFINITION;
    local v194 = if typeof(v190.astNode) == "table" then v190.astNode.description else nil;
    local v195 = if v194 ~= nil then v194 else if l_Boolean_0.toJSBoolean(v190.description) then {
        kind = l_Kind_0.STRING, 
        value = v190.description, 
        block = true
    } else nil;
    return {
        kind = l_ENUM_VALUE_DEFINITION_0, 
        description = v195, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v190.name
        }, 
        directives = v116(v190, v191, v192)
    };
end;
v7.astFromEnumValue = v34;
v35 = function(v196) --[[ Line: 916 ]] --[[ Name: makeDeprecatedDirective ]]
    -- upvalues: v30 (ref), l_GraphQLDeprecatedDirective_0 (copy)
    return v30("deprecated", {
        reason = v196
    }, l_GraphQLDeprecatedDirective_0);
end;
v7.makeDeprecatedDirective = v35;
v30 = function(v197, v198, v199) --[[ Line: 923 ]] --[[ Name: makeDirectiveNode ]]
    -- upvalues: l_astFromValue_0 (copy), l_Boolean_0 (copy), l_Kind_0 (copy), l_astFromValueUntyped_0 (copy)
    local v200 = {};
    if v199 ~= nil then
        for _, v202 in v199.args do
            local l_name_0 = v202.name;
            local v204 = v198[tostring(l_name_0)];
            if v204 ~= nil then
                local v205 = l_astFromValue_0(v204, v202.type);
                if l_Boolean_0.toJSBoolean(v205) then
                    table.insert(v200, {
                        kind = l_Kind_0.ARGUMENT, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = l_name_0
                        }, 
                        value = v205
                    });
                end;
            end;
        end;
    else
        for v206 in v198 do
            local v207 = v198[tostring(v206)];
            local v208 = l_astFromValueUntyped_0(v207);
            if l_Boolean_0.toJSBoolean(v208) then
                table.insert(v200, {
                    kind = l_Kind_0.ARGUMENT, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v206
                    }, 
                    value = v208
                });
            end;
        end;
    end;
    return {
        kind = l_Kind_0.DIRECTIVE, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v197
        }, 
        arguments = v200
    };
end;
v7.makeDirectiveNode = v30;
v33 = function(v209, v210) --[[ Line: 975 ]] --[[ Name: makeDirectiveNodes ]]
    -- upvalues: l_Array_0 (copy), v30 (ref)
    local v211 = {};
    for v212 in v210 do
        local v213 = v210[tostring(v212)];
        local v214 = if typeof(v209) == "table" then v209:getDirective(v212) else nil;
        if l_Array_0.isArray(v213) and #v213 ~= 0 then
            for _, v216 in v213 do
                table.insert(v211, v30(v212, v216, v214));
            end;
        else
            table.insert(v211, v30(v212, v213, v214));
        end;
    end;
    return v211;
end;
v7.makeDirectiveNodes = v33;
return v7;