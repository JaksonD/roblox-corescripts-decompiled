local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v6 = game:DefineFastFlag("AvatarSwitcherHamburgerExposure", false)
local v7 = game:DefineFastString("AvatarSwitcherIXPLayer", "UIEcosystem.User.Migration")
local FFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local Flags = require(ChromeShared.Flags)
local FFlagTokenizeUnibarConstantsWithStyleProvider = Flags.FFlagTokenizeUnibarConstantsWithStyleProvider
local FFlagFixSpatialSubMenuSizing = Flags.FFlagFixSpatialSubMenuSizing
local React = require(CorePackages.Packages.React)
local UIBlox = require(CorePackages.Packages.UIBlox)
local v14 = if not FFlagEnableConsoleExpControls then nil else require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local useStyle = UIBlox.Core.Style.useStyle
local Interactable = UIBlox.Core.Control.Interactable
local ControlState = UIBlox.Core.Control.Enum.ControlState
local VerticalScrollView = UIBlox.App.Container.VerticalScrollView
local ScrollBarType = UIBlox.App.Container.Enum.ScrollBarType
local ReactOtter = require(CorePackages.Packages.ReactOtter)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local Foundation = require(CorePackages.Packages.Foundation)
local useCursor = Foundation.Hooks.useCursor
local Service = require(ChromeShared.Service)
local Chrome = require(CorePackages.Workspace.Packages.Chrome)
local ViewportUtil = require(ChromeShared.Service.ViewportUtil)
local Constants = require(ChromeShared.Unibar.Constants)
local v29 = if not FFlagEnableConsoleExpControls then nil else require(ChromeShared.Parent.Parent.TopBar.Components.MenuIconContext)
local SubMenuContext = require(ChromeShared.Unibar.SubMenuContext)
local UnibarStyle = Chrome.UnibarStyle
local UserInputService = game:GetService("UserInputService")
local useChromeMenuItems = require(ChromeShared.Hooks.useChromeMenuItems)
local useObservableValue = require(ChromeShared.Hooks.useObservableValue)
local useTopbarInsetHeight = require(ChromeShared.Hooks.useTopbarInsetHeight)
local useMappedObservableValue = require(ChromeShared.Hooks.useMappedObservableValue)
local v37 = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false)
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local UIManager = nil

if isInExperienceUIVREnabled then
	UIManager = require(CorePackages.Workspace.Packages.VrSpatialUi).UIManager
end

local IconHost = require(ChromeShared.Unibar.ComponentHosts.IconHost)
local RoundedSlot = Foundation.Enums.CursorType.RoundedSlot
local vector2 = Vector2.new(0, 0)
local t1 = {
	Closed = 0,
	Open = 1
}
local t2 = {}
local u47 = nil

function MenuRow(p1) -- line: 85
	-- upvalues: useStyle (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), React (copy), SubMenuContext (copy), FFlagEnableConsoleExpControls (copy), v29 (copy), ControlState (copy), Service (copy), GuiService (copy), IconHost (copy), StyledTextLabel (copy), isInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), UIManager (ref), Interactable (copy), useCursor (copy), RoundedSlot (copy), v37 (copy)
	local Theme = useStyle().Theme
	local t3 = {
		Color = Color3.new(0, 0, 0),
		Transparency = 1
	}
	local ICON_SIZE, SUB_MENU_ROW_HEIGHT, SUBMENU_PADDING_LEFT, SUBMENU_PADDING_RIGHT, SUBMENU_ROW_LABEL_FONT, SUBMENU_ROW_PADDING, SUBMENU_ROW_CORNER_RADIUS

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v51 = UnibarStyle.use()

		ICON_SIZE = v51.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = v51.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = v51.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = v51.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = v51.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = v51.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = v51.SUBMENU_ROW_CORNER_RADIUS
	else
		ICON_SIZE = Constants.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = Constants.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = Constants.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = Constants.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = Constants.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = Constants.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = Constants.SUBMENU_ROW_CORNER_RADIUS
	end

	local v59 = React.useContext(SubMenuContext)
	local v60 = if not FFlagEnableConsoleExpControls then nil else React.useContext(v29)
	local v61, v62 = React.useBinding(t3)
	local v63 = React.useCallback(function(_, p3) -- line: 124
		-- upvalues: ControlState (copy), v62 (copy), Theme (copy), t3 (copy)
		if p3 == ControlState.Pressed then
			v62(Theme.BackgroundOnPress)

			return
		end

		if p3 == ControlState.Hover then
			v62(Theme.BackgroundOnHover)

			return
		end

		v62(t3)
	end)
	local v64 = React.useCallback(function() -- line: 134
		-- upvalues: FFlagEnableConsoleExpControls (copy), Service (copy), GuiService (copy), p1 (copy)
		if FFlagEnableConsoleExpControls then
			Service:disableFocusNav()
			GuiService.SelectedCoreObject = nil
			Service:setShortcutBar(nil)
			Service:selectedItem():set(nil)
			p1.activated()

			return
		end

		p1.activated()
	end, { p1.id })
	local v65 = React.createElement(React.Fragment, nil, {
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SUBMENU_PADDING_LEFT),
			PaddingRight = UDim.new(0, SUBMENU_PADDING_RIGHT)
		}),
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, SUBMENU_ROW_PADDING)
		}),
		IconHost = React.createElement(IconHost, {
			integration = p1,
			disableButtonBehaviors = true
		}),
		StyledTextLabel = React.createElement(StyledTextLabel, {
			size = UDim2.new(1, -ICON_SIZE - SUBMENU_PADDING_LEFT - SUBMENU_PADDING_RIGHT, 1, 0),
			lineHeight = 1,
			fontStyle = SUBMENU_ROW_LABEL_FONT,
			colorStyle = if not v59 then Theme.TextEmphasis else {
				Color = Theme.TextEmphasis.Color,
				Transparency = v59:map(function(p4) -- line: 174
					return 1 - p4
				end)
			},
			text = p1.integration.label,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			fluidSizing = true,
			richText = true
		})
	})
	local v66 = (not isInExperienceUIVREnabled or InExperienceUIVRIXP:isSpatialUIScalingFixEnabled()) and 1 or UIManager.getInstance():getAdditionalCameraScaleIfNeeded()

	return React.createElement(Interactable, {
		Size = UDim2.new(1, 0, 0, SUB_MENU_ROW_HEIGHT * v66),
		BorderSizePixel = 0,
		BackgroundTransparency = v61:map(function(p5) -- line: 193
			return p5.Transparency
		end),
		BackgroundColor3 = v61:map(function(p6) -- line: 196
			return p6.Color
		end),
		SelectionImageObject = useCursor(RoundedSlot),
		[React.Event.Activated] = v64,
		LayoutOrder = p1.order,
		onStateChanged = v63,
		NextSelectionLeft = if not FFlagEnableConsoleExpControls then nil else v60.menuIconRef
	}, {
		UICorner = React.createElement("UICorner", {
			CornerRadius = UDim.new(0, SUBMENU_ROW_CORNER_RADIUS)
		}),
		RowLabel = if not v37 then v65 else React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = p1.order
		}, { v65 })
	})
end
function isLeft(p7) -- line: 221
	return p7 == Enum.HorizontalAlignment.Left
end
function SubMenu(t4: {[any]: any}) -- line: 225
	-- upvalues: useStyle (copy), React (copy), useObservableValue (copy), ViewportUtil (copy), useTopbarInsetHeight (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), GuiService (copy), Service (copy), FFlagEnableConsoleExpControls (copy), UserInputService (copy), v14 (copy), v6 (copy), IXPServiceWrapper (copy), v7 (copy), isInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), UIManager (ref), isSpatial (copy), FFlagFixSpatialSubMenuSizing (copy), UserGameSettings (copy), useMappedObservableValue (copy), VerticalScrollView (copy), ScrollBarType (copy)
	local v69 = useStyle()
	local Theme = v69.Theme
	local v71 = React.useRef(nil)
	local v72 = useObservableValue(ViewportUtil.screenSize)
	local v73 = useTopbarInsetHeight()
	local UNIBAR_LEFT_MARGIN, ICON_CELL_WIDTH, UNIBAR_END_PADDING, SUB_MENU_ROW_HEIGHT, SUBMENU_CORNER_RADIUS, SUBMENU_BOTTOM_PADDING

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v74 = UnibarStyle.use()

		UNIBAR_LEFT_MARGIN = v74.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = v74.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = v74.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = v74.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = v74.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = v74.SUBMENU_BOTTOM_PADDING
	else
		UNIBAR_LEFT_MARGIN = Constants.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = Constants.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = Constants.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = Constants.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = Constants.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = Constants.SUBMENU_BOTTOM_PADDING
	end

	local v81 = SUB_MENU_ROW_HEIGHT * 0.5

	React.useEffect(function() -- line: 255
		-- upvalues: v71 (copy), GuiService (copy), Service (copy), FFlagEnableConsoleExpControls (copy), UserInputService (copy), v14 (copy)
		local connection = nil

		if FFlagEnableConsoleExpControls then
			connection = UserInputService.InputChanged:Connect(function(_) -- line: 274
				-- upvalues: UserInputService (copy), v14 (copy), v71 (copy), GuiService (copy), Service (copy)
				for _, v122 in (UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1)) do
					if v122.KeyCode == Enum.KeyCode.Thumbstick1 then
						local X = v14.normalizeStickByDeadzone(Vector2.new(v122.Position.X, v122.Position.Y)).X

						if X < -0.5 then
							if v71.current and v71.current:IsAncestorOf(GuiService.SelectedCoreObject) then
								Service:setSelectedByOffset(-1)
							end
						elseif X > 0.5 and (v71.current and v71.current:IsAncestorOf(GuiService.SelectedCoreObject)) then
							Service:setSelectedByOffset(1)
						end
					end
				end
			end)
		end

		local connection2 = UserInputService.InputBegan:Connect(function(input) -- line: 296
			-- upvalues: v71 (copy), GuiService (copy), Service (copy)
			local KeyCode = input.KeyCode

			if KeyCode == Enum.KeyCode.Left or KeyCode == Enum.KeyCode.DPadLeft then
				if v71.current and v71.current:IsAncestorOf(GuiService.SelectedCoreObject) then
					Service:setSelectedByOffset(-1)

					return
				end
			elseif (KeyCode == Enum.KeyCode.Right or KeyCode == Enum.KeyCode.DPadRight) and (v71.current and v71.current:IsAncestorOf(GuiService.SelectedCoreObject)) then
				Service:setSelectedByOffset(1)
			end
		end)

		return function() -- line: 305
			-- upvalues: FFlagEnableConsoleExpControls (copy), connection (ref), connection2 (copy)
			if FFlagEnableConsoleExpControls then
				connection:Disconnect()
			end

			connection2:Disconnect()
		end
	end, {})

	if v6 then
		React.useEffect(function() -- line: 315
			-- upvalues: IXPServiceWrapper (copy), v7 (copy)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(v7)
		end, {})
	end

	local v82 = v73 + ICON_CELL_WIDTH
	local v83 = (not t4 or not t4.items) and 0 or SUB_MENU_ROW_HEIGHT * #t4.items
	local v84 = v83 * ((not isInExperienceUIVREnabled or InExperienceUIVRIXP:isSpatialUIScalingFixEnabled()) and 1 or UIManager.getInstance():getAdditionalCameraScaleIfNeeded())
	local v85 = if not t4.panelSize then v84 else t4.panelSize.Y
	local v86 = isInExperienceUIVREnabled and isSpatial()
	local v87 = FFlagFixSpatialSubMenuSizing and v86
	local u88 = if not v87 then math.min(v72.Y - v82, v83) else math.min(v84, v85)

	if not v87 and v83 > v72.Y - v82 then
		local v89 = math.floor((v72.Y - v82) / SUB_MENU_ROW_HEIGHT)

		u88 = if not (SUB_MENU_ROW_HEIGHT * v89 + v81 <= v72.Y - v82) then SUB_MENU_ROW_HEIGHT * v89 - v81 else SUB_MENU_ROW_HEIGHT * v89 + v81
	end

	local t5 = {
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UISizeConstraint = React.createElement("UISizeConstraint", {
			MinSize = if UserGameSettings.ReducedMotion or not t4.menuTransition then Vector2.new(0, u88) else t4.menuTransition:map(function(p9) -- line: 352
				-- upvalues: u88 (ref)
				return Vector2.new(0, u88 * p9)
			end)
		}),
		BottomPadding = React.createElement("Frame", {
			Size = UDim2.new(0, 0, 0, SUBMENU_BOTTOM_PADDING),
			BackgroundTransparency = 1,
			LayoutOrder = 10000
		})
	}

	for _, v92 in t4.items do
		t5[v92.id] = React.createElement(MenuRow, v92)
	end

	local v93 = useMappedObservableValue(Service:orderAlignment(), isLeft)
	local v94 = v69.Theme.BackgroundUIContrast.Transparency * v69.Settings.PreferredTransparency
	local v95 = if not v86 then if not v93 then Vector2.new(1, 0) else Vector2.zero else Vector2.new(0, 1)

	return React.createElement("Frame", {
		Size = if not v86 then UDim2.new(0, ICON_CELL_WIDTH * 4 + UNIBAR_LEFT_MARGIN + UNIBAR_END_PADDING * 2, 0, 0) else UDim2.new(1, 0, 0, if not v87 then v84 else math.min(v84, v85)),
		AnchorPoint = v95,
		Position = if not v86 then UDim2.new(0, -v73 - 2 + UNIBAR_LEFT_MARGIN, 0, 0) else UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Theme.BackgroundUIContrast.Color,
		BackgroundTransparency = if not t4.menuTransition then v94 else t4.menuTransition:map(function(p10) -- line: 392
			-- upvalues: v94 (copy)
			return v94 + (1 - v94) * (1 - p10)
		end),
		AutomaticSize = if not v86 then Enum.AutomaticSize.Y else nil,
		ref = v71,
		SelectionGroup = not not FFlagEnableConsoleExpControls or nil,
		SelectionBehaviorDown = if not FFlagEnableConsoleExpControls then nil else Enum.SelectionBehavior.Stop
	}, {
		UICorner = React.createElement("UICorner", {
			CornerRadius = UDim.new(0, SUBMENU_CORNER_RADIUS)
		}),
		ScrollingFrame = React.createElement(VerticalScrollView, {
			size = UDim2.new(1, 0, 1, 0),
			canvasSizeY = UDim.new(0, if not v87 then v83 else v84),
			selectable = false,
			scrollBarType = ScrollBarType.Compact
		}, t5)
	})
end

return function(t6: {[any]: any}) -- line: 418
	-- upvalues: React (copy), useObservableValue (copy), Service (copy), t1 (copy), useChromeMenuItems (copy), ReactOtter (copy), t2 (ref), u47 (ref), Constants (copy), UserInputService (copy), vector2 (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), InExperienceUIVRIXP (copy), FFlagFixSpatialSubMenuSizing (copy), FFlagUnibarMenuOpenSubmenu (copy), SubMenuContext (copy)
	local t7 = {}
	local v98 = React.useRef(nil)
	local v99 = React.useRef(nil)
	local v100 = React.useRef(nil)
	local v101 = useObservableValue(Service:currentSubMenu())
	local _, v103 = React.useState(t1.Closed)
	local v104 = useChromeMenuItems()
	local t8 = {}
	local v106, v107 = ReactOtter.useAnimatedBinding(t1.Closed, function(p11) -- line: 431
		-- upvalues: v103 (copy)
		v103(p11)
	end)

	React.useEffect(function() -- line: 436
		-- upvalues: t2 (ref), t8 (ref), u47 (ref), v101 (copy), v103 (copy), t1 (copy), v107 (copy), ReactOtter (copy), Constants (copy), v100 (copy), UserInputService (copy), vector2 (ref), v99 (copy), Service (copy), v98 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), InExperienceUIVRIXP (copy)
		t2 = t8
		u47 = v101

		if v101 then
			v103(t1.Closed)
			v107(ReactOtter.spring(t1.Open, Constants.MENU_ANIMATION_SPRING))
			v100.current = UserInputService.TouchStarted:Connect(function(p12) -- line: 444
				-- upvalues: vector2 (ref)
				vector2 = Vector2.new(p12.Position.X, p12.Position.Y)
			end)
			v99.current = UserInputService.TouchTap:Connect(function(p13) -- line: 448
				-- upvalues: vector2 (ref), Service (copy)
				if p13[1] - vector2 ~= Vector2.zero then
					return
				end

				local v128 = Service:currentSubMenu():get()

				if v128 then
					Service:toggleSubMenu(v128)
				end
			end)
			v98.current = UserInputService.InputEnded:Connect(function(input, _) -- line: 459
				-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), InExperienceUIVRIXP (copy), Service (copy)
				if isInExperienceUIVREnabled and (isSpatial() and not InExperienceUIVRIXP:isMovePanelToCenter()) then
					return
				end

				local v131 = input.UserInputType == Enum.UserInputType.MouseButton1
				local v132 = Service:currentSubMenu():get()

				if v132 and v131 then
					Service:toggleSubMenu(v132)
				end
			end)
		else
			v103(t1.Open)
			v107(ReactOtter.spring(t1.Closed, Constants.MENU_ANIMATION_SPRING))
		end

		return function() -- line: 480
			-- upvalues: v98 (copy), v99 (copy), v100 (copy)
			if v98.current then
				v98.current:Disconnect()
				v98.current = nil
			end

			if v99.current then
				v99.current:Disconnect()
				v99.current = nil
			end

			if v100.current then
				v100.current:Disconnect()
				v100.current = nil
			end
		end
	end, { v101 })

	if v101 and v104 then
		for _, v109 in v104 do
			if v101 == v109.id then
				t8 = v109.children

				break
			end
		end
	end

	if #t8 > 0 then
		t7[v101] = React.createElement(SubMenu, {
			items = t8,
			menuTransition = v106,
			panelSize = if not FFlagFixSpatialSubMenuSizing then nil else t6.panelSize
		})
	elseif #t2 > 0 then
		t7[u47] = React.createElement(SubMenu, {
			items = t2,
			menuTransition = v106,
			panelSize = if not FFlagFixSpatialSubMenuSizing then nil else t6.panelSize
		})
	end

	return React.createElement("Frame", {
		Name = "SubMenuHost",
		Size = if not isInExperienceUIVREnabled or not isSpatial() then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ref = if not FFlagUnibarMenuOpenSubmenu then nil else t6.subMenuHostRef
	}, React.createElement(SubMenuContext.Provider, {
		value = v106
	}, t7))
end
