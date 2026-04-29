local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local React = require(ExpChatParent.React)
local VirtualizedList = require(ExpChatParent.VirtualizedList)
local useStyle = require(ExpChatParent.UIBlox).Core.Style.useStyle
local debounce = require(ExpChat.ChatWindow.Helpers.debounce)
local FFlagExpChatEnableFocusNavigation = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatEnableV2ChatWindow = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local getFFlagExpChatSendWindowScrollEvent = require(ExpChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local FFlagEnableInExpChatRewrite = require(ExpChat.Flags.FFlagEnableInExpChatRewrite)
local v12 = game:DefineFastInt("ExpChatWindowScrollV2Debounce", 0)
local v13 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)

require(ExpChatParent.SocialLuaAnalytics)

local FFlagExpChatScrollPerfTracking = require(ExpChat.Flags.FFlagExpChatScrollPerfTracking)
local v16 = debounce(function() -- line: 45
	-- upvalues: TextChatService (copy)
	TextChatService:SendExpChatWindowScroll()
end, v12)

return (React.memo(function(p1) --[[ BottomLockedScrollViewV2 ]] -- line: 49
	-- upvalues: useStyle (copy), React (copy), FFlagExpChatScrollPerfTracking (copy), FFlagEnableInExpChatRewrite (copy), FFlagExpChatEnableV2ChatWindow (copy), VirtualizedList (copy), FFlagExpChatEnableFocusNavigation (copy), ExpChatPerfTracker (copy), v13 (copy), getFFlagExpChatSendWindowScrollEvent (copy), v16 (copy)
	local Theme = useStyle().Theme
	local v26 = React.useRef(nil)
	local v27 = React.useRef(nil)
	local v28, v29 = React.useState(true)
	local v30, v31 = React.useState(false)
	local v32, v33 = React.useState(false)
	local v34, v35 = React.useState(nil)
	local u36 = nil

	if FFlagExpChatScrollPerfTracking then
		u36 = React.useRef(nil)
		React.useEffect(function() -- line: 62
			-- upvalues: u36 (ref)
			return function() -- line: 63
				-- upvalues: u36 (ref)
				if u36.current then
					u36.current.cleanup()
				end
			end
		end, {})
	end

	React.useEffect(function() -- line: 71
		-- upvalues: v27 (copy), v26 (copy)
		if v27.current then
			local ScrollingFrame = v27.current:FindFirstChildWhichIsA("ScrollingFrame", true)

			if ScrollingFrame then
				v26.current = ScrollingFrame
			end
		end
	end, { v27 })

	if FFlagEnableInExpChatRewrite and not FFlagExpChatEnableV2ChatWindow then
		React.useEffect(function() -- line: 81
			-- upvalues: v26 (copy), v28 (copy), v32 (copy)
			local current = v26.current

			if not current then
				return
			end

			local connection = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() -- line: 87
				-- upvalues: v28 (copy), v32 (copy), v26 (copy)
				if v28 and (not v32 and v26.current) then
					v26.current.CanvasPosition = Vector2.new(0, 9.223372036854776E+18)
				end
			end)

			return function() -- line: 93
				-- upvalues: connection (copy)
				connection:Disconnect()
			end
		end, {
			tostring(v26),
			v28,
			v32
		})
	end

	React.useEffect(function() -- line: 100
		-- upvalues: v28 (copy), v32 (copy), v26 (copy)
		if v28 and (v32 == false and v26.current) then
			v26.current.CanvasPosition = Vector2.new(0, 9.223372036854776E+18)
		end
	end, {
		if not FFlagExpChatEnableV2ChatWindow then tostring(p1.messages) else nil,
		v28,
		v32,
		tostring(v26),
		p1.targetTextChannel
	})
	React.useEffect(function() -- line: 114
		-- upvalues: p1 (copy), v34 (copy), v35 (copy), v29 (copy)
		if p1.targetTextChannel and p1.targetTextChannel ~= v34 then
			v35(p1.targetTextChannel)

			if p1.isChannelBarVisible then
				v29(true)
			end
		end
	end, { p1.targetTextChannel })

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size,
		ref = v27,
		[React.Event.InputBegan] = function(_, p3) -- line: 128
			-- upvalues: v31 (copy), v33 (copy)
			if p3.UserInputType == Enum.UserInputType.MouseMovement or p3.UserInputType == Enum.UserInputType.Touch then
				v31(true)
			end

			if p3.UserInputType == Enum.UserInputType.Touch then
				v33(true)
			end
		end,
		[React.Event.InputEnded] = function(_, p5) -- line: 137
			-- upvalues: v31 (copy), v33 (copy)
			if p5.UserInputType == Enum.UserInputType.MouseMovement or p5.UserInputType == Enum.UserInputType.Touch then
				v31(false)
			end

			if p5.UserInputType == Enum.UserInputType.Touch then
				v33(false)
			end
		end
	}, {
		padding = React.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = React.createElement(VirtualizedList.ScrollView, {
			style = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarImageColor3 = Theme.UIEmphasis.Color,
				ScrollBarImageTransparency = not v30 and 1 or 0,
				ScrollBarThickness = 8,
				Selectable = not FFlagExpChatEnableFocusNavigation and nil
			},
			contentContainerStyle = {
				BackgroundTransparency = 1
			},
			Size = UDim2.fromScale(1, 1),
			onScroll = function(p6) --[[ onScroll ]] -- line: 166
				-- upvalues: FFlagExpChatScrollPerfTracking (copy), u36 (ref), ExpChatPerfTracker (copy), v13 (copy), v29 (copy), getFFlagExpChatSendWindowScrollEvent (copy), v16 (copy)
				if FFlagExpChatScrollPerfTracking then
					if u36.current == nil then
						u36.current = ExpChatPerfTracker.startChatWindowScrollInterval(ExpChatPerfTracker.Events.ChatWindowScrollInterval, p6, {})
					end

					if u36.current then
						u36.current.onScrollTick()
					end
				end

				local AbsoluteWindowSize = p6.AbsoluteWindowSize
				local CanvasPosition = p6.CanvasPosition
				local AbsoluteCanvasSize = p6.AbsoluteCanvasSize
				local v48 = AbsoluteCanvasSize - AbsoluteWindowSize
				local v49 = CanvasPosition.Y / v48.Y
				local v50 = AbsoluteCanvasSize.Y <= AbsoluteWindowSize.Y or v49 >= v13

				v29(v50)

				if getFFlagExpChatSendWindowScrollEvent() and not v50 then
					v16()
				end
			end
		}, p1.children)
	})
end))
