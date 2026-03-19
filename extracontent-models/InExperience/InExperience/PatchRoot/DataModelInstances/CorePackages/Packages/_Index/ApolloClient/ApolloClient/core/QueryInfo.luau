local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_clearTimeout_0 = v3.clearTimeout;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_setTimeout_0 = v3.setTimeout;
local l_WeakMap_0 = v3.WeakMap;
local _ = require(l_Parent_1.GraphQL);
local v12 = require(l_Parent_0.jsutils.equal);
local _ = require(l_Parent_0.cache);
local _ = require(script.Parent.watchQueryOptions_types);
local _ = require(script.Parent.ObservableQuery_types);
local _ = require(script.Parent.Parent.link.core);
local v17 = require(script.Parent.Parent.utilities);
local l_isNonEmptyArray_0 = v17.isNonEmptyArray;
local l_graphQLResultHasError_0 = v17.graphQLResultHasError;
local l_canUseWeakMap_0 = v17.canUseWeakMap;
local v21 = require(script.Parent.networkStatus);
local l_NetworkStatus_0 = v21.NetworkStatus;
local l_isNetworkRequestInFlight_0 = v21.isNetworkRequestInFlight;
local _ = require(script.Parent.Parent.errors);
local v25 = {
    FORBID = 0, 
    OVERWRITE = 1, 
    MERGE = 2
};
v0.CacheWriteBehavior = v25;
local v26 = if l_canUseWeakMap_0 then l_WeakMap_0.new() else l_Map_0.new(nil);
local function _(v27, v28) --[[ Line: 98 ]] --[[ Name: wrapDestructiveCacheMethod ]]
    -- upvalues: v26 (copy)
    local v29 = v27[v28];
    if typeof(v29) == "function" then
        v27[v28] = function(...) --[[ Line: 105 ]]
            -- upvalues: v26 (ref), v27 (copy), v29 (copy)
            v26:set(v27, (v26:get(v27) + 1) % 1000000000000000);
            return v29(...);
        end;
    end;
end;
local function _(v31) --[[ Line: 119 ]] --[[ Name: cancelNotifyTimeout ]]
    -- upvalues: l_Boolean_0 (copy), l_clearTimeout_0 (copy)
    if l_Boolean_0.toJSBoolean(v31.notifyTimeout) then
        l_clearTimeout_0(v31.notifyTimeout);
        v31.notifyTimeout = nil;
    end;
end;
local v33 = {};
v33.__index = v33;
v33.new = function(v34) --[[ Line: 204 ]] --[[ Name: new ]]
    -- upvalues: l_Set_0 (copy), v26 (copy), v33 (copy)
    local v35 = {
        listeners = l_Set_0.new(), 
        document = nil, 
        lastRequestId = 1, 
        subscriptions = l_Set_0.new(), 
        stopped = false, 
        cache = v34, 
        dirty = false, 
        observableQuery = nil
    };
    if not v26:has(v34) then
        v26:set(v34, 0);
        local l_evict_0 = v34.evict;
        if typeof(l_evict_0) == "function" then
            local l_l_evict_0_0 = l_evict_0 --[[ copy: 2 -> 4 ]];
            v34.evict = function(...) --[[ Line: 105 ]]
                -- upvalues: v26 (ref), v34 (copy), l_l_evict_0_0 (copy)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_l_evict_0_0(...);
            end;
        end;
        l_evict_0 = v34.modify;
        if typeof(l_evict_0) == "function" then
            local l_l_evict_0_1 = l_evict_0 --[[ copy: 2 -> 3 ]];
            v34.modify = function(...) --[[ Line: 105 ]]
                -- upvalues: v26 (ref), v34 (copy), l_l_evict_0_1 (copy)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_l_evict_0_1(...);
            end;
        end;
        l_evict_0 = v34.reset;
        if typeof(l_evict_0) == "function" then
            v34.reset = function(...) --[[ Line: 105 ]]
                -- upvalues: v26 (ref), v34 (copy), l_evict_0 (copy)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_evict_0(...);
            end;
        end;
    end;
    return (setmetatable(v35, v33));
end;
v33.init = function(v39, v40) --[[ Line: 230 ]] --[[ Name: init ]]
    -- upvalues: l_Boolean_0 (copy), l_NetworkStatus_0 (copy), v12 (copy), l_Object_0 (copy)
    local v41 = l_Boolean_0.toJSBoolean(v40.networkStatus) and v40.networkStatus or l_NetworkStatus_0.loading;
    if l_Boolean_0.toJSBoolean(v39.variables) and v39.networkStatus ~= l_NetworkStatus_0.loading and not v12(v39.variables, v40.variables) then
        v41 = l_NetworkStatus_0.setVariables;
    end;
    if not v12(v40.variables, v39.variables) then
        v39.lastDiff = nil;
    end;
    l_Object_0.assign(v39, {
        document = v40.document, 
        variables = v40.variables, 
        networkError = l_Object_0.None, 
        graphQLErrors = l_Boolean_0.toJSBoolean(v39.graphQLErrors) and v39.graphQLErrors or {}, 
        networkStatus = v41
    });
    if l_Boolean_0.toJSBoolean(v40.observableQuery) then
        v39:setObservableQuery(v40.observableQuery);
    end;
    if l_Boolean_0.toJSBoolean(v40.lastRequestId) then
        v39.lastRequestId = v40.lastRequestId;
    end;
    return v39;
end;
v33.reset = function(v42) --[[ Line: 271 ]] --[[ Name: reset ]]
    -- upvalues: l_Boolean_0 (copy), l_clearTimeout_0 (copy)
    if l_Boolean_0.toJSBoolean(v42.notifyTimeout) then
        l_clearTimeout_0(v42.notifyTimeout);
        v42.notifyTimeout = nil;
    end;
    v42.lastDiff = nil;
    v42.dirty = false;
end;
v33.getDiff = function(v43, v44) --[[ Line: 277 ]] --[[ Name: getDiff ]]
    -- upvalues: l_Boolean_0 (copy), v12 (copy)
    if v44 == nil then
        v44 = v43.variables;
    end;
    local v45 = v43:getDiffOptions(v44);
    if l_Boolean_0.toJSBoolean(v43.lastDiff) and v12(v45, v43.lastDiff.options) then
        return v43.lastDiff.diff;
    else
        v43.variables = v44;
        v43:updateWatch(v43.variables);
        local l_observableQuery_0 = v43.observableQuery;
        if l_Boolean_0.toJSBoolean(l_observableQuery_0) and l_observableQuery_0.options.fetchPolicy == "no-cache" then
            return {
                complete = false
            };
        else
            local v47 = v43.cache:diff(v45);
            v43:updateLastDiff(v47, v45);
            return v47;
        end;
    end;
end;
v33.updateLastDiff = function(v48, v49, v50) --[[ Line: 302 ]] --[[ Name: updateLastDiff ]]
    -- upvalues: l_Boolean_0 (copy)
    v48.lastDiff = l_Boolean_0.toJSBoolean(v49) and {
        diff = v49, 
        options = l_Boolean_0.toJSBoolean(v50) and v50 or v48:getDiffOptions()
    } or nil;
end;
v33.getDiffOptions = function(v51, v52) --[[ Line: 311 ]] --[[ Name: getDiffOptions ]]
    -- upvalues: l_Boolean_0 (copy)
    if v52 == nil then
        v52 = v51.variables;
    end;
    local l_observableQuery_1 = v51.observableQuery;
    return {
        query = v51.document, 
        variables = v52, 
        returnPartialData = true, 
        optimistic = true, 
        canonizeResults = not l_Boolean_0.toJSBoolean(l_observableQuery_1) or l_observableQuery_1.options.canonizeResults ~= false
    };
end;
v33.setDiff = function(v54, v55) --[[ Line: 327 ]] --[[ Name: setDiff ]]
    -- upvalues: l_Boolean_0 (copy), v12 (copy), l_setTimeout_0 (copy)
    local v56 = nil;
    v56 = if l_Boolean_0.toJSBoolean(v54.lastDiff) then v54.lastDiff.diff else v54.lastDiff;
    v54:updateLastDiff(v55);
    local v57 = nil;
    local v58 = nil;
    v57 = if l_Boolean_0.toJSBoolean(v56) then v56.result else v56;
    v58 = if l_Boolean_0.toJSBoolean(v55) then v55.result else v55;
    if not v54.dirty and not v12(v57, v58) then
        v54.dirty = true;
        if not l_Boolean_0.toJSBoolean(v54.notifyTimeout) then
            v54.notifyTimeout = l_setTimeout_0(function() --[[ Line: 352 ]]
                -- upvalues: v54 (copy)
                return v54:notify();
            end, 0);
        end;
    end;
end;
v33.setObservableQuery = function(v59, v60) --[[ Line: 359 ]] --[[ Name: setObservableQuery ]]
    -- upvalues: l_Boolean_0 (copy)
    if v60 == v59.observableQuery then
        return;
    else
        if l_Boolean_0.toJSBoolean(v59.oqListener) then
            v59.listeners:delete(v59.oqListener);
        end;
        v59.observableQuery = v60;
        if l_Boolean_0.toJSBoolean(v60) and v60 ~= nil then
            v60.queryInfo = v59;
            v59.oqListener = function() --[[ Line: 373 ]]
                -- upvalues: l_Boolean_0 (ref), v59 (copy), v60 (copy)
                if l_Boolean_0.toJSBoolean(v59:getDiff().fromOptimisticTransaction) then
                    v60.observe(v60);
                    return;
                else
                    v60:reobserve();
                    return;
                end;
            end;
            v59.listeners:add(v59.oqListener);
            return;
        else
            v59.oqListener = nil;
            return;
        end;
    end;
end;
v33.notify = function(v61) --[[ Line: 391 ]] --[[ Name: notify ]]
    -- upvalues: l_Boolean_0 (copy), l_clearTimeout_0 (copy)
    if l_Boolean_0.toJSBoolean(v61.notifyTimeout) then
        l_clearTimeout_0(v61.notifyTimeout);
        v61.notifyTimeout = nil;
    end;
    if v61:shouldNotify() then
        v61.listeners:forEach(function(v62) --[[ Line: 395 ]]
            -- upvalues: v61 (copy)
            return v62(v61);
        end);
    end;
    v61.dirty = false;
end;
v33.shouldNotify = function(v63) --[[ Line: 402 ]] --[[ Name: shouldNotify ]]
    -- upvalues: l_Boolean_0 (copy), l_isNetworkRequestInFlight_0 (copy)
    if not v63.dirty or not l_Boolean_0.toJSBoolean(v63.listeners.size) then
        return false;
    else
        if l_isNetworkRequestInFlight_0(v63.networkStatus) and l_Boolean_0.toJSBoolean(v63.observableQuery) then
            local l_fetchPolicy_0 = v63.observableQuery.options.fetchPolicy;
            if l_fetchPolicy_0 ~= "cache-only" and l_fetchPolicy_0 ~= "cache-and-network" then
                return false;
            end;
        end;
        return true;
    end;
end;
v33.stop = function(v65) --[[ Line: 416 ]] --[[ Name: stop ]]
    -- upvalues: v33 (copy), l_Boolean_0 (copy)
    if not v65.stopped then
        v65.stopped = true;
        v65:reset();
        v65:cancel();
        v65.cancel = v33.cancel;
        v65.subscriptions:forEach(function(v66) --[[ Line: 426 ]]
            return v66:unsubscribe();
        end);
        local l_observableQuery_2 = v65.observableQuery;
        if l_Boolean_0.toJSBoolean(l_observableQuery_2) then
            l_observableQuery_2:stopPolling();
        end;
    end;
end;
v33.cancel = function(_) --[[ Line: 440 ]] --[[ Name: cancel ]]

end;
v33.updateWatch = function(v69, v70) --[[ Line: 442 ]] --[[ Name: updateWatch ]]
    -- upvalues: l_Boolean_0 (copy), l_Object_0 (copy), v12 (copy)
    if v70 == nil then
        v70 = v69.variables;
    end;
    local l_observableQuery_3 = v69.observableQuery;
    if l_Boolean_0.toJSBoolean(l_observableQuery_3) and l_observableQuery_3.options.fetchPolicy == "no-cache" then
        return;
    else
        local v74 = l_Object_0.assign({}, v69:getDiffOptions(v70), {
            watcher = v69, 
            callback = function(_, v73) --[[ Line: 461 ]] --[[ Name: callback ]]
                -- upvalues: v69 (copy)
                return v69:setDiff(v73);
            end
        });
        local v75 = l_Object_0.assign({}, v74, {
            callback = l_Object_0.None
        });
        local v76 = l_Object_0.assign({}, v69.lastWatch, {
            callback = l_Object_0.None
        });
        if not l_Boolean_0.toJSBoolean(v69.lastWatch) or not v12(v75, v76) then
            v69:cancel();
            v69.lastWatch = v74;
            v69.cancel = v69.cache:watch(v69.lastWatch);
        end;
        return;
    end;
end;
v33.resetLastWrite = function(v77) --[[ Line: 477 ]] --[[ Name: resetLastWrite ]]
    v77.lastWrite = nil;
end;
v33.shouldWrite = function(v78, v79, v80) --[[ Line: 481 ]] --[[ Name: shouldWrite ]]
    -- upvalues: l_Boolean_0 (copy), v26 (copy), v12 (copy)
    local l_lastWrite_0 = v78.lastWrite;
    return not (l_Boolean_0.toJSBoolean(l_lastWrite_0) and l_lastWrite_0.dmCount == v26:get(v78.cache) and v12(v80, l_lastWrite_0.variables) and v12(v79.data, l_lastWrite_0.result.data));
end;
local v82 = nil;
v33.markResult = function(v83, v84, v85, v86) --[[ Line: 507 ]] --[[ Name: markResult ]]
    -- upvalues: l_isNonEmptyArray_0 (copy), v25 (copy), v82 (ref), v26 (copy), l_Boolean_0 (copy)
    if l_isNonEmptyArray_0(v84.errors) then
        v83.graphQLErrors = v84.errors;
    else
        v83.graphQLErrors = {};
    end;
    v83:reset();
    if v85.fetchPolicy == "no-cache" then
        v83:updateLastDiff({
            result = v84.data, 
            complete = true
        }, v83:getDiffOptions(v85.variables));
        return;
    else
        if v86 ~= v25.FORBID then
            if v82(v84, v85.errorPolicy) then
                v83.cache:performTransaction(function(v87) --[[ Line: 529 ]]
                    -- upvalues: v83 (copy), v84 (copy), v85 (copy), v86 (copy), v25 (ref), v26 (ref), l_Boolean_0 (ref)
                    if v83:shouldWrite(v84, v85.variables) then
                        v87:writeQuery({
                            query = v83.document, 
                            data = v84.data, 
                            variables = v85.variables, 
                            overwrite = v86 == v25.OVERWRITE
                        });
                        v83.lastWrite = {
                            result = v84, 
                            variables = v85.variables, 
                            dmCount = v26:get(v83.cache)
                        };
                    elseif l_Boolean_0.toJSBoolean(v83.lastDiff) and l_Boolean_0.toJSBoolean(v83.lastDiff.diff.complete) then
                        v84.data = v83.lastDiff.diff.result;
                        return;
                    end;
                    local v88 = v83:getDiffOptions(v85.variables);
                    local v89 = v87:diff(v88);
                    if not v83.stopped then
                        v83:updateWatch(v85.variables);
                    end;
                    v83:updateLastDiff(v89, v88);
                    if l_Boolean_0.toJSBoolean(v89.complete) then
                        v84.data = v89.result;
                    end;
                end);
                return;
            else
                v83.lastWrite = nil;
            end;
        end;
        return;
    end;
end;
v33.markReady = function(v90) --[[ Line: 613 ]] --[[ Name: markReady ]]
    -- upvalues: l_NetworkStatus_0 (copy)
    v90.networkError = nil;
    v90.networkStatus = l_NetworkStatus_0.ready;
    return v90.networkStatus;
end;
v33.markError = function(v91, v92) --[[ Line: 619 ]] --[[ Name: markError ]]
    -- upvalues: l_NetworkStatus_0 (copy), l_Boolean_0 (copy)
    v91.networkStatus = l_NetworkStatus_0.error;
    v91.lastWrite = nil;
    v91:reset();
    if l_Boolean_0.toJSBoolean(v92.graphQLErrors) then
        v91.graphQLErrors = v92.graphQLErrors;
    end;
    if l_Boolean_0.toJSBoolean(v92.networkError) then
        v91.networkError = v92.networkError;
    end;
    return v92;
end;
v0.QueryInfo = v33;
v82 = function(v93, v94) --[[ Line: 637 ]] --[[ Name: shouldWriteResult ]]
    -- upvalues: l_graphQLResultHasError_0 (copy), l_Boolean_0 (copy)
    if v94 == nil then
        v94 = "none";
    end;
    local v95 = true;
    if v94 ~= "ignore" then
        v95 = v94 == "all";
    end;
    return not l_graphQLResultHasError_0(v93) or v95 and l_Boolean_0.toJSBoolean(v93.data) and true;
end;
v0.shouldWriteResult = v82;
return v0;