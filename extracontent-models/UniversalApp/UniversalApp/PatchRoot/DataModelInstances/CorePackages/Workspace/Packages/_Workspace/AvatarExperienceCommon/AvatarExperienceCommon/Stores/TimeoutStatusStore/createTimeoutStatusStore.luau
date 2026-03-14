local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Promise);
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local l_createHttpStore_0 = require(l_Parent_0.InternalHttpStore).createHttpStore;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function() --[[ Line: 88 ]] --[[ Name: createTimeoutStatusStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createHttpStore_0 (copy), v2 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_mutedError_0 (copy), v3 (copy), l_createComputed_0 (copy)
    local v9, v10 = l_createSignal_0({
        isTimedOut = false, 
        featureName = nil, 
        access = nil, 
        timeoutAction = nil, 
        details = nil, 
        error = nil
    });
    local v11 = false;
    local v12 = false;
    local v13 = l_createHttpStore_0();
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = {};
    local function v24(v18, v19) --[[ Line: 107 ]] --[[ Name: extractTimeoutAction ]]
        if not v18.features then
            return nil;
        else
            for _, v21 in v18.features do
                if v21.featureName == v19 and v21.v2Recourses and #v21.v2Recourses > 0 then
                    local v22 = v21.v2Recourses[1];
                    if v22 and #v22 > 0 then
                        local v23 = v22[1];
                        if v23.timeoutActions and #v23.timeoutActions > 0 then
                            return v23.timeoutActions[1];
                        end;
                    end;
                end;
            end;
            return nil;
        end;
    end;
    local v25 = nil;
    v16 = v2.createEffect(function(v26) --[[ Line: 131 ]]
        -- upvalues: v9 (copy), v10 (copy), v25 (ref)
        local v27 = v9(v26);
        local v28 = if v27.details and v27.details.endDate then v27.details.endDate else if v27.timeoutAction and v27.timeoutAction.endTime then v27.timeoutAction.endTime else nil;
        if not v28 or v28 == "" then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
                -- upvalues: v28 (copy)
                return DateTime.fromIsoDate(v28);
            end);
            if not l_status_0 or not l_result_0 then
                return;
            else
                local v31 = DateTime.now();
                local v32 = l_result_0.UnixTimestamp - v31.UnixTimestamp;
                if v32 <= 0 then
                    v10({
                        isTimedOut = false, 
                        featureName = nil, 
                        access = nil, 
                        timeoutAction = nil, 
                        details = nil, 
                        error = nil
                    });
                    return;
                else
                    local v33 = task.delay(v32, function() --[[ Line: 170 ]]
                        -- upvalues: v25 (ref)
                        v25();
                    end);
                    return function() --[[ Line: 175 ]]
                        -- upvalues: v33 (copy)
                        if v33 then
                            task.cancel(v33);
                        end;
                    end;
                end;
            end;
        end;
    end);
    local function v48(v34, v35) --[[ Line: 183 ]] --[[ Name: fetchTimeoutDetails ]]
        -- upvalues: v12 (ref), l_Url_0 (ref), v13 (copy), v15 (ref), v2 (ref), l_HttpService_0 (ref), v9 (copy), v10 (copy), l_mutedError_0 (ref)
        if v12 then
            v35();
            return;
        else
            v12 = true;
            local v36 = string.format("%sv1/not-approved?abuseVector=%s", l_Url_0.USER_MODERATION_URL, v34);
            local v37, _ = v13.fetch("TimeoutDetails_" .. v34, {
                Url = v36, 
                Method = "GET"
            });
            if v15 then
                v15();
            end;
            local function _() --[[ Line: 203 ]] --[[ Name: complete ]]
                -- upvalues: v12 (ref), v35 (copy)
                v12 = false;
                v35();
            end;
            v15 = v2.createEffect(function(v40) --[[ Line: 208 ]]
                -- upvalues: v37 (copy), l_HttpService_0 (ref), v9 (ref), v10 (ref), v12 (ref), v35 (copy), l_mutedError_0 (ref)
                local v41 = v37(v40);
                if v41.status == "Success" then
                    local l_Body_0 = v41.response.Body;
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 212 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_0);
                    end);
                    if l_status_1 and l_result_1 then
                        local v45 = v9(v40);
                        v10({
                            isTimedOut = v45.isTimedOut, 
                            featureName = v45.featureName, 
                            access = v45.access, 
                            timeoutAction = v45.timeoutAction, 
                            details = l_result_1, 
                            error = nil
                        });
                        v12 = false;
                        v35();
                        return;
                    else
                        l_mutedError_0("Failed to decode timeout details JSON response");
                        local v46 = v9(v40);
                        v10({
                            isTimedOut = v46.isTimedOut, 
                            featureName = v46.featureName, 
                            access = v46.access, 
                            timeoutAction = v46.timeoutAction, 
                            details = nil, 
                            error = "Failed to decode timeout details"
                        });
                        v12 = false;
                        v35();
                        return;
                    end;
                else
                    if v41.status == "Failed" then
                        l_mutedError_0("Failed to fetch timeout details");
                        local v47 = v9(v40);
                        v10({
                            isTimedOut = v47.isTimedOut, 
                            featureName = v47.featureName, 
                            access = v47.access, 
                            timeoutAction = v47.timeoutAction, 
                            details = nil, 
                            error = "Failed to fetch timeout details"
                        });
                        v12 = false;
                        v35();
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local _ = function() --[[ Line: 258 ]] --[[ Name: resolvePendingFetches ]]
        -- upvalues: v17 (ref)
        for _, v50 in v17 do
            v50();
        end;
        v17 = {};
    end;
    local function v80(v52, v53) --[[ Line: 265 ]] --[[ Name: doFetchStatus ]]
        -- upvalues: v11 (ref), l_Url_0 (ref), v13 (copy), v14 (ref), v17 (ref), v2 (ref), l_HttpService_0 (ref), v24 (copy), v10 (copy), v48 (copy), l_mutedError_0 (ref)
        if v11 then
            return;
        else
            v11 = true;
            local v54 = v52 or "AvatarChange";
            local v55 = v53 or "avatar_marketplace/AvatarMarketPlace";
            local v56 = {
                featureNames = v54, 
                nameSpace = v55
            };
            local v57 = string.format("%saccess-management/v1/feature-access?%s", l_Url_0.APIS_URL, l_Url_0:makeQueryString(v56));
            local v58, _ = v13.fetch("TimeoutStatus_" .. v54, {
                Url = v57, 
                Method = "GET"
            });
            if v14 then
                v14();
            end;
            local function v62() --[[ Line: 294 ]] --[[ Name: complete ]]
                -- upvalues: v17 (ref)
                for _, v61 in v17 do
                    v61();
                end;
                v17 = {};
            end;
            v14 = v2.createEffect(function(v63) --[[ Line: 298 ]]
                -- upvalues: v58 (copy), l_HttpService_0 (ref), v24 (ref), v54 (copy), v10 (ref), v11 (ref), v48 (ref), v62 (copy), v17 (ref), l_mutedError_0 (ref)
                local v64 = v58(v63);
                if v64.status == "Success" then
                    local l_Body_1 = v64.response.Body;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 302 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_1 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_1);
                    end);
                    if l_status_2 and l_result_2 then
                        local v68 = v24(l_result_2, v54);
                        local v69 = v68 ~= nil;
                        local v70 = nil;
                        if l_result_2.features then
                            for _, v72 in l_result_2.features do
                                if v72.featureName == v54 then
                                    v70 = v72.access;
                                    break;
                                end;
                            end;
                        end;
                        v10({
                            isTimedOut = v69, 
                            featureName = v54, 
                            access = v70, 
                            timeoutAction = v68, 
                            details = nil, 
                            error = nil
                        });
                        v11 = false;
                        if v69 and v68 then
                            local v73 = v68.featureVector or "avatar_change";
                            v48(v73, v62);
                            return;
                        else
                            for _, v75 in v17 do
                                v75();
                            end;
                            v17 = {};
                            return;
                        end;
                    else
                        l_mutedError_0("Failed to decode timeout status JSON response");
                        v10({
                            isTimedOut = false, 
                            featureName = v54, 
                            access = nil, 
                            timeoutAction = nil, 
                            details = nil, 
                            error = "Failed to decode timeout status"
                        });
                        v11 = false;
                        for _, v77 in v17 do
                            v77();
                        end;
                        v17 = {};
                        return;
                    end;
                else
                    if v64.status == "Failed" then
                        l_mutedError_0("Failed to fetch timeout status");
                        v10({
                            isTimedOut = false, 
                            featureName = v54, 
                            access = nil, 
                            timeoutAction = nil, 
                            details = nil, 
                            error = "Failed to fetch timeout status"
                        });
                        v11 = false;
                        for _, v79 in v17 do
                            v79();
                        end;
                        v17 = {};
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v83(v81, v82) --[[ Line: 367 ]] --[[ Name: fetchStatus ]]
        -- upvalues: v80 (copy)
        v80(v81, v82);
    end;
    local function v87(v84, v85) --[[ Line: 371 ]] --[[ Name: fetchStatusAsync ]]
        -- upvalues: v3 (ref), v17 (ref), v80 (copy)
        return v3.new(function(v86) --[[ Line: 372 ]]
            -- upvalues: v17 (ref), v80 (ref), v84 (copy), v85 (copy)
            table.insert(v17, v86);
            v80(v84, v85);
        end);
    end;
    local v89 = l_createComputed_0(function(v88) --[[ Line: 379 ]]
        -- upvalues: v9 (copy)
        return v9(v88).isTimedOut;
    end);
    local v91 = l_createComputed_0(function(v90) --[[ Line: 383 ]]
        -- upvalues: v9 (copy)
        return v9(v90).details;
    end);
    local function v93(v92) --[[ Line: 388 ]] --[[ Name: setStatusAction ]]
        -- upvalues: v10 (copy)
        v10(v92);
    end;
    v25 = function() --[[ Line: 394 ]]
        -- upvalues: v10 (copy)
        v10({
            isTimedOut = false, 
            featureName = nil, 
            access = nil, 
            timeoutAction = nil, 
            details = nil, 
            error = nil
        });
    end;
    return {
        getStatus = v9, 
        getIsTimedOut = v89, 
        getTimeoutDetails = v91, 
        fetchStatus = v83, 
        fetchStatusAsync = v87, 
        setStatus = v93, 
        clearStatus = v25
    };
end;