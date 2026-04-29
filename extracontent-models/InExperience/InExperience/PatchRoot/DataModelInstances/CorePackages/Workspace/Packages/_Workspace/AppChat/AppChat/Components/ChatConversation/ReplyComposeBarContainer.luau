local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Cryo = require(AppChatParent.Cryo)
local UIBlox = require(AppChatParent.UIBlox)
local ReplyComposeBar = require(script.Parent.ReplyComposeBar)
local ReplyComposeBarConstants = require(script.Parent.ReplyComposeBarConstants)
local populateUserWithState = require(AppChat.Users.populateUserWithState)
local UserProfiles = require(AppChatParent.UserProfiles)
local useSignalState = require(AppChatParent.SignalsReact).useSignalState
local GetReplyingToStore = require(AppChat.Stores.GetReplyingToStore)
local GetChannelsMessageStore = require(AppChat.Stores.GetChannelsMessageStore)
local useStyle = UIBlox.Core.Style.useStyle
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryEvents = require(script.Parent.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayer = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local FFlagAppChatReplyComposeBarContainer = require(AppChat.Flags.FFlagAppChatReplyComposeBarContainer)
local FFlagAppChatSignalsReplyStore = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local t1 = {
	LayoutOrder = 3,
	message = nil,
	close = function() --[[ close ]] -- line: 53
	end,
	inputBoxRef = nil,
	setReplyComposeBarHeight = function(_) --[[ setReplyComposeBarHeight ]] -- line: 56
	end,
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	replyingToYourselfKey = "Feature.Chat.Label.ReplyingToYourself",
	replyingToOthersKey = "Feature.Chat.Label.ReplyingToOthers"
}

function getTargetMessageInfo(p2) -- line: 63
	if not p2 then
		return {}
	end

	return {
		targetMessageSenderId = p2.senderTargetId,
		targetMessageId = p2.id,
		targetMessageSentAt = if not p2.sent then nil else p2.sent.dateTime,
		targetMessageLength = if not p2.content then nil else #p2.content
	}
end
function ReplyComposeBarContainer(t2: {[any]: any}) -- line: 83
	-- upvalues: Cryo (copy), t1 (copy), useStyle (copy), useLocalUserId (copy), useTelemetry (copy), ChatConversationTelemetryLayer (copy), FFlagAppChatSignalsReplyStore (copy), GetReplyingToStore (copy), GetChannelsMessageStore (copy), useSignalState (copy), React (copy), FFlagAppChatReplyComposeBarContainer (copy), ReplyComposeBarConstants (copy), ChatConversationTelemetryEvents (copy), useSelector (copy), populateUserWithState (copy), UserProfiles (copy), useLocalization (copy), ReplyComposeBar (copy)
	local v29 = Cryo.Dictionary.union(t1, t2)
	local v30 = useStyle()
	local v31 = useLocalUserId()
	local v32 = useTelemetry(ChatConversationTelemetryLayer.Context)

	if FFlagAppChatSignalsReplyStore then
		local v33 = GetReplyingToStore(false)
		local v34 = GetChannelsMessageStore(false)
		local v35 = useSignalState(v33.getMessageId)
		local v36 = React.useMemo(function() -- line: 94
			-- upvalues: v35 (copy), v34 (copy)
			if v35 == nil then
				return nil
			end

			return v34.messages(false)[v35]
		end, {
			v35,
			v34
		})
		local v37 = if not v36 or not v36.sender_user_id then nil else tostring(v36.sender_user_id)
		local v38 = if not v36 then nil else v36.content
		local v39 = if not FFlagAppChatReplyComposeBarContainer then v30.Tokens.Global.Size_700 + ReplyComposeBarConstants.VERTICAL_PADDING * 2 + ReplyComposeBarConstants.BORDER_HEIGHT else nil

		React.useEffect(function() -- line: 114
			-- upvalues: ChatConversationTelemetryEvents (copy), v32 (copy), v37 (copy), v35 (copy), v38 (copy), FFlagAppChatReplyComposeBarContainer (copy), v29 (copy), v39 (copy)
			if ChatConversationTelemetryEvents.ConversationInputBarReplyComposeRendered then
				local emit = v32.emit
				local ConversationInputBarReplyComposeRendered = ChatConversationTelemetryEvents.ConversationInputBarReplyComposeRendered
				local v61 = v37
				local v62 = v35
				local v63 = v38

				emit(ConversationInputBarReplyComposeRendered, {
					targetMessageSenderId = v61,
					targetMessageId = v62,
					targetMessageLength = if not v63 then nil else #v63
				})
			end

			if FFlagAppChatReplyComposeBarContainer then
				return function() -- line: 122
				end
			end

			v29.setReplyComposeBarHeight(v39)

			return function() -- line: 125
				-- upvalues: v29 (copy)
				v29.setReplyComposeBarHeight(0)
			end
		end, {})

		local v40 = useSelector(function(p3) -- line: 132
			-- upvalues: v37 (copy), populateUserWithState (copy)
			local v65 = if not p3 or (not p3.Users or not v37) then nil else p3.Users[v37]

			if v65 then
				return {
					targetUser = populateUserWithState(p3, v65)
				}
			end

			return {}
		end)
		local v41 = UserProfiles.Hooks.useUserProfilesFetch({
			userIds = if not v37 then {} else { v37 },
			query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		local v42 = if not v40.targetUser or (not v40.targetUser.displayName or v40.targetUser.displayName == "") then if not v41.data or (not v41.data.userProfiles or (not v41.data.userProfiles[1] or not v41.data.userProfiles[1].names)) then v29.unknownUserKey else UserProfiles.Selectors.getCombinedNameFromId(v41.data, v37) else v40.targetUser.displayName
		local v43 = useLocalization((if v42 ~= v29.unknownUserKey then {} else {
			replyingToUserName = v42
		})).replyingToUserName or v42
		local v44 = v31 == v37
		local v45 = if not v44 then {
			v29.replyingToOthersKey,
			DISPLAY_NAME = v43
		} else v29.replyingToYourselfKey
		local replyingToUserText = useLocalization({
			replyingToUserText = v45
		}).replyingToUserText
		local v47 = if v44 or not v40.targetUser then nil else v37
		local v48 = React.useCallback(function() -- line: 174
			-- upvalues: ChatConversationTelemetryEvents (copy), v32 (copy), v37 (copy), v35 (copy), v38 (copy), v29 (copy)
			if ChatConversationTelemetryEvents.ConversationInputBarReplyComposeCancelBtnActivated then
				local emit = v32.emit
				local ConversationInputBarReplyComposeCancelBtnActivated = ChatConversationTelemetryEvents.ConversationInputBarReplyComposeCancelBtnActivated
				local v68 = v37
				local v69 = v35
				local v70 = v38

				emit(ConversationInputBarReplyComposeCancelBtnActivated, {
					targetMessageSenderId = v68,
					targetMessageId = v69,
					targetMessageLength = if not v70 then nil else #v70
				})
			end

			v29.close()
		end, {
			v29.close,
			v32,
			v37,
			v35,
			v38
		})

		return React.createElement(ReplyComposeBar, {
			LayoutOrder = v29.LayoutOrder,
			totalHeight = if not FFlagAppChatReplyComposeBarContainer then v39 else nil,
			replyingToUserText = replyingToUserText,
			replyingToUserContent = v38,
			replyingToUserId = v47,
			onCloseActivated = v48
		})
	end

	local v49 = if not FFlagAppChatReplyComposeBarContainer then v30.Tokens.Global.Size_700 + ReplyComposeBarConstants.VERTICAL_PADDING * 2 + ReplyComposeBarConstants.BORDER_HEIGHT else nil

	React.useEffect(function() -- line: 206
		-- upvalues: ChatConversationTelemetryEvents (copy), v32 (copy), v29 (copy), FFlagAppChatReplyComposeBarContainer (copy), v49 (copy)
		if ChatConversationTelemetryEvents.ConversationInputBarReplyComposeRendered then
			v32.emit(ChatConversationTelemetryEvents.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(v29.message))
		end

		if FFlagAppChatReplyComposeBarContainer then
			return function() -- line: 215
			end
		end

		v29.setReplyComposeBarHeight(v49)

		return function() -- line: 218
			-- upvalues: v29 (copy)
			v29.setReplyComposeBarHeight(0)
		end
	end, {})

	local v50 = useSelector(function(p4) -- line: 225
		-- upvalues: v29 (copy), populateUserWithState (copy)
		local v72 = if not p4 or (not p4.Users or not v29.message.senderTargetId) then nil else p4.Users[v29.message.senderTargetId]

		if v72 then
			return {
				targetUser = populateUserWithState(p4, v72)
			}
		end

		return {}
	end)
	local v51 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = { v29.message.senderTargetId },
		query = UserProfiles.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local v52 = if not v50.targetUser or (not v50.targetUser.displayName or v50.targetUser.displayName == "") then if not v51.data or (not v51.data.userProfiles or (not v51.data.userProfiles[1] or not v51.data.userProfiles[1].names)) then v29.unknownUserKey else UserProfiles.Selectors.getCombinedNameFromId(v51.data, v29.message.senderTargetId) else v50.targetUser.displayName
	local v53 = useLocalization((if v52 ~= v29.unknownUserKey then {} else {
		replyingToUserName = v52
	})).replyingToUserName or v52
	local v54 = v31 == v29.message.senderTargetId
	local v55 = if not v54 then {
		v29.replyingToOthersKey,
		DISPLAY_NAME = v53
	} else v29.replyingToYourselfKey
	local replyingToUserText = useLocalization({
		replyingToUserText = v55
	}).replyingToUserText
	local v57 = if v54 or not v50.targetUser then nil else v29.message.senderTargetId
	local v58 = React.useCallback(function() -- line: 279
		-- upvalues: ChatConversationTelemetryEvents (copy), v32 (copy), v29 (copy)
		if ChatConversationTelemetryEvents.ConversationInputBarReplyComposeCancelBtnActivated then
			v32.emit(ChatConversationTelemetryEvents.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(v29.message))
		end

		v29.close()
	end, {
		v29.close,
		v32,
		v29.message
	})

	return React.createElement(ReplyComposeBar, {
		LayoutOrder = v29.LayoutOrder,
		totalHeight = if not FFlagAppChatReplyComposeBarContainer then v49 else nil,
		replyingToUserText = replyingToUserText,
		replyingToUserContent = v29.message.content,
		replyingToUserId = v57,
		onCloseActivated = v58
	})
end

return React.memo(ReplyComposeBarContainer)
