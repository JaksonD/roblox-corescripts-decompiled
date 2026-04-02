local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(l_Parent_0.NotificationModalsManager);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local v9 = require(l_script_FirstAncestor_0.Requests.getTCStatus);
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local v11 = require(script.Parent.useModalTexts);
local v12 = require(script.Parent.useModalButtonActions);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v14 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v14.useTCAnalytics;
local l_EventNames_0 = v14.EventNames;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagTCLearnMoreLink);
local v20 = require(script.Parent.TrustedContactsModal);
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local v22 = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812");
local v23 = {
    l_TrustedConnectionStatus_0.Friends, 
    l_TrustedConnectionStatus_0.RequestReceived, 
    l_TrustedConnectionStatus_0.RequestIgnored, 
    l_TrustedConnectionStatus_0.TrustedFriends, 
    l_Sources_0.ShareLinkSender, 
    l_Sources_0.ShareLinkReceiver
};
return function(v24) --[[ Line: 63 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_AmpApiProvider_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v9 (copy), l_TrustedConnectionStatus_0 (copy), l_useTCAnalytics_0 (copy), l_EventNames_0 (copy), l_useLocalization_0 (copy), v19 (copy), v5 (copy), v11 (copy), v12 (copy), v23 (copy), l_AppPage_0 (copy), v22 (copy), v20 (copy)
    local v25 = l_useNavigation_0();
    local v26, v27 = v2.useState(nil);
    local v28 = nil;
    local v29 = nil;
    local v30, v31 = v2.useState(false);
    if l_FFlagTCVerifiedParentalControl_0 then
        local v32, v33 = v2.useState(false);
        v28 = v32;
        v29 = v33;
    end;
    v2.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v24 (copy), l_FFlagTCVerifiedParentalControl_0 (ref), l_AmpApiProvider_0 (ref), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v31 (copy), v29 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v27 (copy), v9 (ref), l_TrustedConnectionStatus_0 (ref)
        local v34 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v24.userId
            }
        };
        if l_FFlagTCVerifiedParentalControl_0 and l_AmpApiProvider_0.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v34).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v31(true);
            v29(true);
        end;
        if l_AmpApiProvider_0.upsellFeatureAccess("ShowGenericTrustedFriendEducation", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v34).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v31(true);
        end;
        if l_FFlagTCShareLinkSenderUI_0 and v24.modalVariantOverride then
            v27(v24.modalVariantOverride);
            return;
        else
            v9(v24.userId):andThen(function(v35) --[[ Line: 99 ]]
                -- upvalues: l_TrustedConnectionStatus_0 (ref), v27 (ref)
                if v35 == l_TrustedConnectionStatus_0.RequestIgnored then
                    v27(l_TrustedConnectionStatus_0.RequestReceived);
                    return;
                else
                    v27(v35);
                    return;
                end;
            end):catch(function() --[[ Line: 107 ]]
                -- upvalues: v27 (ref), l_TrustedConnectionStatus_0 (ref)
                v27(l_TrustedConnectionStatus_0.Friends);
            end);
            return;
        end;
    end, {
        v24.userId, 
        if l_FFlagTCShareLinkSenderUI_0 then nil else v9, 
        if l_FFlagTCShareLinkSenderUI_0 then v24.modalVariantOverride else nil
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v24.userId, 
        modalVariant = v26, 
        source = v24.source
    }).fireAnalyticsEvent;
    local v37 = v2.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v24 (copy), v25 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCloseClicked);
        if not v24.shouldOverrideNavigation then
            v25.pop();
        end;
        if v24.onClosed then
            v24.onClosed();
        end;
    end, {
        v24.onClosed, 
        v24.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0
    });
    local v38 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        linkCopiedToast = l_FFlagTCShareLinkSenderUI_0 and "Feature.Catalog.Toast.LinkCopied" or nil, 
        learnMoreText = v19 and "Feature.Friends.LinkText.LearnMore" or nil
    });
    v2.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v26 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        if v26 then
            l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellModalSeen);
        end;
    end, {
        v26, 
        l_fireAnalyticsEvent_0
    });
    local v39 = v2.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v5 (ref), v38 (copy)
        v5.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v38.somethingIsWrongToast
        });
    end, {
        v38.somethingIsWrongToast
    });
    local v40 = v11(v24.userId, v26, v30);
    local v41 = v12(v24.userId, v24.source, v26, {
        closeModal = v37, 
        onRequestSent = v24.onRequestSent, 
        onRequestAccepted = v24.onRequestAccepted, 
        onRemovedTrustedConnection = v24.onRemovedTrustedConnection, 
        onAcknowledged = v24.onAcknowledged, 
        sentFromQrCode = v24.sentFromQrCode, 
        tokens = v24.tokens, 
        showGenericErrorModal = v39, 
        isVPCFlow = if l_FFlagTCVerifiedParentalControl_0 then v28 else nil
    });
    v2.useEffect(function() --[[ Line: 166 ]]
        -- upvalues: v26 (copy), v23 (ref), v37 (copy), v39 (copy)
        if v26 and not table.find(v23, v26) then
            v37();
            v39();
        end;
    end, {
        v37, 
        v26
    });
    local v42 = if v19 then v2.useCallback(function() --[[ Line: 174 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v25 (copy), l_AppPage_0 (ref), v22 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellLearnMoreClicked);
        v25.push(l_AppPage_0.GenericWebPage, {
            detail = v22, 
            extraProps = {
                title = ""
            }
        });
    end, {
        l_fireAnalyticsEvent_0, 
        v25
    }) else nil;
    return v26 and table.find(v23, v26) and v2.createElement(v20, {
        isVerticallyConstrained = v24.isVerticallyConstrained, 
        userId = v24.userId, 
        source = v24.source, 
        modalVariant = if l_FFlagTCShareLinkSenderUI_0 then nil else v26, 
        onSecondaryButtonPress = v41.secondary, 
        onPrimaryButtonPress = v41.primary, 
        onCloseModal = v37, 
        headerText = v40.header, 
        descriptionText = v40.description, 
        primaryButtonText = v40.primaryButton, 
        secondaryButtonText = v40.secondaryButton, 
        learnMoreText = if v19 then v38.learnMoreText else nil, 
        onLearnMoreClick = if v19 then v42 else nil
    });
end;