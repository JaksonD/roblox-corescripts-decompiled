local GamePlayButton = script:FindFirstAncestor("GamePlayButton")

require(GamePlayButton.PlayButtonTypes)

local GetFFlagLuaAppFetchPlayabilityKillSwitch = require(GamePlayButton.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch)
local FetchGamePlayButtonData = require(GamePlayButton.FetchGamePlayButtonData)
local GamePlayButtonParent = GamePlayButton.Parent
local React = require(GamePlayButtonParent.React)
local useDispatch = require(GamePlayButtonParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(GamePlayButtonParent.RobloxAppHooks).useRoactService
local RoactNetworking = require(GamePlayButtonParent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(GamePlayButtonParent.RoactServiceTags).AppEventIngestService
local PlayabilityStatusEnum = require(GamePlayButtonParent.DiscoveryTypes).PlayabilityStatusEnum

require(GamePlayButtonParent.PlayabilityRodux)

local FetchGamePlayabilityAndProductInfo = require(GamePlayButtonParent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local OpenAgeVerificationModal = require(GamePlayButtonParent.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal
local useContextualParentalControlsUpsell = require(GamePlayButton.PlayButtonLaunchChecks.useContextualParentalControlsUpsell)
local unlockPlayIntent = require(GamePlayButtonParent.DiscoveryAnalytics).Events.unlockPlayIntent
local OpenAmpWizardContainer = require(GamePlayButtonParent.AmpUpsell).OpenAmpWizardContainer
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = require(GamePlayButtonParent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = require(GamePlayButtonParent.SharedFlags).FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local v19 = if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else "gameJoinAgeCheckRequired"

return function(p1, p2, p3) -- line: 30
	-- upvalues: useRoactService (copy), RoactNetworking (copy), AppEventIngestService (copy), useDispatch (copy), React (copy), unlockPlayIntent (copy), useContextualParentalControlsUpsell (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FetchGamePlayButtonData (copy), PlayabilityStatusEnum (copy), GetFFlagLuaAppFetchPlayabilityKillSwitch (copy), FetchGamePlayabilityAndProductInfo (copy), OpenAmpWizardContainer (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), v19 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), OpenAgeVerificationModal (copy)
	local v23 = useRoactService(RoactNetworking)
	local v24 = useRoactService(AppEventIngestService)
	local v25 = useDispatch()
	local v26 = React.useCallback(function(p4) -- line: 40
		-- upvalues: unlockPlayIntent (copy), v24 (copy), p2 (copy), p1 (copy)
		unlockPlayIntent(v24, {
			universeId = p2,
			upsellName = p4,
			playabilityStatus = p1 and p1.playabilityStatus or nil
		})
	end, {
		v24,
		p2,
		p1
	})
	local v27 = useContextualParentalControlsUpsell(p2, p3)
	local u28 = nil

	if FFlagLuaAppPlayButtonAmpAgeCheckFlow then
		u28 = React.useCallback(function() -- line: 52
			-- upvalues: v25 (copy), FetchGamePlayButtonData (copy), v23 (copy), p2 (copy)
			v25(FetchGamePlayButtonData.Fetch(v23, p2, true))
		end, {
			v25,
			v23,
			p2
		})
	end

	return (React.useCallback(function(p5) -- line: 57
		-- upvalues: p1 (copy), PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), GetFFlagLuaAppFetchPlayabilityKillSwitch (copy), v25 (copy), FetchGamePlayabilityAndProductInfo (copy), v23 (copy), p2 (copy), OpenAmpWizardContainer (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), u28 (ref), v19 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), OpenAgeVerificationModal (copy), v26 (copy), v27 (copy), p3 (copy)
		if p1 then
			if (p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or FFlagLuaAppPlayButtonAmpAgeCheckFlow and p1.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired)) and not GetFFlagLuaAppFetchPlayabilityKillSwitch() then
				v25(FetchGamePlayabilityAndProductInfo.Fetch(v23, p2)):andThen(function(p6) -- line: 70
					-- upvalues: PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), v25 (copy), OpenAmpWizardContainer (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), u28 (ref), v19 (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy), OpenAgeVerificationModal (copy), p2 (copy), v26 (copy), v27 (copy), p3 (copy), p5 (copy)
					if p6 == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or FFlagLuaAppPlayButtonAmpAgeCheckFlow and p6 == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then
						if FFlagLuaAppPlayButtonAmpAgeCheckFlow then
							v25(OpenAmpWizardContainer(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, u28, nil, v19, nil, FStringLuaAppPlayButtonAgeCheckAmpNameSpace))
						else
							v25(OpenAgeVerificationModal(p2))
						end

						v26(not FFlagLuaAppPlayButtonAmpAgeCheckFlow and "AgeVerificationUnverifiedSeventeenPlusUser" or "AgeCheckRequired")

						return
					end

					if p6 == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls then
						v27()

						return
					end

					p3(p5)
					v26("GameLaunch")
				end):catch(function() -- line: 110
					-- upvalues: p3 (copy), p5 (copy), v26 (copy)
					p3(p5)
					v26("GameLaunch")
				end)

				return
			end

			p3(p5)

			return
		end

		p3(p5)
	end, {
		v23,
		p2,
		p1,
		p3,
		v26,
		v27,
		if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else u28,
		if not FFlagLuaAppPlayButtonAmpAgeCheckFlow then nil else v25
	}))
end
