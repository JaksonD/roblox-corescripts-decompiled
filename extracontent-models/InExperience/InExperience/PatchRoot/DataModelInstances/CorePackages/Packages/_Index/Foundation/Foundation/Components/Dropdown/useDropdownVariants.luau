local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)

require(Foundation.Components.Types)

local ControlState = require(Foundation.Enums.ControlState)
local InputSize = require(Foundation.Enums.InputSize)
local IconSize = require(Foundation.Enums.IconSize)

require(Foundation.Enums.InputLabelSize)

local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)

require(Foundation.Providers.Style.Tokens)

local VariantsContext = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(_) -- line: 38
	-- upvalues: InputSize (copy), IconSize (copy), ControlState (copy), Dash (copy)
	local t1 = {
		container = {
			tag = "row flex-x-between align-y-center stroke-standard stroke-position-inner"
		},
		text = {
			tag = "shrink auto-xy text-truncate-split"
		}
	}
	local t2 = {
		[InputSize.XSmall] = {
			container = {
				tag = "gap-xxsmall size-full-600 padding-small radius-small"
			},
			text = {
				tag = "text-body-small"
			},
			arrow = {
				size = IconSize.XSmall
			}
		},
		[InputSize.Small] = {
			container = {
				tag = "gap-xxsmall size-full-800 padding-medium radius-medium"
			},
			text = {
				tag = "text-body-small"
			},
			arrow = {
				size = IconSize.Small
			}
		},
		[InputSize.Medium] = {
			container = {
				tag = "size-full-1000 padding-medium radius-medium"
			},
			text = {
				tag = "text-body-medium"
			},
			arrow = {
				size = IconSize.Medium
			}
		},
		[InputSize.Large] = {
			container = {
				tag = "size-full-1200 padding-medium radius-medium"
			},
			text = {
				tag = "text-body-large"
			},
			arrow = {
				size = IconSize.Large
			}
		}
	}
	local t3 = {
		[ControlState.Disabled] = {
			container = {
				tag = "stroke-muted"
			},
			text = {
				tag = "content-muted"
			}
		},
		[ControlState.Initialize] = {
			container = {
				tag = "stroke-default"
			},
			text = {
				tag = "content-default"
			}
		},
		[ControlState.Default] = {
			container = {
				tag = "stroke-default"
			},
			text = {
				tag = "content-default"
			}
		},
		[ControlState.Hover] = {
			container = {
				tag = "stroke-emphasis"
			},
			text = {
				tag = "content-emphasis"
			}
		},
		[ControlState.Pressed] = {
			container = {
				tag = "stroke-emphasis"
			},
			text = {
				tag = "content-emphasis"
			}
		},
		Error = {
			container = {
				tag = "stroke-alert"
			},
			text = {
				tag = "content-default"
			}
		}
	}
	local v14 = Dash.map(t3, function(p2) -- line: 99
		-- upvalues: Dash (copy)
		return Dash.join(p2, {
			text = {
				tag = "content-muted"
			}
		})
	end)

	return {
		common = t1,
		sizes = t2,
		states = t3,
		placeholderStates = v14
	}
end

return function(p3, p4, p5, b1: boolean, b2: boolean) -- line: 113
	-- upvalues: VariantsContext (copy), variantsFactory (copy), composeStyleVariant (copy)
	local v20 = VariantsContext.useVariants("Dropdown", variantsFactory, p3)
	local v21 = if not b2 then p5 else "Error"

	return composeStyleVariant(v20.common, v20.sizes[p4], if not b1 then v20.states[v21] else v20.placeholderStates[v21])
end
