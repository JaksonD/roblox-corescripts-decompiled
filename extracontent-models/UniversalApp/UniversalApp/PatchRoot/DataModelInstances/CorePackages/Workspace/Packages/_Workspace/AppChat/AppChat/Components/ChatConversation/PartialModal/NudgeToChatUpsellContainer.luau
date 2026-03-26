local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SocialUpsell);
local l_UpsellOverlay_0 = v5.UpsellOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v10 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = require(l_script_FirstAncestor_0.Utils.loadFoundationCloudAsset);
local v13 = require(l_script_FirstAncestor_0.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry);
local v14 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v15 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v16 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local l_startFacialAgeEstimation_0 = v5.Thunks.startFacialAgeEstimation;
local l_UpsellEntrySurfaceType_0 = v5.Analytics.Enum.UpsellEntrySurfaceType;
local l_SocialUpsellType_0 = v5.Enums.SocialUpsellType;
local v20 = v12("pictograms/chat_security");
return v4.memo(function(v21) --[[ Line: 35 ]] --[[ Name: NudgeToChatUpsellContainer ]]
    -- upvalues: l_useDispatch_0 (copy), v11 (copy), v15 (copy), v16 (copy), l_useSelector_0 (copy), v9 (copy), v10 (copy), v4 (copy), v13 (copy), l_UpsellEntrySurfaceType_0 (copy), v14 (copy), l_startFacialAgeEstimation_0 (copy), v5 (copy), l_UpsellOverlay_0 (copy), v20 (copy), l_SocialUpsellType_0 (copy)
    local v22 = l_useDispatch_0();
    local v23 = v11();
    local v24 = v15(v16.Context);
    local l_modalVariant_0 = v21.modalVariant;
    local l_modal_layout_0 = l_useSelector_0(function(v26) --[[ Line: 42 ]]
        -- upvalues: v9 (ref), v21 (copy), v10 (ref)
        return v9(v26, (("ChatAppReducer.Modals.conversationOverlays.%*"):format(v21.conversationId))) or v10.default;
    end).modal_layout;
    local v28 = l_modal_layout_0.header and l_modal_layout_0.header.text;
    local v29 = l_modal_layout_0.body and l_modal_layout_0.body.text;
    local v30 = l_modal_layout_0.buttons and l_modal_layout_0.buttons[1] and l_modal_layout_0.buttons[1].text;
    local v31 = l_modal_layout_0.buttons and l_modal_layout_0.buttons[1] and l_modal_layout_0.buttons[1].action;
    v4.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v24 (copy), v13 (ref), l_modalVariant_0 (copy)
        v24.emit(v13.Events.ModalRendered, {
            modalVariant = l_modalVariant_0
        });
    end, {
        v24, 
        l_modalVariant_0
    });
    local v32 = if v23 then l_UpsellEntrySurfaceType_0.PartyChatConversationInExperience else l_UpsellEntrySurfaceType_0.PartyChatConversationUA;
    local v33 = v4.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v24 (copy), v13 (ref), l_modalVariant_0 (copy), v14 (ref), v31 (copy), v22 (copy), l_startFacialAgeEstimation_0 (ref), v5 (ref), v32 (copy), v23 (copy), v21 (copy)
        v24.emit(v13.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v14.Enums.ModalActions.PrimaryCta
        });
        if v31 and v31.type == "open_fae_upsell" then
            v22(l_startFacialAgeEstimation_0(v5.Enums.SocialUpsellType.FacialAgeEstimation .. v32, nil, nil, v32, v23));
        end;
        v21.dismissModal();
    end, {
        v22, 
        v24, 
        l_modalVariant_0, 
        v31, 
        v32, 
        v23, 
        v21.dismissModal
    });
    local v34 = v4.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v24 (copy), v13 (ref), l_modalVariant_0 (copy), v14 (ref), v21 (copy)
        v24.emit(v13.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v14.Enums.ModalActions.Dismiss
        });
        v21.dismissModal();
    end, {
        v24, 
        l_modalVariant_0, 
        v21.dismissModal
    });
    return v4.createElement(l_UpsellOverlay_0, {
        title = v28, 
        bodyText = v29, 
        imageId = v20, 
        primaryAction = {
            text = v30, 
            onActivated = v33
        }, 
        onClose = v34, 
        upsellEntrySurface = v32, 
        upsellPurpose = l_SocialUpsellType_0.FacialAgeEstimation, 
        isInExperience = v23
    });
end);