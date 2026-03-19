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
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local v18 = v2.memo(function(v13) --[[ Line: 19 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_CloseCentralOverlay_0 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_Constants_0 (copy), l_InterventionOverlay_0 (copy), l_PartyChatNudgeCustomDialog_0 (copy), l_PartyChatTimeoutCustomDialog_0 (copy)
    local v14 = l_useDispatch_0();
    local v15 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v14 (copy), l_CloseCentralOverlay_0 (ref)
        v14(l_CloseCentralOverlay_0());
    end, {
        v14
    });
    local l_uiState_0 = v13.uiState;
    if l_uiState_0.isShown then
        local v17 = l_uiState_0.interventionDetail or {};
        if l_getFFlagAppChatEnableIntervention_0() and l_uiState_0.treatmentType == l_Constants_0.TreatmentType.PartyChatNudgeDialog then
            return v2.createElement(l_InterventionOverlay_0, {
                onDismiss = v15
            }, {
                Dialog = v2.createElement(l_PartyChatNudgeCustomDialog_0, {
                    evidence = v17.evidence, 
                    eventId = v17.decisionEventId, 
                    onDismiss = v15
                })
            });
        elseif l_getFFlagAppChatEnableIntervention_0() and l_uiState_0.treatmentType == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
            return v2.createElement(l_InterventionOverlay_0, {
                onDismiss = v15
            }, {
                Dialog = v2.createElement(l_PartyChatTimeoutCustomDialog_0, {
                    endTimestamp = l_uiState_0.endTime, 
                    evidence = v17.evidence, 
                    eventId = v17.decisionEventId, 
                    durationForAnalytics = v17.timeoutDurationSeconds, 
                    onDismiss = v15
                })
            });
        end;
    end;
    return nil;
end);
return v2.memo(function(v19) --[[ Line: 62 ]] --[[ Name: InAppInterventionContainer ]]
    -- upvalues: v2 (copy), l_InterventionPlacement_0 (copy), l_Constants_0 (copy), l_LayerCollectorProvider_0 (copy), v18 (copy)
    return v2.createElement(l_InterventionPlacement_0.Provider, {
        value = l_Constants_0.InterventionPlacementType.InApp
    }, {
        LayerCollectorProvider = v2.createElement(l_LayerCollectorProvider_0, {}, {
            InAppInterventionDialogContainer = v2.createElement(v18, v19)
        })
    });
end);