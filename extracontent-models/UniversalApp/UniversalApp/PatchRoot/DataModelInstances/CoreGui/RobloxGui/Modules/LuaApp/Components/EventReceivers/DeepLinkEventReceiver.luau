local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AccessResponseEnum_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AmpEnums.AccessResponseEnum;
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AmpApiProvider_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AmpApiProvider;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Workspace.Packages.DeepLink);
local v13 = require(l_CorePackages_0.Packages.Roact);
local v14 = require(l_CorePackages_0.Packages.RoactRodux);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v16 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v17 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local l_ShowFAESocialUpsellOverlay_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Thunks.ShowFAESocialUpsellOverlay;
local l_startFacialAgeEstimation_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Thunks.startFacialAgeEstimation;
local l_NavigateIntoSquadLobbyIfExists_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoSquadLobbyIfExists;
local v25 = require(l_Modules_0.LuaApp.Promise);
local v26 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v27 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v28 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v29 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v31 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsShareLinks);
local v32 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsSocialProfileShare);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_QualifiedSignUpAttribution_0 = require(l_CorePackages_0.Workspace.Packages.AffiliateLinks).QualifiedSignUpAttribution;
local l_AuthenticatedVisitAttribution_0 = require(l_CorePackages_0.Workspace.Packages.AffiliateLinks).AuthenticatedVisitAttribution;
local l_SocialUpsellType_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Enums.SocialUpsellType;
local l_UpsellComponent_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellComponent;
local v38 = require(l_Modules_0.LuaApp.AppPage);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v40 = require(l_Modules_0.LuaApp.DeepLinks.DeepLinkMap);
local v41 = require(l_Modules_0.LuaApp.DeepLinks.DeepLinkParser);
local v42 = require(script.Parent.EventNetworking);
local v43 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local v45 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking;
local v48 = game:DefineFastFlag("DeeplinkNavDurationLog", false);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_FFlagTCUpdateProfileCTAButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton;
local v51 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.refreshProfilePlatformActionInfo);
local v52 = game:DefineFastFlag("DeeplinkTelemetryCounters", false);
local v53 = game:DefineFastFlag("EnableExperienceInviteLinkTypeAttribution", false);
local v54 = game:DefineFastString("JoinCodePattern", ".*/join/([%w]+)");
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local l_FFlagEnableAuthDeepLinkReceiver_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v59 = game:DefineFastFlag("EnableJoinLinkAttribution", false);
local l_simpleUrlDecode_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode;
local v61 = v41.new(v40);
local l_ParseQuery_0 = require(l_CorePackages_0.Packages.StringUtilities).ParseQuery;
local v63 = game:DefineFastString("SocialCommsRestrictionsNamespace", "social/CommunicationRestrictions");
local v64 = game:DefineFastString("EligibleForCommsAgeVerificationUpsellFeatureName", "EligibleForCommsAgeVerificationUpsell");
local v65 = game:DefineFastFlag("EnableDeepLinkWaitForNavigationUnlock2", false);
local v66 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v67 = nil;
if v66 then
    v67 = require(l_CorePackages_0.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible;
end;
local l_PostAuthDeepLinkAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthDeepLinkAvailableSignal;
local l_PostAuthPendingLuaUrlAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthPendingLuaUrlAvailableSignal;
local _ = function(v70) --[[ Line: 111 ]] --[[ Name: getQueryParams ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy)
    local _, v72 = unpack(string.split(l_simpleUrlDecode_0(v70), "?"));
    return (l_ParseQuery_0(v72));
end;
local function _(v74, v75) --[[ Line: 118 ]] --[[ Name: getFirstKeyValue ]]
    if v74 and v74[v75] then
        return v74[v75][1];
    else
        return nil;
    end;
end;
getJoinCode = function(v77) --[[ Line: 122 ]] --[[ Name: getJoinCode ]]
    -- upvalues: v54 (copy)
    return (v77:match(v54));
end;
local function v83(v78) --[[ Line: 127 ]] --[[ Name: getShareLinkType ]]
    -- upvalues: v45 (copy), l_HttpService_0 (copy)
    local v79 = string.lower(v78);
    for v80, v81 in pairs(v45) do
        if v79:find("&type=" .. string.lower(v81)) then
            return v80;
        else
            local v82 = l_HttpService_0:UrlEncode("&type=" .. v81);
            v82 = string.gsub(v82, "%%", "%%%%");
            if v79:find((string.lower(v82))) then
                return v80;
            end;
        end;
    end;
    return nil;
end;
local function v86(v84) --[[ Line: 147 ]] --[[ Name: getScreenAndParams ]]
    -- upvalues: v11 (copy)
    local v85 = v84[#v84];
    return v85.name, (v11.Dictionary.join(v85.extraProps or {}, {
        detail = v85.detail
    }));
end;
local function _(v87, v88) --[[ Line: 156 ]] --[[ Name: isRouteMatchByName ]]
    return v87 and #v87 > 0 and v88 and v87[1].name == v88;
end;
local v90 = v13.Component:extend("DeepLinkEventReceiver");
v90.UpdateConnection = function(v91) --[[ Line: 163 ]] --[[ Name: UpdateConnection ]]
    -- upvalues: l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), v65 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy)
    if not l_FFlagEnableAuthDeepLinkReceiver_0 then
        if v91.props.userLoggedOut or not v91.props.appLoadingStarted then
            v91.props.linking:stopListeningForLuaURLs();
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v91.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil);
            end;
        else
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                local v92 = v91.props.linking:getLastLuaURL();
                v91.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Ready, v92);
            end;
            v91.props.linking:getAndClearLastPendingURL():andThen(function(v93) --[[ Line: 183 ]]
                -- upvalues: v91 (copy)
                if not v93.hasPendingUrl then
                    return;
                else
                    local l_url_0 = v93.url;
                    local l_attributionUrl_0 = v93.attributionUrl;
                    v91:logPendingLink(l_url_0, l_attributionUrl_0);
                    return;
                end;
            end);
            v91.props.linking:listenForLuaURLs(function(v96, v97) --[[ Line: 193 ]]
                -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v91 (copy), v65 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
                if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                    v91.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v96);
                end;
                v91:logProcessedLink(v96, v97);
                if v65 and v91.props.navigationLocked then
                    v91.pendingDeepLinkUrl = v96;
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
                else
                    v91:navigate(v96);
                end;
                if v48 then
                    v91.props.loggingProtocol:logEvent("deeplink_navigation_begin");
                end;
            end);
        end;
    end;
    if v91.props.userLoggedOut then
        local v98 = v91.props.linking:getLastLuaURL();
        if v98 then
            local v99 = {};
            for v100, v101 in v98:gmatch("([^&=?]-)=([^&=?]+)") do
                v99[v100] = v101:gsub("+", " "):gsub("%%(%x%x)", function(v102) --[[ Line: 222 ]]
                    return (string.char((tonumber(v102, 16))));
                end);
            end;
            if v99.friendshipSourceType == "profileshare" then
                v91.props.socialProfileShareAnalytics.inviteePageLoad(v99.userId, "appSignIn");
            end;
        end;
    end;
end;
v90.navigate = function(v103, v104) --[[ Line: 234 ]] --[[ Name: navigate ]]
    -- upvalues: v66 (copy), v61 (copy), l_LaunchGame_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), v25 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_AvatarScreen_0 (copy), v86 (copy), v38 (copy)
    if v66 then
        v103.props.setDrawerVisible(false);
    end;
    local l_currentHistory_0 = v103.props.currentHistory;
    local l_networking_0 = v103.props.networking;
    local v107 = {
        socialProfileShareAnalytics = v103.props.socialProfileShareAnalytics, 
        shareLinksAnalytics = v103.props.shareLinksAnalytics
    };
    local l_ResolveLinkFromLinkId_0 = v103.props.ResolveLinkFromLinkId;
    local l_ResolveLinkFromLinkIdV2_0 = v103.props.ResolveLinkFromLinkIdV2;
    local l_CloseCentralOverlay_0 = v103.props.CloseCentralOverlay;
    local v111 = v61:resolve(v104, {
        history = l_currentHistory_0, 
        network = l_networking_0, 
        analyticsImpls = v107, 
        resolveLinkFromLinkId = l_ResolveLinkFromLinkId_0, 
        resolveLinkFromLinkIdV2 = l_ResolveLinkFromLinkIdV2_0, 
        launchGame = l_LaunchGame_0, 
        closeCentralOverlay = l_CloseCentralOverlay_0, 
        RefreshProfilePlatformActionInfo = if l_FFlagTCUpdateProfileCTAButton_0 then v103.props.RefreshProfilePlatformActionInfo else nil
    });
    return v25.resolve(v111):andThen(function(v112) --[[ Line: 260 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v103 (copy), l_AvatarScreen_0 (ref), v86 (ref), v38 (ref)
        if type(v112) == "table" and next(v112) then
            local v113 = v112[#v112];
            if not l_GetFFlagEnableUnifiedWebViews_0() and v103.props.browserService then
                v103.props.browserService:CloseBrowserWindow();
            end;
            local l_AvatarExperienceLandingPage_0 = l_AvatarScreen_0.AvatarExperienceLandingPage;
            if v113 and #v113 > 0 and l_AvatarExperienceLandingPage_0 and v113[1].name == l_AvatarExperienceLandingPage_0 then
                local v115;
                v115, l_AvatarExperienceLandingPage_0 = v86(v113);
                v103.props.NavigateIntoAvatarExperience(v115, l_AvatarExperienceLandingPage_0, true);
                return;
            else
                l_AvatarExperienceLandingPage_0 = v38.Chat;
                if v113 and #v113 > 0 and l_AvatarExperienceLandingPage_0 and v113[1].name == l_AvatarExperienceLandingPage_0 then
                    v103.navigateIntoChat(v86(v113));
                    return;
                else
                    l_AvatarExperienceLandingPage_0 = v38.SquadLobby;
                    if v113 and #v113 > 0 and l_AvatarExperienceLandingPage_0 and v113[1].name == l_AvatarExperienceLandingPage_0 then
                        v103.navigateIntoSquadLobbyIfExists(v86(v113));
                        return;
                    else
                        l_AvatarExperienceLandingPage_0 = v38.FAE;
                        if v113 and #v113 > 0 and l_AvatarExperienceLandingPage_0 and v113[1].name == l_AvatarExperienceLandingPage_0 then
                            v103.navigateIntoFAE(v86(v113));
                            return;
                        else
                            l_AvatarExperienceLandingPage_0 = v38.FAEUpsellOverlay;
                            if v113 and #v113 > 0 and l_AvatarExperienceLandingPage_0 and v113[1].name == l_AvatarExperienceLandingPage_0 then
                                v103.showFAEUpsellOverlay(v86(v113));
                                return;
                            else
                                v103.props.ResetNavigationHistory(v112);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v90.logPendingLink = function(v116, v117, v118) --[[ Line: 287 ]] --[[ Name: logPendingLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v83 (copy), v59 (copy), v53 (copy), v45 (copy), l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 (copy), l_QualifiedSignUpAttribution_0 (copy)
    local l_appAnalytics_0 = v116.props.appAnalytics;
    local v120, v121 = unpack(string.split(l_simpleUrlDecode_0(v117), "?"));
    local v122 = l_ParseQuery_0(v121);
    v120 = if v122 and v122.stamp then v122.stamp[1] else nil;
    v121 = v83(v117);
    local v123 = nil;
    if v59 then
        v123 = getJoinCode(v117);
    end;
    l_appAnalytics_0.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
        attributionUrl = v118, 
        shareLinkType = v121, 
        stamp = v120, 
        url = v117, 
        userDidLogIn = v116.loginTracking.userDidLogIn, 
        userDidSignUp = v116.loginTracking.userDidSignUp
    });
    local v124 = "PendingLink";
    if v116.loginTracking.userDidLogIn then
        v124 = "PendingLinkAfterLogin";
    elseif v116.loginTracking.userDidSignUp then
        v124 = "PendingLinkAfterSignUp";
    end;
    local v125 = v53 and v121 == "ExperienceInviteLinkType";
    if v121 ~= nil and v124 == "PendingLinkAfterSignUp" and (v121 == v45.ExperienceAffiliate or v125) and l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0() then
        local l_networking_1 = v116.props.networking;
        local v127 = if v122 and v122.code then v122.code[1] else nil;
        local l_ExperienceAffiliate_0 = v45.ExperienceAffiliate;
        if v121 == "ExperienceInviteLinkType" then
            l_ExperienceAffiliate_0 = v45.ExperienceInviteLinkType;
        end;
        l_QualifiedSignUpAttribution_0.attribute(l_networking_1, v127, v117, l_ExperienceAffiliate_0);
    end;
    if v123 ~= nil and v124 == "PendingLinkAfterSignUp" and v59 then
        local l_networking_2 = v116.props.networking;
        l_QualifiedSignUpAttribution_0.attributeJoinLink(l_networking_2, v117, v123);
    end;
    l_appAnalytics_0.Diag:reportCounter(v124, 1);
    if v121 ~= nil then
        local v130 = v124 .. v121;
        l_appAnalytics_0.Diag:reportCounter(v130, 1);
    end;
end;
v90.logProcessedLink = function(v131, v132, v133) --[[ Line: 345 ]] --[[ Name: logProcessedLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v83 (copy), v45 (copy), l_AuthenticatedVisitAttribution_0 (copy), v52 (copy), l_default_0 (copy)
    local l_appAnalytics_1 = v131.props.appAnalytics;
    local l_sessionService_0 = v131.props.sessionService;
    local l_userDidLogIn_0 = v131.loginTracking.userDidLogIn;
    local l_userDidSignUp_0 = v131.loginTracking.userDidSignUp;
    local v138, v139 = unpack(string.split(l_simpleUrlDecode_0(v132), "?"));
    local v140 = l_ParseQuery_0(v139);
    v138 = v83(v132);
    v139 = if v140 and v140.stamp then v140.stamp[1] else nil;
    local v141 = if v140 and v140.utm then v140.utm[1] else nil;
    local v142 = getJoinCode(v132);
    local l_l_sessionService_0_RootSID_0 = l_sessionService_0:GetRootSID();
    l_appAnalytics_1.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
        attributionUrl = v133, 
        sessionId = l_l_sessionService_0_RootSID_0, 
        shareLinkType = v138, 
        stamp = v139, 
        url = v132, 
        utm = v141, 
        userDidLogIn = v131.loginTracking.userDidLogIn, 
        userDidSignUp = v131.loginTracking.userDidSignUp
    });
    if v138 == v45.ExperienceAffiliate and not l_userDidSignUp_0 then
        local l_networking_3 = v131.props.networking;
        local v145 = if v140 and v140.code then v140.code[1] else nil;
        local l_ExperienceAffiliate_1 = v45.ExperienceAffiliate;
        l_AuthenticatedVisitAttribution_0.attribute(l_networking_3, v145, v132, l_ExperienceAffiliate_1, l_userDidLogIn_0);
    end;
    if v142 ~= nil and not l_userDidSignUp_0 then
        local l_networking_4 = v131.props.networking;
        l_AuthenticatedVisitAttribution_0.attributeJoinLink(l_networking_4, v132, v142, l_userDidLogIn_0);
    end;
    if v52 then
        local v148 = {
            url = v132, 
            attributionUrl = v133, 
            shareLinkType = v138
        };
        local v149 = {
            eventName = "DeeplinkProcessed", 
            backends = {
                l_default_0.TelemetryBackends.RobloxTelemetryCounter
            }
        };
        l_default_0:logRobloxTelemetryCounter(v149, 1, v148);
    end;
end;
v90.init = function(v150) --[[ Line: 397 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PostAuthDeepLinkAvailableSignal_0 (copy), v65 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy), l_PostAuthPendingLuaUrlAvailableSignal_0 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy)
    v150.loginTracking = {
        userDidLogIn = false, 
        userDidSignUp = false
    };
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        v150.deepLinkLuaHandlerStatusStore = v12.DeepLinkLuaReceiverStatusStore(false);
    end;
    v150:UpdateConnection();
    if l_FFlagEnableAuthDeepLinkReceiver_0 then
        l_PostAuthDeepLinkAvailableSignal_0:connect(function(v151) --[[ Line: 410 ]]
            -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v150 (copy), v65 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v150.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v151.url);
            end;
            v150:logProcessedLink(v151.url, v151.attributionUrl);
            if v65 and v150.props.navigationLocked then
                v150.pendingDeepLinkUrl = v151.url;
                l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
            else
                v150:navigate(v151.url);
            end;
            if v48 then
                v150.props.loggingProtocol:logEvent("deeplink_navigation_begin");
            end;
        end);
        l_PostAuthPendingLuaUrlAvailableSignal_0:connect(function(v152) --[[ Line: 435 ]]
            -- upvalues: v150 (copy)
            local l_url_1 = v152.url;
            local l_attributionUrl_1 = v152.attributionUrl;
            v150:logPendingLink(l_url_1, l_attributionUrl_1);
        end);
    end;
    v150.navigateIntoChat = function(_, v156) --[[ Line: 442 ]]
        -- upvalues: v150 (copy)
        if not (v150.props.getCanSeeChatTab and v150.props.getCanSeeChatTab()) then
            return;
        else
            local v157 = v156 and v156.entryPoint;
            v150.props.EnteredChatFromEntryPoint(v157);
            local v158 = v156 and v156.detail;
            v150.props.NavigateIntoChat({
                conversationId = v158
            }, true);
            return;
        end;
    end;
    v150.navigateIntoSquadLobbyIfExists = function(_, v160) --[[ Line: 457 ]]
        -- upvalues: v150 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (ref)
        if not (v150.props.getCanSeeChatTab and v150.props.getCanSeeChatTab()) then
            return;
        else
            local v161 = v160 and v160.detail;
            local v162 = if l_FFlagEnableSquadDeeplinkWithChatId_0 then v160 and v160.conversationId else nil;
            v150.props.NavigateIntoSquadLobbyIfExists({
                partyId = v161, 
                conversationId = v162
            }, true);
            return;
        end;
    end;
    v150.navigateIntoFAE = function(_, v164) --[[ Line: 470 ]]
        -- upvalues: v150 (copy)
        v150.props.NavigateIntoFAE(v164.source);
    end;
    v150.showFAEUpsellOverlay = function(_, v166) --[[ Line: 474 ]]
        -- upvalues: v150 (copy)
        v150.props.ShowFAEUpsellOverlay(v166.source, v166.isPhase2);
    end;
end;
v90.render = function(_) --[[ Line: 479 ]] --[[ Name: render ]]

end;
v90.didUpdate = function(v168, v169) --[[ Line: 481 ]] --[[ Name: didUpdate ]]
    -- upvalues: v43 (copy), v65 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy)
    if v169.userLoggedOut ~= v168.props.userLoggedOut and not v168.props.userLoggedOut then
        v168.loginTracking.userDidLogIn = v168.props.launchContext == v43.Login;
        v168.loginTracking.userDidSignUp = v168.props.launchContext == v43.SignUp;
    end;
    v168:UpdateConnection();
    if v65 and v169.navigationLocked and not v168.props.navigationLocked and v168.pendingDeepLinkUrl then
        local l_pendingDeepLinkUrl_0 = v168.pendingDeepLinkUrl;
        v168.pendingDeepLinkUrl = nil;
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkProcessedAfterNavigationUnlockConfig, 1);
        v168:navigate(l_pendingDeepLinkUrl_0);
    end;
end;
v90.willUnmount = function(v171) --[[ Line: 507 ]] --[[ Name: willUnmount ]]
    v171.props.linking:stopListeningForLuaURLs();
end;
v90 = v14.connect(function(v172, _) --[[ Line: 511 ]]
    -- upvalues: v27 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v17 (copy)
    local v174 = v172.Startup.AppDataStatus ~= v27.NotStarted;
    local v175 = if v172.Users[v172.LocalUserId] then v172.Users[v172.LocalUserId].name else nil;
    return {
        currentHistory = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v172) else v172.Navigation.history, 
        launchContext = v172.LaunchContext, 
        userLoggedOut = v172.AuthenticationStatus.status == v17.LOGGED_OUT, 
        username = v175, 
        appLoadingStarted = v174, 
        navigationLocked = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectNavigationLocked(v172) else v172.Navigation.lockNavigationActions
    };
end, function(v176) --[[ Line: 527 ]]
    -- upvalues: l_FFlagTCUpdateProfileCTAButton_0 (copy), v51 (copy), v16 (copy), l_EnteredChatFromEntryPoint_0 (copy), v20 (copy), l_NavigateIntoChat_0 (copy), l_NavigateIntoSquadLobbyIfExists_0 (copy), l_startFacialAgeEstimation_0 (copy), l_SocialUpsellType_0 (copy), l_NavigateBack_0 (copy), l_AmpApiProvider_0 (copy), v64 (copy), v63 (copy), l_AccessResponseEnum_0 (copy), l_ShowFAESocialUpsellOverlay_0 (copy), l_UpsellComponent_0 (copy), v26 (copy), v42 (copy)
    return {
        RefreshProfilePlatformActionInfo = l_FFlagTCUpdateProfileCTAButton_0 and function(v177) --[[ Line: 530 ]]
            -- upvalues: v176 (copy), v51 (ref)
            return v176(v51(v177));
        end or nil, 
        CloseCentralOverlay = function() --[[ Line: 534 ]] --[[ Name: CloseCentralOverlay ]]
            -- upvalues: v176 (copy), v16 (ref)
            return v176(v16());
        end, 
        EnteredChatFromEntryPoint = function(v178) --[[ Line: 537 ]] --[[ Name: EnteredChatFromEntryPoint ]]
            -- upvalues: v176 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v176(l_EnteredChatFromEntryPoint_0(v178));
        end, 
        NavigateIntoAvatarExperience = function(v179, v180, v181) --[[ Line: 540 ]] --[[ Name: NavigateIntoAvatarExperience ]]
            -- upvalues: v176 (copy), v20 (ref)
            return v176(v20(v179, v180, v181));
        end, 
        NavigateIntoChat = function(v182, v183) --[[ Line: 545 ]] --[[ Name: NavigateIntoChat ]]
            -- upvalues: v176 (copy), l_NavigateIntoChat_0 (ref)
            return v176(l_NavigateIntoChat_0(v182, v183));
        end, 
        NavigateIntoSquadLobbyIfExists = function(v184, v185) --[[ Line: 548 ]] --[[ Name: NavigateIntoSquadLobbyIfExists ]]
            -- upvalues: v176 (copy), l_NavigateIntoSquadLobbyIfExists_0 (ref)
            return v176(l_NavigateIntoSquadLobbyIfExists_0(v184, v185));
        end, 
        NavigateIntoFAE = function(v186) --[[ Line: 551 ]] --[[ Name: NavigateIntoFAE ]]
            -- upvalues: v176 (copy), l_startFacialAgeEstimation_0 (ref), l_SocialUpsellType_0 (ref), l_NavigateBack_0 (ref)
            return v176(l_startFacialAgeEstimation_0(l_SocialUpsellType_0.FacialAgeEstimation .. (v186 or ""), function() --[[ Line: 552 ]]
                -- upvalues: v176 (ref), l_NavigateBack_0 (ref)
                v176(l_NavigateBack_0());
            end, function() --[[ Line: 554 ]]
                -- upvalues: v176 (ref), l_NavigateBack_0 (ref)
                v176(l_NavigateBack_0());
            end, v186));
        end, 
        ShowFAEUpsellOverlay = function(v187, v188) --[[ Line: 558 ]] --[[ Name: ShowFAEUpsellOverlay ]]
            -- upvalues: l_AmpApiProvider_0 (ref), v64 (ref), v63 (ref), l_AccessResponseEnum_0 (ref), v176 (copy), l_ShowFAESocialUpsellOverlay_0 (ref), l_SocialUpsellType_0 (ref), l_UpsellComponent_0 (ref)
            if l_AmpApiProvider_0.upsellFeatureAccess(v64, {}, v63).access == l_AccessResponseEnum_0.Granted then
                v176(l_ShowFAESocialUpsellOverlay_0({
                    entryPointEventCtx = l_SocialUpsellType_0.FacialAgeEstimation .. (v187 or ""), 
                    upsellEntrySurface = v187 or "", 
                    upsellEntryComponent = l_UpsellComponent_0.PushNotifUI; 
                    v188
                }));
            end;
        end, 
        ResetNavigationHistory = function(v189) --[[ Line: 573 ]] --[[ Name: ResetNavigationHistory ]]
            -- upvalues: v176 (copy), v26 (ref)
            return v176(v26(nil, v189));
        end, 
        ResolveLinkFromLinkId = function(v190, v191) --[[ Line: 576 ]] --[[ Name: ResolveLinkFromLinkId ]]
            -- upvalues: v176 (copy), v42 (ref)
            return v176(v42.ShareLinksNetworking.ResolveLinkFromLinkId.API({
                linkId = v190, 
                linkType = v191
            }));
        end, 
        ResolveLinkFromLinkIdV2 = function(v192) --[[ Line: 582 ]] --[[ Name: ResolveLinkFromLinkIdV2 ]]
            -- upvalues: v176 (copy), v42 (ref)
            return v176(v42.ShareLinksNetworking.ResolveLinkFromLinkIdV2.API({
                linkId = v192
            }));
        end
    };
end)(v90);
v90 = l_UniversalAppPolicy_0.connect(function(v193) --[[ Line: 589 ]]
    return {
        getCanSeeChatTab = v193.getCanSeeChatTab
    };
end)(v90);
v90 = l_RoactServices_0.connect({
    appAnalytics = v28, 
    browserService = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_AppBrowserService_0, 
    linking = l_AppLinking_0, 
    loggingProtocol = l_AppLogging_0, 
    networking = v29, 
    sessionService = l_AppSessionService_0, 
    shareLinksAnalytics = v31, 
    socialProfileShareAnalytics = v32
})(v90);
local function v197(v194) --[[ Line: 606 ]]
    -- upvalues: v67 (ref), v11 (copy), v13 (copy), v90 (ref)
    local v195 = v67();
    local v196 = v11.Dictionary.join(v194, {
        setDrawerVisible = v195
    });
    return v13.createElement(v90, v196);
end;
if v66 then
    return v197;
else
    return v90;
end;