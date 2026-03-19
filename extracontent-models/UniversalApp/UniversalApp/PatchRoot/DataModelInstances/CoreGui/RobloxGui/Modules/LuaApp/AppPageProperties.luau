local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.FlagSettings);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_Modules_0.LuaApp.getExperienceDetailsPageNavBarVisible);
local v7 = require(l_Modules_0.LuaApp.Flags.getFFlagContactImporterHideBottomBar);
local l_GetFFlagEnableAbuseReport10ft_0 = v5.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v11 = game:DefineFastFlag("LuaAppIncorrectWebViewProperty", false);
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableNativeWrapperAppPage);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixNavBarStartupDuplicateAnim);
local l_SocialNetworksInEditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP;
local l_FFlagFriendRequestNicknames_0 = v5.FFlagFriendRequestNicknames;
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local l_FFlagShareTargetGameCleanup_0 = v5.FFlagShareTargetGameCleanup;
local l_FFlagPasskeyUpsellEnabled_0 = v5.FFlagPasskeyUpsellEnabled;
local l_FFlagTutorialUpsellEnabled_0 = v5.FFlagTutorialUpsellEnabled;
local l_FFlagEnableSocialProofUserList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList;
local l_FFlagProfilePlatformAddTC_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC;
local l_FFlagTCVerifiedParentalControl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagAppIaScrollAway_0 = v5.FFlagAppIaScrollAway;
local l_FFlagAddVideoToCommunityProfile_0 = v5.FFlagAddVideoToCommunityProfile;
local l_FFlagLuaAppSortDeeplinkFix_0 = v5.FFlagLuaAppSortDeeplinkFix;
local v27 = game:DefineFastFlag("WebViewHideLuaSideBar", false);
local l_FFlagFixMoreSubMenuTitleFlash_0 = v5.FFlagFixMoreSubMenuTitleFlash;
local l_FFlagEnableNapDedicatedPage_0 = v5.FFlagEnableNapDedicatedPage;
local l_FFlagEnableSocialProofVerticalUserListSheet_0 = v5.FFlagEnableSocialProofVerticalUserListSheet;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v32 = game:DefineFastFlag("TCEducationModalSideBarPolicy", false);
local l_FFlagEnableBlackbird_0 = v5.FFlagEnableBlackbird;
local v34 = {
    [v3.None] = {
        nameLocalizationKey = "CommonUI.Features.Label.Nil", 
        disableAppTopBanner = true
    }, 
    [v3.Startup] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup", 
        disableAppTopBanner = true
    }, 
    [v3.Landing] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup", 
        appShellReporterFeature = Enum.AppShellFeature.Landing
    }, 
    [v3.EngagementScreenContainer] = {
        tabBarHidden = v4.Hidden
    }, 
    [v3.Login] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v4.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v3.LoginV2] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v4.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v3.WechatQQAuth] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v4.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v3.AccountRecovery] = {
        nameLocalizationKey = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        tabBarHidden = v4.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v3.CrossDeviceLogin] = {
        nameLocalizationKey = "Authentication.CrossDevice.Heading.QuickLogin", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.Birthday] = {
        nameLocalizationKey = "Authentication.SignUp.Label.WhensYourBirthday", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.CharacterSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.SelectStartingAvatar", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.UsernameSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.UsernamePage", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.PasswordSelectionPage] = {
        nameLocalizationKey = "Authentication.SignUp.Heading.PasswordPage", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.SinglePageSignUp] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v4.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v3.MultiPageSignup] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v4.Hidden, 
        disableBackButton = true, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v3.LuobuSignUpPage] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v4.Hidden
    }, 
    [v3.WeChatLoginWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden
    }, 
    [v3.Home] = {
        nameLocalizationKey = "CommonUI.Features.Label.Home", 
        appShellReporterFeature = Enum.AppShellFeature.HomePage, 
        tabBarHidden = v4.Visible, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.Games] = {
        nameLocalizationKey = v2.GetGamesTabName(), 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        tabBarHidden = v4.Visible, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.GameDetail] = {
        nameLocalizationKey = "CommonUI.Features.Heading.GameDetails", 
        tabBarHidden = v6, 
        renderUnderlyingPage = true, 
        blurUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        isPeekView = true
    }, 
    [v3.AvatarExperienceRoot] = {
        nameLocalizationKey = "CommonUI.Features.Label.Avatar", 
        tabBarHidden = v4.Visible, 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v3.Chat] = {
        nameLocalizationKey = "CommonUI.Features.Label.Chat", 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.Chat, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.ContentFeed] = {
        disableBackButton = false, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ShareGameToChat] = if l_FFlagShareTargetGameCleanup_0 then nil else {
        tabBarHidden = v4.PolicyDependent
    }, 
    [v3.AvatarExperienceWrapper] = {
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v3.AvatarExperienceWrapperTransparent] = {
        overridesAppRouterTabBarControl = true, 
        renderUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v3.SearchPage] = {
        tabBarHidden = v4.Visible, 
        overridesAppRouterTabBarControl = false, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.More] = {
        nameLocalizationKey = "CommonUI.Features.Label.More", 
        tabBarHidden = v4.Visible, 
        appShellReporterFeature = Enum.AppShellFeature.More, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.AccountInfo] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.About] = {
        nameLocalizationKey = "CommonUI.Features.Label.About", 
        tabBarHidden = v4.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v3.SafetySupport] = {
        nameLocalizationKey = "CommonUI.Features.Label.HelpAndSafety", 
        tabBarHidden = v4.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v3.Settings] = {
        nameLocalizationKey = "CommonUI.Features.Label.Settings", 
        tabBarHidden = v4.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v3.Accessibility] = {
        nameLocalizationKey = "Feature.Accessibility.Heading.DevicePreferences", 
        tabBarHidden = v4.Visible
    }, 
    [v3.Licensing] = {
        nameLocalizationKey = "CommonUI.Features.Label.Licensing", 
        tabBarHidden = v4.Visible
    }, 
    [v3.AppInformation] = {
        nameLocalizationKey = "CommonUI.Features.Label.AppInformation", 
        tabBarHidden = v4.Visible
    }, 
    [v3.DevSubs] = {
        nameLocalizationKey = "CommonUI.Features.Label.DevSubs", 
        tabBarHidden = v4.Visible
    }, 
    [v3.AddFriendsPage] = {
        nameLocalizationKey = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        nativeWrapper = false, 
        tabBarHidden = v4.PolicyDependent, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = false
    }, 
    [v3.ConnectionsHub] = {
        nativeWrapper = false, 
        tabBarHidden = v4.PolicyDependent, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = false
    }, 
    [v3.BuildersClub] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.InviteLinkExpiredModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v3.ShareLinkInvalidModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v3.VerifiedBadgeModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.ShareVirtualEventModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.EventNotificationsModal] = {
        renderUnderlyingPage = true
    }, 
    [v3.EventDetails] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        blurUnderlyingPage = true
    }, 
    [v3.TencentHelp] = {
        nameLocalizationKey = "CommonUI.Features.Label.Help", 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.TencentNoticeCenter] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v4.Visible
    }, 
    [v3.TencentNoticeContent] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v4.Visible
    }, 
    [v3.GenericWebPage] = {
        webView = true, 
        nativeWrapper = true, 
        renderUnderlyingPage = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent
    }, 
    [v3.SettingsSubPage] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.SecurityAlertInfo] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.YouTubePlayer] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.PurchaseRobux] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = not l_IsVRAppBuild_0() or false
    }, 
    [v3.Payment] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.RobuxUpsell] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.SubscriptionPurchase] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.Notifications] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.LogoutConfirmation] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.AddFriends] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewUserProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.AccountSelectorPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.AccountSwitchingAddAccountPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.LoginNative] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.CaptchaNative] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.ViewFriends] = {
        webView = false, 
        nativeWrapper = false, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v3.ShareSheet] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.SdkShare] = {
        nativeWrapper = false, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.ReportAbuse] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ScanQrCode] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.GenericOpaqueWebPage] = {
        nativeWrapper = true, 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v3.ChallengeHybridOverlayPage] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v3.ChallengeHybridWebView] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.ProfilePlatform] = {
        nameLocalizationKey = "CommonUI.Features.Label.Profile", 
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        isPeekView = true, 
        disableBackButton = true
    }, 
    [v3.Groups] = {
        nameLocalizationKey = "CommonUI.Features.Label.Groups", 
        tabBarHidden = v4.PolicyDependent, 
        disableBackButton = false
    }, 
    [v3.SocialUnableToJoinExperience] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.SocialPurchaseExperience] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.SocialToast] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = false, 
        overlayTransparency = 1, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.EditSocialNetworks] = if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    } else nil, 
    [v3.EditSocialNetworksError] = if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    } else nil, 
    [v3.PhoneVerification] = {
        webView = not v11 or nil, 
        tabBarHidden = if not v27 or v11 then v4.PolicyDependent else v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.EditUsername] = {
        webView = not v11 or nil, 
        tabBarHidden = if not v27 or v11 then v4.PolicyDependent else v4.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v3.ExperienceGuidelinesExplained] = {
        nameLocalizationKey = "Feature.GameDetails.Label.ContentMaturity", 
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v3.AgeVerificationRequired] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v3.AccountSettingsUpsell] = {
        renderUnderlyingPage = true, 
        tabBarHidden = v4.PolicyDependent
    }, 
    [v3.IDVUpsellContainer] = {
        renderUnderlyingPage = true
    }, 
    [v3.VPCUpsellContainer] = {
        renderUnderlyingPage = true
    }, 
    [v3.RobloxSubscriptionUpsell] = {
        renderUnderlyingPage = true
    }, 
    [v3.AmpWizardContainer] = {
        renderUnderlyingPage = true
    }, 
    [v3.GamesList] = {
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v3.DeeplinkGamesList] = if l_FFlagLuaAppSortDeeplinkFix_0 then {
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    } else nil, 
    [v3.ContactImporter] = {
        tabBarHidden = if v7() then v4.Hidden else false, 
        bottomTabBarHidden = v7() and true or false, 
        sideTabBarHidden = v7() and true or false, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    }, 
    [v3.ContactsList] = {
        tabBarHidden = v4.Hidden, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = true, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    }, 
    [v3.UAppBlock] = {
        tabBarHidden = v4.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup"
    }, 
    [v3.PassesPage] = {
        nameLocalizationKey = "Feature.GameDetails.Label.Store", 
        appShellReporterFeature = Enum.AppShellFeature.GamePage
    }, 
    [v3.SocialMessageToast] = {
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v3.ProfileQRCodePage] = {
        absorbInput = true, 
        renderUnderlyingPage = true, 
        tabBarHidden = v4.PolicyDependent
    }, 
    [v3.ParentVerification] = {
        webView = true, 
        tabBarHidden = if v27 then v4.Hidden else nil
    }, 
    [v3.EmailVerification] = {
        webView = true, 
        tabBarHidden = if v27 then v4.Hidden else nil
    }, 
    [v3.AddAuthMethodPage] = {
        tabBarHidden = v4.Hidden
    }, 
    [v3.PasskeyUpsellScreen] = if l_FFlagPasskeyUpsellEnabled_0 then {
        renderUnderlyingPage = true, 
        tabBarHidden = v4.Hidden
    } else nil, 
    [v3.TutorialUpsellScreen] = if l_FFlagTutorialUpsellEnabled_0 then {
        renderUnderlyingPage = true, 
        tabBarHidden = v4.Hidden
    } else nil, 
    [v3.SponsoredTooltipPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.InfoPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.ReportDialog] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v3.SetNicknameModal] = if l_FFlagFriendRequestNicknames_0 then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        bottomTabBarHidden = true, 
        tabBarHidden = v4.Hidden
    } else nil, 
    [v3.VoiceTrialUpsell] = if v16() then {
        renderUnderlyingPage = true, 
        absorbInput = true
    } else nil, 
    [v3.GameFilterMenuPeekView] = {
        tabBarHidden = v4.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v3.VideoFullscreen] = if l_FFlagAddVideoToCommunityProfile_0 then {
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true, 
        disableBackButton = false
    } else nil
};
if l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0() then
    v34[v3.ChallengeDialogModalContainer] = {
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    };
end;
if l_GetFFlagEnableAbuseReport10ft_0() then
    v34[v3.ReportScreen] = {
        nameLocalizationKey = "Feature.GameDetails.Label.ReportAbuse", 
        tabBarHidden = v4.Visible, 
        renderUnderlyingPage = false
    };
end;
if v12() then
    v34[v3.ChallengeNativeWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v4.Hidden, 
        renderUnderlyingPage = true
    };
end;
if v13() then
    v34[v3.PlatformAccountRouter] = {
        tabBarHidden = v4.Hidden
    };
end;
v34[v3.DiscoverabilityOverlay] = {
    tabBarHidden = v4.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v34[v3.FindFriendsModal] = {
    tabBarHidden = v4.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v34[v3.ContactsRevokedAccessDialog] = {
    tabBarHidden = v4.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v34[v3.SettingsPermissionInteractiveAlert] = {
    tabBarHidden = v4.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v34[v3.TrustedContactsEducationModal] = {
    tabBarHidden = if v32 then nil else v4.Hidden, 
    bottomTabBarHidden = not v32 or nil, 
    sideTabBarHidden = not v32 or nil, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
if l_FFlagProfilePlatformAddTC_0 then
    v34[v3.TrustedContactsModal] = {
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    };
end;
if l_FFlagTCVerifiedParentalControl_0 then
    v34[v3.TrustedFriendsVPCPrologue] = {
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    };
end;
v34[v3.FAEUpsell] = {
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v34[v3.FriendsRenameInfoModal] = {
    tabBarHidden = v4.PolicyDependent, 
    isPeekView = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true, 
    absorbInput = true
};
if l_FFlagEnableSocialProofUserList_0 then
    v34[v3.FriendsOwnedUserList] = {
        renderUnderlyingPage = true, 
        isPeekView = true, 
        overlayEnabled = true
    };
end;
if l_FFlagEnableSocialProofVerticalUserListSheet_0 then
    v34[v3.SocialProofVerticalUserListSheet] = {
        renderUnderlyingPage = true, 
        isPeekView = true, 
        overlayEnabled = true
    };
end;
v34[v3.MutualConnectionList] = {
    renderUnderlyingPage = true, 
    isPeekView = true, 
    overlayEnabled = true
};
v34[v3.BlockingModal] = {
    renderUnderlyingPage = true, 
    overlayEnabled = true
};
v34[v3.AboutDetailsSheet] = {
    isPeekView = true, 
    renderUnderlyingPage = true, 
    overlayEnabled = true
};
if l_FFlagEnableNapDedicatedPage_0 then
    v34[v3.NotApprovedPage] = {
        tabBarHidden = v4.Hidden, 
        disableBackButton = true, 
        disableAppTopBanner = true
    };
end;
if l_FFlagEnableLeftNavOnConsole_0 then
    v34[v3.AdjustScreen] = {
        tabBarHidden = v4.Hidden
    };
end;
if l_FFlagEnableBlackbird_0 then
    v34[v3.Blackbird] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v27 then v4.Hidden else v4.PolicyDependent, 
        renderUnderlyingPage = true
    };
end;
return v34;