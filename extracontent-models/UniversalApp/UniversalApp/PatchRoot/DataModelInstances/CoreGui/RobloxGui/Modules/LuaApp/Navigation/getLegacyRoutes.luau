local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local Cryo = require(CorePackages.Packages.Cryo)

require(CorePackages.Workspace.Packages.Navigation)

local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local IsVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local createLazyComponent = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local TenFootUiCommon = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommon.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommon.TenFootUiRNTypes.GlobalNavDisplayOption
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local wrapAppPageForRoactNavigation = require(Modules.LuaApp.Navigation.wrapAppPageForRoactNavigation)
local wrapPageInScreenGui = require(Modules.LuaApp.Navigation.wrapPageInScreenGui)
local FlagSettings = require(Modules.LuaApp.FlagSettings)
local NotificationType = require(Modules.LuaApp.Enum.NotificationType)
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local WebViewWindow = require(Modules.LuaApp.Enum.WebViewWindow)
local AppPageProperties = require(Modules.LuaApp.AppPageProperties)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagShareTargetGameCleanup = SharedFlags.FFlagShareTargetGameCleanup
local FFlagEnableBlackbird = SharedFlags.FFlagEnableBlackbird
local FFlagReworkPurchaseRobuxPage = require(Modules.LuaApp.Flags.FFlagReworkPurchaseRobuxPage)
local GetFFlagWebViewServiceHasBackButtonVisibility = require(Modules.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility)
local FFlagRemoveUnusedSignupPages = SharedFlags.FFlagRemoveUnusedSignupPages
local FFlagLuaAppEnableStratusStreamingTestOnly = SharedFlags.FFlagLuaAppEnableStratusStreamingTestOnly
local v27 = createLazyComponent(function() -- line: 38
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VideoServerScreen).VideoServerScreenContainer
end)
local t1 = {
	SafetySupportPage = createLazyComponent(function() -- line: 43
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.SafetySupportPage)
	end),
	DeviceSettingsPage = createLazyComponent(function() -- line: 46
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPage)
	end),
	AppInformation = createLazyComponent(function() -- line: 49
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.AppInformationPage)
	end),
	DevSubsPage = createLazyComponent(function() -- line: 52
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.DevSubsPage)
	end),
	TencentNoticeCenterPage = createLazyComponent(function() -- line: 55
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage)
	end),
	TencentNoticeContentPage = createLazyComponent(function() -- line: 58
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage)
	end)
}
local t2 = {}

if not FFlagRemoveUnusedSignupPages then
	t2.CharacterSelectionPage = createLazyComponent(function() -- line: 64
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.CharacterSelectPage)
	end)
	t2.UsernameSelectionPage = createLazyComponent(function() -- line: 67
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.UsernameSelectionPage)
	end)
	t2.PasswordSelectionPage = createLazyComponent(function() -- line: 70
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.PasswordSelectionPage)
	end)
end

t2.LoginV2MonoWrapper = createLazyComponent(function() -- line: 74
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.LoginV2MonoWrapper)
end)
t2.AccountRecoveryMonoWrapper = createLazyComponent(function() -- line: 77
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AccountSecurity.AccountRecoveryMonoWrapper)
end)
t2.UAppBlockPage = createLazyComponent(function() -- line: 80
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.UAppBlockPage)
end)
t2.LandingPage = createLazyComponent(function() -- line: 83
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.LandingPage)
end)
t2.LuobuLandingPage = createLazyComponent(function() -- line: 86
	-- upvalues: Modules (copy)
	return require(Modules.Luobu.Components.Authentication.LuobuLandingPage)
end)
t2.BirthdayPage = createLazyComponent(function() -- line: 89
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.BirthdayPage)
end)
t2.LuobuSignUpPage = createLazyComponent(function() -- line: 92
	-- upvalues: Modules (copy)
	return require(Modules.Luobu.Components.Authentication.LuobuSignUpPage)
end)
t2.AddAuthMethodPage = createLazyComponent(function() -- line: 95
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.AddAuthMethodPage)
end)
t2.PasskeyUpsellScreen = createLazyComponent(function() -- line: 98
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.PasskeyUpsell).Components.PasskeyUpsellScreen
end)
t2.CaptchaPageBrowserServiceWrapper = createLazyComponent(function() -- line: 101
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.CaptchaPageBrowserServiceWrapper)
end)
t2.NotApprovedPage = createLazyComponent(function() -- line: 104
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.NotApprovedPage).NotApprovedPageV2
end)

local v30 = createLazyComponent(function() -- line: 108
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector)
end)
local v31 = createLazyComponent(function() -- line: 111
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.BlackbirdPageWrapper)
end)
local v32 = createLazyComponent(function() -- line: 114
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Passes.PassesPage)
end)
local v33 = createLazyComponent(function() -- line: 117
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal
end)
local v34 = createLazyComponent(function() -- line: 120
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal
end)
local v35 = createLazyComponent(function() -- line: 123
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint
end)
local v36 = createLazyComponent(function() -- line: 126
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SocialMessageToast.api).RootScreen
end)
local v37 = createLazyComponent(function() -- line: 129
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.EditProfile).EditUsernameWrapper
end)
local v38 = createLazyComponent(function() -- line: 132
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountSelector).AccountSelectorPeekView
end)
local v39 = createLazyComponent(function() -- line: 135
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView
end)
local v40 = createLazyComponent(function() -- line: 138
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VirtualEvents).ShareEventModal
end)
local v41 = createLazyComponent(function() -- line: 141
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VerifiedBadges).AboutVerifiedBadgeModal
end)
local v42 = createLazyComponent(function() -- line: 144
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.VirtualEvents.EventDetailsWrapper)
end)
local v43 = createLazyComponent(function() -- line: 147
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper)
end)
local v44 = createLazyComponent(function() -- line: 150
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.YouTubePageWrapper)
end)
local v45 = createLazyComponent(function() -- line: 153
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.GenericWebPageWrapper)
end)
local v46 = createLazyComponent(function() -- line: 156
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.GenericNativePageWrapper)
end)
local v47 = createLazyComponent(function() -- line: 159
	-- upvalues: Modules (copy)
	return require(Modules.ShareTargetGame.Components.ShareTargetGameEntrypoint)
end)
local v48 = createLazyComponent(function() -- line: 162
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.WeChatLoginWrapper)
end)
local v49 = createLazyComponent(function() -- line: 165
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeViewUserProfileWrapper)
end)
local v50 = createLazyComponent(function() -- line: 168
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeViewProfileWrapper)
end)
local v51 = createLazyComponent(function() -- line: 171
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativePageWithUrlWrapper)
end)
local v52 = createLazyComponent(function() -- line: 174
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeReportAbuseWrapper)
end)
local v53 = createLazyComponent(function() -- line: 177
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativePurchaseRobuxPageWrapper)
end)
local v54 = createLazyComponent(function() -- line: 180
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.More.AccountInfoPage)
end)
local v55 = createLazyComponent(function() -- line: 183
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ShareSheetWrapper)
end)
local v56 = createLazyComponent(function() -- line: 186
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SdkShareWrapper)
end)
local v57 = createLazyComponent(function() -- line: 189
	-- upvalues: Modules (copy)
	return require(Modules.Luobu.Components.More.TencentHelp.TencentHelpWrapper)
end)
local v58 = createLazyComponent(function() -- line: 192
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.TutorialUpsell).Components.TutorialUpsellScreen
end)
local v59 = createLazyComponent(function() -- line: 195
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper)
end)
local v60 = createLazyComponent(function() -- line: 198
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SettingsNativeWrapper)
end)
local v61 = createLazyComponent(function() -- line: 201
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.More.ParentVerificationPage)
end)
local v62 = createLazyComponent(function() -- line: 204
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.WebView.AppWebView)
end)
local v63 = createLazyComponent(function() -- line: 207
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Challenge.HybridOverlayPage)
end)
local v64 = createLazyComponent(function() -- line: 210
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Challenge.HybridWebView)
end)
local v65 = createLazyComponent(function() -- line: 213
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer
end)
local v66 = createLazyComponent(function() -- line: 216
	-- upvalues: Modules (copy)
	return require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper)
end)
local v67 = createLazyComponent(function() -- line: 219
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AmpUpsell).IDVUpsellContainer
end)
local v68 = createLazyComponent(function() -- line: 222
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AmpUpsell).VPCUpsellContainer
end)
local v69 = createLazyComponent(function() -- line: 225
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.RobloxSubscriptionUpsellScreen)
end)
local v70 = createLazyComponent(function() -- line: 228
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AgeVerification.AgeVerificationModal)
end)
local v71 = createLazyComponent(function() -- line: 231
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer)
end)
local v72 = createLazyComponent(function() -- line: 234
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Subscription.Purchase.SubscriptionPurchaseContainer)
end)
local v73 = createLazyComponent(function() -- line: 237
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.BuyRobux.BuyRobuxContainer)
end)
local v74 = createLazyComponent(function() -- line: 240
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AbuseReporting.ReportContainer)
end)
local v75 = createLazyComponent(function() -- line: 243
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Games.SponsoredTooltipPeekView)
end)
local v76 = createLazyComponent(function() -- line: 246
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AppBlox).InfoPeekView
end)
local v77 = createLazyComponent(function() -- line: 249
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper)
end)
local v78 = createLazyComponent(function() -- line: 252
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper)
end)
local v79 = createLazyComponent(function() -- line: 255
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.PhoneUpsell).VoiceTrialUpsell
end)
local t3 = {
	GetFFlagEnableUnifiedStaticWebViews = require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews),
	GetFFlagLuaAppUseSettingsNativeWrapper = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper),
	GetFFlagLuaAppLuaBuyRobuxPage = require(Modules.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage),
	GetFFlagEnableAccountSettingsUpsell = require(Modules.LuaApp.Flags.GetFFlagEnableAccountSettingsUpsell),
	GetFFlagEnableAmpUpsellWizard = require(Modules.LuaApp.Flags.GetFFlagEnableAmpUpsellWizard),
	GetFFlagEnableAmpIDVUpsellSupport = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport,
	GetFFlagEnableAmpSubscriptionUpsell = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpSubscriptionUpsell,
	GetFFlagLuaAppChallengeDialogContainerPageEnabled = require(CorePackages.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled,
	GetFFlagEnableTransparentNativeChallengeWrapper = require(Modules.LuaApp.Flags.GetFFlagEnableTransparentNativeChallengeWrapper)
}
local UseGameDetailsPeekView = require(Modules.LuaApp.Flags.UseGameDetailsPeekView)
local v82 = game:DefineFastFlag("ModerationVerificationEnabled2", false)
local FFlagEnableLuaLoginRevamp = SharedFlags.FFlagEnableLuaLoginRevamp
local GetFFlagEnableLuafiedRecoveryFlow = SharedFlags.GetFFlagEnableLuafiedRecoveryFlow
local GetFFlagEnableVoiceTrialUpsellCard = require(Modules.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local GetFFlagEnableSecurityAlertDeeplink = SharedFlags.GetFFlagEnableSecurityAlertDeeplink
local FFlagPasskeyUpsellEnabled = SharedFlags.FFlagPasskeyUpsellEnabled
local FFlagTutorialUpsellEnabled = SharedFlags.FFlagTutorialUpsellEnabled
local FFlagLuaAppSduiEventDetailsEnabled = SharedFlags.FFlagLuaAppSduiEventDetailsEnabled

local function getLegacyNavigationOptions(s1: string) -- line: 282
	-- upvalues: AppPageProperties (copy), UseGameDetailsPeekView (copy), AppPage (copy), AvatarScreen (copy)
	local v92 = (AppPageProperties[s1] or {}).renderUnderlyingPage or false
	local v93 = v92

	if UseGameDetailsPeekView() and s1 == AppPage.GameDetail or (s1 == AvatarScreen.ItemDetails or s1 == AppPage.SocialMessageToast or s1 == AppPage.AccountSelectorPeekView or s1 == AppPage.AccountSwitchingAddAccountPeekView or s1 == AppPage.AvatarExperienceWrapperTransparent or s1 == AppPage.SponsoredTooltipPeekView or s1 == AppPage.InfoPeekView) then
		v93 = false
	end

	return {
		transparent = v92,
		overlayEnabled = v93
	}
end

return function(_) -- line: 306
	-- upvalues: AppPage (copy), FFlagLuaAppEnableStratusStreamingTestOnly (copy), Roact (copy), v27 (copy), wrapPageInScreenGui (copy), t2 (copy), FFlagEnableLuaLoginRevamp (copy), GetFFlagEnableLuafiedRecoveryFlow (copy), FFlagRemoveUnusedSignupPages (copy), FlagSettings (copy), v48 (copy), v30 (copy), FFlagShareTargetGameCleanup (copy), v47 (copy), t1 (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), v42 (copy), Cryo (copy), v38 (copy), v39 (copy), v40 (copy), v43 (copy), v57 (copy), v45 (copy), t3 (copy), v60 (copy), v51 (copy), NotificationType (copy), v44 (copy), v46 (copy), v66 (copy), v62 (copy), UrlBuilder (copy), GetFFlagWebViewServiceHasBackButtonVisibility (copy), FFlagEnableBlackbird (copy), v31 (copy), v53 (copy), WebViewWindow (copy), v49 (copy), v50 (copy), v71 (copy), v72 (copy), v55 (copy), v56 (copy), v52 (copy), v59 (copy), v37 (copy), v63 (copy), v65 (copy), v74 (copy), v70 (copy), v64 (copy), v33 (copy), v34 (copy), v35 (copy), v54 (copy), v82 (copy), v61 (copy), v41 (copy), v36 (copy), v32 (copy), v77 (copy), v78 (copy), v67 (copy), v68 (copy), v69 (copy), FFlagPasskeyUpsellEnabled (copy), FFlagTutorialUpsellEnabled (copy), v58 (copy), v75 (copy), v76 (copy), GetFFlagEnableVoiceTrialUpsellCard (copy), v79 (copy), GetFFlagEnableSecurityAlertDeeplink (copy), wrapAppPageForRoactNavigation (copy), getLegacyNavigationOptions (copy), Modules (copy), createLazyComponent (copy), IsVRAppBuild (copy), GuiService (copy), v73 (copy), FFlagReworkPurchaseRobuxPage (copy), ScreenKind (copy), GlobalNavDisplayOption (copy), CorePackages (copy)
	local t4 = {}

	for v96, v97 in {
		[AppPage.None] = function() -- line: 308
			return nil
		end,
		[AppPage.VideoServer] = if not FFlagLuaAppEnableStratusStreamingTestOnly then nil else function() -- line: 312
			-- upvalues: Roact (copy), v27 (copy)
			return Roact.createElement(v27)
		end,
		[AppPage.UAppBlock] = function(p2) -- line: 316
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.UAppBlockPage, AppPage.UAppBlock, p2)
		end,
		[AppPage.LoginV2] = function(p3) -- line: 319
			-- upvalues: FFlagEnableLuaLoginRevamp (copy), wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			if FFlagEnableLuaLoginRevamp then
				return wrapPageInScreenGui(t2.LoginV2MonoWrapper, AppPage.Login, p3)
			end

			return nil
		end,
		[AppPage.AccountRecovery] = function(p4) -- line: 325
			-- upvalues: GetFFlagEnableLuafiedRecoveryFlow (copy), wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			if GetFFlagEnableLuafiedRecoveryFlow() then
				return wrapPageInScreenGui(t2.AccountRecoveryMonoWrapper, AppPage.AccountRecovery, p4)
			end

			return nil
		end,
		[AppPage.CharacterSelectionPage] = not FFlagRemoveUnusedSignupPages and function(p5) -- line: 337
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.CharacterSelectionPage, AppPage.CharacterSelectionPage, p5)
		end or nil,
		[AppPage.UsernameSelectionPage] = not FFlagRemoveUnusedSignupPages and function(p6) -- line: 346
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.UsernameSelectionPage, AppPage.UsernameSelectionPage, p6)
		end or nil,
		[AppPage.PasswordSelectionPage] = not FFlagRemoveUnusedSignupPages and function(p7) -- line: 355
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.PasswordSelectionPage, AppPage.PasswordSelectionPage, p7)
		end or nil,
		[AppPage.LuobuSignUpPage] = function(p8) -- line: 362
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.LuobuSignUpPage, AppPage.LuobuSignUpPage, p8)
		end,
		[AppPage.WeChatLoginWrapper] = function(p9) -- line: 365
			-- upvalues: FlagSettings (copy), wrapPageInScreenGui (copy), v48 (copy), AppPage (copy)
			if FlagSettings.WeChatLoginEnabled() then
				return wrapPageInScreenGui(v48, AppPage.WeChatLoginWrapper, p9)
			end

			return nil
		end,
		[AppPage.GameDetail] = function(p10) -- line: 371
			-- upvalues: wrapPageInScreenGui (copy), v30 (copy), AppPage (copy)
			return wrapPageInScreenGui(v30, AppPage.GameDetail, p10)
		end,
		[AppPage.ShareGameToChat] = not FFlagShareTargetGameCleanup and function(p11, p12) -- line: 376
			-- upvalues: wrapPageInScreenGui (copy), v47 (copy), AppPage (copy)
			return wrapPageInScreenGui(v47, AppPage.ShareGameToChat, p11, {
				placeId = p12
			})
		end or nil,
		[AppPage.Birthday] = function(p13) -- line: 381
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.BirthdayPage, AppPage.Birthday, p13)
		end,
		[AppPage.SafetySupport] = function(p14) -- line: 384
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			return wrapPageInScreenGui(t1.SafetySupportPage, AppPage.SafetySupport, p14)
		end,
		[AppPage.Accessibility] = function(p15) -- line: 387
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			return wrapPageInScreenGui(t1.DeviceSettingsPage, AppPage.Accessibility, p15)
		end,
		[AppPage.AppInformation] = function(p16) -- line: 390
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			return wrapPageInScreenGui(t1.AppInformation, AppPage.AppInformation, p16)
		end,
		[AppPage.DevSubs] = function(p17, p18) -- line: 393
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			local v115 = p18 and {
				selectedGame = p18
			}

			return wrapPageInScreenGui(t1.DevSubsPage, AppPage.DevSubs, p17, v115)
		end,
		[AppPage.EventDetails] = if FFlagLuaAppSduiEventDetailsEnabled then nil else function(p19, p20, p21) -- line: 398
			-- upvalues: wrapPageInScreenGui (copy), v42 (copy), AppPage (copy), Cryo (copy)
			return wrapPageInScreenGui(v42, AppPage.EventDetails, p19, Cryo.Dictionary.join(p21 or {}, {
				virtualEventId = p20
			}))
		end,
		[AppPage.AccountSelectorPeekView] = function(p22, _, p24) -- line: 407
			-- upvalues: wrapPageInScreenGui (copy), v38 (copy), AppPage (copy)
			return wrapPageInScreenGui(v38, AppPage.AccountSelectorPeekView, p22, p24)
		end,
		[AppPage.AccountSwitchingAddAccountPeekView] = function(p25, _, p27) -- line: 415
			-- upvalues: wrapPageInScreenGui (copy), v39 (copy), AppPage (copy)
			return wrapPageInScreenGui(v39, AppPage.AccountSwitchingAddAccountPeekView, p25, p27)
		end,
		[AppPage.ShareVirtualEventModal] = function(p28, _, p30) -- line: 423
			-- upvalues: wrapPageInScreenGui (copy), v40 (copy), AppPage (copy)
			return wrapPageInScreenGui(v40, AppPage.ShareVirtualEventModal, p28, p30)
		end,
		[AppPage.EventNotificationsModal] = function(p31, _, p33) -- line: 426
			-- upvalues: wrapPageInScreenGui (copy), v43 (copy), AppPage (copy)
			return wrapPageInScreenGui(v43, AppPage.EventNotificationsModal, p31, p33)
		end,
		[AppPage.TencentHelp] = function(p34, p35, p36) -- line: 434
			-- upvalues: Roact (copy), v57 (copy)
			return Roact.createElement(v57, {
				navigationProps = p34,
				detail = p35,
				extraProps = p36
			})
		end,
		[AppPage.TencentNoticeCenter] = function(p37) -- line: 441
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			return wrapPageInScreenGui(t1.TencentNoticeCenterPage, AppPage.TencentNoticeCenter, p37)
		end,
		[AppPage.TencentNoticeContent] = function(p38, _, p40) -- line: 444
			-- upvalues: wrapPageInScreenGui (copy), t1 (copy), AppPage (copy)
			return wrapPageInScreenGui(t1.TencentNoticeContentPage, AppPage.TencentNoticeContent, p38, p40)
		end,
		[AppPage.GenericWebPage] = function(p41, p42, p43) -- line: 452
			-- upvalues: Roact (copy), v45 (copy)
			return Roact.createElement(v45, {
				isVisible = p41.isVisible,
				DisplayOrder = p41.displayOrder,
				url = p42,
				title = p43.title,
				titleKey = p43.titleKey,
				searchParams = p43.searchParams,
				transitionAnimation = p43 and p43.transitionAnimation or nil,
				onClose = p43 and p43.onClose or nil
			})
		end,
		[AppPage.GenericOpaqueWebPage] = function(p44, p45, p46) -- line: 464
			-- upvalues: Roact (copy), v45 (copy)
			return Roact.createElement(v45, {
				isVisible = p44.isVisible,
				DisplayOrder = p44.displayOrder,
				url = p45,
				title = p46.title,
				titleKey = p46.titleKey,
				searchParams = p46.searchParams,
				transitionAnimation = p46 and p46.transitionAnimation or nil,
				onClose = p46 and p46.onClose or nil
			})
		end,
		[AppPage.SettingsSubPage] = function(p47, p48, p49) -- line: 476
			-- upvalues: t3 (copy), Roact (copy), v60 (copy), v51 (copy), NotificationType (copy)
			if t3.GetFFlagLuaAppUseSettingsNativeWrapper() then
				return Roact.createElement(v60, {
					url = p48,
					titleKey = p49.titleKey,
					windowCloseCallback = p49 and p49.onClose or nil,
					isVisible = p47.isVisible,
					displayOrder = p47.displayOrder
				})
			end

			return Roact.createElement(v51, {
				isVisible = p47.isVisible,
				DisplayOrder = p47.displayOrder,
				notificationType = p49.notificationType or NotificationType.OPEN_SETTINGS_WEBVIEW,
				url = p48,
				title = p49.title,
				titleKey = p49.titleKey,
				searchParams = if not t3.GetFFlagEnableUnifiedStaticWebViews() then nil else p49.searchParams,
				transitionAnimation = p49 and p49.transitionAnimation or nil,
				onClose = p49 and p49.onClose or nil
			})
		end,
		[AppPage.YouTubePlayer] = function(p50, p51, p52) -- line: 499
			-- upvalues: Roact (copy), v44 (copy)
			return Roact.createElement(v44, {
				isVisible = p50.isVisible,
				DisplayOrder = p50.displayOrder,
				url = p51,
				title = p52.title,
				transitionAnimation = p52 and p52.transitionAnimation or nil
			})
		end,
		[AppPage.ScanQrCode] = function(p53, _, p55) -- line: 508
			-- upvalues: Roact (copy), v46 (copy), NotificationType (copy)
			return Roact.createElement(v46, {
				isVisible = p53.isVisible,
				DisplayOrder = p53.displayOrder,
				transitionAnimation = p55 and p55.transitionAnimation or nil,
				notificationType = NotificationType.SCAN_QR_CODE
			})
		end,
		[AppPage.AvatarExperienceWrapper] = function(p56, _, p58) -- line: 516
			-- upvalues: wrapPageInScreenGui (copy), v66 (copy), AppPage (copy)
			return wrapPageInScreenGui(v66, AppPage.AvatarExperienceWrapper, p56, p58)
		end,
		[AppPage.AvatarExperienceWrapperTransparent] = function(p59, _, p61) -- line: 524
			-- upvalues: wrapPageInScreenGui (copy), v66 (copy), AppPage (copy)
			return wrapPageInScreenGui(v66, AppPage.AvatarExperienceWrapperTransparent, p59, p61)
		end,
		[AppPage.BuildersClub] = function(p62, _, p64) -- line: 532
			-- upvalues: t3 (copy), Roact (copy), v62 (copy), UrlBuilder (copy), GetFFlagWebViewServiceHasBackButtonVisibility (copy), v46 (copy), NotificationType (copy)
			if t3.GetFFlagEnableUnifiedStaticWebViews() then
				return Roact.createElement(v62, {
					url = UrlBuilder.fromString("www:premium/membership")(),
					titleKey = "CommonUI.Features.Label.Premium",
					transitionAnimation = p64.transitionAnimation,
					hasBackButton = not GetFFlagWebViewServiceHasBackButtonVisibility() and nil,
					overlayProps = {
						isVisible = p62.isVisible,
						DisplayOrder = p62.displayOrder
					}
				})
			end

			return Roact.createElement(v46, {
				isVisible = p62.isVisible,
				DisplayOrder = p62.displayOrder,
				notificationType = NotificationType.OPEN_BUILDERS_CLUB,
				titleTextLocalizationKey = "CommonUI.Features.Label.Premium",
				transitionAnimation = p64 and p64.transitionAnimation or nil
			})
		end,
		[AppPage.Blackbird] = if not FFlagEnableBlackbird then nil else function(p65, _, p67) -- line: 556
			-- upvalues: Roact (copy), v31 (copy)
			return Roact.createElement(v31, {
				isVisible = p65.isVisible,
				DisplayOrder = p65.displayOrder,
				transitionAnimation = p67.transitionAnimation
			})
		end,
		[AppPage.Payment] = function(p68, p69, p70) -- line: 564
			-- upvalues: Roact (copy), v53 (copy), t3 (copy), UrlBuilder (copy)
			return Roact.createElement(v53, {
				url = if not t3.GetFFlagEnableUnifiedStaticWebViews() or (not p70 or p70.analyticId == nil) then if not t3.GetFFlagEnableUnifiedStaticWebViews() then nil else UrlBuilder.fromString("www:upgrades/paymentmethods?ap={productId}")({
					productId = p69
				}) else UrlBuilder.fromString("www:upgrades/paymentmethods?ap={productId}&analyticId={analyticId}")({
					productId = p69,
					analyticId = p70.analyticId
				}),
				isVisible = p68.isVisible,
				DisplayOrder = p68.displayOrder,
				transitionAnimation = p70 and p70.transitionAnimation or nil
			})
		end,
		[AppPage.Notifications] = function(p71, _, p73) -- line: 583
			-- upvalues: t3 (copy), Roact (copy), v62 (copy), UrlBuilder (copy), WebViewWindow (copy), v46 (copy), NotificationType (copy)
			if t3.GetFFlagEnableUnifiedStaticWebViews() then
				return Roact.createElement(v62, {
					url = UrlBuilder.fromString("www:notificationstream/embedded")(),
					titleKey = "Feature.AccountSettings.Heading.Tab.Notifications",
					windowType = WebViewWindow.Dialog,
					transitionAnimation = p73.transitionAnimation,
					searchParams = p73.searchParams,
					windowCloseCallback = p73.onClose,
					overlayProps = {
						isVisible = p71.isVisible,
						DisplayOrder = p71.displayOrder
					}
				})
			end

			return Roact.createElement(v46, {
				isVisible = p71.isVisible,
				DisplayOrder = p71.displayOrder,
				notificationType = NotificationType.VIEW_NOTIFICATIONS,
				transitionAnimation = p73 and p73.transitionAnimation or nil,
				titleTextLocalizationKey = "Feature.AccountSettings.Heading.Tab.Notifications",
				onClose = p73 and p73.onClose or nil
			})
		end,
		[AppPage.LogoutConfirmation] = function(p74, _, p76) -- line: 609
			-- upvalues: Roact (copy), v46 (copy), NotificationType (copy)
			return Roact.createElement(v46, {
				isVisible = p74.isVisible,
				DisplayOrder = p74.displayOrder,
				notificationType = NotificationType.ACTION_LOG_OUT,
				transitionAnimation = p76 and p76.transitionAnimation or nil
			})
		end,
		[AppPage.AddFriends] = function(p77, _, p79) -- line: 617
			-- upvalues: t3 (copy), Roact (copy), v62 (copy), UrlBuilder (copy), v46 (copy), NotificationType (copy)
			if t3.GetFFlagEnableUnifiedStaticWebViews() then
				return Roact.createElement(v62, {
					url = UrlBuilder.fromString("www:users/friends#!/friend-requests?onlyShowContents=true")(),
					titleKey = "CommonUI.Features.Label.Friends",
					transitionAnimation = p79.transitionAnimation,
					searchParams = {
						searchType = "Players"
					},
					windowCloseCallback = p79.onClose,
					overlayProps = {
						isVisible = p77.isVisible,
						DisplayOrder = p77.displayOrder
					}
				})
			end

			return Roact.createElement(v46, {
				isVisible = p77.isVisible,
				DisplayOrder = p77.displayOrder,
				notificationType = NotificationType.UNIVERSAL_FRIENDS,
				transitionAnimation = p79 and p79.transitionAnimation or nil,
				titleTextLocalizationKey = "CommonUI.Features.Label.Friends",
				onClose = p79 and p79.onClose or nil
			})
		end,
		[AppPage.ViewUserProfile] = function(p80, p81, p82) -- line: 644
			-- upvalues: Roact (copy), v49 (copy)
			return Roact.createElement(v49, {
				isVisible = p80.isVisible,
				DisplayOrder = p80.displayOrder,
				userId = p81,
				onClose = p82 and p82.onClose or nil
			})
		end,
		[AppPage.ViewProfile] = function(p83, p84) -- line: 652
			-- upvalues: Roact (copy), v50 (copy)
			return Roact.createElement(v50, {
				isVisible = p83.isVisible,
				DisplayOrder = p83.displayOrder,
				url = p84
			})
		end,
		[AppPage.LoginNative] = function(p85, _, p87) -- line: 659
			-- upvalues: Roact (copy), v46 (copy), NotificationType (copy)
			return Roact.createElement(v46, {
				isVisible = p85.isVisible,
				DisplayOrder = p85.displayOrder,
				notificationType = NotificationType.ACTION_LOG_IN,
				transitionAnimation = p87 and p87.transitionAnimation or nil
			})
		end,
		[AppPage.CaptchaNative] = function(p88, _, p90) -- line: 667
			-- upvalues: Roact (copy), t2 (copy)
			local v188 = p90.captchaType == "signup"

			if p90.captchaType == "login" or v188 then
				local t5 = {
					isVisible = p88.isVisible,
					DisplayOrder = p88.displayOrder,
					captchaType = p90.captchaType,
					cvalueType = p90.cvalueType,
					cvalue = p90.cvalue,
					dxBlob = p90.dxBlob,
					captchaId = p90.captchaId,
					captchaCallback = p90.captchaCallback,
					backNavigationDisabledWhileLoading = p90.backNavigationDisabledWhileLoading,
					transitionAnimation = p90 and p90.transitionAnimation or nil,
					webViewVisible = false
				}

				return Roact.createElement(t2.CaptchaPageBrowserServiceWrapper, t5)
			end

			return Roact.createElement(t2.CaptchaPageBrowserServiceWrapper, {
				isVisible = p88.isVisible,
				DisplayOrder = p88.displayOrder,
				captchaType = p90.captchaType,
				cvalueType = p90.cvalueType,
				cvalue = p90.cvalue,
				captchaCallback = p90.captchaCallback,
				backNavigationDisabledWhileLoading = p90.backNavigationDisabledWhileLoading,
				transitionAnimation = p90 and p90.transitionAnimation or nil,
				webViewVisible = false
			})
		end,
		[AppPage.RobuxUpsell] = function(p91, _, p93) -- line: 699
			-- upvalues: wrapPageInScreenGui (copy), v71 (copy), AppPage (copy)
			return wrapPageInScreenGui(v71, AppPage.RobuxUpsell, p91, p93)
		end,
		[AppPage.SubscriptionPurchase] = function(p94, _, p96) -- line: 702
			-- upvalues: wrapPageInScreenGui (copy), v72 (copy), AppPage (copy)
			return wrapPageInScreenGui(v72, AppPage.SubscriptionPurchase, p94, p96)
		end,
		[AppPage.ShareSheet] = function(p97, _, p99) -- line: 710
			-- upvalues: Roact (copy), v55 (copy)
			return Roact.createElement(v55, {
				isVisible = p97.isVisible,
				DisplayOrder = p97.displayOrder,
				data = p99
			})
		end,
		[AppPage.SdkShare] = function(p100, _, p102) -- line: 717
			-- upvalues: Roact (copy), v56 (copy)
			return Roact.createElement(v56, {
				isVisible = p100.isVisible,
				DisplayOrder = p100.displayOrder,
				data = p102
			})
		end,
		[AppPage.ReportAbuse] = function(p103, p104, p105) -- line: 724
			-- upvalues: Roact (copy), v52 (copy)
			return Roact.createElement(v52, {
				isVisible = p103.isVisible,
				DisplayOrder = p103.displayOrder,
				url = p104,
				onClose = p105 and p105.onClose or nil
			})
		end,
		[AppPage.PhoneVerification] = function(_, _, p108) -- line: 732
			-- upvalues: Roact (copy), v59 (copy)
			return Roact.createElement(v59, p108)
		end,
		[AppPage.EditUsername] = function(_, _, p111) -- line: 735
			-- upvalues: Roact (copy), v37 (copy)
			return Roact.createElement(v37, p111)
		end,
		[AppPage.ChallengeHybridOverlayPage] = function(p112, _, p114) -- line: 738
			-- upvalues: wrapPageInScreenGui (copy), v63 (copy), AppPage (copy)
			return wrapPageInScreenGui(v63, AppPage.ChallengeHybridOverlayPage, p112, p114)
		end,
		[AppPage.ChallengeDialogModalContainer] = if not t3.GetFFlagLuaAppChallengeDialogContainerPageEnabled() then nil else function(p115, _, p117) -- line: 747
			-- upvalues: wrapPageInScreenGui (copy), v65 (copy), AppPage (copy)
			return wrapPageInScreenGui(v65, AppPage.ChallengeDialogModalContainer, p115, p117)
		end,
		[AppPage.ReportDialog] = function(p118) -- line: 756
			-- upvalues: wrapPageInScreenGui (copy), v74 (copy), AppPage (copy)
			return wrapPageInScreenGui(v74, AppPage.ReportDialog, p118)
		end,
		[AppPage.AgeVerificationRequired] = function(p119, p120) -- line: 759
			-- upvalues: wrapPageInScreenGui (copy), v70 (copy), AppPage (copy)
			local v220 = p120 and {
				universeId = p120
			} or nil

			return wrapPageInScreenGui(v70, AppPage.AgeVerificationRequired, p119, v220)
		end,
		[AppPage.ChallengeHybridWebView] = function(p121, _, p123) -- line: 771
			-- upvalues: Roact (copy), v64 (copy), Cryo (copy)
			return Roact.createElement(v64, Cryo.Dictionary.join(p123, {
				appContainerNavigation = p121
			}))
		end,
		[AppPage.InviteLinkExpiredModal] = function(p124, _, p126) -- line: 779
			-- upvalues: wrapPageInScreenGui (copy), v33 (copy), AppPage (copy)
			return wrapPageInScreenGui(v33, AppPage.InviteLinkExpiredModal, p124, p126)
		end,
		[AppPage.ShareLinkInvalidModal] = function(p127, _, p129) -- line: 787
			-- upvalues: wrapPageInScreenGui (copy), v34 (copy), AppPage (copy)
			return wrapPageInScreenGui(v34, AppPage.ShareLinkInvalidModal, p127, p129)
		end,
		[AppPage.ProfileQRCodePage] = function(p130, _, p132) -- line: 795
			-- upvalues: wrapPageInScreenGui (copy), v35 (copy), AppPage (copy)
			return wrapPageInScreenGui(v35, AppPage.ProfileQRCodePage, p130, p132)
		end,
		[AppPage.AccountInfo] = function(p133, p134, p135) -- line: 798
			-- upvalues: Roact (copy), v54 (copy), Cryo (copy)
			return Roact.createElement(v54, Cryo.Dictionary.join(p135, {
				isVisible = p133.isVisible,
				displayOrder = p133.displayOrder,
				url = p134
			}))
		end,
		[AppPage.ParentVerification] = function(_, p137) -- line: 809
			-- upvalues: v82 (copy), Roact (copy), v61 (copy), UrlBuilder (copy)
			if v82 then
				return Roact.createElement(v61, {
					url = p137
				})
			end

			return Roact.createElement(v61, {
				url = UrlBuilder.fromString("www:parents/account-setup")()
			})
		end,
		[AppPage.EmailVerification] = function(_, p139) -- line: 820
			-- upvalues: v82 (copy), Roact (copy), v61 (copy), UrlBuilder (copy)
			if v82 then
				return Roact.createElement(v61, {
					url = p139
				})
			end

			return Roact.createElement(v61, {
				url = UrlBuilder.fromString("www:")()
			})
		end,
		[AppPage.VerifiedBadgeModal] = function(p140, _, p142) -- line: 831
			-- upvalues: wrapPageInScreenGui (copy), v41 (copy), AppPage (copy)
			return wrapPageInScreenGui(v41, AppPage.VerifiedBadgeModal, p140, p142)
		end,
		[AppPage.SocialMessageToast] = function(p143, _, p145) -- line: 834
			-- upvalues: wrapPageInScreenGui (copy), v36 (copy), AppPage (copy)
			return wrapPageInScreenGui(v36, AppPage.SocialMessageToast, p143, p145)
		end,
		[AppPage.PassesPage] = function(p146, p147, p148) -- line: 837
			-- upvalues: Cryo (copy), wrapPageInScreenGui (copy), v32 (copy), AppPage (copy)
			local t6 = {
				universeId = p147
			}

			if p148 then
				t6 = Cryo.Dictionary.join(p148, t6)
			end

			return wrapPageInScreenGui(v32, AppPage.PassesPage, p146, t6)
		end,
		[AppPage.AccountSettingsUpsell] = if not t3.GetFFlagEnableAccountSettingsUpsell() then nil else function(p149, _, p151) -- line: 847
			-- upvalues: wrapPageInScreenGui (copy), v77 (copy), AppPage (copy)
			return wrapPageInScreenGui(v77, AppPage.AccountSettingsUpsell, p149, p151)
		end,
		[AppPage.AmpWizardContainer] = if not t3.GetFFlagEnableAmpUpsellWizard() then nil else function(p152, _, p154) -- line: 857
			-- upvalues: wrapPageInScreenGui (copy), v78 (copy), AppPage (copy)
			return wrapPageInScreenGui(v78, AppPage.AmpWizardContainer, p152, p154)
		end,
		[AppPage.IDVUpsellContainer] = if not t3.GetFFlagEnableAmpIDVUpsellSupport() then nil else function(p155, _, p157) -- line: 867
			-- upvalues: wrapPageInScreenGui (copy), v67 (copy), AppPage (copy)
			return wrapPageInScreenGui(v67, AppPage.IDVUpsellContainer, p155, p157)
		end,
		[AppPage.VPCUpsellContainer] = function(p158, _, p160) -- line: 871
			-- upvalues: wrapPageInScreenGui (copy), v68 (copy), AppPage (copy)
			return wrapPageInScreenGui(v68, AppPage.VPCUpsellContainer, p158, p160)
		end,
		[AppPage.RobloxSubscriptionUpsell] = if not t3.GetFFlagEnableAmpSubscriptionUpsell() then nil else function(p161, _, p163) -- line: 875
			-- upvalues: wrapPageInScreenGui (copy), v69 (copy), AppPage (copy)
			return wrapPageInScreenGui(v69, AppPage.RobloxSubscriptionUpsell, p161, p163)
		end,
		[AppPage.AddAuthMethodPage] = function(p164) -- line: 884
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.AddAuthMethodPage, AppPage.AddAuthMethodPage, p164)
		end,
		[AppPage.PasskeyUpsellScreen] = if not FFlagPasskeyUpsellEnabled then nil else function(p165, _, p167) -- line: 888
			-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
			return wrapPageInScreenGui(t2.PasskeyUpsellScreen, AppPage.PasskeyUpsellScreen, p165, p167)
		end,
		[AppPage.TutorialUpsellScreen] = if not FFlagTutorialUpsellEnabled then nil else function(p168, _, p170) -- line: 898
			-- upvalues: wrapPageInScreenGui (copy), v58 (copy), AppPage (copy)
			return wrapPageInScreenGui(v58, AppPage.TutorialUpsellScreen, p168, p170)
		end,
		[AppPage.SponsoredTooltipPeekView] = function(p171, _, p173) -- line: 907
			-- upvalues: wrapPageInScreenGui (copy), v75 (copy), AppPage (copy)
			return wrapPageInScreenGui(v75, AppPage.SponsoredTooltipPeekView, p171, p173)
		end,
		[AppPage.InfoPeekView] = function(p174, _, p176) -- line: 915
			-- upvalues: wrapPageInScreenGui (copy), v76 (copy), AppPage (copy)
			return wrapPageInScreenGui(v76, AppPage.InfoPeekView, p174, p176)
		end,
		[AppPage.VoiceTrialUpsell] = if not GetFFlagEnableVoiceTrialUpsellCard() then nil else function(p177, _, p179) -- line: 919
			-- upvalues: wrapPageInScreenGui (copy), v79 (copy), AppPage (copy)
			return wrapPageInScreenGui(v79, AppPage.VoiceTrialUpsell, p177, p179)
		end,
		[AppPage.SecurityAlertInfo] = if not GetFFlagEnableSecurityAlertDeeplink() then nil else function(p180, p181, p182) -- line: 924
			-- upvalues: Roact (copy), v51 (copy), NotificationType (copy), t3 (copy)
			return Roact.createElement(v51, {
				isVisible = p180.isVisible,
				DisplayOrder = p180.displayOrder,
				titleKey = "Feature.SecurityFeedback.Header.NewLogin",
				notificationType = NotificationType.OPEN_CUSTOM_WEBVIEW,
				url = p181,
				searchParams = if not t3.GetFFlagEnableUnifiedStaticWebViews() then nil else p182.searchParams,
				transitionAnimation = p182 and p182.transitionAnimation or nil,
				onClose = p182 and p182.onClose or nil
			})
		end
	} do
		table.insert(t4, {
			[v96] = {
				screen = wrapAppPageForRoactNavigation(v97, v96),
				navigationOptions = getLegacyNavigationOptions(v96)
			}
		})
	end

	table.insert(t4, {
		[AppPage.AvatarExperienceRoot] = {
			getScreen = function() --[[ getScreen ]] -- line: 953
				-- upvalues: Modules (copy)
				return require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer)
			end,
			navigationOptions = {
				hasSubNavigation = true
			}
		}
	})
	table.insert(t4, {
		[AppPage.Chat] = createLazyComponent(function() -- line: 963
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container)
		end)
	})
	table.insert(t4, {
		[AppPage.PurchaseRobux] = {
			screen = wrapAppPageForRoactNavigation(function(p183, p184, p185) -- line: 970
				-- upvalues: t3 (copy), IsVRAppBuild (copy), GuiService (copy), wrapPageInScreenGui (copy), v73 (copy), AppPage (copy), FFlagReworkPurchaseRobuxPage (copy), UrlBuilder (copy), Roact (copy), v53 (copy)
				if t3.GetFFlagLuaAppLuaBuyRobuxPage() and IsVRAppBuild() or GuiService:IsTenFootInterface() then
					return wrapPageInScreenGui(v73, AppPage.PurchaseRobux, p183, p185)
				end

				local v287 = nil

				if FFlagReworkPurchaseRobuxPage then
					v287 = UrlBuilder.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId|}&product_id={productId|}")(p185)
				end

				return Roact.createElement(v53, {
					url = if not FFlagReworkPurchaseRobuxPage then if not t3.GetFFlagEnableUnifiedStaticWebViews() then if not p184 then nil else UrlBuilder.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId}")({
						analyticId = p184
					}) else UrlBuilder.fromString("www:Upgrades/Robux.aspx")() else v287,
					isVisible = p183.isVisible,
					DisplayOrder = p183.displayOrder,
					transitionAnimation = p185 and p185.transitionAnimation or nil
				})
			end, AppPage.PurchaseRobux),
			navigationOptions = Cryo.Dictionary.join({
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}, (getLegacyNavigationOptions(AppPage.PurchaseRobux)))
		}
	})
	table.insert(t4, {
		[AppPage.ReportScreen] = {
			screen = createLazyComponent(function() -- line: 1008
				-- upvalues: CorePackages (copy)
				return require(CorePackages.Workspace.Packages.AbuseReporting).ReportScreen
			end),
			navigationOptions = {
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}
		}
	})
	table.insert(t4, {
		[AppPage.ChallengeNativeWrapper] = {
			screen = createLazyComponent(function() -- line: 1020
				-- upvalues: Modules (copy)
				return require(Modules.LuaApp.Components.Challenge.NativeWrapper)
			end),
			navigationOptions = {
				transparent = not not t3.GetFFlagEnableTransparentNativeChallengeWrapper() or nil,
				globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
			}
		}
	})
	table.insert(t4, {
		[AppPage.FAEUpsell] = {
			screen = createLazyComponent(function() -- line: 1032
				-- upvalues: CorePackages (copy)
				return require(CorePackages.Workspace.Packages.AmpUpsell).FAEUpsellContainer
			end),
			navigationOptions = getLegacyNavigationOptions(AppPage.FAEUpsell)
		}
	})
	table.insert(t4, {
		[AppPage.NotApprovedPage] = {
			screen = wrapAppPageForRoactNavigation(function(p186, _, p188) -- line: 1042
				-- upvalues: wrapPageInScreenGui (copy), t2 (copy), AppPage (copy)
				return wrapPageInScreenGui(t2.NotApprovedPage, AppPage.NotApprovedPage, p186, p188)
			end, AppPage.NotApprovedPage),
			navigationOptions = {
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}
		}
	})

	return t4
end
