local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local React = require(ExpChatParent.React)
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local GetMessagesStore = require(ExpChat.Stores.GetMessagesStore)
local useStyle = require(ExpChatParent.UIBlox).Core.Style.useStyle
local debounce = require(ExpChat.ChatWindow.Helpers.debounce)
local useV2MessagePool = require(script.Parent.useV2MessagePool)
local FFlagExpChatEnableFocusNavigation = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatEnableV2ChatWindow = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local getFFlagExpChatSendWindowScrollEvent = require(ExpChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local v14 = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)
local FFlagExpChatScrollPerfTracking = require(ExpChat.Flags.FFlagExpChatScrollPerfTracking)
local FFlagExpChatLimitScrollingV2Window = require(ExpChat.Flags.FFlagExpChatLimitScrollingV2Window)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)

require(ExpChatParent.SocialLuaAnalytics)

local v19 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100
local v20 = debounce(function() -- line: 65
	-- upvalues: TextChatService (copy)
	TextChatService:SendExpChatWindowScroll()
end, v14)

return React.memo(function(t1: {[any]: any}) --[[ BottomLockedScrollViewV3 ]] -- line: 72
	-- upvalues: useStyle (copy), React (copy), FFlagExpChatEnableV2ChatWindow (copy), GetMessagesStore (copy), useV2MessagePool (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), UserInputService (copy), FFlagExpChatScrollPerfTracking (copy), ExpChatPerfTracker (copy), v19 (copy), getFFlagExpChatSendWindowScrollEvent (copy), v20 (copy), FFlagExpChatLimitScrollingV2Window (copy), FFlagExpChatEnableFocusNavigation (copy)
	local Theme = useStyle().Theme
	local v30 = React.useRef(nil)
	local v31 = React.useRef(true)
	local v32, v33 = React.useBinding(false)
	local v34 = React.useRef(false)
	local v35 = FFlagExpChatEnableV2ChatWindow and t1.children == nil
	local v36 = React.useBinding(0)
	local v37 = t1.textTransparency or v36
	local v38 = GetMessagesStore(false)
	local children = useV2MessagePool({
		enabled = v35,
		visible = t1.visible,
		messagesStore = v38,
		textTransparency = v37,
		chatWindowSettings = t1.chatWindowSettings,
		isSpatialUIEnabled = t1.isSpatialUIEnabled,
		onTextMessageLabelButtonActivated = t1.onTextMessageLabelButtonActivated,
		targetTextChannel = t1.targetTextChannel,
		isChannelBarVisible = t1.isChannelBarVisible,
		showTranslationButton = t1.showTranslationButton,
		chatWindowTransparencyBindable = t1.chatWindowTransparencyBindable,
		selectedChannelName = if not GetFFlagTextChatEnableUniverseChatTabs() then nil else t1.selectedChannelName
	}).children
	local v40 = React.useCallback(function() -- line: 102
		-- upvalues: UserInputService (copy), v33 (copy), v34 (copy)
		local PreferredInput = UserInputService.PreferredInput

		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			v33(true)
		end

		if PreferredInput == Enum.PreferredInput.Touch then
			v34.current = true
		end
	end, { UserInputService.PreferredInput })
	local v41 = React.useCallback(function() -- line: 113
		-- upvalues: UserInputService (copy), v33 (copy), v34 (copy)
		local PreferredInput = UserInputService.PreferredInput

		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			v33(false)
		end

		if PreferredInput == Enum.PreferredInput.Touch then
			v34.current = false
		end
	end, { UserInputService.PreferredInput })
	local u42 = nil

	if FFlagExpChatScrollPerfTracking then
		u42 = React.useRef(nil)
		React.useEffect(function() -- line: 127
			-- upvalues: u42 (ref)
			return function() -- line: 128
				-- upvalues: u42 (ref)
				if u42.current then
					u42.current.cleanup()
				end
			end
		end, {})
	end

	local v43 = React.useCallback(function(p1) -- line: 136
		-- upvalues: FFlagExpChatScrollPerfTracking (copy), u42 (ref), ExpChatPerfTracker (copy), v31 (copy), v19 (copy), getFFlagExpChatSendWindowScrollEvent (copy), v20 (copy)
		if FFlagExpChatScrollPerfTracking then
			if u42.current == nil then
				u42.current = ExpChatPerfTracker.startChatWindowScrollInterval(ExpChatPerfTracker.Events.ChatWindowScrollInterval, p1, {})
			end

			if u42.current then
				u42.current.onScrollTick()
			end
		end

		local v47 = v31
		local AbsoluteWindowSize = p1.AbsoluteWindowSize
		local CanvasPosition = p1.CanvasPosition
		local AbsoluteCanvasSize = p1.AbsoluteCanvasSize
		local v51 = AbsoluteCanvasSize - AbsoluteWindowSize
		local v52 = CanvasPosition.Y / v51.Y

		v47.current = AbsoluteCanvasSize.Y <= AbsoluteWindowSize.Y or v52 >= v19

		if getFFlagExpChatSendWindowScrollEvent() and not v31.current then
			v20()
		end
	end, {})

	React.useEffect(function() -- line: 156
		-- upvalues: t1 (copy), v31 (copy), v34 (copy), v30 (copy)
		if t1.isChannelBarVisible and t1.targetTextChannel then
			v31.current = true

			if not v34.current and v30.current then
				v30.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, {
		t1.targetTextChannel,
		t1.isChannelBarVisible
	})
	React.useEffect(function() -- line: 167
		-- upvalues: v30 (copy), v31 (copy), v34 (copy)
		local current = v30.current

		if not current then
			return
		end

		local connection = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() -- line: 175
			-- upvalues: v31 (copy), v34 (copy), v30 (copy)
			if v31.current and (not v34.current and v30.current) then
				v30.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end)

		return function() -- line: 184
			-- upvalues: connection (copy)
			connection:Disconnect()
		end
	end, if not FFlagExpChatEnableV2ChatWindow then {
		tostring(v30),
		v31,
		v34
	} else {
		if not v35 then t1.children else nil,
		v31.current,
		v34.current,
		v30.current,
		t1.targetTextChannel
	})

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = t1.Size,
		[React.Event.InputBegan] = v40,
		[React.Event.InputEnded] = v41
	}, {
		padding = React.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = React.createElement("ScrollingFrame", {
			ref = v30,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = v32:map(function(p2) -- line: 220
				if p2 then
					return 0
				end

				return 1
			end),
			ScrollBarThickness = 8,
			ScrollingDirection = if not FFlagExpChatLimitScrollingV2Window then nil else Enum.ScrollingDirection.Y,
			Selectable = not FFlagExpChatEnableFocusNavigation and nil,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[React.Change.CanvasPosition] = v43
		}, if not v35 then t1.children else children)
	})
end)
