local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local v4 = require(l_script_FirstAncestor_0.Analytics.EventConstants);
local l_interactionEventName_0 = v4.interactionEventName;
return {
    sendDialogOpenedEvent = function(v6, v7, v8) --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v4 (copy), l_interactionEventName_0 (copy)
        local v9 = {
            dialog_opened_type = v6, 
            dialog_opened_type_internal_id = v7, 
            dialog_opened_is_expired = v8
        };
        v3:sendEventDeferred(v4.context.dialogOpened, l_interactionEventName_0, v9);
    end, 
    sendDialogActionSelectedEvent = function(v10, v11, v12) --[[ Line: 20 ]]
        -- upvalues: v3 (copy), v4 (copy), l_interactionEventName_0 (copy)
        local v13 = {
            dialog_action_selected_type = v10, 
            dialog_action_selected_type_internal_id = v11, 
            dialog_action_selected_action = v12
        };
        v3:sendEventDeferred(v4.context.dialogActionSelected, l_interactionEventName_0, v13);
    end, 
    sendDialogAbandonedEvent = function(v14, v15) --[[ Line: 29 ]]
        -- upvalues: v3 (copy), v4 (copy), l_interactionEventName_0 (copy)
        local v16 = {
            dialog_abandoned_type = v14, 
            dialog_abandoned_type_internal_id = v15
        };
        v3:sendEventDeferred(v4.context.dialogAbandoned, l_interactionEventName_0, v16);
    end
};