local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(l_Parent_0.NotificationModalsManager);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
local l_useOpenWebView_0 = require(l_Parent_0.WebViewUtils).useOpenWebView;
local v10 = require(l_script_FirstAncestor_0.Requests.getTCStatus);
local l_TrustedConnectionStatus_0 = require(l_script_FirstAncestor_0.Enums).TrustedConnectionStatus;
local v12 = require(script.Parent.useModalTexts);
local v13 = require(script.Parent.useModalButtonActions);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v15 = require(script.Parent.Parent.Parent.Analytics);
local l_useTCAnalytics_0 = v15.useTCAnalytics;
local l_EventNames_0 = v15.EventNames;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCModalUpdateButtons_0 = require(l_Parent_0.SharedFlags).FFlagTCModalUpdateButtons;
local l_FFlagTCVerifiedParentalControl_0 = require(l_Parent_0.SharedFlags).FFlagTCVerifiedParentalControl;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagTCLearnMoreLink);
local v22 = game:DefineFastFlag("TCLearnMoreLinkFixForChat", false);
local l_FFlagTCUnifyNavigationEntry_0 = require(l_Parent_0.SharedFlags).FFlagTCUnifyNavigationEntry;
local v24 = require(script.Parent.TrustedContactsModal);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_FStringConnectionGraphCoreAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringConnectionGraphCoreAmpNameSpace;
local v27 = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812");
local v28 = {
    l_TrustedConnectionStatus_0.Friends, 
    l_TrustedConnectionStatus_0.RequestReceived, 
    l_TrustedConnectionStatus_0.RequestIgnored, 
    l_TrustedConnectionStatus_0.TrustedFriends, 
    l_Sources_0.ShareLinkSender, 
    l_Sources_0.ShareLinkReceiver
};
return function(v29) --[[ Line: 55 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), l_FFlagTCVerifiedParentalControl_0 (copy), l_AmpApiProvider_0 (copy), l_FStringConnectionGraphCoreAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v10 (copy), l_TrustedConnectionStatus_0 (copy), l_useTCAnalytics_0 (copy), l_EventNames_0 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_useLocalization_0 (copy), v21 (copy), v5 (copy), v12 (copy), v13 (copy), l_FFlagTCModalUpdateButtons_0 (copy), v28 (copy), v22 (copy), l_useOpenWebView_0 (copy), v27 (copy), l_AppPage_0 (copy), v24 (copy)
    local v30 = l_useNavigation_0();
    local v31, v32 = v2.useState(nil);
    local v33 = nil;
    local v34 = nil;
    local v35, v36 = v2.useState(false);
    if l_FFlagTCVerifiedParentalControl_0 then
        local v37, v38 = v2.useState(false);
        v33 = v37;
        v34 = v38;
    end;
    v2.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v29 (copy), l_FFlagTCVerifiedParentalControl_0 (ref), l_AmpApiProvider_0 (ref), l_FStringConnectionGraphCoreAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v36 (copy), v34 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v32 (copy), v10 (ref), l_TrustedConnectionStatus_0 (ref)
        local v39 = {
            {
                name = "targetUser", 
                type = "UserId", 
                value = v29.userId
            }
        };
        if l_FFlagTCVerifiedParentalControl_0 and l_AmpApiProvider_0.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v39).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v36(true);
            v34(true);
        end;
        if l_AmpApiProvider_0.upsellFeatureAccess("ShowGenericTrustedFriendEducation", {}, l_FStringConnectionGraphCoreAmpNameSpace_0, v39).access == l_AmpEnums_0.AccessResponseEnum.Granted then
            v36(true);
        end;
        if l_FFlagTCShareLinkSenderUI_0 and v29.modalVariantOverride then
            v32(v29.modalVariantOverride);
            return;
        else
            v10(v29.userId):andThen(function(v40) --[[ Line: 91 ]]
                -- upvalues: l_TrustedConnectionStatus_0 (ref), v32 (ref)
                if v40 == l_TrustedConnectionStatus_0.RequestIgnored then
                    v32(l_TrustedConnectionStatus_0.RequestReceived);
                    return;
                else
                    v32(v40);
                    return;
                end;
            end):catch(function() --[[ Line: 99 ]]
                -- upvalues: v32 (ref), l_TrustedConnectionStatus_0 (ref)
                v32(l_TrustedConnectionStatus_0.Friends);
            end);
            return;
        end;
    end, {
        v29.userId, 
        if l_FFlagTCShareLinkSenderUI_0 then nil else v10, 
        if l_FFlagTCShareLinkSenderUI_0 then v29.modalVariantOverride else nil
    });
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0({
        friendId = v29.userId, 
        modalVariant = v31, 
        source = v29.source
    }).fireAnalyticsEvent;
    local v42 = v2.useCallback(function() --[[ Line: 117 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v29 (copy), v30 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellCloseClicked);
        if l_FFlagTCUnifyNavigationEntry_0 then
            v29.externalNavigation.closeModal();
            return;
        else
            if not v29.shouldOverrideNavigation then
                v30.pop();
            end;
            if v29.onClosed then
                v29.onClosed();
            end;
            return;
        end;
    end, {
        v29.onClosed, 
        v29.shouldOverrideNavigation, 
        l_fireAnalyticsEvent_0, 
        if l_FFlagTCUnifyNavigationEntry_0 then v29.externalNavigation else nil
    });
    local v43 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        linkCopiedToast = l_FFlagTCShareLinkSenderUI_0 and "Feature.Catalog.Toast.LinkCopied" or nil, 
        learnMoreText = v21 and "Feature.Friends.LinkText.LearnMore" or nil
    });
    v2.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v31 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        if v31 then
            l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellModalSeen);
        end;
    end, {
        v31, 
        l_fireAnalyticsEvent_0
    });
    local v44 = v2.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: l_FFlagTCUnifyNavigationEntry_0 (ref), v29 (copy), v43 (copy), v5 (ref)
        if l_FFlagTCUnifyNavigationEntry_0 then
            v29.externalNavigation.showToast(v43.somethingIsWrongToast);
            return;
        else
            v5.SetUIBloxToast({
                sequenceNumber = DateTime.now().UnixTimestamp, 
                toastTitle = v43.somethingIsWrongToast
            });
            return;
        end;
    end, {
        v43.somethingIsWrongToast, 
        if l_FFlagTCUnifyNavigationEntry_0 then v29.externalNavigation else nil
    });
    local v45 = v12(v29.userId, v31, v35);
    local v46 = v13(v29.userId, v29.source, v31, {
        closeModal = v42, 
        onRequestSent = v29.onRequestSent, 
        onRequestAccepted = v29.onRequestAccepted, 
        onAcknowledged = v29.onAcknowledged, 
        onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v29.onRemovedTrustedConnection, 
        sentFromQrCode = v29.sentFromQrCode, 
        tokens = v29.tokens, 
        showGenericErrorModal = v44, 
        isVPCFlow = if l_FFlagTCVerifiedParentalControl_0 then v33 else nil, 
        showToast = if l_FFlagTCUnifyNavigationEntry_0 then v29.externalNavigation.showToast else nil, 
        shareUrl = if l_FFlagTCUnifyNavigationEntry_0 then v29.externalNavigation.shareUrl else nil
    });
    v2.useEffect(function() --[[ Line: 179 ]]
        -- upvalues: v31 (copy), v28 (ref), v42 (copy), v44 (copy)
        if v31 and not table.find(v28, v31) then
            v42();
            v44();
        end;
    end, {
        v42, 
        v31
    });
    local v47 = if v22 then l_useOpenWebView_0() else nil;
    local v48 = if v21 then v2.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v29 (copy), v27 (ref), v22 (ref), v47 (copy), v30 (copy), l_AppPage_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.TCUpsellLearnMoreClicked);
        if l_FFlagTCUnifyNavigationEntry_0 then
            v29.externalNavigation.openWebView(v27, "");
            return;
        elseif v22 then
            v47(v27, "");
            return;
        else
            v30.push(l_AppPage_0.GenericWebPage, {
                detail = v27, 
                extraProps = {
                    title = ""
                }
            });
            return;
        end;
    end, {
        l_fireAnalyticsEvent_0, 
        v30, 
        if v22 then v47 else nil, 
        if l_FFlagTCUnifyNavigationEntry_0 then v29.externalNavigation else nil
    }) else nil;
    return v31 and table.find(v28, v31) and v2.createElement(v24, {
        isVerticallyConstrained = v29.isVerticallyConstrained, 
        userId = v29.userId, 
        source = v29.source, 
        modalVariant = if l_FFlagTCShareLinkSenderUI_0 then nil else v31, 
        onSecondaryButtonPress = v46.secondary, 
        onPrimaryButtonPress = v46.primary, 
        onCloseModal = v42, 
        headerText = v45.header, 
        descriptionText = v45.description, 
        primaryButtonText = v45.primaryButton, 
        secondaryButtonText = v45.secondaryButton, 
        learnMoreText = if v21 then v43.learnMoreText else nil, 
        onLearnMoreClick = if v21 then v48 else nil
    });
end;