local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Packages = CorePackages.Workspace.Packages
local React = require(CorePackages.Packages.React)
local Roact = require(CorePackages.Packages.Roact)
local UIBlox = require(CorePackages.Packages.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SocialUpsell = require(CorePackages.Workspace.Packages.SocialUpsell)
local useResponsiveLayout = UIBlox.Core.Layout.Responsive.useResponsiveLayout
local useAppPolicy = require(Packages.UniversalAppPolicy).useAppPolicy
local isSubjectToDesktopPolicies = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local IsVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local Modules2 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local OmniFeedProps = Modules2.Personalization.OmniFeed.OmniFeedProps
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local CollectionViews = require(CorePackages.Workspace.Packages.CollectionViews)
local SocialExperiments = require(CorePackages.Workspace.Packages.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperiments.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = SocialExperiments.deviceMeetsRequirementsForFAE
local usePageSideMargin = CollectionViews.usePageSideMargin
local HomePageUpsellCardWithIcon = require(Modules.LuaApp.Components.Home.HomePageUpsellCardWithIcon)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UpsellBanner = SocialUpsell.UpsellBanner
local createBannerConfigFromUpsellCardVariation = SocialUpsell.Utils.createBannerConfigFromUpsellCardVariation
local PostHomePageContactMethodModuleVariationDismiss = Modules2.LuaApp.Thunks.PostHomePageContactMethodModuleVariationDismiss
local UpsellEntrySurfaceType = SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType
local SocialUpsellType = SocialUpsell.Enums.SocialUpsellType
local UpsellComponent = SocialUpsell.Analytics.Enum.UpsellComponent
local startFacialAgeEstimation = SocialUpsell.Thunks.startFacialAgeEstimation
local useSocialUpsellOverlayController = SocialUpsell.Hooks.useSocialUpsellOverlayController
local FFlagLuaAppCompositionSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways
local GAME_CAROUSEL_SIDE_COMPACT_PADDING = DiscoveryTypes.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAME_CAROUSEL_SIDE_WIDE_PADDING = DiscoveryTypes.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING

return function(t1: {[any]: any}) -- line: 48
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), OmniFeedProps (copy), useSelector (copy), useAppPolicy (copy), React (copy), useDispatch (copy), useSocialUpsellOverlayController (copy), useRoactService (copy), RoactNetworking (copy), startFacialAgeEstimation (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), SocialUpsell (copy), UpsellComponent (copy), PostHomePageContactMethodModuleVariationDismiss (copy), useStyle (copy), useResponsiveLayout (copy), FormFactor (copy), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), usePageSideMargin (copy), FFlagTestDeviceForFAEUpsell (copy), deviceMeetsRequirementsForFAE (copy), Roact (copy), HomePageUpsellCardWithIcon (copy), isSubjectToDesktopPolicies (copy), IsVRAppBuild (copy), UpsellBanner (copy), createBannerConfigFromUpsellCardVariation (copy)
	local v40 = not not FFlagLuaAppCompositionAlways or if not FFlagLuaAppCompositionSupport then nil else t1[OmniFeedProps.key].appCompositionEnabled
	local v41 = useSelector(function(p1) -- line: 54
		return p1.HomePageUpsellCardVariation
	end)
	local v42 = useAppPolicy(function(p2) -- line: 57
		return p2.useGridPageLayout()
	end)
	local v43 = React.useRef(nil)
	local v44 = v41 and (v41.upsellCardType and v41.upsellCardV2Config)
	local v45 = useDispatch()
	local v46 = useSocialUpsellOverlayController(false)
	local v47 = useRoactService(RoactNetworking)
	local v48 = React.useCallback(function(_: string) -- line: 70
		-- upvalues: v41 (copy), v45 (copy), startFacialAgeEstimation (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy)
		if v41 and v41.upsellCardType == "Fae" then
			v45(startFacialAgeEstimation(SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.Homepage, nil, nil, UpsellEntrySurfaceType.Homepage))
		end
	end, {
		v45,
		v41
	})
	local v49 = React.useCallback(function(s2: string) -- line: 82
		-- upvalues: v41 (copy), v46 (copy), SocialUpsell (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy)
		if v41 and v41.upsellCardType == "Fae" then
			v46.openSocialOverlay(SocialUpsell.Enums.SocialUpsellType.FacialAgeEstimation, {
				upsellEntrySurface = UpsellEntrySurfaceType.Homepage,
				upsellEntryComponent = UpsellComponent.Banner,
				impressionId = s2
			})
		end
	end, {
		v41,
		v46.openSocialOverlay
	})
	local v50 = React.useCallback(function(_: string) -- line: 91
		-- upvalues: v45 (copy), v41 (copy), PostHomePageContactMethodModuleVariationDismiss (copy), v47 (copy)
		if v45 and v41 then
			v45(PostHomePageContactMethodModuleVariationDismiss(v47, v41.upsellCardType))
		end
	end, {
		v41,
		v47
	})
	local Theme = useStyle().Theme
	local v52 = useSelector(function(p3) -- line: 100
		return p3.FormFactor
	end)
	local v53 = if FFlagLuaAppCompositionAlways then nil else useResponsiveLayout("margin")
	local v54 = if not v40 then if not v42 then if v52 ~= FormFactor.COMPACT then GAME_CAROUSEL_SIDE_WIDE_PADDING else GAME_CAROUSEL_SIDE_COMPACT_PADDING else v53 else nil

	if not FFlagLuaAppCompositionAlways then
		local v55 = usePageSideMargin(v43.current)

		if v44 then
			v54 = v55
		end
	end

	if FFlagTestDeviceForFAEUpsell and v44 and not deviceMeetsRequirementsForFAE() then
		return nil
	end

	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = v43
	}, {
		UIPadding = Roact.createElement("UIPadding", {
			PaddingLeft = if not v40 then UDim.new(0, v54) else nil,
			PaddingRight = if not v40 then UDim.new(0, v54) else nil,
			PaddingTop = UDim.new(0, 1)
		}),
		HomePageUpsellCard = if v44 then nil else Roact.createElement(HomePageUpsellCardWithIcon, {
			upsellCardVariation = v41,
			isCentered = isSubjectToDesktopPolicies() or IsVRAppBuild()
		}),
		HomePageUpsellBannerV2 = if not v44 or v41.upsellCardType == "" then nil else Roact.createElement(UpsellBanner, {
			config = createBannerConfigFromUpsellCardVariation(v41),
			onPrimaryAction = v48,
			onSecondaryAction = v49,
			onDismiss = v50,
			upsellEntrySurface = UpsellEntrySurfaceType.Homepage,
			upsellEntryComponent = UpsellComponent.Banner
		})
	})
end
