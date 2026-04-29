local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local React = require(CorePackages.Packages.React)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls
local FFlagExpChatShowGlobalChatTooltip = SharedFlags.FFlagExpChatShowGlobalChatTooltip
local ExpChat = require(CorePackages.Workspace.Packages.ExpChat)
local GetGlobalChatTooltipStore = ExpChat.Stores.GetGlobalChatTooltipStore
local GetChatStatusStore = ExpChat.Stores.GetChatStatusStore
local isUserChatEnabled = ExpChat.isUserChatEnabled
local GetFFlagTextChatEnableUniverseChatTabs = require(CorePackages.Workspace.Packages.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local Flags = require(script.Parent.Parent.Parent.Parent.Flags)
local FFlagUnibarMenuOpenHamburger = Flags.FFlagUnibarMenuOpenHamburger
local FFlagUnibarMenuOpenSubmenu = Flags.FFlagUnibarMenuOpenSubmenu
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local UIBlox = require(CorePackages.Packages.UIBlox)
local Foundation = require(CorePackages.Packages.Foundation)
local useCursor = Foundation.Hooks.useCursor
local Flags2 = Foundation.Utility.Flags
local StatusIndicator = Foundation.StatusIndicator
local StatusIndicatorVariant = Foundation.Enums.StatusIndicatorVariant
local Interactable = UIBlox.Core.Control.Interactable
local ControlState = UIBlox.Core.Control.Enum.ControlState
local useStyle = UIBlox.Core.Style.useStyle
local withTooltip = UIBlox.App.Dialog.TooltipV2.withTooltip
local Constants = require(ChromeShared.Unibar.Constants)
local Service = require(ChromeShared.Service)
local ChromeAnalytics = require(ChromeShared.Analytics.ChromeAnalytics)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local useObservableValue = require(ChromeShared.Hooks.useObservableValue)
local useNotificationCount = require(ChromeShared.Hooks.useNotificationCount)
local useMappedObservableValue = require(ChromeShared.Hooks.useMappedObservableValue)
local useMappedObservableValueBinding = require(ChromeShared.Hooks.useMappedObservableValueBinding)
local useTimeHysteresis = require(ChromeShared.Hooks.useTimeHysteresis)
local useTokens = Foundation.Hooks.useTokens
local shouldRejectMultiTouch = require(ChromeShared.Utility.shouldRejectMultiTouch)
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = nil
local Panel3DInSpatialUI = nil
local PanelType = nil
local TooltipOrientation = nil
local TooltipCallout = nil
local SPATIAL_TOOLTIP_SPACING = nil
local u48 = nil

if isInExperienceUIVREnabled then
	isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial

	local VrSpatialUi = require(CorePackages.Workspace.Packages.VrSpatialUi)

	Panel3DInSpatialUI = VrSpatialUi.Panel3DInSpatialUI
	PanelType = VrSpatialUi.Constants.PanelType
	TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
	TooltipCallout = UIBlox.App.Dialog.TooltipCallout
	SPATIAL_TOOLTIP_SPACING = VrSpatialUi.Constants.SPATIAL_TOOLTIP_SPACING

	local UIManager = VrSpatialUi.UIManager
	local MappedSignal = require(ChromeShared.Service.ChromeUtils).MappedSignal
	local v52 = UIManager.getInstance():getBottomBarVisibility()

	if v52 and isSpatial() then
		u48 = MappedSignal.new(v52, function() -- line: 82
			-- upvalues: v52 (copy)
			return v52:get()
		end)
	end
end

local v53 = if not FFlagEnableConsoleExpControls then nil else require(ChromeShared.Parent.Parent.TopBar.Components.MenuIconContext)
local GetFFlagSimpleChatUnreadMessageCount = SharedFlags.GetFFlagSimpleChatUnreadMessageCount
local v55 = game:DefineFastFlag("UseBindingForUnreadChat", false)
local t1 = {}

function areTooltipsDisplaying() -- line: 105
	-- upvalues: t1 (copy)
	local timestamp = tick()

	for _, v59 in t1 do
		if v59.displaying or timestamp - v59.time < 0.15 then
			return true
		end
	end

	return false
end
function logTooltipState(p1, b1: boolean) -- line: 117
	-- upvalues: t1 (copy)
	if not t1[p1] or b1 ~= t1[p1].displaying then
		t1[p1] = {
			displaying = b1,
			time = tick()
		}
	end
end
function NotificationBadge(t2: {[any]: any}) -- line: 137
	-- upvalues: v55 (copy), React (copy), useNotificationCount (copy), useMappedObservableValue (copy), Service (copy), GetFFlagSimpleChatUnreadMessageCount (copy), useTokens (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), FFlagExpChatShowGlobalChatTooltip (copy), Foundation (copy), StatusIndicator (copy), Flags2 (copy), StatusIndicatorVariant (copy)
	if not t2.integration then
		return nil
	end

	local v63 = nil
	local u64 = nil
	local v65 = nil
	local v66 = nil
	local u67 = nil
	local u68 = false

	if v55 then
		local v69 = t2.integration.integration and t2.integration.integration.notification or nil
		local v70

		v63, v70 = React.useBinding(v69 and v69:get().value or 0)
		u64 = v70

		local v71

		v66, v71 = React.useState(false)
		u67 = v71
		React.useEffect(function() -- line: 151
			-- upvalues: v69 (copy), u67 (ref), u64 (ref)
			if not v69 then
				return
			end

			local v144 = v69:connect(function() -- line: 156
				-- upvalues: v69 (copy), u67 (ref), u64 (ref)
				local v171 = v69:get().value or 0

				u67(v171 > 0)
				u64(v171)
			end)

			return function() -- line: 161
				-- upvalues: v144 (copy)
				v144:disconnect()
			end
		end, { t2.integration.integration.id })
	else
		v65 = useNotificationCount(t2.integration.integration)

		if useMappedObservableValue(Service:currentSubMenu(), function(p2) -- line: 169
			-- upvalues: t2 (copy)
			return p2 == t2.integration.id
		end) then
			v65 = 0
		end

		if t2.integration and t2.integration.integration then
			u68 = t2.integration.integration.hideNotificationCountWhileOpen or false
		end
	end

	local v72 = nil

	if GetFFlagSimpleChatUnreadMessageCount() and t2.disableBadgeNumber then
		v72 = useTokens()
	end

	local ICON_SIZE, ICON_BADGE_OFFSET_X, ICON_BADGE_OFFSET_Y

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v73 = UnibarStyle.use()

		ICON_SIZE = v73.ICON_SIZE
		ICON_BADGE_OFFSET_X = v73.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = v73.ICON_BADGE_OFFSET_Y
	else
		ICON_SIZE = Constants.ICON_SIZE
		ICON_BADGE_OFFSET_X = Constants.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = Constants.ICON_BADGE_OFFSET_Y
	end

	local v77 = t2.minBadgeCount or 0
	local v78 = if not FFlagExpChatShowGlobalChatTooltip then if not v55 then v65 > 0 else v66 else if not v55 then v65 > 0 or v77 > 0 else v66 or v77 > 0
	local v79 = if not FFlagExpChatShowGlobalChatTooltip then if not v55 then math.min(v65, 99) else v63:map(function(p3) -- line: 223
		return (math.min(p3, 99))
	end) else if not v55 then math.min(math.max(v65, v77), 99) else v63:map(function(p4) -- line: 217
		-- upvalues: v77 (copy)
		return (math.min(math.max(p4, v77), 99))
	end)

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if not GetFFlagSimpleChatUnreadMessageCount() or not t2.disableBadgeNumber then UDim2.fromScale(1, 1) else UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		Visible = not t2.toggleTransition or (t2.toggleTransition:map(function(p5) -- line: 234
			-- upvalues: u68 (ref)
			if u68 then
				return p5 < 0.5
			end

			return true
		end) or true),
		ZIndex = 2
	}, {
		Badge = if not v78 then nil else if not GetFFlagSimpleChatUnreadMessageCount() or not t2.disableBadgeNumber then React.createElement(StatusIndicator, {
			value = v79,
			variant = if not Flags2.FoundationStatusIndicatorVariantExperiment then StatusIndicatorVariant.Emphasis else StatusIndicatorVariant.Contrast_Experiment,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, ICON_BADGE_OFFSET_X, 0, ICON_BADGE_OFFSET_Y)
		}) else React.createElement(Foundation.View, {
			Position = UDim2.new(1, 0, 0.2, 0),
			backgroundStyle = {
				Color3 = v72.Color.System.Contrast.Color3,
				Transparency = 0
			},
			stroke = {
				Color = v72.Color.Surface.Surface_0.Color3,
				Transparency = 0,
				Thickness = v72.Stroke.Thicker
			},
			tag = "anchor-top-right radius-circle size-200 stroke-thicker",
			ZIndex = 2
		})
	})
end
function ChatNotificationBadge(t3: {[any]: any}) -- line: 274
	-- upvalues: GetGlobalChatTooltipStore (copy), GetChatStatusStore (copy), SignalsReact (copy), isUserChatEnabled (copy), React (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), TextChatService (copy)
	local v81 = GetGlobalChatTooltipStore(false)
	local v82 = GetChatStatusStore(false)
	local v83 = SignalsReact.useSignalState(v81.getIsChatWindowOpen)
	local v84 = isUserChatEnabled(SignalsReact.useSignalState(v82.getChatStatus))
	local v85 = SignalsReact.useSignalState(v81.getIsGlobalChatTooltipDismissed)
	local v86 = SignalsReact.useSignalState(v81.getIsGlobalChatTooltipEligible)
	local v87 = SignalsReact.useSignalState(v81.getIsScreenWideEnough)
	local v88 = t3.integration.id == "chat"
	local v89, v90 = React.useState(false)

	React.useEffect(function() -- line: 288
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), TextChatService (copy), v90 (copy)
		if not GetFFlagTextChatEnableUniverseChatTabs() then
			return
		end

		if TextChatService:HasAllocatedUniverseChatContext("global") then
			v90(true)
		end

		local connection = TextChatService.UniverseChatChannelAllocated:Connect(function(s1: string) -- line: 297
			-- upvalues: v90 (copy)
			if s1 == "global" then
				v90(true)
			end
		end)

		return function() -- line: 303
			-- upvalues: connection (copy)
			connection:Disconnect()
		end
	end, {})

	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	local v92 = ChatWindowConfiguration == nil or ChatWindowConfiguration.HorizontalAlignment == Enum.HorizontalAlignment.Left and ChatWindowConfiguration.VerticalAlignment == Enum.VerticalAlignment.Top
	local v93 = v88 and (v84 and (v86 and (v89 and (v92 and (v87 and not v85)))))
	local setShouldShowGlobalChatTooltip = v81.setShouldShowGlobalChatTooltip

	React.useEffect(function() -- line: 325
		-- upvalues: v88 (copy), setShouldShowGlobalChatTooltip (copy), v93 (copy), v83 (copy)
		if v88 then
			setShouldShowGlobalChatTooltip(v93 and v83)
		end
	end, {
		v88,
		v93,
		v83,
		setShouldShowGlobalChatTooltip
	})

	local v95, v96 = React.useState(false)

	React.useEffect(function() -- line: 332
		-- upvalues: v93 (copy), v83 (copy), v96 (copy)
		if v93 and v83 then
			v96(true)
		end
	end, {
		v93,
		v83
	})

	local v97 = table.clone(t3)

	if v93 and not v95 then
		v97.minBadgeCount = 1
	end

	return React.createElement(NotificationBadge, v97)
end
function NotificationIndicator(t4: {[any]: any}) -- line: 349
	-- upvalues: useObservableValue (copy), Service (copy), React (copy)
	local v99 = useObservableValue(Service:notificationIndicator())

	t4.setIconVisible(not v99)

	return (React.createElement("Frame", {
		Name = "NotificationIndicatorFrame",
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1
	}, {
		IntegrationIcon = v99 and v99.component(t4) or nil,
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
	}))
end
function HighlightCircle(p6) -- line: 368
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy)
	local v101 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.ICON_HIGHLIGHT_SIZE else UnibarStyle.use().ICON_HIGHLIGHT_SIZE

	return React.createElement("Frame", {
		Name = p6.name or "Highlighter",
		Size = v101,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = p6.color.Color,
		BackgroundTransparency = p6.color.Transparency,
		BorderSizePixel = 0,
		Visible = p6.visible
	}, {
		corner = React.createElement("UICorner", {
			CornerRadius = UDim.new(1, 0)
		})
	})
end
function TooltipButton(t5: {[any]: any}) -- line: 398
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy), useTimeHysteresis (copy), isInExperienceUIVREnabled (copy), isSpatial (ref), useObservableValue (copy), Service (copy), u48 (ref), ControlState (copy), ChromeAnalytics (copy), UserInputService (copy), shouldRejectMultiTouch (copy), FFlagEnableConsoleExpControls (copy), v53 (copy), Interactable (copy), FFlagUnibarMenuOpenHamburger (copy), FFlagUnibarMenuOpenSubmenu (copy), useCursor (copy), Foundation (copy), Panel3DInSpatialUI (ref), PanelType (ref), SPATIAL_TOOLTIP_SPACING (ref), TooltipCallout (ref), TooltipOrientation (ref), withTooltip (copy), CoreGui (copy)
	local u103 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.ICON_HIGHLIGHT_SIZE else UnibarStyle.use().ICON_HIGHLIGHT_SIZE
	local v104 = React.useRef(nil)
	local secondaryAction = t5.integration.integration.secondaryAction
	local u106 = t5.integration.integration.draggable or false
	local v107 = React.useRef(nil)

	React.useEffect(function() -- line: 414
		-- upvalues: v107 (copy)
		return function() -- line: 415
			-- upvalues: v107 (copy)
			if v107.current then
				v107.current:Disconnect()
				v107.current = nil
			end
		end
	end, {})

	local v108, u110

	if secondaryAction then
		local v109

		v108, v109 = useTimeHysteresis(0.05, 0.15, 0.35)
		u110 = v109
	else
		local v111

		v108, v111 = useTimeHysteresis(0.6, 0.65, 0.7)
		u110 = v111
	end

	local v112, v113 = useTimeHysteresis(0, 0, 0.65)
	local v114, v115 = React.useState(false)
	local v116, v117 = useTimeHysteresis(0, 1)
	local v118 = if not isInExperienceUIVREnabled then nil else isSpatial()
	local v119 = if not isInExperienceUIVREnabled then nil else useObservableValue(Service:getTopBarVisibiity())
	local v120 = if not isInExperienceUIVREnabled or not u48 then nil else useObservableValue(u48)
	local u121 = false

	if isInExperienceUIVREnabled and v118 and not v119 and not v120 then
		u121 = true
		u106 = u106 and not u121
	end

	local v122 = React.useCallback(function(p7, p8) -- line: 453
		-- upvalues: isInExperienceUIVREnabled (copy), u121 (ref), ControlState (copy), Service (copy), t5 (copy), u110 (ref), v112 (copy), v117 (copy)
		if isInExperienceUIVREnabled and u121 then
			return
		end

		if p8 == ControlState.Selected and (p7 == ControlState.Default or p7 == ControlState.Hover) then
			Service:setSelected(t5.integration.id)
		elseif p8 == ControlState.Selected and p7 == ControlState.Default then
			Service:setSelected(t5.integration.id)
		end

		local v152 = p8 ~= ControlState.Default

		t5.setHovered(v152)

		local v153 = p8 == ControlState.Hover

		u110(v153, v153 and v112 or areTooltipsDisplaying())

		if v153 then
			Service:onIntegrationHovered():fire(t5.integration.id)
		end

		if not v152 then
			v117(false)
		end
	end, if not isInExperienceUIVREnabled then {
		t5.setHovered,
		u110,
		v117,
		v112
	} else {
		t5.setHovered,
		u110,
		v117,
		v112,
		v118,
		u121
	})
	local v123 = React.useCallback(function(_, p10) -- line: 489
		-- upvalues: u106 (ref), v117 (copy), ChromeAnalytics (copy), t5 (copy), v107 (copy), UserInputService (copy), shouldRejectMultiTouch (copy), Service (copy), Constants (copy)
		if not u106 then
			return
		end

		if p10.UserInputType == Enum.UserInputType.MouseButton1 or p10.UserInputType == Enum.UserInputType.Touch then
			local p10Position = p10.Position

			v117(true, true)
			ChromeAnalytics.default:onIconTouchBegan(t5.integration.id)

			if not v107.current then
				v107.current = UserInputService.InputChanged:Connect(function(input, _) -- line: 502
					-- upvalues: shouldRejectMultiTouch (copy), p10 (copy), Service (copy), t5 (copy), v107 (copy), p10Position (copy), Constants (copy), ChromeAnalytics (copy)
					if shouldRejectMultiTouch(p10, input) then
						return
					end

					if Service:isWindowOpen(t5.integration.id) or not v107.current then
						return
					end

					local inputPosition = input.Position

					if math.abs((p10Position - inputPosition).Magnitude) > Constants.DRAG_MAGNITUDE_THRESHOLD then
						ChromeAnalytics.default:onIconDrag(t5.integration.id)
						Service:storeChromeInteracted()
						Service:toggleWindow(t5.integration.id)
						Service:gesture(t5.integration.id, v107, p10)
					end
				end)
			end
		end
	end, { u106 })
	local v124 = React.useCallback(function(_, p13) -- line: 528
		-- upvalues: u106 (ref), v117 (copy), v107 (copy), Service (copy), t5 (copy)
		if not u106 then
			return
		end

		if p13.UserInputType == Enum.UserInputType.MouseButton1 or p13.UserInputType == Enum.UserInputType.Touch then
			v117(false)

			if v107.current then
				v107.current:Disconnect()
				v107.current = nil
				Service:gesture(t5.integration.id, nil)
			end
		end
	end, { u106 })
	local u125 = (v108 or (v112 or v114)) and not v116

	if isInExperienceUIVREnabled and u125 and u121 then
		u125 = false
	end

	logTooltipState(t5.integration.id, u125)

	local v126 = if not FFlagEnableConsoleExpControls then nil else React.useContext(v53)
	local v127 = React.useCallback(function(p14) -- line: 556
		-- upvalues: FFlagEnableConsoleExpControls (copy), Service (copy), React (copy), Interactable (copy), Constants (copy), t5 (copy), u103 (ref), v122 (copy), v104 (copy), FFlagUnibarMenuOpenHamburger (copy), FFlagUnibarMenuOpenSubmenu (copy), useCursor (copy), Foundation (copy), u125 (ref), secondaryAction (copy), v126 (copy), v123 (copy), v124 (copy), isInExperienceUIVREnabled (copy), v118 (copy), u121 (ref), v117 (copy), v107 (copy)
		local id = nil

		if FFlagEnableConsoleExpControls then
			id = Service:menuList():get()[1].id
		end

		return React.createElement(Interactable, {
			Name = (not FFlagEnableConsoleExpControls and "IconHitArea_" or Constants.ICON_NAME_PREFIX) .. t5.integration.id,
			Size = u103,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			onStateChanged = v122,
			ref = v104,
			SelectionOrder = if not FFlagUnibarMenuOpenHamburger and not FFlagUnibarMenuOpenSubmenu then 100 - t5.integration.order else t5.integration.order,
			Position = t5.isCurrentlyOpenSubMenu:map(function(b2: boolean?) -- line: 574
				-- upvalues: FFlagEnableConsoleExpControls (copy)
				return UDim2.new(0.5, 0, 0.5, (FFlagEnableConsoleExpControls or not b2) and 0 or 1)
			end),
			SelectionImageObject = useCursor(Foundation.Enums.CursorType.SkinToneCircle),
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = t5.isCurrentlyOpenSubMenu:map(function(b3: boolean?) -- line: 580
				-- upvalues: u125 (ref), secondaryAction (copy)
				if u125 and secondaryAction or b3 then
					return Enum.SelectionBehavior.Escape
				end

				return Enum.SelectionBehavior.Stop
			end),
			NextSelectionLeft = if not FFlagEnableConsoleExpControls or id ~= t5.integration.id then nil else v126.menuIconRef,
			[React.Change.AbsolutePosition] = p14,
			[React.Change.AbsoluteSize] = p14,
			[React.Event.InputBegan] = v123,
			[React.Event.InputEnded] = v124,
			[React.Event.Activated] = function() -- line: 594
				-- upvalues: isInExperienceUIVREnabled (copy), v118 (copy), u121 (ref), Service (copy), v117 (copy), t5 (copy), v107 (copy)
				if isInExperienceUIVREnabled and v118 then
					if u121 then
						return
					end

					Service:onTriggerVRToggleButton():fire(true)
				end

				v117(true, true)
				t5.integration.activated()

				if v107.current then
					v107.current:Disconnect()
					v107.current = nil
					Service:gesture(t5.integration.id, nil)
				end
			end
		}, {
			corner = React.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			})
		})
	end, {
		v122,
		u110,
		v117,
		v123,
		v124,
		t5.isCurrentlyOpenSubMenu,
		u125,
		secondaryAction,
		if not isInExperienceUIVREnabled then nil else u121,
		if not FFlagEnableConsoleExpControls then nil else v126.menuIconRef
	})
	local v128 = React.useRef(nil)
	local v129 = React.useCallback(function(p15) -- line: 631
		-- upvalues: v128 (copy), v113 (copy)
		local u162 = nil
		local u163 = nil
		local u164 = nil

		if p15 ~= v128.current then
			pcall(function() -- line: 638
				-- upvalues: u162 (ref), u163 (ref), u164 (ref)
				if u162 then
					u162:disconnect()
					u162 = nil
				end

				if u163 then
					u163:disconnect()
					u163 = nil
				end

				if u164 then
					u164:disconnect()
					u164 = nil
				end
			end)

			if p15 then
				u162 = p15.MouseEnter:Connect(function() -- line: 656
					-- upvalues: v113 (copy)
					v113(true, true)
				end)
				u163 = p15.MouseLeave:Connect(function() -- line: 659
					-- upvalues: v113 (copy)
					v113(false)
				end)
				u164 = p15.Destroying:Connect(function() -- line: 662
					-- upvalues: v113 (copy)
					v113(false)
				end)
			end

			v128.current = p15
		end
	end, { v113 })
	local v130 = if not secondaryAction then nil else {
		text = secondaryAction.label,
		onStateChanged = function(_, p17) --[[ onStateChanged ]] -- line: 673
			-- upvalues: ControlState (copy), v115 (copy)
			if p17 == ControlState.Selected then
				v115(true)

				return
			end

			v115(false)
		end,
		onActivated = function() --[[ onActivated ]] -- line: 680
			-- upvalues: secondaryAction (copy), t5 (copy)
			secondaryAction.activated(t5.integration)
		end,
		NextSelectionUp = v104,
		NextSelectionLeft = v104,
		NextSelectionRight = v104,
		NextSelectionDown = v104
	}

	if isInExperienceUIVREnabled and v118 then
		local v131, v132 = React.useBinding(Vector2.zero)
		local v133, v134 = React.useBinding(Vector2.zero)
		local v135 = React.useCallback(function(p18) -- line: 694
			-- upvalues: v132 (copy), v134 (copy)
			v132(p18.AbsolutePosition)
			v134(p18.AbsoluteSize)
		end, {
			v132,
			v134
		})

		return React.createElement(React.Fragment, nil, {
			VRSpatialTooltip = if not u125 or not Panel3DInSpatialUI then nil else React.createElement(Panel3DInSpatialUI, {
				panelType = PanelType.ToolTipsContainer,
				renderFunction = function(vector2: Vector2) --[[ renderFunction ]] -- line: 706
					-- upvalues: v131 (copy), v133 (copy), SPATIAL_TOOLTIP_SPACING (ref), React (copy), TooltipCallout (ref), t5 (copy), TooltipOrientation (ref), v130 (copy), secondaryAction (copy), v129 (copy)
					local vector2_2 = Vector2.new(v131:getValue().X + v133:getValue().X / 2, vector2.Y - SPATIAL_TOOLTIP_SPACING)

					return React.createElement(TooltipCallout, {
						textAlignment = Enum.TextXAlignment.Center,
						headerText = t5.integration.integration.label,
						orientation = TooltipOrientation.Top,
						distanceOffset = 0,
						triggerPointCenter = vector2_2,
						contentOffsetVector = Vector2.zero,
						triggerPointRadius = Vector2.zero,
						buttonProps = v130,
						ref = if not secondaryAction then nil else v129
					})
				end
			}),
			v127(v135)
		})
	end

	return withTooltip({
		headerText = t5.integration.integration.label,
		hotkeyCodes = t5.integration.integration.hotkeyCodes,
		textAlignment = Enum.TextXAlignment.Left,
		buttonProps = v130,
		ref = if not secondaryAction then nil else v129
	}, {
		active = u125,
		guiTarget = CoreGui,
		DisplayOrder = 10
	}, v127)
end
function IconHost(t6: {[any]: any}) -- line: 745
	-- upvalues: React (copy), useStyle (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), useMappedObservableValueBinding (copy), Service (copy), FFlagEnableConsoleExpControls (copy), FFlagExpChatShowGlobalChatTooltip (copy)
	if not t6.integration or not t6.integration.component then
		warn("IconHost has no component to render")
	end

	local v137, v138 = React.useBinding(false)
	local v139, v140 = React.useBinding(true)
	local BackgroundOnHover = useStyle().Theme.BackgroundOnHover
	local v142 = if not FFlagTokenizeUnibarConstantsWithStyleProvider then Constants.ICON_CELL_WIDTH else UnibarStyle.use().ICON_CELL_WIDTH
	local v143 = useMappedObservableValueBinding(Service:currentSubMenu(), function(p19) -- line: 768
		-- upvalues: t6 (copy)
		return p19 == t6.integration.id
	end)

	return React.createElement("Frame", {
		Size = UDim2.new(0, v142, 0, v142),
		LayoutOrder = t6.integration.order,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = t6.position,
		Visible = t6.visible,
		ZIndex = if not FFlagEnableConsoleExpControls then t6.integration.order else nil
	}, {
		React.createElement("Frame", {
			Name = "IntegrationIconFrame",
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Visible = v139
		}, {
			IntegrationIcon = t6.integration and (not not t6.integration.component and t6.integration.component(t6)) or nil,
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			})
		}),
		if not t6.integration.integration.flashNotificationSource then nil else React.createElement(NotificationIndicator, {
			integration = t6.integration,
			setIconVisible = v140
		}),
		React.createElement(HighlightCircle, {
			name = "SelectedHighlighter",
			color = BackgroundOnHover,
			visible = v143
		}),
		React.createElement(HighlightCircle, {
			name = "Highlighter",
			color = BackgroundOnHover,
			visible = v137
		}),
		if not FFlagExpChatShowGlobalChatTooltip or t6.integration.id ~= "chat" then React.createElement(NotificationBadge, t6) else React.createElement(ChatNotificationBadge, t6),
		if not t6.disableButtonBehaviors then React.createElement(TooltipButton, {
			integration = t6.integration,
			setHovered = v138,
			isCurrentlyOpenSubMenu = v143
		}) else nil
	})
end

return IconHost
