local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.GraphQL);
local l_GraphQLObjectType_0 = v6.GraphQLObjectType;
local l_GraphQLSchema_0 = v6.GraphQLSchema;
local l_isInterfaceType_0 = v6.isInterfaceType;
local l_isEnumType_0 = v6.isEnumType;
local l_isObjectType_0 = v6.isObjectType;
local l_isScalarType_0 = v6.isScalarType;
local l_isUnionType_0 = v6.isUnionType;
local l_isInputObjectType_0 = v6.isInputObjectType;
local l_GraphQLInputObjectType_0 = v6.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v6.GraphQLInterfaceType;
local l_isLeafType_0 = v6.isLeafType;
local l_isListType_0 = v6.isListType;
local l_isNonNullType_0 = v6.isNonNullType;
local l_isNamedType_0 = v6.isNamedType;
local l_GraphQLList_0 = v6.GraphQLList;
local l_GraphQLNonNull_0 = v6.GraphQLNonNull;
local l_GraphQLEnumType_0 = v6.GraphQLEnumType;
local l_Kind_0 = v6.Kind;
local l_getObjectTypeFromTypeMap_0 = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap;
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
local l_rewireTypes_0 = require(script.Parent.rewire).rewireTypes;
local v28 = require(script.Parent.transformInputValue);
local l_serializeInputValue_0 = v28.serializeInputValue;
local l_parseInputValue_0 = v28.parseInputValue;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
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
local v44 = nil;
local v45 = nil;
v5.mapSchema = function(v46, v47) --[[ Line: 172 ]] --[[ Name: mapSchema ]]
    -- upvalues: v34 (ref), v35 (ref), v33 (ref), v36 (ref), v37 (ref), l_serializeInputValue_0 (copy), l_isLeafType_0 (copy), l_parseInputValue_0 (copy), l_Boolean_0 (copy), v40 (ref), l_rewireTypes_0 (copy), l_GraphQLSchema_0 (copy), l_Object_0 (copy), l_getObjectTypeFromTypeMap_0 (copy)
    local v48 = if v47 ~= nil then v47 else {};
    local v51 = v34(v35(v33(v36(v37(v33(v36(v46:getTypeMap(), v46, l_serializeInputValue_0), v46, v48, function(v49) --[[ Line: 183 ]]
        -- upvalues: l_isLeafType_0 (ref)
        return l_isLeafType_0(v49);
    end), v46, v48), v46, l_parseInputValue_0), v46, v48, function(v50) --[[ Line: 195 ]]
        -- upvalues: l_Boolean_0 (ref), l_isLeafType_0 (ref)
        return not l_Boolean_0.toJSBoolean(l_isLeafType_0(v50));
    end), v46, v48), v46, v48);
    local v52 = v46:getDirectives();
    local v53 = v40(v52, v46, v48);
    local v54 = l_rewireTypes_0(v51, v53);
    local l_typeMap_0 = v54.typeMap;
    local l_directives_0 = v54.directives;
    return l_GraphQLSchema_0.new(l_Object_0.assign({}, v46:toConfig(), {
        query = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getQueryType())) or l_Object_0.None, 
        mutation = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getMutationType())) or l_Object_0.None, 
        subscription = l_getObjectTypeFromTypeMap_0(l_typeMap_0, l_getObjectTypeFromTypeMap_0(v51, v46:getSubscriptionType())) or l_Object_0.None, 
        types = l_typeMap_0:values() or l_Object_0.None, 
        directives = l_directives_0 or l_Object_0.None
    }));
end;
v33 = function(v57, v58, v59, v60) --[[ Line: 241 ]] --[[ Name: mapTypes ]]
    -- upvalues: l_Map_0 (copy), l_String_0 (copy), l_Object_0 (copy), v42 (ref)
    local v61 = if v60 ~= nil then v60 else function() --[[ Line: 256 ]]
        return true;
    end;
    local v62 = l_Map_0.new();
    for _, v64 in v57 do
        local v65 = table.unpack(v64);
        if not l_String_0.startsWith(v65, "__") then
            local v66 = v57:get(v65);
            if v66 == nil or v66 == l_Object_0.None or not v61(v66) then
                v62:set(v65, v66);
            else
                local v67 = v42(v58, v59, v65);
                if v67 == nil or v67 == l_Object_0.None then
                    v62:set(v65, v66);
                else
                    local v68 = v67(v66, v58);
                    if v68 == nil then
                        v62:set(v65, v66);
                    else
                        v62:set(v65, v68);
                    end;
                end;
            end;
        end;
    end;
    return v62;
end;
v37 = function(v69, v70, v71) --[[ Line: 313 ]] --[[ Name: mapEnumValues ]]
    -- upvalues: v38 (ref), l_Boolean_0 (copy), v33 (ref), l_MapperKind_0 (copy), l_Map_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v45 (ref), l_GraphQLEnumType_0 (copy), l_isEnumType_0 (copy)
    local v72 = v38(v71);
    if not l_Boolean_0.toJSBoolean(v72) then
        return v69;
    else
        return v33(v69, v70, {
            [tostring(l_MapperKind_0.ENUM_TYPE)] = function(v73) --[[ Line: 337 ]]
                -- upvalues: l_Map_0 (ref), v72 (copy), v70 (copy), l_Boolean_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v45 (ref), l_GraphQLEnumType_0 (ref)
                local v74 = v73:toConfig();
                local l_values_0 = v74.values;
                local v76 = l_Map_0.new();
                for _, v78 in l_values_0 do
                    local v79 = table.unpack(v78);
                    local v80 = l_values_0:get(v79);
                    local v81 = v72(v80, v73.name, v70, v79);
                    if v81 == nil then
                        v76:set(v79, v80);
                    elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v81)) then
                        local v82, v83 = table.unpack(v81, 1, 2);
                        v76:set(v82, if v83 == nil then v80 else v83);
                    elseif v81 ~= l_Object_0.None then
                        v76:set(v79, v81);
                    end;
                end;
                return (v45(l_GraphQLEnumType_0.new(l_Object_0.assign({}, v74, {
                    values = v76
                }))));
            end
        }, function(v84) --[[ Line: 391 ]]
            -- upvalues: l_isEnumType_0 (ref)
            return l_isEnumType_0(v84);
        end);
    end;
end;
v36 = function(v85, v86, v87) --[[ Line: 399 ]] --[[ Name: mapDefaultValues ]]
    -- upvalues: v34 (ref), l_MapperKind_0 (copy), v44 (ref), l_Object_0 (copy), v35 (ref)
    local v90 = v34(v85, v86, {
        [l_MapperKind_0.ARGUMENT] = function(v88) --[[ Line: 421 ]]
            -- upvalues: v44 (ref), v85 (copy), l_Object_0 (ref), v87 (copy)
            if v88.defaultValue == nil then
                return v88;
            else
                local v89 = v44(v85, v88.type);
                if v89 ~= nil then
                    return l_Object_0.assign({}, v88, {
                        defaultValue = v87(v89, v88.defaultValue)
                    });
                else
                    return nil;
                end;
            end;
        end
    });
    return v35(v90, v86, {
        [l_MapperKind_0.INPUT_OBJECT_FIELD] = function(v91) --[[ Line: 456 ]]
            -- upvalues: v44 (ref), v90 (copy), l_Object_0 (ref), v87 (copy)
            if v91.defaultValue == nil then
                return v91;
            else
                local v92 = v44(v90, v91.type);
                if v92 ~= nil then
                    return l_Object_0.assign({}, v91, {
                        defaultValue = v87(v92, v91.defaultValue)
                    });
                else
                    return nil;
                end;
            end;
        end
    });
end;
v44 = function(v93, v94) --[[ Line: 487 ]] --[[ Name: getNewType ]]
    -- upvalues: l_Boolean_0 (copy), l_isListType_0 (copy), v44 (ref), l_GraphQLList_0 (copy), l_isNonNullType_0 (copy), l_GraphQLNonNull_0 (copy), l_isNamedType_0 (copy)
    if l_Boolean_0.toJSBoolean(l_isListType_0(v94)) then
        local v95 = v44(v93, v94.ofType);
        if v95 ~= nil then
            return (l_GraphQLList_0.new(v95));
        else
            return nil;
        end;
    elseif l_Boolean_0.toJSBoolean(l_isNonNullType_0(v94)) then
        local v96 = v44(v93, v94.ofType);
        if v96 ~= nil then
            return (l_GraphQLNonNull_0.new(v96));
        else
            return nil;
        end;
    elseif l_Boolean_0.toJSBoolean(l_isNamedType_0(v94)) then
        local v97 = v93:get(v94.name);
        if v97 ~= nil then
            return v97;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v35 = function(v98, v99, v100) --[[ Line: 521 ]] --[[ Name: mapFields ]]
    -- upvalues: l_Map_0 (copy), l_String_0 (copy), l_Boolean_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isInputObjectType_0 (copy), v41 (ref), l_Object_0 (copy), l_Array_0 (copy), v45 (ref), l_GraphQLObjectType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_GraphQLInputObjectType_0 (copy)
    local v101 = l_Map_0.new();
    for _, v103 in v98 do
        local v104 = table.unpack(v103);
        if not l_String_0.startsWith(v104, "__") then
            local v105 = v98:get(v104);
            if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v105)) and not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v105)) and not l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v105)) then
                v101:set(v104, v105);
            else
                local v106 = v41(v99, v100, v104);
                if v106 == nil or v106 == l_Object_0.None then
                    v101:set(v104, v105);
                else
                    local v107 = v105:toConfig();
                    local l_fields_0 = v107.fields;
                    local v109 = l_Map_0.new();
                    for _, v111 in l_fields_0 do
                        local v112 = table.unpack(v111);
                        local v113 = l_fields_0:get(v112);
                        local v114 = v106(v113, v112, v104, v99);
                        if v114 == nil then
                            v109:set(v112, v113);
                        elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v114)) then
                            local v115, v116 = table.unpack(v114, 1, 2);
                            if v116.astNode ~= nil and v116.astNode ~= l_Object_0.None then
                                v116.astNode = l_Object_0.assign({}, v116.astNode, {
                                    name = l_Object_0.assign({}, v116.astNode.name, {
                                        value = v115
                                    })
                                });
                            end;
                            v109:set(v115, if v116 == nil then v113 else v116);
                        elseif v114 ~= l_Object_0.None then
                            v109:set(v112, v114);
                        end;
                    end;
                    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v105)) then
                        v101:set(v104, (v45(l_GraphQLObjectType_0.new(l_Object_0.assign({}, v107, {
                            fields = v109
                        })))));
                    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v105)) then
                        v101:set(v104, (v45(l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v107, {
                            fields = v109
                        })))));
                    else
                        v101:set(v104, (v45(l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v107, {
                            fields = v109
                        })))));
                    end;
                end;
            end;
        end;
    end;
    return v101;
end;
v34 = function(v117, v118, v119) --[[ Line: 688 ]] --[[ Name: mapArguments ]]
    -- upvalues: l_Map_0 (copy), l_String_0 (copy), l_Boolean_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), v43 (ref), l_Object_0 (copy), l_Array_0 (copy), l_GraphQLObjectType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_GraphQLInputObjectType_0 (copy)
    local v120 = l_Map_0.new();
    for _, v122 in v117 do
        local v123 = table.unpack(v122);
        if not l_String_0.startsWith(v123, "__") then
            local v124 = v117:get(v123);
            if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v124)) and not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v124)) then
                v120:set(v123, v124);
            else
                local v125 = v43(v119);
                if v125 == nil or v125 == l_Object_0.None then
                    v120:set(v123, v124);
                else
                    local v126 = v124:toConfig();
                    local l_fields_1 = v126.fields;
                    local v128 = l_Map_0.new();
                    for _, v130 in l_fields_1 do
                        local v131 = table.unpack(v130);
                        local v132 = l_fields_1:get(v131);
                        local l_args_0 = v132.args;
                        if l_args_0 == nil or l_args_0 == l_Object_0.None then
                            v128:set(v131, v132);
                        else
                            local v134 = l_args_0:keys();
                            if #v134 <= 0 then
                                v128:set(v131, v132);
                            else
                                local v135 = l_Map_0.new();
                                for _, v137 in v134 do
                                    local v138 = l_args_0:get(v137);
                                    local v139 = v125(v138, v131, v123, v118);
                                    if v139 == nil then
                                        v135:set(v137, v138);
                                    elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v139)) then
                                        local v140, v141 = table.unpack(v139, 1, 2);
                                        v135:set(v140, v141);
                                    elseif v139 ~= l_Object_0.None then
                                        v135:set(v137, v139);
                                    end;
                                end;
                                v128:set(v131, l_Object_0.assign({}, v132, {
                                    args = v135
                                }));
                            end;
                        end;
                    end;
                    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v124)) then
                        v120:set(v123, l_GraphQLObjectType_0.new(l_Object_0.assign({}, v126, {
                            fields = v128
                        })));
                    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v124)) then
                        v120:set(v123, l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v126, {
                            fields = v128
                        })));
                    else
                        v120:set(v123, l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v126, {
                            fields = v128
                        })));
                    end;
                end;
            end;
        end;
    end;
    return v120;
end;
v40 = function(v142, v143, v144) --[[ Line: 884 ]] --[[ Name: mapDirectives ]]
    -- upvalues: v39 (ref), l_Object_0 (copy), l_Array_0 (copy)
    local v145 = v39(v144);
    if v145 == nil or v145 == l_Object_0.None then
        return l_Array_0.slice(v142);
    else
        local v146 = {};
        for _, v148 in v142 do
            local v149 = v145(v148, v143);
            if v149 == nil then
                table.insert(v146, v148);
            elseif v149 ~= l_Object_0.None then
                table.insert(v146, v149);
            end;
        end;
        return v146;
    end;
end;
local function v154(v150, v151) --[[ Line: 916 ]] --[[ Name: getTypeSpecifiers ]]
    -- upvalues: l_MapperKind_0 (copy), l_Boolean_0 (copy), l_isObjectType_0 (copy), l_Array_0 (copy), l_isInputObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), l_isScalarType_0 (copy)
    local v152 = v150:getType(v151);
    local v153 = {
        l_MapperKind_0.TYPE
    };
    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v152)) then
        v153 = l_Array_0.concat(v153, {
            l_MapperKind_0.COMPOSITE_TYPE, 
            l_MapperKind_0.OBJECT_TYPE
        });
        if v151 == if typeof(v150:getQueryType()) == "table" then v150:getQueryType().name else nil then
            return (l_Array_0.concat(v153, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.QUERY
            }));
        elseif v151 == if typeof(v150:getMutationType()) == "table" then v150:getMutationType().name else nil then
            return (l_Array_0.concat(v153, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.MUTATION
            }));
        elseif v151 == if typeof(v150:getSubscriptionType()) == "table" then v150:getSubscriptionType().name else nil then
            return (l_Array_0.concat(v153, {
                l_MapperKind_0.ROOT_OBJECT, 
                l_MapperKind_0.SUBSCRIPTION
            }));
        end;
    elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v152)) then
        table.insert(v153, l_MapperKind_0.INPUT_OBJECT_TYPE);
        return v153;
    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v152)) then
        return (l_Array_0.concat(v153, {
            l_MapperKind_0.COMPOSITE_TYPE, 
            l_MapperKind_0.ABSTRACT_TYPE, 
            l_MapperKind_0.INTERFACE_TYPE
        }));
    elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(v152)) then
        return (l_Array_0.concat(v153, {
            l_MapperKind_0.COMPOSITE_TYPE, 
            l_MapperKind_0.ABSTRACT_TYPE, 
            l_MapperKind_0.UNION_TYPE
        }));
    elseif l_Boolean_0.toJSBoolean(l_isEnumType_0(v152)) then
        table.insert(v153, l_MapperKind_0.ENUM_TYPE);
        return v153;
    elseif l_Boolean_0.toJSBoolean(l_isScalarType_0(v152)) then
        table.insert(v153, l_MapperKind_0.SCALAR_TYPE);
    end;
    return v153;
end;
v42 = function(v155, v156, v157) --[[ Line: 996 ]] --[[ Name: getTypeMapper ]]
    -- upvalues: v154 (copy), l_Array_0 (copy), l_Boolean_0 (copy)
    local v158 = v154(v155, v157);
    local v159 = nil;
    local v160 = l_Array_0.concat({}, v158);
    while not l_Boolean_0.toJSBoolean(v159) and #v160 > 0 do
        v159 = v156[tostring((table.remove(v160)))];
    end;
    if v159 ~= nil then
        return v159;
    else
        return nil;
    end;
end;
local function v165(v161, v162) --[[ Line: 1023 ]] --[[ Name: getFieldSpecifiers ]]
    -- upvalues: l_MapperKind_0 (copy), l_Boolean_0 (copy), l_isObjectType_0 (copy), l_Array_0 (copy), l_isInterfaceType_0 (copy), l_isInputObjectType_0 (copy)
    local v163 = v161:getType(v162);
    local v164 = {
        l_MapperKind_0.FIELD
    };
    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v163)) then
        v164 = l_Array_0.concat(v164, {
            l_MapperKind_0.COMPOSITE_FIELD, 
            l_MapperKind_0.OBJECT_FIELD
        });
        if v162 == if typeof(v161:getQueryType()) == "table" then v161:getQueryType().name else nil then
            return (l_Array_0.concat(v164, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.QUERY_ROOT_FIELD
            }));
        elseif v162 == if typeof(v161:getMutationType()) == "table" then v161:getMutationType().name else nil then
            return (l_Array_0.concat(v164, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.MUTATION_ROOT_FIELD
            }));
        elseif v162 == if typeof(v161:getSubscriptionType()) == "table" then v161:getSubscriptionType().name else nil then
            return (l_Array_0.concat(v164, {
                l_MapperKind_0.ROOT_FIELD, 
                l_MapperKind_0.SUBSCRIPTION_ROOT_FIELD
            }));
        end;
    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v163)) then
        return (l_Array_0.concat(v164, {
            l_MapperKind_0.COMPOSITE_FIELD, 
            l_MapperKind_0.INTERFACE_FIELD
        }));
    elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v163)) then
        table.insert(v164, l_MapperKind_0.INPUT_OBJECT_FIELD);
    end;
    return v164;
end;
v41 = function(v166, v167, v168) --[[ Line: 1102 ]] --[[ Name: getFieldMapper ]]
    -- upvalues: v165 (copy), l_Array_0 (copy), l_Boolean_0 (copy)
    local v169 = v165(v166, v168);
    local v170 = nil;
    local v171 = l_Array_0.concat({}, table.unpack(v169));
    while not l_Boolean_0.toJSBoolean(v170) and #v171 > 0 do
        v170 = v167[tostring((table.remove(v171)))];
    end;
    if v170 ~= nil then
        return v170;
    else
        return nil;
    end;
end;
v43 = function(v172) --[[ Line: 1129 ]] --[[ Name: getArgumentMapper ]]
    -- upvalues: l_MapperKind_0 (copy)
    local v173 = v172[tostring(l_MapperKind_0.ARGUMENT)];
    if v173 ~= nil then
        return v173;
    else
        return nil;
    end;
end;
v39 = function(v174) --[[ Line: 1140 ]] --[[ Name: getDirectiveMapper ]]
    -- upvalues: l_MapperKind_0 (copy)
    local v175 = v174[tostring(l_MapperKind_0.DIRECTIVE)];
    if v175 ~= nil then
        return v175;
    else
        return nil;
    end;
end;
v38 = function(v176) --[[ Line: 1151 ]] --[[ Name: getEnumValueMapper ]]
    -- upvalues: l_MapperKind_0 (copy)
    local v177 = v176[tostring(l_MapperKind_0.ENUM_VALUE)];
    if v177 ~= nil then
        return v177;
    else
        return nil;
    end;
end;
v45 = function(v178) --[[ Line: 1175 ]] --[[ Name: correctASTNodes ]]
    -- upvalues: l_Boolean_0 (copy), l_isObjectType_0 (copy), l_Object_0 (copy), l_Kind_0 (copy), l_Array_0 (copy), l_GraphQLObjectType_0 (copy), l_isInterfaceType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_isInputObjectType_0 (copy), l_GraphQLInputObjectType_0 (copy), l_isEnumType_0 (copy), l_GraphQLEnumType_0 (copy)
    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v178)) then
        local v179 = v178:toConfig();
        if v179.astNode ~= nil then
            local v180 = {};
            for _, v182 in v179.fields do
                local v183 = table.unpack(v182);
                local v184 = v179.fields:get(v183);
                if v184.astNode ~= nil then
                    table.insert(v180, v184.astNode);
                end;
            end;
            v179.astNode = l_Object_0.assign({}, v179.astNode, {
                kind = l_Kind_0.OBJECT_TYPE_DEFINITION, 
                fields = v180
            });
        end;
        if v179.extensionASTNodes ~= nil then
            v179.extensionASTNodes = l_Array_0.map(v179.extensionASTNodes, function(v185) --[[ Line: 1206 ]]
                -- upvalues: l_Object_0 (ref), l_Kind_0 (ref)
                return l_Object_0.assign({}, v185, {
                    kind = l_Kind_0.OBJECT_TYPE_EXTENSION, 
                    fields = l_Object_0.None
                });
            end);
        end;
        return l_GraphQLObjectType_0.new(v179);
    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v178)) then
        local v186 = v178:toConfig();
        if v186.astNode ~= nil then
            local v187 = {};
            for _, v189 in v186.fields do
                local v190 = table.unpack(v189);
                local v191 = v186.fields:get(v190);
                if v191.astNode ~= nil then
                    table.insert(v187, v191.astNode);
                end;
            end;
            v186.astNode = l_Object_0.assign({}, v186.astNode, {
                kind = l_Kind_0.INTERFACE_TYPE_DEFINITION, 
                fields = v187
            });
        end;
        if v186.extensionASTNodes ~= nil then
            v186.extensionASTNodes = l_Array_0.map(v186.extensionASTNodes, function(v192) --[[ Line: 1239 ]]
                -- upvalues: l_Object_0 (ref), l_Kind_0 (ref)
                return l_Object_0.assign({}, v192, {
                    kind = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
                    fields = l_Object_0.None
                });
            end);
        end;
        return l_GraphQLInterfaceType_0.new(v186);
    elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v178)) then
        local v193 = v178:toConfig();
        if v193.astNode ~= nil then
            local v194 = {};
            for _, v196 in v193.fields do
                local v197 = table.unpack(v196);
                local v198 = v193.fields:get(v197);
                if v198.astNode ~= nil then
                    table.insert(v194, v198.astNode);
                end;
            end;
            v193.astNode = l_Object_0.assign({}, v193.astNode, {
                kind = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION, 
                fields = v194
            });
        end;
        if v193.extensionASTNodes ~= nil then
            v193.extensionASTNodes = l_Array_0.map(v193.extensionASTNodes, function(v199) --[[ Line: 1275 ]]
                -- upvalues: l_Object_0 (ref), l_Kind_0 (ref)
                return l_Object_0.assign({}, v199, {
                    kind = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION, 
                    fields = l_Object_0.None
                });
            end);
        end;
        return l_GraphQLInputObjectType_0.new(v193);
    elseif l_Boolean_0.toJSBoolean(l_isEnumType_0(v178)) then
        local v200 = v178:toConfig();
        if v200.astNode ~= nil then
            local v201 = {};
            for _, v203 in v200.values do
                local v204 = table.unpack(v203);
                local v205 = v200.values:get(v204);
                if v205.astNode ~= nil then
                    table.insert(v201, v205.astNode);
                end;
            end;
            v200.astNode = l_Object_0.assign({}, v200.astNode, {
                values = v201
            });
        end;
        if v200.extensionASTNodes ~= nil then
            v200.extensionASTNodes = l_Array_0.map(v200.extensionASTNodes, function(v206) --[[ Line: 1307 ]]
                -- upvalues: l_Object_0 (ref)
                return l_Object_0.assign({}, v206, {
                    values = l_Object_0.None
                });
            end);
        end;
        return l_GraphQLEnumType_0.new(v200);
    else
        return v178;
    end;
end;
v5.correctASTNodes = v45;
return v5;