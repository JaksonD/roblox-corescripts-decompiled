local Players = game:GetService("Players")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local DateTime = require(AppChatParent.Time).DateTime
local GenerateStringId = require(AppChatParent.AppCommonLib).GenerateStringId
local SharedFlags = require(AppChatParent.SharedFlags)
local Logger = require(script.Parent.Logger)
local getFFlagAppChatEnableRepliesUI = require(AppChat.Flags.getFFlagAppChatEnableRepliesUI)
local GetFFlagEnableSocialCards = SharedFlags.GetFFlagEnableSocialCards
local FFlagAppChatEnableAutotranslation = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local t1 = {
	new = function(p1) --[[ new ]] -- line: 20
		return {
			universeId = tostring(p1)
		}
	end
}
local t2 = {
	SenderTypes = {
		User = "user",
		System = "system",
		UnknownType = "unknown_type"
	},
	MessageTypes = {
		PlainText = "PlainText",
		Link = "Link",
		System = "System"
	},
	LinkTypes = {
		Game = "Game"
	},
	ModerationTypes = {
		TrustedComms = "trusted_comms",
		Moderated = "moderated",
		Invalid = "invalid",
		UnknownType = "unknown_type"
	},
	VisibilityTypes = {
		Visible = "visible",
		Hidden = "hidden",
		Invalid = "invalid"
	}
}

function t2.new(p2) -- line: 53
	-- upvalues: t2 (copy)
	t2.__index = t2

	local v15 = p2 or {}

	setmetatable(v15, t2)

	return v15
end
function t2.fromWeb(p3, p4, p5) -- line: 63
	-- upvalues: t2 (copy), DateTime (copy)
	if not t2.DoRequiredFieldsPresent(p3) then
		return nil
	end

	local v19 = t2.new()

	v19.id = p3.id
	v19.senderTargetId = tostring(p3.senderTargetId)
	v19.senderType = p3.senderType
	v19.read = p3.read
	v19.sent = DateTime.fromIsoDate(p3.sent)
	v19.conversationId = tostring(p4)
	v19.previousMessageId = p5
	v19.filteredForReceivers = false
	v19:parseContentWeb(p3)

	return v19
end
function t2.fromSentWeb(p6, p7) -- line: 83
	-- upvalues: t2 (copy), Players (copy), DateTime (copy)
	if not t2.DoRequiredFieldsPresentForSent(p6) then
		return nil
	end

	local v22 = t2.new()

	v22.id = p6.messageId
	v22.senderTargetId = tostring(Players.LocalPlayer.UserId)
	v22.senderType = "User"
	v22.read = true
	v22.sent = DateTime.fromIsoDate(p6.sent)
	v22.conversationId = tostring(p7)
	v22.previousMessageId = ""
	v22.filteredForReceivers = p6.filteredForReceivers
	v22:parseContentSentWeb(p6)

	return v22
end
function t2.newSendingId() -- line: 104
	-- upvalues: GenerateStringId (copy)
	return "sending-message-" .. GenerateStringId()
end
function t2.newSending(p8) -- line: 108
	-- upvalues: t2 (copy), Players (copy)
	assert(p8, "props argument is missing")
	assert(p8.id, "props.id argument is missing")
	assert(p8.messageType, "props.messageType argument is missing")
	assert(p8.order, "props.order argument is missing")
	assert(p8.conversationId, "props.conversationId argument is missing")
	assert(p8.sent, "props.sent argument is missing")

	local v24 = t2.new(p8)

	v24.senderTargetId = tostring(Players.LocalPlayer.UserId)
	v24.senderType = t2.SenderTypes.User
	v24.moderated = false
	v24.failed = false
	v24.stableKey = v24.id

	return v24
end
function t2.DoRequiredFieldsPresent(p9) -- line: 128
	return p9 and (p9.id and (p9.messageType and (p9.senderTargetId and p9.sent)))
end
function t2.DoRequiredFieldsPresentForSent(p10) -- line: 131
	return p10 and (p10.messageId and (p10.messageType and p10.sent))
end
function t2.parseContentWeb(p11, p12) -- line: 135
	-- upvalues: t2 (copy), t1 (copy)
	p11:parseContent(p12)

	if p12.messageType == t2.MessageTypes.Link and (p12.link and p12.link.type == t2.LinkTypes.Game and p12.link.game) then
		p11.gameLink = t1.new(p12.link.game.universeId)
	end
end
function t2.parseContentSentWeb(p13, p14) -- line: 144
	-- upvalues: t2 (copy), t1 (copy)
	p13:parseContent(p14)

	if p14.messageType == t2.MessageTypes.Link and p14.chatMessageLinkType == t2.LinkTypes.Game then
		p13.gameLink = t1.new(p14.universeId)
	end
end
function t2.parseContent(p15, p16) -- line: 153
	-- upvalues: t2 (copy)
	p15.messageType = p16.messageType

	if p16.messageType == t2.MessageTypes.PlainText then
		p15.content = p16.content

		return
	end

	p15.content = nil
end
function t2.fromChannelsApi(p17, p18, p19, _) -- line: 166
	-- upvalues: t2 (copy), DateTime (copy), GetFFlagEnableSocialCards (copy), FFlagAppChatEnableAutotranslation (copy)
	if not t2.DoRequiredFieldsPresentFromChannelsApi(p17) then
		return nil
	end

	local v37 = t2.new()

	v37.id = p17.id
	v37.read = true
	v37.sent = DateTime.fromIsoDate(p17.created_at)
	v37.conversationId = tostring(p18)
	v37.previousMessageId = p19
	v37.filteredForReceivers = false
	v37.content = p17.content
	v37.previewContent = p17.preview_content

	if p17.type == t2.SenderTypes.User then
		v37:serializeForUserMessage(p17)
	elseif p17.type == t2.SenderTypes.System then
		v37:serializeForSystemMessage(p17)
	end

	v37.cards = if not GetFFlagEnableSocialCards() then nil else p17.cards

	if GetFFlagEnableSocialCards() then
		v37.senderTargetId = tostring(p17.sender_user_id)
	end

	v37.stableKey = v37.id
	v37.isBadgeable = p17.is_badgeable
	v37.isPreviewable = p17.is_previewable

	if FFlagAppChatEnableAutotranslation then
		v37.contentToDisplay = p17.content_to_display
	end

	return v37
end
function t2.serializeForUserMessage(p21, p22) -- line: 203
	-- upvalues: t2 (copy), getFFlagAppChatEnableRepliesUI (copy), Logger (copy)
	p21.senderTargetId = tostring(p22.sender_user_id)
	p21.senderType = t2.SenderTypes.User
	p21.moderationType = p22.moderation_type

	if getFFlagAppChatEnableRepliesUI() then
		p21.repliesTo = t2.fromChannelsApi(p22.replies_to, nil, nil, true)
	end

	if p22.visibility and (p22.visibility == t2.VisibilityTypes.Visible or p22.visibility == t2.VisibilityTypes.Hidden) then
		p21.visibility = p22.visibility
	else
		p21.visibility = t2.VisibilityTypes.Invalid
		Logger:debug("Message visibility type is invalid for message id: " .. p21.id)
	end

	p21.messageType = t2.MessageTypes.PlainText
end
function t2.serializeForSystemMessage(p23, _) -- line: 223
	-- upvalues: t2 (copy)
	p23.senderType = t2.SenderTypes.System
	p23.messageType = t2.MessageTypes.System
end
function t2.DoRequiredFieldsPresentFromChannelsApi(p25) -- line: 229
	-- upvalues: t2 (copy)
	if not p25 then
		return false
	end

	if p25.type == t2.SenderTypes.User then
		return p25.id and (p25.sender_user_id and p25.created_at)
	end

	if p25.type == t2.SenderTypes.System then
		return p25.id and p25.created_at
	end

	return false
end
function t2.parseContentFromChannelsApi(p26, p27) -- line: 243
	-- upvalues: t2 (copy)
	p26.messageType = t2.MessageTypes.PlainText
	p26.content = p27.content
end
function t2.fromSentChannelsApi(p28, p29, p30) -- line: 249
	-- upvalues: t2 (copy), DateTime (copy), getFFlagAppChatEnableRepliesUI (copy), Logger (copy)
	if not t2.DoRequiredFieldsPresentForSentFromChannelsApi(p28) then
		return nil
	end

	local v48 = t2.new()

	v48.id = p28.messages[1].id
	v48.senderTargetId = tostring(p28.messages[1].sender_user_id)
	v48.senderType = t2.SenderTypes.User
	v48.read = true
	v48.sent = DateTime.fromIsoDate(p28.messages[1].created_at)
	v48.conversationId = tostring(p29)
	v48.previousMessageId = ""
	v48.moderationType = p28.messages[1].moderation_type
	v48.stableKey = p30 or v48.id
	v48.isBadgeable = p28.messages[1].is_badgeable
	v48.isPreviewable = p28.messages[1].is_previewable
	v48.filteredForReceivers = false
	v48.messageType = t2.MessageTypes.PlainText
	v48.content = p28.messages[1].content

	if getFFlagAppChatEnableRepliesUI() then
		v48.repliesTo = t2.fromChannelsApi(p28.messages[1].replies_to, nil, nil, true)
	end

	if p28.visibility and (p28.visibility == t2.VisibilityTypes.Visible or p28.visibility == t2.VisibilityTypes.Hidden) then
		v48.visibility = p28.visibility

		return v48
	end

	v48.visibility = t2.VisibilityTypes.Visible
	Logger:debug("Message visibility type is invalid for message id: " .. v48.id)

	return v48
end
function t2.DoRequiredFieldsPresentForSentFromChannelsApi(p31) -- line: 290
	return p31 and (p31.messages and (#p31.messages > 0 and (p31.messages[1].id and p31.messages[1].created_at)))
end

return t2
