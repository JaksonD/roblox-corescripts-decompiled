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
local l_UniversalFeatureRestrictionDialog_0 = require(l_Parent_0.InterventionShared).Components.UniversalFeatureRestrictionDialog;
local l_CursorProvider_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.CursorProvider;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local v14 = v13.FocusNavigationService.new(v13.EngineInterface.CoreGui);
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v16 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagFeatureRestrictionMiscFixes_0 = require(l_Parent_0.InterventionShared).Flags.FFlagFeatureRestrictionMiscFixes;
local l_FFlagUniversalFeatureRestrictionReceivers_0 = require(l_Parent_0.SharedFlags).FFlagUniversalFeatureRestrictionReceivers;
local v23 = v2.memo(function(v22) --[[ Line: 38 ]]
    -- upvalues: v2 (copy), v13 (copy), v14 (copy), l_FFlagFeatureRestrictionMiscFixes_0 (copy), l_Provider_0 (copy), l_CursorProvider_0 (copy)
    return v2.createElement(v13.FocusNavigationContext.Provider, {
        value = v14
    }, if l_FFlagFeatureRestrictionMiscFixes_0 then {
        RegistryProvider = v2.createElement(l_Provider_0, nil, {
            CursorProvider = v2.createElement(l_CursorProvider_0, {}, v22.children)
        })
    } else {
        CursorProvider = v2.createElement(l_CursorProvider_0, {}, v22.children)
    });
end);
InExperienceInterventionDialogManager = function(v24) --[[ Line: 56 ]] --[[ Name: InExperienceInterventionDialogManager ]]
    -- upvalues: v2 (copy), v16 (copy), l_FFlagUniversalFeatureRestrictionReceivers_0 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v23 (copy), l_PartyChatNudgeCustomDialog_0 (copy), l_PartyChatTimeoutCustomDialog_0 (copy), v8 (copy), v4 (copy), l_UniversalFeatureRestrictionDialog_0 (copy)
    local v25 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v24 (copy), v16 (ref)
        v24.uiStateDispatch({
            type = v16.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v16.TreatmentType.None, 
            isShown = false
        });
    end, {});
    local l_uiState_0 = v24.uiState;
    local l_treatmentType_0 = l_uiState_0.treatmentType;
    local l_detail_0 = l_uiState_0.detail;
    local v29 = if l_FFlagUniversalFeatureRestrictionReceivers_0 and l_detail_0 then l_detail_0.options else nil;
    if l_uiState_0.isShown then
        if l_treatmentType_0 == v16.TreatmentType.ChatNudgeDialog then
            return v2.createElement(v3, {
                violatingChatLine = l_detail_0.evidence, 
                onDismiss = v25, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 == v16.TreatmentType.ChatTimeoutDialog and (l_detail_0.timeoutDurationSeconds or 0) > 0 then
            return v2.createElement(v5, {
                duration = l_detail_0.timeoutDurationSeconds, 
                onDismiss = v25, 
                eventId = l_detail_0.decisionEventId, 
                violatingChatLine = l_detail_0.evidence
            });
        elseif l_treatmentType_0 == v16.TreatmentType.ChatNudgeToast then
            return v2.createElement(v6, {
                violatingChatLine = l_detail_0.evidence, 
                eventId = l_detail_0.decisionEventId
            });
        elseif l_treatmentType_0 == v16.TreatmentType.ChatTimeoutChatAttempt then
            return v2.createElement(v7, {
                endTime = l_uiState_0.endTime, 
                treatmentType = v16.TreatmentType.ChatTimeoutChatAttempt, 
                dispatchTimestamp = l_uiState_0.dispatchTimestamp
            });
        elseif l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() and l_treatmentType_0 == v16.TreatmentType.ChatTimeoutGameJoin then
            return v2.createElement(v7, {
                endTime = l_uiState_0.endTime, 
                treatmentType = v16.TreatmentType.ChatTimeoutGameJoin, 
                dispatchTimestamp = l_uiState_0.dispatchTimestamp
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_treatmentType_0 == v16.TreatmentType.PartyChatNudgeDialog then
            return v2.createElement(v23, {}, {
                dialog = v2.createElement(l_PartyChatNudgeCustomDialog_0, {
                    evidence = l_detail_0.evidence, 
                    eventId = l_detail_0.decisionEventId, 
                    onDismiss = v25
                })
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_treatmentType_0 == v16.TreatmentType.PartyChatTimeoutDialog then
            return v2.createElement(v23, {}, {
                v2.createElement(l_PartyChatTimeoutCustomDialog_0, {
                    endTimestamp = l_uiState_0.endTime, 
                    evidence = l_detail_0.evidence, 
                    eventId = l_detail_0.decisionEventId, 
                    durationForAnalytics = l_detail_0.timeoutDurationSeconds, 
                    onDismiss = v25
                })
            });
        elseif l_treatmentType_0 == v16.TreatmentType.ChatTimeoutDialogV2 and l_detail_0.moderationDetail then
            return v2.createElement(v23, {}, {
                v2.createElement(v8, {
                    onDismiss = v25, 
                    moderationDetail = l_detail_0.moderationDetail
                })
            });
        elseif l_treatmentType_0 == v16.TreatmentType.ChatNudgeDialogV2 and l_detail_0.moderationDetail then
            return v2.createElement(v23, {}, {
                v2.createElement(v4, {
                    onDismiss = v25, 
                    moderationDetail = l_detail_0.moderationDetail
                })
            });
        elseif l_FFlagUniversalFeatureRestrictionReceivers_0 and l_treatmentType_0 == v16.TreatmentType.UniversalFeatureRestriction and l_detail_0.moderationDetail then
            return v2.createElement(v23, {}, {
                v2.createElement(l_UniversalFeatureRestrictionDialog_0, {
                    onDismiss = v25, 
                    onDismissCallback = v29 and v29.onDismiss, 
                    moderationDetail = l_detail_0.moderationDetail
                })
            });
        elseif l_treatmentType_0 ~= v16.TreatmentType.BackendDriven then

        end;
    end;
    return nil;
end;
return InExperienceInterventionDialogManager;