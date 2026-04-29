local Foundation = script:FindFirstAncestor("Foundation")
local NumberInputControlsVariant = require(Foundation.Enums.NumberInputControlsVariant)
local InputSize = require(Foundation.Enums.InputSize)

require(Foundation.Enums.InputVariant)

local Flags = require(Foundation.Utility.Flags)
local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)

require(Foundation.Providers.Style.Tokens)

local VariantsContext = require(Foundation.Providers.Style.VariantsContext)

local function computeProps(t1: {[any]: any}) -- line: 23
	local v10 = if not t1.width or not t1.horizontalPadding then nil else UDim.new(0, (t1.buttonWidth - t1.horizontalPadding) / 2)

	return {
		container = {
			width = t1.width
		},
		button = {
			tag = "fill size-full",
			width = t1.buttonWidth,
			padding = if not v10 then nil else {
				left = v10,
				right = v10
			}
		},
		upButton = {
			tag = t1.upButtonTag
		},
		downButton = {
			tag = t1.downButtonTag
		},
		splitButton = {
			size = t1.splitButtonSize,
			tag = t1.splitButtonTag
		},
		icon = {
			tag = t1.iconTag
		}
	}
end
local function variantsFactory(p1) -- line: 66
	-- upvalues: Flags (copy), InputSize (copy), computeProps (copy), NumberInputControlsVariant (copy)
	local t2 = {
		upButton = {
			tag = "fill size-full padding-bottom-xsmall"
		},
		downButton = {
			tag = "fill size-full padding-top-xsmall"
		},
		splitButton = if not Flags.FoundationNumberInputVariant then {
			tag = "bg-shift-100"
		} else nil,
		icon = {
			tag = "content-default"
		}
	}
	local t3 = {
		[InputSize.XSmall] = computeProps({
			width = p1.Size.Size_3000 * 1.1666666666666667,
			buttonWidth = p1.Size.Size_400,
			horizontalPadding = p1.Size.Size_150,
			upButtonTag = "padding-top-xxsmall",
			downButtonTag = "padding-bottom-xxsmall",
			splitButtonTag = "radius-small",
			splitButtonSize = p1.Size.Size_600
		}),
		[InputSize.Small] = computeProps({
			width = p1.Size.Size_3000 * 1.3333333333333333,
			buttonWidth = p1.Size.Size_600,
			horizontalPadding = p1.Size.Size_150,
			upButtonTag = "padding-top-xsmall",
			downButtonTag = "padding-bottom-xsmall",
			splitButtonTag = "radius-medium",
			splitButtonSize = p1.Size.Size_800
		}),
		[InputSize.Medium] = computeProps({
			width = p1.Size.Size_3000 * 1.5,
			buttonWidth = p1.Size.Size_600,
			horizontalPadding = p1.Size.Size_150,
			upButtonTag = "padding-top-small",
			downButtonTag = "padding-bottom-small",
			splitButtonTag = "radius-medium",
			splitButtonSize = p1.Size.Size_1000
		}),
		[InputSize.Large] = computeProps({
			width = p1.Size.Size_3000 * 1.6666666666666667,
			buttonWidth = p1.Size.Size_800,
			horizontalPadding = p1.Size.Size_150,
			upButtonTag = "padding-top-medium",
			downButtonTag = "padding-bottom-medium",
			splitButtonTag = "radius-medium",
			splitButtonSize = p1.Size.Size_1200
		})
	}
	local t4 = {
		[NumberInputControlsVariant.Stacked] = computeProps({
			iconTag = "size-150-100"
		})
	}

	return {
		common = t2,
		sizes = t3,
		controlVariants = t4
	}
end

return function(p2, p3, p4) -- line: 132
	-- upvalues: VariantsContext (copy), variantsFactory (copy), composeStyleVariant (copy)
	local v18 = VariantsContext.useVariants("NumberInput", variantsFactory, p2)

	return composeStyleVariant(v18.common, v18.sizes[p3], v18.controlVariants[p4])
end
