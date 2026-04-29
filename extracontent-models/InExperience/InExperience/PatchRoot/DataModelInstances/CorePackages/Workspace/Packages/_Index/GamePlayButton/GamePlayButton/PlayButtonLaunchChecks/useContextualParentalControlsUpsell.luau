local GamePlayButton = script:FindFirstAncestor("GamePlayButton")

require(GamePlayButton.PlayButtonTypes)

local FetchGamePlayButtonData = require(GamePlayButton.FetchGamePlayButtonData)
local GamePlayButtonParent = GamePlayButton.Parent
local React = require(GamePlayButtonParent.React)
local useDispatch = require(GamePlayButtonParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(GamePlayButtonParent.RoactUtils).Hooks.RoactRodux.useSelector
local useRoactService = require(GamePlayButtonParent.RobloxAppHooks).useRoactService
local RoactNetworking = require(GamePlayButtonParent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(GamePlayButtonParent.RoactServiceTags).AppEventIngestService
local flaggedMutedError = require(GamePlayButtonParent.Loggers).flaggedMutedError
local GameInfosReducer = require(GamePlayButtonParent.GameInfosRodux).GameInfosReducer
local FetchUserSettingsAndOptions = require(GamePlayButtonParent.GameDetailRodux).FetchUserSettingsAndOptions
local Dash = require(GamePlayButtonParent.Dash)
local AppPage = require(GamePlayButtonParent.RobloxAppEnums).AppPage
local NavigateDown = require(GamePlayButtonParent.NavigationRodux).Thunks.NavigateDown
local NavigateBack = require(GamePlayButtonParent.NavigationRodux).Thunks.NavigateBack
local OpenCloseOnlyInteractiveAlert = require(GamePlayButtonParent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local OpenUpsellModal = require(GamePlayButtonParent.DiscoveryRouting).OpenUpsellModal
local OpenPlayButtonUpsellDialog = require(GamePlayButtonParent.DiscoveryRouting).OpenPlayButtonUpsellDialog
local CloseCentralOverlay = require(GamePlayButtonParent.CentralOverlay).Thunks.CloseCentralOverlay
local useLocalization = require(GamePlayButtonParent.Localization).Hooks.useLocalization
local useAppPolicy = require(GamePlayButtonParent.UniversalAppPolicy).useAppPolicy
local OpenAmpWizardContainer = require(GamePlayButtonParent.AmpUpsell).OpenAmpWizardContainer
local authButtonClick = require(GamePlayButtonParent.AuthAnalytics).Events.authButtonClick
local LoggingProtocol = require(GamePlayButtonParent.LoggingProtocol)
local PlayabilityStatusEnum = require(GamePlayButtonParent.DiscoveryTypes).PlayabilityStatusEnum
local unlockPlayIntent = require(GamePlayButtonParent.DiscoveryAnalytics).Events.unlockPlayIntent
local v28 = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0)
local v29 = game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus")
local FFlagLuaAppParentUpsellPolicy = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local FFlagLuaAppPlayButtonUpsellLinking = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(GamePlayButtonParent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(GamePlayButtonParent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local t1 = {
	SelfUpdateSetting = "SelfUpdateSetting",
	ParentalConsent = "ParentalConsent",
	ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
}

local function parseContentMaturityMappingString(s1: string) -- line: 55
	if s1 == "" then
		return {}
	end

	local t2 = {}

	for _, v41 in (string.split(s1, ",")) do
		local parts = string.split(v41, "=")

		if #parts == 2 and parts[1] ~= "" and parts[2] ~= "" then
			t2[parts[1]] = parts[2]
		else
			error(`Invalid content maturity mapping string { s1 }`)
		end
	end

	return t2
end

local v37 = (function(s2: string) --[[ safeParseContentMaturityMappingString ]] -- line: 76
	-- upvalues: parseContentMaturityMappingString (copy), flaggedMutedError (copy)
	local ok, result = pcall(function() -- line: 77
		-- upvalues: parseContentMaturityMappingString (copy), s2 (copy)
		return (parseContentMaturityMappingString(s2))
	end)

	if not ok then
		flaggedMutedError("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", `Error parsing content maturity mapping string { s2 }, error is: { result }`)

		return {}
	end

	return result
end)(v29)

return function(s3: string, p1) -- line: 96
	-- upvalues: useRoactService (copy), RoactNetworking (copy), AppEventIngestService (copy), useDispatch (copy), useSelector (copy), GameInfosReducer (copy), useLocalization (copy), React (copy), OpenAmpWizardContainer (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), NavigateDown (copy), AppPage (copy), FFlagLuaAppPlayButtonUpsellLinking (copy), OpenPlayButtonUpsellDialog (copy), OpenUpsellModal (copy), OpenCloseOnlyInteractiveAlert (copy), NavigateBack (copy), CloseCentralOverlay (copy), FetchGamePlayButtonData (copy), authButtonClick (copy), unlockPlayIntent (copy), PlayabilityStatusEnum (copy), FFlagLuaAppParentUpsellPolicy (copy), useAppPolicy (copy), FetchUserSettingsAndOptions (copy), flaggedMutedError (copy), v37 (copy), LoggingProtocol (copy), v28 (copy), Dash (copy), t1 (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
	local v48 = useRoactService(RoactNetworking)
	local v49 = useRoactService(AppEventIngestService)
	local v50 = useDispatch()
	local v51 = useSelector(function(p2) -- line: 104
		-- upvalues: s3 (copy), GameInfosReducer (copy)
		local v67 = p2.AgeRecommendations[s3]

		if v67 and (v67.summary and v67.summary.ageRecommendation and v67.summary.ageRecommendation.contentMaturity) then
			return v67.summary.ageRecommendation.contentMaturity
		end

		local v68 = p2.Personalization[GameInfosReducer.key][s3]

		if v68 and v68.contentMaturity then
			return v68.contentMaturity
		end

		return nil
	end)
	local v52 = useLocalization({
		unplayableTitleText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Title",
		unplayableBodyText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Body",
		unplayableButtonText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Action.Ok",
		askYourParentTitleText = "Feature.ExperienceDetails.AskYourParentModal.Label.Title",
		askYourParentBodyText = "Feature.ExperienceDetails.AskYourParentModal.Label.Body",
		askYourParentActionButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.AskNow",
		askYourParentCancelButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.Cancel",
		consoleSelfUpdateSettingTitleText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Title",
		consoleSelfUpdateSettingBodyText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Body",
		consoleSelfUpdateSettingButtonText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Action.Ok"
	})
	local v53 = React.useCallback(function(p3, p4, p5, p6, p7, p8) -- line: 140
		-- upvalues: v50 (copy), OpenAmpWizardContainer (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy)
		v50(OpenAmpWizardContainer(p3, p4, p5, p6, if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else p7, if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else p8))
	end, { v50 })
	local v54 = React.useCallback(function(p9, p10, p11, p12) -- line: 156
		-- upvalues: v50 (copy), NavigateDown (copy), AppPage (copy)
		v50(NavigateDown({
			name = AppPage.AccountSettingsUpsell,
			extraProps = {
				featureName = p9,
				localizationStrings = p10,
				onCloseModal = p11,
				onCancelled = p12
			}
		}, true))
	end, { v50 })
	local v55 = React.useCallback(function(p13, p14, p15, p16, p17, p18, p19) -- line: 171
		-- upvalues: FFlagLuaAppPlayButtonUpsellLinking (copy), v50 (copy), OpenPlayButtonUpsellDialog (copy), OpenUpsellModal (copy)
		if FFlagLuaAppPlayButtonUpsellLinking then
			v50(OpenPlayButtonUpsellDialog(p13, p14, p15, p16, p17, p18, p19))

			return
		end

		v50(OpenUpsellModal(p13, p14, p15, p16, p17, p18, p19))
	end, { v50 })
	local v56 = React.useCallback(function(p20, p21, p22, p23, p24) -- line: 209
		-- upvalues: v50 (copy), OpenCloseOnlyInteractiveAlert (copy)
		v50(OpenCloseOnlyInteractiveAlert(p20, p21, p22, p23, p24))
	end, { v50 })
	local v57 = React.useCallback(function() -- line: 213
		-- upvalues: v50 (copy), NavigateBack (copy)
		v50(NavigateBack(true))
	end, { v50 })
	local v58 = React.useCallback(function() -- line: 217
		-- upvalues: v50 (copy), CloseCentralOverlay (copy)
		v50(CloseCentralOverlay())
	end, { v50 })
	local v59 = React.useCallback(function() -- line: 221
		-- upvalues: v50 (copy), FetchGamePlayButtonData (copy), v48 (copy), s3 (copy)
		v50(FetchGamePlayButtonData.Fetch(v48, s3, true))
	end, {
		v50,
		v48,
		s3
	})
	local v60 = React.useCallback(function() -- line: 225
		-- upvalues: v57 (copy), v59 (copy)
		v57()
		v59()
	end, {
		v57,
		v59
	})
	local v61 = React.useCallback(function() -- line: 232
		-- upvalues: v58 (copy), authButtonClick (copy), v59 (copy)
		v58()
		authButtonClick("gameJoinContentMaturityLock", "cancelAskParent")
		v59()
	end, {
		v58,
		v59
	})
	local v62 = React.useCallback(function(p25) -- line: 241
		-- upvalues: v58 (copy), authButtonClick (copy), v53 (copy), v57 (copy)
		v58()
		authButtonClick("gameJoinContentMaturityLock", "askParent")
		v53("CanChangeSetting", v57, {
			contentAgeRestriction = p25
		}, "gameJoinContentMaturityLock", nil, nil)
	end, {
		v53,
		v57,
		v58
	})
	local v63 = React.useCallback(function(p26) -- line: 252
		-- upvalues: unlockPlayIntent (copy), v49 (copy), s3 (copy), PlayabilityStatusEnum (copy)
		unlockPlayIntent(v49, {
			universeId = s3,
			upsellName = p26,
			playabilityStatus = PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls
		})
	end, {
		v49,
		s3
	})
	local u64 = nil

	if FFlagLuaAppParentUpsellPolicy then
		u64 = useAppPolicy(function(p27) -- line: 262
			return p27.getShouldShowVpcPlayButtonUpsells()
		end)
	end

	local v65 = useAppPolicy(function(p28) -- line: 267
		return p28.getWebViewSupport()
	end)

	return (React.useCallback(function(p29) -- line: 271
		-- upvalues: FFlagLuaAppParentUpsellPolicy (copy), u64 (ref), p1 (copy), v63 (copy), FetchUserSettingsAndOptions (copy), v48 (copy), v51 (copy), flaggedMutedError (copy), v37 (copy), LoggingProtocol (copy), v28 (copy), s3 (copy), Dash (copy), t1 (copy), v65 (copy), v56 (copy), v52 (copy), v58 (copy), v54 (copy), v60 (copy), v55 (copy), v62 (copy), v61 (copy), v53 (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), v59 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
		if FFlagLuaAppParentUpsellPolicy and not u64 then
			p1(p29)
			v63("GameLaunch")

			return
		end

		FetchUserSettingsAndOptions(v48):andThen(function(p30) -- line: 280
			-- upvalues: v51 (copy), flaggedMutedError (copy), p1 (copy), p29 (copy), v63 (copy), v37 (copy), LoggingProtocol (copy), v28 (copy), s3 (copy), Dash (copy), t1 (copy), v65 (copy), v56 (copy), v52 (copy), v58 (copy), v54 (copy), v60 (copy), v55 (copy), v62 (copy), v61 (copy), v53 (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), v59 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
			local contentAgeRestriction = p30.contentAgeRestriction

			if not contentAgeRestriction or not v51 then
				flaggedMutedError("ExperienceParentalControlsUpsellUnknownContentMaturityRating", `Unknown content maturity rating { v51 } or age restriction setting { contentAgeRestriction } for Contextual Parental Controls upsell on play button click`)
				p1(p29)
				v63("GameLaunch")

				return
			end

			assert(v51, "Content maturity rating must be present to show correct upsell")

			if not v37[v51] then
				LoggingProtocol.default:logRobloxTelemetryEvent({
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					backends = { LoggingProtocol.TelemetryBackends.Points },
					throttlingPercentage = v28,
					lastUpdated = {
						25,
						8,
						26
					},
					description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click"
				}, { LoggingProtocol.default.StandardizedFields.addOsInfo }, {
					eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating",
					contentMaturityRating = v51,
					universeId = s3
				})
				p1(p29)
				v63("GameLaunch")

				return
			end

			local v98 = v37[v51]
			local v99 = Dash.find(contentAgeRestriction.options, function(p31) -- line: 323
				-- upvalues: v98 (copy)
				return not not p31 and (not not p31.option and (p31.option.optionValue == v98 or false))
			end)

			if v99 then
				local requirement = v99.requirement

				if requirement == t1.SelfUpdateSetting then
					if not v65 then
						v56(v52.consoleSelfUpdateSettingTitleText, v52.consoleSelfUpdateSettingBodyText, v58, v52.consoleSelfUpdateSettingButtonText, true)
					else
						v54("gameJoinContentMaturityLock", {
							title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title",
							message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body",
							buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel",
							buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
						}, v60, v60)
					end
				elseif requirement == t1.ParentalConsent then
					v55(v52.askYourParentTitleText, v52.askYourParentBodyText, v52.askYourParentActionButtonText, v52.askYourParentCancelButtonText, function() -- line: 354
						-- upvalues: v62 (copy), v99 (copy)
						v62(v99.option.optionValue)
					end, v61, v61)
				elseif requirement == t1.ContentAgeRestrictionVerification then
					v53(not FFlagLuaAppPlayButtonAmpAgeCheckFlow and "ShouldNotPromptSeventeenPlusSettingVerifications" or FStringLuaAppPlayButtonAgeCheckAmpFeatureName, v59, nil, if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else "gameJoinContentMaturityLock", nil, if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else FStringLuaAppPlayButtonAgeCheckAmpNameSpace)
				else
					flaggedMutedError("ExperienceParentalControlsUnknownUpsellRequirement", `Unknown requirement { requirement } for ContentAgeRestriction option { v99 } on play button click`)
					p1(p29)
				end

				v63(requirement or "GameLaunch")

				return
			end

			v56(v52.unplayableTitleText, v52.unplayableBodyText, v58, v52.unplayableButtonText, true)
			v63("RestrictedUnplayableOptionNotFound")
		end, function() -- line: 398
			-- upvalues: p1 (copy), p29 (copy), v63 (copy)
			p1(p29)
			v63("GameLaunch")
		end)
	end, {
		v48,
		s3,
		p1,
		v51,
		v50,
		v54,
		v53,
		v56,
		v55,
		v62,
		v60,
		v61,
		v58,
		if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else v59,
		v63,
		v52.unplayableTitleText,
		v52.unplayableBodyText,
		v52.unplayableButtonText,
		v52.askYourParentTitleText,
		v52.askYourParentBodyText,
		v52.askYourParentActionButtonText,
		v52.askYourParentCancelButtonText,
		v52.consoleSelfUpdateSettingTitleText,
		v52.consoleSelfUpdateSettingBodyText,
		v52.consoleSelfUpdateSettingButtonText,
		u64,
		v65
	}))
end
