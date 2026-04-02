local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local _ = require(script.Parent.AbuseSheetFlowTypes);
local v7 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.CommentNode);
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ConfirmationNode);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.DevListNode);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.InExpChatSelectionNode);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ListNode);
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ListNodeV2);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ParagraphNode);
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ReviewNode);
local l_TelemetryEventType_0 = v5.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v4.useAbuseReportAnalytics;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = require(l_Parent_0.SharedFlags).FFlagSupportSubmissionOnAllReportNodes;
local l_FFlagAbuseReportMenuV2_0 = require(l_Parent_0.SharedFlags).FFlagAbuseReportMenuV2;
return v3.memo(function(v19) --[[ Line: 43 ]] --[[ Name: ContentNode ]]
    -- upvalues: l_useAbuseReportAnalytics_0 (copy), l_FFlagAbuseReportMenuV2_0 (copy), v3 (copy), v9 (copy), v2 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy), v12 (copy), v11 (copy), v7 (copy), v8 (copy), v13 (copy), v14 (copy), v10 (copy), l_TelemetryEventType_0 (copy)
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    if l_FFlagAbuseReportMenuV2_0 and v19.node.type == "devList" then
        return v3.createElement(v9, v2.join(v19.node, {
            initialValue = if v19.data then v19.data[v19.node.formKey] else nil, 
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v19.isSubmitting else nil, 
            onNext = function(v21, v22) --[[ Line: 52 ]] --[[ Name: onNext ]]
                -- upvalues: v19 (copy)
                if v19.onNext then
                    local v23 = {};
                    local v24 = {};
                    if v19.node.formKey and v19.node.formKey ~= "" then
                        v23[v19.node.formKey] = v21;
                    end;
                    if v19.node.storeSelectionAsContext and v19.node.storeSelectionAsContext ~= "" then
                        v24[v19.node.storeSelectionAsContext] = v22;
                    end;
                    v19.onNext({
                        data = v23, 
                        context = v24
                    });
                end;
            end
        }));
    elseif v19.node.type == "list" then
        return v3.createElement(if l_FFlagAbuseReportMenuV2_0 then v12 else v11, v2.join(v19.node, {
            initialValue = if v19.data then v19.data[v19.node.formKey] else nil, 
            isSubmitting = v19.isSubmitting, 
            onNext = function(v25, v26) --[[ Line: 76 ]] --[[ Name: onNext ]]
                -- upvalues: v19 (copy)
                if v19.onNext then
                    local v27 = {};
                    local v28 = {};
                    if v19.node.formKey and v19.node.formKey ~= "" then
                        v27[v19.node.formKey] = v25;
                    end;
                    if v19.node.storeSelectionAsContext and v19.node.storeSelectionAsContext ~= "" then
                        v28[v19.node.storeSelectionAsContext] = v26;
                    end;
                    v19.onNext({
                        data = v27, 
                        context = v28
                    });
                end;
            end
        }));
    elseif v19.node.type == "comment" then
        return v3.createElement(v7, v2.join(v19.node, {
            initialValue = if v19.data then v19.data[v19.node.formKey] else nil, 
            isSubmitting = v19.isSubmitting, 
            onNext = function(v29) --[[ Line: 100 ]] --[[ Name: onNext ]]
                -- upvalues: v19 (copy)
                if v19.onNext then
                    local v30 = {};
                    if v19.node.formKey and v19.node.formKey ~= "" then
                        v30[v19.node.formKey] = v29;
                    end;
                    v19.onNext({
                        data = v30
                    });
                end;
            end
        }));
    elseif v19.node.type == "confirmation" then
        return v3.createElement(v8, v2.join(v19.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v19.isSubmitting else nil, 
            onNext = v19.onNext and function() --[[ Line: 118 ]]
                -- upvalues: v19 (copy)
                v19.onNext({});
            end or nil
        }));
    elseif v19.node.type == "paragraph" then
        return v3.createElement(v13, v2.join(v19.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v19.isSubmitting else nil, 
            onNext = v19.onNext and function() --[[ Line: 128 ]]
                -- upvalues: v19 (copy)
                v19.onNext({});
            end or nil
        }));
    elseif l_FFlagAbuseReportMenuV2_0 and v19.node.type == "review" then
        return v3.createElement(v14, v2.join(v19.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v19.isSubmitting else nil, 
            onNext = v19.onNext and function() --[[ Line: 138 ]]
                -- upvalues: v19 (copy)
                v19.onNext({});
            end or nil
        }));
    elseif l_FFlagAbuseReportMenuV2_0 and v19.node.type == "inExpChatSelection" then
        return v3.createElement(v10, v2.join(v19.node, {
            initialValue = if v19.data then v19.data[v19.node.formKey] else nil, 
            isSubmitting = v19.isSubmitting, 
            goBack = v19.goBack, 
            onNext = function(v31, v32) --[[ Line: 150 ]] --[[ Name: onNext ]]
                -- upvalues: v19 (copy)
                if v19.onNext then
                    local v33 = {};
                    local v34 = {};
                    if v19.node.formKey and v19.node.formKey ~= "" then
                        v33[v19.node.formKey] = v31;
                    end;
                    if v19.node.storeSelectionAsContext and v19.node.storeSelectionAsContext ~= "" then
                        v34[v19.node.storeSelectionAsContext] = v32;
                    end;
                    v19.onNext({
                        data = v33, 
                        context = v34
                    });
                end;
            end
        }));
    else
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.Error, 
            error_detail = {
                error_message = ("Unknown node type: %*"):format(v19.node.type)
            }
        });
        return v3.createElement(v3.Fragment);
    end;
end);