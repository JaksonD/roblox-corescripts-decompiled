local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Cryo = require(CorePackages.Packages.Cryo)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPage = require(Modules.LuaApp.AppPage)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local buildCreatorWebNavUrl = require(Modules.LuaApp.buildCreatorWebNavUrl)
local NumericalBadge = require(Modules.LuaApp.Components.NumericalBadge)
local NotificationType = require(Modules.LuaApp.Enum.NotificationType)
local VRConstants = require(CorePackages.Workspace.Packages.VrCompatibility).VRConstants
local getAppChatCommunitiesVisualConfig = require(CorePackages.Workspace.Packages.AppChat).Utils.getAppChatCommunitiesVisualConfig
local getFFlagCommunitiesUseVisualConfigUtil = SharedFlags.getFFlagCommunitiesUseVisualConfigUtil
local GetFFlagUseCommunitiesTranslation = SharedFlags.GetFFlagUseCommunitiesTranslation
local v18 = game:DefineFastFlag("LuaAppsEnableParentalControlsTab", false)
local GetFStringPlatformEventUrl = SharedFlags.GetFStringPlatformEventUrl
local GetFFlagEnableGUACControlTOSPPLinks = require(Modules.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks)
local v21 = game:DefineFastString("LuobuCJVAboutUSCorpUrlOverride", "https://roblox.qq.com/?webview=true0409")
local GetFFlagEnableGateNotificationPreferencesTab = SharedFlags.GetFFlagEnableGateNotificationPreferencesTab
local v23 = game:DefineFastFlag("RenameSettingsTabsSentenceCase", false)
local v24 = game:DefineFastString("GiftCardSourceParam", "more-page")
local FFlagAddRMTile = require(Modules.LuaApp.Flags.FFlagAddRMTile)
local FFlagEnableBlackbird = SharedFlags.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnMorePage = SharedFlags.FFlagEnableBlackbirdOnMorePage
local v28 = if not FFlagEnableBlackbird or not FFlagEnableBlackbirdOnMorePage then nil else require(CorePackages.Packages.Foundation)
local GetFStringBlackbirdUrl = SharedFlags.GetFStringBlackbirdUrl
local v30 = game:DefineFastString("LearnPlaceURI", "roblox://experiences/start?placeId=92498145666402")
local v31 = game:DefineFastString("RMPlaceURI", "roblox://experiences/start?placeId=119524072047648")
local FFlagEnableFlyoutSidePanel = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagCreateConnectionsHub = SharedFlags.FFlagCreateConnectionsHub
local GetFFlagEnableCommunityListExperimentation = SharedFlags.GetFFlagEnableCommunityListExperimentation
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagCTAChangeLogOutToSignOut = require(Modules.LuaApp.Flags.FFlagCTAChangeLogOutToSignOut)
local getAppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local CommunityListExperimentation = require(CorePackages.Workspace.Packages.Groups).Experiments.CommunityListExperimentation
local t1 = {
	VRFTUX = "VRFTUX",
	Catalog = "Catalog",
	BuildersClub = "BuildersClub",
	DevSubs = "DevSubs",
	Trades = "Trades",
	Profile = "Profile",
	TencentNoticeCenter = "TencentNoticeCenter",
	TencentHelp = "TencentHelp",
	UserInfo = "UserInfo",
	Friends = "Friends",
	Groups = "Groups",
	Inventory = "Inventory",
	Messages = "Messages",
	CreateGames = "CreateGames",
	Blog = "Blog",
	GiftCards = "GiftCards",
	Redeem = "Redeem",
	OfficialStore = "OfficialStore",
	Settings = "Settings",
	AdjustScreen = "AdjustScreen",
	SafetySupport = "SafetySupport",
	About = "About",
	Help = "Help",
	LoginCode = "Login Code",
	ReportLogs = "Report Logs",
	LogOut = "LogOut",
	TheHunt = "TheHunt",
	About_AboutUs = "About_AboutUs",
	About_AboutUs_CJV = "About_AboutUs_CJV",
	About_Careers = "About_Careers",
	About_Parents = "About_Parents",
	About_Terms = "About_Terms",
	About_Privacy = "About_Privacy",
	About_PrivacyGuidelinesChildren = "About_PrivacyGuidelinesChildren",
	About_LuobuRiderTerms = "About_LuobuRiderTerms",
	About_LuobuThirdPartyDataUse = "About_LuobuThirdPartyDataUse",
	About_AppInformation = "About_AppInformation",
	About_AboutSection = "About_AboutSection",
	About_TermsOfService = "About_TermsOfService",
	About_LicensingSection = "About_LicensingSection",
	About_VersionSection = "About_VersionSection",
	SafetySupport_ReportAppeals = "SafetySupport_ReportAppeals",
	SafetySupport_Help = "SafetySupport_Help",
	Settings_AccountInfo = "Settings_AccountInfo",
	Settings_Security = "Settings_Security",
	Settings_Privacy = "Settings_Privacy",
	Settings_ParentalControls = "Settings_ParentalControls",
	Settings_Billing = "Settings_Billing",
	Settings_Subscriptions = "Settings_Subscriptions",
	Settings_Notifications = "Settings_Notifications",
	Settings_Accessibility = "Settings_Accessibility",
	Settings_Tencent_Reputation = "Settings_Tencent_Reputation",
	Settings_Cross_Play = "Settings_Cross_Play",
	Settings_SwitchProfileSection = "Settings_SwitchProfileSection",
	Settings_AccountSettingsSection = "Settings_AccountSettingsSection",
	Settings_AccountSettingsInfo = "Settings_AccountSettingsInfo",
	Settings_DeviceSettingsSection = "Settings_DeviceSettingsSection"
}
local t2 = {
	Content = "Content",
	Navigation = "Navigation",
	Action = "Action"
}
local t3 = {
	Catalog = "Catalog",
	Games = "Games",
	Groups = "Groups",
	Library = "Library",
	Players = "Players"
}
local v42 = getAppChatCommunitiesVisualConfig()
local v43 = string.lower(UserInputService:GetPlatform().Name)
local v44 = getAppFeaturePolicies().getGiftCardSourceRefOverride()
local v45 = if v44 == "" then v43 else v44
local t4 = {
	[t1.VRFTUX] = "CommonUI.Features.Label.VRFTUX",
	[t1.Catalog] = "Feature.Avatar.Action.Marketplace",
	[t1.BuildersClub] = "CommonUI.Features.Label.Premium",
	[t1.DevSubs] = "CommonUI.Features.Label.DevSubs",
	[t1.Trades] = "CommonUI.Features.Label.Trades",
	[t1.Profile] = "CommonUI.Features.Label.Profile",
	[t1.TencentHelp] = "CommonUI.Features.Label.Help",
	[t1.TencentNoticeCenter] = "CommonUI.Features.Label.TencentNotice",
	[t1.Friends] = not FFlagConnectionsToFriendsRename and "CommonUI.Features.Label.Connections" or "CommonUI.Features.Label.Friends",
	[t1.Groups] = if not getFFlagCommunitiesUseVisualConfigUtil() then not GetFFlagUseCommunitiesTranslation() and "CommonUI.Features.Label.sGroups" or "CommonUI.Features.Label.Groups" else v42.label,
	[t1.Inventory] = "CommonUI.Features.Label.Inventory",
	[t1.Messages] = "CommonUI.Features.Label.Messages",
	[t1.CreateGames] = "CommonUI.Features.Label.CreateGames",
	[t1.TheHunt] = "CommonUI.Features.Label.TheHunt",
	[t1.Blog] = "CommonUI.Features.Label.Blog",
	[t1.GiftCards] = "CommonUI.Features.Label.GiftCards",
	[t1.Redeem] = "CommonUI.Features.Label.Redeem",
	[t1.OfficialStore] = "CommonUI.Features.Label.OfficialStore",
	[t1.Settings] = "CommonUI.Features.Label.Settings",
	[t1.AdjustScreen] = "CommonUI.Features.Label.AdjustScreen",
	[t1.About] = "CommonUI.Features.Label.About",
	[t1.SafetySupport] = "CommonUI.Features.Label.HelpAndSafety",
	[t1.SafetySupport_ReportAppeals] = "Feature.AppealsPortal.Label.ReportAndAppeals",
	[t1.Help] = "CommonUI.Features.Label.Help",
	[t1.LoginCode] = "Authentication.CrossDevice.Heading.QuickLogin",
	[t1.LogOut] = not FFlagCTAChangeLogOutToSignOut and "Application.Logout.Action.Logout" or "Feature.AccountLock.Action.Signout",
	[t1.ReportLogs] = "CommonUI.Features.Label.ReportLogs",
	[t1.About_AboutUs] = "CommonUI.Features.Label.AboutUs",
	[t1.About_AboutUs_CJV] = "CommonUI.Features.Label.AboutUs",
	[t1.About_Careers] = "CommonUI.Features.Label.Careers",
	[t1.About_Parents] = "CommonUI.Features.Label.Parents",
	[t1.About_Terms] = "CommonUI.Features.Label.Terms",
	[t1.About_Privacy] = "CommonUI.Features.Label.Privacy",
	[t1.About_PrivacyGuidelinesChildren] = "CommonUI.Features.Label.PrivacyGuidelinesChildren",
	[t1.About_LuobuRiderTerms] = "CommonUI.Features.Label.LuobuRiderTerms",
	[t1.About_LuobuThirdPartyDataUse] = "CommonUI.Features.Label.LuobuThirdPartyDataUse",
	[t1.About_AppInformation] = "CommonUI.Features.Label.AppInformation",
	[t1.About_AboutSection] = "CommonUI.Features.Label.About",
	[t1.About_TermsOfService] = "CommonUI.Features.Label.TermsOfService",
	[t1.About_LicensingSection] = "CommonUI.Features.Label.Licensing",
	[t1.About_VersionSection] = "CommonUI.Features.Label.Version",
	[t1.Settings_AccountInfo] = not v23 and "Feature.AccountSettings.Heading.Tab.AccountInfo" or "Feature.AccountSettings.Heading.Tab.AccountInfoV2",
	[t1.Settings_Security] = "Feature.AccountSettings.Heading.Tab.Security",
	[t1.Settings_Privacy] = "Feature.AccountSettings.Heading.Tab.PrivacyContentRestrictions",
	[t1.Settings_ParentalControls] = not v23 and "Feature.AccountSettings.Heading.Tab.ParentalControls" or "Feature.AccountSettings.Heading.Tab.ParentalControlsV2",
	[t1.Settings_Billing] = if not getAppFeaturePolicies().getRenamePaymentsToSpendingTab() then not v23 and "Feature.AccountSettings.Heading.Tab.Billing" or "Feature.AccountSettings.Heading.Tab.BillingV2" else "Feature.AccountSettings.Heading.Tab.Spending",
	[t1.Settings_Subscriptions] = "Feature.AccountSettings.Heading.Tab.Subscriptions",
	[t1.Settings_Notifications] = "Feature.AccountSettings.Heading.Tab.Notifications",
	[t1.Settings_Accessibility] = not v23 and "Feature.Accessibility.Heading.DevicePreferences" or "Feature.Accessibility.Heading.DevicePreferencesV2",
	[t1.Settings_Tencent_Reputation] = "Feature.AccountSettings.Label.TencentReputation",
	[t1.Settings_SwitchProfileSection] = "Feature.Settings.Heading.SwitchProfile",
	[t1.Settings_AccountSettingsSection] = "Feature.Settings.Heading.AccountSettings"
}
local t5 = {
	[t1.VRFTUX] = Images["icons/menu/vrheadset_large"],
	[t1.Catalog] = Images["icons/menu/shop_large"],
	[t1.BuildersClub] = Images["icons/status/premium_large"],
	[t1.DevSubs] = Images["icons/status/player/developer"],
	[t1.Trades] = Images["icons/menu/trade"],
	[t1.Profile] = Images["icons/actions/friend_sort/my_profile"],
	[t1.TencentHelp] = Images["icons/menu/help_large"],
	[t1.TencentNoticeCenter] = Images["icons/menu/events_large"],
	[t1.Friends] = Images["icons/menu/friends_large"],
	[t1.Groups] = if not getFFlagCommunitiesUseVisualConfigUtil() then Images["icons/menu/groups_large"] else Images[v42.iconLarge],
	[t1.Inventory] = Images["icons/menu/inventory_large"],
	[t1.Messages] = Images["icons/menu/messages_large"],
	[t1.CreateGames] = Images["icons/menu/create_large"],
	[t1.TheHunt] = Images["icons/menu/events_large"],
	[t1.Blog] = Images["icons/menu/blog_large"],
	[t1.GiftCards] = Images["icons/menu/giftcard_large"],
	[t1.Redeem] = Images["icons/menu/wallet"],
	[t1.OfficialStore] = Images["icons/menu/officialstore_large"],
	[t1.Settings] = Images["icons/menu/settings_large"],
	[t1.AdjustScreen] = Images["icons/menu/adjust/scale"],
	[t1.About] = Images["icons/menu/about_large"],
	[t1.SafetySupport] = Images["icons/menu/protection"],
	[t1.Help] = Images["icons/menu/help_large"],
	[t1.LoginCode] = Images["icons/graphic/lock_xxlarge"],
	[t1.ReportLogs] = Images["icons/menu/giftcard_large"]
}
local t6 = {
	[t1.Catalog] = UrlBuilder.static.catalog(),
	[t1.BuildersClub] = UrlBuilder.static.buildersClub(),
	[t1.Trades] = UrlBuilder.static.trades(),
	[t1.Profile] = UrlBuilder.static.profile(),
	[t1.Friends] = UrlBuilder.static.friends(),
	[t1.Groups] = UrlBuilder.static.groups(),
	[t1.Inventory] = UrlBuilder.static.inventory(),
	[t1.Messages] = UrlBuilder.static.messages(),
	[t1.CreateGames] = buildCreatorWebNavUrl({
		utm_content = "more_page"
	}),
	[t1.TheHunt] = if GetFStringPlatformEventUrl() == "" then UrlBuilder.static.help() else UrlBuilder.fromString(GetFStringPlatformEventUrl())(),
	[t1.Blog] = UrlBuilder.static.blog(),
	[t1.OfficialStore] = UrlBuilder.static.amazonStore(),
	[t1.GiftCards] = UrlBuilder.static.giftCards(),
	[t1.GiftCards] = UrlBuilder.static.giftCards(v45 .. "-" .. v24),
	[t1.Redeem] = UrlBuilder.static.redeem(),
	[t1.Help] = UrlBuilder.static.help(),
	[t1.SafetySupport_ReportAppeals] = UrlBuilder.static.appealsPortal.main({
		source = "app-help-safety"
	}),
	[t1.About_AboutUs] = UrlBuilder.static.about.us(),
	[t1.About_AboutUs_CJV] = v21 ~= "" and UrlBuilder.fromString(v21)() or UrlBuilder.static.about.us(),
	[t1.About_Careers] = UrlBuilder.static.about.careers(),
	[t1.About_Parents] = UrlBuilder.static.about.parents(),
	[t1.About_Terms] = UrlBuilder.static.about.terms({
		useGameQQUrls = true
	}),
	[t1.About_Privacy] = UrlBuilder.static.about.privacy({
		useGameQQUrls = true
	}),
	[t1.About_PrivacyGuidelinesChildren] = UrlBuilder.static.tencent.childrenPrivacyGuide(),
	[t1.About_LuobuRiderTerms] = UrlBuilder.static.tencent.luobuRiderTerms(),
	[t1.About_LuobuThirdPartyDataUse] = UrlBuilder.static.tencent.luobuThirdPartyDataUse(),
	[t1.Settings_AccountInfo] = UrlBuilder.static.settings.account(),
	[t1.Settings_Security] = UrlBuilder.static.settings.security(),
	[t1.Settings_Privacy] = UrlBuilder.static.settings.privacy(),
	[t1.Settings_ParentalControls] = UrlBuilder.static.settings.parentalControls(),
	[t1.Settings_Billing] = UrlBuilder.static.settings.billing(),
	[t1.Settings_Subscriptions] = UrlBuilder.static.settings.subscriptions(),
	[t1.Settings_Notifications] = UrlBuilder.static.settings.notifications(),
	[t1.Settings_Tencent_Reputation] = UrlBuilder.static.tencent.reputationInfo()
}

local function v49(p1, p2, p3) -- line: 292
	-- upvalues: AppPage (copy), t4 (copy), t6 (copy)
	if p1 then
		return {
			page = p2 or AppPage.GenericWebPage,
			titleKey = t4[p1],
			url = t6[p1],
			fallbackToExternalBrowser = p3
		}
	end

	return {}
end

local t7 = {
	[t1.VRFTUX] = {
		itemType = t1.VRFTUX,
		textKey = t4[t1.VRFTUX],
		icon = t5[t1.VRFTUX],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.ExperienceDetail,
			url = VRConstants.FTUX.UniverseId
		}
	},
	[t1.Catalog] = {
		itemType = t1.Catalog,
		textKey = t4[t1.Catalog],
		icon = t5[t1.Catalog],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AvatarScreen.Catalog
		}
	},
	[t1.BuildersClub] = {
		itemType = t1.BuildersClub,
		textKey = t4[t1.BuildersClub],
		icon = t5[t1.BuildersClub],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.BuildersClub
		}
	},
	[t1.DevSubs] = {
		itemType = t1.DevSubs,
		textKey = t4[t1.DevSubs],
		icon = t5[t1.DevSubs],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.DevSubs
		}
	},
	[t1.Trades] = {
		itemType = t1.Trades,
		textKey = t4[t1.Trades],
		icon = t5[t1.Trades],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Trades)
	},
	[t1.Profile] = {
		itemType = t1.Profile,
		textKey = t4[t1.Profile],
		icon = t5[t1.Profile],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		urlGenerator = function(p4) --[[ urlGenerator ]] -- line: 360
			return p4
		end,
		context = {
			page = AppPage.ProfilePlatform
		}
	},
	[t1.Friends] = {
		itemType = t1.Friends,
		textKey = t4[t1.Friends],
		icon = t5[t1.Friends],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeComponent = NumericalBadge,
		badgeCount = 0,
		urlGenerator = function(p5) --[[ urlGenerator ]] -- line: 376
			-- upvalues: UrlBuilder (copy)
			return p5 and UrlBuilder.user.friends({
				userId = p5
			}) or nil
		end,
		getSearchParams = function() --[[ getSearchParams ]] -- line: 379
			-- upvalues: t3 (copy)
			return {
				searchType = t3.Players
			}
		end,
		context = {
			page = if not FFlagCreateConnectionsHub then AppPage.ViewFriends else AppPage.CoHubMyConnections
		}
	},
	[t1.Groups] = {
		itemType = t1.Groups,
		textKey = t4[t1.Groups],
		icon = t5[t1.Groups],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		getSearchParams = function(p6) --[[ getSearchParams ]] -- line: 394
			-- upvalues: FormFactor (copy), t3 (copy)
			if p6 == FormFactor.WIDE then
				return {
					searchType = t3.Groups
				}
			end

			return nil
		end,
		context = if not GetFFlagEnableCommunityListExperimentation() or not CommunityListExperimentation.getCommunityListEnabled() then v49(t1.Groups) else {
			page = AppPage.Groups
		}
	},
	[t1.Inventory] = {
		itemType = t1.Inventory,
		textKey = t4[t1.Inventory],
		icon = t5[t1.Inventory],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		urlGenerator = function(p7) --[[ urlGenerator ]] -- line: 416
			-- upvalues: UrlBuilder (copy)
			return p7 and UrlBuilder.user.inventory({
				userId = p7
			}) or nil
		end,
		context = v49(t1.Inventory)
	},
	[t1.Messages] = {
		itemType = t1.Messages,
		textKey = t4[t1.Messages],
		icon = t5[t1.Messages],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeComponent = NumericalBadge,
		badgeCount = 0,
		context = v49(t1.Messages)
	},
	[t1.CreateGames] = {
		itemType = t1.CreateGames,
		textKey = t4[t1.CreateGames],
		icon = t5[t1.CreateGames],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.CreateGames),
		shouldOpenInExternalBrowser = true
	},
	[t1.TencentHelp] = {
		itemType = t1.TencentHelp,
		textKey = t4[t1.Help],
		icon = t5[t1.Help],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.TencentHelp,
			titleKey = t4[t1.Help]
		}
	},
	[t1.TencentNoticeCenter] = {
		itemType = t1.TencentNoticeCenter,
		textKey = t4[t1.TencentNoticeCenter],
		icon = t5[t1.TencentNoticeCenter],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.TencentNoticeCenter
		}
	},
	[t1.TheHunt] = {
		itemType = t1.TheHunt,
		textKey = t4[t1.TheHunt],
		icon = t5[t1.TheHunt],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.TheHunt)
	},
	[t1.Blog] = {
		itemType = t1.Blog,
		textKey = t4[t1.Blog],
		icon = t5[t1.Blog],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Blog, nil, true)
	},
	[t1.GiftCards] = {
		itemType = t1.GiftCards,
		textKey = t4[t1.GiftCards],
		icon = t5[t1.GiftCards],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.GiftCards, nil, true),
		shouldOpenInExternalBrowser = true
	},
	[t1.Redeem] = {
		itemType = t1.Redeem,
		textKey = t4[t1.Redeem],
		icon = t5[t1.Redeem],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Redeem)
	},
	[t1.OfficialStore] = {
		itemType = t1.OfficialStore,
		textKey = t4[t1.OfficialStore],
		icon = t5[t1.OfficialStore],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.OfficialStore, nil, true)
	},
	[t1.Settings] = {
		itemType = t1.Settings,
		textKey = t4[t1.Settings],
		icon = t5[t1.Settings],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeComponent = NumericalBadge,
		badgeCount = 0,
		context = {
			page = AppPage.Settings
		}
	},
	[t1.AdjustScreen] = {
		itemType = t1.AdjustScreen,
		textKey = t4[t1.AdjustScreen],
		icon = t5[t1.AdjustScreen],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.AdjustScreen
		}
	},
	[t1.About] = {
		itemType = t1.About,
		textKey = t4[t1.About],
		icon = t5[t1.About],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.About
		}
	},
	[t1.SafetySupport] = {
		itemType = t1.SafetySupport,
		textKey = t4[t1.SafetySupport],
		icon = t5[t1.SafetySupport],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.SafetySupport
		}
	},
	[t1.ReportLogs] = {
		itemType = t1.ReportLogs,
		textKey = t4[t1.ReportLogs],
		icon = t5[t1.ReportLogs],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {}
	},
	[t1.Help] = {
		itemType = t1.Help,
		textKey = t4[t1.Help],
		icon = t5[t1.Help],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Help, nil, true),
		shouldOpenInExternalBrowser = true
	},
	[t1.LoginCode] = {
		itemType = t1.LoginCode,
		textKey = t4[t1.LoginCode],
		icon = t5[t1.LoginCode],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.CrossDeviceLogin
		}
	},
	[t1.LogOut] = {
		itemType = t1.LogOut,
		textKey = t4[t1.LogOut],
		textXAlignment = Enum.TextXAlignment.Center,
		badgeCount = 0,
		context = {
			page = AppPage.LogoutConfirmation
		}
	},
	[t1.UserInfo] = {
		itemType = t1.UserInfo
	},
	[t1.Settings_Cross_Play] = {
		itemType = t1.Settings_Cross_Play
	},
	[t1.SafetySupport_ReportAppeals] = {
		itemType = t1.SafetySupport_ReportAppeals,
		textKey = t4[t1.SafetySupport_ReportAppeals],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.SafetySupport_ReportAppeals)
	},
	[t1.SafetySupport_Help] = {
		itemType = t1.SafetySupport_Help,
		textKey = t4[t1.Help],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Help),
		shouldOpenInExternalBrowser = true
	},
	[t1.About_AboutUs] = {
		itemType = t1.About_AboutUs,
		textKey = t4[t1.About_AboutUs],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_AboutUs, nil, true),
		shouldOpenInExternalBrowser = true
	},
	[t1.About_AboutUs_CJV] = {
		itemType = t1.About_AboutUs_CJV,
		textKey = t4[t1.About_AboutUs],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_AboutUs_CJV)
	},
	[t1.About_Careers] = {
		itemType = t1.About_Careers,
		textKey = t4[t1.About_Careers],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_Careers, nil, true),
		shouldOpenInExternalBrowser = true
	},
	[t1.About_Parents] = {
		itemType = t1.About_Parents,
		textKey = t4[t1.About_Parents],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_Parents, nil, true),
		shouldOpenInExternalBrowser = true
	},
	[t1.About_Terms] = {
		itemType = t1.About_Terms,
		textKey = t4[t1.About_Terms],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_Terms, nil, true),
		shouldOpenInExternalBrowser = true,
		urlGenerator = if not GetFFlagEnableGUACControlTOSPPLinks() then nil else function(_, p9) -- line: 641
			-- upvalues: t6 (copy), t1 (copy)
			local v61 = nil

			if p9 then
				v61 = p9.getTermsOfUseLink()
			end

			if v61 == nil or v61 == "" then
				v61 = t6[t1.About_Terms]
			end

			return v61
		end
	},
	[t1.About_Privacy] = {
		itemType = t1.About_Privacy,
		textKey = t4[t1.About_Privacy],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_Privacy, nil, true),
		shouldOpenInExternalBrowser = true,
		urlGenerator = if not GetFFlagEnableGUACControlTOSPPLinks() then nil else function(_, p11) -- line: 661
			-- upvalues: t6 (copy), t1 (copy)
			local v64 = nil

			if p11 then
				v64 = p11.getPrivacyPolicyLink()
			end

			if v64 == nil or v64 == "" then
				v64 = t6[t1.About_Privacy]
			end

			return v64
		end
	},
	[t1.About_PrivacyGuidelinesChildren] = {
		itemType = t1.About_PrivacyGuidelinesChildren,
		textKey = t4[t1.About_PrivacyGuidelinesChildren],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_PrivacyGuidelinesChildren)
	},
	[t1.About_LuobuRiderTerms] = {
		itemType = t1.About_LuobuRiderTerms,
		textKey = t4[t1.About_LuobuRiderTerms],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_LuobuRiderTerms)
	},
	[t1.About_LuobuThirdPartyDataUse] = {
		itemType = t1.About_LuobuThirdPartyDataUse,
		textKey = t4[t1.About_LuobuThirdPartyDataUse],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.About_LuobuThirdPartyDataUse)
	},
	[t1.About_AppInformation] = {
		itemType = t1.About_AppInformation,
		textKey = t4[t1.About_AppInformation],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.AppInformation
		}
	},
	[t1.About_VersionSection] = {
		itemType = t1.About_VersionSection,
		textKey = t4[t1.About_VersionSection]
	},
	[t1.Settings_AccountInfo] = {
		itemType = t1.Settings_AccountInfo,
		textKey = t4[t1.Settings_AccountInfo],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeComponent = NumericalBadge,
		badgeCount = 0,
		context = v49(t1.Settings_AccountInfo, AppPage.AccountInfo)
	},
	[t1.Settings_Security] = {
		itemType = t1.Settings_Security,
		textKey = t4[t1.Settings_Security],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_Security, AppPage.SettingsSubPage)
	},
	[t1.Settings_Privacy] = {
		itemType = t1.Settings_Privacy,
		textKey = t4[t1.Settings_Privacy],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_Privacy, AppPage.SettingsSubPage)
	},
	[t1.Settings_ParentalControls] = {
		itemType = t1.Settings_ParentalControls,
		textKey = t4[t1.Settings_ParentalControls],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_ParentalControls, AppPage.SettingsSubPage)
	},
	[t1.Settings_Billing] = {
		itemType = t1.Settings_Billing,
		textKey = t4[t1.Settings_Billing],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_Billing, AppPage.SettingsSubPage)
	},
	[t1.Settings_Subscriptions] = {
		itemType = t1.Settings_Subscriptions,
		textKey = t4[t1.Settings_Subscriptions],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_Subscriptions, AppPage.SettingsSubPage)
	},
	[t1.Settings_Notifications] = {
		itemType = t1.Settings_Notifications,
		textKey = t4[t1.Settings_Notifications],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = v49(t1.Settings_Notifications, AppPage.SettingsSubPage)
	},
	[t1.Settings_Accessibility] = {
		itemType = t1.Settings_Accessibility,
		textKey = t4[t1.Settings_Accessibility],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.Accessibility
		}
	},
	[t1.Settings_Tencent_Reputation] = {
		itemType = t1.Settings_Tencent_Reputation,
		textKey = t4[t1.Settings_Tencent_Reputation],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = Cryo.Dictionary.join({
			notificationType = NotificationType.SDK_OPEN_URL
		}, (v49(t1.Settings_Tencent_Reputation, AppPage.SettingsSubPage)))
	},
	[t1.Settings_SwitchProfileSection] = {
		itemType = t1.Settings_SwitchProfileSection,
		textKey = t4[t1.Settings_SwitchProfileSection]
	},
	[t1.Settings_AccountSettingsSection] = {
		itemType = t1.Settings_AccountSettingsSection,
		textKey = t4[t1.Settings_AccountSettingsSection]
	},
	[t1.Settings_AccountSettingsInfo] = {
		itemType = t1.Settings_AccountSettingsInfo
	},
	[t1.Settings_DeviceSettingsSection] = {
		itemType = t1.Settings_DeviceSettingsSection
	},
	[t1.About_AboutSection] = {
		itemType = t1.About_AboutSection,
		textKey = t4[t1.About_AboutSection]
	},
	[t1.About_TermsOfService] = {
		itemType = t1.About_TermsOfService,
		textKey = t4[t1.About_TermsOfService],
		rightImage = Images["icons/navigation/externallink_medium"],
		context = {
			url = t6[t1.About_Terms]
		}
	},
	[t1.About_LicensingSection] = {
		itemType = t1.About_LicensingSection,
		textKey = t4[t1.About_LicensingSection]
	}
}

t1.Learn = "Learn"
t4[t1.Learn] = "CommonUI.Features.Label.Learn"
t5[t1.Learn] = Images["icons/menu/education"]
t7[t1.Learn] = {
	itemType = t1.Learn,
	textKey = t4[t1.Learn],
	icon = t5[t1.Learn],
	rightImage = "LuaApp/icons/navigation/pushRight_small",
	badgeCount = 0,
	context = {
		appURI = v30
	}
}

if FFlagEnableBlackbird and FFlagEnableBlackbirdOnMorePage then
	t1.Blackbird = "Blackbird"
	t4[t1.Blackbird] = "CommonUI.Features.Label.X"
	t5[t1.Blackbird] = {
		isFoundationIcon = true,
		name = v28.Enums.IconName.RobloxPlus
	}
	t6[t1.Blackbird] = if GetFStringBlackbirdUrl() == "" then nil else UrlBuilder.fromString(GetFStringBlackbirdUrl())()
	t7[t1.Blackbird] = {
		itemType = t1.Blackbird,
		textKey = t4[t1.Blackbird],
		icon = t5[t1.Blackbird],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			page = AppPage.Blackbird
		}
	}
end

if FFlagAddRMTile then
	t1.RM = "RM"
	t4[t1.RM] = "CommonUI.Features.Label.RM"
	t5[t1.RM] = Images["icons/brands/moments_large"]
	t7[t1.RM] = {
		itemType = t1.RM,
		textKey = t4[t1.RM],
		icon = t5[t1.RM],
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		context = {
			appURI = v31
		}
	}
end

local function v51(p12) -- line: 863
	-- upvalues: FFlagEnableFlyoutSidePanel (copy)
	if FFlagEnableFlyoutSidePanel then
		return p12 and type(p12) == "table"
	end

	return p12 ~= false
end

return {
	ItemType = t1,
	ItemInfo = t7,
	SectionType = t2,
	GetItemsInPage = function(p13, _, _, p16, p17, _, _, _, _, _) --[[ GetItemsInPage ]] -- line: 875
		-- upvalues: v18 (copy), GetFFlagEnableGateNotificationPreferencesTab (copy), AppPage (copy), t2 (copy), t7 (copy), t1 (copy), Cryo (copy), FFlagEnableFlyoutSidePanel (copy), v51 (copy), Images (copy)
		if v18 then
			p17 = true
		end

		local v76 = not GetFFlagEnableGateNotificationPreferencesTab() or type(p16) == "table" and p16.enableNotificationPreferencesTab
		local v77 = type(p16) == "table" and (p16.hideBillingTab == nil or p16.hideBillingTab)
		local t8 = {
			[AppPage.SimplifiedMore] = {
				{
					type = t2.Navigation,
					contents = { t7[t1.About_Terms] }
				},
				{
					type = t2.Action,
					contents = { t7[t1.LogOut] }
				}
			},
			[AppPage.About] = {{
				type = t2.Navigation,
				contents = Cryo.List.filter({
					t7[t1.About_AboutUs],
					not not FFlagEnableFlyoutSidePanel and t7[t1.Blog],
					not not FFlagEnableFlyoutSidePanel and t7[t1.CreateGames],
					t7[t1.About_Careers],
					t7[t1.About_Parents],
					if not FFlagEnableFlyoutSidePanel then t7[t1.About_Terms] else nil,
					if not FFlagEnableFlyoutSidePanel then t7[t1.About_Privacy] else nil,
					t7[t1.About_AppInformation]
				}, v51)
			}},
			[AppPage.SafetySupport] = {{
				type = t2.Navigation,
				contents = if not FFlagEnableFlyoutSidePanel then {
					t7[t1.SafetySupport_Help],
					t7[t1.SafetySupport_ReportAppeals]
				} else Cryo.List.filter({
					t7[t1.SafetySupport_Help],
					t7[t1.SafetySupport_ReportAppeals],
					t7[t1.About],
					t7[t1.About_Terms],
					t7[t1.About_Privacy]
				}, v51)
			}},
			[AppPage.CJVAbout] = {{
				type = t2.Navigation,
				contents = Cryo.List.filter({
					t7[t1.About_AboutUs_CJV],
					t7[t1.About_Careers],
					t7[t1.About_Terms],
					t7[t1.About_Privacy],
					t7[t1.About_PrivacyGuidelinesChildren],
					t7[t1.About_LuobuRiderTerms],
					t7[t1.About_LuobuThirdPartyDataUse],
					t7[t1.About_AppInformation]
				}, v51)
			}},
			[AppPage.Settings] = {{
				type = t2.Navigation,
				contents = Cryo.List.filter({
					t7[t1.Settings_AccountInfo],
					t7[t1.Settings_Security],
					t7[t1.Settings_Privacy],
					not not p17 and (t7[t1.Settings_ParentalControls] or false),
					not v77 and (t7[t1.Settings_Billing] or false),
					t7[t1.Settings_Subscriptions],
					not not v76 and (t7[t1.Settings_Notifications] or false),
					t7[t1.Settings_Accessibility]
				}, v51)
			}},
			[AppPage.CJVSettings] = {{
				type = t2.Navigation,
				contents = Cryo.List.filter({
					t7[t1.Settings_AccountInfo],
					t7[t1.Settings_Security],
					t7[t1.Settings_Privacy],
					false
				}, v51)
			}},
			[AppPage.TenFootSettings] = {{
				type = t2.Content,
				contents = {
					{
						itemInfo = t7[t1.Settings_SwitchProfileSection]
					},
					{
						itemInfo = t7[t1.Settings_AccountSettingsSection],
						subItems = { t7[t1.Settings_AccountSettingsInfo] }
					},
					{
						itemInfo = t7[t1.Settings_DeviceSettingsSection]
					}
				}
			}},
			[AppPage.TenFootAbout] = {{
				type = t2.Content,
				contents = {
					{
						itemInfo = t7[t1.About_AboutSection],
						subItems = {
							t7[t1.About_TermsOfService],
							Cryo.Dictionary.join(t7[t1.About_Privacy], {
								rightImage = Images["icons/navigation/externallink_medium"]
							})
						}
					},
					{
						itemInfo = t7[t1.About_LicensingSection]
					},
					{
						itemInfo = t7[t1.About_VersionSection]
					}
				}
			}}
		}
		local v79 = t8[AppPage.SimplifiedMore]

		if t8[p13] ~= nil then
			v79 = t8[p13]
		end

		return v79
	end
}
