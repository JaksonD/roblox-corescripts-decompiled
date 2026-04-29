local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local React = require(ExpChatParent.React)
local Signals = require(ExpChatParent.Signals)
local SignalsReact = require(ExpChatParent.SignalsReact)
local DataHydration = require(ExpChatParent.DataHydration)
local UserProfiles = require(ExpChatParent.UserProfiles)
local VerifiedBadgeDisplayStore = UserProfiles.Stores.VerifiedBadgeDisplayStore
local SharedFlags = require(ExpChatParent.SharedFlags)
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local FFlagEnableVerifiedBadgeStore = SharedFlags.FFlagEnableVerifiedBadgeStore
local FFlagExpChatUseChannelTabsStore = SharedFlags.FFlagExpChatUseChannelTabsStore
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local useStore = require(ExpChatParent.RoactUtils).Hooks.RoactRodux.useStore
local UserProfileStore = UserProfiles.Stores.UserProfileStore
local TranslatedTextMessageV2 = require(ExpChat.ChatWindow.UI.TranslatedTextMessageV2)
local shouldSendHighFrequencyTelemetry = require(ExpChat.shouldSendHighFrequencyTelemetry)
local Helpers = ExpChat.ChatWindow.Helpers
local getMessageSettings = require(Helpers.getMessageSettings)
local getMessageText = require(Helpers.getMessageText)
local Flags = ExpChat.Flags
local getFFlagExpChatUseUpdatedMessageRendered = require(Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v25 = require(Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORenders = require(Flags.getFFlagExpChatExcludeFOMORenders)
local FFlagExpChatEnableFOMOUpsell = require(Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatEnableCrossAgeChatActivity = require(Flags.FFlagExpChatEnableCrossAgeChatActivity)
local FFlagExpChatDynamicV2Pool = require(Flags.FFlagExpChatDynamicV2Pool)
local FFlagExpChatKeepV2PoolMounted = require(Flags.FFlagExpChatKeepV2PoolMounted)
local FFlagExpChatFixRateLimitedMessageRemoval = require(ExpChat.Flags.FFlagExpChatFixRateLimitedMessageRemoval)
local FFlagExpChatAddWindowSettingDependency = require(Flags.FFlagExpChatAddWindowSettingDependency)
local FFlagEnableInExpChatRewrite = require(Flags.FFlagEnableInExpChatRewrite)
local FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 = require(Flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local FIntExpChatVisibleARButtonPadding = require(Flags.FIntExpChatVisibleARButtonPadding)
local FIntExpChatDefaultARButtonPadding = require(Flags.FIntExpChatDefaultARButtonPadding)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabled = require(Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local TextChatMessageChatActionType = require(ExpChat.TextChatMessageChatActionType)
local RewriteDropdown = require(ExpChat.ChatWindow.UI.TranslatedTextMessageV2.RewriteDropdown)
local GetRewriteDropdownStore = require(ExpChat.Stores.GetRewriteDropdownStore)
local GetChatStatusStore = require(ExpChat.Stores.GetChatStatusStore)
local GetChannelTabsStore = require(ExpChat.Stores.GetChannelTabsStore)
local isChatRegionLocked = require(ExpChat.isChatRegionLocked)
local showChatEnabledUI = require(ExpChat.showChatEnabledUI)
local v45 = DataHydration.TrustedConnections.TrustedConnectionsStore.get()
local v46 = game:DefineFastInt("ExpChatSlotBatchSize", 10)

local function createSlot(t1: {[any]: any}) -- line: 62
	-- upvalues: React (copy), TextChatMessageChatActionType (copy)
	local v50, v51 = React.createBinding("")
	local v52, v53 = React.createBinding("")
	local v54, v55 = React.createBinding(false)
	local v56, v57 = React.createBinding(0)
	local v58, v59 = React.createBinding(false)
	local v60, v61 = React.createBinding(t1)
	local v62, v63 = React.createBinding(t1)
	local v64, v65 = React.createBinding(false)
	local v66, v67 = React.createBinding(false)
	local v68, v69 = React.createBinding(false)
	local v70, v71 = React.createBinding(false)
	local v72 = React.createRef()
	local v73, v74 = React.createBinding(TextChatMessageChatActionType.Unknown)

	v72.current = {}

	return {
		bodyText = v50,
		setBodyText = v51,
		prefixText = v52,
		setPrefixText = v53,
		shouldShowTranslation = v54,
		setShowTranslation = v55,
		layoutOrder = v56,
		setLayoutOrder = v57,
		visible = v58,
		setVisible = v59,
		bodyTextProperties = v60,
		setBodyTextProperties = v61,
		prefixTextProperties = v62,
		setPrefixTextProperties = v63,
		message = v72,
		isUserVerified = v64,
		setIsUserVerified = v65,
		isTrustedConnection = v66,
		setIsTrustedConnection = v67,
		wasRewritten = v68,
		setWasRewritten = v69,
		isRewriteWindowOpen = v70,
		setIsRewriteWindowOpen = v71,
		chatActionType = v73,
		setChatActionType = v74
	}
end
local function resolvePrefixText(t2: {[any]: any}, p1) -- line: 107
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), UserProfileStore (copy)
	local v77 = t2.prefixText or ""
	local userId = t2.userId

	if GetFFlagTextChatEnableUniverseChatTabs() and t2.isUniverseChat then
		return v77
	end

	if not userId or tostring(userId) == "0" then
		return v77
	end

	local str = tostring(userId)
	local v80 = UserProfileStore.get().fetchNamesByUserIds({ str })(p1)
	local v81 = v80.data and v80.data[1]

	if not v81 or not v81.names then
		return v77
	end

	local v82 = v81.names.getDisplayName(p1)
	local v83 = v81.names.getInExperienceCombinedName(p1)

	if string.len(v82) > 0 and string.len(v83) > 0 and v82 ~= v83 then
		v77 = string.gsub(v77, v82, v83)
	end

	return v77
end

return function(t3: {[any]: any}) --[[ useV2MessagePool ]] -- line: 169
	-- upvalues: FFlagExpChatKeepV2PoolMounted (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), FFlagExpChatUseChannelTabsStore (copy), useStore (copy), GetChatStatusStore (copy), SignalsReact (copy), isChatRegionLocked (copy), showChatEnabledUI (copy), FIntExpChatVisibleARButtonPadding (copy), FIntExpChatDefaultARButtonPadding (copy), FFlagExpChatDynamicV2Pool (copy), v46 (copy), React (copy), createSlot (copy), Signals (copy), FFlagEnableInExpChatRewrite (copy), GetRewriteDropdownStore (copy), getMessageSettings (copy), getMessageText (copy), resolvePrefixText (copy), FFlagExpChatFixRateLimitedMessageRemoval (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), TextChatMessageChatActionType (copy), FFlagEnableVerifiedBadgeStore (copy), VerifiedBadgeDisplayStore (copy), getFFlagExpChatUseUpdatedMessageRendered (copy), shouldSendHighFrequencyTelemetry (copy), v25 (copy), getFFlagExpChatExcludeFOMORenders (copy), GetChannelTabsStore (copy), TextChatService (copy), FFlagExpChatEnableFOMOUpsell (copy), FFlagExpChatEnableCrossAgeChatActivity (copy), Players (copy), v45 (copy), FFlagExpChatAddWindowSettingDependency (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), TranslatedTextMessageV2 (copy), RewriteDropdown (copy)
	local messagesStore = t3.messagesStore
	local enabled = t3.enabled
	local chatWindowSettings = t3.chatWindowSettings
	local v88 = if not FFlagExpChatKeepV2PoolMounted then enabled else enabled and t3.visible ~= false
	local v89 = if not EngineFeatureExpChatGlobalChatEngineTelemetryEnabled or FFlagExpChatUseChannelTabsStore then nil else useStore()
	local v90 = GetChatStatusStore(false)
	local v91 = SignalsReact.useSignalBinding(v90.getChatStatus):map(function(p2) -- line: 182
		-- upvalues: isChatRegionLocked (copy), showChatEnabledUI (copy), FIntExpChatVisibleARButtonPadding (copy), FIntExpChatDefaultARButtonPadding (copy)
		local v107 = not isChatRegionLocked() and showChatEnabledUI(p2)

		return UDim.new(0, if not v107 then FIntExpChatDefaultARButtonPadding else FIntExpChatVisibleARButtonPadding)
	end)
	local n1 = 50

	if FFlagExpChatDynamicV2Pool and enabled then
		n1 = math.min(math.ceil(#(if not t3.isChannelBarVisible or not t3.targetTextChannel then messagesStore.getWindowMessagesInOrder(false) or {} else messagesStore.getWindowMessagesInOrderByTabId(false)[t3.targetTextChannel.Name] or {}) / v46) * v46, 50)
	end

	local v93, v94 = React.useState(n1)
	local v95 = not FFlagExpChatDynamicV2Pool and 50 or v93
	local v96 = React.useRef(nil)

	if enabled and not v96.current then
		local t4 = {}

		for i = 1, v95 do
			t4[i] = createSlot(chatWindowSettings)
		end

		v96.current = t4
	end

	if FFlagExpChatDynamicV2Pool and enabled and v96.current then
		for i = #v96.current + 1, v95 do
			v96.current[i] = createSlot(chatWindowSettings)
		end
	end

	local v100 = React.useRef({})
	local v101 = React.useRef(0)
	local v102 = React.useRef(v95)

	v102.current = v95

	local function createSlotEffects(p3, s1: string, p4, t5: {[any]: any}, b1: boolean) -- line: 231
		-- upvalues: Signals (copy), FFlagEnableInExpChatRewrite (copy), GetRewriteDropdownStore (copy), getMessageSettings (copy), getMessageText (copy), resolvePrefixText (copy), FFlagExpChatFixRateLimitedMessageRemoval (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), TextChatMessageChatActionType (copy), FFlagEnableVerifiedBadgeStore (copy), VerifiedBadgeDisplayStore (copy), getFFlagExpChatUseUpdatedMessageRendered (copy), shouldSendHighFrequencyTelemetry (copy), v25 (copy), getFFlagExpChatExcludeFOMORenders (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStore (copy), v89 (copy), TextChatService (copy), FFlagExpChatEnableFOMOUpsell (copy), FFlagExpChatEnableCrossAgeChatActivity (copy), Players (copy), v45 (copy)
		local v113 = p4.registerMessageComponent(s1)
		local v114 = p4.getLayoutOrderSignal(s1)
		local v115 = Signals.createEffect(function(p5) -- line: 241
			-- upvalues: v113 (copy), FFlagEnableInExpChatRewrite (copy), GetRewriteDropdownStore (copy), p4 (copy), getMessageSettings (copy), t5 (copy), b1 (copy), getMessageText (copy), p3 (copy), resolvePrefixText (copy), FFlagExpChatFixRateLimitedMessageRemoval (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), TextChatMessageChatActionType (copy), s1 (copy), FFlagEnableVerifiedBadgeStore (copy), VerifiedBadgeDisplayStore (copy)
			local v132 = v113(p5)
			local v133 = nil
			local v134 = nil

			if FFlagEnableInExpChatRewrite then
				v134 = GetRewriteDropdownStore(false)
				v133 = v134.getOpenMessageId(p5)
			end

			if v132 then
				local v135 = p4.getMessage(v132)(p5)

				if v135 then
					local v136 = getMessageSettings(v135, t5)
					local v137 = b1 and (v136.translation ~= nil and v136.translation ~= "")
					local useTranslation = v136.useTranslation
					local v139 = getMessageText(useTranslation, v136.translation, v136.text)
					local bodyTextProperties = v136.bodyTextProperties
					local prefixTextProperties = v136.prefixTextProperties

					p3.setBodyText(v139)
					p3.setPrefixText((resolvePrefixText(v135, p5)))
					p3.setShowTranslation(v137)
					p3.setVisible(not FFlagExpChatFixRateLimitedMessageRemoval or v135.isVisibleInChatWindow and not v135.isHiddenMessage)
					p3.setBodyTextProperties(bodyTextProperties)
					p3.setPrefixTextProperties(prefixTextProperties)
					p3.message.current = v135

					if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 then
						p3.setChatActionType(v135.chatActionType or TextChatMessageChatActionType.Unknown)
					end

					if FFlagEnableInExpChatRewrite then
						p3.setWasRewritten(v136.wasRewritten or false)

						if v133 == v132 then
							v134.setComponentId(s1)
							p3.setIsRewriteWindowOpen(true)
						else
							p3.setIsRewriteWindowOpen(false)
						end
					end

					if FFlagEnableVerifiedBadgeStore then
						local num = tonumber(v135.userId)

						if num then
							local v143 = VerifiedBadgeDisplayStore.get()

							p3.setIsUserVerified(v143.isBadgeVisible(num))

							return
						end

						p3.setIsUserVerified(false)

						return
					end

					p3.setIsUserVerified(false)

					return
				end
			else
				p3.setVisible(false)
				p3.setIsUserVerified(false)

				if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 then
					p3.setChatActionType(TextChatMessageChatActionType.Unknown)
				end
			end
		end)
		local v116 = if not v114 then nil else Signals.createEffect(function(p6) -- line: 310
			-- upvalues: v114 (copy), p3 (copy)
			local v145 = v114(p6)

			p3.setLayoutOrder(v145)
		end)
		local v117 = if not getFFlagExpChatUseUpdatedMessageRendered() then nil else Signals.createEffect(function(p7) -- line: 317
			-- upvalues: v113 (copy), p4 (copy), shouldSendHighFrequencyTelemetry (copy), v25 (copy), getFFlagExpChatExcludeFOMORenders (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStore (copy), v89 (copy), TextChatService (copy)
			local v147 = v113(p7)

			if v147 then
				local v148 = p4.getMessage(v147)(false)

				if v148 and v148.textChatMessageInstance and shouldSendHighFrequencyTelemetry(v25) and (not getFFlagExpChatExcludeFOMORenders() or not v148.isHiddenMessage) then
					if EngineFeatureExpChatGlobalChatEngineTelemetryEnabled then
						local n2 = -1

						if FFlagExpChatUseChannelTabsStore then
							local v150 = GetChannelTabsStore(false)
							local v151 = v150.getChannelTabsState(false)
							local v152 = v150.getSelectedTabName(false)

							if v152 and v151.allChannelTabs[v152] then
								n2 = v151.allChannelTabs[v152].tabIndex
							end
						else
							local ChannelTabs = v89:getState().ChannelTabs
							local v154 = ChannelTabs and ChannelTabs.selectedTabName

							if v154 and ChannelTabs.allChannelTabs[v154] then
								n2 = ChannelTabs.allChannelTabs[v154].TabIndex
							end
						end

						TextChatService:SendExpChatMessageClientRendered(v148.textChatMessageInstance, "chat_window", n2)

						return
					end

					TextChatService:SendExpChatMessageClientRendered(v148.textChatMessageInstance, "chat_window")
				end
			end
		end)
		local v118 = Signals.createEffect(function(p8) -- line: 361
			-- upvalues: v113 (copy), p4 (copy), FFlagExpChatEnableFOMOUpsell (copy), FFlagExpChatEnableCrossAgeChatActivity (copy), Players (copy), v45 (copy), p3 (copy)
			local v156 = v113(p8)

			if v156 then
				local v157 = p4.getMessage(v156)(false)

				if v157 then
					local userId = v157.userId
					local v159 = if not FFlagExpChatEnableFOMOUpsell and not FFlagExpChatEnableCrossAgeChatActivity then nil else v157.isHiddenMessage
					local v160 = userId and userId ~= ""
					local v161 = Players.LocalPlayer and (Players.LocalPlayer.UserId and tostring(Players.LocalPlayer.UserId))
					local v162 = v161 and v161 == userId
					local v163 = not not (v160 and (not v162 and not v159)) and v45.getIsTrustedConnection(userId).data(p8)

					p3.setIsTrustedConnection(v163)
				end
			end
		end)

		return {
			cleanupMsg = v115,
			cleanupLayout = v116,
			cleanupTelemetry = v117,
			cleanupTc = v118,
			componentId = s1
		}
	end

	local t6 = {}

	if FFlagExpChatAddWindowSettingDependency then
		table.insert(t6, chatWindowSettings)
	end

	if FFlagExpChatKeepV2PoolMounted then
		table.insert(t6, v88)
	end

	React.useEffect(function() -- line: 409
		-- upvalues: v88 (copy), v95 (copy), createSlotEffects (copy), v96 (copy), messagesStore (copy), chatWindowSettings (copy), t3 (copy), v100 (copy), v101 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), FFlagEnableInExpChatRewrite (copy), GetRewriteDropdownStore (copy)
		if not v88 then
			return
		end

		for i = 1, v95 do
			local v120 = createSlotEffects(v96.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, t3.showTranslationButton)

			table.insert(v100.current, v120)
		end

		v101.current = v95

		local selectedChannelName

		if GetFFlagTextChatEnableUniverseChatTabs() then
			selectedChannelName = t3.selectedChannelName

			if t3.targetTextChannel then
				selectedChannelName = t3.targetTextChannel.Name
			end
		else
			selectedChannelName = if not t3.isChannelBarVisible or not t3.targetTextChannel then nil else t3.targetTextChannel.Name
		end

		messagesStore.setActiveChannelFilter(selectedChannelName)
		messagesStore.repopulateMessageComponents()

		return function() -- line: 443
			-- upvalues: v100 (copy), messagesStore (copy), v101 (copy), FFlagEnableInExpChatRewrite (copy), GetRewriteDropdownStore (copy)
			for _, v in ipairs(v100.current) do
				if v.cleanupMsg then
					pcall(v.cleanupMsg)
				end

				if v.cleanupLayout then
					pcall(v.cleanupLayout)
				end

				if v.cleanupTelemetry then
					pcall(v.cleanupTelemetry)
				end

				if v.cleanupTc then
					pcall(v.cleanupTc)
				end

				messagesStore.unregisterMessageComponent(v.componentId)
			end

			v100.current = {}
			v101.current = 0

			if FFlagEnableInExpChatRewrite then
				GetRewriteDropdownStore(false).setComponentId(nil)
			end
		end
	end, t6)

	if FFlagExpChatDynamicV2Pool and enabled then
		React.useEffect(function() -- line: 470
			-- upvalues: FFlagExpChatKeepV2PoolMounted (copy), v88 (copy), v101 (copy), v95 (copy), createSlotEffects (copy), v96 (copy), messagesStore (copy), chatWindowSettings (copy), t3 (copy), v100 (copy)
			if FFlagExpChatKeepV2PoolMounted and not v88 then
				return
			end

			local current = v101.current

			if current >= v95 then
				return
			end

			for i = current + 1, v95 do
				local v124 = createSlotEffects(v96.current[i], "msg-component-" .. i, messagesStore, chatWindowSettings, t3.showTranslationButton)

				table.insert(v100.current, v124)
			end

			v101.current = v95
			messagesStore.repopulateMessageComponents()
		end, if not FFlagExpChatKeepV2PoolMounted then { v95 } else {
			v95,
			v88
		})
		React.useEffect(function() -- line: 499
			-- upvalues: FFlagExpChatKeepV2PoolMounted (copy), v88 (copy), Signals (copy), messagesStore (copy), v46 (copy), v102 (copy), v94 (copy)
			if FFlagExpChatKeepV2PoolMounted and not v88 then
				return
			end

			local v125 = Signals.createEffect(function(p9) -- line: 504
				-- upvalues: messagesStore (copy), v46 (copy), v102 (copy), v94 (copy)
				local v167 = messagesStore.getActiveChannelFilter(p9)
				local v168 = math.min(math.ceil((#(if not v167 then messagesStore.getWindowMessagesInOrder(p9) or {} else messagesStore.getWindowMessagesInOrderByTabId(p9)[v167] or {}) + 2) / v46) * v46, 50)

				if v168 > v102.current then
					v94(v168)
				end
			end)

			return function() -- line: 521
				-- upvalues: v125 (copy)
				if v125 then
					pcall(v125)
				end
			end
		end, if not FFlagExpChatKeepV2PoolMounted then {} else { v88 })
	end

	local v105 = React.useRef(false)

	React.useEffect(function() -- line: 532
		-- upvalues: v88 (copy), v105 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), t3 (copy), messagesStore (copy)
		if not v88 then
			v105.current = false

			return
		end

		if not v105.current then
			v105.current = true

			return
		end

		local selectedChannelName

		if GetFFlagTextChatEnableUniverseChatTabs() then
			selectedChannelName = t3.selectedChannelName

			if t3.targetTextChannel then
				selectedChannelName = t3.targetTextChannel.Name
			end
		else
			selectedChannelName = if not t3.isChannelBarVisible or not t3.targetTextChannel then nil else t3.targetTextChannel.Name
		end

		messagesStore.setActiveChannelFilter(selectedChannelName)
		messagesStore.repopulateMessageComponents()
	end, {
		v88,
		t3.targetTextChannel,
		t3.isChannelBarVisible,
		if not GetFFlagTextChatEnableUniverseChatTabs() then nil else t3.selectedChannelName
	})

	return {
		children = React.useMemo(function() -- line: 566
			-- upvalues: enabled (copy), v95 (copy), v96 (copy), React (copy), TranslatedTextMessageV2 (copy), t3 (copy), chatWindowSettings (copy), FFlagEnableInExpChatRewrite (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), v91 (copy), RewriteDropdown (copy)
			if not enabled then
				return nil
			end

			local t7 = {}

			for i = 1, v95 do
				local v129 = "msg-component-" .. i
				local v130 = v96.current[i]

				t7[v129] = React.createElement(TranslatedTextMessageV2, {
					originalBodyText = v130.bodyText,
					originalPrefixText = v130.prefixText,
					shouldShowTranslationToggle = v130.shouldShowTranslation,
					bodyTextProperties = v130.bodyTextProperties,
					prefixTextProperties = v130.prefixTextProperties,
					layoutOrder = v130.layoutOrder,
					visible = v130.visible,
					textTransparency = t3.textTransparency,
					isUserVerified = v130.isUserVerified,
					userId = v130.userId,
					useTranslation = v130.useTranslation,
					messageId = v130.messageId,
					isSpatialUIEnabled = t3.isSpatialUIEnabled,
					chatWindowSettings = chatWindowSettings,
					onTextMessageLabelButtonActivated = t3.onTextMessageLabelButtonActivated,
					message = v130.message,
					isTrustedConnection = v130.isTrustedConnection,
					wasRewritten = if not FFlagEnableInExpChatRewrite then nil else v130.wasRewritten,
					isRewriteWindowOpen = if not FFlagEnableInExpChatRewrite then nil else v130.isRewriteWindowOpen,
					chatActionType = if not FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 then nil else v130.chatActionType,
					chatWindowTransparencyBindable = t3.chatWindowTransparencyBindable,
					arButtonPadding = v91
				})
			end

			if FFlagEnableInExpChatRewrite then
				t7["$rewrite-dropdown"] = React.createElement(RewriteDropdown, {
					textTransparency = t3.textTransparency,
					arButtonPadding = v91
				})
			end

			t7["$layout"] = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder
			})

			return t7
		end, if not FFlagExpChatKeepV2PoolMounted then {
			enabled,
			t3.textTransparency,
			t3.isSpatialUIEnabled,
			chatWindowSettings,
			t3.onTextMessageLabelButtonActivated,
			v95
		} else {
			enabled,
			v95
		})
	}
end
