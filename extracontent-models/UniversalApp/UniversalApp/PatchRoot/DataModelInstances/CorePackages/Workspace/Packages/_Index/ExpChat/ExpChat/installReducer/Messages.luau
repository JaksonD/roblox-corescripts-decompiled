local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local Rodux = require(ExpChatParent.Rodux)
local llama = require(ExpChatParent.llama)
local List = llama.List
local Dictionary = llama.Dictionary
local Set = llama.Set
local None = llama.None
local isWhiteSpaceOnly = require(ExpChat.isWhiteSpaceOnly)
local sanitizeForRichText = require(ExpChat.sanitizeForRichText)
local generateRichSystemMessageTextFormat = require(ExpChat.generateRichSystemMessageTextFormat)
local Config = require(ExpChat.Config)

require(ExpChat.TextChatMessageChatActionType)

local Actions = ExpChat.Actions
local IncomingMessageReceived = require(Actions.IncomingMessageReceived)
local UniverseChatSystemMessageAdded = require(Actions.UniverseChatSystemMessageAdded)
local IncomingBubbleChatMessageReceived = require(Actions.IncomingBubbleChatMessageReceived)
local OutgoingMessageSent = require(Actions.OutgoingMessageSent)
local UserMuted = ExpChatShared.Actions.UserMuted
local UserUnmuted = ExpChatShared.Actions.UserUnmuted
local PlayerRemoved = ExpChatShared.Actions.PlayerRemoved
local ChatPrivacySettingsReceived = require(Actions.ChatPrivacySettingsReceived)
local ChatPrivacySettingsFetchFailed = require(Actions.ChatPrivacySettingsFetchFailed)
local ConfigurationObjectsLoaded = require(Actions.ConfigurationObjectsLoaded)
local BubbleChatSettingsChanged = require(Actions.BubbleChatSettingsChanged)
local ChatWindowMessagesCleared = ExpChatShared.Actions.ChatWindowMessagesCleared
local ChatTranslationGlobalToggled = require(Actions.ChatTranslationGlobalToggled)
local ChatTranslationMessageToggled = require(ExpChat.Actions.ChatTranslationMessageToggled)
local LegacyBubbleCreated = require(ExpChat.Actions.LegacyBubbleCreated)
local LegacyBubbleTextUpdated = require(ExpChat.Actions.LegacyBubbleTextUpdated)
local HiddenMessageReceived = require(ExpChat.Actions.HiddenMessageReceived)
local HiddenMessagesCleared = require(ExpChat.Actions.HiddenMessagesCleared)
local getFFlagExpChatTelemetryEventTrigger = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagExpChatEnableFOMOUpsell = require(ExpChat.Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatClearHiddenMessagesPostAgeCheck = require(ExpChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FIntExpChatRandomCharChangeLowerBound = require(ExpChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local FIntExpChatRandomCharChangeUpperBound = require(ExpChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local FFlagEnableInExpChatRewrite = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLua = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local SharedFlags = require(ExpChatParent.SharedFlags)
local FFlagExpChatUseChatConfigStore = SharedFlags.FFlagExpChatUseChatConfigStore
local FFlagChatLineReportingGlobalMuteEnabled = SharedFlags.FFlagChatLineReportingGlobalMuteEnabled
local GetChatConfigurationStore = require(ExpChat.Stores.GetChatConfigurationStore)
local computeNameColor = require(ExpChat.computeNameColor)
local getFFlagExpChatExcludeFOMORenders = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDisableUniverseBubbleChat = ExpChatShared.Flags.FFlagExpChatDisableUniverseBubbleChat
local GetFFlagExpChatSyntheticSystemMessageRichText = ExpChatShared.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local getTextAndTranslation = require(ExpChat.getTextAndTranslation)
local ChannelTabsConfigurationEnabled = require(Actions.ChannelTabsConfigurationEnabled)
local TextChatService = game:GetService("TextChatService")

function getChatTranslationEnabled() -- line: 63
	-- upvalues: TextChatService (copy)
	local ok, result = pcall(function() -- line: 64
		-- upvalues: TextChatService (copy)
		return TextChatService.ChatTranslationEnabled
	end)

	return ok and result
end

local t1 = {
	canLocalUserChat = false,
	isBubbleChatEnabled = false,
	_mutedUserIds = {},
	channelTabsConfigurationEnabled = false,
	messageLimit = 50,
	windowMessagesInOrder = {},
	windowMessagesInOrderByTabId = {},
	byMessageId = {},
	bubbleMessagesInOrderBySenderId = {},
	mockUserIdToPartOrModel = {},
	partOrModelToMockUserId = {},
	messagesBySenderId = {}
}

local function resolveChannelNameForMapOrder(t2: {[any]: any}, t3: {[any]: any}, s1: string?) -- line: 126
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), None (copy)
	if GetFFlagTextChatEnableUniverseChatTabs() then
		if s1 then
			return s1
		end

		if t3.textChannel then
			if t3.textChannel.Name == "RBXSystem" or not t2.channelTabsConfigurationEnabled then
				return "RBXGeneral"
			end

			return t3.textChannel.Name
		end

		return None
	end

	if t3.textChannel then
		if t3.textChannel.Name == "RBXSystem" then
			return "RBXGeneral"
		end

		return t3.textChannel.Name
	end

	return None
end
local function mapByMessageIdInOrderHelper(t4: {[any]: any}, t5: {[any]: any}, s2: string?) -- line: 146
	-- upvalues: isWhiteSpaceOnly (copy), resolveChannelNameForMapOrder (copy), HttpService (copy), Dictionary (copy), FFlagEnableInExpChatRewrite (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), List (copy), FFlagExpChatEnableFOMOUpsell (copy), getFFlagExpChatExcludeFOMORenders (copy)
	if isWhiteSpaceOnly(t5.text) and (t5.status ~= Enum.TextChatMessageStatus.Floodchecked and t5.status ~= Enum.TextChatMessageStatus.MessageTooLong) then
		return t4
	end

	local partOrModel = t5.partOrModel
	local userId = t5.userId
	local messageId = t5.messageId
	local v69 = resolveChannelNameForMapOrder(t4, t5, s2)
	local windowMessagesInOrder = t4.windowMessagesInOrder
	local v71 = t4.windowMessagesInOrderByTabId[v69] or {}
	local byMessageId = t4.byMessageId
	local bubbleMessagesInOrderBySenderId = t4.bubbleMessagesInOrderBySenderId
	local mockUserIdToPartOrModel = t4.mockUserIdToPartOrModel
	local partOrModelToMockUserId = t4.partOrModelToMockUserId
	local messagesBySenderId = t4.messagesBySenderId

	if not userId and partOrModel then
		userId = partOrModelToMockUserId[partOrModel]

		if not userId then
			userId = HttpService:GenerateGUID(false)
			mockUserIdToPartOrModel = Dictionary.join(mockUserIdToPartOrModel, {
				[userId] = partOrModel
			})
			partOrModelToMockUserId = Dictionary.join(partOrModelToMockUserId, {
				[partOrModel] = userId
			})
		end
	end

	local wasRewritten = nil
	local originalText = nil

	if FFlagEnableInExpChatRewrite then
		wasRewritten = t5.wasRewritten
		originalText = t5.originalText
	end

	if byMessageId[messageId] then
		local t6 = {
			userId = userId,
			prefixText = t5.prefixText,
			text = t5.text,
			translation = t5.translation,
			useTranslation = t5.useTranslation,
			textChannel = t5.textChannel,
			messageId = messageId,
			status = t5.status,
			timestamp = t5.timestamp,
			isVisibleInBubbleChat = t5.isVisibleInBubbleChat,
			isVisibleInChatWindow = t5.isVisibleInChatWindow,
			shouldOverrideBubbleChatSettings = t5.shouldOverrideBubbleChatSettings,
			bubbleChatMessageProperties = t5.bubbleChatMessageProperties,
			chatWindowMessageProperties = t5.chatWindowMessageProperties,
			textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else t5.textChatMessageInstance,
			wasRewritten = wasRewritten,
			originalText = originalText,
			chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else t5.chatActionType,
			isUniverseChat = if not FFlagChatLineReportingGlobalMuteEnabled then nil else t5.isUniverseChat
		}
		local v80 = Dictionary.join(byMessageId, {
			[messageId] = t6
		})

		if userId and messagesBySenderId[userId] then
			local v81 = List.findWhere(messagesBySenderId[userId], function(p1, _) -- line: 222
				-- upvalues: messageId (copy)
				return p1.messageId == messageId
			end)

			if v81 and v81 > 0 then
				messagesBySenderId = Dictionary.join(messagesBySenderId, {
					[userId] = List.set(messagesBySenderId[userId], v81, t6)
				})
			end
		end

		if t5.status == Enum.TextChatMessageStatus.Floodchecked or t5.status == Enum.TextChatMessageStatus.MessageTooLong then
			windowMessagesInOrder = List.removeIndex(windowMessagesInOrder, List.count(windowMessagesInOrder))
			v71 = List.removeIndex(v71, List.count(v71))
			v80 = Dictionary.removeKey(v80, t5.messageId)

			if userId then
				local v82 = List.findWhere(messagesBySenderId[userId], function(p3, _) -- line: 242
					-- upvalues: messageId (copy)
					return p3.messageId == messageId
				end)

				if v82 and v82 > 0 then
					messagesBySenderId = Dictionary.join(messagesBySenderId, {
						[userId] = List.removeIndex(messagesBySenderId[userId], v82)
					})
				end
			end
		end

		return Dictionary.join(t4, {
			windowMessagesInOrder = windowMessagesInOrder,
			windowMessagesInOrderByTabId = Dictionary.join(t4.windowMessagesInOrderByTabId, {
				[v69] = v71
			}),
			byMessageId = v80,
			messagesBySenderId = messagesBySenderId
		})
	end

	if #windowMessagesInOrder == t4.messageLimit and t5.isVisibleInChatWindow then
		local u83 = windowMessagesInOrder[1]
		local v84 = if not byMessageId[u83] then nil else byMessageId[u83].userId

		windowMessagesInOrder = List.removeIndex(windowMessagesInOrder, 1)

		if v84 then
			if messagesBySenderId ~= nil and messagesBySenderId[v84] then
				local v85 = List.findWhere(messagesBySenderId[v84], function(p5, _) -- line: 270
					-- upvalues: u83 (ref)
					return p5.messageId == u83
				end)

				if v85 and v85 > 0 then
					messagesBySenderId = Dictionary.join(messagesBySenderId, {
						[v84] = List.removeIndex(messagesBySenderId[v84], v85)
					})
				end

				if Dictionary.count(messagesBySenderId[v84]) == 0 then
					messagesBySenderId = Dictionary.removeKey(messagesBySenderId, v84)

					if mockUserIdToPartOrModel[v84] then
						local v86 = mockUserIdToPartOrModel[v84]

						if partOrModelToMockUserId[v86] then
							partOrModelToMockUserId = Dictionary.removeKey(partOrModelToMockUserId, v86)
						end

						mockUserIdToPartOrModel = Dictionary.removeKey(mockUserIdToPartOrModel, v84)
					end
				end
			elseif bubbleMessagesInOrderBySenderId ~= nil and bubbleMessagesInOrderBySenderId[v84] then
				local v87 = Dictionary.join(bubbleMessagesInOrderBySenderId, {
					[v84] = List.removeValue(bubbleMessagesInOrderBySenderId[v84], u83)
				})

				if Dictionary.count(v87[v84]) == 0 then
					Dictionary.removeKey(v87, v84)

					if mockUserIdToPartOrModel[v84] then
						local v88 = mockUserIdToPartOrModel[v84]

						if partOrModelToMockUserId[v88] then
							partOrModelToMockUserId = Dictionary.removeKey(partOrModelToMockUserId, v88)
						end

						mockUserIdToPartOrModel = Dictionary.removeKey(mockUserIdToPartOrModel, v84)
					end
				end
			end
		end

		if #v71 == t4.messageLimit then
			u83 = v71[1]
			v71 = List.removeIndex(v71, 1)
			byMessageId = Dictionary.removeKey(byMessageId, u83)
		end
	end

	if t5.isVisibleInChatWindow then
		windowMessagesInOrder = List.append(windowMessagesInOrder, messageId)
		v71 = List.append(v71, messageId)
	end

	return Dictionary.join(t4, {
		windowMessagesInOrder = windowMessagesInOrder,
		windowMessagesInOrderByTabId = Dictionary.join(t4.windowMessagesInOrderByTabId, {
			[v69] = v71
		}),
		byMessageId = Dictionary.join(byMessageId, {
			[messageId] = {
				userId = userId,
				prefixText = t5.prefixText,
				text = t5.text,
				translation = t5.translation,
				useTranslation = t5.useTranslation,
				messageId = messageId,
				status = t5.status,
				timestamp = t5.timestamp,
				isVisibleInBubbleChat = t5.isVisibleInBubbleChat,
				isVisibleInChatWindow = t5.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = t5.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = t5.bubbleChatMessageProperties,
				chatWindowMessageProperties = t5.chatWindowMessageProperties,
				textChannel = t5.textChannel,
				textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else t5.textChatMessageInstance,
				isHiddenMessage = if not FFlagExpChatEnableFOMOUpsell and not getFFlagExpChatExcludeFOMORenders() then nil else t5.isHiddenMessage,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else t5.chatActionType,
				isUniverseChat = if not FFlagChatLineReportingGlobalMuteEnabled then nil else t5.isUniverseChat
			}
		}),
		mockUserIdToPartOrModel = mockUserIdToPartOrModel,
		partOrModelToMockUserId = partOrModelToMockUserId,
		messagesBySenderId = if not userId then nil else Dictionary.join(messagesBySenderId, {
			[userId] = List.append(messagesBySenderId[userId] or {}, {
				userId = userId,
				prefixText = t5.prefixText,
				text = t5.text,
				translation = t5.translation,
				useTranslation = t5.useTranslation,
				messageId = messageId,
				status = t5.status,
				timestamp = t5.timestamp,
				isVisibleInBubbleChat = t5.isVisibleInBubbleChat,
				isVisibleInChatWindow = t5.isVisibleInChatWindow,
				partOrModel = partOrModel,
				shouldOverrideBubbleChatSettings = t5.shouldOverrideBubbleChatSettings,
				bubbleChatMessageProperties = t5.bubbleChatMessageProperties,
				chatWindowMessageProperties = t5.chatWindowMessageProperties,
				textChannel = t5.textChannel,
				textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else t5.textChatMessageInstance,
				wasRewritten = wasRewritten,
				originalText = originalText,
				chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else t5.chatActionType,
				isUniverseChat = if not FFlagChatLineReportingGlobalMuteEnabled then nil else t5.isUniverseChat
			})
		})
	})
end
local function mapByMessageIdInOrder(t7: {[any]: any}, p7) -- line: 492
	-- upvalues: FFlagEnableInExpChatRewrite (copy), getTextAndTranslation (copy), Set (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStore (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagExpChatDisableUniverseBubbleChat (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), Players (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), mapByMessageIdInOrderHelper (copy)
	local textChatMessage = p7.textChatMessage
	local v110, v111

	if FFlagEnableInExpChatRewrite then
		v110, v111 = getTextAndTranslation(textChatMessage)
	else
		v110 = textChatMessage.Text
		v111 = textChatMessage.Translation
	end

	local v112 = if not textChatMessage.TextSource then nil else tostring(textChatMessage.TextSource.UserId)
	local v113 = v112 == nil or if t7.canLocalUserChat then textChatMessage.Status == Enum.TextChatMessageStatus.Success or textChatMessage.Status == Enum.TextChatMessageStatus.Sending else false
	local v114 = not not v112 and Set.has(t7._mutedUserIds, v112)
	local v115 = v113 and not v114
	local v116 = false

	if ((if not FFlagExpChatUseChatConfigStore then t7.isBubbleChatEnabled else GetChatConfigurationStore(false).getIsBubbleChatEnabled(false))) and v115 and (not FFlagEnableInExpChatSummaryOnLua or v112 ~= nil) and (textChatMessage.Status == Enum.TextChatMessageStatus.Success or textChatMessage.Status == Enum.TextChatMessageStatus.Sending) then
		v116 = true
	end

	if FFlagExpChatDisableUniverseBubbleChat and GetFFlagTextChatEnableUniverseChatTabs() and textChatMessage.TextChannel == nil then
		v116 = false
	end

	local PrefixText = textChatMessage.PrefixText

	if GetFFlagTextChatEnableUniverseChatTabs() and p7.channelNameOverride and #PrefixText > 0 then
		PrefixText = `<font color="#{ ((if not textChatMessage.TextSource then computeNameColor(Players.LocalPlayer.Name) else computeNameColor(textChatMessage.TextSource.Username))):ToHex() }">{ PrefixText }</font>`
	end

	local t8 = {
		userId = v112,
		prefixText = PrefixText,
		text = v110,
		translation = v111,
		useTranslation = getChatTranslationEnabled(),
		textChannel = textChatMessage.TextChannel,
		messageId = textChatMessage.MessageId,
		status = textChatMessage.Status,
		timestamp = textChatMessage.Timestamp,
		isVisibleInBubbleChat = v116,
		isVisibleInChatWindow = v115,
		bubbleChatMessageProperties = textChatMessage.BubbleChatMessageProperties,
		chatWindowMessageProperties = textChatMessage.ChatWindowMessageProperties,
		textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else textChatMessage,
		wasRewritten = if not FFlagEnableInExpChatRewrite then nil else textChatMessage.WasRewritten,
		originalText = if not FFlagEnableInExpChatRewrite then nil else textChatMessage.OriginalText,
		chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else textChatMessage.ChatActionType,
		isUniverseChat = if not FFlagChatLineReportingGlobalMuteEnabled then nil else p7.isUniverseChat
	}

	return mapByMessageIdInOrderHelper(t7, t8, if not GetFFlagTextChatEnableUniverseChatTabs() then nil else p7.channelNameOverride)
end

return Rodux.createReducer(t1, {
	[ChannelTabsConfigurationEnabled.name] = function(t9: {[any]: any}, p8) -- line: 679
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), Dictionary (copy)
		if not GetFFlagTextChatEnableUniverseChatTabs() then
			return t9
		end

		return Dictionary.join(t9, {
			channelTabsConfigurationEnabled = p8.enabled
		})
	end,
	[IncomingMessageReceived.name] = mapByMessageIdInOrder,
	[IncomingBubbleChatMessageReceived.name] = function(t10: {[any]: any}, p9) --[[ mapByMessageIdInOrderBubbleChat ]] -- line: 469
		-- upvalues: mapByMessageIdInOrderHelper (copy)
		local bubbleChatMessageTable = p9.bubbleChatMessageTable
		local t11 = {
			userId = bubbleChatMessageTable.bubbleChatMessageUserId,
			prefixText = "",
			text = bubbleChatMessageTable.message,
			translation = bubbleChatMessageTable.translation,
			useTranslation = getChatTranslationEnabled(),
			messageId = bubbleChatMessageTable.bubbleChatMessageId,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = bubbleChatMessageTable.timestamp,
			partOrModel = bubbleChatMessageTable.partOrModel,
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false,
			bubbleChatMessageProperties = bubbleChatMessageTable.bubbleChatMessageProperties
		}

		return mapByMessageIdInOrderHelper(t10, t11)
	end,
	[OutgoingMessageSent.name] = mapByMessageIdInOrder,
	[UserMuted.name] = function(t12: {[any]: any}, p10) -- line: 691
		-- upvalues: Dictionary (copy), Set (copy)
		return Dictionary.join(t12, {
			_mutedUserIds = Set.add(t12._mutedUserIds, p10.userId)
		})
	end,
	[UserUnmuted.name] = function(t13: {[any]: any}, p11) -- line: 696
		-- upvalues: Dictionary (copy), Set (copy)
		return Dictionary.join(t13, {
			_mutedUserIds = Set.subtract(t13._mutedUserIds, p11.userId)
		})
	end,
	[PlayerRemoved.name] = function(t14: {[any]: any}, p12) -- line: 701
		-- upvalues: Dictionary (copy), Set (copy)
		local v147 = Dictionary.filter(t14.bubbleMessagesInOrderBySenderId, function(_, p14) -- line: 704
			-- upvalues: p12 (copy)
			return p14 ~= p12.userId
		end)
		local v148 = Dictionary.filter(t14.messagesBySenderId, function(_, p16) -- line: 708
			-- upvalues: p12 (copy)
			return p16 ~= p12.userId
		end)
		local v149 = Set.has(t14._mutedUserIds, p12.userId)

		if #v147 == 0 and (#v148 == 0 and not v149) then
			return t14
		end

		return Dictionary.join(t14, {
			messagesBySenderId = v148,
			_mutedUserIds = Set.subtract(t14._mutedUserIds, p12.userId)
		})
	end,
	[ChatPrivacySettingsReceived.name] = function(t15: {[any]: any}, p17) -- line: 721
		-- upvalues: Dictionary (copy)
		return Dictionary.join(t15, {
			canLocalUserChat = p17.canUserChat
		})
	end,
	[ChatPrivacySettingsFetchFailed.name] = function(t16: {[any]: any}, _) -- line: 724
		-- upvalues: Dictionary (copy)
		return Dictionary.join(t16, {
			canLocalUserChat = false
		})
	end,
	[ConfigurationObjectsLoaded.name] = function(p19, p20) -- line: 727
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p19, {
			isBubbleChatEnabled = not not p20.bubbleChatSettings.Enabled and p20.bubbleChatSettings.Enabled
		})
	end,
	[BubbleChatSettingsChanged.name] = function(p21, p22) -- line: 734
		-- upvalues: Dictionary (copy)
		if p22.property ~= "Enabled" then
			return p21
		end

		local v158 = Dictionary.map(p21.byMessageId, function(p23) -- line: 739
			-- upvalues: Dictionary (copy), p22 (copy)
			if p23.shouldOverrideBubbleChatSettings then
				return p23
			end

			return Dictionary.join(p23, {
				isVisibleInBubbleChat = p22.value and p23.isVisibleInChatWindow
			})
		end)

		return Dictionary.join(p21, {
			byMessageId = v158,
			isBubbleChatEnabled = p22.value
		})
	end,
	[ChatWindowMessagesCleared.name] = function(t17: {[any]: any}, _) -- line: 754
		-- upvalues: Dictionary (copy)
		local v161 = Dictionary.map(t17.byMessageId, function(p25) -- line: 755
			-- upvalues: Dictionary (copy)
			return Dictionary.join(p25, {
				isVisibleInChatWindow = false
			})
		end)

		return Dictionary.join(t17, {
			windowMessagesInOrder = {},
			windowMessagesInOrderByTabId = {},
			byMessageId = v161
		})
	end,
	[ChatTranslationGlobalToggled.name] = function(t18: {[any]: any}, p26) --[[ globalToggleTranslations ]] -- line: 389
		-- upvalues: getFFlagExpChatTelemetryEventTrigger (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy), Dictionary (copy)
		local useTranslation = p26.useTranslation
		local byMessageId = t18.byMessageId
		local t19 = {}

		for k, _ in pairs(byMessageId) do
			local v96 = byMessageId[k]

			if v96 ~= nil then
				t19[k] = {
					prefixText = v96.prefixText,
					text = v96.text,
					translation = v96.translation,
					useTranslation = useTranslation,
					messageId = v96.messageId,
					status = v96.status,
					timestamp = v96.timestamp,
					isVisibleInBubbleChat = v96.isVisibleInBubbleChat,
					isVisibleInChatWindow = v96.isVisibleInChatWindow,
					partOrModel = v96.partOrModel,
					shouldOverrideBubbleChatSettings = v96.shouldOverrideBubbleChatSettings,
					bubbleChatMessageProperties = v96.bubbleChatMessageProperties,
					chatWindowMessageProperties = v96.chatWindowMessageProperties,
					userId = v96.userId,
					textChannel = v96.textChannel,
					textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else v96.textChatMessageInstance,
					wasRewritten = if not FFlagEnableInExpChatRewrite then nil else v96.wasRewritten,
					originalText = if not FFlagEnableInExpChatRewrite then nil else v96.originalText,
					chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else v96.chatActionType
				}
			end
		end

		return Dictionary.join(t18, {
			byMessageId = Dictionary.join(byMessageId, t19)
		})
	end,
	[ChatTranslationMessageToggled.name] = function(t20: {[any]: any}, p27) --[[ individualToggleTranslation ]] -- line: 429
		-- upvalues: Dictionary (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy)
		local useTranslation = p27.useTranslation
		local messageId = p27.messageId
		local byMessageId = t20.byMessageId
		local v102 = byMessageId[messageId]

		if v102 ~= nil then
			return Dictionary.join(t20, {
				byMessageId = Dictionary.join(byMessageId, {
					[messageId] = {
						prefixText = v102.prefixText,
						text = v102.text,
						translation = v102.translation,
						useTranslation = useTranslation,
						messageId = v102.messageId,
						status = v102.status,
						timestamp = v102.timestamp,
						isVisibleInBubbleChat = v102.isVisibleInBubbleChat,
						isVisibleInChatWindow = v102.isVisibleInChatWindow,
						partOrModel = v102.partOrModel,
						shouldOverrideBubbleChatSettings = v102.shouldOverrideBubbleChatSettings,
						bubbleChatMessageProperties = v102.bubbleChatMessageProperties,
						chatWindowMessageProperties = v102.chatWindowMessageProperties,
						userId = v102.userId,
						textChannel = v102.textChannel,
						textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else v102.textChatMessageInstance,
						wasRewritten = if not FFlagEnableInExpChatRewrite then nil else v102.wasRewritten,
						originalText = if not FFlagEnableInExpChatRewrite then nil else v102.originalText,
						chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else v102.chatActionType
					}
				})
			})
		end

		return nil
	end,
	[LegacyBubbleCreated.name] = function(t21: {[any]: any}, p28) --[[ mapByMessageIdInOrderLegacyBubbleChat ]] -- line: 592
		-- upvalues: mapByMessageIdInOrderHelper (copy)
		local messageData = p28.messageData
		local v122 = if not messageData.timestamp then DateTime.now() else DateTime.fromUnixTimestampMillis(messageData.timestamp)
		local t22 = {
			userId = messageData.userId,
			prefixText = "",
			text = messageData.text,
			messageId = messageData.id,
			status = Enum.TextChatMessageStatus.Success,
			timestamp = v122,
			partOrModel = messageData.adornee,
			shouldOverrideBubbleChatSettings = true,
			isVisibleInBubbleChat = true,
			isVisibleInChatWindow = false
		}

		return mapByMessageIdInOrderHelper(t21, t22)
	end,
	[LegacyBubbleTextUpdated.name] = function(t23: {[any]: any}, p29) -- line: 769
		-- upvalues: Dictionary (copy), List (copy)
		local byMessageId = t23.byMessageId
		local messagesBySenderId = t23.messagesBySenderId
		local messageId = p29.messageId
		local newText = p29.newText

		if byMessageId[messageId] then
			local v168 = byMessageId[messageId]

			v168.text = newText
			byMessageId = Dictionary.join(byMessageId, {
				[messageId] = v168
			})

			local userId = v168.userId

			if userId and messagesBySenderId[userId] then
				local v170 = List.findWhere(messagesBySenderId[userId], function(p30, _) -- line: 783
					-- upvalues: messageId (copy)
					return p30.messageId == messageId
				end)

				if v170 and v170 > 0 then
					messagesBySenderId = Dictionary.join(messagesBySenderId, {
						[userId] = List.set(messagesBySenderId[userId], v170, v168)
					})
				end
			end
		end

		return Dictionary.join(t23, {
			byMessageId = byMessageId,
			messagesBySenderId = messagesBySenderId
		})
	end,
	[HiddenMessageReceived.name] = function(t24: {[any]: any}, p32) --[[ mapByMessageIdInOrderHiddenMessage ]] -- line: 616
		-- upvalues: FIntExpChatRandomCharChangeLowerBound (copy), FIntExpChatRandomCharChangeUpperBound (copy), Config (copy), getFFlagExpChatTelemetryEventTrigger (copy), mapByMessageIdInOrderHelper (copy)
		local userMessageIntent = p32.userMessageIntent
		local v127 = string.len(userMessageIntent.Text)
		local v128 = math.max(FIntExpChatRandomCharChangeLowerBound, -(v127 - 1))
		local v129 = FIntExpChatRandomCharChangeUpperBound
		local v130 = math.random(v128, v129)
		local v131 = string.rep(Config.DOT_TEXT, v127 + v130)
		local t25 = {
			userId = nil,
			prefixText = Config.LOCK_EMOJI .. " :",
			text = v131,
			textChannel = userMessageIntent.TextChannel,
			messageId = userMessageIntent.MessageId,
			status = userMessageIntent.Status,
			timestamp = userMessageIntent.Timestamp,
			isVisibleInBubbleChat = false,
			isVisibleInChatWindow = true,
			textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else userMessageIntent,
			isHiddenMessage = true
		}

		return mapByMessageIdInOrderHelper(t24, t25)
	end,
	[UniverseChatSystemMessageAdded.name] = function(t26: {[any]: any}, p33) --[[ mapUniverseChatSystemMessage ]] -- line: 646
		-- upvalues: HttpService (copy), sanitizeForRichText (copy), GetFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormat (copy), mapByMessageIdInOrderHelper (copy), GetFFlagTextChatEnableUniverseChatTabs (copy)
		local guid = HttpService:GenerateGUID(false)
		local v136 = sanitizeForRichText(p33.text)
		local v137 = if not GetFFlagExpChatSyntheticSystemMessageRichText() then v136 else generateRichSystemMessageTextFormat(v136, false)
		local t27 = {
			userId = nil,
			prefixText = "",
			text = v137,
			translation = nil,
			useTranslation = false,
			messageId = guid,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			status = Enum.TextChatMessageStatus.Success,
			isVisibleInChatWindow = true,
			isVisibleInBubbleChat = false,
			textChannel = nil,
			bubbleChatMessageProperties = nil,
			chatWindowMessageProperties = nil,
			textChatMessageInstance = nil,
			partOrModel = nil,
			metadata = p33.metadata
		}

		return mapByMessageIdInOrderHelper(t26, t27, if not GetFFlagTextChatEnableUniverseChatTabs() then nil else p33.channelNameOverride)
	end,
	[HiddenMessagesCleared.name] = function(t28: {[any]: any}, _) -- line: 801
		-- upvalues: FFlagExpChatClearHiddenMessagesPostAgeCheck (copy), Dictionary (copy), List (copy)
		if not FFlagExpChatClearHiddenMessagesPostAgeCheck then
			return t28
		end

		local v173 = Dictionary.map(t28.byMessageId, function(p35) -- line: 806
			-- upvalues: Dictionary (copy)
			if p35.isHiddenMessage then
				return Dictionary.join(p35, {
					isVisibleInChatWindow = false
				})
			end

			return p35
		end)
		local v174 = List.filter(t28.windowMessagesInOrder, function(p36) -- line: 816
			-- upvalues: v173 (copy)
			local v192 = v173[p36]

			return v192 and not v192.isHiddenMessage
		end)
		local v175 = Dictionary.map(t28.windowMessagesInOrderByTabId, function(p37) -- line: 823
			-- upvalues: List (copy), v173 (copy)
			return List.filter(p37, function(p38) -- line: 824
				-- upvalues: v173 (copy)
				local v195 = v173[p38]

				return v195 and not v195.isHiddenMessage
			end)
		end)

		return Dictionary.join(t28, {
			windowMessagesInOrder = v174,
			windowMessagesInOrderByTabId = v175,
			byMessageId = v173
		})
	end
})
