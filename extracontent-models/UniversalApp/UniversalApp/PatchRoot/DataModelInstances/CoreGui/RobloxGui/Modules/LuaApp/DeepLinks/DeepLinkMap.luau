local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local Workspace = game:GetService("Workspace")
local Modules = CoreGui.RobloxGui.Modules
local Cryo = require(CorePackages.Packages.Cryo)
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local GamesMultigetPlaceDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails
local default = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local AppPage = require(Modules.LuaApp.AppPage)
local AppChatNetworking = require(CorePackages.Workspace.Packages.AppChatNetworking)
local ArgCheck = require(Modules.LuaApp.ArgCheck)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Constants = require(Modules.AvatarExperience.Common.Constants)
local CreateConversation = AppChatNetworking.http.CreateConversation
local logGameDetailsDeepLinkEvent = require(script.Parent.logGameDetailsDeepLinkEvent)
local logLockScreenWidgetClicked = require(script.Parent.logLockScreenWidgetClicked)

require(Modules.LuaApp.Reducers.Navigation)

local Enums = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local SearchUuid = require(Modules.LuaApp.SearchUuid)
local ShareLinkTypes = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local TransitionAnimation = require(Modules.LuaApp.Enum.TransitionAnimation)
local UrlBase = require(Modules.LuaApp.Http.UrlBase)
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local UseGameDetailsPeekView = require(CorePackages.Workspace.Packages.GameDetail).PeekView.UseGameDetailsPeekView
local Constants2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local Utils = require(Modules.AvatarExperience.AvatarEditor.Utils)
local DeepLinkUtils = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local Constants3 = require(CorePackages.Workspace.Packages.ContactImporter).Constants
local UpsellEntrySurfaceType = require(CorePackages.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellEntrySurfaceType
local contactImporterModalInfo = require(CorePackages.Workspace.Packages.ContactImporter).Utils.contactImporterModalInfo
local ExternalWebUrlNavigationHelper = require(Modules.LuaApp.DeepLinks.Utils.ExternalWebUrlNavigationHelper)
local SortIdMapper = require(Modules.LuaApp.DeepLinks.Utils.SortIdMapper)
local HardwareSafeAreaInsets = require(CorePackages.Workspace.Packages.Responsive).HardwareSafeAreaInsets
local StreamNotificationStore = require(CorePackages.Workspace.Packages.StreamNotifications).StreamNotificationStore
local handleShareLinkRoot = require(script.Parent.ShareLinks.handleShareLinkRoot)
local handleStaticShareLink = require(script.Parent.ShareLinks.StaticLinks.handleStaticShareLink)
local handleJoinLink = require(script.Parent.ShareLinks.handleJoinLink)
local LocalPlayer = game:GetService("Players").LocalPlayer
local v41 = game:DefineFastFlag("EnablePrivacySettingsDeeplinks", false)
local v42 = game:DefineFastFlag("EnableParentalControlsDeeplinks", false)
local v43 = game:DefineFastFlag("EnableAccountInfoDeeplinks", false)

game:SetFlagVersion("EnableDevicePreferencesDeeplink", 2)

local v44 = game:DefineFastFlag("EnableDevicePreferencesDeeplink", false)
local v45 = game:DefineFastFlag("EnableSettingSubpageDeeplinks", false)
local GetFFlagEnableSecurityAlertDeeplink = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSecurityAlertDeeplink
local GetFFlagGenerateLinkWithChannel = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGenerateLinkWithChannel
local FFlagQRCodeItemRedemptionEnabled = require(Modules.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled)
local GetFFlagEnableCrossDeviceLoginUsingQRCodes = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableGiftCardsDeepLink = require(Modules.LuaApp.Flags.GetFFlagEnableGiftCardsDeepLink)
local v51 = game:DefineFastFlag("EnableBuyRobuxDeepLink", false)
local FFlagEnableCurrencyTransferDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCurrencyTransferDeepLink
local GetFFlagEnableMessagesDeepLink = require(Modules.LuaApp.Flags.GetFFlagEnableMessagesDeepLink)
local FFlagLuaAppForumsDeeplinkFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppForumsDeeplinkFix
local v55 = game:DefineFastFlag("EnableBundleItemDetailHttpLink", false)
local FFlagEnableLookDetailsDeepLink = require(Modules.LuaApp.Flags.FFlagEnableLookDetailsDeepLink)
local FFlagEnableCatalogSearchDeepLinks = require(Modules.LuaApp.Flags.FFlagEnableCatalogSearchDeepLinks)
local FFlagEnableSearchDeepLink = require(Modules.LuaApp.Flags.FFlagEnableSearchDeepLink)
local FFlagEnableProfilePictureEditorDeepLink = require(Modules.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink)
local FFlagEnableShareLinksInGameDetailEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent
local GetFFlagLuaAppFixStudioNotchSupport = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local GetFFlagUseCommunitiesTranslation = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseCommunitiesTranslation
local FFlagAXEnableCatalogCreatorHttpLink = require(Modules.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink)
local FFlagEnableSquadDeeplinkWithChatId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local FFlagLuaAppSortDeeplinkFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix
local FFlagEnableAmpWizardDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLink
local FFlagEnableFlyoutSidePanel = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagCiDeprecateFindFriendsModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal
local FFlagAXHandleTaxonomyIdsDeepLinks = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks
local FFlagEnableNotificationsDeeplink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNotificationsDeeplink
local FFlagTCParentChildAutoUpgrade = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCParentChildAutoUpgrade
local FFlagTCUnifyNavigationEntry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCUnifyNavigationEntry

game:DefineFastString("SearchDeepLinkPattern", "roblox.*://navigation/search.*")
game:DefineFastString("GamesPageDeepLinkPattern", "roblox.*://navigation/games")
game:DefineFastString("HomePageDeepLinkPattern", "roblox.*://navigation/home")
game:DefineFastString("AvatarClothingSortingView", "roblox.*://navigation/avatar_clothing_sort")
game:DefineFastString("AvatarProfilePictureEditor", "roblox.*://navigation/avatar_profile_picture_editor")
game:DefineFastString("AvatarDeepLinkPattern", "roblox.*://navigation/avatar.*")
game:DefineFastString("AvatarHttpPattern", "/my/avatar")
game:DefineFastString("MorePageDeepLinkPattern", "roblox.*://navigation/more")
game:DefineFastString("NotificationsDeepLinkPattern", "roblox.*://navigation/notifications")
game:DefineFastString("NotificationSettingsDeepLinkPattern", "roblox.*://navigation/notification_settings")
game:DefineFastString("RoactChatDeepLinkPattern", "roblox.*://navigation/chat.*")
game:DefineFastString("GameDetailsDeepLinkPattern", "roblox.*://navigation/game_details.*")
game:DefineFastString("GameDetailsHttpPattern", "/games/(%d+)/?[%w_-]*%??r?e?f?P?a?g?e?I?d?=?[%w%-]*")
game:DefineFastString("GameDetailsReferralHttpPattern", "/games/refer.*")
game:DefineFastString("ProfileCardDeepLinkPattern", "roblox.*://navigation/profile_card.*")
game:DefineFastString("ProfileTrustedFriendsDeepLinkPattern", "roblox.*://navigation/profile_trustedfriends.*")
game:DefineFastString("ProfileDeepLinkPattern", "roblox.*://navigation/profile.*")
game:DefineFastString("CatalogSearchDeepLinkPattern", "roblox.*://navigation/catalog?.+")
game:DefineFastString("CatalogEquipDeepLinkPattern", "roblox.*://navigation/catalog/equip?.+")
game:DefineFastString("CatalogDeepLinkPattern", "roblox.*://navigation/catalog")
game:DefineFastString("CatalogHttpPattern", "/catalog[^/]*")
game:DefineFastString("ItemDetailsDeepLinkPattern", "roblox.*://navigation/item_details.*")
game:DefineFastString("ItemDetailsHttpPattern", "/catalog/(%d+)/.*")
game:DefineFastString("BundleItemDetailsHttpPattern", "/bundles/(%d+)/.*")
game:DefineFastString("LookItemDetailsHttpPattern", "/looks/(%d+)/.*")
game:DefineFastString("ItemRedemptionDeepLinkPattern", "roblox.*://navigation/qr_code_redemption.*")

if v45 then
	game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends$")
else
	game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends")
end

game:DefineFastString("GiftCardsPageDeepLinkPattern", "roblox.*://navigation/gift_cards")
game:DefineFastString("BuyRobuxDeepLinkPattern", "roblox.*://navigation/buy_robux")
game:DefineFastString("CurrencyTransferDeepLinkPattern", "roblox.*://navigation/currency_transfer.*")
game:DefineFastString("GroupsDeepLinkPattern", "roblox.*://navigation/group.*")
game:DefineFastString("CrossDeviceLoginDeepLinkPattern", "roblox.*://navigation/crossdevice.*")
game:DefineFastString("EventDetailsPageDeepLinkPattern", "roblox.*://navigation/event_details.*")
game:DefineFastString("ShareLinkDeepLinkPattern", "roblox.*://navigation/share_links.*")
game:DefineFastString("StaticShareLinkDeepLinkPattern", "roblox.*://navigation/share_links/(%w)/([%w%-]+).*")
game:DefineFastString("JoinLinkHttpPattern", "/join/([%w]+).*")
game:DefineFastString("ShareLinkHttpPattern", "/share.*")
game:DefineFastString("StaticShareLinkHttpPattern", "/share/(%w)/([%w%-]+).*")
game:DefineFastString("ShortShareLinkHttpPattern", "/shortlink.*")
game:DefineFastString("ContentPostDeepLinkPattern", "roblox.*://navigation/content_post.*")
game:DefineFastString("ContactsDeepLinkPattern", "roblox.*://navigation/contacts.*")
game:DefineFastString("AppealsPortalDeepLinkPattern", "roblox.*://navigation/appeals.*")
game:DefineFastString("PrivacySettingsDeepLinkPattern", "roblox.*://navigation/privacy_settings")
game:DefineFastString("AppPermissionsSettingsDeepLinkPattern", "roblox.*://navigation/app_permissions_settings")
game:DefineFastString("ScreentimeSettingsDeepLinkPattern", "roblox.*://navigation/screentime_subsettings")
game:DefineFastString("CommunicationSettingsDeepLinkPattern", "roblox.*://navigation/communication_subsettings")
game:DefineFastString("BlockedUsersSettingsDeepLinkPattern", "roblox.*://navigation/blocked_users_subsettings")
game:DefineFastString("BlockedExpSettingsDeepLinkPattern", "roblox.*://navigation/blocked_experiences_subsettings")
game:DefineFastString("ExperienceChatSettingsDeepLinkPattern", "roblox.*://navigation/experience_chat_subsettings")
game:DefineFastString("PartySettingsDeepLinkPattern", "roblox.*://navigation/party_subsettings")
game:DefineFastString("VoiceSettingsDeepLinkPattern", "roblox.*://navigation/voice_subsettings")
game:DefineFastString("TradingInventorySettingsDeepLinkPattern", "roblox.*://navigation/trading_inventory_subsettings")
game:DefineFastString("PrivateServerSettingsDeepLinkPattern", "roblox.*://navigation/private_server_subsettings")
game:DefineFastString("FriendsContactsSettingsDeepLinkPattern", "roblox.*://navigation/friends_contacts_subsettings")
game:DefineFastString("VisibilitySettingsDeepLinkPattern", "roblox.*://navigation/visibility_subsettings")
game:DefineFastString("ParentalControlsDeepLinkPattern", "roblox.*://navigation/parental_controls")
game:DefineFastString("AccountInfoDeepLinkPattern", "roblox.*://navigation/account_info")
game:DefineFastString("SpendingSettingsDeepLinkPattern", "roblox.*://navigation/spending_settings")
game:DefineFastString("ExternalWebUrlDeepLinkPattern", "roblox.*://navigation/external_web_link.*")
game:DefineFastString("SecurityAlertDeepLinkPattern", "roblox.*://navigation/security_alert.*")
game:DefineFastString("ExperienceSortDeepLinkPattern", "roblox.*://navigation/experience_sort.*")
game:DefineFastString("SquadLobbyDeepLinkPattern", "roblox.*://navigation/party.*")
game:DefineFastString("EnterAppFromLockScreenWidget", "roblox.*://open/lock_screen_widget")
game:DefineFastString("DevicePreferencesDeepLinkPattern", "roblox.*://navigation/device_preferences")
game:DefineFastString("FAEDeepLinkPattern", "roblox.*://navigation/fae.*")
game:DefineFastString("FAEUpsellOverlayDeepLinkPattern", "roblox.*://navigation/fae_upsell_overlay.*")
game:DefineFastString("AmpWizardDeepLinkPattern", "roblox.*://navigation/amp_wizard.*")
game:DefineFastString("SystemMessageDeepLinkPattern", "roblox.*://navigation/messages.*")
game:DefineFastString("LuaExtraHttpLinkBases", "")
game:DefineFastFlag("EnableExternalWebDeeplink", false)
game:DefineFastFlag("EnableJoinLinkWebDeepLink", false)

local parts = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",")
local t1 = {}
local t2 = {
	notifstream = UpsellEntrySurfaceType.NotifStream,
	notifpush = UpsellEntrySurfaceType.NotifPush
}

local function addHttpMapping(p1, p2) -- line: 197
	-- upvalues: UrlBase (copy), t1 (copy), default (copy), parts (copy)
	for _, v in pairs({
		"www",
		"web",
		""
	}) do
		local v145 = UrlBase.new(v)
		local v146 = UrlBase.new(v, {
			secure = false
		})
		local v147 = v145 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. p1

		table.insert(t1, {
			v147,
			p2
		})

		local v148 = v147:gsub("%%", "\\")

		default:registerURL(v148)

		local v149 = v146 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. p1

		table.insert(t1, {
			v149,
			p2
		})

		local v150 = v149:gsub("%%", "\\")

		default:registerURL(v150)
	end

	for _, v in ipairs(parts) do
		local v153 = v .. p1

		table.insert(t1, {
			v153,
			p2
		})

		local v154 = v153:gsub("%%", "\\")

		default:registerURL(v154)
	end
end
local function buildHistoryFromRoute(p3) -- line: 212
	local t3 = {}

	for i = 1, #p3 do
		local t4 = {}

		for j = 1, i do
			table.insert(t4, p3[j])
		end

		table.insert(t3, t4)
	end

	return t3
end

if FFlagEnableSearchDeepLink then
	local t5 = {
		games = SearchTypes.Games,
		players = SearchTypes.Players,
		topresults = SearchTypes.TopResults
	}
	local FastString = game:GetFastString("SearchDeepLinkPattern")

	table.insert(t1, {
		FastString,
		function(p4) -- line: 231
			-- upvalues: SearchUuid (copy), t5 (copy), SearchTypes (copy), AppPage (copy)
			local v161 = SearchUuid()
			local v162 = SearchUuid()
			local v163 = p4.keyword or ""
			local v164 = t5[string.lower(p4.type or "")] or SearchTypes.Games

			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.SearchPage,
						detail = v161,
						extraProps = {
							searchKeyword = v163,
							searchType = v164,
							omniSearchInfo = {
								omniSearchUuid = v162,
								searchKeyword = v163
							}
						}
					}
				}
			}
		end
	})
	default:registerURL((FastString:gsub("%%", "\\")))
end

local FastString = game:GetFastString("GamesPageDeepLinkPattern")

table.insert(t1, {
	FastString,
	function() -- line: 260
		-- upvalues: AppPage (copy)
		return {{{
			name = AppPage.Games
		}}}
	end
})
default:registerURL((FastString:gsub("%%", "\\")))

local FastString2 = game:GetFastString("HomePageDeepLinkPattern")

table.insert(t1, {
	FastString2,
	function() -- line: 264
		-- upvalues: AppPage (copy)
		return {{{
			name = AppPage.Home
		}}}
	end
})
default:registerURL((FastString2:gsub("%%", "\\")))

local FastString3 = game:GetFastString("AvatarClothingSortingView")

table.insert(t1, {
	FastString3,
	function() -- line: 268
		-- upvalues: AvatarScreen (copy)
		return {{
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.Catalog
			},
			{
				name = AvatarScreen.LayeredClothingSort
			}
		}}
	end
})
default:registerURL((FastString3:gsub("%%", "\\")))

if FFlagEnableProfilePictureEditorDeepLink then
	local FastString4 = game:GetFastString("AvatarProfilePictureEditor")

	table.insert(t1, {
		FastString4,
		function() -- line: 279
			-- upvalues: AvatarScreen (copy)
			return {{
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog
				},
				{
					name = AvatarScreen.ProfilePictureEditorEmotes
				}
			}}
		end
	})
	default:registerURL((FastString4:gsub("%%", "\\")))
end

local FastString5 = game:GetFastString("AvatarDeepLinkPattern")

table.insert(t1, {
	FastString5,
	function(p5) -- line: 290
		-- upvalues: AvatarScreen (copy), Utils (copy), Constants2 (copy), Constants (copy), buildHistoryFromRoute (copy)
		local t6 = {
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.AvatarEditor
			}
		}

		if p5.itemtype == "character" then
			local v167, v168 = Utils.findAvatarEditorCategory(Constants2.CharacterKey, Constants2.PurchasedCharacterKey)
			local t7 = {
				itemId = p5.itemid,
				category = v167,
				subcategory = v168
			}

			table.insert(t6, {
				name = AvatarScreen.OutfitDetails,
				extraProps = t7
			})
		elseif p5.itemtype == "asset" then
			local v170, v171 = Utils.getCategoryIndicesFromAssetType(p5.itemsubtype)
			local t8 = {
				itemId = p5.itemid,
				itemType = Constants.ItemType.Asset,
				mountAsFullView = true,
				category = v170,
				subcategory = v171,
				opaquePage = AvatarScreen.AvatarEditor
			}

			table.insert(t6, {
				name = AvatarScreen.ItemDetails,
				extraProps = t8
			})
		end

		return (buildHistoryFromRoute(t6))
	end
})
default:registerURL((FastString5:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("AvatarHttpPattern"), function(_, p7) -- line: 331
	-- upvalues: Cryo (copy), AvatarScreen (copy)
	return Cryo.List.join(p7.history, {
		{{
			name = AvatarScreen.AvatarExperienceLandingPage
		}},
		{
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.AvatarEditor
			}
		}
	})
end)

local FastString6 = game:GetFastString("MorePageDeepLinkPattern")

table.insert(t1, {
	FastString6,
	function() -- line: 344
		-- upvalues: FFlagEnableFlyoutSidePanel (copy), AppPage (copy)
		return {{{
			name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
		}}}
	end
})
default:registerURL((FastString6:gsub("%%", "\\")))

local function subSettingsMapping(s1: string, s2: string) -- line: 348
	-- upvalues: FFlagEnableFlyoutSidePanel (copy), AppPage (copy), TransitionAnimation (copy)
	return {
		{{
			name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
		}},
		{
			{
				name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
			},
			{
				name = AppPage.Settings
			}
		},
		{
			{
				name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
			},
			{
				name = AppPage.Settings
			},
			{
				name = AppPage.SettingsSubPage,
				detail = s1,
				extraProps = {
					titleKey = s2,
					transitionAnimation = TransitionAnimation.None
				}
			}
		}
	}
end

local FastString7 = game:GetFastString("NotificationSettingsDeepLinkPattern")

table.insert(t1, {
	FastString7,
	function() -- line: 372
		-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
		local v177 = UrlBuilder.static.settings.notifications()

		return (subSettingsMapping(v177, "Feature.AccountSettings.Heading.Tab.Notifications"))
	end
})
default:registerURL((FastString7:gsub("%%", "\\")))

if FFlagEnableNotificationsDeeplink then
	local FastString8 = game:GetFastString("NotificationsDeepLinkPattern")

	table.insert(t1, {
		FastString8,
		function() -- line: 378
			-- upvalues: StreamNotificationStore (copy)
			StreamNotificationStore.setStreamPresented(true)

			return nil
		end
	})
	default:registerURL((FastString8:gsub("%%", "\\")))
end

local function getChatEntryPointEnum(p8) -- line: 385
	-- upvalues: ChatEntryPointNames (copy)
	if type(p8) ~= "string" then
		return ChatEntryPointNames.Unknown
	end

	for k, v in pairs(ChatEntryPointNames) do
		if string.lower(k) == string.lower(p8) then
			return v
		end
	end

	return ChatEntryPointNames.Unknown
end

local FastString9 = game:GetFastString("RoactChatDeepLinkPattern")

table.insert(t1, {
	FastString9,
	function(p9, p10) -- line: 400
		-- upvalues: getChatEntryPointEnum (copy), CreateConversation (copy), AppPage (copy)
		local t9 = {
			entryPoint = getChatEntryPointEnum(p9.entrypoint)
		}

		if p9.chatid == nil and p9.userid ~= nil then
			return CreateConversation(p10.network, "one_to_one", { p9.userid }):andThen(function(p11) -- line: 406
				-- upvalues: AppPage (copy), t9 (copy)
				local str = tostring(p11.responseBody.conversations[1].id)

				return {{{
					name = AppPage.Chat,
					detail = str,
					extraProps = t9
				}}}
			end):catch(function() -- line: 417
				-- upvalues: AppPage (copy), t9 (copy)
				return {{{
					name = AppPage.Chat,
					extraProps = t9
				}}}
			end)
		end

		return {{{
			name = AppPage.Chat,
			detail = p9.chatid,
			extraProps = t9
		}}}
	end
})
default:registerURL((FastString9:gsub("%%", "\\")))

local FastString10 = game:GetFastString("GameDetailsDeepLinkPattern")

table.insert(t1, {
	FastString10,
	function(p12) -- line: 435
		-- upvalues: AppPage (copy), FFlagEnableShareLinksInGameDetailEvent (copy), logGameDetailsDeepLinkEvent (copy), GetFFlagLuaAppFixStudioNotchSupport (copy), HardwareSafeAreaInsets (copy), Workspace (copy), UseGameDetailsPeekView (copy), ArgCheck (copy)
		local GameDetail = AppPage.GameDetail

		if FFlagEnableShareLinksInGameDetailEvent then
			logGameDetailsDeepLinkEvent(p12.gameid, "GameDetailsDeeplink", {})
		else
			logGameDetailsDeepLinkEvent(p12.gameid, "GameDetailsDeeplink")
		end

		if p12.homeroot then
			local v186 = if not GetFFlagLuaAppFixStudioNotchSupport() then Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize or Vector2.zero else HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize
			local v187 = if not (v186.Y > v186.X) or not UseGameDetailsPeekView() then AppPage.ExperienceDetail else AppPage.GameDetail

			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = v187,
						detail = ArgCheck.isNotNil(p12.gameid, "gameId"),
						extraProps = {
							mountAsFullView = false,
							mountAnimation = true
						}
					}
				}
			}
		end

		return {
			{{
				name = AppPage.Games
			}},
			{
				{
					name = AppPage.Games
				},
				{
					name = GameDetail,
					detail = ArgCheck.isNotNil(p12.gameid, "gameId"),
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false
					}
				}
			}
		}
	end
})
default:registerURL((FastString10:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("GameDetailsHttpPattern"), function(p13, p14, p15) -- line: 494
	-- upvalues: ShareLinkTypes (copy), ExperienceService (copy), AppPage (copy), GamesMultigetPlaceDetails (copy), FFlagEnableShareLinksInGameDetailEvent (copy), logGameDetailsDeepLinkEvent (copy)
	if p14.privateserverlinkcode ~= nil then
		p15.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
			placeId = p13,
			linkCode = p14.privateserverlinkcode,
			linkType = ShareLinkTypes.LongPrivateServerLink
		})
		ExperienceService:LaunchExperience({
			placeId = if type(p13) ~= "number" then tonumber(p13) else p13,
			linkCode = p14.privateserverlinkcode
		})

		return nil
	end

	local GameDetail = AppPage.GameDetail

	return GamesMultigetPlaceDetails(p15.network, p13):andThen(function(p16) -- line: 512
		-- upvalues: FFlagEnableShareLinksInGameDetailEvent (copy), logGameDetailsDeepLinkEvent (copy), AppPage (copy), GameDetail (copy)
		local str = tostring(p16.responseBody[1].universeId)

		if FFlagEnableShareLinksInGameDetailEvent then
			logGameDetailsDeepLinkEvent(str, "GameDetailsHTTPDeepLink", {})
		else
			logGameDetailsDeepLinkEvent(str, "GameDetailsHTTPDeepLink")
		end

		return {
			{{
				name = AppPage.Games
			}},
			{
				{
					name = AppPage.Games
				},
				{
					name = GameDetail,
					detail = str,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false
					}
				}
			}
		}
	end)
end)
addHttpMapping(game:GetFastString("GameDetailsReferralHttpPattern"), function(p17, p18) -- line: 541
	-- upvalues: ArgCheck (copy), AppPage (copy), GamesMultigetPlaceDetails (copy), FFlagEnableShareLinksInGameDetailEvent (copy), logGameDetailsDeepLinkEvent (copy)
	local v194 = ArgCheck.isNotNil(p17.placeid, "placeid")
	local GameDetail = AppPage.GameDetail

	return GamesMultigetPlaceDetails(p18.network, v194):andThen(function(p19) -- line: 545
		-- upvalues: FFlagEnableShareLinksInGameDetailEvent (copy), logGameDetailsDeepLinkEvent (copy), AppPage (copy), GameDetail (copy)
		local str = tostring(p19.responseBody[1].universeId)

		if FFlagEnableShareLinksInGameDetailEvent then
			logGameDetailsDeepLinkEvent(str, "GameDetailsHTTPReferralDeepLink", {})
		else
			logGameDetailsDeepLinkEvent(str, "GameDetailsHTTPReferralDeepLink")
		end

		return {
			{{
				name = AppPage.Games
			}},
			{
				{
					name = AppPage.Games
				},
				{
					name = GameDetail,
					detail = str,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false
					}
				}
			}
		}
	end)
end)

local FastString11 = game:GetFastString("ProfileCardDeepLinkPattern")

table.insert(t1, {
	FastString11,
	function(p20) -- line: 574
		-- upvalues: AppPage (copy), Enums (copy)
		local v197 = p20.userid or ""

		return {{
			{
				name = AppPage.Home
			},
			{
				name = AppPage.ProfilePlatform,
				detail = v197,
				extraProps = {
					source = Enums.Sources.ProfileDeepLink
				}
			}
		}}
	end
})
default:registerURL((FastString11:gsub("%%", "\\")))

if FFlagTCParentChildAutoUpgrade then
	local FastString12 = game:GetFastString("ProfileTrustedFriendsDeepLinkPattern")

	table.insert(t1, {
		FastString12,
		function(p21, _) -- line: 592
			-- upvalues: AppPage (copy), Enums (copy), FFlagTCUnifyNavigationEntry (copy)
			local v200 = p21.userid or ""

			return {{
				{
					name = AppPage.Home
				},
				{
					name = AppPage.ProfilePlatform,
					detail = v200,
					extraProps = {
						source = Enums.Sources.ProfileDeepLink
					}
				},
				{
					name = AppPage.TrustedContactsModal,
					props = if not FFlagTCUnifyNavigationEntry then nil else {
						userId = v200,
						source = "Deeplink_Profile_TrustedFriends"
					},
					userId = if not FFlagTCUnifyNavigationEntry then v200 else nil,
					source = not FFlagTCUnifyNavigationEntry and "Deeplink_Profile_TrustedFriends" or nil
				}
			}}
		end
	})
	default:registerURL((FastString12:gsub("%%", "\\")))
end

local FastString13 = game:GetFastString("ProfileDeepLinkPattern")

table.insert(t1, {
	FastString13,
	function(p23, p24) -- line: 621
		-- upvalues: ArgCheck (copy), UrlBuilder (copy), AppPage (copy), TransitionAnimation (copy)
		local v203 = ArgCheck.isNotNil(p23.userid, "userId")
		local friendshipsourcetype = p23.friendshipsourcetype
		local v205 = UrlBuilder.user.profile({
			userId = v203,
			sourceType = friendshipsourcetype
		})

		if friendshipsourcetype == "profileshare" then
			p24.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(v203, "playerProfile")
		end

		return {
			{{
				name = AppPage.Home
			}},
			{
				{
					name = AppPage.Home
				},
				{
					name = AppPage.GenericWebPage,
					detail = v205,
					extraProps = {
						titleKey = "CommonUI.Features.Label.Profile",
						transitionAnimation = TransitionAnimation.None
					}
				}
			}
		}
	end
})
default:registerURL((FastString13:gsub("%%", "\\")))

local FastString14 = game:GetFastString("GroupsDeepLinkPattern")

table.insert(t1, {
	FastString14,
	function(p25) -- line: 652
		-- upvalues: UrlBuilder (copy), ArgCheck (copy), FFlagLuaAppForumsDeeplinkFix (copy), AppPage (copy), GetFFlagUseCommunitiesTranslation (copy), TransitionAnimation (copy)
		local v207 = if not p25.forumcategoryid or (p25.forumcategoryid == "" or (not p25.forumpostid or (p25.forumpostid == "" or (not p25.forumcommentid or p25.forumcommentid == "")))) then UrlBuilder.user.group({
			groupId = ArgCheck.isNotNil(p25.groupid, "groupId")
		}) else UrlBuilder.user.forumComment({
			groupId = ArgCheck.isNotNil(p25.groupid, "groupId"),
			categoryId = if not FFlagLuaAppForumsDeeplinkFix then ArgCheck.isNotNil(p25.forumcategoryid, "categoryId") else "category-" .. ArgCheck.isNotNil(p25.forumcategoryid, "categoryId"),
			postId = if not FFlagLuaAppForumsDeeplinkFix then ArgCheck.isNotNil(p25.forumpostid, "postId") else "post-" .. ArgCheck.isNotNil(p25.forumpostid, "postId"),
			commentId = ArgCheck.isNotNil(p25.forumcommentid, "commentId")
		})

		return {
			{{
				name = AppPage.Home
			}},
			{
				{
					name = AppPage.Home
				},
				{
					name = AppPage.GenericWebPage,
					detail = v207,
					extraProps = {
						titleKey = not GetFFlagUseCommunitiesTranslation() and "CommonUI.Features.Label.sGroups" or "CommonUI.Features.Label.Groups",
						transitionAnimation = TransitionAnimation.None
					}
				}
			}
		}
	end
})
default:registerURL((FastString14:gsub("%%", "\\")))

local FastString15 = game:GetFastString("ContactsDeepLinkPattern")

table.insert(t1, {
	FastString15,
	function(p26, _) -- line: 697
		-- upvalues: AppPage (copy), Constants3 (copy), FFlagCiDeprecateFindFriendsModal (copy), contactImporterModalInfo (copy), AppStorageService (copy), LocalPlayer (copy)
		local v210 = if not p26.contactid or p26.contactid == "" then {
			name = if not FFlagCiDeprecateFindFriendsModal then if contactImporterModalInfo:isUserOptedInLocalStorage(AppStorageService, (not LocalPlayer or not LocalPlayer.UserId) and "" or tostring(LocalPlayer.UserId)) then AppPage.ContactsList else AppPage.ContactImporter else AppPage.ContactImporter,
			detail = "",
			extraProps = {
				isPhoneVerified = true,
				entryPoint = if not FFlagCiDeprecateFindFriendsModal then nil else p26.entryPoint
			}
		} else {
			name = AppPage.ProfilePlatform,
			detail = p26.contactid,
			extraProps = {
				profileType = Constants3.CONTACT
			}
		}

		return { if not FFlagCiDeprecateFindFriendsModal then {
			{
				name = AppPage.Home
			},
			{
				name = AppPage.AddFriendsPage
			},
			v210
		} else {
			{
				name = AppPage.Home
			},
			v210
		} }
	end
})
default:registerURL((FastString15:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("StaticShareLinkHttpPattern"), function(p28, p29, p30, p31) -- line: 745
	-- upvalues: handleStaticShareLink (copy), Cryo (copy)
	return handleStaticShareLink(p28, p29, Cryo.Dictionary.join(p30, {
		isViaAppsFlyer = false
	}), p31)
end)

local FastString16 = game:GetFastString("StaticShareLinkDeepLinkPattern")

table.insert(t1, {
	FastString16,
	function(p32, p33, p34, p35) -- line: 752
		-- upvalues: handleStaticShareLink (copy), Cryo (copy)
		return handleStaticShareLink(p32, p33, Cryo.Dictionary.join(p34, {
			isViaAppsFlyer = true
		}), p35)
	end
})
default:registerURL((FastString16:gsub("%%", "\\")))

local FastString17 = game:GetFastString("ShareLinkDeepLinkPattern")

table.insert(t1, {
	FastString17,
	function(p36, p37) -- line: 757
		-- upvalues: handleShareLinkRoot (copy), Cryo (copy)
		return handleShareLinkRoot(Cryo.Dictionary.join(p36, {
			isViaAppsFlyer = true
		}), p37)
	end
})
default:registerURL((FastString17:gsub("%%", "\\")))

local function v99(p38, p39) -- line: 761
	-- upvalues: handleShareLinkRoot (copy), Cryo (copy)
	return handleShareLinkRoot(Cryo.Dictionary.join(p38, {
		isViaAppsFlyer = false
	}), p39)
end

addHttpMapping(game:GetFastString("ShareLinkHttpPattern"), v99)
addHttpMapping(game:GetFastString("ShortShareLinkHttpPattern"), v99)

if game:GetFastFlag("EnableJoinLinkWebDeepLink") then
	addHttpMapping(game:GetFastString("JoinLinkHttpPattern"), function(p40, p41, p42) -- line: 769
		-- upvalues: handleJoinLink (copy)
		return handleJoinLink(p40, p41, p42)
	end)
end

local FastString18 = game:GetFastString("CatalogEquipDeepLinkPattern")

table.insert(t1, {
	FastString18,
	function(p43) -- line: 774
		-- upvalues: AvatarScreen (copy)
		local t10 = {
			itemId = p43.itemid,
			itemType = p43.itemtype,
			wasItemEquipped = false,
			fetchItemFailed = false
		}

		return {
			{{
				name = AvatarScreen.AvatarExperienceLandingPage
			}},
			{
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog,
					extraProps = t10
				}
			}
		}
	end
})
default:registerURL((FastString18:gsub("%%", "\\")))

if FFlagEnableCatalogSearchDeepLinks then
	local FastString19 = game:GetFastString("CatalogSearchDeepLinkPattern")

	table.insert(t1, {
		FastString19,
		function(p44) -- line: 797
			-- upvalues: AvatarScreen (copy), FFlagAXHandleTaxonomyIdsDeepLinks (copy)
			local t11 = {}
			local t12 = {{{
				name = AvatarScreen.AvatarExperienceLandingPage
			}}}

			t11.creatorName = p44.creatorname
			t11.minPrice = p44.minprice
			t11.maxPrice = p44.maxprice
			t11.salesTypeFilter = p44.salestypefilter
			t11.includeNotForSale = p44.includenotforsale
			t11.sortType = p44.sorttype
			t11.sortAggregation = p44.sortaggregation
			t11.category = p44.category
			t11.subcategory = p44.subcategory

			if FFlagAXHandleTaxonomyIdsDeepLinks then
				t11.taxonomy = p44.taxonomy
			end

			t11.keyword = p44.keyword
			t11.topics = p44.topics
			t11.wearTimeFilter = p44.wearTimeFilter

			if t11.keyword then
				table.insert(t12, {
					{
						name = AvatarScreen.AvatarExperienceLandingPage
					},
					{
						name = AvatarScreen.CatalogSearch,
						extraProps = t11
					}
				})

				return t12
			end

			table.insert(t12, {
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog,
					extraProps = t11
				}
			})

			return t12
		end
	})
	default:registerURL((FastString19:gsub("%%", "\\")))
end

local FastString20 = game:GetFastString("ExperienceSortDeepLinkPattern")

table.insert(t1, {
	FastString20,
	function(p45, ...) -- line: 844
		-- upvalues: SortIdMapper (copy), AppPage (copy), FFlagLuaAppSortDeeplinkFix (copy)
		if not p45.sortId then
			return
		end

		local v232, v233 = SortIdMapper(p45.sortId)

		return {{
			{
				name = AppPage.Home
			},
			{
				name = if not FFlagLuaAppSortDeeplinkFix then AppPage.GamesList else AppPage.DeeplinkGamesList,
				detail = v232,
				extraProps = {
					sortName = v232,
					pageContext = not FFlagLuaAppSortDeeplinkFix and "Deeplink" or nil,
					isOmni = v233,
					sortIndex = if FFlagLuaAppSortDeeplinkFix or not v233 then nil else 1
				}
			}
		}}
	end
})
default:registerURL((FastString20:gsub("%%", "\\")))

local FastString21 = game:GetFastString("CatalogDeepLinkPattern")

table.insert(t1, {
	FastString21,
	function() -- line: 868
		-- upvalues: AvatarScreen (copy)
		return {
			{{
				name = AvatarScreen.AvatarExperienceLandingPage
			}},
			{
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog
				}
			}
		}
	end
})
default:registerURL((FastString21:gsub("%%", "\\")))

local FastString22 = game:GetFastString("ItemDetailsDeepLinkPattern")

table.insert(t1, {
	FastString22,
	function(p46) -- line: 880
		-- upvalues: ArgCheck (copy), Constants (copy), AvatarScreen (copy), FFlagEnableLookDetailsDeepLink (copy)
		local v235 = ArgCheck.isNotNil(p46.itemid, "itemId")
		local v236 = ArgCheck.isNotNil(p46.itemtype, "itemType")
		local v237 = nil

		for _, v in pairs(Constants.ItemType) do
			if string.lower(v236) == string.lower(v) then
				v237 = v

				break
			end
		end

		local t13 = {
			{{
				name = AvatarScreen.AvatarExperienceLandingPage
			}},
			{
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog
				}
			}
		}
		local v241 = tostring(v237) .. tostring(v235)
		local ItemDetails = AvatarScreen.ItemDetails

		if FFlagEnableLookDetailsDeepLink and v237 == Constants.ItemType.Look then
			ItemDetails = AvatarScreen.LookDetails
		end

		local t14 = {
			name = ItemDetails,
			detail = v241,
			extraProps = {
				itemId = v235,
				itemType = v237,
				mountAsFullView = true,
				mountAnimation = false
			}
		}

		if v237 ~= nil then
			table.insert(t13, {
				{
					name = AvatarScreen.AvatarExperienceLandingPage
				},
				{
					name = AvatarScreen.Catalog
				},
				t14
			})
		end

		return t13
	end
})
default:registerURL((FastString22:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("ItemDetailsHttpPattern"), function(p47, _, p49) -- line: 931
	-- upvalues: Constants (copy), Cryo (copy), AvatarScreen (copy)
	local Asset = Constants.ItemType.Asset
	local v248 = Asset .. p47

	return Cryo.List.join(p49.history, {{
		{
			name = AvatarScreen.AvatarExperienceLandingPage
		},
		{
			name = AvatarScreen.Catalog
		}
	}}, {{
		{
			name = AvatarScreen.AvatarExperienceLandingPage
		},
		{
			name = AvatarScreen.Catalog
		},
		{
			name = AvatarScreen.ItemDetails,
			detail = v248,
			extraProps = {
				itemId = p47,
				itemType = Asset,
				mountAsFullView = true,
				mountAnimation = false
			}
		}
	}})
end)

if v55 then
	addHttpMapping(game:GetFastString("BundleItemDetailsHttpPattern"), function(p50, _, p52) -- line: 966
		-- upvalues: Constants (copy), Cryo (copy), AvatarScreen (copy)
		local Bundle = Constants.ItemType.Bundle
		local v253 = Bundle .. p50
		local history = p52.history

		return Cryo.List.join(history, {{
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.Catalog
			},
			{
				name = AvatarScreen.ItemDetails,
				detail = v253,
				extraProps = {
					itemId = p50,
					itemType = Bundle,
					mountAsFullView = true,
					mountAnimation = false
				}
			}
		}})
	end)
end

if FFlagEnableLookDetailsDeepLink then
	addHttpMapping(game:GetFastString("LookItemDetailsHttpPattern"), function(p53, _, p55) -- line: 993
		-- upvalues: Constants (copy), Cryo (copy), AvatarScreen (copy)
		local v258 = Constants.ItemType.Look .. p53
		local history = p55.history

		return Cryo.List.join(history, {{
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.Catalog
			},
			{
				name = AvatarScreen.LookDetails,
				detail = v258,
				extraProps = {
					itemId = p53,
					mountAsFullView = true
				}
			}
		}})
	end)
end

if FFlagQRCodeItemRedemptionEnabled then
	local FastString23 = game:GetFastString("ItemRedemptionDeepLinkPattern")

	table.insert(t1, {
		FastString23,
		function(p56) -- line: 1019
			-- upvalues: ArgCheck (copy), Constants (copy), AvatarScreen (copy)
			local v261 = ArgCheck.isNotNil(p56.itemid, "itemId")
			local v262 = ArgCheck.isNotNil(p56.itemtype, "itemType")
			local v263 = nil

			for _, v in pairs(Constants.ItemType) do
				if string.lower(v262) == string.lower(v) then
					v263 = v

					break
				end
			end

			local t15 = {
				{{
					name = AvatarScreen.AvatarExperienceLandingPage
				}},
				{
					{
						name = AvatarScreen.AvatarExperienceLandingPage
					},
					{
						name = AvatarScreen.Catalog
					}
				}
			}
			local v267 = tostring(v263) .. tostring(v261)
			local t16 = {
				name = AvatarScreen.ItemDetails,
				detail = v267,
				extraProps = {
					itemId = v261,
					itemType = v263,
					mountAsFullView = true,
					mountAnimation = false,
					redeemQRCodeItem = true
				}
			}

			if v263 ~= nil then
				table.insert(t15, {
					{
						name = AvatarScreen.AvatarExperienceLandingPage
					},
					{
						name = AvatarScreen.Catalog
					},
					t16
				})
			end

			return t15
		end
	})
	default:registerURL((FastString23:gsub("%%", "\\")))
end

addHttpMapping(game:GetFastString("CatalogHttpPattern"), function(p57, p58) -- line: 1067
	-- upvalues: FFlagAXEnableCatalogCreatorHttpLink (copy), Cryo (copy), AvatarScreen (copy), DeepLinkUtils (copy)
	if FFlagAXEnableCatalogCreatorHttpLink then
		return Cryo.List.join(p58.history, {{
			{
				name = AvatarScreen.AvatarExperienceLandingPage
			},
			{
				name = AvatarScreen.Catalog,
				extraProps = DeepLinkUtils.convertCatalogSearchParamsV1ToV2(p57)
			}
		}})
	end

	return Cryo.List.join(p58.history, {{
		{
			name = AvatarScreen.AvatarExperienceLandingPage
		},
		{
			name = AvatarScreen.Catalog
		}
	}})
end)

local FastString24 = game:GetFastString("FriendsPageDeepLinkPattern")

table.insert(t1, {
	FastString24,
	function() -- line: 1091
		-- upvalues: AppPage (copy)
		return {
			{{
				name = AppPage.Home
			}},
			{
				{
					name = AppPage.Home
				},
				{
					name = AppPage.ViewFriends
				}
			}
		}
	end
})
default:registerURL((FastString24:gsub("%%", "\\")))

if v51 then
	local FastString25 = game:GetFastString("BuyRobuxDeepLinkPattern")

	table.insert(t1, {
		FastString25,
		function(p59) -- line: 1104
			-- upvalues: AppPage (copy)
			local t17 = {}

			if p59.analyticid and p59.analyticid ~= "" then
				t17.analyticId = p59.analyticid
			end

			if p59.product_id and p59.product_id ~= "" then
				t17.productId = p59.product_id
			end

			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.PurchaseRobux,
						extraProps = if not next(t17) then nil else t17
					}
				}
			}
		end
	})
	default:registerURL((FastString25:gsub("%%", "\\")))
end

if GetFFlagEnableGiftCardsDeepLink() then
	local FastString26 = game:GetFastString("GiftCardsPageDeepLinkPattern")

	table.insert(t1, {
		FastString26,
		function() -- line: 1128
			-- upvalues: AppPage (copy), UrlBuilder (copy), TransitionAnimation (copy)
			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.static.giftCards(),
						extraProps = {
							titleKey = "CommonUI.Features.Label.GiftCards",
							transitionAnimation = TransitionAnimation.None
						}
					}
				}
			}
		end
	})
	default:registerURL((FastString26:gsub("%%", "\\")))
end

if FFlagEnableCurrencyTransferDeepLink then
	local FastString27 = game:GetFastString("CurrencyTransferDeepLinkPattern")

	table.insert(t1, {
		FastString27,
		function(p60, _) --[[ handleCurrencyTransferLink ]] -- line: 1151
			-- upvalues: AppPage (copy)
			local direction = p60.direction

			if not direction or direction ~= "send" and direction ~= "receive" then
				return nil
			end

			if direction == "send" then
				if not p60.userid or p60.userid == "" then
					return nil
				end
			elseif not p60.transferrequestid or p60.transferrequestid == "" then
				return nil
			end

			local t18 = {
				direction = direction
			}

			if direction == "send" then
				t18.recipientUserId = p60.userid

				if p60.transferorigination then
					t18.transferOrigination = p60.transferorigination
				end
			else
				t18.transferId = p60.transferrequestid
			end

			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.TransferRobuxFlow,
						extraProps = t18
					}
				}
			}
		end
	})
	default:registerURL((FastString27:gsub("%%", "\\")))
end

if GetFFlagEnableMessagesDeepLink() then
	local FastString28 = game:GetFastString("SystemMessageDeepLinkPattern")

	table.insert(t1, {
		FastString28,
		function() -- line: 1196
			-- upvalues: AppPage (copy), UrlBuilder (copy), TransitionAnimation (copy)
			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.static.messages(),
						extraProps = {
							titleKey = "CommonUI.Features.Label.Messages",
							transitionAnimation = TransitionAnimation.None
						}
					}
				}
			}
		end
	})
	default:registerURL((FastString28:gsub("%%", "\\")))
end

if game:GetFastFlag("EnableExternalWebDeeplink") then
	local FastString29 = game:GetFastString("ExternalWebUrlDeepLinkPattern")

	table.insert(t1, {
		FastString29,
		function(p62) -- line: 1217
			-- upvalues: ExternalWebUrlNavigationHelper (copy), AppPage (copy), TransitionAnimation (copy)
			local v278 = nil
			local v279 = nil

			if p62.domain == ExternalWebUrlNavigationHelper.ExternalWebDomainEnum.Zendesk then
				v278 = ExternalWebUrlNavigationHelper.getZendeskUrl(p62)
				v279 = ExternalWebUrlNavigationHelper.getZendeskWebViewTitleKey(p62.type)
			end

			if not v278 then
				return nil
			end

			return {
				{{
					name = AppPage.Home
				}},
				{
					{
						name = AppPage.Home
					},
					{
						name = AppPage.GenericWebPage,
						detail = v278,
						extraProps = {
							titleKey = v279,
							transitionAnimation = TransitionAnimation.None
						}
					}
				}
			}
		end
	})
	default:registerURL((FastString29:gsub("%%", "\\")))
end

if GetFFlagEnableCrossDeviceLoginUsingQRCodes() then
	local FastString30 = game:GetFastString("CrossDeviceLoginDeepLinkPattern")

	table.insert(t1, {
		FastString30,
		function(p63) -- line: 1252
			-- upvalues: ArgCheck (copy), FFlagEnableFlyoutSidePanel (copy), AppPage (copy)
			local v281 = ArgCheck.isNotNil(p63.code, "code")
			local source = p63.source

			return {{
				{
					name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
				},
				{
					name = AppPage.CrossDeviceLogin,
					extraProps = {
						code = v281,
						source = source
					}
				}
			}}
		end
	})
	default:registerURL((FastString30:gsub("%%", "\\")))
end

local FastString31 = game:GetFastString("EventDetailsPageDeepLinkPattern")

table.insert(t1, {
	FastString31,
	function(p64) -- line: 1271
		-- upvalues: AppPage (copy), ArgCheck (copy)
		return {
			{{
				name = AppPage.Home
			}},
			{
				{
					name = AppPage.Home
				},
				{
					name = AppPage.EventDetails,
					detail = ArgCheck.isNotNil(p64.eventid, "eventid")
				}
			}
		}
	end
})
default:registerURL((FastString31:gsub("%%", "\\")))

local FastString32 = game:GetFastString("AppealsPortalDeepLinkPattern")

table.insert(t1, {
	FastString32,
	function(p65) -- line: 1286
		-- upvalues: FFlagEnableFlyoutSidePanel (copy), AppPage (copy), UrlBuilder (copy)
		return {{
			{
				name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
			},
			{
				name = AppPage.GenericWebPage,
				detail = if not p65.vid then UrlBuilder.static.appealsPortal.main({
					source = "deeplink"
				}) else UrlBuilder.static.appealsPortal.violation({
					id = p65.vid,
					source = "deeplink"
				}),
				extraProps = {
					titleKey = "Feature.AppealsPortal.Label.ReportAndAppeals"
				}
			}
		}}
	end
})
default:registerURL((FastString32:gsub("%%", "\\")))

if v41 then
	local FastString33 = game:GetFastString("PrivacySettingsDeepLinkPattern")

	table.insert(t1, {
		FastString33,
		function() -- line: 1307
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v285 = UrlBuilder.static.settings.privacy()

			return (subSettingsMapping(v285, "Feature.AccountSettings.Heading.Tab.Privacy"))
		end
	})
	default:registerURL((FastString33:gsub("%%", "\\")))
end

if v45 then
	local FastString34 = game:GetFastString("AppPermissionsSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString34,
		function() -- line: 1314
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v286 = UrlBuilder.static.settings.appPermissions()

			return (subSettingsMapping(v286, "Feature.AccountSettings.Heading.Tab.AppPermissions"))
		end
	})
	default:registerURL((FastString34:gsub("%%", "\\")))

	local FastString35 = game:GetFastString("ScreentimeSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString35,
		function() -- line: 1319
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v287 = UrlBuilder.static.settings.screentimeSettings()

			return (subSettingsMapping(v287, "Feature.AccountSettings.Heading.ScreenTime"))
		end
	})
	default:registerURL((FastString35:gsub("%%", "\\")))

	local FastString36 = game:GetFastString("CommunicationSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString36,
		function() -- line: 1323
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v288 = UrlBuilder.static.settings.communicationSettings()

			return (subSettingsMapping(v288, "Feature.AccountSettings.Heading.Communications"))
		end
	})
	default:registerURL((FastString36:gsub("%%", "\\")))

	local FastString37 = game:GetFastString("BlockedUsersSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString37,
		function() -- line: 1328
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v289 = UrlBuilder.static.settings.blockedUsersSettings()

			return (subSettingsMapping(v289, "Feature.AccountSettings.Heading.BlockedUsersV2"))
		end
	})
	default:registerURL((FastString37:gsub("%%", "\\")))

	local FastString38 = game:GetFastString("BlockedExpSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString38,
		function() -- line: 1333
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v290 = UrlBuilder.static.settings.blockedExperiencesSettings()

			return (subSettingsMapping(v290, "Feature.AccountSettings.Heading.BlockedExperiences"))
		end
	})
	default:registerURL((FastString38:gsub("%%", "\\")))

	local FastString39 = game:GetFastString("ExperienceChatSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString39,
		function() -- line: 1338
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v291 = UrlBuilder.static.settings.experienceChatSettings()

			return (subSettingsMapping(v291, "Feature.AccountSettings.Heading.ExperienceChat"))
		end
	})
	default:registerURL((FastString39:gsub("%%", "\\")))

	local FastString40 = game:GetFastString("PartySettingsDeepLinkPattern")

	table.insert(t1, {
		FastString40,
		function() -- line: 1343
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v292 = UrlBuilder.static.settings.partySettings()

			return (subSettingsMapping(v292, "Feature.AccountSettings.Label.Party"))
		end
	})
	default:registerURL((FastString40:gsub("%%", "\\")))

	local FastString41 = game:GetFastString("VoiceSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString41,
		function() -- line: 1348
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v293 = UrlBuilder.static.settings.voiceSettings()

			return (subSettingsMapping(v293, "Feature.AccountSettings.Heading.VoiceChat"))
		end
	})
	default:registerURL((FastString41:gsub("%%", "\\")))

	local FastString42 = game:GetFastString("TradingInventorySettingsDeepLinkPattern")

	table.insert(t1, {
		FastString42,
		function() -- line: 1353
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v294 = UrlBuilder.static.settings.tradingInventorySettings()

			return (subSettingsMapping(v294, "Feature.AccountSettings.Heading.TradingAndInventory"))
		end
	})
	default:registerURL((FastString42:gsub("%%", "\\")))

	local FastString43 = game:GetFastString("FriendsContactsSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString43,
		function() -- line: 1358
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v295 = UrlBuilder.static.settings.friendsContactsSettings()

			return (subSettingsMapping(v295, "Feature.AccountSettings.Heading.FriendsAndContacts"))
		end
	})
	default:registerURL((FastString43:gsub("%%", "\\")))

	local FastString44 = game:GetFastString("PrivateServerSettingsDeepLinkPattern")

	table.insert(t1, {
		FastString44,
		function() -- line: 1363
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v296 = UrlBuilder.static.settings.privateServerSettings()

			return (subSettingsMapping(v296, "Feature.AccountSettings.Heading.PrivateServers"))
		end
	})
	default:registerURL((FastString44:gsub("%%", "\\")))

	local FastString45 = game:GetFastString("VisibilitySettingsDeepLinkPattern")

	table.insert(t1, {
		FastString45,
		function() -- line: 1368
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v297 = UrlBuilder.static.settings.visibilitySettings()

			return (subSettingsMapping(v297, "Feature.AccountSettings.Heading.Visibility"))
		end
	})
	default:registerURL((FastString45:gsub("%%", "\\")))
end

if v42 then
	local FastString46 = game:GetFastString("ParentalControlsDeepLinkPattern")

	table.insert(t1, {
		FastString46,
		function() -- line: 1375
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v298 = UrlBuilder.static.settings.parentalControls()

			return (subSettingsMapping(v298, "Feature.AccountSettings.Heading.Tab.ParentalControls"))
		end
	})
	default:registerURL((FastString46:gsub("%%", "\\")))
end

if v43 then
	local FastString47 = game:GetFastString("AccountInfoDeepLinkPattern")

	table.insert(t1, {
		FastString47,
		function() -- line: 1382
			-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
			local v299 = UrlBuilder.static.settings.account()

			return (subSettingsMapping(v299, "Feature.AccountSettings.Heading.Tab.AccountInfo"))
		end
	})
	default:registerURL((FastString47:gsub("%%", "\\")))
end

local FastString48 = game:GetFastString("SpendingSettingsDeepLinkPattern")

table.insert(t1, {
	FastString48,
	function() -- line: 1388
		-- upvalues: UrlBuilder (copy), subSettingsMapping (copy)
		local v300 = UrlBuilder.static.settings.billing()

		return (subSettingsMapping(v300, "Feature.AccountSettings.Heading.Tab.Billing"))
	end
})
default:registerURL((FastString48:gsub("%%", "\\")))

if v44 then
	local FastString49 = game:GetFastString("DevicePreferencesDeepLinkPattern")

	table.insert(t1, {
		FastString49,
		function() -- line: 1394
			-- upvalues: FFlagEnableFlyoutSidePanel (copy), AppPage (copy)
			return {{
				{
					name = if not FFlagEnableFlyoutSidePanel then AppPage.More else AppPage.Home
				},
				{
					name = AppPage.Settings
				},
				{
					name = AppPage.Accessibility
				}
			}}
		end
	})
	default:registerURL((FastString49:gsub("%%", "\\")))
end

if GetFFlagEnableSecurityAlertDeeplink() then
	local FastString50 = game:GetFastString("SecurityAlertDeepLinkPattern")

	table.insert(t1, {
		FastString50,
		function(p66, _) -- line: 1406
			-- upvalues: GetFFlagGenerateLinkWithChannel (copy), UrlBuilder (copy), AppPage (copy), TransitionAnimation (copy)
			if p66.payload and (p66.payload ~= "" and p66.username and p66.username ~= "") then
				local v303 = if not GetFFlagGenerateLinkWithChannel() then UrlBuilder.static.securityAlert({
					payload = p66.payload,
					username = p66.username
				}) else UrlBuilder.static.securityAlertWithChannel({
					payload = p66.payload,
					username = p66.username,
					channel = p66.channel or ""
				})

				return {
					{{
						name = AppPage.Home
					}},
					{
						{
							name = AppPage.Home
						},
						{
							name = AppPage.SecurityAlertInfo,
							detail = v303,
							extraProps = {
								transitionAnimation = TransitionAnimation.None
							}
						}
					}
				}
			end

			return {{{
				name = AppPage.Home
			}}}
		end
	})
	default:registerURL((FastString50:gsub("%%", "\\")))
end

local FastString51 = game:GetFastString("SquadLobbyDeepLinkPattern")

table.insert(t1, {
	FastString51,
	function(p68, _) -- line: 1447
		-- upvalues: ArgCheck (copy), AppPage (copy), FFlagEnableSquadDeeplinkWithChatId (copy)
		local v306 = ArgCheck.isNotNil(p68.partyid, "partyId")

		return {{{
			name = AppPage.SquadLobby,
			detail = v306,
			extraProps = if not FFlagEnableSquadDeeplinkWithChatId then nil else {
				conversationId = p68.chatid
			}
		}}}
	end
})
default:registerURL((FastString51:gsub("%%", "\\")))

local FastString52 = game:GetFastString("FAEUpsellOverlayDeepLinkPattern")

table.insert(t1, {
	FastString52,
	function(p70) -- line: 1463
		-- upvalues: ArgCheck (copy), t2 (copy), AppPage (copy)
		local v308 = t2[ArgCheck.isNotNil(p70.source, "source")] or ""
		local v309 = p70.is_phase2 == "true"

		return {{{
			name = AppPage.FAEUpsellOverlay,
			extraProps = {
				source = v308,
				isPhase2 = v309
			}
		}}}
	end
})
default:registerURL((FastString52:gsub("%%", "\\")))

local FastString53 = game:GetFastString("FAEDeepLinkPattern")

table.insert(t1, {
	FastString53,
	function(p71) -- line: 1481
		-- upvalues: ArgCheck (copy), t2 (copy), AppPage (copy)
		local v311 = t2[ArgCheck.isNotNil(p71.source, "source")] or ""

		return {{{
			name = AppPage.FAE,
			extraProps = {
				source = v311
			}
		}}}
	end
})
default:registerURL((FastString53:gsub("%%", "\\")))

if FFlagEnableAmpWizardDeepLink then
	local FastString54 = game:GetFastString("AmpWizardDeepLinkPattern")

	table.insert(t1, {
		FastString54,
		function(p72) -- line: 1493
			-- upvalues: ArgCheck (copy), AppPage (copy)
			local v313 = ArgCheck.isNotNil(p72.feature_name, "feature_name")

			return {{{
				name = AppPage.AmpWizardContainer,
				extraProps = {
					featureName = v313,
					nameSpace = p72.namespace,
					entryPointEventCtx = p72.entry_point,
					returnPage = p72.returnpage
				}
			}}}
		end
	})
	default:registerURL((FastString54:gsub("%%", "\\")))
end

local FastString55 = game:GetFastString("EnterAppFromLockScreenWidget")

table.insert(t1, {
	FastString55,
	function(_, _) -- line: 1512
		-- upvalues: logLockScreenWidgetClicked (copy)
		logLockScreenWidgetClicked("Default")

		return nil
	end
})
default:registerURL((FastString55:gsub("%%", "\\")))

return t1
