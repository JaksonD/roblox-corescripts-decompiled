local Foundation = script:FindFirstAncestor("Foundation")

require(Foundation.Enums.Device)

local Flags = require(Foundation.Utility.Flags)

require(Foundation.Enums.Theme)
require(Foundation.Providers.Style.Tokens)
require(script.Parent.createStyleSheetRules)

local getOverrideAttributes = require(script.Parent.getOverrideAttributes)
local scaleValue = require(Foundation.Utility.scaleValue)

return function(p1, p2, p3, n1: number, p4, p5) --[[ updateTokenOverrides ]] -- line: 15
	-- upvalues: getOverrideAttributes (copy), Flags (copy), scaleValue (copy)
	for v11, v12 in (getOverrideAttributes(p2, p3, p4)) do
		local v13 = if not Flags.FoundationDisableTokenScaling then scaleValue(v12, n1) else v12

		p1:SetAttribute(v11, v13)

		if p5 then
			p5[v11] = v13
		end
	end
end
