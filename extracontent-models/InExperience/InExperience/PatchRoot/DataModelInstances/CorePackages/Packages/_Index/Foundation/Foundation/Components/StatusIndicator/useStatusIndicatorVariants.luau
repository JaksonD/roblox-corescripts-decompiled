local Foundation = script:FindFirstAncestor("Foundation")
local Flags = require(Foundation.Utility.Flags)
local StatusIndicatorVariant = require(Foundation.Enums.StatusIndicatorVariant)

require(Foundation.Components.Types)

local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)

require(Foundation.Providers.Style.Tokens)

local VariantsContext = require(Foundation.Providers.Style.VariantsContext)

function variantsFactory(p1) -- line: 24
	-- upvalues: StatusIndicatorVariant (copy), Flags (copy)
	local t1 = {
		container = {
			tag = "radius-circle"
		},
		content = {
			tag = "auto-xy text-caption-small text-align-x-left"
		}
	}
	local t2 = {
		[StatusIndicatorVariant.Alert] = {
			container = {
				tag = "bg-system-alert"
			},
			content = {
				style = p1.DarkMode.Content.Emphasis
			}
		},
		[StatusIndicatorVariant.Success] = {
			container = {
				tag = "bg-system-success"
			},
			content = {
				style = p1.LightMode.Content.Emphasis
			}
		},
		[StatusIndicatorVariant.Warning] = {
			container = {
				tag = "bg-system-warning"
			},
			content = {
				style = p1.LightMode.Content.Emphasis
			}
		},
		[StatusIndicatorVariant.Emphasis] = if not Flags.FoundationActionEmphasisStatusIndicator then {
			container = {
				tag = "bg-system-emphasis"
			},
			content = {
				style = p1.DarkMode.Content.Emphasis
			}
		} else {
			container = {
				tag = "bg-action-emphasis"
			},
			content = {
				style = p1.Color.ActionEmphasis.Foreground
			}
		},
		[StatusIndicatorVariant.Neutral] = {
			container = {
				tag = "bg-system-neutral"
			},
			content = {
				style = p1.Inverse.Content.Emphasis
			}
		},
		[StatusIndicatorVariant.Standard] = {
			container = {
				tag = "bg-action-standard"
			},
			content = {
				style = p1.Color.Content.Emphasis
			}
		},
		[StatusIndicatorVariant.Contrast_Experiment] = {
			container = {
				tag = "bg-system-contrast"
			},
			content = {
				style = p1.Inverse.Content.Emphasis
			}
		}
	}
	local t3 = {
		[false] = {
			container = {
				tag = "size-200-200"
			}
		},
		[true] = {
			container = {
				tag = "row align-x-center align-y-center size-400-400 auto-x padding-xsmall"
			}
		}
	}

	return {
		common = t1,
		variants = t2,
		hasValue = t3
	}
end

return function(p2, p3, b1: boolean) -- line: 110
	-- upvalues: Flags (copy), StatusIndicatorVariant (copy), VariantsContext (copy), composeStyleVariant (copy)
	if not Flags.FoundationStatusIndicatorVariantExperiment then
		if p3 == StatusIndicatorVariant.Contrast_Experiment then
			error("Contrast is not a supported StatusIndicator variant.")
		end

		if p3 == StatusIndicatorVariant.Alert and b1 then
			error("Alert is not a supported numeric StatusIndicator variant.")
		end
	end

	local v13 = VariantsContext.useVariants("StatusIndicator", variantsFactory, p2)

	return composeStyleVariant(v13.common, v13.variants[p3], v13.hasValue[b1])
end
