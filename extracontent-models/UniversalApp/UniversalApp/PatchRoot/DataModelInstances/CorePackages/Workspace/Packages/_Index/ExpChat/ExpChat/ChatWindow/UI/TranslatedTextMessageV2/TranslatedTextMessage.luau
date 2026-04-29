local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local Foundation = require(ExpChatParent.Foundation)
local React = require(ExpChatParent.React)
local UIBlox = require(ExpChatParent.UIBlox)
local Localization = require(ExpChat.Localization)
local Flags = ExpChat.Flags
local FFlagExpChatEnableFocusNavigation = require(Flags.FFlagExpChatEnableFocusNavigation)
local FFlagDebugMessageProfiling = require(Flags.FFlagDebugMessageProfiling)
local FFlagEnableInExpChatRewrite = require(Flags.FFlagEnableInExpChatRewrite)
local FFlagExpChatRewriteInline = require(Flags.FFlagExpChatRewriteInline)
local FFlagExpChatRewriteToggleAnalytics = require(Flags.FFlagExpChatRewriteToggleAnalytics)
local FStringInExpChatRewriteLabelKey = require(Flags.FStringInExpChatRewriteLabelKey)
local FIntExpChatWindowTransparencyRewriteInteractableThreshold = require(Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold)
local FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 = require(Flags.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2)
local FFlagExpChatPolishSummaryMessageUI = require(Flags.FFlagExpChatPolishSummaryMessageUI)
local TextChatMessageChatActionType = require(ExpChat.TextChatMessageChatActionType)
local summaryMessageRichText = require(ExpChat.summaryMessageRichText)
local RewriteToggle = require(script.Parent.RewriteToggle)
local GetMessagesStore = require(ExpChat.Stores.GetMessagesStore)
local GetRewriteDropdownStore = require(ExpChat.Stores.GetRewriteDropdownStore)
local FFlagLuaAppPerfTrackerUseLogger = require(ExpChatParent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local v24 = game:DefineFastFlag("ExpChatMessageV2PerfTracking3", false) and FFlagLuaAppPerfTrackerUseLogger
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)
local useCursor = UIBlox.App.SelectionCursor.useCursor
local Config = require(ExpChat.Config)
local Helpers = ExpChat.ChatWindow.Helpers
local duplicateInvisibleText = require(Helpers.duplicateInvisibleText)
local mergeBindableScalar = require(Helpers.mergeBindableScalar)

local function trim(s1: string) -- line: 52
	if s1:match("^()%s*$") then
		return ""
	end

	return (s1:match("^%s*(.*%S)"))
end
local function appendTrustedIndicator(s2: string, s3: string, n1: number, n2: number, p1) -- line: 65
	local v44 = p1.Color.Shift.Shift_300.Color3:ToHex()
	local Shift_300Transparency = p1.Color.Shift.Shift_300.Transparency
	local v46 = Shift_300Transparency + n1 * (1 - Shift_300Transparency)
	local v47 = p1.Color.Content.Emphasis.Color3:ToHex()
	local EmphasisTransparency = p1.Color.Content.Emphasis.Transparency
	local v49 = EmphasisTransparency + n1 * (1 - EmphasisTransparency)
	local v50 = n2 - 4
	local v51 = `{ `{ `{ `{ `<mark color='#{ v44 }' transparency='{ v46 }'>` }<font transparency='1' weight='{ 600 }' size='{ v50 }'><stroke transparency='1'>_` }<font color='#{ v47 }' transparency='{ v49 }'>{ s3 }</font>` }_</stroke></font>` }</mark>`

	if string.find(s2, ":([%S:]-)$") then
		return string.gsub(s2, ":([%S:]-)$", ` { v51 } :%1`)
	end

	return `{ s2 } { v51 }`
end

return React.memo(function(t1: {[any]: any}) --[[ TranslatedTextMessage ]] -- line: 123
	-- upvalues: FFlagDebugMessageProfiling (copy), Localization (copy), FFlagExpChatRewriteInline (copy), FFlagEnableInExpChatRewrite (copy), FStringInExpChatRewriteLabelKey (copy), Foundation (copy), v24 (copy), React (copy), ExpChatPerfTracker (copy), GetMessagesStore (copy), GetRewriteDropdownStore (copy), FFlagExpChatRewriteToggleAnalytics (copy), ExpChatShared (copy), Config (copy), appendTrustedIndicator (copy), trim (copy), FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), FFlagExpChatPolishSummaryMessageUI (copy), TextChatMessageChatActionType (copy), summaryMessageRichText (copy), duplicateInvisibleText (copy), FIntExpChatWindowTransparencyRewriteInteractableThreshold (copy), FFlagExpChatEnableFocusNavigation (copy), useCursor (copy), mergeBindableScalar (copy), RewriteToggle (copy)
	if FFlagDebugMessageProfiling then
		debug.profilebegin("TranslatedTextMessage")
	end

	local isSpatialUIEnabled = t1.isSpatialUIEnabled
	local v54 = if not isSpatialUIEnabled then t1.chatWindowSettings.TextSize else t1.chatWindowSettings.SpatialPanelTextSize
	local v55 = Localization.useLocalization({
		trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel",
		rewrittenLabelText = if not FFlagExpChatRewriteInline or not FFlagEnableInExpChatRewrite then nil else FStringInExpChatRewriteLabelKey,
		defaultRewrittenLabelText = if not FFlagExpChatRewriteInline or not FFlagEnableInExpChatRewrite then nil else "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
	})
	local u56 = nil

	if FFlagExpChatRewriteInline and FFlagEnableInExpChatRewrite then
		u56 = if not v55.rewrittenLabelText or v55.rewrittenLabelText == "" then v55.defaultRewrittenLabelText else v55.rewrittenLabelText
	end

	local v57 = Foundation.Hooks.useTokens()
	local v58 = if not v24 then nil else React.useCallback(function() -- line: 153
		-- upvalues: t1 (copy), ExpChatPerfTracker (copy)
		local v118 = t1.message.current.messageId or "UNKNOWN_MESSAGE_ID"

		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, {
			messageId = v118
		})
		ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, {
			messageId = v118
		})
	end, { t1.message })
	local v59 = if not v24 then nil else React.useCallback(function(p2) -- line: 164
		-- upvalues: v58 (copy)
		if p2 and (p2.Text and p2.Text ~= "") then
			v58()
		end
	end, { v58 })
	local v60 = React.useCallback(function() -- line: 171
		-- upvalues: t1 (copy)
		t1.onTextMessageLabelButtonActivated(t1.message.current)
	end, { t1.onTextMessageLabelButtonActivated })
	local v61 = React.useCallback(function() -- line: 175
		-- upvalues: t1 (copy), GetMessagesStore (copy)
		local current = t1.message.current

		GetMessagesStore(false).toggleMessageTranslation(not current.useTranslation, current.messageId)
	end, {})
	local v62 = nil

	if FFlagEnableInExpChatRewrite then
		v62 = React.useCallback(function() -- line: 183
			-- upvalues: t1 (copy), GetRewriteDropdownStore (copy), FFlagExpChatRewriteToggleAnalytics (copy), ExpChatShared (copy)
			local current = t1.message.current

			if current and current.messageId then
				local v122 = GetRewriteDropdownStore(false)

				if FFlagExpChatRewriteToggleAnalytics then
					local v123 = v122.getOpenMessageId(false) == current.messageId
					local v124 = current.wasRewritten and (current.originalText ~= nil and current.originalText ~= "")

					ExpChatShared.Analytics:TelemetryLogEvent(ExpChatShared.Analytics.RewriteDropdownToggledConfig, {
						messageId = current.messageId,
						isDropdownOpen = tostring(v123),
						showOriginalText = tostring(v124)
					}, ExpChatShared.Analytics.DefaultStandardizedFields)
				end

				v122.toggleDropdown(current.messageId)
			end
		end, { t1.message })
	end

	local t2 = {
		t1.originalPrefixText,
		t1.isUserVerified
	}

	table.insert(t2, t1.isTrustedConnection)
	table.insert(t2, t1.textTransparency)
	table.insert(t2, t1.prefixTextProperties)

	local v64 = React.joinBindings(t2):map(function(p3) -- line: 208
		-- upvalues: Config (copy), appendTrustedIndicator (copy), v55 (copy), v57 (copy)
		local v126 = p3[1]
		local v127 = p3[2]

		if string.len(v126) > 0 then
			if v127 then
				v126 = string.gsub(v126, ":(%S-)$", Config.VERIFIED_EMOJI .. ":%1")
			end

			local v128 = p3[3] or false
			local v129 = if p3[4] ~= nil then p3[4] else 1
			local v130 = p3[5]

			if v128 then
				v126 = appendTrustedIndicator(v126, v55.trustedLabelText, v129, v130.TextSize, v57)
			end
		end

		return v126
	end)
	local v65 = v64:map(trim)
	local v66 = t1.bodyTextProperties:map(function(p4) -- line: 237
		-- upvalues: isSpatialUIEnabled (copy), v54 (copy)
		if isSpatialUIEnabled then
			return v54
		end

		return p4.TextSize
	end)
	local t3 = {
		v64,
		t1.shouldShowTranslationToggle,
		t1.originalBodyText,
		t1.prefixTextProperties
	}

	if FFlagExpChatRewriteInline and FFlagEnableInExpChatRewrite then
		table.insert(t3, t1.wasRewritten)
		table.insert(t3, t1.isRewriteWindowOpen)
	end

	local u68 = nil

	if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 then
		u68 = #t3 + 1
		table.insert(t3, t1.chatActionType)
	end

	local u69 = nil

	if FFlagExpChatPolishSummaryMessageUI then
		u69 = #t3 + 1
		table.insert(t3, v66)
	end

	local v70 = React.joinBindings(t3):map(function(p5) -- line: 262
		-- upvalues: FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 (copy), u68 (ref), TextChatMessageChatActionType (copy), FFlagExpChatPolishSummaryMessageUI (copy), u69 (ref), summaryMessageRichText (copy), v57 (copy), duplicateInvisibleText (copy), FFlagExpChatRewriteInline (copy), FFlagEnableInExpChatRewrite (copy), Foundation (copy), u56 (ref)
		local v133 = p5[1]
		local v134 = p5[2]
		local v135 = p5[3]
		local v136 = p5[4]

		if FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2 and p5[u68] == TextChatMessageChatActionType.Summary then
			local v137 = nil

			if FFlagExpChatPolishSummaryMessageUI then
				v137 = p5[u69]
			end

			v135 = summaryMessageRichText.wrapInSummaryMutedStyle(summaryMessageRichText.getSummaryIconPrefix(v137) .. " " .. v135, v57.Color.Content.Muted.Color3:ToHex(), v137)
		end

		if string.len(v133) > 0 then
			if v134 then
				v135 = "     " .. v135
			end

			v135 = duplicateInvisibleText(v133, v136.FontFace, v136.TextSize) .. " " .. v135
		end

		if FFlagExpChatRewriteInline and FFlagEnableInExpChatRewrite then
			local v138 = p5[5]
			local v139 = p5[6]

			if v138 then
				local v140 = if not v139 then Foundation.Enums.IconName.ChevronLargeDown else Foundation.Enums.IconName.ChevronLargeUp

				v135 = `{ v135 } <font size='{ v136.TextSize - 4 }' color='#{ v57.Color.Content.Muted.Color3:ToHex() }'>{ `({ u56 })` }<font transparency='1'><stroke transparency='1'>_</stroke></font>{ `<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{ v140 }</font>` }</font>`
			end
		end

		return v135
	end)
	local v71 = v66:map(function(p6) -- line: 315
		return UDim2.new(0, p6 - 2, 0, p6 - 2)
	end)
	local v72 = t1.originalPrefixText:map(function(p7) -- line: 318
		return string.len(p7) > 0
	end)
	local s4 = "UIGradient"
	local v74 = t1.prefixTextProperties:map(function(p8) -- line: 60
		-- upvalues: s4 (copy)
		if p8 then
			return p8[s4]
		end

		return nil
	end)
	local v75 = nil
	local v76 = nil

	if FFlagEnableInExpChatRewrite then
		local wasRewritten = t1.wasRewritten

		v75 = wasRewritten:map(function(p9) -- line: 328
			-- upvalues: FFlagExpChatRewriteInline (copy)
			return p9 and not FFlagExpChatRewriteInline
		end)

		if FFlagExpChatRewriteInline then
			local chatWindowTransparencyBindable = t1.chatWindowTransparencyBindable

			if chatWindowTransparencyBindable == nil then
				v76 = wasRewritten
			elseif typeof(chatWindowTransparencyBindable) == "number" then
				local v79 = chatWindowTransparencyBindable < FIntExpChatWindowTransparencyRewriteInteractableThreshold

				v76 = wasRewritten:map(function(p10) -- line: 339
					-- upvalues: v79 (copy)
					return p10 and v79
				end)
			else
				v76 = React.joinBindings({
					wasRewritten,
					chatWindowTransparencyBindable
				}):map(function(p11) -- line: 346
					-- upvalues: FIntExpChatWindowTransparencyRewriteInteractableThreshold (copy)
					return p11[1] and p11[2] < FIntExpChatWindowTransparencyRewriteInteractableThreshold
				end)
			end
		end
	end

	local v80 = if not FFlagExpChatEnableFocusNavigation then nil else useCursor()
	local createElement = React.createElement
	local t4 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = t1.layoutOrder,
		Visible = t1.visible
	}
	local t5 = {
		UIPadding = React.createElement("UIPadding", {
			PaddingRight = t1.arButtonPadding
		}),
		ColumnLayout = if not FFlagEnableInExpChatRewrite or FFlagExpChatRewriteInline then nil else React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement2 = React.createElement
	local t6 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = if not FFlagEnableInExpChatRewrite then nil else 1
	}
	local t7 = {}
	local createElement3 = React.createElement
	local t8 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local s5 = "FontFace"

	t8.FontFace = t1.prefixTextProperties:map(function(p12) -- line: 60
		-- upvalues: s5 (copy)
		if p12 then
			return p12[s5]
		end

		return nil
	end)
	t8.RichText = true
	t8.Text = v64

	local s6 = "TextColor3"

	t8.TextColor3 = t1.prefixTextProperties:map(function(p13) -- line: 60
		-- upvalues: s6 (copy)
		if p13 then
			return p13[s6]
		end

		return nil
	end)

	local s7 = "TextSize"

	t8.TextSize = t1.prefixTextProperties:map(function(p14) -- line: 60
		-- upvalues: s7 (copy)
		if p14 then
			return p14[s7]
		end

		return nil
	end)

	local s8 = "TextStrokeColor3"

	t8.TextStrokeColor3 = t1.prefixTextProperties:map(function(p15) -- line: 60
		-- upvalues: s8 (copy)
		if p15 then
			return p15[s8]
		end

		return nil
	end)

	local s9 = "TextStrokeTransparency"

	t8.TextStrokeTransparency = mergeBindableScalar(t1.prefixTextProperties:map(function(p16) -- line: 60
		-- upvalues: s9 (copy)
		if p16 then
			return p16[s9]
		end

		return nil
	end), t1.textTransparency)
	t8.TextTransparency = mergeBindableScalar(0, t1.textTransparency)
	t8.TextWrapped = true
	t8.TextXAlignment = Enum.TextXAlignment.Left
	t8.TextYAlignment = Enum.TextYAlignment.Top
	t8.Visible = v72

	local t9 = {}
	local createElement4 = React.createElement
	local t10 = {}
	local s10 = "Enabled"

	t10.Enabled = v74:map(function(p17) -- line: 60
		-- upvalues: s10 (copy)
		if p17 then
			return p17[s10]
		end

		return nil
	end)

	local s11 = "Color"

	t10.Color = v74:map(function(p18) -- line: 60
		-- upvalues: s11 (copy)
		if p18 then
			return p18[s11]
		end

		return nil
	end)

	local s12 = "Offset"

	t10.Offset = v74:map(function(p19) -- line: 60
		-- upvalues: s12 (copy)
		if p19 then
			return p19[s12]
		end

		return nil
	end)

	local s13 = "Rotation"

	t10.Rotation = v74:map(function(p20) -- line: 60
		-- upvalues: s13 (copy)
		if p20 then
			return p20[s13]
		end

		return nil
	end)

	local s14 = "Transparency"

	t10.Transparency = v74:map(function(p21) -- line: 60
		-- upvalues: s14 (copy)
		if p21 then
			return p21[s14]
		end

		return nil
	end)
	t9.UIGradient = createElement4("UIGradient", t10)
	t7.PrefixText = createElement3("TextLabel", t8, t9)

	local createElement5 = React.createElement
	local v103 = (not FFlagExpChatRewriteInline or not FFlagEnableInExpChatRewrite) and "TextLabel" or "TextButton"
	local t11 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local s15 = "FontFace"

	t11.FontFace = t1.bodyTextProperties:map(function(p22) -- line: 60
		-- upvalues: s15 (copy)
		if p22 then
			return p22[s15]
		end

		return nil
	end)
	t11.RichText = true
	t11.Size = UDim2.new(1, 0, 0, 0)
	t11.Text = v70

	local s16 = "TextColor3"

	t11.TextColor3 = t1.bodyTextProperties:map(function(p23) -- line: 60
		-- upvalues: s16 (copy)
		if p23 then
			return p23[s16]
		end

		return nil
	end)
	t11.TextSize = v66

	local s17 = "TextStrokeColor3"

	t11.TextStrokeColor3 = t1.bodyTextProperties:map(function(p24) -- line: 60
		-- upvalues: s17 (copy)
		if p24 then
			return p24[s17]
		end

		return nil
	end)

	local s18 = "TextStrokeTransparency"

	t11.TextStrokeTransparency = mergeBindableScalar(t1.bodyTextProperties:map(function(p25) -- line: 60
		-- upvalues: s18 (copy)
		if p25 then
			return p25[s18]
		end

		return nil
	end), t1.textTransparency)
	t11.TextTransparency = mergeBindableScalar(0, t1.textTransparency)
	t11.TextWrapped = true
	t11.TextXAlignment = Enum.TextXAlignment.Left
	t11.TextYAlignment = Enum.TextYAlignment.Top
	t11[React.Change.Text] = if not v24 then nil else v59
	t11[React.Event.Activated] = if not FFlagExpChatRewriteInline or not FFlagEnableInExpChatRewrite then nil else v62
	t11.Interactable = if not FFlagExpChatRewriteInline or not FFlagEnableInExpChatRewrite then nil else v76
	t7.BodyText = createElement5(v103, t11)

	local createElement6 = React.createElement
	local t12 = {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		Visible = v72
	}
	local t13 = {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})
	}
	local createElement7 = React.createElement
	local t14 = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1
	}
	local s19 = "FontFace"

	t14.FontFace = t1.prefixTextProperties:map(function(p26) -- line: 60
		-- upvalues: s19 (copy)
		if p26 then
			return p26[s19]
		end

		return nil
	end)
	t14.RichText = true
	t14.SelectionImageObject = v80
	t14.Size = UDim2.new(0, 0, 0, 0)
	t14.Text = v65

	local s20 = "TextSize"

	t14.TextSize = t1.prefixTextProperties:map(function(p27) -- line: 60
		-- upvalues: s20 (copy)
		if p27 then
			return p27[s20]
		end

		return nil
	end)
	t14.TextStrokeTransparency = 1
	t14.TextTransparency = 1
	t14.TextWrapped = true
	t14.TextXAlignment = Enum.TextXAlignment.Left
	t14.TextYAlignment = Enum.TextYAlignment.Top
	t14.LayoutOrder = 1
	t14[React.Event.Activated] = v60
	t13.TextButton = createElement7("TextButton", t14)
	t13.TranslationButton = React.createElement("ImageButton", {
		BackgroundTransparency = 1,
		HoverImage = "rbxasset://textures/translateIconDark.png",
		Image = "rbxasset://textures/translateIcon.png",
		ImageTransparency = mergeBindableScalar(0, t1.textTransparency),
		LayoutOrder = 2,
		PressedImage = "rbxasset://textures/translateIconDark.png",
		SelectionImageObject = v80,
		Size = v71,
		Visible = t1.shouldShowTranslationToggle,
		[React.Event.Activated] = v61
	})
	t7.TextMessageButton = createElement6("Frame", t12, t13)
	t5.TextMessage = createElement2("Frame", t6, t7)
	t5.RewriteToggle = if not FFlagEnableInExpChatRewrite or FFlagExpChatRewriteInline then nil else React.createElement(RewriteToggle, {
		isRewriteMenuOpen = t1.isRewriteWindowOpen,
		textTransparency = t1.textTransparency,
		onActivated = v62,
		LayoutOrder = 2,
		Visible = v75
	})

	local v116 = createElement("Frame", t4, t5)

	if FFlagDebugMessageProfiling then
		debug.profileend()
	end

	return v116
end)
