local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v7 = {};
local l_getOperationASTFromRequest_0 = require(script.Parent.getOperationASTFromRequest).getOperationASTFromRequest;
local v9 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v9.Kind;
local l_isListType_0 = v9.isListType;
local l_getNullableType_0 = v9.getNullableType;
local l_isAbstractType_0 = v9.isAbstractType;
local l_isObjectType_0 = v9.isObjectType;
local l_TypeNameMetaFieldDef_0 = v9.TypeNameMetaFieldDef;
local l_SchemaMetaFieldDef_0 = v9.SchemaMetaFieldDef;
local v17 = require(script.Parent.collectFields);
local l_collectFields_0 = v17.collectFields;
local l_collectSubFields_0 = v17.collectSubFields;
local _ = require(script.Parent.Interfaces);
local _ = require(script.Parent.types);
local l_NULL_0 = v9.NULL;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local function v30(v31, v32, v33) --[[ Line: 101 ]] --[[ Name: visitData ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), v30 (copy)
    if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v31)) then
        return l_Array_0.map(v31, function(v34) --[[ Line: 103 ]]
            -- upvalues: v30 (ref), v32 (copy), v33 (copy)
            return v30(v34, v32, v33);
        end);
    elseif typeof(v31) == "table" then
        local v35 = if v32 ~= nil then v32(v31) else v31;
        if v35 ~= nil then
            for v36 in v35 do
                local v37 = v35[tostring(v36)];
                v35[v36] = v30(v37, v32, v33);
            end;
        end;
        if v33 ~= nil then
            return (v33(v35));
        else
            return v35;
        end;
    else
        return v31;
    end;
end;
v7.visitData = v30;
v7.visitErrors = function(v38, v39) --[[ Line: 128 ]] --[[ Name: visitErrors ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.map(v38, function(v40) --[[ Line: 132 ]]
        -- upvalues: v39 (copy)
        return v39(v40);
    end);
end;
v7.visitResult = function(v41, v42, v43, v44, v45) --[[ Line: 137 ]] --[[ Name: visitResult ]]
    -- upvalues: l_Array_0 (copy), l_Kind_0 (copy), l_Boolean_0 (copy), l_Map_0 (copy), l_Set_0 (copy), l_getOperationASTFromRequest_0 (copy), v23 (ref), v24 (ref)
    local v48 = l_Array_0.reduce(v42.document.definitions, function(v46, v47) --[[ Line: 144 ]]
        -- upvalues: l_Kind_0 (ref)
        if v47.kind == l_Kind_0.FRAGMENT_DEFINITION then
            v46[tostring(v47.name.value)] = v47;
        end;
        return v46;
    end, {});
    local v49 = if l_Boolean_0.toJSBoolean(v42.variables) then v42.variables else {};
    local v50 = {
        segmentInfoMap = l_Map_0.new(), 
        unpathedErrors = l_Set_0.new()
    };
    local l_data_0 = v41.data;
    local l_errors_0 = v41.errors;
    local v53 = false;
    if l_errors_0 ~= nil then
        v53 = v45 ~= nil;
    end;
    local v54 = l_getOperationASTFromRequest_0(v42);
    if l_data_0 ~= nil and v54 ~= nil then
        v41.data = v23(l_data_0, v54, v43, v48, v49, v44, if l_Boolean_0.toJSBoolean(v53) then l_errors_0 else nil, v50);
    end;
    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
    local v56 = false;
    if l_errors_0 ~= nil then
        v56 = v45;
    end;
    if l_toJSBoolean_0(v56) then
        v41.errors = v24(l_errors_0, v45, v50);
    end;
    return v41;
end;
v24 = function(v57, v58, v59) --[[ Line: 190 ]] --[[ Name: visitErrorsByType ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    local l_segmentInfoMap_0 = v59.segmentInfoMap;
    local l_unpathedErrors_0 = v59.unpathedErrors;
    local l___unpathed_0 = v58.__unpathed;
    return l_Array_0.map(v57, function(v63) --[[ Line: 202 ]]
        -- upvalues: l_segmentInfoMap_0 (copy), l_Array_0 (ref), v58 (copy), l_Boolean_0 (ref), l___unpathed_0 (copy), l_unpathedErrors_0 (copy)
        local v64 = l_segmentInfoMap_0:get(v63);
        local v69 = if v64 == nil then v63 else l_Array_0.reduce(l_Array_0.reverse(l_Array_0.concat({}, v64)), function(v65, v66) --[[ Line: 222 ]]
            -- upvalues: v58 (ref)
            local v67 = v58[v66.type.name];
            if v67 == nil then
                return v65;
            else
                local v68 = v67[tostring(v66.fieldName)];
                if v68 == nil then
                    return v65;
                else
                    return (v68(v65, v66.pathIndex));
                end;
            end;
        end, v63);
        if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(l___unpathed_0) then l_unpathedErrors_0:has(v63) else l___unpathed_0) then
            return l___unpathed_0(v69);
        else
            return v69;
        end;
    end);
end;
local function _(v70, v71) --[[ Line: 250 ]] --[[ Name: getOperationRootType ]]
    local l_operation_0 = v71.operation;
    if l_operation_0 == "query" then
        return v70:getQueryType();
    elseif l_operation_0 == "mutation" then
        return v70:getMutationType();
    elseif l_operation_0 == "subscription" then
        return v70:getSubscriptionType();
    else
        return nil;
    end;
end;
v23 = function(v74, v75, v76, v77, v78, v79, v80, v81) --[[ Line: 269 ]] --[[ Name: visitRoot ]]
    -- upvalues: l_collectFields_0 (copy), l_Map_0 (copy), l_Set_0 (copy), v25 (ref)
    local l_operation_1 = v75.operation;
    local v83 = if l_operation_1 == "query" then v76:getQueryType() else if l_operation_1 == "mutation" then v76:getMutationType() else if l_operation_1 == "subscription" then v76:getSubscriptionType() else nil;
    l_operation_1 = l_collectFields_0(v76, v77, v78, v83, v75.selectionSet, l_Map_0.new(), l_Set_0.new());
    return v25(v74, v83, l_operation_1, v76, v77, v78, v79, 1, v80, v81);
end;
v25 = function(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93) --[[ Line: 308 ]] --[[ Name: visitObjectValue ]]
    -- upvalues: v26 (ref), l_TypeNameMetaFieldDef_0 (copy), l_SchemaMetaFieldDef_0 (copy), v28 (ref), v29 (ref), v27 (ref)
    local v94 = v85:getFields();
    local v95 = if typeof(v90) == "table" then v90[v85.name] else nil;
    local v96 = if typeof(v95) == "table" then v95.__enter else nil;
    local v97 = if v96 ~= nil then v96(v84) else v84;
    local v98 = nil;
    local v99 = nil;
    if v92 ~= nil then
        v98 = v26(v92, v91);
        v99 = v98.errorMap;
        for _, v101 in v98.unpathedErrors do
            v93.unpathedErrors:add(v101);
        end;
    end;
    for _, v103 in v86 do
        local v104, v105 = table.unpack(v103, 1, 2);
        local l_value_0 = v105[1].name.value;
        local v107 = if typeof(v94:get(l_value_0)) == "table" then v94:get(l_value_0).type else nil;
        if v107 == nil then
            if l_value_0 == "__typename" then
                v107 = l_TypeNameMetaFieldDef_0.type;
            elseif l_value_0 == "__schema" then
                v107 = l_SchemaMetaFieldDef_0.type;
            end;
        end;
        local v108 = v91 + 1;
        local v109 = nil;
        if v99 then
            v109 = v99[tostring(v104)];
            if v109 ~= nil then
                v99[tostring(v104)] = nil;
            end;
            v28(v85, l_value_0, v108, v109, v93);
        end;
        local v110 = v29(v84[tostring(v104)], v107, v105, v87, v88, v89, v90, v108, v109, v93);
        v27(v97, v104, v110, v95, l_value_0);
    end;
    local l___typename_0 = v97.__typename;
    if l___typename_0 ~= nil then
        v27(v97, "__typename", l___typename_0, v95, "__typename");
    end;
    if v99 then
        for v112 in v99 do
            for _, v114 in v99[v112] do
                v93.unpathedErrors:add(v114);
            end;
        end;
    end;
    local v115 = if typeof(v95) == "table" then v95.__leave else nil;
    if v115 ~= nil then
        return (v115(v97));
    else
        return v97;
    end;
end;
v27 = function(v116, v117, v118, v119, v120) --[[ Line: 438 ]] --[[ Name: updateObject ]]
    if v119 == nil then
        v116[tostring(v117)] = v118;
        return;
    else
        local v121 = v119[v120];
        if v121 == nil then
            v116[tostring(v117)] = v118;
            return;
        else
            local v122 = v121(v118);
            if v122 == nil then
                v116[tostring(v117)] = nil;
                return;
            else
                v116[tostring(v117)] = v122;
                return;
            end;
        end;
    end;
end;
local function v134(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132) --[[ Line: 469 ]] --[[ Name: visitListValue ]]
    -- upvalues: l_Array_0 (copy), v29 (ref)
    return l_Array_0.map(v123, function(v133) --[[ Line: 481 ]]
        -- upvalues: v29 (ref), v124 (copy), v125 (copy), v126 (copy), v127 (copy), v128 (copy), v129 (copy), v130 (copy), v131 (copy), v132 (copy)
        return v29(v133, v124, v125, v126, v127, v128, v129, v130 + 1, v131, v132);
    end);
end;
v29 = function(v135, v136, v137, v138, v139, v140, v141, v142, v143, v144) --[[ Line: 498 ]] --[[ Name: visitFieldValue ]]
    -- upvalues: l_NULL_0 (copy), l_getNullableType_0 (copy), l_Boolean_0 (copy), l_isListType_0 (copy), v134 (copy), l_isAbstractType_0 (copy), l_collectSubFields_0 (copy), v25 (ref), l_isObjectType_0 (copy)
    local v145 = if v143 ~= nil then v143 else {};
    if v135 == nil or v135 == l_NULL_0 then
        return v135;
    else
        local v146 = l_getNullableType_0(v136);
        if l_Boolean_0.toJSBoolean(l_isListType_0(v146)) then
            return v134(v135, v146.ofType, v137, v138, v139, v140, v141, v142, v145, v144);
        elseif l_Boolean_0.toJSBoolean(l_isAbstractType_0(v146)) then
            local v147 = v138:getType(v135.__typename);
            local v148 = l_collectSubFields_0(v138, v139, v140, v147, v137);
            return v25(v135, v147, v148, v138, v139, v140, v141, v142, v145, v144);
        elseif l_Boolean_0.toJSBoolean(l_isObjectType_0(v146)) then
            local v149 = l_collectSubFields_0(v138, v139, v140, v146, v137);
            return v25(v135, v146, v149, v138, v139, v140, v141, v142, v145, v144);
        else
            local v150 = if typeof(v141) == "table" then v141[v146.name] else nil;
            if v150 == nil then
                return v135;
            else
                local v151 = v150(v135);
                if v151 == nil then
                    return v135;
                else
                    return v151;
                end;
            end;
        end;
    end;
end;
v26 = function(v152, v153) --[[ Line: 589 ]] --[[ Name: sortErrorsByPathSegment ]]
    -- upvalues: l_Set_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    local v154 = {};
    local v155 = l_Set_0.new();
    for _, v157 in v152 do
        local v158 = if typeof(v157.path) == "table" then v157.path[v153] else nil;
        if v158 == nil then
            v155:add(v157);
        elseif l_Array_0.indexOf(l_Object_0.keys(v154), (tostring(v158))) ~= -1 then
            table.insert(v154[tostring(v158)], v157);
        else
            v154[tostring(v158)] = {
                v157
            };
        end;
    end;
    return {
        errorMap = v154, 
        unpathedErrors = v155
    };
end;
v28 = function(v159, v160, v161, v162, v163) --[[ Line: 614 ]] --[[ Name: addPathSegmentInfo ]]
    local v164 = if v162 ~= nil then v162 else {};
    for _, v166 in v164 do
        local v167 = {
            type = v159, 
            fieldName = v160, 
            pathIndex = v161
        };
        local v168 = v163.segmentInfoMap:get(v166);
        if v168 == nil then
            v163.segmentInfoMap:set(v166, {
                v167
            });
        else
            table.insert(v168, v167);
        end;
    end;
end;
return v7;