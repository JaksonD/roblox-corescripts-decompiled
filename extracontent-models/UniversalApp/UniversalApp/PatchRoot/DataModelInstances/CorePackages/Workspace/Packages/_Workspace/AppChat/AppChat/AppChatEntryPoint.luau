local AppChat = script:FindFirstAncestor("AppChat")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppChatParent = AppChat.Parent
local ArgCheck = require(AppChatParent.ArgCheck)
local Cryo = require(AppChatParent.Cryo)

require(AppChat.types)

local SharedFlags = require(AppChatParent.SharedFlags)
local Logger = require(AppChatParent.Loggers).Logger
local Logger2 = require(AppChat.Logger)
local getRoactChatStackNavigator = require(AppChat.getRoactChatStackNavigator)
local useTokens = require(AppChatParent.Foundation).Hooks.useTokens
local rootNavigator = nil
local rootNavigator2 = nil
local v13 = not require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)()
local usePageSideMargin = require(AppChatParent.CollectionViews).usePageSideMargin

if not v13 then
	rootNavigator = require(AppChat.Navigators.Compact.rootNavigator)
	rootNavigator2 = require(AppChat.Navigators.Wide.rootNavigator)
end

local AnalyticsProvider = require(AppChat.LegacyAnalytics.AnalyticsProvider)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local TopBarContext = require(AppChat.TopBarContext)
local ChatPlacementContext = require(AppChat.Contexts.ChatPlacementContext)
local FFlagAppChatTopBarSignalsStore = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local LuaAppNavigationContextProvider = require(AppChat.LuaAppNavigationContextProvider)
local SetTabBarVisible = require(AppChatParent.AppTabBarRodux).Actions.SetTabBarVisible
local RoactChatAnalyticsProvider = require(AppChat.Analytics.RoactChatAnalyticsProvider)
local AppTelemetryLayer = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local React = require(AppChatParent.React)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local UserInputService = game:GetService("UserInputService")
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useAppPolicy = require(AppChat.Hooks.useAppPolicy)
local useCallback = React.useCallback
local useChatIsVisible = require(AppChat.Hooks.useChatIsVisible)
local useCurrentSquadParentChannelId = require(AppChatParent.SquadsCore).Hooks.useCurrentSquadParentChannelId
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = React.useEffect
local useIsVoiceConnected = require(AppChatParent.CrossExperienceVoice).Hooks.useIsVoiceConnected
local useRef = React.useRef
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = React.useState
local useStyle = require(AppChatParent.UIBlox).Core.Style.useStyle
local useRobloxLocale = require(AppChat.Hooks.useRobloxLocale)
local ReplyingToMessageProvider = require(AppChat.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider)
local FFlagAppChatSignalsReplyStore = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local LayerCollectorProvider = require(AppChatParent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled)
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local InteractionFeedback = require(AppChatParent.InteractionFeedback)
local HapticFeedbackConfig = require(AppChat.Utils.HapticFeedback).HapticFeedbackConfig
local createConversation = require(AppChat.Conversations.Thunks.createConversation)
local fetchLatestConversationDetails = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local EnumScreens = require(script.Parent.EnumScreens)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableCrossExpVoice = require(AppChatParent.SharedFlags).GetFFlagEnableCrossExpVoice
local EnteredChatFromEntryPoint = require(AppChat.Actions.EnteredChatFromEntryPoint)
local NavigateIntoChat = require(AppChat.Actions.NavigateIntoChat)
local getFFlagHideNotificationIconForVR = require(AppChat.Flags.getFFlagHideNotificationIconForVR)
local getFFlagFixChatsBottomInsetBackgroundColor = require(AppChat.Flags.getFFlagFixChatsBottomInsetBackgroundColor)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local GetFFlagEnableAppChatInExperience = SharedFlags.GetFFlagEnableAppChatInExperience
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagSupportViewingUserProfileOnOSA = require(AppChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local GetOverlayStore = require(AppChat.Stores.GetOverlayStore)
local navigateWithOsaGate = require(AppChat.Utils.navigateWithOsaGate)
local FFlagAppChatShowOSAOnPageEntry = SharedFlags.FFlagAppChatShowOSAOnPageEntry
local FFlagEnableHeaderBarButtonsUpdate = SharedFlags.FFlagEnableHeaderBarButtonsUpdate
local Constants = require(AppChat.Constants)
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local NAV_BAR_WITH_FACEPILE_SIZE = Constants.NAV_BAR_WITH_FACEPILE_SIZE
local t1 = {
	logger = Logger,
	navigateToLuaAppPages = nil,
	parameters = nil,
	rnBypassActionSignal = nil,
	setActiveConversationId = nil,
	setBackButtonEnabled = nil,
	setTabBarVisible = function() --[[ setTabBarVisible ]] -- line: 128
	end,
	setInitialConversationId = function(_) --[[ setInitialConversationId ]] -- line: 129
	end,
	wideMode = false,
	notificationCount = 0,
	navigateToRootStack = nil,
	androidBackButtonSignal = nil,
	initialConversationId = "",
	chatPlacement = ChatPlacementContext.Enum.Unknown
}

function AppChatEntryPoint(p2) -- line: 142
	-- upvalues: Cryo (copy), t1 (copy), ChatPlacementContext (copy), useTokens (copy), v13 (copy), rootNavigator (ref), AppChat (copy), rootNavigator2 (ref), useSelector (copy), useCallback (copy), useDispatch (copy), useEffect (copy), AppChatNetworking (copy), Logger2 (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useChatIsVisible (copy), useState (copy), React (copy), RoactNavigation (copy), getRoactChatStackNavigator (copy), useRef (copy), FFlagSupportViewingUserProfileOnOSA (copy), GetOverlayStore (copy), EnumScreens (copy), createConversation (copy), fetchLatestConversationDetails (copy), GetFFlagIsSquadEnabled (copy), FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), GetTopBarStore (copy), ArgCheck (copy), FFlagAppChatTopBarSignalsStore (copy), EnteredChatFromEntryPoint (copy), NavigateIntoChat (copy), useCurrentSquadParentChannelId (copy), GetFFlagEnableCrossExpVoice (copy), useIsVoiceConnected (copy), useAppPolicy (copy), getFFlagHideNotificationIconForVR (copy), usePageSideMargin (copy), useIsChatEnabled (copy), FFlagAppChatTopBarConfigDriven (copy), GetFFlagEnableAppChatInExperience (copy), useStyle (copy), SetTabBarVisible (copy), UserInputService (copy), NAV_BAR_WITH_FACEPILE_SIZE (copy), FFlagEnableHeaderBarButtonsUpdate (copy), LuaAppNavigationContextProvider (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagAppChatSignalsReplyStore (copy), ReplyingToMessageProvider (copy), InteractionFeedback (copy), HapticFeedbackConfig (copy), LayerCollectorProvider (copy), useRobloxLocale (copy), RbxAnalyticsService (copy), AnalyticsProvider (copy), AppTelemetryLayer (copy), TopBarContext (copy), getFFlagFixChatsBottomInsetBackgroundColor (copy), RoactChatAnalyticsProvider (copy)
	local v73 = Cryo.Dictionary.join(t1, p2)
	local v74 = ChatPlacementContext.isPlacementInExperience(v73.chatPlacement)
	local v75 = useTokens()

	if v13 then
		rootNavigator = require(AppChat.Navigators.Compact.rootNavigator)
		rootNavigator2 = require(AppChat.Navigators.Wide.rootNavigator)
	end

	local v76 = useSelector(useCallback(function(p3) -- line: 153
		return p3.LocalUserId
	end, {})) or v73.localUserId
	local v77 = useSelector(useCallback(function(p4) -- line: 156
		return p4.GlobalGuiInset
	end, {})) or {
		bottom = 0
	}
	local v78 = useSelector(useCallback(function(p5) -- line: 159
		return p5.ChatAppReducer.LastEntryPoint
	end, {}))
	local v79 = useDispatch()

	useEffect(function() -- line: 166
		-- upvalues: v79 (copy), AppChatNetworking (copy), v74 (copy), Logger2 (copy)
		v79(AppChatNetworking.rodux.GetChatLandingModal.API(v74)):catch(function(p6) -- line: 167
			-- upvalues: Logger2 (copy)
			Logger2:warning("Error in GetChatLandingModal request. Error: {}", (tostring(p6)))
		end)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79, v76, v74) else {
		v79,
		v76,
		v74
	})

	local v80 = useChatIsVisible()
	local v81, v82 = useState({})
	local v83 = React.useMemo(function() -- line: 181
		-- upvalues: RoactNavigation (copy), getRoactChatStackNavigator (copy), v73 (copy), rootNavigator2 (ref), rootNavigator (ref)
		return RoactNavigation.createAppContainer(getRoactChatStackNavigator(v73.wideMode and rootNavigator2 or rootNavigator, v73.navigateToRootStack, v73.androidBackButtonSignal, v73.androidBackButtonConnection))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73.wideMode, rootNavigator2, rootNavigator, v73.navigateToRootStack, v73.androidBackButtonSignal, v73.androidBackButtonConnection) else {
		v73.wideMode,
		rootNavigator2,
		rootNavigator,
		v73.navigateToRootStack,
		v73.androidBackButtonSignal,
		v73.androidBackButtonConnection
	})
	local v84 = if not v74 then useRef(RoactNavigation.createAppContainer(getRoactChatStackNavigator(v73.wideMode and rootNavigator2 or rootNavigator, v73.navigateToRootStack, v73.androidBackButtonSignal, v73.androidBackButtonConnection))) else v83

	if not v74 then
		v84 = v84.current
	end

	local v85 = useRef(false)
	local v86 = useRef(nil)
	local v87 = useRef(function(...) -- line: 229
	end)

	useEffect(function() -- line: 231
		-- upvalues: v73 (copy), Logger2 (copy)
		if v73.logger then
			Logger2:setParent(v73.logger)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73.logger) else { v73.logger })

	local v88 = useCallback(function(p7) -- line: 238
		-- upvalues: v85 (copy), v87 (copy)
		if not v85.current then
			return
		end

		if v87.current then
			v87.current(p7)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v85, v87) else {
		v85,
		v87
	})

	if FFlagSupportViewingUserProfileOnOSA then
		local navigateToLuaAppPages = v73.navigateToLuaAppPages

		useEffect(function() -- line: 254
			-- upvalues: GetOverlayStore (copy), navigateToLuaAppPages (copy), EnumScreens (copy)
			GetOverlayStore(false).setOverlayDefaultProps({
				onViewUserProfile = if not navigateToLuaAppPages then nil else navigateToLuaAppPages[EnumScreens.ViewUserProfile]
			})
		end, { navigateToLuaAppPages })
	end

	local v90 = useCallback(function(p8) -- line: 264
		-- upvalues: RoactNavigation (copy), EnumScreens (copy)
		return RoactNavigation.Actions.navigate({
			routeName = EnumScreens.ChatConversation,
			params = {
				conversationId = p8
			}
		})
	end, {})
	local v91 = useCallback(function(p9, p10) -- line: 272
		-- upvalues: RoactNavigation (copy), EnumScreens (copy), v73 (copy)
		local t2 = {
			RoactNavigation.Actions.navigate({
				routeName = EnumScreens.ChatConversation,
				params = {
					conversationId = p9
				}
			}),
			RoactNavigation.Actions.navigate({
				routeName = EnumScreens.SquadLobby,
				params = {
					conversationId = p9,
					extraParams = p10
				}
			})
		}

		if v73.wideMode then
			return RoactNavigation.Actions.navigate({
				routeName = EnumScreens.ChatLanding,
				params = {
					conversationId = p9
				},
				action = RoactNavigation.StackActions.reset({
					index = 2,
					actions = t2
				})
			})
		end

		table.insert(t2, 1, RoactNavigation.Actions.navigate({
			routeName = EnumScreens.ChatLanding
		}))

		return RoactNavigation.Actions.navigate({
			routeName = EnumScreens.ChatLandingStack,
			params = {
				conversationId = p9
			},
			action = RoactNavigation.StackActions.reset({
				index = 3,
				actions = t2
			})
		})
	end, { v73.wideMode })
	local v92 = useCallback(function(p11) -- line: 321
		-- upvalues: v79 (copy), createConversation (copy)
		return v79(createConversation("one_to_one", { p11 }))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79) else { v79 })
	local v93 = useCallback(function(s1: string) -- line: 325
		-- upvalues: v79 (copy), fetchLatestConversationDetails (copy)
		return v79(fetchLatestConversationDetails(s1))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79) else { v79 })
	local v94 = useCallback(function(p12: ((...any) -> ...any)) -- line: 330
		-- upvalues: v87 (copy), v73 (copy), GetFFlagIsSquadEnabled (copy), Cryo (copy), FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), v79 (copy), v91 (copy), EnumScreens (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), v93 (copy), Logger2 (copy), v90 (copy), v92 (copy), RoactNavigation (copy)
		v87.current = p12

		if not v73.updateExternalNavigationForScreen then
			return function() -- line: 333
				-- upvalues: v87 (copy)
				v87.current = nil
			end
		end

		local updateExternalNavigationForScreen = v73.updateExternalNavigationForScreen

		if GetFFlagIsSquadEnabled() then
			updateExternalNavigationForScreen(function(p13) -- line: 340
				-- upvalues: Cryo (copy), FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), v79 (copy), p12 (copy), v91 (copy)
				local conversationId = p13.conversationId
				local v151 = Cryo.Dictionary.omit(p13, "conversationId")

				if FFlagAppChatShowOSAOnPageEntry then
					navigateWithOsaGate({
						conversationId = conversationId,
						dispatch = v79,
						onAccepted = function() --[[ onAccepted ]] -- line: 347
							-- upvalues: p12 (copy), v91 (copy), conversationId (copy), v151 (copy)
							p12(v91(conversationId, v151))
						end,
						requireMultiUserForU13 = true
					})

					return
				end

				p12(v91(conversationId, v151))
			end, EnumScreens.SquadLobby)
		end

		updateExternalNavigationForScreen(function(p14) -- line: 358
			-- upvalues: FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), v79 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), v93 (copy), Logger2 (copy), p12 (copy), v90 (copy), v92 (copy)
			local v153 = p14 and p14.conversationId

			if v153 then
				if not FFlagAppChatShowOSAOnPageEntry then
					if FFlagAppChatPerfTracking then
						AppChatPerfTracker.start(AppChatPerfTracker.Events.ChatConversationTTI, {
							conversationId = v153
						})
					end

					v93(v153):andThen(function() -- line: 400
						-- upvalues: Logger2 (copy), v153 (copy), p12 (copy), v90 (copy)
						Logger2:info("Successfully fetched conversation details for conversationId {} for external navigation", v153)
						p12(v90(v153))
					end):catch(function(p15) -- line: 407
						-- upvalues: Logger2 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), v153 (copy)
						Logger2:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(p15)))

						if FFlagAppChatPerfTracking then
							AppChatPerfTracker.cancel(AppChatPerfTracker.Events.ChatConversationTTI, {
								conversationId = v153
							})
						end
					end)

					return
				end

				navigateWithOsaGate({
					conversationId = v153,
					dispatch = v79,
					onAccepted = function() --[[ onAccepted ]] -- line: 366
						-- upvalues: FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), v153 (copy), v93 (copy), Logger2 (copy), p12 (copy), v90 (copy)
						if FFlagAppChatPerfTracking then
							AppChatPerfTracker.start(AppChatPerfTracker.Events.ChatConversationTTI, {
								conversationId = v153
							})
						end

						v93(v153):andThen(function() -- line: 373
							-- upvalues: Logger2 (copy), v153 (copy), p12 (copy), v90 (copy)
							Logger2:info("Successfully fetched conversation details for conversationId {} for external navigation", v153)
							p12(v90(v153))
						end):catch(function(p16) -- line: 380
							-- upvalues: Logger2 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), v153 (copy)
							Logger2:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(p16)))

							if FFlagAppChatPerfTracking then
								AppChatPerfTracker.cancel(AppChatPerfTracker.Events.ChatConversationTTI, {
									conversationId = v153
								})
							end
						end)
					end
				})
			end

			local v154 = p14 and p14.userId

			if not v154 then
				return
			end

			spawn(function() -- line: 428
				-- upvalues: v92 (copy), v154 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), Logger2 (copy), FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), v79 (copy), p12 (copy), v90 (copy)
				v92(v154):andThen(function(p17) -- line: 430
					-- upvalues: FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), Logger2 (copy), v154 (copy), FFlagAppChatShowOSAOnPageEntry (copy), navigateWithOsaGate (copy), v79 (copy), p12 (copy), v90 (copy)
					if FFlagAppChatPerfTracking then
						AppChatPerfTracker.start(AppChatPerfTracker.Events.ChatConversationTTI, {
							conversationId = p17.id
						})
					end

					Logger2:info("Successfully fetched conversation details for userId {} for external navigation", v154)

					if FFlagAppChatShowOSAOnPageEntry then
						navigateWithOsaGate({
							conversationId = p17.id,
							dispatch = v79,
							onAccepted = function() --[[ onAccepted ]] -- line: 444
								-- upvalues: p12 (copy), v90 (copy), p17 (copy)
								p12(v90(p17.id))
							end
						})

						return
					end

					p12(v90(p17.id))
				end):catch(function(p18) -- line: 452
					-- upvalues: Logger2 (copy)
					Logger2:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(p18)))
				end)
			end)
		end, EnumScreens.ChatConversation)
		updateExternalNavigationForScreen(function(p19) -- line: 462
			-- upvalues: p12 (copy), RoactNavigation (copy), EnumScreens (copy), v73 (copy)
			p12(RoactNavigation.Actions.navigate({
				routeName = EnumScreens.ChatLanding,
				params = p19
			}))

			if v73.wideMode then
				p12(RoactNavigation.Actions.navigate({
					routeName = EnumScreens.EmptyConversation
				}))
			end
		end, EnumScreens.ChatLanding)

		return function() -- line: 474
			-- upvalues: updateExternalNavigationForScreen (copy), EnumScreens (copy), GetFFlagIsSquadEnabled (copy), v87 (copy)
			updateExternalNavigationForScreen(nil, EnumScreens.ChatLanding)
			updateExternalNavigationForScreen(nil, EnumScreens.ChatConversation)

			if GetFFlagIsSquadEnabled() then
				updateExternalNavigationForScreen(nil, EnumScreens.SquadLobby)
			end

			v87.current = nil
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v87) else { v87 })
	local v95 = useCallback(function(p20) -- line: 489
		-- upvalues: GetTopBarStore (copy)
		return GetTopBarStore(false).getScreenTopBar(p20)(false)
	end, {})
	local v96 = useCallback(function(p21, p22) -- line: 494
		-- upvalues: GetTopBarStore (copy)
		GetTopBarStore(false).setScreenTopBar(p21, p22)
	end, {})
	local v97 = useCallback(function(p23) -- line: 498
		-- upvalues: ArgCheck (copy), v81 (copy)
		ArgCheck.isType(p23, "string", "screen")

		return v81[p23] or {}
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v81) else { v81 })
	local v98 = useCallback(function(p24, p25) -- line: 503
		-- upvalues: ArgCheck (copy), v82 (copy), Cryo (copy)
		ArgCheck.isType(p24, "string", "screen")
		ArgCheck.isType(p25, "table", "state")
		v82(function(p26) -- line: 506
			-- upvalues: Cryo (copy), p24 (copy), p25 (copy)
			local v157 = Cryo.Dictionary.join(p26[p24] or {}, p25)

			return Cryo.Dictionary.join(p26, {
				[p24] = v157
			})
		end)
	end, {})
	local v99 = if not FFlagAppChatTopBarSignalsStore then v97 else v95
	local v100 = if not FFlagAppChatTopBarSignalsStore then v98 else v96
	local v101 = useCallback(function(p27) -- line: 522
		-- upvalues: v86 (copy), v88 (copy)
		if v86.current then
			v86.current:disconnect()
			v86.current = nil
		end

		if p27 then
			v86.current = p27:connect(v88)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v86) else { v86 })

	useEffect(function() -- line: 537
		-- upvalues: v85 (copy), v101 (copy), v73 (copy), v79 (copy), EnteredChatFromEntryPoint (copy)
		v85.current = true
		v101(v73.rnBypassActionSignal)

		return function() -- line: 541
			-- upvalues: v85 (copy), v101 (copy), v79 (copy), EnteredChatFromEntryPoint (copy)
			v85.current = false
			v101(nil)
			v79(EnteredChatFromEntryPoint())
		end
	end, {})
	useEffect(function() -- line: 550
		-- upvalues: v73 (copy), v74 (copy), v79 (copy), NavigateIntoChat (copy), EnumScreens (copy), v76 (copy)
		if v73.initialConversationId and (v73.initialConversationId ~= "" and v74) then
			v79(NavigateIntoChat({
				screen = EnumScreens.ChatConversation,
				params = {
					userId = v76,
					conversationId = v73.initialConversationId
				}
			}))
			v73.setInitialConversationId("")
		end

		return function() -- line: 559
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79, v76, v73.initialConversationId, v73.setInitialConversationId) else {
		v79,
		v76,
		v73.initialConversationId,
		v73.setInitialConversationId
	})

	local u102 = nil
	local u103 = nil

	if GetFFlagIsSquadEnabled() then
		u102 = useCurrentSquadParentChannelId()

		if GetFFlagEnableCrossExpVoice() then
			u103 = useIsVoiceConnected()
		end
	end

	useEffect(function() -- line: 580
		-- upvalues: GetFFlagIsSquadEnabled (copy), v74 (copy), v73 (copy), u102 (ref), GetFFlagEnableCrossExpVoice (copy), u103 (ref), v79 (copy), NavigateIntoChat (copy), EnumScreens (copy), v76 (copy)
		if GetFFlagIsSquadEnabled() and (v74 and v73.initialConversationId == "" and u102) then
			if GetFFlagEnableCrossExpVoice() and u103 then
				v79(NavigateIntoChat({
					screen = EnumScreens.SquadLobby,
					params = {
						userId = v76,
						conversationId = u102
					}
				}))

				return
			end

			v79(NavigateIntoChat({
				screen = EnumScreens.ChatConversation,
				params = {
					userId = v76,
					conversationId = u102
				}
			}))
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray() else {})
	useEffect(function() -- line: 602
		-- upvalues: v101 (copy), v73 (copy)
		v101(v73.rnBypassActionSignal)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73.rnBypassActionSignal) else { v73.rnBypassActionSignal })
	useEffect(function() -- line: 611
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), Cryo (copy), v81 (copy), v82 (copy)
		if not FFlagAppChatTopBarSignalsStore and not Cryo.isEmpty(v81) then
			v82({})
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73.wideMode, FFlagAppChatTopBarSignalsStore) else {
		v73.wideMode,
		FFlagAppChatTopBarSignalsStore
	})

	local v104 = useAppPolicy(function(p28) -- line: 621
		return p28.getChatHeaderSearch()
	end)
	local v105 = useAppPolicy(function(p29) -- line: 624
		return p29.getChatHeaderCreateChatGroup()
	end)
	local v106 = useAppPolicy(function(p30) -- line: 627
		-- upvalues: getFFlagHideNotificationIconForVR (copy)
		return p30.getChatHeaderNotifications() and (not getFFlagHideNotificationIconForVR() or p30.getWebViewSupport())
	end)
	local v107 = usePageSideMargin(v84.current)
	local v108 = React.useMemo(function() -- line: 633
		-- upvalues: v74 (copy), v107 (copy)
		return {
			outer = if not v74 then v107 else 12,
			inner = if not v74 then v107 else 12,
			default = 12
		}
	end, {
		v107,
		v74
	})
	local v109 = useIsChatEnabled()
	local v110 = if not FFlagAppChatTopBarConfigDriven() then not v74 and v106 else nil
	local v111 = if not FFlagAppChatTopBarConfigDriven() then v104 and (not v74 and v109) else nil
	local v112 = if not FFlagAppChatTopBarConfigDriven() then v105 and v109 else nil
	local v113 = if not FFlagAppChatTopBarConfigDriven() then v74 and GetFFlagEnableAppChatInExperience() else nil
	local v114 = useStyle()
	local v115 = useCallback(function(p31) -- line: 659
		-- upvalues: v79 (copy), SetTabBarVisible (copy)
		v79(SetTabBarVisible(p31))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79) else { v79 })
	local v116 = React.createElement(v84, {
		externalDispatchConnector = v94,
		parameters = v73.parameters,
		setActiveConversationId = v73.setActiveConversationId,
		setBackButtonEnabled = v73.setBackButtonEnabled,
		setTabBarVisible = v115,
		chatIsVisible = v80,
		screenProps = {
			navigateToLuaAppPages = v73.navigateToLuaAppPages,
			topBarHeight = math.max(UserInputService.NavBarSize.Y, if not v75 then NAV_BAR_WITH_FACEPILE_SIZE else v75.Size.Size_1400),
			wideMode = v73.wideMode,
			isInExperience = v74,
			isVisible = v73.isVisible,
			notificationCount = v73.notificationCount,
			appChatOuterPadding = v108.outer,
			appChatInnerPadding = v108.inner,
			appChatDefaultPadding = v108.default,
			topBarShowSearch = v111,
			topBarShowCreateChatGroup = v112,
			topBarShowNotifications = v110,
			topBarShowSnoozeNotifications = v113,
			topBarUtilityIconSideMargin = if not FFlagEnableHeaderBarButtonsUpdate then nil else v75.Size.Size_100,
			showSearchRow = v74,
			navigateToRootStack = v73.navigateToRootStack,
			navigateToAddFriends = v73.navigateToAddFriends,
			getScreenTopBar = if not FFlagAppChatTopBarSignalsStore then v99 else nil,
			setScreenTopBar = if not FFlagAppChatTopBarSignalsStore then v100 else nil
		}
	})
	local v117 = React.createElement(LuaAppNavigationContextProvider, {
		navigateToLuaAppPages = v73.navigateToLuaAppPages,
		dispatch = v79
	}, {
		navigation = v116
	})
	local v118 = React.createElement(ChatPlacementContext.Provider, {
		value = {
			chatPlacement = v73.chatPlacement
		}
	}, {
		navigation = v117
	})

	if getFFlagAppChatEnableRepliesUI() then
		if not FFlagAppChatSignalsReplyStore then
			v118 = React.createElement(ReplyingToMessageProvider, {}, {
				navigation = v118
			})
		end

		v118 = React.createElement(InteractionFeedback.InteractionFeedbackContext.Provider, {
			value = HapticFeedbackConfig
		}, {
			navigation = v118
		})
	end

	if not v74 then
		v118 = React.createElement(LayerCollectorProvider, {}, {
			navigation = v118
		})
	end

	local v119 = useRobloxLocale()
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	local v121 = if not GetFFlagIsSquadEnabled() then nil else useSelector(function(p32) -- line: 733
		local v147 = p32.Squad and (p32.Squad.Squad and p32.Squad.Squad.currentSquad)

		if v147 and v147.squadId then
			return v147.squadId
		end

		return nil
	end)
	local v122 = React.createElement(AnalyticsProvider, {
		localUserId = v76,
		entryPoint = v78
	}, {
		telemetry = React.createElement(AppTelemetryLayer.Provider, {
			value = {
				context = "platformChat",
				locale = v119,
				entryPoint = v78 or "unknown",
				userId = v76,
				playSessionId = PlaySessionId,
				currentSquadId = v121,
				placement = v73.chatPlacement
			}
		}, { React.createElement(if not FFlagAppChatTopBarSignalsStore then TopBarContext.Provider else React.Fragment, if not FFlagAppChatTopBarSignalsStore then {
			value = Cryo.Dictionary.join(v81, {
				getScreenTopBar = v99,
				setScreenTopBar = v100
			})
		} else nil, {
			navigation = v118,
			BottomInsetBackground = if not (v77.bottom > 0) then nil else React.createElement("Frame", {
				BackgroundColor3 = if not getFFlagFixChatsBottomInsetBackgroundColor() then v114.Theme.NavigationBar.Color else v114.Theme.BackgroundDefault.Color,
				BackgroundTransparency = if not getFFlagFixChatsBottomInsetBackgroundColor() then v114.Theme.NavigationBar.Transparency else v114.Theme.BackgroundDefault.Transparency,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, v77.bottom),
				ZIndex = 3
			})
		}) })
	})

	if FFlagAppChatPerfTracking then
		useEffect(function() -- line: 787
			-- upvalues: AppChatPerfTracker (copy), v73 (copy), v78 (copy), v121 (copy)
			AppChatPerfTracker.setSharedContext({
				placement = v73.chatPlacement,
				entryPoint = v78,
				hasActiveParty = v121 ~= nil
			})
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v73.chatPlacement, v78, v121) else {
			v73.chatPlacement,
			v78,
			v121
		})
	end

	return React.createElement(RoactChatAnalyticsProvider, {
		entryPoint = v78
	}, { v122 })
end

return memo(AppChatEntryPoint)
