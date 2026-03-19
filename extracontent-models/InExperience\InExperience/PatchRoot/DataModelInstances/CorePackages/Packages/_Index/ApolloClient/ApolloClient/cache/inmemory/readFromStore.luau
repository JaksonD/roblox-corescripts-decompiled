local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_WeakMap_0 = v2.WeakMap;
local l_HttpService_0 = game:GetService("HttpService");
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local v10 = nil;
local v11 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local v14 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v14.invariant;
local l_InvariantError_0 = v14.InvariantError;
local v17 = require(script.Parent.Parent.Parent.utilities);
local l_isField_0 = v17.isField;
local l_resultKeyNameFromField_0 = v17.resultKeyNameFromField;
local l_isReference_0 = v17.isReference;
local l_makeReference_0 = v17.makeReference;
local l_createFragmentMap_0 = v17.createFragmentMap;
local l_shouldInclude_0 = v17.shouldInclude;
local l_addTypenameToDocument_0 = v17.addTypenameToDocument;
local l_getDefaultValues_0 = v17.getDefaultValues;
local l_getFragmentDefinitions_0 = v17.getFragmentDefinitions;
local l_getMainDefinition_0 = v17.getMainDefinition;
local l_getQueryDefinition_0 = v17.getQueryDefinition;
local l_mergeDeepArray_0 = v17.mergeDeepArray;
local l_getFragmentFromSelection_0 = v17.getFragmentFromSelection;
local l_maybeDeepFreeze_0 = v17.maybeDeepFreeze;
local l_isNonNullObject_0 = v17.isNonNullObject;
local _ = v17.canUseWeakMap;
local _ = require(script.Parent.Parent.core.types.Cache);
local _ = require(script.Parent.types);
local v36 = require(script.Parent.entityStore);
local l_maybeDependOnExistenceOfEntity_0 = v36.maybeDependOnExistenceOfEntity;
local l_supportsResultCaching_0 = v36.supportsResultCaching;
local l_getTypenameFromStoreObject_0 = require(script.Parent.helpers).getTypenameFromStoreObject;
local _ = require(script.Parent.policies);
local l_MissingFieldError_0 = require(script.Parent.Parent.core.types.common).MissingFieldError;
local v42 = require(script.Parent["object-canon"]);
local l_canonicalStringify_0 = v42.canonicalStringify;
local l_ObjectCanon_0 = v42.ObjectCanon;
local function v47(v45, v46) --[[ Line: 114 ]] --[[ Name: missingFromInvariant ]]
    -- upvalues: l_MissingFieldError_0 (copy), l_Array_0 (copy)
    return l_MissingFieldError_0.new(v45.message, l_Array_0.slice(v46.path), v46.query, v46.variables);
end;
local function _(v48) --[[ Line: 147 ]] --[[ Name: execSelectionSetKeyArgs ]]
    return {
        v48.selectionSet, 
        v48.objectOrReference, 
        v48.context, 
        v48.context.canonizeResults
    };
end;
local v50 = {};
v50.__index = v50;
v50.resetCanon = function(v51) --[[ Line: 195 ]] --[[ Name: resetCanon ]]
    -- upvalues: l_ObjectCanon_0 (copy)
    v51.canon = l_ObjectCanon_0.new();
end;
local function v57(_, v53, v54, v55, v56) --[[ Line: 200 ]] --[[ Name: makeSelectionSetCacheKey ]]
    -- upvalues: l_supportsResultCaching_0 (copy), l_isReference_0 (copy)
    if l_supportsResultCaching_0(v55.store) then
        return v55.store:makeCacheKey(v53, l_isReference_0(v54) and v54.__ref or v54, v55.varString, v56);
    else
        return nil;
    end;
end;
local function v63(_, v59) --[[ Line: 212 ]] --[[ Name: makeSubSelectedCacheKey ]]
    -- upvalues: l_supportsResultCaching_0 (copy)
    local l_field_0 = v59.field;
    local l_array_0 = v59.array;
    local l_context_0 = v59.context;
    if l_supportsResultCaching_0(l_context_0.store) then
        return l_context_0.store:makeCacheKey(l_field_0, l_array_0, l_context_0.varString);
    else
        return nil;
    end;
end;
v50.new = function(v64) --[[ Line: 221 ]] --[[ Name: new ]]
    -- upvalues: v50 (copy), l_WeakMap_0 (copy), l_Object_0 (copy), l_ObjectCanon_0 (copy), l_wrap_0 (copy), l_maybeDependOnExistenceOfEntity_0 (copy), v57 (copy), v63 (copy)
    local v65 = setmetatable({}, v50);
    v65.knownResults = l_WeakMap_0.new();
    v65.config = l_Object_0.assign(table.clone(v64), {
        addTypename = v64.addTypename ~= false
    });
    v65.canon = v64.canon or l_ObjectCanon_0.new();
    v65.executeSelectionSet = l_wrap_0(function(_, v67) --[[ Line: 236 ]]
        -- upvalues: v65 (copy), l_Object_0 (ref), l_maybeDependOnExistenceOfEntity_0 (ref)
        local l_canonizeResults_0 = v67.context.canonizeResults;
        local v69 = {
            v67.selectionSet, 
            v67.objectOrReference, 
            v67.context, 
            v67.context.canonizeResults; 
            [4] = not l_canonizeResults_0
        };
        local v70 = v65.executeSelectionSet:peek(table.unpack(v69));
        if v70 ~= nil then
            if l_canonizeResults_0 then
                return l_Object_0.assign(table.clone(v70), {
                    result = v65.canon:admit(v70.result)
                });
            else
                return v70;
            end;
        else
            l_maybeDependOnExistenceOfEntity_0(v67.context.store, v67.enclosingRef.__ref);
            return v65:execSelectionSetImpl(v67);
        end;
    end, {
        max = v65.config.resultCacheMaxSize, 
        keyArgs = function(_, ...) --[[ Line: 271 ]] --[[ Name: keyArgs ]]
            local v72 = ...;
            return {
                v72.selectionSet, 
                v72.objectOrReference, 
                v72.context, 
                v72.context.canonizeResults
            };
        end, 
        makeCacheKey = v57
    }, v65);
    v65.executeSubSelectedArray = l_wrap_0(function(_, v74) --[[ Line: 281 ]]
        -- upvalues: l_maybeDependOnExistenceOfEntity_0 (ref), v65 (copy)
        l_maybeDependOnExistenceOfEntity_0(v74.context.store, v74.enclosingRef.__ref);
        return v65:execSubSelectedArrayImpl(v74);
    end, {
        max = v65.config.resultCacheMaxSize, 
        makeCacheKey = v63
    }, v65);
    return v65;
end;
v50.diffQueryAgainstStore = function(v75, v76) --[[ Line: 301 ]] --[[ Name: diffQueryAgainstStore ]]
    -- upvalues: l_Object_0 (copy), l_getDefaultValues_0 (copy), l_getQueryDefinition_0 (copy), l_makeReference_0 (copy), l_getMainDefinition_0 (copy), l_canonicalStringify_0 (copy), l_createFragmentMap_0 (copy), l_getFragmentDefinitions_0 (copy)
    local l_store_0 = v76.store;
    local l_query_0 = v76.query;
    local l_rootId_0 = v76.rootId;
    local l_variables_0 = v76.variables;
    local l_returnPartialData_0 = v76.returnPartialData;
    local l_canonizeResults_1 = v76.canonizeResults;
    if l_rootId_0 == nil then
        l_rootId_0 = "ROOT_QUERY";
    end;
    if l_returnPartialData_0 == nil then
        l_returnPartialData_0 = true;
    end;
    if l_canonizeResults_1 == nil then
        l_canonizeResults_1 = true;
    end;
    local l_policies_0 = v75.config.cache.policies;
    l_variables_0 = l_Object_0.assign({}, l_getDefaultValues_0(l_getQueryDefinition_0(l_query_0)), l_variables_0);
    local v84 = l_makeReference_0(l_rootId_0);
    local v85 = v75:executeSelectionSet({
        selectionSet = l_getMainDefinition_0(l_query_0).selectionSet, 
        objectOrReference = v84, 
        enclosingRef = v84, 
        context = {
            store = l_store_0, 
            query = l_query_0, 
            policies = l_policies_0, 
            variables = l_variables_0, 
            varString = l_canonicalStringify_0(l_variables_0), 
            canonizeResults = l_canonizeResults_1, 
            fragmentMap = l_createFragmentMap_0(l_getFragmentDefinitions_0(l_query_0)), 
            path = {}
        }
    });
    local v86 = v85.missing and #v85.missing > 0;
    if v86 and not l_returnPartialData_0 then
        error(v85.missing[1]);
    end;
    return {
        result = v85.result, 
        missing = v85.missing, 
        complete = not v86
    };
end;
v50.isFresh = function(v87, v88, v89, v90, v91) --[[ Line: 349 ]] --[[ Name: isFresh ]]
    -- upvalues: l_supportsResultCaching_0 (copy)
    if l_supportsResultCaching_0(v91.store) and v87.knownResults:get(v88) == v90 then
        local v92 = v87.executeSelectionSet:peek(v90, v89, v91, v87.canon:isKnown(v88));
        if v92 and v88 == v92.result then
            return true;
        end;
    end;
    return false;
end;
v50.execSelectionSetImpl = function(v93, v94) --[[ Line: 375 ]] --[[ Name: execSelectionSetImpl ]]
    -- upvalues: v47 (copy), l_InvariantError_0 (copy), l_NULL_0 (copy), l_Set_0 (copy), l_shouldInclude_0 (copy), l_isField_0 (copy), l_resultKeyNameFromField_0 (copy), l_addTypenameToDocument_0 (copy), l_isReference_0 (copy), l_HttpService_0 (copy), l_Array_0 (copy), l_invariant_0 (copy), l_getFragmentFromSelection_0 (copy), l_mergeDeepArray_0 (copy), l_maybeDeepFreeze_0 (copy)
    local l_selectionSet_0 = v94.selectionSet;
    local l_objectOrReference_0 = v94.objectOrReference;
    local l_enclosingRef_0 = v94.enclosingRef;
    local l_context_1 = v94.context;
    if l_objectOrReference_0.__ref and not l_context_1.policies.rootTypenamesById[l_objectOrReference_0.__ref] and not l_context_1.store:has(l_objectOrReference_0.__ref) then
        return {
            result = v93.canon.empty, 
            missing = {
                v47(l_InvariantError_0.new(("Dangling reference to missing %s object"):format(l_objectOrReference_0.__ref)), l_context_1)
            }
        };
    else
        local l_variables_1 = l_context_1.variables;
        local l_policies_1 = l_context_1.policies;
        local l_store_1 = l_context_1.store;
        local v102 = {};
        local v103 = {
            result = l_NULL_0
        };
        local v104 = l_store_1:getFieldValue(l_objectOrReference_0, "__typename");
        if v93.config.addTypename and type(v104) == "string" and not l_policies_1.rootIdsByTypename[v104] then
            table.insert(v102, {
                __typename = v104
            });
        end;
        local function _() --[[ Line: 412 ]] --[[ Name: getMissing ]]
            -- upvalues: v103 (copy)
            if not v103.missing then
                v103.missing = {};
            end;
            return v103.missing;
        end;
        local _ = function(v106) --[[ Line: 421 ]] --[[ Name: handleMissing ]]
            -- upvalues: v103 (copy)
            if v106.missing then
                if not v103.missing then
                    v103.missing = {};
                end;
                local l_missing_0 = v103.missing;
                for _, v109 in v106.missing do
                    table.insert(l_missing_0, v109);
                end;
            end;
            return v106.result;
        end;
        local v111 = l_Set_0.new(l_selectionSet_0.selections);
        for _, v113 in v111 do
            if l_shouldInclude_0(v113, l_variables_1) then
                if l_isField_0(v113) then
                    local v114 = l_policies_1:readField({
                        fieldName = v113.name.value, 
                        field = v113, 
                        variables = l_context_1.variables, 
                        from = l_objectOrReference_0
                    }, l_context_1);
                    local v115 = l_resultKeyNameFromField_0(v113);
                    table.insert(l_context_1.path, v115);
                    if v114 == nil then
                        if not l_addTypenameToDocument_0:added(v113) then
                            if not v103.missing then
                                v103.missing = {};
                            end;
                            table.insert(v103.missing, v47(l_InvariantError_0.new(("Can't find field '%s' on %s"):format(v113.name.value, l_isReference_0(l_objectOrReference_0) and l_objectOrReference_0.__ref .. " object" or "object " .. l_HttpService_0:JSONEncode(l_objectOrReference_0))), l_context_1));
                        end;
                    elseif l_Array_0.isArray(v114) then
                        local v116 = v93:executeSubSelectedArray({
                            field = v113, 
                            array = v114, 
                            enclosingRef = l_enclosingRef_0, 
                            context = l_context_1
                        });
                        if v116.missing then
                            if not v103.missing then
                                v103.missing = {};
                            end;
                            local l_missing_1 = v103.missing;
                            for _, v119 in v116.missing do
                                table.insert(l_missing_1, v119);
                            end;
                        end;
                        v114 = v116.result;
                    elseif not v113.selectionSet then
                        if l_context_1.canonizeResults then
                            v114 = v93.canon:pass(v114);
                        end;
                    elseif v114 ~= l_NULL_0 then
                        local v120 = v93:executeSelectionSet({
                            selectionSet = v113.selectionSet, 
                            objectOrReference = v114, 
                            enclosingRef = l_isReference_0(v114) and v114 or l_enclosingRef_0, 
                            context = l_context_1
                        });
                        if v120.missing then
                            if not v103.missing then
                                v103.missing = {};
                            end;
                            local l_missing_2 = v103.missing;
                            for _, v123 in v120.missing do
                                table.insert(l_missing_2, v123);
                            end;
                        end;
                        v114 = v120.result;
                    end;
                    if v114 ~= nil then
                        table.insert(v102, {
                            [v115] = v114
                        });
                    end;
                    local v124 = table.remove(l_context_1.path) == v115;
                    if not v124 then
                        l_invariant_0(v124);
                    end;
                else
                    local v125 = l_getFragmentFromSelection_0(v113, l_context_1.fragmentMap);
                    if v125 and l_policies_1:fragmentMatches(v125, v104) then
                        l_Array_0.forEach(v125.selectionSet.selections, v111.add, v111);
                    end;
                end;
            end;
        end;
        local v126 = l_mergeDeepArray_0(v102);
        if l_context_1.canonizeResults then
            v103.result = v93.canon:admit(v126);
        else
            v103.result = l_maybeDeepFreeze_0(v126);
        end;
        v93.knownResults:set(v103.result, l_selectionSet_0);
        return v103;
    end;
end;
v50.execSubSelectedArrayImpl = function(v127, v128) --[[ Line: 553 ]] --[[ Name: execSubSelectedArrayImpl ]]
    -- upvalues: l_invariant_0 (copy), l_Array_0 (copy), l_NULL_0 (copy), l_Boolean_0 (copy), l_isReference_0 (copy), v10 (ref)
    local l_field_1 = v128.field;
    local l_array_1 = v128.array;
    local l_enclosingRef_1 = v128.enclosingRef;
    local l_context_2 = v128.context;
    local v133 = nil;
    local function v138(v134, v135) --[[ Line: 558 ]] --[[ Name: handleMissing ]]
        -- upvalues: v133 (ref), l_invariant_0 (ref), l_context_2 (copy)
        if v134.missing then
            v133 = v133 or {};
            local l_missing_3 = v134.missing;
            for v137 = 1, #l_missing_3 do
                table.insert(v133, l_missing_3[v137]);
            end;
        end;
        l_invariant_0(table.remove(l_context_2.path) == v135);
        return v134.result;
    end;
    if l_field_1.selectionSet then
        l_array_1 = l_Array_0.filter(l_array_1, function(v139) --[[ Line: 577 ]]
            -- upvalues: l_context_2 (copy)
            return l_context_2.store:canRead(v139);
        end);
    end;
    l_array_1 = l_Array_0.map(l_array_1, function(v140, v141) --[[ Line: 582 ]]
        -- upvalues: l_NULL_0 (ref), l_context_2 (copy), l_Array_0 (ref), v138 (copy), v127 (copy), l_field_1 (copy), l_enclosingRef_1 (copy), l_Boolean_0 (ref), l_isReference_0 (ref), v10 (ref), l_invariant_0 (ref)
        if v140 == l_NULL_0 then
            return l_NULL_0;
        else
            table.insert(l_context_2.path, v141);
            if l_Array_0.isArray(v140) and #v140 > 0 then
                return (v138(v127:executeSubSelectedArray({
                    field = l_field_1, 
                    array = v140, 
                    enclosingRef = l_enclosingRef_1, 
                    context = l_context_2
                }), v141));
            elseif l_Boolean_0.toJSBoolean(l_field_1.selectionSet) then
                return (v138(v127:executeSelectionSet({
                    selectionSet = l_field_1.selectionSet, 
                    objectOrReference = v140, 
                    enclosingRef = l_isReference_0(v140) and v140 or l_enclosingRef_1, 
                    context = l_context_2
                }), v141));
            else
                if _G.__DEV__ then
                    v10(l_context_2.store, l_field_1, v140);
                end;
                local v142 = table.remove(l_context_2.path) == v141;
                if not v142 then
                    l_invariant_0(v142);
                end;
                return v140;
            end;
        end;
    end);
    return {
        result = if l_context_2.canonizeResults then v127.canon:admit(l_array_1) else l_array_1, 
        missing = v133
    };
end;
v11.StoreReader = v50;
v10 = function(v143, v144, v145) --[[ Line: 643 ]] --[[ Name: assertSelectionSetForIdValue ]]
    -- upvalues: l_Set_0 (copy), l_isNonNullObject_0 (copy), l_invariant_0 (copy), l_isReference_0 (copy), l_getTypenameFromStoreObject_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    if not v144.selectionSet then
        local v146 = l_Set_0.new({
            v145
        });
        for _, v148 in v146 do
            if l_isNonNullObject_0(v148) then
                l_invariant_0(not l_isReference_0(v148), ("Missing selection set for object of type %s returned for query field %s"):format(l_getTypenameFromStoreObject_0(v143, v148) or "nil", v144.name.value));
                l_Array_0.forEach(l_Object_0.values(v148), v146.add, v146);
            end;
        end;
    end;
end;
return v11;