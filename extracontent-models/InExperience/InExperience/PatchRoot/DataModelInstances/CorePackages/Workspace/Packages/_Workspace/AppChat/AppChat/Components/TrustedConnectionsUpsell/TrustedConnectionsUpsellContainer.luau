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
local l_FFlagConnectionsToFriendsRename_0 = v14.FFlagConnectionsToFriendsRename;
local v26 = require(l_script_FirstAncestor_0.Flags.FIntUnfilteredThreadsPvDelayMs);
local v27 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = l_Container_0
};
local function v29(v28) --[[ Line: 61 ]]
    return {
        shouldOverrideNavigation = true, 
        onClosed = v28.onClosed, 
        isVerticallyConstrained = v28.isVerticallyConstrained, 
        userId = v28.userId
    };
end;
local v31 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = {
        component = l_Container_0, 
        mapProps = function(v30) --[[ Line: 72 ]] --[[ Name: mapProps ]]
            return {
                isVerticallyConstrained = v30.isVerticallyConstrained, 
                userId = v30.userId, 
                onClosed = v30.onClosed, 
                onAcknowledged = v30.onAcknowledged, 
                onRemovedTrustedConnection = v30.onRemovedTrustedConnection, 
                shouldOverrideNavigation = true
            };
        end
    }, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = {
        component = l_Container_0, 
        mapProps = v29
    }, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = {
        component = l_Container_0, 
        mapProps = v29
    }
};
return function(v32) --[[ Line: 104 ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v17 (copy), v21 (copy), v22 (copy), v6 (copy), v19 (copy), v16 (copy), v26 (copy), v15 (copy), v20 (copy), v5 (copy), v2 (copy), v18 (copy), v31 (copy), v27 (copy)
    local v33 = v9(v32.conversationId) or "";
    local v34 = v10();
    local v35 = l_useDispatch_0();
    local v36 = l_useNavigation_0();
    local v37 = l_useLocalization_0({
        toastText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved" or "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRemoved"
    });
    local l_modalVariant_0 = v32.modalVariant;
    local v39 = if l_FFlagAppChatEnableDoubleOptIn_0 then v17() else nil;
    local v40 = v21(v22.Context);
    v6.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v40 (copy), v19 (ref), l_modalVariant_0 (copy)
        v40.emit(v19.Events.ModalRendered, {
            modalVariant = l_modalVariant_0
        });
    end, {
        l_modalVariant_0
    });
    local v41 = v6.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v32 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v16 (ref), v26 (ref), v35 (copy), v15 (ref), v39 (copy)
        v32.dismissModal();
        if l_FFlagAppChatEnableDoubleOptIn_0 then
            v16.delay(v26 / 1000):andThen(function() --[[ Line: 128 ]]
                -- upvalues: v35 (ref), v15 (ref), v32 (ref), v39 (ref)
                v35(v15(v32.conversationId, v39));
            end);
        end;
    end, {
        v32.conversationId, 
        l_modalVariant_0, 
        v35, 
        v32.dismissModal, 
        v39
    });
    local v43 = v6.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v40 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v35 (copy), v5 (ref), v33 (copy), v2 (ref), v18 (ref), v37 (copy)
        v40.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.SecondaryCta
        });
        v35(v5.RemoveTC.API(v33)):andThen(function() --[[ Line: 148 ]]
            -- upvalues: v40 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref)
            v40.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Success
            });
        end):catch(function(v42) --[[ Line: 155 ]]
            -- upvalues: v40 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref), v2 (ref), v33 (ref)
            v40.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Failure
            });
            v2:warning((("Error removing trusted connection for user %*: %*"):format(v33, (tostring(v42)))));
        end);
        v18.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v37.toastText
        });
    end, {
        v41, 
        v36, 
        v35, 
        v33, 
        v40, 
        l_modalVariant_0
    });
    local v44 = v6.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v40 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v41 (copy)
        v40.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.PrimaryCta
        });
        v41();
    end, {
        v41, 
        v40, 
        l_modalVariant_0
    });
    local v45 = v6.useCallback(function() --[[ Line: 175 ]]
        -- upvalues: v40 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v41 (copy)
        v40.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.Dismiss
        });
        v41();
    end, {
        v41, 
        v40, 
        l_modalVariant_0
    });
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v46 = v31[l_modalVariant_0];
        if v46 then
            return v6.createElement(v46.component, v46.mapProps({
                isVerticallyConstrained = v34, 
                userId = v33, 
                onClosed = v45, 
                onAcknowledged = v44, 
                onRemovedTrustedConnection = v43
            }));
        end;
    else
        local v47 = v27[l_modalVariant_0];
        if v47 then
            return v6.createElement(v47, {
                isVerticallyConstrained = v34, 
                userId = v33, 
                onClosed = v45, 
                onAcknowledged = v44, 
                onRemovedTrustedConnection = v43, 
                shouldOverrideNavigation = true
            });
        end;
    end;
    return nil;
end;