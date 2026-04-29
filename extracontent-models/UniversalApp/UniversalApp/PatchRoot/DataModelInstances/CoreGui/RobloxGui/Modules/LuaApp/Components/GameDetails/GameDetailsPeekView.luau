local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local PeekViewWithTopBar = require(CorePackages.Workspace.Packages.PeekView).PeekViewWithTopBar
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local getSafeAreaSize = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local peekViewDismissedEvent = require(CorePackages.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local EnumGameDetailErrorTypes = DiscoveryTypes.EnumGameDetailErrorTypes
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local gameDetailsPeekViewEvents = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Constants = require(Modules.LuaApp.Constants)
local SetGameDetailsPeekViewState = require(Modules.LuaApp.Actions.Games.SetGameDetailsPeekViewState)
local GameDetailsTopBar = require(Modules.LuaApp.Components.GameDetails.GameDetailsTopBar)
local ActionBar = require(Modules.LuaApp.Components.GameDetails.ActionBar)
local GameDetailsCard = require(Modules.LuaApp.Components.GameDetails.GameDetailsCard)
local ExperienceDetailsExperimentation = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation)
local GetFFlagIsSquadEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local v28 = game:DefineFastFlag("EnableGameDetailsFullViewIXP", false)
local v29 = game:DefineFastFlag("ForceEnableGameDetailsFullView", false)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local v31 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightIxp", false)
local v32 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightDefault", false)
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagEnablePlayWithRewardComponent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardComponent
local GAME_DETAILS_ACTION_BAR_HEIGHT = DiscoveryTypes.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
local v37 = Roact.PureComponent:extend("GameDetailsPeekView")

function v37.init(p1) -- line: 59
	-- upvalues: Roact (copy), peekViewDismissedEvent (copy), AppPage (copy), SessionType (copy), PeekViewState (copy), gameDetailsPeekViewEvents (copy)
	p1.state = {
		topBarOpacity = 0
	}
	p1.actionBarRef = Roact.createRef()

	local v42, v43 = Roact.createBinding(0)

	p1.transitionPercent = v42
	p1.setTransitionPercent = v43

	function p1.briefToFullTransitionPercent(p2) -- line: 67
		-- upvalues: p1 (copy)
		p1:setState({
			topBarOpacity = p2
		})
	end
	function p1.getPeekViewEventMeta() -- line: 73
		-- upvalues: p1 (copy)
		return {
			universeId = p1.props.universeId,
			source = p1.props.source or "None",
			index = p1.props.index or -1
		}
	end
	function p1.eventTopBarClosePeekView() -- line: 81
		-- upvalues: p1 (copy), peekViewDismissedEvent (copy)
		local eventIngest = p1.props.eventIngest
		local routeName = p1.props.navigation.state.routeName
		local v71 = p1.getPeekViewEventMeta()

		peekViewDismissedEvent.logEvent(eventIngest, "ProfilePeekView", {
			dismissMethod = peekViewDismissedEvent.dismissMethodEnum.topBarTap,
			page = routeName,
			locale = v71.RobloxLocaleId,
			universeId = v71.universeId,
			source = v71.source or "None",
			index = v71.index or -1
		})
	end
	function p1.closeGameDetailsPeekViewInNavigation(p3) -- line: 96
		-- upvalues: p1 (copy), AppPage (copy), SessionType (copy)
		p1.props.navigation.clearAppScreens({ AppPage.GameDetail })

		if p1.props.onClose ~= nil then
			p1.props.onClose()
		end

		if p1.props.onPeekViewClosed and (not p3 or not p3.backButtonNavigation) then
			p1.props.onPeekViewClosed()
		end

		p1.props.sessionService:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
	end
	function p1.viewStateChanged(p4, p5) -- line: 112
		-- upvalues: PeekViewState (copy), p1 (copy)
		if p4 == PeekViewState.Brief then
			local gameDetailsPeekViewState = p1.props.gameDetailsPeekViewState

			if gameDetailsPeekViewState == PeekViewState.Brief then
				p1.eventSwitchGame()
			elseif gameDetailsPeekViewState == PeekViewState.Closed then
				p1.eventOpenPeekView()
			end
		end

		p1.props.setGameDetailsPeekViewState(p4)

		if p4 == PeekViewState.Closed then
			p1.closeGameDetailsPeekViewInNavigation()

			return
		end

		if p5 == PeekViewState.Brief and p4 == PeekViewState.Full then
			p1.eventGoToFullView()
		end
	end
	function p1.eventOpenPeekView() -- line: 131
		-- upvalues: p1 (copy), gameDetailsPeekViewEvents (copy)
		local eventIngest = p1.props.eventIngest
		local universeId = p1.props.universeId
		local v78 = p1.props.source or "None"
		local v79 = p1.props.index or -1

		gameDetailsPeekViewEvents(eventIngest, "OpenPeekView", universeId, v78, v79)
	end
	function p1.eventSwitchGame() -- line: 139
		-- upvalues: p1 (copy), gameDetailsPeekViewEvents (copy)
		local eventIngest = p1.props.eventIngest
		local universeId = p1.props.universeId
		local v82 = p1.props.source or "None"
		local v83 = p1.props.index or -1

		gameDetailsPeekViewEvents(eventIngest, "SwitchGame", universeId, v82, v83)
	end
	function p1.eventGoToFullView() -- line: 147
		-- upvalues: p1 (copy), gameDetailsPeekViewEvents (copy)
		local eventIngest = p1.props.eventIngest
		local universeId = p1.props.universeId
		local v86 = p1.props.source or "None"
		local v87 = p1.props.index or -1

		gameDetailsPeekViewEvents(eventIngest, "GoToFullView", universeId, v86, v87)
	end
end
function v37.willUnmount(p6) -- line: 156
	-- upvalues: AppPage (copy), PeekViewState (copy)
	if (function(_) -- line: 157
		-- upvalues: p6 (copy), AppPage (copy)
		local history = p6.props.history
		local v90 = history[#history]
		local n1 = 0

		for i = 1, #v90 do
			if v90[i].name ~= AppPage.GameDetail then
				continue
			end

			n1 += 1

			if n1 > 1 then
				return false
			end
		end

		return true
	end)(p6.props.universeId) then
		p6.props.setGameDetailsPeekViewState(PeekViewState.Closed)
	end

	if p6.props.onClose ~= nil then
		p6.props.onClose()
	end
end
function v37.render(p8) -- line: 183
	-- upvalues: Constants (copy), getSafeAreaSize (copy), v28 (copy), v29 (copy), PeekViewState (copy), GAME_DETAILS_ACTION_BAR_HEIGHT (copy), v31 (copy), ExperienceDetailsExperimentation (copy), v32 (copy), Roact (copy), PeekViewWithTopBar (copy), ActionBar (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameDetailsCard (copy), FFlagEnablePlayWithRewardComponent (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), GameDetailsTopBar (copy)
	local universeId = p8.props.universeId
	local experienceJoinData = p8.props.experienceJoinData
	local v48 = p8.props.statusBarHeight + Constants.NAV_BAR_SIZE
	local gameDetailsPeekViewState = p8.props.gameDetailsPeekViewState
	local screenSize = p8.props.screenSize
	local globalGuiInset = p8.props.globalGuiInset
	local v52 = math.min(getSafeAreaSize(screenSize, globalGuiInset).X.Offset, 640)
	local v53 = not (v52 < 600) and 40 or 20
	local mountAsFullView = p8.props.mountAsFullView
	local isExperienceUnavailable = p8.props.isExperienceUnavailable

	if mountAsFullView == nil then
		mountAsFullView = not not v28 and p8.props.defaultMountAsFullView and true or (not not v29 or (gameDetailsPeekViewState == PeekViewState.Full or gameDetailsPeekViewState == PeekViewState.Extended))
	end

	local mountAnimation = p8.props.mountAnimation

	if mountAnimation == nil then
		mountAnimation = gameDetailsPeekViewState == PeekViewState.Closed
	end

	local v57 = nil

	if p8.props.showBackButton ~= nil then
		v57 = not p8.props.showBackButton
	end

	local v58 = p8.actionBarRef.current and p8.actionBarRef.current.AbsoluteSize.Y or GAME_DETAILS_ACTION_BAR_HEIGHT
	local v59 = not (not not v31 and ExperienceDetailsExperimentation.getShouldRaisePeekViewBriefHeight()) and not v32 and 0 or 24 + v53

	return Roact.createElement(PeekViewWithTopBar, {
		topBarHeight = v48,
		bottomDockedContainerHeight = v58,
		fullViewContentHeight = UDim.new(1, -v48),
		briefViewContentHeight = UDim.new(0, v52 + GAME_DETAILS_ACTION_BAR_HEIGHT + v59),
		onViewStateChanged = p8.viewStateChanged,
		viewChangedEventMeta = p8.getPeekViewEventMeta(),
		mountAsFullView = mountAsFullView,
		mountAnimation = mountAnimation,
		transitionPercentCallback = p8.setTransitionPercent,
		bottomBarSlot = if not isExperienceUnavailable then Roact.createElement(ActionBar, {
			leftPadding = v53,
			rightPadding = v53,
			bottomPadding = 10,
			universeId = universeId,
			referralSource = p8.props.referralSource,
			experienceJoinData = experienceJoinData,
			placeIdOverride = p8.props.placeIdOverride,
			shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else ExperienceDetailsExperimentation.getShouldHydrateLegacy(),
			containerRef = p8.actionBarRef
		}) else nil,
		contentSlot = Roact.createElement(GameDetailsCard, {
			universeId = universeId,
			source = p8.props.source,
			index = p8.props.index,
			placeIdOverride = if not FFlagEnablePlayWithRewardComponent then nil else p8.props.placeIdOverride,
			experienceJoinData = if not FFlagEnablePlayWithRewardComponent then nil else experienceJoinData,
			viewportBoundsOffset = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else {
				min = Vector2.zero,
				max = Vector2.new(0, -v58)
			},
			onPeekViewClosed = p8.props.onPeekViewClosed
		}),
		topBarSlot = Roact.createElement(GameDetailsTopBar, {
			universeId = universeId,
			showCloseIcon = v57,
			onCloseButtonActivated = function(p9) --[[ onCloseButtonActivated ]] -- line: 274
				-- upvalues: p8 (copy)
				p8.eventTopBarClosePeekView()
				p8.closeGameDetailsPeekViewInNavigation(p9)
			end,
			transitionPercentBinding = p8.transitionPercent
		})
	})
end
function v37.didUpdate(p10, p11) -- line: 283
	if p10.props.searchBarFocused ~= p11.searchBarFocused and p10.props.searchBarFocused then
		p10.closeGameDetailsPeekViewInNavigation()
	end
end

local v38 = RoactRodux.connect(function(p12, p13) -- line: 289
	-- upvalues: EnumGameDetailErrorTypes (copy), GetFFlagIsSquadEnabled (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local v64 = p12.GameDetailErrors[p13.universeId] and p12.GameDetailErrors[p13.universeId].errorType == EnumGameDetailErrorTypes.ExperienceUnavailable

	return {
		currentSquad = if not GetFFlagIsSquadEnabled() then nil else p12.Squad and (p12.Squad.Squad and p12.Squad.Squad.currentSquad),
		history = if not FFlagUseNavigationSelectors then p12.Navigation.history else Selectors.selectLegacyHistory(p12),
		gameDetailsPeekViewState = p12.GameDetailsPeekView.viewState,
		statusBarHeight = p12.TopBar.statusBarHeight,
		screenSize = p12.ScreenSize,
		globalGuiInset = p12.GlobalGuiInset,
		searchBarFocused = p12.SearchBar.focused,
		isExperienceUnavailable = v64
	}
end, function(p14) -- line: 306
	-- upvalues: SetGameDetailsPeekViewState (copy)
	return {
		setGameDetailsPeekViewState = function(p15) --[[ setGameDetailsPeekViewState ]] -- line: 308
			-- upvalues: p14 (copy), SetGameDetailsPeekViewState (copy)
			return p14(SetGameDetailsPeekViewState(p15))
		end
	}
end)(v37)

if v28 then
	v38 = RoactAppExperiment.connectUserLayer({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p16, _) -- line: 317
		-- upvalues: AppUserLayers (copy)
		return {
			defaultMountAsFullView = (p16[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}).DefaultMountAsFullView
		}
	end)(v38)
end

local v39 = RoactServices.connect({
	eventIngest = AppEventIngestService,
	sessionService = AppSessionService
})(v38)

return (RoactNavigation.withNavigation(v39))
