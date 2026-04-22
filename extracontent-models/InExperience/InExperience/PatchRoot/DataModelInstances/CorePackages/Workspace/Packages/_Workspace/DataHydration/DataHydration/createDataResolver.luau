local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v5 = require(l_script_FirstAncestor_0.createRequestQueue);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppDataHydrationDataResolverOnClear_0 = v7.FFlagLuaAppDataHydrationDataResolverOnClear;
local l_FFlagSduiChartsSupport_0 = v7.FFlagSduiChartsSupport;
local l_FFlagSduiDataCacheResetItem_0 = v7.FFlagSduiDataCacheResetItem;
local v11 = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50);
local v12 = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1);
local v13 = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30);
return function(v14) --[[ Line: 26 ]] --[[ Name: createDataResolver ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy), v5 (copy), l_getLocalPlayerUserId_0 (copy), v6 (copy), l_FFlagSduiDataCacheResetItem_0 (copy), l_FFlagSduiChartsSupport_0 (copy), l_FFlagLuaAppDataHydrationDataResolverOnClear_0 (copy), l_Players_0 (copy)
    local v15 = v14.supportsMultiGet == nil or v14.supportsMultiGet;
    local v16 = v14.requestBatchSize or v11;
    if not v15 and not v14.requestBatchSize then
        v16 = 1;
    end;
    local v17 = v14.queueProcessDelaySec or v12;
    if not v15 and not v14.queueProcessDelaySec then
        v17 = 0;
    end;
    local v18 = v14.requestTimeoutSec or v13;
    local l_cache_0 = v14.cache;
    local v20 = v5();
    local v21 = {};
    local v22 = nil;
    local v23 = l_getLocalPlayerUserId_0();
    local function v24() --[[ Line: 58 ]] --[[ Name: FORCE_FETCH ]]
        return true;
    end;
    local function _(v25) --[[ Line: 62 ]] --[[ Name: logError ]]
        -- upvalues: v14 (copy)
        if v14.logError then
            v14.logError(v25);
        end;
    end;
    local _ = function(v27, v28, v29) --[[ Line: 69 ]] --[[ Name: handleFailure ]]
        -- upvalues: v23 (ref), v14 (copy), v21 (ref), l_cache_0 (copy)
        if v29 ~= v23 then
            return;
        else
            if v14.logError then
                v14.logError(v27);
            end;
            for _, v31 in v28 do
                v21[v31] = nil;
            end;
            l_cache_0.markItemsAsFailed(v28);
            return;
        end;
    end;
    local function v43(v33, v34, v35) --[[ Line: 82 ]] --[[ Name: handleSuccess ]]
        -- upvalues: v23 (ref), v21 (ref), v14 (copy), l_cache_0 (copy)
        if v35 ~= v23 then
            return;
        else
            for v36, _ in v33 do
                v21[v36] = nil;
            end;
            if v14.replaceItems then
                l_cache_0.replaceItems(v33);
            else
                l_cache_0.updateItems(v33);
            end;
            local v38 = {};
            for _, v40 in v34 do
                if v33[v40] == nil then
                    table.insert(v38, v40);
                end;
            end;
            if #v38 > 0 then
                if v35 ~= v23 then
                    return;
                else
                    if v14.logError then
                        v14.logError("Items missing in response");
                    end;
                    for _, v42 in v38 do
                        v21[v42] = nil;
                    end;
                    l_cache_0.markItemsAsFailed(v38);
                end;
            end;
            return;
        end;
    end;
    local function v44() --[[ Line: 109 ]] --[[ Name: scheduleFetch ]]
        -- upvalues: v22 (ref), v20 (copy), v17 (ref), v23 (ref), v16 (ref), v21 (ref), l_cache_0 (copy), v18 (copy), v14 (copy), v15 (copy), v6 (ref), v43 (copy), v44 (copy)
        if v22 ~= nil or v20.isEmpty() then
            return;
        else
            v22 = task.delay(v17, function() --[[ Line: 115 ]]
                -- upvalues: v23 (ref), v22 (ref), v20 (ref), v16 (ref), v21 (ref), l_cache_0 (ref), v18 (ref), v14 (ref), v15 (ref), v6 (ref), v43 (ref), v44 (ref)
                local l_v23_0 = v23;
                v22 = nil;
                if v20.isEmpty() then
                    return;
                else
                    local v46 = v20.pop(v16);
                    for _, v48 in v46 do
                        v21[v48] = true;
                    end;
                    local v49 = l_cache_0.getItems(v46);
                    local v54 = task.delay(v18, function() --[[ Line: 130 ]]
                        -- upvalues: v18 (ref), v46 (copy), l_v23_0 (copy), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref)
                        local v50 = ("No fetch response after %* sec"):format(v18);
                        local l_v46_0 = v46;
                        if l_v23_0 ~= v23 then
                            return;
                        else
                            if v14.logError then
                                v14.logError(v50);
                            end;
                            for _, v53 in l_v46_0 do
                                v21[v53] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(l_v46_0);
                            return;
                        end;
                    end);
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 134 ]]
                        -- upvalues: v15 (ref), v46 (copy), v49 (copy), v14 (ref), v6 (ref), v43 (ref), l_v23_0 (copy), v54 (copy), v23 (ref), v21 (ref), l_cache_0 (ref)
                        if not v15 then
                            local v55 = {};
                            for _, v57 in v46 do
                                local v58 = v49[v57];
                                table.insert(v55, v14.fetchFn(v57, v58));
                            end;
                            v6.all(v55):andThen(function(v59) --[[ Line: 143 ]]
                                -- upvalues: v46 (ref), v43 (ref), l_v23_0 (ref), v54 (ref)
                                local v60 = {};
                                for v61, v62 in v46 do
                                    v60[v62] = v59[v61];
                                end;
                                v43(v60, v46, l_v23_0);
                                task.cancel(v54);
                            end):catch(function(v63) --[[ Line: 151 ]]
                                -- upvalues: v46 (ref), l_v23_0 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v54 (ref)
                                local l_v46_1 = v46;
                                if l_v23_0 == v23 then
                                    if v14.logError then
                                        v14.logError(v63);
                                    end;
                                    for _, v66 in l_v46_1 do
                                        v21[v66] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v46_1);
                                end;
                                task.cancel(v54);
                            end);
                            return;
                        else
                            v14.fetchFn(v49):andThen(function(v67) --[[ Line: 157 ]]
                                -- upvalues: v43 (ref), v46 (ref), l_v23_0 (ref), v54 (ref)
                                v43(v67, v46, l_v23_0);
                                task.cancel(v54);
                            end):catch(function(v68) --[[ Line: 161 ]]
                                -- upvalues: v46 (ref), l_v23_0 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v54 (ref)
                                local l_v46_2 = v46;
                                if l_v23_0 == v23 then
                                    if v14.logError then
                                        v14.logError(v68);
                                    end;
                                    for _, v71 in l_v46_2 do
                                        v21[v71] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v46_2);
                                end;
                                task.cancel(v54);
                            end);
                            return;
                        end;
                    end);
                    if not l_status_0 then
                        if l_v23_0 == v23 then
                            if v14.logError then
                                v14.logError(l_result_0);
                            end;
                            for _, v75 in v46 do
                                v21[v75] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(v46);
                        end;
                        task.cancel(v54);
                    end;
                    v44();
                    return;
                end;
            end);
            return;
        end;
    end;
    local function _(v76) --[[ Line: 177 ]] --[[ Name: isRequestInQueueOrInFlight ]]
        -- upvalues: v20 (copy), v21 (ref)
        if v20.hasItem(v76) then
            return true;
        elseif v21[v76] ~= nil then
            return true;
        else
            return false;
        end;
    end;
    local function v117(v78, v79) --[[ Line: 187 ]] --[[ Name: getAndFetchItems ]]
        -- upvalues: l_cache_0 (copy), l_FFlagSduiDataCacheResetItem_0 (ref), v20 (copy), v21 (ref), v22 (ref), v17 (ref), v23 (ref), v16 (ref), v18 (copy), v14 (copy), v15 (copy), v6 (ref), v43 (copy), v44 (copy)
        local v80, v81 = l_cache_0.getItems(v78, v79);
        local v82 = {};
        local v83 = if l_FFlagSduiDataCacheResetItem_0 then {} else nil;
        for v84, v85 in v80 do
            v82[v84] = v85;
            if v81[v84] and not (v20.hasItem(v84) and true or v21[v84] ~= nil) then
                v20.push(v84);
                if l_FFlagSduiDataCacheResetItem_0 then
                    table.insert(v83, v84);
                end;
            end;
        end;
        if l_FFlagSduiDataCacheResetItem_0 and #v83 > 0 then
            l_cache_0.resetFailedItems(v83);
        end;
        if not v20.isEmpty() and v22 == nil then
            if v20.isEmpty() then
                return v82;
            else
                v22 = task.delay(v17, function() --[[ Line: 115 ]]
                    -- upvalues: v23 (ref), v22 (ref), v20 (ref), v16 (ref), v21 (ref), l_cache_0 (ref), v18 (ref), v14 (ref), v15 (ref), v6 (ref), v43 (ref), v44 (ref)
                    local l_v23_1 = v23;
                    v22 = nil;
                    if v20.isEmpty() then
                        return;
                    else
                        local v87 = v20.pop(v16);
                        for _, v89 in v87 do
                            v21[v89] = true;
                        end;
                        local v90 = l_cache_0.getItems(v87);
                        local v95 = task.delay(v18, function() --[[ Line: 130 ]]
                            -- upvalues: v18 (ref), v87 (copy), l_v23_1 (copy), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref)
                            local v91 = ("No fetch response after %* sec"):format(v18);
                            local l_v87_0 = v87;
                            if l_v23_1 ~= v23 then
                                return;
                            else
                                if v14.logError then
                                    v14.logError(v91);
                                end;
                                for _, v94 in l_v87_0 do
                                    v21[v94] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(l_v87_0);
                                return;
                            end;
                        end);
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 134 ]]
                            -- upvalues: v15 (ref), v87 (copy), v90 (copy), v14 (ref), v6 (ref), v43 (ref), l_v23_1 (copy), v95 (copy), v23 (ref), v21 (ref), l_cache_0 (ref)
                            if not v15 then
                                local v96 = {};
                                for _, v98 in v87 do
                                    local v99 = v90[v98];
                                    table.insert(v96, v14.fetchFn(v98, v99));
                                end;
                                v6.all(v96):andThen(function(v100) --[[ Line: 143 ]]
                                    -- upvalues: v87 (ref), v43 (ref), l_v23_1 (ref), v95 (ref)
                                    local v101 = {};
                                    for v102, v103 in v87 do
                                        v101[v103] = v100[v102];
                                    end;
                                    v43(v101, v87, l_v23_1);
                                    task.cancel(v95);
                                end):catch(function(v104) --[[ Line: 151 ]]
                                    -- upvalues: v87 (ref), l_v23_1 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v95 (ref)
                                    local l_v87_1 = v87;
                                    if l_v23_1 == v23 then
                                        if v14.logError then
                                            v14.logError(v104);
                                        end;
                                        for _, v107 in l_v87_1 do
                                            v21[v107] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v87_1);
                                    end;
                                    task.cancel(v95);
                                end);
                                return;
                            else
                                v14.fetchFn(v90):andThen(function(v108) --[[ Line: 157 ]]
                                    -- upvalues: v43 (ref), v87 (ref), l_v23_1 (ref), v95 (ref)
                                    v43(v108, v87, l_v23_1);
                                    task.cancel(v95);
                                end):catch(function(v109) --[[ Line: 161 ]]
                                    -- upvalues: v87 (ref), l_v23_1 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v95 (ref)
                                    local l_v87_2 = v87;
                                    if l_v23_1 == v23 then
                                        if v14.logError then
                                            v14.logError(v109);
                                        end;
                                        for _, v112 in l_v87_2 do
                                            v21[v112] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v87_2);
                                    end;
                                    task.cancel(v95);
                                end);
                                return;
                            end;
                        end);
                        if not l_status_1 then
                            if l_v23_1 == v23 then
                                if v14.logError then
                                    v14.logError(l_result_1);
                                end;
                                for _, v116 in v87 do
                                    v21[v116] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(v87);
                            end;
                            task.cancel(v95);
                        end;
                        v44();
                        return;
                    end;
                end);
            end;
        end;
        return v82;
    end;
    local function v153(v118, v119) --[[ Line: 211 ]] --[[ Name: getAndFetchItem ]]
        -- upvalues: l_cache_0 (copy), v20 (copy), v21 (ref), l_FFlagSduiDataCacheResetItem_0 (ref), v22 (ref), v17 (ref), v23 (ref), v16 (ref), v18 (copy), v14 (copy), v15 (copy), v6 (ref), v43 (copy), v44 (copy), l_FFlagSduiChartsSupport_0 (ref)
        local v120, v121 = l_cache_0.getItem(v118, v119);
        if v121 and not (v20.hasItem(v118) and true or v21[v118] ~= nil) then
            if l_FFlagSduiDataCacheResetItem_0 then
                l_cache_0.resetFailedItem(v118);
            end;
            v20.push(v118);
        end;
        if not v20.isEmpty() and v22 == nil and not v20.isEmpty() then
            v22 = task.delay(v17, function() --[[ Line: 115 ]]
                -- upvalues: v23 (ref), v22 (ref), v20 (ref), v16 (ref), v21 (ref), l_cache_0 (ref), v18 (ref), v14 (ref), v15 (ref), v6 (ref), v43 (ref), v44 (ref)
                local l_v23_2 = v23;
                v22 = nil;
                if v20.isEmpty() then
                    return;
                else
                    local v123 = v20.pop(v16);
                    for _, v125 in v123 do
                        v21[v125] = true;
                    end;
                    local v126 = l_cache_0.getItems(v123);
                    local v131 = task.delay(v18, function() --[[ Line: 130 ]]
                        -- upvalues: v18 (ref), v123 (copy), l_v23_2 (copy), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref)
                        local v127 = ("No fetch response after %* sec"):format(v18);
                        local l_v123_0 = v123;
                        if l_v23_2 ~= v23 then
                            return;
                        else
                            if v14.logError then
                                v14.logError(v127);
                            end;
                            for _, v130 in l_v123_0 do
                                v21[v130] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(l_v123_0);
                            return;
                        end;
                    end);
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 134 ]]
                        -- upvalues: v15 (ref), v123 (copy), v126 (copy), v14 (ref), v6 (ref), v43 (ref), l_v23_2 (copy), v131 (copy), v23 (ref), v21 (ref), l_cache_0 (ref)
                        if not v15 then
                            local v132 = {};
                            for _, v134 in v123 do
                                local v135 = v126[v134];
                                table.insert(v132, v14.fetchFn(v134, v135));
                            end;
                            v6.all(v132):andThen(function(v136) --[[ Line: 143 ]]
                                -- upvalues: v123 (ref), v43 (ref), l_v23_2 (ref), v131 (ref)
                                local v137 = {};
                                for v138, v139 in v123 do
                                    v137[v139] = v136[v138];
                                end;
                                v43(v137, v123, l_v23_2);
                                task.cancel(v131);
                            end):catch(function(v140) --[[ Line: 151 ]]
                                -- upvalues: v123 (ref), l_v23_2 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v131 (ref)
                                local l_v123_1 = v123;
                                if l_v23_2 == v23 then
                                    if v14.logError then
                                        v14.logError(v140);
                                    end;
                                    for _, v143 in l_v123_1 do
                                        v21[v143] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v123_1);
                                end;
                                task.cancel(v131);
                            end);
                            return;
                        else
                            v14.fetchFn(v126):andThen(function(v144) --[[ Line: 157 ]]
                                -- upvalues: v43 (ref), v123 (ref), l_v23_2 (ref), v131 (ref)
                                v43(v144, v123, l_v23_2);
                                task.cancel(v131);
                            end):catch(function(v145) --[[ Line: 161 ]]
                                -- upvalues: v123 (ref), l_v23_2 (ref), v23 (ref), v14 (ref), v21 (ref), l_cache_0 (ref), v131 (ref)
                                local l_v123_2 = v123;
                                if l_v23_2 == v23 then
                                    if v14.logError then
                                        v14.logError(v145);
                                    end;
                                    for _, v148 in l_v123_2 do
                                        v21[v148] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v123_2);
                                end;
                                task.cancel(v131);
                            end);
                            return;
                        end;
                    end);
                    if not l_status_2 then
                        if l_v23_2 == v23 then
                            if v14.logError then
                                v14.logError(l_result_2);
                            end;
                            for _, v152 in v123 do
                                v21[v152] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(v123);
                        end;
                        task.cancel(v131);
                    end;
                    v44();
                    return;
                end;
            end);
        end;
        if l_FFlagSduiChartsSupport_0 then
            return v120, v121;
        else
            return v120, nil;
        end;
    end;
    local function v155(v154) --[[ Line: 230 ]] --[[ Name: getCachedItem ]]
        -- upvalues: l_cache_0 (copy)
        return l_cache_0.getItem(v154);
    end;
    local function v157(v156) --[[ Line: 234 ]] --[[ Name: getCachedItems ]]
        -- upvalues: l_cache_0 (copy)
        return l_cache_0.getItems(v156);
    end;
    local function v160(v158, v159) --[[ Line: 238 ]] --[[ Name: fetchItem ]]
        -- upvalues: v153 (copy), v24 (copy)
        return v153(v158, v159 or v24);
    end;
    local function v163(v161, v162) --[[ Line: 242 ]] --[[ Name: fetchItems ]]
        -- upvalues: v117 (copy), v24 (copy)
        return (v117(v161, v162 or v24));
    end;
    local function v164() --[[ Line: 246 ]] --[[ Name: clear ]]
        -- upvalues: v22 (ref), v21 (ref), l_cache_0 (copy), v20 (copy), l_FFlagLuaAppDataHydrationDataResolverOnClear_0 (ref), v14 (copy)
        if v22 then
            task.cancel(v22);
            v22 = nil;
        end;
        v21 = {};
        l_cache_0.clear();
        v20.clear();
        if l_FFlagLuaAppDataHydrationDataResolverOnClear_0 and v14.onClear then
            v14.onClear();
        end;
    end;
    local v166 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 260 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v23 (ref), v164 (copy)
        local v165 = l_getLocalPlayerUserId_0();
        if v165 ~= v23 then
            v23 = v165;
            v164();
        end;
    end);
    local function v167() --[[ Line: 268 ]] --[[ Name: dispose ]]
        -- upvalues: v166 (ref), l_cache_0 (copy)
        if v166 then
            v166:Disconnect();
            v166 = nil;
        end;
        l_cache_0.dispose();
    end;
    return {
        getAndFetchItems = v117, 
        getAndFetchItem = v153, 
        getCachedItem = v155, 
        getCachedItems = v157, 
        fetchItem = v160, 
        fetchItems = v163, 
        dispose = v167, 
        clear = v164
    };
end;