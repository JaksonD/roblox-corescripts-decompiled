local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Signals = require(ExpChatParent.Signals)
local SharedFlags = require(ExpChatParent.SharedFlags)
local isWhiteSpaceOnly = require(ExpChat.isWhiteSpaceOnly)
local GetChatConfigurationStore = require(ExpChat.Stores.GetChatConfigurationStore)
local computeNameColor = require(ExpChat.computeNameColor)

require(ExpChat.TextChatMessageChatActionType)

local ExpChatShared = require(ExpChat.Parent.ExpChatShared)
local getTextAndTranslation = require(ExpChat.getTextAndTranslation)
local Config = require(ExpChat.Config)
local sanitizeForRichText = require(ExpChat.sanitizeForRichText)
local generateRichSystemMessageTextFormat = require(ExpChat.generateRichSystemMessageTextFormat)
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local llama = require(ExpChatParent.llama)
local List = llama.List
local Dictionary = llama.Dictionary
local Set = llama.Set
local createSignal = Signals.createSignal
local createComputed = Signals.createComputed
local FFlagExpChatUseChatConfigStore = SharedFlags.FFlagExpChatUseChatConfigStore
local FFlagEnableInExpChatRewrite = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLua = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local FIntExpChatRandomCharChangeLowerBound = require(ExpChat.Flags.FIntExpChatRandomCharChangeLowerBound)
local FIntExpChatRandomCharChangeUpperBound = require(ExpChat.Flags.FIntExpChatRandomCharChangeUpperBound)
local getFFlagExpChatTelemetryEventTrigger = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagExpChatClearHiddenMessagesPostAgeCheck = require(ExpChat.Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FFlagExpChatClientRenderedEventFix = require(ExpChat.Flags.FFlagExpChatClientRenderedEventFix)
local FFlagExpChatEnableV2ChatWindow = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDisableUniverseBubbleChat = ExpChatShared.Flags.FFlagExpChatDisableUniverseBubbleChat
local GetFFlagExpChatSyntheticSystemMessageRichText = ExpChatShared.Flags.GetFFlagExpChatSyntheticSystemMessageRichText
local FFlagExpChatSupportHiddenMessagesInWindowV2 = require(ExpChat.Flags.FFlagExpChatSupportHiddenMessagesInWindowV2)
local FFlagChatLineReportingGlobalMuteEnabled = SharedFlags.FFlagChatLineReportingGlobalMuteEnabled

function getChatTranslationEnabled() -- line: 45
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatTranslationEnabled
end

return function() --[[ createMessagesStore ]] -- line: 157
	-- upvalues: createSignal (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), Dictionary (copy), List (copy), HttpService (copy), createComputed (copy), Set (copy), sanitizeForRichText (copy), GetFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormat (copy), FFlagExpChatEnableV2ChatWindow (copy), computeNameColor (copy), Players (copy), FFlagEnableInExpChatRewrite (copy), getTextAndTranslation (copy), isWhiteSpaceOnly (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStore (copy), ExpChatShared (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagExpChatDisableUniverseBubbleChat (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), FIntExpChatRandomCharChangeLowerBound (copy), FIntExpChatRandomCharChangeUpperBound (copy), Config (copy), FFlagExpChatSupportHiddenMessagesInWindowV2 (copy), FFlagExpChatClearHiddenMessagesPostAgeCheck (copy)
	local t1 = {
		canLocalUserChat = false,
		isBubbleChatEnabled = false,
		mutedUserIds = {},
		messageLimit = 50,
		windowMessagesInOrder = {},
		windowMessagesInOrderByTabId = {},
		byMessageId = {},
		mockUserIdToPartOrModel = {},
		partOrModelToMockUserId = {},
		messagesBySenderId = {},
		messageComponentRingBuffer = {},
		nextMessageComponentPointer = 1
	}
	local v37, v38 = createSignal(t1.byMessageId)
	local v39, v40 = createSignal(t1.messagesBySenderId)
	local v41, v42 = createSignal(t1.windowMessagesInOrder)
	local v43, v44 = createSignal(t1.windowMessagesInOrderByTabId)
	local v45, v46 = createSignal(t1.mutedUserIds)
	local v47, v48 = createSignal(t1.canLocalUserChat)
	local v49, _ = createSignal(t1.isBubbleChatEnabled)
	local v51, v52 = createSignal(t1.mockUserIdToPartOrModel)
	local v53, v54 = createSignal(t1.partOrModelToMockUserId)
	local v55, v56 = createSignal(false)
	local v57, v58 = createSignal(t1.messageComponentRingBuffer)
	local v59, v60 = createSignal(t1.nextMessageComponentPointer)
	local t2 = {}
	local n1 = 0
	local t3 = {}
	local v64, v65 = createSignal(nil)
	local updateNextMessageComponent = nil

	local function resolveChannelNameForMapOrder(t4: {[any]: any}, s1: string?) -- line: 209
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), v55 (copy)
		if GetFFlagTextChatEnableUniverseChatTabs() then
			if s1 then
				return s1
			end

			if t4.textChannel then
				if t4.textChannel.Name == "RBXSystem" or not v55(false) then
					return "RBXGeneral"
				end

				return t4.textChannel.Name
			end

			return nil
		end

		if t4.textChannel then
			if t4.textChannel.Name == "RBXSystem" then
				return "RBXGeneral"
			end

			return t4.textChannel.Name
		end

		return nil
	end
	local function addMessage(t5: {[any]: any}) -- line: 229
		-- upvalues: v37 (copy), v38 (copy), Dictionary (copy), v40 (copy), List (copy), v53 (copy), HttpService (copy), v52 (copy), v54 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), v55 (copy), v41 (copy), v43 (copy), t1 (copy), v51 (copy), v42 (copy), v44 (copy)
		local v76 = v37(false)

		if v76 and v76[t5.messageId] then
			v38(function(p1) -- line: 234
				-- upvalues: Dictionary (copy), t5 (copy)
				return Dictionary.join(p1, {
					[t5.messageId] = t5
				})
			end)

			if t5.userId then
				v40(function(p2) -- line: 240
					-- upvalues: t5 (copy), List (copy), Dictionary (copy)
					local v188 = p2[t5.userId] or {}
					local v189 = nil

					for i, v in ipairs(v188) do
						if v.messageId == t5.messageId then
							v189 = i

							break
						end
					end

					if v189 then
						local v192 = List.set(v188, v189, t5)

						return Dictionary.join(p2, {
							[t5.userId] = v192
						})
					end

					return p2
				end)
			end

			return
		end

		local userId = t5.userId
		local partOrModel = t5.partOrModel

		if not userId and partOrModel then
			userId = v53(false)[partOrModel]

			if not userId then
				userId = HttpService:GenerateGUID(false)
				v52(function(p3) -- line: 276
					-- upvalues: Dictionary (copy), userId (ref), partOrModel (copy)
					return Dictionary.join(p3, {
						[userId] = partOrModel
					})
				end)
				v54(function(p4) -- line: 283
					-- upvalues: Dictionary (copy), partOrModel (copy), userId (ref)
					return Dictionary.join(p4, {
						[partOrModel] = userId
					})
				end)
			end
		end

		local v79 = if t5.userId == userId then t5 else Dictionary.join(t5, {
			userId = userId
		})
		local channelNameOverride = nil

		if GetFFlagTextChatEnableUniverseChatTabs() and v79.channelNameOverride then
			channelNameOverride = v79.channelNameOverride
		elseif v79.textChannel then
			channelNameOverride = if v79.textChannel.Name ~= "RBXSystem" and (not GetFFlagTextChatEnableUniverseChatTabs() or v55(false)) then v79.textChannel.Name else "RBXGeneral"
		end

		if v79.isVisibleInChatWindow then
			local v81 = v41(false)
			local v82 = if not channelNameOverride then {} else v43(false)[channelNameOverride] or {}

			if #v81 >= t1.messageLimit then
				local v83 = v81[1]
				local v84 = v76 and v76[v83]

				if v84 then
					v38(function(p5) -- line: 324
						-- upvalues: Dictionary (copy), v83 (copy)
						return Dictionary.removeKey(p5, v83)
					end)

					if v84.userId then
						v40(function(p6) -- line: 330
							-- upvalues: v84 (copy), List (copy), v83 (copy), v51 (copy), v54 (copy), Dictionary (copy), v52 (copy)
							local v197 = p6[v84.userId]

							if v197 then
								local v198 = List.filter(v197, function(p7) -- line: 333
									-- upvalues: v83 (copy)
									return p7.messageId ~= v83
								end)

								if #v198 == 0 then
									local v199 = v51(false)

									if v199[v84.userId] then
										local v200 = v199[v84.userId]

										v54(function(p8) -- line: 343
											-- upvalues: Dictionary (copy), v200 (copy)
											return Dictionary.removeKey(p8, v200)
										end)
										v52(function(p9) -- line: 347
											-- upvalues: Dictionary (copy), v84 (copy)
											return Dictionary.removeKey(p9, v84.userId)
										end)
									end

									return Dictionary.removeKey(p6, v84.userId)
								end

								return Dictionary.join(p6, {
									[v84.userId] = v198
								})
							end

							return p6
						end)
					end

					v42(function(p10) -- line: 364
						-- upvalues: List (copy)
						return List.removeIndex(p10, 1)
					end)
				end
			end

			if channelNameOverride and #v82 >= t1.messageLimit then
				local v85 = v82[1]

				if v85 then
					v44(function(p11) -- line: 374
						-- upvalues: channelNameOverride (ref), List (copy), Dictionary (copy)
						local v203 = p11[channelNameOverride] or {}
						local v204 = List.removeIndex(v203, 1)

						return Dictionary.join(p11, {
							[channelNameOverride] = v204
						})
					end)

					if v76 and v76[v85] then
						v38(function(p12) -- line: 383
							-- upvalues: Dictionary (copy), v85 (copy)
							return Dictionary.removeKey(p12, v85)
						end)
					end
				end
			end
		end

		v38(function(p13) -- line: 391
			-- upvalues: Dictionary (copy), v79 (copy)
			return Dictionary.join(p13, {
				[v79.messageId] = v79
			})
		end)

		if v79.userId then
			v40(function(p14) -- line: 396
				-- upvalues: v79 (copy), List (copy), Dictionary (copy)
				local v208 = p14[v79.userId] or {}
				local v209 = false

				for _, v in ipairs(v208) do
					if v.messageId == v79.messageId then
						v209 = true

						break
					end
				end

				if not v209 then
					local v212 = List.append(v208, v79)

					return Dictionary.join(p14, {
						[v79.userId] = v212
					})
				end

				return p14
			end)
		end

		if v79.isVisibleInChatWindow then
			v42(function(p15) -- line: 421
				-- upvalues: List (copy), v79 (copy)
				return List.append(p15, v79.messageId)
			end)

			if channelNameOverride then
				v44(function(p16) -- line: 427
					-- upvalues: channelNameOverride (ref), List (copy), v79 (copy), Dictionary (copy)
					local v215 = p16[channelNameOverride] or {}
					local v216 = List.append(v215, v79.messageId)

					return Dictionary.join(p16, {
						[channelNameOverride] = v216
					})
				end)
			end
		end
	end

	local t6 = {}
	local t7 = {}

	local function getUserMessageCache(s2: string) -- line: 461
		-- upvalues: t7 (copy), createComputed (copy), v39 (copy), v45 (copy), Set (copy)
		local str = tostring(s2)

		if not t7[str] then
			t7[str] = {}
			t7[str].messages = createComputed(function(p17) -- line: 465
				-- upvalues: v39 (copy), str (copy)
				return v39(p17)[str] or {}
			end)
			t7[str].bubbleMessages = createComputed(function(p18) -- line: 469
				-- upvalues: t7 (copy), str (copy), v45 (copy), Set (copy)
				local v221 = t7[str].messages(p18)
				local v222 = v45(p18)
				local t8 = {}

				for _, v in ipairs(v221) do
					local v226 = not not v.userId and (Set.has(v222, v.userId) or false)

					if v.isVisibleInBubbleChat and not v226 then
						table.insert(t8, v)
					end
				end

				return t8
			end)
			t7[str].lastMessage = createComputed(function(p19) -- line: 481
				-- upvalues: t7 (copy), str (copy)
				local v228 = t7[str].messages(p19)

				if #v228 > 0 then
					return v228[#v228]
				end

				return nil
			end)
		end

		return t7[str]
	end
	local function formatPrefixForUniverseChatTabs(s3: string, s4: string?, p20) -- line: 554
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), computeNameColor (copy), Players (copy)
		if not GetFFlagTextChatEnableUniverseChatTabs() or (not s4 or #s3 == 0) then
			return s3
		end

		return `<font color="#{ ((if not p20.TextSource then computeNameColor(not Players.LocalPlayer and "" or Players.LocalPlayer.Name) else computeNameColor(p20.TextSource.Username))):ToHex() }">{ s3 }</font>`
	end

	function updateNextMessageComponent(s5: string) -- line: 1159
		-- upvalues: v57 (copy), v59 (copy), v60 (copy), t2 (copy), FFlagEnableInExpChatRewrite (copy), n1 (ref), t3 (copy)
		local v167 = v57(false)

		if #v167 == 0 then
			return
		end

		local v168 = v59(false)
		local v169 = v167[v168]

		if not v169 then
			v60(1)

			return
		end

		local v170 = t2[v169]

		if v170 then
			v170.setter(s5)
		end

		local v171 = not FFlagEnableInExpChatRewrite and 1 or 10

		n1 += v171

		local v172 = t3[v169]

		if v172 then
			v172.setter(n1)
		end

		local v173 = v168 % #v167 + 1

		v60(v173)
	end

	return {
		getByMessageId = v37,
		getMessages = createComputed(function(p21) -- line: 508
			-- upvalues: v37 (copy)
			local v182 = v37(p21)
			local t9 = {}

			for _, v in pairs(v182 or {}) do
				table.insert(t9, v)
			end

			return t9
		end),
		getMessagesBySenderId = v39,
		getWindowMessagesInOrder = v41,
		getWindowMessagesInOrderByTabId = v43,
		getMutedUserIds = v45,
		getCanLocalUserChat = v47,
		getIsBubbleChatEnabled = v49,
		getMockUserIdToPartOrModel = v51,
		getPartOrModelToMockUserId = v53,
		getMessage = function(s6: string) --[[ getMessage ]] -- line: 448
			-- upvalues: t6 (copy), createComputed (copy), v37 (copy)
			if not t6[s6] then
				t6[s6] = createComputed(function(p22) -- line: 450
					-- upvalues: v37 (copy), s6 (copy)
					local v218 = v37(p22)

					if not v218 or not v218[s6] then
						return nil
					end

					return v218[s6]
				end)
			end

			return t6[s6]
		end,
		getUserMessages = function(s7: string) --[[ getUserMessages ]] -- line: 492
			-- upvalues: getUserMessageCache (copy)
			return getUserMessageCache(s7).messages
		end,
		getUserBubbleMessages = function(s8: string) --[[ getUserBubbleMessages ]] -- line: 497
			-- upvalues: getUserMessageCache (copy)
			return getUserMessageCache(s8).bubbleMessages
		end,
		getUserLastMessage = function(s9: string) --[[ getUserLastMessage ]] -- line: 502
			-- upvalues: getUserMessageCache (copy)
			return getUserMessageCache(s9).lastMessage
		end,
		registerMessageComponent = function(s10: string) --[[ registerMessageComponent ]] -- line: 1076
			-- upvalues: t2 (copy), createSignal (copy), t3 (copy), v58 (copy), List (copy)
			if not t2[s10] then
				local v151, v152 = createSignal(nil)

				t2[s10] = {
					getter = v151,
					setter = v152
				}

				local v153, v154 = createSignal(0)

				t3[s10] = {
					getter = v153,
					setter = v154
				}
				v58(function(p23) -- line: 1091
					-- upvalues: List (copy), s10 (copy)
					return List.append(p23, s10)
				end)
			end

			return t2[s10].getter
		end,
		unregisterMessageComponent = function(s11: string) --[[ unregisterMessageComponent ]] -- line: 1100
			-- upvalues: v57 (copy), t2 (copy), t3 (copy), v58 (copy), List (copy), v59 (copy), v60 (copy)
			local v156 = v57(false)
			local v157 = nil

			for i, v in ipairs(v156) do
				if v == s11 then
					v157 = i

					break
				end
			end

			if t2[s11] then
				t2[s11] = nil
			end

			if t3[s11] then
				t3[s11] = nil
			end

			if v157 then
				v58(function(p24) -- line: 1123
					-- upvalues: List (copy), s11 (copy)
					return List.filter(p24, function(p25) -- line: 1124
						-- upvalues: s11 (copy)
						return p25 ~= s11
					end)
				end)

				local v160 = v57(false)
				local v161 = v59(false)

				if #v160 == 0 then
					v60(1)

					return
				end

				if v157 < v161 then
					v60(v161 - 1)

					return
				end

				if v161 > #v160 then
					v60(1)
				end
			end
		end,
		repopulateMessageComponents = function() --[[ repopulateMessageComponents ]] -- line: 1196
			-- upvalues: v64 (copy), v43 (copy), v41 (copy), v60 (copy), n1 (ref), updateNextMessageComponent (ref), v57 (copy), v59 (copy), t2 (copy)
			local v174 = v64(false)
			local v175 = if not v174 then v41(false) else v43(false)[v174] or {}

			v60(1)
			n1 = 0

			for _, v in ipairs(v175) do
				updateNextMessageComponent(v)
			end

			local v178 = v57(false)

			if #v175 < #v178 then
				for i = v59(false), #v178 do
					local v180 = t2[v178[i]]

					if v180 then
						v180.setter(nil)
					end
				end
			end
		end,
		getMessageComponentSignal = function(s12: string) --[[ getMessageComponentSignal ]] -- line: 1147
			-- upvalues: t2 (copy)
			local v163 = t2[s12]

			if v163 then
				return v163.getter
			end

			return nil
		end,
		getLayoutOrderSignal = function(s13: string) --[[ getLayoutOrderSignal ]] -- line: 1153
			-- upvalues: t3 (copy)
			local v165 = t3[s13]

			if v165 then
				return v165.getter
			end

			return nil
		end,
		updateNextMessageComponent = updateNextMessageComponent,
		getMessageComponentRingBuffer = v57,
		getNextMessageComponentPointer = v59,
		setActiveChannelFilter = v65,
		getActiveChannelFilter = v64,
		setCanLocalUserChat = v48,
		muteUser = function(s14: string) --[[ muteUser ]] -- line: 825
			-- upvalues: v46 (copy), Set (copy)
			v46(function(p26) -- line: 826
				-- upvalues: Set (copy), s14 (copy)
				if not p26 then
					return {}
				end

				return (Set.add(p26, s14))
			end)
		end,
		unmuteUser = function(s15: string) --[[ unmuteUser ]] -- line: 835
			-- upvalues: v46 (copy), Set (copy)
			v46(function(p27) -- line: 836
				-- upvalues: Set (copy), s15 (copy)
				if not p27 then
					return {}
				end

				return (Set.subtract(p27, s15))
			end)
		end,
		handlePlayerRemoved = function(s16: string) --[[ handlePlayerRemoved ]] -- line: 791
			-- upvalues: v40 (copy), Dictionary (copy), v46 (copy), Set (copy), v39 (copy), v51 (copy), v54 (copy), v52 (copy)
			v40(function(p28) -- line: 793
				-- upvalues: Dictionary (copy), s16 (copy)
				return Dictionary.removeKey(p28, s16)
			end)
			v46(function(p29) -- line: 797
				-- upvalues: Set (copy), s16 (copy), v39 (copy), v51 (copy), v54 (copy), Dictionary (copy), v52 (copy)
				if not p29 then
					return {}
				end

				local v236 = Set.has(p29, s16)

				if #(v39(false)[s16] or {}) == 0 and not v236 then
					return p29
				end

				local v237 = v51(false)

				if v237[s16] then
					local v238 = v237[s16]

					v54(function(p30) -- line: 812
						-- upvalues: Dictionary (copy), v238 (copy)
						return Dictionary.removeKey(p30, v238)
					end)
					v52(function(p31) -- line: 816
						-- upvalues: Dictionary (copy), s16 (copy)
						return Dictionary.removeKey(p31, s16)
					end)
				end

				return Set.subtract(p29, s16)
			end)
		end,
		clearWindowMessages = function() --[[ clearWindowMessages ]] -- line: 845
			-- upvalues: v38 (copy), Dictionary (copy), v42 (copy), v44 (copy), FFlagExpChatEnableV2ChatWindow (copy), v60 (copy), n1 (ref), v57 (copy), t2 (copy)
			v38(function(p32) -- line: 846
				-- upvalues: Dictionary (copy)
				if not p32 then
					return {}
				end

				return (Dictionary.map(p32, function(p33) -- line: 851
					-- upvalues: Dictionary (copy)
					return Dictionary.join(p33, {
						isVisibleInChatWindow = false
					})
				end))
			end)
			v42(function(_) -- line: 861
				return {}
			end)
			v44(function(_) -- line: 866
				return {}
			end)

			if FFlagExpChatEnableV2ChatWindow then
				v60(1)
				n1 = 0

				local v137 = v57(false)

				for _, v in ipairs(v137) do
					local v140 = t2[v]

					if v140 then
						v140.setter(nil)
					end
				end
			end
		end,
		toggleGlobalTranslation = function(b1: boolean) --[[ toggleGlobalTranslation ]] -- line: 924
			-- upvalues: v38 (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy)
			v38(function(p36) -- line: 925
				-- upvalues: b1 (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy)
				if not p36 then
					return {}
				end

				local t10 = {}

				for k, _ in pairs(p36) do
					local v251 = p36[k]

					if v251 ~= nil then
						t10[k] = {
							prefixText = v251.prefixText,
							text = v251.text,
							translation = v251.translation,
							useTranslation = b1,
							messageId = v251.messageId,
							status = v251.status,
							timestamp = v251.timestamp,
							isVisibleInBubbleChat = v251.isVisibleInBubbleChat,
							isVisibleInChatWindow = v251.isVisibleInChatWindow,
							partOrModel = v251.partOrModel,
							shouldOverrideBubbleChatSettings = v251.shouldOverrideBubbleChatSettings,
							bubbleChatMessageProperties = v251.bubbleChatMessageProperties,
							chatWindowMessageProperties = v251.chatWindowMessageProperties,
							textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() or not FFlagExpChatClientRenderedEventFix then nil else v251.textChatMessageInstance,
							userId = v251.userId,
							textChannel = v251.textChannel,
							wasRewritten = if not FFlagEnableInExpChatRewrite then nil else v251.wasRewritten,
							originalText = if not FFlagEnableInExpChatRewrite then nil else v251.originalText,
							chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else v251.chatActionType
						}
					end
				end

				return t10
			end)
		end,
		toggleMessageTranslation = function(b2: boolean, s17: string) --[[ toggleMessageTranslation ]] -- line: 970
			-- upvalues: v38 (copy), Dictionary (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy)
			v38(function(p37) -- line: 971
				-- upvalues: s17 (copy), Dictionary (copy), b2 (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLua (copy)
				if not p37 then
					return {}
				end

				local v253 = p37[s17]

				if v253 ~= nil then
					return Dictionary.join(p37, {
						[s17] = {
							prefixText = v253.prefixText,
							text = v253.text,
							translation = v253.translation,
							useTranslation = b2,
							messageId = v253.messageId,
							status = v253.status,
							timestamp = v253.timestamp,
							isVisibleInBubbleChat = v253.isVisibleInBubbleChat,
							isVisibleInChatWindow = v253.isVisibleInChatWindow,
							partOrModel = v253.partOrModel,
							shouldOverrideBubbleChatSettings = v253.shouldOverrideBubbleChatSettings,
							bubbleChatMessageProperties = v253.bubbleChatMessageProperties,
							chatWindowMessageProperties = v253.chatWindowMessageProperties,
							textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() or not FFlagExpChatClientRenderedEventFix then nil else v253.textChatMessageInstance,
							userId = v253.userId,
							textChannel = v253.textChannel,
							wasRewritten = if not FFlagEnableInExpChatRewrite then nil else v253.wasRewritten,
							originalText = if not FFlagEnableInExpChatRewrite then nil else v253.originalText,
							chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else v253.chatActionType
						}
					})
				end

				return p37
			end)
		end,
		handleIncomingOrOutgoingMessage = function(p38, _: boolean, s18: string?, b4: boolean?) --[[ handleIncomingOrOutgoingMessage ]] -- line: 571
			-- upvalues: FFlagEnableInExpChatRewrite (copy), getTextAndTranslation (copy), isWhiteSpaceOnly (copy), v37 (copy), v47 (copy), v45 (copy), Set (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStore (copy), ExpChatShared (copy), v49 (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagExpChatDisableUniverseBubbleChat (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), v55 (copy), formatPrefixForUniverseChatTabs (copy), getFFlagExpChatTelemetryEventTrigger (copy), FFlagExpChatClientRenderedEventFix (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), addMessage (copy), FFlagExpChatEnableV2ChatWindow (copy), v64 (copy), updateNextMessageComponent (ref)
			local v107, v108

			if FFlagEnableInExpChatRewrite then
				v107, v108 = getTextAndTranslation(p38)
			else
				v107 = p38.Text
				v108 = p38.Translation
			end

			if isWhiteSpaceOnly(v107) and p38.Status ~= Enum.TextChatMessageStatus.Floodchecked and p38.Status ~= Enum.TextChatMessageStatus.MessageTooLong then
				return
			end

			local v109 = if not p38.TextSource then nil else tostring(p38.TextSource.UserId)

			if not v37(false) then
				return
			end

			local v110 = v47(false)
			local v111 = v109 == nil or if v110 then p38.Status == Enum.TextChatMessageStatus.Success or p38.Status == Enum.TextChatMessageStatus.Sending else false
			local v112 = not not v109 and (not not v45(false) and Set.has(v45(false), v109))
			local v113 = v111 and not v112
			local v114 = false
			local v115

			if FFlagExpChatUseChatConfigStore then
				v115 = GetChatConfigurationStore(false).getIsBubbleChatEnabled(false)
			else
				local v116 = ExpChatShared.context and ExpChatShared.context.store

				v115 = if not v116 then v49(false) else v116:getState().Messages.isBubbleChatEnabled
			end

			if v115 and v113 and (not FFlagEnableInExpChatSummaryOnLua or v109 ~= nil) and (p38.Status == Enum.TextChatMessageStatus.Success or p38.Status == Enum.TextChatMessageStatus.Sending) then
				v114 = true
			end

			if FFlagExpChatDisableUniverseBubbleChat and GetFFlagTextChatEnableUniverseChatTabs() and p38.TextChannel == nil then
				v114 = false
			end

			if p38.Status ~= Enum.TextChatMessageStatus.Success and p38.Status ~= Enum.TextChatMessageStatus.Sending then
				v113 = false
				v114 = false
			end

			local v117 = nil

			if GetFFlagTextChatEnableUniverseChatTabs() and s18 then
				v117 = s18
			elseif p38.TextChannel then
				v117 = if p38.TextChannel.Name ~= "RBXSystem" and (not GetFFlagTextChatEnableUniverseChatTabs() or v55(false)) then p38.TextChannel.Name else "RBXGeneral"
			end

			local v118 = formatPrefixForUniverseChatTabs(p38.PrefixText, s18, p38)
			local t11 = {
				userId = v109,
				prefixText = v118,
				text = v107,
				translation = v108,
				useTranslation = getChatTranslationEnabled() and v108 ~= nil,
				messageId = p38.MessageId,
				status = p38.Status,
				timestamp = p38.Timestamp,
				shouldOverrideBubbleChatSettings = false,
				isVisibleInBubbleChat = v114,
				isVisibleInChatWindow = v113,
				textChannel = p38.TextChannel,
				bubbleChatMessageProperties = p38.BubbleChatMessageProperties,
				chatWindowMessageProperties = p38.ChatWindowMessageProperties,
				textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() or not FFlagExpChatClientRenderedEventFix then nil else p38,
				partOrModel = p38.TextSource and p38.TextSource.Parent or nil,
				wasRewritten = if not FFlagEnableInExpChatRewrite then nil else p38.WasRewritten,
				originalText = if not FFlagEnableInExpChatRewrite then nil else p38.OriginalText,
				channelNameOverride = GetFFlagTextChatEnableUniverseChatTabs() and s18 or nil,
				chatActionType = if not FFlagEnableInExpChatSummaryOnLua then nil else p38.ChatActionType,
				isUniverseChat = if not FFlagChatLineReportingGlobalMuteEnabled then nil else b4
			}
			local v120 = v37(false)
			local v121 = v120 and v120[t11.messageId] ~= nil

			if t11.isVisibleInChatWindow or t11.isVisibleInBubbleChat or v121 then
				addMessage(t11)

				if FFlagExpChatEnableV2ChatWindow and t11.isVisibleInChatWindow and not v121 then
					local v122 = v64(false)

					if v122 == nil or v117 == v122 then
						updateNextMessageComponent(t11.messageId)
					end
				end
			end
		end,
		handleIncomingBubbleChatMessage = function(t12: {[any]: any}) --[[ handleIncomingBubbleChatMessage ]] -- line: 730
			-- upvalues: addMessage (copy)
			local t13 = {
				userId = t12.bubbleChatMessageUserId,
				prefixText = "",
				text = t12.message,
				translation = t12.translation,
				useTranslation = getChatTranslationEnabled(),
				textChannel = nil,
				messageId = t12.bubbleChatMessageId,
				status = Enum.TextChatMessageStatus.Success,
				timestamp = t12.timestamp,
				partOrModel = t12.partOrModel,
				shouldOverrideBubbleChatSettings = true,
				isVisibleInBubbleChat = true,
				isVisibleInChatWindow = false,
				bubbleChatMessageProperties = t12.bubbleChatMessageProperties,
				chatWindowMessageProperties = nil
			}

			addMessage(t13)
		end,
		handleLegacyBubbleCreated = function(t14: {[any]: any}) --[[ handleLegacyBubbleCreated ]] -- line: 1013
			-- upvalues: addMessage (copy)
			local timestamp = t14.timestamp
			local v146 = if not timestamp then DateTime.now() else DateTime.fromUnixTimestampMillis(timestamp)
			local t15 = {
				userId = t14.userId,
				prefixText = "",
				text = t14.text,
				messageId = t14.id,
				status = Enum.TextChatMessageStatus.Success,
				timestamp = v146,
				partOrModel = t14.adornee,
				shouldOverrideBubbleChatSettings = true,
				isVisibleInBubbleChat = true,
				isVisibleInChatWindow = false,
				translation = nil,
				useTranslation = false,
				textChannel = nil,
				bubbleChatMessageProperties = nil,
				chatWindowMessageProperties = nil
			}

			addMessage(t15)
		end,
		handleLegacyBubbleTextUpdated = function(s19: string, s20: string) --[[ handleLegacyBubbleTextUpdated ]] -- line: 1050
			-- upvalues: v38 (copy), Dictionary (copy)
			v38(function(p39) -- line: 1051
				-- upvalues: s19 (copy), Dictionary (copy), s20 (copy)
				if not p39 then
					return {}
				end

				if p39[s19] then
					local v255 = p39[s19]
					local v256 = Dictionary.join(v255, {
						text = s20
					})

					return Dictionary.join(p39, {
						[s19] = v256
					})
				end

				return p39
			end)
		end,
		handleHiddenMessageReceived = function(p40) --[[ handleHiddenMessageReceived ]] -- line: 753
			-- upvalues: FIntExpChatRandomCharChangeLowerBound (copy), FIntExpChatRandomCharChangeUpperBound (copy), Config (copy), getFFlagExpChatTelemetryEventTrigger (copy), addMessage (copy), FFlagExpChatEnableV2ChatWindow (copy), FFlagExpChatSupportHiddenMessagesInWindowV2 (copy), resolveChannelNameForMapOrder (copy), v64 (copy), updateNextMessageComponent (ref)
			local v126 = string.len(p40.Text)
			local v127 = math.max(FIntExpChatRandomCharChangeLowerBound, -(v126 - 1))
			local v128 = FIntExpChatRandomCharChangeUpperBound
			local v129 = math.random(v127, v128)
			local v130 = string.rep(Config.DOT_TEXT, v126 + v129)
			local t16 = {
				userId = nil,
				prefixText = Config.LOCK_EMOJI .. " :",
				text = v130,
				textChannel = p40.TextChannel,
				messageId = p40.MessageId,
				status = p40.Status,
				timestamp = p40.Timestamp,
				isVisibleInBubbleChat = false,
				isVisibleInChatWindow = true,
				textChatMessageInstance = if not getFFlagExpChatTelemetryEventTrigger() then nil else p40,
				isHiddenMessage = true
			}

			addMessage(t16)

			if FFlagExpChatEnableV2ChatWindow and FFlagExpChatSupportHiddenMessagesInWindowV2 then
				local v132 = resolveChannelNameForMapOrder(t16)
				local v133 = v64(false)

				if v133 == nil or v132 == v133 then
					updateNextMessageComponent(t16.messageId)
				end
			end
		end,
		handleHiddenMessagesCleared = function() --[[ handleHiddenMessagesCleared ]] -- line: 886
			-- upvalues: FFlagExpChatClearHiddenMessagesPostAgeCheck (copy), v38 (copy), Dictionary (copy), v42 (copy), List (copy), v37 (copy), v44 (copy)
			if not FFlagExpChatClearHiddenMessagesPostAgeCheck then
				return
			end

			v38(function(p41) -- line: 893
				-- upvalues: Dictionary (copy)
				return Dictionary.map(p41, function(p42) -- line: 894
					-- upvalues: Dictionary (copy)
					if p42.isHiddenMessage then
						return Dictionary.join(p42, {
							isVisibleInChatWindow = false
						})
					end

					return p42
				end)
			end)
			v42(function(p43) -- line: 906
				-- upvalues: List (copy), v37 (copy)
				return List.filter(p43, function(p44) -- line: 907
					-- upvalues: v37 (copy)
					local v267 = v37(false)[p44]

					return v267 and not v267.isHiddenMessage
				end)
			end)
			v44(function(p45) -- line: 914
				-- upvalues: Dictionary (copy), List (copy), v37 (copy)
				return Dictionary.map(p45, function(p46) -- line: 915
					-- upvalues: List (copy), v37 (copy)
					return List.filter(p46, function(p47) -- line: 916
						-- upvalues: v37 (copy)
						local v271 = v37(false)[p47]

						return v271 and not v271.isHiddenMessage
					end)
				end)
			end)
		end,
		addSystemMessage = function(s21: string, s22: string, s23: string?) --[[ addSystemMessage ]] -- line: 518
			-- upvalues: sanitizeForRichText (copy), GetFFlagExpChatSyntheticSystemMessageRichText (copy), generateRichSystemMessageTextFormat (copy), HttpService (copy), addMessage (copy), FFlagExpChatEnableV2ChatWindow (copy), v64 (copy), updateNextMessageComponent (ref)
			local v95 = sanitizeForRichText(s21)
			local v96 = if not GetFFlagExpChatSyntheticSystemMessageRichText() then v95 else generateRichSystemMessageTextFormat(v95, false)
			local guid = HttpService:GenerateGUID(false)
			local t17 = {
				userId = nil,
				prefixText = "",
				text = v96,
				translation = nil,
				useTranslation = false,
				messageId = guid,
				timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
				status = Enum.TextChatMessageStatus.Success,
				isVisibleInChatWindow = true,
				isVisibleInBubbleChat = false,
				shouldOverrideBubbleChatSettings = false,
				textChannel = nil,
				bubbleChatMessageProperties = nil,
				chatWindowMessageProperties = nil,
				textChatMessageInstance = nil,
				partOrModel = nil,
				channelNameOverride = s22,
				metadata = s23
			}

			addMessage(t17)

			if FFlagExpChatEnableV2ChatWindow then
				local v99 = v64(false)

				if v99 == nil or s22 == v99 then
					updateNextMessageComponent(guid)
				end
			end
		end,
		setChannelTabsConfigurationEnabled = v56
	}
end
