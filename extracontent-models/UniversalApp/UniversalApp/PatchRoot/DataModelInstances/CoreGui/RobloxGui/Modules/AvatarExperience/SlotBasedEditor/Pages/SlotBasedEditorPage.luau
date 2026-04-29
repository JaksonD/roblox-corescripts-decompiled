local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepad.Focusable
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local Cryo = require(CorePackages.Packages.Cryo)
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local Foundation = require(CorePackages.Packages.Foundation)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceControlBar = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local AvatarExperienceSave = require(CorePackages.Workspace.Packages.AvatarExperienceSave)
local AvatarExperienceSlotBasedEditor = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local NavigateToSearch = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local FullView = AvatarExperienceCommon.Enums.FullView
local selectIsFullView = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local GetAvatarEditorCategories = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SetCategoryAndSubcategory = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local SetCategoryAndSubcategory2 = require(Modules.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory)
local Exit3DFullView = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local NormalizeAvatar = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local SetFullView = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local Analytics = require(Modules.AvatarExperience.Common.Services.Analytics)
local Analytics2 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local createInventoryStoresFromCategories = require(Modules.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories)
local createSortAndFiltersStore = AvatarExperienceSlotBasedEditor.Stores.createSortAndFiltersStore
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local withStackVisibilityWrapper = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local useTokens = Foundation.Hooks.useTokens
local useSlotBasedEditorContextValue = require(script.Parent.useSlotBasedEditorContextValue)
local AvatarEditorTopBar = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar)
local AvatarExperienceView = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local AvatarNavigationItemsView = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView)
local SlotsContainer = require(Modules.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer)
local UndoRedoBar = AvatarExperienceControlBar.UndoRedoBar
local SaveButton = AvatarExperienceSave.Components.SaveButton
local OnFocusExperimentExposureLogger = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local SlotBasedEditorContext = AvatarExperienceSlotBasedEditor.Context.SlotBasedEditorContext
local ScreenLayout = AvatarExperienceSlotBasedEditor.Enums.ScreenLayout
local ItemView = AvatarExperienceSlotBasedEditor.Enums.ItemView
local AvatarEditorCategories = AvatarExperienceSlotBasedEditor.Enums.AvatarEditorCategories
local NavigationParams = AvatarExperienceSlotBasedEditor.Enums.NavigationParams
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local Constants = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local GetFFlagAXEnableNewInventoryItemsList = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local GetFFlagAXEnableInventorySortsAndFilters = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local GetFlagAXEnableInitialTopLevelPageCounter = require(Modules.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter)
local FFlagAXCustomizeOverhaulEditorExposure = require(Modules.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure)
local FFlagAXModerationFeatureExposure = require(Modules.AvatarExperience.Flags.FFlagAXModerationFeatureExposure)
local GetFStringAXCatalogAndEditorExposureLayerName = require(Modules.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName)
local FFlagAXCatalogAndEditorExposureUseFStringLayer = require(Modules.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer)
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext
local FFlagAXFixCatalogSearchRedirect = require(Modules.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXSlotsPeekViewScrollFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix
local FFlagAXResetAvatarButton = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXSlotsDesktopRedesign = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign
local FFlagAXEnableEnhancedAvatarHeadsFtux = AvatarExperienceFlags.FFlagAXEnableEnhancedAvatarHeadsFtux
local v72 = game:DefineFastString("AXModerationFeatureLayer", "AvatarExperience.UA.CustomizeView")
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local FFlagAXEnableEditorCategoryDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink
local FFlagAXFixEditorCategoryRenavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixEditorCategoryRenavigation
local FFlagAXMigrateSlotsSignals = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateSlotsSignals
local FFlagAXSlotsDesignUpdatesExposureLogging = AvatarExperienceFlags.FFlagAXSlotsDesignUpdatesExposureLogging
local FStringAXSlotsDesignUpdatesExposureLayer = AvatarExperienceFlags.FStringAXSlotsDesignUpdatesExposureLayer
local v79 = game:DefineFastFlag("AXEditorBackendLayerExposure", false)
local v80 = game:DefineFastString("AXEditorBackendLayerName", "AvatarMarketplace.Editor")
local useEnhancedAvatarHeadsFtux = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useEnhancedAvatarHeadsFtux

local function v82(p1) -- line: 159
	-- upvalues: Cryo (copy)
	return not Cryo.isEmpty(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end

local v83 = if not FFlagAXCustomizeMakeupSupport then nil else function(p2) -- line: 180
	return p2.AvatarExperience.AvatarEditor.Categories.category
end

return (withStackVisibilityWrapper(function() --[[ SlotBasedEditorPage ]] -- line: 185
	-- upvalues: useTokens (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), React (copy), RoactGamepad (copy), useAvatarRoute (copy), useNavigation (copy), useDispatch (copy), FFlagAXMigrateSlotsSignals (copy), useRoactService (copy), Analytics (copy), Analytics2 (copy), GetFFlagAXEnableNewInventoryItemsList (copy), createInventoryStoresFromCategories (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), createSortAndFiltersStore (copy), FFlagAXSlotsPeekViewScrollFix (copy), useSelector (copy), v82 (copy), selectIsFullView (copy), DeviceOrientationMode (copy), FullView (copy), NavigationParams (copy), ItemView (copy), FFlagAXFixCatalogSearchRedirect (copy), useSlotBasedEditorContextValue (copy), SignalsReact (copy), FFlagAXSlotsDesktopRedesign (copy), AvatarExperienceSlotBasedEditor (copy), useLocalization (copy), GetAvatarEditorCategories (copy), ScreenLayout (copy), FFlagAXCustomizeMakeupSupport (copy), v83 (copy), FFlagAXEnableEditorCategoryDeepLink (copy), FFlagAXRootSlotBasedEditorFlag (copy), SetCategoryAndSubcategory2 (copy), SetCategoryAndSubcategory (copy), FFlagAXFixEditorCategoryRenavigation (copy), RoactNavigation (copy), AvatarEditorCategories (copy), Exit3DFullView (copy), AvatarScreen (copy), NavigateToSearch (copy), SetFullView (copy), AvatarEditorTopBar (copy), FFlagAXResetAvatarButton (copy), CatalogConstants (copy), Foundation (copy), UndoRedoBar (copy), SaveButton (copy), SlotsContainer (copy), GetFlagAXEnableInitialTopLevelPageCounter (copy), sendAXCounterV2 (copy), Constants (copy), FFlagAXEnableEnhancedAvatarHeadsFtux (copy), useEnhancedAvatarHeadsFtux (copy), FFlagAXCustomizeOverhaulEditorExposure (copy), IxpUtils (copy), FFlagAXCatalogAndEditorExposureUseFStringLayer (copy), GetFStringAXCatalogAndEditorExposureLayerName (copy), AppUserLayers (copy), FFlagAXModerationFeatureExposure (copy), v72 (copy), v79 (copy), v80 (copy), NormalizeAvatar (copy), Focusable (copy), SlotBasedEditorContext (copy), FFlagAXAvatarEditorStoresContext (copy), AvatarExperienceView (copy), AvatarNavigationItemsView (copy), FFlagAXSlotsDesignUpdatesExposureLogging (copy), OnFocusExperimentExposureLogger (copy), FStringAXSlotsDesignUpdatesExposureLayer (copy)
	local v99 = useTokens()
	local v100 = if not FFlagAXMigrateAXToGlobalAutofocus then React.useRef(RoactGamepad.createFocusController()).current else nil
	local v101 = React.useRef(nil)
	local v102 = useAvatarRoute()
	local v103 = useNavigation()
	local v104 = useDispatch()
	local v105 = if not FFlagAXMigrateSlotsSignals then useRoactService(Analytics) else nil
	local v106 = useRoactService(Analytics2)
	local v107 = if FFlagAXMigrateSlotsSignals or not GetFFlagAXEnableNewInventoryItemsList() then nil else React.useMemo(createInventoryStoresFromCategories, {})
	local v108 = if FFlagAXMigrateSlotsSignals or not GetFFlagAXEnableInventorySortsAndFilters() then nil else React.useMemo(createSortAndFiltersStore, {})
	local v109 = nil
	local v110 = nil
	local g133 = nil
	local v132 = nil

	if FFlagAXSlotsPeekViewScrollFix then
		v109, v110 = React.useBinding(false)
	end

	local v111 = useSelector(v82)
	local v112 = useSelector(function(p3) -- line: 212
		-- upvalues: selectIsFullView (copy), v102 (copy)
		return selectIsFullView(p3, v102.opaque.name)
	end)
	local v113 = useSelector(function(p4) -- line: 215
		-- upvalues: DeviceOrientationMode (copy)
		return p4.DeviceOrientation == DeviceOrientationMode.Portrait
	end)
	local v114 = v112 == FullView.SceneFullView
	local v115 = v112 == FullView.UIFullView
	local v116 = v103.getParam(NavigationParams.itemView) or (v113 and ItemView.SlotItems or not v113 and ItemView.Off)
	local v117 = if not FFlagAXMigrateSlotsSignals then v103.getParam(NavigationParams.fromScreen) else nil
	local v118 = if FFlagAXMigrateSlotsSignals or not FFlagAXFixCatalogSearchRedirect then nil else v103.getParam(NavigationParams.params)
	local v119 = nil
	local v120 = if not FFlagAXMigrateSlotsSignals then nil else useSlotBasedEditorContextValue()
	local u121, setSlotCategory, setSlotIndex

	if FFlagAXMigrateSlotsSignals then
		u121 = SignalsReact.useSignalState(v120.signalStore.getSlotCategory)
		setSlotCategory = v120.signalStore.setSlotCategory
		setSlotIndex = v120.signalStore.setSlotIndex
	else
		local v124, v125 = React.useState(if not FFlagAXSlotsDesktopRedesign then if not v113 then AvatarExperienceSlotBasedEditor.Enums.Categories.Body else AvatarExperienceSlotBasedEditor.Enums.Categories.Avatars else if not v113 then AvatarExperienceSlotBasedEditor.Enums.Categories.All else AvatarExperienceSlotBasedEditor.Enums.Categories.Avatars)

		u121 = v124
		setSlotCategory = v125

		local v126

		v119, v126 = React.useState(1)
		setSlotIndex = v126
	end

	local v127 = useLocalization
	local t1 = {}
	local v129 = u121

	if v116 == ItemView.SlotItems then
		for _, v131 in (GetAvatarEditorCategories()) do
			if v129 == v131.NavigationKey then
				v132 = v131.Title or "Feature.Avatar.Label.Title.MyInventory"
				g133 = true
			end

			if g133 then
				break
			end
		end
	end

	if not g133 then
		v132 = "Feature.Avatar.Label.Title.MyInventory"
	end

	g133 = false
	t1.itemScreenTitle = v132

	local v134 = v127(t1)
	local screenLayout

	if FFlagAXMigrateSlotsSignals then
		screenLayout = v120.screenLayout
	else
		local t2 = {
			isPortrait = v113,
			itemView = v116
		}
		local isPortrait = t2.isPortrait
		local itemView = t2.itemView

		screenLayout = if not isPortrait then ScreenLayout.LandscapeSplit else if itemView == ItemView.Off then ScreenLayout.PortraitSlots else ScreenLayout.PortraitItems
	end

	local v139 = if not FFlagAXCustomizeMakeupSupport then nil else useSelector(v83)

	React.useEffect(function() -- line: 271
		-- upvalues: FFlagAXEnableEditorCategoryDeepLink (copy), v103 (copy), NavigationParams (copy), FFlagAXRootSlotBasedEditorFlag (copy), v113 (copy), FFlagAXCustomizeMakeupSupport (copy), u121 (ref), AvatarExperienceSlotBasedEditor (copy), v139 (copy), setSlotCategory (ref), v104 (copy), SetCategoryAndSubcategory2 (copy)
		if FFlagAXEnableEditorCategoryDeepLink and v103.getParam(NavigationParams.category) ~= nil then
			return
		end

		if FFlagAXRootSlotBasedEditorFlag and v113 and (not FFlagAXCustomizeMakeupSupport or u121 == AvatarExperienceSlotBasedEditor.Enums.Categories.All or v139 == 1) then
			if FFlagAXCustomizeMakeupSupport then
				setSlotCategory(AvatarExperienceSlotBasedEditor.Enums.Categories.Avatars)
			end

			v104(SetCategoryAndSubcategory2(2, nil))
		end
	end, if not FFlagAXCustomizeMakeupSupport then { v113 } else {
		v113,
		u121,
		v139
	})

	if FFlagAXEnableEditorCategoryDeepLink then
		local v140 = React.useCallback(function(p5, p6) -- line: 301
			-- upvalues: GetAvatarEditorCategories (copy), setSlotCategory (ref), v104 (copy), SetCategoryAndSubcategory (copy), v106 (copy), AvatarExperienceSlotBasedEditor (copy), setSlotIndex (ref)
			local v151 = p5 and GetAvatarEditorCategories()[p5]

			if not v151 or not v151.NavigationKey then
				return
			end

			setSlotCategory(v151.NavigationKey)
			v104(SetCategoryAndSubcategory(p5, p6, v106))

			local v152 = if not p6 or (not v151.Subcategories or not v151.Subcategories[p6]) then nil else v151.Subcategories[p6].NavigationKey

			if v152 then
				local v153 = AvatarExperienceSlotBasedEditor.Constants.SlotEditorCategories[v151.NavigationKey]

				if v153 and v153.slots then
					local g157 = nil
					local v156 = nil

					for v154, v155 in v153.slots do
						if v152 == v155.editorSubcategory then
							v156 = v154
							g157 = true
						end

						if g157 then
							break
						end
					end

					if not g157 then
						v156 = nil
					end

					g157 = false

					if v156 then
						setSlotIndex(v156)
					end
				end
			end
		end, {
			v104,
			v106
		})
		local v141 = v103.getParam(NavigationParams.category)
		local v142 = v103.getParam(NavigationParams.subcategory)

		React.useEffect(function() -- line: 327
			-- upvalues: v141 (copy), v140 (copy), v142 (copy), FFlagAXFixEditorCategoryRenavigation (copy), v103 (copy), NavigationParams (copy), RoactNavigation (copy)
			if v141 == nil then
				return
			end

			v140(v141, v142)

			if FFlagAXFixEditorCategoryRenavigation then
				v103.setParams({
					[NavigationParams.category] = RoactNavigation.None,
					[NavigationParams.subcategory] = RoactNavigation.None
				})
			end
		end, {
			v141,
			v142,
			v140
		})
	end

	local v143 = if not FFlagAXMigrateSlotsSignals then React.useCallback(function() -- line: 343
		-- upvalues: GetAvatarEditorCategories (copy), AvatarEditorCategories (copy), v104 (copy), SetCategoryAndSubcategory (copy), v106 (copy), Exit3DFullView (copy), v105 (copy), v103 (copy)
		for _, v159 in (GetAvatarEditorCategories()) do
			if v159.NavigationKey == AvatarEditorCategories.All then
				v104(SetCategoryAndSubcategory(v159.Category, nil, v106))

				break
			end
		end

		v104(Exit3DFullView(v105, v103.state.routeName))
	end, {
		v104,
		v105,
		v103.state.routeName,
		v106
	}) else nil
	local v144 = if not FFlagAXMigrateSlotsSignals then React.useCallback(function() -- line: 357
		-- upvalues: v102 (copy), AvatarScreen (copy), v103 (copy), NavigationParams (copy), ItemView (copy), v143 (copy), FFlagAXFixCatalogSearchRedirect (copy), v117 (copy), v118 (copy), v104 (copy), NavigateToSearch (copy), SetFullView (copy), v105 (copy), FullView (copy)
		local v160 = v102.current.name == AvatarScreen.LookDetails

		v103.navigate(AvatarScreen.AvatarEditor, {
			[NavigationParams.itemView] = ItemView.Off
		})

		if v160 then
			v103.navigate(AvatarScreen.LookDetails)
		end

		v143()

		if FFlagAXFixCatalogSearchRedirect and v117 == AvatarScreen.CatalogSearch and v117 ~= v102.opaque.name then
			if v118 and v118.searchParams then
				local t3 = {
					searchKeyword = v118.searchParams.searchKeyword,
					isKeywordSuggestionEnabled = true
				}

				v104(NavigateToSearch(v103, t3))
			end
		elseif v117 and v117 ~= v102.opaque.name then
			v103.navigate(v117)
		end

		v104(SetFullView(v105, v103.state.routeName, FullView.None))
	end, {
		v143,
		v103,
		v117
	}) else nil
	local v145 = React.useMemo(function() -- line: 388
		-- upvalues: React (copy), AvatarEditorTopBar (copy), v103 (copy), v102 (copy)
		return React.createElement(AvatarEditorTopBar, {
			navigation = v103,
			avatarRoute = v102
		})
	end, {
		v103,
		v102,
		screenLayout,
		u121,
		v134,
		v116
	})
	local v146 = React.useCallback(function(t4: {[any]: any}) -- line: 395
		-- upvalues: FFlagAXResetAvatarButton (copy), v111 (copy), CatalogConstants (copy), React (copy), Foundation (copy), v99 (copy), UndoRedoBar (copy), SaveButton (copy), SlotsContainer (copy)
		local v163 = not FFlagAXResetAvatarButton and (t4.showUndoRedo == nil or t4.showUndoRedo)
		local v164 = t4.showSaveButton ~= nil and t4.showSaveButton
		local v165 = not v111 and 0 or CatalogConstants.ActionBar.ActionBarHeight + CatalogConstants.ActionBar.ActionBarPadding

		return React.createElement(Foundation.View, {
			tag = "col anchor-bottom-left auto-xy size-full-0",
			Position = UDim2.new(0, 0, 1, v99.Radius.Medium),
			padding = {
				bottom = UDim.new(0, v165)
			},
			ZIndex = 2
		}, {
			SceneButtons = React.createElement(Foundation.View, {
				tag = "auto-xy size-full-0",
				padding = {
					left = UDim.new(0, v99.Size.Size_500),
					bottom = UDim.new(0, v99.Size.Size_400),
					right = UDim.new(0, v99.Size.Size_500)
				}
			}, {
				BottomLeftButtons = React.createElement(Foundation.View, {
					tag = "auto-xy",
					Position = UDim2.fromScale(0, 0)
				}, {
					UndoRedoBar = v163 and React.createElement(UndoRedoBar)
				}),
				BottomRightButtons = React.createElement(Foundation.View, {
					tag = "auto-xy anchor-top-right",
					Position = UDim2.fromScale(1, 0)
				}, {
					SaveButton = v164 and React.createElement(SaveButton)
				})
			}),
			SlotsContainer = React.createElement(SlotsContainer)
		})
	end, { v111 })

	if GetFlagAXEnableInitialTopLevelPageCounter() then
		React.useEffect(function() -- line: 444
			-- upvalues: sendAXCounterV2 (copy), Constants (copy)
			sendAXCounterV2(Constants.Counter.TopLevelPageInitialView.SlotBasedEditor)
		end, {})
	end

	if FFlagAXEnableEnhancedAvatarHeadsFtux then
		useEnhancedAvatarHeadsFtux()
	end

	if FFlagAXCustomizeOverhaulEditorExposure then
		React.useEffect(function() -- line: 455
			-- upvalues: IxpUtils (copy), FFlagAXCatalogAndEditorExposureUseFStringLayer (copy), GetFStringAXCatalogAndEditorExposureLayerName (copy), AppUserLayers (copy)
			IxpUtils.logLayerExposure(if not FFlagAXCatalogAndEditorExposureUseFStringLayer then AppUserLayers.AvatarExperienceUAAllViews else GetFStringAXCatalogAndEditorExposureLayerName())
		end, {})
	end

	if FFlagAXModerationFeatureExposure then
		React.useEffect(function() -- line: 465
			-- upvalues: IxpUtils (copy), v72 (copy)
			IxpUtils.logLayerExposure(v72)
		end, {})
	end

	if v79 then
		React.useEffect(function() -- line: 472
			-- upvalues: IxpUtils (copy), v80 (copy)
			IxpUtils.logLayerExposure(v80)
		end, {})
	end

	if FFlagAXCustomizeMakeupSupport then
		React.useEffect(function() -- line: 480
			-- upvalues: v102 (copy), AvatarScreen (copy), v104 (copy), NormalizeAvatar (copy)
			if v102.opaque.name == AvatarScreen.AvatarEditor then
				v104(NormalizeAvatar())
			end
		end, { v102.opaque.name })
	end

	return React.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if not FFlagAXMigrateAXToGlobalAutofocus then v100 else nil
	}, {
		SlotBasedEditorContext = React.createElement(SlotBasedEditorContext.Provider, {
			value = if not FFlagAXMigrateSlotsSignals then {
				handleExitPortraitItems = v144,
				itemView = v116,
				slotCategory = u121,
				setSlotCategory = setSlotCategory,
				screenLayout = screenLayout,
				slotIndex = v119,
				setSlotIndex = setSlotIndex,
				categoryInventoryStores = if not GetFFlagAXEnableNewInventoryItemsList() or FFlagAXAvatarEditorStoresContext then nil else v107,
				sortAndFiltersStore = if not GetFFlagAXEnableInventorySortsAndFilters() or FFlagAXAvatarEditorStoresContext then nil else v108
			} else v120
		}, {
			AvatarExperienceView = React.createElement(AvatarExperienceView, {
				bottomBarEnabled = false,
				showControlBar = true,
				showRobuxBalance = true,
				showUndoRedo = screenLayout == ScreenLayout.PortraitItems or screenLayout == ScreenLayout.LandscapeSplit,
				showSaveButton = screenLayout == ScreenLayout.PortraitItems,
				allowAdaptiveScrolling = screenLayout ~= ScreenLayout.PortraitSlots,
				isSceneFullView = v114,
				isUIFullView = v115,
				topBar = v145,
				multiTryOnBottomBarRef = v101,
				disableScrollViewBindings = if not FFlagAXSlotsPeekViewScrollFix then nil else v109,
				sceneUi = if FFlagAXSlotsDesktopRedesign or (screenLayout ~= ScreenLayout.LandscapeSplit or v114) then nil else v146({
					showUndoRedo = false
				})
			}, {
				Inventory = (screenLayout == ScreenLayout.LandscapeSplit or screenLayout == ScreenLayout.PortraitItems) and React.createElement(AvatarNavigationItemsView, {
					updateDisableScrollView = if not FFlagAXSlotsPeekViewScrollFix then nil else v110
				}),
				SlotsContainer = if screenLayout ~= ScreenLayout.PortraitSlots or v114 then nil else v146({})
			})
		}),
		OnFocusExperimentExposureLogger = if not FFlagAXSlotsDesignUpdatesExposureLogging then nil else React.createElement(OnFocusExperimentExposureLogger, {
			ixpTests = {},
			flagIXPTestLayers = if not FFlagAXSlotsDesignUpdatesExposureLogging then nil else { if not FFlagAXSlotsDesignUpdatesExposureLogging then nil else FStringAXSlotsDesignUpdatesExposureLayer }
		})
	})
end))
