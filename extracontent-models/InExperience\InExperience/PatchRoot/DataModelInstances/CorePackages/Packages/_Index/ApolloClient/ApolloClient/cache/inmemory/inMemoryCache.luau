local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_instanceof_0 = v2.instanceof;
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local v8 = require(l_Parent_1.Promise);
local v9 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local v12 = require(l_Parent_0.jsutils.equal);
local l_ApolloCache_0 = require(script.Parent.Parent.core.cache).ApolloCache;
local _ = require(script.Parent.Parent.core.types.Cache);
local l_MissingFieldError_0 = require(script.Parent.Parent.core.types.common).MissingFieldError;
local v16 = require(script.Parent.Parent.Parent.utilities);
local l_addTypenameToDocument_0 = v16.addTypenameToDocument;
local l_isReference_0 = v16.isReference;
local _ = require(script.Parent.types);
local l_StoreReader_0 = require(script.Parent.readFromStore).StoreReader;
local l_StoreWriter_0 = require(script.Parent.writeToStore).StoreWriter;
local v22 = require(script.Parent.entityStore);
local l_EntityStore_Root_0 = v22.EntityStore_Root;
local l_supportsResultCaching_0 = v22.supportsResultCaching;
local v25 = require(script.Parent.reactiveVars);
local l_makeVar_0 = v25.makeVar;
local l_forgetCache_0 = v25.forgetCache;
local l_recallCache_0 = v25.recallCache;
local v29 = require(script.Parent.policies);
local l_defaultDataIdFromObject_0 = v29.defaultDataIdFromObject;
local l_Policies_0 = v29.Policies;
local l_hasOwn_0 = require(script.Parent.helpers).hasOwn;
local l_canonicalStringify_0 = require(script.Parent["object-canon"]).canonicalStringify;
local v34 = {
    dataIdFromObject = l_defaultDataIdFromObject_0, 
    addTypename = true, 
    resultCaching = true, 
    typePolicies = {}
};
local v35 = setmetatable({}, {
    __index = l_ApolloCache_0
});
v35.__index = v35;
v35.new = function(v36) --[[ Line: 199 ]] --[[ Name: new ]]
    -- upvalues: l_ApolloCache_0 (copy), v35 (copy), l_Set_0 (copy), l_Map_0 (copy), l_makeVar_0 (copy), l_Object_0 (copy), v34 (copy), l_Policies_0 (copy)
    local v37 = setmetatable(l_ApolloCache_0.new(), v35);
    if v36 == nil then
        v36 = {};
    end;
    v37.watches = l_Set_0.new();
    v37.typenameDocumentCache = l_Map_0.new(nil);
    v37.makeVar = l_makeVar_0;
    v37.txCount = 0;
    v37.config = l_Object_0.assign({}, v34, v36);
    v37.addTypename = v37.config.addTypename;
    v37.policies = l_Policies_0.new({
        cache = v37, 
        dataIdFromObject = v37.config.dataIdFromObject, 
        possibleTypes = v37.config.possibleTypes, 
        typePolicies = v37.config.typePolicies
    });
    v37:init();
    return v37;
end;
v35.init = function(v38) --[[ Line: 227 ]] --[[ Name: init ]]
    -- upvalues: l_EntityStore_Root_0 (copy)
    v38.data = l_EntityStore_Root_0.new({
        policies = v38.policies, 
        resultCaching = v38.config.resultCaching
    });
    v38.optimisticData = v38.data.stump;
    v38:resetResultCache();
end;
v35.resetResultCache = function(v39, v40) --[[ Line: 247 ]] --[[ Name: resetResultCache ]]
    -- upvalues: l_StoreReader_0 (copy), l_StoreWriter_0 (copy), l_wrap_0 (copy), l_supportsResultCaching_0 (copy), l_canonicalStringify_0 (copy), l_Set_0 (copy)
    local l_storeReader_0 = v39.storeReader;
    v39.storeReader = l_StoreReader_0.new({
        cache = v39, 
        addTypename = v39.addTypename, 
        resultCacheMaxSize = v39.config.resultCacheMaxSize, 
        canon = if v40 then nil else if l_storeReader_0 then l_storeReader_0.canon else nil
    });
    v39.storeWriter = l_StoreWriter_0.new(v39, v39.storeReader);
    v39.maybeBroadcastWatch = l_wrap_0(function(_, v43, v44) --[[ Line: 264 ]]
        -- upvalues: v39 (ref)
        return v39:broadcastWatch(v43, v44);
    end, {
        max = v39.config.resultCacheMaxSize, 
        makeCacheKey = function(_, v46) --[[ Line: 268 ]] --[[ Name: makeCacheKey ]]
            -- upvalues: v39 (ref), l_supportsResultCaching_0 (ref), l_canonicalStringify_0 (ref)
            local v47 = nil;
            v47 = if v46.optimistic then v39.optimisticData else v39.data;
            if l_supportsResultCaching_0(v47) then
                local l_optimistic_0 = v46.optimistic;
                local l_rootId_0 = v46.rootId;
                local l_variables_0 = v46.variables;
                return v47:makeCacheKey(v46.query, v46.callback, l_canonicalStringify_0({
                    optimistic = l_optimistic_0, 
                    rootId = l_rootId_0, 
                    variables = l_variables_0
                }));
            else
                return;
            end;
        end
    }, v39);
    l_Set_0.new({
        v39.data.group, 
        v39.optimisticData.group
    }):forEach(function(v51) --[[ Line: 304 ]]
        return v51:resetCaching();
    end);
end;
v35.restore = function(v52, v53) --[[ Line: 309 ]] --[[ Name: restore ]]
    v52:init();
    if v53 then
        v52.data:replace(v53);
    end;
    return v52;
end;
v35.extract = function(v54, v55) --[[ Line: 322 ]] --[[ Name: extract ]]
    if v55 == nil then
        v55 = false;
    end;
    if v55 then
        return v54.optimisticData:extract();
    else
        return v54.data:extract();
    end;
end;
v35.read = function(v56, v57) --[[ Line: 334 ]] --[[ Name: read ]]
    -- upvalues: l_Object_0 (copy), l_NULL_0 (copy), l_instanceof_0 (copy), l_MissingFieldError_0 (copy)
    local v58 = nil;
    v58 = v57.returnPartialData ~= nil and v57.returnPartialData;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 349 ]]
        -- upvalues: v56 (copy), l_Object_0 (ref), v57 (copy), v58 (ref), l_NULL_0 (ref)
        return v56.storeReader:diffQueryAgainstStore(l_Object_0.assign({}, v57, {
            store = v57.optimistic and v56.optimisticData or v56.data, 
            config = v56.config, 
            returnPartialData = v58
        })).result or l_NULL_0;
    end);
    if not l_status_0 then
        if l_instanceof_0(l_result_0, l_MissingFieldError_0) then
            return l_NULL_0;
        else
            error(l_result_0);
        end;
    end;
    return l_result_0;
end;
v35.write = function(v61, v62) --[[ Line: 374 ]] --[[ Name: write ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 376 ]]
        -- upvalues: v61 (ref), v62 (copy)
        local l_v61_0 = v61;
        l_v61_0.txCount = l_v61_0.txCount + 1;
        return v61.storeWriter:writeToStore(v61.data, v62);
    end);
    v61.txCount = v61.txCount - 1;
    if v61.txCount == 0 and v62.broadcast ~= false then
        v61:broadcastWatches();
    end;
    if not l_status_1 then
        error(l_result_1);
    end;
    return l_result_1;
end;
v35.modify = function(v66, v67) --[[ Line: 394 ]] --[[ Name: modify ]]
    -- upvalues: l_hasOwn_0 (copy)
    if l_hasOwn_0(v67, "id") and not v67.id then
        return false;
    else
        local v68 = nil;
        v68 = if v67.optimistic then v66.optimisticData else v66.data;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 419 ]]
            -- upvalues: v66 (ref), v68 (ref), v67 (copy)
            local l_v66_0 = v66;
            l_v66_0.txCount = l_v66_0.txCount + 1;
            return v68:modify(v67.id or "ROOT_QUERY", v67.fields);
        end);
        v66.txCount = v66.txCount - 1;
        if v66.txCount == 0 and v67.broadcast ~= false then
            v66:broadcastWatches();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
        return l_result_2;
    end;
end;
v35.diff = function(v72, v73) --[[ Line: 439 ]] --[[ Name: diff ]]
    -- upvalues: l_Object_0 (copy)
    return v72.storeReader:diffQueryAgainstStore(l_Object_0.assign({}, v73, {
        store = v73.optimistic and v72.optimisticData or v72.data, 
        rootId = v73.id or "ROOT_QUERY", 
        config = v72.config
    }));
end;
v35.watch = function(v74, v75) --[[ Line: 449 ]] --[[ Name: watch ]]
    -- upvalues: l_recallCache_0 (copy), l_forgetCache_0 (copy)
    if v74.watches.size == 0 then
        l_recallCache_0(v74);
    end;
    v74.watches:add(v75);
    if v75.immediate then
        v74:maybeBroadcastWatch(v75);
    end;
    return function() --[[ Line: 470 ]]
        -- upvalues: v74 (ref), v75 (copy), l_forgetCache_0 (ref)
        if v74.watches:delete(v75) and v74.watches.size == 0 then
            l_forgetCache_0(v74);
        end;
        v74.maybeBroadcastWatch:forget(v75);
    end;
end;
v35.gc = function(v76, v77) --[[ Line: 486 ]] --[[ Name: gc ]]
    -- upvalues: l_canonicalStringify_0 (copy)
    l_canonicalStringify_0:reset();
    local v78 = v76.optimisticData:gc();
    if v77 and v76.txCount == 0 then
        if v77.resetResultCache then
            v76:resetResultCache(v77.resetResultIdentities);
            return v78;
        elseif v77.resetResultIdentities then
            v76.storeReader:resetCanon();
        end;
    end;
    return v78;
end;
v35.retain = function(v79, v80, v81) --[[ Line: 518 ]] --[[ Name: retain ]]
    if v81 then
        return v79.optimisticData:retain(v80);
    else
        return v79.data:retain(v80);
    end;
end;
v35.release = function(v82, v83, v84) --[[ Line: 533 ]] --[[ Name: release ]]
    if v84 then
        return v82.optimisticData:release(v83);
    else
        return v82.data:release(v83);
    end;
end;
v35.identify = function(v85, v86) --[[ Line: 549 ]] --[[ Name: identify ]]
    -- upvalues: l_isReference_0 (copy)
    if l_isReference_0(v86) then
        return v86.__ref;
    else
        return v85.policies:identify(v86)[1];
    end;
end;
v35.evict = function(v87, v88) --[[ Line: 557 ]] --[[ Name: evict ]]
    -- upvalues: l_hasOwn_0 (copy), l_Object_0 (copy)
    if not v88.id then
        if l_hasOwn_0(v88, "id") then
            return false;
        else
            v88 = l_Object_0.assign(table.clone(v88), {
                id = "ROOT_QUERY"
            });
        end;
    end;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 572 ]]
        -- upvalues: v87 (ref), v88 (ref)
        local l_v87_0 = v87;
        l_v87_0.txCount = l_v87_0.txCount + 1;
        return v87.optimisticData:evict(v88);
    end);
    v87.txCount = v87.txCount - 1;
    if v87.txCount == 0 and v88.broadcast ~= false then
        v87:broadcastWatches();
    end;
    if not l_status_3 then
        error(l_result_3);
    end;
    return l_result_3;
end;
v35.reset = function(v92) --[[ Line: 594 ]] --[[ Name: reset ]]
    -- upvalues: l_canonicalStringify_0 (copy), v8 (copy)
    v92:init();
    v92:broadcastWatches();
    l_canonicalStringify_0:reset();
    return v8.delay(0);
end;
v35.removeOptimistic = function(v93, v94) --[[ Line: 601 ]] --[[ Name: removeOptimistic ]]
    local v95 = v93.optimisticData:removeLayer(v94);
    if v95 ~= v93.optimisticData then
        v93.optimisticData = v95;
        v93:broadcastWatches();
    end;
end;
v35.batch = function(v96, v97) --[[ Line: 609 ]] --[[ Name: batch ]]
    -- upvalues: l_Set_0 (copy), l_Object_0 (copy)
    local v98 = v97.optimistic == nil or v97.optimistic;
    local l_removeOptimistic_0 = v97.removeOptimistic;
    local l_onWatchUpdated_0 = v97.onWatchUpdated;
    local function v107(v101) --[[ Line: 614 ]] --[[ Name: perform ]]
        -- upvalues: v96 (ref), v97 (copy)
        local l_data_0 = v96.data;
        local l_optimisticData_0 = v96.optimisticData;
        local l_v96_0 = v96;
        l_v96_0.txCount = l_v96_0.txCount + 1;
        if v101 then
            v96.optimisticData = v101;
            v96.data = v96.optimisticData;
        end;
        local v105;
        l_v96_0, v105 = pcall(v97.update, v97, v96);
        local l_v96_1 = v96;
        l_v96_1.txCount = l_v96_1.txCount - 1;
        v96.data = l_data_0;
        v96.optimisticData = l_optimisticData_0;
        if not l_v96_0 then
            error(v105);
        end;
    end;
    local v108 = l_Set_0.new();
    if l_onWatchUpdated_0 and v96.txCount == 0 then
        local l_assign_0 = l_Object_0.assign;
        local v110 = table.clone(v97);
        local v113 = {
            onWatchUpdated = function(_, v112) --[[ Line: 651 ]] --[[ Name: onWatchUpdated ]]
                -- upvalues: v108 (copy)
                v108:add(v112);
                return false;
            end
        };
        v96:broadcastWatches(l_assign_0(v110, v113));
    end;
    if typeof(v98) == "string" then
        v96.optimisticData = v96.optimisticData:addLayer(v98, v107);
    elseif v98 == false then
        v107(v96.data);
    else
        v107();
    end;
    if typeof(l_removeOptimistic_0) == "string" then
        v96.optimisticData = v96.optimisticData:removeLayer(l_removeOptimistic_0);
    end;
    if l_onWatchUpdated_0 and v108.size > 0 then
        local l_assign_1 = l_Object_0.assign;
        local v115 = table.clone(v97);
        local v120 = {
            onWatchUpdated = function(v116, v117, v118) --[[ Line: 687 ]] --[[ Name: onWatchUpdated ]]
                -- upvalues: l_onWatchUpdated_0 (copy), v108 (copy)
                local v119 = l_onWatchUpdated_0(v116, v117, v118);
                if v119 ~= false then
                    v108:delete(v117);
                end;
                return v119;
            end
        };
        v96:broadcastWatches(l_assign_1(v115, v120));
        if v108.size > 0 then
            v108:forEach(function(v121) --[[ Line: 703 ]]
                -- upvalues: v96 (ref)
                return v96.maybeBroadcastWatch:dirty(v121);
            end);
        end;
    else
        v96:broadcastWatches(v97);
    end;
end;
v35.performTransaction = function(v122, v123, v124) --[[ Line: 724 ]] --[[ Name: performTransaction ]]
    -- upvalues: l_NULL_0 (copy)
    return v122:batch({
        update = function(_, ...) --[[ Line: 727 ]] --[[ Name: update ]]
            -- upvalues: v123 (copy)
            return v123(...);
        end, 
        optimistic = v124 or v124 ~= l_NULL_0
    });
end;
v35.transformDocument = function(v126, v127) --[[ Line: 736 ]] --[[ Name: transformDocument ]]
    -- upvalues: l_addTypenameToDocument_0 (copy)
    if v126.addTypename then
        local v128 = v126.typenameDocumentCache:get(v127);
        if not v128 then
            v128 = l_addTypenameToDocument_0(v127);
            v126.typenameDocumentCache:set(v127, v128);
            v126.typenameDocumentCache:set(v128, v128);
        end;
        return v128;
    else
        return v127;
    end;
end;
v35.broadcastWatches = function(v129, v130) --[[ Line: 752 ]] --[[ Name: broadcastWatches ]]
    if v129.txCount == 0 then
        v129.watches:forEach(function(v131) --[[ Line: 755 ]]
            -- upvalues: v129 (copy), v130 (copy)
            return v129:maybeBroadcastWatch(v131, v130);
        end);
    end;
end;
v35.broadcastWatch = function(v132, v133, v134) --[[ Line: 767 ]] --[[ Name: broadcastWatch ]]
    -- upvalues: v12 (copy)
    local l_lastDiff_0 = v133.lastDiff;
    local v136 = v132:diff({
        query = v133.query, 
        variables = v133.variables, 
        optimistic = v133.optimistic
    });
    if v134 then
        if v133.optimistic and typeof(v134.optimistic) == "string" then
            v136.fromOptimisticTransaction = true;
        end;
        local l_onWatchUpdated_1 = v134.onWatchUpdated;
        if l_onWatchUpdated_1 and l_onWatchUpdated_1(v132, v133, v136, l_lastDiff_0) == false then
            return;
        end;
    end;
    if not l_lastDiff_0 or not v12(l_lastDiff_0.result, v136.result) then
        v133.lastDiff = v136;
        v133:callback(v133.lastDiff, l_lastDiff_0);
    end;
end;
v9.InMemoryCache = v35;
return v9;