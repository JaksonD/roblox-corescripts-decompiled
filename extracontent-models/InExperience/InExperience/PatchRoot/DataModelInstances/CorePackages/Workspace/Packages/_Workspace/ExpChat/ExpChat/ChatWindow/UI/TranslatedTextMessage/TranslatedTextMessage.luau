local IXPService = game:GetService("IXPService")
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local ExpChatParent2 = ExpChat.Parent
local FFlagExpChatEnableFocusNavigation = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local UserProfileStore = require(ExpChatParent.UserProfiles).Stores.UserProfileStore
local SignalsReact = require(ExpChatParent.SignalsReact)
local React = require(ExpChatParent2.React)
local RoactRodux = require(ExpChatParent.RoactRodux)
local SharedFlags = require(ExpChatParent.SharedFlags)
local DataHydration = require(ExpChatParent.DataHydration)
local Signals = require(ExpChatParent.Signals)
local Foundation = require(ExpChatParent.Foundation)
local Dictionary = require(ExpChatParent.llama).Dictionary
local Localization = require(ExpChat.Localization)
local isChatRegionLocked = require(ExpChat.isChatRegionLocked)
local showChatEnabledUI = require(ExpChat.showChatEnabledUI)
local GetMessagesStore = require(ExpChat.Stores.GetMessagesStore)
local GetChatStatusStore = require(ExpChat.Stores.GetChatStatusStore)
local GetChannelTabsStore = require(ExpChat.Stores.GetChannelTabsStore)
local UIBlox = require(ExpChatParent.UIBlox)
local FFlagExpChatUseMessagesStore = SharedFlags.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChannelTabsStore = SharedFlags.FFlagExpChatUseChannelTabsStore
local useStore = require(ExpChatParent.RoactUtils).Hooks.RoactRodux.useStore
local shouldSendHighFrequencyTelemetry = require(ExpChat.shouldSendHighFrequencyTelemetry)
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)
local TextChatMessageChatActionType = require(ExpChat.TextChatMessageChatActionType)
local FFlagDebugMessageProfiling = require(ExpChat.Flags.FFlagDebugMessageProfiling)
local v31 = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false)
local getFFlagExpChatUseUpdatedMessageRendered = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v33 = require(ExpChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local getFFlagExpChatExcludeFOMORenders = require(ExpChat.Flags.getFFlagExpChatExcludeFOMORenders)
local FFlagEnableInExpChatRewrite = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local FStringInExpChatRewriteLabelKey = require(ExpChat.Flags.FStringInExpChatRewriteLabelKey)
local FStringInExpChatRewriteReasonKey = require(ExpChat.Flags.FStringInExpChatRewriteReasonKey)
local FFlagExpChatRewriteInline = require(ExpChat.Flags.FFlagExpChatRewriteInline)
local FFlagExpChatRewriteInlineIxpEnabled = require(ExpChat.Flags.FFlagExpChatRewriteInlineIxpEnabled)
local FFlagExpChatRewriteToggleAnalytics = require(ExpChat.Flags.FFlagExpChatRewriteToggleAnalytics)
local FStringExpChatRewriteInlineIxpLayer = require(ExpChat.Flags.FStringExpChatRewriteInlineIxpLayer)
local FIntExpChatWindowTransparencyRewriteInteractableThreshold = require(ExpChat.Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local FFlagEnableInExpChatSummaryOnLua = require(ExpChat.Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatPolishSummaryMessageUI = require(ExpChat.Flags.FFlagExpChatPolishSummaryMessageUI)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabled = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local summaryMessageRichText = require(ExpChat.summaryMessageRichText)
local useCursor = UIBlox.App.SelectionCursor.useCursor
local Config = require(ExpChat.Config)
local Helpers = ExpChat.ChatWindow.Helpers
local getMessageSettings = require(Helpers.getMessageSettings)
local duplicateInvisibleText = require(Helpers.duplicateInvisibleText)
local Flags = ExpChat.Flags
local isExperienceChatUserProfileApiEnabled = require(Flags.isExperienceChatUserProfileApiEnabled)
local FIntExpChatVisibleARButtonPadding = require(Flags.FIntExpChatVisibleARButtonPadding)
local FIntExpChatDefaultARButtonPadding = require(Flags.FIntExpChatDefaultARButtonPadding)
local FFlagAEGIS2EnableGatesForExpChat = require(Flags.FFlagAEGIS2EnableGatesForExpChat)
local FFlagExpChatPerfTracking = require(ExpChatParent.SharedFlags).FFlagExpChatPerfTracking
local ExpChatShared = require(ExpChatParent2.ExpChatShared)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs

function appendVerifiedBadge(s1: string) -- line: 75
	-- upvalues: Config (copy)
	return string.gsub(s1, ":(%S-)$", Config.VERIFIED_EMOJI .. ":%1")
end

local function v60(p1) -- line: 79
	-- upvalues: UserProfileStore (copy), SignalsReact (copy)
	local str = tostring(p1.userId)
	local v69 = UserProfileStore.get().fetchNamesByUserIds({ str })(false).data[1]
	local v70 = SignalsReact.useSignalBinding(v69.names.getDisplayName)
	local v71 = SignalsReact.useSignalBinding(v69.names.getInExperienceCombinedName)

	return {
		displayName = v70,
		inExperienceCombinedName = v71
	}
end

function trim(p2) -- line: 88
	if p2:match("^()%s*$") then
		return ""
	end

	return (p2:match("^%s*(.*%S)"))
end
function getMessageText(b1: boolean?, s2: string?, s3: string?) -- line: 92
	if s2 == nil or s2 == "" then
		return s3 or ""
	end

	if b1 then
		return s2 or ""
	end

	return s3 or ""
end

local function appendTrustedIndicator(s4: string, s5: string, n1: number, n2: number, p3) -- line: 132
	local v88 = p3.Color.Shift.Shift_300.Color3:ToHex()
	local Shift_300Transparency = p3.Color.Shift.Shift_300.Transparency
	local v90 = Shift_300Transparency + n1 * (1 - Shift_300Transparency)
	local v91 = p3.Color.Content.Emphasis.Color3:ToHex()
	local EmphasisTransparency = p3.Color.Content.Emphasis.Transparency
	local v93 = EmphasisTransparency + n1 * (1 - EmphasisTransparency)
	local v94 = n2 - 4
	local v95 = `{ `{ `{ `{ `<mark color='#{ v88 }' transparency='{ v90 }'>` }<font transparency='1' weight='{ 600 }' size='{ v94 }'><stroke transparency='1'>_` }<font color='#{ v91 }' transparency='{ v93 }'>{ s5 }</font>` }_</stroke></font>` }</mark>`

	if string.find(s4, ":([%S:]-)$") then
		return string.gsub(s4, ":([%S:]-)$", ` { v95 } :%1`)
	end

	return `{ s4 } { v95 }`
end

local v62 = DataHydration.TrustedConnections.TrustedConnectionsStore.get()

local function v63(p4) -- line: 182
	-- upvalues: FFlagDebugMessageProfiling (copy), FFlagExpChatPerfTracking (copy), React (copy), ExpChatPerfTracker (copy), Localization (copy), FFlagExpChatRewriteInline (copy), FStringInExpChatRewriteLabelKey (copy), Foundation (copy), getMessageSettings (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), isExperienceChatUserProfileApiEnabled (copy), v60 (copy), getFFlagExpChatExcludeFOMORenders (copy), Signals (copy), Players (copy), v62 (copy), SignalsReact (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), FFlagExpChatUseChannelTabsStore (copy), useStore (copy), getFFlagExpChatUseUpdatedMessageRendered (copy), shouldSendHighFrequencyTelemetry (copy), v33 (copy), GetChannelTabsStore (copy), TextChatService (copy), appendTrustedIndicator (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagExpChatPolishSummaryMessageUI (copy), TextChatMessageChatActionType (copy), summaryMessageRichText (copy), v31 (copy), duplicateInvisibleText (copy), FFlagExpChatEnableFocusNavigation (copy), useCursor (copy), FFlagEnableInExpChatRewrite (copy), FFlagAEGIS2EnableGatesForExpChat (copy), GetChatStatusStore (copy), showChatEnabledUI (copy), isChatRegionLocked (copy), FIntExpChatVisibleARButtonPadding (copy), FIntExpChatDefaultARButtonPadding (copy), FIntExpChatWindowTransparencyRewriteInteractableThreshold (copy)
	if FFlagDebugMessageProfiling then
		debug.profilebegin("TranslatedTextMessage")
	end

	if FFlagExpChatPerfTracking then
		local v102 = p4.message.messageId or "UNKNOWN_MESSAGE_ID"

		React.useEffect(function() -- line: 188
			-- upvalues: ExpChatPerfTracker (copy), v102 (copy)
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, {
				messageId = v102
			})
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, {
				messageId = v102
			})
		end, { v102 })
	end

	local isSpatialUIEnabled = p4.isSpatialUIEnabled
	local v104 = if not isSpatialUIEnabled then p4.chatWindowSettings.TextSize else p4.chatWindowSettings.SpatialPanelTextSize
	local v105 = Localization.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if not FFlagExpChatRewriteInline then nil else FStringInExpChatRewriteLabelKey,
		defaultRewrittenLabelText = if not FFlagExpChatRewriteInline then nil else "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
	})
	local u106 = nil

	if FFlagExpChatRewriteInline then
		u106 = if not v105.rewrittenLabelText or v105.rewrittenLabelText == "" then v105.defaultRewrittenLabelText else v105.rewrittenLabelText
	end

	local v107 = Foundation.Hooks.useTokens()
	local v108 = getMessageSettings(p4.message, p4.chatWindowSettings)
	local showTranslationButton = p4.showTranslationButton
	local useTranslation = v108.useTranslation
	local v111 = getMessageText(useTranslation, v108.translation, v108.text)
	local v112 = v108.prefixText or ""
	local v113 = nil

	if GetFFlagTextChatEnableUniverseChatTabs() and p4.message.textChannel == nil then
		v113 = nil
	elseif isExperienceChatUserProfileApiEnabled() and p4.message.userId then
		if FFlagDebugMessageProfiling then
			debug.profilebegin("useCombinedName")
		end

		v113 = v60(p4.message)

		if FFlagDebugMessageProfiling then
			debug.profileend()
		end
	end

	local v114 = p4.message.userId and tostring(p4.message.userId)
	local v115 = if not getFFlagExpChatExcludeFOMORenders() then nil else p4.message.isHiddenMessage
	local v116 = React.useMemo(function() -- line: 241
		-- upvalues: Signals (copy), v114 (copy), Players (copy), v115 (copy), v62 (copy)
		return Signals.createComputed(function(p5) -- line: 242
			-- upvalues: v114 (copy), Players (copy), v115 (copy), v62 (copy)
			local v283 = v114 and v114 ~= ""
			local v284 = Players.LocalPlayer and (Players.LocalPlayer.UserId and tostring(Players.LocalPlayer.UserId))
			local v285 = v284 and v284 == v114

			if v283 and (not v285 and not v115) then
				return (v62.getIsTrustedConnection(v114).data(p5))
			end

			return nil
		end)
	end, {
		v114,
		v115
	})
	local v117 = SignalsReact.useSignalBinding(v116)
	local v118 = if not EngineFeatureExpChatGlobalChatEngineTelemetryEnabled or FFlagExpChatUseChannelTabsStore then nil else useStore()

	if getFFlagExpChatUseUpdatedMessageRendered() then
		React.useEffect(function() -- line: 263
			-- upvalues: p4 (copy), shouldSendHighFrequencyTelemetry (copy), v33 (copy), getFFlagExpChatExcludeFOMORenders (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStore (copy), v118 (copy), TextChatService (copy)
			if p4.message.textChatMessageInstance and shouldSendHighFrequencyTelemetry(v33) and (not getFFlagExpChatExcludeFOMORenders() or not p4.message.isHiddenMessage) then
				if EngineFeatureExpChatGlobalChatEngineTelemetryEnabled then
					local n3 = -1

					if FFlagExpChatUseChannelTabsStore then
						local v231 = GetChannelTabsStore(false)
						local v232 = v231.getChannelTabsState(false)
						local v233 = v231.getSelectedTabName(false)

						if v233 and v232.allChannelTabs[v233] then
							n3 = v232.allChannelTabs[v233].tabIndex
						end
					else
						local ChannelTabs = v118:getState().ChannelTabs
						local v235 = ChannelTabs and ChannelTabs.selectedTabName

						if v235 and ChannelTabs.allChannelTabs[v235] then
							n3 = ChannelTabs.allChannelTabs[v235].TabIndex
						end
					end

					TextChatService:SendExpChatMessageClientRendered(p4.message.textChatMessageInstance, "chat_window", n3)

					return
				end

				TextChatService:SendExpChatMessageClientRendered(p4.message.textChatMessageInstance, "chat_window")
			end
		end, {})
	end

	local bodyTextProperties = v108.bodyTextProperties
	local prefixTextProperties = v108.prefixTextProperties
	local v121 = if not isSpatialUIEnabled then bodyTextProperties.TextSize else v104
	local v122 = v121 - 2
	local v123 = React.joinBindings((if v113 == nil then {} else {
		v113.displayName,
		v113.inExperienceCombinedName
	})):map(function(p6) -- line: 308
		-- upvalues: v112 (copy), p4 (copy)
		local v237 = p6[1] or ""
		local v238 = p6[2] or ""
		local v239 = v112

		if string.len(v237) > 0 and (string.len(v238) > 0 and v237 ~= v238) then
			v239 = string.gsub(v239, v237, v238)
		end

		if string.len(v112) > 0 and p4.isUserVerified then
			v239 = appendVerifiedBadge(v239)
		end

		return v239
	end)
	local v124 = React.joinBindings({
		v123,
		v117,
		p4.textTransparency
	}):map(function(p7) -- line: 329
		-- upvalues: v112 (copy), appendTrustedIndicator (copy), v105 (copy), prefixTextProperties (copy), v107 (copy)
		local v241 = p7[1] or ""
		local v242 = p7[2] or false
		local v243 = p7[3]

		if v243 == nil then
			v243 = 1
		end

		if string.len(v112) == 0 then
			return v241
		end

		if v242 then
			v241 = appendTrustedIndicator(v241, v105.trustedLabelText, v243, prefixTextProperties.TextSize, v107)
		end

		return v241
	end)
	local v125 = v124:map(function(p8) -- line: 350
		-- upvalues: v112 (copy)
		if string.len(v112) == 0 then
			return p8
		end

		return trim(p8)
	end)
	local v126 = v124:map(function(p9) -- line: 357
		-- upvalues: v111 (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagExpChatPolishSummaryMessageUI (copy), v121 (copy), v107 (copy), p4 (copy), TextChatMessageChatActionType (copy), summaryMessageRichText (copy), v112 (copy), showTranslationButton (copy), v31 (copy), duplicateInvisibleText (copy), prefixTextProperties (copy)
		local v246 = v111

		if FFlagEnableInExpChatSummaryOnLua then
			local v247 = if not FFlagExpChatPolishSummaryMessageUI then nil else v121
			local v248 = v107
			local v249 = v111
			local message = p4.message

			v246 = v249 or ""

			if message.chatActionType == TextChatMessageChatActionType.Summary then
				v246 = summaryMessageRichText.wrapInSummaryMutedStyle(summaryMessageRichText.getSummaryIconPrefix(v247) .. " " .. v246, v248.Color.Content.Muted.Color3:ToHex(), v247)
			end
		end

		if string.len(v112) == 0 then
			if FFlagEnableInExpChatSummaryOnLua then
				return v246
			end

			return v111
		end

		if showTranslationButton then
			v246 = if not v31 then "   " .. v246 else "     " .. v246
		end

		return duplicateInvisibleText(p9, prefixTextProperties.FontFace, prefixTextProperties.TextSize) .. " " .. v246
	end)

	if FFlagExpChatRewriteInline then
		v126 = React.joinBindings({ v126 }):map(function(p10) -- line: 378
			-- upvalues: p4 (copy), Foundation (copy), prefixTextProperties (copy), v107 (copy), u106 (ref)
			local v252 = p10[1] or ""

			if not p4.wasRewritten then
				return v252
			end

			local v253 = if not p4.isRewriteMenuOpen then Foundation.Enums.IconName.ChevronLargeDown else Foundation.Enums.IconName.ChevronLargeUp

			return `{ v252 } <font size='{ prefixTextProperties.TextSize - 4 }' color='#{ v107.Color.Content.Muted.Color3:ToHex() }'>{ `({ u106 })` }<font transparency='1'><stroke transparency='1'>_</stroke></font>{ `<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{ v253 }</font>` }</font>`
		end)
	end

	local v127 = if not FFlagExpChatEnableFocusNavigation then nil else useCursor()
	local v132

	if FFlagEnableInExpChatRewrite then
		local v128 = true

		if FFlagAEGIS2EnableGatesForExpChat then
			local v129 = GetChatStatusStore(false)
			local v130 = SignalsReact.useSignalState(v129.getChatStatus)

			v128 = showChatEnabledUI(v130)
		end

		local v131 = if not (not isChatRegionLocked() and v128) then FIntExpChatDefaultARButtonPadding else FIntExpChatVisibleARButtonPadding

		v132 = React.createElement("UIPadding", {
			PaddingRight = UDim.new(0, v131)
		})
	else
		local v133 = true

		if FFlagAEGIS2EnableGatesForExpChat then
			local v134 = GetChatStatusStore(false)
			local v135 = SignalsReact.useSignalState(v134.getChatStatus)

			v133 = showChatEnabledUI(v135)
		end

		local v136 = not isChatRegionLocked() and v133

		v132 = React.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if not v136 then FIntExpChatDefaultARButtonPadding else FIntExpChatVisibleARButtonPadding)
		})
	end

	local v137 = nil

	if FFlagExpChatRewriteInline and p4.wasRewritten then
		v137 = p4.chatWindowTransparencyBindable == nil or if typeof(p4.chatWindowTransparencyBindable) ~= "number" then p4.chatWindowTransparencyBindable:map(function(p11) -- line: 436
			-- upvalues: FIntExpChatWindowTransparencyRewriteInteractableThreshold (copy)
			return p11 < FIntExpChatWindowTransparencyRewriteInteractableThreshold
		end) else p4.chatWindowTransparencyBindable < FIntExpChatWindowTransparencyRewriteInteractableThreshold
	end

	local createElement = React.createElement
	local t1 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = p4.LayoutOrder
	}
	local t2 = {
		UIPadding = v132
	}
	local createElement2 = React.createElement
	local t3 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1
	}
	local t4 = {}
	local v144 = false

	if string.len(v112) > 0 then
		local createElement3 = React.createElement
		local t5 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			FontFace = prefixTextProperties.FontFace,
			RichText = true,
			Text = v124,
			TextColor3 = prefixTextProperties.TextColor3,
			TextSize = prefixTextProperties.TextSize,
			TextStrokeColor3 = prefixTextProperties.TextStrokeColor3
		}
		local TextStrokeTransparency = prefixTextProperties.TextStrokeTransparency

		t5.TextStrokeTransparency = p4.textTransparency:map(function(p12) -- line: 107
			-- upvalues: TextStrokeTransparency (copy)
			if TextStrokeTransparency == nil then
				return 1
			end

			local v256 = TextStrokeTransparency

			return v256 + p12 * (1 - v256)
		end)

		local n4 = 0

		t5.TextTransparency = p4.textTransparency:map(function(p13) -- line: 107
			-- upvalues: n4 (copy)
			if n4 == nil then
				return 1
			end

			local v258 = n4

			return v258 + p13 * (1 - v258)
		end)
		t5.TextWrapped = true
		t5.TextXAlignment = Enum.TextXAlignment.Left
		t5.TextYAlignment = Enum.TextYAlignment.Top
		v144 = createElement3("TextLabel", t5, {
			UIGradient = prefixTextProperties.UIGradient ~= nil and React.createElement("UIGradient", prefixTextProperties.UIGradient)
		})
	end

	t4.PrefixText = v144

	local createElement4 = React.createElement
	local v150 = (not FFlagExpChatRewriteInline or not p4.wasRewritten) and "TextLabel" or "TextButton"
	local t6 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		FontFace = bodyTextProperties.FontFace,
		RichText = true,
		Size = UDim2.new(1, 0, 0, 0),
		Text = v126,
		TextColor3 = bodyTextProperties.TextColor3,
		TextSize = v121,
		TextStrokeColor3 = bodyTextProperties.TextStrokeColor3
	}
	local TextStrokeTransparency = bodyTextProperties.TextStrokeTransparency

	t6.TextStrokeTransparency = p4.textTransparency:map(function(p14) -- line: 107
		-- upvalues: TextStrokeTransparency (copy)
		if TextStrokeTransparency == nil then
			return 1
		end

		local v260 = TextStrokeTransparency

		return v260 + p14 * (1 - v260)
	end)

	local n5 = 0

	t6.TextTransparency = p4.textTransparency:map(function(p15) -- line: 107
		-- upvalues: n5 (copy)
		if n5 == nil then
			return 1
		end

		local v262 = n5

		return v262 + p15 * (1 - v262)
	end)
	t6.TextWrapped = true
	t6.TextXAlignment = Enum.TextXAlignment.Left
	t6.TextYAlignment = Enum.TextYAlignment.Top
	t6[React.Event.Activated] = if not FFlagExpChatRewriteInline or not p4.wasRewritten then nil else p4.onTextBodyActivated
	t6.Interactable = v137
	t4.BodyText = createElement4(v150, t6)

	local v161

	if string.len(v112) ~= 0 then
		local createElement5 = React.createElement
		local t7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t8 = {
			Layout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			TextButton = React.createElement("TextButton", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				FontFace = prefixTextProperties.FontFace,
				RichText = true,
				SelectionImageObject = v127,
				Size = UDim2.new(0, 0, 0, 0),
				Text = v125,
				TextSize = prefixTextProperties.TextSize,
				TextStrokeTransparency = 1,
				TextTransparency = 1,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 1,
				[React.Event.Activated] = function() -- line: 529
					-- upvalues: p4 (copy)
					p4.onTextMessageLabelButtonActivated(p4.message)
				end
			})
		}
		local v160

		if showTranslationButton then
			local createElement6 = React.createElement
			local t9 = {
				BackgroundTransparency = 1,
				HoverImage = "rbxasset://textures/translateIconDark.png",
				Image = "rbxasset://textures/translateIcon.png"
			}
			local n6 = 0

			t9.ImageTransparency = p4.textTransparency:map(function(p16) -- line: 107
				-- upvalues: n6 (copy)
				if n6 == nil then
					return 1
				end

				local v264 = n6

				return v264 + p16 * (1 - v264)
			end)
			t9.LayoutOrder = 2
			t9.PressedImage = "rbxasset://textures/translateIconDark.png"
			t9.SelectionImageObject = v127
			t9.Size = UDim2.new(0, v122, 0, v122)
			t9[React.Event.Activated] = function() -- line: 544
				-- upvalues: p4 (copy)
				p4.onToggle(not p4.message.useTranslation, p4.message.messageId)
			end
			v160 = createElement6("ImageButton", t9)
		else
			v160 = nil
		end

		t8.TranslationButton = v160
		v161 = createElement5("Frame", t7, t8)
	else
		v161 = nil
	end

	t4.TextMessageButton = v161
	t2.TextMessage = createElement2("Frame", t3, t4)

	local v162 = createElement("Frame", t1, t2)

	if FFlagDebugMessageProfiling then
		debug.profileend()
	end

	return v162
end
local function TranslatedTextMessageWithToggle(_) -- line: 559
	-- upvalues: RoactRodux (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStore (copy), v63 (copy)
	return RoactRodux.connect(function() -- line: 560
	end, function(p18) -- line: 560
		-- upvalues: FFlagExpChatUseMessagesStore (copy), GetMessagesStore (copy)
		return {
			onToggle = function(b2: boolean, s6: string) --[[ onToggle ]] -- line: 562
				-- upvalues: FFlagExpChatUseMessagesStore (copy), GetMessagesStore (copy), p18 (copy)
				if FFlagExpChatUseMessagesStore then
					GetMessagesStore(false).toggleMessageTranslation(b2, s6)

					return
				end

				p18({
					type = "ChatTranslationMessageToggled",
					useTranslation = b2,
					messageId = s6
				})
			end
		}
	end)(v63)
end
local function RewriteLabelWithButton(p19) -- line: 578
	-- upvalues: Foundation (copy), Localization (copy), FStringInExpChatRewriteLabelKey (copy), React (copy)
	local v165 = Foundation.Hooks.useTokens()
	local v166 = Localization.useLocalization({
		rewrittenLabelText = FStringInExpChatRewriteLabelKey,
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
	})
	local v167 = if not v166.rewrittenLabelText or v166.rewrittenLabelText == "" then v166.defaultRewrittenLabelText else v166.rewrittenLabelText
	local createElement = React.createElement
	local View = Foundation.View
	local t10 = {
		tag = "size-full-0 auto-y row align-y-center gap-xsmall",
		LayoutOrder = p19.LayoutOrder
	}
	local t11 = {}
	local createElement7 = React.createElement
	local FoundationText = Foundation.Text
	local t12 = {
		Text = "(" .. v167 .. ")",
		tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
		LayoutOrder = 1,
		RichText = true
	}
	local t13 = {
		Color3 = v165.Color.Content.Muted.Color3
	}
	local MutedTransparency = v165.Color.Content.Muted.Transparency

	t13.Transparency = p19.textTransparency:map(function(p20) -- line: 107
		-- upvalues: MutedTransparency (copy)
		if MutedTransparency == nil then
			return 1
		end

		local v267 = MutedTransparency

		return v267 + p20 * (1 - v267)
	end)
	t12.textStyle = t13

	local t14 = {
		Color = Color3.fromRGB(0, 0, 0)
	}
	local n7 = 0.5

	t14.Transparency = p19.textTransparency:map(function(p21) -- line: 107
		-- upvalues: n7 (copy)
		if n7 == nil then
			return 1
		end

		local v269 = n7

		return v269 + p21 * (1 - v269)
	end)
	t14.Thickness = v165.Stroke.Thin
	t12.stroke = t14
	t11.Label = createElement7(FoundationText, t12)
	t11.IconButton = React.createElement(Foundation.IconButton, {
		size = Foundation.Enums.InputSize.XSmall,
		icon = if not p19.isRewriteMenuOpen then Foundation.Enums.IconName.ChevronLargeDown else Foundation.Enums.IconName.ChevronLargeUp,
		variant = Foundation.Enums.ButtonVariant.Utility,
		isCircular = true,
		LayoutOrder = 2,
		Visible = p19.textTransparency:map(function(p22) -- line: 616
			return p22 < 1
		end),
		onActivated = p19.onActivated
	})

	return createElement(View, t10, t11)
end

return React.memo(function(p23) --[[ TranslatedTextMessageWrapper ]] -- line: 624
	-- upvalues: getMessageSettings (copy), FFlagEnableInExpChatRewrite (copy), FFlagAEGIS2EnableGatesForExpChat (copy), GetChatStatusStore (copy), SignalsReact (copy), showChatEnabledUI (copy), isChatRegionLocked (copy), FIntExpChatVisibleARButtonPadding (copy), FIntExpChatDefaultARButtonPadding (copy), Localization (copy), FStringInExpChatRewriteReasonKey (copy), Foundation (copy), React (copy), FFlagExpChatRewriteToggleAnalytics (copy), ExpChatShared (copy), FFlagExpChatRewriteInlineIxpEnabled (copy), IXPService (copy), FStringExpChatRewriteInlineIxpLayer (copy), FFlagExpChatRewriteInline (copy), Dictionary (copy), TranslatedTextMessageWithToggle (copy), v63 (copy), RewriteLabelWithButton (copy)
	local v180 = getMessageSettings(p23.message, p23.chatWindowSettings)
	local showTranslationButton = p23.showTranslationButton
	local v182 = nil
	local u183 = nil
	local u184 = nil
	local v185 = nil
	local originalText = nil
	local u187 = false
	local u188 = false
	local n8 = 0
	local s7 = ""

	if FFlagEnableInExpChatRewrite then
		local v191 = true

		if FFlagAEGIS2EnableGatesForExpChat then
			local v192 = GetChatStatusStore(false)
			local v193 = SignalsReact.useSignalState(v192.getChatStatus)

			v191 = showChatEnabledUI(v193)
		end

		n8 = math.max(((if not (not isChatRegionLocked() and v191) then FIntExpChatDefaultARButtonPadding else FIntExpChatVisibleARButtonPadding)) - FIntExpChatDefaultARButtonPadding, 0)

		local v194 = Localization.useLocalization({
			rewrittenReasonLabelText = FStringInExpChatRewriteReasonKey,
			defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel"
		})

		s7 = if not v194.rewrittenReasonLabelText or v194.rewrittenReasonLabelText == "" then v194.defaultRewrittenReasonLabelText else v194.rewrittenReasonLabelText
		v182 = Foundation.Hooks.useTokens()

		local v195, v196 = React.useState(false)

		u183 = v195
		u184 = v196
		u188 = v180.wasRewritten
		originalText = v180.originalText
		u187 = u188 and (originalText ~= nil and originalText ~= "")
		v185 = React.useCallback(function() -- line: 655
			-- upvalues: FFlagExpChatRewriteToggleAnalytics (copy), ExpChatShared (copy), p23 (copy), u183 (ref), u187 (ref), u184 (ref)
			if FFlagExpChatRewriteToggleAnalytics then
				ExpChatShared.Analytics:TelemetryLogEvent(ExpChatShared.Analytics.RewriteDropdownToggledConfig, {
					messageId = p23.message.messageId,
					isDropdownOpen = tostring(u183),
					showOriginalText = tostring(u187)
				}, ExpChatShared.Analytics.DefaultStandardizedFields)
			end

			u184(function(p24) -- line: 663
				return not p24
			end)
		end, {
			u183,
			u187,
			p23.message.messageId
		})

		if FFlagExpChatRewriteInlineIxpEnabled then
			React.useEffect(function() -- line: 669
				-- upvalues: u188 (ref), IXPService (copy), FStringExpChatRewriteInlineIxpLayer (copy)
				if u188 then
					IXPService:LogFlagLinkedUserLayerExposure(FStringExpChatRewriteInlineIxpLayer)
				end
			end, { u188 })
		end
	end

	local v197 = p23

	if FFlagExpChatRewriteInline and u188 then
		v197 = Dictionary.join(v197, {
			isRewriteMenuOpen = u183,
			wasRewritten = u188,
			onTextBodyActivated = v185,
			LayoutOrder = 1
		})
	elseif FFlagEnableInExpChatRewrite and u188 then
		v197 = Dictionary.join(v197, {
			LayoutOrder = 1
		})
	end

	local v198 = if not showTranslationButton then React.createElement(v63, v197) else React.createElement(TranslatedTextMessageWithToggle, v197)

	if FFlagEnableInExpChatRewrite and u188 then
		local createElement = React.createElement
		local View = Foundation.View
		local t15 = {
			tag = `size-full-0 auto-y align-y-top col{ not FFlagExpChatRewriteInline and "" or " gap-xsmall" }`,
			LayoutOrder = p23.LayoutOrder
		}
		local t16 = {
			UIPadding = if not u183 then nil else React.createElement("UIPadding", {
				PaddingBottom = UDim.new(0, 4)
			}),
			TranslatedTextMessage = v198,
			RewriteLabelWithButton = if not u188 or FFlagExpChatRewriteInline then nil else React.createElement(RewriteLabelWithButton, {
				onActivated = v185,
				isRewriteMenuOpen = u183,
				transparencyValue = p23.transparencyValue,
				textTransparency = p23.textTransparency,
				LayoutOrder = 2
			})
		}
		local v224

		if u183 then
			local createElement8 = React.createElement
			local View2 = Foundation.View
			local t17 = {
				tag = "align-x-left col radius-medium gap-xxsmall padding-small",
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -FIntExpChatDefaultARButtonPadding, 0, 0),
				LayoutOrder = 3
			}
			local t18 = {
				Color3 = v182.Color.Common.Scrim.Color3
			}
			local n9 = 0.7

			t18.Transparency = p23.transparencyValue:map(function(p25) -- line: 107
				-- upvalues: n9 (copy)
				if n9 == nil then
					return 1
				end

				local v272 = n9

				return v272 + p25 * (1 - v272)
			end)
			t17.backgroundStyle = t18

			local t19 = {}
			local v216

			if u187 then
				local createElement9 = React.createElement
				local FoundationText = Foundation.Text
				local t20 = {
					Text = originalText,
					tag = "text-body-small text-align-x-left",
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, -n8, 0, 0),
					LayoutOrder = 1,
					RichText = true,
					TextWrapped = true
				}
				local t21 = {
					Color3 = v182.Color.Content.Muted.Color3
				}
				local MutedTransparency = v182.Color.Content.Muted.Transparency

				t21.Transparency = p23.textTransparency:map(function(p26) -- line: 107
					-- upvalues: MutedTransparency (copy)
					if MutedTransparency == nil then
						return 1
					end

					local v274 = MutedTransparency

					return v274 + p26 * (1 - v274)
				end)
				t20.textStyle = t21

				local t22 = {
					Color = Color3.fromRGB(0, 0, 0)
				}
				local n10 = 0.5

				t22.Transparency = p23.textTransparency:map(function(p27) -- line: 107
					-- upvalues: n10 (copy)
					if n10 == nil then
						return 1
					end

					local v276 = n10

					return v276 + p27 * (1 - v276)
				end)
				t22.Thickness = v182.Stroke.Thin
				t20.stroke = t22
				v216 = createElement9(FoundationText, t20)
			else
				v216 = nil
			end

			t19.OriginalText = v216
			t19.Divider = if not u187 then nil else React.createElement(Foundation.Divider, {
				orientation = Foundation.Enums.Orientation.Horizontal,
				LayoutOrder = 2,
				Visible = p23.textTransparency:map(function(p28) -- line: 757
					return p28 < 1
				end),
				DividerVariant = Foundation.Enums.DividerVariant.Default
			})

			local createElement10 = React.createElement
			local FoundationText = Foundation.Text
			local t23 = {
				Text = s7,
				tag = "text-body-small text-align-x-left",
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, -n8, 0, 0),
				LayoutOrder = 3,
				RichText = true,
				TextWrapped = true
			}
			local t24 = {
				Color3 = v182.Color.Content.Default.Color3
			}
			local DefaultTransparency = v182.Color.Content.Default.Transparency

			t24.Transparency = p23.textTransparency:map(function(p29) -- line: 107
				-- upvalues: DefaultTransparency (copy)
				if DefaultTransparency == nil then
					return 1
				end

				local v279 = DefaultTransparency

				return v279 + p29 * (1 - v279)
			end)
			t23.textStyle = t24

			local t25 = {
				Color = Color3.fromRGB(0, 0, 0)
			}
			local n11 = 0.5

			t25.Transparency = p23.textTransparency:map(function(p30) -- line: 107
				-- upvalues: n11 (copy)
				if n11 == nil then
					return 1
				end

				local v281 = n11

				return v281 + p30 * (1 - v281)
			end)
			t25.Thickness = v182.Stroke.Thin
			t23.stroke = t25
			t19.ReasoningText = createElement10(FoundationText, t23)
			v224 = createElement8(View2, t17, t19)
		else
			v224 = nil
		end

		t16.DropdownMenu = v224
		v198 = createElement(View, t15, t16)
	end

	return v198
end, function(p31, p32) --[[ areEqual ]] -- line: 797
	-- upvalues: FFlagEnableInExpChatRewrite (copy), FFlagExpChatRewriteInline (copy), FFlagEnableInExpChatSummaryOnLua (copy)
	local v227 = false

	if p31.message.text == p32.message.text then
		v227 = false

		if p31.message.prefixText == p32.message.prefixText then
			v227 = false

			if p31.message.translation == p32.message.translation then
				v227 = false

				if p31.message.useTranslation == p32.message.useTranslation then
					v227 = false

					if p31.message.messageId == p32.message.messageId then
						v227 = false

						if p31.chatWindowSettings == p32.chatWindowSettings then
							v227 = not FFlagEnableInExpChatRewrite or p31.message.wasRewritten == p32.message.wasRewritten and p31.message.originalText == p32.message.originalText

							if v227 then
								v227 = not FFlagExpChatRewriteInline or p31.chatWindowTransparencyBindable == p32.chatWindowTransparencyBindable

								if v227 then
									if FFlagEnableInExpChatSummaryOnLua then
										return p31.message.chatActionType == p32.message.chatActionType
									end

									v227 = true
								end
							end
						end
					end
				end
			end
		end
	end

	return v227
end)
