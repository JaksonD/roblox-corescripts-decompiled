local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local FlagSettings = require(Modules.LuaApp.FlagSettings)
local AppPage = require(Modules.LuaApp.AppPage)
local SystemBarVisibility = require(Modules.LuaApp.Enum.SystemBarVisibility)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local getExperienceDetailsPageNavBarVisible = require(Modules.LuaApp.getExperienceDetailsPageNavBarVisible)
local GetFFlagEnableAbuseReport10ft = SharedFlags.GetFFlagEnableAbuseReport10ft
local GetFFlagLuaAppChallengeDialogContainerPageEnabled = require(CorePackages.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled
local IsVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local v12 = game:DefineFastFlag("LuaAppIncorrectWebViewProperty", false)
local GetFFlagEnableNativeWrapperAppPage = require(Modules.LuaApp.Flags.GetFFlagEnableNativeWrapperAppPage)
local GetFFlagFixNavBarStartupDuplicateAnim = require(Modules.LuaApp.Flags.GetFFlagFixNavBarStartupDuplicateAnim)
local SocialNetworksInEditProfileIXP = require(CorePackages.Workspace.Packages.EditProfile).Flags.SocialNetworksInEditProfileIXP
local FFlagFriendRequestNicknames = SharedFlags.FFlagFriendRequestNicknames
local GetFFlagEnableVoiceTrialUpsellCard = require(Modules.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local GetFFlagLuaAppEnableTopBanner = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner
local FFlagShareTargetGameCleanup = SharedFlags.FFlagShareTargetGameCleanup
local FFlagPasskeyUpsellEnabled = SharedFlags.FFlagPasskeyUpsellEnabled
local FFlagTutorialUpsellEnabled = SharedFlags.FFlagTutorialUpsellEnabled
local FFlagEnableSocialProofUserList = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList
local FFlagProfilePlatformAddTC = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal
local FFlagTCVerifiedParentalControl = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCVerifiedParentalControl
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagAddVideoToCommunityProfile = SharedFlags.FFlagAddVideoToCommunityProfile
local FFlagLuaAppSortDeeplinkFix = SharedFlags.FFlagLuaAppSortDeeplinkFix
local v29 = game:DefineFastFlag("WebViewHideLuaSideBar", false)
local FFlagFixMoreSubMenuTitleFlash = SharedFlags.FFlagFixMoreSubMenuTitleFlash
local FFlagEnableSocialProofVerticalUserListSheet = SharedFlags.FFlagEnableSocialProofVerticalUserListSheet
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local v33 = game:DefineFastFlag("TCEducationModalSideBarPolicy", false)
local FFlagEnableBlackbird = SharedFlags.FFlagEnableBlackbird
local FFlagLuaAppEnableStratusStreamingTestOnly = SharedFlags.FFlagLuaAppEnableStratusStreamingTestOnly
local FFlagEnableMobileGameJoinCard = SharedFlags.FFlagEnableMobileGameJoinCard
local FFlagRemoveUnusedSignupPages = SharedFlags.FFlagRemoveUnusedSignupPages
local t1 = {
	[AppPage.None] = {
		nameLocalizationKey = "CommonUI.Features.Label.Nil",
		disableAppTopBanner = true
	},
	[AppPage.Startup] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		nameLocalizationKey = "CommonUI.Features.Label.Startup",
		disableAppTopBanner = true
	},
	[AppPage.Landing] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		nameLocalizationKey = "CommonUI.Features.Label.Startup",
		appShellReporterFeature = Enum.AppShellFeature.Landing
	},
	[AppPage.EngagementScreenContainer] = {
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.Login] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil
	},
	[AppPage.LoginV2] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil,
		disableBackButton = true
	},
	[AppPage.WechatQQAuth] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil,
		disableBackButton = true
	},
	[AppPage.AccountRecovery] = {
		nameLocalizationKey = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil,
		disableBackButton = true
	},
	[AppPage.CrossDeviceLogin] = {
		nameLocalizationKey = "Authentication.CrossDevice.Heading.QuickLogin",
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.Birthday] = {
		nameLocalizationKey = "Authentication.SignUp.Label.WhensYourBirthday",
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.CharacterSelectionPage] = if not FFlagRemoveUnusedSignupPages then {
		nameLocalizationKey = "Authentication.SignUp.Heading.SelectStartingAvatar",
		tabBarHidden = SystemBarVisibility.Hidden
	} else nil,
	[AppPage.UsernameSelectionPage] = if not FFlagRemoveUnusedSignupPages then {
		nameLocalizationKey = "Authentication.SignUp.Heading.UsernamePage",
		tabBarHidden = SystemBarVisibility.Hidden
	} else nil,
	[AppPage.PasswordSelectionPage] = if not FFlagRemoveUnusedSignupPages then {
		nameLocalizationKey = "Authentication.SignUp.Heading.PasswordPage",
		tabBarHidden = SystemBarVisibility.Hidden
	} else nil,
	[AppPage.SinglePageSignUp] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil
	},
	[AppPage.MultiPageSignup] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		tabBarHidden = SystemBarVisibility.Hidden,
		disableBackButton = true,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil
	},
	[AppPage.LuobuSignUpPage] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.WeChatLoginWrapper] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.Home] = {
		nameLocalizationKey = "CommonUI.Features.Label.Home",
		appShellReporterFeature = Enum.AppShellFeature.HomePage,
		tabBarHidden = SystemBarVisibility.Visible,
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.Games] = {
		nameLocalizationKey = FlagSettings.GetGamesTabName(),
		appShellReporterFeature = Enum.AppShellFeature.GamePage,
		tabBarHidden = SystemBarVisibility.Visible,
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.GameDetail] = {
		nameLocalizationKey = "CommonUI.Features.Heading.GameDetails",
		tabBarHidden = getExperienceDetailsPageNavBarVisible,
		renderUnderlyingPage = true,
		blurUnderlyingPage = true,
		appShellReporterFeature = Enum.AppShellFeature.GamePage,
		isPeekView = true
	},
	[AppPage.AvatarExperienceRoot] = {
		nameLocalizationKey = "CommonUI.Features.Label.Avatar",
		tabBarHidden = SystemBarVisibility.Visible,
		overridesAppRouterTabBarControl = true,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor,
		disableBackButton = true,
		disableAppTopBanner = not not GetFFlagLuaAppEnableTopBanner() or nil
	},
	[AppPage.Chat] = {
		nameLocalizationKey = "CommonUI.Features.Label.Chat",
		overridesAppRouterTabBarControl = true,
		appShellReporterFeature = Enum.AppShellFeature.Chat,
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.ContentFeed] = {
		disableBackButton = false,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.ShareGameToChat] = if not FFlagShareTargetGameCleanup then {
		tabBarHidden = SystemBarVisibility.PolicyDependent
	} else nil,
	[AppPage.AvatarExperienceWrapper] = {
		overridesAppRouterTabBarControl = true,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor,
		disableBackButton = true
	},
	[AppPage.AvatarExperienceWrapperTransparent] = {
		overridesAppRouterTabBarControl = true,
		renderUnderlyingPage = true,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor,
		disableBackButton = true
	},
	[AppPage.SearchPage] = {
		tabBarHidden = SystemBarVisibility.Visible,
		overridesAppRouterTabBarControl = false,
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.More] = {
		nameLocalizationKey = "CommonUI.Features.Label.More",
		tabBarHidden = SystemBarVisibility.Visible,
		appShellReporterFeature = Enum.AppShellFeature.More,
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.AccountInfo] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.About] = {
		nameLocalizationKey = "CommonUI.Features.Label.About",
		tabBarHidden = SystemBarVisibility.Visible,
		alwaysShowBackButton = not not FFlagFixMoreSubMenuTitleFlash or nil
	},
	[AppPage.SafetySupport] = {
		nameLocalizationKey = "CommonUI.Features.Label.HelpAndSafety",
		tabBarHidden = SystemBarVisibility.Visible,
		alwaysShowBackButton = not not FFlagFixMoreSubMenuTitleFlash or nil
	},
	[AppPage.Settings] = {
		nameLocalizationKey = "CommonUI.Features.Label.Settings",
		tabBarHidden = SystemBarVisibility.Visible,
		alwaysShowBackButton = not not FFlagFixMoreSubMenuTitleFlash or nil
	},
	[AppPage.Accessibility] = {
		nameLocalizationKey = "Feature.Accessibility.Heading.DevicePreferences",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.Licensing] = {
		nameLocalizationKey = "CommonUI.Features.Label.Licensing",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.AppInformation] = {
		nameLocalizationKey = "CommonUI.Features.Label.AppInformation",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.DevSubs] = {
		nameLocalizationKey = "CommonUI.Features.Label.DevSubs",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.AddFriendsPage] = {
		nameLocalizationKey = "Feature.Friends.Feature.Friends.Heading.AddFriends",
		nativeWrapper = false,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		bottomTabBarHidden = true,
		sideTabBarHidden = false
	},
	[AppPage.ConnectionsHub] = {
		nativeWrapper = false,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		bottomTabBarHidden = true,
		sideTabBarHidden = false
	},
	[AppPage.BuildersClub] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.InviteLinkExpiredModal] = {
		absorbInput = true,
		renderUnderlyingPage = true
	},
	[AppPage.ShareLinkInvalidModal] = {
		absorbInput = true,
		renderUnderlyingPage = true
	},
	[AppPage.VerifiedBadgeModal] = {
		renderUnderlyingPage = true
	},
	[AppPage.ShareVirtualEventModal] = {
		renderUnderlyingPage = true
	},
	[AppPage.EventNotificationsModal] = {
		renderUnderlyingPage = true
	},
	[AppPage.EventDetails] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		blurUnderlyingPage = true
	},
	[AppPage.TencentHelp] = {
		nameLocalizationKey = "CommonUI.Features.Label.Help",
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.TencentNoticeCenter] = {
		nameLocalizationKey = "CommonUI.Features.Label.TencentNotice",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.TencentNoticeContent] = {
		nameLocalizationKey = "CommonUI.Features.Label.TencentNotice",
		tabBarHidden = SystemBarVisibility.Visible
	},
	[AppPage.GenericWebPage] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden
	},
	[AppPage.SettingsSubPage] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.SecurityAlertInfo] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.YouTubePlayer] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.PurchaseRobux] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 and (not FFlagEnableLeftNavOnConsole or not GuiService:IsTenFootInterface()) then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = (not FFlagEnableLeftNavOnConsole or not GuiService:IsTenFootInterface()) and not IsVRAppBuild()
	},
	[AppPage.Payment] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.RobuxUpsell] = {
		webView = false,
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.SubscriptionPurchase] = {
		webView = false,
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.Notifications] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.LogoutConfirmation] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.AddFriends] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ViewUserProfile] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ViewProfile] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.AccountSelectorPeekView] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true
	},
	[AppPage.AccountSwitchingAddAccountPeekView] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true
	},
	[AppPage.LoginNative] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.CaptchaNative] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ViewFriends] = {
		webView = false,
		nativeWrapper = false,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = false
	},
	[AppPage.ShareSheet] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.SdkShare] = {
		nativeWrapper = false,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.ReportAbuse] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ScanQrCode] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.GenericOpaqueWebPage] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = false
	},
	[AppPage.ChallengeHybridOverlayPage] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true
	},
	[AppPage.ChallengeHybridWebView] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ProfilePlatform] = {
		nameLocalizationKey = "CommonUI.Features.Label.Profile",
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		isPeekView = true,
		disableBackButton = true
	},
	[AppPage.Groups] = {
		nameLocalizationKey = "CommonUI.Features.Label.Groups",
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		disableBackButton = false
	},
	[AppPage.SocialUnableToJoinExperience] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.SocialPurchaseExperience] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.SocialToast] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = false,
		overlayTransparency = 1,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.EditSocialNetworks] = if not SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then nil else {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.EditSocialNetworksError] = if not SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then nil else {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.PhoneVerification] = {
		webView = not v12 or nil,
		tabBarHidden = if not v29 or v12 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.EditUsername] = {
		webView = not v12 or nil,
		tabBarHidden = if not v29 or v12 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	},
	[AppPage.ExperienceGuidelinesExplained] = {
		nameLocalizationKey = "Feature.GameDetails.Label.ContentMaturity",
		disableBackButton = false,
		renderUnderlyingPage = true
	},
	[AppPage.AgeVerificationRequired] = {
		disableBackButton = false,
		renderUnderlyingPage = true
	},
	[AppPage.AccountSettingsUpsell] = {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent
	},
	[AppPage.IDVUpsellContainer] = {
		renderUnderlyingPage = true
	},
	[AppPage.VPCUpsellContainer] = {
		renderUnderlyingPage = true
	},
	[AppPage.RobloxSubscriptionUpsell] = {
		renderUnderlyingPage = true
	},
	[AppPage.AmpWizardContainer] = {
		renderUnderlyingPage = true
	},
	[AppPage.GamesList] = {
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.DeeplinkGamesList] = if not FFlagLuaAppSortDeeplinkFix then nil else {
		enableScrollAway = not not FFlagAppIaScrollAway or nil
	},
	[AppPage.ContactImporter] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		bottomTabBarHidden = true,
		sideTabBarHidden = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true
	},
	[AppPage.ContactsList] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		bottomTabBarHidden = true,
		sideTabBarHidden = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true
	},
	[AppPage.UAppBlock] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		nameLocalizationKey = "CommonUI.Features.Label.Startup"
	},
	[AppPage.PassesPage] = {
		nameLocalizationKey = "Feature.GameDetails.Label.Store",
		appShellReporterFeature = Enum.AppShellFeature.GamePage
	},
	[AppPage.SocialMessageToast] = {
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPage.ProfileQRCodePage] = {
		absorbInput = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibility.PolicyDependent
	},
	[AppPage.ParentVerification] = {
		webView = true,
		tabBarHidden = if not v29 then nil else SystemBarVisibility.Hidden
	},
	[AppPage.EmailVerification] = {
		webView = true,
		tabBarHidden = if not v29 then nil else SystemBarVisibility.Hidden
	},
	[AppPage.AddAuthMethodPage] = {
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.PasskeyUpsellScreen] = if not FFlagPasskeyUpsellEnabled then nil else {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.TutorialUpsellScreen] = if not FFlagTutorialUpsellEnabled then nil else {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.SponsoredTooltipPeekView] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true
	},
	[AppPage.InfoPeekView] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true
	},
	[AppPage.ReportDialog] = {
		disableBackButton = false,
		renderUnderlyingPage = true
	},
	[AppPage.SetNicknameModal] = if not FFlagFriendRequestNicknames then nil else {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true,
		bottomTabBarHidden = true,
		tabBarHidden = SystemBarVisibility.Hidden
	},
	[AppPage.VoiceTrialUpsell] = if not GetFFlagEnableVoiceTrialUpsellCard() then nil else {
		renderUnderlyingPage = true,
		absorbInput = true
	},
	[AppPage.GameFilterMenuPeekView] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true
	},
	[AppPage.VideoFullscreen] = if not FFlagAddVideoToCommunityProfile then nil else {
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true,
		disableBackButton = false
	}
}

if GetFFlagLuaAppChallengeDialogContainerPageEnabled() then
	t1[AppPage.ChallengeDialogModalContainer] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	}
end

if GetFFlagEnableAbuseReport10ft() then
	t1[AppPage.ReportScreen] = {
		nameLocalizationKey = "Feature.GameDetails.Label.ReportAbuse",
		tabBarHidden = SystemBarVisibility.Visible,
		renderUnderlyingPage = false
	}
end

if GetFFlagEnableNativeWrapperAppPage() then
	t1[AppPage.ChallengeNativeWrapper] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	}
end

if GetFFlagFixNavBarStartupDuplicateAnim() then
	t1[AppPage.PlatformAccountRouter] = {
		tabBarHidden = SystemBarVisibility.Hidden
	}
end

t1[AppPage.DiscoverabilityOverlay] = {
	tabBarHidden = SystemBarVisibility.Hidden,
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
t1[AppPage.FindFriendsModal] = {
	tabBarHidden = SystemBarVisibility.Hidden,
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
t1[AppPage.ContactsRevokedAccessDialog] = {
	tabBarHidden = SystemBarVisibility.Hidden,
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
t1[AppPage.SettingsPermissionInteractiveAlert] = {
	tabBarHidden = SystemBarVisibility.Hidden,
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
t1[AppPage.TrustedContactsEducationModal] = {
	tabBarHidden = if not v33 then SystemBarVisibility.Hidden else nil,
	bottomTabBarHidden = not v33 or nil,
	sideTabBarHidden = not v33 or nil,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}

if FFlagProfilePlatformAddTC then
	t1[AppPage.TrustedContactsModal] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true
	}
end

if FFlagTCVerifiedParentalControl then
	t1[AppPage.TrustedFriendsVPCPrologue] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true
	}
end

t1[AppPage.FAEUpsell] = {
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
t1[AppPage.FriendsRenameInfoModal] = {
	tabBarHidden = SystemBarVisibility.PolicyDependent,
	isPeekView = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	absorbInput = true
}

if FFlagTCShareLinkErrorModal then
	t1[AppPage.TrustedFriendsShareLinkErrorModal] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true,
		absorbInput = true
	}
end

if FFlagEnableSocialProofUserList then
	t1[AppPage.FriendsOwnedUserList] = {
		renderUnderlyingPage = true,
		isPeekView = true,
		overlayEnabled = true
	}
end

if FFlagEnableSocialProofVerticalUserListSheet then
	t1[AppPage.SocialProofVerticalUserListSheet] = {
		renderUnderlyingPage = true,
		isPeekView = true,
		overlayEnabled = true
	}
end

t1[AppPage.MutualConnectionList] = {
	renderUnderlyingPage = true,
	isPeekView = true,
	overlayEnabled = true
}
t1[AppPage.BlockingModal] = {
	renderUnderlyingPage = true,
	overlayEnabled = true
}
t1[AppPage.AboutDetailsSheet] = {
	isPeekView = true,
	renderUnderlyingPage = true,
	overlayEnabled = true
}
t1[AppPage.NotApprovedPage] = {
	tabBarHidden = SystemBarVisibility.Hidden,
	disableBackButton = true,
	disableAppTopBanner = true
}

if FFlagEnableLeftNavOnConsole then
	t1[AppPage.AdjustScreen] = {
		tabBarHidden = SystemBarVisibility.Hidden
	}
	t1[AppPage.ExperienceDetail] = {
		tabBarHidden = if not GuiService:IsTenFootInterface() then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden
	}
end

if FFlagEnableBlackbird then
	t1[AppPage.Blackbird] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if not v29 then SystemBarVisibility.PolicyDependent else SystemBarVisibility.Hidden,
		renderUnderlyingPage = true
	}
end

if FFlagLuaAppEnableStratusStreamingTestOnly then
	t1[AppPage.VideoServer] = {
		tabBarHidden = SystemBarVisibility.Hidden,
		nameLocalizationKey = "CommonUI.Features.Label.Nil",
		disableAppTopBanner = true,
		disableBackButton = true
	}
end

if FFlagEnableMobileGameJoinCard then
	t1[AppPage.GameJoinCard] = {
		tabBarHidden = SystemBarVisibility.PolicyDependent,
		isPeekView = true,
		renderUnderlyingPage = true,
		overlayEnabled = true
	}
end

return t1
