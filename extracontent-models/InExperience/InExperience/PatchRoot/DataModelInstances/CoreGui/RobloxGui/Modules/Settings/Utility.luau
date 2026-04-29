local Theme = require(script.Parent.Theme)
local v2 = Theme.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255))
local v3 = Theme.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96))
local v4 = Theme.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204))
local v5 = Theme.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255))
local v6 = Theme.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150))
local uDim = UDim.new(0, 14)
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
local ContextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local Workspace = game:GetService("Workspace")
local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local FFlagRefactorMenuConfirmationButtons = require(RobloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local FFlagAddNextUpContainer = require(RobloxGui.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer)
local v21 = game:DefineFastFlag("RepositionDropDownScrim", false)
local EngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local Chrome = RobloxGui.Modules.Chrome
local v24 = if not require(CorePackages.Workspace.Packages.Chrome).Enabled() then nil else require(Chrome.Service)
local Signals = require(CorePackages.Packages.Signals)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local FFlagHideShortcutsWhileIemDropdownActive = require(Chrome.Flags).FFlagHideShortcutsWhileIemDropdownActive
local EngineFeature2 = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService")
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v30 = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false)
local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local CorePackages2 = game:GetService("CorePackages")
local AppCommonLib = require(CorePackages2.Workspace.Packages.AppCommonLib)
local Signal = AppCommonLib.Signal
local Create = AppCommonLib.Create
local BuilderIcons = require(CorePackages2.Packages.BuilderIcons)
local Migration = BuilderIcons.Migration
local v38 = require(RobloxGui.Modules:WaitForChild("TenFootInterface")):IsEnabled()
local v39 = Signals.createComputed(function(p1) -- line: 86
	-- upvalues: Responsive (copy)
	return Responsive.GetInputModeStore(p1).getLastInputType(p1) == Responsive.Input.Touch
end)
local v40 = Signals.createComputed(function(p2) -- line: 91
	-- upvalues: Responsive (copy)
	return Responsive.GetInputModeStore(p2).getLastInputType(p2) == Responsive.Input.Pointer
end)
local t1 = {}

setmetatable(t1, {
	__mode = "k"
})

local v42 = Create("ImageLabel")({
	Image = "",
	BackgroundTransparency = 1
})

function clamp(p3, p4, p5) -- line: 108
	return (math.max(p3, (math.min(p4, p5))))
end

local function Linear(p6, p7, p8, p9) -- line: 113
	if p9 <= p6 then
		return p7 + p8
	end

	return p8 * p6 / p9 + p7
end
local function EaseOutQuad(p10, p11, p12, p13) -- line: 121
	if p13 <= p10 then
		return p11 + p12
	end

	local v77 = p10 / p13

	return p11 - p12 * v77 * (v77 - 2)
end
local function EaseInOutQuad(p14, p15, p16, p17) -- line: 130
	if p17 <= p14 then
		return p15 + p16
	end

	local v82 = p14 / p17

	if v82 < 0.5 then
		return 2 * p16 * v82 * v82 + p15
	end

	return p15 + p16 * (2 * (2 - v82) * v82 - 1)
end

function PropertyTweener(p18, p19, p20, p21, p22, p23, p24) -- line: 142
	-- upvalues: RunService (copy)
	local t2 = {
		StartTime = tick()
	}

	t2.EndTime = t2.StartTime + p22
	t2.Cancelled = false

	local u91 = false
	local n1 = 0

	p18[p19] = p23(0, p20, p21 - p20, p22)
	coroutine.wrap(function() -- line: 164
		-- upvalues: t2 (copy), p18 (copy), p19 (copy), p23 (copy), p20 (copy), p21 (copy), p22 (copy), n1 (ref), RunService (copy), u91 (ref), p24 (copy)
		local timestamp = tick()

		while timestamp < t2.EndTime and p18 do
			if t2.Cancelled then
				return
			end

			p18[p19] = p23(timestamp - t2.StartTime, p20, p21 - p20, p22)
			n1 = clamp(0, 1, (timestamp - t2.StartTime) / p22)
			RunService.RenderStepped:Wait()
			timestamp = tick()
		end

		if t2.Cancelled == false and p18 then
			if p18 then
				p18[p19] = p23(1, p20, p21 - p20, 1)
			end

			u91 = true
			n1 = 1

			if p24 then
				p24()
			end
		end
	end)()

	function t2.GetFinal(_) -- line: 180
		-- upvalues: p21 (copy)
		return p21
	end
	function t2.GetPercentComplete(_) -- line: 184
		-- upvalues: n1 (ref)
		return n1
	end
	function t2.IsFinished(_) -- line: 188
		-- upvalues: u91 (ref)
		return u91
	end
	function t2.Finish(p28) -- line: 192
		-- upvalues: u91 (ref), p18 (copy), p19 (copy), p23 (copy), p20 (copy), p21 (copy), n1 (ref), p24 (copy)
		if not u91 then
			p28:Cancel()

			if p18 then
				p18[p19] = p23(1, p20, p21 - p20, 1)
			end

			u91 = true
			n1 = 1

			if p24 then
				p24()
			end
		end
	end
	function t2.Cancel(_) -- line: 199
		-- upvalues: t2 (copy)
		t2.Cancelled = true
	end

	return t2
end

local function CreateSignal() -- line: 212
	local t3 = {}
	local BindableEvent = Instance.new("BindableEvent")
	local t4 = nil
	local u96 = nil

	function t3.fire(_, ...) -- line: 220
		-- upvalues: t4 (ref), u96 (ref), BindableEvent (copy)
		t4 = { ... }
		u96 = select("#", ...)
		BindableEvent:Fire()
	end
	function t3.connect(_, p32) -- line: 226
		-- upvalues: BindableEvent (copy), t4 (ref), u96 (ref)
		if not p32 then
			error("connect(nil)", 2)
		end

		return BindableEvent.Event:Connect(function() -- line: 230
			-- upvalues: p32 (copy), t4 (ref), u96 (ref)
			p32(unpack(t4, 1, u96))
		end)
	end
	function t3.wait(_) -- line: 235
		-- upvalues: BindableEvent (copy), t4 (ref), u96 (ref)
		BindableEvent.Event:wait()

		if not t4 then
			error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		end

		return unpack(t4, 1, u96)
	end

	return t3
end
local function addHoverState(p34, p35, p36, p37) -- line: 282
	local function onNormalButtonStateCallback() -- line: 283
		-- upvalues: p34 (copy), p36 (copy), p35 (copy)
		if p34.Active then
			p36(p35)
		end
	end
	local function onHoverButtonStateCallback() -- line: 288
		-- upvalues: p34 (copy), p37 (copy), p35 (copy)
		if p34.Active then
			p37(p35)
		end
	end

	p34.MouseEnter:Connect(onHoverButtonStateCallback)
	p34.SelectionGained:Connect(onHoverButtonStateCallback)
	p34.MouseLeave:Connect(onNormalButtonStateCallback)
	p34.SelectionLost:Connect(onNormalButtonStateCallback)
	p36(p35)
end
local function addOnResizedCallback(p38, p39) -- line: 302
	-- upvalues: t1 (copy), GuiService (copy)
	t1[p38] = p39

	local v107 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)
	local v108 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	p39(v107, v108.Y > v108.X)
end

local t5 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}

local function MakeDefaultButton(p40, p41, p42, p43, p44, p45) -- line: 318
	-- upvalues: Create (copy), Theme (copy), t5 (copy), UserInputService (copy), GuiService (copy), VRService (copy)
	local v115 = Create("ImageLabel")({
		Image = "",
		BackgroundTransparency = 1
	})
	local s1 = "DefaultButtonStroke"
	local s2 = "DefaultButton"

	if p40 == "DropDownFrame" then
		s1 = "ControlInputStroke"
		s2 = "ControlInputBackground"
	end

	if p45 == "ImageButton" then
		s2 = "ImageButton"
	end

	local u118 = Create("ImageButton")({
		Name = p40 .. "Button",
		AutoButtonColor = false,
		BackgroundColor3 = Theme.color(s2),
		BackgroundTransparency = Theme.transparency(s2),
		Size = p41,
		ZIndex = 2,
		SelectionImageObject = v115
	})

	Create("UICorner")({
		CornerRadius = Theme.DefaultCornerRadius,
		Parent = u118
	})

	local v119 = Create("UIStroke")({
		Name = "Border",
		Color = Theme.color(s1),
		Transparency = Theme.transparency(s1),
		Thickness = Theme.DefaultStokeThickness,
		Parent = u118
	})

	Create("BoolValue")({
		Name = "Enabled",
		Parent = u118,
		Value = true
	})

	if p42 then
		u118.MouseButton1Click:Connect(function() -- line: 365
			-- upvalues: p42 (copy), t5 (copy), UserInputService (copy)
			p42(t5[UserInputService:GetLastInputType()] or false)
		end)
	else
		if v119 then
			v119.Enabled = false
		end

		u118.Selectable = false
	end

	local u120 = nil

	local function selectButton() -- line: 385
		-- upvalues: p44 (copy), p43 (copy), u118 (ref), Theme (copy), u120 (ref)
		local v414 = p44

		if v414 == nil and p43 then
			v414 = p43.HubRef
		end

		if v414 and v414.Active or v414 == nil then
			u118.BackgroundColor3 = Theme.color("DefaultButtonHover")
			u118.BackgroundTransparency = Theme.transparency("DefaultButtonHover")

			local v415 = u118

			if u120 then
				v415 = u120
			end

			if v414 then
				v414:ScrollToFrame(v415)
			end
		end
	end

	u118.InputBegan:Connect(function(input) -- line: 412
		-- upvalues: u118 (ref), selectButton (copy)
		if u118.Selectable and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			selectButton()
		end
	end)
	u118.InputEnded:Connect(function(input) -- line: 417
		-- upvalues: u118 (ref), GuiService (copy), Theme (copy), s2 (ref)
		if u118.Selectable and (GuiService.SelectedCoreObject ~= u118 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch)) then
			u118.BackgroundColor3 = Theme.color(s2)
			u118.BackgroundTransparency = Theme.transparency(s2)
		end
	end)
	u118.SelectionGained:Connect(function() -- line: 423
		-- upvalues: selectButton (copy)
		selectButton()
	end)
	u118.SelectionLost:Connect(function() -- line: 426
		-- upvalues: u118 (ref), Theme (copy), s2 (ref)
		u118.BackgroundColor3 = Theme.color(s2)
		u118.BackgroundTransparency = Theme.transparency(s2)
	end)
	GuiService.Changed:Connect(function(property) -- line: 430
		-- upvalues: VRService (copy), UserInputService (copy), GuiService (copy), u118 (ref), Theme (copy), s2 (ref), selectButton (copy)
		if property ~= "SelectedCoreObject" then
			return
		end

		if VRService.VREnabled or UserInputService.PreferredInput == Enum.PreferredInput.Touch and ((not UserInputService.GamepadEnabled or not true) and not false) then
			return
		end

		if GuiService.SelectedCoreObject == nil or GuiService.SelectedCoreObject ~= u118 then
			u118.BackgroundColor3 = Theme.color(s2)
			u118.BackgroundTransparency = Theme.transparency(s2)

			return
		end

		if u118.Selectable then
			selectButton()
		end
	end)

	return u118, function(p46) --[[ setRowRef ]] -- line: 381
		-- upvalues: u120 (ref)
		u120 = p46
	end
end
local function MakeButton(p47, p48, p49, p50, p51, p52) -- line: 451
	-- upvalues: MakeDefaultButton (copy), Create (copy), Theme (copy), GuiService (copy), UserInputService (copy), v38 (copy), EngineFeature2 (copy)
	local v128, v129 = MakeDefaultButton(p47, p49, p50, p51, p52)
	local v130 = Create("TextLabel")({
		Name = p47 .. "TextLabel",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = Theme.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)),
		TextTransparency = Theme.transparency("WhiteButtonText", 0),
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = Theme.font(Enum.Font.SourceSansBold, "Button"),
		TextSize = Theme.textSize(24, "Button"),
		Text = p48,
		TextScaled = false,
		TextWrapped = true,
		ZIndex = 2,
		Parent = v128
	})
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint", v130)
	local v132 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	if UserInputService.TouchEnabled and (v132.Y < 500 or v132.X < 700) then
		v130.TextSize = Theme.textSize(18)
	elseif v38 and (p47 ~= "FriendStatus" and p47 ~= "BlockButton") then
		v130.TextSize = Theme.textSize(36)
	end

	if not EngineFeature2 then
		UITextSizeConstraint.MaxTextSize = v130.TextSize
	else
		local u133 = (GuiService.PreferredTextSize.Value - 1) * 3

		UITextSizeConstraint.MaxTextSize = v130.TextSize + u133

		local TextSize = v130.TextSize

		GuiService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() -- line: 487
			-- upvalues: u133 (ref), GuiService (copy), UITextSizeConstraint (copy), TextSize (copy)
			u133 = (GuiService.PreferredTextSize.Value - 1) * 3
			UITextSizeConstraint.MaxTextSize = TextSize + u133
		end)
	end

	return v128, v130, v129
end
local function MakeImageButton(p53, p54, p55, p56, p57, p58, p59, p60) -- line: 496
	-- upvalues: MakeDefaultButton (copy), Migration (copy), Theme (copy), Create (copy), v30 (copy), BuilderIcons (copy)
	if not p60 then
		p60 = "ImageButton"
	end

	local v143, v144 = MakeDefaultButton(p53, p55, p57, p58, p59, p60)
	local ImageRectOffset = nil
	local ImageRectSize = nil
	local v147 = Migration.uiblox[p54] or Migration.luaApps[p54]

	if not string.match(p54, "^rbxasset://") then
		p54 = Theme.Images[p54]
	end

	if typeof(p54) == "table" then
		ImageRectOffset = p54.ImageRectOffset
		ImageRectSize = p54.ImageRectSize
		p54 = p54.Image
	end

	local v148 = if not v147 then Create("ImageLabel")({
		Name = p53 .. "ImageLabel",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p56,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p54,
		ImageRectOffset = ImageRectOffset,
		ImageRectSize = ImageRectSize,
		ZIndex = 2,
		Parent = v143
	}) else Create("TextLabel")({
		Name = p53 .. "TextLabel",
		BackgroundTransparency = 1,
		Size = p56,
		TextSize = if not v30 then p56.Y.Offset * 0.6666666666666666 else p56.Y.Offset * 0.8571428571428571,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		TextColor3 = Color3.new(1, 1, 1),
		Text = v147.name,
		FontFace = BuilderIcons.Font[v147.variant],
		Parent = v143,
		ZIndex = 2
	})

	if p60 == "ImageButton" then
		v143.Border.Thickness = 0
		v143.Border.Transparency = 1
	end

	return v143, v148, v144
end
local function AddButtonRow(p61, p62, p63, p64, p65, p66) -- line: 551
	-- upvalues: MakeButton (copy), Create (copy)
	local v155, v156, v157 = MakeButton(p62, p63, p64, p65, p61, p66)
	local v158 = Create("Frame")({
		Name = p62 .. "Row",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, p64.Y.Scale, p64.Y.Offset),
		Parent = p61.Page
	})

	v155.Parent = v158
	v155.AnchorPoint = Vector2.new(1, 0)
	v155.Position = UDim2.new(1, -20, 0, 0)

	return v158, v155, v156, v157
end
local function MakeRoundedRectFocusState(p67, p68) -- line: 567
	-- upvalues: Create (copy), uDim (copy), Theme (copy), RunService (copy), UserGameSettings (copy)
	local v161 = Create("Frame")({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 12, 1, 12),
		Position = UDim2.fromOffset(-6, -6)
	})

	Create("UICorner")({
		CornerRadius = uDim,
		Parent = v161
	})

	local v162 = Create("UIStroke")({
		Color = Theme.selectionCursor.AnimatedColor,
		Transparency = 0,
		Thickness = 3,
		Parent = v161
	})
	local v163 = Create("UIGradient")({
		Rotation = 0,
		Color = Theme.selectionCursor.GradientColorSequence,
		Transparency = Theme.selectionCursor.GradientTransparencySequence,
		Parent = v162
	})

	RunService:UnbindFromRenderStep(p68)
	RunService:BindToRenderStep(p68, Enum.RenderPriority.Last.Value, function() -- line: 594
		-- upvalues: v163 (copy), Theme (copy), UserGameSettings (copy)
		local v419 = v163.Rotation + 2
		local GradientColorSequence = Theme.selectionCursor.GradientColorSequence
		local GradientTransparencySequence = Theme.selectionCursor.GradientTransparencySequence

		if UserGameSettings.ReducedMotion then
			local v422 = (math.sin((math.rad(v419))) + 1) / 2
			local Value = GradientColorSequence.Keypoints[1].Value
			local Value2 = GradientColorSequence.Keypoints[#GradientColorSequence.Keypoints].Value

			GradientColorSequence = ColorSequence.new(Value:lerp(Value2, v422))

			local Value3 = GradientTransparencySequence.Keypoints[1].Value
			local Value4 = GradientTransparencySequence.Keypoints[#GradientTransparencySequence.Keypoints].Value

			GradientTransparencySequence = NumberSequence.new(Value3 + (Value4 - Value3) * v422)
		end

		v163.Rotation = v419
		v163.Color = GradientColorSequence
		v163.Transparency = GradientTransparencySequence
	end)
	p67.AncestryChanged:Connect(function(_, parent) -- line: 618
		-- upvalues: RunService (copy), p68 (copy)
		if not parent then
			RunService:UnbindFromRenderStep(p68)
		end
	end)
	p67.SelectionImageObject = v161
end
local function CreateDropDown(p70, p71, p72) -- line: 627
	-- upvalues: Theme (copy), HttpService (copy), GuiService (copy), Create (copy), v21 (copy), CoreGui (copy), VRService (copy), isInExperienceUIVREnabled (copy), CorePackages2 (copy), UserInputService (copy), ContextActionService (copy), FFlagHideShortcutsWhileIemDropdownActive (copy), v24 (copy), RobloxTranslator (copy), MakeButton (copy)
	local v167 = Theme.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178))
	local color3 = Color3.fromRGB(229, 229, 229)
	local v169 = Theme.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255))
	local DropDownFrame = nil
	local t6 = {
		CurrentIndex = nil,
		UpdateDropDownList = nil,
		DropDownFrame = nil,
		Selections = nil
	}

	Instance.new("BindableEvent").Name = "IndexChanged"

	if type(p70) ~= "table" then
		error("CreateDropDown dropDownStringTable (first arg) is not a table", 2)

		return t6
	end

	local BindableEvent = Instance.new("BindableEvent")

	BindableEvent.Name = "IndexChanged"

	local u173 = true
	local guid = HttpService:GenerateGUID(false)
	local DropDownFrameEnabled = nil
	local u176 = p70
	local v177, _ = GuiService:GetGuiInset()
	local v179 = Create("ImageButton")({
		Name = "DropDownFullscreenFrame",
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, not v21 and 0 or v177.Y),
		Position = if not v21 then nil else UDim2.new(0, 0, 0, -v177.Y),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 10,
		Active = true,
		Visible = false,
		Selectable = false,
		AutoButtonColor = false,
		Parent = CoreGui.RobloxGui
	})

	local function onVREnabled(p73) -- line: 679
		-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), CorePackages2 (copy), v179 (copy), CoreGui (copy), t6 (copy), u176 (ref)
		if p73 ~= "VREnabled" then
			return
		end

		if VRService.VREnabled then
			if isInExperienceUIVREnabled then
				local VrSpatialUi = require(CorePackages2.Workspace.Packages.VrSpatialUi)
				local PanelType = VrSpatialUi.Constants.PanelType

				v179.Parent = VrSpatialUi.UIManager.getInstance():getPanelObject(PanelType.MoreMenu)
				v179.BackgroundTransparency = 0.2
			else
				v179.Parent = require(CorePackages2.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI()
				v179.BackgroundTransparency = 1
			end
		else
			v179.Parent = CoreGui.RobloxGui
			v179.BackgroundTransparency = 0.2
		end

		if t6.UpdateDropDownList then
			t6:UpdateDropDownList(u176)
		end
	end

	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")

	local v181 = Create("ImageLabel")({
		Name = "DropDownSelectionFrame",
		Image = "",
		ScaleType = Enum.ScaleType.Stretch,
		SliceCenter = Rect.new(8, 6, 46, 44),
		BackgroundTransparency = Theme.transparency("DropdownListBg", 1),
		BackgroundColor3 = Theme.color("DropdownListBg"),
		Size = UDim2.new(0.6, 0, 0.9, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ZIndex = 10,
		Parent = v179
	})

	Create("UICorner")({
		CornerRadius = Theme.DefaultCornerRadius,
		Parent = v181
	})

	local v182 = Create("ScrollingFrame")({
		Name = "DropDownScrollingFrame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -20, 1, -25),
		Position = UDim2.new(0, 10, 0, 10),
		ZIndex = 10,
		ScrollBarThickness = Theme.DefaultScrollBarThickness,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Parent = v181
	})
	local connection = nil
	local u184 = false

	local function v185(p74, p75) -- line: 743
		-- upvalues: t6 (copy), u173 (ref), p72 (copy), v179 (copy), VRService (copy), UserInputService (copy), GuiService (copy), DropDownFrame (ref), connection (ref), ContextActionService (copy), guid (copy), DropDownFrameEnabled (ref), u184 (ref), isInExperienceUIVREnabled (copy), CorePackages2 (copy)
		if p74 ~= nil and p75 ~= Enum.UserInputState.Begin then
			return
		end

		t6.DropDownFrame.Selectable = u173
		p72:SetActive(true)

		if v179.Visible and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false))) then
			GuiService.SelectedCoreObject = DropDownFrame
		end

		v179.Visible = false

		if connection then
			connection:Disconnect()
		end

		ContextActionService:UnbindCoreAction(guid .. "Action")
		ContextActionService:UnbindCoreAction(guid .. "FreezeAction")
		DropDownFrameEnabled.Value = u173
		u184 = false

		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(CorePackages2.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v179, 0)
		end
	end
	local function v186() -- line: 773
	end

	local v187 = RobloxTranslator:FormatByKey("Feature.SettingsHub.Label.ChooseOne")
	local uDim2 = UDim2.new(0.6, 0, 0, 40)

	t6.DropDownFrame = MakeButton("DropDownFrame", v187, uDim2, function() -- line: 775
		-- upvalues: u173 (ref), t6 (copy), u184 (ref), v179 (copy), VRService (copy), isInExperienceUIVREnabled (copy), CorePackages2 (copy), DropDownFrame (ref), GuiService (copy), connection (ref), v169 (copy), color3 (copy), v167 (copy), v185 (copy), FFlagHideShortcutsWhileIemDropdownActive (copy), v24 (copy), ContextActionService (copy), guid (copy), v186 (copy), p72 (copy), DropDownFrameEnabled (ref)
		if not u173 then
			return
		end

		t6.DropDownFrame.Selectable = false
		u184 = true
		v179.Visible = true

		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(CorePackages2.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v179, 0.5)
		end

		DropDownFrame = t6.DropDownFrame

		if t6.CurrentIndex and t6.CurrentIndex > 0 then
			GuiService.SelectedCoreObject = t6.Selections[t6.CurrentIndex]
		elseif #t6.Selections > 0 then
			GuiService.SelectedCoreObject = t6.Selections[1]
		end

		connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() -- line: 798
			-- upvalues: t6 (copy), GuiService (copy), v169 (copy), VRService (copy), color3 (copy), v167 (copy)
			for i = 1, #t6.Selections do
				if GuiService.SelectedCoreObject == t6.Selections[i] then
					t6.Selections[i].TextColor3 = v169
				else
					t6.Selections[i].TextColor3 = VRService.VREnabled and color3 or v167
				end
			end
		end)

		local v434 = v185

		if FFlagHideShortcutsWhileIemDropdownActive then
			v24:setHideShortcutBar("InExperienceMenuDropdown", true)

			function v434(p76, p77) -- line: 812
				-- upvalues: v185 (copy), v24 (copy)
				v185(p76, p77)
				v24:setHideShortcutBar("InExperienceMenuDropdown", false)
			end
		end

		ContextActionService:BindCoreAction(guid .. "FreezeAction", v186, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1)
		ContextActionService:BindCoreAction(guid .. "Action", v434, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
		p72:SetActive(false)
		DropDownFrameEnabled.Value = false
	end, nil, p72)
	t6.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0)
	t6.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5)
	DropDownFrameEnabled = t6.DropDownFrame.Enabled

	local DropDownFrameTextLabel = t6.DropDownFrame.DropDownFrameTextLabel

	DropDownFrameTextLabel.Position = UDim2.new(0, 15, 0, 0)
	DropDownFrameTextLabel.Size = UDim2.new(1, -50, 1, 0)
	DropDownFrameTextLabel.ClipsDescendants = true
	DropDownFrameTextLabel.TextXAlignment = Enum.TextXAlignment.Left

	local v190 = Create("ImageLabel")({
		Name = "DropDownImage",
		Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0.5),
		Size = UDim2.new(0, 15, 0, 10),
		Position = UDim2.new(1, -12, 0.5, 0),
		ZIndex = 2,
		Parent = t6.DropDownFrame
	})

	t6.DropDownImage = v190

	local function setSelection(p78) -- line: 865
		-- upvalues: t6 (copy), DropDownFrameTextLabel (copy), BindableEvent (copy)
		local v436 = false

		for k, v in pairs(t6.Selections) do
			if k == p78 then
				DropDownFrameTextLabel.Text = v.Text
				t6.CurrentIndex = k
				v436 = true
			end
		end

		if v436 then
			BindableEvent:Fire(p78)
		end
	end
	local function setSelectionByValue(p79) -- line: 881
		-- upvalues: t6 (copy), DropDownFrameTextLabel (copy), BindableEvent (copy)
		local v440 = false

		for k, v in pairs(t6.Selections) do
			if p79 == v.Text then
				DropDownFrameTextLabel.Text = v.Text
				t6.CurrentIndex = k
				v440 = true
			end
		end

		if v440 then
			BindableEvent:Fire(t6.CurrentIndex)
		end

		return v440
	end

	t6.IndexChanged = BindableEvent.Event

	function t6.SetSelectionIndex(_, p81) -- line: 913
		-- upvalues: setSelection (copy)
		setSelection(p81)
	end
	function t6.SetSelectionByValue(_, p83) -- line: 917
		-- upvalues: setSelectionByValue (copy)
		return (setSelectionByValue(p83))
	end
	function t6.ResetSelectionIndex(_) -- line: 921
		-- upvalues: t6 (copy), DropDownFrameTextLabel (copy), v187 (copy), v185 (copy)
		t6.CurrentIndex = nil
		DropDownFrameTextLabel.Text = v187
		v185()
	end
	function t6.GetSelectedIndex(_) -- line: 927
		-- upvalues: t6 (copy)
		return t6.CurrentIndex
	end
	function t6.SetZIndex(_, p87) -- line: 931
		-- upvalues: t6 (copy), v190 (copy), DropDownFrameTextLabel (copy)
		t6.DropDownFrame.ZIndex = p87
		v190.ZIndex = p87
		DropDownFrameTextLabel.ZIndex = p87
	end
	function t6.SetInteractable(_, p89) -- line: 937
		-- upvalues: u173 (ref), t6 (copy), v185 (copy), VRService (copy), DropDownFrameEnabled (ref), u184 (ref)
		u173 = p89
		t6.DropDownFrame.Selectable = u173

		if not u173 then
			v185()

			if VRService.VREnabled then
				t6.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5
				t6.DropDownFrame.ImageTransparency = 0.5
				t6.DropDownImage.ImageTransparency = 0.5
			else
				t6.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
				t6.DropDownFrame.ImageTransparency = 0
				t6.DropDownImage.ImageTransparency = 0
			end

			if not VRService.VREnabled then
				t6:SetZIndex(1)
			end
		else
			t6.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0
			t6.DropDownFrame.ImageTransparency = 0
			t6.DropDownImage.ImageTransparency = 0

			if not VRService.VREnabled then
				t6:SetZIndex(2)
			end
		end

		DropDownFrameEnabled.Value = p89 and not u184
		t6.DropDownImage.Visible = p89

		if p89 then
			t6.DropDownFrame.ImageTransparency = 0

			return
		end

		t6.DropDownFrame.ImageTransparency = 0.5
	end
	function t6.SetAutoLocalize(_, p91) -- line: 964
		-- upvalues: v179 (copy)
		v179.AutoLocalize = p91
	end
	function t6.UpdateDropDownList(_, p93) -- line: 968
		-- upvalues: u176 (ref), t6 (copy), VRService (copy), Theme (copy), Create (copy), color3 (copy), v167 (copy), v182 (copy), p71 (copy), DropDownFrameTextLabel (copy), v169 (copy), v185 (copy), BindableEvent (copy), UserInputService (copy), GuiService (copy), guid (copy), v179 (copy), v181 (copy)
		u176 = p93

		if t6.Selections then
			for i = 1, #t6.Selections do
				t6.Selections[i]:Destroy()
			end
		end

		t6.Selections = {}
		t6.SelectionInfo = {}

		local VREnabled = VRService.VREnabled
		local v460 = VREnabled and Theme.font(Enum.Font.SourceSansBold, "Bold") or Theme.font(Enum.Font.SourceSans, "UtilityText")
		local v461 = VREnabled and Theme.textSize(36) or Theme.textSize(24, "UtilityText")
		local v462 = not VREnabled and 50 or 70
		local v463 = v462 + 1
		local v464 = not VREnabled and 400 or 600
		local n2 = 0

		for k, v in pairs(p93) do
			local v468 = Create("Frame")({
				BackgroundTransparency = 0.7,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			})

			Create("UICorner")({
				CornerRadius = Theme.DefaultCornerRadius,
				Parent = v468
			})

			local v469 = v
			local s3 = ""
			local v471 = typeof(v) == "table"

			if v471 then
				v469 = v.title
				s3 = v.subtitle
				n2 += 10
			end

			local u472

			if v471 then
				u472 = Create("TextButton")({
					Name = "Selection" .. tostring(k),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false,
					TextYAlignment = Enum.TextYAlignment.Top,
					Size = UDim2.new(1, -28, 0, v462 + 10),
					Position = UDim2.new(0, 14, 0, (k - 1) * (v463 + 10)),
					TextColor3 = VRService.VREnabled and color3 or v167,
					Font = v460,
					TextSize = v461,
					Text = v469,
					ZIndex = 10,
					SelectionImageObject = v468,
					Parent = v182
				})
				Create("TextLabel")({
					Name = "Subtitle" .. tostring(k),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -28, 0, v462 * 0.8),
					Position = UDim2.new(0, 14, 0, 15),
					TextColor3 = VRService.VREnabled and color3 or v167,
					Font = v460,
					TextSize = v461 * 0.8,
					Text = s3,
					ZIndex = 10,
					Parent = u472
				})
			else
				u472 = Create("TextButton")({
					Name = "Selection" .. tostring(k),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false,
					Size = UDim2.new(1, -28, 0, v462),
					Position = UDim2.new(0, 14, 0, (k - 1) * v463),
					TextColor3 = VRService.VREnabled and color3 or v167,
					Font = v460,
					TextSize = v461,
					Text = v,
					ZIndex = 10,
					SelectionImageObject = v468,
					Parent = v182
				})
			end

			if k == p71 then
				t6.CurrentIndex = k
				DropDownFrameTextLabel.Text = v469
				u472.TextColor3 = v169
			elseif not p71 and k == 1 then
				u472.TextColor3 = v169
			end

			local function v473() -- line: 1072
				-- upvalues: DropDownFrameTextLabel (copy), u472 (ref), v185 (copy), t6 (copy), k (copy), BindableEvent (copy)
				DropDownFrameTextLabel.Text = u472.Text
				v185()
				t6.CurrentIndex = k
				BindableEvent:Fire(k)
			end

			u472.MouseButton1Click:Connect(v473)
			u472.MouseEnter:Connect(function() -- line: 1081
				-- upvalues: VRService (copy), UserInputService (copy), GuiService (copy), u472 (ref)
				if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
					GuiService.SelectedCoreObject = u472
				end
			end)
			t6.Selections[k] = u472
			t6.SelectionInfo[u472] = {
				Clicked = v473
			}
		end

		GuiService:RemoveSelectionGroup(guid)
		GuiService:AddSelectionTuple(guid, unpack(t6.Selections))
		v182.CanvasSize = UDim2.new(1, -20, 0, #p93 * v463 + n2)

		local function updateDropDownSize() -- line: 1097
			-- upvalues: v182 (copy), v179 (copy), v181 (copy), v464 (copy)
			if v182.CanvasSize.Y.Offset < v179.AbsoluteSize.Y - 10 then
				v181.Size = UDim2.new(0, v464, 0, v182.CanvasSize.Y.Offset + 25)

				return
			end

			v181.Size = UDim2.new(0, v464, 0.9, 0)
		end

		v179.Changed:Connect(function(property) -- line: 1110
			-- upvalues: updateDropDownSize (copy)
			if property ~= "AbsoluteSize" then
				return
			end

			updateDropDownSize()
		end)
		updateDropDownSize()
	end

	t6:UpdateDropDownList(p70)
	v179.MouseButton1Click:Connect(v185)
	p72.PoppedMenu:Connect(function(p94) -- line: 1125
		-- upvalues: v179 (copy), v185 (copy)
		if p94 == v179 then
			v185()
		end
	end)

	return t6
end
local function CreateSelector(p95, p96) -- line: 1134
	-- upvalues: Create (copy), v42 (copy), Theme (copy), v4 (copy), UserInputService (copy), v5 (copy), addHoverState (copy), VRService (copy), GuiService (copy), EaseOutQuad (copy), EngineFeature (copy), v6 (copy), v38 (copy), v39 (copy), v40 (copy), t1 (copy)
	local n3 = 0
	local t7 = {
		HubRef = nil,
		SetSelectionIndex = nil
	}

	if type(p95) ~= "table" then
		error("CreateSelector selectionStringTable (first arg) is not a table", 2)

		return t7
	end

	local BindableEvent = Instance.new("BindableEvent")

	BindableEvent.Name = "IndexChanged"

	local u198 = true

	t7.CurrentIndex = 0
	t7.SelectorFrame = Create("ImageButton")({
		Name = "Selector",
		Image = "",
		AutoButtonColor = false,
		NextSelectionLeft = t7.SelectorFrame,
		NextSelectionRight = t7.SelectorFrame,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.6, 0, 0, 50),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		ZIndex = 2,
		SelectionImageObject = v42
	})

	local v199 = Create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, Theme.SelectorArrowButtonWidth, 0, 50),
		Image = "",
		ZIndex = 3,
		Selectable = false,
		SelectionImageObject = v42,
		Parent = t7.SelectorFrame
	})
	local v200 = Create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, Theme.SelectorArrowButtonWidth, 0, 50),
		Image = "",
		ZIndex = 3,
		Selectable = false,
		SelectionImageObject = v42,
		Parent = t7.SelectorFrame
	})
	local v201 = Create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		Image = "rbxasset://textures/ui/Settings/Slider/Left.png",
		ImageColor3 = v4,
		ZIndex = 4,
		Parent = v199
	})
	local v202 = Create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 18, 0, 30),
		Image = "rbxasset://textures/ui/Settings/Slider/Right.png",
		ImageColor3 = v4,
		ZIndex = 4,
		Parent = v200
	})

	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local function v203(p97) -- line: 1220
			-- upvalues: v4 (copy)
			p97.ImageColor3 = v4
		end
		local function v204(p98) -- line: 1222
			-- upvalues: v5 (copy)
			p98.ImageColor3 = v5
		end

		addHoverState(v199, v201, v203, v204)
		addHoverState(v200, v202, v203, v204)
	end

	t7.Selections = {}

	local t8 = {}
	local t9 = {}
	local v207 = Create("ImageButton")({
		Name = "AutoSelectButton",
		BackgroundTransparency = 1,
		Image = "",
		Position = UDim2.new(0, v199.Size.X.Offset, 0, 0),
		Size = UDim2.new(1, v199.Size.X.Offset * -2, 1, 0),
		Parent = t7.SelectorFrame,
		ZIndex = 2,
		SelectionImageObject = v42
	})

	v207.MouseButton1Click:Connect(function() -- line: 1243
		-- upvalues: u198 (ref), t7 (copy), VRService (copy), UserInputService (copy), GuiService (copy)
		if not u198 then
			return
		end

		if #t7.Selections <= 1 then
			return
		end

		local v478 = t7.CurrentIndex + 1

		if v478 > #t7.Selections then
			v478 = 1
		end

		t7:SetSelectionIndex(v478)

		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
			GuiService.SelectedCoreObject = t7.SelectorFrame
		end
	end)
	t9[v207] = true

	local function setSelection(p99, p100) -- line: 1262
		-- upvalues: t7 (copy), v199 (copy), t8 (ref), EaseOutQuad (copy), EngineFeature (copy), BindableEvent (copy)
		for k, v in pairs(t7.Selections) do
			local v483 = k == p99
			local uDim2 = UDim2.new(0, v199.Size.X.Offset, 0, 0)
			local uDim2_2 = UDim2.new(0, v199.Size.X.Offset * p100 * 3, 0, 0)

			if t8[v] then
				uDim2_2 = UDim2.new(0, v199.Size.X.Offset * -p100 * 3, 0, 0)
			end

			if uDim2_2.X.Offset < 0 then
				uDim2_2 = UDim2.new(0, uDim2_2.X.Offset + v.AbsoluteSize.X / 4, 0, 0)
			end

			if v483 then
				t8[v] = true
				v.Position = uDim2_2
				v.Visible = true
				PropertyTweener(v, "TextTransparency", 1, 0, 0.165, EaseOutQuad)

				if v:IsDescendantOf(game) then
					if EngineFeature then
						v:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
					else
						v:TweenPosition(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true)
					end
				else
					v.Position = uDim2
				end

				t7.CurrentIndex = k
				BindableEvent:Fire(p99)
			elseif t8[v] then
				t8[v] = false
				PropertyTweener(v, "TextTransparency", 0, 1, 0.165, EaseOutQuad)

				if v:IsDescendantOf(game) then
					if EngineFeature then
						v:TweenPositionInternal(uDim2_2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
					else
						v:TweenPosition(uDim2_2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true)
					end
				else
					v.Position = uDim2_2
				end
			end
		end
	end
	local function stepFunc(p101, p102) -- line: 1333
		-- upvalues: u198 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t7 (copy), setSelection (copy)
		if not u198 then
			return
		end

		if p101 ~= nil and p101.UserInputType ~= Enum.UserInputType.MouseButton1 and p101.UserInputType ~= Enum.UserInputType.Gamepad1 and p101.UserInputType ~= Enum.UserInputType.Gamepad2 and p101.UserInputType ~= Enum.UserInputType.Gamepad3 and p101.UserInputType ~= Enum.UserInputType.Gamepad4 and p101.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
			GuiService.SelectedCoreObject = t7.SelectorFrame
		end

		local v488 = p102 + t7.CurrentIndex
		local v489 = not (v488 > t7.CurrentIndex) and -1 or 1

		if v488 > #t7.Selections then
			v488 = 1
		elseif v488 < 1 then
			v488 = #t7.Selections
		end

		setSelection(v488, v489)
	end

	local connection = nil

	t7.IndexChanged = BindableEvent.Event

	function t7.SetSelectionIndex(_, p104) -- line: 1387
		-- upvalues: setSelection (copy)
		setSelection(p104, 1)
	end
	function t7.GetSelectedIndex(_) -- line: 1391
		-- upvalues: t7 (copy)
		return t7.CurrentIndex
	end
	function t7.SetZIndex(_, p107) -- line: 1395
		-- upvalues: v199 (copy), v200 (copy), v201 (copy), v202 (copy), t7 (copy)
		v199.ZIndex = p107
		v200.ZIndex = p107
		v201.ZIndex = p107
		v202.ZIndex = p107

		for i = 1, #t7.Selections do
			t7.Selections[i].ZIndex = p107
		end
	end
	function t7.SetInteractable(_, p109) -- line: 1406
		-- upvalues: u198 (ref), t7 (copy), v199 (copy), v200 (copy), Theme (copy), v201 (copy), v6 (copy), v202 (copy), v4 (copy)
		u198 = p109
		t7.SelectorFrame.Selectable = u198
		v199.Active = u198
		v200.Active = u198
		v199.Visible = u198
		v200.Visible = u198

		if not u198 then
			for _, v in pairs(t7.Selections) do
				v.TextColor3 = Theme.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255))
			end

			v201.ImageColor3 = v6
			v202.ImageColor3 = v6

			return
		end

		for _, v in pairs(t7.Selections) do
			v.TextColor3 = Color3.fromRGB(255, 255, 255)
		end

		v201.ImageColor3 = v4
		v202.ImageColor3 = v4
	end
	function t7.UpdateOptions(_, p111) -- line: 1431
		-- upvalues: t7 (copy), t8 (ref), Create (copy), v199 (copy), Theme (copy), v38 (copy), p96 (copy), v200 (copy)
		for _, v in pairs(t7.Selections) do
			v:Destroy()
		end

		t8 = {}
		t7.Selections = {}

		for k, v in pairs(p111) do
			local v508 = Create("TextLabel")({
				Name = "Selection" .. tostring(k),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, v199.Size.X.Offset * -2, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = Theme.font(Enum.Font.SourceSans, "UtilityText"),
				TextSize = Theme.textSize(24, "UtilityText"),
				TextWrapped = true,
				Text = v,
				ZIndex = 2,
				Visible = false,
				Parent = t7.SelectorFrame
			})

			if v38 then
				v508.TextSize = Theme.textSize(36)
			end

			if k == p96 then
				t7.CurrentIndex = k
				v508.Position = UDim2.new(0, v199.Size.X.Offset, 0, 0)
				v508.Visible = true
				t8[v508] = true
			else
				t8[v508] = false
			end

			t7.Selections[k] = v508
		end

		local v509 = #t7.Selections > 1

		v199.Visible = v509
		v200.Visible = v509
	end

	VRService.Changed:Connect(function(property) --[[ onVREnabled ]] -- line: 1479
		-- upvalues: VRService (copy), v199 (copy), v200 (copy), v207 (copy)
		if property ~= "VREnabled" then
			return
		end

		local VREnabled = VRService.VREnabled

		v199.Selectable = VREnabled
		v200.Selectable = VREnabled
		v207.Selectable = VREnabled
	end)

	local VREnabled = VRService.VREnabled

	v199.Selectable = VREnabled
	v200.Selectable = VREnabled
	v207.Selectable = VREnabled
	v199.InputBegan:Connect(function(input) -- line: 1491
		-- upvalues: v39 (copy), v40 (copy), u198 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t7 (copy), setSelection (copy)
		if v39(false) or v40(false) and input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not u198 then
				return
			end

			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = t7.SelectorFrame
			end

			local v513 = -1 + t7.CurrentIndex
			local v514 = not (v513 > t7.CurrentIndex) and -1 or 1

			if v513 > #t7.Selections then
				v513 = 1
			elseif v513 < 1 then
				v513 = #t7.Selections
			end

			setSelection(v513, v514)
		end
	end)
	v200.InputBegan:Connect(function(input) -- line: 1497
		-- upvalues: v39 (copy), v40 (copy), u198 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t7 (copy), setSelection (copy)
		if v39(false) or v40(false) and input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not u198 then
				return
			end

			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = t7.SelectorFrame
			end

			local v516 = 1 + t7.CurrentIndex
			local v517 = not (v516 > t7.CurrentIndex) and -1 or 1

			if v516 > #t7.Selections then
				v516 = 1
			elseif v516 < 1 then
				v516 = #t7.Selections
			end

			setSelection(v516, v517)
		end
	end)

	local u212 = true

	t7:UpdateOptions(p95)
	UserInputService.InputBegan:Connect(function(input) -- line: 1507
		-- upvalues: u198 (ref), u212 (ref), GuiService (copy), t7 (copy), VRService (copy), UserInputService (copy), setSelection (copy)
		if not u198 then
			return
		end

		if not u212 then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.Gamepad1 and input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		if GuiService.SelectedCoreObject ~= t7.SelectorFrame then
			return
		end

		if input.KeyCode == Enum.KeyCode.DPadLeft or input.KeyCode == Enum.KeyCode.Left or input.KeyCode == Enum.KeyCode.A then
			if not u198 then
				return
			end

			if input ~= nil and input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Gamepad1 and input.UserInputType ~= Enum.UserInputType.Gamepad2 and input.UserInputType ~= Enum.UserInputType.Gamepad3 and input.UserInputType ~= Enum.UserInputType.Gamepad4 and input.UserInputType ~= Enum.UserInputType.Keyboard then
				return
			end

			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = t7.SelectorFrame
			end

			local v519 = -1 + t7.CurrentIndex
			local v520 = not (v519 > t7.CurrentIndex) and -1 or 1

			if v519 > #t7.Selections then
				v519 = 1
			elseif v519 < 1 then
				v519 = #t7.Selections
			end

			setSelection(v519, v520)

			return
		end

		if input.KeyCode == Enum.KeyCode.DPadRight or input.KeyCode == Enum.KeyCode.Right or input.KeyCode == Enum.KeyCode.D then
			if not u198 then
				return
			end

			if input ~= nil and input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Gamepad1 and input.UserInputType ~= Enum.UserInputType.Gamepad2 and input.UserInputType ~= Enum.UserInputType.Gamepad3 and input.UserInputType ~= Enum.UserInputType.Gamepad4 and input.UserInputType ~= Enum.UserInputType.Keyboard then
				return
			end

			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = t7.SelectorFrame
			end

			local v521 = 1 + t7.CurrentIndex
			local v522 = not (v521 > t7.CurrentIndex) and -1 or 1

			if v521 > #t7.Selections then
				v521 = 1
			elseif v521 < 1 then
				v521 = #t7.Selections
			end

			setSelection(v521, v522)
		end
	end)
	UserInputService.InputChanged:Connect(function(input) -- line: 1540
		-- upvalues: u198 (ref), u212 (ref), n3 (ref), GuiService (copy), t7 (copy), stepFunc (copy)
		if not u198 then
			return
		end

		if not u212 then
			n3 = 0

			return
		end

		if input.UserInputType ~= Enum.UserInputType.Gamepad1 then
			return
		end

		local SelectedCoreObject = GuiService.SelectedCoreObject

		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t7.SelectorFrame.Parent) then
			return
		end

		if input.KeyCode ~= Enum.KeyCode.Thumbstick1 then
			return
		end

		if input.Position.X > 0.8 and input.Delta.X > 0 and n3 ~= 1 then
			n3 = 1
			stepFunc(input, n3)

			return
		end

		if input.Position.X < -0.8 and input.Delta.X < 0 and n3 ~= -1 then
			n3 = -1
			stepFunc(input, n3)

			return
		end

		if math.abs(input.Position.X) < 0.8 then
			n3 = 0
		end
	end)
	t7.SelectorFrame.AncestryChanged:Connect(function(_, parent) -- line: 1581
		-- upvalues: u212 (ref), connection (ref), GuiService (copy), t7 (copy), t9 (copy), VRService (copy)
		u212 = parent

		if not u212 then
			if connection then
				connection:Disconnect()

				return
			end
		else
			connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() -- line: 1374
				-- upvalues: t7 (copy), GuiService (copy), t9 (copy), VRService (copy)
				if #t7.Selections <= 0 then
					return
				end

				if GuiService.SelectedCoreObject ~= nil and t9[GuiService.SelectedCoreObject] and not VRService.VREnabled then
					GuiService.SelectedCoreObject = t7.SelectorFrame
				end
			end)
		end
	end)

	local function onResized(_, p114) -- line: 1592
		-- upvalues: Theme (copy), v38 (copy), t7 (copy)
		local v529 = if not p114 then v38 and Theme.textSize(36) or Theme.textSize(24, "UtilityText") else Theme.textSize(16)

		for _, v in pairs(t7.Selections) do
			v.TextSize = v529
		end
	end

	t1[t7.SelectorFrame] = onResized

	local v214 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)
	local v215 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	onResized(v214, v215.Y > v215.X)
	connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() -- line: 1374
		-- upvalues: t7 (copy), GuiService (copy), t9 (copy), VRService (copy)
		if #t7.Selections <= 0 then
			return
		end

		if GuiService.SelectedCoreObject ~= nil and t9[GuiService.SelectedCoreObject] and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t7.SelectorFrame
		end
	end)

	return t7
end
local function ShowAlert(p115, p116, p117, p118, p119) -- line: 1611
	-- upvalues: CoreGui (copy), VRService (copy), isInExperienceUIVREnabled (copy), CorePackages2 (copy), Create (copy), Theme (copy), HttpService (copy), ContextActionService (copy), GuiService (copy), MakeButton (copy), UserInputService (copy)
	local RobloxGui2 = CoreGui.RobloxGui

	if RobloxGui2:FindFirstChild("AlertViewFullScreen") then
		return
	end

	local u222 = nil

	local function onVREnabled(p120) -- line: 1622
		-- upvalues: VRService (copy), isInExperienceUIVREnabled (copy), CorePackages2 (copy), RobloxGui2 (ref), CoreGui (copy), u222 (ref)
		if p120 ~= "VREnabled" then
			return
		end

		local v533 = nil

		if VRService.VREnabled then
			if isInExperienceUIVREnabled then
				local VrSpatialUi = require(CorePackages2.Workspace.Packages.VrSpatialUi)
				local PanelType = VrSpatialUi.Constants.PanelType

				RobloxGui2 = VrSpatialUi.UIManager.getInstance():getPanelObject(PanelType.MoreMenu)
			else
				v533 = require(CorePackages2.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu")
				RobloxGui2 = v533:GetGUI()
			end
		else
			RobloxGui2 = CoreGui.RobloxGui
		end

		if u222 and u222.Parent ~= nil then
			u222.Parent = RobloxGui2

			if VRService.VREnabled and not isInExperienceUIVREnabled then
				v533:SetSubpanelDepth(u222, 0.5)
			end
		end
	end

	local connection = VRService.Changed:Connect(onVREnabled)

	u222 = Create("ImageLabel")({
		Name = "AlertViewBacking",
		Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 6, 46, 44),
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = UDim2.new(0, 400, 0, 350),
		Position = UDim2.new(0.5, -200, 0.5, -175),
		ZIndex = 9,
		Parent = RobloxGui2
	})
	onVREnabled("VREnabled")

	if p119 or not isInExperienceUIVREnabled and VRService.VREnabled then
		u222.ImageTransparency = 0
	else
		u222.Size = UDim2.new(0.8, 0, 0, 350)
		u222.Position = UDim2.new(0.1, 0, 0.1, 0)
	end

	if CoreGui.RobloxGui.AbsoluteSize.Y <= u222.Size.Y.Offset then
		u222.Size = UDim2.new(u222.Size.X.Scale, u222.Size.X.Offset, u222.Size.Y.Scale, CoreGui.RobloxGui.AbsoluteSize.Y)
		u222.Position = UDim2.new(u222.Position.X.Scale, -u222.Size.X.Offset / 2, 0.5, -u222.Size.Y.Offset / 2)
	end

	if not p119 then
		Create("UICorner")({
			CornerRadius = Theme.DefaultCornerRadius,
			Parent = u222
		})
		u222.BackgroundColor3 = Theme.color("MenuContainer")
		u222.BackgroundTransparency = Theme.transparency("MenuContainer")
	end

	Create("TextLabel")({
		Name = "AlertViewText",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.95, 0, 0.6, 0),
		Position = UDim2.new(0.025, 0, 0.05, 0),
		Font = Theme.font(Enum.Font.SourceSansBold, "Bold"),
		TextSize = Theme.textSize(36),
		Text = p115,
		TextWrapped = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 10,
		Parent = u222
	})
	Create("ImageLabel")({
		Image = "",
		BackgroundTransparency = 1
	})

	local guid = HttpService:GenerateGUID(false)

	local function v226(_, p122) -- line: 1721
		-- upvalues: VRService (copy), u222 (ref), isInExperienceUIVREnabled (copy), CorePackages2 (copy), p118 (copy), ContextActionService (copy), guid (copy), GuiService (copy), p117 (copy), connection (copy)
		if VRService.VREnabled and (p122 == Enum.UserInputState.Begin or p122 == Enum.UserInputState.Cancel) then
			return
		end

		if not u222 then
			return
		end

		if VRService.VREnabled and not isInExperienceUIVREnabled then
			require(CorePackages2.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(u222, 0)
		end

		u222:Destroy()
		u222 = nil

		if p118 then
			p118()
		end

		ContextActionService:UnbindCoreAction(guid)
		GuiService.SelectedCoreObject = nil

		if p117 then
			p117:ShowBar()
		end

		if connection then
			connection:Disconnect()
		end
	end

	local uDim2 = UDim2.new(1, -20, 0, 60)
	local uDim2_3 = UDim2.new(0, 10, 0.65, 0)

	if not p119 then
		uDim2 = UDim2.new(0, 200, 0, 50)
		uDim2_3 = UDim2.new(0.5, -100, 0.65, 0)
	end

	local v229, v230 = MakeButton("AlertViewButton", p116, uDim2, v226)

	v229.Position = uDim2_3
	v229.NextSelectionLeft = v229
	v229.NextSelectionRight = v229
	v229.NextSelectionUp = v229
	v229.NextSelectionDown = v229
	v229.ZIndex = 9
	v230.ZIndex = v229.ZIndex
	v229.Parent = u222

	if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
		GuiService.SelectedCoreObject = v229
	end

	GuiService.SelectedCoreObject = v229
	ContextActionService:BindCoreAction(guid, v226, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA)

	if p117 and (isInExperienceUIVREnabled or not VRService.VREnabled) then
		p117:HideBar()
		p117.Pages.CurrentPage:Hide(1, 1)
	end
end
local function CreateNewSlider(p123, p124, p125, p126, p127) -- line: 1791
	-- upvalues: HttpService (copy), Signal (copy), Create (copy), v42 (copy), RobloxGui (copy), Theme (copy), UserInputService (copy), v5 (copy), v4 (copy), v5 (copy), addHoverState (copy), v2 (copy), v3 (copy), VRService (copy), GuiService (copy), RunService (copy)
	local t10 = {}
	local num = tonumber(p123)
	local u239 = p124
	local n4 = 0
	local timestamp = nil
	local u242 = true
	local guid = HttpService:GenerateGUID(false)

	if num <= 0 then
		error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2)

		return
	end

	local v244 = p126 or p127
	local BindableEvent = Instance.new("BindableEvent")

	BindableEvent.Name = "ValueChanged"

	local v246 = Signal.new()

	t10.SliderFrame = Create("ImageButton")({
		Name = "Slider",
		Image = "",
		AutoButtonColor = false,
		NextSelectionLeft = t10.SliderFrame,
		NextSelectionRight = t10.SliderFrame,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.6, 0, 0, 50),
		AutomaticSize = if not v244 then nil else Enum.AutomaticSize.Y,
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		SelectionImageObject = v42,
		ZIndex = 2
	})

	local v247 = nil

	if v244 then
		v247 = Create("Frame")({
			Name = "StepsAndButtonsContainer",
			Size = UDim2.new(1, 0, 0, 50),
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Parent = t10.SliderFrame
		})
		Create("UIListLayout")({
			Name = "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = t10.SliderFrame
		})

		local v248 = Create("Frame")({
			Name = "SliderLabels",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Parent = t10.SliderFrame,
			LayoutOrder = 2
		})

		Create("UIPadding")({
			Name = "UIPadding",
			PaddingRight = UDim.new(0, 50),
			PaddingLeft = UDim.new(0, 50),
			Parent = v248
		})

		if p126 then
			t10.LeftLabel = Create("TextLabel")({
				Name = "LeftLabel",
				Text = p126,
				Font = Theme.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = Theme.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextTransparency = 0.25,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = v248,
				Visible = RobloxGui.AbsoluteSize.X > 460
			})
		end

		if p127 then
			t10.RightLabel = Create("TextLabel")({
				Name = "RightLabel",
				Text = p127,
				Font = Theme.font(Enum.Font.SourceSans, "UtilityRow"),
				TextSize = Theme.textSize(18, "UtilityRow"),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextTransparency = 0.25,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = v248,
				Visible = RobloxGui.AbsoluteSize.X > 460
			})
		end

		RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() -- line: 1912
			-- upvalues: t10 (copy), RobloxGui (copy)
			if t10.LeftLabel then
				t10.LeftLabel.Visible = RobloxGui.AbsoluteSize.X > 460
			end

			if t10.RightLabel then
				t10.RightLabel.Visible = RobloxGui.AbsoluteSize.X > 460
			end
		end)
	end

	t10.StepsContainer = Create("Frame")({
		Name = "StepsContainer",
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -100, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Parent = if not v244 then t10.SliderFrame else v247
	})

	local v249 = Create("ImageButton")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, Theme.SelectorArrowButtonWidth, 0, 50),
		Image = "",
		ZIndex = 3,
		Selectable = false,
		SelectionImageObject = v42,
		Active = true,
		Parent = if not v244 then t10.SliderFrame else v247
	})
	local v250 = Create("ImageButton")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, Theme.SelectorArrowButtonWidth, 0, 50),
		Image = "",
		ZIndex = 3,
		Selectable = false,
		SelectionImageObject = v42,
		Active = true,
		Parent = if not v244 then t10.SliderFrame else v247
	})
	local v251 = Create("ImageLabel")({
		Name = "LeftButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Image = "rbxasset://textures/ui/Settings/Slider/Less.png",
		ZIndex = 4,
		Parent = v249,
		ImageColor3 = UserInputService.PreferredInput == Enum.PreferredInput.Touch and v5 or v4
	})
	local v252 = Create("ImageLabel")({
		Name = "RightButton",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 30, 0, 30),
		Image = "rbxasset://textures/ui/Settings/Slider/More.png",
		ZIndex = 4,
		Parent = v250,
		ImageColor3 = UserInputService.PreferredInput == Enum.PreferredInput.Touch and v5 or v4
	})

	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		local function v253(p128) -- line: 1983
			-- upvalues: v4 (copy)
			p128.ImageColor3 = v4
		end
		local function v254(p129) -- line: 1985
			-- upvalues: v5 (copy)
			p129.ImageColor3 = v5
		end

		addHoverState(v249, v251, v253, v254)
		addHoverState(v250, v252, v253, v254)
	end

	t10.Steps = {}

	local v255 = 1 / num

	for i = 1, num do
		local v257 = Create("ImageButton")({
			Name = "Step" .. tostring(i),
			BackgroundColor3 = v2,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Active = false,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new((i - 1) * v255, 2, 0.5, 0),
			Size = UDim2.new(v255, -4, 0, 24),
			Image = "",
			ZIndex = 3,
			Selectable = false,
			ImageTransparency = 0.36,
			Parent = t10.StepsContainer,
			SelectionImageObject = v42
		})

		if i > u239 then
			v257.BackgroundColor3 = v3
		end

		if i == 1 or i == num then
			Create("UICorner")({
				CornerRadius = Theme.DefaultCornerRadius,
				Parent = v257
			})
			Create("Frame")({
				Name = "Filler",
				BackgroundColor3 = v257.BackgroundColor3,
				Parent = v257,
				Size = UDim2.new(0.25, 0, 1, 0),
				BorderSizePixel = 0,
				Position = if i ~= 1 then UDim2.new(0, 0, 0, 0) else UDim2.new(0.75, 0, 0, 0)
			})
		end

		t10.Steps[#t10.Steps + 1] = v257
	end

	local function hideSelection() -- line: 2039
		-- upvalues: num (copy), t10 (copy), v3 (copy)
		for i = 1, num do
			t10.Steps[i].BackgroundColor3 = v3

			if i == 1 or i == num then
				t10.Steps[i].Filler.BackgroundColor3 = v3
			end
		end
	end
	local function showSelection() -- line: 2047
		-- upvalues: num (copy), u239 (ref), t10 (copy), v2 (copy)
		for i = 1, num do
			if i > u239 then
				return
			end

			t10.Steps[i].BackgroundColor3 = v2

			if i == 1 or i == num then
				t10.Steps[i].Filler.BackgroundColor3 = v2
			end
		end
	end
	local function setCurrentStep(p130) -- line: 2059
		-- upvalues: p125 (ref), v249 (copy), v250 (copy), num (copy), u239 (ref), hideSelection (copy), showSelection (copy), timestamp (ref), v246 (copy), BindableEvent (copy)
		if not p125 then
			p125 = 0
		end

		v249.Visible = true
		v250.Visible = true

		if p130 <= p125 then
			p130 = p125
			v249.Visible = false
		end

		if p130 >= num then
			p130 = num
			v250.Visible = false
		end

		if p130 == u239 then
			return
		end

		u239 = p130
		hideSelection()
		showSelection()
		timestamp = tick()

		if v246 then
			v246:fire(u239)

			return
		end

		BindableEvent:Fire(u239)
	end
	local function mouseDownFunc(p131, p132, p133) -- line: 2104
		-- upvalues: u242 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t10 (copy), n4 (ref), u239 (ref), num (copy), setCurrentStep (copy)
		if not u242 then
			return
		end

		if p131 == nil then
			return
		end

		if not if p131 then p131.UserInputType == Enum.UserInputType.MouseButton1 or (p131.UserInputType == Enum.UserInputType.Touch or p131.UserInputType == Enum.UserInputType.Gamepad1 and p131.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t10.SliderFrame
		end

		if not VRService.VREnabled then
			if p133 then
				n4 = p132 - u239
			else
				n4 = 0

				local connection = nil
				local connection2 = UserInputService.InputChanged:Connect(function(input) -- line: 2130
					-- upvalues: num (copy), t10 (copy), setCurrentStep (copy)
					if input.UserInputType ~= Enum.UserInputType.MouseMovement then
						return
					end

					local PositionX = input.Position.X

					for i = 1, num do
						local AbsolutePositionX = t10.Steps[i].AbsolutePosition.X
						local AbsoluteSizeX = t10.Steps[i].AbsoluteSize.X

						if AbsolutePositionX <= PositionX and PositionX <= AbsolutePositionX + AbsoluteSizeX then
							setCurrentStep(i)

							return
						end

						if i == 1 and PositionX < AbsolutePositionX then
							setCurrentStep(0)

							return
						end

						if i == num and AbsolutePositionX <= PositionX then
							setCurrentStep(i)

							return
						end
					end
				end)

				connection = UserInputService.InputEnded:Connect(function(input) -- line: 2151
					-- upvalues: n4 (ref), connection (ref), connection2 (ref)
					if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
						return
					end

					n4 = 0
					connection:Disconnect()
					connection2:Disconnect()
				end)
			end
		else
			n4 = 0
		end

		setCurrentStep(p132)
	end

	t10.ValueChanged = BindableEvent.Event

	if v246 then
		t10.ValueChanged = v246
	end

	function t10.SetValue(_, p135) -- line: 2185
		-- upvalues: setCurrentStep (copy)
		setCurrentStep(p135)
	end
	function t10.GetValue(_) -- line: 2189
		-- upvalues: u239 (ref)
		return u239
	end
	function t10.SetInteractable(_, p138) -- line: 2193
		-- upvalues: n4 (ref), u242 (ref), t10 (copy), hideSelection (copy), showSelection (copy)
		n4 = 0
		u242 = p138
		t10.SliderFrame.Selectable = p138

		if not u242 then
			hideSelection()

			return
		end

		showSelection()
	end
	function t10.SetZIndex(_, p140) -- line: 2204
		-- upvalues: v249 (copy), v250 (copy), v251 (copy), v252 (copy), t10 (copy)
		v249.ZIndex = p140
		v250.ZIndex = p140
		v251.ZIndex = p140
		v252.ZIndex = p140

		for i = 1, #t10.Steps do
			t10.Steps[i].ZIndex = p140
		end
	end
	function t10.SetMinStep(_, p142) -- line: 2215
		-- upvalues: num (copy), p125 (ref), u239 (ref), v249 (copy), v250 (copy)
		if p142 >= 0 and p142 <= num then
			p125 = p142
		end

		if u239 <= p125 then
			u239 = p125
			v249.Visible = false
		end

		if u239 >= num then
			u239 = num
			v250.Visible = false
		end
	end

	v249.InputBegan:Connect(function(input) -- line: 2232
		-- upvalues: u239 (ref), u242 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t10 (copy), n4 (ref), setCurrentStep (copy)
		local v561 = u239 - 1

		if not u242 then
			return
		end

		if input == nil then
			return
		end

		if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t10.SliderFrame
		end

		if not VRService.VREnabled then
			n4 = v561 - u239
		else
			n4 = 0
		end

		setCurrentStep(v561)
	end)
	v249.InputEnded:Connect(function(input) -- line: 2235
		-- upvalues: u242 (ref), n4 (ref)
		if not u242 then
			return
		end

		if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		n4 = 0
	end)
	v250.InputBegan:Connect(function(input) -- line: 2238
		-- upvalues: u239 (ref), u242 (ref), VRService (copy), UserInputService (copy), GuiService (copy), t10 (copy), n4 (ref), setCurrentStep (copy)
		local v564 = u239 + 1

		if not u242 then
			return
		end

		if input == nil then
			return
		end

		if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) and not VRService.VREnabled then
			GuiService.SelectedCoreObject = t10.SliderFrame
		end

		if not VRService.VREnabled then
			n4 = v564 - u239
		else
			n4 = 0
		end

		setCurrentStep(v564)
	end)
	v250.InputEnded:Connect(function(input) -- line: 2241
		-- upvalues: u242 (ref), n4 (ref)
		if not u242 then
			return
		end

		if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		n4 = 0
	end)

	local function onVREnabled(p143) -- line: 2245
		-- upvalues: VRService (copy), v249 (copy), u242 (ref), v250 (copy), t10 (copy), num (copy)
		if p143 ~= "VREnabled" then
			return
		end

		if VRService.VREnabled then
			v249.Selectable = u242
			v250.Selectable = u242
			t10.SliderFrame.Selectable = u242

			for i = 1, num do
				t10.Steps[i].Selectable = u242
				t10.Steps[i].Active = u242
			end

			return
		end

		v249.Selectable = false
		v250.Selectable = false
		t10.SliderFrame.Selectable = u242

		for i = 1, num do
			t10.Steps[i].Selectable = false
			t10.Steps[i].Active = false
		end
	end

	VRService.Changed:Connect(onVREnabled)
	onVREnabled("VREnabled")

	for i = 1, num do
		t10.Steps[i].InputBegan:Connect(function(input) -- line: 2272
			-- upvalues: mouseDownFunc (copy), i (copy)
			mouseDownFunc(input, i)
		end)
		t10.Steps[i].InputEnded:Connect(function(input) -- line: 2275
			-- upvalues: u242 (ref), n4 (ref)
			if not u242 then
				return
			end

			if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
				return
			end

			n4 = 0
		end)
	end

	t10.SliderFrame.InputBegan:Connect(function(input) -- line: 2280
		-- upvalues: VRService (copy), GuiService (copy), t10 (copy), mouseDownFunc (copy), u239 (ref)
		if VRService.VREnabled then
			local SelectedCoreObject = GuiService.SelectedCoreObject

			if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
				return
			end
		end

		mouseDownFunc(input, u239)
	end)
	t10.SliderFrame.InputEnded:Connect(function(input) -- line: 2289
		-- upvalues: VRService (copy), GuiService (copy), t10 (copy), u242 (ref), n4 (ref)
		if VRService.VREnabled then
			local SelectedCoreObject = GuiService.SelectedCoreObject

			if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
				return
			end
		end

		if not u242 then
			return
		end

		if not if input then input.UserInputType == Enum.UserInputType.MouseButton1 or (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonA) else false then
			return
		end

		n4 = 0
	end)

	local function v264() -- line: 2299
		-- upvalues: timestamp (ref), setCurrentStep (copy), u239 (ref), n4 (ref)
		if timestamp == nil then
			return
		end

		if tick() - timestamp >= 0.2 then
			setCurrentStep(u239 + n4)
		end
	end

	local u265 = true
	local t11 = {
		[Enum.KeyCode.Thumbstick1] = true,
		[Enum.KeyCode.DPadLeft] = -1,
		[Enum.KeyCode.DPadRight] = 1,
		[Enum.KeyCode.Left] = -1,
		[Enum.KeyCode.Right] = 1,
		[Enum.KeyCode.A] = -1,
		[Enum.KeyCode.D] = 1,
		[Enum.KeyCode.ButtonA] = true
	}

	UserInputService.InputBegan:Connect(function(input) -- line: 2325
		-- upvalues: u242 (ref), u265 (ref), GuiService (copy), t10 (copy), t11 (copy), n4 (ref), setCurrentStep (copy), u239 (ref)
		if not u242 then
			return
		end

		if not u265 then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.Gamepad1 and input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		local SelectedCoreObject = GuiService.SelectedCoreObject

		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
			return
		end

		if t11[input.KeyCode] == -1 then
			n4 = -1
			setCurrentStep(u239 - 1)

			return
		end

		if t11[input.KeyCode] == 1 then
			n4 = 1
			setCurrentStep(u239 + 1)
		end
	end)
	UserInputService.InputEnded:Connect(function(input) -- line: 2353
		-- upvalues: u242 (ref), GuiService (copy), t10 (copy), t11 (copy), n4 (ref)
		if not u242 then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.Gamepad1 and input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		local SelectedCoreObject = GuiService.SelectedCoreObject

		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
			return
		end

		if t11[input.KeyCode] then
			n4 = 0
		end
	end)
	UserInputService.InputChanged:Connect(function(input) -- line: 2374
		-- upvalues: u242 (ref), n4 (ref), u265 (ref), GuiService (copy), t10 (copy), setCurrentStep (copy), u239 (ref)
		if not u242 then
			n4 = 0

			return
		end

		if not u265 then
			n4 = 0

			return
		end

		if input.UserInputType ~= Enum.UserInputType.Gamepad1 then
			return
		end

		local SelectedCoreObject = GuiService.SelectedCoreObject

		if not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
			return
		end

		if input.KeyCode ~= Enum.KeyCode.Thumbstick1 then
			return
		end

		if input.Position.X > 0.8 and input.Delta.X > 0 and n4 ~= 1 then
			n4 = 1
			setCurrentStep(u239 + 1)

			return
		end

		if input.Position.X < -0.8 and input.Delta.X < 0 and n4 ~= -1 then
			n4 = -1
			setCurrentStep(u239 - 1)

			return
		end

		if math.abs(input.Position.X) < 0.8 then
			n4 = 0
		end
	end)

	local u267 = false

	GuiService.Changed:Connect(function(property) -- line: 2415
		-- upvalues: GuiService (copy), t10 (copy), u267 (ref), timestamp (ref), RunService (copy), guid (copy), v264 (copy)
		if property ~= "SelectedCoreObject" then
			return
		end

		local SelectedCoreObject = GuiService.SelectedCoreObject

		if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(t10.SliderFrame.Parent) then
			if not u267 then
				u267 = true
				timestamp = tick()
				RunService:BindToRenderStep(guid, Enum.RenderPriority.Input.Value + 1, v264)

				return
			end
		elseif u267 then
			u267 = false
			RunService:UnbindFromRenderStep(guid)
		end
	end)
	t10.SliderFrame.AncestryChanged:Connect(function(_, parent) -- line: 2436
		-- upvalues: u265 (ref)
		u265 = parent
	end)
	setCurrentStep(u239)

	return t10
end

local n5 = 50

if v38 then
	n5 = 90
end

local t12 = {}

local function AddNewRow(p145, p146, p147, p148, p149, p150, p151, p152, p153, p154) -- line: 2451
	-- upvalues: t12 (copy), Create (copy), n5 (ref), v42 (copy), Theme (copy), v38 (copy), GuiService (copy), t1 (copy), CreateNewSlider (copy), CreateSelector (copy), CreateDropDown (copy), VRService (copy), UserInputService (copy), CoreGui (copy)
	local n6 = 0
	local v279 = p147 ~= "TextBox"

	if t12[p145] then
		n6 = t12[p145]
	end

	local u280 = Create("ImageButton")({
		Name = p146 .. "Frame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 18, 18),
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, n5),
		AutomaticSize = if not p151 and (not p152 and not p153) then nil else Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 0, n6),
		ZIndex = 2,
		Selectable = false,
		SelectionImageObject = v42,
		Parent = p145.Page
	})

	u280.BackgroundColor3 = Theme.color("RowFrameBackground")
	u280.ImageColor3 = u280.BackgroundColor3
	Create("UICorner")({
		CornerRadius = Theme.DefaultCornerRadius,
		Parent = u280
	})

	if u280 and p150 then
		u280.Position = UDim2.new(u280.Position.X.Scale, u280.Position.X.Offset, u280.Position.Y.Scale, u280.Position.Y.Offset + p150)
	end

	local u282

	if p151 then
		local v281 = Create("Frame")({
			Name = p146 .. "RowLabelAndDescriptionFrame",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0.4, -20, 0, 50),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = u280
		})

		u282 = Create("TextLabel")({
			Name = p146 .. "Label",
			Text = p146,
			Font = Theme.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = Theme.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextWrapped = true,
			ZIndex = 2,
			Parent = v281,
			LayoutOrder = 1
		})
		Create("TextLabel")({
			Name = p146 .. "Description",
			Text = p151,
			Font = Theme.font(Enum.Font.SourceSans, "UtilityRow"),
			TextSize = Theme.textSize(18, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextTransparency = 0.25,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ZIndex = 2,
			Parent = v281,
			LayoutOrder = 2
		})
		Create("UIListLayout")({
			Name = p146 .. "UIListLayout",
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = v281
		})
		Create("UIPadding")({
			Name = p146 .. "UIListLayout",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = v281
		})
	else
		u282 = Create("TextLabel")({
			Name = p146 .. "Label",
			Text = p146,
			Font = Theme.font(Enum.Font.SourceSansBold, "UtilityRow"),
			TextSize = Theme.textSize(16, "UtilityRow"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.4, -20, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
			ZIndex = 2,
			Parent = u280
		})
		Create("UIPadding")({
			Name = p146 .. "UIPadding",
			PaddingBottom = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			Parent = u282
		})
	end

	if not v279 then
		u282.Text = ""
	end

	if _G.__TESTEZ_RUNNING_TEST__ then
		Vector2.new(1024, 1024)
	else
		GuiService:GetHardwareSafeViewport()
	end

	local v283 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	if v283.Y > v283.X then
		u282.TextSize = Theme.textSize(16, "UtilityRow")
	else
		u282.TextSize = v38 and Theme.textSize(36) or Theme.textSize(24, "UtilityText")
	end

	t1[u280] = function(_, p156) --[[ onResized ]] -- line: 2583
		-- upvalues: u282 (ref), Theme (copy), v38 (copy)
		if p156 then
			u282.TextSize = Theme.textSize(16, "UtilityRow")

			return
		end

		u282.TextSize = v38 and Theme.textSize(36) or Theme.textSize(24, "UtilityText")
	end

	if _G.__TESTEZ_RUNNING_TEST__ then
		Vector2.new(1024, 1024)
	else
		GuiService:GetHardwareSafeViewport()
	end

	local v284 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	if v284.Y > v284.X then
		u282.TextSize = Theme.textSize(16, "UtilityRow")
	else
		u282.TextSize = v38 and Theme.textSize(36) or Theme.textSize(24, "UtilityText")
	end

	local SliderFrame = nil
	local u286 = nil

	if p147 == "Slider" then
		u286 = CreateNewSlider(p148, p149, nil, p152, p153)
		u286.SliderFrame.Parent = u280
		SliderFrame = u286.SliderFrame
	elseif p147 == "Selector" then
		u286 = CreateSelector(p148, p149)
		u286.SelectorFrame.Parent = u280
		SliderFrame = u286.SelectorFrame
	elseif p147 == "DropDown" then
		u286 = CreateDropDown(p148, p149, p145.HubRef)
		u286.DropDownFrame.Parent = u280
		SliderFrame = u286.DropDownFrame
	elseif p147 == "TextBox" then
		local v287 = Create("ImageLabel")({
			Image = "",
			BackgroundTransparency = 1
		})

		u286 = {
			HubRef = nil
		}

		local v288 = Create("TextBox")({
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.6, 0, 1, 0),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p146,
			TextColor3 = Color3.fromRGB(49, 49, 49),
			BackgroundTransparency = Theme.transparency("ControlInputBackground", 0.5),
			BorderSizePixel = 0,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Font = Theme.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = Theme.textSize(24, "UtilityText"),
			ZIndex = 2,
			SelectionImageObject = v287,
			ClearTextOnFocus = false,
			Interactable = p154,
			Parent = u280
		})

		SliderFrame = v288
		v288.Focused:Connect(function() -- line: 2637
			-- upvalues: VRService (copy), UserInputService (copy), GuiService (copy), v288 (copy), p146 (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = v288
			end

			if v288.Text == p146 then
				v288.Text = ""
			end
		end)

		if p150 then
			v288.Position = UDim2.new(v288.Position.X.Scale, v288.Position.X.Offset, v288.Position.Y.Scale, v288.Position.Y.Offset + p150)
		end

		SliderFrame.SelectionGained:Connect(function() -- line: 2655
			-- upvalues: VRService (copy), UserInputService (copy), v288 (copy), Theme (copy), u286 (ref), SliderFrame (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				v288.BackgroundTransparency = Theme.transparency("ControlInputBackground", 0.1)

				if u286.HubRef then
					u286.HubRef:ScrollToFrame(SliderFrame)
				end
			end
		end)
		SliderFrame.SelectionLost:Connect(function() -- line: 2664
			-- upvalues: VRService (copy), UserInputService (copy), v288 (copy), Theme (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				v288.BackgroundTransparency = Theme.transparency("ControlInputBackground", 0.5)
			end
		end)
		v288.MouseEnter:Connect(function() -- line: 2670
			-- upvalues: CoreGui (copy), SliderFrame (ref), VRService (copy), UserInputService (copy), p145 (copy), GuiService (copy)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")

			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then
				return
			end

			local v588 = SliderFrame

			if v588 and v588.Visible and v588.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false))) and p145.Active then
				GuiService.SelectedCoreObject = v588
			end
		end)
		UserInputService.InputBegan:Connect(function(input) --[[ processInput ]] -- line: 2688
			-- upvalues: GuiService (copy), SliderFrame (ref), v288 (copy)
			if input.UserInputState == Enum.UserInputState.Begin and (input.KeyCode == Enum.KeyCode.Return and GuiService.SelectedCoreObject == SliderFrame) then
				v288:CaptureFocus()
			end
		end)
	elseif p147 == "TextEntry" then
		local v289 = Create("ImageLabel")({
			Image = "",
			BackgroundTransparency = 1
		})

		u286 = {
			HubRef = nil
		}

		local v290 = Create("TextBox")({
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.4, -10, 0, 40),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = p146,
			TextColor3 = Color3.fromRGB(178, 178, 178),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextWrapped = false,
			Font = Theme.font(Enum.Font.SourceSans, "UtilityText"),
			TextSize = Theme.textSize(24, "UtilityText"),
			ZIndex = 2,
			SelectionImageObject = v289,
			ClearTextOnFocus = false,
			Parent = u280
		})

		SliderFrame = v290
		v290.Focused:Connect(function() -- line: 2729
			-- upvalues: VRService (copy), UserInputService (copy), GuiService (copy), v290 (copy), p146 (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				GuiService.SelectedCoreObject = v290
			end

			if v290.Text == p146 then
				v290.Text = ""
			end
		end)

		if p150 then
			v290.Position = UDim2.new(v290.Position.X.Scale, v290.Position.X.Offset, v290.Position.Y.Scale, v290.Position.Y.Offset + p150)
		end

		SliderFrame.SelectionGained:Connect(function() -- line: 2747
			-- upvalues: VRService (copy), UserInputService (copy), v290 (copy), u286 (ref), SliderFrame (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				v290.BackgroundTransparency = 0.8

				if u286.HubRef then
					u286.HubRef:ScrollToFrame(SliderFrame)
				end
			end
		end)
		SliderFrame.SelectionLost:Connect(function() -- line: 2756
			-- upvalues: VRService (copy), UserInputService (copy), v290 (copy)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				v290.BackgroundTransparency = 1
			end
		end)
		u280.MouseEnter:Connect(function() -- line: 2762
			-- upvalues: CoreGui (copy), SliderFrame (ref), VRService (copy), UserInputService (copy), p145 (copy), GuiService (copy)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")

			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then
				return
			end

			local v591 = SliderFrame

			if v591 and v591.Visible and v591.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false))) and p145.Active then
				GuiService.SelectedCoreObject = v591
			end
		end)

		function u286.SetZIndex(_, p158) -- line: 2791
			-- upvalues: v290 (copy)
			v290.ZIndex = p158
		end
		function u286.SetInteractable(_, p160) -- line: 2795
			-- upvalues: v290 (copy)
			v290.Selectable = p160

			if not p160 then
				v290.TextColor3 = Color3.fromRGB(49, 49, 49)
				v290.ZIndex = 1

				return
			end

			v290.TextColor3 = Color3.fromRGB(178, 178, 178)
			v290.ZIndex = 2
		end
		function u286.SetValue(_, p162) -- line: 2806
			-- upvalues: v290 (copy)
			v290.Text = p162
		end

		local BindableEvent = Instance.new("BindableEvent")

		BindableEvent.Name = "ValueChanged"
		v290.FocusLost:Connect(function() -- line: 2813
			-- upvalues: BindableEvent (copy), v290 (copy)
			BindableEvent:Fire(v290.Text)
		end)
		u286.ValueChanged = BindableEvent.Event
		UserInputService.InputBegan:Connect(function(input) --[[ processInput ]] -- line: 2780
			-- upvalues: GuiService (copy), SliderFrame (ref), v290 (copy)
			if input.UserInputState == Enum.UserInputState.Begin and (input.KeyCode == Enum.KeyCode.Return and GuiService.SelectedCoreObject == SliderFrame) then
				v290:CaptureFocus()
			end
		end)
	end

	u286.Name = p146 .. "ValueChanger"

	local SetAutoLocalize = u286.SetAutoLocalize

	function u286.SetAutoLocalize(p163, p164) -- line: 2825
		-- upvalues: u280 (ref), SetAutoLocalize (copy)
		u280.AutoLocalize = p164

		if SetAutoLocalize then
			SetAutoLocalize(p163, p164)
		end
	end

	local v293 = n6 + n5

	if p150 then
		v293 += p150
	end

	t12[p145] = v293

	if v279 then
		u280.MouseEnter:Connect(function() -- line: 2840
			-- upvalues: CoreGui (copy), u286 (ref), VRService (copy), UserInputService (copy), p145 (copy), GuiService (copy)
			local DropDownFullscreenFrame = CoreGui.RobloxGui:FindFirstChild("DropDownFullscreenFrame")

			if DropDownFullscreenFrame and DropDownFullscreenFrame.Visible then
				return
			end

			local v602 = u286.SliderFrame or u286.SliderFrame or u286.DropDownFrame or u286.SelectorFrame

			if v602 and v602.Visible and v602.ZIndex > 1 and (not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false))) and p145.Active then
				GuiService.SelectedCoreObject = v602
			end
		end)
		VRService.Changed:Connect(function(property) --[[ onVREnabled ]] -- line: 2870
			-- upvalues: VRService (copy), u280 (ref), SliderFrame (ref), GuiService (copy), Theme (copy)
			if property == "VREnabled" then
				if VRService.VREnabled then
					u280.Selectable = true
					u280.Active = true
					SliderFrame.Active = true
					GuiService.Changed:Connect(function(property2) -- line: 2876
						-- upvalues: GuiService (copy), u280 (ref), Theme (copy)
						if property2 == "SelectedCoreObject" then
							local SelectedCoreObject = GuiService.SelectedCoreObject

							if SelectedCoreObject and (SelectedCoreObject == u280 or SelectedCoreObject:IsDescendantOf(u280)) then
								u280.ImageTransparency = Theme.transparency("RowFrameBackground", 0.5)
								u280.BackgroundTransparency = 1

								return
							end

							u280.ImageTransparency = 1
							u280.BackgroundTransparency = 1
						end
					end)

					return
				end

				u280.Selectable = false
				u280.Active = false
			end
		end)

		if VRService.VREnabled then
			u280.Selectable = true
			u280.Active = true
			SliderFrame.Active = true
			GuiService.Changed:Connect(function(property) -- line: 2876
				-- upvalues: GuiService (copy), u280 (ref), Theme (copy)
				if property == "SelectedCoreObject" then
					local SelectedCoreObject = GuiService.SelectedCoreObject

					if SelectedCoreObject and (SelectedCoreObject == u280 or SelectedCoreObject:IsDescendantOf(u280)) then
						u280.ImageTransparency = Theme.transparency("RowFrameBackground", 0.5)
						u280.BackgroundTransparency = 1

						return
					end

					u280.ImageTransparency = 1
					u280.BackgroundTransparency = 1
				end
			end)
		else
			u280.Selectable = false
			u280.Active = false
		end

		SliderFrame.SelectionGained:Connect(function() -- line: 2897
			-- upvalues: VRService (copy), UserInputService (copy), u280 (ref), Theme (copy), u286 (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				if VRService.VREnabled then
					u280.ImageTransparency = 0.5
					u280.BackgroundTransparency = 1
				else
					u280.ImageTransparency = 1
					u280.BackgroundTransparency = Theme.transparency("RowFrameBackground", 0.5)
				end

				if u286.HubRef then
					u286.HubRef:ScrollToFrame(u280)
				end
			end
		end)
		SliderFrame.SelectionLost:Connect(function() -- line: 2912
			-- upvalues: VRService (copy), UserInputService (copy), u280 (ref)
			if not VRService.VREnabled and (UserInputService.PreferredInput ~= Enum.PreferredInput.Touch or (UserInputService.GamepadEnabled and true or false)) then
				u280.ImageTransparency = 1
				u280.BackgroundTransparency = 1
			end
		end)
	end

	p145:AddRow(u280, u282, u286, p150, false)
	u286.Selection = SliderFrame

	return u280, u282, u286
end
local function AddNewRowObject(p165, p166, p167, p168, p169) -- line: 2927
	-- upvalues: t12 (copy), Create (copy), n5 (ref), v42 (copy), Theme (copy), v38 (copy), t1 (copy), GuiService (copy), VRService (copy)
	local n7 = 0

	if t12[p165] then
		n7 = t12[p165]
	end

	local v300 = Create("ImageButton")({
		Name = p166 .. "Frame",
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 10, 10),
		ImageTransparency = 1,
		Active = false,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 0, n5),
		Position = UDim2.new(0, 0, 0, n7),
		ZIndex = 2,
		Selectable = false,
		SelectionImageObject = v42,
		Parent = p165.Page
	})

	v300.BackgroundColor3 = Theme.color("RowFrameBackground")
	v300.ImageColor3 = v300.BackgroundColor3
	v300.SelectionGained:Connect(function() -- line: 2955
		-- upvalues: v300 (copy), Theme (copy)
		v300.BackgroundTransparency = Theme.transparency("RowFrameBackground", 0.5)
	end)
	v300.SelectionLost:Connect(function() -- line: 2958
		-- upvalues: v300 (copy)
		v300.BackgroundTransparency = 1
	end)
	Create("UICorner")({
		CornerRadius = Theme.DefaultCornerRadius,
		Parent = v300
	})

	local v301 = Create("TextLabel")({
		Name = p166 .. "Label",
		Text = p166,
		Font = Theme.font(Enum.Font.SourceSansBold, "UtilityRow"),
		TextSize = Theme.textSize(16, "UtilityRow"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0.4, -20, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		ZIndex = 2,
		Parent = v300
	})

	Create("UIPadding")({
		Name = p166 .. "UIPadding",
		PaddingBottom = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
		Parent = v301
	})

	local function onResized(_, p171) -- line: 2990
		-- upvalues: p169 (copy), v301 (copy), Theme (copy), v38 (copy)
		if p169 then
			UDim2.new(0, 200, 1, 0)
		end

		if p171 then
			v301.TextSize = Theme.textSize(16, "UtilityRow")

			return
		end

		v301.TextSize = v38 and Theme.textSize(36) or Theme.textSize(24, "UtilityText")
	end

	t1[v300] = onResized

	local v303 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)
	local v304 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

	onResized(v303, v304.Y > v304.X)

	if p168 then
		v300.Position = UDim2.new(v300.Position.X.Scale, v300.Position.X.Offset, v300.Position.Y.Scale, v300.Position.Y.Offset + p168)
	end

	local v305 = n7 + n5

	if p168 then
		v305 += p168
	end

	t12[p165] = v305
	v300.MouseEnter:Connect(function() -- line: 3018
		-- upvalues: v300 (copy), GuiService (copy)
		if v300.Visible then
			GuiService.SelectedCoreObject = v300
		end
	end)
	p167.SelectionImageObject = v42
	p167.SelectionGained:Connect(function() -- line: 3027
		-- upvalues: VRService (copy), v300 (copy), Theme (copy)
		if VRService.VREnabled then
			v300.ImageTransparency = Theme.transparency("RowFrameBackground", 0.5)
			v300.BackgroundTransparency = 1

			return
		end

		v300.ImageTransparency = 1
		v300.BackgroundTransparency = Theme.transparency("RowFrameBackground", 0.5)
	end)
	p167.SelectionLost:Connect(function() -- line: 3036
		-- upvalues: v300 (copy)
		v300.ImageTransparency = 1
		v300.BackgroundTransparency = 1
	end)
	p167.Parent = v300
	p165:AddRow(v300, v301, p167, p168, true)

	return v300
end

local t13 = {
	GetEaseLinear = function(_) --[[ GetEaseLinear ]] -- line: 3050
		-- upvalues: Linear (copy)
		return Linear
	end,
	GetEaseOutQuad = function(_) --[[ GetEaseOutQuad ]] -- line: 3053
		-- upvalues: EaseOutQuad (copy)
		return EaseOutQuad
	end,
	GetEaseInOutQuad = function(_) --[[ GetEaseInOutQuad ]] -- line: 3056
		-- upvalues: EaseInOutQuad (copy)
		return EaseInOutQuad
	end,
	CreateNewSlider = function(_, p176, p177, p178, p179, p180) --[[ CreateNewSlider ]] -- line: 3060
		-- upvalues: CreateNewSlider (copy)
		return CreateNewSlider(p176, p177, p178, p179, p180)
	end,
	CreateNewSelector = function(_, p182, p183) --[[ CreateNewSelector ]] -- line: 3064
		-- upvalues: CreateSelector (copy)
		return (CreateSelector(p182, p183))
	end,
	CreateNewDropDown = function(_, p185, p186) --[[ CreateNewDropDown ]] -- line: 3068
		-- upvalues: CreateDropDown (copy)
		return (CreateDropDown(p185, p186, nil))
	end,
	AddNewRow = function(_, p188, p189, p190, p191, p192, p193, p194, p195, p196, p197) --[[ AddNewRow ]] -- line: 3072
		-- upvalues: AddNewRow (copy)
		return AddNewRow(p188, p189, p190, p191, p192, p193, p194, p195, p196, p197)
	end,
	AddNewRowObject = function(_, p199, p200, p201, p202, p203) --[[ AddNewRowObject ]] -- line: 3076
		-- upvalues: AddNewRowObject (copy)
		return (AddNewRowObject(p199, p200, p201, p202, p203))
	end,
	ShowAlert = function(_, p205, p206, p207, p208, p209) --[[ ShowAlert ]] -- line: 3080
		-- upvalues: ShowAlert (copy)
		ShowAlert(p205, p206, p207, p208, p209)
	end,
	IsSmallTouchScreen = function(_) --[[ IsSmallTouchScreen ]] -- line: 3084
		-- upvalues: GuiService (copy), UserInputService (copy)
		local v345 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

		return UserInputService.TouchEnabled and (v345.Y < 500 or v345.X < 700)
	end,
	IsPortrait = function(_) --[[ IsPortrait ]] -- line: 3088
		-- upvalues: GuiService (copy)
		local v347 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)

		return v347.Y > v347.X
	end
}

if FFlagRefactorMenuConfirmationButtons or FFlagAddNextUpContainer then
	function t13.IsUsingGamepad(_) -- line: 3097
		-- upvalues: t5 (copy), UserInputService (copy)
		return t5[UserInputService:GetLastInputType()] or false
	end
end

function t13.MakeStyledButton(_, p214, p215, p216, p217, p218, p219) -- line: 3102
	-- upvalues: MakeButton (copy)
	return MakeButton(p214, p215, p216, p217, p218, p219)
end
function t13.MakeStyledImageButton(_, p221, p222, p223, p224, p225, p226, p227, p228) -- line: 3106
	-- upvalues: MakeImageButton (copy)
	return MakeImageButton(p221, p222, p223, p224, p225, p226, p227, p228)
end
function t13.AddButtonRow(_, p230, p231, p232, p233, p234, p235) -- line: 3110
	-- upvalues: AddButtonRow (copy)
	return AddButtonRow(p230, p231, p232, p233, p234, p235)
end
function t13.MakeFocusState(_, p237, p238) -- line: 3114
	-- upvalues: MakeRoundedRectFocusState (copy)
	return MakeRoundedRectFocusState(p237, p238)
end
function t13.CreateSignal(_) -- line: 3118
	-- upvalues: CreateSignal (copy)
	return (CreateSignal())
end
function t13.UsesSelectedObject(_) -- line: 3122
	-- upvalues: VRService (copy), UserInputService (copy)
	if VRService.VREnabled then
		return false
	end

	if UserInputService.PreferredInput == Enum.PreferredInput.Touch and not UserInputService.GamepadEnabled then
		return false
	end

	return true
end
function t13.TweenProperty(_, p242, p243, p244, p245, p246, p247, p248) -- line: 3126
	return PropertyTweener(p242, p243, p244, p245, p246, p247, p248)
end
function t13.OnResized(_, p250, p251) -- line: 3130
	-- upvalues: addOnResizedCallback (copy)
	return addOnResizedCallback(p250, p251)
end
function t13.FireOnResized(_) -- line: 3134
	-- upvalues: GuiService (copy), t13 (copy), t1 (copy)
	local v389 = if not _G.__TESTEZ_RUNNING_TEST__ then GuiService:GetHardwareSafeViewport() else Vector2.new(1024, 1024)
	local v390 = t13:IsPortrait()

	for _, v in pairs(t1) do
		v(v389, v390)
	end
end
function t13.Lerp(_, p254, p255, p256) -- line: 3145
	return (1 - p254) * p255 + p254 * p256
end
function t13.Round(_, p258) -- line: 3150
	return p258 % 1 >= 0.5 and math.ceil(p258) or math.floor(p258)
end
function t13.IsExperienceOlderThanOneWeek(_, p260) -- line: 3154
	-- upvalues: Workspace (copy)
	if p260 ~= nil and p260.Created ~= nil then
		local UnixTimestampMillis = DateTime.fromIsoDate(p260.Created).UnixTimestampMillis

		if Workspace:GetServerTimeNow() * 1000 - UnixTimestampMillis > 604800000 then
			return true
		end
	end

	return false
end

return t13
