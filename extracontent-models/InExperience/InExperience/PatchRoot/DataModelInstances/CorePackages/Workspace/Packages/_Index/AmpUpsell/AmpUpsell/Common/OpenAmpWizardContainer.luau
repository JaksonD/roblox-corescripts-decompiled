local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDown = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateFromWebView = require(Parent.NavigationRodux).Thunks.NavigateFromWebView
local NavigateBack = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagEnableAmpWizardDeepLink = require(Parent.SharedFlags).FFlagEnableAmpWizardDeepLink
local FFlagLuaAppWizardContainerBypassNavigationLock = require(Parent.SharedFlags).FFlagLuaAppWizardContainerBypassNavigationLock

return function(p1, p2, p3, p4, p5, s1: string?, b1: boolean?, p6) -- line: 14
	-- upvalues: FFlagEnableAmpWizardDeepLink (copy), AppPage (copy), NavigateBack (copy), FFlagLuaAppWizardContainerBypassNavigationLock (copy), NavigateFromWebView (copy), NavigateDown (copy)
	local v16 = FFlagEnableAmpWizardDeepLink and (p6 ~= nil and p6.returnPage ~= nil)

	return function(p7) -- line: 26
		-- upvalues: AppPage (copy), p1 (copy), p3 (copy), p4 (copy), s1 (copy), p5 (copy), p6 (copy), NavigateBack (copy), FFlagLuaAppWizardContainerBypassNavigationLock (copy), p2 (copy), b1 (copy), v16 (copy), NavigateFromWebView (copy), NavigateDown (copy)
		local t1 = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = p1,
				recourseData = p3,
				entryPointEventCtx = p4,
				nameSpace = s1,
				extraParameters = p5,
				metadata = p6,
				completionCallback = function(p8, p9) --[[ completionCallback ]] -- line: 36
					-- upvalues: p7 (copy), NavigateBack (copy), FFlagLuaAppWizardContainerBypassNavigationLock (copy), p2 (copy)
					p7:dispatch(NavigateBack(not not FFlagLuaAppWizardContainerBypassNavigationLock or nil))
					p2(p8, p9)
				end,
				skipFacialAgeEstimationWebLinkModal = b1
			}
		}

		if v16 then
			p7:dispatch(NavigateFromWebView(t1, true))

			return
		end

		p7:dispatch(NavigateDown(t1, true))
	end
end
