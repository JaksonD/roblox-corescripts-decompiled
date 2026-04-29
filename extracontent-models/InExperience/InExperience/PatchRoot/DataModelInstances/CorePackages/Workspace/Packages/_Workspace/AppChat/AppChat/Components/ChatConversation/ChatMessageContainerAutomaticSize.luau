local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local setTimeout = require(AppChatParent.LuauPolyfill).setTimeout
local React = require(AppChatParent.React)
local useStyle = require(AppChatParent.UIBlox).Core.Style.useStyle
local useNavigation = require(AppChatParent.Navigation).useNavigation
local useGetConversationFromId = require(AppChat.Hooks.useGetConversationFromId)
local Options = require(AppChat.Components.ChatConversation.MessageInteraction.Options)
local OptionsEnum = require(AppChat.Components.ChatConversation.MessageInteraction.OptionsEnum)
local ChatMessageContainerConstants = require(script.Parent.ChatMessageContainerConstants)
local EnumScreens = require(AppChat.EnumScreens)
local Cryo = require(AppChatParent.Cryo)
local Foundation = require(AppChatParent.Foundation)
local Skeleton = Foundation.Skeleton
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local Conversation = require(AppChat.Models.Conversation)

require(AppChat.Analytics.EventNames)

local useChatPagePadding = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local Logger = require(script.Parent.Logger)
local NoticeText = require(script.Parent.NoticeText)
local SystemMessage = require(script.Parent.SystemMessage)
local UserProfiles = require(AppChatParent.UserProfiles)
local ChatConversationTelemetryEvents = require(AppChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local GlobalLongPressSignal = require(AppChat.Components.ChatConversation.Utils.GlobalLongPressSignal)
local MessageFtuxTooltip = require(script.Parent.MessageFtuxTooltip)
local MessageFtuxTooltip2 = MessageFtuxTooltip.MessageFtuxTooltip
local MessageFtuxTooltipVariant = MessageFtuxTooltip.MessageFtuxTooltipVariant
local MessageFtuxTooltipDismissSignal = MessageFtuxTooltip.MessageFtuxTooltipDismissSignal
local SwipeDirection = require(AppChat.Enums.SwipeDirection)
local getFFlagDebugAppChat = require(AppChat.Flags.getFFlagDebugAppChat)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local GetReplyingToStore = require(AppChat.Stores.GetReplyingToStore)
local useReplyingToMessageDispatch = require(AppChat.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local FFlagAppChatSignalsReplyStore = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local useTriggerFeedback = require(AppChatParent.InteractionFeedback).useTriggerFeedback
local HapticFeedbackContext = require(AppChat.Utils.HapticFeedback).HapticFeedbackContext
local HapticFeedbackType = require(AppChat.Utils.HapticFeedback).HapticFeedbackType
local useSwipeGesture = require(AppChat.Hooks.useSwipeGesture)
local UserTile = require(AppChatParent.UserTile).UserTile
local LayoutMode = require(AppChatParent.UserTile).LayoutMode
local UserPresence = require(AppChatParent.Foundation).Enums.UserPresence
local FFlagAppChatEnableMessageContextMenu = require(AppChat.Flags.FFlagAppChatEnableMessageContextMenu)
local v48 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local v49 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local v50 = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local FFlagAppChatEnableHiddenMessages = require(AppChat.Flags.FFlagAppChatEnableHiddenMessages)
local MessageModel = require(AppChat.Models.MessageModel)
local FFlagAppChatUseSwipeForReplies = require(AppChat.Flags.FFlagAppChatUseSwipeForReplies)
local v54 = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local v55 = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local FFlagAppChatSignalsMessageStore = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local v57 = if not FFlagAppChatSignalsMessageStore then nil else require(AppChat.Stores.GetMessageViewModelStore)
local uDim2 = UDim2.new(0, 0, 0.5, 0)
local uDim2_2 = UDim2.new(1, 0, 0.5, 0)
local vector2 = Vector2.new(0, 0.5)
local vector2_2 = Vector2.new(1, 0.5)
local t1 = {
	failed = false,
	filteredForReceivers = false,
	Font = Enum.Font.Gotham,
	isIncoming = false,
	isNewSender = false,
	parentWidth = 0,
	messageId = "",
	conversationId = "",
	messageType = nil,
	messageTypePaddingOffset = 0,
	moderated = false,
	messageMaxWidth = 0,
	openViewProfile = function() --[[ openViewProfile ]] -- line: 94
		-- upvalues: Logger (copy)
		Logger:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function() --[[ renderMessage ]] -- line: 97
		-- upvalues: Logger (copy)
		Logger:warning("renderMessage was not passed to ChatMessage")
	end,
	closeKeyboard = function() --[[ closeKeyboard ]] -- line: 100
	end,
	inputBoxRef = nil,
	viewProfileOnAvatarPressed = true,
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	messageHiddenNoticeText = "PLACEHOLDER This message is not available",
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	isPending = false,
	visibility = nil,
	unitTestTouchEnabled = false
}
local v63 = not getFFlagDebugAppChat() and "Frame" or "TextButton"

function ChatMessageContainer(p1) -- line: 115
	-- upvalues: Cryo (copy), t1 (copy), FFlagAppChatEnableHiddenMessages (copy), MessageModel (copy), React (copy), useStyle (copy), useChatPagePadding (copy), Foundation (copy), FFlagAppChatUseSwipeForReplies (copy), v54 (copy), SwipeDirection (copy), uDim2 (copy), uDim2_2 (copy), v55 (copy), vector2 (copy), vector2_2 (copy), getFFlagAppChatEnableRepliesUI (copy), useTelemetry (copy), ChatConversationTelemetryLayer (copy), useTriggerFeedback (copy), GlobalLongPressSignal (copy), MessageFtuxTooltipDismissSignal (copy), MessageFtuxTooltipVariant (copy), ChatConversationTelemetryEvents (copy), useNavigation (copy), useGetConversationFromId (copy), FFlagAppChatSignalsReplyStore (copy), GetReplyingToStore (copy), FFlagAppChatSignalsMessageStore (copy), v57 (copy), useReplyingToMessageDispatch (copy), useLocalUserId (copy), HapticFeedbackContext (copy), HapticFeedbackType (copy), useSwipeGesture (copy), EnumScreens (copy), setTimeout (copy), v50 (copy), UserInputService (copy), FFlagAppChatEnableMessageContextMenu (copy), ChatMessageContainerConstants (copy), OptionsEnum (copy), Conversation (copy), UserProfiles (copy), useLocalization (copy), TextService (copy), getFFlagDebugAppChat (copy), Options (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), Skeleton (copy), MessageFtuxTooltip2 (copy), v48 (copy), IXPService (copy), v49 (copy), v63 (copy), SystemMessage (copy), NoticeText (copy)
	local v65 = Cryo.Dictionary.join(t1, p1)
	local v66 = not not FFlagAppChatEnableHiddenMessages and (not not v65.visibility and v65.visibility == MessageModel.VisibilityTypes.Hidden)
	local v67 = React.useCallback(function() -- line: 122
		-- upvalues: v65 (copy)
		if v65.viewProfileOnAvatarPressed then
			v65.openViewProfile(v65.senderUserId)
		end
	end, { v65.senderUserId })
	local v68 = useStyle()
	local shouldShowName = v65.shouldShowName
	local v70 = useChatPagePadding()
	local v71 = Foundation.Hooks.useTokens()
	local u72 = nil
	local v73 = nil
	local u74 = nil
	local u75 = nil
	local u76 = nil
	local u77 = nil
	local u78 = nil
	local u79 = nil

	if FFlagAppChatUseSwipeForReplies then
		u79 = React.useMemo(function() -- line: 143
			-- upvalues: v54 (copy), v65 (copy), SwipeDirection (copy), Foundation (copy), uDim2 (copy), uDim2_2 (copy), v55 (copy), vector2 (copy), vector2_2 (copy)
			if v54 then
				return {
					direction = if not v65.isIncoming then SwipeDirection.Left else SwipeDirection.Right,
					iconName = if not v65.isIncoming then Foundation.Enums.IconName.ArrowThickToLeft else Foundation.Enums.IconName.ArrowThickToRight,
					messagePosition = if not v65.isIncoming then uDim2_2 else uDim2,
					iconOffset = if not v65.isIncoming then -v55 else v55,
					iconAnchorPoint = if not v65.isIncoming then vector2_2 else vector2
				}
			end

			return {
				direction = SwipeDirection.Right,
				iconName = Foundation.Enums.IconName.ArrowThickToRight,
				messagePosition = uDim2,
				iconOffset = v55,
				iconAnchorPoint = vector2
			}
		end, {})
	end

	local u80 = nil
	local u81 = nil
	local u82 = nil
	local u83 = nil
	local u84 = nil
	local u85 = nil
	local u86 = nil
	local v87 = React.useRef(nil)
	local v88 = React.useRef(Vector2.zero)

	if getFFlagAppChatEnableRepliesUI() then
		local v89 = useTelemetry(ChatConversationTelemetryLayer.Context)
		local v90 = useTriggerFeedback()
		local v91, v92 = React.useState(false)

		u74 = v91

		local v93, v94 = React.useState(false)
		local v95, v96 = React.useState(false)

		React.useEffect(function() -- line: 184
			-- upvalues: GlobalLongPressSignal (copy), v96 (copy)
			local v129 = GlobalLongPressSignal.dismissed:connect(function() -- line: 185
				-- upvalues: v96 (copy)
				v96(false)
			end)

			return function() -- line: 188
				-- upvalues: v129 (copy)
				v129:disconnect()
			end
		end)

		local v97 = React.useMemo(function() -- line: 194
			-- upvalues: v65 (copy), FFlagAppChatEnableHiddenMessages (copy)
			return {
				conversationId = v65.conversationId,
				targetMessageSenderId = v65.senderUserId,
				targetMessageId = v65.messageId,
				targetMessageSentAt = if not v65.sent then nil else v65.sent.dateTime,
				targetMessageLength = if not v65.content then nil else #v65.content,
				targetMessageVisibility = if not FFlagAppChatEnableHiddenMessages then nil else v65.visibility
			}
		end, {
			v65.conversationId,
			v65.senderUserId,
			v65.messageId,
			v65.sent,
			v65.content,
			if not FFlagAppChatEnableHiddenMessages then nil else v65.visibility
		})

		u72 = React.useMemo(function() -- line: 214
			-- upvalues: FFlagAppChatEnableHiddenMessages (copy), v66 (copy), v93 (copy), FFlagAppChatUseSwipeForReplies (copy), v95 (copy)
			local v130

			if FFlagAppChatEnableHiddenMessages then
				v130 = not v66

				if v130 then
					v130 = v93

					if not v130 then
						v130 = not FFlagAppChatUseSwipeForReplies

						if v130 then
							return v95
						end
					end
				end
			else
				v130 = v93 or not FFlagAppChatUseSwipeForReplies and v95
			end

			return v130
		end, {
			v93,
			v95,
			v66
		})
		React.useEffect(function() -- line: 221
			-- upvalues: u72 (ref), v65 (copy), MessageFtuxTooltipDismissSignal (copy), MessageFtuxTooltipVariant (copy)
			if u72 and v65.isLastIncomingChatMessage then
				MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
			end
		end, {
			u72,
			v65.isLastIncomingChatMessage
		})
		v73 = React.useCallback(function() -- line: 226
			-- upvalues: ChatConversationTelemetryEvents (copy), v89 (copy), v97 (copy)
			if ChatConversationTelemetryEvents.ConversationMessageReplyIconImpression then
				v89.emit(ChatConversationTelemetryEvents.ConversationMessageReplyIconImpression, v97)
			end
		end, {
			v89,
			v97
		})
		u75 = useNavigation()
		u76 = useGetConversationFromId(v65.conversationId)

		local v98 = if not FFlagAppChatSignalsReplyStore then nil else GetReplyingToStore(false)
		local u99 = nil

		if FFlagAppChatSignalsMessageStore and v57 then
			local v100 = v57(false).channelsMessageStore.messages[v65.messageId]

			u99 = if not v100 then nil else MessageModel.fromChannelsApi(v100, v65.conversationId)
		elseif u76 and u76.messages then
			u99 = u76.messages:Get(v65.messageId)
		end

		local v101 = useReplyingToMessageDispatch()

		u77 = useLocalUserId()

		if FFlagAppChatUseSwipeForReplies then
			local v102 = React.useCallback(function() -- line: 257
				-- upvalues: FFlagAppChatEnableHiddenMessages (copy), v66 (copy), v90 (copy), HapticFeedbackContext (copy), HapticFeedbackType (copy)
				if not FFlagAppChatEnableHiddenMessages or not v66 then
					v90(HapticFeedbackContext.Default, HapticFeedbackType.Press)
				end
			end, {})
			local v103 = React.useCallback(function() -- line: 264
				-- upvalues: ChatConversationTelemetryEvents (copy), v89 (copy), v97 (copy), FFlagAppChatEnableHiddenMessages (copy), v66 (copy), FFlagAppChatSignalsReplyStore (copy), v98 (copy), v65 (copy), v101 (copy), u99 (ref)
				if ChatConversationTelemetryEvents.ConversationMessageSwiped then
					v89.emit(ChatConversationTelemetryEvents.ConversationMessageSwiped, v97)
				end

				if not FFlagAppChatEnableHiddenMessages or not v66 then
					if FFlagAppChatSignalsReplyStore and v98 then
						v98.setReplyingTo(v65.messageId)

						return
					end

					v101(u99)
				end
			end, {
				v101,
				u99,
				v89,
				v97,
				v66,
				if not FFlagAppChatSignalsReplyStore then nil else v98,
				if not FFlagAppChatSignalsReplyStore then nil else v65.messageId
			})

			u78 = useSwipeGesture({
				onSwipeThresholdReached = v102,
				onSwipeComplete = v103,
				direction = u79.direction
			})
		end

		local v104 = React.useCallback(function() -- line: 294
			-- upvalues: u75 (ref), EnumScreens (copy), v65 (copy)
			u75.navigate(EnumScreens.MessageContextMenu, {
				messageId = v65.messageId,
				conversationId = v65.conversationId,
				inputBoxRef = v65.inputBoxRef
			})
		end, {
			u75.navigate,
			v65.messageId,
			v65.conversationId,
			v65.inputBoxRef
		})
		local v105 = React.useCallback(function(p2, p3, n1: number) -- line: 303
			-- upvalues: v88 (copy), setTimeout (copy), v50 (copy), u86 (ref)
			if p3 then
				v88.current = Vector2.new(p3.Position.X, p3.Position.Y)
			end

			setTimeout(function() -- line: 307
				-- upvalues: p3 (copy), v88 (copy), v50 (copy), u86 (ref), p2 (copy)
				local n2 = 0

				if p3 then
					local current = v88.current

					n2 = (Vector2.new(p3.Position.X, p3.Position.Y) - current).Magnitude
				end

				if p3 and ((p3.UserInputState == Enum.UserInputState.Begin or p3.UserInputState == Enum.UserInputState.Change) and n2 < v50) then
					u86(p2, p3)
				end
			end, n1)
		end, { u86 })

		u86 = React.useCallback(function(p4, p5, s1: string?) -- line: 330
			-- upvalues: v65 (copy), UserInputService (copy), React (copy), v94 (copy), ChatConversationTelemetryEvents (copy), v89 (copy), v97 (copy), FFlagAppChatEnableHiddenMessages (copy), v66 (copy), FFlagAppChatUseSwipeForReplies (copy), v90 (copy), HapticFeedbackContext (copy), HapticFeedbackType (copy), v96 (copy), FFlagAppChatEnableMessageContextMenu (copy), v104 (copy), v105 (copy), ChatMessageContainerConstants (copy), v95 (copy), GlobalLongPressSignal (copy), OptionsEnum (copy), FFlagAppChatSignalsReplyStore (copy), v98 (copy), v101 (copy), u99 (ref)
			if v65.isPending then
				return
			end

			if UserInputService.MouseEnabled then
				if p4 == React.Event.MouseEnter then
					v94(true)
				end

				if p4 == React.Event.MouseLeave then
					v94(false)
				end

				if p4 == React.Event.MouseButton1Down then
					v65.closeKeyboard()
				end
			end

			if UserInputService.GamepadEnabled or UserInputService.TouchEnabled or v65.unitTestTouchEnabled then
				if p4 == React.Event.TouchLongPress then
					if ChatConversationTelemetryEvents.ConversationMessageLongPressed then
						v89.emit(ChatConversationTelemetryEvents.ConversationMessageLongPressed, v97)
					end

					if not FFlagAppChatEnableHiddenMessages or not v66 then
						if not FFlagAppChatUseSwipeForReplies then
							v90(HapticFeedbackContext.Default, HapticFeedbackType.Release)
						end

						v96(true)

						if FFlagAppChatEnableMessageContextMenu then
							v104()
						end

						v105(React.Event.InputEnded, p5, ChatMessageContainerConstants.PEEK_VIEW_ANIMATION_MILLISEC)
					end
				end

				if p4 == React.Event.InputBegan and p5 then
					if ChatConversationTelemetryEvents.ConversationMessagePressed then
						v89.emit(ChatConversationTelemetryEvents.ConversationMessagePressed, v97)
					end

					if (not FFlagAppChatEnableHiddenMessages or not v66) and not v95 then
						GlobalLongPressSignal.dismiss()
					end

					v105(React.Event.TouchLongPress, p5, ChatMessageContainerConstants.LONG_PRESS_DELAY_MILLISEC)
				end

				if p4 == React.Event.TouchTap then
					v65.closeKeyboard()
				end
			end

			if p4 == React.Event.Activated then
				GlobalLongPressSignal.dismiss()

				if s1 == OptionsEnum.MessageContextMenu then
					if ChatConversationTelemetryEvents.ConversationMessageOpenMenuIconClicked then
						v89.emit(ChatConversationTelemetryEvents.ConversationMessageOpenMenuIconClicked, v97)
					end

					v104()
				end

				if s1 == OptionsEnum.Reply then
					if ChatConversationTelemetryEvents.ConversationMessageReplyIconClicked then
						v89.emit(ChatConversationTelemetryEvents.ConversationMessageReplyIconClicked, v97)
					end

					v90(HapticFeedbackContext.Default, HapticFeedbackType.Press)

					if FFlagAppChatSignalsReplyStore and v98 then
						v98.setReplyingTo(v65.messageId)

						return
					end

					v101(u99)
				end
			end
		end, {
			v65.isPending,
			v65.unitTestTouchEnabled,
			UserInputService.MouseEnabled,
			UserInputService.TouchEnabled,
			v105,
			v94,
			v96,
			v92,
			v89,
			v104,
			v101,
			v90,
			v66,
			if not FFlagAppChatSignalsReplyStore then nil else v98,
			if not FFlagAppChatSignalsReplyStore then nil else u99,
			if not FFlagAppChatSignalsReplyStore then nil else v65.messageId
		})
		u82 = React.useCallback(function(p6, p7) -- line: 452
			-- upvalues: FFlagAppChatUseSwipeForReplies (copy), UserInputService (copy), u78 (ref), MessageFtuxTooltipDismissSignal (copy), MessageFtuxTooltipVariant (copy), v105 (copy), React (copy), ChatMessageContainerConstants (copy)
			if FFlagAppChatUseSwipeForReplies and (UserInputService.TouchEnabled and u78) then
				u78.onInputBegan(p6, p7)
				MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
			end

			v105(React.Event.InputBegan, p7, ChatMessageContainerConstants.INPUT_BEGAN_DELAY_MILLISEC)
		end, {
			v105,
			u78
		})
		u83 = React.useCallback(function(_) -- line: 461
			-- upvalues: u86 (ref), React (copy)
			u86(React.Event.InputEnded)
		end, { u86 })
		u80 = React.useCallback(function(_) -- line: 465
			-- upvalues: u86 (ref), React (copy)
			u86(React.Event.MouseEnter)
		end, { u86 })
		u81 = React.useCallback(function(_) -- line: 469
			-- upvalues: u86 (ref), React (copy)
			u86(React.Event.MouseLeave)
		end, { u86 })
		u84 = React.useCallback(function(_) -- line: 473
			-- upvalues: u86 (ref), React (copy)
			u86(React.Event.TouchTap)
		end, { u86 })
		u85 = React.useCallback(function(_) -- line: 477
			-- upvalues: u86 (ref), React (copy)
			u86(React.Event.MouseButton1Down)
		end, { u86 })
	end

	local v106 = getFFlagAppChatEnableRepliesUI() and (v65.repliesTo and v65.repliesTo.senderTargetId)
	local t2 = { v65.senderUserId }

	if v106 then
		table.insert(t2, v65.repliesTo.senderTargetId)
	end

	local v108 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = t2,
		query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local u109, v111

	if v108.data then
		u109 = false

		local v110 = UserProfiles.Selectors.getCombinedNameFromId(v108.data, v65.senderUserId) or v65.unknownUserKey

		v111 = if not v106 then v110 else (function(p13, p14) --[[ getDisplayNameText ]] -- line: 484
			-- upvalues: u77 (ref), v65 (copy), v106 (copy), u76 (ref), Conversation (copy)
			local v146 = u77 == v65.senderUserId
			local v147 = v65.senderUserId == v65.repliesTo.senderTargetId
			local v148 = u77 == v65.repliesTo.senderTargetId

			if not v106 then
				return p13
			end

			if v146 and v147 then
				return "Feature.Chat.Label.YouRepliedToYou"
			end

			if u76.conversationType == Conversation.Type.ONE_TO_ONE_CONVERSATION then
				if v146 and not v147 then
					return "Feature.Chat.Label.OneToOne.YouRepliedToThem"
				end

				if not v146 and v148 then
					return "Feature.Chat.Label.OneToOne.ThemRepliedToYou"
				end

				if not v146 and v147 then
					return "Feature.Chat.Label.OneToOne.ThemRepliedToThem"
				end
			end

			if u76.conversationType == Conversation.Type.MULTI_USER_CONVERSATION then
				if v146 and not v147 then
					return {
						"Feature.Chat.Label.Group.YouRepliedToThem",
						DISPLAY_NAME = p14
					}
				end

				if not v146 and v148 then
					return {
						"Feature.Chat.Label.Group.ThemRepliedToYou",
						DISPLAY_NAME = p13
					}
				end

				if not v146 and v147 then
					return {
						"Feature.Chat.Label.Group.ThemRepliedToThem",
						DISPLAY_NAME = p13
					}
				end

				if not v146 and not v148 then
					return {
						"Feature.Chat.Label.Group.ThemRepliedToOther",
						DISPLAY_NAME_1 = p13,
						DISPLAY_NAME_2 = p14
					}
				end
			end

			return v65.unknownUserKey
		end)(v110, UserProfiles.Selectors.getCombinedNameFromId(v108.data, v65.repliesTo.senderTargetId) or v65.unknownUserKey)
	else
		u109 = true
		v111 = nil
	end

	local u112 = useLocalization((if not v106 then {} else {
		displayName = v111
	})).displayName or v111
	local v113 = React.useCallback(function() -- line: 576
		-- upvalues: v65 (copy), ChatMessageContainerConstants (copy), TextService (copy), u112 (ref), v68 (copy)
		local vector2_3 = Vector2.new(math.max(1, v65.messageMaxWidth - ChatMessageContainerConstants.TAIL_WIDTH), 1e999)
		local TextSize = TextService:GetTextSize(u112, v68.Font.BaseSize * v68.Font.Footer.RelativeSize, v68.Font.Footer.Font, vector2_3)

		return UDim2.new(0, TextSize.X, 0, TextSize.Y)
	end, {
		v68.Font.BaseSize * v68.Font.Footer.RelativeSize,
		v68.Font.Footer.Font,
		v65.messageMaxWidth - ChatMessageContainerConstants.TAIL_WIDTH,
		u112
	})
	local n3 = 0

	if not v65.showDateTime then
		n3 = ((if not v65.isNewSender and not v106 then ChatMessageContainerConstants.CHAT_MESSAGE_MIN_SPACE else ChatMessageContainerConstants.CHAT_MESSAGE_MAX_SPACE)) + v65.messageTypePaddingOffset
	end

	local left = v70.left
	local v116 = left + v71.Size.Size_700
	local v117 = v65.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right
	local v118, v119 = React.useState(false)
	local v120 = React.useCallback(function() -- line: 604
		-- upvalues: getFFlagDebugAppChat (copy), v119 (copy)
		if getFFlagDebugAppChat() then
			v119(function(p15) -- line: 606
				return not p15
			end)
		end
	end, { v119 })
	local v121 = v118 or (v65.moderated or (v65.filteredForReceivers or FFlagAppChatEnableHiddenMessages and v66))
	local v122 = if not v118 then if not FFlagAppChatEnableHiddenMessages or not v66 then v65.moderated and v65.messageModeratedNoticeText or v65.messageDefaultNoticeText else v65.messageHiddenNoticeText else v65.messageId
	local v123 = React.useMemo(function() -- line: 621
		-- upvalues: React (copy), Foundation (copy), v71 (copy), v65 (copy)
		return React.createElement(Foundation.Icon, {
			name = Foundation.Enums.IconName.TriangleExclamation,
			size = Foundation.Enums.IconSize.Large,
			style = v71.Color.System.Alert,
			LayoutOrder = not v65.isIncoming and 3 or 0
		})
	end, {
		v71,
		v68,
		v65.isIncoming
	})
	local u124 = if not v65.failed and not v65.moderated then if not u72 then nil else React.createElement(Options, {
		LayoutOrder = not v65.isIncoming and 1 or 2,
		isIncoming = v65.isIncoming,
		handleEvent = u86,
		emitImpressionTelemetryEvent = v73
	}) else v123
	local v125 = not getFFlagAppChatEnableRepliesUI() or v65.isIncoming
	local v126 = if not FFlagAppChatUseSwipeForReplies or (not u78 or not u78.swipeProgress) then nil else u78.swipeProgress:map(function(n4: number) -- line: 649
		-- upvalues: v71 (copy)
		local v152 = 1 - math.pow(n4, 3)

		return {
			Color3 = v71.Semantic.Color.Icon.Default.Color3,
			Transparency = v152
		}
	end)
	local v127 = if not FFlagAppChatUseSwipeForReplies or (not u78 or not u78.swipeOffset) then nil else u78.swipeOffset:map(function(n5: number) -- line: 662
		-- upvalues: u79 (ref), SwipeDirection (copy)
		local v154 = if u79.direction ~= SwipeDirection.Right then -n5 else n5

		return UDim2.new(0, v154, 0, 0)
	end)
	local v128 = if not FFlagAppChatUseSwipeForReplies or (not u78 or not u78.swipeProgress) then nil else u78.swipeProgress:map(function(n6: number) -- line: 672
		-- upvalues: u79 (ref)
		return u79.messagePosition + UDim2.new(0, n6 * u79.iconOffset, 0, 0)
	end)

	React.useEffect(function() -- line: 847
		-- upvalues: v48 (copy), v65 (copy), IXPService (copy), v49 (copy)
		if v48 and v65.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(v49)
		end
	end, { v65.isLastIncomingChatMessage })

	return React.createElement(v63, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if not getFFlagDebugAppChat() then nil else "",
		[React.Event.Activated] = if not getFFlagDebugAppChat() then nil else v120
	}, {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = v117,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = v65.showDateTime and React.createElement(SystemMessage, {
			LayoutOrder = 1,
			Text = v65.sent:GetLongRelativeTime(),
			maxWidth = ChatMessageContainerConstants.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = (function() --[[ renderMessage ]] -- line: 678
			-- upvalues: React (copy), FFlagAppChatUseSwipeForReplies (copy), v127 (copy), u80 (ref), u81 (ref), n3 (ref), v65 (copy), left (copy), v116 (copy), v70 (copy), v117 (copy), Foundation (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), v67 (copy), v71 (copy), shouldShowName (copy), ChatMessageContainerConstants (copy), v125 (copy), v106 (copy), u109 (ref), v68 (copy), v113 (copy), u112 (ref), Skeleton (copy), getFFlagAppChatEnableRepliesUI (copy), v123 (copy), u82 (ref), u83 (ref), u84 (ref), u85 (ref), u74 (ref), u124 (ref), v87 (copy), FFlagAppChatEnableHiddenMessages (copy), v66 (copy), MessageFtuxTooltip2 (copy), MessageFtuxTooltipVariant (copy), u79 (ref), v128 (copy), v126 (copy)
			local v156 = React.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				Position = if not FFlagAppChatUseSwipeForReplies then nil else v127,
				[React.Event.MouseEnter] = u80,
				[React.Event.MouseLeave] = u81
			}, {
				Padding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, n3),
					PaddingLeft = UDim.new(0, v65.thumbnail and left or v116),
					PaddingRight = UDim.new(0, v70.right - 0)
				}),
				Layout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = v117
				}),
				AvatarContainer = if not v65.thumbnail then nil else React.createElement(Foundation.View, {
					tag = {
						["col auto-x size-0-full"] = true,
						["align-y-top"] = false
					},
					LayoutOrder = 1
				}, {
					Avatar = React.createElement(Foundation.View, {
						tag = "size-700-700"
					}, {
						AvatarCircle = React.createElement(UserTile, {
							userId = v65.senderUserId,
							layoutMode = LayoutMode.compact,
							userPresenceType = UserPresence.None,
							layoutOrder = 1,
							onActivated = v67
						})
					})
				}),
				MessageWithDisplayName = React.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, v65.isIncoming and -v116 or 0, 0, 0)
				}, {
					Layout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = v117
					}),
					Padding = React.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, v65.isIncoming and v71.Size.Size_200 or 0)
					}),
					DisplayNameContainer = shouldShowName and React.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0, v65.messageMaxWidth - ChatMessageContainerConstants.TAIL_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = 1
					}, {
						Padding = React.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, ChatMessageContainerConstants.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
							PaddingRight = if not v125 then UDim.new(0, ChatMessageContainerConstants.TAIL_WIDTH) else UDim.new(0, 0),
							PaddingBottom = if not v106 then UDim.new(0, ChatMessageContainerConstants.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, ChatMessageContainerConstants.REPLIED_DISPLAY_NAME_BOTTOM_PADDING)
						}),
						DisplayName = if u109 then nil else React.createElement("TextLabel", {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Font = v68.Font.Footer.Font,
							Size = v113(),
							AnchorPoint = if not v125 then Vector2.new(1, 0) else Vector2.new(0, 0),
							Position = if not v125 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
							Text = u112,
							TextColor3 = v68.Theme.TextDefault.Color,
							TextSize = v68.Font.BaseSize * v68.Font.Footer.RelativeSize,
							TextTransparency = v68.Theme.TextDefault.Transparency,
							TextXAlignment = if not v125 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top
						}),
						ShimmerName = if not u109 then nil else React.createElement(Skeleton, {
							AnchorPoint = if not v125 then Vector2.new(1, 0) else Vector2.new(0, 0),
							Position = if not v125 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
							Size = UDim2.new(0, ChatMessageContainerConstants.SHIMMER_WIDTH, 0, ChatMessageContainerConstants.SHIMMER_HEIGHT),
							LayoutOrder = 2
						})
					}),
					MessageWithIcons = React.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, v65.isIncoming and -v116 or 0, 0, 0)
					}, {
						Layout = React.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = v117,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 10),
							ItemLineAlignment = Enum.ItemLineAlignment.Center
						}),
						AlertIcon = if getFFlagAppChatEnableRepliesUI() or not v65.failed and not v65.moderated then nil else v123,
						Message = v65.renderMessage({
							LayoutOrder = not v65.isIncoming and 2 or 1,
							[React.Event.InputBegan] = u82,
							[React.Event.InputEnded] = u83,
							[React.Event.TouchTap] = u84,
							[React.Event.MouseButton1Down] = u85
						}, if not getFFlagAppChatEnableRepliesUI() then nil else {
							isPressed = u74,
							Icons = u124,
							ref = v87
						}),
						MessageFtuxTooltip = if not getFFlagAppChatEnableRepliesUI() or (not v65.isLastIncomingChatMessage or not not FFlagAppChatEnableHiddenMessages and v66) then nil else React.createElement(MessageFtuxTooltip2, {
							variant = MessageFtuxTooltipVariant.Replies,
							messageRef = v87,
							isReversed = v65.isIncoming
						})
					})
				})
			})

			if FFlagAppChatUseSwipeForReplies and (not FFlagAppChatEnableHiddenMessages or not v66) then
				return React.createElement(Foundation.View, {
					tag = "size-full-0 auto-y",
					ClipsDescendants = false,
					LayoutOrder = 2,
					ZIndex = 2
				}, {
					ReplyIconFilled = React.createElement(Foundation.Icon, {
						name = u79.iconName,
						size = Foundation.Enums.IconSize.Medium,
						variant = Foundation.Enums.IconVariant.Filled,
						AnchorPoint = u79.iconAnchorPoint,
						Position = v128,
						style = v126,
						ZIndex = 1
					}),
					Content = v156
				})
			end

			return v156
		end)(),
		Notice = v121 and React.createElement(NoticeText, {
			Font = v65.Font,
			HorizontalAlignment = v117,
			LayoutOrder = 3,
			Text = v122,
			TextColor3 = if not FFlagAppChatEnableHiddenMessages or not v66 then v65.moderated and v68.Theme.Alert.Color or v68.Theme.UIDefault.Color else v71.Color.Content.Muted.Color3,
			TextTransparency = if not FFlagAppChatEnableHiddenMessages or not v66 then v65.moderated and v68.Theme.Alert.Transparency or v68.Theme.UIDefault.Transparency else v71.Color.Content.Muted.Transparency,
			TextXAlignment = v65.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right,
			TextSize = v71.Typography.CaptionSmall.FontSize,
			margin = {
				top = v71.Padding.Small,
				left = v65.isIncoming and v116 + ChatMessageContainerConstants.NOTICE_HORIZONTAL_PADDING or 0,
				right = not v65.isIncoming and v70.right or 0,
				bottom = 0
			},
			maxWidth = v65.parentWidth,
			width = UDim.new(1, v65.isIncoming and -v116 or 0)
		}),
		debug = v65.debugElement or nil
	})
end

return ChatMessageContainer
