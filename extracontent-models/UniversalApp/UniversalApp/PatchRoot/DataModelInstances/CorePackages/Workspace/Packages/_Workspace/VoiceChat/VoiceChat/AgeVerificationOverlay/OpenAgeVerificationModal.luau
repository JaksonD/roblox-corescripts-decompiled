local Parent = script:FindFirstAncestor("VoiceChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDown = require(Parent.NavigationRodux).Thunks.NavigateDown

return function(s1: string) -- line: 10
	-- upvalues: AppPage (copy), NavigateDown (copy)
	return function(p1) -- line: 11
		-- upvalues: AppPage (copy), s1 (copy), NavigateDown (copy)
		local t1 = {
			name = AppPage.AgeVerificationRequired,
			detail = s1
		}

		p1:dispatch(NavigateDown(t1))
	end
end
