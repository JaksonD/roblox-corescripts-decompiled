local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.DataHydration);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_Parent_0.NotificationModalsManager);
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v12 = require(l_Parent_0.UserProfiles);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v14.useTCAnalytics;
local l_EventNames_0 = v14.EventNames;
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_Parent_0.SharedFlags).FFlagTCUpdateProfileCTAButton;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v21 = v3.TrustedConnections.TrustedConnectionsStore.get();
return function(v22, v23, v24, v25) --[[ Line: 49 ]] --[[ Name: useModalButtonActions ]]
    -- upvalues: l_FFlagTCVerifiedParentalControl_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useTCAnalytics_0 (copy), v2 (copy), l_EventNames_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_AppPage_0 (copy), v6 (copy), l_TrustedConnectionStatus_0 (copy), v21 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), l_Sources_0 (copy), l_default_0 (copy), l_Contexts_0 (copy)
    local v26 = if l_FFlagTCVerifiedParentalControl_0 then l_useNavigation_0() else nil;
    local v28 = l_useAppPolicy_0(function(v27) --[[ Line: 56 ]]
        return v27.getShareSheetEnabled();
    end);
    local v29 = "";
    local v30 = v12.Hooks.useUserProfilesFetch({
        userIds = {
            v22
        }, 
        query = v12.Queries.userProfilesCombinedNameByUserIds
    });
    if v30 and v30.data then
        v29 = v12.Selectors.getCombinedNameFromId(v30.data, v22) or "";
    end;
    local v31 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent" or "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow" or "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v29
        }, 
        linkCopiedToast = "Feature.Catalog.Toast.LinkCopied"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v22, 
        modalVariant = v24, 
        source = v23
    }).fireAnalyticsEvent;
    local v33 = v2.useCallback(function() --[[ Line: 90 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v25.onAcknowledged then
            v25.onAcknowledged();
        end;
        v25.closeModal();
    end, {
        v25.closeModal, 
        v25.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v34 = v2.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v25.onRemovedTrustedConnection then
            v25.onRemovedTrustedConnection();
        end;
        v25.closeModal();
    end, {
        v25.closeModal, 
        v25.onRemovedTrustedConnection, 
        l_fireAnalyticsEvent_0
    });
    local v36 = if l_FFlagTCVerifiedParentalControl_0 then v2.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v25 (copy), v26 (copy), l_AppPage_0 (ref), v22 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCPrologueOpened);
        local v35 = nil;
        if l_FFlagTCUpdateProfileCTAButton_0 then
            if v25.onRequestSent then
                v35 = v25.onRequestSent;
            elseif v25.onRequestAccepted then
                v35 = v25.onRequestAccepted;
            end;
        end;
        v25.closeModal();
        v26.push(l_AppPage_0.TrustedFriendsVPCPrologue, {
            userId = v22, 
            completionCallback = v35
        });
    end, {
        v25.closeModal, 
        l_fireAnalyticsEvent_0, 
        v26, 
        v22, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v25.onRequestSent else nil, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v25.onRequestAccepted else nil
    }) else nil;
    local v37 = v2.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v6 (ref), v31 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
        v6.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v31.isATrustedConnectionNowToast
        });
    end, {
        v31.isATrustedConnectionNowToast, 
        l_fireAnalyticsEvent_0
    });
    local v39 = v2.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v24 (copy), l_TrustedConnectionStatus_0 (ref), v21 (ref), v22 (copy), v37 (copy), v25 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref), l_Sources_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v6 (ref), v31 (copy)
        if v24 == l_TrustedConnectionStatus_0.RequestReceived then
            v21.acceptTrustedConnectionRequest(v22):andThen(function() --[[ Line: 151 ]]
                -- upvalues: v37 (ref)
                v37();
            end):andThen(function() --[[ Line: 154 ]]
                -- upvalues: v25 (ref)
                return v25.onRequestAccepted and v25.onRequestAccepted();
            end):andThen(function() --[[ Line: 157 ]]
                -- upvalues: v25 (ref)
                v25.closeModal();
            end):catch(function() --[[ Line: 160 ]]
                -- upvalues: v25 (ref)
                v25.showGenericErrorModal();
            end);
            return;
        elseif l_FFlagTCShareLinkReceiverUI_0 and v24 == l_Sources_0.ShareLinkReceiver then
            v21.addTrustedFriendFromLink(v22, v25.tokens or {}):andThen(function() --[[ Line: 165 ]]
                -- upvalues: v37 (ref)
                v37();
            end):andThen(l_FFlagTCUpdateProfileCTAButton_0 and function() --[[ Line: 169 ]]
                -- upvalues: v25 (ref)
                return v25.onRequestAccepted and v25.onRequestAccepted();
            end or nil):andThen(function() --[[ Line: 173 ]]
                -- upvalues: v25 (ref)
                v25.closeModal();
            end):catch(function() --[[ Line: 176 ]]
                -- upvalues: v25 (ref)
                v25.showGenericErrorModal();
            end);
            return;
        else
            v21.sendTrustedConnectionRequest(v22, v25.sentFromQrCode and "qr" or nil):andThen(function() --[[ Line: 184 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v6 (ref), v31 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                v6.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v31.trustedConnectionRequestSentToast
                });
            end):andThen(function() --[[ Line: 191 ]]
                -- upvalues: v25 (ref)
                return v25.onRequestSent and v25.onRequestSent();
            end):andThen(function() --[[ Line: 194 ]]
                -- upvalues: v25 (ref)
                v25.closeModal();
            end):catch(function(_) --[[ Line: 197 ]]
                -- upvalues: v25 (ref)
                v25.showGenericErrorModal();
            end);
            return;
        end;
    end, {
        v25.closeModal, 
        v22, 
        v31, 
        v25.onRequestSent, 
        v25.onRequestAccepted, 
        v25.tokens, 
        if l_FFlagTCVerifiedParentalControl_0 then nil else v25.sentFromQrCode and "qr" or nil, 
        l_fireAnalyticsEvent_0
    });
    local v40 = v2.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v25.closeModal();
    end, {
        v25.closeModal, 
        l_fireAnalyticsEvent_0
    });
    local v42 = v2.useCallback(function() --[[ Line: 224 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v21 (ref), v22 (copy), l_default_0 (ref), l_Contexts_0 (ref), v25 (copy), v28 (copy), v6 (ref), v31 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddViaLinkClicked);
        v21.createTrustedFriendLink(v22):andThen(function(v41) --[[ Line: 227 ]]
            -- upvalues: l_default_0 (ref), l_Contexts_0 (ref)
            l_default_0:shareUrl({
                url = v41.responseBody.link, 
                context = l_Contexts_0.TCUpsellModal
            });
        end):andThen(function() --[[ Line: 233 ]]
            -- upvalues: v25 (ref)
            return v25.onRequestSent and v25.onRequestSent();
        end):andThen(function() --[[ Line: 236 ]]
            -- upvalues: v28 (ref), v6 (ref), v31 (ref), v25 (ref)
            if not v28 then
                v6.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v31.linkCopiedToast
                });
            end;
            v25.closeModal();
        end):catch(function() --[[ Line: 245 ]]
            -- upvalues: v25 (ref)
            v25.showGenericErrorModal();
            v25.closeModal();
        end);
    end, {
        v25.closeModal, 
        v25.showGenericErrorModal, 
        l_fireAnalyticsEvent_0, 
        v22, 
        v31, 
        v28
    });
    local v43 = v2.useMemo(function() --[[ Line: 261 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v39 (copy), v40 (copy), v33 (copy), v34 (copy), l_Sources_0 (ref), v42 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v39, 
                secondary = v40
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v39, 
                secondary = v40
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                primary = v33, 
                secondary = v34
            }, 
            [l_Sources_0.ShareLinkSender] = {
                primary = v42
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                primary = v39, 
                secondary = v40
            } else nil
        };
    end, {
        v39, 
        v40, 
        v33, 
        v34, 
        v42, 
        if l_FFlagTCVerifiedParentalControl_0 then v36 else nil
    })[v24];
    if l_FFlagTCVerifiedParentalControl_0 and v25.isVPCFlow and v43 then
        v43.primary = v36;
    end;
    return v43;
end;