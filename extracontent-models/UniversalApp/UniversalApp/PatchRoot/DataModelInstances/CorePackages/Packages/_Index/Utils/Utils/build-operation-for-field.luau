local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_isObjectType_0 = v7.isObjectType;
local l_getNamedType_0 = v7.getNamedType;
local l_isUnionType_0 = v7.isUnionType;
local l_isNonNullType_0 = v7.isNonNullType;
local l_isScalarType_0 = v7.isScalarType;
local l_isListType_0 = v7.isListType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isEnumType_0 = v7.isEnumType;
local l_Kind_0 = v7.Kind;
local v17 = require(script.Parent.rootTypes);
local l_getDefinedRootType_0 = v17.getDefinedRootType;
local l_getRootTypeNames_0 = v17.getRootTypeNames;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = {};
local v25 = {};
local v26 = l_Map_0.new();
local function _(v27) --[[ Line: 89 ]] --[[ Name: addOperationVariable ]]
    -- upvalues: v25 (ref)
    table.insert(v25, v27);
end;
local function _() --[[ Line: 92 ]] --[[ Name: resetOperationVariables ]]
    -- upvalues: v25 (ref)
    v25 = {};
end;
local function _() --[[ Line: 95 ]] --[[ Name: resetFieldMap ]]
    -- upvalues: v26 (ref), l_Map_0 (copy)
    v26 = l_Map_0.new();
end;
v6.buildOperationNodeForField = function(v31) --[[ Line: 102 ]] --[[ Name: buildOperationNodeForField ]]
    -- upvalues: v25 (ref), v26 (ref), l_Map_0 (copy), l_getRootTypeNames_0 (copy), v20 (ref), l_Boolean_0 (copy), l_Array_0 (copy)
    local l_schema_0 = v31.schema;
    local l_kind_0 = v31.kind;
    local l_field_0 = v31.field;
    local l_models_0 = v31.models;
    local v36 = if v31.ignore == nil then {} else v31.ignore;
    local l_depthLimit_0 = v31.depthLimit;
    local l_circularReferenceDepth_0 = v31.circularReferenceDepth;
    local l_argNames_0 = v31.argNames;
    local v40 = v31.selectedFields == nil or v31.selectedFields;
    v25 = {};
    v26 = l_Map_0.new();
    local v41 = l_getRootTypeNames_0(l_schema_0);
    local v42 = v20({
        schema = l_schema_0, 
        fieldName = l_field_0, 
        kind = l_kind_0, 
        models = if l_Boolean_0.toJSBoolean(l_models_0) then l_models_0 else {}, 
        ignore = v36, 
        depthLimit = if l_Boolean_0.toJSBoolean(l_depthLimit_0) then l_depthLimit_0 else 1e999, 
        circularReferenceDepth = l_Boolean_0.toJSBoolean(l_circularReferenceDepth_0) and l_circularReferenceDepth_0 or 1, 
        argNames = l_argNames_0, 
        selectedFields = v40, 
        rootTypeNames = v41
    });
    v42.variableDefinitions = l_Array_0.concat({}, v25);
    v25 = {};
    v26 = l_Map_0.new();
    return v42;
end;
v20 = function(v43) --[[ Line: 174 ]] --[[ Name: buildOperationAndCollectVariables ]]
    -- upvalues: l_getDefinedRootType_0 (copy), l_Array_0 (copy), v21 (ref), v25 (ref), l_Kind_0 (copy), v23 (ref)
    local l_schema_1 = v43.schema;
    local l_fieldName_0 = v43.fieldName;
    local l_kind_1 = v43.kind;
    local l_models_1 = v43.models;
    local l_ignore_0 = v43.ignore;
    local l_depthLimit_1 = v43.depthLimit;
    local l_circularReferenceDepth_1 = v43.circularReferenceDepth;
    local l_argNames_1 = v43.argNames;
    local l_selectedFields_0 = v43.selectedFields;
    local l_rootTypeNames_0 = v43.rootTypeNames;
    local v54 = l_getDefinedRootType_0(l_schema_1, l_kind_1);
    local v55 = v54:getFields():get(l_fieldName_0);
    local v56 = ("%s_%s"):format(tostring(l_fieldName_0), (tostring(l_kind_1)));
    if v55 and v55.args then
        for _, v58 in v55.args do
            local l_name_0 = v58.name;
            if not l_argNames_1 or l_Array_0.includes(l_argNames_1, l_name_0) then
                local v60 = v21(v58, l_name_0);
                table.insert(v25, v60);
            end;
        end;
    end;
    return {
        kind = l_Kind_0.OPERATION_DEFINITION, 
        operation = l_kind_1, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v56
        }, 
        variableDefinitions = {}, 
        selectionSet = {
            kind = l_Kind_0.SELECTION_SET, 
            selections = {
                v23({
                    type = v54, 
                    field = v55, 
                    models = l_models_1, 
                    firstCall = true, 
                    path = {}, 
                    ancestors = {}, 
                    ignore = l_ignore_0, 
                    depthLimit = l_depthLimit_1, 
                    circularReferenceDepth = l_circularReferenceDepth_1, 
                    schema = l_schema_1, 
                    depth = 0, 
                    argNames = l_argNames_1, 
                    selectedFields = l_selectedFields_0, 
                    rootTypeNames = l_rootTypeNames_0
                })
            }
        }
    };
end;
local function v61(v62) --[[ Line: 259 ]] --[[ Name: resolveSelectionSet ]]
    -- upvalues: l_Boolean_0 (copy), l_isUnionType_0 (copy), l_Kind_0 (copy), l_Array_0 (copy), v22 (ref), v61 (copy), v24 (copy), l_isInterfaceType_0 (copy), l_isObjectType_0 (copy), l_getNamedType_0 (copy), v23 (ref), l_Object_0 (copy)
    local l_parent_0 = v62.parent;
    local l_type_0 = v62.type;
    local l_models_2 = v62.models;
    local l_firstCall_0 = v62.firstCall;
    local l_path_0 = v62.path;
    local l_ancestors_0 = v62.ancestors;
    local l_ignore_1 = v62.ignore;
    local l_depthLimit_2 = v62.depthLimit;
    local l_circularReferenceDepth_2 = v62.circularReferenceDepth;
    local l_schema_2 = v62.schema;
    local l_depth_0 = v62.depth;
    local l_argNames_2 = v62.argNames;
    local l_selectedFields_1 = v62.selectedFields;
    local l_rootTypeNames_1 = v62.rootTypeNames;
    if typeof(l_selectedFields_1) == "boolean" and l_depthLimit_2 < l_depth_0 then
        return;
    elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(l_type_0)) then
        local v77 = l_type_0:getTypes();
        return {
            kind = l_Kind_0.SELECTION_SET, 
            selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(v77, function(v78) --[[ Line: 305 ]]
                -- upvalues: v22 (ref), l_Array_0 (ref), l_ancestors_0 (copy), l_circularReferenceDepth_2 (copy)
                return not v22(l_Array_0.concat({}, l_ancestors_0, {
                    v78
                }), {
                    depth = l_circularReferenceDepth_2
                });
            end), function(v79) --[[ Line: 319 ]]
                -- upvalues: l_Kind_0 (ref), v61 (ref), l_type_0 (copy), l_models_2 (copy), l_path_0 (copy), l_ancestors_0 (copy), l_ignore_1 (copy), l_depthLimit_2 (copy), l_circularReferenceDepth_2 (copy), l_schema_2 (copy), l_depth_0 (copy), l_argNames_2 (copy), l_selectedFields_1 (copy), l_rootTypeNames_1 (copy)
                return {
                    kind = l_Kind_0.INLINE_FRAGMENT, 
                    typeCondition = {
                        kind = l_Kind_0.NAMED_TYPE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v79.name
                        }
                    }, 
                    selectionSet = v61({
                        parent = l_type_0, 
                        type = v79, 
                        models = l_models_2, 
                        path = l_path_0, 
                        ancestors = l_ancestors_0, 
                        ignore = l_ignore_1, 
                        depthLimit = l_depthLimit_2, 
                        circularReferenceDepth = l_circularReferenceDepth_2, 
                        schema = l_schema_2, 
                        depth = l_depth_0, 
                        argNames = l_argNames_2, 
                        selectedFields = l_selectedFields_1, 
                        rootTypeNames = l_rootTypeNames_1
                    })
                };
            end), function(v80) --[[ Line: 344 ]]
                -- upvalues: v24 (ref)
                local v81 = false;
                if typeof(v80) == "table" then
                    v81 = false;
                    if v80.selectionSet ~= v24 then
                        v81 = false;
                        if typeof(v80.selectionSet) == "table" then
                            v81 = false;
                            if typeof(v80.selectionSet.selections) == "table" then
                                v81 = #v80.selectionSet.selections > 0;
                            end;
                        end;
                    end;
                end;
                return v81;
            end)
        };
    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(l_type_0)) then
        local v84 = l_Array_0.filter(l_schema_2:getTypeMap():values(), function(v82) --[[ Line: 376 ]]
            -- upvalues: l_isObjectType_0 (ref), l_Boolean_0 (ref), l_Array_0 (ref), l_type_0 (copy)
            local v83 = l_isObjectType_0(v82);
            if l_Boolean_0.toJSBoolean(v83) then
                return (l_Array_0.includes(v82:getInterfaces(), l_type_0));
            else
                return v83;
            end;
        end);
        return {
            kind = l_Kind_0.SELECTION_SET, 
            selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(v84, function(v85) --[[ Line: 387 ]]
                -- upvalues: v22 (ref), l_Array_0 (ref), l_ancestors_0 (copy), l_circularReferenceDepth_2 (copy)
                return not v22(l_Array_0.concat({}, l_ancestors_0, {
                    v85
                }), {
                    depth = l_circularReferenceDepth_2
                });
            end), function(v86) --[[ Line: 401 ]]
                -- upvalues: l_Kind_0 (ref), v61 (ref), l_type_0 (copy), l_models_2 (copy), l_path_0 (copy), l_ancestors_0 (copy), l_ignore_1 (copy), l_depthLimit_2 (copy), l_circularReferenceDepth_2 (copy), l_schema_2 (copy), l_depth_0 (copy), l_argNames_2 (copy), l_selectedFields_1 (copy), l_rootTypeNames_1 (copy)
                return {
                    kind = l_Kind_0.INLINE_FRAGMENT, 
                    typeCondition = {
                        kind = l_Kind_0.NAMED_TYPE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v86.name
                        }
                    }, 
                    selectionSet = v61({
                        parent = l_type_0, 
                        type = v86, 
                        models = l_models_2, 
                        path = l_path_0, 
                        ancestors = l_ancestors_0, 
                        ignore = l_ignore_1, 
                        depthLimit = l_depthLimit_2, 
                        circularReferenceDepth = l_circularReferenceDepth_2, 
                        schema = l_schema_2, 
                        depth = l_depth_0, 
                        argNames = l_argNames_2, 
                        selectedFields = l_selectedFields_1, 
                        rootTypeNames = l_rootTypeNames_1
                    })
                };
            end), function(v87) --[[ Line: 426 ]]
                -- upvalues: v24 (ref)
                if typeof(v87) == "table" and v87.selectionSet ~= v24 and typeof(v87.selectionSet) == "table" and typeof(v87.selectionSet.selections) == "table" then
                    return #v87.selectionSet.selections > 0;
                else
                    return false;
                end;
            end)
        };
    else
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v89 = l_isObjectType_0(l_type_0);
        if l_toJSBoolean_0(if l_Boolean_0.toJSBoolean(v89) then not l_Boolean_0.toJSBoolean(l_rootTypeNames_1:has(l_type_0.name)) else v89) then
            l_toJSBoolean_0 = l_Array_0.includes(l_ignore_1, l_type_0.name);
            local v90 = l_Boolean_0.toJSBoolean(l_toJSBoolean_0) and l_toJSBoolean_0 or l_Array_0.includes(l_ignore_1, ("%s.%s"):format(l_parent_0.name, (tostring(l_path_0[#l_path_0]))));
            v89 = l_Array_0.includes(l_models_2, l_type_0.name);
            local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
            local v92 = not l_Boolean_0.toJSBoolean(l_firstCall_0) and v89;
            if l_toJSBoolean_1(if l_Boolean_0.toJSBoolean(v92) then not l_Boolean_0.toJSBoolean(v90) else v92) then
                return {
                    kind = l_Kind_0.SELECTION_SET, 
                    selections = {
                        {
                            kind = l_Kind_0.FIELD, 
                            name = {
                                kind = l_Kind_0.NAME, 
                                value = "id"
                            }
                        }
                    }
                };
            else
                l_toJSBoolean_1 = l_type_0:getFields();
                return {
                    kind = l_Kind_0.SELECTION_SET, 
                    selections = l_Array_0.filter(l_Array_0.map(l_Array_0.filter(l_toJSBoolean_1:keys(), function(v93) --[[ Line: 504 ]]
                        -- upvalues: v22 (ref), l_Array_0 (ref), l_ancestors_0 (copy), l_getNamedType_0 (ref), l_toJSBoolean_1 (copy), l_circularReferenceDepth_2 (copy)
                        return not v22(l_Array_0.concat({}, l_ancestors_0, {
                            l_getNamedType_0(l_toJSBoolean_1:get(v93).type)
                        }), {
                            depth = l_circularReferenceDepth_2
                        });
                    end), function(v94) --[[ Line: 517 ]]
                        -- upvalues: l_selectedFields_1 (copy), l_Boolean_0 (ref), v23 (ref), l_type_0 (copy), l_toJSBoolean_1 (copy), l_models_2 (copy), l_Array_0 (ref), l_path_0 (copy), l_ancestors_0 (copy), l_ignore_1 (copy), l_depthLimit_2 (copy), l_circularReferenceDepth_2 (copy), l_schema_2 (copy), l_depth_0 (copy), l_argNames_2 (copy), l_rootTypeNames_1 (copy), v24 (ref)
                        local v95 = typeof(l_selectedFields_1) ~= "table" or l_selectedFields_1[tostring(v94)];
                        if l_Boolean_0.toJSBoolean(v95) then
                            return v23({
                                type = l_type_0, 
                                field = l_toJSBoolean_1:get(v94), 
                                models = l_models_2, 
                                path = l_Array_0.concat({}, l_path_0, {
                                    v94
                                }), 
                                ancestors = l_ancestors_0, 
                                ignore = l_ignore_1, 
                                depthLimit = l_depthLimit_2, 
                                circularReferenceDepth = l_circularReferenceDepth_2, 
                                schema = l_schema_2, 
                                depth = l_depth_0, 
                                argNames = l_argNames_2, 
                                selectedFields = v95, 
                                rootTypeNames = l_rootTypeNames_1
                            });
                        else
                            return v24;
                        end;
                    end), function(v96) --[[ Line: 552 ]]
                        -- upvalues: v24 (ref), l_Array_0 (ref), l_Object_0 (ref), l_Boolean_0 (ref)
                        if v96 == nil or v96 == v24 then
                            return false;
                        elseif l_Array_0.indexOf(l_Object_0.keys(v96), "selectionSet") ~= -1 then
                            return l_Boolean_0.toJSBoolean(if typeof(v96.selectionSet) == "table" and typeof(v96.selectionSet.selections) == "table" then #v96.selectionSet.selections else nil);
                        else
                            return true;
                        end;
                    end)
                };
            end;
        else
            return nil;
        end;
    end;
end;
v21 = function(v97, v98) --[[ Line: 592 ]] --[[ Name: resolveVariable ]]
    -- upvalues: l_Boolean_0 (copy), l_isListType_0 (copy), l_Kind_0 (copy), l_isNonNullType_0 (copy)
    local function v99(v100) --[[ Line: 599 ]] --[[ Name: resolveVariableType ]]
        -- upvalues: l_Boolean_0 (ref), l_isListType_0 (ref), l_Kind_0 (ref), v99 (copy), l_isNonNullType_0 (ref)
        if l_Boolean_0.toJSBoolean(l_isListType_0(v100)) then
            return {
                kind = l_Kind_0.LIST_TYPE, 
                type = v99(v100.ofType)
            };
        elseif l_Boolean_0.toJSBoolean(l_isNonNullType_0(v100)) then
            return {
                kind = l_Kind_0.NON_NULL_TYPE, 
                type = v99(v100.ofType)
            };
        else
            return {
                kind = l_Kind_0.NAMED_TYPE, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = v100.name
                }
            };
        end;
    end;
    return {
        kind = l_Kind_0.VARIABLE_DEFINITION, 
        variable = {
            kind = l_Kind_0.VARIABLE, 
            name = {
                kind = l_Kind_0.NAME, 
                value = l_Boolean_0.toJSBoolean(v98) and v98 or v97.name
            }
        }, 
        type = v99(v97.type)
    };
end;
local function v103(v101, v102) --[[ Line: 622 ]] --[[ Name: getArgumentName ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.join(l_Array_0.concat({}, v102, {
        v101
    }), "_");
end;
v23 = function(v104) --[[ Line: 646 ]] --[[ Name: resolveField ]]
    -- upvalues: l_getNamedType_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v103 (copy), l_isNonNullType_0 (copy), v21 (ref), v25 (ref), l_Kind_0 (copy), v26 (ref), l_isScalarType_0 (copy), l_isEnumType_0 (copy), v61 (copy), l_Object_0 (copy), v24 (copy)
    local l_type_1 = v104.type;
    local l_field_1 = v104.field;
    local l_models_3 = v104.models;
    local l_firstCall_1 = v104.firstCall;
    local l_path_1 = v104.path;
    local l_ancestors_1 = v104.ancestors;
    local l_ignore_2 = v104.ignore;
    local l_depthLimit_3 = v104.depthLimit;
    local l_circularReferenceDepth_3 = v104.circularReferenceDepth;
    local l_schema_3 = v104.schema;
    local l_depth_1 = v104.depth;
    local l_argNames_3 = v104.argNames;
    local l_selectedFields_2 = v104.selectedFields;
    local l_rootTypeNames_2 = v104.rootTypeNames;
    local v119 = l_getNamedType_0(l_field_1.type);
    local v120 = {};
    local v121 = false;
    if l_Boolean_0.toJSBoolean(l_field_1.args) and #l_field_1.args ~= 0 then
        v120 = l_Array_0.filter(l_Array_0.map(l_field_1.args, function(v122) --[[ Line: 686 ]]
            -- upvalues: v103 (ref), l_path_1 (copy), l_argNames_3 (copy), l_Array_0 (ref), l_Boolean_0 (ref), l_isNonNullType_0 (ref), v121 (ref), l_firstCall_1 (copy), v21 (ref), v25 (ref), l_Kind_0 (ref)
            local v123 = v103(v122.name, l_path_1);
            if if l_argNames_3 then not l_Array_0.includes(l_argNames_3, v123) else l_Boolean_0.toJSBoolean(l_argNames_3) then
                if l_Boolean_0.toJSBoolean(l_isNonNullType_0(v122.type)) then
                    v121 = true;
                end;
                return nil;
            else
                if not l_Boolean_0.toJSBoolean(l_firstCall_1) then
                    local v124 = v21(v122, v123);
                    table.insert(v25, v124);
                end;
                return {
                    kind = l_Kind_0.ARGUMENT, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v122.name
                    }, 
                    value = {
                        kind = l_Kind_0.VARIABLE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v103(v122.name, l_path_1)
                        }
                    }
                };
            end;
        end), l_Boolean_0.toJSBoolean);
    end;
    if l_Boolean_0.toJSBoolean(v121) then
        return nil;
    else
        local v125 = l_Array_0.concat({}, l_path_1, {
            l_field_1.name
        });
        local v126 = l_Array_0.join(v125, ".");
        local l_name_1 = l_field_1.name;
        local l_toJSBoolean_2 = l_Boolean_0.toJSBoolean;
        local v129 = v26:has(v126);
        if l_toJSBoolean_2(if l_Boolean_0.toJSBoolean(v129) then v26:get(v126) ~= tostring(l_field_1.type) else v129) then
            l_name_1 = l_name_1 .. tostring(l_field_1.type):gsub("!", "NonNull");
        end;
        v26:set(v126, (tostring(l_field_1.type)));
        if not l_Boolean_0.toJSBoolean(l_isScalarType_0(v119)) and not l_Boolean_0.toJSBoolean(l_isEnumType_0(v119)) then
            l_toJSBoolean_2 = v61({
                parent = l_type_1, 
                type = v119, 
                models = l_models_3, 
                firstCall = l_firstCall_1, 
                path = v125, 
                ancestors = l_Array_0.concat({}, l_ancestors_1, {
                    l_type_1
                }), 
                ignore = l_ignore_2, 
                depthLimit = l_depthLimit_3, 
                circularReferenceDepth = l_circularReferenceDepth_3, 
                schema = l_schema_3, 
                depth = l_depth_1 + 1, 
                argNames = l_argNames_3, 
                selectedFields = l_selectedFields_2, 
                rootTypeNames = l_rootTypeNames_2
            });
            local v130 = if l_Boolean_0.toJSBoolean(l_toJSBoolean_2) then l_toJSBoolean_2 else nil;
            v129 = l_Object_0.assign;
            local v131 = {};
            local v132 = {
                kind = l_Kind_0.FIELD, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = l_field_1.name
                }
            };
            local v133 = false;
            if l_name_1 ~= l_field_1.name then
                v133 = {
                    alias = {
                        kind = l_Kind_0.NAME, 
                        value = l_name_1
                    }
                };
            end;
            return v129(v131, v132, v133, {
                selectionSet = l_Boolean_0.toJSBoolean(v130) and v130 or v24, 
                arguments = v120
            });
        else
            l_toJSBoolean_2 = l_Object_0.assign;
            local v134 = {};
            v129 = {
                kind = l_Kind_0.FIELD, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = l_field_1.name
                }
            };
            local v135 = false;
            if l_name_1 ~= l_field_1.name then
                v135 = {
                    alias = {
                        kind = l_Kind_0.NAME, 
                        value = l_name_1
                    }
                };
            end;
            return l_toJSBoolean_2(v134, v129, v135, {
                arguments = v120
            });
        end;
    end;
end;
v22 = function(v136, v137) --[[ Line: 782 ]] --[[ Name: hasCircularRef ]]
    -- upvalues: l_Boolean_0 (copy), l_isScalarType_0 (copy), l_Array_0 (copy)
    local v138 = if v137 ~= nil then v137 else {
        depth = 1
    };
    local v139 = v136[#v136];
    if l_Boolean_0.toJSBoolean(l_isScalarType_0(v139)) then
        return false;
    else
        return #l_Array_0.filter(v136, function(v140) --[[ Line: 798 ]]
            -- upvalues: v139 (copy)
            return v140.name == v139.name;
        end) > v138.depth;
    end;
end;
return v6;