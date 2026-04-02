local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local _ = require(script.Parent.AbuseSheetFlowTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.ContentNode);
local l_getInitialState_0 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.reducer).getInitialState;
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.reducer);
local l_resolveArConfig_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Resolver.configResolvers).resolveArConfig;
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Api.sendReport);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Types);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local l_getNewRunId_0 = v12.getNewRunId;
local l_reducer_0 = v12.reducer;
local l_selectContext_0 = v12.selectContext;
local l_selectFormData_0 = v12.selectFormData;
local l_sendAnalyticsEvent_0 = v9.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v9.TelemetryEventType;
local l_FFlagAbuseReportMenuV2_0 = require(l_Parent_0.SharedFlags).FFlagAbuseReportMenuV2;
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
local function v34(v25, v26, v27) --[[ Line: 47 ]] --[[ Name: useAbuseSheetAnalytics ]]
    -- upvalues: v3 (copy), v2 (copy), l_sendAnalyticsEvent_0 (copy)
    return (v3.useCallback(function(v28) --[[ Line: 48 ]]
        -- upvalues: v25 (copy), v2 (ref), v26 (copy), v27 (copy), l_sendAnalyticsEvent_0 (ref)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v30 = if v25.openTime then l_UnixTimestampMillis_0 - v25.openTime else 0;
        local v32 = v2.map(v25.stack, function(v31) --[[ Line: 51 ]]
            return v31.nodeId;
        end);
        local v33 = {
            run_id = v25.runId, 
            user_id = v25.userId, 
            abuse_vector = v26, 
            target_id = v27, 
            total_duration = v30, 
            path = v32
        };
        l_sendAnalyticsEvent_0(v33, v28);
    end, {
        v25.stack, 
        v25.openTime, 
        v25.runId, 
        v26, 
        v27
    }));
end;
return function(v35, v36) --[[ Line: 83 ]] --[[ Name: useAbuseSheetFlow ]]
    -- upvalues: v3 (copy), l_reducer_0 (copy), l_getInitialState_0 (copy), l_getNewRunId_0 (copy), v16 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v34 (copy), l_selectContext_0 (copy), l_selectFormData_0 (copy), l_resolveArConfig_0 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), v14 (copy), v10 (copy), l_FFlagAbuseReportMenuV2_0 (copy)
    local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
    local v38, v39 = v3.useReducer(l_reducer_0, l_getInitialState_0(l_getNewRunId_0(), l_UnixTimestampMillis_1));
    local v40 = v16();
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = v34(v38, v36.abuseVector, v36.targetId);
    local v43 = v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_selectContext_0 (ref), v38 (copy)
        return l_selectContext_0(v38);
    end, {
        v38
    });
    local v44 = v3.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: l_selectFormData_0 (ref), v38 (copy)
        return l_selectFormData_0(v38);
    end, {
        v38
    });
    local v45 = v3.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v35 (copy), l_resolveArConfig_0 (ref), v43 (copy), v44 (copy)
        if not v35 then
            return nil;
        else
            return l_resolveArConfig_0(v35, {
                attribute = v35.attributes, 
                resources = v35.resources or {}, 
                context = v43, 
                formData = v44
            });
        end;
    end, {
        v35, 
        v43, 
        v44
    });
    local v46 = v3.useRef(true);
    local v47 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v36 (copy), v46 (copy), l_getNewRunId_0 (ref), v39 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v47 (copy), v42 (copy), l_TelemetryEventType_0 (ref)
        if v36.open and not v46.current then
            local v48 = l_getNewRunId_0();
            local l_UnixTimestampMillis_2 = DateTime.now().UnixTimestampMillis;
            v39({
                type = "reset", 
                payload = {
                    runId = v48, 
                    initialEnterTime = l_UnixTimestampMillis_2
                }
            });
            if l_FFlagFixAnalyticsForDynamicReportV2_0 then
                v47.current = false;
            end;
        end;
        v46.current = false;
        if v36.open then
            v42({
                sub_event_type = l_TelemetryEventType_0.OpenDialog
            });
        end;
    end, {
        v36.open
    });
    local v50 = v2.last(v38.stack);
    local v51 = v45 and v45.nodes and v50 and v45.nodes[v50.nodeId];
    if not l_FFlagFixAnalyticsForDynamicReportV2_0 then
        if not v50 then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
        elseif not v50.nodeId then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
        end;
        if not v45 or not v45.nodes then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
        end;
        if not v51 then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = ("No config found for current nodeId: %*"):format(v50 and v50.nodeId)
                }
            });
        end;
    end;
    v3.useEffect(function() --[[ Line: 172 ]]
        -- upvalues: l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v36 (copy), v47 (copy), v35 (copy), v50 (copy), v42 (copy), l_TelemetryEventType_0 (ref), v45 (copy), v51 (copy)
        if not l_FFlagFixAnalyticsForDynamicReportV2_0 or not v36.open or v47.current then
            return;
        elseif not v35 then
            return;
        elseif not v50 then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
            v47.current = true;
            return;
        elseif not v50.nodeId then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
            v47.current = true;
            return;
        elseif not v45 or not v45.nodes then
            v42({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
            v47.current = true;
            return;
        else
            if not v51 then
                v42({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = ("No config found for current nodeId: %*"):format(v50.nodeId)
                    }
                });
                v47.current = true;
            end;
            return;
        end;
    end, {
        v36.open, 
        v35, 
        v45, 
        v50, 
        v51, 
        v42
    });
    local function v52() --[[ Line: 209 ]] --[[ Name: handleClose ]]
        -- upvalues: v36 (copy), v38 (copy), v42 (copy), l_TelemetryEventType_0 (ref)
        v36.onClose();
        if v38.submissionState ~= "completed" and v38.openTime ~= nil then
            v42({
                sub_event_type = l_TelemetryEventType_0.EarlyClose
            });
            return;
        else
            v42({
                sub_event_type = l_TelemetryEventType_0.Close
            });
            return;
        end;
    end;
    v3.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v45 (copy), v51 (copy), v38 (copy), v2 (ref), v36 (copy), v39 (copy), v40 (copy), v52 (copy), v14 (ref), v41 (copy), v42 (copy), l_TelemetryEventType_0 (ref)
        if not v45 or not v51 then
            return;
        elseif v38.navigationState ~= "gotoNext" then
            return;
        else
            local v53 = v2.last(v38.stack);
            if not v53 or not v53.nodeId then
                warn("Navigation triggered but current page or nodeId is invalid");
                return;
            elseif not v45.nodes[v53.nodeId] then
                warn((("Navigation triggered but no config found for nodeId: %*"):format(v53.nodeId)));
                return;
            else
                local function v56(v54) --[[ Line: 249 ]] --[[ Name: handleNextSimple ]]
                    -- upvalues: v36 (ref), v39 (ref), v40 (ref), v52 (ref)
                    if not v54 then
                        warn("handleNextSimple called with nil next value");
                        v36.onClose();
                        return;
                    else
                        local l_UnixTimestampMillis_3 = DateTime.now().UnixTimestampMillis;
                        if type(v54) == "string" then
                            v39({
                                type = "gotoNode", 
                                payload = {
                                    nodeId = v54, 
                                    enterTime = l_UnixTimestampMillis_3
                                }
                            });
                            return;
                        elseif type(v54) == "table" and v54.type == "goto" then
                            v39({
                                type = "gotoNode", 
                                payload = {
                                    nodeId = v54.nodeId, 
                                    enterTime = l_UnixTimestampMillis_3
                                }
                            });
                            return;
                        elseif type(v54) == "table" and v54.type == "link" then
                            v40("", v54.href);
                            v52();
                            return;
                        elseif type(v54) == "table" and v54.type == "close" then
                            v52();
                            return;
                        else
                            warn((("Unknown next type: %*, value: %*"):format(typeof(v54), v54)));
                            v52();
                            return;
                        end;
                    end;
                end;
                local function _() --[[ Line: 285 ]] --[[ Name: onSubmitForm ]]
                    -- upvalues: v45 (ref), v14 (ref), v41 (ref)
                    local l_submission_0 = v45.submission;
                    return v14(v41, l_submission_0.endpoint, l_submission_0.data);
                end;
                local l_next_0 = v51.next;
                if not l_next_0 then
                    warn("currentNode.next is nil, closing");
                    v36.onClose();
                    return;
                elseif type(l_next_0) == "table" and l_next_0.type == "submitForm" then
                    local l_UnixTimestampMillis_4 = DateTime.now().UnixTimestampMillis;
                    v42({
                        sub_event_type = l_TelemetryEventType_0.Submit
                    });
                    v39({
                        type = "startedSubmission"
                    });
                    local l_submission_1 = v45.submission;
                    v14(v41, l_submission_1.endpoint, l_submission_1.data):andThen(function(v62) --[[ Line: 300 ]]
                        -- upvalues: v39 (ref), v42 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_4 (copy), v56 (copy), l_next_0 (copy)
                        v39({
                            type = "completedSubmission"
                        });
                        v42({
                            sub_event_type = l_TelemetryEventType_0.SubmitSuccess, 
                            submit_detail = {
                                report_id = v62.responseBody and v62.responseBody.reportId, 
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_4
                            }
                        });
                        v56(l_next_0.onSuccess);
                    end):catch(function() --[[ Line: 311 ]]
                        -- upvalues: v39 (ref), v42 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_4 (copy), l_next_0 (copy), v56 (copy)
                        v39({
                            type = "submissionFailed"
                        });
                        v42({
                            sub_event_type = l_TelemetryEventType_0.SubmitFail, 
                            submit_detail = {
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_4
                            }
                        });
                        if l_next_0.onFailure then
                            v56(l_next_0.onFailure);
                        end;
                    end);
                    return;
                else
                    v56(l_next_0);
                    return;
                end;
            end;
        end;
    end, {
        v38.navigationState
    });
    local v63 = false;
    if #v38.stack > 1 then
        v63 = not (v38.submissionState == "completed");
    end;
    local function v65() --[[ Line: 327 ]] --[[ Name: goBack ]]
        -- upvalues: v45 (copy), v51 (copy), v50 (copy), v63 (copy), v39 (copy), v42 (copy), l_TelemetryEventType_0 (ref)
        if not v45 or not v51 or not v50 then
            return;
        else
            local l_UnixTimestampMillis_5 = DateTime.now().UnixTimestampMillis;
            if v63 then
                v39({
                    type = "goBack"
                });
                v42({
                    sub_event_type = l_TelemetryEventType_0.NodeDone, 
                    node_done_detail = {
                        node_id = v50.nodeId, 
                        node_type = v51.type, 
                        node_duration = l_UnixTimestampMillis_5 - v50.enterTime, 
                        node_exit_reason = "back"
                    }
                });
            end;
            return;
        end;
    end;
    local v66 = v51 and v51.next ~= nil;
    local function v69(v67) --[[ Line: 347 ]] --[[ Name: onNext ]]
        -- upvalues: v45 (copy), v51 (copy), v50 (copy), v39 (copy), v42 (copy), l_TelemetryEventType_0 (ref)
        if not v45 or not v51 or not v50 then
            return;
        else
            local l_UnixTimestampMillis_6 = DateTime.now().UnixTimestampMillis;
            v39({
                type = "updateDataAndNavigateNext", 
                payload = {
                    data = if v67 and v67.data then v67.data else {}, 
                    context = if v67 and v67.context then v67.context else {}
                }
            });
            v42({
                sub_event_type = l_TelemetryEventType_0.NodeDone, 
                node_done_detail = {
                    node_id = v50.nodeId, 
                    node_type = v51.type, 
                    node_duration = l_UnixTimestampMillis_6 - v50.enterTime, 
                    node_exit_reason = "next"
                }
            });
            return;
        end;
    end;
    local v70 = v3.useMemo(function() --[[ Line: 370 ]]
        -- upvalues: v42 (copy)
        return {
            sendEvent = v42
        };
    end, {
        v42
    });
    if not v45 or not v51 or not v50 then
        return nil;
    else
        return {
            config = v45, 
            canGoBack = v63, 
            goBack = v65, 
            isSubmitting = v38.submissionState == "submitting", 
            display = v45.display, 
            onClose = v52, 
            currentPageElement = v3.createElement(v10, {
                key = v50.nodeId, 
                node = v51, 
                onNext = if v66 then v69 else nil, 
                goBack = if l_FFlagAbuseReportMenuV2_0 then v65 else nil, 
                data = v44, 
                isSubmitting = v38.submissionState == "submitting"
            }), 
            analytics = v70
        };
    end;
end;