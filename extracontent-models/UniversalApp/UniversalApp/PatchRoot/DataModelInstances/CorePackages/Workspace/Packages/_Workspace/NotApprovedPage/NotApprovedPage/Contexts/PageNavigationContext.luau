local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")

require(NotApprovedPage.Common.Types)

local STATIC_PAGE_NAMES = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES
local generatePages = require(NotApprovedPage.Components.pageItemConfigs.generatePages).generatePages
local useNotApprovedPageContext = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local policyEducationContentRegistry = require(NotApprovedPage.Components.pageItemConfigs.policyEducationConfigs.policyEducationContentRegistry)
local NotApprovedPageParent = NotApprovedPage.Parent
local ArgCheck = require(NotApprovedPageParent.ArgCheck)
local dependencyArray = require(NotApprovedPageParent.RoactUtils).Hooks.dependencyArray
local React = require(NotApprovedPageParent.React)
local useMemo = React.useMemo
local useState = React.useState
local useCallback = React.useCallback
local useContext = React.useContext
local createContext = React.createContext
local FFlagEnableNapReactivationNotice = require(NotApprovedPage.Flags.FFlagEnableNapReactivationNotice)
local FFlagRemoveDependencyArrayAntipattern = require(NotApprovedPageParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local v17 = createContext({})

return {
	PageNavigationProvider = function(t1: {[any]: any}) --[[ PageNavigationProvider ]] -- line: 86
		-- upvalues: useState (copy), useNotApprovedPageContext (copy), useMemo (copy), generatePages (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), STATIC_PAGE_NAMES (copy), useCallback (copy), FFlagEnableNapReactivationNotice (copy), policyEducationContentRegistry (copy), React (copy), v17 (copy)
		local v19, v20 = useState(1)
		local v21, v22 = useState(false)
		local untranslatedReasons = useNotApprovedPageContext().violationReasons.untranslatedReasons
		local commutationEligibility = useNotApprovedPageContext().commutationEligibility
		local v25 = useMemo(function() -- line: 94
			-- upvalues: generatePages (copy), t1 (copy), untranslatedReasons (copy), commutationEligibility (copy)
			return generatePages(t1.moderationDetail, untranslatedReasons, commutationEligibility)
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t1.moderationDetail, untranslatedReasons, commutationEligibility) else {
			t1.moderationDetail,
			untranslatedReasons,
			commutationEligibility
		})
		local pages = v25.pages
		local unmappedViolationKeys = v25.unmappedViolationKeys
		local v28 = #pages
		local v29 = pages[v19]
		local v30 = if not v29 then STATIC_PAGE_NAMES.Unknown else v29.pageName
		local v31 = not not commutationEligibility and commutationEligibility.educational_pass_eligible
		local v32 = useCallback(function() -- line: 114
			-- upvalues: v19 (copy), v28 (copy), FFlagEnableNapReactivationNotice (copy), v22 (copy), v20 (copy)
			if v19 < v28 then
				if FFlagEnableNapReactivationNotice then
					v22(true)
				end

				v20(function(p1) -- line: 119
					return p1 + 1
				end)
			end
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19, v28) else {
			v19,
			v28
		})
		local v33 = useCallback(function() -- line: 127
			-- upvalues: v19 (copy), v20 (copy)
			if v19 > 1 then
				v20(function(p2) -- line: 129
					return p2 - 1
				end)
			end
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19) else { v19 })
		local v34 = v19 == 1
		local v35 = v19 == v28
		local v36 = useCallback(function() -- line: 141
			-- upvalues: v28 (copy), v30 (copy), STATIC_PAGE_NAMES (copy), v19 (copy), v31 (copy)
			if v28 <= 1 or (v30 == STATIC_PAGE_NAMES.Intro or v30 == STATIC_PAGE_NAMES.SecondChanceIntro) then
				return 0
			end

			local v40 = v28 - 1
			local v41 = v19 - 1

			if v31 then
				v40 -= 1
				v41 -= 1
			end

			if v40 <= 0 then
				return 0
			end

			return (math.round(v41 / v40 * 100))
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19, v28, v30) else {
			v19,
			v28,
			v30
		})
		local v37 = useMemo(function() -- line: 173
			-- upvalues: untranslatedReasons (copy), policyEducationContentRegistry (copy)
			for _, v43 in untranslatedReasons do
				if policyEducationContentRegistry[v43] then
					return true
				end
			end

			return false
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(untranslatedReasons) else { untranslatedReasons })
		local v38 = useMemo(function() -- line: 183
			-- upvalues: v19 (copy), v30 (copy), v28 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), FFlagEnableNapReactivationNotice (copy), v21 (copy), v29 (copy), unmappedViolationKeys (copy)
			return {
				currentPage = v19,
				currentPageName = v30,
				totalPages = v28,
				goToNextPage = v32,
				goToPreviousPage = v33,
				isFirstPage = v34,
				isLastPage = v35,
				getProgress = v36,
				hasEducationalPages = v37,
				hasNavigatedForward = not not FFlagEnableNapReactivationNotice and v21,
				currentPageConfigs = if not v29 then {} else v29.pageItems,
				CurrentCtaComponent = if not v29 then nil else v29.CtaComponent,
				unmappedViolationKeys = unmappedViolationKeys
			}
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19, v28, v30, v32, v33, v34, v35, v36, pages, v37, v21, unmappedViolationKeys) else {
			v19,
			v28,
			v30,
			v32,
			v33,
			v34,
			v35,
			v36,
			pages,
			v37,
			v21,
			unmappedViolationKeys
		})

		return React.createElement(v17.Provider, {
			value = v38
		}, t1.children)
	end,
	usePageNavigation = function() --[[ usePageNavigation ]] -- line: 238
		-- upvalues: useContext (copy), v17 (copy), ArgCheck (copy)
		local v39 = useContext(v17)

		ArgCheck.assert(v39 and v39.currentPage ~= nil, "usePageNavigation must be used within PageNavigationProvider")

		return v39
	end
}
