local Foundation = script:FindFirstAncestor("Foundation")

require(Foundation.Components.Types)

local InputSize = require(Foundation.Enums.InputSize)
local IconSize = require(Foundation.Enums.IconSize)
local Flags = require(Foundation.Utility.Flags)
local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)

require(Foundation.Providers.Style.Tokens)

local VariantsContext = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) -- line: 29
	-- upvalues: Flags (copy), InputSize (copy), IconSize (copy)
	local t1 = {
		container = {
			tag = "row align-y-center auto-xy bg-surface-300"
		},
		segment = {
			tag = "row align-y-center size-0-full auto-xy"
		},
		text = {
			tag = "auto-x text-truncate-end content-emphasis"
		},
		icon = if not Flags.FoundationSegmentedControlIconSupport then nil else {
			style = p1.Color.Content.Emphasis
		},
		divider = {
			tag = "row"
		}
	}
	local t2 = {
		[InputSize.XSmall] = {
			container = {
				tag = "size-600 padding-xsmall radius-small"
			},
			segment = {
				tag = "padding-small radius-small"
			},
			text = {
				tag = "text-caption-small"
			},
			icon = if not Flags.FoundationSegmentedControlIconSupport then nil else {
				size = IconSize.Small
			},
			divider = {
				Size = UDim2.new(0, p1.Stroke.Standard, 1, 0)
			}
		},
		[InputSize.Small] = {
			container = {
				tag = "size-800 padding-xsmall radius-medium"
			},
			segment = {
				tag = "padding-small radius-small"
			},
			text = {
				tag = "text-caption-small"
			},
			icon = if not Flags.FoundationSegmentedControlIconSupport then nil else {
				size = IconSize.Medium
			},
			divider = {
				Size = UDim2.new(0, p1.Stroke.Standard, 1, 0)
			}
		},
		[InputSize.Medium] = {
			container = {
				tag = "size-1000 padding-xsmall radius-medium"
			},
			segment = {
				tag = "padding-small radius-small"
			},
			text = {
				tag = "text-caption-medium"
			},
			icon = if not Flags.FoundationSegmentedControlIconSupport then nil else {
				size = IconSize.Medium
			},
			divider = {
				Size = UDim2.new(0, p1.Stroke.Standard, 1, 0)
			}
		},
		[InputSize.Large] = {
			container = {
				tag = "size-1200 padding-xsmall radius-medium"
			},
			segment = {
				tag = "padding-medium radius-small"
			},
			text = {
				tag = "text-caption-medium"
			},
			icon = if not Flags.FoundationSegmentedControlIconSupport then nil else {
				size = IconSize.Large
			},
			divider = {
				Size = UDim2.new(0, p1.Stroke.Standard, 1, 0)
			}
		}
	}

	return {
		common = t1,
		sizes = t2
	}
end

return function(p2, p3) -- line: 74
	-- upvalues: VariantsContext (copy), variantsFactory (copy), composeStyleVariant (copy)
	local v13 = VariantsContext.useVariants("SegmentedControl", variantsFactory, p2)

	return composeStyleVariant(v13.common, v13.sizes[p3])
end
