local AppStorageService = game:GetService("AppStorageService")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Foundation = require(AppChatParent.Foundation)
local React = require(AppChatParent.React)
local Roact = require(AppChatParent.Roact)
local withStyle = require(AppChatParent.UIBlox).Style.withStyle
local memoize = require(AppChatParent.AppCommonLib).memoize
local ReactFocusNavigation = require(AppChatParent.ReactFocusNavigation)
local CoreGui = ReactFocusNavigation.EngineInterface.CoreGui
local FocusNavigationService = ReactFocusNavigation.FocusNavigationService
local FocusBehaviors = require(AppChatParent.FocusBehaviors)
local UserInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local RoactNavigation = require(AppChatParent.RoactNavigation)
local MessageList = require(script.Parent.MessageList)
local ReplyComposeBarContainer = require(script.Parent.ReplyComposeBarContainer)
local v18 = if not require(AppChat.Flags.FFlagAppChatNewChatInputBar) then require(script.Parent.ChatInputBarDeprecated) else require(script.Parent.ChatInputBar)
local UserTypingIndicator = require(script.Parent.UserTypingIndicator)
local v20 = require(AppChat.Logger):new(script.Name)
local withChatPagePadding = require(AppChat.Contexts.ChatPagePadding.withChatPagePadding)

require(AppChat.Models.ConversationChannels)

local StatusCodes = require(AppChatParent.Http).StatusCodes
local DateTime = require(AppChatParent.Time).DateTime
local LocalStorageKey = require(AppChatParent.LocalStorage).Enums.LocalStorageKey
local ChatConversationMoreMenu = require(script.Parent.ChatConversationMoreMenu)
local KeyboardOffsetEventHandler = require(script.Parent.KeyboardOffsetEventHandler)
local GlobalLongPressSignal = require(script.Parent.Utils.GlobalLongPressSignal)
local GetReplyingToStore = require(AppChat.Stores.GetReplyingToStore)
local FFlagAppChatSignalsReplyStore = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local FFlagAppChatReplyComposeBarContainer = require(AppChat.Flags.FFlagAppChatReplyComposeBarContainer)
local getFFlagAppChatEnableIntervention = require(AppChatParent.InterventionShared).Flags.getFFlagAppChatEnableIntervention
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local ConversationExitType = require(AppChat.Analytics.Enums.ConversationExitType)
local SendMessageError = require(AppChat.Analytics.Enums.SendMessageError)
local withRoactChatAnalytics = require(AppChat.LegacyAnalytics.withRoactChatAnalytics)
local connectTelemetry = require(AppChat.Telemetry.connectTelemetry)
local ChatConversationTelemetryEvents = require(script.Parent.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local v40 = game:DefineFastFlag("AppChatNewChatInputBarIxpEnabled", false)
local v41 = game:DefineFastString("AppChatNewChatInputBarIxpLayer", "")
local FFlagAppChatEnableDoubleOptIn = require(AppChatParent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatUseSwipeForReplies = require(AppChat.Flags.FFlagAppChatUseSwipeForReplies)
local FFlagIsSquadEnabledAMP = require(AppChatParent.SharedFlags).FFlagIsSquadEnabledAMP
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local EngineFeature = game:GetEngineFeature("ScheduledSquadTooltipSeen")
local FFlagEnableScheduledSquads = require(AppChatParent.SharedFlags).FFlagEnableScheduledSquads
local ScheduledPartiesExperimentation = require(AppChatParent.SocialExperiments).ScheduledPartiesExperimentation
local v50 = if not FFlagAppChatEnableDoubleOptIn then require(script.Parent.ConversationTopModalContainerDeprecated) else require(script.Parent.ConversationTopModalContainer)
local ConversationBottomModalContainer = require(script.Parent.ConversationModal.ConversationBottomModalContainer)
local v52 = Roact.PureComponent:extend("ChatConversation")

v52.defaultProps = {
	topBarHeight = 0,
	conversationId = nil,
	conversationTitle = nil,
	itemList = {},
	inputBoxRef = nil,
	wideMode = false,
	getOlderMessages = function() --[[ getOlderMessages ]] -- line: 78
	end,
	isDebugEnabled = false,
	sendMessage = function() --[[ sendMessage ]] -- line: 80
	end,
	navigateToToast = function() --[[ navigateToToast ]] -- line: 81
	end,
	markConversationAsRead = function() --[[ markConversationAsRead ]] -- line: 82
	end,
	postTypingStatus = function() --[[ postTypingStatus ]] -- line: 83
	end,
	navigateBack = function() --[[ navigateBack ]] -- line: 84
	end,
	openViewProfile = function() --[[ openViewProfile ]] -- line: 85
	end,
	updateConversationTitle = function() --[[ updateConversationTitle ]] -- line: 86
	end,
	openGameDetailsPage = function() --[[ openGameDetailsPage ]] -- line: 87
	end,
	navigateToScreen = function() --[[ navigateToScreen ]] -- line: 88
	end,
	navigateToSquadLobby = function() --[[ navigateToSquadLobby ]] -- line: 89
	end,
	onChatInputBarReady = function() --[[ onChatInputBarReady ]] -- line: 90
	end,
	viewProfileOnAvatarPressed = true,
	chatInputPlaceholder = "Say something",
	usersTyping = {},
	invalidMessageTypeText = "PLACEHOLDER This message could not be displayed",
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	newText = not ScheduledPartiesExperimentation.getScheduledPartiesTooltipEnabled() and "" or "New",
	schedulePartyText = not ScheduledPartiesExperimentation.getScheduledPartiesTooltipEnabled() and "" or "Schedule Party",
	networkErrorText = "PLACEHOLDER There was a network error, please try again later",
	unknownUserText = "PLACEHOLDER unknown user",
	oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...",
	twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...",
	severalUsersTyping = "PLACEHOLDER Several users are typing...",
	bottomModalText = "PLACEHOLDER At this time, Chat is not available with this user.",
	readingMessagesIsEnabled = true,
	onConversationUnmount = function() --[[ onConversationUnmount ]] -- line: 108
	end,
	chatIsVisible = true,
	moreMenuEnabled = not FFlagIsSquadEnabledAMP and nil,
	keyboardOffset = nil,
	replyingToMessageId = nil,
	replyingToMessage = nil,
	replyingToMessageDispatch = function() --[[ replyingToMessageDispatch ]] -- line: 115
	end,
	shouldShowChatInputBar = true,
	shouldDisableChatInputBar = false,
	shouldShowLegacyBottomModal = false,
	telemetry = {
		emit = function() --[[ emit ]] -- line: 120
		end
	},
	scrollToTopOnInitialOsaLoad = false,
	displayNamesAvailable = true,
	shouldHideMoreMenuButton = false
}

function v52.init(p1) -- line: 127
	-- upvalues: EngineFeature (copy), FFlagEnableScheduledSquads (copy), AppStorageService (copy), LocalStorageKey (copy), ScheduledPartiesExperimentation (copy), Roact (copy), UserInputService (copy), memoize (copy), v20 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagAppChatSignalsReplyStore (copy), StatusCodes (copy), SendMessageError (copy), ChatConversationTelemetryEvents (copy), DateTime (copy), FFlagIsSquadEnabledAMP (copy), FFlagAppChatReplyComposeBarContainer (copy), ConversationExitType (copy), FFlagAppChatUseSwipeForReplies (copy), GetReplyingToStore (copy), GlobalLongPressSignal (copy), FFlagEnableAppChatFocusableFixes (copy), FocusNavigationService (copy), CoreGui (copy)
	local v54 = nil

	if EngineFeature and (FFlagEnableScheduledSquads and not p1.props.shouldHideMoreMenuButton) then
		local ok, result = pcall(function() -- line: 131
			-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
			return AppStorageService:GetItem(LocalStorageKey.ScheduledSquadTooltipSeen)
		end)

		if ok and result == "false" then
			if ScheduledPartiesExperimentation.getScheduledPartiesTooltipEnabled() then
				v54 = `{ p1.props.newText }: { p1.props.schedulePartyText }`
			end

			AppStorageService:SetItem(LocalStorageKey.ScheduledSquadTooltipSeen, "true")
			AppStorageService:Flush()
			ScheduledPartiesExperimentation.logExposure()
		end
	end

	p1.state = {
		inputBarHeight = 0,
		keyboardOffset = 0,
		replyComposeBarHeight = 0,
		conversationBannerHeight = 0,
		messageListHeight = 0,
		bottomModalHeight = 0,
		tooltipText = if not FFlagEnableScheduledSquads then nil else v54
	}
	p1.inputBoxRef = p1.props.inputBoxRef or Roact.createRef()
	p1.inputBarRef = Roact.createRef()
	p1.conversationViewRef = Roact.createRef()
	p1.messageListRef = Roact.createRef()

	function p1.getKeyboardOffset() -- line: 162
		-- upvalues: UserInputService (copy), p1 (copy)
		if UserInputService.OnScreenKeyboardVisible and (p1.inputBoxRef:getValue() and p1.inputBoxRef:getValue():IsFocused()) then
			if p1.props.keyboardOffset ~= nil then
				return p1.props.keyboardOffset
			end

			local v76 = p1.conversationViewRef:getValue()

			if v76 then
				return v76.AbsolutePosition.Y + v76.AbsoluteSize.Y - UserInputService.OnScreenKeyboardPosition.Y
			end
		end

		return 0
	end
	function p1.updateKeyboardOffset() -- line: 185
		-- upvalues: p1 (copy)
		if not p1.isMounted then
			return
		end

		local v77 = p1.getKeyboardOffset()

		if v77 ~= p1.state.keyboardOffset then
			p1:setState({
				keyboardOffset = v77
			})
		end
	end
	function p1.onKeyboardOffsetChanged(p2) -- line: 197
		-- upvalues: p1 (copy)
		if not p1.isMounted then
			return
		end

		if not p1.inputBoxRef:getValue() or not p1.inputBoxRef:getValue():IsFocused() then
			p2 = 0
		end

		if p2 ~= p1.state.keyboardOffset then
			p1:setState({
				keyboardOffset = p2
			})
		end
	end
	function p1.clearKeyboardOffset() -- line: 214
		-- upvalues: p1 (copy)
		p1:setState({
			keyboardOffset = 0
		})
	end

	p1.loadNext = memoize(function(p3, p4) -- line: 220
		-- upvalues: p1 (copy)
		return function() -- line: 221
			-- upvalues: p3 (copy), p4 (copy), p1 (copy)
			local v109 = p3(p4)

			if v109 then
				v109:catch(function() -- line: 224
					-- upvalues: p1 (copy)
					p1.showNetworkErrorToast()
				end)
			end
		end
	end)
	p1.markAsRead = memoize(function(p5, p6) -- line: 231
		-- upvalues: p1 (copy)
		return function() -- line: 232
			-- upvalues: p1 (copy), p5 (copy), p6 (copy)
			if p1.props.readingMessagesIsEnabled then
				p5(p6)
			end
		end
	end)

	function p1.showNetworkErrorToast() -- line: 239
		-- upvalues: p1 (copy)
		p1.props.navigateToToast({
			toastProps = {
				toastContent = {
					toastTitle = p1.props.networkErrorText
				}
			}
		})
	end

	p1.onSendChat = memoize(function(p7, p8, p9, p10, p11, p12, p13, p14) -- line: 250
		-- upvalues: v20 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagAppChatSignalsReplyStore (copy), p1 (copy), StatusCodes (copy), SendMessageError (copy), ChatConversationTelemetryEvents (copy), DateTime (copy)
		return function(p15) -- line: 260
			-- upvalues: p11 (copy), v20 (copy), p8 (ref), p12 (copy), p10 (copy), p13 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagAppChatSignalsReplyStore (copy), p1 (copy), p7 (copy), StatusCodes (copy), p9 (copy), SendMessageError (copy), p14 (copy), ChatConversationTelemetryEvents (copy), DateTime (copy)
			if p11 and p11.source == "friends" then
				v20:info("Creating a conversation for friend conversation {} via onSendChat", p8)

				local v111, v112 = p12(p8, p10):await()

				if not v111 or not v112 then
					v20:error("Could not create conversation. Error: {}", (tostring(v112)))

					return
				end

				v20:debug("Created conversation {} for friend conversation {} via onSendChat", v112.id, p8)
				p8 = v112.id
				p13(v112.id)
			end

			v20:info("Sending message '{}' to conversationId {} via onSendChat", p15, p8)

			if FFlagAppChatPerfTracking then
				AppChatPerfTracker.start(AppChatPerfTracker.Events.MessageSendToPendingRender, {
					conversationId = tostring(p8)
				})
				AppChatPerfTracker.start(AppChatPerfTracker.Events.MessageSendToFinalRender, {
					conversationId = tostring(p8)
				})
			end

			local t1 = nil

			if getFFlagAppChatEnableRepliesUI() then
				if FFlagAppChatSignalsReplyStore and p1.props.replyingToMessageId then
					t1 = {
						id = p1.props.replyingToMessageId
					}
				elseif not FFlagAppChatSignalsReplyStore then
					t1 = p1.props.replyingToMessage
				end
			end

			local v114 = p7(p8, p15, t1)

			if v114 then
				v114:andThen(function(p16) -- line: 301
					-- upvalues: StatusCodes (copy), p1 (copy), p9 (copy), p8 (ref)
					if p16 and p16.StatusCode == StatusCodes.CONFLICT then
						p1.showNetworkErrorToast()

						return
					end

					if p9 then
						p9(p8)
					end
				end)
			elseif p9 then
				p9(p8)
			end

			if getFFlagAppChatEnableRepliesUI() then
				p1.closeReplying()
			end

			local t2 = {
				messageSentResult = SendMessageError.OtherFailure,
				recipientIds = p1.props.recipientIdsSerialized
			}

			if not v114 then
				p14.emit(ChatConversationTelemetryEvents.ConversationMessageSent, t2)

				return
			end

			v114:andThen(function(p17) -- line: 327
				-- upvalues: SendMessageError (copy), StatusCodes (copy), getFFlagAppChatEnableRepliesUI (copy), DateTime (copy), p14 (copy), ChatConversationTelemetryEvents (copy), p1 (copy)
				local id = nil
				local id2 = nil
				local sender_user_id = nil
				local str = nil
				local v128 = nil
				local v129 = p17 and p17.StatusCode
				local NoResponse

				if not p17 then
					NoResponse = SendMessageError.NoResponse
				elseif v129 == StatusCodes.CONFLICT then
					NoResponse = SendMessageError.Conflict
				elseif not p17.responseBody then
					NoResponse = SendMessageError.NoResponseBody
				elseif not p17.responseBody.messages or #p17.responseBody.messages == 0 then
					NoResponse = SendMessageError.NoMessages
				elseif not p17.responseBody.messages[1].status then
					NoResponse = SendMessageError.NoMessageStatus
				else
					NoResponse = p17.responseBody.messages[1].status
					id = p17.responseBody.messages[1].id

					if getFFlagAppChatEnableRepliesUI() and p17.responseBody.messages[1].replies_to then
						local replies_to = p17.responseBody.messages[1].replies_to

						id2 = replies_to.id
						sender_user_id = replies_to.sender_user_id
						str = tostring(DateTime.fromIsoDate(replies_to.created_at).dateTime)
						v128 = if not replies_to.content then nil else #replies_to.content
					end
				end

				p14.emit(ChatConversationTelemetryEvents.ConversationMessageSent, {
					messageSentResult = NoResponse,
					messageId = id,
					recipientIds = p1.props.recipientIdsSerialized,
					targetMessageId = id2,
					targetMessageSenderId = sender_user_id,
					targetMessageSentAt = str,
					targetMessageLength = v128
				})
			end):catch(function() -- line: 377
				-- upvalues: p14 (copy), ChatConversationTelemetryEvents (copy), t2 (copy)
				p14.emit(ChatConversationTelemetryEvents.ConversationMessageSent, t2)
			end)
		end
	end)
	p1.onSendBtnClicked = memoize(function(p18) -- line: 384
		-- upvalues: ChatConversationTelemetryEvents (copy)
		return function(s1: string?) -- line: 387
			-- upvalues: p18 (copy), ChatConversationTelemetryEvents (copy)
			p18.emit(ChatConversationTelemetryEvents.ConversationSendBtnClicked, {
				sendBtnClickResult = s1
			})
		end
	end)

	function p1.isMoreMenuEnabled() -- line: 394
		-- upvalues: FFlagIsSquadEnabledAMP (copy), p1 (copy)
		return FFlagIsSquadEnabledAMP and p1.props.moreMenuEnabled or not FFlagIsSquadEnabledAMP
	end

	p1.reportInputBarReady = if not FFlagAppChatPerfTracking then nil else function(n1: number) -- line: 399
		-- upvalues: p1 (copy)
		if p1.props.onChatInputBarReady and (p1.props.shouldShowChatInputBar and n1 > 0) then
			p1.props.onChatInputBarReady()
		end
	end

	if p1.isMoreMenuEnabled() or FFlagAppChatReplyComposeBarContainer then
		function p1.onHeightChanged(p19) -- line: 407
			-- upvalues: FFlagAppChatPerfTracking (copy), p1 (copy)
			if FFlagAppChatPerfTracking then
				p1.reportInputBarReady(p19.AbsoluteSize.Y)
			end

			p1:setState(function(p20, _) -- line: 412
				-- upvalues: p19 (copy)
				if p19.AbsoluteSize.Y ~= p20.inputBarHeight then
					return {
						inputBarHeight = p19.AbsoluteSize.Y
					}
				end

				return {}
			end)
		end
	else
		function p1.onHeightChanged(p22) -- line: 421
			-- upvalues: FFlagAppChatPerfTracking (copy), p1 (copy)
			if FFlagAppChatPerfTracking then
				p1.reportInputBarReady(p22)
			end

			p1:setState(function(p23, _) -- line: 426
				-- upvalues: p22 (copy)
				if p22 ~= p23.inputBarHeight then
					return {
						inputBarHeight = p22
					}
				end

				return {}
			end)
		end
	end

	p1.lastTypingRequest = 0

	function p1.chatInputTextChanged() -- line: 437
		-- upvalues: p1 (copy)
		if p1.props.conversation and p1.props.conversation.source == "friends" then
			return
		end

		local timestamp = tick()

		if timestamp - p1.lastTypingRequest >= 3 then
			p1.lastTypingRequest = timestamp
			p1.props.postTypingStatus(p1.props.conversationId, true)
		end
	end

	p1.exitTypeForAnalytics = ConversationExitType.Default

	if not FFlagAppChatUseSwipeForReplies then
		function p1.onTouchSwipe(_, p26, p27) -- line: 453
			-- upvalues: p1 (copy), ConversationExitType (copy)
			if not p1.props.wideMode and (p26 == Enum.SwipeDirection.Right and p27 == 1) then
				p1.exitTypeForAnalytics = ConversationExitType.SwipedRight
				p1.props.navigateBack()
			end
		end
	end

	function p1.fireAnalyticsEventOnUnmount() -- line: 461
		-- upvalues: p1 (copy), ConversationExitType (copy)
		p1.props.onConversationUnmount(p1.exitTypeForAnalytics)
		p1.exitTypeForAnalytics = ConversationExitType.Default
	end
	function p1.closeKeyboard() -- line: 468
		-- upvalues: p1 (copy)
		if p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end

	if getFFlagAppChatEnableRepliesUI() then
		function p1.closeReplying() -- line: 475
			-- upvalues: FFlagAppChatSignalsReplyStore (copy), GetReplyingToStore (copy), p1 (copy)
			if FFlagAppChatSignalsReplyStore then
				GetReplyingToStore(false).clear()

				return
			end

			p1.props.replyingToMessageDispatch(nil)
		end
		function p1.onPointerInput() -- line: 482
			-- upvalues: GlobalLongPressSignal (copy), p1 (copy)
			GlobalLongPressSignal.dismiss()
			p1.closeKeyboard()
		end
	end

	function p1.onSizeChange() -- line: 488
		-- upvalues: p1 (copy)
		p1.updateKeyboardOffset()
	end
	function p1.calculateScrollOffset(p28) -- line: 492
		local CanvasPositionY = p28.CanvasPosition.Y
		local AbsoluteCanvasSizeY = p28.AbsoluteCanvasSize.Y
		local AbsoluteWindowSizeY = p28.AbsoluteWindowSize.Y

		return AbsoluteCanvasSizeY - CanvasPositionY - AbsoluteWindowSizeY
	end
	function p1.setBannerHeight(p29) -- line: 499
		-- upvalues: p1 (copy)
		p1:setState({
			conversationBannerHeight = p29
		})
	end
	function p1.setBottomModalHeight(p30) -- line: 505
		-- upvalues: p1 (copy)
		p1:setState({
			bottomModalHeight = p30
		})
	end

	if not FFlagAppChatReplyComposeBarContainer and getFFlagAppChatEnableRepliesUI() then
		function p1.setReplyComposeBarHeight(p31) -- line: 512
			-- upvalues: p1 (copy)
			p1:setState({
				replyComposeBarHeight = p31
			})
		end
	end

	function p1.onMessageListSizeChange(p32) -- line: 519
		-- upvalues: p1 (copy)
		p1:setState({
			messageListHeight = p32.AbsoluteSize.Y
		})
	end

	if FFlagEnableAppChatFocusableFixes then
		p1.focusNavigationService = FocusNavigationService.new(CoreGui)
	end
end
function v52.didMount(p33) -- line: 530
	-- upvalues: FFlagEnableAppChatFocusableFixes (copy), FocusBehaviors (copy), v40 (copy), IXPService (copy), v41 (copy)
	p33.isMounted = true
	p33.markAsRead(p33.props.markConversationAsRead, p33.props.conversationId)()

	if FFlagEnableAppChatFocusableFixes then
		local v58 = p33.conversationViewRef:getValue()
		local v59 = p33.inputBarRef:getValue()

		p33.focusNavigationService:registerFocusBehavior(v58, FocusBehaviors.mostRecentOrDefault(v59))

		if not p33.props.wideMode and p33.focusNavigationService.focusedGuiObject:getValue() ~= nil then
			p33.focusNavigationService:focusGuiObject(v59)
		end
	end

	if v40 and p33.props.shouldShowChatInputBar then
		IXPService:LogFlagLinkedUserLayerExposure(v41)
	end
end
function v52.willUpdate(p34, p35, _) -- line: 551
	if p35.chatIsVisible ~= p34.props.chatIsVisible and not p35.chatIsVisible then
		p34.closeKeyboard()
	end
end
function v52.didUpdate(p37, p38, p39) -- line: 557
	-- upvalues: FFlagEnableAppChatFocusableFixes (copy), FFlagAppChatPerfTracking (copy), getFFlagAppChatEnableRepliesUI (copy)
	if FFlagEnableAppChatFocusableFixes and (p37.props.wideMode and p37.props.navigation.getParam("navigatedWithFocus")) then
		local v66 = p37.inputBarRef:getValue()

		p37.props.navigation.setParams({
			navigatedWithFocus = false
		})
		p37.focusNavigationService:focusGuiObject(v66)
	end

	if p38.conversationId ~= p37.props.conversationId then
		if FFlagAppChatPerfTracking then
			p37.reportInputBarReady(p37.state.inputBarHeight)
		end

		if p37.inputBoxRef:getValue() then
			p37.inputBoxRef:getValue().Text = ""
			p37.inputBoxRef:getValue():ReleaseFocus()
		end

		if getFFlagAppChatEnableRepliesUI() then
			p37.closeReplying()
		end

		p37.markAsRead(p37.props.markConversationAsRead, p37.props.conversationId, false)()
	end

	if FFlagAppChatPerfTracking and p38.shouldShowChatInputBar ~= p37.props.shouldShowChatInputBar then
		p37.reportInputBarReady(p37.state.inputBarHeight)
	end

	local v67 = p37.messageListRef and (p37.messageListRef.current and p37.messageListRef.current._listRef)
	local v68 = v67 and (v67._scrollRef and v67._scrollRef.getNativeScrollRef())
	local v69 = p37.state.messageListHeight - p39.messageListHeight

	if v67 and v68 and p39.messageListHeight ~= 0 and v69 ~= 0 then
		local v70 = p37.calculateScrollOffset(v68._nativeRef.current)

		if v70 <= 0 then
			return
		end

		v67:scrollToOffset({
			offset = v70 + v69
		})
	end
end
function v52.willUnmount(p40) -- line: 621
	-- upvalues: getFFlagAppChatEnableRepliesUI (copy), FFlagEnableAppChatFocusableFixes (copy)
	p40.fireAnalyticsEventOnUnmount()

	if getFFlagAppChatEnableRepliesUI() then
		p40.closeReplying()
	end

	p40.keyboardConnections = {}
	p40.isMounted = false

	if FFlagEnableAppChatFocusableFixes then
		p40.focusNavigationService:teardown()
	end
end
function v52.render(p41) -- line: 633
	-- upvalues: withRoactChatAnalytics (copy), withStyle (copy), withChatPagePadding (copy), getFFlagAppChatEnableIntervention (copy), Roact (copy), FFlagAppChatUseSwipeForReplies (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagEnableAppChatFocusableFixes (copy), KeyboardOffsetEventHandler (copy), v50 (copy), FFlagAppChatEnableDoubleOptIn (copy), FFlagAppChatReplyComposeBarContainer (copy), MessageList (copy), UserTypingIndicator (copy), React (copy), Foundation (copy), FFlagAppChatSignalsReplyStore (copy), ReplyComposeBarContainer (copy), ChatConversationMoreMenu (copy), FFlagEnableScheduledSquads (copy), v18 (copy), FFlagIsSquadEnabledAMP (copy), ConversationBottomModalContainer (copy)
	local v73 = #p41.props.usersTyping > 0 and p41.props.displayNamesAvailable
	local v74 = not not p41.props.conversation and p41.props.conversation.source == "friends"
	local v75 = "MessageList" .. tostring(p41.props.conversationId)

	return withRoactChatAnalytics(function(p42) -- line: 644
		-- upvalues: withStyle (copy), withChatPagePadding (copy), p41 (copy), getFFlagAppChatEnableIntervention (copy), Roact (copy), FFlagAppChatUseSwipeForReplies (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagEnableAppChatFocusableFixes (copy), KeyboardOffsetEventHandler (copy), v50 (copy), FFlagAppChatEnableDoubleOptIn (copy), FFlagAppChatReplyComposeBarContainer (copy), v75 (copy), MessageList (copy), v74 (copy), v73 (copy), UserTypingIndicator (copy), React (copy), Foundation (copy), FFlagAppChatSignalsReplyStore (copy), ReplyComposeBarContainer (copy), ChatConversationMoreMenu (copy), FFlagEnableScheduledSquads (copy), v18 (copy), FFlagIsSquadEnabledAMP (copy), ConversationBottomModalContainer (copy)
		return withStyle(function(p43) -- line: 645
			-- upvalues: withChatPagePadding (copy), p41 (copy), getFFlagAppChatEnableIntervention (copy), Roact (copy), FFlagAppChatUseSwipeForReplies (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagEnableAppChatFocusableFixes (copy), KeyboardOffsetEventHandler (copy), v50 (copy), FFlagAppChatEnableDoubleOptIn (copy), FFlagAppChatReplyComposeBarContainer (copy), v75 (copy), MessageList (copy), v74 (copy), v73 (copy), UserTypingIndicator (copy), React (copy), Foundation (copy), FFlagAppChatSignalsReplyStore (copy), ReplyComposeBarContainer (copy), ChatConversationMoreMenu (copy), FFlagEnableScheduledSquads (copy), v18 (copy), p42 (copy), FFlagIsSquadEnabledAMP (copy), ConversationBottomModalContainer (copy)
			return withChatPagePadding(function(p44) -- line: 646
				-- upvalues: p41 (copy), getFFlagAppChatEnableIntervention (copy), Roact (copy), p43 (copy), FFlagAppChatUseSwipeForReplies (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagEnableAppChatFocusableFixes (copy), KeyboardOffsetEventHandler (copy), v50 (copy), FFlagAppChatEnableDoubleOptIn (copy), FFlagAppChatReplyComposeBarContainer (copy), v75 (copy), MessageList (copy), v74 (copy), v73 (copy), UserTypingIndicator (copy), React (copy), Foundation (copy), FFlagAppChatSignalsReplyStore (copy), ReplyComposeBarContainer (copy), ChatConversationMoreMenu (copy), FFlagEnableScheduledSquads (copy), v18 (copy), p42 (copy), FFlagIsSquadEnabledAMP (copy), ConversationBottomModalContainer (copy)
				local uDim = nil

				if p41.isMoreMenuEnabled() then
					uDim = UDim.new(0, (math.max(p44.right - 6, 0)))

					if getFFlagAppChatEnableIntervention() and p41.props.shouldDisableChatInputBar then
						uDim = UDim.new(0, p44.right)
					end
				end

				return Roact.createElement("TextButton", {
					AutoButtonColor = false,
					BackgroundColor3 = p43.Theme.BackgroundDefault.Color,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					Transparency = p43.Tokens.Global.Color.None.Transparency,
					[Roact.Event.TouchSwipe] = if FFlagAppChatUseSwipeForReplies then nil else p41.onTouchSwipe,
					[Roact.Event.TouchTap] = if not getFFlagAppChatEnableRepliesUI() then p41.closeKeyboard else p41.onPointerInput,
					[Roact.Event.MouseButton1Down] = if not getFFlagAppChatEnableRepliesUI() then p41.closeKeyboard else p41.onPointerInput,
					[Roact.Ref] = p41.conversationViewRef,
					Selectable = not FFlagEnableAppChatFocusableFixes and nil
				}, {
					KeyboardOffsetEventHandler = Roact.createElement(KeyboardOffsetEventHandler, {
						onKeyboardOffsetChanged = p41.onKeyboardOffsetChanged,
						parentViewRef = p41.conversationViewRef
					}),
					Layout = Roact.createElement("UIListLayout", {
						HorizontalAlignment = if not p41.isMoreMenuEnabled() then Enum.HorizontalAlignment.Right else nil,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					ConversationTopModal = Roact.createElement(v50, {
						conversationId = if not FFlagAppChatEnableDoubleOptIn then nil else p41.props.conversationId,
						conversation = if not FFlagAppChatEnableDoubleOptIn then p41.props.conversation else nil,
						navigateToScreen = if not FFlagAppChatEnableDoubleOptIn then p41.props.navigateToScreen else nil,
						setModalHeight = p41.setBannerHeight,
						layoutOrder = 1
					}),
					MessageListFrame = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						[Roact.Change.AbsoluteSize] = p41.onMessageListSizeChange,
						Size = UDim2.new(1, 0, 1, -p41.state.inputBarHeight - p41.state.keyboardOffset - ((FFlagAppChatReplyComposeBarContainer or not getFFlagAppChatEnableRepliesUI()) and 0 or p41.state.replyComposeBarHeight) - p41.state.conversationBannerHeight - p41.state.bottomModalHeight)
					}, {
						[v75] = Roact.createElement(MessageList, {
							Size = UDim2.new(1, 0, 1, 0),
							bottomMargin = 28,
							conversationId = p41.props.conversationId,
							isDebugEnabled = p41.props.isDebugEnabled,
							itemList = p41.props.itemList,
							loadNext = if not v74 then p41.loadNext(p41.props.getOlderMessages, p41.props.conversationId) else nil,
							localUserId = p41.props.localUserId,
							markAsRead = p41.markAsRead(p41.props.markConversationAsRead, p41.props.conversationId),
							messageListRef = p41.messageListRef,
							openViewProfile = p41.props.openViewProfile,
							onDetailsOpened = p41.closeKeyboard,
							closeKeyboard = if not getFFlagAppChatEnableRepliesUI() then nil else p41.closeKeyboard,
							inputBoxRef = if not getFFlagAppChatEnableRepliesUI() then nil else p41.inputBoxRef,
							wideMode = p41.props.wideMode,
							viewProfileOnAvatarPressed = p41.props.viewProfileOnAvatarPressed,
							readingMessagesIsEnabled = p41.props.readingMessagesIsEnabled,
							invalidMessageTypeText = p41.props.invalidMessageTypeText,
							messageDefaultNoticeText = p41.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p41.props.messageModeratedNoticeText,
							messageHiddenNoticeText = p41.props.messageHiddenNoticeText,
							unknownUserText = p41.props.unknownUserText,
							openGameDetailsPage = p41.props.openGameDetailsPage,
							scrollToTopOnInitialOsaLoad = p41.props.scrollToTopOnInitialOsaLoad
						}),
						UserTypingIndicator = v73 and Roact.createElement(UserTypingIndicator, {
							AnchorPoint = Vector2.new(0, 1),
							Position = UDim2.new(0, 0, 1, 0),
							ZIndex = 2,
							height = 28,
							usersTyping = p41.props.usersTyping,
							oneUserTyping = p41.props.oneUserTyping,
							twoUsersTyping = p41.props.twoUsersTyping,
							severalUsersTyping = p41.props.severalUsersTyping
						})
					}),
					ReplyAndInputContainer = if not FFlagAppChatReplyComposeBarContainer then nil else React.createElement(Foundation.View, {
						LayoutOrder = 3,
						tag = {
							["col size-full-0 auto-y gap-medium padding-y-medium"] = true,
							["bg-surface-100"] = if not FFlagAppChatSignalsReplyStore then p41.props.replyingToMessage else p41.props.replyingToMessageId ~= nil
						},
						onAbsoluteSizeChanged = p41.onHeightChanged,
						padding = {
							left = UDim.new(0, p44.left),
							right = uDim
						}
					}, {
						ReplyComposeBar = if not getFFlagAppChatEnableRepliesUI() or not if not FFlagAppChatSignalsReplyStore then p41.props.replyingToMessage else p41.props.replyingToMessageId then nil else Roact.createElement(ReplyComposeBarContainer, {
							LayoutOrder = 1,
							message = if FFlagAppChatSignalsReplyStore then nil else p41.props.replyingToMessage,
							close = p41.closeReplying,
							inputBoxRef = p41.inputBoxRef
						}),
						Divider = if not p41.isMoreMenuEnabled() or (p41.props.shouldShowChatInputBar or p41.props.shouldHideMoreMenuButton) then nil else React.createElement(Foundation.View, {
							LayoutOrder = 4,
							tag = "size-full-0 auto-y stroke-standard stroke-default"
						}),
						ActionInputContainer = if not p41.isMoreMenuEnabled() then nil else React.createElement(Foundation.View, {
							LayoutOrder = 2,
							tag = "size-full-0 row gap-small auto-y align-y-center"
						}, {
							MoreMenu = if p41.props.shouldHideMoreMenuButton then nil else Roact.createElement(ChatConversationMoreMenu, {
								conversation = p41.props.conversation,
								conversationId = p41.props.conversationId,
								navigateToSquadLobby = p41.props.navigateToSquadLobby,
								layoutOrder = 1,
								showButtonText = not p41.props.shouldShowChatInputBar,
								tooltipText = not FFlagEnableScheduledSquads and "" or p41.state.tooltipText
							}),
							ChatInputBar = if not p41.props.shouldShowChatInputBar then nil else Roact.createElement(v18, {
								LayoutOrder = 2,
								onFocusLost = p41.clearKeyboardOffset,
								conversationId = p41.props.conversationId,
								inputBoxRef = p41.inputBoxRef,
								inputBarRef = if not FFlagEnableAppChatFocusableFixes then nil else p41.inputBarRef,
								localUserId = p41.props.localUserId,
								messageListRef = p41.messageListRef,
								onSendChat = p41.onSendChat(p41.props.sendMessage, p41.props.conversationId, p41.props.markConversationAsRead, p42, p41.props.conversation, p41.props.createFriendConversation, p41.props.navigateToChatConversation, p41.props.telemetry),
								onSendBtnClicked = p41.onSendBtnClicked(p41.props.telemetry),
								onTextChanged = p41.chatInputTextChanged,
								placeholderText = p41.props.chatInputPlaceholder,
								isDisabled = p41.props.shouldDisableChatInputBar,
								inputBarDisabledText = p41.props.inputBarDisabledText,
								disabledEndTimestampDisplay = p41.props.inputBarDisabledEndTimestampDisplay,
								onDisabledInputBarActivated = p41.props.onDisabledInputBarActivated,
								moreMenuEnabled = p41.isMoreMenuEnabled()
							})
						}),
						ChatInputBar = if p41.isMoreMenuEnabled() or not p41.props.shouldShowChatInputBar then nil else Roact.createElement(v18, {
							LayoutOrder = 4,
							onFocusLost = p41.clearKeyboardOffset,
							conversationId = p41.props.conversationId,
							inputBoxRef = p41.inputBoxRef,
							inputBarRef = if not FFlagEnableAppChatFocusableFixes then nil else p41.inputBarRef,
							localUserId = p41.props.localUserId,
							messageListRef = p41.messageListRef,
							onSendChat = p41.onSendChat(p41.props.sendMessage, p41.props.conversationId, p41.props.markConversationAsRead, p42, p41.props.conversation, p41.props.createFriendConversation, p41.props.navigateToChatConversation, p41.props.telemetry),
							onSendBtnClicked = p41.onSendBtnClicked(p41.props.telemetry),
							onTextChanged = p41.chatInputTextChanged,
							placeholderText = p41.props.chatInputPlaceholder,
							isDisabled = p41.props.shouldDisableChatInputBar,
							inputBarDisabledText = p41.props.inputBarDisabledText,
							disabledEndTimestampDisplay = p41.props.inputBarDisabledEndTimestampDisplay,
							onDisabledInputBarActivated = p41.props.onDisabledInputBarActivated,
							moreMenuEnabled = p41.isMoreMenuEnabled()
						})
					}),
					ReplyComposeBar = if FFlagAppChatReplyComposeBarContainer or (not getFFlagAppChatEnableRepliesUI() or not if not FFlagAppChatSignalsReplyStore then p41.props.replyingToMessage else p41.props.replyingToMessageId) then nil else Roact.createElement(ReplyComposeBarContainer, {
						LayoutOrder = 3,
						message = if FFlagAppChatSignalsReplyStore then nil else p41.props.replyingToMessage,
						close = p41.closeReplying,
						setReplyComposeBarHeight = p41.setReplyComposeBarHeight,
						inputBoxRef = p41.inputBoxRef
					}),
					Divider = if FFlagAppChatReplyComposeBarContainer or (not p41.isMoreMenuEnabled() or (p41.props.shouldShowChatInputBar or p41.props.shouldHideMoreMenuButton)) then nil else React.createElement(Foundation.View, {
						LayoutOrder = 4,
						tag = "size-full-0 auto-y stroke-standard stroke-default"
					}),
					ActionInputContainer = if FFlagAppChatReplyComposeBarContainer or not p41.isMoreMenuEnabled() then nil else React.createElement(Foundation.View, {
						LayoutOrder = p41.props.shouldShowChatInputBar and 5 or 4,
						tag = "size-full-0 row gap-small auto-y align-y-center padding-y-small",
						padding = {
							left = UDim.new(0, p44.left),
							right = uDim
						},
						onAbsoluteSizeChanged = p41.onHeightChanged
					}, {
						MoreMenu = if p41.props.shouldHideMoreMenuButton then nil else Roact.createElement(ChatConversationMoreMenu, {
							conversation = p41.props.conversation,
							conversationId = p41.props.conversationId,
							navigateToSquadLobby = p41.props.navigateToSquadLobby,
							layoutOrder = 1,
							showButtonText = not p41.props.shouldShowChatInputBar,
							tooltipText = not FFlagEnableScheduledSquads and "" or p41.state.tooltipText
						}),
						ChatInputBar = if not p41.props.shouldShowChatInputBar then nil else Roact.createElement(v18, {
							LayoutOrder = 2,
							onFocusLost = p41.clearKeyboardOffset,
							conversationId = p41.props.conversationId,
							inputBoxRef = p41.inputBoxRef,
							inputBarRef = if not FFlagEnableAppChatFocusableFixes then nil else p41.inputBarRef,
							localUserId = p41.props.localUserId,
							messageListRef = p41.messageListRef,
							onSendChat = p41.onSendChat(p41.props.sendMessage, p41.props.conversationId, p41.props.markConversationAsRead, p42, p41.props.conversation, p41.props.createFriendConversation, p41.props.navigateToChatConversation, p41.props.telemetry),
							onSendBtnClicked = p41.onSendBtnClicked(p41.props.telemetry),
							onTextChanged = p41.chatInputTextChanged,
							placeholderText = p41.props.chatInputPlaceholder,
							isDisabled = p41.props.shouldDisableChatInputBar,
							inputBarDisabledText = p41.props.inputBarDisabledText,
							disabledEndTimestampDisplay = p41.props.inputBarDisabledEndTimestampDisplay,
							onDisabledInputBarActivated = p41.props.onDisabledInputBarActivated,
							moreMenuEnabled = if not FFlagIsSquadEnabledAMP then nil else p41.props.moreMenuEnabled
						})
					}),
					ChatInputBar = if FFlagAppChatReplyComposeBarContainer or (p41.isMoreMenuEnabled() or not p41.props.shouldShowChatInputBar) then nil else Roact.createElement(v18, {
						LayoutOrder = 4,
						onFocusLost = p41.clearKeyboardOffset,
						conversationId = p41.props.conversationId,
						inputBoxRef = p41.inputBoxRef,
						inputBarRef = if not FFlagEnableAppChatFocusableFixes then nil else p41.inputBarRef,
						localUserId = p41.props.localUserId,
						messageListRef = p41.messageListRef,
						onHeightChanged = if not p41.isMoreMenuEnabled() then p41.onHeightChanged else nil,
						onSendChat = p41.onSendChat(p41.props.sendMessage, p41.props.conversationId, p41.props.markConversationAsRead, p42, p41.props.conversation, p41.props.createFriendConversation, p41.props.navigateToChatConversation, p41.props.telemetry),
						onSendBtnClicked = p41.onSendBtnClicked(p41.props.telemetry),
						onTextChanged = p41.chatInputTextChanged,
						placeholderText = p41.props.chatInputPlaceholder,
						isDisabled = p41.props.shouldDisableChatInputBar,
						inputBarDisabledText = p41.props.inputBarDisabledText,
						disabledEndTimestampDisplay = p41.props.inputBarDisabledEndTimestampDisplay,
						onDisabledInputBarActivated = p41.props.onDisabledInputBarActivated,
						moreMenuEnabled = if not FFlagIsSquadEnabledAMP then nil else p41.props.moreMenuEnabled
					}),
					BottomModal = React.createElement(ConversationBottomModalContainer, {
						conversationId = p41.props.conversationId,
						layoutOrder = 5,
						onHeightChanged = p41.setBottomModalHeight,
						legacyBottomModalText = p41.props.bottomModalText,
						shouldShowLegacyBottomModal = p41.props.shouldShowLegacyBottomModal,
						shouldShowChatInputBar = p41.props.shouldShowChatInputBar
					})
				})
			end)
		end)
	end)
end

return connectTelemetry(ChatConversationTelemetryLayer.Context)(if not FFlagEnableAppChatFocusableFixes then v52 else RoactNavigation.withNavigation(v52))
