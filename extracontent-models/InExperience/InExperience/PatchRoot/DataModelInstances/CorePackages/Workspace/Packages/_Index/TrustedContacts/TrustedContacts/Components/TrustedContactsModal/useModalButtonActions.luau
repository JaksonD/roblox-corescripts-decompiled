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
local l_FFlagTCUnifyNavigationEntry_0 = require(l_Parent_0.SharedFlags).FFlagTCUnifyNavigationEntry;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_Parent_0.SharedFlags).FFlagTCUpdateProfileCTAButton;
local l_FFlagTCModalUpdateButtons_0 = require(l_Parent_0.SharedFlags).FFlagTCModalUpdateButtons;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v24 = v3.TrustedConnections.TrustedConnectionsStore.get();
return function(v25, v26, v27, v28) --[[ Line: 56 ]] --[[ Name: useModalButtonActions ]]
    -- upvalues: l_FFlagTCVerifiedParentalControl_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useTCAnalytics_0 (copy), l_FFlagTCModalUpdateButtons_0 (copy), v2 (copy), l_EventNames_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_AppPage_0 (copy), v6 (copy), l_TrustedConnectionStatus_0 (copy), v24 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), l_Sources_0 (copy), l_Contexts_0 (copy), l_default_0 (copy)
    local v29 = if l_FFlagTCVerifiedParentalControl_0 then l_useNavigation_0() else nil;
    local v31 = l_useAppPolicy_0(function(v30) --[[ Line: 63 ]]
        return v30.getShareSheetEnabled();
    end);
    local v32 = "";
    local v33 = v12.Hooks.useUserProfilesFetch({
        userIds = {
            v25
        }, 
        query = v12.Queries.userProfilesCombinedNameByUserIds
    });
    if v33 and v33.data then
        v32 = v12.Selectors.getCombinedNameFromId(v33.data, v25) or "";
    end;
    local v34 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent" or "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow" or "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v32
        }, 
        linkCopiedToast = "Feature.Catalog.Toast.LinkCopied"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v25, 
        modalVariant = v27, 
        source = v26
    }).fireAnalyticsEvent;
    local v36 = if l_FFlagTCModalUpdateButtons_0 then nil else v2.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v28.onAcknowledged then
            v28.onAcknowledged();
        end;
        v28.closeModal();
    end, {
        v28.closeModal, 
        v28.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v37 = if l_FFlagTCModalUpdateButtons_0 then v2.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsModalOkClicked);
        if v28.onAcknowledged then
            v28.onAcknowledged();
        end;
        v28.closeModal();
    end, {
        v28.closeModal, 
        v28.onAcknowledged, 
        l_fireAnalyticsEvent_0
    }) else nil;
    local v38 = if l_FFlagTCModalUpdateButtons_0 then nil else v2.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v28.onRemovedTrustedConnection then
            v28.onRemovedTrustedConnection();
        end;
        v28.closeModal();
    end, {
        v28.closeModal, 
        v28.onRemovedTrustedConnection, 
        l_fireAnalyticsEvent_0
    });
    local v40 = if l_FFlagTCVerifiedParentalControl_0 then v2.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v28 (copy), l_FFlagTCUnifyNavigationEntry_0 (ref), v29 (copy), l_AppPage_0 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCPrologueOpened);
        local v39 = nil;
        if l_FFlagTCUpdateProfileCTAButton_0 then
            if v28.onRequestSent then
                v39 = v28.onRequestSent;
            elseif v28.onRequestAccepted then
                v39 = v28.onRequestAccepted;
            end;
        end;
        if l_FFlagTCUnifyNavigationEntry_0 then
            v29.replace(l_AppPage_0.TrustedFriendsVPCPrologue, {
                userId = v25, 
                completionCallback = v39
            });
            return;
        else
            v28.closeModal();
            v29.push(l_AppPage_0.TrustedFriendsVPCPrologue, {
                userId = v25, 
                completionCallback = v39
            });
            return;
        end;
    end, {
        v28.closeModal, 
        l_fireAnalyticsEvent_0, 
        v29, 
        v25, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v28.onRequestSent else nil, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v28.onRequestAccepted else nil
    }) else nil;
    local v41 = v2.useCallback(function() --[[ Line: 166 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v28 (copy), v34 (copy), v6 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
        if l_FFlagTCUnifyNavigationEntry_0 then
            v28.showToast(v34.isATrustedConnectionNowToast);
            return;
        else
            v6.SetUIBloxToast({
                sequenceNumber = DateTime.now().UnixTimestamp, 
                toastTitle = v34.isATrustedConnectionNowToast
            });
            return;
        end;
    end, {
        v34.isATrustedConnectionNowToast, 
        l_fireAnalyticsEvent_0, 
        if l_FFlagTCUnifyNavigationEntry_0 then v28.showToast else nil
    });
    local v43 = v2.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v27 (copy), l_TrustedConnectionStatus_0 (ref), v24 (ref), v25 (copy), v41 (copy), v28 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref), l_Sources_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v34 (copy), v6 (ref)
        if v27 == l_TrustedConnectionStatus_0.RequestReceived then
            v24.acceptTrustedConnectionRequest(v25):andThen(function() --[[ Line: 190 ]]
                -- upvalues: v41 (ref)
                v41();
            end):andThen(function() --[[ Line: 193 ]]
                -- upvalues: v28 (ref)
                return v28.onRequestAccepted and v28.onRequestAccepted();
            end):andThen(function() --[[ Line: 196 ]]
                -- upvalues: v28 (ref)
                v28.closeModal();
            end):catch(function() --[[ Line: 199 ]]
                -- upvalues: v28 (ref)
                v28.showGenericErrorModal();
            end);
            return;
        elseif l_FFlagTCShareLinkReceiverUI_0 and v27 == l_Sources_0.ShareLinkReceiver then
            v24.addTrustedFriendFromLink(v25, v28.tokens or {}):andThen(function() --[[ Line: 204 ]]
                -- upvalues: v41 (ref)
                v41();
            end):andThen(l_FFlagTCUpdateProfileCTAButton_0 and function() --[[ Line: 208 ]]
                -- upvalues: v28 (ref)
                return v28.onRequestAccepted and v28.onRequestAccepted();
            end or nil):andThen(function() --[[ Line: 212 ]]
                -- upvalues: v28 (ref)
                v28.closeModal();
            end):catch(function() --[[ Line: 215 ]]
                -- upvalues: v28 (ref)
                v28.showGenericErrorModal();
            end);
            return;
        else
            v24.sendTrustedConnectionRequest(v25, v28.sentFromQrCode and "qr" or nil):andThen(function() --[[ Line: 223 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v28 (ref), v34 (ref), v6 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                if l_FFlagTCUnifyNavigationEntry_0 then
                    v28.showToast(v34.trustedConnectionRequestSentToast);
                    return;
                else
                    v6.SetUIBloxToast({
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        toastTitle = v34.trustedConnectionRequestSentToast
                    });
                    return;
                end;
            end):andThen(function() --[[ Line: 234 ]]
                -- upvalues: v28 (ref)
                return v28.onRequestSent and v28.onRequestSent();
            end):andThen(function() --[[ Line: 237 ]]
                -- upvalues: v28 (ref)
                v28.closeModal();
            end):catch(function(_) --[[ Line: 240 ]]
                -- upvalues: v28 (ref)
                v28.showGenericErrorModal();
            end);
            return;
        end;
    end, {
        v28.closeModal, 
        v25, 
        v34, 
        v28.onRequestSent, 
        v28.onRequestAccepted, 
        v28.tokens, 
        if l_FFlagTCVerifiedParentalControl_0 then nil else v28.sentFromQrCode and "qr" or nil, 
        l_fireAnalyticsEvent_0, 
        if l_FFlagTCUnifyNavigationEntry_0 then v28.showToast else nil
    });
    local v44 = v2.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v28 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v28.closeModal();
    end, {
        v28.closeModal, 
        l_fireAnalyticsEvent_0
    });
    local v46 = v2.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (ref), v25 (copy), l_FFlagTCUnifyNavigationEntry_0 (ref), v28 (copy), l_Contexts_0 (ref), l_default_0 (ref), v31 (copy), v34 (copy), v6 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddViaLinkClicked);
        v24.createTrustedFriendLink(v25):andThen(function(v45) --[[ Line: 271 ]]
            -- upvalues: l_FFlagTCUnifyNavigationEntry_0 (ref), v28 (ref), l_Contexts_0 (ref), l_default_0 (ref)
            if l_FFlagTCUnifyNavigationEntry_0 then
                v28.shareUrl({
                    url = v45.responseBody.link, 
                    context = l_Contexts_0.TCUpsellModal
                });
                return;
            else
                l_default_0:shareUrl({
                    url = v45.responseBody.link, 
                    context = l_Contexts_0.TCUpsellModal
                });
                return;
            end;
        end):andThen(function() --[[ Line: 284 ]]
            -- upvalues: v28 (ref)
            return v28.onRequestSent and v28.onRequestSent();
        end):andThen(function() --[[ Line: 287 ]]
            -- upvalues: v31 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v28 (ref), v34 (ref), v6 (ref)
            if not v31 then
                if l_FFlagTCUnifyNavigationEntry_0 then
                    v28.showToast(v34.linkCopiedToast);
                else
                    v6.SetUIBloxToast({
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        toastTitle = v34.linkCopiedToast
                    });
                end;
            end;
            v28.closeModal();
        end):catch(function() --[[ Line: 300 ]]
            -- upvalues: v28 (ref)
            v28.showGenericErrorModal();
            v28.closeModal();
        end);
    end, {
        v28.closeModal, 
        v28.showGenericErrorModal, 
        l_fireAnalyticsEvent_0, 
        v25, 
        v34, 
        v31, 
        if l_FFlagTCUnifyNavigationEntry_0 then v28.shareUrl else nil, 
        if l_FFlagTCUnifyNavigationEntry_0 then v28.showToast else nil
    });
    local v47 = v2.useMemo(function() --[[ Line: 318 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v43 (copy), v44 (copy), l_FFlagTCModalUpdateButtons_0 (ref), v37 (copy), v36 (copy), v38 (copy), l_Sources_0 (ref), v46 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v43, 
                secondary = v44
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v43, 
                secondary = v44
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = if l_FFlagTCModalUpdateButtons_0 then {
                primary = v37
            } else {
                primary = v36, 
                secondary = v38
            }, 
            [l_Sources_0.ShareLinkSender] = {
                primary = v46
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                primary = v43, 
                secondary = v44
            } else nil
        };
    end, {
        v43, 
        v44, 
        if l_FFlagTCModalUpdateButtons_0 then nil else v36, 
        if l_FFlagTCModalUpdateButtons_0 then v37 else nil, 
        if l_FFlagTCModalUpdateButtons_0 then nil else v38, 
        v46, 
        if l_FFlagTCVerifiedParentalControl_0 then v40 else nil
    })[v27];
    if l_FFlagTCVerifiedParentalControl_0 and v28.isVPCFlow and v47 then
        v47.primary = v40;
    end;
    return v47;
end;