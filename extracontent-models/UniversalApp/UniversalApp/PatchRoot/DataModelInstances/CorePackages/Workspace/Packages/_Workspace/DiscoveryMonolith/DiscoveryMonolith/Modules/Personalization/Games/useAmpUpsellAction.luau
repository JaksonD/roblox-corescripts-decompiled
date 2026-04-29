local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local React = require(Parent.React)
local useDispatch = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AmpUpsell = require(Parent.AmpUpsell)
local OpenAmpWizardContainer = AmpUpsell.OpenAmpWizardContainer
local AccessResponseEnum = AmpUpsell.AmpEnums.AccessResponseEnum

return function(s1: string?, s2: string?, p1: ((...any) -> ...any)?, s3: string?) -- line: 10
	-- upvalues: useDispatch (copy), React (copy), AccessResponseEnum (copy), OpenAmpWizardContainer (copy)
	local v11 = useDispatch()

	return React.useMemo(function() -- line: 17
		-- upvalues: s1 (copy), p1 (copy), AccessResponseEnum (copy), v11 (copy), OpenAmpWizardContainer (copy), s3 (copy), s2 (copy)
		if not s1 or s1 == "" then
			return nil
		end

		local function v12(p2, _) -- line: 21
			-- upvalues: p1 (copy), AccessResponseEnum (copy)
			if p1 and p2 == AccessResponseEnum.Granted then
				p1()
			end
		end

		return function() -- line: 26
			-- upvalues: v11 (copy), OpenAmpWizardContainer (copy), s1 (copy), v12 (copy), s3 (copy), s2 (copy)
			v11(OpenAmpWizardContainer(s1, v12, nil, s3, nil, s2))
		end
	end, {
		s1,
		s2,
		p1,
		s3,
		v11
	})
end
