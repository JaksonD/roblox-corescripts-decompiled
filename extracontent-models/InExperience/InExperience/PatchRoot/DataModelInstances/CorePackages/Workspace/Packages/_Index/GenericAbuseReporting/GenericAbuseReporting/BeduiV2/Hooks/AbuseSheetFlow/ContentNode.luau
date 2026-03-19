local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local _ = require(script.Parent.AbuseSheetFlowTypes);
local v7 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.CommentNode);
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ConfirmationNode);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ListNode);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ParagraphNode);
local l_TelemetryEventType_0 = v5.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v4.useAbuseReportAnalytics;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = require(l_Parent_0.SharedFlags).FFlagSupportSubmissionOnAllReportNodes;
return v3.memo(function(v14) --[[ Line: 37 ]] --[[ Name: ContentNode ]]
    -- upvalues: l_useAbuseReportAnalytics_0 (copy), v3 (copy), v9 (copy), v2 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy), v7 (copy), v8 (copy), v10 (copy), l_TelemetryEventType_0 (copy)
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    if v14.node.type == "list" then
        return v3.createElement(v9, v2.join(v14.node, {
            initialValue = if v14.data then v14.data[v14.node.formKey] else nil, 
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v14.isSubmitting else nil, 
            onNext = function(v16, v17) --[[ Line: 46 ]] --[[ Name: onNext ]]
                -- upvalues: v14 (copy)
                if v14.onNext then
                    local v18 = {};
                    local v19 = {};
                    if v14.node.formKey and v14.node.formKey ~= "" then
                        v18[v14.node.formKey] = v16;
                    end;
                    if v14.node.storeSelectionAsContext and v14.node.storeSelectionAsContext ~= "" then
                        v19[v14.node.storeSelectionAsContext] = v17;
                    end;
                    v14.onNext({
                        data = v18, 
                        context = v19
                    });
                end;
            end
        }));
    elseif v14.node.type == "comment" then
        return v3.createElement(v7, v2.join(v14.node, {
            initialValue = if v14.data then v14.data[v14.node.formKey] else nil, 
            isSubmitting = v14.isSubmitting, 
            onNext = function(v20) --[[ Line: 70 ]] --[[ Name: onNext ]]
                -- upvalues: v14 (copy)
                if v14.onNext then
                    local v21 = {};
                    if v14.node.formKey and v14.node.formKey ~= "" then
                        v21[v14.node.formKey] = v20;
                    end;
                    v14.onNext({
                        data = v21
                    });
                end;
            end
        }));
    elseif v14.node.type == "confirmation" then
        return v3.createElement(v8, v2.join(v14.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v14.isSubmitting else nil, 
            onNext = v14.onNext and function() --[[ Line: 88 ]]
                -- upvalues: v14 (copy)
                v14.onNext({});
            end or nil
        }));
    elseif v14.node.type == "paragraph" then
        return v3.createElement(v10, v2.join(v14.node, {
            isSubmitting = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v14.isSubmitting else nil, 
            onNext = v14.onNext and function() --[[ Line: 98 ]]
                -- upvalues: v14 (copy)
                v14.onNext({});
            end or nil
        }));
    else
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.Error, 
            error_detail = {
                error_message = ("Unknown node type: %*"):format(v14.node.type)
            }
        });
        return v3.createElement(v3.Fragment);
    end;
end);