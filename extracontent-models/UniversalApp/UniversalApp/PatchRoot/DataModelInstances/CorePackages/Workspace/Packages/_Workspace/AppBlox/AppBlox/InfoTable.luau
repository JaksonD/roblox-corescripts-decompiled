local Parent = script:FindFirstAncestor("AppBlox").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local useBreakpoint = require(Parent.Foundation).Hooks.useBreakpoint
local useResponsive = require(Parent.Foundation).Hooks.useResponsive
local ResponsiveProvider = require(Parent.Foundation).ResponsiveProvider
local Cryo = require(Parent.Cryo)
local v8 = game:DefineFastFlag("LuaAppInfoTableResponsiveProviderOverride", false)
local v9 = game:DefineFastFlag("LuaAppInfoTableWorkaroundGridJank2", false) and v8
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local Breakpoint = Foundation.Enums.Breakpoint

local function buildColumnMajorChildren(t1: {[any]: any}, n1: number, n2: number) -- line: 27
	-- upvalues: React (copy), Foundation (copy)
	local v16 = #t1
	local v17 = math.ceil(v16 / n1)
	local t2 = {}
	local n3 = 0

	for i = 1, v17 do
		for j = 1, n1 do
			n3 += 1

			local v22 = (j - 1) * v17 + i
			local v23 = if not (v22 <= v16) then React.createElement(Foundation.View, {
				tag = "size-full-0 auto-y",
				BackgroundTransparency = 1
			}) else t1[v22]

			t2[`Cell_{ n3 }`] = React.createElement(Foundation.Grid.Cell, {
				size = n2,
				tag = "size-full-0 auto-y",
				LayoutOrder = n3
			}, v23)
		end
	end

	return t2
end

return React.memo(function(t3: {[any]: any}) --[[ InfoTable ]] -- line: 75
	-- upvalues: v9 (copy), React (copy), FFlagSduiExperienceDetailsSupport (copy), buildColumnMajorChildren (copy), Foundation (copy), v8 (copy), useResponsive (copy), Cryo (copy), Breakpoint (copy), useBreakpoint (copy), ResponsiveProvider (copy)
	local v25 = (not t3.numColumns or not (t3.numColumns > 0)) and 1 or t3.numColumns
	local v26 = nil
	local u27 = nil
	local v28 = nil
	local v29 = nil

	if v9 then
		local v30

		v26, v30 = React.useState(false)
		u27 = v30
		v28, v29 = React.useState(nil)
	end

	local t4 = {}
	local v32 = 12 / v25

	if not v9 or v26 then
		if FFlagSduiExperienceDetailsSupport and v25 > 1 then
			t4 = buildColumnMajorChildren(t3.items, v25, v32)
		else
			for v33, v34 in t3.items do
				t4[`Cell_{ v33 }`] = React.createElement(Foundation.Grid.Cell, {
					size = v32,
					tag = "size-full-0 auto-y",
					LayoutOrder = v33
				}, v34)
			end
		end
	end

	local v35 = nil

	if v8 then
		local v36 = useResponsive()

		v35 = Cryo.Dictionary.join(v36.config, {
			grid = Cryo.Dictionary.join(v36.config.grid, {
				margins = {
					[Breakpoint.XSmall] = 0,
					[Breakpoint.Small] = 0,
					[Breakpoint.Medium] = 0,
					[Breakpoint.Large] = 0,
					[Breakpoint.XLarge] = 0,
					[Breakpoint.XXLarge] = 0
				}
			})
		})
	end

	if v9 then
		local _, v38 = useBreakpoint(v28)

		React.useEffect(function() -- line: 120
			-- upvalues: v38 (copy), u27 (ref)
			if v38.X > 0 then
				task.defer(function() -- line: 122
					-- upvalues: u27 (ref)
					u27(true)
				end)
			end
		end, { v38.X })

		return React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = t3.LayoutOrder,
			ref = v29
		}, {
			ContentFrame = React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = t3.LayoutOrder
			}, {
				Grid = React.createElement(ResponsiveProvider, {
					config = v35
				}, React.createElement(Foundation.Grid.Root, {
					tag = t3.gridTag,
					testId = t3.testId
				}, t4))
			})
		})
	end

	if v8 then
		return React.createElement(ResponsiveProvider, {
			config = v35
		}, React.createElement(Foundation.Grid.Root, {
			tag = t3.gridTag,
			LayoutOrder = t3.LayoutOrder,
			testId = t3.testId
		}, t4))
	end

	return React.createElement(Foundation.Grid.Root, {
		tag = t3.gridTag,
		LayoutOrder = t3.LayoutOrder,
		testId = t3.testId
	}, t4)
end)
