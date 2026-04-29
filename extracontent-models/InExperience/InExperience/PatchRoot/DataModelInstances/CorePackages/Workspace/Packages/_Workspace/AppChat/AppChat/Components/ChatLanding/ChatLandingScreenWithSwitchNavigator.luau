local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local ArgCheck = require(AppChatParent.ArgCheck)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local Roact = require(AppChatParent.Roact)
local UIBlox = require(AppChatParent.UIBlox)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local FocusBehaviors = require(AppChatParent.FocusBehaviors)
local ReactFocusNavigation = require(AppChatParent.ReactFocusNavigation)
local EnumScreens = require(AppChat.EnumScreens)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryState = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryState = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local ChatDetailsTelemetryLayer = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryState = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local TopBarProvider = require(AppChat.TopBarProvider)
local createChatTopBar = require(AppChat.createChatTopBar)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStore = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ChatLandingTopBar = require(AppChat.Components.TopBar.ChatLandingTopBar)
local conversationSwitchNavigator = require(AppChat.Navigators.Wide.conversationSwitchNavigator)
local ConversationStackNavigationFocusListener = require(script.Parent.ConversationStackNavigationFocusListener)
local resetForSquadLobbyForWideMode = require(AppChat.Utils.resetForSquadLobbyForWideMode)
local ChatLandingScreen = require(script.Parent.ChatLandingScreen)
local ChatSearchBox = require(script.Parent.ChatSearchBox)
local ChatLandingContainer = require(script.Parent.ChatLandingContainer)
local Logger = require(script.Parent.Logger)
local getCurrentRoute = require(script.Parent.Utils.getCurrentRoute)
local withStyle = UIBlox.Style.withStyle
local Provider = require(AppChat.Contexts.ChatPagePadding.Provider)
local useGetAndSetRef = require(AppChat.Hooks.useGetAndSetRef)
local SharedFlags = require(AppChatParent.SharedFlags)
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local GetFFlagIsSquadEnabled = SharedFlags.GetFFlagIsSquadEnabled

local function LeftContainerTelemetryProviders(t1: {[any]: any}) -- line: 47
	-- upvalues: useGetAndSetRef (copy), React (copy), ChatLandingTelemetryState (copy), ChatLandingTelemetryLayer (copy)
	local v43, v44 = useGetAndSetRef({})
	local v45 = React.useCallback(function() -- line: 50
		-- upvalues: v43 (copy)
		local v66 = v43()

		return {
			chatLandingListCount = v66.chatLandingListCount,
			pendingConversationCount = v66.pendingConversationCount,
			unfilteredConversationCount = v66.unfilteredConversationCount
		}
	end, { v43 })

	return React.createElement(ChatLandingTelemetryState.Provider, {
		value = {
			get = v43,
			set = v44
		}
	}, { React.createElement(ChatLandingTelemetryLayer.Provider, {
		value = v45
	}, t1.children) })
end
local function RightContainerTelemetryProviders(t2: {[any]: any}) -- line: 74
	-- upvalues: useGetAndSetRef (copy), React (copy), ChatDetailsTelemetryState (copy), ChatDetailsTelemetryLayer (copy), ChatConversationTelemetryState (copy), ChatConversationTelemetryLayer (copy)
	local v47, v48 = useGetAndSetRef({})
	local v49 = React.useCallback(function() -- line: 77
		-- upvalues: v47 (copy)
		local v67 = v47()

		return {
			conversationId = v67.conversationId,
			moderationType = v67.moderationType,
			userPendingStatus = v67.userPendingStatus
		}
	end, { v47 })
	local _ = t2.children
	local v51, v52 = useGetAndSetRef({})
	local v53 = React.useCallback(function() -- line: 89
		-- upvalues: v51 (copy)
		local v68 = v51()

		return {
			participantsCount = v68.participantsCount,
			isGroupOwner = v68.isGroupOwner
		}
	end, {
		v51,
		v47
	})
	local v54 = React.createElement(ChatDetailsTelemetryState.Provider, {
		value = {
			get = v51,
			set = v52
		}
	}, React.createElement(ChatDetailsTelemetryLayer.Provider, {
		value = v53
	}, t2.children))

	return React.createElement(ChatConversationTelemetryState.Provider, {
		value = {
			get = v47,
			set = v48
		}
	}, { React.createElement(ChatConversationTelemetryLayer.Provider, {
		value = v49
	}, v54) })
end

local FFlagEnablePartyQuickStartButton = require(AppChatParent.SharedFlags).FFlagEnablePartyQuickStartButton
local v41 = Roact.PureComponent:extend("ChatLandingScreenWithSwitchNavigator")

v41.router = conversationSwitchNavigator.router
v41.defaultProps = {
	navigation = nil
}

function v41.init(p1) -- line: 133
	-- upvalues: Logger (copy), EnumScreens (copy), getCurrentRoute (copy), FFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForWideMode (copy), RoactNavigation (copy), FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), ArgCheck (copy), FFlagEnableAppChatFocusableFixes (copy), Roact (copy), ReactFocusNavigation (copy)
	function p1.navigateToConversation(p2) -- line: 134
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To Conversation: {} from {screen}", p2)
		p1.props.navigation.navigate(EnumScreens.ChatConversation, {
			conversationId = p2
		})
	end
	function p1.navigateToCreateChat() -- line: 139
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.navigate(EnumScreens.CreateNewChat)
	end
	function p1.navigateToToast(p3) -- line: 144
		-- upvalues: Logger (copy), p1 (copy), EnumScreens (copy)
		Logger:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreens.RoactChatToast, p3)
	end
	function p1.navigateToNotifications() -- line: 149
		-- upvalues: p1 (copy), EnumScreens (copy), Logger (copy)
		local v71 = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.Notifications]

		if v71 then
			Logger:info("Navigate To Notifications from {screen}")
			v71()

			return
		end

		Logger:warning("Notifications page was not set in navigateToLuaAppPages screenProps")
	end
	function p1.navigateToPrivacy() -- line: 160
		-- upvalues: p1 (copy), EnumScreens (copy), Logger (copy)
		local v72 = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.PrivacySettings]

		if v72 then
			Logger:info("Navigate To PrivacySettings from {screen}")
			v72()

			return
		end

		Logger:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	function p1.navigateToSquadLobby(p4) -- line: 171
		-- upvalues: Logger (copy), getCurrentRoute (copy), p1 (copy), EnumScreens (copy), FFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForWideMode (copy), RoactNavigation (copy)
		Logger:info("Navigate To SquadLobby from {screen}")

		local v74 = getCurrentRoute(p1.props.navigation.state)

		if v74 and (v74.params and p4 == v74.params.conversationId and v74.routeName == EnumScreens.ChatConversation) then
			p1.props.navigation.navigate(EnumScreens.SquadLobby, {
				conversationId = p4
			})

			return
		end

		if FFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForWideMode(p1.props.navigation, p4)

			return
		end

		p1.props.navigation.navigate(EnumScreens.ChatLanding, nil, RoactNavigation.StackActions.reset({
			index = 2,
			actions = {
				RoactNavigation.Actions.navigate({
					routeName = EnumScreens.ChatConversation,
					params = {
						conversationId = p4
					}
				}),
				RoactNavigation.Actions.navigate({
					routeName = EnumScreens.SquadLobby,
					params = {
						conversationId = p4
					}
				})
			}
		}))
	end
	function p1.setScreenTopBar(p5) -- line: 208
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), EnumScreens (copy), p1 (copy), ArgCheck (copy)
		if FFlagAppChatTopBarSignalsStore then
			GetTopBarStore(false).setScreenTopBar(EnumScreens.ChatLanding, p5)

			return
		end

		local v76 = p1.props.navigation.getScreenProps("setScreenTopBar", nil)

		ArgCheck.isNotNil(v76, "setScreenTopBar in screenProps")
		v76(EnumScreens.ChatLanding, p5)
	end

	if FFlagEnableAppChatFocusableFixes then
		p1.leftContainerRef = Roact.createRef()
		p1.rightContainerRef = Roact.createRef()
		p1.focusNavigationService = ReactFocusNavigation.FocusNavigationService.new(ReactFocusNavigation.EngineInterface.CoreGui)
	end
end
function v41.render(p6) -- line: 225
	-- upvalues: Logger (copy), ArgCheck (copy), withStyle (copy), Roact (copy), LeftContainerTelemetryProviders (copy), TopBarProvider (copy), EnumScreens (copy), FFlagEnableAppChatFocusableFixes (copy), FFlagAppChatTopBarConfigDriven (copy), ChatLandingTopBar (copy), createChatTopBar (copy), Cryo (copy), ChatLandingScreen (copy), ChatSearchBox (copy), Provider (copy), ChatLandingContainer (copy), RightContainerTelemetryProviders (copy), conversationSwitchNavigator (copy), ConversationStackNavigationFocusListener (copy)
	Logger:info("{screen} render")

	local v57 = ArgCheck.isNotNil(p6.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator")
	local v58 = v57 and v57.getParam("key", "") or ""
	local v59 = v57.getScreenProps("showSearchRow", true)
	local v60 = v57.getScreenProps("topBarHeight", 0)

	return withStyle(function(p7) -- line: 232
		-- upvalues: Roact (copy), LeftContainerTelemetryProviders (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), FFlagEnableAppChatFocusableFixes (copy), p6 (copy), FFlagAppChatTopBarConfigDriven (copy), ChatLandingTopBar (copy), v57 (copy), createChatTopBar (copy), Cryo (copy), ChatLandingScreen (copy), v59 (copy), ChatSearchBox (copy), v60 (copy), Provider (copy), ChatLandingContainer (copy), v58 (copy), RightContainerTelemetryProviders (copy), conversationSwitchNavigator (copy), ConversationStackNavigationFocusListener (copy)
		local t3 = {
			LeftContainerProviders = Roact.createElement(LeftContainerTelemetryProviders, {}, {
				LeftContainer = Roact.createElement(TopBarProvider, {
					screenName = EnumScreens.ChatLanding,
					render = function(p8) --[[ render ]] -- line: 237
						-- upvalues: EnumScreens (copy), ArgCheck (copy), Roact (copy), FFlagEnableAppChatFocusableFixes (copy), p6 (copy), FFlagAppChatTopBarConfigDriven (copy), ChatLandingTopBar (copy), v57 (copy), createChatTopBar (copy), Cryo (copy), ChatLandingScreen (copy), v59 (copy), ChatSearchBox (copy), v60 (copy), Provider (copy), p7 (copy), ChatLandingContainer (copy), v58 (copy)
						local v80 = p8.getScreenTopBar(EnumScreens.ChatLanding)

						ArgCheck.isType(v80, "table", "screenTopBar")

						return Roact.createElement("Frame", {
							Size = UDim2.new(0.37, 0, 1, 0),
							Position = UDim2.new(0, 0, 0, 0),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							[Roact.Ref] = if not FFlagEnableAppChatFocusableFixes then nil else p6.leftContainerRef
						}, {
							layout = Roact.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							leftTopBar = if not FFlagAppChatTopBarConfigDriven() then createChatTopBar(Cryo.Dictionary.join(v80, {
								navigation = v57
							}, ChatLandingScreen.navigationOptions({
								screenProps = nil,
								navigationOptions = nil,
								navigation = v57
							}), {
								backButtonEnabled = false,
								shouldBoldHeader = true
							})) else Roact.createElement(ChatLandingTopBar, {
								screenName = EnumScreens.ChatLanding,
								navigation = v57
							}),
							filterBox = if not v59 then nil else Roact.createElement(ChatSearchBox, {
								height = v60,
								initialText = v80.filterText,
								onFilter = function(p9) --[[ onFilter ]] -- line: 275
									-- upvalues: p8 (copy), EnumScreens (copy)
									p8.setScreenTopBar(EnumScreens.ChatLanding, {
										filterText = p9
									})
								end
							}),
							content = Roact.createElement(Provider, {
								value = {
									left = v57.getScreenProps("appChatOuterPadding", 12),
									right = v57.getScreenProps("appChatInnerPadding", 12)
								}
							}, {
								ChatLanding = Roact.createElement("Frame", {
									BorderSizePixel = 0,
									Size = UDim2.new(1, 0, 1, -v57.getScreenProps("topBarHeight", 0) - (not v59 and 0 or v60)),
									LayoutOrder = 2,
									BackgroundTransparency = p7.Tokens.Global.Color.None.Transparency
								}, {
									ChatLandingContainer = Roact.createElement(ChatLandingContainer, {
										isShowingFilterBox = v80.shouldRenderCenter,
										filterText = v80.filterText,
										navigateToConversation = p6.navigateToConversation,
										navigateToCreateChat = p6.navigateToCreateChat,
										navigateToPrivacy = p6.navigateToPrivacy,
										navigateToSquadLobby = p6.navigateToSquadLobby,
										navigateToToast = p6.navigateToToast,
										navigateToAddFriends = p6.props.navigation.getScreenProps("navigateToAddFriends", {}),
										key = "ChatLanding" .. v58
									})
								})
							})
						})
					end
				})
			}),
			Border = Roact.createElement("Frame", {
				BackgroundColor3 = p7.Theme.Divider.Color,
				BackgroundTransparency = p7.Theme.Divider.Transparency,
				BorderSizePixel = 0,
				Position = UDim2.new(0.37, 0, 0, 0),
				Size = UDim2.new(0, 1, 1, 0)
			}),
			RightContainerProviders = Roact.createElement(RightContainerTelemetryProviders, {}, {
				RightContainer = Roact.createElement("Frame", {
					Size = UDim2.new(0.63, -1, 1, 0),
					Position = UDim2.new(0.37, 1, 0, 0),
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[Roact.Ref] = if not FFlagEnableAppChatFocusableFixes then nil else p6.rightContainerRef
				}, {
					Content = Roact.createElement(Provider, {
						value = {
							left = v57.getScreenProps("appChatInnerPadding", 12),
							right = v57.getScreenProps("appChatOuterPadding", 12)
						}
					}, {
						ConversationSwitchNavigator = Roact.createElement(conversationSwitchNavigator, {
							navigation = v57
						})
					})
				})
			})
		}

		if FFlagEnableAppChatFocusableFixes then
			return Roact.createElement(ConversationStackNavigationFocusListener, {
				navigation = v57,
				leftContainerRef = p6.leftContainerRef,
				rightContainerRef = p6.rightContainerRef
			}, t3)
		end

		return Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p7.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p7.Tokens.Global.Color.None.Transparency,
			BorderSizePixel = 0
		}, t3)
	end)
end
function v41.didMount(p10) -- line: 367
	-- upvalues: Logger (copy), FFlagAppChatTopBarConfigDriven (copy), GetFFlagIsSquadEnabled (copy), FFlagEnableAppChatFocusableFixes (copy), FocusBehaviors (copy)
	Logger:info("{screen} mounted")

	if FFlagAppChatTopBarConfigDriven() then
		local navigation = p10.props.navigation
		local v63 = navigation.getScreenProps("appChatInnerPadding", 12)
		local v64 = if not GetFFlagIsSquadEnabled() then {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		} else {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		}

		p10.setScreenTopBar({
			shouldRenderCenter = false,
			filterText = "",
			headerText = v64,
			backButtonEnabled = false,
			closeButtonEnabled = false,
			isRoot = true,
			isTitleLeftAligned = true,
			leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = v63,
			shouldBoldHeader = true
		})
	else
		p10.setScreenTopBar({
			shouldRenderCenter = false,
			filterText = ""
		})
	end

	if FFlagEnableAppChatFocusableFixes and p10.focusNavigationService then
		p10.focusNavigationService:registerFocusBehavior(p10.leftContainerRef.current, FocusBehaviors.mostRecent())
		p10.focusNavigationService:registerFocusBehavior(p10.rightContainerRef.current, FocusBehaviors.mostRecent())
	end
end
function v41.willUnmount(p11) -- line: 409
	-- upvalues: FFlagEnableAppChatFocusableFixes (copy)
	if FFlagEnableAppChatFocusableFixes then
		p11.focusNavigationService:teardown()
	end
end

return v41
