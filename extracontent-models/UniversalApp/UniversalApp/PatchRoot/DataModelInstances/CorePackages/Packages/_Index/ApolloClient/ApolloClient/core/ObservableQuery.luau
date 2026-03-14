local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local v9 = require(l_Parent_0.luaUtils.isCallable);
local v10 = require(l_Parent_1.Promise);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v12 = require(l_Parent_0.jsutils.equal);
local v13 = require(script.Parent.networkStatus);
local l_NetworkStatus_0 = v13.NetworkStatus;
local l_isNetworkRequestInFlight_0 = v13.isNetworkRequestInFlight;
local v16 = require(script.Parent.Parent.utilities);
local l_compact_0 = v16.compact;
local l_cloneDeep_0 = v16.cloneDeep;
local l_getOperationDefinition_0 = v16.getOperationDefinition;
local l_Observable_0 = v16.Observable;
local l_iterateObserversSafely_0 = v16.iterateObserversSafely;
local l_isNonEmptyArray_0 = v16.isNonEmptyArray;
local l_fixObservableSubclass_0 = v16.fixObservableSubclass;
local l_ApolloError_0 = require(script.Parent.Parent.errors).ApolloError;
local _ = require(script.Parent.types);
local _ = require(script.Parent.watchQueryOptions_types);
local _ = require(script.Parent.QueryInfo);
local _ = require(script.Parent.ObservableQuery_types);
local v29 = nil;
local v30 = false;
local v31 = setmetatable({}, {
    __index = l_Observable_0
});
v31.__index = function(v32, v33) --[[ Line: 89 ]]
    -- upvalues: v31 (copy)
    if v33 == "variables" then
        return v32.options.variables;
    elseif rawget(v32, v33) then
        return (rawget(v32, v33));
    elseif rawget(v31, v33) then
        return (rawget(v31, v33));
    else
        return getmetatable(v31).__index[v33];
    end;
end;
v31.__newindex = function(v34, v35, v36) --[[ Line: 103 ]]
    if v35 == "variables" then
        error("setting getter-only property 'variables'");
    end;
    rawset(v34, v35, v36);
end;
v31.new = function(v37) --[[ Line: 110 ]] --[[ Name: new ]]
    -- upvalues: l_Observable_0 (copy), l_Boolean_0 (copy), v29 (ref), v31 (copy), l_Set_0 (copy), l_iterateObserversSafely_0 (copy), l_Object_0 (copy), l_NetworkStatus_0 (copy), l_getOperationDefinition_0 (copy)
    local l_queryManager_0 = v37.queryManager;
    local l_queryInfo_0 = v37.queryInfo;
    local l_options_0 = v37.options;
    local v41 = nil;
    v41 = setmetatable(l_Observable_0.new(function(v42) --[[ Line: 120 ]]
        -- upvalues: l_Boolean_0 (ref), v29 (ref), v41 (ref)
        xpcall(function() --[[ Line: 123 ]]
            -- upvalues: v42 (copy), l_Boolean_0 (ref), v29 (ref)
            local l__observer_0 = v42._subscription._observer;
            if l_Boolean_0.toJSBoolean(l__observer_0) and not l_Boolean_0.toJSBoolean(l__observer_0.error) then
                l__observer_0.error = v29;
            end;
        end, function() --[[ Line: 128 ]]

        end);
        local v44 = not l_Boolean_0.toJSBoolean(v41.observers.size);
        v41.observers:add(v42);
        if l_Boolean_0.toJSBoolean(v41.lastError) then
            if l_Boolean_0.toJSBoolean(v42.error) then
                v42:error(v41.lastError);
            end;
        elseif l_Boolean_0.toJSBoolean(v41.lastResult) and l_Boolean_0.toJSBoolean(v42.next) then
            v42:next(v41.lastResult);
        end;
        if v44 then
            v41:reobserve():catch(function() --[[ Line: 151 ]]

            end);
        end;
        return function() --[[ Line: 154 ]]
            -- upvalues: v41 (ref), v42 (copy), l_Boolean_0 (ref)
            if v41.observers:delete(v42) and not l_Boolean_0.toJSBoolean(v41.observers.size) then
                v41:tearDownQuery();
            end;
        end;
    end), v31);
    v41.observers = l_Set_0.new();
    v41.subscriptions = l_Set_0.new();
    v41.observer = {
        next = function(_, v46) --[[ Line: 167 ]] --[[ Name: next ]]
            -- upvalues: l_Boolean_0 (ref), v41 (ref), l_iterateObserversSafely_0 (ref)
            if l_Boolean_0.toJSBoolean(v41.lastError) or v41:isDifferentFromLastResult(v46) then
                v41:updateLastResult(v46);
                l_iterateObserversSafely_0(v41.observers, "next", v46);
            end;
        end, 
        error = function(_, v48) --[[ Line: 173 ]]
            -- upvalues: v41 (ref), l_Object_0 (ref), l_NetworkStatus_0 (ref), l_iterateObserversSafely_0 (ref)
            v41:updateLastResult((l_Object_0.assign({}, v41.lastResult, {
                error = v48, 
                errors = v48.graphQLErrors, 
                networkStatus = l_NetworkStatus_0.error, 
                loading = false
            })));
            v41.lastError = v48;
            l_iterateObserversSafely_0(v41.observers, "error", v41.lastError);
        end
    };
    v41.isTornDown = false;
    v41.options = l_options_0;
    v41.queryId = l_queryManager_0:generateQueryId();
    local v49 = l_getOperationDefinition_0(l_options_0.query);
    if not l_Boolean_0.toJSBoolean(v49) then
        v41.queryName = v49;
    elseif not l_Boolean_0.toJSBoolean(v49.name) then
        v41.queryName = v49.name;
    else
        v41.queryName = v49.name.value;
    end;
    v41.initialFetchPolicy = l_Boolean_0.toJSBoolean(l_options_0.fetchPolicy) and l_options_0.fetchPolicy or "cache-first";
    v41.queryManager = l_queryManager_0;
    v41.queryInfo = l_queryInfo_0;
    return v41;
end;
v31.result = function(v50) --[[ Line: 215 ]] --[[ Name: result ]]
    -- upvalues: v10 (copy), l_Boolean_0 (copy), l_setTimeout_0 (copy)
    return v10.new(function(v51, v52) --[[ Line: 216 ]]
        -- upvalues: v50 (copy), l_Boolean_0 (ref), l_setTimeout_0 (ref)
        local v53 = nil;
        local v54 = nil;
        v54 = {
            next = function(_, v56) --[[ Line: 225 ]] --[[ Name: next ]]
                -- upvalues: v51 (copy), v50 (ref), v54 (ref), l_Boolean_0 (ref), l_setTimeout_0 (ref), v53 (ref)
                v51(v56);
                v50.observers:delete(v54);
                if not l_Boolean_0.toJSBoolean(v50.observers.size) then
                    v50.queryManager:removeQuery(v50.queryId);
                end;
                l_setTimeout_0(function() --[[ Line: 242 ]]
                    -- upvalues: v53 (ref)
                    v53:unsubscribe();
                end, 0);
            end, 
            error = function(_, v58) --[[ Line: 246 ]]
                -- upvalues: v52 (copy)
                v52(v58);
            end
        };
        v53 = v50:subscribe(v54);
    end);
end;
v31.getCurrentResult = function(v59, v60) --[[ Line: 255 ]] --[[ Name: getCurrentResult ]]
    -- upvalues: l_Boolean_0 (copy), l_NetworkStatus_0 (copy), l_Object_0 (copy), l_isNetworkRequestInFlight_0 (copy), l_ApolloError_0 (copy)
    if v60 == nil then
        v60 = true;
    end;
    local l_lastResult_0 = v59.lastResult;
    local v62 = nil;
    v62 = v59.options.fetchPolicy == nil and "cache-first" or v59.options.fetchPolicy;
    local v63 = nil;
    v63 = if l_Boolean_0.toJSBoolean(v59.queryInfo.networkStatus) then v59.queryInfo.networkStatus else if l_Boolean_0.toJSBoolean(l_lastResult_0) and l_Boolean_0.toJSBoolean(l_lastResult_0.networkStatus) then l_lastResult_0.networkStatus else l_NetworkStatus_0.ready;
    local v64 = l_Object_0.assign({}, l_lastResult_0, {
        loading = l_isNetworkRequestInFlight_0(v63), 
        networkStatus = v63
    });
    if not v59.queryManager:transform(v59.options.query).hasForcedResolvers then
        local v65 = v59.queryInfo:getDiff();
        if l_Boolean_0.toJSBoolean(v65.complete) or l_Boolean_0.toJSBoolean(v59.options.returnPartialData) then
            v64.data = v65.result;
        else
            v64.data = nil;
        end;
        if l_Boolean_0.toJSBoolean(v65.complete) then
            if v64.networkStatus == l_NetworkStatus_0.loading and (v62 == "cache-first" or v62 == "cache-only") then
                v64.networkStatus = l_NetworkStatus_0.ready;
                v64.loading = false;
            end;
            v64.partial = nil;
        elseif v62 ~= "no-cache" then
            v64.partial = true;
        end;
        if not l_Boolean_0.toJSBoolean(v65.complete) and not l_Boolean_0.toJSBoolean(v59.options.partialRefetch) and not l_Boolean_0.toJSBoolean(v64.loading) and not l_Boolean_0.toJSBoolean(v64.data) and not l_Boolean_0.toJSBoolean(v64.error) then
            v64.error = l_ApolloError_0.new({
                clientErrors = v65.missing
            });
        end;
    end;
    if v60 then
        v59:updateLastResult(v64);
    end;
    return v64;
end;
v31.isDifferentFromLastResult = function(v66, v67) --[[ Line: 335 ]] --[[ Name: isDifferentFromLastResult ]]
    -- upvalues: v12 (copy)
    return not v12(v66.lastResultSnapshot, v67);
end;
v31.getLastResult = function(v68) --[[ Line: 341 ]] --[[ Name: getLastResult ]]
    return v68.lastResult;
end;
v31.getLastError = function(v69) --[[ Line: 345 ]] --[[ Name: getLastError ]]
    return v69.lastError;
end;
v31.resetLastResults = function(v70) --[[ Line: 349 ]] --[[ Name: resetLastResults ]]
    v70.lastResult = nil;
    v70.lastResultSnapshot = nil;
    v70.lastError = nil;
    v70.isTornDown = false;
end;
v31.resetQueryStoreErrors = function(v71) --[[ Line: 356 ]] --[[ Name: resetQueryStoreErrors ]]
    v71.queryManager:resetErrors(v71.queryId);
end;
v31.refetch = function(v72, v73) --[[ Line: 367 ]] --[[ Name: refetch ]]
    -- upvalues: l_Boolean_0 (copy), v12 (copy), l_Object_0 (copy), l_NetworkStatus_0 (copy)
    local v74 = {
        pollInterval = 0
    };
    local l_fetchPolicy_0 = v72.options.fetchPolicy;
    if l_fetchPolicy_0 == "no-cache" then
        v74.fetchPolicy = "no-cache";
    elseif l_fetchPolicy_0 ~= "cache-and-network" then
        v74.fetchPolicy = "network-only";
    end;
    if l_Boolean_0.toJSBoolean(v73) and not v12(v72.options.variables, v73) then
        v72.options.variables = l_Object_0.assign({}, v72.options.variables, v73);
        v74.variables = v72.options.variables;
    end;
    v72.queryInfo:resetLastWrite();
    return v72:reobserve(v74, l_NetworkStatus_0.refetch);
end;
v31.fetchMore = function(v76, v77) --[[ Line: 393 ]] --[[ Name: fetchMore ]]
    -- upvalues: l_Object_0 (copy), l_Boolean_0 (copy), l_NetworkStatus_0 (copy), v30 (ref), l_invariant_0 (copy)
    local v78 = l_Object_0.assign({}, (function() --[[ Line: 398 ]]
        -- upvalues: l_Boolean_0 (ref), v77 (copy), l_Object_0 (ref), v76 (copy)
        if l_Boolean_0.toJSBoolean(v77.query) then
            return v77;
        else
            return l_Object_0.assign({}, v76.options, v77, {
                variables = l_Object_0.assign({}, v76.options.variables, v77.variables)
            });
        end;
    end)(), {
        fetchPolicy = "no-cache"
    });
    local v79 = v76.queryManager:generateQueryId();
    if l_Boolean_0.toJSBoolean(v78.notifyOnNetworkStatusChange) then
        v76.queryInfo.networkStatus = l_NetworkStatus_0.fetchMore;
        v76:observe();
    end;
    return v76.queryManager:fetchQuery(v79, v78, l_NetworkStatus_0.fetchMore):andThen(function(v80) --[[ Line: 431 ]]
        -- upvalues: v77 (copy), l_Boolean_0 (ref), v30 (ref), l_invariant_0 (ref), v76 (copy), v78 (copy)
        local l_data_0 = v80.data;
        local l_updateQuery_0 = v77.updateQuery;
        if l_Boolean_0.toJSBoolean(l_updateQuery_0) then
            if _G.__DEV__ and (not v30 or not _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
                l_invariant_0.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.");
                v30 = true;
                _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = v30;
            end;
            v76:updateQuery(function(v83) --[[ Line: 456 ]]
                -- upvalues: l_updateQuery_0 (copy), v77 (ref), l_data_0 (copy), v78 (ref)
                return l_updateQuery_0(v77, v83, {
                    fetchMoreResult = l_data_0, 
                    variables = v78.variables
                });
            end);
            return v80;
        else
            v76.queryManager.cache:writeQuery({
                query = v78.query, 
                variables = v78.variables, 
                data = l_data_0
            });
            return v80;
        end;
    end):andThen(function(v84) --[[ Line: 479 ]]
        -- upvalues: v76 (copy), v79 (copy)
        v76.queryManager:stopQuery(v79);
        v76:reobserve();
        return v84;
    end):catch(function(v85) --[[ Line: 484 ]]
        -- upvalues: v76 (copy), v79 (copy)
        v76.queryManager:stopQuery(v79);
        v76:reobserve();
        error(v85);
    end);
end;
v31.subscribeToMore = function(v86, v87) --[[ Line: 494 ]] --[[ Name: subscribeToMore ]]
    -- upvalues: l_Boolean_0 (copy), l_invariant_0 (copy)
    local v96 = v86.queryManager:startGraphQLSubscription({
        query = v87.document, 
        variables = v87.variables, 
        context = v87.context
    }):subscribe({
        next = function(_, v89) --[[ Line: 508 ]] --[[ Name: next ]]
            -- upvalues: v87 (copy), l_Boolean_0 (ref), v86 (copy)
            local l_updateQuery_1 = v87.updateQuery;
            if l_Boolean_0.toJSBoolean(l_updateQuery_1) then
                v86:updateQuery(function(v91, v92) --[[ Line: 511 ]]
                    -- upvalues: l_updateQuery_1 (copy), v89 (copy)
                    local l_variables_0 = v92.variables;
                    return l_updateQuery_1(v91, {
                        subscriptionData = v89, 
                        variables = l_variables_0
                    });
                end);
            end;
        end, 
        error = function(_, v95) --[[ Line: 520 ]] --[[ Name: error ]]
            -- upvalues: l_Boolean_0 (ref), v87 (copy), l_invariant_0 (ref)
            if l_Boolean_0.toJSBoolean(v87.onError) then
                v87:onError(v95);
                return;
            else
                l_invariant_0.error("Unhandled GraphQL subscription error", v95);
                return;
            end;
        end
    });
    v86.subscriptions:add(v96);
    return function() --[[ Line: 531 ]]
        -- upvalues: l_Boolean_0 (ref), v86 (copy), v96 (copy)
        if l_Boolean_0.toJSBoolean(v86.subscriptions:delete(v96)) then
            v96:unsubscribe();
        end;
    end;
end;
v31.setOptions = function(v97, v98) --[[ Line: 538 ]] --[[ Name: setOptions ]]
    return v97:reobserve(v98);
end;
v31.setVariables = function(v99, v100) --[[ Line: 564 ]] --[[ Name: setVariables ]]
    -- upvalues: v12 (copy), l_Boolean_0 (copy), v10 (copy), l_NetworkStatus_0 (copy)
    if v12(v99.variables, v100) then
        if l_Boolean_0.toJSBoolean(v99.observers.size) then
            return v99:result();
        else
            return v10.resolve();
        end;
    else
        v99.options.variables = v100;
        if not l_Boolean_0.toJSBoolean(v99.observers.size) then
            return v10.resolve();
        else
            return v99:reobserve({
                fetchPolicy = v99.initialFetchPolicy, 
                variables = v100
            }, l_NetworkStatus_0.setVariables);
        end;
    end;
end;
v31.updateQuery = function(v101, v102) --[[ Line: 590 ]] --[[ Name: updateQuery ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_queryManager_1 = v101.queryManager;
    local _ = nil;
    local v105 = v102(l_queryManager_1.cache:diff({
        query = v101.options.query, 
        variables = v101.variables, 
        previousResult = l_Boolean_0.toJSBoolean(v101.lastResult) and v101.lastResult.data or nil, 
        returnPartialData = true, 
        optimistic = false
    }).result, {
        variables = v101.variables
    });
    if l_Boolean_0.toJSBoolean(v105) then
        l_queryManager_1.cache:writeQuery({
            query = v101.options.query, 
            data = v105, 
            variables = v101.variables
        });
        l_queryManager_1:broadcastQueries();
    end;
end;
v31.startPolling = function(v106, v107) --[[ Line: 623 ]] --[[ Name: startPolling ]]
    v106.options.pollInterval = v107;
    v106:updatePolling();
end;
v31.stopPolling = function(v108) --[[ Line: 628 ]] --[[ Name: stopPolling ]]
    v108.options.pollInterval = 0;
    v108:updatePolling();
end;
v31.fetch = function(v109, v110, v111) --[[ Line: 633 ]] --[[ Name: fetch ]]
    v109.queryManager:setObservableQuery(v109);
    return v109.queryManager:fetchQueryObservable(v109.queryId, v110, v111);
end;
v31.updatePolling = function(v112) --[[ Line: 642 ]] --[[ Name: updatePolling ]]
    -- upvalues: l_Boolean_0 (copy), l_clearTimeout_0 (copy), l_invariant_0 (copy), l_isNetworkRequestInFlight_0 (copy), l_NetworkStatus_0 (copy), l_setTimeout_0 (copy)
    local v113 = false;
    local v114 = nil;
    if l_Boolean_0.toJSBoolean(v112.queryManager.ssrMode) then
        return;
    else
        local l_pollingInfo_0 = v112.pollingInfo;
        local l_pollInterval_0 = v112.options.pollInterval;
        if not l_Boolean_0.toJSBoolean(l_pollInterval_0) then
            if l_Boolean_0.toJSBoolean(l_pollingInfo_0) then
                l_clearTimeout_0(l_pollingInfo_0.timeout);
                v112.pollingInfo = nil;
            end;
            return;
        elseif l_Boolean_0.toJSBoolean(l_pollingInfo_0) and l_pollingInfo_0.interval == l_pollInterval_0 then
            return;
        else
            l_invariant_0(l_pollInterval_0, "Attempted to start a polling query without a polling interval.");
            local v117;
            if l_Boolean_0.toJSBoolean(l_pollingInfo_0) then
                v117 = l_pollingInfo_0;
                v113 = v117;
            end;
            if not v113 then
                v112.pollingInfo = {};
                v117 = v112.pollingInfo;
            end;
            v113 = false;
            v117.interval = l_pollInterval_0;
            local function v118() --[[ Line: 673 ]] --[[ Name: maybeFetch ]]
                -- upvalues: l_Boolean_0 (ref), v112 (copy), l_isNetworkRequestInFlight_0 (ref), l_NetworkStatus_0 (ref), v114 (ref)
                if l_Boolean_0.toJSBoolean(v112.pollingInfo) then
                    if not l_isNetworkRequestInFlight_0(v112.queryInfo.networkStatus) then
                        v112:reobserve({
                            fetchPolicy = "network-only"
                        }, l_NetworkStatus_0.poll):andThen(v114, v114);
                        return;
                    else
                        v114();
                    end;
                end;
            end;
            v114 = function() --[[ Line: 685 ]] --[[ Name: poll ]]
                -- upvalues: v112 (copy), l_Boolean_0 (ref), l_clearTimeout_0 (ref), l_setTimeout_0 (ref), v118 (copy)
                local l_pollingInfo_1 = v112.pollingInfo;
                if l_Boolean_0.toJSBoolean(l_pollingInfo_1) then
                    if l_pollingInfo_1.timeout then
                        l_clearTimeout_0(l_pollingInfo_1.timeout);
                    end;
                    l_pollingInfo_1.timeout = l_setTimeout_0(v118, l_pollingInfo_1.interval);
                end;
            end;
            v114();
            return;
        end;
    end;
end;
v31.updateLastResult = function(v120, v121) --[[ Line: 699 ]] --[[ Name: updateLastResult ]]
    -- upvalues: l_Boolean_0 (copy), l_cloneDeep_0 (copy), l_isNonEmptyArray_0 (copy)
    local l_lastResult_1 = v120.lastResult;
    v120.lastResult = v121;
    if l_Boolean_0.toJSBoolean(v120.queryManager.assumeImmutableResults) then
        v120.lastResultSnapshot = v121;
    else
        v120.lastResultSnapshot = l_cloneDeep_0(v121);
    end;
    if not l_isNonEmptyArray_0(v121.errors) then
        v120.lastError = nil;
    end;
    return l_lastResult_1;
end;
v31.reobserve = function(v123, v124, v125) --[[ Line: 715 ]] --[[ Name: reobserve ]]
    -- upvalues: l_NetworkStatus_0 (copy), l_compact_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), v12 (copy)
    v123.isTornDown = false;
    local v126 = true;
    if v125 ~= l_NetworkStatus_0.refetch then
        v126 = true;
        if v125 ~= l_NetworkStatus_0.fetchMore then
            v126 = v125 == l_NetworkStatus_0.poll;
        end;
    end;
    local l_variables_1 = v123.options.variables;
    local v128 = if v126 then l_compact_0(v123.options, v124) else l_Object_0.assign(v123.options, l_compact_0(v124));
    if not v126 then
        v123:updatePolling();
        if v124 ~= nil and l_Boolean_0.toJSBoolean(v124.variables) and not l_Boolean_0.toJSBoolean(v124.fetchPolicy) and not v12(v124.variables, l_variables_1) then
            v128.fetchPolicy = v123.initialFetchPolicy;
            if v125 == nil then
                v125 = l_NetworkStatus_0.setVariables;
            end;
        end;
    end;
    local v129 = v123:fetch(v128, v125);
    if not v126 then
        if v123.concast then
            v123.concast:removeObserver(v123.observer, true);
        end;
        v123.concast = v129;
    end;
    v129:addObserver(v123.observer);
    return v129.promise;
end;
v31.observe = function(v130) --[[ Line: 785 ]] --[[ Name: observe ]]
    v130.observer:next(v130:getCurrentResult(false));
end;
v31.hasObservers = function(v131) --[[ Line: 793 ]] --[[ Name: hasObservers ]]
    return v131.observers.size > 0;
end;
v31.tearDownQuery = function(v132) --[[ Line: 797 ]] --[[ Name: tearDownQuery ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v132.isTornDown) then
        return;
    else
        if l_Boolean_0.toJSBoolean(v132.concast) then
            v132.concast:removeObserver(v132.observer);
            v132.concast = nil;
        end;
        v132:stopPolling();
        v132.subscriptions:forEach(function(v133) --[[ Line: 809 ]]
            return v133:unsubscribe();
        end);
        v132.subscriptions:clear();
        v132.queryManager:stopQuery(v132.queryId);
        v132.observers:clear();
        v132.isTornDown = true;
        return;
    end;
end;
l_fixObservableSubclass_0(v31);
v2.ObservableQuery = v31;
v29 = function(_, v135) --[[ Line: 825 ]] --[[ Name: defaultSubscriptionObserverErrorCallback ]]
    -- upvalues: l_invariant_0 (copy)
    l_invariant_0.error("Unhandled error", v135.message, v135.stack);
end;
v2.applyNextFetchPolicy = function(v136) --[[ Line: 833 ]] --[[ Name: applyNextFetchPolicy ]]
    -- upvalues: l_Boolean_0 (copy), v9 (copy)
    local v137 = nil;
    v137 = v136.fetchPolicy == nil and "cache-first" or v136.fetchPolicy;
    local l_nextFetchPolicy_0 = v136.nextFetchPolicy;
    if l_Boolean_0.toJSBoolean(l_nextFetchPolicy_0) then
        if v9(l_nextFetchPolicy_0) then
            v136.fetchPolicy = l_nextFetchPolicy_0(v136, v137);
            return;
        else
            v136.fetchPolicy = l_nextFetchPolicy_0;
        end;
    end;
end;
return v2;