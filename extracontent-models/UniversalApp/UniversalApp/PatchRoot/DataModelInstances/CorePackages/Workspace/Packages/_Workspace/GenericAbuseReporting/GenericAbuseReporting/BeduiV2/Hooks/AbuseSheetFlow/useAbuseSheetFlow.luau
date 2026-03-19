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
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
local function v33(v24, v25, v26) --[[ Line: 47 ]] --[[ Name: useAbuseSheetAnalytics ]]
    -- upvalues: v3 (copy), v2 (copy), l_sendAnalyticsEvent_0 (copy)
    return (v3.useCallback(function(v27) --[[ Line: 48 ]]
        -- upvalues: v24 (copy), v2 (ref), v25 (copy), v26 (copy), l_sendAnalyticsEvent_0 (ref)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v29 = if v24.openTime then l_UnixTimestampMillis_0 - v24.openTime else 0;
        local v31 = v2.map(v24.stack, function(v30) --[[ Line: 51 ]]
            return v30.nodeId;
        end);
        local v32 = {
            run_id = v24.runId, 
            user_id = v24.userId, 
            abuse_vector = v25, 
            target_id = v26, 
            total_duration = v29, 
            path = v31
        };
        l_sendAnalyticsEvent_0(v32, v27);
    end, {
        v24.stack, 
        v24.openTime, 
        v24.runId, 
        v25, 
        v26
    }));
end;
return function(v34, v35) --[[ Line: 83 ]] --[[ Name: useAbuseSheetFlow ]]
    -- upvalues: v3 (copy), l_reducer_0 (copy), l_getInitialState_0 (copy), l_getNewRunId_0 (copy), v16 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v33 (copy), l_selectContext_0 (copy), l_selectFormData_0 (copy), l_resolveArConfig_0 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), v14 (copy), v10 (copy)
    local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
    local v37, v38 = v3.useReducer(l_reducer_0, l_getInitialState_0(l_getNewRunId_0(), l_UnixTimestampMillis_1));
    local v39 = v16();
    local v40 = l_useRoactService_0(l_RoactNetworking_0);
    local v41 = v33(v37, v35.abuseVector, v35.targetId);
    local v42 = v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_selectContext_0 (ref), v37 (copy)
        return l_selectContext_0(v37);
    end, {
        v37
    });
    local v43 = v3.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: l_selectFormData_0 (ref), v37 (copy)
        return l_selectFormData_0(v37);
    end, {
        v37
    });
    local v44 = v3.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v34 (copy), l_resolveArConfig_0 (ref), v42 (copy), v43 (copy)
        if not v34 then
            return nil;
        else
            return l_resolveArConfig_0(v34, {
                attribute = v34.attributes, 
                resources = v34.resources or {}, 
                context = v42, 
                formData = v43
            });
        end;
    end, {
        v34, 
        v42, 
        v43
    });
    local v45 = v3.useRef(true);
    local v46 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v35 (copy), v45 (copy), l_getNewRunId_0 (ref), v38 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v46 (copy), v41 (copy), l_TelemetryEventType_0 (ref)
        if v35.open and not v45.current then
            local v47 = l_getNewRunId_0();
            local l_UnixTimestampMillis_2 = DateTime.now().UnixTimestampMillis;
            v38({
                type = "reset", 
                payload = {
                    runId = v47, 
                    initialEnterTime = l_UnixTimestampMillis_2
                }
            });
            if l_FFlagFixAnalyticsForDynamicReportV2_0 then
                v46.current = false;
            end;
        end;
        v45.current = false;
        if v35.open then
            v41({
                sub_event_type = l_TelemetryEventType_0.OpenDialog
            });
        end;
    end, {
        v35.open
    });
    local v49 = v2.last(v37.stack);
    local v50 = v44 and v44.nodes and v49 and v44.nodes[v49.nodeId];
    if not l_FFlagFixAnalyticsForDynamicReportV2_0 then
        if not v49 then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
        elseif not v49.nodeId then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
        end;
        if not v44 or not v44.nodes then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
        end;
        if not v50 then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = ("No config found for current nodeId: %*"):format(v49 and v49.nodeId)
                }
            });
        end;
    end;
    v3.useEffect(function() --[[ Line: 172 ]]
        -- upvalues: l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v35 (copy), v46 (copy), v34 (copy), v49 (copy), v41 (copy), l_TelemetryEventType_0 (ref), v44 (copy), v50 (copy)
        if not l_FFlagFixAnalyticsForDynamicReportV2_0 or not v35.open or v46.current then
            return;
        elseif not v34 then
            return;
        elseif not v49 then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
            v46.current = true;
            return;
        elseif not v49.nodeId then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
            v46.current = true;
            return;
        elseif not v44 or not v44.nodes then
            v41({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
            v46.current = true;
            return;
        else
            if not v50 then
                v41({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = ("No config found for current nodeId: %*"):format(v49.nodeId)
                    }
                });
                v46.current = true;
            end;
            return;
        end;
    end, {
        v35.open, 
        v34, 
        v44, 
        v49, 
        v50, 
        v41
    });
    local function v51() --[[ Line: 209 ]] --[[ Name: handleClose ]]
        -- upvalues: v35 (copy), v37 (copy), v41 (copy), l_TelemetryEventType_0 (ref)
        v35.onClose();
        if v37.submissionState ~= "completed" and v37.openTime ~= nil then
            v41({
                sub_event_type = l_TelemetryEventType_0.EarlyClose
            });
            return;
        else
            v41({
                sub_event_type = l_TelemetryEventType_0.Close
            });
            return;
        end;
    end;
    v3.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v44 (copy), v50 (copy), v37 (copy), v2 (ref), v35 (copy), v38 (copy), v39 (copy), v51 (copy), v14 (ref), v40 (copy), v41 (copy), l_TelemetryEventType_0 (ref)
        if not v44 or not v50 then
            return;
        elseif v37.navigationState ~= "gotoNext" then
            return;
        else
            local v52 = v2.last(v37.stack);
            if not v52 or not v52.nodeId then
                warn("Navigation triggered but current page or nodeId is invalid");
                return;
            elseif not v44.nodes[v52.nodeId] then
                warn((("Navigation triggered but no config found for nodeId: %*"):format(v52.nodeId)));
                return;
            else
                local function v55(v53) --[[ Line: 249 ]] --[[ Name: handleNextSimple ]]
                    -- upvalues: v35 (ref), v38 (ref), v39 (ref), v51 (ref)
                    if not v53 then
                        warn("handleNextSimple called with nil next value");
                        v35.onClose();
                        return;
                    else
                        local l_UnixTimestampMillis_3 = DateTime.now().UnixTimestampMillis;
                        if type(v53) == "string" then
                            v38({
                                type = "gotoNode", 
                                payload = {
                                    nodeId = v53, 
                                    enterTime = l_UnixTimestampMillis_3
                                }
                            });
                            return;
                        elseif type(v53) == "table" and v53.type == "goto" then
                            v38({
                                type = "gotoNode", 
                                payload = {
                                    nodeId = v53.nodeId, 
                                    enterTime = l_UnixTimestampMillis_3
                                }
                            });
                            return;
                        elseif type(v53) == "table" and v53.type == "link" then
                            v39("", v53.href);
                            v51();
                            return;
                        elseif type(v53) == "table" and v53.type == "close" then
                            v51();
                            return;
                        else
                            warn((("Unknown next type: %*, value: %*"):format(typeof(v53), v53)));
                            v51();
                            return;
                        end;
                    end;
                end;
                local function _() --[[ Line: 285 ]] --[[ Name: onSubmitForm ]]
                    -- upvalues: v44 (ref), v14 (ref), v40 (ref)
                    local l_submission_0 = v44.submission;
                    return v14(v40, l_submission_0.endpoint, l_submission_0.data);
                end;
                local l_next_0 = v50.next;
                if not l_next_0 then
                    warn("currentNode.next is nil, closing");
                    v35.onClose();
                    return;
                elseif type(l_next_0) == "table" and l_next_0.type == "submitForm" then
                    local l_UnixTimestampMillis_4 = DateTime.now().UnixTimestampMillis;
                    v41({
                        sub_event_type = l_TelemetryEventType_0.Submit
                    });
                    v38({
                        type = "startedSubmission"
                    });
                    local l_submission_1 = v44.submission;
                    v14(v40, l_submission_1.endpoint, l_submission_1.data):andThen(function(v61) --[[ Line: 300 ]]
                        -- upvalues: v38 (ref), v41 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_4 (copy), v55 (copy), l_next_0 (copy)
                        v38({
                            type = "completedSubmission"
                        });
                        v41({
                            sub_event_type = l_TelemetryEventType_0.SubmitSuccess, 
                            submit_detail = {
                                report_id = v61.responseBody and v61.responseBody.reportId, 
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_4
                            }
                        });
                        v55(l_next_0.onSuccess);
                    end):catch(function() --[[ Line: 311 ]]
                        -- upvalues: v38 (ref), v41 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_4 (copy), l_next_0 (copy), v55 (copy)
                        v38({
                            type = "submissionFailed"
                        });
                        v41({
                            sub_event_type = l_TelemetryEventType_0.SubmitFail, 
                            submit_detail = {
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_4
                            }
                        });
                        if l_next_0.onFailure then
                            v55(l_next_0.onFailure);
                        end;
                    end);
                    return;
                else
                    v55(l_next_0);
                    return;
                end;
            end;
        end;
    end, {
        v37.navigationState
    });
    local v62 = false;
    if #v37.stack > 1 then
        v62 = not (v37.submissionState == "completed");
    end;
    local function v64() --[[ Line: 327 ]] --[[ Name: goBack ]]
        -- upvalues: v44 (copy), v50 (copy), v49 (copy), v62 (copy), v38 (copy), v41 (copy), l_TelemetryEventType_0 (ref)
        if not v44 or not v50 or not v49 then
            return;
        else
            local l_UnixTimestampMillis_5 = DateTime.now().UnixTimestampMillis;
            if v62 then
                v38({
                    type = "goBack"
                });
                v41({
                    sub_event_type = l_TelemetryEventType_0.NodeDone, 
                    node_done_detail = {
                        node_id = v49.nodeId, 
                        node_type = v50.type, 
                        node_duration = l_UnixTimestampMillis_5 - v49.enterTime, 
                        node_exit_reason = "back"
                    }
                });
            end;
            return;
        end;
    end;
    local v65 = v50 and v50.next ~= nil;
    local function v68(v66) --[[ Line: 347 ]] --[[ Name: onNext ]]
        -- upvalues: v44 (copy), v50 (copy), v49 (copy), v38 (copy), v41 (copy), l_TelemetryEventType_0 (ref)
        if not v44 or not v50 or not v49 then
            return;
        else
            local l_UnixTimestampMillis_6 = DateTime.now().UnixTimestampMillis;
            v38({
                type = "updateDataAndNavigateNext", 
                payload = {
                    data = if v66 and v66.data then v66.data else {}, 
                    context = if v66 and v66.context then v66.context else {}
                }
            });
            v41({
                sub_event_type = l_TelemetryEventType_0.NodeDone, 
                node_done_detail = {
                    node_id = v49.nodeId, 
                    node_type = v50.type, 
                    node_duration = l_UnixTimestampMillis_6 - v49.enterTime, 
                    node_exit_reason = "next"
                }
            });
            return;
        end;
    end;
    local v69 = v3.useMemo(function() --[[ Line: 370 ]]
        -- upvalues: v41 (copy)
        return {
            sendEvent = v41
        };
    end, {
        v41
    });
    if not v44 or not v50 or not v49 then
        return nil;
    else
        return {
            config = v44, 
            canGoBack = v62, 
            goBack = v64, 
            isSubmitting = v37.submissionState == "submitting", 
            display = v44.display, 
            onClose = v51, 
            currentPageElement = v3.createElement(v10, {
                key = v49.nodeId, 
                node = v50, 
                onNext = if v65 then v68 else nil, 
                data = v43, 
                isSubmitting = v37.submissionState == "submitting"
            }), 
            analytics = v69
        };
    end;
end;