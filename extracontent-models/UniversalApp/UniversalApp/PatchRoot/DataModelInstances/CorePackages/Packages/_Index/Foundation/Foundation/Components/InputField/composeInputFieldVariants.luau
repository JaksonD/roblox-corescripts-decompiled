local Foundation = script:FindFirstAncestor("Foundation")

require(Foundation.Enums.InputSize)

local InputVariant = require(Foundation.Enums.InputVariant)

require(Foundation.Enums.Radius)

local composeStyleVariant = require(Foundation.Utility.composeStyleVariant)
local getInputVariantsFactory = require(script.Parent.getInputVariantsFactory)

require(Foundation.Providers.Style.Tokens)

return function(p1, p2, p3, p4, b1: boolean?, b2: boolean?, b3: boolean?) --[[ composeInputFieldVariants ]] -- line: 22
	-- upvalues: getInputVariantsFactory (copy), InputVariant (copy), composeStyleVariant (copy)
	local v12 = getInputVariantsFactory(p1)
	local v13 = v12.variants[p3 or InputVariant.Standard]

	return composeStyleVariant(v12.common, v12.sizes[p2], if p3 == InputVariant.Utility then {} else v13, if not p4 then v12.defaultRadius[p2] else v12.radius[p4], if b2 == nil then {} else v12.hoverState[b2], if b1 == nil then {} else v12.focusedState[b1], if b3 == nil then {} else v12.errorState[b3], if p3 ~= InputVariant.Utility then {} else v13)
end
