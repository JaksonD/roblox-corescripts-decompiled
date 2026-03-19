local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.AppChatNetworking);
local l_ConversationTopModal_0 = v7.Constants.ConversationTopModal;
local v9 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v12 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSeenWithDelay);
local l_ModalSequence_0 = v7.Constants.ModalSequence;
local v14 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v16 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedChatModal);
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsGuiInChatVisible);
local v18 = require(script.Parent.ConversationBanner.ConversationBannerContainer);
local v19 = require(l_script_FirstAncestor_0.Flags.FIntAppChatModalSeenImpressionDelayMs);
local v21 = {
    setModalHeight = function(_) --[[ Line: 34 ]] --[[ Name: setModalHeight ]]

    end
};
local v22 = {
    [l_ConversationTopModal_0.AddTrustedConnection] = v18, 
    [l_ConversationTopModal_0.TrustedConnectionRequest] = v18
};
return v6.memo(function(v23) --[[ Line: 43 ]] --[[ Name: ConversationTopModalContainer ]]
    -- upvalues: v5 (copy), v21 (copy), l_useSelector_0 (copy), v11 (copy), v9 (copy), v22 (copy), l_useDispatch_0 (copy), v14 (copy), v6 (copy), v17 (copy), v12 (copy), l_ModalSequence_0 (copy), v19 (copy), v2 (copy), v16 (copy), v7 (copy), l_ConversationTopModal_0 (copy), v3 (copy)
    local v24 = v5.Dictionary.union(v21, v23);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 46 ]]
        -- upvalues: v11 (ref), v24 (copy), v9 (ref)
        return v11(v25, (("ChatAppReducer.Modals.conversationTopModals.%*"):format(v24.conversationId))) or v9.default;
    end);
    local l_modal_layout_0 = v26.modal_layout;
    local v28 = v22[v26.modal_variant];
    local v29 = l_useDispatch_0();
    local v30 = v14(v24.conversationId);
    local v31 = v6.useRef(nil);
    local v32 = v17(v31, {
        v31.current, 
        v28
    });
    v12({
        modalSequence = l_ModalSequence_0.ConversationTopModal, 
        modalVariant = v26.modal_variant, 
        actionToRecord = l_modal_layout_0.seen_record_action, 
        delayMs = v19, 
        canRecordAction = v32 and v28 ~= nil, 
        conversationId = v24.conversationId
    });
    local v34 = v6.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v30 (copy), v26 (copy), l_ModalSequence_0 (ref), v2 (ref), v29 (copy), v16 (ref), v7 (ref), v24 (copy)
        v30(v26.modal_layout.dismissed_record_action, l_ModalSequence_0.ConversationTopModal, nil, v26.modal_variant):catch(function(v33) --[[ Line: 74 ]]
            -- upvalues: v2 (ref), v26 (ref)
            v2:warning((("Error in ConversationOverlayContainer %* -> RecordModalSequenceResponse: %*"):format(v26.modal_layout.id, (tostring(v33)))));
        end);
        v29(v16(v7.Constants.ModalSequence.ConversationTopModal, v24.conversationId));
    end, {
        v24.conversationId, 
        v26.modal_layout.dismissed_record_action, 
        v26.modal_variant, 
        v30, 
        v29
    });
    local v36 = v6.useCallback(function(v35) --[[ Line: 94 ]]
        -- upvalues: v24 (copy)
        v24.setModalHeight(v35.AbsoluteSize.Y);
    end, {
        v24.setModalHeight
    });
    local v37 = nil;
    if v28 then
        v37 = v6.createElement(v28, {
            conversationId = v24.conversationId, 
            modalVariant = v26.modal_variant, 
            onDismissed = v34, 
            bodyText = l_modal_layout_0.body and l_modal_layout_0.body.text, 
            actionText = l_modal_layout_0.buttons and l_modal_layout_0.buttons[1] and l_modal_layout_0.buttons[1].text
        });
    elseif v26.modal_variant ~= nil and v26.modal_variant ~= l_ConversationTopModal_0.None then
        v2:warning((("Unsupported ConversationTopModal variant: %*"):format(v26.modal_variant)));
    end;
    return v6.createElement(v3.View, {
        LayoutOrder = v24.layoutOrder, 
        onAbsoluteSizeChanged = v36, 
        ref = v31, 
        tag = "gui-objects-default auto-y size-full-0"
    }, {
        conversationTopModal = v37
    });
end);