local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local ParentParent = script.Parent.Parent
local IsVRAppBuild = require(ParentParent.AppCommonLib).IsVRAppBuild
local Cryo = require(ParentParent.Cryo)
local Constants = require(ParentParent.UIBlox).App.Style.Constants
local v7 = Cryo.Dictionary.values(Constants.ThemeName)
local CrossPlayCapabilities = require(script.Parent.Enum.CrossPlayCapabilities)
local SharedFlags = require(ParentParent.SharedFlags)
local isSubjectToDesktopPolicies = SharedFlags.isSubjectToDesktopPolicies
local isRunningInStudio = require(ParentParent.AppCommonLib).isRunningInStudio
local GetFFlagUseVoiceExitBetaLanguage = SharedFlags.GetFFlagUseVoiceExitBetaLanguage
local GetFFlagDisableCDLQrCodeForMaquettes = SharedFlags.GetFFlagDisableCDLQrCodeForMaquettes
local GetFFlagUseEnablePremiumUserFeaturesAppPolicy = SharedFlags.GetFFlagUseEnablePremiumUserFeaturesAppPolicy
local GetFFlagLuafiedReportEntryPoints = SharedFlags.GetFFlagLuafiedReportEntryPoints
local GetFFlagEnableAbuseReport10ft = SharedFlags.GetFFlagEnableAbuseReport10ft
local GetFFlagUseExternalBrowserForAgeGuidelines10ft = SharedFlags.GetFFlagUseExternalBrowserForAgeGuidelines10ft
local GetFFlagEnableGateNotificationPreferencesTab = SharedFlags.GetFFlagEnableGateNotificationPreferencesTab
local FFlagLuaAppHomeVngAppUpsell = SharedFlags.FFlagLuaAppHomeVngAppUpsell
local FFlagVngAppUpsellPcLayout = SharedFlags.FFlagVngAppUpsellPcLayout
local FFlagFriendRequestNicknames = SharedFlags.FFlagFriendRequestNicknames
local FFlagLuaAppParentUpsellPolicy = SharedFlags.FFlagLuaAppParentUpsellPolicy
local FFlagRenameParentEmailForVerificationUpsell = SharedFlags.FFlagRenameParentEmailForVerificationUpsell
local GetFFlagSeamlessVoiceConsentToastPolicy = SharedFlags.GetFFlagSeamlessVoiceConsentToastPolicy
local GetFFlagEnableMultiPageSignup = SharedFlags.GetFFlagEnableMultiPageSignup
local GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup = SharedFlags.GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup
local FFlagEnableMicrosoftStorePaymentsPlatform = SharedFlags.FFlagEnableMicrosoftStorePaymentsPlatform
local FFlagEnableMilkyWayPaymentsPlatformV2 = SharedFlags.FFlagEnableMilkyWayPaymentsPlatformV2
local FFlagAppIaScrollAwayGuac = SharedFlags.FFlagAppIaScrollAwayGuac
local FFlagEnableScreentimeMoreTimeOption = SharedFlags.FFlagEnableScreentimeMoreTimeOption
local FFlagEnableFriendsRenamingForAll = SharedFlags.FFlagEnableFriendsRenamingForAll
local GetFFlagExpChatGuacChatDisabledReason = SharedFlags.GetFFlagExpChatGuacChatDisabledReason
local FFlagGuacCanRenderTransferOnProfile = SharedFlags.FFlagGuacCanRenderTransferOnProfile
local FFlagAuthSecExclusions = SharedFlags.FFlagAuthSecExclusions
local FFlagEnableMorePageExitButtonSupport = SharedFlags.FFlagEnableMorePageExitButtonSupport
local FFlagEnableMorePageDirectionalLayoutRolloutFix = SharedFlags.FFlagEnableMorePageDirectionalLayoutRolloutFix
local FFlagEnableUnifiedProductPurchaseFlow = SharedFlags.FFlagEnableUnifiedProductPurchaseFlow
local FFlagAEGIS2UseGuacToShowEnabledMessage = SharedFlags.FFlagAEGIS2UseGuacToShowEnabledMessage
local FFlagAEGIS2UseGuacToShowFAEUpsell = SharedFlags.FFlagAEGIS2UseGuacToShowFAEUpsell
local v40 = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false)
local v41 = game:DefineFastFlag("DisableWebViewSupportInStudio", false)
local v42 = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false)
local v43 = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "")
local v44 = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "")
local v45 = game:DefineFastFlag("DebugCrossPlaySystemUi", false)
local v46 = game:DefineFastString("DebugOverrideCrossPlayUri", "")
local v47 = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false)
local v48 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false)
local v49 = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false)
local v50 = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false)
local v51 = game:DefineFastFlag("DebugForceShowIllegalContentReportingUI", false)
local FFlagEnableLeftNavOnConsole = SharedFlags.FFlagEnableLeftNavOnConsole
local FFlagExpChatUseGuacForFOMOUpsell = SharedFlags.FFlagExpChatUseGuacForFOMOUpsell
local FFlagExpChatUseGuacForCrossAgeChat = SharedFlags.FFlagExpChatUseGuacForCrossAgeChat
local FFlagTCShareLinkSenderUI = SharedFlags.FFlagTCShareLinkSenderUI
local FFlagEnableAndroidTvAppPolicies = SharedFlags.FFlagEnableAndroidTvAppPolicies
local FFlagSduiAppPolicyBindings = SharedFlags.FFlagSduiAppPolicyBindings
local FFlagGuacStickyShortcutBarEnabled = SharedFlags.FFlagGuacStickyShortcutBarEnabled
local FFlagEnableCoreContentAccountType = SharedFlags.FFlagEnableCoreContentAccountType
local FFlagEnableCoreContentBadge = SharedFlags.FFlagEnableCoreContentBadge
local FFlagEnableCoreContentThemeUseGuacForTokenOverrides = SharedFlags.FFlagEnableCoreContentThemeUseGuacForTokenOverrides
local FFlagEnableFlyoutUncheckedBadge = SharedFlags.FFlagEnableFlyoutUncheckedBadge
local FFlagAddTopBarPoliciesToUniversalPolicies = SharedFlags.FFlagAddTopBarPoliciesToUniversalPolicies

game:DefineFastFlag("BehaviorCollectionControlEnabled", false)
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false)

local GetFFlagNotificationsComplianceShouldRestrictStream = SharedFlags.GetFFlagNotificationsComplianceShouldRestrictStream

return function(p1) --[[ AppFeaturePolicies ]] -- line: 82
	-- upvalues: IsVRAppBuild (copy), v40 (copy), isSubjectToDesktopPolicies (copy), FFlagAppIaScrollAwayGuac (copy), FFlagEnableLeftNavOnConsole (copy), GuiService (copy), isRunningInStudio (copy), v41 (copy), GetFFlagLuafiedReportEntryPoints (copy), GetFFlagEnableAbuseReport10ft (copy), GetFFlagUseVoiceExitBetaLanguage (copy), GetFFlagSeamlessVoiceConsentToastPolicy (copy), GetFFlagExpChatGuacChatDisabledReason (copy), FFlagAEGIS2UseGuacToShowEnabledMessage (copy), FFlagAEGIS2UseGuacToShowFAEUpsell (copy), FFlagExpChatUseGuacForFOMOUpsell (copy), FFlagExpChatUseGuacForCrossAgeChat (copy), GetFFlagDisableCDLQrCodeForMaquettes (copy), Cryo (copy), v7 (copy), v42 (copy), v45 (copy), v46 (copy), CrossPlayCapabilities (copy), v43 (copy), v44 (copy), GetFFlagUseEnablePremiumUserFeaturesAppPolicy (copy), GetFFlagUseExternalBrowserForAgeGuidelines10ft (copy), FFlagGuacCanRenderTransferOnProfile (copy), GetFFlagEnableGateNotificationPreferencesTab (copy), UserInputService (copy), FFlagLuaAppHomeVngAppUpsell (copy), FFlagVngAppUpsellPcLayout (copy), FFlagFriendRequestNicknames (copy), FFlagLuaAppParentUpsellPolicy (copy), GetFFlagNotificationsComplianceShouldRestrictStream (copy), v51 (copy), FFlagRenameParentEmailForVerificationUpsell (copy), FFlagEnableAndroidTvAppPolicies (copy), GetFFlagEnableMultiPageSignup (copy), GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (copy), FFlagEnableMicrosoftStorePaymentsPlatform (copy), FFlagEnableFriendsRenamingForAll (copy), FFlagTCShareLinkSenderUI (copy), FFlagEnableMilkyWayPaymentsPlatformV2 (copy), FFlagEnableScreentimeMoreTimeOption (copy), v48 (copy), v49 (copy), v50 (copy), v47 (copy), FFlagAuthSecExclusions (copy), FFlagEnableMorePageExitButtonSupport (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagSduiAppPolicyBindings (copy), FFlagGuacStickyShortcutBarEnabled (copy), FFlagEnableCoreContentAccountType (copy), FFlagEnableCoreContentBadge (copy), FFlagEnableCoreContentThemeUseGuacForTokenOverrides (copy), FFlagEnableFlyoutUncheckedBadge (copy), FFlagAddTopBarPoliciesToUniversalPolicies (copy)
	return {
		getFriendFinder = function() --[[ getFriendFinder ]] -- line: 94
			-- upvalues: p1 (copy)
			return p1.FriendFinder or false
		end,
		getGameDetailsMorePage = function() --[[ getGameDetailsMorePage ]] -- line: 97
			-- upvalues: p1 (copy)
			return p1.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function() --[[ getGameDetailsSubtitle ]] -- line: 100
			-- upvalues: p1 (copy)
			return p1.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function() --[[ getShowGlobalCounters ]] -- line: 103
			-- upvalues: p1 (copy)
			return p1.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function() --[[ getGameDetailsPlayWithFriends ]] -- line: 106
			-- upvalues: p1 (copy)
			return p1.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function() --[[ getGameInfoList ]] -- line: 109
			-- upvalues: p1 (copy)
			return p1.GameInfoList or false
		end,
		getGamePlaysAndRatings = function() --[[ getGamePlaysAndRatings ]] -- line: 112
			-- upvalues: p1 (copy)
			return p1.GamePlaysAndRatings or false
		end,
		getNotifications = function() --[[ getNotifications ]] -- line: 115
			-- upvalues: p1 (copy)
			return p1.Notifications or false
		end,
		getRecommendedGames = function() --[[ getRecommendedGames ]] -- line: 118
			-- upvalues: v40 (copy), p1 (copy), isSubjectToDesktopPolicies (copy)
			if v40 then
				return p1.RecommendedGames or false
			end

			if isSubjectToDesktopPolicies() then
				return false
			end

			return p1.RecommendedGames or false
		end,
		getSearchBar = function() --[[ getSearchBar ]] -- line: 128
			-- upvalues: p1 (copy)
			return p1.SearchBar or false
		end,
		getMorePageContent = function() --[[ getMorePageContent ]] -- line: 131
			-- upvalues: p1 (copy)
			return p1.MorePageContent
		end,
		getAboutPageType = function() --[[ getAboutPageType ]] -- line: 134
			-- upvalues: p1 (copy)
			return p1.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function() --[[ getSettingsPageType ]] -- line: 137
			-- upvalues: p1 (copy)
			return p1.SettingsPageType or "Settings"
		end,
		getSocialLinks = function() --[[ getSocialLinks ]] -- line: 140
			-- upvalues: p1 (copy)
			return p1.SocialLinks or false
		end,
		getSocialGroupLinks = function() --[[ getSocialGroupLinks ]] -- line: 143
			-- upvalues: p1 (copy)
			return p1.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function() --[[ getCommunityLinksEnabled ]] -- line: 146
			-- upvalues: p1 (copy)
			return p1.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function() --[[ getGameInfoShowBadges ]] -- line: 149
			-- upvalues: p1 (copy)
			return p1.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function() --[[ getGameInfoShowCreated ]] -- line: 152
			-- upvalues: p1 (copy)
			return p1.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function() --[[ getGameInfoShowGamepasses ]] -- line: 155
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function() --[[ getGameInfoShowGenre ]] -- line: 158
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function() --[[ getGameInfoShowSubgenre ]] -- line: 161
			-- upvalues: p1 (copy)
			return p1.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function() --[[ getGameInfoShowMaxPlayers ]] -- line: 164
			-- upvalues: p1 (copy)
			return p1.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function() --[[ getGameInfoShowServers ]] -- line: 167
			-- upvalues: p1 (copy)
			return p1.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function() --[[ getGameInfoShowUpdated ]] -- line: 170
			-- upvalues: p1 (copy)
			return p1.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function() --[[ getGameInfoShowAgeRecommendation ]] -- line: 173
			-- upvalues: p1 (copy)
			if p1.GameInfoShowAgeRecommendation == nil then
				return true
			end

			return p1.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function() --[[ getGameInfoShowVoiceAndChatFeatures ]] -- line: 179
			-- upvalues: p1 (copy)
			if p1.GameInfoShowVoiceAndChatFeatures == nil then
				return true
			end

			return p1.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function() --[[ getSiteMessageBanner ]] -- line: 185
			-- upvalues: p1 (copy)
			return p1.SiteMessageBanner or false
		end,
		getAlertRateLimit = function() --[[ getAlertRateLimit ]] -- line: 188
			-- upvalues: p1 (copy)
			return p1.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function() --[[ getSearchAutoComplete ]] -- line: 192
			-- upvalues: p1 (copy)
			return p1.SearchAutoComplete or false
		end,
		getShowStudioCTA = function() --[[ getShowStudioCTA ]] -- line: 195
			-- upvalues: p1 (copy)
			return p1.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if not FFlagAppIaScrollAwayGuac then nil else function() -- line: 199
			-- upvalues: p1 (copy)
			return p1.AppIaScrollAwayEnabled or false
		end,
		getUseOmniRecommendation = function() --[[ getUseOmniRecommendation ]] -- line: 203
			-- upvalues: p1 (copy)
			if p1.UseOmniRecommendation == nil then
				return true
			end

			return p1.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function() --[[ getUseWidthBasedFormFactorRule ]] -- line: 211
			-- upvalues: p1 (copy)
			return p1.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function() --[[ getShowYouTubeAgeAlert ]] -- line: 214
			-- upvalues: p1 (copy)
			if p1.ShowYouTubeAgeAlert == nil then
				return true
			end

			return p1.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function() --[[ getShowVideoThumbnails ]] -- line: 220
			-- upvalues: p1 (copy)
			return p1.ShowVideoThumbnails or false
		end,
		getHomeIcon = function() --[[ getHomeIcon ]] -- line: 223
			-- upvalues: p1 (copy)
			return p1.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function() --[[ getGameInfoListShowRNVDeveloper ]] -- line: 226
			-- upvalues: p1 (copy)
			return p1.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function() --[[ getGameInfoListDeveloper ]] -- line: 229
			-- upvalues: p1 (copy)
			return p1.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function() --[[ getShowDisplayName ]] -- line: 232
			-- upvalues: p1 (copy)
			if p1.ShowDisplayName == nil then
				return true
			end

			return p1.ShowDisplayName
		end,
		getShowAlias = function() --[[ getShowAlias ]] -- line: 238
			-- upvalues: p1 (copy)
			if p1.ShowUserAlias == nil then
				return true
			end

			return p1.ShowUserAlias
		end,
		getCatalogReportingDisabled = function() --[[ getCatalogReportingDisabled ]] -- line: 244
			-- upvalues: p1 (copy)
			return p1.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function() --[[ getGameReportingDisabled ]] -- line: 247
			-- upvalues: p1 (copy)
			return p1.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function() --[[ getGamesPageCreationCenterTitle ]] -- line: 250
			-- upvalues: p1 (copy)
			return p1.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function() --[[ shouldUseExternalBrowserForDisclaimerLinks ]] -- line: 253
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function() --[[ shouldUseExternalBrowserForMorePageItem ]] -- line: 256
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function() --[[ getCatalogShow3dView ]] -- line: 259
			-- upvalues: p1 (copy)
			return p1.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function() --[[ getItemDetailsFullView ]] -- line: 262
			-- upvalues: p1 (copy)
			return p1.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function() --[[ getCatalogCommunityCreations ]] -- line: 265
			-- upvalues: p1 (copy)
			return p1.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function() --[[ getCatalogPremiumCategory ]] -- line: 268
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function() --[[ getShowCatalogPremiumContent ]] -- line: 271
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function() --[[ getRobloxCreatedItemsCreatedByLuobu ]] -- line: 274
			-- upvalues: p1 (copy)
			if p1.RobloxCreatedItemsCreatedByLuobu == nil then
				return true
			end

			return p1.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function() --[[ getHomePageFriendSection ]] -- line: 280
			-- upvalues: p1 (copy)
			return p1.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function() --[[ getHomePageProfileLink ]] -- line: 283
			-- upvalues: p1 (copy)
			return p1.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function() --[[ getPurchasePromptIncludingWarning ]] -- line: 286
			-- upvalues: p1 (copy)
			if p1.PurchasePromptIncludingWarning == nil then
				return true
			end

			return p1.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function() --[[ getCheckUserAgreementsUpdatedOnLogin ]] -- line: 292
			-- upvalues: p1 (copy)
			if p1.CheckUserAgreementsUpdatedOnLogin == nil then
				return true
			end

			return p1.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function() --[[ getAddUserAgreementIdsToSignupRequest ]] -- line: 298
			-- upvalues: p1 (copy)
			return p1.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function() --[[ RequireExplicitVoiceConsent ]] -- line: 301
			-- upvalues: p1 (copy)
			return p1.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function() --[[ getRequireExplicitAvatarVideoConsent ]] -- line: 304
			-- upvalues: p1 (copy)
			return p1.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function() --[[ getShowVoiceUpsellV2 ]] -- line: 307
			-- upvalues: p1 (copy)
			return p1.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function() --[[ getShouldShowGroupsTile ]] -- line: 310
			-- upvalues: p1 (copy)
			return p1.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function() --[[ useLuobuAuthentication ]] -- line: 313
			-- upvalues: p1 (copy)
			return p1.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function() --[[ useWechatQQAuthentication ]] -- line: 316
			-- upvalues: p1 (copy)
			return p1.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function() --[[ useMSDKWebAuthentication ]] -- line: 319
			-- upvalues: p1 (copy)
			return p1.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function() --[[ getQrFriendingEnabled ]] -- line: 322
			-- upvalues: p1 (copy)
			return p1.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ getShouldShowCameraPermissionInAgreementsPrompt ]] -- line: 325
			-- upvalues: p1 (copy)
			return p1.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function() --[[ getExperienceInviteShareLinkEnabled ]] -- line: 328
			-- upvalues: p1 (copy)
			return p1.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function() --[[ getCsatSurveyRestrictTextInput ]] -- line: 331
			-- upvalues: p1 (copy)
			return p1.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function() --[[ useGridPageLayout ]] -- line: 334
			-- upvalues: IsVRAppBuild (copy), p1 (copy), isSubjectToDesktopPolicies (copy)
			if IsVRAppBuild() then
				if p1.UseGridPageLayout ~= nil then
					return p1.UseGridPageLayout
				end

				if IsVRAppBuild() then
					return true
				end

				return false
			end

			if p1.UseGridPageLayout == nil then
				return isSubjectToDesktopPolicies()
			end

			return p1.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function() --[[ usePhoneSearchDiscoverEntry ]] -- line: 345
			-- upvalues: p1 (copy), isSubjectToDesktopPolicies (copy)
			if p1.UsePhoneSearchDiscoverEntry == nil then
				return not isSubjectToDesktopPolicies()
			end

			return p1.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function() --[[ getShouldSystemBarUsuallyBePresent ]] -- line: 352
			-- upvalues: IsVRAppBuild (copy), p1 (copy), FFlagEnableLeftNavOnConsole (copy), GuiService (copy)
			if IsVRAppBuild() then
				if p1.ShouldSystemBarUsuallyBePresentForVR ~= nil then
					return p1.ShouldSystemBarUsuallyBePresentForVR
				end

				if IsVRAppBuild() then
					return true
				end

				return false
			end

			if FFlagEnableLeftNavOnConsole and GuiService:IsTenFootInterface() then
				return true
			end

			return p1.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function() --[[ getContactImporterEnabled ]] -- line: 365
			-- upvalues: isSubjectToDesktopPolicies (copy), p1 (copy)
			if isSubjectToDesktopPolicies() then
				return false
			end

			return p1.ContactImporterEnabled or false
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ getShouldShowSettingsPermissionsAdditionalInstructions ]] -- line: 373
			-- upvalues: p1 (copy)
			return p1.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function() --[[ getUseVRFTUXPanel ]] -- line: 377
			-- upvalues: p1 (copy), IsVRAppBuild (copy)
			if p1.UseVRFTUXPanel ~= nil then
				return p1.UseVRFTUXPanel
			end

			if IsVRAppBuild() then
				return true
			end

			return false
		end,
		getWebViewSupport = function() --[[ getWebViewSupport ]] -- line: 380
			-- upvalues: isRunningInStudio (copy), v41 (copy), p1 (copy), IsVRAppBuild (copy)
			if isRunningInStudio() then
				if v41 then
					return false
				end

				return true
			end

			if p1.EnableWebViewSupport ~= nil then
				return p1.EnableWebViewSupport
			end

			if IsVRAppBuild() then
				return false
			end

			return true
		end,
		getUseLuafiedReportFlow = function() --[[ getUseLuafiedReportFlow ]] -- line: 391
			-- upvalues: IsVRAppBuild (copy), GetFFlagLuafiedReportEntryPoints (copy), p1 (copy), GetFFlagEnableAbuseReport10ft (copy)
			if IsVRAppBuild() and GetFFlagLuafiedReportEntryPoints() then
				if p1.UseLuafiedReportFlow ~= nil then
					return p1.UseLuafiedReportFlow
				end

				if IsVRAppBuild() then
					return true
				end

				return false
			end

			if GetFFlagEnableAbuseReport10ft() then
				return p1.UseLuafiedReportFlow or false
			end

			return nil
		end,
		getThrottleFramerate = function() --[[ getThrottleFramerate ]] -- line: 400
			-- upvalues: p1 (copy), IsVRAppBuild (copy)
			if p1.ThrottleFramerate ~= nil then
				return p1.ThrottleFramerate
			end

			if IsVRAppBuild() then
				return false
			end

			return true
		end,
		getUseRoundedCorners = function() --[[ getUseRoundedCorners ]] -- line: 403
			-- upvalues: IsVRAppBuild (copy), p1 (copy)
			if IsVRAppBuild() then
				if p1.UseRoundedCorners ~= nil then
					return p1.UseRoundedCorners
				end

				if IsVRAppBuild() then
					return true
				end

				return false
			end

			return false
		end,
		getGameInfoShowChatFeatures = function() --[[ getGameInfoShowChatFeatures ]] -- line: 410
			-- upvalues: GetFFlagUseVoiceExitBetaLanguage (copy), p1 (copy)
			if GetFFlagUseVoiceExitBetaLanguage() then
				return p1.GameInfoShowChatFeatures or false
			end

			return false
		end,
		getDisplayCheckboxInVoiceConsent = function() --[[ getDisplayCheckboxInVoiceConsent ]] -- line: 416
			-- upvalues: GetFFlagSeamlessVoiceConsentToastPolicy (copy), p1 (copy)
			if GetFFlagSeamlessVoiceConsentToastPolicy() then
				return p1.DisplayCheckboxInVoiceConsent or false
			end

			return false
		end,
		getExperienceChatAvailability = function() --[[ getExperienceChatAvailability ]] -- line: 422
			-- upvalues: GetFFlagExpChatGuacChatDisabledReason (copy), p1 (copy)
			if GetFFlagExpChatGuacChatDisabledReason() then
				return p1.ExperienceChatAvailability or "unknown"
			end

			return "unknown"
		end,
		getInCommsRegionBubble = function() --[[ getInCommsRegionBubble ]] -- line: 428
			-- upvalues: FFlagAEGIS2UseGuacToShowEnabledMessage (copy), p1 (copy)
			if FFlagAEGIS2UseGuacToShowEnabledMessage then
				return p1.InCommsRegionBubble or false
			end

			return false
		end,
		getShowInExpFAEUpsell = function() --[[ getShowInExpFAEUpsell ]] -- line: 434
			-- upvalues: FFlagAEGIS2UseGuacToShowFAEUpsell (copy), p1 (copy)
			if FFlagAEGIS2UseGuacToShowFAEUpsell then
				return p1.ShowInExpFAEUpsell or false
			end

			return false
		end,
		getShowFOMOUpsell = function() --[[ getShowFOMOUpsell ]] -- line: 440
			-- upvalues: FFlagExpChatUseGuacForFOMOUpsell (copy), p1 (copy)
			if FFlagExpChatUseGuacForFOMOUpsell then
				return p1.ShowFOMOUpsell or false
			end

			return false
		end,
		getShowCrossAgeChat = function() --[[ getShowCrossAgeChat ]] -- line: 447
			-- upvalues: FFlagExpChatUseGuacForCrossAgeChat (copy), p1 (copy)
			if FFlagExpChatUseGuacForCrossAgeChat then
				return p1.ShowCrossAgeExpChat or false
			end

			return false
		end,
		getAllowCameraMovements = function() --[[ getAllowCameraMovements ]] -- line: 454
			-- upvalues: p1 (copy), IsVRAppBuild (copy)
			if p1.AllowCameraMovements ~= nil then
				return p1.AllowCameraMovements
			end

			if IsVRAppBuild() then
				return false
			end

			return true
		end,
		getShouldSkipAvatarLandingPage = function() --[[ getShouldSkipAvatarLandingPage ]] -- line: 457
			-- upvalues: p1 (copy), IsVRAppBuild (copy)
			if p1.ShouldSkipAvatarLandingPage ~= nil then
				return p1.ShouldSkipAvatarLandingPage
			end

			if IsVRAppBuild() then
				return true
			end

			return false
		end,
		getShowPassesOnExperienceDetails = function() --[[ getShowPassesOnExperienceDetails ]] -- line: 460
			-- upvalues: p1 (copy)
			return p1.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function() --[[ getDisableCDLQrCodeForMaquettes ]] -- line: 463
			-- upvalues: GetFFlagDisableCDLQrCodeForMaquettes (copy), p1 (copy)
			if GetFFlagDisableCDLQrCodeForMaquettes() then
				return p1.DisableCDLQrCodeForMaquettes
			end

			return false
		end,
		getDisableIAPEntryPoint = function() --[[ getDisableIAPEntryPoint ]] -- line: 470
			-- upvalues: p1 (copy)
			return p1.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function() --[[ getEnforceAgeRestrictedLogin ]] -- line: 473
			-- upvalues: p1 (copy)
			return p1.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function() --[[ getUrlAuthRoutes ]] -- line: 476
			-- upvalues: p1 (copy)
			local v68 = p1.Routes or {}

			if v68 then
				return v68.auth or {}
			end

			return {}
		end,
		getShowDisconnectButton = function() --[[ getShowDisconnectButton ]] -- line: 485
			-- upvalues: p1 (copy)
			return p1.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function() --[[ getUseSingleSignOn ]] -- line: 488
			-- upvalues: isRunningInStudio (copy), p1 (copy)
			if isRunningInStudio() then
				return false
			end

			return p1.UseSingleSignOn or false
		end,
		getGridCarouselSeeAllTilesEnabled = function() --[[ getGridCarouselSeeAllTilesEnabled ]] -- line: 495
			-- upvalues: p1 (copy)
			return p1.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function() --[[ getSearchWithoutNavigatingEnabled ]] -- line: 498
			-- upvalues: FFlagEnableLeftNavOnConsole (copy), GuiService (copy), p1 (copy)
			if FFlagEnableLeftNavOnConsole and GuiService:IsTenFootInterface() then
				return false
			end

			return p1.SingleSearchPageNoNavigation or false
		end,
		getGameListCategoryScrollListEnabled = function() --[[ getGameListCategoryScrollListEnabled ]] -- line: 504
			-- upvalues: p1 (copy)
			return p1.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function() --[[ getForceTheme ]] -- line: 507
			-- upvalues: Cryo (copy), v7 (copy), p1 (copy)
			local v69 = Cryo.List.map(v7, function(p2) -- line: 508
				return p2:lower()
			end)

			if p1.ForceTheme and Cryo.List.find(v69, p1.ForceTheme:lower()) then
				return p1.ForceTheme
			end

			return nil
		end,
		enableExperienceDetailsPanel = function() --[[ enableExperienceDetailsPanel ]] -- line: 517
			-- upvalues: p1 (copy)
			return p1.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function() --[[ getDisableRegularLogin ]] -- line: 520
			-- upvalues: p1 (copy)
			return not p1.EnableWebViewSupport and (not p1.EnableRegularLoginWithoutWebViewSupport or false)
		end,
		getAllowPlatformAccountSwitching = function() --[[ getAllowPlatformAccountSwitching ]] -- line: 523
			-- upvalues: p1 (copy)
			return p1.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function() --[[ useLegacyCrossPlayApi ]] -- line: 526
			-- upvalues: v42 (copy), p1 (copy)
			return v42 or (p1.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function() --[[ useCrossPlaySystemUi ]] -- line: 529
			-- upvalues: v45 (copy), p1 (copy)
			return v45 or (p1.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function() --[[ getCrossPlayUri ]] -- line: 532
			-- upvalues: v46 (copy), p1 (copy)
			if v46 ~= "" then
				return v46
			end

			return p1.crossPlayUri or ""
		end,
		getCrossPlayCapabilities = function() --[[ getCrossPlayCapabilities ]] -- line: 539
			-- upvalues: Cryo (copy), p1 (copy), CrossPlayCapabilities (copy)
			return Cryo.List.foldLeft(p1.crossPlayCapabilities or {}, function(p3, p4) -- line: 540
				-- upvalues: Cryo (copy), CrossPlayCapabilities (copy)
				if Cryo.List.find(p3, p4) then
					return p3
				end

				return Cryo.List.join(p3, { CrossPlayCapabilities[p4] })
			end, {})
		end,
		getCrossPlaySettingsKey = function() --[[ getCrossPlaySettingsKey ]] -- line: 550
			-- upvalues: v43 (copy), p1 (copy)
			if v43 ~= "" then
				return v43
			end

			return p1.crossPlaySettingsKey or ""
		end,
		getCrossPlayQueryParam = function() --[[ getCrossPlayQueryParam ]] -- line: 557
			-- upvalues: v44 (copy), p1 (copy)
			if v44 ~= "" then
				return v44
			end

			return p1.crossPlayQueryParam or ""
		end,
		getPromotionalEmailsCheckboxEnabled = function() --[[ getPromotionalEmailsCheckboxEnabled ]] -- line: 564
			-- upvalues: p1 (copy)
			if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
				return p1.PromotionalEmailsCheckboxEnabled or false
			end

			return false
		end,
		getPromotionalEmailsOptInByDefault = function() --[[ getPromotionalEmailsOptInByDefault ]] -- line: 571
			-- upvalues: p1 (copy)
			if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then
				return p1.PromotionalEmailsOptInByDefault or false
			end

			return false
		end,
		getSupportsOverscan = function() --[[ getSupportsOverscan ]] -- line: 578
			-- upvalues: p1 (copy)
			return p1.SupportsOverscan or false
		end,
		getPlatformDisplayName = function() --[[ getPlatformDisplayName ]] -- line: 581
			-- upvalues: p1 (copy)
			return p1.platformDisplayName or ""
		end,
		getPlatformAccountName = function() --[[ getPlatformAccountName ]] -- line: 584
			-- upvalues: p1 (copy)
			return p1.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function() --[[ getSupportsProfileSwitching ]] -- line: 587
			-- upvalues: p1 (copy)
			return p1.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function() --[[ getMountAllOmniFeedItems ]] -- line: 590
			-- upvalues: p1 (copy)
			return p1.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function() --[[ getFriendCodeQrCodeScannerEnabled ]] -- line: 593
			-- upvalues: p1 (copy)
			return p1.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function() --[[ getInviteFriendsDisabled ]] -- line: 596
			-- upvalues: p1 (copy)
			return p1.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function() --[[ getRealNamesInDisplayNamesEnabled ]] -- line: 599
			-- upvalues: p1 (copy)
			return p1.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function() --[[ getProfileShareLinkEnabled ]] -- line: 602
			-- upvalues: p1 (copy)
			return p1.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function() --[[ getProfileCopyLinkEnabled ]] -- line: 605
			-- upvalues: p1 (copy)
			return p1.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function() --[[ getEnablePremiumUserFeatures ]] -- line: 608
			-- upvalues: GetFFlagUseEnablePremiumUserFeaturesAppPolicy (copy), p1 (copy)
			if GetFFlagUseEnablePremiumUserFeaturesAppPolicy() then
				return p1.EnablePremiumUserFeatures or false
			end

			return nil
		end,
		getEnableDualLogin = function() --[[ getEnableDualLogin ]] -- line: 614
			-- upvalues: p1 (copy)
			return p1.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function() --[[ getUseExternalBrowserForAgeGuidelines ]] -- line: 618
			-- upvalues: GetFFlagUseExternalBrowserForAgeGuidelines10ft (copy), p1 (copy)
			if GetFFlagUseExternalBrowserForAgeGuidelines10ft() then
				return p1.UseExternalBrowserForAgeGuidelines or false
			end

			return nil
		end,
		getEnableHomePageAgeBlock = function() --[[ getEnableHomePageAgeBlock ]] -- line: 625
			-- upvalues: p1 (copy)
			return p1.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function() --[[ getEnableUAppAccessBlock ]] -- line: 628
			-- upvalues: p1 (copy)
			return p1.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function() --[[ getUAppBlockPageTextMapKey ]] -- line: 631
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function() --[[ getUAppBlockPageShouldDisableLogOut ]] -- line: 634
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function() --[[ getContactsToastEnabled ]] -- line: 637
			-- upvalues: p1 (copy)
			return p1.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function() --[[ getEnableProfileQrCode ]] -- line: 640
			-- upvalues: p1 (copy)
			return p1.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function() --[[ getCanRenderTransferOnProfile ]] -- line: 643
			-- upvalues: FFlagGuacCanRenderTransferOnProfile (copy), p1 (copy)
			if FFlagGuacCanRenderTransferOnProfile then
				return p1.CanRenderTransferOnProfile or false
			end

			return false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ getShowVNGLoginWithExistingAccountQuickLoginButton ]] -- line: 649
			-- upvalues: p1 (copy)
			return p1.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getShowVNGAge12Badge = function() --[[ getShowVNGAge12Badge ]] -- line: 652
			-- upvalues: p1 (copy)
			return p1.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function() --[[ getShowBrazilContentRatingLogo ]] -- line: 655
			-- upvalues: p1 (copy)
			return p1.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function() --[[ getUseVNGUserAgreementPopup ]] -- line: 658
			-- upvalues: p1 (copy)
			return p1.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function() --[[ getRedirectBuyRobuxToVNG ]] -- line: 661
			-- upvalues: p1 (copy)
			return p1.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function() --[[ getShowVNGTosForRobuxUpsell ]] -- line: 664
			-- upvalues: p1 (copy)
			return p1.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function() --[[ getBlockVNGU12SignUpOnClientSide ]] -- line: 667
			-- upvalues: p1 (copy)
			return p1.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function() --[[ getUseAgeInput ]] -- line: 670
			-- upvalues: p1 (copy)
			return p1.UseAgeInput or false
		end,
		getLoginUsernameOnly = function() --[[ getLoginUsernameOnly ]] -- line: 673
			-- upvalues: p1 (copy)
			return p1.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function() --[[ getDisableEmailOTPLogin ]] -- line: 676
			-- upvalues: p1 (copy)
			return p1.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function() --[[ getDisableLoginForgotButton ]] -- line: 679
			-- upvalues: p1 (copy)
			return p1.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function() --[[ getDisableLogOutEmailUpsell ]] -- line: 682
			-- upvalues: p1 (copy)
			return p1.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function() --[[ getVerifiedSignupCountry ]] -- line: 685
			-- upvalues: p1 (copy)
			return p1.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function() --[[ getParentalConsentAgreementId ]] -- line: 689
			-- upvalues: p1 (copy)
			return p1.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function() --[[ getIsStrictComplianceEnabled ]] -- line: 693
			-- upvalues: p1 (copy)
			return p1.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function() --[[ getUseKoreaKISAUserAgreementPopup ]] -- line: 697
			-- upvalues: p1 (copy)
			return p1.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function() --[[ getEnableNotificationPreferencesPage ]] -- line: 701
			-- upvalues: GetFFlagEnableGateNotificationPreferencesTab (copy), p1 (copy)
			if GetFFlagEnableGateNotificationPreferencesTab() then
				return p1.EnableNotificationPreferencesPage or false
			end

			return nil
		end,
		getVNGFormRequired = function() --[[ getVNGFormRequired ]] -- line: 708
			-- upvalues: p1 (copy)
			return p1.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function() --[[ getUpsellVoiceForPhoneVerification ]] -- line: 711
			-- upvalues: p1 (copy)
			return p1.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function() --[[ getIsLinkedVRModeAvailable ]] -- line: 714
			-- upvalues: UserInputService (copy)
			local Platform = UserInputService:GetPlatform()

			return Platform == Enum.Platform.Windows or Platform == Enum.Platform.UWP
		end,
		getShouldShowPhoneUpsell = function() --[[ getShouldShowPhoneUpsell ]] -- line: 718
			-- upvalues: p1 (copy)
			return p1.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function() --[[ getTermsOfUseLink ]] -- line: 721
			-- upvalues: p1 (copy)
			return p1.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function() --[[ getPrivacyPolicyLink ]] -- line: 724
			-- upvalues: p1 (copy)
			return p1.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function() --[[ getVngAppUpsell ]] -- line: 727
			-- upvalues: FFlagLuaAppHomeVngAppUpsell (copy), p1 (copy)
			if FFlagLuaAppHomeVngAppUpsell then
				return p1.VngAppUpsell or false
			end

			return false
		end,
		getVngAppUpsellPcLayout = if not FFlagVngAppUpsellPcLayout then nil else function() -- line: 735
			-- upvalues: p1 (copy)
			return p1.VngAppUpsellPcLayout or false
		end,
		getShouldHideContactImporterUpsell = function() --[[ getShouldHideContactImporterUpsell ]] -- line: 739
			-- upvalues: p1 (copy)
			return p1.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function() --[[ getContactImporterEncouraged ]] -- line: 742
			-- upvalues: p1 (copy)
			return p1.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function() --[[ getFriendRequestNicknamesEnabled ]] -- line: 745
			-- upvalues: FFlagFriendRequestNicknames (copy), p1 (copy)
			if FFlagFriendRequestNicknames then
				return p1.FriendRequestNicknamesEnabled or false
			end

			return false
		end,
		getShouldShowVpcPlayButtonUpsells = if not FFlagLuaAppParentUpsellPolicy then nil else function() -- line: 753
			-- upvalues: p1 (copy)
			return p1.shouldShowVpcPlayButtonUpsells or false
		end,
		getRenamePaymentsToSpendingTab = function() --[[ getRenamePaymentsToSpendingTab ]] -- line: 757
			-- upvalues: p1 (copy)
			return p1.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function() --[[ getNotificationsCanReceiveStream ]] -- line: 762
			-- upvalues: GetFFlagNotificationsComplianceShouldRestrictStream (copy), p1 (copy)
			if GetFFlagNotificationsComplianceShouldRestrictStream() then
				return p1.notificationsCanAccessStream or false
			end

			return nil
		end,
		getNotificationsCanReceivePush = function() --[[ getNotificationsCanReceivePush ]] -- line: 769
			-- upvalues: p1 (copy)
			return p1.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function() --[[ getPushNotificationsUpsell ]] -- line: 772
			-- upvalues: p1 (copy)
			return p1.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function() --[[ getNotificationsCanReceiveExperience ]] -- line: 775
			-- upvalues: p1 (copy)
			if p1.notificationsCanAccessExperience == nil then
				return true
			end

			return p1.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function() --[[ getDisableResellingCollectiblesForCompliance ]] -- line: 781
			-- upvalues: p1 (copy)
			return p1.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function() --[[ getShowIllegalContentReportingUI ]] -- line: 784
			-- upvalues: v51 (copy), p1 (copy)
			return v51 or (p1.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function() --[[ getEligibleForContentPostFeed ]] -- line: 787
			-- upvalues: p1 (copy)
			return p1.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function() --[[ getEligibleForExternalContentSharing ]] -- line: 790
			-- upvalues: p1 (copy)
			return p1.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function() --[[ getEnableContinuousLoad ]] -- line: 793
			-- upvalues: p1 (copy)
			return p1.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function() --[[ getEnableAggregateLikesFavoritesCount ]] -- line: 796
			-- upvalues: p1 (copy)
			return p1.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function() --[[ getShowUpdatedCameraPath ]] -- line: 799
			-- upvalues: p1 (copy)
			return p1.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function() --[[ getRenameParentEmailForVerificationUpsell ]] -- line: 802
			-- upvalues: FFlagRenameParentEmailForVerificationUpsell (copy), p1 (copy)
			if FFlagRenameParentEmailForVerificationUpsell() then
				return p1.renameParentEmailForVerificationUpsell or false
			end

			return false
		end,
		getKeystrokeCollectionEnabled = function() --[[ getKeystrokeCollectionEnabled ]] -- line: 809
			-- upvalues: p1 (copy)
			if game:GetFastFlag("BehaviorCollectionControlEnabled") then
				return p1.EnableKeystrokeCollection or false
			end

			return false
		end,
		getCanUsePlatformChat = function() --[[ getCanUsePlatformChat ]] -- line: 817
			-- upvalues: p1 (copy)
			return p1.CanUsePlatformChat or false
		end,
		getCanSeeChatTab = function() --[[ getCanSeeChatTab ]] -- line: 821
			-- upvalues: p1 (copy)
			return p1.CanSeeChatTab or false
		end,
		getHidesGamesTab = function() --[[ getHidesGamesTab ]] -- line: 826
			-- upvalues: FFlagEnableAndroidTvAppPolicies (copy), p1 (copy)
			if FFlagEnableAndroidTvAppPolicies then
				return p1.HidesGamesTab or false
			end

			return false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]] -- line: 834
			-- upvalues: GetFFlagEnableMultiPageSignup (copy), p1 (copy)
			if not GetFFlagEnableMultiPageSignup() then
				return true
			end

			if p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil then
				return true
			end

			return p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages ]] -- line: 843
			-- upvalues: GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (copy), GetFFlagEnableMultiPageSignup (copy), p1 (copy)
			local v71 = GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup()

			if not GetFFlagEnableMultiPageSignup() then
				return v71
			end

			if p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then
				return v71
			end

			return p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages
		end,
		getRobuxUpsellFlowMobile = function() --[[ getRobuxUpsellFlowMobile ]] -- line: 853
			-- upvalues: p1 (copy)
			return p1.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function() --[[ getUsePaymentPlatformMicrosoftStore ]] -- line: 856
			-- upvalues: FFlagEnableMicrosoftStorePaymentsPlatform (copy), p1 (copy)
			if FFlagEnableMicrosoftStorePaymentsPlatform then
				return p1.usePaymentPlatformMicrosoftStore or false
			end

			return false
		end,
		getMicSettingsDirectionsLocaleKey = function() --[[ getMicSettingsDirectionsLocaleKey ]] -- line: 863
			-- upvalues: p1 (copy)
			return p1.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ getMicSettingsDeeplinkDirectionsLocaleKey ]] -- line: 866
			-- upvalues: p1 (copy)
			return p1.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function() --[[ getRequiresAppRestartOnMicAccessChange ]] -- line: 869
			-- upvalues: p1 (copy)
			return p1.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function() --[[ getRenameFriendsToConnections ]] -- line: 872
			-- upvalues: FFlagEnableFriendsRenamingForAll (copy), p1 (copy)
			if FFlagEnableFriendsRenamingForAll then
				return true
			end

			return p1.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function() --[[ getShareSheetEnabled ]] -- line: 878
			-- upvalues: FFlagTCShareLinkSenderUI (copy), p1 (copy)
			if FFlagTCShareLinkSenderUI then
				return p1.shareSheetEnabled or false
			end

			return nil
		end,
		getCanAccessTrustedContacts = function() --[[ getCanAccessTrustedContacts ]] -- line: 885
			-- upvalues: p1 (copy)
			return p1.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function() --[[ getExperienceDetailsNoticeType ]] -- line: 888
			-- upvalues: p1 (copy)
			return p1.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function() --[[ getRequiresOSAFriendingEducation ]] -- line: 891
			-- upvalues: p1 (copy)
			return p1.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function() --[[ getSocialGraphSyncEnabled ]] -- line: 894
			-- upvalues: p1 (copy)
			return p1.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function() --[[ getAccountDisambiguationDisabled ]] -- line: 897
			-- upvalues: p1 (copy)
			return p1.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function() --[[ getHasWebViewSupportForFAE ]] -- line: 900
			-- upvalues: p1 (copy)
			return p1.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function() --[[ getLinkedAuthEndpointsEnabled ]] -- line: 903
			-- upvalues: p1 (copy)
			return p1.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function() --[[ getLinkingPlatform ]] -- line: 906
			-- upvalues: p1 (copy)
			return p1.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function() --[[ getUsePaymentPlatformMilkyWayStore ]] -- line: 909
			-- upvalues: FFlagEnableMilkyWayPaymentsPlatformV2 (copy), p1 (copy)
			if FFlagEnableMilkyWayPaymentsPlatformV2 then
				return p1.usePaymentPlatformMilkyWayStore or false
			end

			return false
		end,
		getScreentimeMoreTimeOptionEnabled = function() --[[ getScreentimeMoreTimeOptionEnabled ]] -- line: 915
			-- upvalues: FFlagEnableScreentimeMoreTimeOption (copy), p1 (copy)
			if FFlagEnableScreentimeMoreTimeOption then
				return p1.ScreentimeMoreTimeOptionEnabled or false
			end

			return false
		end,
		getDisablePremiumEntrypoint = function() --[[ getDisablePremiumEntrypoint ]] -- line: 921
			-- upvalues: v48 (copy), p1 (copy)
			if v48 then
				return p1.DisablePremiumEntrypoint or (p1.DisablePremiumEntryPoint or false)
			end

			return false
		end,
		getDisableBlackbirdEntrypoints = function() --[[ getDisableBlackbirdEntrypoints ]] -- line: 927
			-- upvalues: v49 (copy), p1 (copy)
			if v49 then
				return p1.DisableBlackbirdEntrypoints or false
			end

			return false
		end,
		getEnableGiftcardsWithRedeem = function() --[[ getEnableGiftcardsWithRedeem ]] -- line: 933
			-- upvalues: v50 (copy), p1 (copy)
			if v50 then
				return p1.EnableGiftcardsWithRedeem or false
			end

			return false
		end,
		getGiftCardSourceRefOverride = function() --[[ getGiftCardSourceRefOverride ]] -- line: 939
			-- upvalues: p1 (copy)
			return p1.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function() --[[ getSignupCheckboxDisabled ]] -- line: 942
			-- upvalues: v47 (copy), p1 (copy)
			if v47 then
				return p1.DisableSignupCheckbox or false
			end

			return false
		end,
		getExcludeCrossDeviceSignIn = function() --[[ getExcludeCrossDeviceSignIn ]] -- line: 949
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludeCrossDeviceSignIn or false
			end

			return false
		end,
		getExcludePasskeyLogin = function() --[[ getExcludePasskeyLogin ]] -- line: 955
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludePasskeyLogin or false
			end

			return false
		end,
		getExcludeUsernamePasswordSignIn = function() --[[ getExcludeUsernamePasswordSignIn ]] -- line: 962
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludeUsernamePasswordSignIn or false
			end

			return false
		end,
		getExcludeEmailPasswordSignIn = function() --[[ getExcludeEmailPasswordSignIn ]] -- line: 968
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludeEmailPasswordSignIn or false
			end

			return false
		end,
		getExcludePhoneNumberPasswordSignIn = function() --[[ getExcludePhoneNumberPasswordSignIn ]] -- line: 974
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludePhoneNumberPasswordSignIn or false
			end

			return false
		end,
		getExcludeAccountSwitcher = function() --[[ getExcludeAccountSwitcher ]] -- line: 980
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludeAccountSwitcher or false
			end

			return false
		end,
		getExcludeUsernameUpdateModeration = function() --[[ getExcludeUsernameUpdateModeration ]] -- line: 986
			-- upvalues: FFlagAuthSecExclusions (copy), p1 (copy)
			if FFlagAuthSecExclusions then
				return p1.ExcludeUsernameUpdateModeration or false
			end

			return false
		end,
		getMorePageExitButtonEnabled = if not FFlagEnableMorePageExitButtonSupport then nil else function() -- line: 993
			-- upvalues: p1 (copy)
			return p1.MorePageExitButtonEnabled or false
		end,
		getMoreGridDirectionalLayoutPreferred = if not FFlagEnableMorePageDirectionalLayoutRolloutFix then nil else function() -- line: 998
			-- upvalues: p1 (copy)
			return p1.MoreGridDirectionalLayoutPreferred or false
		end,
		getShouldUseDMCCALegalDisclosureInApp = function() --[[ getShouldUseDMCCALegalDisclosureInApp ]] -- line: 1002
			-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (copy), p1 (copy)
			if FFlagEnableUnifiedProductPurchaseFlow then
				return p1.ShouldUseDMCCALegalDisclosureInApp or false
			end

			return false
		end,
		getCanAccessParty = function() --[[ getCanAccessParty ]] -- line: 1008
			-- upvalues: p1 (copy)
			if p1.CanAccessParty == nil then
				return true
			end

			return p1.CanAccessParty
		end,
		getRedeemTileEnabled = function() --[[ getRedeemTileEnabled ]] -- line: 1014
			-- upvalues: p1 (copy)
			return p1.RedeemTileEnabled or false
		end,
		getShouldUseVibrationInsteadOfHaptics = function() --[[ getShouldUseVibrationInsteadOfHaptics ]] -- line: 1017
			-- upvalues: p1 (copy)
			return p1.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = if not FFlagSduiAppPolicyBindings then nil else function() -- line: 1021
			-- upvalues: p1 (copy)
			return p1
		end,
		getStickyShortcutBarEnabled = if not FFlagGuacStickyShortcutBarEnabled then nil else function() -- line: 1026
			-- upvalues: p1 (copy)
			return p1.StickyShortcutBarEnabled or false
		end,
		getAccountType = if not FFlagEnableCoreContentAccountType then nil else function() -- line: 1031
			-- upvalues: p1 (copy)
			return p1.AccountType
		end,
		getCoreContentBadgeText = if not FFlagEnableCoreContentBadge then nil else function() -- line: 1036
			-- upvalues: p1 (copy)
			return p1.CoreContentBadgeText
		end,
		getCoreContentTheme = if not FFlagEnableCoreContentThemeUseGuacForTokenOverrides then nil else function() -- line: 1041
			-- upvalues: p1 (copy)
			return p1.CoreContentTheme
		end,
		getShowUncheckedBadge = if not FFlagEnableFlyoutUncheckedBadge then nil else function() -- line: 1046
			-- upvalues: p1 (copy)
			return p1.ShowUncheckedBadge
		end,
		getShowBadgeOver12 = if not FFlagAddTopBarPoliciesToUniversalPolicies then nil else function() -- line: 1051
			-- upvalues: p1 (copy)
			return p1.ShowBadgeOver12 or false
		end
	}
end
