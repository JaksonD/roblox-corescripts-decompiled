local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local ReactRoblox = require(FoundationParent.ReactRoblox)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContext = require(Sheet.SheetContext)
local SheetType = require(Sheet.SheetType)
local useTokens = require(Foundation.Providers.Style.useTokens)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)
local View = require(Foundation.Components.View)

return React.memo(React.forwardRef(function(t1: {[any]: any}, p1) --[[ SheetActions ]] -- line: 19
	-- upvalues: useTokens (copy), React (copy), SheetContext (copy), SheetType (copy), View (copy), StateLayerAffordance (copy), ReactRoblox (copy)
	local v13 = useTokens()
	local v14 = React.useContext(SheetContext)
	local sheetHeightAvailable = v14.sheetHeightAvailable
	local actionsHeight = v14.actionsHeight
	local setActionsHeight = v14.setActionsHeight
	local hasActionsDivider = v14.hasActionsDivider
	local safeAreaPadding = v14.safeAreaPadding
	local bottomPadding = v14.bottomPadding
	local sheetType = v14.sheetType
	local testId = v14.testId

	assert(sheetHeightAvailable and (actionsHeight and (setActionsHeight and (hasActionsDivider and (safeAreaPadding and (bottomPadding and testId))))), "SheetActions must be used within a Sheet")

	local innerSurface = v14.innerSurface
	local v24 = sheetType == SheetType.Bottom
	local v25 = React.createElement(View, {
		tag = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = v24
		},
		padding = {
			top = UDim.new(0, v13.Margin.Small),
			left = UDim.new(0, v13.Margin.Small),
			right = UDim.new(0, v13.Margin.Small),
			bottom = UDim.new(0, bottomPadding + v13.Margin.Small)
		},
		stroke = {
			Color = v13.Color.Stroke.Default.Color3,
			Transparency = v13.Color.Stroke.Default.Transparency,
			Thickness = hasActionsDivider:map(function(b1: boolean) -- line: 60
				-- upvalues: v13 (copy)
				if b1 then
					return v13.Stroke.Standard
				end

				return 0
			end)
		},
		onAbsoluteSizeChanged = if not v24 then nil else function(p2) -- line: 69
			-- upvalues: setActionsHeight (copy), bottomPadding (copy)
			setActionsHeight(p2.AbsoluteSize.Y - bottomPadding)
		end,
		ZIndex = 1,
		testId = `{ testId }--actions`,
		Position = if not v24 then nil else React.joinBindings({
			sheetHeightAvailable = sheetHeightAvailable,
			actionsHeight = actionsHeight
		}):map(function(t2: {[any]: any}) -- line: 79
			return UDim2.new(0, 0, 1, -math.min(t2.sheetHeightAvailable, t2.actionsHeight))
		end),
		LayoutOrder = 3,
		ref = p1,
		onActivated = function() --[[ onActivated ]] -- line: 89
		end,
		selection = {
			Selectable = false
		},
		stateLayer = {
			affordance = StateLayerAffordance.None
		}
	}, t1.children)

	if v24 then
		return innerSurface and ReactRoblox.createPortal(v25, innerSurface)
	end

	return v25
end))
