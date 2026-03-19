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
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local l_ShowFAESocialUpsellOverlay_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Thunks.ShowFAESocialUpsellOverlay;
local l_startFacialAgeEstimation_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Thunks.startFacialAgeEstimation;
local l_NavigateIntoSquadLobbyIfExists_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoSquadLobbyIfExists;
local v24 = require(l_Modules_0.LuaApp.Promise);
local v25 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v26 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v27 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v28 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v30 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsShareLinks);
local v31 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsSocialProfileShare);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_QualifiedSignUpAttribution_0 = require(l_CorePackages_0.Workspace.Packages.AffiliateLinks).QualifiedSignUpAttribution;
local l_AuthenticatedVisitAttribution_0 = require(l_CorePackages_0.Workspace.Packages.AffiliateLinks).AuthenticatedVisitAttribution;
local l_SocialUpsellType_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Enums.SocialUpsellType;
local l_UpsellComponent_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellComponent;
local l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Constants.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX;
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
local v51 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local v52 = game:DefineFastFlag("DeeplinkTelemetryCounters", false);
local v53 = game:DefineFastFlag("EnableExperienceInviteLinkTypeAttribution", false);
local v54 = game:DefineFastString("JoinCodePattern", ".*/join/([%w]+)");
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCommsFAEUpsell;
local l_FFlagAddMinorFixesToUpsellAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Flags.FFlagAddMinorFixesToUpsellAnalytics;
local l_FFlagEnableAuthDeepLinkReceiver_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI;
local v60 = game:DefineFastFlag("EnableJoinLinkAttribution", false);
local l_simpleUrlDecode_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode;
local v62 = v41.new(v40);
local l_ParseQuery_0 = require(l_CorePackages_0.Packages.StringUtilities).ParseQuery;
local v64 = game:DefineFastString("SocialCommsRestrictionsNamespace", "social/CommunicationRestrictions");
local v65 = game:DefineFastString("EligibleForCommsAgeVerificationUpsellFeatureName", "EligibleForCommsAgeVerificationUpsell");
local v66 = game:DefineFastFlag("EnableDeepLinkWaitForNavigationUnlock2", false);
local v67 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v68 = nil;
if v67 then
    v68 = require(l_CorePackages_0.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible;
end;
local l_PostAuthDeepLinkAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthDeepLinkAvailableSignal;
local l_PostAuthPendingLuaUrlAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthPendingLuaUrlAvailableSignal;
local _ = function(v71) --[[ Line: 114 ]] --[[ Name: getQueryParams ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy)
    local _, v73 = unpack(string.split(l_simpleUrlDecode_0(v71), "?"));
    return (l_ParseQuery_0(v73));
end;
local function _(v75, v76) --[[ Line: 121 ]] --[[ Name: getFirstKeyValue ]]
    if v75 and v75[v76] then
        return v75[v76][1];
    else
        return nil;
    end;
end;
getJoinCode = function(v78) --[[ Line: 125 ]] --[[ Name: getJoinCode ]]
    -- upvalues: v54 (copy)
    return (v78:match(v54));
end;
local function v84(v79) --[[ Line: 130 ]] --[[ Name: getShareLinkType ]]
    -- upvalues: v45 (copy), l_HttpService_0 (copy)
    local v80 = string.lower(v79);
    for v81, v82 in pairs(v45) do
        if v80:find("&type=" .. string.lower(v82)) then
            return v81;
        else
            local v83 = l_HttpService_0:UrlEncode("&type=" .. v82);
            v83 = string.gsub(v83, "%%", "%%%%");
            if v80:find((string.lower(v83))) then
                return v81;
            end;
        end;
    end;
    return nil;
end;
local function v87(v85) --[[ Line: 150 ]] --[[ Name: getScreenAndParams ]]
    -- upvalues: v11 (copy)
    local v86 = v85[#v85];
    return v86.name, (v11.Dictionary.join(v86.extraProps or {}, {
        detail = v86.detail
    }));
end;
local function _(v88, v89) --[[ Line: 159 ]] --[[ Name: isRouteMatchByName ]]
    return v88 and #v88 > 0 and v89 and v88[1].name == v89;
end;
local v91 = v13.Component:extend("DeepLinkEventReceiver");
v91.UpdateConnection = function(v92) --[[ Line: 166 ]] --[[ Name: UpdateConnection ]]
    -- upvalues: l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), v66 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy)
    if not l_FFlagEnableAuthDeepLinkReceiver_0 then
        if v92.props.userLoggedOut or not v92.props.appLoadingStarted then
            v92.props.linking:stopListeningForLuaURLs();
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v92.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil);
            end;
        else
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                local v93 = v92.props.linking:getLastLuaURL();
                v92.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Ready, v93);
            end;
            v92.props.linking:getAndClearLastPendingURL():andThen(function(v94) --[[ Line: 186 ]]
                -- upvalues: v92 (copy)
                if not v94.hasPendingUrl then
                    return;
                else
                    local l_url_0 = v94.url;
                    local l_attributionUrl_0 = v94.attributionUrl;
                    v92:logPendingLink(l_url_0, l_attributionUrl_0);
                    return;
                end;
            end);
            v92.props.linking:listenForLuaURLs(function(v97, v98) --[[ Line: 196 ]]
                -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v92 (copy), v66 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
                if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                    v92.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v97);
                end;
                v92:logProcessedLink(v97, v98);
                if v66 and v92.props.navigationLocked then
                    v92.pendingDeepLinkUrl = v97;
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
                else
                    v92:navigate(v97);
                end;
                if v48 then
                    v92.props.loggingProtocol:logEvent("deeplink_navigation_begin");
                end;
            end);
        end;
    end;
    if v92.props.userLoggedOut then
        local v99 = v92.props.linking:getLastLuaURL();
        if v99 then
            local v100 = {};
            for v101, v102 in v99:gmatch("([^&=?]-)=([^&=?]+)") do
                v100[v101] = v102:gsub("+", " "):gsub("%%(%x%x)", function(v103) --[[ Line: 225 ]]
                    return (string.char((tonumber(v103, 16))));
                end);
            end;
            if v100.friendshipSourceType == "profileshare" then
                v92.props.socialProfileShareAnalytics.inviteePageLoad(v100.userId, "appSignIn");
            end;
        end;
    end;
end;
v91.navigate = function(v104, v105) --[[ Line: 237 ]] --[[ Name: navigate ]]
    -- upvalues: v67 (copy), v62 (copy), l_LaunchGame_0 (copy), l_FFlagTCUpdateProfileCTAButton_0 (copy), v24 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_AvatarScreen_0 (copy), v87 (copy), v38 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy)
    if v67 then
        v104.props.setDrawerVisible(false);
    end;
    local l_currentHistory_0 = v104.props.currentHistory;
    local l_networking_0 = v104.props.networking;
    local v108 = {
        socialProfileShareAnalytics = v104.props.socialProfileShareAnalytics, 
        shareLinksAnalytics = v104.props.shareLinksAnalytics
    };
    local l_ResolveLinkFromLinkId_0 = v104.props.ResolveLinkFromLinkId;
    local l_ResolveLinkFromLinkIdV2_0 = v104.props.ResolveLinkFromLinkIdV2;
    local l_CloseCentralOverlay_0 = v104.props.CloseCentralOverlay;
    local v112 = v62:resolve(v105, {
        history = l_currentHistory_0, 
        network = l_networking_0, 
        analyticsImpls = v108, 
        resolveLinkFromLinkId = l_ResolveLinkFromLinkId_0, 
        resolveLinkFromLinkIdV2 = l_ResolveLinkFromLinkIdV2_0, 
        launchGame = l_LaunchGame_0, 
        closeCentralOverlay = l_CloseCentralOverlay_0, 
        RefreshProfilePlatformActionInfo = if l_FFlagTCUpdateProfileCTAButton_0 then v104.props.RefreshProfilePlatformActionInfo else nil
    });
    return v24.resolve(v112):andThen(function(v113) --[[ Line: 263 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v104 (copy), l_AvatarScreen_0 (ref), v87 (ref), v38 (ref), l_FFlagEnableCommsFAEUpsell_0 (ref)
        if type(v113) == "table" and next(v113) then
            local v114 = v113[#v113];
            if not l_GetFFlagEnableUnifiedWebViews_0() and v104.props.browserService then
                v104.props.browserService:CloseBrowserWindow();
            end;
            local l_AvatarExperienceLandingPage_0 = l_AvatarScreen_0.AvatarExperienceLandingPage;
            if v114 and #v114 > 0 and l_AvatarExperienceLandingPage_0 and v114[1].name == l_AvatarExperienceLandingPage_0 then
                local v116;
                v116, l_AvatarExperienceLandingPage_0 = v87(v114);
                v104.props.NavigateIntoAvatarExperience(v116, l_AvatarExperienceLandingPage_0, true);
                return;
            else
                l_AvatarExperienceLandingPage_0 = v38.Chat;
                if v114 and #v114 > 0 and l_AvatarExperienceLandingPage_0 and v114[1].name == l_AvatarExperienceLandingPage_0 then
                    v104.navigateIntoChat(v87(v114));
                    return;
                else
                    l_AvatarExperienceLandingPage_0 = v38.SquadLobby;
                    if v114 and #v114 > 0 and l_AvatarExperienceLandingPage_0 and v114[1].name == l_AvatarExperienceLandingPage_0 then
                        v104.navigateIntoSquadLobbyIfExists(v87(v114));
                        return;
                    else
                        if l_FFlagEnableCommsFAEUpsell_0 then
                            l_AvatarExperienceLandingPage_0 = v38.FAE;
                            if v114 and #v114 > 0 and l_AvatarExperienceLandingPage_0 and v114[1].name == l_AvatarExperienceLandingPage_0 then
                                v104.navigateIntoFAE(v87(v114));
                                return;
                            end;
                        end;
                        if l_FFlagEnableCommsFAEUpsell_0 then
                            l_AvatarExperienceLandingPage_0 = v38.FAEUpsellOverlay;
                            if v114 and #v114 > 0 and l_AvatarExperienceLandingPage_0 and v114[1].name == l_AvatarExperienceLandingPage_0 then
                                v104.showFAEUpsellOverlay(v87(v114));
                                return;
                            end;
                        end;
                        v104.props.ResetNavigationHistory(v113);
                    end;
                end;
            end;
        end;
    end);
end;
v91.logPendingLink = function(v117, v118, v119) --[[ Line: 290 ]] --[[ Name: logPendingLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v84 (copy), v60 (copy), v53 (copy), v45 (copy), l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 (copy), l_QualifiedSignUpAttribution_0 (copy)
    local l_appAnalytics_0 = v117.props.appAnalytics;
    local v121, v122 = unpack(string.split(l_simpleUrlDecode_0(v118), "?"));
    local v123 = l_ParseQuery_0(v122);
    v121 = if v123 and v123.stamp then v123.stamp[1] else nil;
    v122 = v84(v118);
    local v124 = nil;
    if v60 then
        v124 = getJoinCode(v118);
    end;
    l_appAnalytics_0.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
        attributionUrl = v119, 
        shareLinkType = v122, 
        stamp = v121, 
        url = v118, 
        userDidLogIn = v117.loginTracking.userDidLogIn, 
        userDidSignUp = v117.loginTracking.userDidSignUp
    });
    local v125 = "PendingLink";
    if v117.loginTracking.userDidLogIn then
        v125 = "PendingLinkAfterLogin";
    elseif v117.loginTracking.userDidSignUp then
        v125 = "PendingLinkAfterSignUp";
    end;
    local v126 = v53 and v122 == "ExperienceInviteLinkType";
    if v122 ~= nil and v125 == "PendingLinkAfterSignUp" and (v122 == v45.ExperienceAffiliate or v126) and l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0() then
        local l_networking_1 = v117.props.networking;
        local v128 = if v123 and v123.code then v123.code[1] else nil;
        local l_ExperienceAffiliate_0 = v45.ExperienceAffiliate;
        if v122 == "ExperienceInviteLinkType" then
            l_ExperienceAffiliate_0 = v45.ExperienceInviteLinkType;
        end;
        l_QualifiedSignUpAttribution_0.attribute(l_networking_1, v128, v118, l_ExperienceAffiliate_0);
    end;
    if v124 ~= nil and v125 == "PendingLinkAfterSignUp" and v60 then
        local l_networking_2 = v117.props.networking;
        l_QualifiedSignUpAttribution_0.attributeJoinLink(l_networking_2, v118, v124);
    end;
    l_appAnalytics_0.Diag:reportCounter(v125, 1);
    if v122 ~= nil then
        local v131 = v125 .. v122;
        l_appAnalytics_0.Diag:reportCounter(v131, 1);
    end;
end;
v91.logProcessedLink = function(v132, v133, v134) --[[ Line: 348 ]] --[[ Name: logProcessedLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v84 (copy), v45 (copy), l_AuthenticatedVisitAttribution_0 (copy), v52 (copy), l_default_0 (copy)
    local l_appAnalytics_1 = v132.props.appAnalytics;
    local l_sessionService_0 = v132.props.sessionService;
    local l_userDidLogIn_0 = v132.loginTracking.userDidLogIn;
    local l_userDidSignUp_0 = v132.loginTracking.userDidSignUp;
    local v139, v140 = unpack(string.split(l_simpleUrlDecode_0(v133), "?"));
    local v141 = l_ParseQuery_0(v140);
    v139 = v84(v133);
    v140 = if v141 and v141.stamp then v141.stamp[1] else nil;
    local v142 = if v141 and v141.utm then v141.utm[1] else nil;
    local v143 = getJoinCode(v133);
    local l_l_sessionService_0_RootSID_0 = l_sessionService_0:GetRootSID();
    l_appAnalytics_1.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
        attributionUrl = v134, 
        sessionId = l_l_sessionService_0_RootSID_0, 
        shareLinkType = v139, 
        stamp = v140, 
        url = v133, 
        utm = v142, 
        userDidLogIn = v132.loginTracking.userDidLogIn, 
        userDidSignUp = v132.loginTracking.userDidSignUp
    });
    if v139 == v45.ExperienceAffiliate and not l_userDidSignUp_0 then
        local l_networking_3 = v132.props.networking;
        local v146 = if v141 and v141.code then v141.code[1] else nil;
        local l_ExperienceAffiliate_1 = v45.ExperienceAffiliate;
        l_AuthenticatedVisitAttribution_0.attribute(l_networking_3, v146, v133, l_ExperienceAffiliate_1, l_userDidLogIn_0);
    end;
    if v143 ~= nil and not l_userDidSignUp_0 then
        local l_networking_4 = v132.props.networking;
        l_AuthenticatedVisitAttribution_0.attributeJoinLink(l_networking_4, v133, v143, l_userDidLogIn_0);
    end;
    if v52 then
        local v149 = {
            url = v133, 
            attributionUrl = v134, 
            shareLinkType = v139
        };
        local v150 = {
            eventName = "DeeplinkProcessed", 
            backends = {
                l_default_0.TelemetryBackends.RobloxTelemetryCounter
            }
        };
        l_default_0:logRobloxTelemetryCounter(v150, 1, v149);
    end;
end;
v91.init = function(v151) --[[ Line: 400 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PostAuthDeepLinkAvailableSignal_0 (copy), v66 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy), l_PostAuthPendingLuaUrlAvailableSignal_0 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy)
    v151.loginTracking = {
        userDidLogIn = false, 
        userDidSignUp = false
    };
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        v151.deepLinkLuaHandlerStatusStore = v12.DeepLinkLuaReceiverStatusStore(false);
    end;
    v151:UpdateConnection();
    if l_FFlagEnableAuthDeepLinkReceiver_0 then
        l_PostAuthDeepLinkAvailableSignal_0:connect(function(v152) --[[ Line: 413 ]]
            -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v151 (copy), v66 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v151.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v152.url);
            end;
            v151:logProcessedLink(v152.url, v152.attributionUrl);
            if v66 and v151.props.navigationLocked then
                v151.pendingDeepLinkUrl = v152.url;
                l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
            else
                v151:navigate(v152.url);
            end;
            if v48 then
                v151.props.loggingProtocol:logEvent("deeplink_navigation_begin");
            end;
        end);
        l_PostAuthPendingLuaUrlAvailableSignal_0:connect(function(v153) --[[ Line: 438 ]]
            -- upvalues: v151 (copy)
            local l_url_1 = v153.url;
            local l_attributionUrl_1 = v153.attributionUrl;
            v151:logPendingLink(l_url_1, l_attributionUrl_1);
        end);
    end;
    v151.navigateIntoChat = function(_, v157) --[[ Line: 445 ]]
        -- upvalues: v151 (copy)
        if not (v151.props.getCanSeeChatTab and v151.props.getCanSeeChatTab()) then
            return;
        else
            local v158 = v157 and v157.entryPoint;
            v151.props.EnteredChatFromEntryPoint(v158);
            local v159 = v157 and v157.detail;
            v151.props.NavigateIntoChat({
                conversationId = v159
            }, true);
            return;
        end;
    end;
    v151.navigateIntoSquadLobbyIfExists = function(_, v161) --[[ Line: 460 ]]
        -- upvalues: v151 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (ref)
        if not (v151.props.getCanSeeChatTab and v151.props.getCanSeeChatTab()) then
            return;
        else
            local v162 = v161 and v161.detail;
            local v163 = if l_FFlagEnableSquadDeeplinkWithChatId_0 then v161 and v161.conversationId else nil;
            v151.props.NavigateIntoSquadLobbyIfExists({
                partyId = v162, 
                conversationId = v163
            }, true);
            return;
        end;
    end;
    if l_FFlagEnableCommsFAEUpsell_0 then
        v151.navigateIntoFAE = function(_, v165) --[[ Line: 475 ]]
            -- upvalues: v151 (copy)
            v151.props.NavigateIntoFAE(v165.source);
        end;
        v151.showFAEUpsellOverlay = function(_, v167) --[[ Line: 479 ]]
            -- upvalues: v151 (copy)
            v151.props.ShowFAEUpsellOverlay(v167.source, v167.isPhase2);
        end;
    end;
end;
v91.render = function(_) --[[ Line: 485 ]] --[[ Name: render ]]

end;
v91.didUpdate = function(v169, v170) --[[ Line: 487 ]] --[[ Name: didUpdate ]]
    -- upvalues: v43 (copy), v66 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy)
    if v170.userLoggedOut ~= v169.props.userLoggedOut and not v169.props.userLoggedOut then
        v169.loginTracking.userDidLogIn = v169.props.launchContext == v43.Login;
        v169.loginTracking.userDidSignUp = v169.props.launchContext == v43.SignUp;
    end;
    v169:UpdateConnection();
    if v66 and v170.navigationLocked and not v169.props.navigationLocked and v169.pendingDeepLinkUrl then
        local l_pendingDeepLinkUrl_0 = v169.pendingDeepLinkUrl;
        v169.pendingDeepLinkUrl = nil;
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkProcessedAfterNavigationUnlockConfig, 1);
        v169:navigate(l_pendingDeepLinkUrl_0);
    end;
end;
v91.willUnmount = function(v172) --[[ Line: 513 ]] --[[ Name: willUnmount ]]
    v172.props.linking:stopListeningForLuaURLs();
end;
v91 = v14.connect(function(v173, _) --[[ Line: 517 ]]
    -- upvalues: v26 (copy), v17 (copy)
    local v175 = v173.Startup.AppDataStatus ~= v26.NotStarted;
    local v176 = if v173.Users[v173.LocalUserId] then v173.Users[v173.LocalUserId].name else nil;
    return {
        currentHistory = v173.Navigation.history, 
        launchContext = v173.LaunchContext, 
        userLoggedOut = v173.AuthenticationStatus.status == v17.LOGGED_OUT, 
        username = v176, 
        appLoadingStarted = v175, 
        navigationLocked = v173.Navigation.lockNavigationActions
    };
end, function(v177) --[[ Line: 529 ]]
    -- upvalues: l_FFlagTCUpdateProfileCTAButton_0 (copy), v51 (copy), v16 (copy), l_EnteredChatFromEntryPoint_0 (copy), v19 (copy), l_NavigateIntoChat_0 (copy), l_NavigateIntoSquadLobbyIfExists_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy), l_startFacialAgeEstimation_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), l_SocialUpsellType_0 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), l_NavigateBack_0 (copy), l_AmpApiProvider_0 (copy), v65 (copy), v64 (copy), l_AccessResponseEnum_0 (copy), l_ShowFAESocialUpsellOverlay_0 (copy), l_UpsellComponent_0 (copy), v25 (copy), v42 (copy)
    return {
        RefreshProfilePlatformActionInfo = l_FFlagTCUpdateProfileCTAButton_0 and function(v178) --[[ Line: 532 ]]
            -- upvalues: v177 (copy), v51 (ref)
            return v177(v51.refreshProfilePlatformActionInfo(v178));
        end or nil, 
        CloseCentralOverlay = function() --[[ Line: 536 ]] --[[ Name: CloseCentralOverlay ]]
            -- upvalues: v177 (copy), v16 (ref)
            return v177(v16());
        end, 
        EnteredChatFromEntryPoint = function(v179) --[[ Line: 539 ]] --[[ Name: EnteredChatFromEntryPoint ]]
            -- upvalues: v177 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v177(l_EnteredChatFromEntryPoint_0(v179));
        end, 
        NavigateIntoAvatarExperience = function(v180, v181, v182) --[[ Line: 542 ]] --[[ Name: NavigateIntoAvatarExperience ]]
            -- upvalues: v177 (copy), v19 (ref)
            return v177(v19(v180, v181, v182));
        end, 
        NavigateIntoChat = function(v183, v184) --[[ Line: 547 ]] --[[ Name: NavigateIntoChat ]]
            -- upvalues: v177 (copy), l_NavigateIntoChat_0 (ref)
            return v177(l_NavigateIntoChat_0(v183, v184));
        end, 
        NavigateIntoSquadLobbyIfExists = function(v185, v186) --[[ Line: 550 ]] --[[ Name: NavigateIntoSquadLobbyIfExists ]]
            -- upvalues: v177 (copy), l_NavigateIntoSquadLobbyIfExists_0 (ref)
            return v177(l_NavigateIntoSquadLobbyIfExists_0(v185, v186));
        end, 
        NavigateIntoFAE = function(v187) --[[ Line: 553 ]] --[[ Name: NavigateIntoFAE ]]
            -- upvalues: l_FFlagEnableCommsFAEUpsell_0 (ref), v177 (copy), l_startFacialAgeEstimation_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), l_NavigateBack_0 (ref)
            if l_FFlagEnableCommsFAEUpsell_0 then
                return v177(l_startFacialAgeEstimation_0(if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. (v187 or "") else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. (v187 or ""), function() --[[ Line: 560 ]]
                    -- upvalues: v177 (ref), l_NavigateBack_0 (ref)
                    v177(l_NavigateBack_0());
                end, function() --[[ Line: 563 ]]
                    -- upvalues: v177 (ref), l_NavigateBack_0 (ref)
                    v177(l_NavigateBack_0());
                end, v187));
            else
                return;
            end;
        end, 
        ShowFAEUpsellOverlay = function(v188, v189) --[[ Line: 571 ]] --[[ Name: ShowFAEUpsellOverlay ]]
            -- upvalues: l_AmpApiProvider_0 (ref), v65 (ref), v64 (ref), l_AccessResponseEnum_0 (ref), v177 (copy), l_ShowFAESocialUpsellOverlay_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), l_UpsellComponent_0 (ref)
            if l_AmpApiProvider_0.upsellFeatureAccess(v65, {}, v64).access == l_AccessResponseEnum_0.Granted then
                v177(l_ShowFAESocialUpsellOverlay_0({
                    entryPointEventCtx = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. (v188 or "") else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. (v188 or ""), 
                    upsellEntrySurface = v188 or "", 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.PushNotifUI else nil; 
                    v189
                }));
            end;
        end, 
        ResetNavigationHistory = function(v190) --[[ Line: 590 ]] --[[ Name: ResetNavigationHistory ]]
            -- upvalues: v177 (copy), v25 (ref)
            return v177(v25(nil, v190));
        end, 
        ResolveLinkFromLinkId = function(v191, v192) --[[ Line: 593 ]] --[[ Name: ResolveLinkFromLinkId ]]
            -- upvalues: v177 (copy), v42 (ref)
            return v177(v42.ShareLinksNetworking.ResolveLinkFromLinkId.API({
                linkId = v191, 
                linkType = v192
            }));
        end, 
        ResolveLinkFromLinkIdV2 = function(v193) --[[ Line: 599 ]] --[[ Name: ResolveLinkFromLinkIdV2 ]]
            -- upvalues: v177 (copy), v42 (ref)
            return v177(v42.ShareLinksNetworking.ResolveLinkFromLinkIdV2.API({
                linkId = v193
            }));
        end
    };
end)(v91);
v91 = l_UniversalAppPolicy_0.connect(function(v194) --[[ Line: 606 ]]
    return {
        getCanSeeChatTab = v194.getCanSeeChatTab
    };
end)(v91);
v91 = l_RoactServices_0.connect({
    appAnalytics = v27, 
    browserService = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_AppBrowserService_0, 
    linking = l_AppLinking_0, 
    loggingProtocol = l_AppLogging_0, 
    networking = v28, 
    sessionService = l_AppSessionService_0, 
    shareLinksAnalytics = v30, 
    socialProfileShareAnalytics = v31
})(v91);
local function v198(v195) --[[ Line: 623 ]]
    -- upvalues: v68 (ref), v11 (copy), v13 (copy), v91 (ref)
    local v196 = v68();
    local v197 = v11.Dictionary.join(v195, {
        setDrawerVisible = v196
    });
    return v13.createElement(v91, v197);
end;
if v67 then
    return v198;
else
    return v91;
end;