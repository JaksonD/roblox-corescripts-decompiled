local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_Parent_0.React);
local l_ConversationOverlay_0 = v4.Constants.ConversationOverlay;
local l_ModalSequence_0 = v4.Constants.ModalSequence;
local v8 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_script_FirstAncestor_0.Hooks.useShouldShowConversationOverlay);
local v11 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSeenWithDelay);
local v12 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local v13 = require(l_script_FirstAncestor_0.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellContainer);
local v14 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v16 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedChatModal);
local v17 = require(l_Parent_0.SharedFlags);
local v18 = require(l_script_FirstAncestor_0.Flags.FIntAppChatModalSeenImpressionDelayMs);
local l_FFlagAppChatEnableDoubleOptIn_0 = v17.FFlagAppChatEnableDoubleOptIn;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local v21 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = v13, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = if l_FFlagAppChatEnableDoubleOptIn_0 then v13 else nil, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = if l_FFlagAppChatEnableDoubleOptIn_0 then v13 else nil
};
if v20 then
    v21[l_ConversationOverlay_0.NudgeToChatUpsell] = require(script.Parent.NudgeToChatUpsellContainer);
end;
return v5.memo(function(v22) --[[ Line: 55 ]]
    -- upvalues: l_useSelector_0 (copy), v8 (copy), v12 (copy), v5 (copy), v21 (copy), v10 (copy), v14 (copy), l_useDispatch_0 (copy), v11 (copy), l_ModalSequence_0 (copy), v18 (copy), v4 (copy), v3 (copy), v16 (copy)
    local v24 = l_useSelector_0(function(v23) --[[ Line: 57 ]]
        -- upvalues: v8 (ref), v22 (copy), v12 (ref)
        return v8(v23, (("ChatAppReducer.Modals.conversationOverlays.%*"):format(v22.conversationId))) or v12.default;
    end);
    v24 = v5.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v24 (ref)
        return v24;
    end, {
        v22.conversationId
    });
    local l_modal_layout_0 = v24.modal_layout;
    local v26 = v21[v24.modal_variant];
    local v27 = v10(v22.conversationId) and v26 ~= nil;
    local v28 = v14(v22.conversationId);
    local v29 = l_useDispatch_0();
    v11({
        modalSequence = l_ModalSequence_0.ConversationOverlay, 
        modalId = l_modal_layout_0.id, 
        modalVariant = v24.modal_variant, 
        actionToRecord = l_modal_layout_0.seen_record_action, 
        delayMs = v18, 
        canRecordAction = v27, 
        conversationId = v22.conversationId
    });
    v5.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v27 (copy), v22 (copy)
        if not v27 then
            v22.dismissModal();
        end;
    end, {
        v27
    });
    local v31 = v5.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v28 (copy), v24 (ref), v4 (ref), v3 (ref), v22 (copy), v29 (copy), v16 (ref)
        v28(v24.modal_layout.dismissed_record_action, v4.Constants.ModalSequence.ConversationOverlay, v24.modal_layout.id, v24.modal_variant):catch(function(v30) --[[ Line: 95 ]]
            -- upvalues: v3 (ref), v24 (ref)
            v3:warning((("Error in ConversationOverlayContainer %* -> RecordModalSequenceResponse: %*"):format(v24.modal_layout.id, (tostring(v30)))));
        end);
        v22.dismissModal();
        v29(v16(v4.Constants.ModalSequence.ConversationOverlay, v22.conversationId));
    end, {
        v22.conversationId, 
        v24.modal_layout.dismissed_record_action, 
        v24.modal_layout.id, 
        v24.modal_variant, 
        v28, 
        v29, 
        v22.dismissModal
    });
    if v27 then
        return v5.createElement(v26, {
            conversationId = v22.conversationId, 
            modalVariant = v24.modal_variant, 
            dismissModal = v31
        });
    else
        return nil;
    end;
end);