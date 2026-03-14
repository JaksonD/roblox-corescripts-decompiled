local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ChatNudgeCustomDialog);
local v4 = require(l_script_FirstAncestor_0.Components.ChatNudgeCustomDialogV2);
local v5 = require(l_script_FirstAncestor_0.Components.ChatTimeoutCustomDialog);
local v6 = require(l_script_FirstAncestor_0.Components.ChatNudgeToast);
local v7 = require(l_script_FirstAncestor_0.Components.ChatTimeoutToast);
local v8 = require(l_script_FirstAncestor_0.Components.ChatTimeoutCustomDialogV2);
local l_PartyChatNudgeCustomDialog_0 = require(l_Parent_0.InterventionShared).Components.PartyChatNudgeCustomDialog;
local l_PartyChatTimeoutCustomDialog_0 = require(l_Parent_0.InterventionShared).Components.PartyChatTimeoutCustomDialog;
local l_CursorProvider_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.CursorProvider;
local v12 = require(l_Parent_0.ReactFocusNavigation);
local v13 = v12.FocusNavigationService.new(v12.EngineInterface.CoreGui);
local v14 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local v19 = v2.memo(function(v18) --[[ Line: 32 ]]
    -- upvalues: v2 (copy), v12 (copy), v13 (copy), l_CursorProvider_0 (copy)
    return v2.createElement(v12.FocusNavigationContext.Provider, {
        value = v13
    }, {
        CursorProvider = v2.createElement(l_CursorProvider_0, {}, v18.children)
    });
end);
InExperienceInterventionDialogManager = function(v20) --[[ Line: 40 ]] --[[ Name: InExperienceInterventionDialogManager ]]
    -- upvalues: v2 (copy), v14 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v19 (copy), l_PartyChatNudgeCustomDialog_0 (copy), l_PartyChatTimeoutCustomDialog_0 (copy), v8 (copy), v4 (copy)
    local v21 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v20 (copy), v14 (ref)
        v20.uiStateDispatch({
            type = v14.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v14.TreatmentType.None, 
            isShown = false
        });
    end, {});
    local l_uiState_0 = v20.uiState;
    local l_treatmentType_0 = l_uiState_0.treatmentType;
    local l_detail_0 = l_uiState_0.detail;
    if l_uiState_0.isShown then
        if l_treatmentType_0 == v14.TreatmentType.ChatNudgeDialog then
            return v2.createElement(v3, {
                violatingChatLine = l_detail_0.evidence, 
                onDismiss = v21, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 == v14.TreatmentType.ChatTimeoutDialog and (l_detail_0.timeoutDurationSeconds or 0) > 0 then
            return v2.createElement(v5, {
                duration = l_detail_0.timeoutDurationSeconds, 
                onDismiss = v21, 
                eventId = l_detail_0.decisionEventId, 
                violatingChatLine = l_detail_0.evidence
            });
        elseif l_treatmentType_0 == v14.TreatmentType.ChatNudgeToast then
            return v2.createElement(v6, {
                violatingChatLine = l_detail_0.evidence, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 == v14.TreatmentType.ChatTimeoutChatAttempt then
            return v2.createElement(v7, {
                endTime = l_uiState_0.endTime, 
                treatmentType = v14.TreatmentType.ChatTimeoutChatAttempt, 
                dispatchTimestamp = l_uiState_0.dispatchTimestamp
            });
        elseif l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() and l_treatmentType_0 == v14.TreatmentType.ChatTimeoutGameJoin then
            return v2.createElement(v7, {
                endTime = l_uiState_0.endTime, 
                treatmentType = v14.TreatmentType.ChatTimeoutGameJoin, 
                dispatchTimestamp = l_uiState_0.dispatchTimestamp
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_treatmentType_0 == v14.TreatmentType.PartyChatNudgeDialog then
            return v2.createElement(v19, {}, {
                dialog = v2.createElement(l_PartyChatNudgeCustomDialog_0, {
                    evidence = l_detail_0.evidence, 
                    eventId = l_detail_0.decisionEventId, 
                    onDismiss = v21
                })
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_treatmentType_0 == v14.TreatmentType.PartyChatTimeoutDialog then
            return v2.createElement(v19, {}, {
                v2.createElement(l_PartyChatTimeoutCustomDialog_0, {
                    endTimestamp = l_uiState_0.endTime, 
                    evidence = l_detail_0.evidence, 
                    eventId = l_detail_0.decisionEventId, 
                    durationForAnalytics = l_detail_0.timeoutDurationSeconds, 
                    onDismiss = v21
                })
            });
        elseif l_treatmentType_0 == v14.TreatmentType.ChatTimeoutDialogV2 and l_detail_0.moderationDetail then
            return v2.createElement(v19, {}, {
                v2.createElement(v8, {
                    onDismiss = v21, 
                    moderationDetail = l_detail_0.moderationDetail
                })
            });
        elseif l_treatmentType_0 == v14.TreatmentType.ChatNudgeDialogV2 and l_detail_0.moderationDetail then
            return v2.createElement(v19, {}, {
                v2.createElement(v4, {
                    onDismiss = v21, 
                    moderationDetail = l_detail_0.moderationDetail
                })
            });
        elseif l_treatmentType_0 ~= v14.TreatmentType.BackendDriven then

        end;
    end;
    return nil;
end;
return InExperienceInterventionDialogManager;