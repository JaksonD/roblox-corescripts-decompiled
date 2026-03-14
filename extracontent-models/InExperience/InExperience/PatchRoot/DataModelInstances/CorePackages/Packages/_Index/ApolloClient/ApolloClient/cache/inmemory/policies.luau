local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_Map_0 = v3.Map;
local v8 = require(l_Parent_0.luaUtils.isCallable);
local v9 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v10 = require(l_Parent_1.LuauRegExp);
local v11 = {};
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local _ = require(l_Parent_1.GraphQL);
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v20 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v20.invariant;
local l_InvariantError_0 = v20.InvariantError;
local v23 = require(script.Parent.Parent.Parent.utilities);
local l_getFragmentFromSelection_0 = v23.getFragmentFromSelection;
local l_isField_0 = v23.isField;
local l_getTypenameFromResult_0 = v23.getTypenameFromResult;
local l_storeKeyNameFromField_0 = v23.storeKeyNameFromField;
local l_argumentsObjectFromField_0 = v23.argumentsObjectFromField;
local l_isReference_0 = v23.isReference;
local l_getStoreKeyName_0 = v23.getStoreKeyName;
local l_canUseWeakMap_0 = v23.canUseWeakMap;
local l_isNonNullObject_0 = v23.isNonNullObject;
local l_stringifyForDisplay_0 = v23.stringifyForDisplay;
local v34 = require(script.Parent.helpers);
local v35 = require(l_Parent_0.luaUtils.hasOwnProperty);
local l_fieldNameFromStoreName_0 = v34.fieldNameFromStoreName;
local l_storeValueIsStoreObject_0 = v34.storeValueIsStoreObject;
local l_selectionSetMatchesResult_0 = v34.selectionSetMatchesResult;
local l_TypeOrFieldNameRegExp_0 = v34.TypeOrFieldNameRegExp;
local l_cacheSlot_0 = require(script.Parent.reactiveVars).cacheSlot;
local _ = require(script.Parent.Parent.core.types.common);
local _ = require(script.Parent.writeToStore_types);
l_getStoreKeyName_0:setStringify(require(script.Parent["object-canon"]).canonicalStringify);
local _ = require(script.Parent.policies_types);
local function _(v44) --[[ Line: 145 ]] --[[ Name: argsFromFieldSpecifier ]]
    -- upvalues: l_argumentsObjectFromField_0 (copy)
    if v44.args ~= nil then
        return v44.args;
    elseif v44.field then
        return (l_argumentsObjectFromField_0(v44.field, v44.variables));
    else
        return nil;
    end;
end;
local function v53(_, v47, v48) --[[ Line: 159 ]] --[[ Name: defaultDataIdFromObject ]]
    -- upvalues: l_HttpService_0 (copy)
    local l___typename_0 = v47.__typename;
    local l_id_0 = v47.id;
    local l__id_0 = v47._id;
    if type(l___typename_0) == "string" then
        if v48 then
            if l_id_0 ~= nil then
                v48.keyObject = {
                    id = l_id_0
                };
            elseif l__id_0 ~= nil then
                v48.keyObject = {
                    _id = l__id_0
                };
            else
                v48.keyObject = nil;
            end;
        end;
        if l_id_0 == nil then
            l_id_0 = l__id_0;
        end;
        if l_id_0 ~= nil then
            local v52 = type(l_id_0);
            return string.format("%s:%s", l___typename_0, if not (v52 ~= "number") or v52 == "string" then l_id_0 else l_HttpService_0:JSONEncode(l_id_0));
        end;
    end;
    return nil;
end;
v11.defaultDataIdFromObject = v53;
local function v55(_) --[[ Line: 191 ]] --[[ Name: nullKeyFieldsFn ]]
    return nil;
end;
local function v58(_, v57) --[[ Line: 194 ]] --[[ Name: simpleKeyArgsFn ]]
    return v57.fieldName;
end;
local v59 = nil;
v59 = function(_, v61, v62, v63) --[[ Line: 201 ]] --[[ Name: mergeTrueFn ]]
    return v63:mergeObjects(v61, v62);
end;
local v64 = nil;
v64 = function(_, _, v67) --[[ Line: 205 ]] --[[ Name: mergeFalseFn ]]
    return v67;
end;
local v68 = {};
v68.__index = v68;
v68.new = function(v69) --[[ Line: 312 ]] --[[ Name: new ]]
    -- upvalues: v68 (copy), l_Map_0 (copy), l_Object_0 (copy), v53 (copy)
    local v70 = setmetatable({}, v68);
    v70.typePolicies = {};
    v70.toBeAdded = {};
    v70.supertypeMap = l_Map_0.new(nil);
    v70.fuzzySubtypes = l_Map_0.new(nil);
    v70.cache = nil;
    v70.rootIdsByTypename = {};
    v70.rootTypenamesById = {};
    v70.usingPossibleTypes = false;
    v70.config = v69;
    v70.config = l_Object_0.assign({
        dataIdFromObject = v53
    }, v69);
    v70.cache = v70.config.cache;
    v70:setRootTypename("Query");
    v70:setRootTypename("Mutation");
    v70:setRootTypename("Subscription");
    if v69.possibleTypes then
        v70:addPossibleTypes(v69.possibleTypes);
    end;
    if v69.typePolicies then
        v70:addTypePolicies(v69.typePolicies);
    end;
    return v70;
end;
v68.identify = function(v71, v72, v73, v74) --[[ Line: 353 ]] --[[ Name: identify ]]
    -- upvalues: l_getTypenameFromResult_0 (copy), v15 (ref)
    local v75 = nil;
    v75 = if v73 and v74 then l_getTypenameFromResult_0(v72, v73, v74) else v72.__typename;
    if v75 == v71.rootTypenamesById.ROOT_QUERY then
        return {
            "ROOT_QUERY"
        };
    else
        local v76 = {
            typename = v75, 
            selectionSet = v73, 
            fragmentMap = v74
        };
        local v77 = nil;
        local v78 = nil;
        v78 = v75 and v71:getTypePolicy(v75);
        local v79 = nil;
        v79 = if v78 and v78.keyFn then v78.keyFn else v71.config.dataIdFromObject;
        while v79 do
            local v80 = v79(v78, v72, v76);
            if type(v80) == "table" then
                v79 = v15(v80);
            else
                v77 = v80;
                break;
            end;
        end;
        v77 = if v77 then tostring(v77) else nil;
        if v76.keyObject then
            return {
                v77, 
                v76.keyObject
            };
        else
            return {
                v77
            };
        end;
    end;
end;
v68.addTypePolicies = function(v81, v82) --[[ Line: 425 ]] --[[ Name: addTypePolicies ]]
    -- upvalues: v9 (copy), l_Object_0 (copy), v35 (copy)
    v9(v82, function(v83) --[[ Line: 427 ]]
        -- upvalues: v82 (copy), l_Object_0 (ref), v81 (copy), v35 (ref)
        local v84 = v82[v83];
        local l_queryType_0 = v84.queryType;
        local l_mutationType_0 = v84.mutationType;
        local l_subscriptionType_0 = v84.subscriptionType;
        local v88 = l_Object_0.assign({}, v84, {
            queryType = l_Object_0.None, 
            mutationType = l_Object_0.None, 
            subscriptionType = l_Object_0.None
        });
        if l_queryType_0 then
            v81:setRootTypename("Query", v83);
        end;
        if l_mutationType_0 then
            v81:setRootTypename("Mutation", v83);
        end;
        if l_subscriptionType_0 then
            v81:setRootTypename("Subscription", v83);
        end;
        if v35(v81.toBeAdded, v83) then
            table.insert(v81.toBeAdded[v83], v88);
            return;
        else
            v81.toBeAdded[v83] = {
                v88
            };
            return;
        end;
    end);
end;
v68.updateTypePolicy = function(v89, v90, v91) --[[ Line: 471 ]] --[[ Name: updateTypePolicy ]]
    -- upvalues: v8 (copy), v59 (ref), v64 (ref), v55 (copy), v15 (ref), v9 (copy), v58 (copy), v14 (ref)
    local v92 = v89:getTypePolicy(v90);
    local l_keyFields_0 = v91.keyFields;
    local l_fields_0 = v91.fields;
    local function _(v95, v96) --[[ Line: 475 ]] --[[ Name: setMerge ]]
        -- upvalues: v8 (ref), v59 (ref), v64 (ref)
        if v8(v96) then
            v95.merge = v96;
            return;
        elseif v96 == true then
            v95.merge = v59;
            return;
        elseif v96 == false then
            v95.merge = v64;
            return;
        else
            v95.merge = v95.merge;
            return;
        end;
    end;
    local l_merge_0 = v91.merge;
    if v8(l_merge_0) then
        v92.merge = l_merge_0;
    elseif l_merge_0 == true then
        v92.merge = v59;
    elseif l_merge_0 == false then
        v92.merge = v64;
    else
        v92.merge = v92.merge;
    end;
    if l_keyFields_0 == false then
        v92.keyFn = v55;
    else
        l_merge_0 = type(l_keyFields_0);
        if l_merge_0 == "table" then
            v92.keyFn = v15(l_keyFields_0);
        elseif l_merge_0 == "function" then
            v92.keyFn = l_keyFields_0;
        else
            v92.keyFn = v92.keyFn;
        end;
    end;
    if l_fields_0 then
        v9(l_fields_0, function(v99) --[[ Line: 530 ]]
            -- upvalues: v89 (copy), v90 (copy), l_fields_0 (copy), v58 (ref), v14 (ref), v8 (ref), v59 (ref), v64 (ref)
            local v100 = v89:getFieldPolicy(v90, v99, true);
            local v101 = l_fields_0[v99];
            if type(v101) == "function" then
                v100.read = v101;
            else
                local l_keyArgs_0 = v101.keyArgs;
                local l_read_0 = v101.read;
                local l_merge_1 = v101.merge;
                if l_keyArgs_0 == false then
                    v100.keyFn = v58;
                else
                    local v105 = type(l_keyArgs_0);
                    if v105 == "table" then
                        v100.keyFn = v14(l_keyArgs_0);
                    elseif v105 == "function" then
                        v100.keyFn = l_keyArgs_0;
                    else
                        v100.keyFn = v100.keyFn;
                    end;
                end;
                if type(l_read_0) == "function" then
                    v100.read = l_read_0;
                end;
                if v8(l_merge_1) then
                    v100.merge = l_merge_1;
                elseif l_merge_1 == true then
                    v100.merge = v59;
                elseif l_merge_1 == false then
                    v100.merge = v64;
                else
                    v100.merge = v100.merge;
                end;
            end;
            if v100.read and v100.merge then
                v100.keyFn = v100.keyFn or v58;
            end;
        end);
    end;
end;
v68.setRootTypename = function(v106, v107, v108) --[[ Line: 588 ]] --[[ Name: setRootTypename ]]
    -- upvalues: l_invariant_0 (copy)
    local l_v108_0 = v108;
    if l_v108_0 == nil then
        l_v108_0 = v107;
    end;
    local v110 = "ROOT_" .. string.upper(v107);
    local v111 = v106.rootTypenamesById[v110];
    if l_v108_0 ~= v111 then
        local v112 = not v111 or v111 == v107;
        if not v112 then
            l_invariant_0(v112, ("Cannot change root %s __typename more than once"):format(v107));
        end;
        if v111 then
            v106.rootIdsByTypename[v111] = nil;
        end;
        v106.rootIdsByTypename[l_v108_0] = v110;
        v106.rootTypenamesById[v110] = l_v108_0;
    end;
end;
v68.addPossibleTypes = function(v113, v114) --[[ Line: 617 ]] --[[ Name: addPossibleTypes ]]
    -- upvalues: v9 (copy), l_Array_0 (copy), l_TypeOrFieldNameRegExp_0 (copy), v10 (copy)
    v113.usingPossibleTypes = true;
    v9(v114, function(v115) --[[ Line: 620 ]]
        -- upvalues: v113 (copy), l_Array_0 (ref), v114 (copy), l_TypeOrFieldNameRegExp_0 (ref), v10 (ref)
        v113:getSupertypeSet(v115, true);
        l_Array_0.forEach(v114[v115], function(v116) --[[ Line: 627 ]]
            -- upvalues: v113 (ref), v115 (copy), l_TypeOrFieldNameRegExp_0 (ref), v10 (ref)
            v113:getSupertypeSet(v116, true):add(v115);
            local v117 = l_TypeOrFieldNameRegExp_0:exec(v116);
            if not v117 or v117[1] ~= v116 then
                v113.fuzzySubtypes:set(v116, v10.new(v116));
            end;
        end);
    end);
end;
v68.getTypePolicy = function(v118, v119) --[[ Line: 639 ]] --[[ Name: getTypePolicy ]]
    -- upvalues: v35 (copy), l_Object_0 (copy), l_Array_0 (copy)
    if not v35(v118.typePolicies, v119) then
        v118.typePolicies[v119] = {};
        local v120 = v118.typePolicies[v119];
        v120.fields = {};
        local v121 = v118.supertypeMap:get(v119);
        if v121 and v121.size > 0 then
            local l_v120_0 = v120 --[[ copy: 2 -> 4 ]];
            v121:forEach(function(v123) --[[ Line: 673 ]]
                -- upvalues: v118 (copy), l_Object_0 (ref), l_v120_0 (copy)
                local v124 = v118:getTypePolicy(v123);
                local l_fields_1 = v124.fields;
                local v126 = l_Object_0.assign(table.clone(v124), {
                    fields = l_Object_0.None
                });
                l_Object_0.assign(l_v120_0, v126);
                l_Object_0.assign(l_v120_0.fields, l_fields_1);
            end);
        end;
    end;
    local v127 = v118.toBeAdded[v119];
    if v127 and #v127 > 0 then
        l_Array_0.forEach(l_Array_0.splice(v127, 1), function(v128) --[[ Line: 690 ]]
            -- upvalues: v118 (copy), v119 (copy)
            v118:updateTypePolicy(v119, v128);
        end);
    end;
    return v118.typePolicies[v119];
end;
v68.getFieldPolicy = function(v129, v130, v131, v132) --[[ Line: 698 ]] --[[ Name: getFieldPolicy ]]
    if v130 then
        local l_fields_2 = v129:getTypePolicy(v130).fields;
        if l_fields_2[v131] then
            return l_fields_2[v131];
        elseif v132 then
            l_fields_2[v131] = {};
            return l_fields_2[v131];
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v68.getSupertypeSet = function(v134, v135, v136) --[[ Line: 725 ]] --[[ Name: getSupertypeSet ]]
    -- upvalues: l_Set_0 (copy)
    local v137 = v134.supertypeMap:get(v135);
    if not v137 and v136 then
        v137 = l_Set_0.new();
        v134.supertypeMap:set(v135, v137);
    end;
    return v137;
end;
v68.fragmentMatches = function(v138, v139, v140, v141, v142) --[[ Line: 736 ]] --[[ Name: fragmentMatches ]]
    -- upvalues: l_Array_0 (copy), l_invariant_0 (copy), l_selectionSetMatchesResult_0 (copy)
    if not v139.typeCondition then
        return true;
    elseif not v140 then
        return false;
    else
        local l_value_0 = v139.typeCondition.name.value;
        if v140 == l_value_0 then
            return true;
        else
            if v138.usingPossibleTypes and v138.supertypeMap:has(l_value_0) then
                local v144 = v138:getSupertypeSet(v140, true);
                local v145 = {
                    v144
                };
                local function v148(v146) --[[ Line: 767 ]] --[[ Name: maybeEnqueue ]]
                    -- upvalues: v138 (copy), l_Array_0 (ref), v145 (copy)
                    local v147 = v138:getSupertypeSet(v146, false);
                    if v147 and v147.size > 0 and l_Array_0.indexOf(v145, v147) < 1 then
                        table.insert(v145, v147);
                    end;
                end;
                local v149 = false;
                if v141 ~= nil then
                    v149 = v138.fuzzySubtypes.size > 0;
                end;
                local v150 = false;
                for v151, _ in v145 do
                    local v153 = v145[v151];
                    if v153:has(l_value_0) then
                        if not v144:has(l_value_0) then
                            if v150 then
                                l_invariant_0.warn(("Inferring subtype %s of supertype %s"):format(v140, l_value_0));
                            end;
                            v144:add(l_value_0);
                        end;
                        return true;
                    else
                        v153:forEach(v148);
                        if v149 and v151 == #v145 and l_selectionSetMatchesResult_0(v139.selectionSet, v141, v142) then
                            v149 = false;
                            v150 = true;
                            l_Array_0.forEach(v138.fuzzySubtypes:entries(), function(v154) --[[ Line: 834 ]]
                                -- upvalues: v140 (copy), v138 (copy), l_Array_0 (ref), v145 (copy)
                                local v155 = v154[2];
                                local v156 = v154[1];
                                local v157 = v155:exec(v140);
                                if v157 and v157[1] == v140 then
                                    local v158 = v138:getSupertypeSet(v156, false);
                                    if v158 and v158.size > 0 and l_Array_0.indexOf(v145, v158) < 1 then
                                        table.insert(v145, v158);
                                    end;
                                end;
                                return 1;
                            end);
                        end;
                    end;
                end;
            end;
            return false;
        end;
    end;
end;
v68.hasKeyArgs = function(v159, v160, v161) --[[ Line: 852 ]] --[[ Name: hasKeyArgs ]]
    local v162 = v159:getFieldPolicy(v160, v161, false);
    local v163 = false;
    if v162 ~= nil then
        v163 = v162.keyFn ~= nil;
    end;
    return v163;
end;
v68.getStoreFieldName = function(v164, v165) --[[ Line: 859 ]] --[[ Name: getStoreFieldName ]]
    -- upvalues: l_argumentsObjectFromField_0 (copy), v14 (ref), l_storeKeyNameFromField_0 (copy), l_getStoreKeyName_0 (copy), l_fieldNameFromStoreName_0 (copy)
    local l_typename_0 = v165.typename;
    local l_fieldName_0 = v165.fieldName;
    local v168 = v164:getFieldPolicy(l_typename_0, l_fieldName_0, false);
    local v169 = nil;
    local v170 = nil;
    v170 = if v168 then v168.keyFn else nil;
    if v170 and l_typename_0 then
        local v171 = {
            typename = l_typename_0, 
            fieldName = l_fieldName_0, 
            field = v165.field or nil, 
            variables = v165.variables
        };
        local v172 = if v165.args ~= nil then v165.args else if v165.field then l_argumentsObjectFromField_0(v165.field, v165.variables) else nil;
        while v170 do
            local v173 = v170(v172, v171);
            if type(v173) == "table" then
                v170 = v14(v173);
            else
                v169 = v173 or l_fieldName_0;
                break;
            end;
        end;
    end;
    if v169 == nil then
        v169 = if v165.field then l_storeKeyNameFromField_0(v165.field, v165.variables) else l_getStoreKeyName_0(l_fieldName_0, if v165.args ~= nil then v165.args else if v165.field then l_argumentsObjectFromField_0(v165.field, v165.variables) else nil);
    end;
    if v169 == false then
        return l_fieldName_0;
    elseif l_fieldName_0 == l_fieldNameFromStoreName_0(v169) then
        return v169;
    else
        return l_fieldName_0 .. ":" .. v169;
    end;
end;
v68.readField = function(v174, v175, v176) --[[ Line: 930 ]] --[[ Name: readField ]]
    -- upvalues: l_fieldNameFromStoreName_0 (copy), v12 (ref), l_cacheSlot_0 (copy)
    local l_from_0 = v175.from;
    if not l_from_0 then
        return;
    elseif not (v175.field or v175.fieldName) then
        return;
    else
        if v175.typename == nil then
            local v178 = v176.store:getFieldValue(l_from_0, "__typename");
            if v178 then
                v175.typename = v178;
            end;
        end;
        local v179 = v174:getStoreFieldName(v175);
        local v180 = l_fieldNameFromStoreName_0(v179);
        local v181 = v176.store:getFieldValue(l_from_0, v179);
        local v182 = v174:getFieldPolicy(v175.typename, v180, false);
        local v183 = nil;
        v183 = if v182 then v182.read else nil;
        if v183 then
            local v184 = v12(v174, l_from_0, v175, v176, v176.store:getStorage(if l_from_0.__ref then l_from_0.__ref else l_from_0, v179));
            return (l_cacheSlot_0:withValue(v174.cache, v183, {
                v181, 
                v184
            }));
        else
            return v181;
        end;
    end;
end;
v68.getMergeFunction = function(v185, v186, v187, v188) --[[ Line: 990 ]] --[[ Name: getMergeFunction ]]
    local v189 = v185:getFieldPolicy(v186, v187, false);
    local v190 = nil;
    v190 = v189 and v189.merge;
    if not v190 and v188 then
        v189 = v185:getTypePolicy(v188);
        if v189 then
            return v189.merge;
        else
            v190 = v189;
        end;
    end;
    return v190;
end;
v68.runMergeFunction = function(v191, v192, v193, v194, v195, v196) --[[ Line: 1021 ]] --[[ Name: runMergeFunction ]]
    -- upvalues: v59 (ref), v13 (ref), v64 (ref), v12 (ref)
    local l_field_0 = v194.field;
    local l_typename_1 = v194.typename;
    local l_merge_2 = v194.merge;
    if l_merge_2 == v59 then
        return v13(v195.store)(v194, v192, v193);
    elseif l_merge_2 == v64 then
        return v193;
    else
        if v195.overwrite then
            v192 = nil;
        end;
        return l_merge_2(v194, v192, v193, v12(v191, nil, {
            typename = l_typename_1, 
            fieldName = l_field_0.name.value, 
            field = l_field_0, 
            variables = v195.variables
        }, v195, v196 or {}));
    end;
end;
v11.Policies = v68;
v12 = function(v200, v201, v202, v203, v204) --[[ Line: 1081 ]] --[[ Name: makeFieldFunctionOptions ]]
    -- upvalues: l_fieldNameFromStoreName_0 (copy), l_argumentsObjectFromField_0 (copy), l_isReference_0 (copy), l_Object_0 (copy), v35 (copy), l_invariant_0 (copy), l_stringifyForDisplay_0 (copy), l_Array_0 (copy), v13 (ref)
    local v205 = v200:getStoreFieldName(v202);
    local v206 = l_fieldNameFromStoreName_0(v205);
    local v207 = v202.variables or v203.variables;
    return {
        args = if v202.args ~= nil then v202.args else if v202.field then l_argumentsObjectFromField_0(v202.field, v202.variables) else nil, 
        field = v202.field or nil, 
        fieldName = v206, 
        storeFieldName = v205, 
        variables = v207, 
        isReference = function(_, ...) --[[ Line: 1101 ]] --[[ Name: isReference ]]
            -- upvalues: l_isReference_0 (ref)
            return l_isReference_0(...);
        end, 
        toReference = v203.store.toReference, 
        storage = v204, 
        cache = v200.cache, 
        canRead = v203.store.canRead, 
        readField = function(_, v210, ...) --[[ Line: 1108 ]] --[[ Name: readField ]]
            -- upvalues: l_Object_0 (ref), v201 (copy), v35 (ref), l_invariant_0 (ref), l_stringifyForDisplay_0 (ref), l_Array_0 (ref), v207 (copy), v200 (copy), v203 (copy)
            local v211 = type(v210);
            local v212 = {
                if v211 == "table" then l_Object_0.assign(table.clone(v210), if v210.from == l_Object_0.None then {
                    from = "<Object.None>"
                } else nil) else v210, 
                select("#", ...) >= 1 and "<nil>" or nil
            };
            local v213 = nil;
            if v211 == "string" then
                v213 = {
                    fieldName = v210, 
                    from = if select("#", ...) >= 1 then ... else v201
                };
            elseif v211 == "table" then
                v213 = l_Object_0.assign({}, v210);
                if not v35(v210, "from") then
                    v213.from = v201;
                end;
            else
                l_invariant_0.warn(("Unexpected readField arguments: %s"):format(l_stringifyForDisplay_0(l_Array_0.from(v212))));
                return;
            end;
            if _G.__DEV__ and v213.from == nil then
                l_invariant_0.warn(("Undefined 'from' passed to readField with arguments %s"):format(l_stringifyForDisplay_0(l_Array_0.from(v212))));
            end;
            if v213.variables == nil then
                v213.variables = v207;
            end;
            return v200:readField(v213, v203);
        end, 
        mergeObjects = v13(v203.store)
    };
end;
v13 = function(v214) --[[ Line: 1175 ]] --[[ Name: makeMergeObjectsFunction ]]
    -- upvalues: l_Array_0 (copy), l_InvariantError_0 (copy), l_isNonNullObject_0 (copy), l_isReference_0 (copy), l_storeValueIsStoreObject_0 (copy), l_Object_0 (copy)
    return function(_, v216, v217) --[[ Line: 1176 ]]
        -- upvalues: l_Array_0 (ref), l_InvariantError_0 (ref), l_isNonNullObject_0 (ref), v214 (copy), l_isReference_0 (ref), l_storeValueIsStoreObject_0 (ref), l_Object_0 (ref)
        if l_Array_0.isArray(v216) or l_Array_0.isArray(v217) then
            error(l_InvariantError_0.new("Cannot automatically merge arrays"));
        end;
        if l_isNonNullObject_0(v216) and l_isNonNullObject_0(v217) then
            local v218 = v214:getFieldValue(v216, "__typename");
            local v219 = v214:getFieldValue(v217, "__typename");
            local v220 = false;
            if v218 ~= nil then
                v220 = false;
                if v219 ~= nil then
                    v220 = v218 ~= v219;
                end;
            end;
            if v220 then
                return v217;
            elseif l_isReference_0(v216) and l_storeValueIsStoreObject_0(v217) then
                v214:merge(v216.__ref, v217);
                return v216;
            elseif l_storeValueIsStoreObject_0(v216) and l_isReference_0(v217) then
                v214:merge(v216, v217.__ref);
                return v217;
            elseif l_storeValueIsStoreObject_0(v216) and l_storeValueIsStoreObject_0(v217) then
                return l_Object_0.assign({}, v216, v217);
            end;
        end;
        return v217;
    end;
end;
local function v221(v222, v223) --[[ Line: 1226 ]] --[[ Name: keyObjEncode ]]
    -- upvalues: l_Array_0 (copy), v221 (copy), l_HttpService_0 (copy)
    assert(typeof(v223) == "table", "specifier must be an array");
    if not next(v223) then
        return "[]";
    else
        return "{" .. l_Array_0.join(l_Array_0.filter(l_Array_0.map(v223, function(v224, v225) --[[ Line: 1236 ]]
            -- upvalues: l_Array_0 (ref), v222 (copy), v223 (copy), v221 (ref), l_HttpService_0 (ref)
            if l_Array_0.isArray(v224) then
                return "";
            else
                local v226 = nil;
                if not v222[v224] then
                    return "";
                elseif v225 < #v223 then
                    v226 = if l_Array_0.isArray(v223[v225 + 1]) then v221(v222[v224], v223[v225 + 1]) else l_HttpService_0:JSONEncode(v222[v224]);
                    return l_HttpService_0:JSONEncode(v224) .. ":" .. v226;
                else
                    return l_HttpService_0:JSONEncode(v224) .. ":" .. l_HttpService_0:JSONEncode(v222[v224]);
                end;
            end;
        end), function(v227) --[[ Line: 1259 ]]
            return v227 ~= "";
        end), ",") .. "}";
    end;
end;
v14 = function(v228) --[[ Line: 1268 ]] --[[ Name: keyArgsFnFromSpecifier ]]
    -- upvalues: v221 (copy), v17 (ref)
    return function(v229, v230) --[[ Line: 1269 ]]
        -- upvalues: v221 (ref), v17 (ref), v228 (copy)
        if v229 then
            return ("%s:%s"):format(v230.fieldName, (v221(v17(v229, v228, false), v228)));
        else
            return v230.fieldName;
        end;
    end;
end;
v15 = function(v231) --[[ Line: 1281 ]] --[[ Name: keyFieldsFnFromSpecifier ]]
    -- upvalues: l_Trie_0 (copy), l_canUseWeakMap_0 (copy), v16 (ref), v17 (ref), v221 (copy)
    local v232 = l_Trie_0.new(l_canUseWeakMap_0);
    return function(_, v234, v235) --[[ Line: 1283 ]]
        -- upvalues: v232 (copy), v16 (ref), v17 (ref), v231 (copy), v221 (ref)
        local v236 = nil;
        if v235.selectionSet and v235.fragmentMap then
            local v237 = v232:lookupArray({
                v235.selectionSet, 
                v235.fragmentMap
            });
            if v237.aliasMap then
                v236 = v237.aliasMap;
            else
                v237.aliasMap = v16(v235.selectionSet, v235.fragmentMap);
                v236 = v237.aliasMap;
            end;
        end;
        v235.keyObject = v17(v234, v231, true, v236);
        local l_keyObject_0 = v235.keyObject;
        return ("%s:%s"):format(v235.typename or "null", (v221(l_keyObject_0, v231)));
    end;
end;
v16 = function(v239, v240) --[[ Line: 1311 ]] --[[ Name: makeAliasMap ]]
    -- upvalues: l_Set_0 (copy), l_Array_0 (copy), l_isField_0 (copy), v16 (ref), l_getFragmentFromSelection_0 (copy)
    local v241 = {};
    local v242 = l_Set_0.new({
        v239
    });
    for _, v244 in v242 do
        l_Array_0.forEach(v244.selections, function(v245) --[[ Line: 1316 ]]
            -- upvalues: l_isField_0 (ref), v241 (copy), v16 (ref), v240 (copy), l_getFragmentFromSelection_0 (ref), v242 (copy)
            if l_isField_0(v245) then
                if v245.alias then
                    local l_value_1 = v245.alias.value;
                    local l_value_2 = v245.name.value;
                    if l_value_2 ~= l_value_1 then
                        local v248 = nil;
                        if v241.aliases then
                            v248 = v241.aliases;
                        else
                            v241.aliases = {};
                            v248 = v241.aliases;
                        end;
                        v248[l_value_2] = l_value_1;
                    end;
                end;
                if v245.selectionSet then
                    local v249 = nil;
                    if v241.subsets then
                        v249 = v241.subsets;
                    else
                        v241.subsets = {};
                        v249 = v241.subsets;
                    end;
                    v249[v245.name.value] = v16(v245.selectionSet, v240);
                    return;
                end;
            else
                local v250 = l_getFragmentFromSelection_0(v245, v240);
                if v250 then
                    v242:add(v250.selectionSet);
                end;
            end;
        end);
    end;
    return v241;
end;
v17 = function(v251, v252, v253, v254) --[[ Line: 1361 ]] --[[ Name: computeKeyObject ]]
    -- upvalues: v17 (ref), v35 (copy), l_invariant_0 (copy)
    local v255 = {};
    local v256 = nil;
    for _, v258 in v252 do
        if type(v258) == "table" then
            if type(v256) == "string" then
                local v259 = nil;
                v259 = v254 and v254.subsets;
                local v260 = nil;
                v260 = v259 and v259[v256];
                v255[v256] = v17(v251[v256], v258, v253, v260);
            end;
        else
            local v261 = nil;
            v261 = v254 and v254.aliases;
            local v262 = nil;
            v262 = if v261 and v261[v258] then v261[v258] else v258;
            if v35(v251, v262) then
                v256 = v258;
                v255[v256] = v251[v262];
            else
                l_invariant_0(not v253, ("Missing field '%s' while computing key fields"):format(v262));
                v256 = nil;
            end;
        end;
    end;
    return v255;
end;
v11.None = l_Object_0.None;
return v11;