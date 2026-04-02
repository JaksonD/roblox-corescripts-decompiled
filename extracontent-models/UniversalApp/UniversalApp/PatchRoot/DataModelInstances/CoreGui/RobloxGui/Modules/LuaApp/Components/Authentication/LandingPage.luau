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
local v52 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPBrazilCompliance);
local v53 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPKoreaCompliance);
local v54 = require(l_Modules_0.LuaApp.Flags.FFlagBypassGUACKoreaCompliance);
local v55 = require(l_Modules_0.LuaApp.Http.Requests.PostAssociateBrowserTrackerToDevice);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v57 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v59 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v60 = require(l_Modules_0.LuaApp.Thunks.Authentication.Util.getDeepLinkData);
local v61 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local l_FFlagEnableLuaLoginRevamp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLuaLoginRevamp;
local l_FFlagLuafiedWechatQQLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuafiedWechatQQLogin;
local l_FStringLuaLoginRevampIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaLoginRevampIxpLayer;
local l_GetFFlagEnableMultiPageSignup_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMultiPageSignup;
local l_FFlagLuaEnableCustomizedInviteLandingPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPage;
local l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableCustomizedInviteLandingPageForTesting;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLoginV1ForcedUsernameOverride;
local l_FFlagEnableLoginV2ForcedUsernameOverride_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLoginV2ForcedUsernameOverride;
local v70 = game:DefineFastFlag("CustomizedLandingEDP", false);
local v71 = game:DefineFastFlag("CustomizedLandingLaunchGame", false);
local v72 = game:DefineFastFlag("EnablePrewarmChallengeWebView", false);
local v73 = game:DefineFastString("CustomizedLandingExperienceSort", "");
local v78 = (function(v74) --[[ Line: 101 ]] --[[ Name: parseStringToSet ]]
    local v75 = {};
    for v76 in string.gmatch(v74, "([^,]+)") do
        local v77 = v76:gsub("^%s*(.-)%s*$", "%1");
        if v77 ~= "" then
            v75[v77] = true;
        end;
    end;
    return v75;
end)(v73);
local l_InvoluntaryLogoutAnalyticsEvents_0 = v37.Analytics.InvoluntaryLogoutAnalyticsEvents;
local l_authPageload_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authPageload;
local v81 = v2.PureComponent:extend("LandingPage");
local v82 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v84 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v84.Button;
local l_ButtonVariant_0 = v84.Enums.ButtonVariant;
local l_ButtonSize_0 = v84.Enums.ButtonSize;
local v88 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v89 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
local l_GetFFlagEnableLuaAccountPicker_0 = v88.GetFFlagEnableLuaAccountPicker;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v88.GetFFlagEnableAccountSwitcherRedesignIXP;
local v92 = require(l_Modules_0.LuaApp.Thunks.Authentication.SessionCheck);
local l_AccountCarouselContainer_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.AccountCarouselContainer;
local v94 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.SwitchToAccount);
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_CorePackages_0.Workspace.Packages.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local v96 = require(l_Modules_0.LuaApp.Thunks.Challenge.PrewarmWebView);
local l_FFlagAuthSecExclusions_0 = v88.FFlagAuthSecExclusions;
local l_GetFFlagSetStatusBarHeight_0 = v88.GetFFlagSetStatusBarHeight;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v88.FFlagEnableAuthDeepLinkReceiver;
local l_PreAuthDeepLinkUrlStore_0 = v37.Stores.PreAuthDeepLinkUrlStore;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_GetUniverseIdFromPlaceId_0 = v37.Thunks.GetUniverseIdFromPlaceId;
local l_AccountPickerListView_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.AccountPickerListView;
local l_GetFIntAccountPickerVariantOverride_0 = v88.GetFIntAccountPickerVariantOverride;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_game_EngineFeature_1 = game:GetEngineFeature("ThirdPartyUserServiceIsAccountSwitchingSupported");
local v107 = game:DefineFastFlag("ShowLandingPageThirdPartySwitchAccountButton", false);
local v108 = game:DefineFastFlag("ShowBrazilContentRatingBadge4", false);
local l_BrazilContentRatingBadge_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Components.BrazilContentRatingBadge;
v81.init = function(v110) --[[ Line: 161 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), l_authTimingUtil_0 (copy), v21 (copy), v27 (copy), v31 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v70 (copy), v60 (copy), v28 (copy), v71 (copy), l_ExperienceService_0 (copy), l_GetUniverseIdFromPlaceId_0 (copy), v73 (copy), v78 (copy), v43 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), v44 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_GetFFlagEnableLuaAccountPicker_0 (copy), l_FFlagAuthSecExclusions_0 (copy), v50 (copy), v51 (copy), v54 (copy), v53 (copy), v49 (copy), v55 (copy), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (copy), l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0 (copy)
    if v110.props.shouldDoSessionCheck then
        local v111 = v24.fromLocalStorage();
        v110.props.sessionCheck(v110.props.networking, v111, v110.props.analytics, v110.props.appPolicy, v110.props.loggingProtocol);
    end;
    l_authTimingUtil_0.landingPageLoadStart();
    v110.state = {
        shouldShowAccountSwitcherButton = false, 
        landingVideoAsset = "", 
        credProtocolIsAvailableResponse = nil, 
        shouldShowCustomizedLandingPage = false, 
        accountPickerAccounts = {}, 
        deepLinkData = nil
    };
    if v21.getIsFirstLaunchAfterInstall() == "true" then
        wait(v110.props.landingPageLatency);
    end;
    if v27() then
        if v110.props.landingVideoAsset and type(v110.props.landingVideoAsset) == "string" and string.len(v110.props.landingVideoAsset) > 0 then
            v110:setState({
                landingVideoAsset = v110.props.landingVideoAsset
            });
        else
            v110:setState({
                landingVideoAsset = v31()
            });
        end;
    end;
    v110.maybeShowCustomizedLandingPage = function() --[[ Line: 204 ]]
        -- upvalues: l_FFlagEnableAuthDeepLinkReceiver_0 (ref), l_PreAuthDeepLinkUrlStore_0 (ref), l_LinkingProtocol_0 (ref), v70 (ref), v110 (copy), v60 (ref), v28 (ref), v71 (ref), l_ExperienceService_0 (ref), l_GetUniverseIdFromPlaceId_0 (ref), v73 (ref), v78 (ref)
        local v112 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        if v70 and v112 and string.find(v112, "game_details") then
            local v113 = v112:match("gameId=(%d+)");
            if v113 then
                v110:setState({
                    shouldShowCustomizedLandingPage = true, 
                    deepLinkData = {
                        universeId = v113
                    }
                });
            end;
        end;
        if v112 and string.find(v112, "share") then
            local v114 = v60(v110.props.networking, v112);
            if v114 then
                local l_universeId_0 = v114.universeId;
                local l_inviterId_0 = v114.inviterId;
                if v28 and l_universeId_0 or l_universeId_0 and l_inviterId_0 then
                    v110:setState({
                        shouldShowCustomizedLandingPage = true, 
                        deepLinkData = v114
                    });
                end;
            end;
        end;
        if v71 then
            local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
            if l_l_ExperienceService_0_PendingJoinAttempt_0 then
                local l_placeId_0 = l_l_ExperienceService_0_PendingJoinAttempt_0.placeId;
                if l_placeId_0 then
                    l_GetUniverseIdFromPlaceId_0(v110.props.networking, l_placeId_0):andThen(function(v119) --[[ Line: 239 ]]
                        -- upvalues: v110 (ref)
                        if v119 then
                            v110:setState({
                                shouldShowCustomizedLandingPage = true, 
                                deepLinkData = {
                                    universeId = v119
                                }
                            });
                        end;
                    end):catch(function(_) --[[ Line: 248 ]]

                    end);
                end;
            end;
        end;
        if v73 and v112 and string.find(v112, "navigation/experience_sort") then
            local v121 = v112:match("sortId=([^&]+)");
            if v121 and v78[v121] then
                v110:setState({
                    shouldShowCustomizedLandingPage = true, 
                    deepLinkData = {
                        genre = v121
                    }
                });
            end;
        end;
    end;
    v110.navigateToSignUp = function(v122) --[[ Line: 273 ]]
        -- upvalues: v110 (copy), v43 (ref), l_GetFFlagEnableMultiPageSignup_0 (ref), v44 (ref)
        local l_networking_0 = v110.props.networking;
        local l_analytics_0 = v110.props.analytics;
        local l_fetchSignUpBundles_0 = v110.props.fetchSignUpBundles;
        local l_navigateToSinglePageSignUp_0 = v110.props.navigateToSinglePageSignUp;
        local l_navigateToMultiPageSignUp_0 = v110.props.navigateToMultiPageSignUp;
        local l_navigateToBirthdayPage_0 = v110.props.navigateToBirthdayPage;
        l_analytics_0.reportSignUpButtonClicked(v43.Context.LandingScreen);
        if l_GetFFlagEnableMultiPageSignup_0() and v110.props.shouldEnableMultiPageSignup then
            l_navigateToMultiPageSignUp_0(v122);
            return;
        elseif v110.props.shouldShowMultipageSignupDirectionalTest then
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
    v110.navigateToLogin = function(v129, v130) --[[ Line: 303 ]]
        -- upvalues: l_FFlagEnableLuaLoginRevamp_0 (ref), v110 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref)
        if l_FFlagEnableLuaLoginRevamp_0 and v110.props.showLoginRevamp then
            if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then
                v110.props.gotoLoginV2(v129, v130);
                return;
            else
                v110.props.gotoLoginV2(v129);
                return;
            end;
        elseif l_FFlagEnableLoginV1ForcedUsernameOverride_0 then
            v110.props.gotoLogin(v130);
            return;
        else
            v110.props.gotoLogin();
            return;
        end;
    end;
    v110.openAccountSwitcher = function() --[[ Line: 319 ]]
        -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (ref), v110 (copy), l_FFlagAuthSecExclusions_0 (ref), v50 (ref), v21 (ref)
        if l_GetFFlagEnableLuaAccountPicker_0() and v110.props.accountPickerVariantEnabled ~= 0 and v110.props.accountPickerVariantEnabled ~= nil then
            return;
        elseif l_FFlagAuthSecExclusions_0 and v110.props.excludeAccountSwitcher then
            return;
        else
            if v50 == true then
                local v131 = v21.getAccountBlob();
                local function v134(v132) --[[ Line: 334 ]]
                    -- upvalues: v110 (ref)
                    local v133 = false;
                    if v132 ~= nil then
                        v133 = v132 > 0;
                    end;
                    v110:setState({
                        shouldShowAccountSwitcherButton = v133
                    });
                end;
                if v131 and v131 ~= "" then
                    v110.props.showAccountSwitcher(v110.props.networking, v134, v110.props.analytics, v110.props.appPolicy, v110.props.omniRecommendationsRequest, v110.props.enableFoundationDesign, v110.props.enableSignedOutAccounts);
                end;
            end;
            return;
        end;
    end;
    v110.getShouldShowKISAAgreements = function() --[[ Line: 355 ]]
        -- upvalues: v51 (ref), v110 (copy), v54 (ref), v53 (ref)
        return v51 and (v110.props.useKoreaKISAUserAgreementPopup or v54) and (v110.props.shouldShowKoreanKISASignUpFlow or v53);
    end;
    if v49() then
        local l_networking_1 = v110.props.networking;
        v55(l_networking_1):catch(function() --[[ Line: 363 ]]

        end);
    end;
    if l_FFlagLuaEnableCustomizedInviteLandingPage_0 and (v110.props.isCustomizedLandingPageEnabled or l_FFlagLuaEnableCustomizedInviteLandingPageForTesting_0) then
        v110.maybeShowCustomizedLandingPage();
    end;
end;
v81.didUpdate = function(v136, _) --[[ Line: 375 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagSetStatusBarHeight_0 (copy), l_UIConstants_0 (copy)
    if l_GetFFlagSetStatusBarHeight_0() and v136.props.isCompact then
        v136.props.setStatusBarHeight(l_UIConstants_0.STATUS_BAR_HEIGHT);
    end;
end;
v81.render = function(v138) --[[ Line: 383 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (copy), l_AccountCarouselContainer_0 (copy), l_AccountPickerListView_0 (copy), v2 (copy), v21 (copy), v9 (copy), l_UiMode_0 (copy), v17 (copy), v16 (copy), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (copy), v27 (copy), v25 (copy), v26 (copy), v108 (copy), v52 (copy), l_FormFactor_0 (copy), v42 (copy), l_BrazilContentRatingBadge_0 (copy), v19 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_TelemetryConfigs_0 (copy), v50 (copy), v89 (copy), v43 (copy), l_ThirdPartyUserService_0 (copy), l_game_EngineFeature_1 (copy), v107 (copy), l_ThirdPartySwitchAccountComponent_0 (copy), v18 (copy)
    if l_GetFFlagEnableLuaAccountPicker_0() and v138.props.accountPickerVariantEnabled ~= 0 and v138.props.accountPickerVariantEnabled ~= nil and #v138.state.accountPickerAccounts > 0 then
        local v139 = {
            [1] = l_AccountCarouselContainer_0, 
            [2] = l_AccountPickerListView_0
        };
        return v2.createElement(v139[v138.props.accountPickerVariantEnabled], {
            accounts = v138.state.accountPickerAccounts, 
            avatarSize = UDim2.new(0, 160, 0, 240), 
            onAvatarActivated = function(v140, v141, v142) --[[ Line: 398 ]] --[[ Name: onAvatarActivated ]]
                -- upvalues: v21 (ref), v138 (copy)
                if v142 then
                    v21.setAccountSwitchTargetUsername(v141);
                    v21.flush();
                    v138.props.navigateSwitchToAccount(v138.props.networking, v140, v138.props.appPolicy, v138.props.omniRecommendationsRequest, v138.props.analytics);
                    return;
                else
                    v138.navigateToLogin(v138.state.credProtocolIsAvailableResponse, v141);
                    return;
                end;
            end, 
            setAccountPickerAccounts = function(v143) --[[ Line: 413 ]] --[[ Name: setAccountPickerAccounts ]]
                -- upvalues: v138 (copy)
                v138:setState({
                    accountPickerAccounts = v143
                });
            end, 
            navigateToSignup = function() --[[ Line: 418 ]] --[[ Name: navigateToSignup ]]
                -- upvalues: v138 (copy)
                v138.navigateToSignUp(v138.state.credProtocolIsAvailableResponse);
            end, 
            navigateToLogin = function() --[[ Line: 421 ]] --[[ Name: navigateToLogin ]]
                -- upvalues: v138 (copy)
                v138.navigateToLogin(v138.state.credProtocolIsAvailableResponse, "");
            end
        });
    else
        return v9({
            signUpText = "Authentication.SignUp.Action.CreateAccount", 
            signInText = "Authentication.Login.Action.SignIn", 
            switchAccountsText = "Authentication.AccountSwitch.Action.SwitchAccount"
        })(function(v144) --[[ Line: 431 ]]
            -- upvalues: v138 (copy), l_UiMode_0 (ref), v17 (ref), v16 (ref), l_FFlagLuaEnableCustomizedInviteLandingPage_0 (ref), v27 (ref), v25 (ref), v26 (ref), v108 (ref), v52 (ref), v2 (ref), l_FormFactor_0 (ref), v42 (ref), l_BrazilContentRatingBadge_0 (ref), v19 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_TelemetryConfigs_0 (ref), v50 (ref), v89 (ref), v43 (ref), l_ThirdPartyUserService_0 (ref), l_game_EngineFeature_1 (ref), v107 (ref), l_ThirdPartySwitchAccountComponent_0 (ref), v18 (ref)
            local l_LandingPage_0 = v138.props.tokens.LuaApps.LandingPage;
            local v146 = v138.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
            local v147 = if v146 then v17 else v16;
            local v148 = l_FFlagLuaEnableCustomizedInviteLandingPage_0 and v138.state.shouldShowCustomizedLandingPage;
            local v149 = v27() and v138.props.landingVideoEnabled and not v148;
            if v149 then
                v147 = v25;
            elseif v148 then
                v147 = v26;
            end;
            local l_signUpText_0 = v144.signUpText;
            local v151 = v108 and v138.props.showBrazilContentRatingLogo and (v138.props.shouldDisplayBrazilAgeRatingIXP or v52);
            local l_createElement_0 = v2.createElement;
            local l_v147_0 = v147;
            local v154 = {
                ContentAlign = if not v146 and v138.props.formFactor == l_FormFactor_0.COMPACT then v42.Bottom else v42.Top, 
                ref = v138.props.containerRef, 
                VNAgeBadgeEnabled = v138.props.showVNGAge12Badge, 
                screenSize = if not not v27() or v148 then v138.props.screenSize else nil, 
                statusBarHeight = if not not v27() or v148 then v138.props.statusBarHeight else nil, 
                globalGuiInset = if not not v27() or v148 then v138.props.globalGuiInset else nil, 
                formFactor = if v27() then v138.props.formFactor else nil, 
                landingVideoAsset = if v27() then v138.state.landingVideoAsset else nil, 
                deepLinkData = if v148 then v138.state.deepLinkData else nil, 
                containerRef = v138.props.containerRef, 
                FooterElement = if v151 then v2.createElement(l_BrazilContentRatingBadge_0) else nil, 
                FooterHeight = if v151 then l_LandingPage_0.brazilBadgeHeight else 0
            };
            local v155 = {};
            local l_createElement_1 = v2.createElement;
            local l_FitFrame_0 = v19.FitFrame;
            local v158 = {
                Size = UDim2.new(1, -40, 0, 0), 
                fitAxis = v19.FitAxis.Height, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ref = v138.props.ref
            };
            local v159 = {
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
                SignUpButton = if not v149 then v2.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    size = l_ButtonSize_0.Large, 
                    text = l_signUpText_0, 
                    onActivated = function() --[[ Line: 504 ]] --[[ Name: onActivated ]]
                        -- upvalues: v138 (ref), l_TelemetryConfigs_0 (ref)
                        v138.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingSignupButtonClickedConfig, 1);
                        v138.navigateToSignUp(v138.state.credProtocolIsAvailableResponse);
                    end, 
                    width = UDim.new(1, 0), 
                    [v2.Ref] = v138.props.defaultRef
                }) else v2.createElement(l_Button_0, {
                    LayoutOrder = 1, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = l_ButtonSize_0.Large, 
                    width = UDim.new(1, 0), 
                    text = l_signUpText_0, 
                    onActivated = function() --[[ Line: 523 ]] --[[ Name: onActivated ]]
                        -- upvalues: v138 (ref), l_TelemetryConfigs_0 (ref)
                        v138.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingSignupButtonClickedConfig, 1);
                        v138.navigateToSignUp(v138.state.credProtocolIsAvailableResponse);
                    end, 
                    [v2.Ref] = v138.props.defaultRef
                })
            };
            local v160 = false;
            if v50 == true then
                v160 = v138.state.shouldShowAccountSwitcherButton and v2.createElement(l_Button_0, {
                    LayoutOrder = 2, 
                    variant = if v89 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                    size = l_ButtonSize_0.Large, 
                    width = UDim.new(1, 0), 
                    text = v144.switchAccountsText, 
                    onActivated = function() --[[ Line: 544 ]] --[[ Name: onActivated ]]
                        -- upvalues: v138 (ref), v43 (ref)
                        v138.props.analytics.reportSwitchAccountButtonClicked(v43.Context.LandingScreen);
                        v138.openAccountSwitcher();
                    end
                });
            end;
            v159.AccountSwitchButton = v160;
            v159.LoginButton = v2.createElement(l_Button_0, {
                LayoutOrder = 3, 
                variant = if v89 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                size = l_ButtonSize_0.Large, 
                width = UDim.new(1, 0), 
                text = v144.signInText, 
                onActivated = function() --[[ Line: 560 ]] --[[ Name: onActivated ]]
                    -- upvalues: v138 (ref), l_TelemetryConfigs_0 (ref), v43 (ref)
                    v138.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingLoginButtonClickedConfig, 1);
                    v138.props.analytics.reportLogInButtonClicked(v43.Context.LandingScreen);
                    v138.props.analytics.reportAuthButtonClick(v43.Context.LandingScreen, v43.Button.LogIn);
                    v138.navigateToLogin(v138.state.credProtocolIsAvailableResponse);
                end
            });
            v159.ThirdPartySwitchAccountComponent = if l_ThirdPartyUserService_0 and l_game_EngineFeature_1 and l_ThirdPartyUserService_0:IsAccountSwitchingSupported() and v107 then v2.createElement(l_ThirdPartySwitchAccountComponent_0, {
                layoutOrder = 4, 
                dividerTextKey = "CommonUI.Features.Labels.ConnectTo", 
                thirdPartyUserName = l_ThirdPartyUserService_0:GetUserPlatformName()
            }) else nil;
            v159.DisclaimerLinks = if not not v138.props.useVNGUserAgreementPopup or v138.getShouldShowKISAAgreements() or v146 then nil else v2.createElement(v18, {
                LayoutOrder = v107 and 5 or 4
            });
            v155.LandingPageContents = l_createElement_1(l_FitFrame_0, v158, v159);
            return l_createElement_0(l_v147_0, v154, v155);
        end);
    end;
end;
v81.didMount = function(v161) --[[ Line: 595 ]] --[[ Name: didMount ]]
    -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_InvoluntaryLogoutAnalyticsEvents_0 (copy), v43 (copy), v27 (copy), v72 (copy), v96 (copy), l_TelemetryConfigs_0 (copy), l_game_EngineFeature_0 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v82 (copy)
    if l_GetFFlagEnableLuaAccountPicker_0() and v161.props.accountPickerVariantEnabled ~= 0 and v161.props.accountPickerVariantEnabled ~= nil then
        pcall(function() --[[ Line: 601 ]]
            -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v161 (copy)
            l_GetAccountsListWithSignedOutAccounts_0(v161.props.networking, {
                isAuthenticated = false, 
                filterUnauthenticatedSessionsForAccountPicker = true
            }):andThen(function(v162) --[[ Line: 605 ]]
                -- upvalues: v161 (ref)
                v161:setState({
                    accountPickerAccounts = v162
                });
            end):catch(function(v163) --[[ Line: 609 ]]
                warn(v163);
            end);
        end);
    end;
    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v43.Origin.LandingScreen, "");
    v161.openAccountSwitcher();
    if v27() then
        v161.props.analytics.reportAuthPageload(v43.Context.LandingScreenVideo, (tostring(true)));
    else
        v161.props.analytics.reportAuthPageload(v43.Context.LandingScreenVideo, (tostring(false)));
    end;
    v161.props.loggingProtocol:logEventOnce("landing_page_did_mount");
    if v72 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 625 ]]
            -- upvalues: v96 (ref)
            v96.init();
        end);
        if not l_status_0 or not l_result_0 then
            v161.props.analytics.reportAuthClientError(v43.Context.LandingScreen, "prewarm_challenge_webview_error");
        end;
    end;
    v161.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LandingPageMountTelemetryConfig, 1);
    if l_game_EngineFeature_0 then
        v161.props.appLifecycleObserverService:TriggerOnLandingPageMount();
    end;
    local v166 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
    v161.props.analytics.reportAuthPageload(v43.Context.LandingScreen, v166);
    local v167 = os.clock();
    l_default_0:isAvailable(l_default_0.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v168) --[[ Line: 653 ]]
        -- upvalues: v161 (copy), v43 (ref), v167 (copy)
        v161.props.analytics.reportAuthPageload(v43.Context.LandingPageIsAvailablePrefetch, (tostring(os.clock() - v167)));
        v161:setState({
            credProtocolIsAvailableResponse = v168
        });
    end);
    v82.SetDarkThemeOverride();
end;
v81.willUnmount = function(_) --[[ Line: 666 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_authPageload_0 (copy), v43 (copy), v72 (copy), v96 (copy), v82 (copy)
    l_authPageload_0(v43.Context.LandingPageUnmount);
    if v72 then
        pcall(function() --[[ Line: 670 ]]
            -- upvalues: v96 (ref)
            v96.cleanup();
        end);
    end;
    v82.ClearThemeOverride();
end;
v81 = v3.connect(function(v170, _) --[[ Line: 678 ]]
    return {
        formFactor = v170.FormFactor, 
        screenSize = v170.ScreenSize, 
        statusBarHeight = v170.TopBar.statusBarHeight, 
        globalGuiInset = v170.GlobalGuiInset
    };
end, function(v172) --[[ Line: 685 ]]
    -- upvalues: v20 (copy), v14 (copy), v13 (copy), l_GetFFlagEnableLuaAccountPicker_0 (copy), v94 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), v45 (copy), v43 (copy), v92 (copy), v15 (copy)
    return {
        fetchSignUpBundles = function(v173) --[[ Line: 687 ]] --[[ Name: fetchSignUpBundles ]]
            -- upvalues: v172 (copy), v20 (ref)
            return v172(v20.Fetch(v173));
        end, 
        navigateToSinglePageSignUp = function() --[[ Line: 690 ]] --[[ Name: navigateToSinglePageSignUp ]]
            -- upvalues: v172 (copy), v14 (ref), v13 (ref)
            v172(v14({
                name = v13.SinglePageSignUp
            }));
        end, 
        navigateToMultiPageSignUp = function(v174) --[[ Line: 693 ]] --[[ Name: navigateToMultiPageSignUp ]]
            -- upvalues: v172 (copy), v14 (ref), v13 (ref)
            v172(v14({
                name = v13.MultiPageSignup, 
                extraProps = {
                    enforceResetState = true, 
                    credProtocolIsAvailableResponse = v174
                }
            }));
        end, 
        navigateSwitchToAccount = function(v175, v176, v177, v178, v179) --[[ Line: 702 ]] --[[ Name: navigateSwitchToAccount ]]
            -- upvalues: l_GetFFlagEnableLuaAccountPicker_0 (ref), v172 (copy), v94 (ref)
            if not l_GetFFlagEnableLuaAccountPicker_0() then
                return;
            else
                v172(v94(v175, v176, v177, v178, v179));
                return;
            end;
        end, 
        navigateToBirthdayPage = function() --[[ Line: 708 ]] --[[ Name: navigateToBirthdayPage ]]
            -- upvalues: v172 (copy), v14 (ref), v13 (ref)
            v172(v14({
                name = v13.Birthday
            }));
        end, 
        gotoLogin = function(v180) --[[ Line: 711 ]] --[[ Name: gotoLogin ]]
            -- upvalues: v172 (copy), v14 (ref), v13 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref)
            v172(v14({
                name = v13.Login, 
                extraProps = {
                    forcedUsernameOverride = if l_FFlagEnableLoginV1ForcedUsernameOverride_0 then v180 else nil
                }
            }));
        end, 
        gotoLoginV2 = function(v181, v182) --[[ Line: 721 ]] --[[ Name: gotoLoginV2 ]]
            -- upvalues: v172 (copy), v14 (ref), v13 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref)
            v172(v14({
                name = v13.LoginV2, 
                extraProps = {
                    credProtocolIsAvailableResponse = v181, 
                    forcedUsernameOverride = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then v182 else nil
                }
            }));
        end, 
        showAccountSwitcher = function(v183, v184, v185, v186, v187, v188, v189) --[[ Line: 732 ]] --[[ Name: showAccountSwitcher ]]
            -- upvalues: v172 (copy), v45 (ref), v43 (ref)
            v172(v45(true, v183, v43.Origin.LandingScreen, v185, v186, v187, v188, v189)):andThen(function(v190) --[[ Line: 752 ]]
                -- upvalues: v184 (copy)
                if v190 ~= nil and v184 then
                    v184(v190);
                end;
            end);
        end, 
        sessionCheck = function(v191, v192, v193, v194, v195) --[[ Line: 759 ]] --[[ Name: sessionCheck ]]
            -- upvalues: v172 (copy), v92 (ref)
            return v172(v92(v191, v192, v193, v194, v195));
        end, 
        setStatusBarHeight = function(v196) --[[ Line: 762 ]] --[[ Name: setStatusBarHeight ]]
            -- upvalues: v172 (copy), v15 (ref)
            return v172(v15(v196));
        end
    };
end)(v81);
v81 = l_RoactAppPolicy_0.connect(function(v197, _) --[[ Line: 768 ]]
    return {
        showVNGAge12Badge = v197.getShowVNGAge12Badge(), 
        useVNGUserAgreementPopup = v197.getUseVNGUserAgreementPopup(), 
        useKoreaKISAUserAgreementPopup = v197.getUseKoreaKISAUserAgreementPopup(), 
        excludeAccountSwitcher = v197.getExcludeAccountSwitcher(), 
        showBrazilContentRatingLogo = v197.getShowBrazilContentRatingLogo(), 
        appPolicy = v197
    };
end)(v81);
local v199 = l_RoactServices_0.connect({
    networking = v7, 
    guiService = l_AppGuiService_0, 
    analytics = v8, 
    loggingProtocol = l_AppLogging_0, 
    appLifecycleObserverService = l_AppAppLifecycleObserverService_0
})(v81);
local l_v199_0 = v199 --[[ copy: 108 -> 109 ]];
v81 = function(v201) --[[ Line: 788 ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), v41 (copy), l_GetFFlagSetStatusBarHeight_0 (copy), v57 (copy), v12 (copy), v2 (copy), l_v199_0 (copy), v11 (copy)
    local v202 = l_useUiModeInfo_0();
    local v203 = l_useDesignTokens_0();
    local v204 = v41();
    local v205 = false;
    if l_GetFFlagSetStatusBarHeight_0() then
        v205 = v57.useBreakpointXOrSmaller(v57.Keys.Medium);
    end;
    local v206, v207 = v12.useDefaultFocusBehavior(v204);
    return v2.createElement(l_v199_0, v11.Dictionary.join({
        uiModeInfo = v202, 
        tokens = v203, 
        eventHandlerRef = nil, 
        defaultRef = v206, 
        containerRef = v207, 
        isCompact = v205
    }, v201));
end;
if v27() then
    v81 = v59.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v208, _) --[[ Line: 816 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        local v210 = v208[l_AppBtidLayers_0.LandingLayer] or {};
        return {
            landingVideoEnabled = v210.landingVideoEnabled, 
            landingVideoAsset = v210.landingVideoAsset
        };
    end)(v81);
end;
if l_FFlagLuaEnableCustomizedInviteLandingPage_0 then
    v81 = v59.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v211, _) --[[ Line: 828 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            isCustomizedLandingPageEnabled = (v211[l_AppBtidLayers_0.LandingLayer] or {}).isCustomizedLandingPageEnabled
        };
    end)(v81);
end;
if l_GetFFlagEnableLuaAccountPicker_0() then
    v81 = v59.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v213, _) --[[ Line: 839 ]]
        -- upvalues: l_AppBtidLayers_0 (copy), l_GetFIntAccountPickerVariantOverride_0 (copy)
        local v215 = v213[l_AppBtidLayers_0.LandingLayer] or {};
        return {
            accountPickerVariantEnabled = v215.accountPickerVariantEnabled and tonumber(v215.accountPickerVariantEnabled) or l_GetFIntAccountPickerVariantOverride_0()
        };
    end)(v81);
end;
v81 = v59.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LandingLayer
}, function(v216, _) --[[ Line: 851 ]]
    -- upvalues: l_AppBtidLayers_0 (copy)
    return {
        landingPageLatency = (v216[l_AppBtidLayers_0.LandingLayer] or {}).landingPageLatency or 0
    };
end)(v81);
v199 = function() --[[ Line: 859 ]] --[[ Name: getSignupLayerVariables ]]
    -- upvalues: v61 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), v51 (copy)
    return v61() or l_GetFFlagEnableMultiPageSignup_0() or v51;
end;
if v61() or l_GetFFlagEnableMultiPageSignup_0() or v51 then
    v81 = v59.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v218, _) --[[ Line: 868 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        local v220 = v218[l_AppBtidLayers_0.SignupLayer] or {};
        return {
            shouldShowMultipageSignupDirectionalTest = v220.shouldShowMultipageSignupDirectionalTest, 
            shouldShowKoreanKISASignUpFlow = v220.shouldShowKoreanKISASignUpFlow, 
            shouldEnableMultiPageSignup = v220.shouldEnableMultiPageSignup
        };
    end)(v81);
end;
if l_FFlagEnableLuaLoginRevamp_0 then
    v81 = v59.connectBrowserTrackerLayer({
        l_FStringLuaLoginRevampIxpLayer_0
    }, function(v221, _) --[[ Line: 881 ]]
        -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (copy)
        return {
            showLoginRevamp = (v221[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
        };
    end)(v81);
end;
v81 = v59.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LandingLayer
}, function(v223, _) --[[ Line: 891 ]]
    -- upvalues: l_AppBtidLayers_0 (copy)
    return {
        shouldDoSessionCheck = (v223[l_AppBtidLayers_0.LandingLayer] or {}).shouldDoSessionCheck
    };
end)(v81);
if v108 then
    v81 = v59.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.LandingLayer
    }, function(v225, _) --[[ Line: 901 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldDisplayBrazilAgeRatingIXP = (v225[l_AppBtidLayers_0.LandingLayer] or {}).shouldDisplayBrazilAgeRating
        };
    end)(v81);
end;
v81 = v59.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.AccountSwitcherLayer
}, function(v227, _) --[[ Line: 911 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy)
    local v229 = v227[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
    if l_GetFFlagEnableAccountSwitcherRedesignIXP_0() then
        return {
            enableFoundationDesign = v229.enableAccountSwitcherFoundationDesign == true, 
            enableSignedOutAccounts = v229.enableAccountSwitcherSignedOutAccounts == true
        };
    else
        return {
            enableFoundationDesign = true, 
            enableSignedOutAccounts = true
        };
    end;
end)(v81);
return function(v230) --[[ Line: 926 ]]
    -- upvalues: v44 (copy), l_useAppPolicy_0 (copy), v2 (copy), v22 (copy), l_FFlagLuafiedWechatQQLogin_0 (copy), l_WechatQQLoginPage_0 (copy), v81 (ref)
    if if v44.LuaAuthEnabledForLuobu() then l_useAppPolicy_0(function(v231) --[[ Line: 928 ]]
        return v231.useLuobuAuthentication();
    end) else false then
        return v2.createElement(v22, v230);
    elseif if l_FFlagLuafiedWechatQQLogin_0 then l_useAppPolicy_0(function(v232) --[[ Line: 938 ]]
        return v232.useWechatQQAuthentication();
    end) else false then
        return v2.createElement(l_WechatQQLoginPage_0, v230);
    else
        return v2.createElement(v81, v230);
    end;
end;