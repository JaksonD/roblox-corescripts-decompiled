local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local React = require(CorePackages.Packages.React)
local NavigationRodux = require(CorePackages.Workspace.Packages.NavigationRodux)
local Selectors = NavigationRodux.Selectors
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SocialLuaAnalytics = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local PeekView = require(CorePackages.Workspace.Packages.PeekView)
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local UserProfiles = require(CorePackages.Workspace.Packages.UserProfiles)
local ProfilePlatformNavigator = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfilePlatformNavigator)
local ProfileWrapperContext = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local Container = require(Modules.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container)
local isRootRouteInRN = require(Modules.LuaApp.Navigation.isRootRouteInRN)
local NavigateDown = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateDownTo3DQRCodePage = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local AppPage = require(Modules.LuaApp.AppPage)
local BrowserServiceWrapper = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local dependencyArray = RoactUtils.Hooks.dependencyArray
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local HttpService = game:GetService("HttpService")
local Enums = require(CorePackages.Workspace.Packages.FriendsNetworking).Enums
local ProfileTypes = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local Contexts = SocialLuaAnalytics.Analytics.Enums.Contexts
local useNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local NavigateBack = NavigationRodux.Thunks.NavigateBack
local DefaultAnalyticsService = SocialLuaAnalytics.Analytics.DefaultAnalyticsService
local peekViewDismissedEvent = PeekView.analytics.peekViewDismissedEvent
local Constants = require(Modules.AvatarExperience.Common.Constants)
local OpenAppItemDetails = require(Modules.AvatarExperience.Common.Thunks.OpenAppItemDetails)
local UpdateAvatarEquips = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips)
local LuaSocialLibrariesDeps = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local OpenCentralOverlayForLeaveRobloxAlert = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local getDeepValue = LuaSocialLibrariesDeps.SocialLibraries.config({}).Dictionary.getDeepValue
local FFlagProfilePlatformEnableStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformEnableImpressions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableImpressions
local NavigateToSearch = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local SetCreatorFilter = require(Modules.AvatarExperience.Catalog.Actions.SetCreatorFilter)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddSocialLinksToCommunityProfile = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagEnablePlatformProfileContextualMenuOption = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagAddIEMProfilePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformEnableEditAppearanceMenu = require(CorePackages.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableCurrencyTransfer = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagSocialEnableProfileInspectAndBuy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local FFlagAXFixPurchaseSurfaceLogging = SharedFlags.FFlagAXFixPurchaseSurfaceLogging
local Utils = require(Modules.AvatarExperience.Common.Utils)
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local FFlagUseNavigationSelectors = SharedFlags.FFlagUseNavigationSelectors
local AvatarEditorCategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories
local FFlagEnableMobileGameJoinCard = SharedFlags.FFlagEnableMobileGameJoinCard

local function v58(p1) -- line: 73
	-- upvalues: useDispatch (copy), useNavigation (copy), useRoactService (copy), Analytics (copy), useNavigationProps (copy), FFlagEnableMobileGameJoinCard (copy), Enums (copy), useSelector (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), getDeepValue (copy), FFlagEnablePlatformProfileContextualMenuOption (copy), UserProfiles (copy), ProfileTypes (copy), FFlagProfilePlatformEnableImpressions (copy), React (copy), HttpService (copy), NavigateDownTo3DQRCodePage (copy), Contexts (copy), peekViewDismissedEvent (copy), DefaultAnalyticsService (copy), NavigateBack (copy), OpenAppItemDetails (copy), Constants (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy), FFlagProfilePlatformEnableStore (copy), SetCreatorFilter (copy), NavigateToSearch (copy), FFlagAddIEMProfilePage (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), AvatarScreen (copy), Utils (copy), AvatarEditorCategories (copy), NavigateDown (copy), AppPage (copy), BrowserServiceWrapper (copy), FFlagAddSocialLinksToCommunityProfile (copy), OpenCentralOverlayForLeaveRobloxAlert (copy), CloseCentralOverlay (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagSocialEnableProfileInspectAndBuy (copy), UpdateAvatarEquips (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), ProfileWrapperContext (copy), ProfilePlatformNavigator (copy), Container (copy), isRootRouteInRN (copy)
	local v61 = useDispatch()
	local v62 = useNavigation()
	local v63 = useRoactService(Analytics)
	local v64 = useNavigationProps(function(p2, p3) -- line: 78
		-- upvalues: FFlagEnableMobileGameJoinCard (copy)
		return {
			profileId = p2,
			profileType = p3.profileType,
			absolutePosition = p3.absolutePosition,
			source = p3.source,
			contextualInfoType = p3.contextualInfoType,
			contextualInfoDisplay = p3.contextualInfoDisplay,
			profileUserNickname = p3.profileUserNickname,
			sessionIdOverride = p3.sessionIdOverride,
			isRecommendation = p3.isRecommendation,
			recommendationContextType = p3.recommendationContextType,
			recommendationSessionId = p3.recommendationSessionId,
			recommendationRank = p3.recommendationRank,
			offNetworkFriendRequestToken = p3.offNetworkFriendRequestToken,
			shareLinkId = p3.shareLinkId,
			friendshipOriginSourceType = p3.friendshipOriginSourceType,
			initialPresence = p3.initialPresence,
			mountAsFullView = if not FFlagEnableMobileGameJoinCard then nil else p3.mountAsFullView
		}
	end)
	local u65 = Enums.FriendshipOriginSourceType.UserProfile.rawValue()

	if v64.source == "playerSearch" then
		u65 = Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
	elseif v64.isRecommendation then
		u65 = Enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
	elseif v64.friendshipOriginSourceType then
		u65 = v64.friendshipOriginSourceType
	end

	local v66 = useSelector(function(p4) -- line: 109
		-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), getDeepValue (copy)
		if FFlagUseNavigationSelectors then
			return Selectors.selectCurrentPageName(p4)
		end

		local v77 = getDeepValue(p4, "Navigation.history") or {}

		return ((v77[#v77] or {})[#v77] or {}).name
	end)
	local v67 = if not FFlagEnablePlatformProfileContextualMenuOption then nil else UserProfiles.Hooks.useUserProfilesFetch({
		userIds = { v64.profileId },
		query = UserProfiles.Queries.userProfilesPlatformProfileIdsByUserIds
	})
	local v68 = if not FFlagEnablePlatformProfileContextualMenuOption or not v67.data then nil else UserProfiles.Selectors.getPlatformProfileIdFromId(v67.data, v64.profileId)
	local str = tostring(v64.profileId)
	local v70 = v64.profileType or ProfileTypes.User
	local v71 = if not FFlagProfilePlatformEnableImpressions then nil else React.useMemo(function() -- line: 134
		-- upvalues: v64 (copy), HttpService (copy)
		return v64.sessionIdOverride or HttpService:GenerateGUID(false)
	end, { v64.sessionIdOverride })
	local v72 = React.useMemo(function() -- line: 142
		-- upvalues: v61 (copy), NavigateDownTo3DQRCodePage (copy), Contexts (copy), peekViewDismissedEvent (copy), DefaultAnalyticsService (copy), v66 (copy), NavigateBack (copy), OpenAppItemDetails (copy), Constants (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy), FFlagProfilePlatformEnableStore (copy), SetCreatorFilter (copy), NavigateToSearch (copy), v62 (copy), FFlagAddIEMProfilePage (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), AvatarScreen (copy), Utils (copy), AvatarEditorCategories (copy), NavigateDown (copy), AppPage (copy), BrowserServiceWrapper (copy), FFlagAddSocialLinksToCommunityProfile (copy), OpenCentralOverlayForLeaveRobloxAlert (copy), CloseCentralOverlay (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), v63 (copy), FFlagSocialEnableProfileInspectAndBuy (copy), UpdateAvatarEquips (copy), v64 (copy), u65 (ref), FFlagProfilePlatformEnableImpressions (copy), v71 (copy), str (copy), v68 (copy), v70 (copy), FFlagEnableMobileGameJoinCard (copy)
		return {
			navigateTo = {
				qRCodePage = function() --[[ qRCodePage ]] -- line: 145
					-- upvalues: v61 (copy), NavigateDownTo3DQRCodePage (copy), Contexts (copy)
					v61(NavigateDownTo3DQRCodePage({
						source = Contexts.ProfileCard
					}))
				end,
				previousView = function(b1: boolean?) --[[ previousView ]] -- line: 150
					-- upvalues: peekViewDismissedEvent (copy), DefaultAnalyticsService (copy), v66 (copy), v61 (copy), NavigateBack (copy)
					if b1 then
						peekViewDismissedEvent.logEvent(DefaultAnalyticsService.EventStream, "ProfilePeekView", {
							dismissMethod = peekViewDismissedEvent.dismissMethodEnum.topBarTap,
							page = v66
						})
					end

					local v79 = not b1 or nil

					v61(NavigateBack(v79))
				end,
				itemDetails = function(s1: string) --[[ itemDetails ]] -- line: 162
					-- upvalues: v61 (copy), OpenAppItemDetails (copy), Constants (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy)
					v61(OpenAppItemDetails(s1, Constants.ItemType.Asset, nil, not not FFlagAXFixPurchaseSurfaceLogging or nil, if not FFlagAXFixPurchaseSurfaceLogging then nil else ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE))
				end,
				itemOrBundleDetails = if not FFlagProfilePlatformEnableStore then nil else function(s2: string, s3: string) -- line: 176
					-- upvalues: v61 (copy), OpenAppItemDetails (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy)
					v61(OpenAppItemDetails(s2, s3, nil, not not FFlagAXFixPurchaseSurfaceLogging or nil, if not FFlagAXFixPurchaseSurfaceLogging then nil else ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE))
				end,
				catalogSearch = if not FFlagProfilePlatformEnableStore then nil else function(s4: string) -- line: 191
					-- upvalues: v61 (copy), SetCreatorFilter (copy), NavigateToSearch (copy), v62 (copy)
					v61(SetCreatorFilter(s4))
					v61(NavigateToSearch(v62, {}))
				end,
				inspectAvatar = if not FFlagAddIEMProfilePage then nil else function() -- line: 196
				end,
				editAvatar = function() --[[ editAvatar ]] -- line: 197
					-- upvalues: FFlagProfilePlatformEnableEditAppearanceMenu (copy), v62 (copy), AvatarScreen (copy)
					if FFlagProfilePlatformEnableEditAppearanceMenu then
						v62.navigate(AvatarScreen.Catalog)

						return
					end

					v62.navigate(AvatarScreen.AvatarEditor)
				end,
				editEmotes = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else function() -- line: 205
					-- upvalues: Utils (copy), AvatarEditorCategories (copy), v62 (copy), AvatarScreen (copy)
					local v84 = Utils.resolveEditorCategory(AvatarEditorCategories.Emotes)

					v62.navigate(AvatarScreen.AvatarEditor, {
						category = v84
					})
				end,
				switchAvatar = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else function() -- line: 212
					-- upvalues: Utils (copy), AvatarEditorCategories (copy), v62 (copy), AvatarScreen (copy)
					local v85 = Utils.resolveEditorCategory(AvatarEditorCategories.Avatars)

					v62.navigate(AvatarScreen.AvatarEditor, {
						category = v85
					})
				end,
				editUsername = function(t1: {[any]: any}) --[[ editUsername ]] -- line: 218
					-- upvalues: v61 (copy), NavigateDown (copy), AppPage (copy), BrowserServiceWrapper (copy)
					v61(NavigateDown({
						name = AppPage.EditUsername,
						extraProps = {
							BrowserWrapperComponent = BrowserServiceWrapper,
							showToast = t1.showToast,
							onUsernameChanged = t1.onUsernameChanged
						}
					}))
				end,
				openLeaveRobloxAlertUIBlox = if not FFlagAddSocialLinksToCommunityProfile then nil else function(p5) -- line: 232
					-- upvalues: v61 (copy), OpenCentralOverlayForLeaveRobloxAlert (copy)
					v61(OpenCentralOverlayForLeaveRobloxAlert(p5))
				end,
				closeLeaveRobloxAlert = if not FFlagAddSocialLinksToCommunityProfile then nil else function() -- line: 237
					-- upvalues: v61 (copy), CloseCentralOverlay (copy)
					v61(CloseCentralOverlay())
				end,
				navigateToTransfer = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else function(p6) -- line: 242
					-- upvalues: v61 (copy), NavigateDown (copy), AppPage (copy)
					v61(NavigateDown({
						name = AppPage.TransferRobuxFlow,
						extraProps = {
							direction = p6.direction,
							recipientUserId = p6.recipientUserId,
							transferId = p6.transferId,
							transferOrigination = p6.transferOrigination
						}
					}))
				end
			},
			externalAnalytics = {
				catalogAnalytics = v63
			},
			postPurchase = if not FFlagSocialEnableProfileInspectAndBuy then nil else {
				wearAfterPurchase = function(p7) --[[ wearAfterPurchase ]] -- line: 267
					-- upvalues: v61 (copy), UpdateAvatarEquips (copy)
					local t2 = {}

					for _, v92 in p7 do
						table.insert(t2, {
							assetTypeId = v92.assetTypeId,
							assetId = v92.assetId
						})
					end

					if #t2 > 0 then
						v61(UpdateAvatarEquips({
							assets = t2
						}))
					end
				end
			},
			sourceInfo = {
				homepageCarouselAbsolutePosition = v64.absolutePosition,
				source = v64.source,
				contextualInfoType = v64.contextualInfoType,
				contextualOverride = v64.contextualInfoDisplay,
				isRecommendation = v64.isRecommendation,
				recommendationContextType = v64.recommendationContextType,
				recommendationSessionId = v64.recommendationSessionId,
				recommendationRank = v64.recommendationRank,
				friendshipOriginSourceType = u65,
				shareLinkId = v64.shareLinkId
			},
			profileSessionId = if not FFlagProfilePlatformEnableImpressions then nil else v71,
			profileId = str,
			profilePlatformId = v68,
			profileType = v70,
			profileUserNickname = v64.profileUserNickname,
			sessionIdOverride = if not FFlagProfilePlatformEnableImpressions then v64.sessionIdOverride else nil,
			offNetworkFriendRequestToken = v64.offNetworkFriendRequestToken,
			initialPresence = v64.initialPresence,
			mountAsFullView = if not FFlagEnableMobileGameJoinCard then nil else v64.mountAsFullView
		}
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(str, v61, v66, v64.absolutePosition, v64.source, v63, v62) else {
		str,
		v61,
		v66,
		v64.absolutePosition,
		v64.source,
		v63,
		v62
	})

	return React.createElement(ProfileWrapperContext.Provider, {
		value = v72
	}, {
		ProfilePlatformNavigator = React.createElement(ProfilePlatformNavigator, p1),
		androidBackButtonNavigationHandler = React.createElement(Container, {
			canGoBackInRN = not isRootRouteInRN(v62.state),
			navigateBackInRN = v62.pop
		})
	})
end

local v59 = React.PureComponent:extend("classWrapper")

function v59.render(p8) -- line: 342
	-- upvalues: React (copy), v58 (copy)
	return React.createElement(v58, p8.props)
end

v59.router = ProfilePlatformNavigator.router

return v59
