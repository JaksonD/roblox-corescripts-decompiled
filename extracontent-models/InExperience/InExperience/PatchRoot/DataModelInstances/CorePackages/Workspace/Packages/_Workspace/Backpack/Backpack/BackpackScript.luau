local Parent = script:FindFirstAncestor("Backpack").Parent
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui.Modules
local Signals = require(Parent.Signals)
local InExperienceTopBar = require(Parent.InExperienceTopBar)
local SettingsShowSignal = require(Parent.CoreScriptsCommon).SettingsShowSignal
local InExperienceAppChatModal = require(Parent.AppChat).App.InExperienceAppChatModal
local FFlagMountCoreGuiBackpack = require(Modules.Flags.FFlagMountCoreGuiBackpack)
local isInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP
local FFlagTopBarSignalizeSetCores = InExperienceTopBar.Flags.FFlagTopBarSignalizeSetCores
local RobloxTranslator = require(Parent.RobloxTranslator)
local System = require(Parent.System)
local v15 = game:DefineFastFlag("EnableHotbarHide", false)
local t1 = {
	OpenClose = nil,
	IsHotbarVisible = false,
	IsOpen = false,
	StateChanged = Instance.new("BindableEvent"),
	ModuleName = "Backpack",
	KeepVRTopbarOpen = true,
	VRIsExclusive = true,
	VRClosesNonExclusive = true
}
local n1 = 60
local Size14 = Enum.FontSize.Size14
local u19 = 0.5 * UserGameSettings.PreferredTransparency
local color3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039)
local color3_2 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local color3_3 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784)
local u23 = 0.5 * UserGameSettings.PreferredTransparency
local color3_4 = Color3.new(1, 1, 1)

UDim2.new(0, 14, 0, 9)

local BackquoteValue = Enum.KeyCode.Backquote.Value
local color3_5 = Color3.new(0, 0.6352941176470588, 1)
local s1 = "   Search"
local color3_6 = Color3.new(0.37, 0.37, 0.37)
local u29 = 0.15 * UserGameSettings.PreferredTransparency
local ZeroValue = Enum.KeyCode.Zero.Value
local BackspaceValue = Enum.KeyCode.Backspace.Value
local t2 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local GamepadService = game:GetService("GamepadService")

RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")

local v40 = require(Modules.TenFootInterface):IsEnabled()
local Create = require(Parent.AppCommonLib).Create
local GameTranslator = require(Modules.GameTranslator)

pcall(function() -- line: 121
	-- upvalues: s1 (ref), RobloxTranslator (copy)
	s1 = RobloxTranslator:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH")
end)

local u43 = true
local MakeSlot = nil

if v40 then
	n1 = 100
	Size14 = Enum.FontSize.Size24
end

local u44 = false
local v45 = UserInputService.TouchEnabled and GuiService:GetScreenResolution().X < 1024
local LocalPlayer = Players.LocalPlayer
local u47 = nil
local u48 = nil
local u49 = nil
local u50 = nil
local u51 = nil
local u52 = nil
local u53 = nil
local u54 = nil
local UIGridLayout = nil
local u56 = nil
local u57 = nil
local u58 = nil
local u59 = nil
local Backpack = nil
local t3 = {}
local u62 = nil
local t4 = {}
local t5 = {}
local t6 = {}
local n2 = 0
local u67 = nil
local u68 = false
local u69 = false
local u70 = false
local u71 = false
local t7 = {}
local t8 = {}
local t9 = {}
local u75 = false
local n3 = 0
local u77 = not v45 and 10 or 3
local v78 = not v45 and 4 or 2
local u79 = nil
local u80 = nil

t1.BackpackEmpty = Create("BindableEvent")({
	Name = "BackpackEmpty"
})
t1.BackpackItemAdded = Create("BindableEvent")({
	Name = "BackpackAdded"
})
t1.BackpackItemRemoved = Create("BindableEvent")({
	Name = "BackpackRemoved"
})

local function NewGui(p1, p2) -- line: 190
	-- upvalues: Size14 (ref)
	local v102 = Instance.new(p1)

	v102.Name = p2
	v102.BackgroundColor3 = Color3.new(0, 0, 0)
	v102.BackgroundTransparency = 1
	v102.BorderColor3 = Color3.new(0, 0, 0)
	v102.BorderSizePixel = 0
	v102.Size = UDim2.new(1, 0, 1, 0)

	if p1:match("Text") then
		v102.TextColor3 = Color3.new(1, 1, 1)
		v102.Text = ""
		v102.Font = Enum.Font.SourceSans
		v102.FontSize = Size14
		v102.TextWrapped = true

		if p1 == "TextButton" then
			v102.Font = Enum.Font.SourceSansBold
			v102.BorderSizePixel = 1
		end
	end

	return v102
end

function t1.IsInventoryEmpty() -- line: 222
	-- upvalues: u77 (ref), t3 (copy)
	for i = u77 + 1, #t3 do
		local v106 = t3[i]

		if v106 and v106.Tool then
			return false
		end
	end

	return true
end

local function AdjustHotbarFrames(p3) -- line: 238
	-- upvalues: u51 (ref), u77 (ref), n2 (ref), v15 (copy), t3 (copy), u49 (ref), t1 (copy)
	local Visible = u51.Visible
	local v109 = Visible and u77 or n2
	local n4 = 0
	local v111 = if not v15 then v109 >= 1 else v109 >= 1 and not p3
	local g119 = nil
	local v118 = nil

	for i = 1, u77 do
		local v113 = t3[i]

		if ((if not v15 then v113.Tool else v113.Tool and not p3)) or Visible then
			n4 += 1
			v113:Readjust(n4, v109)
			v113.Frame.Visible = true
		else
			v113.Frame.Visible = false
		end
	end

	local v114 = u49
	local v115 = not Visible

	if v115 then
		v115 = v111

		if not v115 then
			for i = u77 + 1, #t3 do
				local v117 = t3[i]

				if v117 and v117.Tool then
					v118 = false
					g119 = true
				end

				if g119 then
					break
				end
			end

			if not g119 then
				v118 = true
			end

			g119 = false
			v115 = not v118
		end
	end

	v114.Visible = v115
	u49.Position = UDim2.new(0.5, -15, 1, not v111 and -50 or -110)
	t1.IsHotbarVisible = v111
end
local function UpdateScrollingFrameCanvasSize() -- line: 261
	-- upvalues: u53 (ref), n1 (ref), u54 (ref)
	local v120 = math.floor(u53.AbsoluteSize.X / (n1 + 5))
	local v121 = math.ceil((#u54:GetChildren() - 1) / v120) * (n1 + 5) + 5

	u53.CanvasSize = UDim2.new(0, 0, 0, v121)
end
local function AdjustInventoryFrames() -- line: 268
	-- upvalues: u77 (ref), t3 (copy), UpdateScrollingFrameCanvasSize (copy)
	for i = u77 + 1, #t3 do
		local v123 = t3[i]

		v123.Frame.LayoutOrder = v123.Index
		v123.Frame.Visible = v123.Tool ~= nil
	end

	UpdateScrollingFrameCanvasSize()
end
local function UpdateBackpackLayout() -- line: 277
	-- upvalues: u48 (ref), u77 (ref), n1 (ref), u51 (ref), v78 (copy), u53 (ref), AdjustHotbarFrames (copy), AdjustInventoryFrames (copy)
	u48.Size = UDim2.new(0, 5 + u77 * (n1 + 5), 0, n1 + 5 + 5)
	u48.Position = UDim2.new(0.5, -u48.Size.X.Offset / 2, 1, -u48.Size.Y.Offset)
	u51.Size = UDim2.new(0, u48.Size.X.Offset, 0, u48.Size.Y.Offset * v78 + 40)
	u51.Position = UDim2.new(0.5, -u51.Size.X.Offset / 2, 1, u48.Position.Y.Offset - u51.Size.Y.Offset)
	u53.Size = UDim2.new(1, u53.ScrollBarThickness + 1, 1, -40)
	u53.Position = UDim2.new(0, 0, 0, 40)
	AdjustHotbarFrames()
	AdjustInventoryFrames()
end

function MakeSlot(p4, p5) -- line: 350
	-- upvalues: t3 (copy), u23 (ref), color3_2 (copy), color3 (copy), u48 (ref), n1 (ref), GameTranslator (copy), u77 (ref), u51 (ref), n2 (ref), u69 (ref), u44 (ref), ContextActionService (copy), u80 (ref), t4 (copy), u62 (ref), u58 (ref), u79 (ref), NewGui (copy), color3_3 (copy), t6 (copy), UpdateScrollingFrameCanvasSize (copy), u59 (ref), u67 (ref), Backpack (ref), color3_4 (copy), MakeSlot (copy), u54 (ref), u71 (ref), t5 (copy), ZeroValue (copy), u53 (ref)
	local v138 = p5 or #t3 + 1
	local t10 = {
		Tool = nil,
		Index = v138,
		Frame = nil
	}
	local u140 = nil
	local u141 = nil
	local u142 = nil
	local u143 = nil
	local u144 = nil
	local u145 = nil
	local u146 = nil
	local u147 = nil

	function t10.Readjust(_, p7, p8) -- line: 381
		-- upvalues: u48 (ref), n1 (ref), u140 (ref)
		local v268 = u48.Size.X.Offset / 2
		local v269 = n1 + 5
		local v270 = p7 - (p8 / 2 + 0.5)

		u140.Position = UDim2.new(0, v268 - n1 / 2 + v269 * v270, 0, 5)
	end
	function t10.Fill(p9, p10) -- line: 389
		-- upvalues: u142 (ref), u143 (ref), GameTranslator (copy), u146 (ref), u144 (ref), u77 (ref), u51 (ref), u140 (ref), n2 (ref), u69 (ref), u44 (ref), ContextActionService (copy), u80 (ref), t4 (copy), u62 (ref), t3 (copy)
		if not p10 then
			return p9:Clear()
		end

		p9.Tool = p10

		local function assignToolData() -- line: 396
			-- upvalues: p10 (copy), u142 (ref), u143 (ref), GameTranslator (copy), u146 (ref)
			local TextureId = p10.TextureId

			u142.Image = TextureId

			if TextureId ~= "" then
				u143.Visible = false
			else
				u143.Visible = true
			end

			GameTranslator:TranslateAndRegister(u143, p10, p10.Name)

			if u146 and p10:IsA("Tool") then
				GameTranslator:TranslateAndRegister(u146, p10, p10.ToolTip)

				local v400 = u146.TextBounds.X + 6

				u146.Size = UDim2.new(0, v400, 0, 16)
				u146.Position = UDim2.new(0.5, -v400 / 2, 0, -25)
			end
		end

		assignToolData()

		local g278 = nil
		local v277 = nil

		if u144 then
			u144:disconnect()
			u144 = nil
		end

		u144 = p10.Changed:connect(function(p11) -- line: 422
			-- upvalues: assignToolData (copy)
			if p11 == "TextureId" or (p11 == "Name" or p11 == "ToolTip") then
				assignToolData()
			end
		end)

		local v274 = p9.Index <= u77
		local Visible = u51.Visible

		if not v274 or Visible then
			u140.Draggable = true
		end

		p9:UpdateEquipView()

		if v274 then
			n2 += 1

			if u69 and n2 >= 1 and not u44 then
				u44 = true
				ContextActionService:BindAction("RBXHotbarEquip", u80, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			end
		end

		t4[p10] = p9

		for i = 1, u77 do
			v277 = t3[i]

			if not v277.Tool then
				g278 = true
			end

			if g278 then
				break
			end
		end

		if not g278 then
			v277 = nil
		end

		g278 = false
		u62 = v277
	end
	function t10.Clear(p12) -- line: 459
		-- upvalues: u144 (ref), u142 (ref), u143 (ref), u146 (ref), u140 (ref), u77 (ref), n2 (ref), u44 (ref), ContextActionService (copy), t4 (copy), u62 (ref), t3 (copy)
		if not p12.Tool then
			return
		end

		local g282 = nil
		local v281 = nil

		if u144 then
			u144:disconnect()
			u144 = nil
		end

		u142.Image = ""
		u143.Text = ""

		if u146 then
			u146.Text = ""
			u146.Visible = false
		end

		u140.Draggable = false
		p12:UpdateEquipView(true)

		if p12.Index <= u77 then
			n2 -= 1

			if n2 < 1 then
				u44 = false
				ContextActionService:UnbindAction("RBXHotbarEquip")
			end
		end

		t4[p12.Tool] = nil
		p12.Tool = nil

		for i = 1, u77 do
			v281 = t3[i]

			if not v281.Tool then
				g282 = true
			end

			if g282 then
				break
			end
		end

		if not g282 then
			v281 = nil
		end

		g282 = false
		u62 = v281
	end
	function t10.UpdateEquipView(p13, p14) -- line: 492
		-- upvalues: u58 (ref), u79 (ref), t10 (copy), u145 (ref), NewGui (copy), u140 (ref), color3_3 (copy), u23 (ref), color3_2 (copy), color3 (copy)
		local g285 = nil
		local Tool = nil

		repeat
			if g285 or not p14 then
				if not g285 then
					Tool = p13.Tool
				end

				if g285 or Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u58) then
					if not g285 then
						u79 = t10

						if not u145 then
							u145 = NewGui("Frame", "Equipped")
							u145.ZIndex = u140.ZIndex

							for _, v in pairs({
								{
									0.1,
									1,
									0,
									0
								},
								{
									0.8,
									0.1,
									0.1,
									0
								},
								{
									0.1,
									1,
									0.9,
									0
								},
								{
									0.8,
									0.1,
									0.1,
									0.9
								}
							}) do
								local v289 = NewGui("Frame", "Edge")

								v289.BackgroundTransparency = 0
								v289.BackgroundColor3 = color3_3
								v289.Size = UDim2.new(v[1], 0, v[2], 0)
								v289.Position = UDim2.new(v[3], 0, v[4], 0)
								v289.ZIndex = u145.ZIndex
								v289.Parent = u145
							end
						end

						u145.Parent = u140
					end

					g285 = false
					u140.SelectionImageObject = nil
					u140.BackgroundTransparency = if not u140.Draggable then u23 else 0
					u140.BackgroundColor3 = u140.Draggable and color3_2 or color3

					return
				end
			end

			if u145 then
				u145.Parent = nil
			end

			g285 = true
		until not g285
	end
	function t10.IsEquipped(p15) -- line: 524
		-- upvalues: u58 (ref)
		local Tool = p15.Tool

		return Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u58)
	end
	function t10.Delete(p16) -- line: 528
		-- upvalues: t6 (copy), u140 (ref), t3 (copy), UpdateScrollingFrameCanvasSize (copy)
		t6[u140] = nil
		u140:Destroy()
		table.remove(t3, p16.Index)

		local v293 = #t3

		for i = p16.Index, v293 do
			t3[i]:SlideBack()
		end

		UpdateScrollingFrameCanvasSize()
	end
	function t10.Swap(p17, p18) -- line: 542
		local Tool = p17.Tool
		local Tool2 = p18.Tool

		p17:Clear()

		if Tool2 then
			p18:Clear()
			p17:Fill(Tool2)
		end

		if Tool then
			p18:Fill(Tool)

			return
		end

		p18:Clear()
	end
	function t10.SlideBack(p19) -- line: 556
		-- upvalues: u140 (ref)
		p19.Index = p19.Index - 1
		u140.Name = p19.Index
		u140.LayoutOrder = p19.Index
	end
	function t10.TurnNumber(_, p21) -- line: 562
		-- upvalues: u147 (ref)
		if u147 then
			u147.Visible = p21
		end
	end
	function t10.SetClickability(p22, p23) -- line: 568
		-- upvalues: u140 (ref), u23 (ref), color3_2 (copy), color3 (copy)
		if p22.Tool then
			u140.Draggable = not p23
			u140.SelectionImageObject = nil
			u140.BackgroundTransparency = if not u140.Draggable then u23 else 0
			u140.BackgroundColor3 = u140.Draggable and color3_2 or color3
		end
	end
	function t10.CheckTerms(p24, p25) -- line: 575
		-- upvalues: u143 (ref), u146 (ref)
		local n5 = 0
		local Tool = p24.Tool

		if Tool then
			for k in pairs(p25) do
				local _, count = u143.Text:lower():gsub(k, "")

				n5 += count

				if Tool:IsA("Tool") then
					local _, count2 = (u146 and u146.Text or ""):lower():gsub(k, "")

					n5 += count2
				end
			end
		end

		return n5
	end
	function t10.Select(_, p27) -- line: 595
		-- upvalues: t10 (copy), u58 (ref), u59 (ref), u67 (ref), t4 (copy), Backpack (ref)
		if p27 then
			return
		end

		local Tool = t10.Tool

		if Tool then
			if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u58) then
				if u59 then
					u59:UnequipTools()

					if u67 then
						u67:ToggleSelect()
						t4[u67]:UpdateEquipView()
						u67 = nil

						return
					end
				end
			elseif Tool.Parent == Backpack then
				if u59 then
					u59:UnequipTools()

					if u67 then
						u67:ToggleSelect()
						t4[u67]:UpdateEquipView()
						u67 = nil
					end
				end

				if Tool:IsA("HopperBin") then
					Tool:ToggleSelect()
					t4[Tool]:UpdateEquipView()
					u67 = Tool

					return
				end

				Tool.Parent = u58
			end
		end
	end

	u140 = NewGui("TextButton", v138)
	u140.BackgroundColor3 = color3
	u140.BorderColor3 = color3_4
	u140.Text = ""
	u140.AutoButtonColor = false
	u140.BorderSizePixel = 0
	u140.Size = UDim2.new(0, n1, 0, n1)
	u140.Active = true
	u140.Draggable = false
	u140.BackgroundTransparency = u23
	u140.MouseButton1Click:connect(function() -- line: 622
		-- upvalues: t10 (copy)
		changeSlot(t10)
	end)
	t10.Frame = u140

	local v148 = NewGui("Frame", "SelectionObjectClipper")

	v148.Visible = false
	v148.Parent = u140

	local v149 = NewGui("ImageLabel", "Selector")

	v149.Size = UDim2.new(1, 0, 1, 0)
	v149.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	v149.ScaleType = Enum.ScaleType.Slice
	v149.SliceCenter = Rect.new(12, 12, 52, 52)
	v149.Parent = v148
	u142 = NewGui("ImageLabel", "Icon")
	u142.Size = UDim2.new(0.8, 0, 0.8, 0)
	u142.Position = UDim2.new(0.1, 0, 0.1, 0)
	u142.Parent = u140
	u143 = NewGui("TextLabel", "ToolName")
	u143.Size = UDim2.new(1, -2, 1, -2)
	u143.Position = UDim2.new(0, 1, 0, 1)
	u143.Parent = u140
	t10.Frame.LayoutOrder = t10.Index

	if v138 <= u77 then
		u146 = NewGui("TextLabel", "ToolTip")
		u146.TextWrapped = false
		u146.TextYAlignment = Enum.TextYAlignment.Top
		u146.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
		u146.BackgroundTransparency = 0
		u146.Visible = false
		u146.Parent = u140
		u140.MouseEnter:connect(function() -- line: 661
			-- upvalues: u146 (ref)
			if u146.Text ~= "" then
				u146.Visible = true
			end
		end)
		u140.MouseLeave:connect(function() -- line: 666
			-- upvalues: u146 (ref)
			u146.Visible = false
		end)

		function t10.MoveToInventory(p28) -- line: 670
			-- upvalues: t10 (copy), u77 (ref), MakeSlot (copy), u54 (ref), u58 (ref), u59 (ref), u67 (ref), t4 (copy), u71 (ref), u51 (ref)
			if t10.Index <= u77 then
				local Tool = t10.Tool

				p28:Clear()

				local v318 = MakeSlot(u54)

				v318:Fill(Tool)

				if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u58) and u59 then
					u59:UnequipTools()

					if u67 then
						u67:ToggleSelect()
						t4[u67]:UpdateEquipView()
						u67 = nil
					end
				end

				if u71 then
					v318.Frame.Visible = false
					v318.Parent = u51
				end
			end
		end

		if v138 < 10 or v138 == u77 then
			local v150 = v138 < 10 and v138 or 0

			u147 = NewGui("TextLabel", "Number")
			u147.Text = v150
			u147.Size = UDim2.new(0.15, 0, 0.15, 0)
			u147.Visible = false
			u147.Parent = u140
			t5[ZeroValue + v150] = function(p29) -- line: 696
				-- upvalues: t10 (copy)
				t10:Select(p29)
			end
		end
	end

	local Position = u140.Position
	local n6 = 0
	local Parent2 = nil

	u140.DragBegin:connect(function(p30) -- line: 707
		-- upvalues: t6 (copy), u140 (ref), Position (ref), u142 (ref), u143 (ref), u147 (ref), u145 (ref), Parent2 (ref), u54 (ref), u51 (ref), u141 (ref), NewGui (copy)
		t6[u140] = true
		Position = p30
		u140.BorderSizePixel = 2
		u140.ZIndex = 2
		u142.ZIndex = 2
		u143.ZIndex = 2
		u140.Parent.ZIndex = 2

		if u147 then
			u147.ZIndex = 2
		end

		if u145 then
			u145.ZIndex = 2

			for _, v in pairs(u145:GetChildren()) do
				v.ZIndex = 2
			end
		end

		Parent2 = u140.Parent

		if Parent2 == u54 then
			local _ = u140.AbsolutePosition
			local uDim2 = UDim2.new(0, u140.AbsolutePosition.X - u51.AbsolutePosition.X, 0, u140.AbsolutePosition.Y - u51.AbsolutePosition.Y)

			u140.Parent = u51
			u140.Position = uDim2
			u141 = NewGui("Frame", "FakeSlot")
			u141.LayoutOrder = u140.LayoutOrder
			u141.Size = u140.Size
			u141.BackgroundTransparency = 1
			u141.Parent = u54
		end
	end)
	u140.DragStopped:connect(function(p31, p32) -- line: 749
		-- upvalues: u141 (ref), u140 (ref), Position (ref), Parent2 (ref), u142 (ref), u143 (ref), u147 (ref), u145 (ref), t6 (copy), t10 (copy), u51 (ref), u77 (ref), n6 (ref), u62 (ref), u48 (ref), t3 (copy), u58 (ref), u59 (ref), u67 (ref), t4 (copy), u71 (ref)
		if u141 then
			u141:Destroy()
		end

		local timestamp = tick()

		u140.Position = Position
		u140.Parent = Parent2
		u140.BorderSizePixel = 0
		u140.ZIndex = 1
		u142.ZIndex = 1
		u143.ZIndex = 1
		Parent2.ZIndex = 1

		if u147 then
			u147.ZIndex = 1
		end

		if u145 then
			u145.ZIndex = 1

			for _, v in pairs(u145:GetChildren()) do
				v.ZIndex = 1
			end
		end

		t6[u140] = nil

		if not t10.Tool then
			return
		end

		local v330 = u51
		local AbsolutePosition = v330.AbsolutePosition
		local AbsoluteSize = v330.AbsoluteSize

		if p31 > AbsolutePosition.X and (p31 <= AbsolutePosition.X + AbsoluteSize.X and (p32 > AbsolutePosition.Y and p32 <= AbsolutePosition.Y + AbsoluteSize.Y)) then
			if t10.Index <= u77 then
				t10:MoveToInventory()
			end

			if t10.Index > u77 and timestamp - n6 < 0.5 then
				if u62 then
					local Tool = t10.Tool

					t10:Clear()
					u62:Fill(Tool)
					t10:Delete()
				end

				timestamp = 0
			end
		else
			local v334 = u48
			local AbsolutePosition2 = v334.AbsolutePosition
			local AbsoluteSize2 = v334.AbsoluteSize

			if p31 > AbsolutePosition2.X and (p31 <= AbsolutePosition2.X + AbsoluteSize2.X and (p32 > AbsolutePosition2.Y and p32 <= AbsolutePosition2.Y + AbsoluteSize2.Y)) then
				local t11 = {
					1e999,
					nil
				}

				for i = 1, u77 do
					local v339 = t3[i]
					local Frame = v339.Frame
					local vector2 = Vector2.new(p31, p32)
					local magnitude = (Frame.AbsolutePosition + Frame.AbsoluteSize / 2 - vector2).magnitude

					if magnitude < t11[1] then
						t11 = {
							magnitude,
							v339
						}
					end
				end

				local v343 = t11[2]

				if v343 ~= t10 then
					t10:Swap(v343)

					if t10.Index > u77 then
						local Tool = t10.Tool

						if not Tool then
							t10:Delete()
						else
							if Tool and (Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u58) and u59 then
								u59:UnequipTools()

								if u67 then
									u67:ToggleSelect()
									t4[u67]:UpdateEquipView()
									u67 = nil
								end
							end

							if u71 then
								t10.Frame.Visible = false
								t10.Frame.Parent = u51
							end
						end
					end
				end
			elseif t10.Index <= u77 then
				t10:MoveToInventory()
			end
		end

		n6 = timestamp
	end)
	u140.Parent = p4
	t3[v138] = t10

	if v138 > u77 then
		UpdateScrollingFrameCanvasSize()

		if u51.Visible and not u71 then
			local v154 = u53.CanvasSize.Y.Offset - u53.AbsoluteSize.Y

			u53.CanvasPosition = Vector2.new(0, (math.max(0, v154)))
		end
	end

	return t10
end

local function OnChildAdded(p33) -- line: 920
	-- upvalues: u58 (ref), u59 (ref), n3 (ref), u67 (ref), t4 (copy), u68 (ref), LocalPlayer (ref), u62 (ref), MakeSlot (copy), u54 (ref), t3 (copy), Backpack (ref), AdjustHotbarFrames (copy), u77 (ref), u51 (ref), t1 (copy)
	if not p33:IsA("Tool") and not p33:IsA("HopperBin") then
		if p33:IsA("Humanoid") and p33.Parent == u58 then
			u59 = p33
		end

		return
	end

	if p33.Parent == u58 then
		n3 = tick()
	end

	if u67 and p33.Parent == u58 then
		u67:ToggleSelect()
		t4[u67]:UpdateEquipView()
		u67 = nil
	end

	if not u68 and p33.Parent == u58 and not t4[p33] then
		local StarterGear = LocalPlayer:FindFirstChild("StarterGear")

		if StarterGear and StarterGear:FindFirstChild(p33.Name) then
			u68 = true

			for i = (u62 or MakeSlot(u54)).Index, 1, -1 do
				local v170 = t3[i]
				local v171 = i - 1

				if v171 > 0 then
					t3[v171]:Swap(v170)
				else
					v170:Fill(p33)
				end
			end

			for _, v in pairs(u58:GetChildren()) do
				if v:IsA("Tool") and v ~= p33 then
					v.Parent = Backpack
				end
			end

			AdjustHotbarFrames()

			return
		end
	end

	local v174 = t4[p33]

	if v174 then
		v174:UpdateEquipView()
	else
		local v175 = u62 or MakeSlot(u54)

		v175:Fill(p33)

		if v175.Index <= u77 and not u51.Visible then
			AdjustHotbarFrames()
		end

		if p33:IsA("HopperBin") and p33.Active then
			if u59 then
				u59:UnequipTools()

				if u67 then
					u67:ToggleSelect()
					t4[u67]:UpdateEquipView()
					u67 = nil
				end
			end

			u67 = p33
		end
	end

	t1.BackpackItemAdded:Fire()
end
local function OnChildRemoved(p34) -- line: 987
	-- upvalues: n3 (ref), u58 (ref), Backpack (ref), t4 (copy), u77 (ref), u51 (ref), AdjustHotbarFrames (copy), u67 (ref), t1 (copy), t3 (copy)
	if not p34:IsA("Tool") and not p34:IsA("HopperBin") then
		return
	end

	n3 = tick()

	local p34Parent = p34.Parent

	if p34Parent == u58 or p34Parent == Backpack then
		return
	end

	local v178 = t4[p34]
	local g182 = nil
	local v181 = nil

	if v178 then
		v178:Clear()

		if v178.Index > u77 then
			v178:Delete()
		elseif not u51.Visible then
			AdjustHotbarFrames()
		end
	end

	if p34 == u67 then
		u67 = nil
	end

	t1.BackpackItemRemoved:Fire()

	for i = u77 + 1, #t3 do
		local v180 = t3[i]

		if v180 and v180.Tool then
			v181 = false
			g182 = true
		end

		if g182 then
			break
		end
	end

	if not g182 then
		v181 = true
	end

	g182 = false

	if v181 then
		t1.BackpackEmpty:Fire()
	end
end
local function OnCharacterAdded(p35) -- line: 1021
	-- upvalues: t3 (copy), u77 (ref), u67 (ref), t8 (ref), u58 (ref), OnChildRemoved (copy), OnChildAdded (copy), Backpack (ref), LocalPlayer (ref), AdjustHotbarFrames (copy)
	for i = #t3, 1, -1 do
		local v185 = t3[i]

		if v185.Tool then
			v185:Clear()
		end

		if i > u77 then
			v185:Delete()
		end
	end

	u67 = nil

	for _, v in pairs(t8) do
		v:disconnect()
	end

	t8 = {}
	u58 = p35
	table.insert(t8, p35.ChildRemoved:connect(OnChildRemoved))
	table.insert(t8, p35.ChildAdded:connect(OnChildAdded))

	for _, v in pairs(p35:GetChildren()) do
		OnChildAdded(v)
	end

	Backpack = LocalPlayer:WaitForChild("Backpack")
	table.insert(t8, Backpack.ChildRemoved:connect(OnChildRemoved))
	table.insert(t8, Backpack.ChildAdded:connect(OnChildAdded))

	for _, v in pairs(Backpack:GetChildren()) do
		OnChildAdded(v)
	end

	AdjustHotbarFrames()
end
local function OnInputBegan(p36, p37) -- line: 1060
	-- upvalues: u70 (ref), u69 (ref), BackspaceValue (copy), t5 (copy), u51 (ref), t1 (copy)
	if p36.UserInputType == Enum.UserInputType.Keyboard and not u70 and (u69 or p36.KeyCode.Value == BackspaceValue) then
		local v194 = t5[p36.KeyCode.Value]

		if v194 then
			v194(p37)
		end
	end

	local UserInputType = p36.UserInputType

	if not p37 and ((UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch) and u51.Visible) then
		t1.OpenClose()
	end
end
local function OnUISChanged(p38) -- line: 1083
	-- upvalues: UserInputService (copy), VRService (copy), u77 (ref), t3 (copy)
	if p38 == "KeyboardEnabled" or p38 == "VREnabled" then
		local v197 = UserInputService.KeyboardEnabled and not VRService.VREnabled

		for i = 1, u77 do
			t3[i]:TurnNumber(v197)
		end
	end
end

local u92 = nil
local timestamp = nil

local function v94() -- line: 1095
end

local _ = Vector2.new(0, 0)

function unbindAllGamepadEquipActions() -- line: 1099
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("RBXBackpackHasGamepadFocus")
	ContextActionService:UnbindAction("RBXCloseInventory")
end
function u80(_, p40, p41) -- line: 1174
	-- upvalues: u92 (ref), timestamp (ref), u59 (ref), u67 (ref), t4 (copy), u77 (ref), t3 (copy), u79 (ref)
	if p40 ~= Enum.UserInputState.Begin then
		return
	end

	if u92 and ((u92.KeyCode == Enum.KeyCode.ButtonR1 and p41.KeyCode == Enum.KeyCode.ButtonL1 or u92.KeyCode == Enum.KeyCode.ButtonL1 and p41.KeyCode == Enum.KeyCode.ButtonR1) and tick() - timestamp <= 0.06) then
		if u59 then
			u59:UnequipTools()

			if u67 then
				u67:ToggleSelect()
				t4[u67]:UpdateEquipView()
				u67 = nil
			end
		end

		u92 = p41
		timestamp = tick()

		return
	end

	u92 = p41
	timestamp = tick()
	delay(0.06, function() -- line: 1202
		-- upvalues: u92 (ref), p41 (copy), u77 (ref), t3 (copy), u59 (ref), u67 (ref), t4 (copy), u79 (ref)
		if u92 ~= p41 then
			return
		end

		local v345 = p41.KeyCode ~= Enum.KeyCode.ButtonL1 and 1 or -1

		for i = 1, u77 do
			if t3[i]:IsEquipped() then
				local v347 = v345 + i
				local v348 = false

				if v347 > u77 then
					v347 = 1
					v348 = true
				elseif v347 < 1 then
					v347 = u77
					v348 = true
				end

				local v349 = v347

				while not t3[v349].Tool do
					v349 += v345

					if v349 == v347 then
						return
					end

					if v349 > u77 then
						v349 = 1
						v348 = true
					elseif v349 < 1 then
						v349 = u77
						v348 = true
					end
				end

				if v348 then
					if u59 then
						u59:UnequipTools()

						if u67 then
							u67:ToggleSelect()
							t4[u67]:UpdateEquipView()
							u67 = nil
						end
					end

					u79 = nil

					return
				end

				t3[v349]:Select()

				return
			end
		end

		if u79 and u79.Tool then
			u79:Select()

			return
		end

		for i = v345 == -1 and u77 or 1, if v345 ~= -1 then u77 else 1, v345 do
			if t3[i].Tool then
				t3[i]:Select()

				return
			end
		end
	end)
end
function getGamepadSwapSlot() -- line: 1269
	-- upvalues: t3 (copy)
	for i = 1, #t3 do
		if t3[i].Frame.BorderSizePixel > 0 then
			return t3[i]
		end
	end
end
function changeSlot(p42) -- line: 1277
	-- upvalues: GamepadService (copy), GuiService (copy), u52 (ref), u77 (ref)
	local GamepadCursorEnabled = GamepadService.GamepadCursorEnabled

	if p42.Frame == GuiService.SelectedCoreObject and not GamepadCursorEnabled then
		local v219 = getGamepadSwapSlot()

		if not v219 then
			local FrameSize = p42.Frame.Size
			local FramePosition = p42.Frame.Position

			p42.Frame:TweenSizeAndPosition(FrameSize + UDim2.new(0, 10, 0, 10), FramePosition - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() -- line: 1313
				-- upvalues: p42 (copy), FrameSize (copy), FramePosition (copy)
				p42.Frame:TweenSizeAndPosition(FrameSize, FramePosition, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true)
			end)
			p42.Frame.BorderSizePixel = 3
			u52.SelectionImageObject.Visible = true

			return
		end

		v219.Frame.BorderSizePixel = 0

		if v219 ~= p42 then
			p42:Swap(v219)
			u52.SelectionImageObject.Visible = false

			if p42.Index > u77 and not p42.Tool then
				if GuiService.SelectedCoreObject == p42.Frame then
					GuiService.SelectedCoreObject = v219.Frame
				end

				p42:Delete()
			end

			if v219.Index > u77 and not v219.Tool then
				if GuiService.SelectedCoreObject == v219.Frame then
					GuiService.SelectedCoreObject = p42.Frame
				end

				v219:Delete()

				return
			end
		end
	else
		p42:Select()
		u52.SelectionImageObject.Visible = false
	end
end
function enableGamepadInventoryControl() -- line: 1333
	-- upvalues: u51 (ref), t1 (copy), ContextActionService (copy), v94 (copy), GuiService (copy), u48 (ref)
	ContextActionService:BindAction("RBXBackpackHasGamepadFocus", v94, false, Enum.UserInputType.Gamepad1)
	ContextActionService:BindAction("RBXCloseInventory", function(_, p44, _) -- line: 1334
		-- upvalues: u51 (ref), t1 (copy)
		if p44 ~= Enum.UserInputState.Begin then
			return
		end

		if getGamepadSwapSlot() then
			local v354 = getGamepadSwapSlot()

			if v354 then
				v354.Frame.BorderSizePixel = 0

				return
			end
		elseif u51.Visible then
			t1.OpenClose()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)

	if not false then
		GuiService.SelectedCoreObject = u48:FindFirstChild("1")
	end
end
function disableGamepadInventoryControl() -- line: 1366
	-- upvalues: u77 (ref), t3 (copy), GuiService (copy), u47 (ref)
	unbindAllGamepadEquipActions()

	for i = 1, u77 do
		local v223 = t3[i]

		if v223 and v223.Frame then
			v223.Frame.BorderSizePixel = 0
		end
	end

	if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(u47) then
		GuiService.SelectedCoreObject = nil
	end
end
function gamepadDisconnected() -- line: 1400
	-- upvalues: VRService (copy), u75 (ref)
	if not VRService.VREnabled then
		u75 = false
		disableGamepadInventoryControl()
	end
end
function gamepadConnected() -- line: 1407
	-- upvalues: VRService (copy), u75 (ref), GuiService (copy), u47 (ref), n2 (ref), u69 (ref), u44 (ref), ContextActionService (copy), u80 (ref), u51 (ref)
	if not VRService.VREnabled then
		u75 = true
		GuiService:AddSelectionParent("RBXBackpackSelection", u47)

		if n2 >= 1 and u69 and not u44 then
			u44 = true
			ContextActionService:BindAction("RBXHotbarEquip", u80, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
		end

		if u51.Visible then
			enableGamepadInventoryControl()
		end
	end
end

local function setBackpackEnabled(p46) -- line: 1422
	-- upvalues: u43 (ref), u69 (ref), u47 (ref), FFlagMountCoreGuiBackpack (copy), RobloxGui (copy), t7 (copy), GuiService (copy), n2 (ref), u44 (ref), ContextActionService (copy), u80 (ref)
	local v225 = p46 and u43

	u69 = v225

	if u47 then
		if FFlagMountCoreGuiBackpack then
			if v225 then
				u47.Parent = RobloxGui
			else
				u47.Parent = nil
			end
		else
			u47.Visible = v225
		end
	end

	for _, v in pairs(t7) do
		if v225 then
			GuiService:AddKey(v)
		else
			GuiService:RemoveKey(v)
		end
	end

	if v225 then
		if n2 >= 1 and u69 and not u44 then
			u44 = true
			ContextActionService:BindAction("RBXHotbarEquip", u80, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)

			return
		end
	else
		disableGamepadInventoryControl()
		u44 = false
		ContextActionService:UnbindAction("RBXHotbarEquip")
	end
end
local function MakeVRRoundButton(p47, p48) -- line: 1455
	-- upvalues: NewGui (copy)
	local v230 = NewGui("ImageButton", p47)

	v230.Size = UDim2.new(0, 40, 0, 40)
	v230.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png"

	local v231 = NewGui("ImageLabel", "Icon")

	v231.Size = UDim2.new(0.5, 0, 0.5, 0)
	v231.Position = UDim2.new(0.25, 0, 0.25, 0)
	v231.Image = p48
	v231.Parent = v230

	local v232 = NewGui("ImageLabel", "Selection")

	v232.Size = UDim2.new(0.9, 0, 0.9, 0)
	v232.Position = UDim2.new(0.05, 0, 0.05, 0)
	v232.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
	v230.SelectionImageObject = v232

	return v230, v231, v232
end

function t1.createGui() -- line: 1475
	-- upvalues: u47 (ref), NewGui (copy), FFlagMountCoreGuiBackpack (copy), StarterGui (copy), RobloxGui (copy), u48 (ref), u77 (ref), MakeSlot (copy), u62 (ref), u49 (ref), t1 (copy), color3_5 (copy), u50 (ref), MakeVRRoundButton (copy), u51 (ref), u19 (ref), color3 (copy), u52 (ref), u53 (ref), u54 (ref), UIGridLayout (ref), n1 (ref), u56 (ref), u57 (ref), UpdateBackpackLayout (copy), Create (copy), v40 (copy), color3_6 (copy), u29 (ref), s1 (ref), color3_3 (copy), t3 (copy), u71 (ref), UpdateScrollingFrameCanvasSize (copy), t9 (copy), t5 (copy), VRService (copy), UserInputService (copy), GuiService (copy), t6 (copy), AdjustHotbarFrames (copy), u75 (ref), t2 (copy), ContextActionService (copy), BackquoteValue (copy), LocalPlayer (ref), Players (copy), OnCharacterAdded (copy), t7 (copy), OnInputBegan (copy), u70 (ref), BackspaceValue (copy), u67 (ref), u59 (ref), t4 (copy), OnUISChanged (copy), v15 (copy), SettingsShowSignal (copy), isInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), InExperienceAppChatModal (copy), UserGameSettings (copy), u23 (ref)
	u47 = NewGui("Frame", "Backpack")

	if FFlagMountCoreGuiBackpack then
		if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
			u47.Parent = RobloxGui
		end
	else
		u47.Visible = false
		u47.Parent = RobloxGui
	end

	u48 = NewGui("Frame", "Hotbar")
	u48.Parent = u47

	for i = 1, u77 do
		local v234 = MakeSlot(u48, i)

		v234.Frame.Visible = false

		if not u62 then
			u62 = v234
		end
	end

	u49 = NewGui("ImageButton", "OpenInventory")
	u49.Size = UDim2.new(0, 30, 0, 30)
	u49.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png"
	u49.MouseButton1Click:connect(function() -- line: 1506
		-- upvalues: t1 (copy)
		t1.OpenClose()
	end)
	u49.SelectionGained:connect(function() -- line: 1509
		-- upvalues: u49 (ref), color3_5 (copy)
		u49.ImageColor3 = color3_5
	end)
	u49.SelectionLost:connect(function() -- line: 1512
		-- upvalues: u49 (ref)
		u49.ImageColor3 = Color3.new(1, 1, 1)
	end)

	local v235 = NewGui("Frame", "Selection")

	v235.Visible = false
	u49.SelectionImageObject = v235
	u50 = MakeVRRoundButton("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png")
	u50.Position = UDim2.new(0, 0, 0, -50)
	u50.MouseButton1Click:connect(function() -- line: 1522
		-- upvalues: u51 (ref), t1 (copy)
		if u51.Visible then
			t1.OpenClose()
		end
	end)

	local v236 = NewGui("ImageLabel", "LeftBumper")

	v236.Size = UDim2.new(0, 40, 0, 40)
	v236.Position = UDim2.new(0, -v236.Size.X.Offset, 0.5, -v236.Size.Y.Offset / 2)

	local v237 = NewGui("ImageLabel", "RightBumper")

	v237.Size = UDim2.new(0, 40, 0, 40)
	v237.Position = UDim2.new(1, 0, 0.5, -v237.Size.Y.Offset / 2)
	u51 = NewGui("Frame", "Inventory")
	u51.BackgroundTransparency = u19
	u51.BackgroundColor3 = color3
	u51.Active = true
	u51.Visible = false
	u51.Parent = u47
	u52 = NewGui("TextButton", "VRInventorySelector")
	u52.Position = UDim2.new(0, 0, 0, 0)
	u52.Size = UDim2.new(1, 0, 1, 0)
	u52.BackgroundTransparency = 1
	u52.Text = ""
	u52.Parent = u51

	local v238 = NewGui("ImageLabel", "Selector")

	v238.Size = UDim2.new(1, 0, 1, 0)
	v238.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png"
	v238.ScaleType = Enum.ScaleType.Slice
	v238.SliceCenter = Rect.new(12, 12, 52, 52)
	v238.Visible = false
	u52.SelectionImageObject = v238
	u53 = NewGui("ScrollingFrame", "ScrollingFrame")
	u53.Selectable = false
	u53.CanvasSize = UDim2.new(0, 0, 0, 0)
	u53.Parent = u51
	u54 = NewGui("Frame", "UIGridFrame")
	u54.Selectable = false
	u54.Size = UDim2.new(1, -10, 1, 0)
	u54.Position = UDim2.new(0, 5, 0, 0)
	u54.Parent = u53
	UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, n1, 0, n1)
	UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
	UIGridLayout.Parent = u54
	u56 = MakeVRRoundButton("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	u56.Size = UDim2.new(0, 34, 0, 34)
	u56.Position = UDim2.new(0.5, -u56.Size.X.Offset / 2, 0, 43)
	u56.Icon.Position = u56.Icon.Position - UDim2.new(0, 0, 0, 2)
	u56.MouseButton1Click:connect(function() -- line: 1582
		-- upvalues: u53 (ref), n1 (ref)
		u53.CanvasPosition = Vector2.new(u53.CanvasPosition.X, (math.min(u53.CanvasSize.Y.Offset - u53.AbsoluteWindowSize.Y, (math.max(0, u53.CanvasPosition.Y - (n1 + 5))))))
	end)
	u57 = MakeVRRoundButton("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png")
	u57.Rotation = 180
	u57.Icon.Position = u57.Icon.Position - UDim2.new(0, 0, 0, 2)
	u57.Size = UDim2.new(0, 34, 0, 34)
	u57.Position = UDim2.new(0.5, -u57.Size.X.Offset / 2, 1, -u57.Size.Y.Offset - 3)
	u57.MouseButton1Click:connect(function() -- line: 1600
		-- upvalues: u53 (ref), n1 (ref)
		u53.CanvasPosition = Vector2.new(u53.CanvasPosition.X, (math.min(u53.CanvasSize.Y.Offset - u53.AbsoluteWindowSize.Y, (math.max(0, u53.CanvasPosition.Y + (n1 + 5))))))
	end)
	u53.Changed:connect(function(p49) -- line: 1611
		-- upvalues: u53 (ref), u56 (ref), u57 (ref)
		if p49 == "AbsoluteWindowSize" or (p49 == "CanvasPosition" or p49 == "CanvasSize") then
			local v356 = u53.CanvasPosition.Y ~= 0
			local v357 = u53.CanvasPosition.Y < u53.CanvasSize.Y.Offset - u53.AbsoluteWindowSize.Y

			u56.Visible = v356
			u57.Visible = v357
		end
	end)
	UpdateBackpackLayout()

	local v239 = Create("Frame")({
		Name = "GamepadHintsFrame",
		Size = UDim2.new(0, u48.Size.X.Offset, 0, not v40 and 60 or 95),
		BackgroundTransparency = 1,
		Visible = false,
		Parent = u47
	})

	local function addGamepadHint(p50, p51, p52) -- line: 1634
		-- upvalues: Create (copy), v239 (copy), v40 (copy)
		local v361 = Create("Frame")({
			Name = "HintFrame",
			Size = UDim2.new(1, 0, 1, -5),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			Parent = v239
		})

		Create("ImageLabel")({
			Name = "HintImage",
			Size = v40 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60),
			BackgroundTransparency = 1,
			Image = v40 and p51 or p50,
			Parent = v361
		})

		local v362 = Create("TextLabel")({
			Name = "HintText",
			Position = UDim2.new(0, not v40 and 70 or 100, 0, 0),
			Size = UDim2.new(1, -(not v40 and 70 or 100), 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = v40 and Enum.FontSize.Size36 or Enum.FontSize.Size24,
			BackgroundTransparency = 1,
			Text = p52,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Parent = v361
		})
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

		UITextSizeConstraint.Parent = v362
		UITextSizeConstraint.MaxTextSize = v362.TextSize
	end
	local function resizeGamepadHintsFrame() -- line: 1669
		-- upvalues: v239 (copy), u48 (ref), v40 (copy), u51 (ref)
		v239.Size = UDim2.new(u48.Size.X.Scale, u48.Size.X.Offset, 0, not v40 and 60 or 95)
		v239.Position = UDim2.new(u48.Position.X.Scale, u48.Position.X.Offset, u51.Position.Y.Scale, u51.Position.Y.Offset - v239.Size.Y.Offset)

		local n7 = 0
		local children = v239:GetChildren()

		for i = 1, #children do
			children[i].Size = UDim2.new(1, 0, 1, -5)
			children[i].Position = UDim2.new(0, 0, 0, 0)
			n7 += children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X
		end

		local v367 = (v239.AbsoluteSize.X - n7) / (#children - 1)

		for i = 1, #children do
			children[i].Position = i == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, children[i - 1].Position.X.Offset + children[i - 1].Size.X.Offset + v367, 0, 0)
			children[i].Size = UDim2.new(0, children[i].HintText.Position.X.Offset + children[i].HintText.TextBounds.X, 1, -5)
		end
	end

	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap")
	addGamepadHint("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack")

	local v242 = NewGui("Frame", "Search")

	v242.BackgroundColor3 = color3_6
	v242.BackgroundTransparency = u29
	v242.Size = UDim2.new(0, 190, 0, 30)
	v242.Position = UDim2.new(1, -v242.Size.X.Offset - 5, 0, 5)
	v242.Parent = u51

	local v243 = NewGui("TextBox", "TextBox")

	v243.Text = s1
	v243.ClearTextOnFocus = false
	v243.FontSize = Enum.FontSize.Size24
	v243.TextXAlignment = Enum.TextXAlignment.Left
	v243.Size = v242.Size - UDim2.new(0, 0, 0, 0)
	v243.Position = UDim2.new(0, 0, 0, 0)
	v243.Parent = v242

	local v244 = NewGui("TextButton", "X")

	v244.Text = "x"
	v244.TextColor3 = color3_3
	v244.FontSize = Enum.FontSize.Size24
	v244.TextYAlignment = Enum.TextYAlignment.Bottom
	v244.BackgroundColor3 = color3_6
	v244.BackgroundTransparency = 0
	v244.Size = UDim2.new(0, v242.Size.Y.Offset - 10, 0, v242.Size.Y.Offset - 10)
	v244.Position = UDim2.new(1, -v244.Size.X.Offset - 10, 0.5, -v244.Size.Y.Offset / 2)
	v244.ZIndex = 0
	v244.Visible = false
	v244.BorderSizePixel = 0
	v244.Parent = v242

	local function search() -- line: 1764
		-- upvalues: v243 (copy), u77 (ref), t3 (copy), u51 (ref), u71 (ref), u54 (ref), u53 (ref), UpdateScrollingFrameCanvasSize (copy), v244 (copy)
		local t12 = {}

		for match in v243.Text:gmatch("%S+") do
			t12[match:lower()] = true
		end

		local t13 = {}

		for i = u77 + 1, #t3 do
			local v373 = t3[i]

			table.insert(t13, {
				v373,
				(v373:CheckTerms(t12))
			})
			v373.Frame.Visible = false
			v373.Frame.Parent = u51
		end

		table.sort(t13, function(p53, p54) -- line: 1779
			return p53[2] > p54[2]
		end)
		u71 = true

		local n8 = 0

		for _, v in ipairs(t13) do
			local v377 = v[1]

			if v[2] > 0 then
				v377.Frame.Visible = true
				v377.Frame.Parent = u54
				v377.Frame.LayoutOrder = u77 + n8
				n8 += 1
			end
		end

		u53.CanvasPosition = Vector2.new(0, 0)
		UpdateScrollingFrameCanvasSize()
		v244.ZIndex = 3
	end
	local function clearResults() -- line: 1801
		-- upvalues: v244 (copy), u71 (ref), u77 (ref), t3 (copy), u54 (ref), UpdateScrollingFrameCanvasSize (copy)
		if v244.ZIndex > 0 then
			u71 = false

			for i = u77 + 1, #t3 do
				local v379 = t3[i]

				v379.Frame.LayoutOrder = v379.Index
				v379.Frame.Parent = u54
				v379.Frame.Visible = true
			end

			v244.ZIndex = 0
		end

		UpdateScrollingFrameCanvasSize()
	end

	v243.Focused:connect(function() --[[ onFocused ]] -- line: 1832
		-- upvalues: v243 (copy), s1 (ref)
		if v243.Text == s1 then
			v243.Text = ""
		end
	end)
	v244.MouseButton1Click:connect(function() --[[ reset ]] -- line: 1815
		-- upvalues: clearResults (copy), v243 (copy), s1 (ref)
		clearResults()
		v243.Text = s1
	end)
	v243.Changed:connect(function(p55) --[[ onChanged ]] -- line: 1820
		-- upvalues: v243 (copy), clearResults (copy), s1 (ref), search (copy), v244 (copy)
		if p55 == "Text" then
			local Text = v243.Text

			if Text == "" then
				clearResults()
			elseif Text ~= s1 then
				search()
			end

			v244.Visible = Text ~= "" and Text ~= s1
		end
	end)
	v243.FocusLost:connect(function(p56) --[[ focusLost ]] -- line: 1838
		-- upvalues: search (copy), v243 (copy), s1 (ref)
		if p56 then
			search()

			return
		end

		if v243.Text == "" then
			v243.Text = s1
		end
	end)
	table.insert(t9, t1.StateChanged.Event:connect(function(p57) -- line: 1854
		-- upvalues: v244 (copy), clearResults (copy), v243 (copy), s1 (ref)
		v244.Modal = p57

		if not p57 then
			clearResults()
			v243.Text = s1
		end
	end))
	t5[Enum.KeyCode.Escape.Value] = function(p58) -- line: 1862
		-- upvalues: clearResults (copy), v243 (copy), s1 (ref), u51 (ref), t1 (copy)
		if p58 then
			clearResults()
			v243.Text = s1

			return
		end

		if u51.Visible then
			t1.OpenClose()
		end
	end
	table.insert(t9, UserInputService.LastInputTypeChanged:connect(function(p59) --[[ detectGamepad ]] -- line: 1870
		-- upvalues: VRService (copy), v242 (copy)
		if p59 == Enum.UserInputType.Gamepad1 and not VRService.VREnabled then
			v242.Visible = false

			return
		end

		v242.Visible = true
	end))

	local function v247(_, p61, _) -- line: 1881
		-- upvalues: GuiService (copy), u77 (ref), t3 (copy)
		if p61 ~= Enum.UserInputState.Begin then
			return
		end

		if not GuiService.SelectedCoreObject then
			return
		end

		for i = 1, u77 do
			if t3[i].Frame == GuiService.SelectedCoreObject and t3[i].Tool then
				t3[i]:MoveToInventory()

				return
			end
		end
	end
	local function openClose() -- line: 1897
		-- upvalues: t6 (copy), u51 (ref), AdjustHotbarFrames (copy), u48 (ref), u77 (ref), t3 (copy), u75 (ref), t2 (copy), UserInputService (copy), resizeGamepadHintsFrame (copy), v239 (copy), ContextActionService (copy), v247 (copy), t1 (copy)
		if not next(t6) then
			u51.Visible = not u51.Visible

			local Visible = u51.Visible

			AdjustHotbarFrames()
			u48.Active = not u48.Active

			for i = 1, u77 do
				t3[i]:SetClickability(not Visible)
			end
		end

		if u51.Visible then
			if u75 then
				if t2[UserInputService:GetLastInputType()] then
					resizeGamepadHintsFrame()
					v239.Visible = true
				end

				enableGamepadInventoryControl()
			end
		else
			if u75 then
				v239.Visible = false
			end

			disableGamepadInventoryControl()
		end

		if u51.Visible then
			ContextActionService:BindAction("RBXRemoveSlot", v247, false, Enum.KeyCode.ButtonX)
		else
			ContextActionService:UnbindAction("RBXRemoveSlot")
		end

		t1.IsOpen = u51.Visible
		t1.StateChanged:Fire(u51.Visible)
	end

	t5[BackquoteValue] = function() -- line: 1933
		-- upvalues: GuiService (copy), openClose (copy)
		if GuiService.MenuIsOpen then
			return
		end

		openClose()
	end
	t1.OpenClose = openClose

	while not LocalPlayer do
		wait()
		LocalPlayer = Players.LocalPlayer
	end

	table.insert(t9, LocalPlayer.CharacterAdded:connect(OnCharacterAdded))

	if LocalPlayer.Character then
		OnCharacterAdded(LocalPlayer.Character)
	end

	for i = 0, 9 do
		table.insert(t7, (tostring(i)))
	end

	table.insert(t7, "`")
	table.insert(t9, UserInputService.InputBegan:connect(OnInputBegan))
	table.insert(t9, UserInputService.TextBoxFocused:connect(function() -- line: 1970
		-- upvalues: u70 (ref)
		u70 = true
	end))
	table.insert(t9, UserInputService.TextBoxFocusReleased:connect(function() -- line: 1976
		-- upvalues: u70 (ref)
		u70 = false
	end))
	t5[BackspaceValue] = function() -- line: 1982
		-- upvalues: u67 (ref), u59 (ref), t4 (copy)
		if u67 and u59 then
			u59:UnequipTools()

			if u67 then
				u67:ToggleSelect()
				t4[u67]:UpdateEquipView()
				u67 = nil
			end
		end
	end
	table.insert(t9, UserInputService.Changed:connect(OnUISChanged))

	local v250 = UserInputService.KeyboardEnabled and not VRService.VREnabled

	for i = 1, u77 do
		t3[i]:TurnNumber(v250)
	end

	if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
		gamepadConnected()
	end

	table.insert(t9, UserInputService.GamepadConnected:connect(function(p63) -- line: 1998
		if p63 == Enum.UserInputType.Gamepad1 then
			gamepadConnected()
		end
	end))
	table.insert(t9, UserInputService.GamepadDisconnected:connect(function(p64) -- line: 2006
		if p64 == Enum.UserInputType.Gamepad1 then
			gamepadDisconnected()
		end
	end))

	if v15 then
		table.insert(t9, SettingsShowSignal:connect(function(p65) -- line: 2017
			-- upvalues: t1 (copy), AdjustHotbarFrames (copy)
			if p65 then
				if t1.IsHotbarVisible then
					AdjustHotbarFrames(true)

					return
				end
			else
				AdjustHotbarFrames(false)
			end
		end))
	end

	table.insert(t9, GuiService.MenuOpened:Connect(function() -- line: 2031
		-- upvalues: t1 (copy), isInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), VRService (copy)
		if t1.IsOpen and (not isInExperienceUIVREnabled or (InExperienceUIVRIXP:isMovePanelToCenter() and true or not VRService.VREnabled)) then
			t1.OpenClose()
		end
	end))
	table.insert(t9, InExperienceAppChatModal.default.visibilitySignal.Event:Connect(function(p66) -- line: 2047
		-- upvalues: t1 (copy)
		if p66 and t1.IsOpen then
			t1.OpenClose()
		end
	end))
	table.insert(t9, UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ OnPreferredTransparencyChanged ]] -- line: 2054
		-- upvalues: UserGameSettings (copy), u19 (ref), u51 (ref), u23 (ref), t3 (copy), u29 (ref), v242 (copy)
		local PreferredTransparency = UserGameSettings.PreferredTransparency

		u19 = 0.5 * UserGameSettings.PreferredTransparency
		u51.BackgroundTransparency = u19
		u23 = 0.5 * PreferredTransparency

		for _, v in ipairs(t3) do
			v.Frame.BackgroundTransparency = u23
		end

		u29 = 0.15 * UserGameSettings.PreferredTransparency
		v242.BackgroundTransparency = u29
	end))
end
function t1.destroyGui() -- line: 2074
	-- upvalues: t9 (copy), t8 (ref), ContextActionService (copy), t3 (copy), t4 (copy), t5 (copy), t6 (copy), t7 (copy), u47 (ref), u48 (ref), u49 (ref), u50 (ref), u51 (ref), u52 (ref), u53 (ref), u54 (ref), UIGridLayout (ref), u56 (ref), u57 (ref), u58 (ref), u59 (ref), Backpack (ref), u62 (ref), n2 (ref), u67 (ref), u68 (ref), u69 (ref), u70 (ref), u71 (ref), u75 (ref), u44 (ref), n3 (ref), u79 (ref), t1 (copy)
	for _, v in pairs(t9) do
		v:disconnect()
	end

	table.clear(t9)

	for _, v in pairs(t8) do
		v:disconnect()
	end

	table.clear(t8)
	ContextActionService:UnbindAction("RBXHotbarEquip")
	ContextActionService:UnbindAction("RBXRemoveSlot")
	unbindAllGamepadEquipActions()

	for i = #t3, 1, -1 do
		local v257 = t3[i]

		if v257.Tool then
			v257:Clear()
		end
	end

	table.clear(t3)
	table.clear(t4)
	table.clear(t5)
	table.clear(t6)
	table.clear(t7)

	if u47 then
		u47:Destroy()
		u47 = nil
	end

	u48 = nil
	u49 = nil
	u50 = nil
	u51 = nil
	u52 = nil
	u53 = nil
	u54 = nil
	UIGridLayout = nil
	u56 = nil
	u57 = nil
	u58 = nil
	u59 = nil
	Backpack = nil
	u62 = nil
	n2 = 0
	u67 = nil
	u68 = false
	u69 = false
	u70 = false
	u71 = false
	u75 = false
	u44 = false
	n3 = 0
	u79 = nil
	t1.OpenClose = nil
	t1.IsOpen = false
	t1.IsHotbarVisible = false
end
function t1.TopbarEnabledChanged(_, p68) -- line: 2136
	-- upvalues: u43 (ref), setBackpackEnabled (copy), StarterGui (copy)
	u43 = p68
	setBackpackEnabled(StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack))
end

if FFlagTopBarSignalizeSetCores then
	t1.disposeEffect = Signals.createEffect(function(p69) -- line: 2142
		-- upvalues: InExperienceTopBar (copy), t1 (copy)
		local GetTopBarStore = InExperienceTopBar.Stores.GetTopBarStore

		if GetTopBarStore then
			t1:TopbarEnabledChanged(GetTopBarStore(p69).getTopBarCoreGuiEnabled(p69))
		end
	end)
end

local Features = System.Features
local lifecycle = Features.registerLifecycle(Features.FeatureName.Backpack, {
	defaultVisible = false,
	coreGuiType = Enum.CoreGuiType.Backpack
}).lifecycle

lifecycle:onEnabledChanged(function(p70) -- line: 2157
	-- upvalues: t1 (copy), setBackpackEnabled (copy)
	if p70 then
		t1.createGui()
	else
		t1.destroyGui()
	end

	setBackpackEnabled(p70)
end)
lifecycle:onVisibilityChanged(function(p71) -- line: 2167
	-- upvalues: t1 (copy)
	if t1.OpenClose and p71 ~= t1.IsOpen then
		t1.OpenClose()
	end

	return t1.IsOpen
end)
t1.StateChanged.Event:connect(function(p72) -- line: 2175
	-- upvalues: lifecycle (copy)
	if lifecycle then
		lifecycle.setVisible(p72)
	end
end)

return t1
