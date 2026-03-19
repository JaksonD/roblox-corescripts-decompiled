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
local v18 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v18.useTCAnalytics;
local l_EventNames_0 = v18.EventNames;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCModalGenericVariant_0 = require(l_Parent_0.SharedFlags).FFlagTCModalGenericVariant;
local l_FFlagMoveVariantMapsToHelperFiles_0 = require(l_Parent_0.SharedFlags).FFlagMoveVariantMapsToHelperFiles;
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v25 = require(script.Parent.TrustedContactsModal);
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local v27 = {
    l_TrustedConnectionStatus_0.Friends, 
    l_TrustedConnectionStatus_0.RequestReceived, 
    l_TrustedConnectionStatus_0.RequestIgnored, 
    l_TrustedConnectionStatus_0.TrustedFriends, 
    l_Sources_0.ShareLinkSender, 
    l_Sources_0.ShareLinkReceiver
};
local v28 = if not not v4.FFlagProfilePlatformTrustedConnectionsMVP or l_FFlagTCShareLinkSenderUI_0 then v2.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v29) --[[ Line: 70 ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), l_FFlagTCModalGenericVariant_0 (copy), l_AmpApiProvider_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v12 (copy), l_TrustedConnectionStatus_0 (copy), l_useTCAnalytics_0 (copy), l_EventNames_0 (copy), v5 (copy), l_useLocalization_0 (copy), l_FFlagMoveVariantMapsToHelperFiles_0 (copy), v8 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v28 (copy), v13 (copy), v4 (copy), v14 (copy), v16 (copy), v17 (copy), v27 (copy), v25 (copy)
    local v30 = l_useNavigation_0();
    local v31, v32 = v3.useState(nil);
    local v33 = nil;
    local v34 = nil;
    if l_FFlagTCModalGenericVariant_0 then
        local v35, v36 = v3.useState(false);
        v33 = v35;
        v34 = v36;
    end;
    v3.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: l_FFlagTCModalGenericVariant_0 (ref), v29 (copy), l_AmpApiProvider_0 (ref), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v34 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v32 (copy), v12 (ref), l_TrustedConnectionStatus_0 (ref)
        if l_FFlagTCModalGenericVariant_0 then
            local v37 = {
                {
                    name = "targetUser", 
                    type = "UserId", 
                    value = v29.userId
                }
            };
            if l_AmpApiProvider_0.upsellFeatureAccess("ShowGenericTrustedFriendEducation", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v37).access == l_AmpEnums_0.AccessResponseEnum.Granted then
                v34(true);
            end;
        end;
        if l_FFlagTCShareLinkSenderUI_0 and v29.modalVariantOverride then
            v32(v29.modalVariantOverride);
            return;
        else
            v12(v29.userId):andThen(function(v38) --[[ Line: 101 ]]
                -- upvalues: l_TrustedConnectionStatus_0 (ref), v32 (ref)
                if v38 == l_TrustedConnectionStatus_0.RequestIgnored then
                    v32(l_TrustedConnectionStatus_0.RequestReceived);
                    return;
                else
                    v32(v38);
                    return;
                end;
            end):catch(function() --[[ Line: 109 ]]
                -- upvalues: v32 (ref), l_TrustedConnectionStatus_0 (ref)
                v32(l_TrustedConnectionStatus_0.Friends);
            end);
            return;
        end;
    end, {
        v29.userId, 
        if l_FFlagTCShareLinkSenderUI_0 then nil else v12, 
        if l_FFlagTCShareLinkSenderUI_0 then v29.modalVariantOverride else nil
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v29.userId, 
        modalVariant = v31, 
        source = v29.source
    }).fireAnalyticsEvent;
    local v40 = v3.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v29 (copy), v30 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCloseClicked);
        if not v29.shouldOverrideNavigation then
            v30.pop();
        end;
        if v29.onClosed then
            v29.onClosed();
        end;
    end, {
        v29.onClosed, 
        v29.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0
    });
    local v41 = "";
    local v42 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v29.userId
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    if v42 and v42.data then
        v41 = v5.Selectors.getCombinedNameFromId(v42.data, v29.userId) or "";
    end;
    local v43 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        trustedConnectionRequestSentToast = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent", 
        isATrustedConnectionNowToast = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else {
            "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow"; 
            name = v41
        }, 
        linkCopiedToast = l_FFlagTCShareLinkSenderUI_0 and "Feature.Catalog.Toast.LinkCopied" or nil, 
        cancel = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "CommonUI.Controls.Action.Cancel", 
        add = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.Action.Add", 
        gotIt = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.SettingsHub.Prompt.GotIt", 
        remove = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Chat.Action.Remove", 
        notTrustedFriendsHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Upsell.Modal.Header", 
        notTrustedFriendsDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Upsell.Modal.Description", 
        incomingRequestHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.AddBack.Header", 
        incomingRequestDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.AddBack.Description", 
        trustedFriendsHeader = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Info.Modal.Header", 
        trustedFriendsDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Info.Modal.Description", 
        genericDescription = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.GenericModal.Description", 
        addTrustedConnection = if l_FFlagMoveVariantMapsToHelperFiles_0 then nil else "Feature.Friends.TrustedConnection.Label.AddTrustedConnection"
    });
    v3.useEffect(function() --[[ Line: 193 ]]
        -- upvalues: v31 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        if v31 then
            l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellModalSeen);
        end;
    end, {
        v31, 
        l_fireAnalyticsEvent_0
    });
    local v44 = v3.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v8 (ref), v43 (copy)
        v8.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v43.somethingIsWrongToast
        });
    end, {
        v43.somethingIsWrongToast
    });
    local v45 = v3.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v29 (copy), v40 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellGotItClicked);
        if v29.onAcknowledged then
            v29.onAcknowledged();
        end;
        v40();
    end, {
        v40, 
        v29.onAcknowledged, 
        l_fireAnalyticsEvent_0
    });
    local v46 = v3.useCallback(function() --[[ Line: 217 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v29 (copy), v40 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellRemoveTrustedConnectionClicked);
        if v29.onRemovedTrustedConnection then
            v29.onRemovedTrustedConnection();
        end;
        v40();
    end, {
        v40, 
        v30, 
        v29.onRemovedTrustedConnection, 
        v29.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0
    });
    local v48 = v3.useCallback(function() --[[ Line: 228 ]]
        -- upvalues: v31 (copy), l_TrustedConnectionStatus_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v28 (ref), v29 (copy), v13 (ref), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v8 (ref), v43 (copy), v40 (copy), v44 (copy), v4 (ref), v14 (ref)
        if v31 == l_TrustedConnectionStatus_0.RequestReceived then
            (if l_FFlagLegacyProfileTCIndicator_0 then v28.acceptTrustedConnectionRequest(v29.userId) else v13(v29.userId)):andThen(function() --[[ Line: 233 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v8 (ref), v43 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAcceptTrustedConnectionClicked);
                v8.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v43.isATrustedConnectionNowToast
                });
            end):andThen(function() --[[ Line: 242 ]]
                -- upvalues: v29 (ref)
                return v29.onRequestAccepted and v29.onRequestAccepted();
            end):andThen(function() --[[ Line: 245 ]]
                -- upvalues: v40 (ref)
                v40();
            end):catch(function() --[[ Line: 248 ]]
                -- upvalues: v44 (ref)
                v44();
            end);
            return;
        else
            (if v4.FFlagProfilePlatformTrustedConnectionsMVP then v28.sendTrustedConnectionRequest(v29.userId, v29.sentFromQrCode and "qr" or nil) else v14(v29.userId)):andThen(function() --[[ Line: 258 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v8 (ref), v43 (ref)
                l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellAddTrustedConnectionClicked);
                v8.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v43.trustedConnectionRequestSentToast
                });
            end):andThen(function() --[[ Line: 265 ]]
                -- upvalues: v29 (ref)
                return v29.onRequestSent and v29.onRequestSent();
            end):andThen(function() --[[ Line: 268 ]]
                -- upvalues: v40 (ref)
                v40();
            end):catch(function(_) --[[ Line: 271 ]]
                -- upvalues: v44 (ref)
                v44();
            end);
            return;
        end;
    end, {
        v13, 
        v14, 
        v40, 
        v29.userId, 
        v43, 
        v29.onRequestSent, 
        v29.onRequestAccepted, 
        if v4.FFlagProfilePlatformTrustedConnectionsMVP then v29.sentFromQrCode else nil, 
        l_fireAnalyticsEvent_0
    });
    local v49 = v3.useCallback(function() --[[ Line: 289 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v40 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCancelClicked);
        v40();
    end, {
        v40, 
        l_fireAnalyticsEvent_0
    });
    local v50 = nil;
    local v51 = nil;
    if l_FFlagMoveVariantMapsToHelperFiles_0 then
        v50 = v16(v29.userId, v31, v33);
        v51 = v17(v29.userId, v29.source, v31, {
            closeModal = v40, 
            onRequestSent = v29.onRequestSent, 
            onRequestAccepted = v29.onRequestAccepted, 
            onRemovedTrustedConnection = v29.onRemovedTrustedConnection, 
            onAcknowledged = v29.onAcknowledged, 
            sentFromQrCode = v29.sentFromQrCode, 
            tokens = v29.tokens, 
            showGenericErrorModal = v44
        });
    end;
    local v52 = v3.useMemo(function() --[[ Line: 309 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), l_FFlagTCModalGenericVariant_0 (ref), v33 (ref), v43 (copy)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                header = if l_FFlagTCModalGenericVariant_0 and v33 then v43.addTrustedConnection else v43.notTrustedFriendsHeader, 
                description = if l_FFlagTCModalGenericVariant_0 and v33 then v43.genericDescription else v43.notTrustedFriendsDescription, 
                primaryButton = v43.add, 
                secondaryButton = v43.cancel
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                header = v43.incomingRequestHeader, 
                description = if l_FFlagTCModalGenericVariant_0 and v33 then v43.genericDescription else v43.incomingRequestDescription, 
                primaryButton = v43.add, 
                secondaryButton = v43.cancel
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                header = v43.trustedFriendsHeader, 
                description = v43.trustedFriendsDescription, 
                primaryButton = v43.gotIt, 
                secondaryButton = v43.remove
            }
        };
    end, {
        v43, 
        if l_FFlagTCModalGenericVariant_0 then v33 else nil
    });
    local v53 = v3.useMemo(function() --[[ Line: 346 ]]
        -- upvalues: l_TrustedConnectionStatus_0 (ref), v48 (copy), v49 (copy), v45 (copy), v46 (copy)
        return {
            [l_TrustedConnectionStatus_0.Friends] = {
                primary = v48, 
                secondary = v49
            }, 
            [l_TrustedConnectionStatus_0.RequestReceived] = {
                primary = v48, 
                secondary = v49
            }, 
            [l_TrustedConnectionStatus_0.TrustedFriends] = {
                primary = v45, 
                secondary = v46
            }
        };
    end, {
        v48, 
        v49, 
        v45, 
        v46
    });
    v3.useEffect(function() --[[ Line: 370 ]]
        -- upvalues: v31 (copy), v27 (ref), v40 (copy), v44 (copy)
        if v31 and not table.find(v27, v31) then
            v40();
            v44();
        end;
    end, {
        v40, 
        v31
    });
    return v31 and table.find(v27, v31) and v3.createElement(v25, {
        isVerticallyConstrained = v29.isVerticallyConstrained, 
        userId = v29.userId, 
        source = v29.source, 
        modalVariant = if l_FFlagTCShareLinkSenderUI_0 then nil else v31, 
        onSecondaryButtonPress = if l_FFlagMoveVariantMapsToHelperFiles_0 then v51.secondary else v53[v31].secondary, 
        onPrimaryButtonPress = if l_FFlagMoveVariantMapsToHelperFiles_0 then v51.primary else v53[v31].primary, 
        onCloseModal = v40, 
        headerText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v50.header else v52[v31].header, 
        descriptionText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v50.description else v52[v31].description, 
        primaryButtonText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v50.primaryButton else v52[v31].primaryButton, 
        secondaryButtonText = if l_FFlagMoveVariantMapsToHelperFiles_0 then v50.secondaryButton else v52[v31].secondaryButton
    });
end;