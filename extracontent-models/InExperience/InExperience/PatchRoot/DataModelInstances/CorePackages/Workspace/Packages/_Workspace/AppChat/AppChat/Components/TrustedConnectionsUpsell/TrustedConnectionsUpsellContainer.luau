local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.TrustedContacts);
local l_ConversationOverlay_0 = v4.Constants.ConversationOverlay;
local v9 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v10 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVerticallyConstrained);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v13 = require(l_script_FirstAncestor_0.EnumScreens);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_Parent_0.SharedFlags);
local v16 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails);
local v17 = require(l_Parent_0.Promise);
local v18 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v19 = require(l_Parent_0.NotificationModalsManager);
local v20 = require(l_script_FirstAncestor_0.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry);
local v21 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v22 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v23 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local l_TrustedContactsUpsellModal_0 = v7.TrustedContactsUpsellModal;
local l_Container_0 = v7.TrustedContactsModal.Container;
local l_FFlagAppChatEnableDoubleOptIn_0 = v15.FFlagAppChatEnableDoubleOptIn;
local v27 = require(l_script_FirstAncestor_0.Flags.FIntUnfilteredThreadsPvDelayMs);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDeprecateOldTCModal);
local v29 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = if v28 then l_Container_0 else l_TrustedContactsUpsellModal_0
};
local function v31(v30) --[[ Line: 65 ]]
    return {
        shouldOverrideNavigation = true, 
        onClosed = v30.onClosed, 
        isVerticallyConstrained = v30.isVerticallyConstrained, 
        userId = v30.userId
    };
end;
local v33 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = {
        component = if v28 then l_Container_0 else l_TrustedContactsUpsellModal_0, 
        mapProps = function(v32) --[[ Line: 78 ]] --[[ Name: mapProps ]]
            return {
                isVerticallyConstrained = v32.isVerticallyConstrained, 
                userId = v32.userId, 
                onClosed = v32.onClosed, 
                onAcknowledged = v32.onAcknowledged, 
                onRemovedTrustedConnection = v32.onRemovedTrustedConnection, 
                shouldOverrideNavigation = true
            };
        end
    }, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = {
        component = l_Container_0, 
        mapProps = v31
    }, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = {
        component = l_Container_0, 
        mapProps = v31
    }
};
return function(v34) --[[ Line: 110 ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v18 (copy), v22 (copy), v23 (copy), v6 (copy), v20 (copy), v17 (copy), v27 (copy), v16 (copy), v21 (copy), v28 (copy), v5 (copy), v2 (copy), v19 (copy), v13 (copy), v33 (copy), v29 (copy)
    local v35 = v9(v34.conversationId) or "";
    local v36 = v10();
    local v37 = l_useDispatch_0();
    local v38 = l_useNavigation_0();
    local v39 = l_useLocalization_0({
        toastText = "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRemoved"
    });
    local l_modalVariant_0 = v34.modalVariant;
    local v41 = if l_FFlagAppChatEnableDoubleOptIn_0 then v18() else nil;
    local v42 = v22(v23.Context);
    v6.useEffect(function() --[[ Line: 122 ]]
        -- upvalues: v42 (copy), v20 (ref), l_modalVariant_0 (copy)
        v42.emit(v20.Events.ModalRendered, {
            modalVariant = l_modalVariant_0
        });
    end, {
        l_modalVariant_0
    });
    local v43 = v6.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v34 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v17 (ref), v27 (ref), v37 (copy), v16 (ref), v41 (copy)
        v34.dismissModal();
        if l_FFlagAppChatEnableDoubleOptIn_0 then
            v17.delay(v27 / 1000):andThen(function() --[[ Line: 132 ]]
                -- upvalues: v37 (ref), v16 (ref), v34 (ref), v41 (ref)
                v37(v16(v34.conversationId, v41));
            end);
        end;
    end, {
        v34.conversationId, 
        l_modalVariant_0, 
        v37, 
        v34.dismissModal, 
        v41
    });
    local v45 = v6.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: v42 (copy), v20 (ref), l_modalVariant_0 (copy), v21 (ref), v28 (ref), v43 (copy), v37 (copy), v5 (ref), v35 (copy), v2 (ref), v19 (ref), v39 (copy), v38 (copy), v13 (ref)
        v42.emit(v20.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v21.Enums.ModalActions.SecondaryCta
        });
        if not v28 then
            v43();
        end;
        v37(v5.RemoveTC.API(v35)):andThen(function() --[[ Line: 155 ]]
            -- upvalues: v42 (ref), v20 (ref), l_modalVariant_0 (ref), v21 (ref)
            v42.emit(v20.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v21.Enums.ModalActions.SecondaryCta, 
                actionResult = v21.Enums.ModalActionResults.Success
            });
        end):catch(function(v44) --[[ Line: 162 ]]
            -- upvalues: v42 (ref), v20 (ref), l_modalVariant_0 (ref), v21 (ref), v2 (ref), v35 (ref)
            v42.emit(v20.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v21.Enums.ModalActions.SecondaryCta, 
                actionResult = v21.Enums.ModalActionResults.Failure
            });
            v2:warning((("Error removing trusted connection for user %*: %*"):format(v35, (tostring(v44)))));
        end);
        if v28 then
            v19.SetUIBloxToast({
                sequenceNumber = DateTime.now().UnixTimestamp, 
                toastTitle = v39.toastText
            });
            return;
        else
            if v38 then
                v38.navigate(v13.RoactChatToast, {
                    toastProps = {
                        toastContent = {
                            toastTitle = v39.toastText
                        }, 
                        shouldHideIcon = true
                    }, 
                    isOverlay = true
                });
            end;
            return;
        end;
    end, {
        v43, 
        v38, 
        v37, 
        v35, 
        v42, 
        l_modalVariant_0
    });
    local v46 = v6.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v42 (copy), v20 (ref), l_modalVariant_0 (copy), v21 (ref), v43 (copy)
        v42.emit(v20.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v21.Enums.ModalActions.PrimaryCta
        });
        v43();
    end, {
        v43, 
        v42, 
        l_modalVariant_0
    });
    local v47 = v6.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v42 (copy), v20 (ref), l_modalVariant_0 (copy), v21 (ref), v43 (copy)
        v42.emit(v20.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v21.Enums.ModalActions.Dismiss
        });
        v43();
    end, {
        v43, 
        v42, 
        l_modalVariant_0
    });
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v48 = v33[l_modalVariant_0];
        if v48 then
            return v6.createElement(v48.component, v48.mapProps({
                isVerticallyConstrained = v36, 
                userId = v35, 
                onClosed = v47, 
                onAcknowledged = v46, 
                onRemovedTrustedConnection = v45
            }));
        end;
    else
        local v49 = v29[l_modalVariant_0];
        if v49 then
            return v6.createElement(v49, {
                isVerticallyConstrained = v36, 
                userId = v35, 
                onClosed = v47, 
                onAcknowledged = v46, 
                onRemovedTrustedConnection = v45, 
                shouldOverrideNavigation = true
            });
        end;
    end;
    return nil;
end;