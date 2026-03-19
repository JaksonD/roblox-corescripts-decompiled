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
local v20 = v3.TrustedConnections.TrustedConnectionsStore.get();
return function(v21, v22, v23, v24) --[[ Line: 48 ]] --[[ Name: useModalButtonActions ]]
    -- upvalues: l_FFlagTCVerifiedParentalControl_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_useTCAnalytics_0 (copy), v2 (copy), l_EventNames_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), l_AppPage_0 (copy), v6 (copy), l_TrustedConnectionStatus_0 (copy), v20 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), l_Sources_0 (copy), l_default_0 (copy), l_Contexts_0 (copy)
    local v25 = if l_FFlagTCVerifiedParentalControl_0 then l_useNavigation_0() else nil;
    local v27 = l_useAppPolicy_0(function(v26) --[[ Line: 55 ]]
        return v26.getShareSheetEnabled();
    end);
    local v28 = "";
    local v29 = v12.Hooks.useUserProfilesFetch({
        userIds = {
            v21
        }, 
        query = v12.Queries.userProfilesCombinedNameByUserIds
    });
    if v29 and v29.data then
        v28 = v12.Selectors.getCombinedNameFromId(v29.data, v21) or "";
    end;
    local v30 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = {
            "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v28
        }, 
        linkCopiedToast = "Feature.Catalog.Toast.LinkCopied"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v21, 
        modalVariant = v23, 
        source = v22
    }).fireAnalyticsEvent;
    local v32 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v24.onAcknowledged then
            v24.onAcknowledged();
        end;
        v24.closeModal();
    end, {
        v24.closeModal, 
        v24.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v33 = v2.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v24.onRemovedTrustedConnection then
            v24.onRemovedTrustedConnection();
        end;
        v24.closeModal();
    end, {
        v24.closeModal, 
        v24.onRemovedTrustedConnection, 
        l_fireAnalyticsEvent_0
    });
    local v35 = if l_FFlagTCVerifiedParentalControl_0 then v2.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), v24 (copy), v25 (copy), l_AppPage_0 (ref), v21 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TrustedFriendsVPCPrologueOpened);
        local v34 = nil;
        if l_FFlagTCUpdateProfileCTAButton_0 then
            if v24.onRequestSent then
                v34 = v24.onRequestSent;
            elseif v24.onRequestAccepted then
                v34 = v24.onRequestAccepted;
            end;
        end;
        v24.closeModal();
        v25.push(l_AppPage_0.TrustedFriendsVPCPrologue, {
            userId = v21, 
            completionCallback = v34
        });
    end, {
        v24.closeModal, 
        l_fireAnalyticsEvent_0, 
        v25, 
        v21, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v24.onRequestSent else nil, 
        if l_FFlagTCUpdateProfileCTAButton_0 then v24.onRequestAccepted else nil
    }) else nil;
    local v36 = v2.useCallback(function() --[[ Line: 132 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v6 (ref), v30 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
        v6.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v30.isATrustedConnectionNowToast
        });
    end, {
        v30.isATrustedConnectionNowToast, 
        l_fireAnalyticsEvent_0
    });
    local v38 = v2.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v23 (copy), l_TrustedConnectionStatus_0 (ref), v20 (ref), v21 (copy), v36 (copy), v24 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref), l_Sources_0 (ref), l_FFlagTCUpdateProfileCTAButton_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v6 (ref), v30 (copy)
        if v23 == l_TrustedConnectionStatus_0.RequestReceived then
            v20.acceptTrustedConnectionRequest(v21):andThen(function() --[[ Line: 146 ]]
                -- upvalues: v36 (ref)
                v36();
            end):andThen(function() --[[ Line: 149 ]]
                -- upvalues: v24 (ref)
                return v24.onRequestAccepted and v24.onRequestAccepted();
            end):andThen(function() --[[ Line: 152 ]]
                -- upvalues: v24 (ref)
                v24.closeModal();
            end):catch(function() --[[ Line: 155 ]]
                -- upvalues: v24 (ref)
                v24.showGenericErrorModal();
            end);
            return;
        elseif l_FFlagTCShareLinkReceiverUI_0 and v23 == l_Sources_0.ShareLinkReceiver then
            v20.addTrustedFriendFromLink(v21, v24.tokens or {}):andThen(function() --[[ Line: 160 ]]
                -- upvalues: v36 (ref)
                v36();
            end):andThen(l_FFlagTCUpdateProfileCTAButton_0 and function() --[[ Line: 164 ]]
                -- upvalues: v24 (ref)
                return v24.onRequestAccepted and v24.onRequestAccepted();
            end or nil):andThen(function() --[[ Line: 168 ]]
                -- upvalues: v24 (ref)
                v24.closeModal();
            end):catch(function() --[[ Line: 171 ]]
                -- upvalues: v24 (ref)
                v24.showGenericErrorModal();
            end);
            return;
        else
            v20.sendTrustedConnectionRequest(v21, v24.sentFromQrCode and "qr" or nil):andThen(function() --[[ Line: 179 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v6 (ref), v30 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                v6.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v30.trustedConnectionRequestSentToast
                });
            end):andThen(function() --[[ Line: 186 ]]
                -- upvalues: v24 (ref)
                return v24.onRequestSent and v24.onRequestSent();
            end):andThen(function() --[[ Line: 189 ]]
                -- upvalues: v24 (ref)
                v24.closeModal();
            end):catch(function(_) --[[ Line: 192 ]]
                -- upvalues: v24 (ref)
                v24.showGenericErrorModal();
            end);
            return;
        end;
    end, {
        v24.closeModal, 
        v21, 
        v30, 
        v24.onRequestSent, 
        v24.onRequestAccepted, 
        v24.tokens, 
        if l_FFlagTCVerifiedParentalControl_0 then nil else v24.sentFromQrCode and "qr" or nil, 
        l_fireAnalyticsEvent_0
    });
    local v39 = v2.useCallback(function() --[[ Line: 213 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v24.closeModal();
    end, {
        v24.closeModal, 
        l_fireAnalyticsEvent_0
    });
    local v41 = v2.useCallback(function() --[[ Line: 219 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v20 (ref), v21 (copy), l_default_0 (ref), l_Contexts_0 (ref), v24 (copy), v27 (copy), v6 (ref), v30 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddViaLinkClicked);
        v20.createTrustedFriendLink(v21):andThen(function(v40) --[[ Line: 222 ]]
            -- upvalues: l_default_0 (ref), l_Contexts_0 (ref)
            l_default_0:shareUrl({
                url = v40.responseBody.link, 
                context = l_Contexts_0.TCUpsellModal
            });
        end):andThen(function() --[[ Line: 228 ]]
            -- upvalues: v24 (ref)
            return v24.onRequestSent and v24.onRequestSent();
        end):andThen(function() --[[ Line: 231 ]]
            -- upvalues: v27 (ref), v6 (ref), v30 (ref), v24 (ref)
            if not v27 then
                v6.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v30.linkCopiedToast
                });
            end;
            v24.closeModal();
        end):catch(function() --[[ Line: 240 ]]
            -- upvalues: v24 (ref)
            v24.showGenericErrorModal();
            v24.closeModal();
        end);
    end, {
        v24.closeModal, 
        v24.showGenericErrorModal, 
        l_fireAnalyticsEvent_0, 
        v21, 
        v30, 
        v27
    });
    local v42 = v2.useMemo(function() --[[ Line: 256 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v38 (copy), v39 (copy), v32 (copy), v33 (copy), l_Sources_0 (ref), v41 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v38, 
                secondary = v39
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v38, 
                secondary = v39
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                primary = v32, 
                secondary = v33
            }, 
            [l_Sources_0.ShareLinkSender] = {
                primary = v41
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                primary = v38, 
                secondary = v39
            } else nil
        };
    end, {
        v38, 
        v39, 
        v32, 
        v33, 
        v41, 
        if l_FFlagTCVerifiedParentalControl_0 then v35 else nil
    })[v23];
    if l_FFlagTCVerifiedParentalControl_0 and v24.isVPCFlow and v42 then
        v42.primary = v35;
    end;
    return v42;
end;