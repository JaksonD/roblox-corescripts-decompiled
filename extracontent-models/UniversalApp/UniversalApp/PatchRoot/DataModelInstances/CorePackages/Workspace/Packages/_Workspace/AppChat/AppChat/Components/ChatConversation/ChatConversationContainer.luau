local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local Logger = require(script.Parent.Logger)
local React = require(AppChatParent.React)
local Cryo = require(AppChatParent.Cryo)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local UniversalAppPolicy = require(AppChatParent.UniversalAppPolicy).UniversalAppPolicy
local ChatConversation = require(script.Parent.ChatConversation)
local PendingStateConversationPage = require(script.Parent.PendingState.PendingStateConversationPage)
local RoactChatAnalytics = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local useAnalytics = require(AppChat.LegacyAnalytics.useAnalytics)
local selectMessagesPure = require(AppChat.Components.ChatConversation.Messages.Selectors.selectMessagesPure)
local ConversationChannels = require(AppChat.Models.ConversationChannels)
local Conversation = require(AppChat.Models.Conversation)
local GenericDialogType = require(AppChat.Components.ChatDetails.Dialogs.GenericDialogType)
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local mapDispatchToProps = require(script.Parent.mapDispatchToProps)
local useGetConversationFromId = require(AppChat.Hooks.useGetConversationFromId)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useEffect = React.useEffect
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useMapDispatch = require(AppChat.Hooks.useMapDispatch)
local useGetUsers = require(AppChat.Hooks.useGetUsers)
local useGetUsersTyping = require(AppChat.Hooks.useGetUsersTyping)
local useSignalState = require(AppChatParent.SignalsReact).useSignalState
local GetReplyingToStore = require(AppChat.Stores.GetReplyingToStore)
local GetMessageViewModelStore = require(AppChat.Stores.GetMessageViewModelStore)
local useReplyingToMessage = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessage)
local useReplyingToMessageDispatch = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local FFlagAppChatSignalsReplyStore = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local UserProfiles = require(AppChatParent.UserProfiles)
local getConversationTitle = require(AppChat.Conversations.getConversationTitle)
local getOtherParticipants = require(AppChat.Conversations.getOtherParticipants)
local useRecipientIds = require(AppChat.Hooks.useRecipientIds)
local useIsUserPending = require(AppChat.Hooks.useIsUserPending)
local useChatIsVisible = require(AppChat.Hooks.useChatIsVisible)
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsExternalNavigationAvailable = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local useIsChatUserMessagesEnabled = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local chatInputBoxDisabledPressedSignal = require(AppChatParent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local RoduxNetworking = require(AppChat.Http.RoduxNetworking)
local useChatTimeoutDetails = require(AppChat.Hooks.useChatTimeoutDetails)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryState = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryEvents = require(script.Parent.ChatConversationTelemetryEvents)
local useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled)
local interventionTreatmentShownSignal = require(AppChatParent.InterventionShared).Signals.interventionTreatmentShownSignal
local useSignal = require(AppChatParent.RoactUtils).Hooks.useSignal
local Constants = require(AppChatParent.InterventionShared).Utils.Constants
local getAllRemainingOlderMessages = require(script.Parent.Messages.Thunks.getAllRemainingOlderMessages)
local getOlderMessages = require(script.Parent.Messages.NetworkRequests.getOlderMessages)
local useCallbackWithDynamicConversationId = require(AppChat.Hooks.useCallbackWithDynamicConversationId)
local useShouldShowConversationOverlay = require(AppChat.Hooks.useShouldShowConversationOverlay)
local useKeybind = require(AppChat.App.Hooks.useKeybind)
local EnumScreens = require(AppChat.EnumScreens)
local EnumMessageTypes = require(script.Parent.EnumMessageTypes)
local EnumCustomEntryTypes = require(script.Parent.EnumCustomEntryTypes)
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local GetFFlagEnableAppChatInExperience = require(AppChatParent.SharedFlags).GetFFlagEnableAppChatInExperience
local FFlagRenderChatConversationOnlyWhenVisible = require(AppChat.Flags.FFlagRenderChatConversationOnlyWhenVisible)
local getFFlagAppChatEnableIntervention = require(AppChatParent.InterventionShared).Flags.getFFlagAppChatEnableIntervention
local FFlagTCUpsellModalEnabled_DEV = require(AppChatParent.SharedFlags).FFlagTCUpsellModalEnabled_DEV
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagDebugEnableTCDoubleOptIn_DEV = require(AppChatParent.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV
local FFlagAppChatEnableDoubleOptIn = require(AppChatParent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagEnableAEGIS2AppChatConversationBanner = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local FFlagAppChatShowOSAOnPageEntry = require(AppChatParent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local v75 = game:DefineFastInt("AppChatGetAllMessagesDepth", 100)
local FFlagIsSquadEnabledAMP = require(AppChatParent.SharedFlags).FFlagIsSquadEnabledAMP
local FFlagAppChatSuppressGroupOSAContextCard = require(AppChat.Flags.FFlagAppChatSuppressGroupOSAContextCard)
local FFlagAppChatNavigateBackIfOSAUnacknowledged = require(AppChatParent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local shouldShowOSAForConversation = require(AppChat.Utils.shouldShowOSAForConversation)
local FFlagAppChatSignalsMessageStore = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local useMessageItemList = require(AppChat.Hooks.useMessageItemList).useMessageItemList
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local shouldShowU13ChatOptInForConversation = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local navigateWithOsaGate = require(AppChat.Utils).navigateWithOsaGate
local FFlagAppChatReactToFaeForOsa = require(AppChat.Flags.FFlagAppChatReactToFaeForOsa)
local FFlagAppChatNudgeToChatUpsellEnabled = require(AppChat.Flags.FFlagAppChatNudgeToChatUpsellEnabled)
local t1 = {
	topBarHeight = 0,
	wideMode = false,
	chatInputPlaceholderKey = "Feature.Chat.Label.ChatInputPlaceholder",
	replyChatInputPlaceholderKey = "Feature.Chat.Label.ReplyChatInputPlaceholder",
	replyToYourselfChatInputPlaceholderKey = "Feature.Chat.Label.ReplyToYourselfChatInputPlaceholder",
	messageDefaultNoticeKey = "Feature.Chat.Message.Default",
	messageModeratedNoticeKey = "Feature.Chat.Message.MessageContentModerated",
	newTextKey = "Feature.Chat.Label.New",
	schedulePartyTextKey = "Feature.Squads.Action.ScheduleParty",
	messageHiddenNoticeKey = "Feature.Chat.Label.MessageNotAvailable",
	networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong",
	notImplementedMessageTypeKey = "Feature.Chat.Label.NotImplementedMessageType",
	viewProfileOnAvatarPressed = true,
	unknownUserTextKey = "Feature.Chat.Label.UnknownUser",
	oneUserTyping = {
		"Feature.Chat.Message.OneUserTyping",
		DISPLAY_NAME = ""
	},
	twoUsersTyping = {
		"Feature.Chat.Message.TwoUsersTyping",
		DISPLAY_NAME_1 = "",
		DISPLAY_NAME_2 = ""
	},
	severalUsersTyping = "Feature.Chat.Message.SeveralUsersTyping",
	pendingStateBodyKey = "Feature.Chat.Message.ChatIsUnfiltered",
	connectUnavailableWithUserKey = "Feature.Chat.RobloxConnectUnavailableWithUser",
	chatUnavailableWithUserKey = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.ChatUnavailableWithUser" or "Feature.Chat.Message.PartyUnavailableWithUser",
	getReadingMessagesIsEnabled = function() --[[ getReadingMessagesIsEnabled ]] -- line: 127
	end,
	updateConversationTitle = function(_) --[[ updateConversationTitle ]] -- line: 128
	end,
	navigateToScreen = function() --[[ navigateToScreen ]] -- line: 129
	end,
	inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled",
	navigateToChatLanding = function() --[[ navigateToChatLanding ]] -- line: 131
	end,
	releaseInputBarFocus = function() --[[ releaseInputBarFocus ]] -- line: 132
	end,
	navigateToSquadLobby = function() --[[ navigateToSquadLobby ]] -- line: 133
	end,
	navigateToConversationOverlay = function() --[[ navigateToConversationOverlay ]] -- line: 134
	end,
	getCanAccessParty = true
}

local function getOsaState(p2) -- line: 139
	-- upvalues: FFlagAppChatSuppressGroupOSAContextCard (copy), Conversation (copy)
	local v92 = p2 and p2.fetchedOldestMessage
	local v93 = not FFlagAppChatSuppressGroupOSAContextCard or (not p2 or p2.conversationType ~= Conversation.Type.MULTI_USER_CONVERSATION)
	local v94 = p2 and (v93 and (p2.source == "friends" or (p2.osaAcknowledgementStatus == Conversation.OsaAcknowledgementStatus.Unacknowledged or p2.osaAcknowledgementStatus == Conversation.OsaAcknowledgementStatus.Acknowledged)))
	local v95 = p2 and p2.osaAcknowledgementStatus == Conversation.OsaAcknowledgementStatus.Unacknowledged
	local v96 = p2 and p2.source == "friends"

	return {
		shouldShowOsaCardInConversation = v94,
		fetchedOldestMessage = v92,
		shouldShowOsaCardOnInitialLoad = v94 and (v95 and not v96),
		shouldShowOsaCardNow = v94 and (v92 or v96)
	}
end

function ChatConversationContainer(p3) -- line: 167
	-- upvalues: Cryo (copy), t1 (copy), useAnalytics (copy), React (copy), RoactChatAnalytics (copy), useMapDispatch (copy), mapDispatchToProps (copy), useGetConversationFromId (copy), useRecipientIds (copy), HttpService (copy), useLocalUserId (copy), useChatIsVisible (copy), useIsChatUserMessagesEnabled (copy), useIsChatEnabled (copy), useDispatch (copy), useEffect (copy), FFlagAppChatNavigateBackIfOSAUnacknowledged (copy), FFlagAppChatShowOSAOnPageEntry (copy), RoactNavigation (copy), navigateWithOsaGate (copy), shouldShowOSAForConversation (copy), FFlagAppChatReactToFaeForOsa (copy), shouldShowU13ChatOptInForConversation (copy), useSignal (copy), interventionTreatmentShownSignal (copy), Constants (copy), UserProfiles (copy), getOtherParticipants (copy), getConversationTitle (copy), useGetUsers (copy), useGetUsersTyping (copy), FFlagAppChatSignalsMessageStore (copy), useMessageItemList (copy), selectMessagesPure (copy), getOsaState (copy), EnumMessageTypes (copy), EnumCustomEntryTypes (copy), GetFFlagEnableAppChatInExperience (copy), useIsInExperience (copy), FFlagAppChatSignalsReplyStore (copy), GetReplyingToStore (copy), GetMessageViewModelStore (copy), getFFlagAppChatEnableRepliesUI (copy), useSignalState (copy), useReplyingToMessage (copy), useReplyingToMessageDispatch (copy), useLocalization (copy), useTelemetry (copy), ChatConversationTelemetryLayer (copy), ChatConversationTelemetryState (copy), useIsUserPending (copy), FFlagAppChatEnableDoubleOptIn (copy), useCallbackWithDynamicConversationId (copy), AppChatNetworking (copy), Logger (copy), FFlagDebugEnableTCDoubleOptIn_DEV (copy), useKeybind (copy), FFlagTCUpsellModalEnabled_DEV (copy), FFlagEnableAEGIS2AppChatConversationBanner (copy), FFlagAppChatNudgeToChatUpsellEnabled (copy), useShouldShowConversationOverlay (copy), getFFlagAppChatEnableIntervention (copy), useSelector (copy), RoduxNetworking (copy), useChatTimeoutDetails (copy), ChatConversationTelemetryEvents (copy), ConversationChannels (copy), useIsExternalNavigationAvailable (copy), EnumScreens (copy), Conversation (copy), GenericDialogType (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), chatInputBoxDisabledPressedSignal (copy), FFlagAppChatPerfTracking (copy), FFlagRenderChatConversationOnlyWhenVisible (copy), AppChatPerfTracker (copy), getAllRemainingOlderMessages (copy), getOlderMessages (copy), v75 (copy), FFlagIsSquadEnabledAMP (copy), PendingStateConversationPage (copy), ChatConversation (copy)
	local v98 = Cryo.Dictionary.join(t1, p3)
	local v99 = useAnalytics()
	local v100 = React.useCallback(function(p4) -- line: 170
		-- upvalues: v99 (copy), RoactChatAnalytics (copy), v98 (copy)
		v99:navigate(RoactChatAnalytics.NavigationEvents.ChatConversationProfile)
		v98.openViewProfile(p4)
	end, {
		v98.openViewProfile,
		v99
	})
	local v101 = useMapDispatch(mapDispatchToProps)
	local u102 = useGetConversationFromId(v98.conversationId)
	local v103 = useRecipientIds(u102)
	local ok, result = pcall(function() -- line: 178
		-- upvalues: HttpService (copy), v103 (copy)
		return HttpService:JSONEncode(v103)
	end)
	local v106 = not ok and "[]" or result
	local v107 = useLocalUserId()
	local v108 = useChatIsVisible()
	local v109 = useIsChatUserMessagesEnabled()
	local v110 = useIsChatEnabled()
	local v111 = useDispatch()

	useEffect(function() -- line: 192
		-- upvalues: v110 (copy), v98 (copy)
		if not v110 then
			v98.navigateToChatLanding()
		end
	end, {
		v110,
		v98.navigateToChatLanding
	})

	if FFlagAppChatNavigateBackIfOSAUnacknowledged then
		local v112 = not not v98.navigation and (not not v98.navigation.getParam and v98.navigation.getParam("isNavigatedFromGroupOSAJoin", false))

		if FFlagAppChatShowOSAOnPageEntry then
			useEffect(function() -- line: 205
				-- upvalues: v98 (copy), RoactNavigation (copy), navigateWithOsaGate (copy), v111 (copy)
				if not v98.navigation or not v98.navigation.addListener then
					return
				end

				local v179 = v98.navigation.addListener(RoactNavigation.Events.WillFocus, function() -- line: 209
					-- upvalues: navigateWithOsaGate (copy), v98 (copy), v111 (copy)
					navigateWithOsaGate({
						conversationId = v98.conversationId,
						dispatch = v111,
						onAccepted = function() --[[ onAccepted ]] -- line: 213
						end,
						onDeclined = function() --[[ onDeclined ]] -- line: 214
							-- upvalues: v98 (copy)
							v98.navigateToChatLanding()
						end
					})
				end)

				return function() -- line: 219
					-- upvalues: v179 (copy)
					if v179 then
						v179:remove()
					end
				end
			end, {
				v98.navigation,
				v98.conversationId,
				v111
			})
		else
			useEffect(function() -- line: 226
				-- upvalues: v112 (copy), shouldShowOSAForConversation (copy), u102 (ref), v98 (copy)
				if not v112 and shouldShowOSAForConversation(u102) then
					v98.navigateToChatLanding()
				end
			end, {
				u102,
				v98.navigateToChatLanding,
				v112
			})
		end
	end

	if FFlagAppChatReactToFaeForOsa then
		useEffect(function() -- line: 236
			-- upvalues: u102 (ref), shouldShowOSAForConversation (copy), shouldShowU13ChatOptInForConversation (copy), navigateWithOsaGate (copy), v98 (copy), v111 (copy)
			if not u102 then
				return
			end

			local v180 = shouldShowOSAForConversation(u102)
			local v181 = shouldShowU13ChatOptInForConversation(u102)

			if v180 or v181 then
				navigateWithOsaGate({
					conversationId = v98.conversationId,
					dispatch = v111,
					onAccepted = function() --[[ onAccepted ]] -- line: 246
					end,
					onDeclined = function() --[[ onDeclined ]] -- line: 247
						-- upvalues: v98 (copy)
						v98.navigateToChatLanding()
					end
				})
			end
		end, {
			u102,
			v98.conversationId,
			v111
		})
	end

	useSignal(interventionTreatmentShownSignal, React.useCallback(function(p5) -- line: 262
		-- upvalues: Constants (copy), v98 (copy)
		if p5 == Constants.TreatmentType.PartyChatNudgeDialog or p5 == Constants.TreatmentType.PartyChatTimeoutDialog then
			v98.releaseInputBarFocus()
		end
	end, { v98.releaseInputBarFocus }))

	local v113 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = getOtherParticipants(u102, v107),
		query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local v114 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = { (tostring(v107)) },
		query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local u115 = getConversationTitle(u102, v113.data and v113.data.userProfiles, not v114.data and "" or UserProfiles.Selectors.getCombinedNameFromId(v114.data, (tostring(v107))))
	local v116 = useGetUsers()
	local v117 = useGetUsersTyping(v98.conversationId)
	local v118 = React.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local u119 = nil

	if FFlagAppChatSignalsMessageStore then
		u119 = useMessageItemList(v98.conversationId, v116, v107, u102)
	end

	local v120 = React.useMemo(function() -- line: 304
		-- upvalues: FFlagAppChatSignalsMessageStore (copy), u119 (ref), v118 (copy), selectMessagesPure (copy), u102 (ref), v98 (copy), v116 (copy), v107 (copy)
		if FFlagAppChatSignalsMessageStore then
			return u119
		end

		v118.current = selectMessagesPure({
			conversation = u102,
			conversationId = v98.conversationId,
			Users = v116,
			localUserId = v107
		}, v118.current)

		return v118.current.itemList
	end, {
		u102,
		v98.conversationId,
		v116,
		v107,
		u119
	})
	local v121 = getOsaState(u102)
	local v122 = React.useMemo(function() -- line: 321
		-- upvalues: v121 (copy), v120 (copy), EnumMessageTypes (copy), EnumCustomEntryTypes (copy)
		if v121.shouldShowOsaCardOnInitialLoad and not v121.fetchedOldestMessage then
			return {}
		end

		local v183 = table.clone(v120)

		if v121.shouldShowOsaCardNow then
			table.insert(v183, {
				messageType = EnumMessageTypes.Custom,
				customEntryType = EnumCustomEntryTypes.OsaContextCardOneToOne,
				stable_key = EnumCustomEntryTypes.OsaContextCardOneToOne
			})
		end

		return v183
	end, {
		v120,
		u102,
		v121.shouldShowOsaCardOnInitialLoad,
		v121.shouldShowOsaCardInConversation,
		v121.shouldShowOsaCardNow,
		v121.fetchedOldestMessage
	})
	local v123 = if not v117[1] or not v113.data then nil else UserProfiles.Selectors.getCombinedNameFromId(v113.data, v117[1].id)
	local v124 = if not v117[2] or not v113.data then nil else UserProfiles.Selectors.getCombinedNameFromId(v113.data, v117[2].id)
	local v125 = true

	if #v117 == 1 and not v123 then
		v125 = false
	elseif #v117 == 2 and (not v123 or not v124) then
		v125 = false
	end

	local v126 = GetFFlagEnableAppChatInExperience() and useIsInExperience()
	local v127 = if not FFlagAppChatSignalsReplyStore then nil else GetReplyingToStore(false)
	local v128 = if not FFlagAppChatSignalsReplyStore then nil else GetMessageViewModelStore(false).channelsMessageStore
	local v129 = nil
	local v130 = nil
	local v131 = nil
	local v132 = nil
	local v133 = nil

	if getFFlagAppChatEnableRepliesUI() then
		if FFlagAppChatSignalsReplyStore then
			v131 = useSignalState(v127.getMessageId)

			if v131 then
				local v134 = v128.messages(false)[v131]
				local v135 = if not v134 or not v134.sender_user_id then nil else tostring(v134.sender_user_id)

				v133 = v135 == v107
				v132 = if v133 or (not v135 or not v113.data) then nil else UserProfiles.Selectors.getCombinedNameFromId(v113.data, v135)
			end
		else
			v129 = useReplyingToMessage()
			v130 = useReplyingToMessageDispatch()

			if v129 then
				v133 = v107 == v129.senderTargetId
				v132 = if v133 or not v113.data then nil else UserProfiles.Selectors.getCombinedNameFromId(v113.data, v129.senderTargetId)
			end
		end
	end

	local v136 = useLocalization({
		chatInputPlaceholder = v98.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			v98.replyChatInputPlaceholderKey,
			DISPLAY_NAME = v132
		},
		replyToYourselfChatInputPlaceholder = v98.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = v98.notImplementedMessageTypeKey,
		messageDefaultNoticeText = v98.messageDefaultNoticeKey,
		messageModeratedNoticeText = v98.messageModeratedNoticeKey,
		messageHiddenNoticeText = v98.messageHiddenNoticeKey,
		networkErrorText = v98.networkErrorTextKey,
		newText = v98.newTextKey,
		schedulePartyText = v98.schedulePartyTextKey,
		unknownUserText = v98.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = v123
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = v123,
			DISPLAY_NAME_2 = v124
		},
		severalUsersTyping = v98.severalUsersTyping,
		bottomModalText = v98.chatUnavailableWithUserKey,
		inputBarDisabledText = v98.inputBarDisabledKey
	})
	local v137 = useTelemetry(ChatConversationTelemetryLayer.Context)
	local v138 = ChatConversationTelemetryState.useMergeState()
	local v139 = ChatConversationTelemetryState.useClearState()
	local v140 = u102 and u102.moderationType or Cryo.None
	local v141 = u102 and u102.userPendingStatus or Cryo.None

	useEffect(function() -- line: 435
		-- upvalues: v138 (copy), v98 (copy), v140 (copy), v141 (copy)
		v138({
			conversationId = v98.conversationId,
			moderationType = v140,
			userPendingStatus = v141
		})
	end, {
		v138,
		v98.conversationId,
		v140,
		v141
	})

	local v142 = useIsUserPending(u102 or {})
	local v143 = u102 and u102.source

	if FFlagAppChatEnableDoubleOptIn then
		local v144, v145 = useCallbackWithDynamicConversationId(AppChatNetworking.rodux.GetModalSequence.API, v98.conversationId)

		useEffect(function() -- line: 451
			-- upvalues: v145 (copy), v142 (copy), v143 (copy), v111 (copy), AppChatNetworking (copy), v98 (copy), v126 (copy), Logger (copy), v144 (copy)
			if not v145 then
				return
			end

			if v142 and v143 == "channels" then
				v111(AppChatNetworking.rodux.GetPendingStateModal.API(v98.conversationId, v126)):catch(function(p6) -- line: 457
					-- upvalues: Logger (copy)
					Logger:warning(`GetPendingStateModal error in ChatConversationContainer { tostring(p6) }`)
				end)
			end

			if not v142 then
				v111(v144({
					modalSequence = AppChatNetworking.Constants.ModalSequence.ConversationTopModal,
					isInExperience = v126
				})):catch(function(p7) -- line: 466
					-- upvalues: Logger (copy)
					Logger:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer { tostring(p7) }`)
				end)
			end
		end, {
			v98.conversationId,
			v145,
			v126,
			v142,
			v143
		})
	else
		useEffect(function() -- line: 474
			-- upvalues: v143 (copy), v142 (copy), v111 (copy), AppChatNetworking (copy), v98 (copy), v126 (copy)
			if v143 ~= "channels" then
				return
			end

			if v142 then
				v111(AppChatNetworking.rodux.GetPendingStateModal.API(v98.conversationId, v126)):catch(function(p8) -- line: 480
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(p8))
				end)

				return
			end

			v111(AppChatNetworking.rodux.GetConversationTopModal.API(v98.conversationId, v126)):catch(function(p9) -- line: 486
				warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(p9))
			end)
		end, {
			v98.conversationId,
			v111,
			v143
		})
	end

	local v146, u147 = useCallbackWithDynamicConversationId(AppChatNetworking.rodux.GetModalSequence.API, v98.conversationId)

	useEffect(function() -- line: 497
		-- upvalues: v142 (copy), u147 (ref), v111 (copy), v146 (copy), AppChatNetworking (copy), v126 (copy), Logger (copy)
		if not v142 and u147 then
			v111(v146({
				modalSequence = AppChatNetworking.Constants.ModalSequence.ConversationOverlay,
				isInExperience = v126
			})):catch(function(p10) -- line: 502
				-- upvalues: Logger (copy)
				Logger:warning(`GetModalSequence error in ChatConversationContainer { tostring(p10) }`)
			end)
		end
	end, {
		u147,
		v98.conversationId,
		v142,
		v126,
		v140
	})

	if FFlagDebugEnableTCDoubleOptIn_DEV then
		useKeybind({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() -- line: 509
			-- upvalues: Logger (copy), v111 (copy), v98 (copy), AppChatNetworking (copy)
			Logger:debug("Ctrl + O pressed, showing new TC double opt in banner")
			v111({
				type = "DEBUG_ShowNewTopModal",
				conversationId = v98.conversationId,
				modalVariant = AppChatNetworking.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, {
			v111,
			v98.conversationId
		})
		useKeybind({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() -- line: 518
			-- upvalues: Logger (copy), v111 (copy), v98 (copy), AppChatNetworking (copy)
			Logger:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			v111({
				type = "DEBUG_ShowNewTopModal",
				conversationId = v98.conversationId,
				modalVariant = AppChatNetworking.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, {
			v111,
			v98.conversationId
		})
	end

	if FFlagTCUpsellModalEnabled_DEV then
		useKeybind({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() -- line: 529
			-- upvalues: Logger (copy), v111 (copy), v98 (copy), AppChatNetworking (copy)
			Logger:debug("Ctrl + L pressed, showing new TC created overlay")
			v111({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = v98.conversationId,
				modalVariant = AppChatNetworking.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, {
			v111,
			v98.conversationId
		})
	end

	if FFlagEnableAEGIS2AppChatConversationBanner or FFlagAppChatNudgeToChatUpsellEnabled then
		local v148, v149 = useCallbackWithDynamicConversationId(AppChatNetworking.rodux.GetModalSequence.API, v98.conversationId)
		local u150 = v148

		u147 = v149
		useEffect(function() -- line: 545
			-- upvalues: u147 (ref), v111 (copy), u150 (ref), AppChatNetworking (copy), v126 (copy), Logger (copy)
			if not u147 then
				return
			end

			v111(u150({
				modalSequence = AppChatNetworking.Constants.ModalSequence.ConversationBottomModal,
				isInExperience = v126
			})):catch(function(p11) -- line: 553
				-- upvalues: Logger (copy)
				Logger:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer { tostring(p11) }`)
			end)
		end, {
			v98.conversationId,
			u147,
			v126
		})
	end

	local v151 = useShouldShowConversationOverlay(v98.conversationId)

	useEffect(function() -- line: 561
		-- upvalues: v151 (copy), v98 (copy)
		if v151 then
			v98.navigateToConversationOverlay()
		end
	end, {
		v151,
		v98.conversationId
	})

	local isTimedOut = nil
	local timeoutEndTimestamp = nil
	local decisionEventId = nil
	local duration = nil

	if getFFlagAppChatEnableIntervention() then
		local v156 = v143 ~= "channels"
		local v157 = useSelector(function(p12) -- line: 573
			-- upvalues: v156 (copy), AppChatNetworking (copy), v98 (copy), RoduxNetworking (copy)
			return ((if not v156 then AppChatNetworking.rodux.GetChatModerationStatuses.getStatus(p12, v98.conversationId) else AppChatNetworking.rodux.GetChatModerationStatuses.getStatus(p12))) == RoduxNetworking.Enum.NetworkStatus.NotStarted
		end)

		useEffect(function() -- line: 580
			-- upvalues: v157 (copy), v111 (copy), AppChatNetworking (copy), v156 (copy), v98 (copy)
			if v157 then
				v111(AppChatNetworking.rodux.GetChatModerationStatuses.API((if not v156 then { v98.conversationId } else nil))):catch(function(p13) -- line: 586
					warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(p13))
				end)
			end
		end, {
			v98.conversationId,
			v156,
			v111,
			v157
		})

		local v158 = useChatTimeoutDetails({
			conversationId = v98.conversationId,
			conversationModerationType = v140
		})

		isTimedOut = v158.isTimedOut
		timeoutEndTimestamp = v158.timeoutEndTimestamp
		decisionEventId = v158.decisionEventId
		duration = v158.duration
	end

	useEffect(function() -- line: 603
		-- upvalues: v137 (copy), ChatConversationTelemetryEvents (copy), v120 (copy)
		v137.emit(ChatConversationTelemetryEvents.ScreenRendered, {
			loadedMessageCount = #v120
		})
	end, { v98.conversationId })

	local v159 = React.useCallback(function(s1: string) -- line: 611
		-- upvalues: v137 (copy), ChatConversationTelemetryEvents (copy), v139 (copy)
		v137.emit(ChatConversationTelemetryEvents.ScreenExit, {
			conversationExitType = s1
		})
		v139()
	end, {
		v137,
		v139
	})

	u102 = u102 or {}

	local v160 = u102.participantPendingStatus ~= ConversationChannels.UserPendingStatus.Pending and v109
	local v161 = not v160 and v109
	local v162 = useIsExternalNavigationAvailable({ EnumScreens.ViewUserProfile })
	local v163 = u102.conversationType == Conversation.Type.MULTI_USER_CONVERSATION
	local v164 = useSelector(function(p14) -- line: 631
		-- upvalues: v163 (copy), u102 (ref)
		return v163 and u102.initiator == p14.LocalUserId
	end)

	local function v165(p15) -- line: 636
		-- upvalues: v162 (copy), EnumScreens (copy), v100 (copy), v98 (copy), GenericDialogType (copy), v142 (copy), v163 (copy), v164 (copy)
		if v162[EnumScreens.ViewUserProfile] then
			v100(p15)

			return
		end

		v98.navigateToScreen(GenericDialogType.ParticipantDialog, {
			conversationId = v98.conversationId,
			participantId = p15,
			showRemoveUserButton = not v142 and (v163 and v164)
		}, true)
	end

	local v166 = if not if not FFlagAppChatSignalsReplyStore then v129 else v131 then v136.chatInputPlaceholder else if not v133 then v136.replyChatInputPlaceholder else v136.replyToYourselfChatInputPlaceholder

	useEffect(function() -- line: 655
		-- upvalues: v98 (copy), u115 (ref)
		v98.updateConversationTitle(u115)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u115, v98.updateConversationTitle) else {
		u115,
		v98.updateConversationTitle
	})

	local v167 = if not getFFlagAppChatEnableIntervention() then nil else React.useCallback(function() -- line: 664
		-- upvalues: chatInputBoxDisabledPressedSignal (copy), timeoutEndTimestamp (ref), decisionEventId (ref), duration (ref)
		chatInputBoxDisabledPressedSignal:fire({
			endTimestamp = timeoutEndTimestamp,
			decisionEventId = decisionEventId,
			duration = duration
		})
	end, {
		timeoutEndTimestamp,
		decisionEventId,
		duration
	})
	local v168, v169 = React.useState(v98.navigation and (v98.navigation.isFocused and v98.navigation.isFocused()))
	local v170 = nil
	local u171 = nil

	if FFlagAppChatPerfTracking then
		v170 = v168

		if FFlagRenderChatConversationOnlyWhenVisible and v98.isFocused and not v98.isFocused() then
			v170 = false
		end

		u171 = v170 and not v142
	end

	local v172 = nil

	if FFlagAppChatPerfTracking then
		local v173 = React.useRef(false)

		React.useEffect(function() -- line: 694
			-- upvalues: v173 (copy), v160 (copy)
			v173.current = not v160
		end, {
			v98.conversationId,
			v160
		})

		local v174 = React.useCallback(function(s2: string) -- line: 698
			-- upvalues: AppChatPerfTracker (copy), v98 (copy), u171 (ref), v173 (copy), Logger (copy), v120 (copy)
			if not AppChatPerfTracker.isActive(AppChatPerfTracker.Events.ChatConversationTTI, {
				conversationId = v98.conversationId
			}) or not u171 then
				return
			end

			if not v173.current then
				Logger:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", v173.current, s2)

				return
			end

			AppChatPerfTracker.finish(AppChatPerfTracker.Events.ChatConversationTTI, {
				conversationId = v98.conversationId,
				numElementsRendered = #v120
			})
		end, {
			v98.conversationId,
			v168,
			v142,
			#v120
		})

		React.useEffect(function() -- line: 722
			-- upvalues: v174 (copy)
			v174("messages_ready")
		end, {
			v174,
			#v120,
			v98.conversationId
		})
		v172 = React.useCallback(function() -- line: 726
			-- upvalues: v173 (copy), v174 (copy)
			v173.current = true
			v174("input_bar_ready")
		end, { v174 })
	end

	if FFlagAppChatPerfTracking then
		local v175 = React.useRef(nil)

		React.useEffect(function() -- line: 740
			-- upvalues: Logger (copy), v98 (copy), v175 (copy), AppChatPerfTracker (copy)
			Logger:debug("Perf: Resetting message perf tracking for conversation {}", v98.conversationId)
			v175.current = nil

			local t2 = {
				conversationId = v98.conversationId
			}

			AppChatPerfTracker.cancel(AppChatPerfTracker.Events.MessageSendToPendingRender, t2)
			AppChatPerfTracker.cancel(AppChatPerfTracker.Events.MessageSendResponseToFinalRender, t2)
			AppChatPerfTracker.cancel(AppChatPerfTracker.Events.MessageSendToFinalRender, t2)
			AppChatPerfTracker.cancel(AppChatPerfTracker.Events.MessageReceiveToRender, t2)
		end, { v98.conversationId })
		React.useEffect(function() -- line: 753
			-- upvalues: v120 (copy), v98 (copy), v107 (copy), v175 (copy), AppChatPerfTracker (copy)
			local v190 = v120[1]

			if not v190 or not v190.id then
				return
			end

			local t3 = {
				conversationId = v98.conversationId
			}
			local v192 = v190.senderTargetId == v107

			if not v190.isSending and (v190.senderType == "system" or not v192) then
				if v190.id ~= v175.current then
					v175.current = v190.id
					AppChatPerfTracker.finish(AppChatPerfTracker.Events.MessageReceiveToRender, t3)
				end
			elseif AppChatPerfTracker.isActive(AppChatPerfTracker.Events.MessageReceiveToRender, t3) then
				AppChatPerfTracker.cancel(AppChatPerfTracker.Events.MessageReceiveToRender, t3)
			end

			if not v192 then
				return
			end

			if v190.isSending then
				AppChatPerfTracker.finish(AppChatPerfTracker.Events.MessageSendToPendingRender, t3)

				return
			end

			AppChatPerfTracker.finish(AppChatPerfTracker.Events.MessageSendResponseToFinalRender, t3)
			AppChatPerfTracker.finish(AppChatPerfTracker.Events.MessageSendToFinalRender, t3)
		end, {
			v120,
			v107,
			v98.conversationId
		})
	end

	useEffect(function() -- line: 798
		-- upvalues: v98 (copy), RoactNavigation (copy), FFlagAppChatPerfTracking (copy), v169 (copy), AppChatPerfTracker (copy)
		local v193 = v98.navigation and (v98.navigation.addListener and v98.navigation.addListener(RoactNavigation.Events.WillBlur, function(p16) -- line: 801
			-- upvalues: FFlagAppChatPerfTracking (copy), v169 (copy), AppChatPerfTracker (copy), v98 (copy)
			if FFlagAppChatPerfTracking then
				local v203 = not not p16 and (not not p16.action and (not not p16.action.params and (p16.action.params.isOverlay or false)))

				v169(v203)

				if v203 then
					return
				end

				if AppChatPerfTracker.isActive(AppChatPerfTracker.Events.ChatConversationTTI, {
					conversationId = v98.conversationId
				}) then
					AppChatPerfTracker.cancel(AppChatPerfTracker.Events.ChatConversationTTI, {
						conversationId = v98.conversationId
					})

					return
				end
			else
				if p16 and p16.action and p16.action.params and p16.action.params.isOverlay then
					v169(true)

					return
				end

				v169(false)
			end
		end))
		local v194 = v98.navigation and (v98.navigation.addListener and v98.navigation.addListener(RoactNavigation.Events.WillFocus, function(_) -- line: 832
			-- upvalues: v169 (copy)
			v169(true)
		end))

		return function() -- line: 836
			-- upvalues: v193 (copy), v194 (copy)
			if v193 then
				v193.remove()
			end

			if v194 then
				v194.remove()
			end
		end
	end, {
		v98.navigation,
		v98.conversationId
	})
	useEffect(function() -- line: 847
		-- upvalues: v121 (copy), v111 (copy), getAllRemainingOlderMessages (copy), getOlderMessages (copy), v98 (copy), v75 (copy), v136 (copy)
		if v121.shouldShowOsaCardOnInitialLoad then
			v111(getAllRemainingOlderMessages(getOlderMessages, v98.conversationId, v75)):catch(function() -- line: 851
				-- upvalues: v98 (copy), v136 (copy)
				v98.navigateToToast({
					toastProps = {
						toastContent = {
							toastTitle = v136.networkErrorText
						}
					}
				})
			end)
		end
	end, { v121.shouldShowOsaCardOnInitialLoad })

	local v176 = not FFlagIsSquadEnabledAMP or v98.getCanAccessParty

	if FFlagAppChatPerfTracking then
		if not v170 then
			return nil
		end

		if v142 then
			return React.createElement(PendingStateConversationPage, {
				conversationId = v98.conversationId,
				topBarHeight = v98.topBarHeight,
				networkErrorText = v136.networkErrorText,
				navigateToToast = v98.navigateToToast,
				wideMode = v98.wideMode,
				onConversationUnmount = v159,
				navigateBack = v98.navigateBack
			})
		end

		return React.createElement(ChatConversation, Cryo.Dictionary.join(v98, v101, v136, {
			moreMenuEnabled = if not FFlagIsSquadEnabledAMP then nil else v176,
			conversation = u102,
			conversationTitle = u115,
			itemList = v122,
			localUserId = v107,
			openGameDetailsPage = v98.openGameDetailsPage,
			openViewProfile = v165,
			readingMessagesIsEnabled = v98.getReadingMessagesIsEnabled(),
			Users = v116,
			usersTyping = v117,
			displayNamesAvailable = v125,
			onConversationUnmount = v159,
			recipientIdsSerialized = v106,
			chatIsVisible = v108,
			chatInputPlaceholder = v166,
			replyingToMessageId = if not FFlagAppChatSignalsReplyStore then nil else v131,
			replyingToMessage = if FFlagAppChatSignalsReplyStore then nil else v129,
			replyingToMessageDispatch = if FFlagAppChatSignalsReplyStore then nil else v130,
			shouldShowChatInputBar = v160,
			shouldShowLegacyBottomModal = v161,
			shouldDisableChatInputBar = isTimedOut,
			onChatInputBarReady = if not FFlagAppChatPerfTracking then nil else v172,
			inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
			onDisabledInputBarActivated = v167,
			scrollToTopOnInitialOsaLoad = v121.shouldShowOsaCardOnInitialLoad and v121.fetchedOldestMessage,
			navigateToSquadLobby = if not v176 then nil else v98.navigateToSquadLobby,
			shouldHideMoreMenuButton = if not v176 then nil else not v160
		}))
	end

	if not v168 then
		return nil
	end

	if FFlagRenderChatConversationOnlyWhenVisible and v98.isFocused and not v98.isFocused() then
		return nil
	end

	if v142 then
		return React.createElement(PendingStateConversationPage, {
			conversationId = v98.conversationId,
			topBarHeight = v98.topBarHeight,
			networkErrorText = v136.networkErrorText,
			navigateToToast = v98.navigateToToast,
			wideMode = v98.wideMode,
			onConversationUnmount = v159,
			navigateBack = v98.navigateBack,
			style = v98.style
		})
	end

	return React.createElement(ChatConversation, Cryo.Dictionary.join(v98, v101, v136, {
		moreMenuEnabled = if not FFlagIsSquadEnabledAMP then nil else v176,
		conversation = u102,
		conversationTitle = u115,
		itemList = v122,
		localUserId = v107,
		openGameDetailsPage = v98.openGameDetailsPage,
		openViewProfile = v165,
		readingMessagesIsEnabled = v98.getReadingMessagesIsEnabled(),
		Users = v116,
		usersTyping = v117,
		displayNamesAvailable = v125,
		onConversationUnmount = v159,
		recipientIdsSerialized = v106,
		chatIsVisible = v108,
		chatInputPlaceholder = v166,
		replyingToMessageId = if not FFlagAppChatSignalsReplyStore then nil else v131,
		replyingToMessage = if FFlagAppChatSignalsReplyStore then nil else v129,
		replyingToMessageDispatch = if FFlagAppChatSignalsReplyStore then nil else v130,
		shouldShowChatInputBar = v160,
		shouldShowLegacyBottomModal = v161,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if not FFlagAppChatPerfTracking then nil else v172,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = v167,
		scrollToTopOnInitialOsaLoad = v121.shouldShowOsaCardOnInitialLoad and v121.fetchedOldestMessage,
		navigateToSquadLobby = if not v176 then nil else v98.navigateToSquadLobby,
		shouldHideMoreMenuButton = if not v176 then nil else not v160
	}))
end

return UniversalAppPolicy.connect(function(p18) -- line: 971
	return {
		viewProfileOnAvatarPressed = p18.getChatTapConversationThumbnail(),
		getCanAccessParty = p18.getCanAccessParty()
	}
end)(ChatConversationContainer)
