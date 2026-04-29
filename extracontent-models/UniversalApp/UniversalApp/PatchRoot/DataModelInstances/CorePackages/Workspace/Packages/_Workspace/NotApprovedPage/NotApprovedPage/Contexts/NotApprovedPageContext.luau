local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")

require(NotApprovedPage.Common.Types)

local NotApprovedPageParent = NotApprovedPage.Parent
local ArgCheck = require(NotApprovedPageParent.ArgCheck)
local dependencyArray = require(NotApprovedPageParent.RoactUtils).Hooks.dependencyArray
local React = require(NotApprovedPageParent.React)
local useMemo = React.useMemo
local useContext = React.useContext
local platformEvidence = require(NotApprovedPage.Utils.platformEvidence)
local collectUniqueTranslations = require(NotApprovedPage.Utils.collectUniqueTranslations)
local FFlagRemoveDependencyArrayAntipattern = require(NotApprovedPageParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local v11 = React.createContext({})

return {
	NotApprovedPageProvider = function(t1: {[any]: any}) --[[ NotApprovedPageProvider ]] -- line: 53
		-- upvalues: useMemo (copy), platformEvidence (copy), collectUniqueTranslations (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), React (copy), v11 (copy)
		local translations = t1.translations
		local badUtterances = t1.moderationDetail.badUtterances
		local violation = t1.moderationDetail.violation
		local commutationEligibility = t1.commutationEligibility
		local v17 = useMemo(function() -- line: 59
			-- upvalues: violation (copy), platformEvidence (copy), collectUniqueTranslations (copy), translations (copy), badUtterances (copy), commutationEligibility (copy)
			local t2 = {}
			local t3 = {}

			if violation and platformEvidence.isVisibleInView(violation) then
				t2 = collectUniqueTranslations(violation.abuseTypeTranslationKeys, translations)
				t3 = collectUniqueTranslations(violation.abuseTypeTranslationKeys, nil)
			elseif badUtterances then
				local t4 = {}

				for _, v23 in badUtterances do
					table.insert(t4, v23.labelTranslationKey)
				end

				t2 = collectUniqueTranslations(t4, translations)
				t3 = collectUniqueTranslations(t4, nil)
			end

			return {
				translations = translations,
				violationReasons = {
					translatedReasons = t2,
					untranslatedReasons = t3
				},
				commutationEligibility = commutationEligibility
			}
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(badUtterances, violation, translations, commutationEligibility) else {
			badUtterances,
			violation,
			translations,
			commutationEligibility
		})

		return React.createElement(v11.Provider, {
			value = v17
		}, t1.children)
	end,
	useNotApprovedPageContext = function() --[[ useNotApprovedPageContext ]] -- line: 97
		-- upvalues: useContext (copy), v11 (copy), ArgCheck (copy)
		local v18 = useContext(v11)

		ArgCheck.assert(v18 and v18.translations, "useNotApprovedPageContext returned invalid context, usually this means the NotApprovedPageProvider is not present in the tree")

		return {
			translations = v18.translations,
			violationReasons = v18.violationReasons,
			commutationEligibility = v18.commutationEligibility
		}
	end
}
