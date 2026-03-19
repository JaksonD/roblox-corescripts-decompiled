local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.DataHydration);
local v4 = require(l_Parent_0.NotificationModalsManager);
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v10 = require(l_Parent_0.UserProfiles);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v12.useTCAnalytics;
local l_EventNames_0 = v12.EventNames;
local l_FFlagTCShareLinkReceiverUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkReceiverUI;
local v16 = v3.TrustedConnections.TrustedConnectionsStore.get();
return function(v17, v18, v19, v20) --[[ Line: 42 ]] --[[ Name: useModalButtonActions ]]
    -- upvalues: l_useAppPolicy_0 (copy), v10 (copy), l_useLocalization_0 (copy), l_useTCAnalytics_0 (copy), v2 (copy), l_EventNames_0 (copy), v4 (copy), l_TrustedConnectionStatus_0 (copy), v16 (copy), l_FFlagTCShareLinkReceiverUI_0 (copy), l_Sources_0 (copy), l_default_0 (copy), l_Contexts_0 (copy)
    local v22 = l_useAppPolicy_0(function(v21) --[[ Line: 48 ]]
        return v21.getShareSheetEnabled();
    end);
    local v23 = "";
    local v24 = v10.Hooks.useUserProfilesFetch({
        userIds = {
            v17
        }, 
        query = v10.Queries.userProfilesCombinedNameByUserIds
    });
    if v24 and v24.data then
        v23 = v10.Selectors.getCombinedNameFromId(v24.data, v17) or "";
    end;
    local v25 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = {
            "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v23
        }, 
        linkCopiedToast = "Feature.Catalog.Toast.LinkCopied"
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v17, 
        modalVariant = v19, 
        source = v18
    }).fireAnalyticsEvent;
    local v27 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v20 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v20.onAcknowledged then
            v20.onAcknowledged();
        end;
        v20.closeModal();
    end, {
        v20.closeModal, 
        v20.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v28 = v2.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v20 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v20.onRemovedTrustedConnection then
            v20.onRemovedTrustedConnection();
        end;
        v20.closeModal();
    end, {
        v20.closeModal, 
        v20.onRemovedTrustedConnection, 
        l_fireAnalyticsEvent_0
    });
    local v29 = v2.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v4 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
        v4.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v25.isATrustedConnectionNowToast
        });
    end, {
        v25.isATrustedConnectionNowToast, 
        l_fireAnalyticsEvent_0
    });
    local v31 = v2.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v19 (copy), l_TrustedConnectionStatus_0 (ref), v16 (ref), v17 (copy), v29 (copy), v20 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref), l_Sources_0 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v4 (ref), v25 (copy)
        if v19 == l_TrustedConnectionStatus_0.RequestReceived then
            v16.acceptTrustedConnectionRequest(v17):andThen(function() --[[ Line: 108 ]]
                -- upvalues: v29 (ref)
                v29();
            end):andThen(function() --[[ Line: 111 ]]
                -- upvalues: v20 (ref)
                return v20.onRequestAccepted and v20.onRequestAccepted();
            end):andThen(function() --[[ Line: 114 ]]
                -- upvalues: v20 (ref)
                v20.closeModal();
            end):catch(function() --[[ Line: 117 ]]
                -- upvalues: v20 (ref)
                v20.showGenericErrorModal();
            end);
            return;
        elseif l_FFlagTCShareLinkReceiverUI_0 and v19 == l_Sources_0.ShareLinkReceiver then
            v16.addTrustedFriendFromLink(v17, v20.tokens or {}):andThen(function() --[[ Line: 122 ]]
                -- upvalues: v29 (ref)
                v29();
            end):andThen(function() --[[ Line: 125 ]]
                -- upvalues: v20 (ref)
                v20.closeModal();
            end):catch(function() --[[ Line: 128 ]]
                -- upvalues: v20 (ref)
                v20.showGenericErrorModal();
            end);
            return;
        else
            v16.sendTrustedConnectionRequest(v17, v20.sentFromQrCode and "qr" or nil):andThen(function() --[[ Line: 136 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v4 (ref), v25 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                v4.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v25.trustedConnectionRequestSentToast
                });
            end):andThen(function() --[[ Line: 143 ]]
                -- upvalues: v20 (ref)
                return v20.onRequestSent and v20.onRequestSent();
            end):andThen(function() --[[ Line: 146 ]]
                -- upvalues: v20 (ref)
                v20.closeModal();
            end):catch(function(_) --[[ Line: 149 ]]
                -- upvalues: v20 (ref)
                v20.showGenericErrorModal();
            end);
            return;
        end;
    end, {
        v20.closeModal, 
        v17, 
        v25, 
        v20.onRequestSent, 
        v20.onRequestAccepted, 
        v20.tokens, 
        v20.sentFromQrCode and "qr" or nil, 
        l_fireAnalyticsEvent_0
    });
    local v32 = v2.useCallback(function() --[[ Line: 167 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v20 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v20.closeModal();
    end, {
        v20.closeModal, 
        l_fireAnalyticsEvent_0
    });
    local v34 = v2.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v16 (ref), v17 (copy), l_default_0 (ref), l_Contexts_0 (ref), v20 (copy), v22 (copy), v4 (ref), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddViaLinkClicked);
        v16.createTrustedFriendLink(v17):andThen(function(v33) --[[ Line: 176 ]]
            -- upvalues: l_default_0 (ref), l_Contexts_0 (ref)
            l_default_0:shareUrl({
                url = v33.responseBody.link, 
                context = l_Contexts_0.TCUpsellModal
            });
        end):andThen(function() --[[ Line: 182 ]]
            -- upvalues: v20 (ref)
            return v20.onRequestSent and v20.onRequestSent();
        end):andThen(function() --[[ Line: 185 ]]
            -- upvalues: v22 (ref), v4 (ref), v25 (ref), v20 (ref)
            if not v22 then
                v4.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v25.linkCopiedToast
                });
            end;
            v20.closeModal();
        end):catch(function() --[[ Line: 194 ]]
            -- upvalues: v20 (ref)
            v20.showGenericErrorModal();
            v20.closeModal();
        end);
    end, {
        v20.closeModal, 
        v20.showGenericErrorModal, 
        l_fireAnalyticsEvent_0, 
        v17, 
        v25, 
        v22
    });
    return v2.useMemo(function() --[[ Line: 210 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v31 (copy), v32 (copy), v27 (copy), v28 (copy), l_Sources_0 (ref), v34 (copy), l_FFlagTCShareLinkReceiverUI_0 (ref)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v31, 
                secondary = v32
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v31, 
                secondary = v32
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                primary = v27, 
                secondary = v28
            }, 
            [l_Sources_0.ShareLinkSender] = {
                primary = v34
            }, 
            [l_Sources_0.ShareLinkReceiver] = if l_FFlagTCShareLinkReceiverUI_0 then {
                primary = v31, 
                secondary = v32
            } else nil
        };
    end, {
        v31, 
        v32, 
        v27, 
        v28, 
        v34
    })[v19];
end;