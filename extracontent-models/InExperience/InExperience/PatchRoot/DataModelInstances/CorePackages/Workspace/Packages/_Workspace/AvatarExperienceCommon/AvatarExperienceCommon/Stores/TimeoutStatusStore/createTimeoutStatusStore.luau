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
        -- upvalues: v9 (copy), v25 (ref)
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
                    v25();
                    return;
                else
                    local v33 = task.delay(v32, function() --[[ Line: 163 ]]
                        -- upvalues: v25 (ref)
                        v25();
                    end);
                    return function() --[[ Line: 168 ]]
                        -- upvalues: v33 (copy)
                        if v33 then
                            task.cancel(v33);
                        end;
                    end;
                end;
            end;
        end;
    end);
    local function v48(v34, v35) --[[ Line: 176 ]] --[[ Name: fetchTimeoutDetails ]]
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
            local function _() --[[ Line: 196 ]] --[[ Name: complete ]]
                -- upvalues: v12 (ref), v35 (copy)
                v12 = false;
                v35();
            end;
            v15 = v2.createEffect(function(v40) --[[ Line: 201 ]]
                -- upvalues: v37 (copy), l_HttpService_0 (ref), v9 (ref), v10 (ref), v12 (ref), v35 (copy), l_mutedError_0 (ref)
                local v41 = v37(v40);
                if v41.status == "Success" then
                    local l_Body_0 = v41.response.Body;
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 205 ]]
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
    local function v52() --[[ Line: 251 ]] --[[ Name: resolvePendingFetches ]]
        -- upvalues: v9 (copy), v17 (ref)
        local v49 = v9(false);
        for _, v51 in v17 do
            v51(v49);
        end;
        v17 = {};
    end;
    local function v73(v53, v54) --[[ Line: 259 ]] --[[ Name: doFetchStatus ]]
        -- upvalues: v11 (ref), l_Url_0 (ref), v13 (copy), v14 (ref), v52 (copy), v2 (ref), l_HttpService_0 (ref), v24 (copy), v10 (copy), v48 (copy), l_mutedError_0 (ref)
        if v11 then
            return;
        else
            v11 = true;
            local v55 = v53 or "AvatarChange";
            local v56 = v54 or "avatar_marketplace/AvatarMarketPlace";
            local v57 = {
                featureNames = v55, 
                nameSpace = v56
            };
            local v58 = string.format("%saccess-management/v1/feature-access?%s", l_Url_0.APIS_URL, l_Url_0:makeQueryString(v57));
            local v59, _ = v13.fetch("TimeoutStatus_" .. v55, {
                Url = v58, 
                Method = "GET"
            });
            if v14 then
                v14();
            end;
            local function v61() --[[ Line: 288 ]] --[[ Name: complete ]]
                -- upvalues: v52 (ref)
                v52();
            end;
            v14 = v2.createEffect(function(v62) --[[ Line: 292 ]]
                -- upvalues: v59 (copy), l_HttpService_0 (ref), v24 (ref), v55 (copy), v10 (ref), v11 (ref), v48 (ref), v61 (copy), v52 (ref), l_mutedError_0 (ref)
                local v63 = v59(v62);
                if v63.status == "Success" then
                    local l_Body_1 = v63.response.Body;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 296 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_1 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_1);
                    end);
                    if l_status_2 and l_result_2 then
                        local v67 = v24(l_result_2, v55);
                        local v68 = v67 ~= nil;
                        local v69 = nil;
                        if l_result_2.features then
                            for _, v71 in l_result_2.features do
                                if v71.featureName == v55 then
                                    v69 = v71.access;
                                    break;
                                end;
                            end;
                        end;
                        v10({
                            isTimedOut = v68, 
                            featureName = v55, 
                            access = v69, 
                            timeoutAction = v67, 
                            details = nil, 
                            error = nil
                        });
                        v11 = false;
                        if v68 and v67 then
                            local v72 = v67.featureVector or "avatar_change";
                            v48(v72, v61);
                            return;
                        else
                            v52();
                            return;
                        end;
                    else
                        l_mutedError_0("Failed to decode timeout status JSON response");
                        v10({
                            isTimedOut = false, 
                            featureName = v55, 
                            access = nil, 
                            timeoutAction = nil, 
                            details = nil, 
                            error = "Failed to decode timeout status"
                        });
                        v11 = false;
                        v52();
                        return;
                    end;
                else
                    if v63.status == "Failed" then
                        l_mutedError_0("Failed to fetch timeout status");
                        v10({
                            isTimedOut = false, 
                            featureName = v55, 
                            access = nil, 
                            timeoutAction = nil, 
                            details = nil, 
                            error = "Failed to fetch timeout status"
                        });
                        v11 = false;
                        v52();
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v76(v74, v75) --[[ Line: 361 ]] --[[ Name: fetchStatus ]]
        -- upvalues: v73 (copy)
        v73(v74, v75);
    end;
    local function v80(v77, v78) --[[ Line: 365 ]] --[[ Name: fetchStatusAsync ]]
        -- upvalues: v3 (ref), v17 (ref), v73 (copy)
        return v3.new(function(v79) --[[ Line: 366 ]]
            -- upvalues: v17 (ref), v73 (ref), v77 (copy), v78 (copy)
            table.insert(v17, v79);
            v73(v77, v78);
        end);
    end;
    local v82 = l_createComputed_0(function(v81) --[[ Line: 373 ]]
        -- upvalues: v9 (copy)
        return v9(v81).isTimedOut;
    end);
    local v84 = l_createComputed_0(function(v83) --[[ Line: 377 ]]
        -- upvalues: v9 (copy)
        return v9(v83).details;
    end);
    local function v86(v85) --[[ Line: 382 ]] --[[ Name: setStatusAction ]]
        -- upvalues: v10 (copy)
        v10(v85);
    end;
    v25 = function() --[[ Line: 388 ]]
        -- upvalues: v15 (ref), v14 (ref), v12 (ref), v11 (ref), v10 (copy), v52 (copy)
        if v15 then
            v15();
            v15 = nil;
        end;
        if v14 then
            v14();
            v14 = nil;
        end;
        v12 = false;
        v11 = false;
        v10({
            isTimedOut = false, 
            featureName = nil, 
            access = nil, 
            timeoutAction = nil, 
            details = nil, 
            error = nil
        });
        v52();
    end;
    return {
        getStatus = v9, 
        getIsTimedOut = v82, 
        getTimeoutDetails = v84, 
        fetchStatus = v76, 
        fetchStatusAsync = v80, 
        setStatus = v86, 
        clearStatus = v25, 
        effectDispose = v16
    };
end;