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
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_Parent_0.SharedFlags);
local v15 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails);
local v16 = require(l_Parent_0.Promise);
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v18 = require(l_Parent_0.NotificationModalsManager);
local v19 = require(l_script_FirstAncestor_0.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry);
local v20 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v21 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v22 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local l_Container_0 = v7.TrustedContactsModal.Container;
local l_FFlagAppChatEnableDoubleOptIn_0 = v14.FFlagAppChatEnableDoubleOptIn;
local v25 = require(l_script_FirstAncestor_0.Flags.FIntUnfilteredThreadsPvDelayMs);
local v26 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = l_Container_0
};
local function v28(v27) --[[ Line: 60 ]]
    return {
        shouldOverrideNavigation = true, 
        onClosed = v27.onClosed, 
        isVerticallyConstrained = v27.isVerticallyConstrained, 
        userId = v27.userId
    };
end;
local v30 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = {
        component = l_Container_0, 
        mapProps = function(v29) --[[ Line: 71 ]] --[[ Name: mapProps ]]
            return {
                isVerticallyConstrained = v29.isVerticallyConstrained, 
                userId = v29.userId, 
                onClosed = v29.onClosed, 
                onAcknowledged = v29.onAcknowledged, 
                onRemovedTrustedConnection = v29.onRemovedTrustedConnection, 
                shouldOverrideNavigation = true
            };
        end
    }, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = {
        component = l_Container_0, 
        mapProps = v28
    }, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = {
        component = l_Container_0, 
        mapProps = v28
    }
};
return function(v31) --[[ Line: 103 ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v17 (copy), v21 (copy), v22 (copy), v6 (copy), v19 (copy), v16 (copy), v25 (copy), v15 (copy), v20 (copy), v5 (copy), v2 (copy), v18 (copy), v30 (copy), v26 (copy)
    local v32 = v9(v31.conversationId) or "";
    local v33 = v10();
    local v34 = l_useDispatch_0();
    local v35 = l_useNavigation_0();
    local v36 = l_useLocalization_0({
        toastText = "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRemoved"
    });
    local l_modalVariant_0 = v31.modalVariant;
    local v38 = if l_FFlagAppChatEnableDoubleOptIn_0 then v17() else nil;
    local v39 = v21(v22.Context);
    v6.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v39 (copy), v19 (ref), l_modalVariant_0 (copy)
        v39.emit(v19.Events.ModalRendered, {
            modalVariant = l_modalVariant_0
        });
    end, {
        l_modalVariant_0
    });
    local v40 = v6.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v31 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v16 (ref), v25 (ref), v34 (copy), v15 (ref), v38 (copy)
        v31.dismissModal();
        if l_FFlagAppChatEnableDoubleOptIn_0 then
            v16.delay(v25 / 1000):andThen(function() --[[ Line: 125 ]]
                -- upvalues: v34 (ref), v15 (ref), v31 (ref), v38 (ref)
                v34(v15(v31.conversationId, v38));
            end);
        end;
    end, {
        v31.conversationId, 
        l_modalVariant_0, 
        v34, 
        v31.dismissModal, 
        v38
    });
    local v42 = v6.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v39 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v34 (copy), v5 (ref), v32 (copy), v2 (ref), v18 (ref), v36 (copy)
        v39.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.SecondaryCta
        });
        v34(v5.RemoveTC.API(v32)):andThen(function() --[[ Line: 145 ]]
            -- upvalues: v39 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref)
            v39.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Success
            });
        end):catch(function(v41) --[[ Line: 152 ]]
            -- upvalues: v39 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref), v2 (ref), v32 (ref)
            v39.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Failure
            });
            v2:warning((("Error removing trusted connection for user %*: %*"):format(v32, (tostring(v41)))));
        end);
        v18.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v36.toastText
        });
    end, {
        v40, 
        v35, 
        v34, 
        v32, 
        v39, 
        l_modalVariant_0
    });
    local v43 = v6.useCallback(function() --[[ Line: 165 ]]
        -- upvalues: v39 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v40 (copy)
        v39.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.PrimaryCta
        });
        v40();
    end, {
        v40, 
        v39, 
        l_modalVariant_0
    });
    local v44 = v6.useCallback(function() --[[ Line: 172 ]]
        -- upvalues: v39 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v40 (copy)
        v39.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.Dismiss
        });
        v40();
    end, {
        v40, 
        v39, 
        l_modalVariant_0
    });
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v45 = v30[l_modalVariant_0];
        if v45 then
            return v6.createElement(v45.component, v45.mapProps({
                isVerticallyConstrained = v33, 
                userId = v32, 
                onClosed = v44, 
                onAcknowledged = v43, 
                onRemovedTrustedConnection = v42
            }));
        end;
    else
        local v46 = v26[l_modalVariant_0];
        if v46 then
            return v6.createElement(v46, {
                isVerticallyConstrained = v33, 
                userId = v32, 
                onClosed = v44, 
                onAcknowledged = v43, 
                onRemovedTrustedConnection = v42, 
                shouldOverrideNavigation = true
            });
        end;
    end;
    return nil;
end;