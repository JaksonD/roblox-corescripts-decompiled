local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v5 = require(l_script_FirstAncestor_0.createRequestQueue);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppDataHydrationSupportsMultiGet_0 = v7.FFlagLuaAppDataHydrationSupportsMultiGet;
local l_FFlagLuaAppDataHydrationDataResolverOnClear_0 = v7.FFlagLuaAppDataHydrationDataResolverOnClear;
local v10 = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50);
local v11 = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1);
local v12 = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30);
return function(v13) --[[ Line: 25 ]] --[[ Name: createDataResolver ]]
    -- upvalues: l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (copy), v10 (copy), v11 (copy), v12 (copy), v5 (copy), l_getLocalPlayerUserId_0 (copy), v6 (copy), l_FFlagLuaAppDataHydrationDataResolverOnClear_0 (copy), l_Players_0 (copy)
    local v14 = nil;
    if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 then
        v14 = v13.supportsMultiGet == nil or v13.supportsMultiGet;
    end;
    local v15 = v13.requestBatchSize or v10;
    if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 and not v13.requestBatchSize then
        v15 = 1;
    end;
    local v16 = v13.queueProcessDelaySec or v11;
    if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 and not v13.queueProcessDelaySec then
        v16 = 0;
    end;
    local v17 = v13.requestTimeoutSec or v12;
    local l_cache_0 = v13.cache;
    local v19 = v5();
    local v20 = {};
    local v21 = nil;
    local v22 = l_getLocalPlayerUserId_0();
    local function v23() --[[ Line: 60 ]] --[[ Name: FORCE_FETCH ]]
        return true;
    end;
    local function _(v24) --[[ Line: 64 ]] --[[ Name: logError ]]
        -- upvalues: v13 (copy)
        if v13.logError then
            v13.logError(v24);
        end;
    end;
    local _ = function(v26, v27, v28) --[[ Line: 71 ]] --[[ Name: handleFailure ]]
        -- upvalues: v22 (ref), v13 (copy), v20 (ref), l_cache_0 (copy)
        if v28 ~= v22 then
            return;
        else
            if v13.logError then
                v13.logError(v26);
            end;
            for _, v30 in v27 do
                v20[v30] = nil;
            end;
            l_cache_0.markItemsAsFailed(v27);
            return;
        end;
    end;
    local function v42(v32, v33, v34) --[[ Line: 84 ]] --[[ Name: handleSuccess ]]
        -- upvalues: v22 (ref), v20 (ref), v13 (copy), l_cache_0 (copy)
        if v34 ~= v22 then
            return;
        else
            for v35, _ in v32 do
                v20[v35] = nil;
            end;
            if v13.replaceItems then
                l_cache_0.replaceItems(v32);
            else
                l_cache_0.updateItems(v32);
            end;
            local v37 = {};
            for _, v39 in v33 do
                if v32[v39] == nil then
                    table.insert(v37, v39);
                end;
            end;
            if #v37 > 0 then
                if v34 ~= v22 then
                    return;
                else
                    if v13.logError then
                        v13.logError("Items missing in response");
                    end;
                    for _, v41 in v37 do
                        v20[v41] = nil;
                    end;
                    l_cache_0.markItemsAsFailed(v37);
                end;
            end;
            return;
        end;
    end;
    local function v43() --[[ Line: 111 ]] --[[ Name: scheduleFetch ]]
        -- upvalues: v21 (ref), v19 (copy), v16 (ref), v22 (ref), v15 (ref), v20 (ref), l_cache_0 (copy), v17 (copy), v13 (copy), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (copy), v43 (copy)
        if v21 ~= nil or v19.isEmpty() then
            return;
        else
            v21 = task.delay(v16, function() --[[ Line: 117 ]]
                -- upvalues: v22 (ref), v21 (ref), v19 (ref), v15 (ref), v20 (ref), l_cache_0 (ref), v17 (ref), v13 (ref), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (ref), v43 (ref)
                local l_v22_0 = v22;
                v21 = nil;
                if v19.isEmpty() then
                    return;
                else
                    local v45 = v19.pop(v15);
                    for _, v47 in v45 do
                        v20[v47] = true;
                    end;
                    local v48 = l_cache_0.getItems(v45);
                    local v53 = task.delay(v17, function() --[[ Line: 132 ]]
                        -- upvalues: v17 (ref), v45 (copy), l_v22_0 (copy), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref)
                        local v49 = ("No fetch response after %* sec"):format(v17);
                        local l_v45_0 = v45;
                        if l_v22_0 ~= v22 then
                            return;
                        else
                            if v13.logError then
                                v13.logError(v49);
                            end;
                            for _, v52 in l_v45_0 do
                                v20[v52] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(l_v45_0);
                            return;
                        end;
                    end);
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 136 ]]
                        -- upvalues: l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v45 (copy), v48 (copy), v13 (ref), v6 (ref), v42 (ref), l_v22_0 (copy), v53 (copy), v22 (ref), v20 (ref), l_cache_0 (ref)
                        if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 then
                            local v54 = {};
                            for _, v56 in v45 do
                                local v57 = v48[v56];
                                table.insert(v54, v13.fetchFn(v56, v57));
                            end;
                            v6.all(v54):andThen(function(v58) --[[ Line: 145 ]]
                                -- upvalues: v45 (ref), v42 (ref), l_v22_0 (ref), v53 (ref)
                                local v59 = {};
                                for v60, v61 in v45 do
                                    v59[v61] = v58[v60];
                                end;
                                v42(v59, v45, l_v22_0);
                                task.cancel(v53);
                            end):catch(function(v62) --[[ Line: 153 ]]
                                -- upvalues: v45 (ref), l_v22_0 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v53 (ref)
                                local l_v45_1 = v45;
                                if l_v22_0 == v22 then
                                    if v13.logError then
                                        v13.logError(v62);
                                    end;
                                    for _, v65 in l_v45_1 do
                                        v20[v65] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v45_1);
                                end;
                                task.cancel(v53);
                            end);
                            return;
                        else
                            v13.fetchFn(v48):andThen(function(v66) --[[ Line: 159 ]]
                                -- upvalues: v42 (ref), v45 (ref), l_v22_0 (ref), v53 (ref)
                                v42(v66, v45, l_v22_0);
                                task.cancel(v53);
                            end):catch(function(v67) --[[ Line: 163 ]]
                                -- upvalues: v45 (ref), l_v22_0 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v53 (ref)
                                local l_v45_2 = v45;
                                if l_v22_0 == v22 then
                                    if v13.logError then
                                        v13.logError(v67);
                                    end;
                                    for _, v70 in l_v45_2 do
                                        v20[v70] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v45_2);
                                end;
                                task.cancel(v53);
                            end);
                            return;
                        end;
                    end);
                    if not l_status_0 then
                        if l_v22_0 == v22 then
                            if v13.logError then
                                v13.logError(l_result_0);
                            end;
                            for _, v74 in v45 do
                                v20[v74] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(v45);
                        end;
                        task.cancel(v53);
                    end;
                    v43();
                    return;
                end;
            end);
            return;
        end;
    end;
    local function _(v75) --[[ Line: 179 ]] --[[ Name: isRequestInQueueOrInFlight ]]
        -- upvalues: v19 (copy), v20 (ref)
        if v19.hasItem(v75) then
            return true;
        elseif v20[v75] ~= nil then
            return true;
        else
            return false;
        end;
    end;
    local function v115(v77, v78) --[[ Line: 189 ]] --[[ Name: getAndFetchItems ]]
        -- upvalues: l_cache_0 (copy), v19 (copy), v20 (ref), v21 (ref), v16 (ref), v22 (ref), v15 (ref), v17 (copy), v13 (copy), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (copy), v43 (copy)
        local v79, v80 = l_cache_0.getItems(v77, v78);
        local v81 = {};
        for v82, v83 in v79 do
            v81[v82] = v83;
            if v80[v82] and not (v19.hasItem(v82) and true or v20[v82] ~= nil) then
                v19.push(v82);
            end;
        end;
        if not v19.isEmpty() and v21 == nil then
            if v19.isEmpty() then
                return v81;
            else
                v21 = task.delay(v16, function() --[[ Line: 117 ]]
                    -- upvalues: v22 (ref), v21 (ref), v19 (ref), v15 (ref), v20 (ref), l_cache_0 (ref), v17 (ref), v13 (ref), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (ref), v43 (ref)
                    local l_v22_1 = v22;
                    v21 = nil;
                    if v19.isEmpty() then
                        return;
                    else
                        local v85 = v19.pop(v15);
                        for _, v87 in v85 do
                            v20[v87] = true;
                        end;
                        local v88 = l_cache_0.getItems(v85);
                        local v93 = task.delay(v17, function() --[[ Line: 132 ]]
                            -- upvalues: v17 (ref), v85 (copy), l_v22_1 (copy), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref)
                            local v89 = ("No fetch response after %* sec"):format(v17);
                            local l_v85_0 = v85;
                            if l_v22_1 ~= v22 then
                                return;
                            else
                                if v13.logError then
                                    v13.logError(v89);
                                end;
                                for _, v92 in l_v85_0 do
                                    v20[v92] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(l_v85_0);
                                return;
                            end;
                        end);
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 136 ]]
                            -- upvalues: l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v85 (copy), v88 (copy), v13 (ref), v6 (ref), v42 (ref), l_v22_1 (copy), v93 (copy), v22 (ref), v20 (ref), l_cache_0 (ref)
                            if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 then
                                local v94 = {};
                                for _, v96 in v85 do
                                    local v97 = v88[v96];
                                    table.insert(v94, v13.fetchFn(v96, v97));
                                end;
                                v6.all(v94):andThen(function(v98) --[[ Line: 145 ]]
                                    -- upvalues: v85 (ref), v42 (ref), l_v22_1 (ref), v93 (ref)
                                    local v99 = {};
                                    for v100, v101 in v85 do
                                        v99[v101] = v98[v100];
                                    end;
                                    v42(v99, v85, l_v22_1);
                                    task.cancel(v93);
                                end):catch(function(v102) --[[ Line: 153 ]]
                                    -- upvalues: v85 (ref), l_v22_1 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v93 (ref)
                                    local l_v85_1 = v85;
                                    if l_v22_1 == v22 then
                                        if v13.logError then
                                            v13.logError(v102);
                                        end;
                                        for _, v105 in l_v85_1 do
                                            v20[v105] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v85_1);
                                    end;
                                    task.cancel(v93);
                                end);
                                return;
                            else
                                v13.fetchFn(v88):andThen(function(v106) --[[ Line: 159 ]]
                                    -- upvalues: v42 (ref), v85 (ref), l_v22_1 (ref), v93 (ref)
                                    v42(v106, v85, l_v22_1);
                                    task.cancel(v93);
                                end):catch(function(v107) --[[ Line: 163 ]]
                                    -- upvalues: v85 (ref), l_v22_1 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v93 (ref)
                                    local l_v85_2 = v85;
                                    if l_v22_1 == v22 then
                                        if v13.logError then
                                            v13.logError(v107);
                                        end;
                                        for _, v110 in l_v85_2 do
                                            v20[v110] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v85_2);
                                    end;
                                    task.cancel(v93);
                                end);
                                return;
                            end;
                        end);
                        if not l_status_1 then
                            if l_v22_1 == v22 then
                                if v13.logError then
                                    v13.logError(l_result_1);
                                end;
                                for _, v114 in v85 do
                                    v20[v114] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(v85);
                            end;
                            task.cancel(v93);
                        end;
                        v43();
                        return;
                    end;
                end);
            end;
        end;
        return v81;
    end;
    local function v151(v116, v117) --[[ Line: 206 ]] --[[ Name: getAndFetchItem ]]
        -- upvalues: l_cache_0 (copy), v19 (copy), v20 (ref), v21 (ref), v16 (ref), v22 (ref), v15 (ref), v17 (copy), v13 (copy), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (copy), v43 (copy)
        local v118, v119 = l_cache_0.getItem(v116, v117);
        if v119 and not (v19.hasItem(v116) and true or v20[v116] ~= nil) then
            v19.push(v116);
        end;
        if not v19.isEmpty() and v21 == nil then
            if v19.isEmpty() then
                return v118;
            else
                v21 = task.delay(v16, function() --[[ Line: 117 ]]
                    -- upvalues: v22 (ref), v21 (ref), v19 (ref), v15 (ref), v20 (ref), l_cache_0 (ref), v17 (ref), v13 (ref), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (ref), v43 (ref)
                    local l_v22_2 = v22;
                    v21 = nil;
                    if v19.isEmpty() then
                        return;
                    else
                        local v121 = v19.pop(v15);
                        for _, v123 in v121 do
                            v20[v123] = true;
                        end;
                        local v124 = l_cache_0.getItems(v121);
                        local v129 = task.delay(v17, function() --[[ Line: 132 ]]
                            -- upvalues: v17 (ref), v121 (copy), l_v22_2 (copy), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref)
                            local v125 = ("No fetch response after %* sec"):format(v17);
                            local l_v121_0 = v121;
                            if l_v22_2 ~= v22 then
                                return;
                            else
                                if v13.logError then
                                    v13.logError(v125);
                                end;
                                for _, v128 in l_v121_0 do
                                    v20[v128] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(l_v121_0);
                                return;
                            end;
                        end);
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 136 ]]
                            -- upvalues: l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v121 (copy), v124 (copy), v13 (ref), v6 (ref), v42 (ref), l_v22_2 (copy), v129 (copy), v22 (ref), v20 (ref), l_cache_0 (ref)
                            if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 then
                                local v130 = {};
                                for _, v132 in v121 do
                                    local v133 = v124[v132];
                                    table.insert(v130, v13.fetchFn(v132, v133));
                                end;
                                v6.all(v130):andThen(function(v134) --[[ Line: 145 ]]
                                    -- upvalues: v121 (ref), v42 (ref), l_v22_2 (ref), v129 (ref)
                                    local v135 = {};
                                    for v136, v137 in v121 do
                                        v135[v137] = v134[v136];
                                    end;
                                    v42(v135, v121, l_v22_2);
                                    task.cancel(v129);
                                end):catch(function(v138) --[[ Line: 153 ]]
                                    -- upvalues: v121 (ref), l_v22_2 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v129 (ref)
                                    local l_v121_1 = v121;
                                    if l_v22_2 == v22 then
                                        if v13.logError then
                                            v13.logError(v138);
                                        end;
                                        for _, v141 in l_v121_1 do
                                            v20[v141] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v121_1);
                                    end;
                                    task.cancel(v129);
                                end);
                                return;
                            else
                                v13.fetchFn(v124):andThen(function(v142) --[[ Line: 159 ]]
                                    -- upvalues: v42 (ref), v121 (ref), l_v22_2 (ref), v129 (ref)
                                    v42(v142, v121, l_v22_2);
                                    task.cancel(v129);
                                end):catch(function(v143) --[[ Line: 163 ]]
                                    -- upvalues: v121 (ref), l_v22_2 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v129 (ref)
                                    local l_v121_2 = v121;
                                    if l_v22_2 == v22 then
                                        if v13.logError then
                                            v13.logError(v143);
                                        end;
                                        for _, v146 in l_v121_2 do
                                            v20[v146] = nil;
                                        end;
                                        l_cache_0.markItemsAsFailed(l_v121_2);
                                    end;
                                    task.cancel(v129);
                                end);
                                return;
                            end;
                        end);
                        if not l_status_2 then
                            if l_v22_2 == v22 then
                                if v13.logError then
                                    v13.logError(l_result_2);
                                end;
                                for _, v150 in v121 do
                                    v20[v150] = nil;
                                end;
                                l_cache_0.markItemsAsFailed(v121);
                            end;
                            task.cancel(v129);
                        end;
                        v43();
                        return;
                    end;
                end);
            end;
        end;
        return v118;
    end;
    local function v153(v152) --[[ Line: 217 ]] --[[ Name: getCachedItem ]]
        -- upvalues: l_cache_0 (copy)
        return l_cache_0.getItem(v152);
    end;
    local function v155(v154) --[[ Line: 221 ]] --[[ Name: getCachedItems ]]
        -- upvalues: l_cache_0 (copy)
        return l_cache_0.getItems(v154);
    end;
    local function v192(v156, v157) --[[ Line: 225 ]] --[[ Name: fetchItem ]]
        -- upvalues: v23 (copy), l_cache_0 (copy), v19 (copy), v20 (ref), v21 (ref), v16 (ref), v22 (ref), v15 (ref), v17 (copy), v13 (copy), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (copy), v43 (copy)
        local v158 = v157 or v23;
        local v159, v160 = l_cache_0.getItem(v156, v158);
        if v160 and not (v19.hasItem(v156) and true or v20[v156] ~= nil) then
            v19.push(v156);
        end;
        if not v19.isEmpty() and v21 == nil and not v19.isEmpty() then
            v21 = task.delay(v16, function() --[[ Line: 117 ]]
                -- upvalues: v22 (ref), v21 (ref), v19 (ref), v15 (ref), v20 (ref), l_cache_0 (ref), v17 (ref), v13 (ref), l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v6 (ref), v42 (ref), v43 (ref)
                local l_v22_3 = v22;
                v21 = nil;
                if v19.isEmpty() then
                    return;
                else
                    local v162 = v19.pop(v15);
                    for _, v164 in v162 do
                        v20[v164] = true;
                    end;
                    local v165 = l_cache_0.getItems(v162);
                    local v170 = task.delay(v17, function() --[[ Line: 132 ]]
                        -- upvalues: v17 (ref), v162 (copy), l_v22_3 (copy), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref)
                        local v166 = ("No fetch response after %* sec"):format(v17);
                        local l_v162_0 = v162;
                        if l_v22_3 ~= v22 then
                            return;
                        else
                            if v13.logError then
                                v13.logError(v166);
                            end;
                            for _, v169 in l_v162_0 do
                                v20[v169] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(l_v162_0);
                            return;
                        end;
                    end);
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 136 ]]
                        -- upvalues: l_FFlagLuaAppDataHydrationSupportsMultiGet_0 (ref), v14 (ref), v162 (copy), v165 (copy), v13 (ref), v6 (ref), v42 (ref), l_v22_3 (copy), v170 (copy), v22 (ref), v20 (ref), l_cache_0 (ref)
                        if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 and not v14 then
                            local v171 = {};
                            for _, v173 in v162 do
                                local v174 = v165[v173];
                                table.insert(v171, v13.fetchFn(v173, v174));
                            end;
                            v6.all(v171):andThen(function(v175) --[[ Line: 145 ]]
                                -- upvalues: v162 (ref), v42 (ref), l_v22_3 (ref), v170 (ref)
                                local v176 = {};
                                for v177, v178 in v162 do
                                    v176[v178] = v175[v177];
                                end;
                                v42(v176, v162, l_v22_3);
                                task.cancel(v170);
                            end):catch(function(v179) --[[ Line: 153 ]]
                                -- upvalues: v162 (ref), l_v22_3 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v170 (ref)
                                local l_v162_1 = v162;
                                if l_v22_3 == v22 then
                                    if v13.logError then
                                        v13.logError(v179);
                                    end;
                                    for _, v182 in l_v162_1 do
                                        v20[v182] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v162_1);
                                end;
                                task.cancel(v170);
                            end);
                            return;
                        else
                            v13.fetchFn(v165):andThen(function(v183) --[[ Line: 159 ]]
                                -- upvalues: v42 (ref), v162 (ref), l_v22_3 (ref), v170 (ref)
                                v42(v183, v162, l_v22_3);
                                task.cancel(v170);
                            end):catch(function(v184) --[[ Line: 163 ]]
                                -- upvalues: v162 (ref), l_v22_3 (ref), v22 (ref), v13 (ref), v20 (ref), l_cache_0 (ref), v170 (ref)
                                local l_v162_2 = v162;
                                if l_v22_3 == v22 then
                                    if v13.logError then
                                        v13.logError(v184);
                                    end;
                                    for _, v187 in l_v162_2 do
                                        v20[v187] = nil;
                                    end;
                                    l_cache_0.markItemsAsFailed(l_v162_2);
                                end;
                                task.cancel(v170);
                            end);
                            return;
                        end;
                    end);
                    if not l_status_3 then
                        if l_v22_3 == v22 then
                            if v13.logError then
                                v13.logError(l_result_3);
                            end;
                            for _, v191 in v162 do
                                v20[v191] = nil;
                            end;
                            l_cache_0.markItemsAsFailed(v162);
                        end;
                        task.cancel(v170);
                    end;
                    v43();
                    return;
                end;
            end);
        end;
        return v159;
    end;
    local function v195(v193, v194) --[[ Line: 229 ]] --[[ Name: fetchItems ]]
        -- upvalues: v115 (copy), v23 (copy)
        return (v115(v193, v194 or v23));
    end;
    local function v196() --[[ Line: 233 ]] --[[ Name: clear ]]
        -- upvalues: v21 (ref), v20 (ref), l_cache_0 (copy), v19 (copy), l_FFlagLuaAppDataHydrationDataResolverOnClear_0 (ref), v13 (copy)
        if v21 then
            task.cancel(v21);
            v21 = nil;
        end;
        v20 = {};
        l_cache_0.clear();
        v19.clear();
        if l_FFlagLuaAppDataHydrationDataResolverOnClear_0 and v13.onClear then
            v13.onClear();
        end;
    end;
    local v198 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 247 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v22 (ref), v196 (copy)
        local v197 = l_getLocalPlayerUserId_0();
        if v197 ~= v22 then
            v22 = v197;
            v196();
        end;
    end);
    local function v199() --[[ Line: 255 ]] --[[ Name: dispose ]]
        -- upvalues: v198 (ref), l_cache_0 (copy)
        if v198 then
            v198:Disconnect();
            v198 = nil;
        end;
        l_cache_0.dispose();
    end;
    return {
        getAndFetchItems = v115, 
        getAndFetchItem = v151, 
        getCachedItem = v153, 
        getCachedItems = v155, 
        fetchItem = v192, 
        fetchItems = v195, 
        dispose = v199, 
        clear = v196
    };
end;