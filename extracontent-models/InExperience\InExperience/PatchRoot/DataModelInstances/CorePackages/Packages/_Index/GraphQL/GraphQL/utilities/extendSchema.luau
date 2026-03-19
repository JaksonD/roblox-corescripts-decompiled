local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_coerceToMap_0 = v2.coerceToMap;
local l_mapValueOrdered_0 = require(l_Parent_0.luaUtils.mapValueOrdered).mapValueOrdered;
local _ = require(l_Parent_0.luaUtils.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local _ = require(l_jsutils_0.ObjMap);
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v17 = require(l_Parent_0.language.predicates);
local l_isTypeDefinitionNode_0 = v17.isTypeDefinitionNode;
local l_isTypeExtensionNode_0 = v17.isTypeExtensionNode;
local l_assertValidSDLExtension_0 = require(l_Parent_0.validation.validate).assertValidSDLExtension;
local l_getDirectiveValues_0 = require(l_Parent_0.execution.values).getDirectiveValues;
local l_type_0 = l_Parent_0.type;
local v23 = require(l_type_0.schema);
local l_assertSchema_0 = v23.assertSchema;
local l_GraphQLSchema_0 = v23.GraphQLSchema;
local v26 = require(l_type_0.scalars);
local l_specifiedScalarTypes_0 = v26.specifiedScalarTypes;
local l_isSpecifiedScalarType_0 = v26.isSpecifiedScalarType;
local v29 = require(l_type_0.introspection);
local l_introspectionTypes_0 = v29.introspectionTypes;
local l_isIntrospectionType_0 = v29.isIntrospectionType;
local v32 = require(l_type_0.directives);
local l_GraphQLDirective_0 = v32.GraphQLDirective;
local l_GraphQLDeprecatedDirective_0 = v32.GraphQLDeprecatedDirective;
local l_GraphQLSpecifiedByDirective_0 = v32.GraphQLSpecifiedByDirective;
local v36 = require(l_type_0.definition);
local l_isScalarType_0 = v36.isScalarType;
local l_isObjectType_0 = v36.isObjectType;
local l_isInterfaceType_0 = v36.isInterfaceType;
local l_isUnionType_0 = v36.isUnionType;
local l_isListType_0 = v36.isListType;
local l_isNonNullType_0 = v36.isNonNullType;
local l_isEnumType_0 = v36.isEnumType;
local l_isInputObjectType_0 = v36.isInputObjectType;
local l_GraphQLList_0 = v36.GraphQLList;
local l_GraphQLNonNull_0 = v36.GraphQLNonNull;
local l_GraphQLScalarType_0 = v36.GraphQLScalarType;
local l_GraphQLObjectType_0 = v36.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v36.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v36.GraphQLUnionType;
local l_GraphQLEnumType_0 = v36.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v36.GraphQLInputObjectType;
local l_valueFromAST_0 = require(script.Parent.valueFromAST).valueFromAST;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local function v62(v57, v58, v59) --[[ Line: 152 ]] --[[ Name: extendSchema ]]
    -- upvalues: l_assertSchema_0 (copy), l_devAssert_0 (copy), l_Kind_0 (copy), l_assertValidSDLExtension_0 (copy), l_GraphQLSchema_0 (copy)
    l_assertSchema_0(v57);
    local l_l_devAssert_0_0 = l_devAssert_0;
    local v61 = false;
    if v58 ~= nil then
        v61 = v58.kind == l_Kind_0.DOCUMENT;
    end;
    l_l_devAssert_0_0(v61, "Must provide valid Document AST.");
    if (v59 and v59.assumeValid) ~= true and (v59 and v59.assumeValidSDL) ~= true then
        l_assertValidSDLExtension_0(v58, v57);
    end;
    l_l_devAssert_0_0 = v57:toConfig();
    v61 = extendSchemaImpl(l_l_devAssert_0_0, v58, v59);
    if l_l_devAssert_0_0 == v61 then
        return v57;
    else
        return (l_GraphQLSchema_0.new(v61));
    end;
end;
extendSchemaImpl = function(v63, v64, v65) --[[ Line: 175 ]] --[[ Name: extendSchemaImpl ]]
    -- upvalues: l_Map_0 (copy), l_Kind_0 (copy), l_isTypeDefinitionNode_0 (copy), l_isTypeExtensionNode_0 (copy), l_Array_0 (copy), l_isListType_0 (copy), l_GraphQLList_0 (copy), l_isNonNullType_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLDirective_0 (copy), l_Object_0 (copy), l_mapValueOrdered_0 (copy), l_coerceToMap_0 (copy), l_isIntrospectionType_0 (copy), l_isSpecifiedScalarType_0 (copy), l_isScalarType_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), l_isInputObjectType_0 (copy), l_inspect_0 (copy), l_GraphQLInputObjectType_0 (copy), l_GraphQLEnumType_0 (copy), v56 (ref), l_GraphQLScalarType_0 (copy), l_GraphQLObjectType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_GraphQLUnionType_0 (copy), v54 (ref), l_Error_0 (copy), v55 (ref), l_valueFromAST_0 (copy)
    local v66 = {};
    local v67 = l_Map_0.new();
    local v68 = {};
    local v69 = nil;
    local v70 = {};
    for _, v72 in ipairs(v64.definitions) do
        if v72.kind == l_Kind_0.SCHEMA_DEFINITION then
            v69 = v72;
        elseif v72.kind == l_Kind_0.SCHEMA_EXTENSION then
            table.insert(v70, v72);
        elseif l_isTypeDefinitionNode_0(v72) then
            table.insert(v66, v72);
        elseif l_isTypeExtensionNode_0(v72) then
            local l_value_0 = v72.name.value;
            local v74 = v67:get(l_value_0);
            v67:set(l_value_0, if v74 then l_Array_0.concat(v74, {
                v72
            }) else {
                v72
            });
        elseif v72.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            table.insert(v68, v72);
        end;
    end;
    if #v67:keys() == 0 and #v66 == 0 and #v68 == 0 and #v70 == 0 and v69 == nil then
        return v63;
    else
        local v75 = l_Map_0.new();
        local v76 = nil;
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = nil;
        local v86 = nil;
        local v87 = nil;
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local v91 = nil;
        local function v92(v93) --[[ Line: 279 ]] --[[ Name: replaceType ]]
            -- upvalues: l_isListType_0 (ref), l_GraphQLList_0 (ref), v92 (copy), l_isNonNullType_0 (ref), l_GraphQLNonNull_0 (ref), v76 (ref)
            if l_isListType_0(v93) then
                return l_GraphQLList_0.new(v92(v93.ofType));
            elseif l_isNonNullType_0(v93) then
                return l_GraphQLNonNull_0.new(v92(v93.ofType));
            else
                return v76(v93);
            end;
        end;
        v76 = function(v94) --[[ Line: 291 ]] --[[ Name: replaceNamedType ]]
            -- upvalues: v75 (copy)
            return v75:get(v94.name);
        end;
        local function v97(v95) --[[ Line: 299 ]] --[[ Name: replaceDirective ]]
            -- upvalues: l_GraphQLDirective_0 (ref), l_Object_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v77 (ref)
            local v96 = v95:toConfig();
            return l_GraphQLDirective_0.new(l_Object_0.assign({}, v96, {
                args = l_mapValueOrdered_0(l_coerceToMap_0(v96.args), v77)
            }));
        end;
        local function v99(v98) --[[ Line: 310 ]] --[[ Name: extendNamedType ]]
            -- upvalues: l_isIntrospectionType_0 (ref), l_isSpecifiedScalarType_0 (ref), l_isScalarType_0 (ref), v79 (ref), l_isObjectType_0 (ref), v80 (ref), l_isInterfaceType_0 (ref), v81 (ref), l_isUnionType_0 (ref), v82 (ref), l_isEnumType_0 (ref), v83 (ref), l_isInputObjectType_0 (ref), v84 (ref), l_inspect_0 (ref)
            if l_isIntrospectionType_0(v98) or l_isSpecifiedScalarType_0(v98) then
                return v98;
            elseif l_isScalarType_0(v98) then
                return v79(v98);
            elseif l_isObjectType_0(v98) then
                return v80(v98);
            elseif l_isInterfaceType_0(v98) then
                return v81(v98);
            elseif l_isUnionType_0(v98) then
                return v82(v98);
            elseif l_isEnumType_0(v98) then
                return v83(v98);
            elseif l_isInputObjectType_0(v98) then
                return v84(v98);
            else
                assert(false, "Unexpected type: " .. l_inspect_0(v98));
                return;
            end;
        end;
        v84 = function(v100) --[[ Line: 341 ]] --[[ Name: extendInputObjectType ]]
            -- upvalues: v67 (copy), l_GraphQLInputObjectType_0 (ref), l_Object_0 (ref), l_Map_0 (ref), l_Array_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v92 (copy), v85 (ref)
            local v101 = v100:toConfig();
            local v102 = v67[v101.name] or {};
            return l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v101, {
                fields = function() --[[ Line: 347 ]] --[[ Name: fields ]]
                    -- upvalues: l_Map_0 (ref), l_Array_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v101 (copy), l_Object_0 (ref), v92 (ref), v85 (ref), v102 (copy)
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v101.fields), function(v103) --[[ Line: 349 ]]
                        -- upvalues: l_Object_0 (ref), v92 (ref)
                        return l_Object_0.assign({}, v103, {
                            type = v92(v103.type)
                        });
                    end):entries(), v85(v102):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v101.extensionASTNodes, v102)
            }));
        end;
        v83 = function(v104) --[[ Line: 360 ]] --[[ Name: extendEnumType ]]
            -- upvalues: v67 (copy), l_GraphQLEnumType_0 (ref), l_Object_0 (ref), l_Map_0 (ref), l_Array_0 (ref), v86 (ref)
            local v105 = v104:toConfig();
            local v106 = v67:get(v104.name) or {};
            return l_GraphQLEnumType_0.new(l_Object_0.assign({}, v105, {
                values = l_Map_0.new(l_Array_0.concat(v105.values:entries(), v86(v106):entries())), 
                extensionASTNodes = l_Array_0.concat(v105.extensionASTNodes, v106)
            }));
        end;
        v79 = function(v107) --[[ Line: 378 ]] --[[ Name: extendScalarType ]]
            -- upvalues: v67 (copy), v56 (ref), l_GraphQLScalarType_0 (ref), l_Object_0 (ref), l_Array_0 (ref)
            local v108 = v107:toConfig();
            local v109 = v67:get(v108.name) or {};
            local l_specifiedByUrl_0 = v108.specifiedByUrl;
            for _, v112 in ipairs(v109) do
                l_specifiedByUrl_0 = v56(v112) or l_specifiedByUrl_0;
            end;
            return l_GraphQLScalarType_0.new(l_Object_0.assign({}, v108, {
                specifiedByUrl = l_specifiedByUrl_0, 
                extensionASTNodes = l_Array_0.concat(v108.extensionASTNodes, v109)
            }));
        end;
        v80 = function(v113) --[[ Line: 394 ]] --[[ Name: extendObjectType ]]
            -- upvalues: v67 (copy), l_GraphQLObjectType_0 (ref), l_Object_0 (ref), l_Array_0 (ref), v76 (ref), v87 (ref), l_Map_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v78 (ref), v91 (ref)
            local v114 = v113:toConfig();
            local v115 = v67:get(v114.name) or {};
            return l_GraphQLObjectType_0.new(l_Object_0.assign({}, v114, {
                interfaces = function() --[[ Line: 400 ]] --[[ Name: interfaces ]]
                    -- upvalues: l_Array_0 (ref), v113 (copy), v76 (ref), v87 (ref), v115 (copy)
                    return l_Array_0.concat(l_Array_0.map(v113:getInterfaces(), v76), v87(v115));
                end, 
                fields = function() --[[ Line: 407 ]] --[[ Name: fields ]]
                    -- upvalues: l_Map_0 (ref), l_Array_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v114 (copy), v78 (ref), v91 (ref), v115 (copy)
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v114.fields), v78):entries(), v91(v115):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v114.extensionASTNodes, v115)
            }));
        end;
        v81 = function(v116) --[[ Line: 419 ]] --[[ Name: extendInterfaceType ]]
            -- upvalues: v67 (copy), l_GraphQLInterfaceType_0 (ref), l_Object_0 (ref), l_Array_0 (ref), v76 (ref), v87 (ref), l_Map_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v78 (ref), v91 (ref)
            local v117 = v116:toConfig();
            local v118 = v67:get(v117.name) or {};
            return l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v117, {
                interfaces = function() --[[ Line: 425 ]] --[[ Name: interfaces ]]
                    -- upvalues: l_Array_0 (ref), v116 (copy), v76 (ref), v87 (ref), v118 (copy)
                    return l_Array_0.concat(l_Array_0.map(v116:getInterfaces(), v76), v87(v118));
                end, 
                fields = function() --[[ Line: 432 ]] --[[ Name: fields ]]
                    -- upvalues: l_Map_0 (ref), l_Array_0 (ref), l_mapValueOrdered_0 (ref), l_coerceToMap_0 (ref), v117 (copy), v78 (ref), v91 (ref), v118 (copy)
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v117.fields), v78):entries(), v91(v118):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v117.extensionASTNodes, v118)
            }));
        end;
        v82 = function(v119) --[[ Line: 444 ]] --[[ Name: extendUnionType ]]
            -- upvalues: v67 (copy), l_GraphQLUnionType_0 (ref), l_Object_0 (ref), l_Array_0 (ref), v76 (ref), v88 (ref)
            local v120 = v119:toConfig();
            local v121 = v67:get(v120.name) or {};
            return l_GraphQLUnionType_0.new(l_Object_0.assign({}, v120, {
                types = function() --[[ Line: 450 ]] --[[ Name: types ]]
                    -- upvalues: l_Array_0 (ref), v119 (copy), v76 (ref), v88 (ref), v121 (copy)
                    return l_Array_0.concat(l_Array_0.map(v119:getTypes(), v76), v88(v121));
                end, 
                extensionASTNodes = l_Array_0.concat(v120.extensionASTNodes, v121)
            }));
        end;
        v78 = function(v122) --[[ Line: 461 ]] --[[ Name: extendField ]]
            -- upvalues: l_Object_0 (ref), v92 (copy), l_mapValueOrdered_0 (ref), v77 (ref)
            return l_Object_0.assign({}, v122, {
                type = v92(v122.type), 
                args = if v122.args then l_mapValueOrdered_0(v122.args, v77) else nil
            });
        end;
        v77 = function(v123) --[[ Line: 469 ]] --[[ Name: extendArg ]]
            -- upvalues: l_Object_0 (ref), v92 (copy)
            return l_Object_0.assign({}, v123, {
                type = v92(v123.type)
            });
        end;
        local function v131(v124) --[[ Line: 473 ]] --[[ Name: getOperationTypes ]]
            -- upvalues: v89 (ref)
            local v125 = {};
            for _, v127 in ipairs(v124) do
                local v128 = v127.operationTypes or {};
                for _, v130 in ipairs(v128) do
                    v125[v130.operation] = v89(v130.type);
                end;
            end;
            return v125;
        end;
        v89 = function(v132) --[[ Line: 496 ]] --[[ Name: getNamedType ]]
            -- upvalues: v54 (ref), v75 (copy), l_Error_0 (ref)
            local l_value_1 = v132.name.value;
            local v134 = v54[l_value_1] or v75[l_value_1];
            if v134 == nil then
                error(l_Error_0.new(("Unknown type: \"%s\"."):format(l_value_1)));
            end;
            return v134;
        end;
        local function v135(v136) --[[ Line: 508 ]] --[[ Name: getWrappedType ]]
            -- upvalues: l_Kind_0 (ref), l_GraphQLList_0 (ref), v135 (copy), l_GraphQLNonNull_0 (ref), v89 (ref)
            if v136.kind == l_Kind_0.LIST_TYPE then
                return l_GraphQLList_0.new(v135(v136.type));
            elseif v136.kind == l_Kind_0.NON_NULL_TYPE then
                return l_GraphQLNonNull_0.new(v135(v136.type));
            else
                return v89(v136);
            end;
        end;
        local function v140(v137) --[[ Line: 519 ]] --[[ Name: buildDirective ]]
            -- upvalues: l_Array_0 (ref), l_GraphQLDirective_0 (ref), v90 (ref)
            local v139 = l_Array_0.map(v137.locations, function(v138) --[[ Line: 520 ]]
                return v138.value;
            end);
            return l_GraphQLDirective_0.new({
                name = v137.name.value, 
                description = if v137.description then v137.description.value else nil, 
                locations = v139, 
                isRepeatable = v137.repeatable, 
                args = v90(v137.arguments), 
                astNode = v137
            });
        end;
        v91 = function(v141) --[[ Line: 537 ]] --[[ Name: buildFieldMap ]]
            -- upvalues: l_Map_0 (ref), v135 (copy), v90 (ref), v55 (ref)
            local v142 = l_Map_0.new();
            for _, v144 in ipairs(v141) do
                local v145 = if v144.fields then v144.fields else {};
                for _, v147 in ipairs(v145) do
                    v142:set(v147.name.value, {
                        type = v135(v147.type), 
                        description = if v147.description then v147.description.value else nil, 
                        args = v90(v147.arguments), 
                        deprecationReason = v55(v147), 
                        astNode = v147
                    });
                end;
            end;
            return v142;
        end;
        v90 = function(v148) --[[ Line: 565 ]] --[[ Name: buildArgumentMap ]]
            -- upvalues: l_Map_0 (ref), v135 (copy), l_valueFromAST_0 (ref), v55 (ref)
            local v149 = v148 or {};
            local v150 = l_Map_0.new();
            for _, v152 in ipairs(v149) do
                local v153 = v135(v152.type);
                v150:set(v152.name.value, {
                    type = v153, 
                    description = if v152.description then v152.description.value else nil, 
                    defaultValue = l_valueFromAST_0(v152.defaultValue, v153), 
                    deprecationReason = v55(v152), 
                    astNode = v152
                });
            end;
            return v150;
        end;
        v85 = function(v154) --[[ Line: 589 ]] --[[ Name: buildInputFieldMap ]]
            -- upvalues: l_Map_0 (ref), v135 (copy), l_valueFromAST_0 (ref), v55 (ref)
            local v155 = l_Map_0.new();
            for _, v157 in ipairs(v154) do
                local v158 = if v157.fields then v157.fields else {};
                for _, v160 in ipairs(v158) do
                    local v161 = v135(v160.type);
                    v155:set(v160.name.value, {
                        type = v161, 
                        description = if v160.description then v160.description.value else nil, 
                        defaultValue = l_valueFromAST_0(v160.defaultValue, v161), 
                        deprecationReason = v55(v160), 
                        astNode = v160
                    });
                end;
            end;
            return v155;
        end;
        v86 = function(v162) --[[ Line: 621 ]] --[[ Name: buildEnumValueMap ]]
            -- upvalues: l_Map_0 (ref), v55 (ref)
            local v163 = l_Map_0.new();
            for _, v165 in ipairs(v162) do
                local v166 = if v165.values then v165.values else {};
                for _, v168 in ipairs(v166) do
                    v163:set(v168.name.value, {
                        description = if v168.description then v168.description.value else nil, 
                        deprecationReason = v55(v168), 
                        astNode = v168
                    });
                end;
            end;
            return v163;
        end;
        v87 = function(v169) --[[ Line: 644 ]] --[[ Name: buildInterfaces ]]
            -- upvalues: v89 (ref)
            local v170 = {};
            for _, v172 in ipairs(v169) do
                if v172.interfaces then
                    for _, v174 in ipairs(v172.interfaces) do
                        table.insert(v170, (v89(v174)));
                    end;
                end;
            end;
            return v170;
        end;
        v88 = function(v175) --[[ Line: 670 ]] --[[ Name: buildUnionTypes ]]
            -- upvalues: v89 (ref)
            local v176 = {};
            for _, v178 in ipairs(v175) do
                if v178.types then
                    for _, v180 in ipairs(v178.types) do
                        table.insert(v176, (v89(v180)));
                    end;
                end;
            end;
            return v176;
        end;
        local function v190(v181) --[[ Line: 691 ]] --[[ Name: buildType ]]
            -- upvalues: v67 (copy), l_Kind_0 (ref), l_Array_0 (ref), l_GraphQLObjectType_0 (ref), v87 (ref), v91 (ref), l_GraphQLInterfaceType_0 (ref), l_GraphQLEnumType_0 (ref), v86 (ref), l_GraphQLUnionType_0 (ref), v88 (ref), l_GraphQLScalarType_0 (ref), v56 (ref), l_GraphQLInputObjectType_0 (ref), v85 (ref), l_inspect_0 (ref)
            local l_value_2 = v181.name.value;
            local v183 = v67[l_value_2] or {};
            local l_kind_0 = v181.kind;
            if l_kind_0 == l_Kind_0.OBJECT_TYPE_DEFINITION then
                local v185 = l_Array_0.concat(v181, v183);
                return l_GraphQLObjectType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    interfaces = function() --[[ Line: 704 ]] --[[ Name: interfaces ]]
                        -- upvalues: v87 (ref), v185 (copy)
                        return v87(v185);
                    end, 
                    fields = function() --[[ Line: 707 ]] --[[ Name: fields ]]
                        -- upvalues: v91 (ref), v185 (copy)
                        return v91(v185);
                    end, 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            elseif l_kind_0 == l_Kind_0.INTERFACE_TYPE_DEFINITION then
                local v186 = l_Array_0.concat(v181, v183);
                return l_GraphQLInterfaceType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    interfaces = function() --[[ Line: 724 ]] --[[ Name: interfaces ]]
                        -- upvalues: v87 (ref), v186 (copy)
                        return v87(v186);
                    end, 
                    fields = function() --[[ Line: 727 ]] --[[ Name: fields ]]
                        -- upvalues: v91 (ref), v186 (copy)
                        return v91(v186);
                    end, 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            elseif l_kind_0 == l_Kind_0.ENUM_TYPE_DEFINITION then
                local v187 = l_Array_0.concat(v181, v183);
                return l_GraphQLEnumType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    values = v86(v187), 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            elseif l_kind_0 == l_Kind_0.UNION_TYPE_DEFINITION then
                local v188 = l_Array_0.concat(v181, v183);
                return l_GraphQLUnionType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    types = function() --[[ Line: 750 ]] --[[ Name: types ]]
                        -- upvalues: v88 (ref), v188 (copy)
                        return v88(v188);
                    end, 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            elseif l_kind_0 == l_Kind_0.SCALAR_TYPE_DEFINITION then
                return l_GraphQLScalarType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    specifiedByUrl = v56(v181), 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            elseif l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION then
                local v189 = l_Array_0.concat(v181, v183);
                return l_GraphQLInputObjectType_0.new({
                    name = l_value_2, 
                    description = if v181.description then v181.description.value else nil, 
                    fields = function() --[[ Line: 773 ]] --[[ Name: fields ]]
                        -- upvalues: v85 (ref), v189 (copy)
                        return v85(v189);
                    end, 
                    astNode = v181, 
                    extensionASTNodes = v183
                });
            else
                assert(false, "Unexpected type definition node: " .. l_inspect_0(v181));
                return;
            end;
        end;
        for _, v192 in ipairs(v63.types) do
            v75:set(v192.name, v99(v192));
        end;
        for _, v194 in ipairs(v66) do
            local l_value_3 = v194.name.value;
            v75:set(l_value_3, v54[l_value_3] or v190(v194));
        end;
        local v196 = l_Object_0.assign({}, {
            query = v63.query and v76(v63.query), 
            mutation = v63.mutation and v76(v63.mutation), 
            subscription = v63.subscription and v76(v63.subscription)
        }, v69 and v131({
            v69
        }) or {}, (v131(v70)));
        local v197 = nil;
        if v69 ~= nil and v69.description ~= nil then
            v197 = v69.description.value;
        end;
        local v198 = false;
        if v65 ~= nil and v65.assumeValid ~= nil then
            v198 = v65.assumeValid;
        end;
        local v199 = l_Object_0.assign({}, {
            description = v197
        }, v196, {
            types = v75:values(), 
            directives = l_Array_0.concat(l_Array_0.map(v63.directives, v97), l_Array_0.map(v68, v140)), 
            astNode = v69 or v63.astNode, 
            extensionASTNodes = l_Array_0.concat(v63.extensionASTNodes, v70), 
            assumeValid = v198
        });
        v199.extensions = nil;
        return v199;
    end;
end;
v54 = l_keyMap_0(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0), function(v200) --[[ Line: 846 ]]
    return v200.name;
end);
v55 = function(v201) --[[ Line: 854 ]] --[[ Name: getDeprecationReason ]]
    -- upvalues: l_getDirectiveValues_0 (copy), l_GraphQLDeprecatedDirective_0 (copy)
    local v202 = l_getDirectiveValues_0(l_GraphQLDeprecatedDirective_0, v201);
    return v202 and v202.reason;
end;
v56 = function(v203) --[[ Line: 864 ]] --[[ Name: getSpecifiedByUrl ]]
    -- upvalues: l_getDirectiveValues_0 (copy), l_GraphQLSpecifiedByDirective_0 (copy)
    local v204 = l_getDirectiveValues_0(l_GraphQLSpecifiedByDirective_0, v203);
    return v204 and v204.url;
end;
return {
    extendSchema = v62, 
    extendSchemaImpl = extendSchemaImpl
};