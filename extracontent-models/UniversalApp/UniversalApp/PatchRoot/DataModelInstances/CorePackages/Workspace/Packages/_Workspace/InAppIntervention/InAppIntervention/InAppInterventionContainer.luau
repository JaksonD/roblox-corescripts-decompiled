local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_InterventionPlacement_0 = require(l_Parent_0.InterventionShared).Contexts.InterventionPlacement;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_InterventionOverlay_0 = require(l_Parent_0.InterventionShared).Components.InterventionOverlay;
local l_PartyChatNudgeCustomDialog_0 = require(l_Parent_0.InterventionShared).Components.PartyChatNudgeCustomDialog;
local l_PartyChatTimeoutCustomDialog_0 = require(l_Parent_0.InterventionShared).Components.PartyChatTimeoutCustomDialog;
local l_UniversalFeatureRestrictionDialog_0 = require(l_Parent_0.InterventionShared).Components.UniversalFeatureRestrictionDialog;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagUniversalFeatureRestrictionReceivers_0 = require(l_Parent_0.SharedFlags).FFlagUniversalFeatureRestrictionReceivers;
local v21 = v2.memo(function(v15) --[[ Line: 24 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_CloseCentralOverlay_0 (copy), l_FFlagUniversalFeatureRestrictionReceivers_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_Constants_0 (copy), l_InterventionOverlay_0 (copy), l_PartyChatNudgeCustomDialog_0 (copy), l_PartyChatTimeoutCustomDialog_0 (copy), l_UniversalFeatureRestrictionDialog_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v16 (copy), l_CloseCentralOverlay_0 (ref)
        v16(l_CloseCentralOverlay_0());
    end, {
        v16
    });
    local l_uiState_0 = v15.uiState;
    if l_uiState_0.isShown then
        local v19 = l_uiState_0.interventionDetail or {};
        local v20 = if l_FFlagUniversalFeatureRestrictionReceivers_0 then v19.options else nil;
        if l_getFFlagAppChatEnableIntervention_0() and l_uiState_0.treatmentType == l_Constants_0.TreatmentType.PartyChatNudgeDialog then
            return v2.createElement(l_InterventionOverlay_0, {
                onDismiss = v17
            }, {
                Dialog = v2.createElement(l_PartyChatNudgeCustomDialog_0, {
                    evidence = v19.evidence, 
                    eventId = v19.decisionEventId, 
                    onDismiss = v17
                })
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_uiState_0.treatmentType == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
            return v2.createElement(l_InterventionOverlay_0, {
                onDismiss = v17
            }, {
                Dialog = v2.createElement(l_PartyChatTimeoutCustomDialog_0, {
                    endTimestamp = l_uiState_0.endTime, 
                    evidence = v19.evidence, 
                    eventId = v19.decisionEventId, 
                    durationForAnalytics = v19.timeoutDurationSeconds, 
                    onDismiss = v17
                })
            });
        elseif l_FFlagUniversalFeatureRestrictionReceivers_0 and l_uiState_0.treatmentType == l_Constants_0.TreatmentType.UniversalFeatureRestriction and v19.moderationDetail then
            return v2.createElement(l_UniversalFeatureRestrictionDialog_0, {
                onDismiss = v17, 
                onDismissCallback = v20 and v20.onDismiss, 
                moderationDetail = v19.moderationDetail
            });
        end;
    end;
    return nil;
end);
return v2.memo(function(v22) --[[ Line: 79 ]] --[[ Name: InAppInterventionContainer ]]
    -- upvalues: v2 (copy), l_InterventionPlacement_0 (copy), l_Constants_0 (copy), l_LayerCollectorProvider_0 (copy), v21 (copy)
    return v2.createElement(l_InterventionPlacement_0.Provider, {
        value = l_Constants_0.InterventionPlacementType.InApp
    }, {
        LayerCollectorProvider = v2.createElement(l_LayerCollectorProvider_0, {}, {
            InAppInterventionDialogContainer = v2.createElement(v21, v22)
        })
    });
end);