local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v15 = require(l_Modules_0.LuaApp.Actions.SetStatusBarHeight);
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.TenFootLogoWithContentsLayout);
local v18 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v19 = require(l_Modules_0.LuaApp.FitChildren);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchSignUpBundles);
local v21 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v22 = require(l_Modules_0.Luobu.Components.Authentication.LuobuLandingPage);
local l_WechatQQLoginPage_0 = require(l_CorePackages_0.Workspace.Packages.WechatQQAuth).Components.WechatQQLoginPage;
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.VideoWithContentsLayout);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.CustomizedInviteLandingPageLayout);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVideoLanding);
local v28 = game:DefineFastFlag("ShowCustomizedLandingPageWithoutInviter1", false);
local l_AppAppLifecycleObserverService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService;
local l_game_EngineFeature_0 = game:GetEngineFeature("LandingPageMountSignalEnabled");
local v31 = require(l_Modules_0.LuaApp.Flags.GetFStringLandingVideoAsset);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v37 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_UIConstants_0 = v37.Common.UIConstants;
local l_ThirdPartySwitchAccountComponent_0 = v37.Components.ThirdPartySwitchAccountComponent;
local l_authTimingUtil_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).authTimingUtil;
local v41 = require(l_Modules_0.LuaApp.Components.Authentication.useLandingPageNavigationBindings);
local v42 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v43 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v44 = require(l_Modules_0.LuaApp.FlagSettings);
local v45 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitcher);
local v46 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_default_0 = v46.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v46.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v49 = require(l_Modules_0.LuaApp.Flags.FFlagShouldLinkBrowserTrackerToDevice);
local v50 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v51 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v52 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPKoreaCompliance);
local v53 = require(l_Modules_0.LuaApp.Flags.FFlagBypassGUACKoreaCompliance);
local v54 = require(l_Modules_0.LuaApp.Http.Requests.PostAssociateBrowserTrackerToDevice);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v56 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v58 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v59 = require(l_Modules_0.LuaApp.Thunks.Authentication.Util.getDeepLinkData);
local v60 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local l_FFlagEnableLuaLoginRevamp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLuaLoginRevamp;
local l_FFlagLuafiedWechatQQLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuafiedWechatQQLogin;
local l_FStringLuaLoginRevampIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaLoginRevampIxpLayer;
local l_GetFFlagEnableMultiPageSignup_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMultiPageSignup;
local l_FFlagLuaEnableCustomizedInviteLandingPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPage;
local l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPageForTesting;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLoginV1ForcedUsernameOverride;
local l_FFlagEnableLoginV2ForcedUsernameOverride_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLoginV2ForcedUsernameOverride;
local v69 = game:DefineFastFlag("CustomizedLandingEDP", false);
local v70 = game:DefineFastFlag("CustomizedLandingLaunchGame", false);
local v71 = game:DefineFastFlag("EnablePrewarmChallengeWebView", false);
local v72 = game:DefineFastString("CustomizedLandingExperienceSort", "");
local v77 = (function(v73) --[[ Line: 100 ]] --[[ Name: parseStringToSet ]]
    local v74 = {};
    for v75 in string.gmatch(v73, "([^,]+)") do
        local v76 = v75:gsub("^%s*(.-)%s*$", "%1");
        if v76 ~= "" then
            v74[v76] = true;
        end;
    end;
    return v74;
end)(v72);
local l_InvoluntaryLogoutAnalyticsEvents_0 = v37.Analytics.InvoluntaryLogoutAnalyticsEvents;
local l_authPageload_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authPageload;
local v80 = v2.PureComponent:extend("LandingPage");
local v81 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v83 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v83.Button;
local l_ButtonVariant_0 = v83.Enums.ButtonVariant;
local l_ButtonSize_0 = v83.Enums.ButtonSize;
local v87 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v88 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
local l_GetFFlagEnableLuaAccountPicker_0 = v87.GetFFlagEnableLuaAccountPicker;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v87.GetFFlagEnableAccountSwitcherRedesignIXP;
local v91 = require(l_Modules_0.LuaApp.Thunks.Authentication.SessionCheck);
local l_AccountCarouselContainer_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.AccountCarouselContainer;
local v93 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.SwitchToAccount);
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_CorePackages_0.Workspace.Packages.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local v95 = require(l_Modules_0.LuaApp.Thunks.Challenge.PrewarmWebView);
local l_FFlagAuthSecExclusions_0 = v87.FFlagAuthSecExclusions;
local l_GetFFlagSetStatusBarHeight_0 = v87.GetFFlagSetStatusBarHeight;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v87.FFlagEnableAuthDeepLinkReceiver;
local l_PreAuthDeepLinkUrlStore_0 = v37.Stores.PreAuthDeepLinkUrlStore;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_GetUniverseIdFromPlaceId_0 = v37.Thunks.GetUniverseIdFromPlaceId;
local l_AccountPickerListView_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.AccountPickerListView;
local l_GetFIntAccountPickerVariantOverride_0 = v87.GetFIntAccountPickerVariantOverride;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_game_EngineFeature_1 = game:GetEngineFeature("ThirdPartyUserServiceIsAccountSwitchingSupported");
local v106 = game:DefineFastFlag("ShowLandingPageThirdPartySwitchAccountButton", false);
local v107 = game:DefineFastFlag("ShowBrazilContentRatingBadge4", false);
local l_BrazilContentRatingBadge_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.BrazilContentRatingBadge;
v80.init = function(v109) --[[ Line: 160 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), l_authTimingUtil_0 (copy), v21 (copy), v27 (copy), v31 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v69 (copy), v59 (copy), v28 (copy), v70 (copy), l_ExperienceService_0 (copy), l_GetUniverseIdFromPlaceId_0 (copy), v72 (copy), v77 (copy), v43 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), v44 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_GetFFlagEnableLuaAccountPicker_0 (copy), l_FFlagAuthSecExclusions_0 (copy), v50 (copy), v51 (copy), v53 (copy), v52 (copy), v49 (copy), v54 (copy), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (copy), l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0 (copy)
    if v109.props.shouldDoSessionCheck then
        local v110 = v24.fromLocalStorage();
        v109.props.sessionCheck(v109.props.networking, v110, v109.props.analytics, v109.props.appPolicy, v109.props.loggingProtocol);
    end;
    l_authTimingUtil_0.landingPageLoadStart();
    v109.state = {
        shouldShowAccountSwitcherButton = false, 
        landingVideoAsset = "", 
        credProtocolIsAvailableResponse = nil, 
        shouldShowCustomizedLandingPage = false, 
        accountPickerAccounts = {}, 
        deepLinkData = nil
    };
    if v21.getIsFirstLaunchAfterInstall() == "true" then
        wait(v109.props.landingPageLatency);
    end;
    if v27() then
        if v109.props.landingVideoAsset and type(v109.props.landingVideoAsset) == "string" and string.len(v109.props.landingVideoAsset) > 0 then
            v109:setState({
                landingVideoAsset = v109.props.landingVideoAsset
            });
        else
            v109:setState({
                landingVideoAsset = v31()
            });
        end;
    end;
    v109.maybeShowCustomizedLandingPage = function() --[[ Line: 203 ]]
        -- upvalues: l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v69 (ref), v109 (copy), v59 (ref), v28 (ref), v70 (ref), l_ExperienceService_0 (ref), l_GetUniverseIdFromPlaceId_0 (ref), v72 (ref), v77 (ref)
        local v111 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        if v69 and v111 and string.find(v111, "game_details") then
            local v112 = v111:match("gameId=(%d+)");
            if v112 then
                v109:setState({
                    shouldShowCustomizedLandingPage = true, 
                    deepLinkData = {
                        universeId = v112
                    }
                });
            end;
        end;
        if v111 and string.find(v111, "share") then
            local v113 = v59(v109.props.networking, v111);
            if v113 then
                local l_universeId_0 = v113.universeId;
                local l_inviterId_0 = v113.inviterId;
                if v28 and l_universeId_0 or l_universeId_0 and l_inviterId_0 then
                    v109:setState({
                        shouldShowCustomizedLandingPage = true, 
                        deepLinkData = v113
                    });
                end;
            end;
        end;
        if v70 then
            local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
            if l_l_ExperienceService_0_PendingJoinAttempt_0 then
                local l_placeId_0 = l_l_ExperienceService_0_PendingJoinAttempt_0.placeId;
                if l_placeId_0 then
                    l_GetUniverseIdFromPlaceId_0(v109.props.networking, l_placeId_0):andThen(function(v118) --[[ Line: 238 ]]
                        -- upvalues: v109 (ref)
                        if v118 then
                            v109:setState({
                                shouldShowCustomizedLandingPage = true, 
                                deepLinkData = {
                                    universeId = v118
                                }
                            });
                        end;
                    end):catch(function(_) --[[ Line: 247 ]]

                    end);
                end;
            end;
        end;
        if v72 and v111 and string.find(v111, "navigation/experience_sort") then
            local v120 = v111:match("sortId=([^&]+)");
            if v120 and v77[v120] then
                v109:setState({
                    shouldShowCustomizedLandingPage = true, 
                    deepLinkData = {
                        genre = v120
                    }
                });
            end;
        end;
    end;
    v109.navigateToSignUp = function(v121) --[[ Line: 272 ]]
        -- upvalues: v109 (copy), v43 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v44 (ref)
        local l_networking_0 = v109.props.networking;
        local l_analytics_0 = v109.props.analytics;
        local l_fetchSignUpBundles_0 = v109.props.fetchSignUpBundles;
        local l_navigateToSinglePageSignUp_0 = v109.props.navigateToSinglePageSignUp;
        local l_navigateToMultiPageSignUp_0 = v109.props.navigateToMultiPageSignUp;
        local l_navigateToBirthdayPage_0 = v109.props.navigateToBirthdayPage;
        l_analytics_0.reportSignUpButtonClicked(v43.Context.LandingScreen);
        if l_GetFFlagEnableMultiPageSignup_0() and v109.props.shouldEnableMultiPageSignup then
            l_navigateToMultiPageSignUp_0(v121);
            return;
        elseif v109.props.shouldShowMultipageSignupDirectionalTest then
            l_navigateToBirthdayPage_0();
            return;
        elseif v44.SinglePageSignUpEnabled() then
            l_navigateToSinglePageSignUp_0();
            return;
        else
            l_fetchSignUpBundles_0(l_networking_0);
            l_navigateToBirthdayPage_0();
            return;
        end;
    end;
    v109.navigateToLogin = function(v128, v129) --[[ Line: 302 ]]
        -- upvalues: l_FFlagEnableLuaLoginRevamp_0 (ref), v109 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref)
        if l_FFlagEnableLuaLoginRevamp_0 and v109.props.showLoginRevamp then
            if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then
                v109.props.gotoLoginV2(v128, v129);
                return;
            else
                v109.props.gotoLoginV2(v128);
                return;
            end;
        elseif l_FFlagEnableLoginV1ForcedUsernameOverride_0 then
            v109.props.gotoLogin(v129);
            return;
        else
            v109.props.gotoLogin();
            return;
        end;
    end;
    v109.openAccountSwitcher = function() --[[ Line: 318 ]]
        -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (ref), v109 (copy), l_FFlagAuthSecExclusions_0 (ref), v50 (ref), v21 (ref)
        if l_GetFFlagEnableLuaAccountPicker_0() and v109.props.accountPickerVariantEnabled ~= 0 and v109.props.accountPickerVariantEnabled ~= nil then
            return;
        elseif l_FFlagAuthSecExclusions_0 and v109.props.excludeAccountSwitcher then
            return;
        else
            if v50 == true then
                local v130 = v21.getAccountBlob();
                local function v133(v131) --[[ Line: 333 ]]
                    -- upvalues: v109 (ref)
                    local v132 = false;
                    if v131 ~= nil then
                        v132 = v131 > 0;
                    end;
                    v109:setState({
                        shouldShowAccountSwitcherButton = v132
                    });
                end;
                if v130 and v130 ~= "" then
                    v109.props.showAccountSwitcher(v109.props.networking, v133, v109.props.analytics, v109.props.appPolicy, v109.props.omniRecommendationsRequest, v109.props.enableFoundationDesign, v109.props.enableSignedOutAccounts);
                end;
            end;
            return;
        end;
    end;
    v109.getShouldShowKISAAgreements = function() --[[ Line: 354 ]]
        -- upvalues: v51 (ref), v109 (copy), v53 (ref), v52 (ref)
        return v51 and (v109.props.useKoreaKISAUserAgreementPopup or v53) and (v109.props.shouldShowKoreanKISASignUpFlow or v52);
    end;
    if v49() then
        local l_networking_1 = v109.props.networking;
        v54(l_networking_1):catch(function() --[[ Line: 362 ]]

        end);
    end;
    if l_FFlagLuaEnableCustomizedInviteLandingPage_0 and (v109.props.isCustomizedLandingPageEnabled or l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0) then
        v109.maybeShowCustomizedLandingPage();
    end;
end;
v80.didUpdate = function(v135, _) --[[ Line: 374 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagSetStatusBarHeight_0 (copy), l_UIConstants_0 (copy)
    if l_GetFFlagSetStatusBarHeight_0() and v135.props.isCompact then
        v135.props.setStatusBarHeight(l_UIConstants_0.STATUS_BAR_HEIGHT);
    end;
end;
v80.render = function(v137) --[[ Line: 382 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (copy), l_AccountCarouselContainer_0 (copy), l_AccountPickerListView_0 (copy), v2 (copy), v21 (copy), v9 (copy), l_UiMode_0 (copy), v17 (copy), v16 (copy), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (copy), v27 (copy), v25 (copy), v26 (copy), v107 (copy), l_FormFactor_0 (copy), v42 (copy), l_BrazilContentRatingBadge_0 (copy), v19 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_TelemetryConfigs_0 (copy), v50 (copy), v88 (copy), v43 (copy), l_ThirdPartyUserService_0 (copy), l_game_EngineFeature_1 (copy), v106 (copy), l_ThirdPartySwitchAccountComponent_0 (copy), v18 (copy)
    if l_GetFFlagEnableLuaAccountPicker_0() and v137.props.accountPickerVariantEnabled ~= 0 and v137.props.accountPickerVariantEnabled ~= nil and #v137.state.accountPickerAccounts > 0 then
        local v138 = {
            [1] = l_AccountCarouselContainer_0, 
            [2] = l_AccountPickerListView_0
        };
        return v2.createElement(v138[v137.props.accountPickerVariantEnabled], {
            accounts = v137.state.accountPickerAccounts, 
            avatarSize = UDim2.new(0, 160, 0, 240), 
            onAvatarActivated = function(v139, v140, v141) --[[ Line: 397 ]] --[[ Name: onAvatarActivated ]]
                -- upvalues: v21 (ref), v137 (copy)
                if v141 then
                    v21.setAccountSwitchTargetUsername(v140);
                    v21.flush();
                    v137.props.navigateSwitchToAccount(v137.props.networking, v139, v137.props.appPolicy, v137.props.omniRecommendationsRequest, v137.props.analytics);
                    return;
                else
                    v137.navigateToLogin(v137.state.credProtocolIsAvailableResponse, v140);
                    return;
                end;
            end, 
            setAccountPickerAccounts = function(v142) --[[ Line: 412 ]] --[[ Name: setAccountPickerAccounts ]]
                -- upvalues: v137 (copy)
                v137:setState({
                    accountPickerAccounts = v142
                });
            end, 
            navigateToSignup = function() --[[ Line: 417 ]] --[[ Name: navigateToSignup ]]
                -- upvalues: v137 (copy)
                v137.navigateToSignUp(v137.state.credProtocolIsAvailableResponse);
            end, 
            navigateToLogin = function() --[[ Line: 420 ]] --[[ Name: navigateToLogin ]]
                -- upvalues: v137 (copy)
                v137.navigateToLogin(v137.state.credProtocolIsAvailableResponse, "");
            end
        });
    else
        return v9({
            signUpText = "Authentication.SignUp.Action.CreateAccount", 
            signInText = "Authentication.Login.Action.SignIn", 
            switchAccountsText = "Authentication.AccountSwitch.Action.SwitchAccount"
        })(function(v143) --[[ Line: 430 ]]
            -- upvalues: v137 (copy), l_UiMode_0 (ref), v17 (ref), v16 (ref), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (ref), v27 (ref), v25 (ref), v26 (ref), v107 (ref), v2 (ref), l_FormFactor_0 (ref), v42 (ref), l_BrazilContentRatingBadge_0 (ref), v19 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_TelemetryConfigs_0 (ref), v50 (ref), v88 (ref), v43 (ref), l_ThirdPartyUserService_0 (ref), l_game_EngineFeature_1 (ref), v106 (ref), l_ThirdPartySwitchAccountComponent_0 (ref), v18 (ref)
            local l_LandingPage_0 = v137.props.tokens.LuaApps.LandingPage;
            local v145 = v137.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
            local v146 = if v145 then v17 else v16;
            local v147 = l_FFlagLuaEnableCustomizedInviteLandingPage_0 and v137.state.shouldShowCustomizedLandingPage;
            local v148 = v27() and v137.props.landingVideoEnabled and not v147;
            if v148 then
                v146 = v25;
            elseif v147 then
                v146 = v26;
            end;
            local l_signUpText_0 = v143.signUpText;
            local v150 = v107 and v137.props.showBrazilContentRatingLogo and v137.props.shouldDisplayBrazilAgeRatingIXP;
            local l_createElement_0 = v2.createElement;
            local l_v146_0 = v146;
            local v153 = {
                ContentAlign = if not v145 and v137.props.formFactor == l_FormFactor_0.COMPACT then v42.Bottom else v42.Top, 
                ref = v137.props.containerRef, 
                VNAgeBadgeEnabled = v137.props.showVNGAge12Badge, 
                screenSize = if not not v27() or v147 then v137.props.screenSize else nil, 
                statusBarHeight = if not not v27() or v147 then v137.props.statusBarHeight else nil, 
                globalGuiInset = if not not v27() or v147 then v137.props.globalGuiInset else nil, 
                formFactor = if v27() then v137.props.formFactor else nil, 
                landingVideoAsset = if v27() then v137.state.landingVideoAsset else nil, 
                deepLinkData = if v147 then v137.state.deepLinkData else nil, 
                containerRef = v137.props.containerRef, 
                FooterElement = if v150 then v2.createElement(l_BrazilContentRatingBadge_0) else nil, 
                FooterHeight = if v150 then l_LandingPage_0.brazilBadgeHeight else 0
            };
            local v154 = {};
            local l_createElement_1 = v2.createElement;
            local l_FitFrame_0 = v19.FitFrame;
            local v157 = {
                Size = UDim2.new(1, -40, 0, 0), 
                fitAxis = v19.FitAxis.Height, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ref = v137.props.ref
            };
            local v158 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, l_LandingPage_0.contentPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 36)
                }), 
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 0), 
                    MaxSize = Vector2.new(l_LandingPage_0.buttonWidth, 1e999)
                }), 
                SignUpButton = if not v148 then v2.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    size = l_ButtonSize_0.Large, 
                    text = l_signUpText_0, 
                    onActivated = function() --[[ Line: 503 ]] --[[ Name: onActivated ]]
                        -- upvalues: v137 (ref), l_TelemetryConfigs_0 (ref)
                        v137.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingSignupButtonClickedConfig, 1);
                        v137.navigateToSignUp(v137.state.credProtocolIsAvailableResponse);
                    end, 
                    width = UDim.new(1, 0), 
                    [v2.Ref] = v137.props.defaultRef
                }) else v2.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = l_ButtonSize_0.Large, 
                    width = UDim.new(1, 0), 
                    text = l_signUpText_0, 
                    onActivated = function() --[[ Line: 522 ]] --[[ Name: onActivated ]]
                        -- upvalues: v137 (ref), l_TelemetryConfigs_0 (ref)
                        v137.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingSignupButtonClickedConfig, 1);
                        v137.navigateToSignUp(v137.state.credProtocolIsAvailableResponse);
                    end, 
                    [v2.Ref] = v137.props.defaultRef
                })
            };
            local v159 = false;
            if v50 == true then
                v159 = v137.state.shouldShowAccountSwitcherButton and v2.createElement(l_Button_0, {
                    LayoutOrder = 2, 
                    variant = if v88 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                    size = l_ButtonSize_0.Large, 
                    width = UDim.new(1, 0), 
                    text = v143.switchAccountsText, 
                    onActivated = function() --[[ Line: 543 ]] --[[ Name: onActivated ]]
                        -- upvalues: v137 (ref), v43 (ref)
                        v137.props.analytics.reportSwitchAccountButtonClicked(v43.Context.LandingScreen);
                        v137.openAccountSwitcher();
                    end
                });
            end;
            v158.AccountSwitchButton = v159;
            v158.LoginButton = v2.createElement(l_Button_0, {
                LayoutOrder = 3, 
                variant = if v88 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                size = l_ButtonSize_0.Large, 
                width = UDim.new(1, 0), 
                text = v143.signInText, 
                onActivated = function() --[[ Line: 559 ]] --[[ Name: onActivated ]]
                    -- upvalues: v137 (ref), l_TelemetryConfigs_0 (ref), v43 (ref)
                    v137.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingLoginButtonClickedConfig, 1);
                    v137.props.analytics.reportLogInButtonClicked(v43.Context.LandingScreen);
                    v137.props.analytics.reportAuthButtonClick(v43.Context.LandingScreen, v43.Button.LogIn);
                    v137.navigateToLogin(v137.state.credProtocolIsAvailableResponse);
                end
            });
            v158.ThirdPartySwitchAccountComponent = if l_ThirdPartyUserService_0 and l_game_EngineFeature_1 and l_ThirdPartyUserService_0:IsAccountSwitchingSupported() and v106 then v2.createElement(l_ThirdPartySwitchAccountComponent_0, {
                layoutOrder = 4, 
                dividerTextKey = "CommonUI.Features.Labels.ConnectTo", 
                thirdPartyUserName = l_ThirdPartyUserService_0:GetUserPlatformName()
            }) else nil;
            v158.DisclaimerLinks = if not not v137.props.useVNGUserAgreementPopup or v137.getShouldShowKISAAgreements() or v145 then nil else v2.createElement(v18, {
                LayoutOrder = v106 and 5 or 4
            });
            v154.LandingPageContents = l_createElement_1(l_FitFrame_0, v157, v158);
            return l_createElement_0(l_v146_0, v153, v154);
        end);
    end;
end;
v80.didMount = function(v160) --[[ Line: 594 ]] --[[ Name: didMount ]]
    -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_InvoluntaryLogoutAnalyticsEvents_0 (copy), v43 (copy), v27 (copy), v71 (copy), v95 (copy), l_TelemetryConfigs_0 (copy), l_game_EngineFeature_0 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v81 (copy)
    if l_GetFFlagEnableLuaAccountPicker_0() and v160.props.accountPickerVariantEnabled ~= 0 and v160.props.accountPickerVariantEnabled ~= nil then
        pcall(function() --[[ Line: 600 ]]
            -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v160 (copy)
            l_GetAccountsListWithSignedOutAccounts_0(v160.props.networking, {
                isAuthenticated = false, 
                filterUnauthenticatedSessionsForAccountPicker = true
            }):andThen(function(v161) --[[ Line: 604 ]]
                -- upvalues: v160 (ref)
                v160:setState({
                    accountPickerAccounts = v161
                });
            end):catch(function(v162) --[[ Line: 608 ]]
                warn(v162);
            end);
        end);
    end;
    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v43.Origin.LandingScreen, "");
    v160.openAccountSwitcher();
    if v27() then
        v160.props.analytics.reportAuthPageload(v43.Context.LandingScreenVideo, (tostring(true)));
    else
        v160.props.analytics.reportAuthPageload(v43.Context.LandingScreenVideo, (tostring(false)));
    end;
    v160.props.loggingProtocol:logEventOnce("landing_page_did_mount");
    if v71 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 624 ]]
            -- upvalues: v95 (ref)
            v95.init();
        end);
        if not l_status_0 or not l_result_0 then
            v160.props.analytics.reportAuthClientError(v43.Context.LandingScreen, "prewarm_challenge_webview_error");
        end;
    end;
    v160.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingPageMountTelemetryConfig, 1);
    if l_game_EngineFeature_0 then
        v160.props.appLifecycleObserverService:TriggerOnLandingPageMount();
    end;
    local v165 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
    v160.props.analytics.reportAuthPageload(v43.Context.LandingScreen, v165);
    local v166 = os.clock();
    l_default_0:isAvailable(l_default_0.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v167) --[[ Line: 652 ]]
        -- upvalues: v160 (copy), v43 (ref), v166 (copy)
        v160.props.analytics.reportAuthPageload(v43.Context.LandingPageIsAvailablePrefetch, (tostring(os.clock() - v166)));
        v160:setState({
            credProtocolIsAvailableResponse = v167
        });
    end);
    v81.SetDarkThemeOverride();
end;
v80.willUnmount = function(_) --[[ Line: 665 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_authPageload_0 (copy), v43 (copy), v71 (copy), v95 (copy), v81 (copy)
    l_authPageload_0(v43.Context.LandingPageUnmount);
    if v71 then
        pcall(function() --[[ Line: 669 ]]
            -- upvalues: v95 (ref)
            v95.cleanup();
        end);
    end;
    v81.ClearThemeOverride();
end;
v80 = v3.connect(function(v169, _) --[[ Line: 677 ]]
    return {
        formFactor = v169.FormFactor, 
        screenSize = v169.ScreenSize, 
        statusBarHeight = v169.TopBar.statusBarHeight, 
        globalGuiInset = v169.GlobalGuiInset
    };
end, function(v171) --[[ Line: 684 ]]
    -- upvalues: v20 (copy), v14 (copy), v13 (copy), l_GetFFlagEnableLuaAccountPicker_0 (copy), v93 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), v45 (copy), v43 (copy), v91 (copy), v15 (copy)
    return {
        fetchSignUpBundles = function(v172) --[[ Line: 686 ]] --[[ Name: fetchSignUpBundles ]]
            -- upvalues: v171 (copy), v20 (ref)
            return v171(v20.Fetch(v172));
        end, 
        navigateToSinglePageSignUp = function() --[[ Line: 689 ]] --[[ Name: navigateToSinglePageSignUp ]]
            -- upvalues: v171 (copy), v14 (ref), v13 (ref)
            v171(v14({
                name = v13.SinglePageSignUp
            }));
        end, 
        navigateToMultiPageSignUp = function(v173) --[[ Line: 692 ]] --[[ Name: navigateToMultiPageSignUp ]]
            -- upvalues: v171 (copy), v14 (ref), v13 (ref)
            v171(v14({
                name = v13.MultiPageSignup, 
                extraProps = {
                    enforceResetState = true, 
                    credProtocolIsAvailableResponse = v173
                }
            }));
        end, 
        navigateSwitchToAccount = function(v174, v175, v176, v177, v178) --[[ Line: 701 ]] --[[ Name: navigateSwitchToAccount ]]
            -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (ref), v171 (copy), v93 (ref)
            if not l_GetFFlagEnableLuaAccountPicker_0() then
                return;
            else
                v171(v93(v174, v175, v176, v177, v178));
                return;
            end;
        end, 
        navigateToBirthdayPage = function() --[[ Line: 707 ]] --[[ Name: navigateToBirthdayPage ]]
            -- upvalues: v171 (copy), v14 (ref), v13 (ref)
            v171(v14({
                name = v13.Birthday
            }));
        end, 
        gotoLogin = function(v179) --[[ Line: 710 ]] --[[ Name: gotoLogin ]]
            -- upvalues: v171 (copy), v14 (ref), v13 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref)
            v171(v14({
                name = v13.Login, 
                extraProps = {
                    forcedUsernameOverride = if l_FFlagEnableLoginV1ForcedUsernameOverride_0 then v179 else nil
                }
            }));
        end, 
        gotoLoginV2 = function(v180, v181) --[[ Line: 720 ]] --[[ Name: gotoLoginV2 ]]
            -- upvalues: v171 (copy), v14 (ref), v13 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref)
            v171(v14({
                name = v13.LoginV2, 
                extraProps = {
                    credProtocolIsAvailableResponse = v180, 
                    forcedUsernameOverride = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then v181 else nil
                }
            }));
        end, 
        showAccountSwitcher = function(v182, v183, v184, v185, v186, v187, v188) --[[ Line: 731 ]] --[[ Name: showAccountSwitcher ]]
            -- upvalues: v171 (copy), v45 (ref), v43 (ref)
            v171(v45(true, v182, v43.Origin.LandingScreen, v184, v185, v186, v187, v188)):andThen(function(v189) --[[ Line: 751 ]]
                -- upvalues: v183 (copy)
                if v189 ~= nil and v183 then
                    v183(v189);
                end;
            end);
        end, 
        sessionCheck = function(v190, v191, v192, v193, v194) --[[ Line: 758 ]] --[[ Name: sessionCheck ]]
            -- upvalues: v171 (copy), v91 (ref)
            return v171(v91(v190, v191, v192, v193, v194));
        end, 
        setStatusBarHeight = function(v195) --[[ Line: 761 ]] --[[ Name: setStatusBarHeight ]]
            -- upvalues: v171 (copy), v15 (ref)
            return v171(v15(v195));
        end
    };
end)(v80);
v80 = l_RoactAppPolicy_0.connect(function(v196, _) --[[ Line: 767 ]]
    return {
        showVNGAge12Badge = v196.getShowVNGAge12Badge(), 
        useVNGUserAgreementPopup = v196.getUseVNGUserAgreementPopup(), 
        useKoreaKISAUserAgreementPopup = v196.getUseKoreaKISAUserAgreementPopup(), 
        excludeAccountSwitcher = v196.getExcludeAccountSwitcher(), 
        showBrazilContentRatingLogo = v196.getShowBrazilContentRatingLogo(), 
        appPolicy = v196
    };
end)(v80);
local v198 = l_RoactServices_0.connect({
    networking = v7, 
    guiService = l_AppGuiService_0, 
    analytics = v8, 
    loggingProtocol = l_AppLogging_0, 
    appLifecycleObserverService = l_AppAppLifecycleObserverService_0
})(v80);
local l_v198_0 = v198 --[[ copy: 107 -> 108 ]];
v80 = function(v200) --[[ Line: 787 ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), v41 (copy), l_GetFFlagSetStatusBarHeight_0 (copy), v56 (copy), v12 (copy), v2 (copy), l_v198_0 (copy), v11 (copy)
    local v201 = l_useUiModeInfo_0();
    local v202 = l_useDesignTokens_0();
    local v203 = v41();
    local v204 = false;
    if l_GetFFlagSetStatusBarHeight_0() then
        v204 = v56.useBreakpointXOrSmaller(v56.Keys.Medium);
    end;
    local v205, v206 = v12.useDefaultFocusBehavior(v203);
    return v2.createElement(l_v198_0, v11.Dictionary.join({
        uiModeInfo = v201, 
        tokens = v202, 
        eventHandlerRef = nil, 
        defaultRef = v205, 
        containerRef = v206, 
        isCompact = v204
    }, v200));
end;
if v27() then
    v80 = v58.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v207, _) --[[ Line: 815 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        local v209 = v207[l_AppBtidLayers_0.LandingLayer] or {};
        return {
            landingVideoEnabled = v209.landingVideoEnabled, 
            landingVideoAsset = v209.landingVideoAsset
        };
    end)(v80);
end;
if l_FFlagLuaEnableCustomizedInviteLandingPage_0 then
    v80 = v58.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v210, _) --[[ Line: 827 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            isCustomizedLandingPageEnabled = (v210[l_AppBtidLayers_0.LandingLayer] or {}).isCustomizedLandingPageEnabled
        };
    end)(v80);
end;
if l_GetFFlagEnableLuaAccountPicker_0() then
    v80 = v58.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v212, _) --[[ Line: 838 ]]
        -- upvalues: l_AppBtidLayers_0 (copy), l_GetFIntAccountPickerVariantOverride_0 (copy)
        local v214 = v212[l_AppBtidLayers_0.LandingLayer] or {};
        return {
            accountPickerVariantEnabled = v214.accountPickerVariantEnabled and tonumber(v214.accountPickerVariantEnabled) or l_GetFIntAccountPickerVariantOverride_0()
        };
    end)(v80);
end;
v80 = v58.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LandingLayer
}, function(v215, _) --[[ Line: 850 ]]
    -- upvalues: l_AppBtidLayers_0 (copy)
    return {
        landingPageLatency = (v215[l_AppBtidLayers_0.LandingLayer] or {}).landingPageLatency or 0
    };
end)(v80);
v198 = function() --[[ Line: 858 ]] --[[ Name: getSignupLayerVariables ]]
    -- upvalues: v60 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), v51 (copy)
    return v60() or l_GetFFlagEnableMultiPageSignup_0() or v51;
end;
if v60() or l_GetFFlagEnableMultiPageSignup_0() or v51 then
    v80 = v58.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v217, _) --[[ Line: 867 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        local v219 = v217[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldShowMultipageSignupDirectionalTest = v219.shouldShowMultipageSignupDirectionalTest, 
            shouldShowKoreanKISASignUpFlow = v219.shouldShowKoreanKISASignUpFlow, 
            shouldEnableMultiPageSignup = v219.shouldEnableMultiPageSignup
        };
    end)(v80);
end;
if l_FFlagEnableLuaLoginRevamp_0 then
    v80 = v58.connectBrowserTrackerLayer({
        l_FStringLuaLoginRevampIxpLayer_0
    }, function(v220, _) --[[ Line: 880 ]]
        -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (copy)
        return {
            showLoginRevamp = (v220[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
        };
    end)(v80);
end;
v80 = v58.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LandingLayer
}, function(v222, _) --[[ Line: 890 ]]
    -- upvalues: l_AppBtidLayers_0 (copy)
    return {
        shouldDoSessionCheck = (v222[l_AppBtidLayers_0.LandingLayer] or {}).shouldDoSessionCheck
    };
end)(v80);
if v107 then
    v80 = v58.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v224, _) --[[ Line: 900 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldDisplayBrazilAgeRatingIXP = (v224[l_AppBtidLayers_0.LandingLayer] or {}).shouldDisplayBrazilAgeRating
        };
    end)(v80);
end;
v80 = v58.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.AccountSwitcherLayer
}, function(v226, _) --[[ Line: 910 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy)
    local v228 = v226[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
    if l_GetFFlagEnableAccountSwitcherRedesignIXP_0() then
        return {
            enableFoundationDesign = v228.enableAccountSwitcherFoundationDesign == true, 
            enableSignedOutAccounts = v228.enableAccountSwitcherSignedOutAccounts == true
        };
    else
        return {
            enableFoundationDesign = true, 
            enableSignedOutAccounts = true
        };
    end;
end)(v80);
return function(v229) --[[ Line: 925 ]]
    -- upvalues: v44 (copy), l_useAppPolicy_0 (copy), v2 (copy), v22 (copy), l_FFlagLuafiedWechatQQLogin_0 (copy), l_WechatQQLoginPage_0 (copy), v80 (ref)
    if if v44.LuaAuthEnabledForLuobu() then l_useAppPolicy_0(function(v230) --[[ Line: 927 ]]
        return v230.useLuobuAuthentication();
    end) else false then
        return v2.createElement(v22, v229);
    elseif if l_FFlagLuafiedWechatQQLogin_0 then l_useAppPolicy_0(function(v231) --[[ Line: 937 ]]
        return v231.useWechatQQAuthentication();
    end) else false then
        return v2.createElement(l_WechatQQLoginPage_0, v229);
    else
        return v2.createElement(v80, v229);
    end;
end;