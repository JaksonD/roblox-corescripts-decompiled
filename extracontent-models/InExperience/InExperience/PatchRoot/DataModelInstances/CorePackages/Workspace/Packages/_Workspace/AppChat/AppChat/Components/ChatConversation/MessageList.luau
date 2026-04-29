local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Roact = require(AppChatParent.Roact)
local BidirectionalFlatList = require(AppChatParent.VirtualizedList).BidirectionalFlatList
local Promise = require(AppChatParent.Promise)
local ReactFocusNavigation = require(AppChatParent.ReactFocusNavigation)
local FocusNavigationService = ReactFocusNavigation.FocusNavigationService
local CoreGui = ReactFocusNavigation.EngineInterface.CoreGui
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local createScrollIntervalTracker = require(AppChat.Telemetry.createScrollIntervalTracker)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local MessageModel = require(AppChat.Models.MessageModel)
local EnumMessageTypes = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModel2 = require(AppChat.Models.MessageModel)
local getLastMessageWithFilter = require(script.Parent.Utils.getLastMessageWithFilter)
local ChatMessage = require(script.Parent.ChatMessage)
local SystemMessage = require(script.Parent.SystemMessage)
local SystemMessageContainer = require(script.Parent.SystemMessageContainer)
local CustomMessageEntryContainer = require(script.Parent.CustomMessageEntryContainer)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local GetFFlagEnableSocialCards = require(AppChatParent.SharedFlags).GetFFlagEnableSocialCards
local v22 = game:DefineFastInt("AppChatMessageInitialFetchMinMessages", 20)
local v23 = game:DefineFastInt("AppChatInitialMessageFetchLimit", 10)
local FFlagAppChatHandleAgeChange = require(AppChat.Flags.FFlagAppChatHandleAgeChange)
local v25 = game:DefineFastInt("AppChatOsaAutoScrollDelayMs", 100)
local FFlagAppChatEnableAutotranslation = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagAppChatAutotranslationRespectsExperienceChatSetting = require(AppChat.Flags.FFlagAppChatAutotranslationRespectsExperienceChatSetting)
local FFlagAppChatEnableHiddenMessages = require(AppChat.Flags.FFlagAppChatEnableHiddenMessages)
local v30 = game:DefineFastInt("AppChatPerfChatConversationPaginationWindowSize", 2)
local v31 = game:DefineFastInt("AppChatPerfChatConversationPaginationInitialRender", 10)
local v32 = game:DefineFastInt("AppChatPerfChatConversationPaginationOnStartReached", 64)
local v33 = game:DefineFastInt("AppChatPerfChatConversationPaginationOnEndReached", 100)

local function isIncomingChatMessage(p1) -- line: 49
	-- upvalues: EnumMessageTypes (copy)
	return p1.isIncoming and (p1.messageType == EnumMessageTypes.PlainText or p1.messageType == EnumMessageTypes.Link)
end

local v35 = Roact.PureComponent:extend("MessageList")

v35.defaultProps = {
	Size = UDim2.new(1, 0, 1, 0),
	autoScrollMaxIndex = 3,
	bottomMargin = 10,
	conversationId = nil,
	initialFocusIndex = 1,
	isDebugEnabled = false,
	itemList = {},
	loadNext = function() --[[ loadNext ]] -- line: 64
	end,
	markAsRead = function() --[[ markAsRead ]] -- line: 65
	end,
	messageListRef = nil,
	onDetailsOpened = function() --[[ onDetailsOpened ]] -- line: 67
	end,
	openGameDetailsPage = function(_, _) --[[ openGameDetailsPage ]] -- line: 68
	end,
	openViewProfile = nil,
	wideMode = false,
	viewProfileOnAvatarPressed = true,
	closeKeyboard = function() --[[ closeKeyboard ]] -- line: 72
	end,
	inputBoxRef = nil,
	invalidMessageTypeText = "PLACEHOLDER This message could not be displayed",
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	unknownUserText = "PLACEHOLDER unknown user",
	scrollToTopOnInitialOsaLoad = false
}

local function compareItemData(p4, p5) -- line: 82
	if p4 == nil or p5 == nil then
		return false
	end

	return p4.stable_key ~= nil and p4.stable_key == p5.stable_key or p4.messageId ~= nil and p4.messageId == p5.messageId
end

function v35.init(p6) -- line: 91
	-- upvalues: FFlagAppChatPerfTracking (copy), MessageModel (copy), EnumMessageTypes (copy), Roact (copy), FFlagAppChatAutotranslationRespectsExperienceChatSetting (copy), getFFlagAppChatEnableRepliesUI (copy), getLastMessageWithFilter (copy), isIncomingChatMessage (copy), CustomMessageEntryContainer (copy), SystemMessageContainer (copy), GetFFlagEnableSocialCards (copy), FFlagAppChatEnableAutotranslation (copy), ChatMessage (copy), MessageModel2 (copy), FFlagAppChatEnableHiddenMessages (copy), SystemMessage (copy), createScrollIntervalTracker (copy), AppChatPerfTracker (copy), FFlagEnableAppChatFocusableFixes (copy), FocusNavigationService (copy), CoreGui (copy)
	p6.state = {
		width = 0,
		startIndex = 1,
		firstItem = p6.props.itemList[1]
	}
	p6.focusIndex = p6.props.initialFocusIndex

	if FFlagAppChatPerfTracking then
		p6._scrollIntervalTracker = nil
	end

	function p6.isValidMessageAndSenderType(p7, p8) -- line: 104
		-- upvalues: MessageModel (copy), EnumMessageTypes (copy)
		if p8 == MessageModel.SenderTypes.System then
			return p7 == EnumMessageTypes.System
		end

		if p8 == MessageModel.SenderTypes.User then
			return p7 == EnumMessageTypes.PlainText or p7 == EnumMessageTypes.Link
		end

		if p7 == EnumMessageTypes.Custom then
			return true
		end

		return false
	end

	p6.ref = p6.props.messageListRef or Roact.createRef()

	local v43 = not not FFlagAppChatAutotranslationRespectsExperienceChatSetting and game:GetService("TextChatService").ChatTranslationEnabled

	p6.lastIncomingChatMessageId = nil

	if getFFlagAppChatEnableRepliesUI() and p6.props.itemList then
		p6.lastIncomingChatMessageId = getLastMessageWithFilter(p6.props.itemList, isIncomingChatMessage)
	end

	function p6.renderItem(p9) -- line: 128
		-- upvalues: p6 (copy), Roact (copy), EnumMessageTypes (copy), CustomMessageEntryContainer (copy), SystemMessageContainer (copy), GetFFlagEnableSocialCards (copy), FFlagAppChatEnableAutotranslation (copy), FFlagAppChatAutotranslationRespectsExperienceChatSetting (copy), v43 (copy), ChatMessage (copy), MessageModel2 (copy), getFFlagAppChatEnableRepliesUI (copy), FFlagAppChatEnableHiddenMessages (copy), SystemMessage (copy)
		if p6.isValidMessageAndSenderType(p9.messageType, p9.senderType) then
			local v68 = p6.props.isDebugEnabled and Roact.createElement("StringValue", {
				Value = tostring(p9.messageId)
			})

			if p9.messageType == EnumMessageTypes.Custom then
				return Roact.createElement(CustomMessageEntryContainer, {
					openViewProfile = p6.props.openViewProfile,
					customEntryType = p9.customEntryType,
					conversationId = p6.props.conversationId
				})
			end

			if p9.messageType == EnumMessageTypes.System then
				return Roact.createElement(SystemMessageContainer, {
					cards = if not GetFFlagEnableSocialCards() then nil else p9.cards,
					text = p9.content,
					parentWidth = p6.state.width,
					sent = p9.sent,
					showDateTime = p9.showDateTime,
					messageId = p9.messageId,
					senderTargetId = if not GetFFlagEnableSocialCards() then nil else p9.senderTargetId,
					debugElement = v68
				})
			end

			local additionalProps = p9.additionalProps

			if additionalProps then
				additionalProps.onDetailsOpened = p6.props.onDetailsOpened
			end

			if not additionalProps then
				additionalProps = {}
			end

			additionalProps.openGameDetailsPage = p6.props.openGameDetailsPage
			additionalProps.shareLink = p9.shareLink

			local v70 = nil

			if FFlagAppChatEnableAutotranslation then
				v70 = if not FFlagAppChatAutotranslationRespectsExperienceChatSetting then p9.contentToDisplay else if not v43 then nil else p9.contentToDisplay
			end

			return Roact.createElement(ChatMessage, {
				additionalProps = additionalProps,
				content = p9.content,
				debugElement = v68,
				failed = p9.failed,
				filteredForReceivers = p9.filteredForReceivers,
				isIncoming = p9.isIncoming,
				isNewSender = p9.isNewSender,
				isSending = p9.isSending,
				isUnfiltered = p9.moderationType == MessageModel2.ModerationTypes.TrustedComms,
				isLastMessageInMessageGroup = p9.isLastMessageInMessageGroup,
				isLastIncomingChatMessage = if not getFFlagAppChatEnableRepliesUI() then nil else p9.messageId == p6.lastIncomingChatMessageId,
				messageDefaultNoticeText = p6.props.messageDefaultNoticeText,
				conversationId = if not getFFlagAppChatEnableRepliesUI() then nil else p6.props.conversationId,
				messageId = p9.messageId,
				messageModeratedNoticeText = p6.props.messageModeratedNoticeText,
				messageHiddenNoticeText = if not FFlagAppChatEnableHiddenMessages then nil else p6.props.messageHiddenNoticeText,
				messageType = p9.messageType,
				moderated = p9.moderated,
				openViewProfile = p6.props.openViewProfile,
				parentWidth = p6.state.width,
				readingMessagesIsEnabled = true,
				senderUserId = if not getFFlagAppChatEnableRepliesUI() then p9.sender.id else p9.senderTargetId,
				sent = p9.sent,
				showDateTime = p9.showDateTime,
				showDisplayName = p9.showDisplayName,
				shouldShowName = p9.sender.shouldShowName,
				thumbnail = p9.sender.thumbnail,
				wideMode = p6.props.wideMode,
				unknownUserText = p6.props.unknownUserText,
				viewProfileOnAvatarPressed = p6.props.viewProfileOnAvatarPressed,
				closeKeyboard = if not getFFlagAppChatEnableRepliesUI() then nil else p6.props.closeKeyboard,
				inputBoxRef = if not getFFlagAppChatEnableRepliesUI() then nil else p6.props.inputBoxRef,
				repliesTo = if not getFFlagAppChatEnableRepliesUI() then nil else p9.repliesTo,
				visibility = p9.visibility,
				translatedText = v70
			})
		end

		return Roact.createElement(SystemMessage, {
			Text = p6.props.invalidMessageTypeText
		})
	end
	function p6.updateWidth(p10) -- line: 227
		-- upvalues: p6 (copy)
		if p10.AbsoluteSize.X ~= p6.state.width then
			p6:setState({
				width = p10.AbsoluteSize.X
			})
		end
	end
	function p6.changeFocus(p11) -- line: 234
		-- upvalues: p6 (copy)
		p6.isNearBottom = p11.anchorIndex <= p6.props.autoScrollMaxIndex + 1
		p6.focusIndex = if not p6.isNearBottom then p11.anchorIndex + 1 else 1

		if p11.anchorIndex == 1 and not p6.props.itemList[1].read then
			p6.props.markAsRead()
		end
	end
	function p6.identifier(p12) -- line: 246
		return p12.messageId .. "|" .. (p12.position or "")
	end
	function p6.getScrollRef() -- line: 250
		-- upvalues: p6 (copy)
		if p6.ref.current == nil then
			return nil
		end

		local v74 = p6.ref.current._listRef._scrollRef.getNativeScrollRef()

		if v74 == nil then
			return nil
		end

		return v74._nativeRef.current
	end
	function p6.calculateScrollOffset(p13) -- line: 263
		local CanvasPositionY = p13.CanvasPosition.Y
		local AbsoluteCanvasSizeY = p13.AbsoluteCanvasSize.Y
		local AbsoluteWindowSizeY = p13.AbsoluteWindowSize.Y

		return AbsoluteCanvasSizeY - CanvasPositionY - AbsoluteWindowSizeY
	end
	function p6.onScroll(p14) -- line: 271
		-- upvalues: FFlagAppChatPerfTracking (copy), p6 (copy), createScrollIntervalTracker (copy), AppChatPerfTracker (copy)
		if FFlagAppChatPerfTracking then
			if p6._scrollIntervalTracker == nil then
				local v80 = p6.getScrollRef()

				if v80 ~= nil then
					p6._scrollIntervalTracker = createScrollIntervalTracker(AppChatPerfTracker.Events.ScrollMessageList, v80, {
						conversationId = p6.props.conversationId
					})
				end
			end

			if p6._scrollIntervalTracker then
				p6._scrollIntervalTracker.onScrollTick()
			end
		end

		local v81 = p6.calculateScrollOffset(p14)

		if v81 < 512 then
			p6:setState(function(_, p16) -- line: 290
				return {
					firstItem = p16.itemList[1]
				}
			end)
		end

		if v81 < 64 then
			p6.props.markAsRead()
		end

		p6.isNearBottom = v81 < 64
	end

	p6.initialFetchesAttempted = 0

	if FFlagEnableAppChatFocusableFixes then
		p6.focusNavigationService = FocusNavigationService.new(CoreGui)
	end
end
function v35.getDerivedStateFromProps(p17, p18) -- line: 310
	if p18.firstItem == nil then
		return {
			startIndex = 1
		}
	end

	local n1 = 1

	while n1 <= #p17.itemList do
		local v47 = p17.itemList[n1]
		local firstItem = p18.firstItem

		if v47 ~= nil and (firstItem ~= nil and (v47.stable_key ~= nil and v47.stable_key == firstItem.stable_key or v47.messageId ~= nil and v47.messageId == firstItem.messageId)) then
			break
		end

		n1 += 1
	end

	if n1 > #p17.itemList then
		return {
			startIndex = 1
		}
	end

	return {
		startIndex = n1
	}
end
function v35.didUpdate(p19, p20, _) -- line: 335
	-- upvalues: FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), FFlagAppChatHandleAgeChange (copy), v23 (copy), v22 (copy), v25 (copy), getFFlagAppChatEnableRepliesUI (copy), getLastMessageWithFilter (copy), isIncomingChatMessage (copy)
	if FFlagAppChatPerfTracking and #p19.props.itemList > #p20.itemList then
		AppChatPerfTracker.finish(AppChatPerfTracker.Events.PaginationMessageList, {
			conversationId = p19.props.conversationId
		})
	end

	if FFlagAppChatHandleAgeChange and p19.props.itemList and #p19.props.itemList == 0 and p20.itemList and #p20.itemList > 0 then
		p19.initialFetchesAttempted = 0
	end

	if p19.props.itemList and p19.props.itemList ~= p20.itemList and p19.initialFetchesAttempted < v23 and #p19.props.itemList < v22 and p19.props.loadNext then
		p19.initialFetchesAttempted = p19.initialFetchesAttempted + 1
		p19.props.loadNext()
	end

	if p20.conversationId ~= p19.props.conversationId then
		p19.isNearBottom = true
	end

	local v52 = p19.getScrollRef()

	if (v52 == nil and 0 or p19.calculateScrollOffset(v52)) < 64 then
		p19.isNearBottom = true

		if #p19.props.itemList > 0 then
			p19.props.markAsRead()
		end
	end

	if p20.readingMessagesIsEnabled ~= p19.props.readingMessagesIsEnabled and p19.props.readingMessagesIsEnabled and p19.isNearBottom then
		p19.props.markAsRead()
	end

	if p19.props.scrollToTopOnInitialOsaLoad and not p20.scrollToTopOnInitialOsaLoad and #p19.props.itemList > 0 then
		local v53 = p19.ref and p19.ref.current

		if v53 and v53.scrollToEnd then
			task.delay(v25 / 1000, function() -- line: 396
				-- upvalues: v53 (copy), p19 (copy)
				v53:scrollToIndex({
					index = #p19.props.itemList,
					animated = false
				})
			end)
		end
	end

	if getFFlagAppChatEnableRepliesUI() and p19.props.itemList and not p19.lastIncomingChatMessageId then
		p19.lastIncomingChatMessageId = getLastMessageWithFilter(p19.props.itemList, isIncomingChatMessage)
	end
end
function v35.didMount(p22) -- line: 407
	-- upvalues: v22 (copy), FFlagEnableAppChatFocusableFixes (copy)
	if #p22.props.itemList < v22 and p22.props.loadNext then
		p22.props.loadNext()
	end

	p22.isNearBottom = true

	if FFlagEnableAppChatFocusableFixes then
		local v55 = p22.getScrollRef()

		if v55 ~= nil then
			v55.Selectable = false
		end
	end
end
function v35.willUnmount(p23) -- line: 420
	-- upvalues: FFlagAppChatPerfTracking (copy), FFlagEnableAppChatFocusableFixes (copy)
	if FFlagAppChatPerfTracking and p23._scrollIntervalTracker then
		p23._scrollIntervalTracker.cleanup()
	end

	if FFlagEnableAppChatFocusableFixes then
		p23.focusNavigationService:teardown()
	end
end
function v35.renderScrollingFrame(p24) -- line: 429
	-- upvalues: Roact (copy), BidirectionalFlatList (copy), v30 (copy), v31 (copy), FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), Promise (copy), v33 (copy), v32 (copy), compareItemData (copy)
	local t1 = {}
	local startIndex = p24.state.startIndex

	if startIndex ~= 1 then
		local v60 = p24.getScrollRef()

		if (v60 == nil and 0 or p24.calculateScrollOffset(v60)) < 128 then
			startIndex = 1
		end
	end

	if startIndex ~= 1 then
		local v61 = p24.props.itemList[1]
		local firstItem = p24.state.firstItem

		if not (v61 ~= nil and (firstItem ~= nil and (v61.stable_key ~= nil and v61.stable_key == firstItem.stable_key or v61.messageId ~= nil and v61.messageId == firstItem.messageId))) then
			table.move(p24.props.itemList, startIndex, #p24.props.itemList, 1, t1)

			return Roact.createElement(BidirectionalFlatList, {
				data = t1,
				renderItem = function(p25) --[[ renderItem ]] -- line: 449
					-- upvalues: p24 (copy)
					return p24.renderItem(p25.item)
				end,
				inverted = true,
				Size = p24.props.Size,
				style = {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Name = "MessageList"
				},
				contentContainerStyle = {
					BackgroundTransparency = 1
				},
				keyExtractor = function(p26, p27) --[[ keyExtractor ]] -- line: 463
					return p26.stable_key or (p26.messageId or p27)
				end,
				windowSize = v30,
				initialNumToRender = if not p24.props.scrollToTopOnInitialOsaLoad then v31 else #t1,
				onScroll = p24.onScroll,
				onEndReached = function() --[[ onEndReached ]] -- line: 472
					-- upvalues: FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), p24 (copy), Promise (copy)
					if FFlagAppChatPerfTracking then
						AppChatPerfTracker.start(AppChatPerfTracker.Events.PaginationMessageList, {
							conversationId = p24.props.conversationId
						})
					end

					p24.props.loadNext()

					return Promise.resolve()
				end,
				onEndReachedThreshold = v33,
				onStartReachedThreshold = v32,
				compareItemData = compareItemData,
				scrollEventThrottle = p24.props.scrollEventThrottle or 75,
				[Roact.Ref] = p24.ref,
				autoscrollToTopThreshold = 33,
				enableAutoscrollToTop = true,
				ListHeaderComponent = function() --[[ ListHeaderComponent ]] -- line: 489
					-- upvalues: Roact (copy)
					return Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 10)
					})
				end,
				showDefaultLoadingIndicators = false,
				onContentSizeChange = function(n2: number, n3: number) --[[ onContentSizeChange ]] -- line: 496
					-- upvalues: p24 (copy)
					p24:setState({
						width = n2
					})
				end,
				optimizeInvertedCanvasResize = true,
				UNSTABLE_forceSiblingLayoutUpdate = true
			})
		end
	end

	t1 = p24.props.itemList

	return Roact.createElement(BidirectionalFlatList, {
		data = t1,
		renderItem = function(p25) --[[ renderItem ]] -- line: 449
			-- upvalues: p24 (copy)
			return p24.renderItem(p25.item)
		end,
		inverted = true,
		Size = p24.props.Size,
		style = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			Name = "MessageList"
		},
		contentContainerStyle = {
			BackgroundTransparency = 1
		},
		keyExtractor = function(p26, p27) --[[ keyExtractor ]] -- line: 463
			return p26.stable_key or (p26.messageId or p27)
		end,
		windowSize = v30,
		initialNumToRender = if not p24.props.scrollToTopOnInitialOsaLoad then v31 else #t1,
		onScroll = p24.onScroll,
		onEndReached = function() --[[ onEndReached ]] -- line: 472
			-- upvalues: FFlagAppChatPerfTracking (copy), AppChatPerfTracker (copy), p24 (copy), Promise (copy)
			if FFlagAppChatPerfTracking then
				AppChatPerfTracker.start(AppChatPerfTracker.Events.PaginationMessageList, {
					conversationId = p24.props.conversationId
				})
			end

			p24.props.loadNext()

			return Promise.resolve()
		end,
		onEndReachedThreshold = v33,
		onStartReachedThreshold = v32,
		compareItemData = compareItemData,
		scrollEventThrottle = p24.props.scrollEventThrottle or 75,
		[Roact.Ref] = p24.ref,
		autoscrollToTopThreshold = 33,
		enableAutoscrollToTop = true,
		ListHeaderComponent = function() --[[ ListHeaderComponent ]] -- line: 489
			-- upvalues: Roact (copy)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 10)
			})
		end,
		showDefaultLoadingIndicators = false,
		onContentSizeChange = function(n2: number, n3: number) --[[ onContentSizeChange ]] -- line: 496
			-- upvalues: p24 (copy)
			p24:setState({
				width = n2
			})
		end,
		optimizeInvertedCanvasResize = true,
		UNSTABLE_forceSiblingLayoutUpdate = true
	})
end
function v35.renderEmptyMessageList(p28) -- line: 506
	-- upvalues: Roact (copy)
	return Roact.createElement("Frame", {
		Size = p28.props.Size,
		BackgroundTransparency = 1
	})
end
function v35.render(p29) -- line: 513
	if #p29.props.itemList ~= 0 then
		return (p29:renderScrollingFrame())
	end

	return (p29:renderEmptyMessageList())
end

return v35
