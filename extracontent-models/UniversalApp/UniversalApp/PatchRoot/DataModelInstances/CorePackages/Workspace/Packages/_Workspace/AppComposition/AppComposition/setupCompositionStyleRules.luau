local AppComposition = script:FindFirstAncestor("AppComposition")
local AppCompositionParent = AppComposition.Parent

require(AppCompositionParent.Foundation)

local Signals = require(AppCompositionParent.Signals)
local CompositionConfig = require(AppComposition.CompositionConfig)
local CompositionTags = require(AppComposition.CompositionTags)
local getGlobalViewportBreakpoint = require(AppComposition.getGlobalViewportBreakpoint)
local v7 = game:DefineFastFlag("LuaAppCompositionFixDetailClip", false)
local Header = CompositionTags.ContentRegion.Header
local Body = CompositionTags.ContentRegion.Body
local Detail = CompositionTags.Layout.Detail
local ClipAtMaxWidth = CompositionTags.Utility.ClipAtMaxWidth
local t1 = {
	[`.{ Header }`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{ Header }::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{ Header }::UISizeConstraint`] = {
		MaxSize = "$CompositionMaxWidthDiscovery"
	},
	[`.{ Body }`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{ Body }::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{ Body }::UISizeConstraint`] = {
		MaxSize = "$CompositionMaxWidthDiscovery"
	},
	[`.{ Detail } >> .{ Header }::UISizeConstraint`] = {
		MaxSize = "$CompositionMaxWidthDetail"
	},
	[`.{ Detail } >> .{ Body }::UISizeConstraint`] = {
		MaxSize = "$CompositionMaxWidthDetail"
	},
	[`.{ Body }::StyleQuery #CompositionAtMaxWidthDiscovery`] = {
		MinSize = "$CompositionClipThresholdDiscovery"
	},
	[`.{ Body }::StyleQuery #CompositionNotAtMaxWidthDiscovery`] = {
		MaxSize = "$CompositionMaxWidthDiscovery"
	},
	[`@CompositionAtMaxWidthDiscovery >> .{ ClipAtMaxWidth }`] = {
		ClipsDescendants = true
	},
	[`@CompositionNotAtMaxWidthDiscovery >> .{ ClipAtMaxWidth }`] = if v7 then nil else {
		ClipsDescendants = false
	},
	[`.{ Detail } >> .{ Body }::StyleQuery #CompositionAtMaxWidthDetail`] = {
		MinSize = "$CompositionClipThresholdDetail"
	},
	[`.{ Detail } >> .{ Body }::StyleQuery #CompositionNotAtMaxWidthDetail`] = {
		MaxSize = "$CompositionMaxWidthDetail"
	},
	[`@CompositionAtMaxWidthDetail >> .{ ClipAtMaxWidth }`] = {
		ClipsDescendants = true
	},
	[`@CompositionNotAtMaxWidthDetail >> .{ ClipAtMaxWidth }`] = if v7 then nil else {
		ClipsDescendants = false
	}
}

local function applyRules(p1, t2: {[any]: any}) -- line: 107
	-- upvalues: t1 (copy)
	for v17, v18 in t1 do
		local StyleRule = Instance.new("StyleRule")

		StyleRule.Selector = v17
		StyleRule.Name = v17
		StyleRule:SetProperties(v18)
		StyleRule.Parent = p1
		table.insert(t2, StyleRule)
	end
end
local function setupReactiveAttributes(p2, p3) -- line: 121
	-- upvalues: Signals (copy), getGlobalViewportBreakpoint (copy), CompositionConfig (copy)
	local v22 = Signals.createComputed(function(p4) -- line: 122
		-- upvalues: getGlobalViewportBreakpoint (copy), CompositionConfig (copy), p3 (copy)
		local v28 = getGlobalViewportBreakpoint(p4)

		return CompositionConfig.getBaseConfig(v28, p3).margin
	end)

	return Signals.createEffect(function(p5) -- line: 127
		-- upvalues: v22 (copy), p2 (copy)
		local v30 = v22(p5)
		local v31 = v30 * 2

		p2:SetAttribute("CompositionMargin", UDim.new(0, v30))
		p2:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new(1920 + v31, 1e999))
		p2:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new(1920 + v31, 0))
		p2:SetAttribute("CompositionMaxWidthDetail", Vector2.new(848 + v31, 1e999))
		p2:SetAttribute("CompositionClipThresholdDetail", Vector2.new(848 + v31, 0))
	end)
end

return function(p6, p7) --[[ setupCompositionStyleRules ]] -- line: 141
	-- upvalues: applyRules (copy), setupReactiveAttributes (copy)
	local t3 = {}

	applyRules(p6, t3)

	local v26 = setupReactiveAttributes(p6, p7)

	return function() -- line: 148
		-- upvalues: v26 (copy), t3 (copy)
		v26()

		for _, v33 in t3 do
			v33:Destroy()
		end
	end
end
