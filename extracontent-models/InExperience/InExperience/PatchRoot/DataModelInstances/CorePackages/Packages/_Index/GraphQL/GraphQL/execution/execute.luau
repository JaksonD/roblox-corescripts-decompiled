local l_Parent_0 = script.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_error_0 = l_Parent_0.error;
local l_language_0 = l_Parent_0.language;
local l_type_0 = l_Parent_0.type;
local l_utilities_0 = l_Parent_0.utilities;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local l_Parent_1 = l_Parent_0.Parent;
local v8 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v8.Array;
local l_Error_0 = v8.Error;
local l_Map_0 = v8.Map;
local l_Set_0 = v8.Set;
local l_instanceof_0 = v8.instanceof;
local _ = require(l_jsutils_0.ObjMap);
local _ = require(l_jsutils_0.PromiseOrValue);
local v16 = require(l_Parent_0.Parent.Promise);
local v17 = require(l_luaUtils_0.null);
local l_isNillish_0 = require(l_luaUtils_0.isNillish).isNillish;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_memoize3_0 = require(l_jsutils_0.memoize3).memoize3;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local l_isPromise_0 = require(l_jsutils_0.isPromise).isPromise;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_promiseReduce_0 = require(l_jsutils_0.promiseReduce).promiseReduce;
local l_promiseForObject_0 = require(l_jsutils_0.promiseForObject).promiseForObject;
local v27 = require(l_jsutils_0.Path);
local l_addPath_0 = v27.addPath;
local l_pathToArray_0 = v27.pathToArray;
local l_isIteratableObject_0 = require(l_jsutils_0.isIteratableObject).isIteratableObject;
local _ = require(l_error_0.formatError);
local l_GraphQLError_0 = require(l_error_0.GraphQLError).GraphQLError;
local l_locatedError_0 = require(l_error_0.locatedError).locatedError;
local _ = require(l_language_0.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local _ = require(l_type_0.schema);
local v37 = require(l_type_0.definition);
local l_assertValidSchema_0 = require(l_type_0.validate).assertValidSchema;
local v39 = require(l_type_0.introspection);
local l_SchemaMetaFieldDef_0 = v39.SchemaMetaFieldDef;
local l_TypeMetaFieldDef_0 = v39.TypeMetaFieldDef;
local l_TypeNameMetaFieldDef_0 = v39.TypeNameMetaFieldDef;
local v43 = require(l_type_0.directives);
local l_GraphQLIncludeDirective_0 = v43.GraphQLIncludeDirective;
local l_GraphQLSkipDirective_0 = v43.GraphQLSkipDirective;
local l_isObjectType_0 = v37.isObjectType;
local l_isAbstractType_0 = v37.isAbstractType;
local l_isLeafType_0 = v37.isLeafType;
local l_isListType_0 = v37.isListType;
local l_isNonNullType_0 = v37.isNonNullType;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_getOperationRootType_0 = require(l_utilities_0.getOperationRootType).getOperationRootType;
local v53 = require(script.Parent.values);
local l_getVariableValues_0 = v53.getVariableValues;
local l_getArgumentValues_0 = v53.getArgumentValues;
local l_getDirectiveValues_0 = v53.getDirectiveValues;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local _ = nil;
local v84 = nil;
v57 = function(v85) --[[ Line: 225 ]] --[[ Name: execute ]]
    -- upvalues: v59 (ref), v60 (ref), l_Array_0 (copy), v67 (ref), v66 (ref)
    local l_schema_0 = v85.schema;
    local l_document_0 = v85.document;
    local l_rootValue_0 = v85.rootValue;
    local l_contextValue_0 = v85.contextValue;
    local l_variableValues_0 = v85.variableValues;
    local l_operationName_0 = v85.operationName;
    local l_fieldResolver_0 = v85.fieldResolver;
    local l_typeResolver_0 = v85.typeResolver;
    v59(l_schema_0, l_document_0, l_variableValues_0);
    local v94 = v60(l_schema_0, l_document_0, l_rootValue_0, l_contextValue_0, l_variableValues_0, l_operationName_0, l_fieldResolver_0, l_typeResolver_0);
    if l_Array_0.isArray(v94) or not v94.schema then
        return {
            errors = v94
        };
    else
        local v95 = v67(v94, v94.operation, l_rootValue_0);
        return v66(v94, v95);
    end;
end;
v58 = function(v96) --[[ Line: 278 ]] --[[ Name: executeSync ]]
    -- upvalues: v57 (ref), l_isPromise_0 (copy), l_Error_0 (copy)
    local v97 = v57(v96);
    if l_isPromise_0(v97) then
        error(l_Error_0.new("GraphQL execution failed to complete synchronously."));
    end;
    return v97;
end;
v66 = function(v98, v99) --[[ Line: 294 ]] --[[ Name: buildResponse ]]
    -- upvalues: l_isPromise_0 (copy), v66 (ref)
    if l_isPromise_0(v99) then
        return v99:andThen(function(v100) --[[ Line: 301 ]]
            -- upvalues: v66 (ref), v98 (copy)
            return v66(v98, v100);
        end);
    elseif #v98.errors == 0 then
        return {
            data = v99
        };
    else
        return {
            errors = v98.errors, 
            data = v99
        };
    end;
end;
v59 = function(v101, v102, v103) --[[ Line: 320 ]] --[[ Name: assertValidExecutionArguments ]]
    -- upvalues: l_devAssert_0 (copy), l_assertValidSchema_0 (copy), l_isObjectLike_0 (copy)
    l_devAssert_0(v102, "Must provide document.");
    l_assertValidSchema_0(v101);
    local l_l_devAssert_0_0 = l_devAssert_0;
    local v105 = true;
    if v103 ~= nil then
        v105 = l_isObjectLike_0(v103);
    end;
    l_l_devAssert_0_0(v105, "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.");
end;
v60 = function(v106, v107, v108, v109, v110, v111, v112, v113) --[[ Line: 345 ]] --[[ Name: buildExecutionContext ]]
    -- upvalues: l_Kind_0 (copy), l_GraphQLError_0 (copy), l_getVariableValues_0 (copy), v64 (ref), v63 (ref)
    local v114 = nil;
    local v115 = {};
    for _, v117 in ipairs(v107.definitions) do
        if v117.kind == l_Kind_0.OPERATION_DEFINITION then
            if v111 == nil then
                if v114 ~= nil then
                    return {
                        l_GraphQLError_0.new("Must provide operation name if query contains multiple operations.")
                    };
                else
                    v114 = v117;
                end;
            elseif (v117.name and v117.name.value) == v111 then
                v114 = v117;
            end;
        elseif v117.kind == l_Kind_0.FRAGMENT_DEFINITION then
            v115[v117.name.value] = v117;
        end;
    end;
    if not v114 then
        if v111 ~= nil then
            return {
                l_GraphQLError_0.new(("Unknown operation named \"%s\"."):format(v111))
            };
        else
            return {
                l_GraphQLError_0.new("Must provide an operation.")
            };
        end;
    else
        local v118 = v114.variableDefinitions or {};
        local v119 = l_getVariableValues_0(v106, v118, v110 or {}, {
            maxErrors = 50
        });
        if v119.errors then
            return v119.errors;
        else
            return {
                schema = v106, 
                fragments = v115, 
                rootValue = v108, 
                contextValue = v109, 
                operation = v114, 
                variableValues = v119.coerced, 
                fieldResolver = v112 or v64, 
                typeResolver = v113 or v63, 
                errors = {}
            };
        end;
    end;
end;
v67 = function(v120, v121, v122) --[[ Line: 421 ]] --[[ Name: executeOperation ]]
    -- upvalues: l_getOperationRootType_0 (copy), v61 (ref), l_Map_0 (copy), v68 (ref), v69 (ref), l_isPromise_0 (copy), v16 (copy), v17 (copy)
    local v123 = l_getOperationRootType_0(v120.schema, v121);
    local v124 = v61(v120, v123, v121.selectionSet, l_Map_0.new(), {});
    local v125 = nil;
    local v126 = nil;
    if v121.operation == "mutation" then
        local l_status_0, l_result_0 = pcall(v68, v120, v123, v122, nil, v124);
        v125 = l_status_0;
        v126 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(v69, v120, v123, v122, nil, v124);
        v125 = l_status_1;
        v126 = l_result_1;
    end;
    if l_isPromise_0(v126) then
        return v126:andThen(nil, function(v131) --[[ Line: 450 ]]
            -- upvalues: v120 (copy), v16 (ref), v17 (ref)
            table.insert(v120.errors, v131);
            return v16.resolve(v17);
        end);
    elseif not v125 then
        table.insert(v120.errors, v126);
        return v17;
    else
        return v126;
    end;
end;
v68 = function(v132, v133, v134, v135, v136) --[[ Line: 467 ]] --[[ Name: executeFieldsSerially ]]
    -- upvalues: l_promiseReduce_0 (copy), l_addPath_0 (copy), v73 (ref), l_isPromise_0 (copy)
    return l_promiseReduce_0(v136:keys(), function(v137, v138) --[[ Line: 477 ]]
        -- upvalues: v136 (copy), l_addPath_0 (ref), v135 (copy), v133 (copy), v73 (ref), v132 (copy), v134 (copy), l_isPromise_0 (ref)
        local v139 = v136[v138];
        local v140 = l_addPath_0(v135, v138, v133.name);
        local v141 = v73(v132, v133, v134, v139, v140);
        if v141 == nil then
            return v137;
        elseif l_isPromise_0(v141) then
            return v141:andThen(function(v142) --[[ Line: 489 ]]
                -- upvalues: v137 (copy), v138 (copy)
                v137[v138] = v142;
                return v137;
            end);
        else
            v137[v138] = v141;
            return v137;
        end;
    end, {});
end;
v69 = function(v143, v144, v145, v146, v147) --[[ Line: 508 ]] --[[ Name: executeFields ]]
    -- upvalues: l_addPath_0 (copy), v73 (ref), l_isPromise_0 (copy), l_promiseForObject_0 (copy)
    local v148 = {};
    local v149 = false;
    for _, v151 in ipairs(v147:keys()) do
        local v152 = v147[v151];
        local v153 = l_addPath_0(v146, v151, v144.name);
        local v154 = v73(v143, v144, v145, v152, v153);
        if v154 ~= nil then
            v148[v151] = v154;
            if l_isPromise_0(v154) then
                v149 = true;
            end;
        end;
    end;
    if not v149 then
        return v148;
    else
        return l_promiseForObject_0(v148);
    end;
end;
v61 = function(v155, v156, v157, v158, v159) --[[ Line: 555 ]] --[[ Name: collectFields ]]
    -- upvalues: l_Kind_0 (copy), v70 (ref), v72 (ref), v71 (ref), v61 (ref)
    for _, v161 in ipairs(v157.selections) do
        if v161.kind == l_Kind_0.FIELD then
            if v70(v155, v161) then
                local v162 = v72(v161);
                if not v158[v162] then
                    v158[v162] = {};
                end;
                table.insert(v158[v162], v161);
            end;
        elseif v161.kind == l_Kind_0.INLINE_FRAGMENT then
            if v70(v155, v161) and v71(v155, v161, v156) then
                v61(v155, v156, v161.selectionSet, v158, v159);
            end;
        elseif v161.kind == l_Kind_0.FRAGMENT_SPREAD then
            local l_value_0 = v161.name.value;
            if not v159[l_value_0] and v70(v155, v161) then
                v159[l_value_0] = true;
                local v164 = v155.fragments[l_value_0];
                if v164 and v71(v155, v164, v156) then
                    v61(v155, v156, v164.selectionSet, v158, v159);
                end;
            end;
        end;
    end;
    return v158;
end;
v70 = function(v165, v166) --[[ Line: 616 ]] --[[ Name: shouldIncludeNode ]]
    -- upvalues: l_getDirectiveValues_0 (copy), l_GraphQLSkipDirective_0 (copy), l_GraphQLIncludeDirective_0 (copy)
    local v167 = l_getDirectiveValues_0(l_GraphQLSkipDirective_0, v166, v165.variableValues);
    if (v167 and v167["if"]) == true then
        return false;
    else
        local v168 = l_getDirectiveValues_0(l_GraphQLIncludeDirective_0, v166, v165.variableValues);
        if (v168 and v168["if"]) == false then
            return false;
        else
            return true;
        end;
    end;
end;
v71 = function(v169, v170, v171) --[[ Line: 638 ]] --[[ Name: doesFragmentConditionMatch ]]
    -- upvalues: l_typeFromAST_0 (copy), l_isAbstractType_0 (copy)
    local l_typeCondition_0 = v170.typeCondition;
    if not l_typeCondition_0 then
        return true;
    else
        local v173 = l_typeFromAST_0(v169.schema, l_typeCondition_0);
        if v173 == v171 then
            return true;
        elseif l_isAbstractType_0(v173) then
            return v169.schema:isSubType(v173, v171);
        else
            return false;
        end;
    end;
end;
v72 = function(v174) --[[ Line: 670 ]] --[[ Name: getFieldEntryKey ]]
    if v174.alias then
        return v174.alias.value;
    else
        return v174.name.value;
    end;
end;
v73 = function(v175, v176, v177, v178, v179) --[[ Line: 680 ]] --[[ Name: resolveField ]]
    -- upvalues: v65 (ref), v62 (ref), l_getArgumentValues_0 (copy), l_isPromise_0 (copy), v75 (ref), l_locatedError_0 (copy), l_pathToArray_0 (copy), v74 (ref)
    local l_value_1 = v178[1].name.value;
    local v181 = v65(v175.schema, v176, l_value_1);
    if not v181 then
        return;
    else
        local l_type_1 = v181.type;
        local v183 = if v181.resolve then v181.resolve else v175.fieldResolver;
        local v184 = v62(v175, v181, v178, v176, v179);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 711 ]]
            -- upvalues: l_getArgumentValues_0 (ref), v181 (copy), v178 (copy), v175 (copy), v183 (copy), v177 (copy), v184 (copy), l_isPromise_0 (ref), v75 (ref), l_type_1 (copy), v179 (copy), l_locatedError_0 (ref), l_pathToArray_0 (ref), v74 (ref)
            local v185 = l_getArgumentValues_0(v181, v178[1], v175.variableValues);
            local l_contextValue_1 = v175.contextValue;
            local v187 = v183(v177, v185, l_contextValue_1, v184);
            local v188 = nil;
            v188 = if l_isPromise_0(v187) then v187:andThen(function(v189) --[[ Line: 736 ]]
                -- upvalues: v75 (ref), v175 (ref), l_type_1 (ref), v178 (ref), v184 (ref), v179 (ref)
                return v75(v175, l_type_1, v178, v184, v179, v189);
            end) else v75(v175, l_type_1, v178, v184, v179, v187);
            if l_isPromise_0(v188) then
                return v188:andThen(nil, function(v190) --[[ Line: 746 ]]
                    -- upvalues: l_locatedError_0 (ref), v178 (ref), l_pathToArray_0 (ref), v179 (ref), v74 (ref), l_type_1 (ref), v175 (ref)
                    local v191 = l_locatedError_0(v190, v178, l_pathToArray_0(v179));
                    return v74(v191, l_type_1, v175);
                end);
            else
                return v188;
            end;
        end);
        if not l_status_2 then
            local v194 = l_locatedError_0(l_result_2, v178, l_pathToArray_0(v179));
            return v74(v194, l_type_1, v175);
        else
            return l_result_2;
        end;
    end;
end;
v62 = function(v195, v196, v197, v198, v199) --[[ Line: 766 ]] --[[ Name: buildResolveInfo ]]
    return {
        fieldName = v196.name, 
        fieldNodes = v197, 
        returnType = v196.type, 
        parentType = v198, 
        path = v199, 
        schema = v195.schema, 
        fragments = v195.fragments, 
        rootValue = v195.rootValue, 
        operation = v195.operation, 
        variableValues = v195.variableValues
    };
end;
v74 = function(v200, v201, v202) --[[ Line: 789 ]] --[[ Name: handleFieldError ]]
    -- upvalues: l_isNonNullType_0 (copy), v17 (copy)
    if l_isNonNullType_0(v201) then
        error(v200);
    end;
    table.insert(v202.errors, v200);
    return v17;
end;
v75 = function(v203, v204, v205, v206, v207, v208) --[[ Line: 827 ]] --[[ Name: completeValue ]]
    -- upvalues: l_instanceof_0 (copy), l_Error_0 (copy), l_isNonNullType_0 (copy), v75 (ref), l_isNillish_0 (copy), v17 (copy), l_isListType_0 (copy), v76 (ref), l_isLeafType_0 (copy), v77 (ref), l_isAbstractType_0 (copy), v78 (ref), l_isObjectType_0 (copy), v80 (ref), l_invariant_0 (copy), l_inspect_0 (copy)
    if l_instanceof_0(v208, l_Error_0) then
        error(v208);
    end;
    if l_isNonNullType_0(v204) then
        local v209 = v75(v203, v204.ofType, v205, v206, v207, v208);
        if l_isNillish_0(v209) then
            error(l_Error_0.new(("Cannot return null for non-nullable field %s.%s."):format(v206.parentType.name, v206.fieldName)));
        end;
        return v209;
    elseif l_isNillish_0(v208) then
        return v17;
    elseif l_isListType_0(v204) then
        return v76(v203, v204, v205, v206, v207, v208);
    elseif l_isLeafType_0(v204) then
        return v77(v204, v208);
    elseif l_isAbstractType_0(v204) then
        return v78(v203, v204, v205, v206, v207, v208);
    elseif l_isObjectType_0(v204) then
        return v80(v203, v204, v205, v206, v207, v208);
    else
        l_invariant_0(false, "Cannot complete value of unexpected output type: " .. l_inspect_0(v204));
        assert(false, "Cannot complete value of unexpected output type: " .. l_inspect_0(v204));
        return;
    end;
end;
v76 = function(v210, v211, v212, v213, v214, v215) --[[ Line: 932 ]] --[[ Name: completeListValue ]]
    -- upvalues: l_instanceof_0 (copy), l_Set_0 (copy), l_isIteratableObject_0 (copy), l_GraphQLError_0 (copy), l_Array_0 (copy), l_addPath_0 (copy), l_isPromise_0 (copy), v75 (ref), l_locatedError_0 (copy), l_pathToArray_0 (copy), v74 (ref), v16 (copy)
    if l_instanceof_0(v215, l_Set_0) then
        local v216 = {};
        for _, v218 in v215 do
            table.insert(v216, v218);
        end;
        v215 = v216;
    end;
    if not l_isIteratableObject_0(v215) then
        error(l_GraphQLError_0.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(v213.parentType.name, v213.fieldName)));
    end;
    local l_ofType_0 = v211.ofType;
    local v220 = false;
    local v221 = false;
    local v232 = l_Array_0.from(v215, function(v222, v223) --[[ Line: 967 ]]
        -- upvalues: l_addPath_0 (ref), v214 (copy), l_isPromise_0 (ref), v75 (ref), v210 (copy), l_ofType_0 (copy), v212 (copy), v213 (copy), v220 (ref), l_locatedError_0 (ref), l_pathToArray_0 (ref), v74 (ref), v221 (ref)
        local v224 = l_addPath_0(v214, v223, nil);
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 972 ]]
            -- upvalues: l_isPromise_0 (ref), v222 (copy), v75 (ref), v210 (ref), l_ofType_0 (ref), v212 (ref), v213 (ref), v224 (copy), v220 (ref), l_locatedError_0 (ref), l_pathToArray_0 (ref), v74 (ref), v221 (ref)
            local v225 = nil;
            v225 = if l_isPromise_0(v222) then v222:andThen(function(v226) --[[ Line: 975 ]]
                -- upvalues: v75 (ref), v210 (ref), l_ofType_0 (ref), v212 (ref), v213 (ref), v224 (ref)
                return v75(v210, l_ofType_0, v212, v213, v224, v226);
            end) else v75(v210, l_ofType_0, v212, v213, v224, v222);
            if l_isPromise_0(v225) then
                v220 = true;
                return v225:andThen(nil, function(v227) --[[ Line: 993 ]]
                    -- upvalues: l_locatedError_0 (ref), v212 (ref), l_pathToArray_0 (ref), v224 (ref), v74 (ref), l_ofType_0 (ref), v210 (ref)
                    local v228 = l_locatedError_0(v227, v212, l_pathToArray_0(v224));
                    return v74(v228, l_ofType_0, v210);
                end);
            else
                v221 = true;
                return v225;
            end;
        end);
        if not l_status_3 then
            local v231 = l_locatedError_0(l_result_3, v212, l_pathToArray_0(v224));
            return v74(v231, l_ofType_0, v210);
        else
            return l_result_3;
        end;
    end);
    if v221 and v220 then
        v232 = l_Array_0.map(v232, function(v233) --[[ Line: 1015 ]]
            -- upvalues: l_isPromise_0 (ref), v16 (ref)
            if l_isPromise_0(v233) then
                return v233;
            else
                return (v16.resolve(v233));
            end;
        end);
    end;
    return if v220 then v16.all(v232) else v232;
end;
v77 = function(v234, v235) --[[ Line: 1028 ]] --[[ Name: completeLeafValue ]]
    -- upvalues: l_Error_0 (copy), l_inspect_0 (copy)
    local v236 = v234:serialize(v235);
    if v236 == nil then
        error(l_Error_0.new(("Expected a value of type \"%s\" but "):format(l_inspect_0(v234)) .. ("received: %s"):format(l_inspect_0(v235))));
    end;
    return v236;
end;
v78 = function(v237, v238, v239, v240, v241, v242) --[[ Line: 1048 ]] --[[ Name: completeAbstractValue ]]
    -- upvalues: l_isPromise_0 (copy), v80 (ref), v79 (ref)
    local v243 = (if v238.resolveType then v238.resolveType else v237.typeResolver)(v242, v237.contextValue, v240, v238);
    if l_isPromise_0(v243) then
        return v243:andThen(function(v244) --[[ Line: 1066 ]]
            -- upvalues: v80 (ref), v237 (copy), v79 (ref), v238 (copy), v239 (copy), v240 (copy), v242 (copy), v241 (copy)
            return v80(v237, v79(v244, v237, v238, v239, v240, v242), v239, v240, v241, v242);
        end);
    else
        return v80(v237, v79(v243, v237, v238, v239, v240, v242), v239, v240, v241, v242);
    end;
end;
v79 = function(v245, v246, v247, v248, v249, v250) --[[ Line: 1103 ]] --[[ Name: ensureValidRuntimeType ]]
    -- upvalues: l_GraphQLError_0 (copy), l_isObjectType_0 (copy), l_inspect_0 (copy)
    if v245 == nil then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(v247.name, v249.parentType.name, v249.fieldName, v247.name), v248));
    end;
    if l_isObjectType_0(v245) then
        error(l_GraphQLError_0.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."));
    end;
    if typeof(v245) ~= "string" then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(v247.name, v249.parentType.name, v249.fieldName) .. ("value %s, received \"%s\"."):format(l_inspect_0(v250), l_inspect_0(v245))));
    end;
    local v251 = v246.schema:getType(v245);
    if v251 == nil then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(v247.name, v245), v248));
    end;
    if not l_isObjectType_0(v251) then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(v247.name, v245), v248));
    end;
    if not v246.schema:isSubType(v247, v251) then
        error(l_GraphQLError_0.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(v251.name, v247.name), v248));
    end;
    return v251;
end;
v80 = function(v252, v253, v254, v255, v256, v257) --[[ Line: 1190 ]] --[[ Name: completeObjectValue ]]
    -- upvalues: l_isPromise_0 (copy), v81 (ref), v82 (ref)
    if v253.isTypeOf ~= nil then
        local v258 = v253:isTypeOf(v257, v252.contextValue, v255);
        if l_isPromise_0(v258) then
            return v258:andThen(function(v259) --[[ Line: 1206 ]]
                -- upvalues: v81 (ref), v253 (copy), v257 (copy), v254 (copy), v82 (ref), v252 (copy), v256 (copy)
                if not v259 then
                    error(v81(v253, v257, v254));
                end;
                return v82(v252, v253, v254, v256, v257);
            end);
        elseif not v258 then
            error(v81(v253, v257, v254));
        end;
    end;
    return v82(v252, v253, v254, v256, v257);
end;
v81 = function(v260, v261, v262) --[[ Line: 1223 ]] --[[ Name: invalidReturnTypeError ]]
    -- upvalues: l_GraphQLError_0 (copy), l_inspect_0 (copy)
    return l_GraphQLError_0.new(("Expected value of type \"%s\" but got: %s."):format(v260.name, l_inspect_0(v261)), v262);
end;
v82 = function(v263, v264, v265, v266, v267) --[[ Line: 1234 ]] --[[ Name: collectAndExecuteSubfields ]]
    -- upvalues: v84 (ref), v69 (ref)
    local v268 = v84(v263, v264, v265);
    return v69(v263, v264, v267, v266, v268);
end;
v84 = l_memoize3_0(function(v269, v270, v271) --[[ Line: 1250 ]] --[[ Name: _collectSubfields ]]
    -- upvalues: l_Map_0 (copy), v61 (ref)
    local v272 = l_Map_0.new();
    local v273 = {};
    for _, v275 in ipairs(v271) do
        if v275.selectionSet then
            v272 = v61(v269, v270, v275.selectionSet, v272, v273);
        end;
    end;
    return v272;
end);
v63 = function(v276, v277, v278, v279) --[[ Line: 1290 ]]
    -- upvalues: l_isObjectLike_0 (copy), l_isPromise_0 (copy), v16 (copy)
    if l_isObjectLike_0(v276) and typeof(v276.__typename) == "string" then
        return v276.__typename;
    else
        local v280 = v278.schema:getPossibleTypes(v279);
        local v281 = {};
        for v282 = 1, #v280 do
            local v283 = v280[v282];
            if v283.isTypeOf then
                local v284 = v283:isTypeOf(v276, v277, v278);
                if l_isPromise_0(v284) then
                    v281[v282] = v284;
                elseif v284 then
                    return v283.name;
                end;
            end;
        end;
        if #v281 > 0 then
            return v16.all(v281):andThen(function(v285) --[[ Line: 1315 ]]
                -- upvalues: v280 (copy)
                for v286 = 1, #v285 do
                    if v285[v286] then
                        return v280[v286].name;
                    end;
                end;
                return nil;
            end);
        else
            return nil;
        end;
    end;
end;
v64 = function(v287, v288, v289, v290) --[[ Line: 1334 ]]
    -- upvalues: l_isObjectLike_0 (copy)
    if l_isObjectLike_0(v287) or typeof(v287) == "function" then
        local v291 = v287[v290.fieldName];
        if typeof(v291) == "function" then
            return v287[v290.fieldName](v287, v288, v289, v290);
        else
            return v291;
        end;
    else
        return nil;
    end;
end;
v65 = function(v292, v293, v294) --[[ Line: 1358 ]] --[[ Name: getFieldDef ]]
    -- upvalues: l_SchemaMetaFieldDef_0 (copy), l_TypeMetaFieldDef_0 (copy), l_TypeNameMetaFieldDef_0 (copy)
    if v294 == l_SchemaMetaFieldDef_0.name and v292:getQueryType() == v293 then
        return l_SchemaMetaFieldDef_0;
    elseif v294 == l_TypeMetaFieldDef_0.name and v292:getQueryType() == v293 then
        return l_TypeMetaFieldDef_0;
    elseif v294 == l_TypeNameMetaFieldDef_0.name then
        return l_TypeNameMetaFieldDef_0;
    else
        return v293:getFields():get(v294);
    end;
end;
return {
    execute = v57, 
    executeSync = v58, 
    assertValidExecutionArguments = v59, 
    buildExecutionContext = v60, 
    collectFields = v61, 
    buildResolveInfo = v62, 
    getFieldDef = v65, 
    defaultFieldResolver = v64, 
    defaultTypeResolver = v63
};