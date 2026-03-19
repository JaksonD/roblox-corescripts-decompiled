local l___DEV___0 = _G.__DEV__;
local v1 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_Object_0 = v4.Object;
local l_Map_0 = v4.Map;
local l_Set_0 = v4.Set;
local l_Array_0 = v4.Array;
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_1.GraphQL);
local v13 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v13.invariant;
local l_InvariantError_0 = v13.InvariantError;
local v16 = require(l_Parent_0.jsutils.equal);
local v17 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v18 = require(l_Parent_0.utilities);
local l_createFragmentMap_0 = v18.createFragmentMap;
local l_getFragmentFromSelection_0 = v18.getFragmentFromSelection;
local l_getDefaultValues_0 = v18.getDefaultValues;
local l_getFragmentDefinitions_0 = v18.getFragmentDefinitions;
local l_getOperationDefinition_0 = v18.getOperationDefinition;
local l_getTypenameFromResult_0 = v18.getTypenameFromResult;
local l_makeReference_0 = v18.makeReference;
local l_isField_0 = v18.isField;
local l_resultKeyNameFromField_0 = v18.resultKeyNameFromField;
local l_isReference_0 = v18.isReference;
local l_shouldInclude_0 = v18.shouldInclude;
local l_cloneDeep_0 = v18.cloneDeep;
local l_addTypenameToDocument_0 = v18.addTypenameToDocument;
local _ = require(script.Parent.types);
local v33 = require(script.Parent.helpers);
local l_makeProcessedFieldsMerger_0 = v33.makeProcessedFieldsMerger;
local l_fieldNameFromStoreName_0 = v33.fieldNameFromStoreName;
local l_storeValueIsStoreObject_0 = v33.storeValueIsStoreObject;
local _ = require(script.Parent.entityStore);
local _ = require(script.Parent.Parent.core.types.Cache);
local l_canonicalStringify_0 = require(script.Parent["object-canon"]).canonicalStringify;
local _ = require(script.Parent.writeToStore_types);
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = {};
v46.__index = v46;
v46.new = function(v47, v48) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v46 (copy)
    local v49 = setmetatable({}, v46);
    v49.cache = v47;
    v49.reader = v48;
    return v49;
end;
v46.writeToStore = function(v50, v51, v52) --[[ Line: 145 ]] --[[ Name: writeToStore ]]
    -- upvalues: l_getOperationDefinition_0 (copy), l_makeProcessedFieldsMerger_0 (copy), l_Object_0 (copy), l_getDefaultValues_0 (copy), l_canonicalStringify_0 (copy), l_createFragmentMap_0 (copy), l_getFragmentDefinitions_0 (copy), l_Map_0 (copy), l_isReference_0 (copy), l_InvariantError_0 (copy), l_HttpService_0 (copy), l_makeReference_0 (copy), l___DEV___0 (copy), l_fieldNameFromStoreName_0 (copy), l_Set_0 (copy), l_isField_0 (copy), v17 (copy), v41 (ref)
    local l_query_0 = v52.query;
    local l_result_0 = v52.result;
    local l_dataId_0 = v52.dataId;
    local l_variables_0 = v52.variables;
    local l_overwrite_0 = v52.overwrite;
    local v58 = l_getOperationDefinition_0(l_query_0);
    local v59 = l_makeProcessedFieldsMerger_0();
    l_variables_0 = l_Object_0.assign(l_getDefaultValues_0(v58), l_variables_0);
    local v62 = {
        store = v51, 
        written = {}, 
        merge = function(v60, v61) --[[ Line: 159 ]]
            -- upvalues: v59 (copy)
            return v59:merge(v60, v61);
        end, 
        variables = l_variables_0, 
        varString = l_canonicalStringify_0(l_variables_0), 
        fragmentMap = l_createFragmentMap_0(l_getFragmentDefinitions_0(l_query_0)), 
        overwrite = l_overwrite_0 or false, 
        incomingById = l_Map_0.new(nil), 
        clientOnly = false
    };
    local v63 = v50:processSelectionSet({
        result = l_result_0 or {}, 
        dataId = l_dataId_0, 
        selectionSet = v58.selectionSet, 
        mergeTree = {
            map = l_Map_0.new(nil)
        }, 
        context = v62
    });
    if not l_isReference_0(v63) then
        error(l_InvariantError_0.new(("Could not identify object %s"):format(l_HttpService_0:JSONEncode(l_result_0))));
    end;
    v62.incomingById:forEach(function(v64, v65) --[[ Line: 192 ]]
        -- upvalues: l_makeReference_0 (ref), v50 (copy), v62 (copy), l_isReference_0 (ref), l___DEV___0 (ref), l_fieldNameFromStoreName_0 (ref), l_Set_0 (ref), l_isField_0 (ref), v17 (ref), v41 (ref), v51 (copy)
        local l_fields_0 = v64.fields;
        local l_mergeTree_0 = v64.mergeTree;
        local l_selections_0 = v64.selections;
        local v69 = l_makeReference_0(v65);
        if l_mergeTree_0.map.size > 0 then
            local v70 = v50:applyMerges(l_mergeTree_0, v69, l_fields_0, v62);
            if l_isReference_0(v70) then
                return;
            else
                l_fields_0 = v70;
            end;
        end;
        if l___DEV___0 and not v62.overwrite then
            local v71 = nil;
            do
                local l_v71_0 = v71;
                local function _(v73) --[[ Line: 215 ]] --[[ Name: hasSelectionSet ]]
                    -- upvalues: l_v71_0 (ref), l_fieldNameFromStoreName_0 (ref)
                    return l_v71_0:has(l_fieldNameFromStoreName_0(v73));
                end;
                l_v71_0 = l_Set_0.new();
                l_selections_0:forEach(function(v75) --[[ Line: 219 ]]
                    -- upvalues: l_isField_0 (ref), l_v71_0 (ref)
                    if l_isField_0(v75) and v75.selectionSet then
                        l_v71_0:add(v75.name.value);
                    end;
                end);
                local function _(v76) --[[ Line: 227 ]] --[[ Name: hasMergeFunction ]]
                    -- upvalues: l_mergeTree_0 (copy)
                    local v77 = l_mergeTree_0.map:get(v76);
                    local v78 = false;
                    if v77 ~= nil then
                        v78 = false;
                        if v77.info ~= nil then
                            v78 = v77.info.merge ~= nil;
                        end;
                    end;
                    return v78;
                end;
                v17(l_fields_0, function(v80) --[[ Line: 233 ]]
                    -- upvalues: l_v71_0 (ref), l_fieldNameFromStoreName_0 (ref), l_mergeTree_0 (copy), v41 (ref), v69 (copy), l_fields_0 (ref), v62 (ref)
                    if l_v71_0:has(l_fieldNameFromStoreName_0(v80)) then
                        local v81 = l_mergeTree_0.map:get(v80);
                        local v82 = false;
                        if v81 ~= nil then
                            v82 = false;
                            if v81.info ~= nil then
                                v82 = v81.info.merge ~= nil;
                            end;
                        end;
                        if not v82 then
                            v41(v69, l_fields_0, v80, v62.store);
                        end;
                    end;
                end);
            end;
        end;
        v51:merge(v65, l_fields_0);
    end);
    v51:retain(v63.__ref);
    return v63;
end;
v46.processSelectionSet = function(v83, v84) --[[ Line: 258 ]] --[[ Name: processSelectionSet ]]
    -- upvalues: l_makeReference_0 (copy), l_Array_0 (copy), l_getTypenameFromResult_0 (copy), l_Set_0 (copy), l_shouldInclude_0 (copy), l_isField_0 (copy), l_resultKeyNameFromField_0 (copy), v42 (ref), l_isReference_0 (copy), v43 (ref), l_addTypenameToDocument_0 (copy), l_invariant_0 (copy), l_HttpService_0 (copy), l_getFragmentFromSelection_0 (copy), v44 (ref)
    local l_dataId_1 = v84.dataId;
    local l_result_1 = v84.result;
    local l_selectionSet_0 = v84.selectionSet;
    local l_context_0 = v84.context;
    local l_mergeTree_1 = v84.mergeTree;
    local l_policies_0 = v83.cache.policies;
    local v91, v92 = table.unpack(l_policies_0:identify(l_result_1, l_selectionSet_0, l_context_0.fragmentMap), 1, 2);
    l_dataId_1 = l_dataId_1 or v91;
    if type(l_dataId_1) == "string" then
        local v93 = nil;
        if l_context_0.written[l_dataId_1] ~= nil then
            v93 = l_context_0.written[l_dataId_1];
        else
            v93 = {};
            l_context_0.written[l_dataId_1] = v93;
        end;
        local v94 = l_makeReference_0(l_dataId_1);
        if l_Array_0.indexOf(v93, l_selectionSet_0) >= 1 then
            return v94;
        else
            table.insert(v93, l_selectionSet_0);
            if v83.reader ~= nil and v83.reader:isFresh(l_result_1, v94, l_selectionSet_0, l_context_0) then
                return v94;
            end;
        end;
    end;
    local v95 = {};
    if v92 ~= nil then
        v95 = l_context_0.merge(v95, v92);
    end;
    local v96 = l_dataId_1 and l_policies_0.rootTypenamesById[l_dataId_1] or l_getTypenameFromResult_0(l_result_1, l_selectionSet_0, l_context_0.fragmentMap) or l_dataId_1 and l_context_0.store:get(l_dataId_1, "__typename");
    if type(v96) == "string" then
        v95.__typename = v96;
    end;
    local v97 = l_Set_0.new(l_selectionSet_0.selections);
    for _, v99 in v97 do
        if l_shouldInclude_0(v99, l_context_0.variables) then
            if l_isField_0(v99) then
                local v100 = l_result_1[l_resultKeyNameFromField_0(v99)];
                local l_clientOnly_0 = l_context_0.clientOnly;
                l_context_0.clientOnly = l_clientOnly_0 or v99.directives and l_Array_0.some(v99.directives, function(v102) --[[ Line: 351 ]]
                    return v102.name.value == "client";
                end);
                if v100 ~= nil then
                    local v103 = l_policies_0:getStoreFieldName({
                        typename = v96, 
                        fieldName = v99.name.value, 
                        field = v99, 
                        variables = l_context_0.variables
                    });
                    local v104 = v42(l_mergeTree_1, v103);
                    local v105 = v83:processFieldValue(v100, v99, l_context_0, v104);
                    local v106 = nil;
                    if v99.selectionSet ~= nil then
                        v106 = l_context_0.store:getFieldValue(v105, "__typename");
                        if not v106 and l_isReference_0(v105) then
                            local v107 = l_context_0.incomingById:get(v105.__ref);
                            v106 = if v107 ~= nil then v107.fields.__typename else nil;
                        end;
                    end;
                    local v108 = l_policies_0:getMergeFunction(v96, v99.name.value, v106);
                    if v108 ~= nil then
                        v104.info = {
                            field = v99, 
                            typename = v96, 
                            merge = v108
                        };
                    else
                        v43(l_mergeTree_1, v103);
                    end;
                    v95 = l_context_0.merge(v95, {
                        [v103] = v105
                    });
                elseif not l_context_0.clientOnly and not l_addTypenameToDocument_0:added(v99) then
                    l_invariant_0.error((string.sub(("Missing field '%s' while writing result %s"):format(l_resultKeyNameFromField_0(v99), l_HttpService_0:JSONEncode(l_result_1)), 1, 1000)));
                end;
                l_context_0.clientOnly = l_clientOnly_0;
            else
                local v109 = l_getFragmentFromSelection_0(v99, l_context_0.fragmentMap);
                if v109 and l_policies_0:fragmentMatches(v109, v96, l_result_1, l_context_0.variables) then
                    l_Array_0.forEach(v109.selectionSet.selections, v97.add, v97);
                end;
            end;
        end;
    end;
    if type(l_dataId_1) == "string" then
        local v110 = l_context_0.incomingById:get(l_dataId_1);
        if v110 then
            v110.fields = l_context_0.merge(v110.fields, v95);
            v110.mergeTree = v44(v110.mergeTree, l_mergeTree_1);
            v110.selections:forEach(v97.add, v97);
            v110.selections = v97;
        else
            l_context_0.incomingById:set(l_dataId_1, {
                fields = v95, 
                mergeTree = l_mergeTree_1, 
                selections = v97
            });
        end;
        return l_makeReference_0(l_dataId_1);
    else
        return v95;
    end;
end;
v46.processFieldValue = function(v111, v112, v113, v114, v115) --[[ Line: 497 ]] --[[ Name: processFieldValue ]]
    -- upvalues: l_NULL_0 (copy), l___DEV___0 (copy), l_cloneDeep_0 (copy), l_Array_0 (copy), v42 (ref), v43 (ref)
    if not v113.selectionSet or v112 == l_NULL_0 then
        if l___DEV___0 then
            return l_cloneDeep_0(v112);
        else
            return v112;
        end;
    elseif l_Array_0.isArray(v112) then
        return l_Array_0.map(v112, function(v116, v117) --[[ Line: 517 ]]
            -- upvalues: v111 (copy), v113 (copy), v114 (copy), v42 (ref), v115 (copy), v43 (ref)
            local v118 = v111:processFieldValue(v116, v113, v114, v42(v115, v117));
            v43(v115, v117);
            return v118;
        end);
    else
        return v111:processSelectionSet({
            result = v112, 
            selectionSet = v113.selectionSet, 
            context = v114, 
            mergeTree = v115
        });
    end;
end;
v46.applyMerges = function(v119, v120, v121, v122, v123, v124) --[[ Line: 532 ]] --[[ Name: applyMerges ]]
    -- upvalues: l_isReference_0 (copy), l_Array_0 (copy), l_storeValueIsStoreObject_0 (copy), l_Map_0 (copy), l_invariant_0 (copy), l_Boolean_0 (copy)
    if v120.map.size > 0 and not l_isReference_0(v122) then
        local v125 = if not l_Array_0.isArray(v122) and (l_isReference_0(v121) or l_storeValueIsStoreObject_0(v121)) then v121 else nil;
        local l_v122_0 = v122;
        if v125 ~= nil and not v124 then
            v124 = if l_isReference_0(v125) then {
                v125.__ref
            } else {
                v125
            };
        end;
        local v127 = nil;
        local function _(v128, v129) --[[ Line: 590 ]] --[[ Name: getValue ]]
            -- upvalues: l_Array_0 (ref), v123 (copy)
            if l_Array_0.isArray(v128) then
                if typeof(v129) == "number" then
                    return v128[v129];
                else
                    return nil;
                end;
            else
                return v123.store:getFieldValue(v128, (tostring(v129)));
            end;
        end;
        do
            local l_v127_0 = v127;
            v120.map:forEach(function(v132, v133) --[[ Line: 602 ]]
                -- upvalues: v125 (copy), l_Array_0 (ref), v123 (copy), l_v122_0 (copy), v124 (ref), v119 (copy), l_v127_0 (ref), l_Map_0 (ref), l_invariant_0 (ref)
                local l_v125_0 = v125;
                local v135 = if l_Array_0.isArray(l_v125_0) then if typeof(v133) == "number" then l_v125_0[v133] else nil else v123.store:getFieldValue(l_v125_0, (tostring(v133)));
                local l_l_v122_0_0 = l_v122_0;
                l_v125_0 = if l_Array_0.isArray(l_l_v122_0_0) then if typeof(v133) == "number" then l_l_v122_0_0[v133] else nil else v123.store:getFieldValue(l_l_v122_0_0, (tostring(v133)));
                if l_v125_0 == nil then
                    return;
                else
                    if v124 ~= nil then
                        table.insert(v124, v133);
                    end;
                    l_l_v122_0_0 = v119:applyMerges(v132, v135, l_v125_0, v123, v124);
                    if l_l_v122_0_0 ~= l_v125_0 then
                        l_v127_0 = l_v127_0 or l_Map_0.new(nil);
                        l_v127_0:set(v133, l_l_v122_0_0);
                    end;
                    if v124 ~= nil then
                        l_invariant_0(table.remove(v124, #v124) == v133);
                    end;
                    return;
                end;
            end);
            if l_v127_0 ~= nil then
                v122 = table.clone(l_v122_0);
                l_v127_0:forEach(function(v137, v138) --[[ Line: 631 ]]
                    -- upvalues: v122 (ref)
                    v122[v138] = v137;
                end);
            end;
        end;
    end;
    if v120.info then
        return v119.cache.policies:runMergeFunction(v121, v122, v120.info, v123, l_Boolean_0.toJSBoolean(v124) and v123.store:getStorage(table.unpack(v124)) or nil);
    else
        return v122;
    end;
end;
v1.StoreWriter = v46;
local v139 = {};
v42 = function(v140, v141) --[[ Line: 656 ]] --[[ Name: getChildMergeTree ]]
    -- upvalues: v139 (copy), l_Map_0 (copy)
    local l_map_0 = v140.map;
    if not l_map_0:has(v141) then
        l_map_0:set(v141, table.remove(v139, #v139) or {
            map = l_Map_0.new(nil)
        });
    end;
    return (l_map_0:get(v141));
end;
v44 = function(v143, v144) --[[ Line: 666 ]] --[[ Name: mergeMergeTrees ]]
    -- upvalues: v45 (ref), l_Object_0 (copy), l_Map_0 (copy), l_Set_0 (copy), v44 (ref)
    if v143 == v144 or v144 == nil or v45(v144) then
        return v143;
    elseif v143 == nil or v45(v143) then
        return v144;
    else
        local v145 = if v143.info and v144.info then l_Object_0.assign(table.clone(v143.info), v144.info) else v143.info or v144.info;
        local v146 = if v143.map.size > 0 then v144.map.size else v143.map.size;
        local v147 = if v146 > 0 then l_Map_0.new() else if v143.map.size > 0 then v143.map else v144.map;
        local v148 = {
            info = v145, 
            map = v147
        };
        if v146 > 0 then
            local v149 = l_Set_0.new(v144.map:keys());
            v143.map:forEach(function(v150, v151) --[[ Line: 696 ]]
                -- upvalues: v148 (copy), v44 (ref), v144 (copy), v149 (copy)
                v148.map:set(v151, v44(v150, v144.map:get(v151)));
                v149:delete(v151);
            end);
            v149:forEach(function(v152) --[[ Line: 701 ]]
                -- upvalues: v148 (copy), v44 (ref), v144 (copy), v143 (copy)
                v148.map:set(v152, v44(v144.map:get(v152), v143.map:get(v152)));
            end);
        end;
        return v148;
    end;
end;
v45 = function(v153) --[[ Line: 712 ]] --[[ Name: mergeTreeIsEmpty ]]
    return not v153 or not (v153.info or v153.map.size > 0);
end;
v43 = function(v154, v155) --[[ Line: 718 ]] --[[ Name: maybeRecycleChildMergeTree ]]
    -- upvalues: v45 (ref), v139 (copy)
    local l_map_1 = v154.map;
    local v157 = l_map_1:get(v155);
    if v157 ~= nil and v45(v157) then
        table.insert(v139, v157);
        l_map_1:delete(v155);
    end;
end;
local v158 = l_Set_0.new();
v41 = function(v159, v160, v161, v162) --[[ Line: 733 ]] --[[ Name: warnAboutDataLoss ]]
    -- upvalues: l_isReference_0 (copy), v16 (copy), l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_fieldNameFromStoreName_0 (copy), v158 (copy), l_invariant_0 (copy), l_HttpService_0 (copy)
    local function _(v163) --[[ Line: 740 ]] --[[ Name: getChild ]]
        -- upvalues: v162 (copy), v161 (copy)
        local v164 = v162:getFieldValue(v163, v161);
        local v165 = false;
        if typeof(v164) == "table" then
            v165 = v164;
        end;
        return v165;
    end;
    local v167 = v162:getFieldValue(v159, v161);
    local v168 = false;
    if typeof(v167) == "table" then
        v168 = v167;
    end;
    if not v168 then
        return;
    else
        local v169 = v162:getFieldValue(v160, v161);
        v167 = false;
        if typeof(v169) == "table" then
            v167 = v169;
        end;
        if not v167 then
            return;
        elseif l_isReference_0(v168) then
            return;
        elseif v16(v168, v167) then
            return;
        elseif l_Array_0.every(l_Object_0.keys(v168), function(v170) --[[ Line: 771 ]]
            -- upvalues: v162 (copy), v167 (copy)
            return v162:getFieldValue(v167, v170) ~= nil;
        end) then
            return;
        else
            v169 = v162:getFieldValue(v159, "__typename");
            local v171 = l_Boolean_0.toJSBoolean(v169) and v169 or v162:getFieldValue(v160, "__typename");
            local v172 = l_fieldNameFromStoreName_0(v161);
            local v173 = ("%s.%s"):format(v171, v172);
            if v158:has(v173) then
                return;
            else
                v158:add(v173);
                local v174 = {};
                if not l_Array_0.isArray(v168) and not l_Array_0.isArray(v167) then
                    l_Array_0.forEach({
                        v168, 
                        v167
                    }, function(v175) --[[ Line: 794 ]]
                        -- upvalues: v162 (copy), l_Array_0 (ref), v174 (copy)
                        local v176 = v162:getFieldValue(v175, "__typename");
                        if typeof(v176) == "string" and not l_Array_0.includes(v174, v176) then
                            table.insert(v174, v176);
                        end;
                    end);
                end;
                l_invariant_0.warn(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(v172, v171, if l_Boolean_0.toJSBoolean(#v174) then "either ensure all objects of type " .. l_Array_0.join(v174, " and ") .. " have an ID or a custom merge function, or " else "", v173, string.sub(l_HttpService_0:JSONEncode(v168), 1, 1000), (string.sub(l_HttpService_0:JSONEncode(v167), 1, 1000))));
                return;
            end;
        end;
    end;
end;
return v1;