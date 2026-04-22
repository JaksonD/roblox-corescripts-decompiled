local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local _ = require(script.Parent.AbuseSheetFlowTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.ContentNode);
local l_getInitialState_0 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.reducer).getInitialState;
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.reducer);
local l_resolveArConfig_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Resolver.configResolvers).resolveArConfig;
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Api.sendReport);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Types);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local l_getNewRunId_0 = v13.getNewRunId;
local l_reducer_0 = v13.reducer;
local l_selectContext_0 = v13.selectContext;
local l_selectFormData_0 = v13.selectFormData;
local l_sendAnalyticsEvent_0 = v10.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v10.TelemetryEventType;
local l_FFlagAbuseReportMenuV2_0 = require(l_Parent_0.SharedFlags).FFlagAbuseReportMenuV2;
local v25 = game:DefineFastFlag("DynamicReportV2SubmitFailErrorEvent", false);
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
local function v36(v27, v28, v29) --[[ Line: 51 ]] --[[ Name: useAbuseSheetAnalytics ]]
    -- upvalues: v4 (copy), v2 (copy), l_sendAnalyticsEvent_0 (copy)
    return (v4.useCallback(function(v30) --[[ Line: 52 ]]
        -- upvalues: v27 (copy), v2 (ref), v28 (copy), v29 (copy), l_sendAnalyticsEvent_0 (ref)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v32 = if v27.openTime then l_UnixTimestampMillis_0 - v27.openTime else 0;
        local v34 = v2.map(v27.stack, function(v33) --[[ Line: 55 ]]
            return v33.nodeId;
        end);
        local v35 = {
            run_id = v27.runId, 
            user_id = v27.userId, 
            abuse_vector = v28, 
            target_id = v29, 
            total_duration = v32, 
            path = v34
        };
        l_sendAnalyticsEvent_0(v35, v30);
    end, {
        v27.stack, 
        v27.openTime, 
        v27.runId, 
        v28, 
        v29
    }));
end;
return function(v37, v38) --[[ Line: 91 ]] --[[ Name: useAbuseSheetFlow ]]
    -- upvalues: v4 (copy), l_reducer_0 (copy), l_getInitialState_0 (copy), l_getNewRunId_0 (copy), v17 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v36 (copy), l_selectContext_0 (copy), l_selectFormData_0 (copy), l_resolveArConfig_0 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), l_FFlagAbuseReportMenuV2_0 (copy), v15 (copy), v25 (copy), v11 (copy)
    local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
    local v40, v41 = v4.useReducer(l_reducer_0, l_getInitialState_0(l_getNewRunId_0(), l_UnixTimestampMillis_1));
    local v42 = v17();
    local v43 = l_useRoactService_0(l_RoactNetworking_0);
    local v44 = v36(v40, v38.abuseVector, v38.targetId);
    local v45 = v4.useMemo(function() --[[ Line: 109 ]]
        -- upvalues: l_selectContext_0 (ref), v40 (copy)
        return l_selectContext_0(v40);
    end, {
        v40
    });
    local v46 = v4.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: l_selectFormData_0 (ref), v40 (copy)
        return l_selectFormData_0(v40);
    end, {
        v40
    });
    local v47 = v4.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v37 (copy), l_resolveArConfig_0 (ref), v45 (copy), v46 (copy)
        if not v37 then
            return nil;
        else
            return l_resolveArConfig_0(v37, {
                attribute = v37.attributes, 
                resources = v37.resources or {}, 
                context = v45, 
                formData = v46
            });
        end;
    end, {
        v37, 
        v45, 
        v46
    });
    local v48 = v4.useRef(true);
    local v49 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v38 (copy), v48 (copy), l_getNewRunId_0 (ref), v41 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v49 (copy), v44 (copy), l_TelemetryEventType_0 (ref)
        if v38.open and not v48.current then
            local v50 = l_getNewRunId_0();
            local l_UnixTimestampMillis_2 = DateTime.now().UnixTimestampMillis;
            v41({
                type = "reset", 
                payload = {
                    runId = v50, 
                    initialEnterTime = l_UnixTimestampMillis_2
                }
            });
            if l_FFlagFixAnalyticsForDynamicReportV2_0 then
                v49.current = false;
            end;
        end;
        v48.current = false;
        if v38.open then
            v44({
                sub_event_type = l_TelemetryEventType_0.OpenDialog
            });
        end;
    end, {
        v38.open
    });
    local v52 = v2.last(v40.stack);
    local v53 = v47 and v47.nodes and v52 and v47.nodes[v52.nodeId];
    if not l_FFlagFixAnalyticsForDynamicReportV2_0 then
        if not v52 then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
        elseif not v52.nodeId then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
        end;
        if not v47 or not v47.nodes then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
        end;
        if not v53 then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = ("No config found for current nodeId: %*"):format(v52 and v52.nodeId)
                }
            });
        end;
    end;
    v4.useEffect(function() --[[ Line: 181 ]]
        -- upvalues: l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v38 (copy), v49 (copy), v37 (copy), v52 (copy), v44 (copy), l_TelemetryEventType_0 (ref), v47 (copy), v53 (copy)
        if not l_FFlagFixAnalyticsForDynamicReportV2_0 or not v38.open or v49.current then
            return;
        elseif not v37 then
            return;
        elseif not v52 then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "No current page found in abuse sheet flow."
                }
            });
            v49.current = true;
            return;
        elseif not v52.nodeId then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Current page has no nodeId in abuse sheet flow."
                }
            });
            v49.current = true;
            return;
        elseif not v47 or not v47.nodes then
            v44({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "Abuse sheet flow config or nodes is nil."
                }
            });
            v49.current = true;
            return;
        else
            if not v53 then
                v44({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = ("No config found for current nodeId: %*"):format(v52.nodeId)
                    }
                });
                v49.current = true;
            end;
            return;
        end;
    end, {
        v38.open, 
        v37, 
        v47, 
        v52, 
        v53, 
        v44
    });
    local function v54() --[[ Line: 218 ]] --[[ Name: handleClose ]]
        -- upvalues: v38 (copy), v40 (copy), v44 (copy), l_TelemetryEventType_0 (ref)
        v38.onClose();
        if v40.submissionState ~= "completed" and v40.openTime ~= nil then
            v44({
                sub_event_type = l_TelemetryEventType_0.EarlyClose
            });
            return;
        else
            v44({
                sub_event_type = l_TelemetryEventType_0.Close
            });
            return;
        end;
    end;
    local function v57() --[[ Line: 230 ]] --[[ Name: reset ]]
        -- upvalues: l_getNewRunId_0 (ref), v41 (copy), v44 (copy), l_TelemetryEventType_0 (ref)
        local v55 = l_getNewRunId_0();
        local l_UnixTimestampMillis_3 = DateTime.now().UnixTimestampMillis;
        v41({
            type = "reset", 
            payload = {
                runId = v55, 
                initialEnterTime = l_UnixTimestampMillis_3
            }
        });
        v44({
            sub_event_type = l_TelemetryEventType_0.OpenDialog
        });
    end;
    v4.useEffect(function() --[[ Line: 246 ]]
        -- upvalues: v47 (copy), v53 (copy), v40 (copy), v2 (ref), v38 (copy), v41 (copy), l_FFlagAbuseReportMenuV2_0 (ref), v42 (copy), v54 (copy), v57 (copy), v15 (ref), v43 (copy), v44 (copy), l_TelemetryEventType_0 (ref), v25 (ref)
        if not v47 or not v53 then
            return;
        elseif v40.navigationState ~= "gotoNext" then
            return;
        else
            local v58 = v2.last(v40.stack);
            if not v58 or not v58.nodeId then
                warn("Navigation triggered but current page or nodeId is invalid");
                return;
            elseif not v47.nodes[v58.nodeId] then
                warn((("Navigation triggered but no config found for nodeId: %*"):format(v58.nodeId)));
                return;
            else
                local function v61(v59) --[[ Line: 268 ]] --[[ Name: handleNextSimple ]]
                    -- upvalues: v38 (ref), v41 (ref), l_FFlagAbuseReportMenuV2_0 (ref), v42 (ref), v54 (ref), v57 (ref)
                    if not v59 then
                        warn("handleNextSimple called with nil next value");
                        v38.onClose();
                        return;
                    else
                        local l_UnixTimestampMillis_4 = DateTime.now().UnixTimestampMillis;
                        if type(v59) == "string" then
                            v41({
                                type = "gotoNode", 
                                payload = {
                                    nodeId = v59, 
                                    enterTime = l_UnixTimestampMillis_4
                                }
                            });
                            return;
                        elseif type(v59) == "table" and v59.type == "goto" then
                            if l_FFlagAbuseReportMenuV2_0 and v59.replace then
                                v41({
                                    type = "replaceAndGotoNode", 
                                    payload = {
                                        nodeId = v59.nodeId, 
                                        enterTime = l_UnixTimestampMillis_4
                                    }
                                });
                                return;
                            else
                                v41({
                                    type = "gotoNode", 
                                    payload = {
                                        nodeId = v59.nodeId, 
                                        enterTime = l_UnixTimestampMillis_4
                                    }
                                });
                                return;
                            end;
                        elseif type(v59) == "table" and v59.type == "link" then
                            v42("", v59.href);
                            v54();
                            return;
                        elseif type(v59) == "table" and v59.type == "close" then
                            v54();
                            return;
                        elseif l_FFlagAbuseReportMenuV2_0 and type(v59) == "table" and v59.type == "reset" then
                            v57();
                            return;
                        else
                            warn((("Unknown next type: %*, value: %*"):format(typeof(v59), v59)));
                            v54();
                            return;
                        end;
                    end;
                end;
                local function _() --[[ Line: 316 ]] --[[ Name: onSubmitForm ]]
                    -- upvalues: v47 (ref), l_FFlagAbuseReportMenuV2_0 (ref), v38 (ref), v15 (ref), v43 (ref)
                    local l_submission_0 = v47.submission;
                    if l_FFlagAbuseReportMenuV2_0 and v38.onCustomSubmit then
                        return v38.onCustomSubmit(l_submission_0);
                    else
                        return v15(v43, l_submission_0.endpoint, l_submission_0.data);
                    end;
                end;
                local l_next_0 = v53.next;
                if not l_next_0 then
                    warn("currentNode.next is nil, closing");
                    v38.onClose();
                    return;
                elseif type(l_next_0) == "table" and l_next_0.type == "submitForm" then
                    local l_UnixTimestampMillis_5 = DateTime.now().UnixTimestampMillis;
                    v44({
                        sub_event_type = l_TelemetryEventType_0.Submit
                    });
                    v41({
                        type = "startedSubmission"
                    });
                    local l_submission_1 = v47.submission;
                    (if l_FFlagAbuseReportMenuV2_0 and v38.onCustomSubmit then v38.onCustomSubmit(l_submission_1) else v15(v43, l_submission_1.endpoint, l_submission_1.data)):andThen(function(v67) --[[ Line: 334 ]]
                        -- upvalues: v41 (ref), v44 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_5 (copy), v61 (copy), l_next_0 (copy)
                        v41({
                            type = "completedSubmission"
                        });
                        v44({
                            sub_event_type = l_TelemetryEventType_0.SubmitSuccess, 
                            submit_detail = {
                                report_id = v67.responseBody and v67.responseBody.reportId, 
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_5
                            }
                        });
                        v61(l_next_0.onSuccess);
                    end):catch(function(v68) --[[ Line: 345 ]]
                        -- upvalues: v41 (ref), v44 (ref), l_TelemetryEventType_0 (ref), l_UnixTimestampMillis_5 (copy), v25 (ref), v2 (ref), l_next_0 (copy), v61 (copy)
                        v41({
                            type = "submissionFailed"
                        });
                        v44({
                            sub_event_type = l_TelemetryEventType_0.SubmitFail, 
                            submit_detail = {
                                submit_api_duration = DateTime.now().UnixTimestampMillis - l_UnixTimestampMillis_5
                            }
                        });
                        if v25 then
                            v44({
                                sub_event_type = l_TelemetryEventType_0.Error, 
                                error_detail = {
                                    error_message = "submitReport: " .. v2.pretty(v68, {
                                        depth = 10
                                    })
                                }
                            });
                        end;
                        if l_next_0.onFailure then
                            v61(l_next_0.onFailure);
                        end;
                    end);
                    return;
                else
                    v61(l_next_0);
                    return;
                end;
            end;
        end;
    end, {
        v40.navigationState
    });
    local v69 = false;
    if #v40.stack > 1 then
        v69 = not (v40.submissionState == "completed");
    end;
    local function v71() --[[ Line: 369 ]] --[[ Name: goBack ]]
        -- upvalues: v47 (copy), v53 (copy), v52 (copy), v69 (copy), v41 (copy), v44 (copy), l_TelemetryEventType_0 (ref)
        if not v47 or not v53 or not v52 then
            return;
        else
            local l_UnixTimestampMillis_6 = DateTime.now().UnixTimestampMillis;
            if v69 then
                v41({
                    type = "goBack"
                });
                v44({
                    sub_event_type = l_TelemetryEventType_0.NodeDone, 
                    node_done_detail = {
                        node_id = v52.nodeId, 
                        node_type = v53.type, 
                        node_duration = l_UnixTimestampMillis_6 - v52.enterTime, 
                        node_exit_reason = "back"
                    }
                });
            end;
            return;
        end;
    end;
    local v72 = v53 and v53.next ~= nil;
    local function v75(v73) --[[ Line: 389 ]] --[[ Name: onNext ]]
        -- upvalues: v47 (copy), v53 (copy), v52 (copy), v41 (copy), v44 (copy), l_TelemetryEventType_0 (ref)
        if not v47 or not v53 or not v52 then
            return;
        else
            local l_UnixTimestampMillis_7 = DateTime.now().UnixTimestampMillis;
            v41({
                type = "updateDataAndNavigateNext", 
                payload = {
                    data = if v73 and v73.data then v73.data else {}, 
                    context = if v73 and v73.context then v73.context else {}
                }
            });
            v44({
                sub_event_type = l_TelemetryEventType_0.NodeDone, 
                node_done_detail = {
                    node_id = v52.nodeId, 
                    node_type = v53.type, 
                    node_duration = l_UnixTimestampMillis_7 - v52.enterTime, 
                    node_exit_reason = "next"
                }
            });
            return;
        end;
    end;
    local v76 = v4.useMemo(function() --[[ Line: 412 ]]
        -- upvalues: v44 (copy)
        return {
            sendEvent = v44
        };
    end, {
        v44
    });
    if not v47 or not v53 or not v52 then
        return nil;
    else
        return {
            config = v47, 
            canGoBack = v69, 
            goBack = v71, 
            reset = v57, 
            isSubmitting = v40.submissionState == "submitting", 
            display = v47.display, 
            onClose = v54, 
            currentPageElement = v4.createElement(v11, {
                key = v52.nodeId, 
                node = v53, 
                onNext = if v72 then v75 else nil, 
                goBack = if l_FFlagAbuseReportMenuV2_0 then v71 else nil, 
                data = v46, 
                isSubmitting = v40.submissionState == "submitting"
            }), 
            currentNodeId = if l_FFlagAbuseReportMenuV2_0 then v52.nodeId else nil, 
            currentNodeType = if l_FFlagAbuseReportMenuV2_0 then v53.type else nil, 
            navigationDirection = if l_FFlagAbuseReportMenuV2_0 then v40.lastNavigationDirection else nil, 
            analytics = v76
        };
    end;
end;