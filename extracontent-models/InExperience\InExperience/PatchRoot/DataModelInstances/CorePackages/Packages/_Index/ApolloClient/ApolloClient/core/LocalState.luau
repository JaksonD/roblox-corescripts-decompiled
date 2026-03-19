local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v7 = require(l_Parent_1.Promise);
local l_NULL_0 = require(l_Parent_0.utilities.globals.null).NULL;
local v9 = {};
local v10 = require(l_Parent_1.GraphQL);
local l_visit_0 = v10.visit;
local l_BREAK_0 = v10.BREAK;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(script.Parent.Parent.cache);
local v15 = require(script.Parent.Parent.utilities);
local l_argumentsObjectFromField_0 = v15.argumentsObjectFromField;
local l_buildQueryFromSelectionSet_0 = v15.buildQueryFromSelectionSet;
local l_createFragmentMap_0 = v15.createFragmentMap;
local l_getFragmentDefinitions_0 = v15.getFragmentDefinitions;
local l_getMainDefinition_0 = v15.getMainDefinition;
local l_hasDirectives_0 = v15.hasDirectives;
local l_isField_0 = v15.isField;
local l_isInlineFragment_0 = v15.isInlineFragment;
local l_mergeDeep_0 = v15.mergeDeep;
local l_mergeDeepArray_0 = v15.mergeDeepArray;
local l_removeClientSetsFromDocument_0 = v15.removeClientSetsFromDocument;
local l_resultKeyNameFromField_0 = v15.resultKeyNameFromField;
local l_shouldInclude_0 = v15.shouldInclude;
local _ = require(script.Parent.ApolloClient_types);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.link.core);
local l_cacheSlot_0 = require(script.Parent.Parent.cache).cacheSlot;
local v33 = {};
v33.__index = v33;
v33.new = function(v34) --[[ Line: 185 ]] --[[ Name: new ]]
    -- upvalues: v33 (copy)
    local v35 = setmetatable({}, v33);
    local l_cache_0 = v34.cache;
    local l_client_0 = v34.client;
    local l_resolvers_0 = v34.resolvers;
    local l_fragmentMatcher_0 = v34.fragmentMatcher;
    v35.cache = l_cache_0;
    if l_client_0 ~= nil then
        v35.client = l_client_0;
    end;
    if l_resolvers_0 ~= nil then
        v35:addResolvers(l_resolvers_0);
    end;
    if l_fragmentMatcher_0 ~= nil then
        v35:setFragmentMatcher(l_fragmentMatcher_0);
    end;
    return v35;
end;
v33.addResolvers = function(v40, v41) --[[ Line: 206 ]] --[[ Name: addResolvers ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_mergeDeep_0 (copy)
    v40.resolvers = l_Boolean_0.toJSBoolean(v40.resolvers) and v40.resolvers or {};
    if l_Array_0.isArray(v41) then
        l_Array_0.forEach(v41, function(v42) --[[ Line: 209 ]]
            -- upvalues: v40 (copy), l_mergeDeep_0 (ref)
            v40.resolvers = l_mergeDeep_0(v40.resolvers, v42);
        end);
        return;
    else
        v40.resolvers = l_mergeDeep_0(v40.resolvers, v41);
        return;
    end;
end;
v33.setResolvers = function(v43, v44) --[[ Line: 217 ]] --[[ Name: setResolvers ]]
    v43.resolvers = {};
    v43:addResolvers(v44);
end;
v33.getResolvers = function(v45) --[[ Line: 222 ]] --[[ Name: getResolvers ]]
    -- upvalues: l_Boolean_0 (copy)
    return l_Boolean_0.toJSBoolean(v45.resolvers) and v45.resolvers or {};
end;
v33.runResolvers = function(v46, v47) --[[ Line: 230 ]] --[[ Name: runResolvers ]]
    -- upvalues: l_Boolean_0 (copy), l_Object_0 (copy), v7 (copy)
    local l_document_0 = v47.document;
    local l_remoteResult_0 = v47.remoteResult;
    local l_context_0 = v47.context;
    local l_variables_0 = v47.variables;
    local l_onlyRunForcedResolvers_0 = v47.onlyRunForcedResolvers;
    if v47.onlyRunForcedResolvers == nil then
        l_onlyRunForcedResolvers_0 = false;
    end;
    if l_Boolean_0.toJSBoolean(l_document_0) then
        return v46:resolveDocument(l_document_0, l_remoteResult_0.data, l_context_0, l_variables_0, v46.fragmentMatcher, l_onlyRunForcedResolvers_0):andThen(function(v53) --[[ Line: 251 ]]
            -- upvalues: l_Object_0 (ref), l_remoteResult_0 (copy)
            return l_Object_0.assign({}, l_remoteResult_0, {
                data = v53.result
            });
        end);
    else
        return v7.resolve(l_remoteResult_0);
    end;
end;
v33.setFragmentMatcher = function(v54, v55) --[[ Line: 259 ]] --[[ Name: setFragmentMatcher ]]
    v54.fragmentMatcher = v55;
end;
v33.getFragmentMatcher = function(v56) --[[ Line: 263 ]] --[[ Name: getFragmentMatcher ]]
    return v56.fragmentMatcher;
end;
v33.clientQuery = function(v57, v58) --[[ Line: 269 ]] --[[ Name: clientQuery ]]
    -- upvalues: l_hasDirectives_0 (copy), l_Boolean_0 (copy), l_NULL_0 (copy)
    if l_hasDirectives_0({
        "client"
    }, v58) and l_Boolean_0.toJSBoolean(v57.resolvers) then
        return v58;
    else
        return l_NULL_0;
    end;
end;
v33.serverQuery = function(_, v60) --[[ Line: 279 ]] --[[ Name: serverQuery ]]
    -- upvalues: l_removeClientSetsFromDocument_0 (copy)
    return l_removeClientSetsFromDocument_0(v60);
end;
v33.prepareContext = function(v61, v62) --[[ Line: 283 ]] --[[ Name: prepareContext ]]
    -- upvalues: l_Object_0 (copy)
    local l_cache_1 = v61.cache;
    return l_Object_0.assign({}, v62, {
        cache = l_cache_1, 
        getCacheKey = function(_, v65) --[[ Line: 291 ]] --[[ Name: getCacheKey ]]
            -- upvalues: l_cache_1 (copy)
            return l_cache_1:identify(v65);
        end
    });
end;
v33.addExportedVariables = function(v66, v67, v68, v69) --[[ Line: 300 ]] --[[ Name: addExportedVariables ]]
    -- upvalues: l_Boolean_0 (copy), l_Object_0 (copy), v7 (copy)
    if v68 == nil then
        v68 = {};
    end;
    if v69 == nil then
        v69 = {};
    end;
    if l_Boolean_0.toJSBoolean(v67) then
        local v70 = v66:buildRootValueFromCache(v67, v68);
        return v66:resolveDocument(v67, l_Boolean_0.toJSBoolean(v70) and v70 or {}, v66:prepareContext(v69), v68):andThen(function(v71) --[[ Line: 319 ]]
            -- upvalues: l_Object_0 (ref), v68 (ref)
            return l_Object_0.assign({}, v68, v71.exportedVariables);
        end);
    else
        return v7.resolve(l_Object_0.assign({}, v68));
    end;
end;
v33.shouldForceResolvers = function(_, v73) --[[ Line: 327 ]] --[[ Name: shouldForceResolvers ]]
    -- upvalues: l_visit_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_BREAK_0 (copy)
    local v74 = false;
    l_visit_0(v73, {
        Directive = {
            enter = function(_, v76) --[[ Line: 331 ]] --[[ Name: enter ]]
                -- upvalues: l_Boolean_0 (ref), v74 (ref), l_Array_0 (ref), l_BREAK_0 (ref)
                if v76.name.value == "client" and l_Boolean_0.toJSBoolean(v76.arguments) then
                    v74 = l_Array_0.some(v76.arguments, function(v77) --[[ Line: 333 ]]
                        local v78 = false;
                        if v77.name.value == "always" then
                            v78 = false;
                            if v77.value.kind == "BooleanValue" then
                                v78 = v77.value.value == true;
                            end;
                        end;
                        return v78;
                    end);
                    if v74 then
                        return l_BREAK_0;
                    end;
                end;
                return nil;
            end
        }
    });
    return v74;
end;
v33.buildRootValueFromCache = function(v79, v80, v81) --[[ Line: 350 ]] --[[ Name: buildRootValueFromCache ]]
    -- upvalues: l_buildQueryFromSelectionSet_0 (copy)
    return v79.cache:diff({
        query = l_buildQueryFromSelectionSet_0(v80), 
        variables = v81, 
        returnPartialData = true, 
        optimistic = false
    }).result;
end;
v33.resolveDocument = function(v82, v83, v84, v85, v86, v87, v88) --[[ Line: 359 ]] --[[ Name: resolveDocument ]]
    -- upvalues: l_getMainDefinition_0 (copy), l_getFragmentDefinitions_0 (copy), l_createFragmentMap_0 (copy), l_Boolean_0 (copy), l_String_0 (copy), l_Object_0 (copy)
    if v85 == nil then
        v85 = {};
    end;
    if v86 == nil then
        v86 = {};
    end;
    if v87 == nil then
        v87 = function() --[[ Line: 377 ]]
            return true;
        end;
    end;
    if v88 == nil then
        v88 = false;
    end;
    local v89 = l_getMainDefinition_0(v83);
    local v90 = l_getFragmentDefinitions_0(v83);
    local v91 = l_createFragmentMap_0(v90);
    local l_operation_0 = v89.operation;
    local v93 = nil;
    v93 = if l_Boolean_0.toJSBoolean(l_operation_0) then string.upper((string.sub(l_operation_0, 1, 1))) .. l_String_0.slice(l_operation_0, 2) else "Query";
    local l_cache_2 = v82.cache;
    local l_client_1 = v82.client;
    local v96 = {
        fragmentMap = v91, 
        context = l_Object_0.assign({}, v85, {
            cache = l_cache_2, 
            client = l_client_1
        }), 
        variables = v86, 
        fragmentMatcher = v87, 
        defaultOperationType = v93, 
        exportedVariables = {}, 
        onlyRunForcedResolvers = v88
    };
    return v82:resolveSelectionSet(v89.selectionSet, v84, v96):andThen(function(v97) --[[ Line: 413 ]]
        -- upvalues: v96 (copy)
        return {
            result = v97, 
            exportedVariables = v96.exportedVariables
        };
    end);
end;
v33.resolveSelectionSet = function(v98, v99, v100, v101) --[[ Line: 418 ]] --[[ Name: resolveSelectionSet ]]
    -- upvalues: l_Boolean_0 (copy), l_shouldInclude_0 (copy), v7 (copy), l_isField_0 (copy), l_resultKeyNameFromField_0 (copy), l_isInlineFragment_0 (copy), l_invariant_0 (copy), l_Array_0 (copy), l_mergeDeepArray_0 (copy)
    local l_fragmentMap_0 = v101.fragmentMap;
    local l_context_1 = v101.context;
    local l_variables_1 = v101.variables;
    local v105 = {
        v100
    };
    local function v111(v106) --[[ Line: 426 ]] --[[ Name: execute ]]
        -- upvalues: l_Boolean_0 (ref), l_shouldInclude_0 (ref), l_variables_1 (copy), v7 (ref), l_isField_0 (ref), v98 (copy), v100 (copy), v101 (copy), v105 (copy), l_resultKeyNameFromField_0 (ref), l_isInlineFragment_0 (ref), l_fragmentMap_0 (copy), l_invariant_0 (ref), l_context_1 (copy)
        if not l_Boolean_0.toJSBoolean(l_shouldInclude_0(v106, l_variables_1)) then
            return v7.resolve(nil);
        elseif l_isField_0(v106) then
            return v98:resolveField(v106, v100, v101):andThen(function(v107) --[[ Line: 433 ]]
                -- upvalues: v105 (ref), l_resultKeyNameFromField_0 (ref), v106 (copy)
                if typeof(v107) ~= "nil" then
                    table.insert(v105, {
                        [l_resultKeyNameFromField_0(v106)] = v107
                    });
                end;
            end);
        else
            local v108 = nil;
            if l_isInlineFragment_0(v106) then
                v108 = v106;
            else
                v108 = l_fragmentMap_0[v106.name.value];
                l_invariant_0(v108, ("No fragment named %s"):format(v106.name.value));
            end;
            if v108 and v108.typeCondition ~= nil then
                local l_value_0 = v108.typeCondition.name.value;
                if l_Boolean_0.toJSBoolean(v101:fragmentMatcher(v100, l_value_0, l_context_1)) then
                    return v98:resolveSelectionSet(v108.selectionSet, v100, v101):andThen(function(v110) --[[ Line: 454 ]]
                        -- upvalues: v105 (ref)
                        table.insert(v105, v110);
                    end);
                end;
            end;
            return v7.resolve(nil);
        end;
    end;
    return v7.all(l_Array_0.map(v99.selections, v111)):andThen(function() --[[ Line: 462 ]]
        -- upvalues: l_mergeDeepArray_0 (ref), v105 (copy)
        return l_mergeDeepArray_0(v105);
    end);
end;
v33.resolveField = function(v112, v113, v114, v115) --[[ Line: 467 ]] --[[ Name: resolveField ]]
    -- upvalues: l_resultKeyNameFromField_0 (copy), l_Boolean_0 (copy), v7 (copy), l_cacheSlot_0 (copy), l_argumentsObjectFromField_0 (copy), l_Array_0 (copy), l_NULL_0 (copy)
    local l_variables_2 = v115.variables;
    local l_value_1 = v113.name.value;
    local v118 = l_resultKeyNameFromField_0(v113);
    local v119 = l_value_1 ~= v118;
    local v120 = l_Boolean_0.toJSBoolean(v114[v118]) and v114[v118] or v114[l_value_1];
    local v121 = v7.resolve(v120);
    if not v115.onlyRunForcedResolvers or v112:shouldForceResolvers(v113) then
        local v122 = l_Boolean_0.toJSBoolean(v114.__typename) and v114.__typename or v115.defaultOperationType;
        local v123 = nil;
        v123 = if l_Boolean_0.toJSBoolean(v112.resolvers) then v112.resolvers[tostring(v122)] else v112.resolvers;
        if l_Boolean_0.toJSBoolean(v123) then
            local v124 = v123[if v119 then l_value_1 else v118];
            if l_Boolean_0.toJSBoolean(v124) then
                v121 = v7.resolve(l_cacheSlot_0:withValue(v112.cache, v124, {
                    v114, 
                    l_argumentsObjectFromField_0(v113, l_variables_2), 
                    v115.context, 
                    {
                        field = v113, 
                        fragmentMap = v115.fragmentMap
                    }
                }));
            end;
        end;
    end;
    return v121:andThen(function(v125) --[[ Line: 512 ]]
        -- upvalues: v120 (copy), v113 (copy), l_Array_0 (ref), l_Boolean_0 (ref), v115 (copy), l_NULL_0 (ref), v112 (copy)
        if v125 == nil then
            v125 = v120;
        end;
        if v113.directives ~= nil then
            l_Array_0.forEach(v113.directives, function(v126) --[[ Line: 519 ]]
                -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), v115 (ref), v125 (ref)
                if v126.name.value == "export" and l_Boolean_0.toJSBoolean(v126.arguments) then
                    l_Array_0.forEach(v126.arguments, function(v127) --[[ Line: 521 ]]
                        -- upvalues: v115 (ref), v125 (ref)
                        if v127.name.value == "as" and v127.value.kind == "StringValue" then
                            v115.exportedVariables[v127.value.value] = v125;
                        end;
                    end);
                end;
            end);
        end;
        if not l_Boolean_0.toJSBoolean(v113.selectionSet) then
            return v125;
        elseif v125 == nil or v125 == l_NULL_0 then
            return v125;
        elseif l_Array_0.isArray(v125) then
            return v112:resolveSubSelectedArray(v113, v125, v115);
        elseif l_Boolean_0.toJSBoolean(v113.selectionSet) then
            return v112:resolveSelectionSet(v113.selectionSet, v125, v115);
        else
            return nil;
        end;
    end);
end;
v33.resolveSubSelectedArray = function(v128, v129, v130, v131) --[[ Line: 554 ]] --[[ Name: resolveSubSelectedArray ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_NULL_0 (copy), l_Boolean_0 (copy)
    return v7.all(l_Array_0.map(v130, function(v132) --[[ Line: 555 ]]
        -- upvalues: l_NULL_0 (ref), l_Array_0 (ref), v128 (copy), v129 (copy), v131 (copy), l_Boolean_0 (ref)
        if v132 == l_NULL_0 then
            return l_NULL_0;
        elseif l_Array_0.isArray(v132) then
            return v128:resolveSubSelectedArray(v129, v132, v131);
        elseif l_Boolean_0.toJSBoolean(v129.selectionSet) then
            return v128:resolveSelectionSet(v129.selectionSet, v132, v131);
        else
            return nil;
        end;
    end));
end;
v9.LocalState = v33;
return v9;