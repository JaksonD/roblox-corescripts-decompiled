local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local PlayButtonStates = require(GamePlayButton.PlayButtonStates)
local FetchGamePlayButtonData = require(GamePlayButton.FetchGamePlayButtonData)
local ApiPostPreparePurchase = require(GamePlayButton.ApiPostPreparePurchase)
local GamePlayButtonParent = GamePlayButton.Parent
local GetFFlagIsSquadEnabled = require(GamePlayButtonParent.SharedFlags).GetFFlagIsSquadEnabled
local React = require(GamePlayButtonParent.React)

require(GamePlayButtonParent.PlayabilityRodux)

local PlayabilityStatusEnum = require(GamePlayButtonParent.DiscoveryTypes).PlayabilityStatusEnum
local RetrievalStatus = require(GamePlayButtonParent.Http).Enum.RetrievalStatus
local RoactUtils = require(GamePlayButtonParent.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local FetchGamePlayabilityAndProductInfo = require(GamePlayButtonParent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local GamesProductInfoReducer = require(GamePlayButtonParent.GameProductInfoRodux).GamesProductInfoReducer
local useCurrentSquadSelector = require(GamePlayButtonParent.RoduxSquads).Hooks.useCurrentSquadSelector
local useIsExperienceInvitePending = require(GamePlayButtonParent.Squads).Hooks.useIsExperienceInvitePending
local useAppPolicy = require(GamePlayButtonParent.UniversalAppPolicy).useAppPolicy
local FFlagLuaAppParentUpsellPolicy = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local FFlagLuaAppEnablePlayableStateWhenLoading = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow

local function selectPlayButtonState(p1, p2, p3, p4, b1: boolean?, p5, b2: boolean?) -- line: 31
	-- upvalues: RetrievalStatus (copy), PlayButtonStates (copy), PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FFlagLuaAppParentUpsellPolicy (copy), GetFFlagIsSquadEnabled (copy)
	local v29 = if p1 ~= RetrievalStatus.Done or p2 == nil then PlayButtonStates.Playable else if p2.isPlayable ~= true then if p2.playabilityStatus ~= PlayabilityStatusEnum.PurchaseRequired or (p3 == nil or p3.isForSale ~= true) then if p2.playabilityStatus ~= PlayabilityStatusEnum.FiatPurchaseRequired or (p3 == nil or p3.isForSale ~= true) then if not FFlagLuaAppPlayButtonAmpAgeCheckFlow or p2.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser and (not (not not (not FFlagLuaAppParentUpsellPolicy or b2) and p2.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls) and p2.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then if FFlagLuaAppPlayButtonAmpAgeCheckFlow or p2.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if FFlagLuaAppPlayButtonAmpAgeCheckFlow or (not (not FFlagLuaAppParentUpsellPolicy or b2) or p2.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls) then PlayButtonStates.UnplayableOther else PlayButtonStates.ActionNeeded else PlayButtonStates.ActionNeeded else PlayButtonStates.ActionNeeded else PlayButtonStates.FiatPaidAccess else PlayButtonStates.PaidAccess else PlayButtonStates.Playable

	if GetFFlagIsSquadEnabled() and (v29 == PlayButtonStates.Playable and p4 and #p4.members > 1) and (not p5 or not p5.maxPlayers or p5.maxPlayers > 1) then
		if b1 then
			return PlayButtonStates.WaitingForParty
		end

		v29 = PlayButtonStates.PlayableWithParty
	end

	return v29
end

return function(p6, p7, n1: number?, b3: boolean?) -- line: 109
	-- upvalues: useDispatch (copy), React (copy), FetchGamePlayButtonData (copy), FFlagLuaAppParentUpsellPolicy (copy), useAppPolicy (copy), GetFFlagIsSquadEnabled (copy), useCurrentSquadSelector (copy), useIsExperienceInvitePending (copy), useSelector (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), PlayButtonStates (copy), ApiPostPreparePurchase (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), GamesProductInfoReducer (copy), selectPlayButtonState (copy)
	local v34 = useDispatch()

	React.useEffect(function() -- line: 112
		-- upvalues: n1 (copy), v34 (copy), FetchGamePlayButtonData (copy), p6 (copy), p7 (copy)
		local u39 = nil

		if n1 ~= nil and n1 > 0 then
			u39 = task.delay(n1, function() -- line: 115
				-- upvalues: u39 (ref), v34 (copy), FetchGamePlayButtonData (copy), p6 (copy), p7 (copy)
				u39 = nil
				v34(FetchGamePlayButtonData.Fetch(p6, p7))
			end)
		else
			v34(FetchGamePlayButtonData.Fetch(p6, p7))
		end

		return function() -- line: 123
			-- upvalues: u39 (ref)
			if u39 ~= nil then
				task.cancel(u39)
			end
		end
	end, {
		p7,
		n1
	})

	local u35 = nil

	if FFlagLuaAppParentUpsellPolicy then
		u35 = useAppPolicy(function(p8) -- line: 132
			return p8.getShouldShowVpcPlayButtonUpsells()
		end)
	end

	local v36 = if not GetFFlagIsSquadEnabled() then nil else useCurrentSquadSelector()
	local v37 = if not GetFFlagIsSquadEnabled() then nil else useIsExperienceInvitePending()
	local v38 = useSelector(function(p9) -- line: 139
		-- upvalues: p7 (copy)
		return p9.PlayabilityStatus and p9.PlayabilityStatus[p7] or nil
	end)

	return {
		playButtonState = useSelector(function(p10) -- line: 142
			-- upvalues: FetchGamePlayButtonData (copy), p7 (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), b3 (copy), GetFFlagIsSquadEnabled (copy), v36 (copy), v37 (copy), PlayButtonStates (copy), ApiPostPreparePurchase (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), GamesProductInfoReducer (copy), selectPlayButtonState (copy), v38 (copy), FFlagLuaAppParentUpsellPolicy (copy), u35 (ref)
			if FetchGamePlayButtonData.IsLoading(p10, p7) then
				if FFlagLuaAppEnablePlayableStateWhenLoading then
					if b3 then
						if GetFFlagIsSquadEnabled() and v36 and #v36.members > 1 then
							if v37 then
								return PlayButtonStates.WaitingForParty
							end

							return PlayButtonStates.PlayableWithParty
						end

						return PlayButtonStates.Playable
					end

					return PlayButtonStates.Loading
				end

				return PlayButtonStates.Loading
			end

			if ApiPostPreparePurchase.GetFetchingStatus(p10, p7) == RetrievalStatus.Fetching then
				return PlayButtonStates.Loading
			end

			local v43 = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p10, p7)
			local v44 = p10[GamesProductInfoReducer.key] and p10[GamesProductInfoReducer.key][p7] or nil

			if GetFFlagIsSquadEnabled() then
				local v45 = p10.GameDetails[p7]

				return (selectPlayButtonState(v43, v38, v44, v36, v37, v45, if not FFlagLuaAppParentUpsellPolicy then nil else u35))
			end

			return (selectPlayButtonState(v43, v38, v44, nil, nil, nil, if not FFlagLuaAppParentUpsellPolicy then nil else u35))
		end),
		playabilityStatus = v38
	}
end
