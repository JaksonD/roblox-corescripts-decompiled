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
local v20 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = v13, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = if l_FFlagAppChatEnableDoubleOptIn_0 then v13 else nil, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = if l_FFlagAppChatEnableDoubleOptIn_0 then v13 else nil
};
return v5.memo(function(v21) --[[ Line: 49 ]]
    -- upvalues: l_useSelector_0 (copy), v8 (copy), v12 (copy), v5 (copy), v20 (copy), v10 (copy), v14 (copy), l_useDispatch_0 (copy), v11 (copy), l_ModalSequence_0 (copy), v18 (copy), v4 (copy), v3 (copy), v16 (copy)
    local v23 = l_useSelector_0(function(v22) --[[ Line: 51 ]]
        -- upvalues: v8 (ref), v21 (copy), v12 (ref)
        return v8(v22, (("ChatAppReducer.Modals.conversationOverlays.%*"):format(v21.conversationId))) or v12.default;
    end);
    v23 = v5.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v23 (ref)
        return v23;
    end, {
        v21.conversationId
    });
    local l_modal_layout_0 = v23.modal_layout;
    local v25 = v20[v23.modal_variant];
    local v26 = v10(v21.conversationId) and v25 ~= nil;
    local v27 = v14(v21.conversationId);
    local v28 = l_useDispatch_0();
    v11({
        modalSequence = l_ModalSequence_0.ConversationOverlay, 
        modalId = l_modal_layout_0.id, 
        modalVariant = v23.modal_variant, 
        actionToRecord = l_modal_layout_0.seen_record_action, 
        delayMs = v18, 
        canRecordAction = v26, 
        conversationId = v21.conversationId
    });
    v5.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v26 (copy), v21 (copy)
        if not v26 then
            v21.dismissModal();
        end;
    end, {
        v26
    });
    local v30 = v5.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v27 (copy), v23 (ref), v4 (ref), v3 (ref), v21 (copy), v28 (copy), v16 (ref)
        v27(v23.modal_layout.dismissed_record_action, v4.Constants.ModalSequence.ConversationOverlay, v23.modal_layout.id, v23.modal_variant):catch(function(v29) --[[ Line: 89 ]]
            -- upvalues: v3 (ref), v23 (ref)
            v3:warning((("Error in ConversationOverlayContainer %* -> RecordModalSequenceResponse: %*"):format(v23.modal_layout.id, (tostring(v29)))));
        end);
        v21.dismissModal();
        v28(v16(v4.Constants.ModalSequence.ConversationOverlay, v21.conversationId));
    end, {
        v21.conversationId, 
        v23.modal_layout.dismissed_record_action, 
        v23.modal_layout.id, 
        v23.modal_variant, 
        v27, 
        v28, 
        v21.dismissModal
    });
    if v26 then
        return v5.createElement(v25, {
            conversationId = v21.conversationId, 
            modalVariant = v23.modal_variant, 
            dismissModal = v30
        });
    else
        return nil;
    end;
end);