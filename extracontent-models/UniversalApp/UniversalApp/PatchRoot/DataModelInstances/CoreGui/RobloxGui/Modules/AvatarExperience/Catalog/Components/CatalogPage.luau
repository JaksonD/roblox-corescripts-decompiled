local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local t = require(CorePackages.Packages.t)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepad.Focusable
local Cryo = require(CorePackages.Packages.Cryo)
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local ExternalEventConnection = RoactUtils.ExternalEventConnection
local isGamepadInput = RoactUtils.isGamepadInput
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local AXRemoveBackButtonDesktopClientsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXRemoveBackButtonDesktopClientsIXPTest
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local GetHeadShapeInventoryStore = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore)
local AppPage = require(Modules.LuaApp.AppPage)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local AvatarScreenProperties = AvatarExperienceNavigation.AvatarRoute.AvatarScreenProperties
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local Analytics = require(Modules.AvatarExperience.Common.Services.Analytics)
local RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local NavigationEventsLogger = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local withStackVisibilityWrapper = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local withMappedNavigationParams = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtils = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

require(CorePackages.Packages.ReactFocusNavigation)

local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local withNamedRefs = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local useTopBarSearchSignal = require(Modules.LuaApp.Context.useTopBarSearchSignal)
local makeTitleDropDown = require(Modules.AvatarExperience.Common.Components.TopBar.makeTitleDropDown)
local v43 = if not require(Modules.AvatarExperience.Flags.GetFFlagAXTransitionMenuV2)() then require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu_DEPRECATED) else require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu)
local makeAvatarBackButton = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)
local AvatarExperienceView = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local NavigationItemsView = require(Modules.AvatarExperience.Catalog.Components.NavigationItemsView)
local TopBar = require(Modules.LuaApp.Components.TopBar.TopBar)
local GamepadFocusHandlerForPage = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local BoundInputsUpdater = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local Analytics2 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local Analytics3 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarExperienceRodux = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetItemDetailsPeekViewState = AvatarExperienceRodux.Actions.SetItemDetailsPeekViewState
local SetTryOnManagerPeekViewState = AvatarExperienceRodux.Actions.SetTryOnManagerPeekViewState
local OpenItemPrompt = require(Modules.AvatarExperience.Common.Thunks.OpenItemPrompt)
local SetFullView = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommon.Enums.FullView
local OpenQuickMenu = require(Modules.AvatarExperience.Common.Thunks.OpenQuickMenu)
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AndroidBackButtonConnection = require(Modules.LuaApp.Navigation.AndroidBackButtonConnection)
local isAvatarRouteVisible = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)
local selectIsPortrait = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local selectIsFullView = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local ResetNavigationHistory = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local InstantResetNavigationHistory = require(Modules.LuaApp.Thunks.InstantResetNavigationHistory)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local OnFocusExposureLogger = require(Modules.AvatarExperience.Catalog.Components.OnFocusExposureLogger)
local OnFocusExperimentExposureLogger = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local useAvatarExperienceFocusNavigationBindings = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local useOpenQuickMenuCallback = require(Modules.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback)
local useQuickMenuAvailable = require(Modules.AvatarExperience.Common.Hooks.useQuickMenuAvailable)
local useOverlayClosedCallback = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local useUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local SetSearchCategoryAndSubcategory = require(Modules.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory)
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local Constants = require(Modules.AvatarExperience.Common.Constants)
local IsVRAppBuild = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetFFlagAvatarAutocompleteEnabledForAll = require(Modules.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local GetFFlagLooksIXPLogging = require(Modules.AvatarExperience.Flags.GetFFlagLooksIXPLogging)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagDynamicHeadsMigration = AvatarExperienceFlags.FFlagDynamicHeadsMigration
local AvatarMarketplaceBackendIXPTests = require(Modules.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests)
local UniversalAppCameraIXPTest = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local AXDisableAlwaysRenderedScreensIXP = require(Modules.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP)
local AXCatalogPerfReduxReductionIXP = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local AXAvatarsTabIXP = AvatarExperienceCommon.Experiments.AXAvatarsTabIXP
local getBackendLayerNamesForCatalog = AvatarExperienceCommon.Utils.getBackendLayerNamesForCatalog
local UserIsInExperiment = AvatarExperienceFlags.FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInExperiment
local GetFFlagAXDisableRelevanceRecommendationsLayerExposure = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableRelevanceRecommendationsLayerExposure)
local GetFFlagAXDisableSortsLayerExposure = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure)
local GetFFlagAXDisableRecommendationsAndSearchLayerExposure = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableRecommendationsAndSearchLayerExposure)
local GetFlagAXEnableInitialTopLevelPageCounter = require(Modules.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter)
local FFlagAXMigrateCatalogPageInputBindings = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings
local GetFStringAXCatalogAndEditorExposureLayerName = require(Modules.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName)
local FFlagAXAvatarTimeoutFlow = AvatarExperienceFlags.FFlagAXAvatarTimeoutFlow
local FFlagAXRefetchAvatarOnTimeout = AvatarExperienceFlags.FFlagAXRefetchAvatarOnTimeout
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlags.FFlagAXMakeupReleaseFTUX
local FFlagAXOpaqueMarketplaceTopbar = AvatarExperienceFlags.FFlagAXOpaqueMarketplaceTopbar
local FFlagAXBackendDrivenCatalogLayers = AvatarExperienceFlags.FFlagAXBackendDrivenCatalogLayers
local v105 = game:DefineFastFlag("AXEnableIXPCounters2", false)
local v106 = game:DefineFastFlag("AXCustomizeOverhaulCatalogExposure2", false)
local FFlagAXCatalogAndEditorExposureUseFStringLayer = require(Modules.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local v111 = game:DefineFastString("AXMISExperimentLayerName", AppUserLayers.AvatarExperienceUAMarketplaceView)
local v112 = game:DefineFastFlag("AXMISExposureLogging", false)
local v113 = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", AppUserLayers.AvatarExperienceUAMarketplaceView)
local FFlagAXExpandPeekViewOnFirstScroll = AvatarExperienceFlags.FFlagAXExpandPeekViewOnFirstScroll
local FFlagAXEnableCategoryPillsExposureLogging = AvatarExperienceFlags.FFlagAXEnableCategoryPillsExposureLogging
local FFlagAXHideMenuOnScroll = AvatarExperienceFlags.FFlagAXHideMenuOnScroll
local FFlagAXFixCatalogRefreshRendering = AvatarExperienceFlags.FFlagAXFixCatalogRefreshRendering
local FFlagBasedExposureLoggingCatalogPage = AvatarExperienceFlags.FFlagBasedExposureLoggingCatalogPage
local FFlagAXEnableTaxonomyM20ExposureLoggingCatalog = AvatarExperienceFlags.FFlagAXEnableTaxonomyM20ExposureLoggingCatalog
local FFlagAXHandleTaxonomyIdsDeepLinks = AvatarExperienceFlags.FFlagAXHandleTaxonomyIdsDeepLinks
local FFlagAXMoveCatalogFilterToL1NavigationExposureLogging = AvatarExperienceFlags.FFlagAXMoveCatalogFilterToL1NavigationExposureLogging
local FFlagAXDefaultCatalogCategoryId = AvatarExperienceFlags.FFlagAXDefaultCatalogCategoryId
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlags.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXHideCatalogShortcutsInFullView = AvatarExperienceFlags.FFlagAXHideCatalogShortcutsInFullView
local v126 = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false)
local v127 = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", AppUserLayers.AvatarExperienceUAMarketplaceView)
local FFlagAXCatalogM41CategoriesExposureLogging = AvatarExperienceFlags.FFlagAXCatalogM41CategoriesExposureLogging
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local WidgetsPercievedTTIManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager
local FFlagAXHideMenuOnScrollExposureLogging = AvatarExperienceFlags.FFlagAXHideMenuOnScrollExposureLogging
local FFlagAXMakeupCategoryPositionExperimentExposureLogging = AvatarExperienceFlags.FFlagAXMakeupCategoryPositionExperimentExposureLogging
local v133 = game:DefineFastFlag("AXVirtualizedListConfigExposureLogging", false)
local useCatalogPageFocusNavigationBindings = require(script.Parent.useCatalogPageFocusNavigationBindings)
local useCatalogPageRevertToLastEquippedStateHook = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook)
local useCatalogPageTimeoutPrompt = AvatarExperienceCatalog.Hooks.useCatalogPageTimeoutPrompt
local useCatalogPageMakeupReleaseFtux = AvatarExperienceCatalog.Hooks.useCatalogPageMakeupReleaseFtux
local RefetchAvatarData = require(Modules.AvatarExperience.AvatarEditor.Thunks.RefetchAvatarData)
local mutedError = require(Modules.LuaApp.mutedError)
local v140 = Images["icons/actions/truncationExpand"]
local CatalogCategories = AvatarExperienceCommon.Enums.CatalogCategories

local function selectTryOnManagerViewState(p1) -- line: 215
	return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end
local function selectIsTryOnButtonShowing(p2) -- line: 219
	-- upvalues: Cryo (copy)
	local TryOnItems = p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems

	return #Cryo.Dictionary.values(TryOnItems) > 1
end

local v144 = Roact.PureComponent:extend("CatalogPage")

v144.validateProps = t.strictInterface({
	fullView = t.optional(t.userdata),
	isPortrait = t.optional(t.boolean),
	itemDetailsExpanded = t.optional(t.boolean),
	tryOnManagerPeekViewState = t.optional(t.valueOf(PeekViewState)),
	tryOnItems = t.optional(t.table),
	openItemPrompt = t.callback,
	setItemDetailsPeekViewState = t.callback,
	navigateIntoQuickMenu = t.optional(t.callback),
	setFullView = t.callback,
	resetNavigationHistory = t.callback,
	instantResetNavigationHistory = t.callback,
	setTryOnManagerPeekViewState = t.callback,
	resetSearchCategoryAndSubcategory = t.callback,
	namedRefs = t.table,
	prevNavPage = t.optional(t.string),
	prevNavHistory = t.optional(t.table),
	navigation = t.optional(t.table),
	avatarRoute = t.optional(t.table),
	avatarExperienceAnalytics = t.optional(t.table),
	networking = t.optional(t.callback),
	appAnalytics = t.optional(t.table),
	avatarEditorAnalytics = t.optional(t.table),
	catalogAnalytics = t.optional(t.table),
	show3dView = t.optional(t.boolean),
	itemId = t.optional(t.string),
	itemType = t.optional(t.string),
	isFirstItemDetails = t.optional(t.boolean),
	is10ftUI = t.boolean,
	focusController = if not FFlagAXMigrateAXToGlobalAutofocus then t.table else nil,
	androidBackButtonConnection = t.table,
	overlayClosedCallback = t.callback,
	fetchItemFailed = if not FFlagAXFixCatalogRefreshRendering then nil else t.optional(t.boolean),
	wasItemEquipped = if not FFlagAXFixCatalogRefreshRendering then nil else t.optional(t.boolean),
	category = if not FFlagAXHandleTaxonomyIdsDeepLinks then nil else t.optional(t.string),
	subcategory = if not FFlagAXHandleTaxonomyIdsDeepLinks then nil else t.optional(t.string),
	taxonomy = if not FFlagAXHandleTaxonomyIdsDeepLinks then nil else t.optional(t.string)
})

function v144.init(p3) -- line: 286
	-- upvalues: Roact (copy), RoactGamepad (copy), UserInputService (copy), isGamepadInput (copy), Utils (copy), AvatarScreen (copy), FullView (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), AppPage (copy), makeTitleDropDown (copy), makeAvatarBackButton (copy), GetFFlagAvatarAutocompleteEnabledForAll (copy), GetFlagAXEnableInitialTopLevelPageCounter (copy), sendAXCounterV2 (copy), Constants (copy), FFlagAXEnableCategoryPillsExposureLogging (copy), IXPServiceWrapper (copy), AppUserLayers (copy), FFlagAXEnableTaxonomyM20ExposureLoggingCatalog (copy), v113 (copy)
	p3.topBarRef = Roact.createRef()
	p3.sceneUIContainerRef = Roact.createRef()
	p3.titleDropDownRef = Roact.createRef()
	p3.topBarRenderRightRef = Roact.createRef()
	p3.refinementButtonsRef = Roact.createRef()
	p3.multiTryOnBottomBarRef = Roact.createRef()
	p3.quickButtonsRef = Roact.createRef()
	p3.itemDetailsPeekViewRefs = RoactGamepad.createRefCache()

	local LastInputType = UserInputService:GetLastInputType()

	p3:setState({
		lastInputIsGamepad = isGamepadInput(LastInputType)
	})

	function p3.setDefaultRefOverride(p4) -- line: 303
		-- upvalues: p3 (copy), Roact (copy)
		p3:setState({
			defaultRefOverride = p4 or Roact.None
		})
	end
	function p3.changeView() -- line: 309
		-- upvalues: p3 (copy), Utils (copy)
		local avatarExperienceAnalytics = p3.props.avatarExperienceAnalytics
		local v217 = Utils.getNewFullViewEnum(p3.props.fullView)

		p3.props.setFullView(avatarExperienceAnalytics, p3.props.avatarRoute.opaque.name, v217)
	end
	function p3.setUIFullView() -- line: 316
		-- upvalues: p3 (copy), AvatarScreen (copy), FullView (copy)
		local avatarExperienceAnalytics = p3.props.avatarExperienceAnalytics

		if p3.props.isPortrait then
			p3.props.setFullView(avatarExperienceAnalytics, AvatarScreen.CatalogSearch, FullView.UIFullView)
		end
	end
	function p3.isAvatarScreen(p5) -- line: 324
		-- upvalues: AvatarScreen (copy)
		return (rawget(AvatarScreen, p5))
	end
	function p3.topBarBackButtonActivated() -- line: 328
		-- upvalues: FFlagAXExpandPeekViewOnFirstScroll (copy), p3 (copy), FullView (copy), AvatarScreen (copy), AppPage (copy)
		if FFlagAXExpandPeekViewOnFirstScroll and p3.props.fullView == FullView.UIFullView then
			local avatarExperienceAnalytics = p3.props.avatarExperienceAnalytics

			p3.props.setFullView(avatarExperienceAnalytics, p3.props.avatarRoute.opaque.name, FullView.None)

			return
		end

		local navigation = p3.props.navigation
		local avatarEditorAnalytics = p3.props.avatarEditorAnalytics
		local prevNavPage = p3.props.prevNavPage
		local prevNavHistory = p3.props.prevNavHistory

		if prevNavPage and prevNavHistory then
			if p3.isAvatarScreen(prevNavPage) then
				p3.props.navigation.navigate(prevNavPage)
			else
				p3.props.resetNavigationHistory(prevNavHistory)
			end
		else
			local v225 = if not p3.props.is10ftUI then AppPage.Home else AvatarScreen.AvatarExperienceLandingPage

			navigation.navigate(v225)
		end

		avatarEditorAnalytics.catalogToAvatarBackButton()
	end

	p3.defaultChildRef = Roact.createRef()

	function p3.lastInputTypeChangedCallback(p6) -- line: 356
		-- upvalues: isGamepadInput (copy), p3 (copy)
		local v227 = isGamepadInput(p6)

		if v227 ~= p3.state.lastInputIsGamepad then
			p3:setState({
				lastInputIsGamepad = v227
			})
		end
	end

	p3.titleDropDown = makeTitleDropDown("Feature.Avatar.Action.Marketplace", p3.props.overlayClosedCallback)
	p3.backButton = makeAvatarBackButton(p3.topBarBackButtonActivated)

	function p3.onConfirmSearchCallback() -- line: 369
		-- upvalues: p3 (copy), GetFFlagAvatarAutocompleteEnabledForAll (copy)
		p3.props.resetSearchCategoryAndSubcategory()

		if GetFFlagAvatarAutocompleteEnabledForAll() and p3.setUIFullView then
			p3.setUIFullView()
		end
	end

	if GetFlagAXEnableInitialTopLevelPageCounter() then
		sendAXCounterV2(Constants.Counter.TopLevelPageInitialView.Catalog)
	end

	if FFlagAXEnableCategoryPillsExposureLogging then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.AvatarExperienceUAAllViews)
	end

	if FFlagAXEnableTaxonomyM20ExposureLoggingCatalog then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(v113)
	end
end
function v144.getBestDefaultRefForPage(p7) -- line: 391
	if p7.state.defaultRefOverride then
		return p7.state.defaultRefOverride
	end

	return p7.defaultChildRef
end

if not FFlagAXMigrateCatalogPageInputBindings then
	function v144.getInputBindings(p8) -- line: 400
		-- upvalues: AvatarScreenProperties (copy), Cryo (copy), AvatarScreen (copy), FFlagAXMISEnableMultiShopping (copy), RoactGamepad (copy), NavigationUtils (copy), PeekViewState (copy)
		local avatarRoute = p8.props.avatarRoute
		local name = avatarRoute.current.name
		local isMultiTryOn = AvatarScreenProperties[avatarRoute.opaque.name].isMultiTryOn
		local v158 = #Cryo.Dictionary.values(p8.props.tryOnItems) > 1
		local t1 = {
			OpenTryOnManager = if name == AvatarScreen.TryOnManager or (not isMultiTryOn and not FFlagAXMISEnableMultiShopping or not v158) then nil else RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonY, function() -- line: 410
				-- upvalues: NavigationUtils (copy), p8 (copy), AvatarScreen (copy)
				NavigationUtils.closeFiltersAndItemDetails(p8.props.navigation)
				p8.props.navigation.navigate(AvatarScreen.TryOnManager)
			end, {
				key = "Feature.Catalog.Label.TryOns"
			})
		}

		if name == AvatarScreen.ItemDetails then
			return (Cryo.Dictionary.join(t1, {
				NavigateBack = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonB, function() -- line: 421
					-- upvalues: NavigationUtils (copy), p8 (copy)
					NavigationUtils.closeFocusedScreen(p8.props.navigation)
				end),
				OpenItemPrompt = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonX, function() -- line: 424
					-- upvalues: p8 (copy), avatarRoute (copy)
					p8.props.openItemPrompt(p8.props.networking, p8.props.catalogAnalytics, p8.props.overlayClosedCallback, p8.props.navigation, avatarRoute)
				end, {
					key = "Feature.Catalog.Action.Buy"
				}),
				OpenCatalogContextMenu = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonL3, function() -- line: 435
					-- upvalues: p8 (copy), AvatarScreen (copy), avatarRoute (copy)
					p8.props.navigation.navigate(AvatarScreen.CatalogContextMenu, {
						itemId = avatarRoute.current.params.itemId,
						itemType = avatarRoute.current.params.itemType,
						onOverlayClosed = p8.props.overlayClosedCallback
					})
				end, {
					key = "Feature.Catalog.Action.ItemOptions"
				})
			}))
		end

		if name == AvatarScreen.TryOnManager then
			return (Cryo.Dictionary.join(t1, {
				OpenCloseTryOnManager = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonY, function() -- line: 447
					-- upvalues: p8 (copy), PeekViewState (copy)
					local tryOnManagerPeekViewState = p8.props.tryOnManagerPeekViewState

					if tryOnManagerPeekViewState == PeekViewState.Full or tryOnManagerPeekViewState == PeekViewState.Extended then
						p8.props.setTryOnManagerPeekViewState(PeekViewState.Brief)

						return
					end

					p8.props.setTryOnManagerPeekViewState(PeekViewState.Full)
				end, {
					key = "Feature.Catalog.Label.TryOns"
				})
			}))
		end

		if name == AvatarScreen.LookDetails then
			t1 = Cryo.Dictionary.join(t1, {
				OpenCloseTryOnManager = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonY, function() -- line: 460
					-- upvalues: p8 (copy), PeekViewState (copy)
					local tryOnManagerPeekViewState = p8.props.tryOnManagerPeekViewState

					if tryOnManagerPeekViewState == PeekViewState.Full or tryOnManagerPeekViewState == PeekViewState.Extended then
						p8.props.setTryOnManagerPeekViewState(PeekViewState.Brief)

						return
					end

					p8.props.setTryOnManagerPeekViewState(PeekViewState.Full)
				end, {
					key = "Feature.Catalog.Label.TryOns"
				})
			})
		end

		return t1
	end
end

if v105 then
	function v144.sendExperimentCountersOnce(_) -- line: 478
	end
end

function v144.didMount(p10) -- line: 481
	-- upvalues: isAvatarRouteVisible (copy), v105 (copy), v106 (copy), IxpUtils (copy), FFlagAXCatalogAndEditorExposureUseFStringLayer (copy), GetFStringAXCatalogAndEditorExposureLayerName (copy), AppUserLayers (copy), v112 (copy), IXPServiceWrapper (copy), v111 (copy)
	if not p10.props.is10ftUI and isAvatarRouteVisible(p10.props) then
		p10.props.androidBackButtonConnection.connect(p10.topBarBackButtonActivated)
	end

	if v105 then
		p10:sendExperimentCountersOnce()
	end

	if v106 then
		IxpUtils.logLayerExposure(if not FFlagAXCatalogAndEditorExposureUseFStringLayer then AppUserLayers.AvatarExperienceUAAllViews else GetFStringAXCatalogAndEditorExposureLayerName())
	end

	if v112 then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(v111)
	end
end
function v144.willUnmount(p11) -- line: 505
	p11.props.androidBackButtonConnection.disconnect()
end
function v144.didUpdate(p12, p13) -- line: 509
	-- upvalues: isAvatarRouteVisible (copy)
	if not p12.props.is10ftUI then
		if not isAvatarRouteVisible(p13) and isAvatarRouteVisible(p12.props) then
			p12.props.androidBackButtonConnection.connect(p12.topBarBackButtonActivated)

			return
		end

		if isAvatarRouteVisible(p13) and not isAvatarRouteVisible(p12.props) then
			p12.props.androidBackButtonConnection.disconnect()
		end
	end
end
function v144.willUpdate(p14, p15) -- line: 519
	-- upvalues: FFlagAXExpandPeekViewOnFirstScroll (copy), makeAvatarBackButton (copy)
	if FFlagAXExpandPeekViewOnFirstScroll and p15.fullView ~= p14.props.fullView then
		p14.backButton = makeAvatarBackButton(p14.topBarBackButtonActivated, p14:getBackButtonIcon(p15.fullView))
	end
end

if FFlagAXExpandPeekViewOnFirstScroll then
	function v144.getBackButtonIcon(p16, p17) -- line: 527
		-- upvalues: FullView (copy), v140 (copy)
		if not p17 then
			p17 = p16.props.fullView
		end

		if p17 == FullView.UIFullView then
			return v140
		end

		return nil
	end
end

function v144.renderTopBar(p18) -- line: 541
	-- upvalues: withLocalization (copy), GetFFlagAvatarAutocompleteEnabledForAll (copy), IsVRAppBuild (copy), v43 (copy), TopBar (copy), Roact (copy), RobloxAppEnums (copy), FFlagAXOpaqueMarketplaceTopbar (copy)
	local isPortrait = p18.props.isPortrait
	local show3dView = p18.props.show3dView

	return withLocalization({
		title = "Feature.Avatar.Action.Marketplace"
	})(function(p19) -- line: 547
		-- upvalues: GetFFlagAvatarAutocompleteEnabledForAll (copy), IsVRAppBuild (copy), p18 (copy), v43 (copy), TopBar (copy), Roact (copy), RobloxAppEnums (copy), FFlagAXOpaqueMarketplaceTopbar (copy), isPortrait (copy), show3dView (copy)
		local n1 = 2

		if GetFFlagAvatarAutocompleteEnabledForAll() then
			n1 = 3
		end

		local v232, v233, v234

		if IsVRAppBuild() then
			v232 = nil
			v233 = nil
			v234 = nil
		else
			v233 = p18.backButton
			v232 = if not p18.props.is10ftUI then v43 else p18.titleDropDown
			v234 = { TopBar.SearchButton }
		end

		return Roact.createElement(TopBar.Container, {
			forceCompactMode = true,
			searchType = RobloxAppEnums.SearchTypes.Catalog,
			titleText = p19.title,
			ZIndex = n1,
			transparentBackground = if not FFlagAXOpaqueMarketplaceTopbar or isPortrait then show3dView else false,
			hideSiteMessageBanner = isPortrait,
			[Roact.Ref] = p18.topBarRef,
			setDefaultRefOverride = p18.setDefaultRefOverride,
			NextSelectionDown = p18.defaultChildRef,
			NextSelectionRight = p18.sceneUIContainerRef,
			onConfirmSearchCallback = p18.onConfirmSearchCallback,
			leftItem = v233,
			centerItem = v232,
			rightItems = v234,
			useParentSizeForCenterItem = true,
			shouldNavigateToSearchLandingPage = true
		})
	end)
end
function v144.render(p20) -- line: 590
	-- upvalues: FullView (copy), AvatarScreen (copy), Roact (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateCatalogPageInputBindings (copy), BoundInputsUpdater (copy), ExternalEventConnection (copy), UserInputService (copy), NavigationEventsLogger (copy), OnFocusExposureLogger (copy), UniversalAppCameraIXPTest (copy), GetFFlagAXDisableRelevanceRecommendationsLayerExposure (copy), AvatarMarketplaceBackendIXPTests (copy), GetFFlagAXDisableRecommendationsAndSearchLayerExposure (copy), GetFFlagLooksIXPLogging (copy), GetFFlagAXDisableSortsLayerExposure (copy), OnFocusExperimentExposureLogger (copy), AXDisableAlwaysRenderedScreensIXP (copy), AXCatalogPerfReduxReductionIXP (copy), AXRemoveBackButtonDesktopClientsIXPTest (copy), AXAvatarsTabIXP (copy), FFlagAXBackendDrivenCatalogLayers (copy), getBackendLayerNamesForCatalog (copy), FFlagBasedExposureLoggingCatalogPage (copy), UserIsInExperiment (copy), AppUserLayers (copy), FFlagAXMoveCatalogFilterToL1NavigationExposureLogging (copy), v126 (copy), v127 (copy), FFlagAXCatalogM41CategoriesExposureLogging (copy), FFlagAXHideMenuOnScrollExposureLogging (copy), v133 (copy), FFlagAXMakeupCategoryPositionExperimentExposureLogging (copy), AvatarExperienceView (copy), FFlagAXHideMenuOnScroll (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), GamepadFocusHandlerForPage (copy), NavigationItemsView (copy)
	local v173 = p20.props.fullView == FullView.SceneFullView
	local v174 = p20.props.fullView == FullView.UIFullView
	local show3dView = p20.props.show3dView
	local namedRefs = p20.props.namedRefs
	local v177 = p20.props.avatarRoute.current.name == AvatarScreen.SortAndFilters
	local quickButtonsRef = p20.quickButtonsRef

	if p20.props.avatarRoute.current.name == AvatarScreen.TryOnManager then
		quickButtonsRef = namedRefs[AvatarScreen.TryOnManager]
	elseif p20.props.avatarRoute.current.name == AvatarScreen.LookDetails then
		quickButtonsRef = namedRefs[AvatarScreen.LookDetails]
	elseif v177 then
		quickButtonsRef = namedRefs[AvatarScreen.SortAndFilters]
	end

	return Roact.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		focusController = if not FFlagAXMigrateAXToGlobalAutofocus then p20.props.focusController else nil,
		defaultChild = p20:getBestDefaultRefForPage(),
		restorePreviousChildFocus = false,
		inputBindings = if not FFlagAXMigrateCatalogPageInputBindings then p20:getInputBindings() else nil,
		ref = namedRefs[AvatarScreen.Catalog]
	}, {
		BoundInputsUpdater = if not FFlagAXMigrateAXToGlobalAutofocus then Roact.createElement(BoundInputsUpdater) else nil,
		LastInputTypeChangedConnection = Roact.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p20.lastInputTypeChangedCallback
		}),
		NavigationEventsLogger = Roact.createElement(NavigationEventsLogger, {
			pageName = "Catalog"
		}),
		UniversalAppCameraExposure = Roact.createElement(OnFocusExposureLogger, {
			ixpTest = UniversalAppCameraIXPTest
		}),
		RelevanceRecommendationsExposure = if not GetFFlagAXDisableRelevanceRecommendationsLayerExposure() then Roact.createElement(OnFocusExposureLogger, {
			ixpTest = AvatarMarketplaceBackendIXPTests.RelevanceRecommendations
		}) else nil,
		RecommendationsAndSearchExposure = if not GetFFlagAXDisableRecommendationsAndSearchLayerExposure() then Roact.createElement(OnFocusExposureLogger, {
			ixpTest = AvatarMarketplaceBackendIXPTests.RecommendationsAndSearch
		}) else nil,
		SortsExposure = (GetFFlagLooksIXPLogging() or not GetFFlagAXDisableSortsLayerExposure()) and Roact.createElement(OnFocusExposureLogger, {
			ixpTest = AvatarMarketplaceBackendIXPTests.Sorts
		}),
		SearchWidgetsExposure = GetFFlagLooksIXPLogging() and Roact.createElement(OnFocusExposureLogger, {
			ixpTest = AvatarMarketplaceBackendIXPTests.SearchWidgets
		}),
		OnFocusExperimentExposureLogger = Roact.createElement(OnFocusExperimentExposureLogger, {
			ixpTests = {
				if not AXDisableAlwaysRenderedScreensIXP.isEnabled() then nil else AXDisableAlwaysRenderedScreensIXP,
				if not AXCatalogPerfReduxReductionIXP.isEnabled() then nil else AXCatalogPerfReduxReductionIXP,
				if not AXRemoveBackButtonDesktopClientsIXPTest.isEnabled() then nil else AXRemoveBackButtonDesktopClientsIXPTest,
				if not AXAvatarsTabIXP.isEnabled() then nil else AXAvatarsTabIXP
			},
			layers = if not FFlagAXBackendDrivenCatalogLayers then nil else getBackendLayerNamesForCatalog(),
			flagIXPTestLayers = if not FFlagBasedExposureLoggingCatalogPage then nil else {
				if not UserIsInExperiment then nil else AppUserLayers.AvatarExperienceUAMarketplaceView,
				if not FFlagAXMoveCatalogFilterToL1NavigationExposureLogging then nil else AppUserLayers.AvatarExperienceUAAllViews,
				if not v126 then nil else v127,
				if not FFlagAXCatalogM41CategoriesExposureLogging then nil else AppUserLayers.AvatarExperienceUAMarketplaceView,
				if not FFlagAXHideMenuOnScrollExposureLogging then nil else AppUserLayers.AvatarExperienceUAMarketplaceView,
				if not v133 then nil else AppUserLayers.AvatarExperienceUAMarketplaceView,
				if not FFlagAXMakeupCategoryPositionExperimentExposureLogging then nil else AppUserLayers.AvatarExperienceUAMarketplaceView
			}
		}),
		AvatarExperienceView = Roact.createElement(AvatarExperienceView, {
			changeViewFunction = p20.changeView,
			allowAdaptiveScrolling = true,
			adaptiveScrollingProps = if not FFlagAXHideMenuOnScroll and not FFlagAXExpandPeekViewOnFirstScroll then nil else {
				enableExpandPeekViewOnUpwardScroll = not not FFlagAXExpandPeekViewOnFirstScroll or nil,
				enableAnimatedVisibility = not not FFlagAXHideMenuOnScroll or nil
			},
			isDisabled = not show3dView,
			isSceneFullView = v173,
			isUIFullView = v174,
			topBar = p20:renderTopBar(),
			refinementButtonsRef = p20.refinementButtonsRef,
			quickButtonsRef = p20.quickButtonsRef,
			[Roact.Ref] = p20.sceneUIContainerRef,
			NextSelectionDown = p20.defaultChildRef,
			NextSelectionLeft = p20.topBarRef,
			defaultChildRef = p20.defaultChildRef,
			multiTryOnBottomBarRef = p20.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = p20.itemDetailsPeekViewRefs,
			showUndoRedo = true,
			showSaveButton = false
		}, {
			GamepadFocusHandlerForPage = if not FFlagAXMigrateAXToGlobalAutofocus then Roact.createElement(GamepadFocusHandlerForPage, {
				focusController = p20.props.focusController,
				captureFocusOnMount = true
			}) else nil,
			NavigationAndItemsList = Roact.createElement(NavigationItemsView, {
				defaultChildRef = p20.defaultChildRef,
				NextSelectionUp = p20.topBarRef,
				NextSelectionRight = quickButtonsRef,
				multiTryOnBottomBarRef = p20.multiTryOnBottomBarRef,
				itemDetailsPeekViewRefs = p20.itemDetailsPeekViewRefs
			})
		})
	})
end

local v145 = RoactRodux.connect(function(p21) --[[ mapStateToProps ]] -- line: 727
	-- upvalues: selectIsFullView (copy), AvatarScreen (copy), selectIsPortrait (copy), FFlagAXMigrateCatalogPageInputBindings (copy)
	return {
		fullView = selectIsFullView(p21, AvatarScreen.Catalog),
		isPortrait = selectIsPortrait(p21),
		itemDetailsExpanded = p21.AvatarExperience.Common.ItemDetailsExpanded,
		tryOnManagerPeekViewState = p21.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState,
		tryOnItems = if not FFlagAXMigrateCatalogPageInputBindings then p21.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil
	}
end, function(p22: ((...any) -> ...any)) --[[ mapDispatchToProps ]] -- line: 739
	-- upvalues: OpenItemPrompt (copy), SetItemDetailsPeekViewState (copy), OpenQuickMenu (copy), SetFullView (copy), ResetNavigationHistory (copy), InstantResetNavigationHistory (copy), SetTryOnManagerPeekViewState (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), CatalogCategories (copy), mutedError (copy), SetSearchCategoryAndSubcategory (copy)
	return {
		openItemPrompt = function(p23, p24, p25, p26, p27) --[[ openItemPrompt ]] -- line: 741
			-- upvalues: p22 (copy), OpenItemPrompt (copy)
			p22(OpenItemPrompt(p23, p24, p25, p26, p27))
		end,
		setItemDetailsPeekViewState = function(p28) --[[ setItemDetailsPeekViewState ]] -- line: 744
			-- upvalues: p22 (copy), SetItemDetailsPeekViewState (copy)
			p22(SetItemDetailsPeekViewState(p28))
		end,
		navigateIntoQuickMenu = function(p29, p30) --[[ navigateIntoQuickMenu ]] -- line: 747
			-- upvalues: p22 (copy), OpenQuickMenu (copy)
			p22(OpenQuickMenu(p29, p30))
		end,
		setFullView = function(p31, p32, p33) --[[ setFullView ]] -- line: 750
			-- upvalues: p22 (copy), SetFullView (copy)
			p22(SetFullView(p31, p32, p33))
		end,
		resetNavigationHistory = function(p34) --[[ resetNavigationHistory ]] -- line: 753
			-- upvalues: p22 (copy), ResetNavigationHistory (copy)
			return p22(ResetNavigationHistory(nil, p34))
		end,
		instantResetNavigationHistory = function(p35) --[[ instantResetNavigationHistory ]] -- line: 756
			-- upvalues: p22 (copy), InstantResetNavigationHistory (copy)
			return p22(InstantResetNavigationHistory(nil, p35))
		end,
		setTryOnManagerPeekViewState = function(p36) --[[ setTryOnManagerPeekViewState ]] -- line: 759
			-- upvalues: p22 (copy), SetTryOnManagerPeekViewState (copy)
			p22(SetTryOnManagerPeekViewState(p36))
		end,
		resetSearchCategoryAndSubcategory = function() --[[ resetSearchCategoryAndSubcategory ]] -- line: 762
			-- upvalues: FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), CatalogCategories (copy), mutedError (copy), p22 (copy), SetSearchCategoryAndSubcategory (copy)
			if FFlagAXCatalogCategoriesStore then
				if not GetCatalogCategoriesStore.getCatalogSearchSelectionStore().changeCategory(if not FFlagAXDefaultCatalogCategoryId then CatalogCategories.Recommended:rawValue() else Constants.DefaultCatalogCategoryId, nil) then
					mutedError("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk")

					return
				end
			else
				p22(SetSearchCategoryAndSubcategory("All", nil))
			end
		end
	}
end)(v144)
local v146 = RoactServices.connect({
	avatarExperienceAnalytics = Analytics,
	networking = RoactNetworking,
	appAnalytics = RoactAnalytics,
	avatarEditorAnalytics = Analytics2,
	catalogAnalytics = Analytics3
})(v145)
local u147 = withNamedRefs((withMappedNavigationParams(withStackVisibilityWrapper((RoactAppPolicy.connect(function(p37, _) -- line: 791
	return {
		show3dView = p37.getCatalogShow3dView()
	}
end)(v146))), nil)))

return function(p39) --[[ CatalogPageContainer ]] -- line: 803
	-- upvalues: FFlagAXRefetchAvatarOnTimeout (copy), useRoactService (copy), RoactNetworking (copy), useDispatch (copy), FFlagDynamicHeadsMigration (copy), React (copy), GetHeadShapeInventoryStore (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepad (copy), AndroidBackButtonConnection (copy), useOverlayClosedCallback (copy), FFlagAXMigrateCatalogPageInputBindings (copy), Analytics3 (copy), useTopBarSearchSignal (copy), useQuickMenuAvailable (copy), useAvatarRoute (copy), AvatarScreen (copy), AvatarScreenProperties (copy), useSelector (copy), selectIsTryOnButtonShowing (copy), useOpenQuickMenuCallback (copy), NavigationUtils (copy), OpenItemPrompt (copy), selectTryOnManagerViewState (copy), PeekViewState (copy), SetTryOnManagerPeekViewState (copy), FocusNavigationEventNameEnum (copy), FFlagAXHideCatalogShortcutsInFullView (copy), selectIsFullView (copy), FullView (copy), useCatalogPageFocusNavigationBindings (copy), useAvatarExperienceFocusNavigationBindings (copy), FFlagAXAvatarTimeoutFlow (copy), RefetchAvatarData (copy), useCatalogPageTimeoutPrompt (copy), FFlagAXMakeupReleaseFTUX (copy), GetCatalogCategoriesStore (copy), CatalogCategories (copy), useCatalogPageMakeupReleaseFtux (copy), Cryo (copy), useUiModeInfo (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), useCatalogPageRevertToLastEquippedStateHook (copy), u147 (ref)
	local u184 = nil
	local u185 = nil

	if FFlagAXRefetchAvatarOnTimeout then
		u184 = useRoactService(RoactNetworking)
		u185 = useDispatch()
	end

	if FFlagDynamicHeadsMigration then
		React.useEffect(function() -- line: 812
			-- upvalues: GetHeadShapeInventoryStore (copy)
			local v249 = GetHeadShapeInventoryStore(false)

			if v249 then
				v249.getInventory(false)
			end
		end, {})
	end

	if FFlagAXEnableMilestoneTrackingForAvatarExperience and WidgetsPercievedTTIManager then
		WidgetsPercievedTTIManager.Hooks.useRenderAndMountedTracking()
	end

	local v186 = if not FFlagAXMigrateAXToGlobalAutofocus then React.useRef(RoactGamepad.createFocusController()).current else nil
	local current = React.useRef(AndroidBackButtonConnection()).current
	local v188 = useOverlayClosedCallback(if not FFlagAXMigrateAXToGlobalAutofocus then v186 else nil)
	local v209

	if FFlagAXMigrateCatalogPageInputBindings then
		if not FFlagAXRefetchAvatarOnTimeout then
			u184 = useRoactService(RoactNetworking)
			u185 = useDispatch()
		end

		local v189 = useRoactService(Analytics3)
		local v190 = useTopBarSearchSignal()
		local v191 = useQuickMenuAvailable()
		local v192 = useAvatarRoute()
		local v193 = v192.current.name == AvatarScreen.ItemDetails
		local v194 = v192.current.name == AvatarScreen.LookDetails or v192.current.name == AvatarScreen.TryOnManager
		local isMultiTryOn = AvatarScreenProperties[v192.opaque.name].isMultiTryOn
		local v196 = useSelector(selectIsTryOnButtonShowing)
		local v197 = v192.current.name ~= AvatarScreen.TryOnManager and (isMultiTryOn and v196)
		local v198 = useOpenQuickMenuCallback(v188)
		local v199 = React.useCallback(function(p40) -- line: 856
			-- upvalues: NavigationUtils (copy), p39 (copy)
			p40.cancelled = true
			NavigationUtils.closeFocusedScreen(p39.navigation)
		end, { p39.navigation })
		local v200 = React.useCallback(function() -- line: 862
			-- upvalues: u185 (ref), OpenItemPrompt (copy), u184 (ref), v189 (copy), v188 (copy), p39 (copy), v192 (copy)
			u185(OpenItemPrompt(u184, v189, v188, p39.navigation, v192))
		end, {
			u185,
			u184,
			v189,
			v188,
			p39.navigation,
			v192
		})
		local v201 = React.useCallback(function() -- line: 870
			-- upvalues: p39 (copy), AvatarScreen (copy), v192 (copy), v188 (copy)
			p39.navigation.navigate(AvatarScreen.CatalogContextMenu, {
				itemId = v192.current.params.itemId,
				itemType = v192.current.params.itemType,
				onOverlayClosed = v188
			})
		end, {
			p39.navigation,
			v192,
			v188
		})
		local v202 = useSelector(selectTryOnManagerViewState)
		local v203 = React.useCallback(function() -- line: 880
			-- upvalues: v202 (copy), PeekViewState (copy), u185 (ref), SetTryOnManagerPeekViewState (copy)
			local v251 = if v202 ~= PeekViewState.Full and v202 ~= PeekViewState.Extended then PeekViewState.Full else PeekViewState.Brief

			u185(SetTryOnManagerPeekViewState(v251))
		end, {
			v202,
			u185
		})
		local v204 = React.useCallback(function() -- line: 888
			-- upvalues: NavigationUtils (copy), p39 (copy), AvatarScreen (copy)
			NavigationUtils.closeFiltersAndItemDetails(p39.navigation)
			p39.navigation.navigate(AvatarScreen.TryOnManager)
		end, { p39.navigation })
		local v205 = React.useCallback(function() -- line: 893
			-- upvalues: v190 (copy), AvatarScreen (copy)
			v190:fire(AvatarScreen.Catalog)
		end, { v190 })
		local v206 = React.useMemo(function() -- line: 897
			-- upvalues: FocusNavigationEventNameEnum (copy), v194 (copy), v197 (copy)
			return {
				[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
				[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
				[Enum.KeyCode.ButtonStart] = FocusNavigationEventNameEnum.OpenQuickMenu,
				[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt,
				[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.OpenCatalogContextMenu,
				[Enum.KeyCode.ButtonY] = if not v194 and not v197 then FocusNavigationEventNameEnum.Search else FocusNavigationEventNameEnum.ToggleTryOnManager
			}
		end, {
			v194,
			v197
		})

		if FFlagAXHideCatalogShortcutsInFullView then
			local v207 = React.useCallback(function(p41) -- line: 911
				-- upvalues: selectIsFullView (copy), v192 (copy), FullView (copy)
				return selectIsFullView(p41, v192.opaque.name) == FullView.SceneFullView
			end, { v192.opaque.name })
			local v208 = not useSelector(v207)

			v209 = useCatalogPageFocusNavigationBindings(v206, {
				onNavigateBack = if not v208 or not v193 then nil else v199,
				onOpenQuickMenu = if not v208 or not v191 then nil else v198,
				onOpenBuyItemPrompt = if not v208 or not v193 then nil else v200,
				onOpenContextMenu = if not v208 or not v193 then nil else v201,
				onToggleSearch = if not v208 then nil else v205,
				onToggleTryOnManager = if not v208 or not v194 then if not v197 then nil else v204 else v203
			})
		else
			v209 = useCatalogPageFocusNavigationBindings(v206, {
				onNavigateBack = if not v193 then nil else v199,
				onOpenQuickMenu = if not v191 then nil else v198,
				onOpenBuyItemPrompt = if not v193 then nil else v200,
				onOpenContextMenu = if not v193 then nil else v201,
				onToggleSearch = v205,
				onToggleTryOnManager = if not v194 then if not v197 then nil else v204 else v203
			})
		end
	else
		v209 = useAvatarExperienceFocusNavigationBindings({
			overlayClosedCallback = v188
		})
	end

	if FFlagAXAvatarTimeoutFlow then
		local v210 = useAvatarRoute()
		local v211 = if not FFlagAXRefetchAvatarOnTimeout then nil else React.useCallback(function() -- line: 951
			-- upvalues: u185 (ref), RefetchAvatarData (copy), u184 (ref)
			u185(RefetchAvatarData(u184, true))
		end, {
			u185,
			u184
		})

		useCatalogPageTimeoutPrompt(p39.navigation, if not FFlagAXRefetchAvatarOnTimeout or v210.opaque.name ~= AvatarScreen.Catalog then nil else v211)
	end

	if FFlagAXMakeupReleaseFTUX then
		local v212 = useAvatarRoute()
		local v213 = React.useCallback(function() -- line: 966
			-- upvalues: GetCatalogCategoriesStore (copy), CatalogCategories (copy)
			GetCatalogCategoriesStore.getCatalogSelectionStore().changeCategory(CatalogCategories.Makeup:rawValue(), nil)
		end, {})

		useCatalogPageMakeupReleaseFtux(v212, p39.navigation, v213)
	end

	local v214 = Cryo.Dictionary.join(p39, {
		focusController = if not FFlagAXMigrateAXToGlobalAutofocus then v186 else nil,
		overlayClosedCallback = v188,
		androidBackButtonConnection = current,
		is10ftUI = useUiModeInfo().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
	})

	if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
		useCatalogPageRevertToLastEquippedStateHook()
	end

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = v209
	}, React.createElement(u147, v214))
end
