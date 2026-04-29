local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local ReactRoblox = require(FoundationParent.ReactRoblox)
local ElevationLayer = require(Foundation.Enums.ElevationLayer)
local PluginPopoverParentContext = require(Foundation.Providers.StudioPanels.PluginPopoverParentContext)
local PopoverAlign = require(Foundation.Enums.PopoverAlign)
local PopoverArrow = require(script.Parent.Parent.PopoverArrow)

require(script.Parent.Parent.Content)

local PopoverContext = require(script.Parent.Parent.PopoverContext)
local PopoverShadow = require(script.Parent.Parent.PopoverShadow)
local PopoverSide = require(Foundation.Enums.PopoverSide)
local getPanelPosition = require(script.Parent.getPanelPosition)
local usePanel = require(Foundation.Providers.StudioPanels.usePanel)
local usePanelsContext = require(Foundation.Providers.StudioPanels.usePanelsContext)
local useUniqueWidget = require(Foundation.Providers.StudioWidgets.useUniqueWidget)
local useStyleSheet = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local Constants = require(Foundation.Constants)
local Flags = require(Foundation.Utility.Flags)
local Logger = require(Foundation.Utility.Logger)
local Radius = require(Foundation.Enums.Radius)

require(Foundation.Utility.Plugin.StudioUri)

local View = require(Foundation.Components.View)
local elevation = require(Foundation.Providers.Elevation.elevation)
local useArrowPosition = require(script.Parent.useArrowPosition)
local useElevation = require(Foundation.Providers.Elevation.useElevation)
local usePanelSizing = require(script.Parent.usePanelSizing)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withDefaults = require(Foundation.Utility.withDefaults)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope

require(Foundation.Providers.StudioPanels.Types)

local SHADOW_SIZE = Constants.SHADOW_SIZE
local t1 = {
	side = PopoverSide.Bottom,
	align = PopoverAlign.Center,
	hasArrow = true,
	radius = Radius.Medium
}
local t2 = {
	[Radius.Small] = "radius-small",
	[Radius.Medium] = "radius-medium",
	[Radius.Circle] = "radius-circle"
}

return React.forwardRef(function(p1, p2) --[[ PopoverContentPlugin ]] -- line: 59
	-- upvalues: withDefaults (copy), t1 (copy), usePanelsContext (copy), React (copy), PluginPopoverParentContext (copy), PopoverContext (copy), useStyleSheet (copy), useTokens (copy), Flags (copy), useElevation (copy), ElevationLayer (copy), elevation (copy), PopoverSide (copy), PopoverAlign (copy), useUniqueWidget (copy), getPanelPosition (copy), SHADOW_SIZE (copy), Logger (copy), usePanel (copy), usePanelSizing (copy), useArrowPosition (copy), ReactRoblox (copy), View (copy), PopoverShadow (copy), PopoverArrow (copy), t2 (copy), ElevationOwnerScope (copy)
	local v34 = withDefaults(p1, t1)
	local v35 = usePanelsContext()
	local v36 = React.useContext(PluginPopoverParentContext)
	local v37 = React.useContext(PopoverContext)
	local v38 = useStyleSheet()
	local v39 = useTokens()
	local v40 = nil
	local v41 = nil

	if Flags.FoundationPopoverPluginDepthPool then
		v41 = useElevation(ElevationLayer.Popover, {
			stackAboveOwner = true
		})
		v40 = elevation.getRelativeIndex(v41)
	end

	local v42, v43 = React.useState(nil)

	React.useImperativeHandle(p2, function() -- line: 78
		-- upvalues: v42 (copy)
		return v42
	end, { v42 })

	local Size_200 = v39.Size.Size_200
	local v45 = Size_200 * 1.4142135623730951 / 2
	local v46 = v34.backgroundStyle or v39.Color.Surface.Surface_100
	local v47 = if type(v34.side) ~= "table" then v34.side or PopoverSide.Bottom else v34.side.position
	local v48 = if type(v34.align) ~= "table" then v34.align or PopoverAlign.Center else v34.align.position
	local n1 = 0

	if v48 == PopoverAlign.Center then
		n1 = 0.5
	elseif v48 == PopoverAlign.End then
		n1 = 1
	end

	local v50 = React.useRef(v37.anchor)

	v50.current = v37.anchor

	local v51 = useUniqueWidget({
		forwardRef = v50
	})
	local v52 = React.useMemo(function() -- line: 108
		-- upvalues: getPanelPosition (copy), v34 (copy), PopoverSide (copy), PopoverAlign (copy), SHADOW_SIZE (copy), v45 (copy)
		return getPanelPosition(v34.side or PopoverSide.Bottom, v34.align or PopoverAlign.Start, nil, SHADOW_SIZE, not v34.hasArrow and 0 or v45)
	end, {
		v34.side,
		v34.align,
		v34.hasArrow,
		v45
	})
	local v53 = React.useCallback(function(p3, p4, p5: ((...any) -> ...any), n2: number?) -- line: 119
		-- upvalues: Flags (copy), v36 (copy), v35 (copy)
		local v65 = if not Flags.FoundationPopoverPluginDepthPool then nil else v36

		return v35.registerPopoverAsync(p3, p4, p5, n2, v65)
	end, {
		v35.registerPopoverAsync,
		v36
	})
	local v54 = React.useRef(false)

	React.useEffect(function() -- line: 127
		-- upvalues: v34 (copy), v54 (copy), Logger (copy)
		if not v34.onPressedOutside and not v54.current then
			v54.current = true
			Logger:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { v34.onPressedOutside })

	local v55 = React.useCallback(function() -- line: 138
		-- upvalues: v34 (copy)
		if v34.onPressedOutside then
			v34.onPressedOutside()
		end
	end, { v34.onPressedOutside })
	local v56 = if not Flags.FoundationPopoverPluginDepthPool then v40 else v40 == nil and 0 or v40
	local v57 = usePanel({
		isOpen = v37.isOpen,
		onClose = v55,
		anchorUri = v51.uri,
		registerPanelAsync = v53,
		position = v52,
		depth = v56,
		parentPopoverId = if not Flags.FoundationPopoverPluginDepthPool then nil else v36
	})
	local v58, v59 = usePanelSizing(v34.side, v34.align, v42, not v34.hasArrow and 0 or v45, v57)
	local v60 = useArrowPosition(v59, v47, v34.radius, n1, v45, v37.anchor)

	if not v57 then
		return nil
	end

	return ReactRoblox.createPortal(React.createElement(React.Fragment, nil, {
		StyleLink = React.createElement("StyleLink", {
			StyleSheet = v38
		}),
		Container = React.createElement(View, {
			Size = v58,
			testId = `{ v37.testId }--container`
		}, {
			Shadow = React.createElement(PopoverShadow, {
				contentSize = v59,
				position = UDim2.fromOffset(SHADOW_SIZE / 2, SHADOW_SIZE / 2 + 2),
				ZIndex = 1,
				testId = `{ v37.testId }--shadow`
			}),
			Arrow = if not v34.hasArrow then nil else React.createElement(PopoverArrow, {
				size = Size_200,
				position = v60,
				ZIndex = 2,
				backgroundStyle = v46,
				testId = `{ v37.testId }--arrow`
			}),
			Content = React.createElement(View, {
				tag = `auto-xy { t2[v34.radius] }`,
				Position = UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE),
				ref = v43,
				backgroundStyle = v46,
				ZIndex = 3,
				testId = `{ v37.testId }--content`
			}, if not Flags.FoundationPopoverPluginDepthPool then v34.children else React.createElement(PluginPopoverParentContext.Provider, {
				value = v57.popoverId
			}, {
				Nested = React.createElement(ElevationOwnerScope, {
					owner = v41
				}, v34.children)
			}))
		})
	}), v57.container)
end)
