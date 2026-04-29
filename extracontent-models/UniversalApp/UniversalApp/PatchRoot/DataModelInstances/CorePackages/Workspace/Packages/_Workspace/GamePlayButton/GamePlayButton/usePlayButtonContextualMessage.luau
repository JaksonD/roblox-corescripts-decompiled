local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local LocalizationService = game:GetService("LocalizationService")
local GamePlayButtonParent = GamePlayButton.Parent
local PlayButtonStates = require(GamePlayButton.PlayButtonStates)

require(GamePlayButtonParent.PlayabilityRodux)

local PlayabilityStatusEnum = require(GamePlayButtonParent.DiscoveryTypes).PlayabilityStatusEnum
local getAppFeaturePolicies = require(GamePlayButtonParent.UniversalAppPolicy).getAppFeaturePolicies
local LaunchErrorLocalizationKeys = require(GamePlayButtonParent.GameLaunch).LaunchErrorLocalizationKeys
local Localization = require(GamePlayButtonParent.RobloxAppLocales).Localization
local useSelector = require(GamePlayButtonParent.RoactUtils).Hooks.RoactRodux.useSelector
local useGameInfosSelector = require(GamePlayButtonParent.GameInfosRodux).useGameInfosSelector
local useGameProductInfoSelector = require(GamePlayButtonParent.GameProductInfoRodux).useGameProductInfoSelector
local useAppPolicy = require(GamePlayButtonParent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(GamePlayButtonParent.Localization).Hooks.useLocalization
local ExperienceDetailsNoticeType = require(GamePlayButtonParent.DiscoveryTypes).ExperienceDetailsNoticeType
local FFlagLuaAppPlayabilityMessageUpdate = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppPlayabilityMessageUpdate
local u16 = nil
local s1 = ""

local function v18(p1, p2, p3) -- line: 40
	-- upvalues: PlayabilityStatusEnum (copy), getAppFeaturePolicies (copy), LaunchErrorLocalizationKeys (copy)
	if p2 then
		if p1 == nil or (p2.playabilityStatus == PlayabilityStatusEnum.PurchaseRequired or p2.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseRequired) and (p3 == nil or p3.isForSale == false) then
			return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
		end

		if p2.playabilityStatus == PlayabilityStatusEnum.DeviceRestricted then
			local v25 = getAppFeaturePolicies().getPlatformDisplayName() or ""

			if v25 ~= "" then
				return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", {
					device = v25
				}
			end
		end

		return LaunchErrorLocalizationKeys[p2.playabilityStatus]
	end

	return nil
end

return function(p4, s2: string, p5) -- line: 96
	-- upvalues: useAppPolicy (copy), useSelector (copy), useGameInfosSelector (copy), useGameProductInfoSelector (copy), FFlagLuaAppPlayabilityMessageUpdate (copy), useLocalization (copy), PlayButtonStates (copy), v18 (copy), ExperienceDetailsNoticeType (copy), LocalizationService (copy), u16 (ref), Localization (copy), s1 (ref)
	local v35 = useAppPolicy(function(p6) -- line: 97
		return {
			experienceDetailsNoticeType = p6.getExperienceDetailsNoticeType()
		}
	end)
	local v36 = useSelector(function(p7) -- line: 103
		-- upvalues: p4 (copy)
		return p7.PlayabilityStatus and (not not p7.PlayabilityStatus[p4] and p7.PlayabilityStatus[p4].unplayableDisplayText) or nil
	end)
	local v37 = useSelector(function(p8) -- line: 110
		-- upvalues: p4 (copy)
		return p8.GameDetails[p4]
	end)
	local v38 = useGameInfosSelector(p4)
	local v39 = v37 and v37.rootPlaceId or (v38 and v38.placeId or nil)
	local v40 = useGameProductInfoSelector(p4)

	if FFlagLuaAppPlayabilityMessageUpdate then
		local v41 = useLocalization
		local t1 = {
			agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		}
		local v45

		if s2 == PlayButtonStates.UnplayableOther then
			local v43, v44 = v18(v39, p5, v40)

			if v43 == nil then
				v45 = nil
			elseif v44 then
				v45 = table.clone(v44)
				v45[1] = v43
			else
				v45 = v43
			end
		else
			v45 = nil
		end

		t1.unplayableOtherFallback = v45

		local v46 = v41(t1)

		if (s2 == PlayButtonStates.Playable or s2 == PlayButtonStates.PlayableWithParty or s2 == PlayButtonStates.WaitingForParty) and v35.experienceDetailsNoticeType == ExperienceDetailsNoticeType.InExperiencePurchase then
			return v46.agreeToNotice
		end

		if v36 and v36 ~= "" then
			return v36
		end

		if s2 == PlayButtonStates.UnplayableOther then
			return v46.unplayableOtherFallback
		end

		return nil
	end

	local v47 = nil
	local v48 = nil

	if s2 == PlayButtonStates.UnplayableOther then
		if v36 and v36 ~= "" then
			return v36
		end

		v47, v48 = v18(v39, p5, v40)
	elseif (s2 == PlayButtonStates.Playable or s2 == PlayButtonStates.PlayableWithParty or s2 == PlayButtonStates.WaitingForParty) and v35.experienceDetailsNoticeType == ExperienceDetailsNoticeType.InExperiencePurchase then
		v47 = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
	end

	local v50

	if v47 then
		local RobloxLocaleId = LocalizationService.RobloxLocaleId

		if u16 == nil then
			u16 = Localization.new(RobloxLocaleId)
			s1 = RobloxLocaleId
		end

		if RobloxLocaleId ~= s1 then
			u16:SetLocale(RobloxLocaleId)
			s1 = RobloxLocaleId
		end

		v50 = u16:Format(v47, v48)

		if v50 then
			return v50
		end
	end

	v50 = nil

	return v50
end
