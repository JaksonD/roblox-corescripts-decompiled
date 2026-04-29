local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local BuilderIcons = require(FoundationParent.BuilderIcons)
local Dash = require(FoundationParent.Dash)

require(Foundation.Components.Types)

local InputSize = require(Foundation.Enums.InputSize)
local InputVariant = require(Foundation.Enums.InputVariant)
local IconSize = require(Foundation.Enums.IconSize)
local Radius = require(Foundation.Enums.Radius)
local Flags = require(Foundation.Utility.Flags)
local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)
local getInputVariantsFactory = require(Foundation.Components.InputField.getInputVariantsFactory)

require(Foundation.Providers.Style.Tokens)

local VariantsContext = require(Foundation.Providers.Style.VariantsContext)

local function computeProps(t1: {[any]: any}) -- line: 83
	-- upvalues: Flags (copy)
	return {
		canvas = if not Flags.FoundationCleanupTextInputPolyfill then {
			tag = t1.canvasTag
		} else nil,
		outerContainer = if not Flags.FoundationInputVariantsConsolidateContainer then {
			tag = if not Flags.FoundationCleanupTextInputPolyfill then t1.outerContainerTag else nil,
			minHeight = t1.minContainerHeight
		} else nil,
		innerContainer = if not Flags.FoundationInputVariantsConsolidateContainer then {
			tag = if not Flags.FoundationCleanupTextInputPolyfill then t1.innerContainerTag else nil,
			horizontalPadding = UDim.new(0, t1.horizontalPadding),
			gap = if not Flags.FoundationCleanupTextInputPolyfill then t1.gap else nil,
			radius = t1.radius
		} else nil,
		outerView = if not Flags.FoundationInputVariantsConsolidateContainer then {
			tag = t1.outerViewTag
		} else nil,
		container = if not Flags.FoundationInputVariantsConsolidateContainer then nil else {
			minHeight = t1.minContainerHeight,
			horizontalPadding = UDim.new(0, t1.horizontalPadding),
			radius = t1.radius,
			tag = t1.containerTag
		},
		textBox = {
			tag = if not Flags.FoundationCleanupTextInputPolyfill then t1.textBoxTag else nil,
			fontStyle = t1.typography
		},
		icon = {
			size = t1.iconSize
		},
		clearButton = if not Flags.FoundationInternalTextInputClearButton then nil else {
			icon = t1.clearButtonIcon,
			padding = t1.clearButtonPadding
		}
	}
end
local function variantsFactory(p1) -- line: 157
	-- upvalues: Flags (copy), InputSize (copy), computeProps (copy), IconSize (copy), BuilderIcons (copy), InputVariant (copy), Dash (copy), Radius (copy)
	local t2 = {
		outerContainer = if not Flags.FoundationCleanupTextInputPolyfill then {
			tag = "bg-shift-100"
		} else nil,
		innerContainer = if not Flags.FoundationCleanupTextInputPolyfill then {
			tag = "row align-y-center"
		} else nil,
		[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
			bgStyle = p1.Color.Shift.Shift_100,
			strokeStyle = p1.Color.Stroke.Emphasis,
			strokeThickness = p1.Stroke.Standard,
			tag = {
				["row align-y-center"] = not Flags.FoundationInternalTextInputClearButton,
				row = Flags.FoundationInternalTextInputClearButton
			}
		},
		textBox = {
			tag = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
		},
		icon = {
			style = p1.Color.Content.Muted
		},
		clearButton = if not Flags.FoundationInternalTextInputClearButton then nil else {
			tag = "auto-xy"
		}
	}
	local v18 = if not Flags.FoundationCleanupTextInputPolyfill then {
		canvas = {
			tag = "size-full-0"
		},
		outerContainer = {
			tag = "size-full-0"
		}
	} else nil
	local t3 = {
		[InputSize.XSmall] = computeProps({
			canvasTag = not Flags.FoundationCleanupTextInputPolyfill and "size-full-600" or nil,
			outerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "radius-small" or nil,
			radius = p1.Radius.Small,
			innerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "gap-small" or nil,
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerViewTag" or "containerTag"] = "size-full-600 gap-small",
			horizontalPadding = p1.Padding.XSmall,
			gap = if not Flags.FoundationCleanupTextInputPolyfill then p1.Gap.Small else nil,
			textBoxTag = not Flags.FoundationCleanupTextInputPolyfill and "text-body-small" or nil,
			typography = p1.Typography.BodySmall,
			iconSize = IconSize.XSmall,
			minContainerHeight = p1.Size.Size_600,
			clearButtonIcon = if not Flags.FoundationInternalTextInputClearButton then nil else BuilderIcons.Icon.XSmall,
			clearButtonPadding = if not Flags.FoundationInternalTextInputClearButton then nil else p1.Padding.XSmall
		}),
		[InputSize.Small] = computeProps({
			canvasTag = not Flags.FoundationCleanupTextInputPolyfill and "size-full-800" or nil,
			outerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "radius-medium" or nil,
			radius = p1.Radius.Medium,
			innerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "gap-medium" or nil,
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerViewTag" or "containerTag"] = "size-full-800 gap-medium",
			horizontalPadding = p1.Padding.Small,
			gap = if not Flags.FoundationCleanupTextInputPolyfill then p1.Gap.Medium else nil,
			textBoxTag = not Flags.FoundationCleanupTextInputPolyfill and "text-body-medium" or nil,
			typography = p1.Typography.BodyMedium,
			iconSize = IconSize.XSmall,
			minContainerHeight = p1.Size.Size_800,
			clearButtonIcon = if not Flags.FoundationInternalTextInputClearButton then nil else BuilderIcons.Icon.XSmall,
			clearButtonPadding = if not Flags.FoundationInternalTextInputClearButton then nil else p1.Size.Size_150
		}),
		[InputSize.Medium] = computeProps({
			canvasTag = not Flags.FoundationCleanupTextInputPolyfill and "size-full-1000" or nil,
			outerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "radius-medium" or nil,
			radius = p1.Radius.Medium,
			innerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "gap-large" or nil,
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerViewTag" or "containerTag"] = "size-full-1000 gap-large",
			horizontalPadding = p1.Padding.Small,
			gap = if not Flags.FoundationCleanupTextInputPolyfill then p1.Gap.Large else nil,
			textBoxTag = not Flags.FoundationCleanupTextInputPolyfill and "text-body-medium" or nil,
			typography = p1.Typography.BodyMedium,
			iconSize = IconSize.Small,
			minContainerHeight = p1.Size.Size_1000,
			clearButtonIcon = if not Flags.FoundationInternalTextInputClearButton then nil else BuilderIcons.Icon.X,
			clearButtonPadding = if not Flags.FoundationInternalTextInputClearButton then nil else p1.Padding.Small
		}),
		[InputSize.Large] = computeProps({
			canvasTag = not Flags.FoundationCleanupTextInputPolyfill and "size-full-1200" or nil,
			outerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "radius-medium" or nil,
			radius = p1.Radius.Medium,
			innerContainerTag = not Flags.FoundationCleanupTextInputPolyfill and "gap-large" or nil,
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerViewTag" or "containerTag"] = "size-full-1200 gap-large",
			horizontalPadding = p1.Padding.Medium,
			gap = if not Flags.FoundationCleanupTextInputPolyfill then p1.Gap.Large else nil,
			textBoxTag = not Flags.FoundationCleanupTextInputPolyfill and "text-body-large" or nil,
			typography = p1.Typography.BodyLarge,
			iconSize = IconSize.Small,
			minContainerHeight = p1.Size.Size_1200,
			clearButtonIcon = if not Flags.FoundationInternalTextInputClearButton then nil else BuilderIcons.Icon.X,
			clearButtonPadding = if not Flags.FoundationInternalTextInputClearButton then nil else p1.Padding.Small
		})
	}
	local v20 = if not Flags.FoundationSharedInputVariants then {
		[InputVariant.Standard] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				bgStyle = p1.Color.Shift.Shift_100
			}
		},
		[InputVariant.Contrast] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				bgStyle = p1.Color.Shift.Shift_200,
				strokeStyle = Dash.None
			}
		},
		[InputVariant.Utility] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				bgStyle = Dash.None,
				strokeStyle = Dash.None
			}
		}
	} else nil
	local v21 = if not Flags.FoundationSharedInputVariants then {
		[true] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				strokeStyle = p1.Color.System.Alert
			}
		},
		[false] = {}
	} else nil
	local v22 = if not Flags.FoundationSharedInputVariants then {
		[true] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				strokeStyle = p1.Color.System.Emphasis,
				strokeThickness = p1.Stroke.Standard * 2
			}
		},
		[false] = {}
	} else nil
	local v23 = if not Flags.FoundationSharedInputVariants then {
		[true] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				strokeThickness = p1.Stroke.Standard * 2
			}
		},
		[false] = {}
	} else nil
	local v24 = if not Flags.FoundationSharedInputVariants then {
		[InputSize.XSmall] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-small"] = true
				}
			}
		},
		[InputSize.Small] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-medium"] = true
				}
			}
		},
		[InputSize.Medium] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-medium"] = true
				}
			}
		},
		[InputSize.Large] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-medium"] = true
				}
			}
		}
	} else nil
	local v25 = if not Flags.FoundationSharedInputVariants then {
		[Radius.None] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-none"] = true
				}
			}
		},
		[Radius.XSmall] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-xsmall"] = true
				}
			}
		},
		[Radius.Small] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-small"] = true
				}
			}
		},
		[Radius.Medium] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-medium"] = true
				}
			}
		},
		[Radius.Large] = {
			[not Flags.FoundationInputVariantsConsolidateContainer and "outerView" or "container"] = {
				tag = {
					["radius-large"] = true
				}
			}
		}
	} else nil

	return {
		common = t2,
		sizes = t3,
		variants = if not Flags.FoundationSharedInputVariants then v20 else nil,
		multiline = if not Flags.FoundationCleanupTextInputPolyfill then v18 else nil,
		defaultRadius = if not Flags.FoundationSharedInputVariants then v24 else nil,
		radius = if not Flags.FoundationSharedInputVariants then v25 else nil,
		errorState = if not Flags.FoundationSharedInputVariants then v21 else nil,
		focusedState = if not Flags.FoundationSharedInputVariants then v22 else nil,
		hoverState = if not Flags.FoundationSharedInputVariants then v23 else nil
	}
end

return function(p2, p3, p4, p5, b1: boolean?, b2: boolean?, b3: boolean?) -- line: 403
	-- upvalues: VariantsContext (copy), variantsFactory (copy), Flags (copy), getInputVariantsFactory (copy), InputVariant (copy), composeStyleVariant (copy)
	local v33 = VariantsContext.useVariants("TextInput", variantsFactory, p2)
	local v34 = if not Flags.FoundationSharedInputVariants then v33 else VariantsContext.useVariants("InputField", getInputVariantsFactory, p2)
	local v35 = v34.variants[p4 or InputVariant.Standard]

	return composeStyleVariant(v33.common, if not Flags.FoundationSharedInputVariants then nil else v34.sizes[p3], v33.sizes[p3], if p4 == InputVariant.Utility then {} else v35, if not Flags.FoundationCleanupTextInputPolyfill then v33.multiline else nil, if not p5 then v34.defaultRadius[p3] else v34.radius[p5], if b2 == nil then {} else v34.hoverState[b2], if b1 == nil then {} else v34.focusedState[b1], if b3 == nil then {} else v34.errorState[b3], if p4 ~= InputVariant.Utility then {} else v35)
end
