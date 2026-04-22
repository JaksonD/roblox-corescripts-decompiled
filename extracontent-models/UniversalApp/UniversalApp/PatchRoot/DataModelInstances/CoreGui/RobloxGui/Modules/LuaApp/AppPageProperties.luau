local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Modules_0.LuaApp.FlagSettings);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_Modules_0.LuaApp.getExperienceDetailsPageNavBarVisible);
local v8 = require(l_Modules_0.LuaApp.Flags.getFFlagContactImporterHideBottomBar);
local l_GetFFlagEnableAbuseReport10ft_0 = v6.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v12 = game:DefineFastFlag("LuaAppIncorrectWebViewProperty", false);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableNativeWrapperAppPage);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixNavBarStartupDuplicateAnim);
local l_SocialNetworksInEditProfileIXP_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP;
local l_FFlagFriendRequestNicknames_0 = v6.FFlagFriendRequestNicknames;
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local l_FFlagShareTargetGameCleanup_0 = v6.FFlagShareTargetGameCleanup;
local l_FFlagPasskeyUpsellEnabled_0 = v6.FFlagPasskeyUpsellEnabled;
local l_FFlagTutorialUpsellEnabled_0 = v6.FFlagTutorialUpsellEnabled;
local l_FFlagEnableSocialProofUserList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList;
local l_FFlagProfilePlatformAddTC_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC;
local l_FFlagTCShareLinkErrorModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal;
local l_FFlagTCVerifiedParentalControl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl;
local l_FFlagAppIaScrollAway_0 = v6.FFlagAppIaScrollAway;
local l_FFlagAddVideoToCommunityProfile_0 = v6.FFlagAddVideoToCommunityProfile;
local l_FFlagLuaAppSortDeeplinkFix_0 = v6.FFlagLuaAppSortDeeplinkFix;
local v29 = game:DefineFastFlag("WebViewHideLuaSideBar", false);
local l_FFlagFixMoreSubMenuTitleFlash_0 = v6.FFlagFixMoreSubMenuTitleFlash;
local l_FFlagEnableSocialProofVerticalUserListSheet_0 = v6.FFlagEnableSocialProofVerticalUserListSheet;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v33 = game:DefineFastFlag("TCEducationModalSideBarPolicy", false);
local l_FFlagEnableBlackbird_0 = v6.FFlagEnableBlackbird;
local l_FFlagLuaAppEnableStratusStreamingTestOnly_0 = v6.FFlagLuaAppEnableStratusStreamingTestOnly;
local l_FFlagEnableMobileGameJoinCard_0 = v6.FFlagEnableMobileGameJoinCard;
local l_FFlagRemoveUnusedSignupPages_0 = v6.FFlagRemoveUnusedSignupPages;
local v38 = {
    [v4.None] = {
        nameLocalizationKey = "CommonUI.Features.Label.Nil", 
        disableAppTopBanner = true
    }, 
    [v4.Startup] = {
        tabBarHidden = v5.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup", 
        disableAppTopBanner = true
    }, 
    [v4.Landing] = {
        tabBarHidden = v5.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup", 
        appShellReporterFeature = Enum.AppShellFeature.Landing
    }, 
    [v4.EngagementScreenContainer] = {
        tabBarHidden = v5.Hidden
    }, 
    [v4.Login] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v5.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v4.LoginV2] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v5.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v4.WechatQQAuth] = {
        nameLocalizationKey = "Authentication.Login.Heading.Login", 
        tabBarHidden = v5.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v4.AccountRecovery] = {
        nameLocalizationKey = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        tabBarHidden = v5.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil, 
        disableBackButton = true
    }, 
    [v4.CrossDeviceLogin] = {
        nameLocalizationKey = "Authentication.CrossDevice.Heading.QuickLogin", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.Birthday] = {
        nameLocalizationKey = "Authentication.SignUp.Label.WhensYourBirthday", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.CharacterSelectionPage] = if l_FFlagRemoveUnusedSignupPages_0 then nil else {
        nameLocalizationKey = "Authentication.SignUp.Heading.SelectStartingAvatar", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.UsernameSelectionPage] = if l_FFlagRemoveUnusedSignupPages_0 then nil else {
        nameLocalizationKey = "Authentication.SignUp.Heading.UsernamePage", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.PasswordSelectionPage] = if l_FFlagRemoveUnusedSignupPages_0 then nil else {
        nameLocalizationKey = "Authentication.SignUp.Heading.PasswordPage", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.SinglePageSignUp] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v5.Hidden, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v4.MultiPageSignup] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v5.Hidden, 
        disableBackButton = true, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v4.LuobuSignUpPage] = {
        nameLocalizationKey = "Authentication.SignUp.Label.SignUp", 
        tabBarHidden = v5.Hidden
    }, 
    [v4.WeChatLoginWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden
    }, 
    [v4.Home] = {
        nameLocalizationKey = "CommonUI.Features.Label.Home", 
        appShellReporterFeature = Enum.AppShellFeature.HomePage, 
        tabBarHidden = v5.Visible, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.Games] = {
        nameLocalizationKey = v3.GetGamesTabName(), 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        tabBarHidden = v5.Visible, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.GameDetail] = {
        nameLocalizationKey = "CommonUI.Features.Heading.GameDetails", 
        tabBarHidden = v7, 
        renderUnderlyingPage = true, 
        blurUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.GamePage, 
        isPeekView = true
    }, 
    [v4.AvatarExperienceRoot] = {
        nameLocalizationKey = "CommonUI.Features.Label.Avatar", 
        tabBarHidden = v5.Visible, 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true, 
        disableAppTopBanner = l_GetFFlagLuaAppEnableTopBanner_0() and true or nil
    }, 
    [v4.Chat] = {
        nameLocalizationKey = "CommonUI.Features.Label.Chat", 
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.Chat, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.ContentFeed] = {
        disableBackButton = false, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.ShareGameToChat] = if l_FFlagShareTargetGameCleanup_0 then nil else {
        tabBarHidden = v5.PolicyDependent
    }, 
    [v4.AvatarExperienceWrapper] = {
        overridesAppRouterTabBarControl = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v4.AvatarExperienceWrapperTransparent] = {
        overridesAppRouterTabBarControl = true, 
        renderUnderlyingPage = true, 
        appShellReporterFeature = Enum.AppShellFeature.AvatarEditor, 
        disableBackButton = true
    }, 
    [v4.SearchPage] = {
        tabBarHidden = v5.Visible, 
        overridesAppRouterTabBarControl = false, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.More] = {
        nameLocalizationKey = "CommonUI.Features.Label.More", 
        tabBarHidden = v5.Visible, 
        appShellReporterFeature = Enum.AppShellFeature.More, 
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.AccountInfo] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.About] = {
        nameLocalizationKey = "CommonUI.Features.Label.About", 
        tabBarHidden = v5.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v4.SafetySupport] = {
        nameLocalizationKey = "CommonUI.Features.Label.HelpAndSafety", 
        tabBarHidden = v5.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v4.Settings] = {
        nameLocalizationKey = "CommonUI.Features.Label.Settings", 
        tabBarHidden = v5.Visible, 
        alwaysShowBackButton = l_FFlagFixMoreSubMenuTitleFlash_0 and true or nil
    }, 
    [v4.Accessibility] = {
        nameLocalizationKey = "Feature.Accessibility.Heading.DevicePreferences", 
        tabBarHidden = v5.Visible
    }, 
    [v4.Licensing] = {
        nameLocalizationKey = "CommonUI.Features.Label.Licensing", 
        tabBarHidden = v5.Visible
    }, 
    [v4.AppInformation] = {
        nameLocalizationKey = "CommonUI.Features.Label.AppInformation", 
        tabBarHidden = v5.Visible
    }, 
    [v4.DevSubs] = {
        nameLocalizationKey = "CommonUI.Features.Label.DevSubs", 
        tabBarHidden = v5.Visible
    }, 
    [v4.AddFriendsPage] = {
        nameLocalizationKey = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        nativeWrapper = false, 
        tabBarHidden = v5.PolicyDependent, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = false
    }, 
    [v4.ConnectionsHub] = {
        nativeWrapper = false, 
        tabBarHidden = v5.PolicyDependent, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = false
    }, 
    [v4.BuildersClub] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.InviteLinkExpiredModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v4.ShareLinkInvalidModal] = {
        absorbInput = true, 
        renderUnderlyingPage = true
    }, 
    [v4.VerifiedBadgeModal] = {
        renderUnderlyingPage = true
    }, 
    [v4.ShareVirtualEventModal] = {
        renderUnderlyingPage = true
    }, 
    [v4.EventNotificationsModal] = {
        renderUnderlyingPage = true
    }, 
    [v4.EventDetails] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        blurUnderlyingPage = true
    }, 
    [v4.TencentHelp] = {
        nameLocalizationKey = "CommonUI.Features.Label.Help", 
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.TencentNoticeCenter] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v5.Visible
    }, 
    [v4.TencentNoticeContent] = {
        nameLocalizationKey = "CommonUI.Features.Label.TencentNotice", 
        tabBarHidden = v5.Visible
    }, 
    [v4.GenericWebPage] = {
        webView = true, 
        nativeWrapper = true, 
        renderUnderlyingPage = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent
    }, 
    [v4.SettingsSubPage] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.SecurityAlertInfo] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.YouTubePlayer] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.PurchaseRobux] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if not not v29 or l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = (not l_FFlagEnableLeftNavOnConsole_0 or not l_GuiService_0:IsTenFootInterface()) and (not l_IsVRAppBuild_0() or false)
    }, 
    [v4.Payment] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.RobuxUpsell] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.SubscriptionPurchase] = {
        webView = false, 
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.Notifications] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.LogoutConfirmation] = {
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.AddFriends] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.ViewUserProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.ViewProfile] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.AccountSelectorPeekView] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v4.AccountSwitchingAddAccountPeekView] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v4.LoginNative] = {
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.CaptchaNative] = {
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.ViewFriends] = {
        webView = false, 
        nativeWrapper = false, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v4.ShareSheet] = {
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.SdkShare] = {
        nativeWrapper = false, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v4.ReportAbuse] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.ScanQrCode] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.GenericOpaqueWebPage] = {
        nativeWrapper = true, 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = false
    }, 
    [v4.ChallengeHybridOverlayPage] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true
    }, 
    [v4.ChallengeHybridWebView] = {
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.ProfilePlatform] = {
        nameLocalizationKey = "CommonUI.Features.Label.Profile", 
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        isPeekView = true, 
        disableBackButton = true
    }, 
    [v4.Groups] = {
        nameLocalizationKey = "CommonUI.Features.Label.Groups", 
        tabBarHidden = v5.PolicyDependent, 
        disableBackButton = false
    }, 
    [v4.SocialUnableToJoinExperience] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v4.SocialPurchaseExperience] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v4.SocialToast] = {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = false, 
        overlayTransparency = 1, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v4.EditSocialNetworks] = if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    } else nil, 
    [v4.EditSocialNetworksError] = if l_SocialNetworksInEditProfileIXP_0.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    } else nil, 
    [v4.PhoneVerification] = {
        webView = not v12 or nil, 
        tabBarHidden = if not v29 or v12 then v5.PolicyDependent else v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.EditUsername] = {
        webView = not v12 or nil, 
        tabBarHidden = if not v29 or v12 then v5.PolicyDependent else v5.Hidden, 
        renderUnderlyingPage = true
    }, 
    [v4.ExperienceGuidelinesExplained] = {
        nameLocalizationKey = "Feature.GameDetails.Label.ContentMaturity", 
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v4.AgeVerificationRequired] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v4.AccountSettingsUpsell] = {
        renderUnderlyingPage = true, 
        tabBarHidden = v5.PolicyDependent
    }, 
    [v4.IDVUpsellContainer] = {
        renderUnderlyingPage = true
    }, 
    [v4.VPCUpsellContainer] = {
        renderUnderlyingPage = true
    }, 
    [v4.RobloxSubscriptionUpsell] = {
        renderUnderlyingPage = true
    }, 
    [v4.AmpWizardContainer] = {
        renderUnderlyingPage = true
    }, 
    [v4.GamesList] = {
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    }, 
    [v4.DeeplinkGamesList] = if l_FFlagLuaAppSortDeeplinkFix_0 then {
        enableScrollAway = l_FFlagAppIaScrollAway_0 and true or nil
    } else nil, 
    [v4.ContactImporter] = {
        tabBarHidden = if v8() then v5.Hidden else false, 
        bottomTabBarHidden = v8() and true or false, 
        sideTabBarHidden = v8() and true or false, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    }, 
    [v4.ContactsList] = {
        tabBarHidden = v5.Hidden, 
        bottomTabBarHidden = true, 
        sideTabBarHidden = true, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    }, 
    [v4.UAppBlock] = {
        tabBarHidden = v5.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Startup"
    }, 
    [v4.PassesPage] = {
        nameLocalizationKey = "Feature.GameDetails.Label.Store", 
        appShellReporterFeature = Enum.AppShellFeature.GamePage
    }, 
    [v4.SocialMessageToast] = {
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    [v4.ProfileQRCodePage] = {
        absorbInput = true, 
        renderUnderlyingPage = true, 
        tabBarHidden = v5.PolicyDependent
    }, 
    [v4.ParentVerification] = {
        webView = true, 
        tabBarHidden = if v29 then v5.Hidden else nil
    }, 
    [v4.EmailVerification] = {
        webView = true, 
        tabBarHidden = if v29 then v5.Hidden else nil
    }, 
    [v4.AddAuthMethodPage] = {
        tabBarHidden = v5.Hidden
    }, 
    [v4.PasskeyUpsellScreen] = if l_FFlagPasskeyUpsellEnabled_0 then {
        renderUnderlyingPage = true, 
        tabBarHidden = v5.Hidden
    } else nil, 
    [v4.TutorialUpsellScreen] = if l_FFlagTutorialUpsellEnabled_0 then {
        renderUnderlyingPage = true, 
        tabBarHidden = v5.Hidden
    } else nil, 
    [v4.SponsoredTooltipPeekView] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v4.InfoPeekView] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v4.ReportDialog] = {
        disableBackButton = false, 
        renderUnderlyingPage = true
    }, 
    [v4.SetNicknameModal] = if l_FFlagFriendRequestNicknames_0 then {
        overlayEnabled = true, 
        transparent = true, 
        absorbInput = true, 
        overlayTransparency = 0.5, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        bottomTabBarHidden = true, 
        tabBarHidden = v5.Hidden
    } else nil, 
    [v4.VoiceTrialUpsell] = if v17() then {
        renderUnderlyingPage = true, 
        absorbInput = true
    } else nil, 
    [v4.GameFilterMenuPeekView] = {
        tabBarHidden = v5.PolicyDependent, 
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        isPeekView = true
    }, 
    [v4.VideoFullscreen] = if l_FFlagAddVideoToCommunityProfile_0 then {
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true, 
        disableBackButton = false
    } else nil
};
if l_GetFFlagLuaAppChallengeDialogContainerPageEnabled_0() then
    v38[v4.ChallengeDialogModalContainer] = {
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    };
end;
if l_GetFFlagEnableAbuseReport10ft_0() then
    v38[v4.ReportScreen] = {
        nameLocalizationKey = "Feature.GameDetails.Label.ReportAbuse", 
        tabBarHidden = v5.Visible, 
        renderUnderlyingPage = false
    };
end;
if v13() then
    v38[v4.ChallengeNativeWrapper] = {
        nativeWrapper = true, 
        tabBarHidden = v5.Hidden, 
        renderUnderlyingPage = true
    };
end;
if v14() then
    v38[v4.PlatformAccountRouter] = {
        tabBarHidden = v5.Hidden
    };
end;
v38[v4.DiscoverabilityOverlay] = {
    tabBarHidden = v5.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v38[v4.FindFriendsModal] = {
    tabBarHidden = v5.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v38[v4.ContactsRevokedAccessDialog] = {
    tabBarHidden = v5.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v38[v4.SettingsPermissionInteractiveAlert] = {
    tabBarHidden = v5.Hidden, 
    bottomTabBarHidden = true, 
    sideTabBarHidden = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v38[v4.TrustedContactsEducationModal] = {
    tabBarHidden = if v33 then nil else v5.Hidden, 
    bottomTabBarHidden = not v33 or nil, 
    sideTabBarHidden = not v33 or nil, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
if l_FFlagProfilePlatformAddTC_0 then
    v38[v4.TrustedContactsModal] = {
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    };
end;
if l_FFlagTCVerifiedParentalControl_0 then
    v38[v4.TrustedFriendsVPCPrologue] = {
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true
    };
end;
v38[v4.FAEUpsell] = {
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true
};
v38[v4.FriendsRenameInfoModal] = {
    tabBarHidden = v5.PolicyDependent, 
    isPeekView = true, 
    renderUnderlyingPage = true, 
    disableBackButton = true, 
    overlayEnabled = true, 
    absorbInput = true
};
if l_FFlagTCShareLinkErrorModal_0 then
    v38[v4.TrustedFriendsShareLinkErrorModal] = {
        renderUnderlyingPage = true, 
        disableBackButton = true, 
        overlayEnabled = true, 
        absorbInput = true
    };
end;
if l_FFlagEnableSocialProofUserList_0 then
    v38[v4.FriendsOwnedUserList] = {
        renderUnderlyingPage = true, 
        isPeekView = true, 
        overlayEnabled = true
    };
end;
if l_FFlagEnableSocialProofVerticalUserListSheet_0 then
    v38[v4.SocialProofVerticalUserListSheet] = {
        renderUnderlyingPage = true, 
        isPeekView = true, 
        overlayEnabled = true
    };
end;
v38[v4.MutualConnectionList] = {
    renderUnderlyingPage = true, 
    isPeekView = true, 
    overlayEnabled = true
};
v38[v4.BlockingModal] = {
    renderUnderlyingPage = true, 
    overlayEnabled = true
};
v38[v4.AboutDetailsSheet] = {
    isPeekView = true, 
    renderUnderlyingPage = true, 
    overlayEnabled = true
};
v38[v4.NotApprovedPage] = {
    tabBarHidden = v5.Hidden, 
    disableBackButton = true, 
    disableAppTopBanner = true
};
if l_FFlagEnableLeftNavOnConsole_0 then
    v38[v4.AdjustScreen] = {
        tabBarHidden = v5.Hidden
    };
    v38[v4.ExperienceDetail] = {
        tabBarHidden = if l_GuiService_0:IsTenFootInterface() then v5.Hidden else v5.PolicyDependent
    };
end;
if l_FFlagEnableBlackbird_0 then
    v38[v4.Blackbird] = {
        webView = true, 
        nativeWrapper = true, 
        tabBarHidden = if v29 then v5.Hidden else v5.PolicyDependent, 
        renderUnderlyingPage = true
    };
end;
if l_FFlagLuaAppEnableStratusStreamingTestOnly_0 then
    v38[v4.VideoServer] = {
        tabBarHidden = v5.Hidden, 
        nameLocalizationKey = "CommonUI.Features.Label.Nil", 
        disableAppTopBanner = true, 
        disableBackButton = true
    };
end;
if l_FFlagEnableMobileGameJoinCard_0 then
    v38[v4.GameJoinCard] = {
        tabBarHidden = v5.PolicyDependent, 
        isPeekView = true, 
        renderUnderlyingPage = true, 
        overlayEnabled = true
    };
end;
return v38;