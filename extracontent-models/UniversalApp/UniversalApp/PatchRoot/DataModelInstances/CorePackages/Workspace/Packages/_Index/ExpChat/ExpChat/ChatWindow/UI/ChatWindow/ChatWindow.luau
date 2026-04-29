local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local React = require(ExpChatParent.React)
local SignalsReact = require(ExpChatParent.SignalsReact)
local Dictionary = require(ExpChatParent.llama).Dictionary
local List = require(ExpChatParent.llama).List
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local Config = require(ExpChat.Config)
local useInterpolatedClientSettings = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local GetChatStatusStore = require(ExpChat.Stores.GetChatStatusStore)
local GetMessagesStore = require(ExpChat.Stores.GetMessagesStore)
local GetGlobalChatTooltipStore = require(ExpChat.Stores.GetGlobalChatTooltipStore)
local UI = script:FindFirstAncestor("UI")
local ScrollingView = require(UI.ScrollingView)
local TranslatedTextMessage = require(UI.TranslatedTextMessage)
local TopBanner = require(UI.TopBanner)
local GlobalChatTooltip = require(UI.GlobalChatTooltip)
local isChatRegionLocked = require(ExpChat.isChatRegionLocked)
local showChatEnabledUI = require(ExpChat.showChatEnabledUI)
local useUserExperiment = require(ExpChatParent.RoactAppExperiment).useUserExperiment
local v22 = require(ExpChatParent.UserProfiles).Stores.VerifiedBadgeDisplayStore.get()
local FStringReportingIXPLayer = require(ExpChatParent.SharedFlags).FStringReportingIXPLayer
local GetFFlagEnableChatLineReporting = require(ExpChatParent.SharedFlags).GetFFlagEnableChatLineReporting
local GetFFlagMemoizeChatReportingMenu = require(ExpChatParent.SharedFlags).GetFFlagMemoizeChatReportingMenu
local getFFlagChatWindowUseCallbackOptimizations = require(ExpChat.Flags.getFFlagChatWindowUseCallbackOptimizations)
local FFlagExpChatEnableV2ChatWindow = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagAEGIS2EnableGatesForExpChat = require(ExpChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local FFlagEnableVerifiedBadgeStore = require(ExpChatParent.SharedFlags).FFlagEnableVerifiedBadgeStore
local EngineFeature = game:GetEngineFeature("EnableInExpChatRewrite")
local FFlagExpChatEnableNewBottomLockedScrollView = require(ExpChat.Flags.FFlagExpChatEnableNewBottomLockedScrollView)
local FFlagExpChatPerfTracking = require(ExpChatParent.SharedFlags).FFlagExpChatPerfTracking
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)
local FFlagExpChatRewriteInline = require(ExpChat.Flags.FFlagExpChatRewriteInline)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local v36 = game:DefineFastFlag("ExpChatShowGlobalChatTooltip", false)
local t1 = {
	LayoutOrder = 1,
	size = UDim2.fromScale(1, 1),
	messages = if not FFlagExpChatEnableV2ChatWindow then {} else nil,
	transparencyValue = if not GetFFlagMemoizeChatReportingMenu() then Config.ChatWindowBackgroundTransparency else React.createBinding(Config.ChatWindowBackgroundTransparency),
	textTransparency = React.createBinding(0),
	mutedUserIds = {},
	verifiedUserIds = {},
	showTranslationButton = false
}

return (React.memo(function(p1) -- line: 62
	-- upvalues: Dictionary (copy), t1 (copy), useInterpolatedClientSettings (copy), FFlagAEGIS2EnableGatesForExpChat (copy), GetChatStatusStore (copy), SignalsReact (copy), showChatEnabledUI (copy), v36 (copy), GetGlobalChatTooltipStore (copy), GetFFlagMemoizeChatReportingMenu (copy), FFlagExpChatEnableV2ChatWindow (copy), React (copy), GetMessagesStore (copy), List (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), GetFFlagEnableChatLineReporting (copy), useUserExperiment (copy), FStringReportingIXPLayer (copy), getFFlagChatWindowUseCallbackOptimizations (copy), FFlagEnableVerifiedBadgeStore (copy), v22 (copy), TranslatedTextMessage (copy), EngineFeature (copy), FFlagExpChatRewriteInline (copy), FFlagExpChatEnableNewBottomLockedScrollView (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), TextChatService (copy), Config (copy), isChatRegionLocked (copy), TopBanner (copy), ScrollingView (copy), GlobalChatTooltip (copy)
	local v39 = Dictionary.join(t1, p1)
	local chatWindowSettings = v39.chatWindowSettings
	local BackgroundTransparency = useInterpolatedClientSettings(chatWindowSettings).BackgroundTransparency
	local BackgroundColor3 = useInterpolatedClientSettings(chatWindowSettings).BackgroundColor3
	local v43 = nil
	local v44 = true

	if FFlagAEGIS2EnableGatesForExpChat then
		local v45 = GetChatStatusStore(false)

		v43 = SignalsReact.useSignalState(v45.getChatStatus)
		v44 = showChatEnabledUI(v43)
	end

	local v46 = false

	if v36 then
		local v47 = GetGlobalChatTooltipStore(false)

		v46 = SignalsReact.useSignalState(v47.getIsGlobalChatTooltipEligible)
	end

	local v48 = nil
	local u49 = nil

	if GetFFlagMemoizeChatReportingMenu() and not FFlagExpChatEnableV2ChatWindow then
		u49 = React.useRef(if not FFlagExpChatEnableV2ChatWindow then v39.messages else nil)
		React.useEffect(function() -- line: 87
			-- upvalues: u49 (ref), FFlagExpChatEnableV2ChatWindow (copy), v39 (copy)
			u49.current = if not FFlagExpChatEnableV2ChatWindow then v39.messages else nil
		end, { if not FFlagExpChatEnableV2ChatWindow then v39.messages else nil })
		v48 = React.useCallback(function() -- line: 91
			-- upvalues: u49 (ref)
			return u49.current
		end, {})
	end

	if FFlagExpChatEnableV2ChatWindow then
		v48 = React.useCallback(function() -- line: 97
			-- upvalues: GetMessagesStore (copy), v39 (copy), List (copy), GetFFlagTextChatEnableUniverseChatTabs (copy)
			local v56 = GetMessagesStore(false)
			local t2 = {
				windowMessagesInOrderByTabId = v56.getWindowMessagesInOrderByTabId(false),
				byMessageId = v56.getByMessageId(false),
				windowMessagesInOrder = v56.getWindowMessagesInOrder(false)
			}

			if not v39.isChannelBarVisible then
				return List.map(t2.windowMessagesInOrder, function(p2) -- line: 106
					-- upvalues: t2 (copy)
					return t2.byMessageId[p2]
				end)
			end

			if GetFFlagTextChatEnableUniverseChatTabs() then
				local selectedChannelName = v39.selectedChannelName

				if v39.targetTextChannel and t2.windowMessagesInOrderByTabId[v39.targetTextChannel.Name] then
					selectedChannelName = v39.targetTextChannel.Name
				end

				if selectedChannelName then
					return List.map(t2.windowMessagesInOrderByTabId[selectedChannelName] or {}, function(p3) -- line: 121
						-- upvalues: t2 (copy)
						return t2.byMessageId[p3]
					end)
				end

				return {}
			end

			if v39.targetTextChannel then
				return List.map(t2.windowMessagesInOrderByTabId[v39.targetTextChannel.Name] or {}, function(p4) -- line: 129
					-- upvalues: t2 (copy)
					return t2.byMessageId[p4]
				end)
			end

			return {}
		end, {
			v39.isChannelBarVisible,
			v39.targetTextChannel,
			if not GetFFlagTextChatEnableUniverseChatTabs() then nil else v39.selectedChannelName
		})
	end

	local v50 = not not GetFFlagEnableChatLineReporting() and useUserExperiment({ FStringReportingIXPLayer }, function(p5) -- line: 147
		-- upvalues: FStringReportingIXPLayer (copy)
		return (p5[FStringReportingIXPLayer] or {}).EnableChatLineReporting
	end)
	local v51 = React.useCallback(function(p6, p7) -- line: 153
		-- upvalues: v39 (copy)
		if type(p7) == "number" then
			return v39.transparencyValue
		end

		return p7:map(function(n1: number) -- line: 158
			-- upvalues: p6 (copy)
			return p6 + n1 * (1 - p6)
		end)
	end, if not getFFlagChatWindowUseCallbackOptimizations() then nil else { v39.transparencyValue })
	local v52 = React.useCallback(function(p8) -- line: 164
		-- upvalues: v39 (copy)
		v39.resetTargetChannel()

		local num = tonumber(p8.userId)

		if num then
			v39.activateWhisperMode(num)
		end
	end, if not getFFlagChatWindowUseCallbackOptimizations() then nil else {
		v39.resetTargetChannel,
		v39.activateWhisperMode
	})
	local v53 = if not FFlagExpChatEnableV2ChatWindow then React.useCallback(function(p9) -- line: 180
		-- upvalues: Dictionary (copy), FFlagEnableVerifiedBadgeStore (copy), v22 (copy), v39 (copy), React (copy), TranslatedTextMessage (copy), EngineFeature (copy), v52 (copy), FFlagExpChatRewriteInline (copy), FFlagExpChatEnableNewBottomLockedScrollView (copy)
		local v65 = Dictionary.map(p9, function(p10, p11) -- line: 181
			-- upvalues: FFlagEnableVerifiedBadgeStore (copy), v22 (copy), Dictionary (copy), v39 (copy), React (copy), TranslatedTextMessage (copy), EngineFeature (copy), v52 (copy), FFlagExpChatRewriteInline (copy)
			if p10.isVisibleInChatWindow then
				local v80 = if not FFlagEnableVerifiedBadgeStore then not not p10.userId and Dictionary.has(v39.verifiedUserIds, p10.userId) else not not p10.userId and v22.isBadgeVisible((tonumber(p10.userId)))

				return React.createElement(TranslatedTextMessage, {
					message = p10,
					LayoutOrder = p11,
					isUserVerified = v80,
					textTransparency = v39.textTransparency,
					transparencyValue = if not EngineFeature then nil else v39.transparencyValue,
					onTextMessageLabelButtonActivated = v52,
					chatWindowSettings = v39.chatWindowSettings,
					showTranslationButton = v39.showTranslationButton,
					isSpatialUIEnabled = v39.isSpatialUIEnabled,
					onToggle = function() --[[ onToggle ]] -- line: 203
					end,
					chatWindowTransparencyBindable = if not FFlagExpChatRewriteInline then nil else v39.transparencyValue
				}), p10.messageId
			end

			return nil, nil
		end)

		v65["$layout"] = React.createElement("UIListLayout", {
			Padding = if not FFlagExpChatEnableNewBottomLockedScrollView then UDim.new(0, 4) else nil,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		return v65
	end, if not getFFlagChatWindowUseCallbackOptimizations() then nil else {
		v39.messages,
		v39.textTransparency,
		v39.verifiedUserIds,
		v39.chatWindowSettings,
		v39.showTranslationButton
	}) else nil

	if FFlagExpChatPerfTracking then
		local v54 = not v39.targetTextChannel and "UNKNOWN_TAB" or v39.targetTextChannel.Name

		React.useEffect(function() -- line: 237
			-- upvalues: ExpChatPerfTracker (copy)
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowMountTTI, {})

			return function() -- line: 239
				-- upvalues: ExpChatPerfTracker (copy)
				ExpChatPerfTracker.cancelAll()
			end
		end, {})
		React.useEffect(function() -- line: 243
			-- upvalues: ExpChatPerfTracker (copy), v54 (copy)
			ExpChatPerfTracker.finish(ExpChatPerfTracker.Events.ChatWindowTabSwitchTTI, {
				tabId = v54
			})
		end, { v54 })
	end

	local t3 = {}

	if FFlagExpChatEnableV2ChatWindow then
		t3 = {
			showTranslationButton = v39.showTranslationButton,
			chatWindowSettings = v39.chatWindowSettings,
			textTransparency = v39.textTransparency,
			onTextMessageLabelButtonActivated = v52,
			isSpatialUIEnabled = v39.isSpatialUIEnabled,
			chatWindowTransparencyBindable = if not FFlagExpChatRewriteInline then nil else v39.transparencyValue,
			visible = v39.visible,
			selectedChannelName = if not GetFFlagTextChatEnableUniverseChatTabs() then nil else v39.selectedChannelName
		}
	end

	return React.createElement("Frame", {
		BackgroundColor3 = BackgroundColor3,
		BorderSizePixel = 0,
		LayoutOrder = v39.LayoutOrder,
		Size = v39.size,
		Visible = v39.visible,
		BackgroundTransparency = v51(BackgroundTransparency, v39.transparencyValue),
		[React.Event.MouseEnter] = v39.onHovered,
		[React.Event.MouseLeave] = v39.onUnhovered,
		[React.Change.AbsoluteSize] = not getFFlagChatWindowUseCallbackOptimizations() and function(p12) -- line: 280
			-- upvalues: TextChatService (copy), v39 (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

			if ChatWindowConfiguration and v39.onAbsoluteSizeChanged then
				v39.onAbsoluteSizeChanged(p12, ChatWindowConfiguration)
			end
		end or React.useCallback(function(p13) -- line: 274
			-- upvalues: TextChatService (copy), v39 (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

			if ChatWindowConfiguration and v39.onAbsoluteSizeChanged then
				v39.onAbsoluteSizeChanged(p13, ChatWindowConfiguration)
			end
		end, {
			TextChatService,
			v39.onAbsoluteSizeChanged
		}),
		[React.Change.AbsolutePosition] = not getFFlagChatWindowUseCallbackOptimizations() and function(p14) -- line: 293
			-- upvalues: TextChatService (copy), v39 (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

			if ChatWindowConfiguration and v39.onAbsoluteSizeChanged then
				v39.onAbsolutePositionChanged(p14, ChatWindowConfiguration)
			end
		end or React.useCallback(function(p15) -- line: 287
			-- upvalues: TextChatService (copy), v39 (copy)
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

			if ChatWindowConfiguration and v39.onAbsoluteSizeChanged then
				v39.onAbsolutePositionChanged(p15, ChatWindowConfiguration)
			end
		end, {
			TextChatService,
			v39.onAbsolutePositionChanged
		})
	}, {
		uiSizeConstraint = React.createElement("UISizeConstraint", {
			MaxSize = if not v39.isSpatialUIEnabled then Vector2.new(Config.ChatWindowMaxWidth, Config.ChatWindowMaxHeight) else Vector2.new(1e999, 400)
		}),
		TopBanner = if isChatRegionLocked() or (not v44 or not v50) then nil else React.createElement(TopBanner, {
			backgroundColor3 = BackgroundColor3,
			backgroundTransparency = BackgroundTransparency,
			iconTransparency = if not GetFFlagMemoizeChatReportingMenu() then v51(BackgroundTransparency, v39.transparencyValue) else v39.transparencyValue,
			onFocus = v39.onFocus,
			onUnfocus = v39.onUnfocus,
			getMessages = if not GetFFlagMemoizeChatReportingMenu() then nil else v48,
			messages = if GetFFlagMemoizeChatReportingMenu() then nil else v39.messages
		}),
		scrollingView = React.createElement(ScrollingView, Dictionary.join({
			size = v39.size,
			messages = if not FFlagExpChatEnableNewBottomLockedScrollView then v39.messages else nil,
			targetTextChannel = v39.targetTextChannel,
			isChannelBarVisible = v39.isChannelBarVisible
		}, t3), if not FFlagExpChatEnableV2ChatWindow then v53(v39.messages) else nil),
		GlobalChatTooltip = if not v36 or not v46 then nil else React.createElement(GlobalChatTooltip, {
			visible = v39.visible,
			targetTextChannel = v39.targetTextChannel,
			chatStatus = v43
		})
	})
end))
