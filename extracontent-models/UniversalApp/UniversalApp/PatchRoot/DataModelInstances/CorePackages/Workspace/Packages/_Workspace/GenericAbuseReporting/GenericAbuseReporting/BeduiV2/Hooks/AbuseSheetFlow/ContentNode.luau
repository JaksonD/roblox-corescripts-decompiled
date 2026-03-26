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
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ListNode);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ParagraphNode);
local l_TelemetryEventType_0 = v5.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v4.useAbuseReportAnalytics;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = require(l_Parent_0.SharedFlags).FFlagSupportSubmissionOnAllReportNodes;
return v3.memo(function(v15) --[[ Line: 38 ]] --[[ Name: ContentNode ]]
    -- upvalues: l_useAbuseReportAnalytics_0 (copy), v3 (copy), v9 (copy), v2 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy), v10 (copy), v7 (copy), v8 (copy), v11 (copy), l_TelemetryEventType_0 (copy)
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    if v15.node.type == "devList" then
        return v3.createElement(v9, v2.join(v15.node, {
            initialValue = if v15.data then v15.data[v15.node.formKey] else nil, 
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v15.isSubmitting else nil, 
            onNext = function(v17, v18) --[[ Line: 47 ]] --[[ Name: onNext ]]
                -- upvalues: v15 (copy)
                if v15.onNext then
                    local v19 = {};
                    local v20 = {};
                    if v15.node.formKey and v15.node.formKey ~= "" then
                        v19[v15.node.formKey] = v17;
                    end;
                    if v15.node.storeSelectionAsContext and v15.node.storeSelectionAsContext ~= "" then
                        v20[v15.node.storeSelectionAsContext] = v18;
                    end;
                    v15.onNext({
                        data = v19, 
                        context = v20
                    });
                end;
            end
        }));
    elseif v15.node.type == "list" then
        return v3.createElement(v10, v2.join(v15.node, {
            initialValue = if v15.data then v15.data[v15.node.formKey] else nil, 
            isSubmitting = v15.isSubmitting, 
            onNext = function(v21, v22) --[[ Line: 71 ]] --[[ Name: onNext ]]
                -- upvalues: v15 (copy)
                if v15.onNext then
                    local v23 = {};
                    local v24 = {};
                    if v15.node.formKey and v15.node.formKey ~= "" then
                        v23[v15.node.formKey] = v21;
                    end;
                    if v15.node.storeSelectionAsContext and v15.node.storeSelectionAsContext ~= "" then
                        v24[v15.node.storeSelectionAsContext] = v22;
                    end;
                    v15.onNext({
                        data = v23, 
                        context = v24
                    });
                end;
            end
        }));
    elseif v15.node.type == "comment" then
        return v3.createElement(v7, v2.join(v15.node, {
            initialValue = if v15.data then v15.data[v15.node.formKey] else nil, 
            isSubmitting = v15.isSubmitting, 
            onNext = function(v25) --[[ Line: 95 ]] --[[ Name: onNext ]]
                -- upvalues: v15 (copy)
                if v15.onNext then
                    local v26 = {};
                    if v15.node.formKey and v15.node.formKey ~= "" then
                        v26[v15.node.formKey] = v25;
                    end;
                    v15.onNext({
                        data = v26
                    });
                end;
            end
        }));
    elseif v15.node.type == "confirmation" then
        return v3.createElement(v8, v2.join(v15.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v15.isSubmitting else nil, 
            onNext = v15.onNext and function() --[[ Line: 113 ]]
                -- upvalues: v15 (copy)
                v15.onNext({});
            end or nil
        }));
    elseif v15.node.type == "paragraph" then
        return v3.createElement(v11, v2.join(v15.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v15.isSubmitting else nil, 
            onNext = v15.onNext and function() --[[ Line: 123 ]]
                -- upvalues: v15 (copy)
                v15.onNext({});
            end or nil
        }));
    else
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.Error, 
            error_detail = {
                error_message = ("Unknown node type: %*"):format(v15.node.type)
            }
        });
        return v3.createElement(v3.Fragment);
    end;
end);