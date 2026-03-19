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
local v50 = game:DefineFastFlag("DeeplinkTelemetryCounters", false);
local v51 = game:DefineFastFlag("EnableExperienceInviteLinkTypeAttribution", false);
local v52 = game:DefineFastString("JoinCodePattern", ".*/join/([%w]+)");
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local l_FFlagEnableCommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCommsFAEUpsell;
local l_FFlagAddMinorFixesToUpsellAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell).Flags.FFlagAddMinorFixesToUpsellAnalytics;
local l_FFlagEnableAuthDeepLinkReceiver_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver;
local l_FFlagEnableDeepLinkHistoryWithModalAPI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI;
local v58 = game:DefineFastFlag("EnableJoinLinkAttribution", false);
local l_simpleUrlDecode_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode;
local v60 = v41.new(v40);
local l_ParseQuery_0 = require(l_CorePackages_0.Packages.StringUtilities).ParseQuery;
local v62 = game:DefineFastString("SocialCommsRestrictionsNamespace", "social/CommunicationRestrictions");
local v63 = game:DefineFastString("EligibleForCommsAgeVerificationUpsellFeatureName", "EligibleForCommsAgeVerificationUpsell");
local v64 = game:DefineFastFlag("EnableDeepLinkWaitForNavigationUnlock2", false);
local v65 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v66 = nil;
if v65 then
    v66 = require(l_CorePackages_0.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible;
end;
local l_PostAuthDeepLinkAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthDeepLinkAvailableSignal;
local l_PostAuthPendingLuaUrlAvailableSignal_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).EventReceivers.PostAuthPendingLuaUrlAvailableSignal;
local _ = function(v69) --[[ Line: 112 ]] --[[ Name: getQueryParams ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy)
    local _, v71 = unpack(string.split(l_simpleUrlDecode_0(v69), "?"));
    return (l_ParseQuery_0(v71));
end;
local function _(v73, v74) --[[ Line: 119 ]] --[[ Name: getFirstKeyValue ]]
    if v73 and v73[v74] then
        return v73[v74][1];
    else
        return nil;
    end;
end;
getJoinCode = function(v76) --[[ Line: 123 ]] --[[ Name: getJoinCode ]]
    -- upvalues: v52 (copy)
    return (v76:match(v52));
end;
local function v82(v77) --[[ Line: 128 ]] --[[ Name: getShareLinkType ]]
    -- upvalues: v45 (copy), l_HttpService_0 (copy)
    local v78 = string.lower(v77);
    for v79, v80 in pairs(v45) do
        if v78:find("&type=" .. string.lower(v80)) then
            return v79;
        else
            local v81 = l_HttpService_0:UrlEncode("&type=" .. v80);
            v81 = string.gsub(v81, "%%", "%%%%");
            if v78:find((string.lower(v81))) then
                return v79;
            end;
        end;
    end;
    return nil;
end;
local function v85(v83) --[[ Line: 148 ]] --[[ Name: getScreenAndParams ]]
    -- upvalues: v11 (copy)
    local v84 = v83[#v83];
    return v84.name, (v11.Dictionary.join(v84.extraProps or {}, {
        detail = v84.detail
    }));
end;
local function _(v86, v87) --[[ Line: 157 ]] --[[ Name: isRouteMatchByName ]]
    return v86 and #v86 > 0 and v87 and v86[1].name == v87;
end;
local v89 = v13.Component:extend("DeepLinkEventReceiver");
v89.UpdateConnection = function(v90) --[[ Line: 164 ]] --[[ Name: UpdateConnection ]]
    -- upvalues: l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), v64 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy)
    if not l_FFlagEnableAuthDeepLinkReceiver_0 then
        if v90.props.userLoggedOut or not v90.props.appLoadingStarted then
            v90.props.linking:stopListeningForLuaURLs();
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v90.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil);
            end;
        else
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                local v91 = v90.props.linking:getLastLuaURL();
                v90.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(v12.DeepLinkLuaPostAuthReceiverStatus.Ready, v91);
            end;
            v90.props.linking:getAndClearLastPendingURL():andThen(function(v92) --[[ Line: 184 ]]
                -- upvalues: v90 (copy)
                if not v92.hasPendingUrl then
                    return;
                else
                    local l_url_0 = v92.url;
                    local l_attributionUrl_0 = v92.attributionUrl;
                    v90:logPendingLink(l_url_0, l_attributionUrl_0);
                    return;
                end;
            end);
            v90.props.linking:listenForLuaURLs(function(v95, v96) --[[ Line: 194 ]]
                -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v90 (copy), v64 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
                if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                    v90.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v95);
                end;
                v90:logProcessedLink(v95, v96);
                if v64 and v90.props.navigationLocked then
                    v90.pendingDeepLinkUrl = v95;
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
                else
                    v90:navigate(v95);
                end;
                if v48 then
                    v90.props.loggingProtocol:logEvent("deeplink_navigation_begin");
                end;
            end);
        end;
    end;
    if v90.props.userLoggedOut then
        local v97 = v90.props.linking:getLastLuaURL();
        if v97 then
            local v98 = {};
            for v99, v100 in v97:gmatch("([^&=?]-)=([^&=?]+)") do
                v98[v99] = v100:gsub("+", " "):gsub("%%(%x%x)", function(v101) --[[ Line: 223 ]]
                    return (string.char((tonumber(v101, 16))));
                end);
            end;
            if v98.friendshipSourceType == "profileshare" then
                v90.props.socialProfileShareAnalytics.inviteePageLoad(v98.userId, "appSignIn");
            end;
        end;
    end;
end;
v89.navigate = function(v102, v103) --[[ Line: 235 ]] --[[ Name: navigate ]]
    -- upvalues: v65 (copy), v60 (copy), l_LaunchGame_0 (copy), v24 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_AvatarScreen_0 (copy), v85 (copy), v38 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy)
    if v65 then
        v102.props.setDrawerVisible(false);
    end;
    local l_currentHistory_0 = v102.props.currentHistory;
    local l_networking_0 = v102.props.networking;
    local v106 = {
        socialProfileShareAnalytics = v102.props.socialProfileShareAnalytics, 
        shareLinksAnalytics = v102.props.shareLinksAnalytics
    };
    local l_ResolveLinkFromLinkId_0 = v102.props.ResolveLinkFromLinkId;
    local l_ResolveLinkFromLinkIdV2_0 = v102.props.ResolveLinkFromLinkIdV2;
    local l_CloseCentralOverlay_0 = v102.props.CloseCentralOverlay;
    local v110 = v60:resolve(v103, {
        history = l_currentHistory_0, 
        network = l_networking_0, 
        analyticsImpls = v106, 
        resolveLinkFromLinkId = l_ResolveLinkFromLinkId_0, 
        resolveLinkFromLinkIdV2 = l_ResolveLinkFromLinkIdV2_0, 
        launchGame = l_LaunchGame_0, 
        closeCentralOverlay = l_CloseCentralOverlay_0
    });
    return v24.resolve(v110):andThen(function(v111) --[[ Line: 258 ]]
        -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (ref), v102 (copy), l_AvatarScreen_0 (ref), v85 (ref), v38 (ref), l_FFlagEnableCommsFAEUpsell_0 (ref)
        if type(v111) == "table" and next(v111) then
            local v112 = v111[#v111];
            if not l_GetFFlagEnableUnifiedWebViews_0() and v102.props.browserService then
                v102.props.browserService:CloseBrowserWindow();
            end;
            local l_AvatarExperienceLandingPage_0 = l_AvatarScreen_0.AvatarExperienceLandingPage;
            if v112 and #v112 > 0 and l_AvatarExperienceLandingPage_0 and v112[1].name == l_AvatarExperienceLandingPage_0 then
                local v114;
                v114, l_AvatarExperienceLandingPage_0 = v85(v112);
                v102.props.NavigateIntoAvatarExperience(v114, l_AvatarExperienceLandingPage_0, true);
                return;
            else
                l_AvatarExperienceLandingPage_0 = v38.Chat;
                if v112 and #v112 > 0 and l_AvatarExperienceLandingPage_0 and v112[1].name == l_AvatarExperienceLandingPage_0 then
                    v102.navigateIntoChat(v85(v112));
                    return;
                else
                    l_AvatarExperienceLandingPage_0 = v38.SquadLobby;
                    if v112 and #v112 > 0 and l_AvatarExperienceLandingPage_0 and v112[1].name == l_AvatarExperienceLandingPage_0 then
                        v102.navigateIntoSquadLobbyIfExists(v85(v112));
                        return;
                    else
                        if l_FFlagEnableCommsFAEUpsell_0 then
                            l_AvatarExperienceLandingPage_0 = v38.FAE;
                            if v112 and #v112 > 0 and l_AvatarExperienceLandingPage_0 and v112[1].name == l_AvatarExperienceLandingPage_0 then
                                v102.navigateIntoFAE(v85(v112));
                                return;
                            end;
                        end;
                        if l_FFlagEnableCommsFAEUpsell_0 then
                            l_AvatarExperienceLandingPage_0 = v38.FAEUpsellOverlay;
                            if v112 and #v112 > 0 and l_AvatarExperienceLandingPage_0 and v112[1].name == l_AvatarExperienceLandingPage_0 then
                                v102.showFAEUpsellOverlay(v85(v112));
                                return;
                            end;
                        end;
                        v102.props.ResetNavigationHistory(v111);
                    end;
                end;
            end;
        end;
    end);
end;
v89.logPendingLink = function(v115, v116, v117) --[[ Line: 285 ]] --[[ Name: logPendingLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v82 (copy), v58 (copy), v51 (copy), v45 (copy), l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 (copy), l_QualifiedSignUpAttribution_0 (copy)
    local l_appAnalytics_0 = v115.props.appAnalytics;
    local v119, v120 = unpack(string.split(l_simpleUrlDecode_0(v116), "?"));
    local v121 = l_ParseQuery_0(v120);
    v119 = if v121 and v121.stamp then v121.stamp[1] else nil;
    v120 = v82(v116);
    local v122 = nil;
    if v58 then
        v122 = getJoinCode(v116);
    end;
    l_appAnalytics_0.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
        attributionUrl = v117, 
        shareLinkType = v120, 
        stamp = v119, 
        url = v116, 
        userDidLogIn = v115.loginTracking.userDidLogIn, 
        userDidSignUp = v115.loginTracking.userDidSignUp
    });
    local v123 = "PendingLink";
    if v115.loginTracking.userDidLogIn then
        v123 = "PendingLinkAfterLogin";
    elseif v115.loginTracking.userDidSignUp then
        v123 = "PendingLinkAfterSignUp";
    end;
    local v124 = v51 and v120 == "ExperienceInviteLinkType";
    if v120 ~= nil and v123 == "PendingLinkAfterSignUp" and (v120 == v45.ExperienceAffiliate or v124) and l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0() then
        local l_networking_1 = v115.props.networking;
        local v126 = if v121 and v121.code then v121.code[1] else nil;
        local l_ExperienceAffiliate_0 = v45.ExperienceAffiliate;
        if v120 == "ExperienceInviteLinkType" then
            l_ExperienceAffiliate_0 = v45.ExperienceInviteLinkType;
        end;
        l_QualifiedSignUpAttribution_0.attribute(l_networking_1, v126, v116, l_ExperienceAffiliate_0);
    end;
    if v122 ~= nil and v123 == "PendingLinkAfterSignUp" and v58 then
        local l_networking_2 = v115.props.networking;
        l_QualifiedSignUpAttribution_0.attributeJoinLink(l_networking_2, v116, v122);
    end;
    l_appAnalytics_0.Diag:reportCounter(v123, 1);
    if v120 ~= nil then
        local v129 = v123 .. v120;
        l_appAnalytics_0.Diag:reportCounter(v129, 1);
    end;
end;
v89.logProcessedLink = function(v130, v131, v132) --[[ Line: 343 ]] --[[ Name: logProcessedLink ]]
    -- upvalues: l_simpleUrlDecode_0 (copy), l_ParseQuery_0 (copy), v82 (copy), v45 (copy), l_AuthenticatedVisitAttribution_0 (copy), v50 (copy), l_default_0 (copy)
    local l_appAnalytics_1 = v130.props.appAnalytics;
    local l_sessionService_0 = v130.props.sessionService;
    local l_userDidLogIn_0 = v130.loginTracking.userDidLogIn;
    local l_userDidSignUp_0 = v130.loginTracking.userDidSignUp;
    local v137, v138 = unpack(string.split(l_simpleUrlDecode_0(v131), "?"));
    local v139 = l_ParseQuery_0(v138);
    v137 = v82(v131);
    v138 = if v139 and v139.stamp then v139.stamp[1] else nil;
    local v140 = if v139 and v139.utm then v139.utm[1] else nil;
    local v141 = getJoinCode(v131);
    local l_l_sessionService_0_RootSID_0 = l_sessionService_0:GetRootSID();
    l_appAnalytics_1.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
        attributionUrl = v132, 
        sessionId = l_l_sessionService_0_RootSID_0, 
        shareLinkType = v137, 
        stamp = v138, 
        url = v131, 
        utm = v140, 
        userDidLogIn = v130.loginTracking.userDidLogIn, 
        userDidSignUp = v130.loginTracking.userDidSignUp
    });
    if v137 == v45.ExperienceAffiliate and not l_userDidSignUp_0 then
        local l_networking_3 = v130.props.networking;
        local v144 = if v139 and v139.code then v139.code[1] else nil;
        local l_ExperienceAffiliate_1 = v45.ExperienceAffiliate;
        l_AuthenticatedVisitAttribution_0.attribute(l_networking_3, v144, v131, l_ExperienceAffiliate_1, l_userDidLogIn_0);
    end;
    if v141 ~= nil and not l_userDidSignUp_0 then
        local l_networking_4 = v130.props.networking;
        l_AuthenticatedVisitAttribution_0.attributeJoinLink(l_networking_4, v131, v141, l_userDidLogIn_0);
    end;
    if v50 then
        local v147 = {
            url = v131, 
            attributionUrl = v132, 
            shareLinkType = v137
        };
        local v148 = {
            eventName = "DeeplinkProcessed", 
            backends = {
                l_default_0.TelemetryBackends.RobloxTelemetryCounter
            }
        };
        l_default_0:logRobloxTelemetryCounter(v148, 1, v147);
    end;
end;
v89.init = function(v149) --[[ Line: 395 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (copy), v12 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PostAuthDeepLinkAvailableSignal_0 (copy), v64 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v48 (copy), l_PostAuthPendingLuaUrlAvailableSignal_0 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy)
    v149.loginTracking = {
        userDidLogIn = false, 
        userDidSignUp = false
    };
    if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
        v149.deepLinkLuaHandlerStatusStore = v12.DeepLinkLuaReceiverStatusStore(false);
    end;
    v149:UpdateConnection();
    if l_FFlagEnableAuthDeepLinkReceiver_0 then
        l_PostAuthDeepLinkAvailableSignal_0:connect(function(v150) --[[ Line: 408 ]]
            -- upvalues: l_FFlagEnableDeepLinkHistoryWithModalAPI_0 (ref), v149 (copy), v64 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v48 (ref)
            if l_FFlagEnableDeepLinkHistoryWithModalAPI_0 then
                v149.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(v150.url);
            end;
            v149:logProcessedLink(v150.url, v150.attributionUrl);
            if v64 and v149.props.navigationLocked then
                v149.pendingDeepLinkUrl = v150.url;
                l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkPendingDueToNavigationLockConfig, 1);
            else
                v149:navigate(v150.url);
            end;
            if v48 then
                v149.props.loggingProtocol:logEvent("deeplink_navigation_begin");
            end;
        end);
        l_PostAuthPendingLuaUrlAvailableSignal_0:connect(function(v151) --[[ Line: 433 ]]
            -- upvalues: v149 (copy)
            local l_url_1 = v151.url;
            local l_attributionUrl_1 = v151.attributionUrl;
            v149:logPendingLink(l_url_1, l_attributionUrl_1);
        end);
    end;
    v149.navigateIntoChat = function(_, v155) --[[ Line: 440 ]]
        -- upvalues: v149 (copy)
        if not (v149.props.getCanSeeChatTab and v149.props.getCanSeeChatTab()) then
            return;
        else
            local v156 = v155 and v155.entryPoint;
            v149.props.EnteredChatFromEntryPoint(v156);
            local v157 = v155 and v155.detail;
            v149.props.NavigateIntoChat({
                conversationId = v157
            }, true);
            return;
        end;
    end;
    v149.navigateIntoSquadLobbyIfExists = function(_, v159) --[[ Line: 455 ]]
        -- upvalues: v149 (copy), l_FFlagEnableSquadDeeplinkWithChatId_0 (ref)
        if not (v149.props.getCanSeeChatTab and v149.props.getCanSeeChatTab()) then
            return;
        else
            local v160 = v159 and v159.detail;
            local v161 = if l_FFlagEnableSquadDeeplinkWithChatId_0 then v159 and v159.conversationId else nil;
            v149.props.NavigateIntoSquadLobbyIfExists({
                partyId = v160, 
                conversationId = v161
            }, true);
            return;
        end;
    end;
    if l_FFlagEnableCommsFAEUpsell_0 then
        v149.navigateIntoFAE = function(_, v163) --[[ Line: 470 ]]
            -- upvalues: v149 (copy)
            v149.props.NavigateIntoFAE(v163.source);
        end;
        v149.showFAEUpsellOverlay = function(_, v165) --[[ Line: 474 ]]
            -- upvalues: v149 (copy)
            v149.props.ShowFAEUpsellOverlay(v165.source, v165.isPhase2);
        end;
    end;
end;
v89.render = function(_) --[[ Line: 480 ]] --[[ Name: render ]]

end;
v89.didUpdate = function(v167, v168) --[[ Line: 482 ]] --[[ Name: didUpdate ]]
    -- upvalues: v43 (copy), v64 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy)
    if v168.userLoggedOut ~= v167.props.userLoggedOut and not v167.props.userLoggedOut then
        v167.loginTracking.userDidLogIn = v167.props.launchContext == v43.Login;
        v167.loginTracking.userDidSignUp = v167.props.launchContext == v43.SignUp;
    end;
    v167:UpdateConnection();
    if v64 and v168.navigationLocked and not v167.props.navigationLocked and v167.pendingDeepLinkUrl then
        local l_pendingDeepLinkUrl_0 = v167.pendingDeepLinkUrl;
        v167.pendingDeepLinkUrl = nil;
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.DeepLinkProcessedAfterNavigationUnlockConfig, 1);
        v167:navigate(l_pendingDeepLinkUrl_0);
    end;
end;
v89.willUnmount = function(v170) --[[ Line: 508 ]] --[[ Name: willUnmount ]]
    v170.props.linking:stopListeningForLuaURLs();
end;
v89 = v14.connect(function(v171, _) --[[ Line: 512 ]]
    -- upvalues: v26 (copy), v17 (copy)
    local v173 = v171.Startup.AppDataStatus ~= v26.NotStarted;
    local v174 = if v171.Users[v171.LocalUserId] then v171.Users[v171.LocalUserId].name else nil;
    return {
        currentHistory = v171.Navigation.history, 
        launchContext = v171.LaunchContext, 
        userLoggedOut = v171.AuthenticationStatus.status == v17.LOGGED_OUT, 
        username = v174, 
        appLoadingStarted = v173, 
        navigationLocked = v171.Navigation.lockNavigationActions
    };
end, function(v175) --[[ Line: 524 ]]
    -- upvalues: v16 (copy), l_EnteredChatFromEntryPoint_0 (copy), v19 (copy), l_NavigateIntoChat_0 (copy), l_NavigateIntoSquadLobbyIfExists_0 (copy), l_FFlagEnableCommsFAEUpsell_0 (copy), l_startFacialAgeEstimation_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), l_SocialUpsellType_0 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), l_NavigateBack_0 (copy), l_AmpApiProvider_0 (copy), v63 (copy), v62 (copy), l_AccessResponseEnum_0 (copy), l_ShowFAESocialUpsellOverlay_0 (copy), l_UpsellComponent_0 (copy), v25 (copy), v42 (copy)
    return {
        CloseCentralOverlay = function() --[[ Line: 526 ]] --[[ Name: CloseCentralOverlay ]]
            -- upvalues: v175 (copy), v16 (ref)
            return v175(v16());
        end, 
        EnteredChatFromEntryPoint = function(v176) --[[ Line: 529 ]] --[[ Name: EnteredChatFromEntryPoint ]]
            -- upvalues: v175 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v175(l_EnteredChatFromEntryPoint_0(v176));
        end, 
        NavigateIntoAvatarExperience = function(v177, v178, v179) --[[ Line: 532 ]] --[[ Name: NavigateIntoAvatarExperience ]]
            -- upvalues: v175 (copy), v19 (ref)
            return v175(v19(v177, v178, v179));
        end, 
        NavigateIntoChat = function(v180, v181) --[[ Line: 537 ]] --[[ Name: NavigateIntoChat ]]
            -- upvalues: v175 (copy), l_NavigateIntoChat_0 (ref)
            return v175(l_NavigateIntoChat_0(v180, v181));
        end, 
        NavigateIntoSquadLobbyIfExists = function(v182, v183) --[[ Line: 540 ]] --[[ Name: NavigateIntoSquadLobbyIfExists ]]
            -- upvalues: v175 (copy), l_NavigateIntoSquadLobbyIfExists_0 (ref)
            return v175(l_NavigateIntoSquadLobbyIfExists_0(v182, v183));
        end, 
        NavigateIntoFAE = function(v184) --[[ Line: 543 ]] --[[ Name: NavigateIntoFAE ]]
            -- upvalues: l_FFlagEnableCommsFAEUpsell_0 (ref), v175 (copy), l_startFacialAgeEstimation_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), l_NavigateBack_0 (ref)
            if l_FFlagEnableCommsFAEUpsell_0 then
                return v175(l_startFacialAgeEstimation_0(if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. (v184 or "") else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. (v184 or ""), function() --[[ Line: 550 ]]
                    -- upvalues: v175 (ref), l_NavigateBack_0 (ref)
                    v175(l_NavigateBack_0());
                end, function() --[[ Line: 553 ]]
                    -- upvalues: v175 (ref), l_NavigateBack_0 (ref)
                    v175(l_NavigateBack_0());
                end, v184));
            else
                return;
            end;
        end, 
        ShowFAEUpsellOverlay = function(v185, v186) --[[ Line: 561 ]] --[[ Name: ShowFAEUpsellOverlay ]]
            -- upvalues: l_AmpApiProvider_0 (ref), v63 (ref), v62 (ref), l_AccessResponseEnum_0 (ref), v175 (copy), l_ShowFAESocialUpsellOverlay_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref), l_UpsellComponent_0 (ref)
            if l_AmpApiProvider_0.upsellFeatureAccess(v63, {}, v62).access == l_AccessResponseEnum_0.Granted then
                v175(l_ShowFAESocialUpsellOverlay_0({
                    entryPointEventCtx = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. (v185 or "") else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. (v185 or ""), 
                    upsellEntrySurface = v185 or "", 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.PushNotifUI else nil; 
                    v186
                }));
            end;
        end, 
        ResetNavigationHistory = function(v187) --[[ Line: 580 ]] --[[ Name: ResetNavigationHistory ]]
            -- upvalues: v175 (copy), v25 (ref)
            return v175(v25(nil, v187));
        end, 
        ResolveLinkFromLinkId = function(v188, v189) --[[ Line: 583 ]] --[[ Name: ResolveLinkFromLinkId ]]
            -- upvalues: v175 (copy), v42 (ref)
            return v175(v42.ShareLinksNetworking.ResolveLinkFromLinkId.API({
                linkId = v188, 
                linkType = v189
            }));
        end, 
        ResolveLinkFromLinkIdV2 = function(v190) --[[ Line: 589 ]] --[[ Name: ResolveLinkFromLinkIdV2 ]]
            -- upvalues: v175 (copy), v42 (ref)
            return v175(v42.ShareLinksNetworking.ResolveLinkFromLinkIdV2.API({
                linkId = v190
            }));
        end
    };
end)(v89);
v89 = l_UniversalAppPolicy_0.connect(function(v191) --[[ Line: 596 ]]
    return {
        getCanSeeChatTab = v191.getCanSeeChatTab
    };
end)(v89);
v89 = l_RoactServices_0.connect({
    appAnalytics = v27, 
    browserService = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_AppBrowserService_0, 
    linking = l_AppLinking_0, 
    loggingProtocol = l_AppLogging_0, 
    networking = v28, 
    sessionService = l_AppSessionService_0, 
    shareLinksAnalytics = v30, 
    socialProfileShareAnalytics = v31
})(v89);
local function v195(v192) --[[ Line: 613 ]]
    -- upvalues: v66 (ref), v11 (copy), v13 (copy), v89 (ref)
    local v193 = v66();
    local v194 = v11.Dictionary.join(v192, {
        setDrawerVisible = v193
    });
    return v13.createElement(v89, v194);
end;
if v65 then
    return v195;
else
    return v89;
end;