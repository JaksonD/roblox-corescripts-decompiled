local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local TweenService = game:GetService("TweenService")
local Utility = require(RobloxGui.Modules.Settings.Utility)
local Theme = require(RobloxGui.Modules.Settings.Theme)
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local Create = AppCommonLib.Create
local Signal = AppCommonLib.Signal

RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")

local v13 = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local GetFFlagFixIGMTabTransitions = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions)
local FFlagIEMSettingsGroups = require(script.Parent.Flags.FFlagIEMSettingsGroups)
local FFlagIEMFocusNavSupportNewButtons = require(script.Parent.Flags.FFlagIEMFocusNavSupportNewButtons)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagIEMFocusNavToButtons = SharedFlags.FFlagIEMFocusNavToButtons
local FFlagIEMTabFocusNav = SharedFlags.FFlagIEMTabFocusNav
local EngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")

local function Initialize() -- line: 45
	-- upvalues: FFlagIEMFocusNavToButtons (copy), Signal (copy), FFlagIEMTabFocusNav (copy), Create (copy), Utility (copy), v13 (copy), Theme (copy), GuiService (copy), HttpService (copy), FFlagIEMSettingsGroups (copy), FFlagIEMFocusNavSupportNewButtons (copy), CoreGui (copy), UserGameSettings (copy), GetFFlagFixIGMTabTransitions (copy), TweenService (copy), EngineFeature (copy)
	local t1 = {
		HubRef = nil,
		LastSelectedObject = nil,
		TabPosition = 0,
		Active = false,
		OpenStateChangedCount = 0,
		ShouldShowBottomBar = true,
		ShouldShowHubBar = true,
		ShouldDisableDefaultScroll = false,
		IsPageClipped = true,
		SelectARow = nil
	}

	if FFlagIEMFocusNavToButtons then
		t1.LastSelectableObjectsUpdated = Signal.new()
		t1.LastSelectableObjects = {}
		t1.PageNextSelectionDown = nil
	end

	if FFlagIEMTabFocusNav then
		t1.FirstSelectableObjectsUpdated = Signal.new()
		t1.FirstSelectableObjects = {}
	end

	local t2 = {}
	local u24 = false

	t1.TabHeader = Create("TextButton")({
		Name = "Header",
		Text = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.2, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Selectable = not not FFlagIEMTabFocusNav or not FFlagIEMFocusNavToButtons and nil
	})

	if Utility:IsSmallTouchScreen() then
		t1.TabHeader.Size = UDim2.new(0, 84, 1, 0)
	elseif v13 then
		t1.TabHeader.Size = UDim2.new(0, 220, 1, 0)
	end

	if FFlagIEMTabFocusNav then
		local function switchToPage() -- line: 85
			-- upvalues: t1 (copy)
			if t1.HubRef and t1.HubRef.Pages.CurrentPage ~= t1 then
				t1.HubRef:SwitchToPage(t1, true)
			end
		end

		t1.TabHeader.Activated:connect(switchToPage)
		t1.TabHeader.SelectionGained:connect(switchToPage)
	else
		t1.TabHeader.MouseButton1Click:connect(function() -- line: 93
			-- upvalues: t1 (copy)
			if t1.HubRef then
				t1.HubRef:SwitchToPage(t1, true)
			end
		end)
	end

	local v26 = Create("TextLabel")({
		Name = "Icon",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 10, 0.5, -18),
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextScaled = true,
		TextTransparency = 0.5,
		Parent = t1.TabHeader
	})

	Create("UIAspectRatioConstraint")({
		Name = "AspectRatioConstraint",
		AspectRatio = 1,
		Parent = v26
	})

	local v27 = Create("TextLabel")({
		Name = "Title",
		Text = "",
		Font = Theme.font(Enum.Font.SourceSansBold, "Button"),
		TextColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 1,
		Size = UDim2.new(1.05, 0, 1, 0),
		Position = UDim2.new(1.2, Theme.TabHeaderIconPadding, 0, -2),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTransparency = 0.5
	})

	v27.TextSize = Theme.textSize(24)

	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

	UITextSizeConstraint.MaxTextSize = Theme.textSize(24)
	v27.Parent = v26

	if Utility:IsPortrait() and Utility:IsSmallTouchScreen() then
		UITextSizeConstraint.Parent = v27
	end

	if Utility:IsSmallTouchScreen() then
		v27.TextSize = Theme.textSize(18)
		UITextSizeConstraint.MaxTextSize = Theme.textSize(18)
	elseif v13 then
		v27.TextSize = Theme.textSize(48)
		UITextSizeConstraint.MaxTextSize = Theme.textSize(48)
	end

	Create("ImageLabel")({
		Name = "TabSelection",
		Visible = false,
		BackgroundColor3 = Theme.color("TabSelection"),
		BackgroundTransparency = Theme.transparency("TabSelection"),
		Size = UDim2.new(1, -2, 0, 2),
		Position = UDim2.new(0, 3, 1, -2),
		BorderSizePixel = 0,
		Parent = t1.TabHeader
	})

	local v29 = Create("Frame")({
		Name = "TabLabel",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = t1.TabHeader
	})

	Create("UIListLayout")({
		Name = "Layout",
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
		Parent = v29
	})
	v26.Parent = v29
	v27.Parent = v29
	v27.Size = UDim2.new(0, 0, 0, 0)
	v27.AutomaticSize = Enum.AutomaticSize.XY
	Utility:OnResized(t1.TabHeader, function() --[[ onResized ]] -- line: 183
		-- upvalues: t1 (copy), Utility (copy), v26 (copy), v13 (copy), Theme (copy), v29 (copy), v27 (copy)
		if not t1.TabHeader then
			return
		end

		if Utility:IsSmallTouchScreen() then
			v26.Size = UDim2.new(0, 34, 0, 28)
		elseif v13 then
			v26.Size = UDim2.new(0, 88, 0, 74)
		else
			local v31 = Theme.getIconSize(Theme.IconSize.Medium)

			v26.Size = UDim2.fromOffset(v31, v31)
		end

		local v32 = Utility:IsPortrait()
		local Layout = v29.Layout

		if v32 then
			if Utility:IsSmallTouchScreen() then
				v27.FontSize = Theme.fontSize(Enum.FontSize.Size14)
			end

			v26.Size = UDim2.new(0, 22, 0, 22)
			Layout.FillDirection = Enum.FillDirection.Vertical
			Layout.Padding = UDim.new(0, 0)
		else
			if Utility:IsSmallTouchScreen() then
				v27.FontSize = Theme.fontSize(Enum.FontSize.Size18)
			end

			Layout.FillDirection = Enum.FillDirection.Horizontal
			Layout.Padding = UDim.new(0, 10)
		end

		v26.Size = UDim2.fromOffset(v26.Size.X.Offset * 0.6666666666666666, v26.Size.Y.Offset * 0.6666666666666666)
	end)
	t1.Page = Create("Frame")({
		Name = "Page",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
	Create("UIPadding")({
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 11),
		Parent = t1.Page
	})
	t1.PageListLayout = Create("UIListLayout")({
		Name = "RowListLayout",
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = t1.Page
	})
	GuiService:AddSelectionParent(HttpService:GenerateGUID(false), t1.Page)
	t1.Displayed = Instance.new("BindableEvent")
	t1.Displayed.Name = "Displayed"
	t1.Displayed.Event:connect(function() -- line: 257
		-- upvalues: t1 (copy)
		if not t1.HubRef.Shield.Visible then
			return
		end

		t1:SelectARow()
	end)
	t1.Hidden = Instance.new("BindableEvent")
	t1.Hidden.Event:connect(function() -- line: 263
		-- upvalues: GuiService (copy), t1 (copy)
		if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(t1.Page) then
			GuiService.SelectedCoreObject = nil
		end
	end)
	t1.Hidden.Name = "Hidden"

	function t1.getValueChangerFrame(_, p2) -- line: 271
		if type(p2) ~= "table" then
			return p2
		end

		return p2.SliderFrame and p2.SliderFrame or (p2.SelectorFrame or p2.DropDownFrame)
	end
	function t1.SelectARow(_, p4) -- line: 283
		-- upvalues: FFlagIEMTabFocusNav (copy), GuiService (copy), t1 (copy), t2 (copy), FFlagIEMSettingsGroups (copy), FFlagIEMFocusNavToButtons (copy), FFlagIEMFocusNavSupportNewButtons (copy), CoreGui (copy)
		if FFlagIEMTabFocusNav and (not p4 and GuiService.SelectedCoreObject == t1.TabHeader) then
			return
		end

		if p4 or not GuiService.SelectedCoreObject or not GuiService.SelectedCoreObject:IsDescendantOf(t1.Page) then
			if t1.LastSelectedObject then
				GuiService.SelectedCoreObject = t1.LastSelectedObject

				return
			end

			if t2 and #t2 > 0 then
				local v42

				if FFlagIEMSettingsGroups then
					local n1 = 1e999
					local ValueChanger = t2[1].ValueChanger

					for _, v41 in t2 do
						if v41.SelectionFrame and n1 > v41.SelectionFrame.LayoutOrder then
							n1 = v41.SelectionFrame.LayoutOrder
							ValueChanger = v41
						end
					end

					v42 = t1:getValueChangerFrame(ValueChanger.ValueChanger)
				else
					v42 = t1:getValueChangerFrame(t2[1].ValueChanger)
				end

				GuiService.SelectedCoreObject = v42

				return
			end

			if FFlagIEMFocusNavToButtons and t1.PageNextSelectionDown and (not FFlagIEMFocusNavSupportNewButtons or t1.PageNextSelectionDown:IsDescendantOf(CoreGui)) then
				GuiService.SelectedCoreObject = t1.PageNextSelectionDown
			end
		end
	end
	function t1.Display(_, p6, p7) -- line: 314
		-- upvalues: t1 (copy), v26 (copy), v27 (copy), UserGameSettings (copy), GetFFlagFixIGMTabTransitions (copy), u24 (ref), TweenService (copy), EngineFeature (copy)
		t1.OpenStateChangedCount = t1.OpenStateChangedCount + 1

		if t1.TabHeader then
			t1.TabHeader.TabSelection.Visible = true
			v26.TextTransparency = 0
			v27.TextTransparency = 0
		end

		t1.Page.Parent = p6
		t1.Page.Visible = true

		local uDim2 = UDim2.new(0, 0, 0, 0)

		local function v47() -- line: 327
			-- upvalues: UserGameSettings (copy), p6 (copy), GetFFlagFixIGMTabTransitions (copy), t1 (copy), uDim2 (copy), u24 (ref)
			if UserGameSettings.ReducedMotion then
				p6.InnerCanvasGroupShow.Visible = false
			end

			if GetFFlagFixIGMTabTransitions() then
				if UserGameSettings.ReducedMotion then
					p6.InnerCanvasGroupShow.GroupTransparency = 0
				end

				t1.Page.Position = uDim2
			end

			t1.Page.Visible = true
			u24 = true
			t1.Displayed:Fire()
		end

		if p7 then
			t1.Page.Position = uDim2

			if UserGameSettings.ReducedMotion then
				p6.InnerCanvasGroupShow.Visible = false
			end

			if GetFFlagFixIGMTabTransitions() then
				if UserGameSettings.ReducedMotion then
					p6.InnerCanvasGroupShow.GroupTransparency = 0
				end

				t1.Page.Position = uDim2
			end

			t1.Page.Visible = true
			u24 = true
			t1.Displayed:Fire()

			return
		end

		if UserGameSettings.ReducedMotion then
			t1.Page.Position = uDim2
			p6.InnerCanvasGroupShow.GroupTransparency = 1
			p6.InnerCanvasGroupShow.Visible = true
			t1.Page.Parent = p6.InnerCanvasGroupShow
			t1.Page.Visible = true

			local tweenInfo = TweenInfo.new(0.25)
			local t3 = {
				GroupTransparency = 0
			}
			local v50 = TweenService:Create(p6.InnerCanvasGroupShow, tweenInfo, t3)

			v50:Play()
			v50.Completed:Connect(function() -- line: 358
				-- upvalues: t1 (copy), p6 (copy), UserGameSettings (copy), GetFFlagFixIGMTabTransitions (copy), uDim2 (copy), u24 (ref)
				t1.Page.Parent = p6

				if UserGameSettings.ReducedMotion then
					p6.InnerCanvasGroupShow.Visible = false
				end

				if GetFFlagFixIGMTabTransitions() then
					if UserGameSettings.ReducedMotion then
						p6.InnerCanvasGroupShow.GroupTransparency = 0
					end

					t1.Page.Position = uDim2
				end

				t1.Page.Visible = true
				u24 = true
				t1.Displayed:Fire()
			end)

			return
		end

		if EngineFeature then
			t1.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v47)

			return
		end

		t1.Page:TweenPosition(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v47)
	end
	function t1.Hide(_, p9, p10, p11, p12, p13, p14) -- line: 370
		-- upvalues: t1 (copy), v26 (copy), v27 (copy), UserGameSettings (copy), u24 (ref), TweenService (copy), EngineFeature (copy)
		t1.OpenStateChangedCount = t1.OpenStateChangedCount + 1

		if t1.TabHeader then
			t1.TabHeader.TabSelection.Visible = false
			v26.TextTransparency = 0.5
			v27.TextTransparency = 0.5
		end

		if t1.Page.Parent then
			local uDim2 = UDim2.new(1 * p9, 0, 0, 0)

			local function v59() -- line: 381
				-- upvalues: UserGameSettings (copy), p14 (copy), p13 (copy), t1 (copy), p10 (copy), u24 (ref)
				if UserGameSettings.ReducedMotion and p14 then
					p13.InnerCanvasGroupHide.Visible = false
				end

				t1.Page.Visible = false
				t1.Page.Position = UDim2.new(t1.TabPosition - p10, 0, 0, 0)
				u24 = false
				t1.Hidden:Fire()
			end
			local function v60() -- line: 391
				-- upvalues: p11 (copy), t1 (copy), uDim2 (copy), UserGameSettings (copy), p14 (copy), p13 (copy), p10 (copy), u24 (ref), TweenService (copy), EngineFeature (copy), v59 (copy)
				if p11 then
					t1.Page.Position = uDim2

					if UserGameSettings.ReducedMotion and p14 then
						p13.InnerCanvasGroupHide.Visible = false
					end

					t1.Page.Visible = false
					t1.Page.Position = UDim2.new(t1.TabPosition - p10, 0, 0, 0)
					u24 = false
					t1.Hidden:Fire()

					return
				end

				if UserGameSettings.ReducedMotion and p14 then
					p13.InnerCanvasGroupHide.GroupTransparency = 0
					p13.InnerCanvasGroupHide.Visible = true
					t1.Page.Parent = p13.InnerCanvasGroupHide

					local tweenInfo = TweenInfo.new(0.25)
					local t4 = {
						GroupTransparency = 1
					}
					local v79 = TweenService:Create(p13.InnerCanvasGroupHide, tweenInfo, t4)

					v79:Play()
					v79.Completed:Connect(function() -- line: 407
						-- upvalues: t1 (copy), p13 (copy), uDim2 (copy), UserGameSettings (copy), p14 (copy), p10 (copy), u24 (ref)
						t1.Page.Parent = p13
						t1.Page.Position = uDim2

						if UserGameSettings.ReducedMotion and p14 then
							p13.InnerCanvasGroupHide.Visible = false
						end

						t1.Page.Visible = false
						t1.Page.Position = UDim2.new(t1.TabPosition - p10, 0, 0, 0)
						u24 = false
						t1.Hidden:Fire()
					end)

					return
				end

				if EngineFeature then
					t1.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v59)

					return
				end

				t1.Page:TweenPosition(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v59)
			end

			if p12 then
				local OpenStateChangedCount = t1.OpenStateChangedCount

				delay(p12, function() -- line: 423
					-- upvalues: OpenStateChangedCount (copy), t1 (copy), v60 (copy)
					if OpenStateChangedCount == t1.OpenStateChangedCount then
						v60()
					end
				end)

				return
			end

			v60()
		end
	end
	function t1.GetDisplayed(_) -- line: 434
		-- upvalues: u24 (ref)
		return u24
	end
	function t1.GetVisibility(_) -- line: 438
		-- upvalues: t1 (copy)
		return t1.Page.Parent
	end
	function t1.GetTabHeader(_) -- line: 442
		-- upvalues: t1 (copy)
		return t1.TabHeader
	end
	function t1.GetRows(_) -- line: 446
		-- upvalues: FFlagIEMFocusNavToButtons (copy), t2 (copy)
		if not FFlagIEMFocusNavToButtons then
			return
		end

		return t2
	end
	function t1.SetHub(_, p20) -- line: 454
		-- upvalues: t1 (copy), t2 (copy)
		t1.HubRef = p20

		for _, v in next, t2 do
			if type(v.ValueChanger) == "table" then
				v.ValueChanger.HubRef = t1.HubRef
			end
		end
	end
	function t1.GetSize(_) -- line: 464
		-- upvalues: t1 (copy)
		return t1.Page.AbsoluteSize
	end
	function t1.AddRow(_, p23, p24, p25, p26) -- line: 468
		-- upvalues: t2 (copy), t1 (copy)
		t2[#t2 + 1] = {
			SelectionFrame = p23,
			Label = p24,
			ValueChanger = p25
		}

		local n2 = 0

		if p23 then
			n2 = p23.Size.Y.Offset
		end

		if p26 then
			t1.Page.Size = UDim2.new(1, 0, 0, t1.Page.Size.Y.Offset + n2 + p26)
		else
			t1.Page.Size = UDim2.new(1, 0, 0, t1.Page.Size.Y.Offset + n2)
		end

		if t1.HubRef and type(p25) == "table" then
			p25.HubRef = t1.HubRef
		end
	end

	return t1
end

return {
	CreateNewPage = function(_) --[[ CreateNewPage ]] -- line: 494
		-- upvalues: Initialize (copy)
		return (Initialize())
	end
}
