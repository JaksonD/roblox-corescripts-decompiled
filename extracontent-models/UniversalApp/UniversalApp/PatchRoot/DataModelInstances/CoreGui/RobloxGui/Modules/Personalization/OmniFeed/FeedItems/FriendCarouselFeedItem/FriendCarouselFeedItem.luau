local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local t = require(CorePackages.Packages.t)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local NavigateDownTo3DQRCodePage = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local SocialCarousel = require(CorePackages.Workspace.Packages.SocialCarousel)
local Constants = SocialCarousel.Constants
local FFlagLuaAppCompositionSupport = SharedFlags.FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = SharedFlags.FFlagLuaAppCompositionAlways
local FFlagLuaAppAddSortDataToSocialCarouselClicks = SharedFlags.FFlagLuaAppAddSortDataToSocialCarouselClicks
local FFlagFlyoutHideFriendsHeader = SocialCarousel.Flags.FFlagFlyoutHideFriendsHeader
local FFlagSocialCarouselShareQREnabled = SharedFlags.FFlagSocialCarouselShareQREnabled
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlags.FFlagEnableFlyoutFriendsHeaderFix
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local v20 = t.strictInterface({
	[OmniFeedProps.key] = OmniFeedProps.interface,
	topic = t.optional(t.string),
	topicId = t.optional(t.string),
	formFactor = t.string,
	refresh = t.callback,
	selectionOrderBase = t.optional(t.number),
	useGridPageLayout = t.optional(t.boolean),
	networking = t.any,
	uiModeInfo = t.any
})

return function(t1: {[any]: any}) -- line: 52
	-- upvalues: v20 (copy), FFlagSocialCarouselShareQREnabled (copy), useDispatch (copy), React (copy), NavigateDownTo3DQRCodePage (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), OmniFeedProps (copy), FFlagLuaAppAddSortDataToSocialCarouselClicks (copy), AppPage (copy), Roact (copy), SocialCarousel (copy), Constants (copy), FFlagFlyoutHideFriendsHeader (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
	v20(t1)

	local v22 = if not FFlagSocialCarouselShareQREnabled then nil else useDispatch()
	local v23 = if not FFlagSocialCarouselShareQREnabled then nil else React.useCallback(function(p1) -- line: 57
		-- upvalues: v22 (copy), NavigateDownTo3DQRCodePage (copy)
		v22(NavigateDownTo3DQRCodePage(p1))
	end, { v22 })
	local v24 = not not FFlagLuaAppCompositionAlways or if not FFlagLuaAppCompositionSupport then nil else t1[OmniFeedProps.key].appCompositionEnabled
	local v25 = t1[OmniFeedProps.key].selectionOrderBase or 0
	local v26 = nil
	local u27 = nil
	local u28 = nil

	if FFlagLuaAppAddSortDataToSocialCarouselClicks then
		u27 = t1[OmniFeedProps.key] and t1[OmniFeedProps.key].appPage or AppPage.Home
		u28 = t1[OmniFeedProps.key] and t1[OmniFeedProps.key].feedItemPosition or nil

		local v29 = t1[OmniFeedProps.key] and t1[OmniFeedProps.key].feedItemStartRow or nil

		v26 = React.useMemo(function() -- line: 77
			-- upvalues: u28 (ref), u27 (ref), t1 (copy), v29 (copy)
			return {
				sortIndex = u28 or -1,
				appPage = u27,
				sortId = t1.topicId,
				startRow = v29 or -1
			}
		end, {
			u28,
			u27,
			t1.topicId,
			v29
		})
	end

	return Roact.createElement(SocialCarousel.Entry, {
		unifiedLogging = {
			sortIndex = if not FFlagLuaAppAddSortDataToSocialCarouselClicks then t1[OmniFeedProps.key].feedItemPosition else u28,
			appPage = if not FFlagLuaAppAddSortDataToSocialCarouselClicks then t1[OmniFeedProps.key].appPage else u27,
			sortId = t1.topicId,
			scrollViewPositionChangedSignal = t1[OmniFeedProps.key].scrollViewPositionChangedSignal,
			impressionTag = "HomeFriendCarousel"
		},
		sortAnalyticsData = if not FFlagLuaAppAddSortDataToSocialCarouselClicks then nil else v26,
		refreshSignal = t1[OmniFeedProps.key].refreshSignal,
		selectionOrderBase = v25,
		source = Constants.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
		hideCarouselHeader = FFlagFlyoutHideFriendsHeader and not not (if not FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp()) or nil,
		appCompositionEnabled = if not FFlagLuaAppCompositionSupport then nil else v24,
		navigateToQRCodePage = if not FFlagSocialCarouselShareQREnabled then nil else v23
	})
end
