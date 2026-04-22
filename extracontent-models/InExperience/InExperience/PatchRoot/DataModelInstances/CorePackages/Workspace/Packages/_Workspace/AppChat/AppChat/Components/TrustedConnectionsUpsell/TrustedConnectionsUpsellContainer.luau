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
local v23 = if v14.FFlagTCUnifyNavigationEntry then v7.TrustedFriendsModalEntry else v7.TrustedContactsModal.Container;
local l_FFlagAppChatEnableDoubleOptIn_0 = v14.FFlagAppChatEnableDoubleOptIn;
local l_FFlagConnectionsToFriendsRename_0 = v14.FFlagConnectionsToFriendsRename;
local l_FFlagTCModalUpdateButtons_0 = v14.FFlagTCModalUpdateButtons;
local v27 = require(l_script_FirstAncestor_0.Flags.FIntUnfilteredThreadsPvDelayMs);
local v28 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = v23
};
local function v30(v29) --[[ Line: 64 ]]
    return {
        shouldOverrideNavigation = true, 
        onClosed = v29.onClosed, 
        isVerticallyConstrained = v29.isVerticallyConstrained, 
        userId = v29.userId
    };
end;
local v32 = {
    [l_ConversationOverlay_0.TrustedConnectionCreated] = {
        component = v23, 
        mapProps = function(v31) --[[ Line: 75 ]] --[[ Name: mapProps ]]
            -- upvalues: l_FFlagTCModalUpdateButtons_0 (copy)
            return {
                isVerticallyConstrained = v31.isVerticallyConstrained, 
                userId = v31.userId, 
                onClosed = v31.onClosed, 
                onAcknowledged = v31.onAcknowledged, 
                onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v31.onRemovedTrustedConnection, 
                shouldOverrideNavigation = true
            };
        end
    }, 
    [l_ConversationOverlay_0.AddTrustedConnectionU18] = {
        component = v23, 
        mapProps = v30
    }, 
    [l_ConversationOverlay_0.TrustedConnectionRequestU18] = {
        component = v23, 
        mapProps = v30
    }
};
return function(v33) --[[ Line: 109 ]]
    -- upvalues: v9 (copy), v10 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v17 (copy), v21 (copy), v22 (copy), v6 (copy), v19 (copy), v16 (copy), v27 (copy), v15 (copy), v20 (copy), v5 (copy), v2 (copy), v18 (copy), v32 (copy), l_FFlagTCModalUpdateButtons_0 (copy), v28 (copy)
    local v34 = v9(v33.conversationId) or "";
    local v35 = v10();
    local v36 = l_useDispatch_0();
    local v37 = l_useNavigation_0();
    local v38 = l_useLocalization_0({
        toastText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved" or "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRemoved"
    });
    local l_modalVariant_0 = v33.modalVariant;
    local v40 = if l_FFlagAppChatEnableDoubleOptIn_0 then v17() else nil;
    local v41 = v21(v22.Context);
    v6.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v41 (copy), v19 (ref), l_modalVariant_0 (copy)
        v41.emit(v19.Events.ModalRendered, {
            modalVariant = l_modalVariant_0
        });
    end, {
        l_modalVariant_0
    });
    local v42 = v6.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v33 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v16 (ref), v27 (ref), v36 (copy), v15 (ref), v40 (copy)
        v33.dismissModal();
        if l_FFlagAppChatEnableDoubleOptIn_0 then
            v16.delay(v27 / 1000):andThen(function() --[[ Line: 133 ]]
                -- upvalues: v36 (ref), v15 (ref), v33 (ref), v40 (ref)
                v36(v15(v33.conversationId, v40));
            end);
        end;
    end, {
        v33.conversationId, 
        l_modalVariant_0, 
        v36, 
        v33.dismissModal, 
        v40
    });
    local v44 = v6.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v41 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v36 (copy), v5 (ref), v34 (copy), v2 (ref), v18 (ref), v38 (copy)
        v41.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.SecondaryCta
        });
        v36(v5.RemoveTC.API(v34)):andThen(function() --[[ Line: 153 ]]
            -- upvalues: v41 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref)
            v41.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Success
            });
        end):catch(function(v43) --[[ Line: 160 ]]
            -- upvalues: v41 (ref), v19 (ref), l_modalVariant_0 (ref), v20 (ref), v2 (ref), v34 (ref)
            v41.emit(v19.Events.ModalActionResult, {
                modalVariant = l_modalVariant_0, 
                action = v20.Enums.ModalActions.SecondaryCta, 
                actionResult = v20.Enums.ModalActionResults.Failure
            });
            v2:warning((("Error removing trusted connection for user %*: %*"):format(v34, (tostring(v43)))));
        end);
        v18.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v38.toastText
        });
    end, {
        v42, 
        v37, 
        v36, 
        v34, 
        v41, 
        l_modalVariant_0
    });
    local v45 = v6.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v41 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v42 (copy)
        v41.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.PrimaryCta
        });
        v42();
    end, {
        v42, 
        v41, 
        l_modalVariant_0
    });
    local v46 = v6.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v41 (copy), v19 (ref), l_modalVariant_0 (copy), v20 (ref), v42 (copy)
        v41.emit(v19.Events.ModalAction, {
            modalVariant = l_modalVariant_0, 
            action = v20.Enums.ModalActions.Dismiss
        });
        v42();
    end, {
        v42, 
        v41, 
        l_modalVariant_0
    });
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v47 = v32[l_modalVariant_0];
        if v47 then
            return v6.createElement(v47.component, v47.mapProps({
                isVerticallyConstrained = v35, 
                userId = v34, 
                onClosed = v46, 
                onAcknowledged = v45, 
                onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v44
            }));
        end;
    else
        local v48 = v28[l_modalVariant_0];
        if v48 then
            return v6.createElement(v48, {
                isVerticallyConstrained = v35, 
                userId = v34, 
                onClosed = v46, 
                onAcknowledged = v45, 
                onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v44, 
                shouldOverrideNavigation = true
            });
        end;
    end;
    return nil;
end;