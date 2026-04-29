local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local React = require(ExpChatParent.React)
local SignalsReact = require(ExpChatParent.SignalsReact)
local useSelector = require(ExpChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local Foundation = require(ExpChatParent.Foundation)
local Coachmark = Foundation.Coachmark
local PopoverSide = Foundation.Enums.PopoverSide
local PopoverAlign = Foundation.Enums.PopoverAlign
local Localization = require(ExpChat.Localization)
local Config = require(ExpChat.Config)
local isUserChatEnabled = require(ExpChat.isUserChatEnabled)
local GetTransparencyStore = require(ExpChat.Stores.GetTransparencyStore)
local GetGlobalChatTooltipStore = require(ExpChat.Stores.GetGlobalChatTooltipStore)
local MinTabWidth = Config.ChannelTabsSettings.MinTabWidth
local DropdownIconContainerWidth = Config.ChannelTabsSettings.DropdownIconContainerWidth

return function(t1: {[any]: any}) --[[ GlobalChatTooltip ]] -- line: 34
	-- upvalues: GetGlobalChatTooltipStore (copy), GetTransparencyStore (copy), SignalsReact (copy), useSelector (copy), React (copy), MinTabWidth (copy), DropdownIconContainerWidth (copy), isUserChatEnabled (copy), Config (copy), Localization (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local v18 = GetGlobalChatTooltipStore(false)
	local v19 = GetTransparencyStore(false)
	local v20 = SignalsReact.useSignalState(v18.getShouldShowGlobalChatTooltip)
	local v21 = SignalsReact.useSignalState(v18.getIsScreenWideEnough)
	local v22 = v19.getIsFocused or v19.getIsTextBoxFocused
	local v23 = SignalsReact.useSignalState(v19.getLastActivity)
	local v24 = SignalsReact.useSignalState(v22)
	local v25 = useSelector(function(p1) -- line: 44
		local v46 = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs

		if v46 == nil then
			return 0
		end

		local n1 = 0

		for _ in v46 do
			n1 += 1
		end

		return n1
	end)
	local v26, v27 = React.useState(0)
	local v28 = v26 > 0 and v26 < v25 * MinTabWidth
	local n2

	if v25 < 2 then
		n2 = 1
	elseif not v28 then
		n2 = 2 / v25
	else
		local v30 = v26 - DropdownIconContainerWidth
		local v31 = math.floor(v30 / MinTabWidth)

		n2 = not (v31 >= 2) and 1 or 2 * v30 / (v31 * v26)
	end

	local v32 = useSelector(function(p2) -- line: 92
		local v50 = p2.ChatLayout and p2.ChatLayout.Alignment

		return v50 ~= nil and (v50.AnchorPoint.X == 0 and v50.AnchorPoint.Y == 0)
	end)
	local v33 = t1.chatStatus == nil or isUserChatEnabled(t1.chatStatus)
	local v34, v35 = React.useState(true)
	local v36, v37 = React.useState(false)
	local v38 = React.useRef(false)
	local v39 = React.useRef(0)
	local v40 = React.useRef(t1.targetTextChannel)
	local v41 = React.useCallback(function() -- line: 106
		-- upvalues: v38 (copy), v18 (copy)
		if not v38.current then
			v38.current = true
			v18.reportImpression()
		end

		v18.setIsGlobalChatTooltipDismissed(true)
	end, {
		v18.setIsGlobalChatTooltipDismissed,
		v18.reportImpression
	})

	React.useEffect(function() -- line: 114
		-- upvalues: v18 (copy), t1 (copy)
		v18.setIsChatWindowOpen(t1.visible)

		return function() -- line: 116
			-- upvalues: v18 (copy)
			v18.setIsChatWindowOpen(false)
		end
	end, { t1.visible })
	React.useEffect(function() -- line: 121
		-- upvalues: v24 (copy), v35 (copy), Config (copy), v23 (copy)
		if v24 then
			v35(true)

			return nil
		end

		local v51 = Config.ChatWindowBackgroundFadeOutTime - (os.clock() - v23)

		if v51 <= 0 then
			v35(false)

			return nil
		end

		v35(true)

		local thread = task.delay(v51, function() -- line: 135
			-- upvalues: v35 (copy)
			v35(false)
		end)

		return function() -- line: 138
			-- upvalues: thread (copy)
			task.cancel(thread)
		end
	end, {
		v23,
		v24
	})
	React.useEffect(function() -- line: 144
		-- upvalues: v34 (copy), v21 (copy), v36 (copy), v20 (copy), v33 (copy), v39 (copy), v37 (copy)
		if not v34 or not v21 or (v36 or not v20 or not v33) then
			return nil
		end

		local elapsed = os.clock()
		local v54 = math.max(0, 10 - v39.current)
		local thread = task.delay(v54, function() -- line: 151
			-- upvalues: v37 (copy)
			v37(true)
		end)

		return function() -- line: 154
			-- upvalues: v39 (copy), elapsed (copy), thread (copy)
			local v60 = v39

			v60.current = v60.current + (os.clock() - elapsed)
			task.cancel(thread)
		end
	end, {
		v34,
		v21,
		v36,
		v20,
		v33
	})
	React.useEffect(function() -- line: 161
		-- upvalues: v36 (copy), v41 (copy)
		if not v36 then
			return nil
		end

		local thread = task.delay(1, function() -- line: 165
			-- upvalues: v41 (copy)
			v41()
		end)

		return function() -- line: 168
			-- upvalues: thread (copy)
			task.cancel(thread)
		end
	end, {
		v36,
		v41
	})
	React.useEffect(function() -- line: 174
		-- upvalues: v40 (copy), t1 (copy), v20 (copy), v33 (copy), v36 (copy), v37 (copy)
		local current = v40.current

		v40.current = t1.targetTextChannel

		if current and (current ~= t1.targetTextChannel and v20 and v33 and not v36) then
			v37(true)
		end
	end, {
		t1.targetTextChannel,
		v20,
		v33,
		v36
	})

	local v42 = Localization.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})

	if not t1.visible or not v20 or not v32 then
		return nil
	end

	local v43 = v34 and (v21 and not v36)

	local function onAnchorChanged(p3) -- line: 195
		-- upvalues: v27 (copy)
		local p3Parent = p3.Parent

		if p3Parent and p3Parent:IsA("GuiObject") then
			v27(p3Parent.AbsoluteSize.X)
		end
	end

	return React.createElement(Coachmark, {
		title = v42.headerText,
		text = v42.bodyText,
		isOpen = v43,
		onClose = v41,
		side = PopoverSide.Right,
		align = PopoverAlign.Start,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(n2, -13, 0, -48),
		onAbsoluteSizeChanged = onAnchorChanged,
		onAbsolutePositionChanged = onAnchorChanged
	}, {
		AnchorSizer = React.createElement("Frame", {
			Size = UDim2.new(0, 1, 0, Config.ChannelTabsSettings.HorizontalBarHeight),
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		})
	})
end
