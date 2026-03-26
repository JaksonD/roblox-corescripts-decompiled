local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DataHydration);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.UserProfiles);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v8 = require(l_Parent_0.NotificationModalsManager);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local v12 = require(l_script_FirstAncestor_0.Requests.getTCStatus);
local v13 = require(l_script_FirstAncestor_0.Requests.acceptTCRequest);
local v14 = require(l_script_FirstAncestor_0.Requests.sendTCRequest);
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local v16 = require(script.Parent.useModalTexts);
local v17 = require(script.Parent.useModalButtonActions);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v19 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v19.useTCAnalytics;
local l_EventNames_0 = v19.EventNames;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagMoveVariantMapsToHelperFiles_0 = require(l_Parent_0.SharedFlags).FFlagMoveVariantMapsToHelperFiles;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagTCLearnMoreLink);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v28 = require(script.Parent.TrustedContactsModal);
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local v30 = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812");
local v31 = {
    l_TrustedConnectionStatus_0.Friends, 
    l_TrustedConnectionStatus_0.RequestReceived, 
    l_TrustedConnectionStatus_0.RequestIgnored, 
    l_TrustedConnectionStatus_0.TrustedFriends, 
    l_Sources_0.ShareLinkSender, 
    l_Sources_0.ShareLinkReceiver
};
local v32 = if not not v4.FFlagProfilePlatformTrustedConnectionsMVP or l_FFlagTCShareLinkSenderUI_0 then v2.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v33) --[[ Line: 77 ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_AmpApiProvider_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v12 (copy), l_TrustedConnectionStatus_0 (copy), l_useTCAnalytics_0 (copy), l_EventNames_0 (copy), v5 (copy), l_useLocalization_0 (copy), l_FFlagMoveVariantMapsToHelperFiles_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v26 (copy), v8 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v32 (copy), v13 (copy), v4 (copy), v14 (copy), v16 (copy), v17 (copy), v31 (copy), l_AppPage_0 (copy), v30 (copy), v28 (copy)
    local v34 = l_useNavigation_0();
    local v35, v36 = v3.useState(nil);
    local v37 = nil;
    local v38 = nil;
    local v39, v40 = v3.useState(false);
    if l_FFlagTCVerifiedParentalControl_0 then
        local v41, v42 = v3.useState(false);
        v37 = v41;
        v38 = v42;
    end;
    v3.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v33 (copy), l_FFlagTCVerifiedParentalControl_0 (ref), l_AmpApiProvider_0 (ref), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v40 (copy), v38 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v36 (copy), v12 (ref), l_TrustedConnectionStatus_0 (ref)
        local v43 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v33.userId
            }
        };
        if l_FFlagTCVerifiedParentalControl_0 and l_AmpApiProvider_0.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v43).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v40(true);
            v38(true);
        end;
        if l_AmpApiProvider_0.upsellFeatureAccess("ShowGenericTrustedFriendEducation", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v43).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v40(true);
        end;
        if l_FFlagTCShareLinkSenderUI_0 and v33.modalVariantOverride then
            v36(v33.modalVariantOverride);
            return;
        else
            v12(v33.userId):andThen(function(v44) --[[ Line: 113 ]]
                -- upvalues: l_TrustedConnectionStatus_0 (ref), v36 (ref)
                if v44 == l_TrustedConnectionStatus_0.RequestIgnored then
                    v36(l_TrustedConnectionStatus_0.RequestReceived);
                    return;
                else
                    v36(v44);
                    return;
                end;
            end):catch(function() --[[ Line: 121 ]]
                -- upvalues: v36 (ref), l_TrustedConnectionStatus_0 (ref)
                v36(l_TrustedConnectionStatus_0.Friends);
            end);
            return;
        end;
    end, {
        v33.userId, 
        if l_FFlagTCShareLinkSenderUI_0 then nil else v12, 
        if l_FFlagTCShareLinkSenderUI_0 then v33.modalVariantOverride else nil
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v33.userId, 
        modalVariant = v35, 
        source = v33.source
    }).fireAnalyticsEvent;
    local v46 = v3.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v33 (copy), v34 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCloseClicked);
        if not v33.shouldOverrideNavigation then
            v34.pop();
        end;
        if v33.onClosed then
            v33.onClosed();
        end;
    end, {
        v33.onClosed, 
        v33.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0
    });
    local v47 = "";
    local v48 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v33.userId
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    if v48 and v48.data then
        v47 = v5.Selectors.getCombinedNameFromId(v48.data, v33.userId) or "";
    end;
    local v49 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent" or "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow" or "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v47
        }, 
        linkCopiedToast = l_FFlagTCShareLinkSenderUI_0 and "Feature.Catalog.Toast.LinkCopied" or nil, 
        learnMoreText = v26 and "Feature.Friends.LinkText.LearnMore" or nil, 
        cancel = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "CommonUI.Controls.Action.Cancel", 
        add = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.Action.Add", 
        gotIt = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.SettingsHub.Prompt.GotIt", 
        remove = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Chat.Action.Remove", 
        notTrustedFriendsHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Upsell.Modal.Header" or "Feature.Friends.TrustedConnection.Upsell.Modal.Header", 
        notTrustedFriendsDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Upsell.Modal.Description" or "Feature.Friends.TrustedConnection.Upsell.Modal.Description", 
        incomingRequestHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddBack.Header" or "Feature.Friends.TrustedConnection.AddBack.Header", 
        incomingRequestDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.AddBack.Description" or "Feature.Friends.TrustedConnection.AddBack.Description", 
        trustedFriendsHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Info.Modal.Header" or "Feature.Friends.TrustedConnection.Info.Modal.Header", 
        trustedFriendsDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Info.Modal.Description" or "Feature.Friends.TrustedConnection.Info.Modal.Description", 
        genericDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.GenericModal.Description" or "Feature.Friends.TrustedConnection.GenericModal.Description", 
        addTrustedConnection = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TrustedFriend.Label.AddTrustedFriend" or "Feature.Friends.TrustedConnection.Label.AddTrustedConnection"
    });
    v3.useEffect(function() --[[ Line: 226 ]]
        -- upvalues: v35 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        if v35 then
            l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellModalSeen);
        end;
    end, {
        v35, 
        l_fireAnalyticsEvent_0
    });
    local v50 = v3.useCallback(function() --[[ Line: 232 ]]
        -- upvalues: v8 (ref), v49 (copy)
        v8.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v49.somethingIsWrongToast
        });
    end, {
        v49.somethingIsWrongToast
    });
    local v51 = v3.useCallback(function() --[[ Line: 241 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v33 (copy), v46 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v33.onAcknowledged then
            v33.onAcknowledged();
        end;
        v46();
    end, {
        v46, 
        v33.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v52 = v3.useCallback(function() --[[ Line: 250 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v33 (copy), v46 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v33.onRemovedTrustedConnection then
            v33.onRemovedTrustedConnection();
        end;
        v46();
    end, {
        v46, 
        v34, 
        v33.onRemovedTrustedConnection, 
        v33.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0
    });
    local v54 = v3.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v35 (copy), l_TrustedConnectionStatus_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v32 (ref), v33 (copy), v13 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v8 (ref), v49 (copy), v46 (copy), v50 (copy), v4 (ref), v14 (ref)
        if v35 == l_TrustedConnectionStatus_0.RequestReceived then
            (if l_FFlagLegacyProfileTCIndicator_0 then v32.acceptTrustedConnectionRequest(v33.userId) else v13(v33.userId)):andThen(function() --[[ Line: 266 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v8 (ref), v49 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
                v8.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v49.isATrustedConnectionNowToast
                });
            end):andThen(function() --[[ Line: 275 ]]
                -- upvalues: v33 (ref)
                return v33.onRequestAccepted and v33.onRequestAccepted();
            end):andThen(function() --[[ Line: 278 ]]
                -- upvalues: v46 (ref)
                v46();
            end):catch(function() --[[ Line: 281 ]]
                -- upvalues: v50 (ref)
                v50();
            end);
            return;
        else
            (if v4.FFlagProfilePlatformTrustedConnectionsMVP then v32.sendTrustedConnectionRequest(v33.userId, v33.sentFromQrCode and "qr" or nil) else v14(v33.userId)):andThen(function() --[[ Line: 291 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v8 (ref), v49 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                v8.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v49.trustedConnectionRequestSentToast
                });
            end):andThen(function() --[[ Line: 298 ]]
                -- upvalues: v33 (ref)
                return v33.onRequestSent and v33.onRequestSent();
            end):andThen(function() --[[ Line: 301 ]]
                -- upvalues: v46 (ref)
                v46();
            end):catch(function(_) --[[ Line: 304 ]]
                -- upvalues: v50 (ref)
                v50();
            end);
            return;
        end;
    end, {
        v13, 
        v14, 
        v46, 
        v33.userId, 
        v49, 
        v33.onRequestSent, 
        v33.onRequestAccepted, 
        if v4.FFlagProfilePlatformTrustedConnectionsMVP then v33.sentFromQrCode else nil, 
        l_fireAnalyticsEvent_0
    });
    local v55 = v3.useCallback(function() --[[ Line: 322 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v46 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v46();
    end, {
        v46, 
        l_fireAnalyticsEvent_0
    });
    local v56 = nil;
    local v57 = nil;
    if l_FFlagMoveVariantMapsToHelperFiles_0 then
        v56 = v16(v33.userId, v35, v39);
        v57 = v17(v33.userId, v33.source, v35, {
            closeModal = v46, 
            onRequestSent = v33.onRequestSent, 
            onRequestAccepted = v33.onRequestAccepted, 
            onRemovedTrustedConnection = v33.onRemovedTrustedConnection, 
            onAcknowledged = v33.onAcknowledged, 
            sentFromQrCode = v33.sentFromQrCode, 
            tokens = v33.tokens, 
            showGenericErrorModal = v50, 
            isVPCFlow = if l_FFlagTCVerifiedParentalControl_0 then v37 else nil
        });
    end;
    local v58 = v3.useMemo(function() --[[ Line: 343 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v39 (copy), v49 (copy)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                header = if v39 then v49.addTrustedConnection else v49.notTrustedFriendsHeader, 
                description = if v39 then v49.genericDescription else v49.notTrustedFriendsDescription, 
                primaryButton = v49.add, 
                secondaryButton = v49.cancel
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                header = v49.incomingRequestHeader, 
                description = if v39 then v49.genericDescription else v49.incomingRequestDescription, 
                primaryButton = v49.add, 
                secondaryButton = v49.cancel
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                header = v49.trustedFriendsHeader, 
                description = v49.trustedFriendsDescription, 
                primaryButton = v49.gotIt, 
                secondaryButton = v49.remove
            }
        };
    end, {
        v49, 
        v39
    });
    local v59 = v3.useMemo(function() --[[ Line: 380 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v54 (copy), v55 (copy), v51 (copy), v52 (copy)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v54, 
                secondary = v55
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v54, 
                secondary = v55
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                primary = v51, 
                secondary = v52
            }
        };
    end, {
        v54, 
        v55, 
        v51, 
        v52
    });
    v3.useEffect(function() --[[ Line: 404 ]]
        -- upvalues: v35 (copy), v31 (ref), v46 (copy), v50 (copy)
        if v35 and not table.find(v31, v35) then
            v46();
            v50();
        end;
    end, {
        v46, 
        v35
    });
    local v60 = if v26 then v3.useCallback(function() --[[ Line: 412 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v34 (copy), l_AppPage_0 (ref), v30 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellLearnMoreClicked);
        v34.push(l_AppPage_0.GenericWebPage, {
            detail = v30, 
            extraProps = {
                title = ""
            }
        });
    end, {
        l_fireAnalyticsEvent_0, 
        v34
    }) else nil;
    return v35 and table.find(v31, v35) and v3.createElement(v28, {
        isVerticallyConstrained = v33.isVerticallyConstrained, 
        userId = v33.userId, 
        source = v33.source, 
        modalVariant = if l_FFlagTCShareLinkSenderUI_0 then nil else v35, 
        onSecondaryButtonPress = if l_FFlagMoveVariantMapsToHelperFiles_0 then v57.secondary else v59[v35].secondary, 
        onPrimaryButtonPress = if l_FFlagMoveVariantMapsToHelperFiles_0 then v57.primary else v59[v35].primary, 
        onCloseModal = v46, 
        headerText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v56.header else v58[v35].header, 
        descriptionText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v56.description else v58[v35].description, 
        primaryButtonText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v56.primaryButton else v58[v35].primaryButton, 
        secondaryButtonText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v56.secondaryButton else v58[v35].secondaryButton, 
        learnMoreText = if v26 then v49.learnMoreText else nil, 
        onLearnMoreClick = if v26 then v60 else nil
    });
end;