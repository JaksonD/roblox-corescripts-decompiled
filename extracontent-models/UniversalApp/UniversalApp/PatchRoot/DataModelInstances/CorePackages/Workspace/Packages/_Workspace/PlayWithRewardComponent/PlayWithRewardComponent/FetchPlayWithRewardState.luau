local HttpService = game:GetService("HttpService")
local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local PlayWithRewardTelemetry = require(PlayWithRewardComponent.PlayWithRewardTelemetry)
local PlayWithRewardComponentParent = PlayWithRewardComponent.Parent
local Promise = require(PlayWithRewardComponentParent.Promise)
local Logger = require(PlayWithRewardComponentParent.Loggers).Logger
local mutedError = require(PlayWithRewardComponentParent.Loggers).mutedError
local t = require(PlayWithRewardComponentParent.t)
local IXPServiceWrapper = require(PlayWithRewardComponentParent.IXPServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(PlayWithRewardComponentParent.ExperimentLayers).AppUserLayers
local PlayWithRewardState = require(PlayWithRewardComponentParent.PlayWithRewardState)
local PlayWithRewardAdData = PlayWithRewardState.PlayWithRewardAdData
local SetPlayWithRewardState = PlayWithRewardState.SetPlayWithRewardState
local v14 = game:DefineFastString("LuaAppPlayWithRewardBetaUniverses", "")
local v15 = game:DefineFastString("LuaAppPlayWithRewardBetaIxpVariantKey", "Variant")
local v16 = game:DefineFastString("LuaAppPlayWithRewardBetaIxpTreatmentValue", "Treatment")

local function isUniverseIdInPlayWithRewardBetaAllowList(s1: string, s2: string) -- line: 25
	local v24 = s1:gsub("^%s+", ""):gsub("%s+$", "")

	if v24 == "" or (s2 == "" or s2:find(",", 1, true) ~= nil) then
		return false
	end

	return ("," .. v24 .. ","):find("," .. s2 .. ",", 1, true) ~= nil
end

local v18 = t.interface({
	AdAvailabilityResult = t.userdata,
	ProductId = t.optional(t.string),
	ProductName = t.optional(t.string),
	ProductImageAssetId = t.optional(t.string),
	ExperimentVariantData = t.optional(t.string)
})
local v19 = t.interface({
	IsEligible = t.boolean
})

local function fetchPlayWithRewardStateAsync(p1, s3: string, _: number, s4: string) -- line: 63
	-- upvalues: Logger (copy), PlayWithRewardTelemetry (copy), v18 (copy), mutedError (copy), PlayWithRewardAdData (copy)
	if not p1 then
		Logger:warning(`AdService is not available. Cannot fetch Play with Reward data for universe ID { s3 }.`)

		return nil
	end

	local elapsed = os.clock()

	PlayWithRewardTelemetry.logPlayWithRewardAdRequested(s4, s3)

	local v35 = p1:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(s3), true) or nil

	if v35 == nil then
		Logger:warning(`Could not fetch Play with Reward ad for universe ID { s3 }.`)
		PlayWithRewardTelemetry.logPlayWithRewardAdReceived(s4, s3, false, nil, (os.clock() - elapsed) * 1000)

		return nil
	end

	local v36, v37 = v18(v35)

	if not v36 then
		mutedError(`PlayWithRewardAdData invalid: { tostring(v37) }`)
		PlayWithRewardTelemetry.logPlayWithRewardAdReceived(s4, s3, false, nil, (os.clock() - elapsed) * 1000)

		return nil
	end

	local AdAvailabilityResult = v35.AdAvailabilityResult
	local ProductId = v35.ProductId
	local ProductName = v35.ProductName
	local ProductImageAssetId = v35.ProductImageAssetId
	local ExperimentVariantData = v35.ExperimentVariantData

	PlayWithRewardTelemetry.logPlayWithRewardAdReceived(s4, s3, true, tostring(AdAvailabilityResult), (os.clock() - elapsed) * 1000)

	return PlayWithRewardAdData.new(AdAvailabilityResult, ProductId, ProductName, ProductImageAssetId, ExperimentVariantData)
end
local function shouldShowShimmer(p2, s5: string) -- line: 125
	-- upvalues: Logger (copy), v19 (copy), IXPServiceWrapper (copy), AppUserLayers (copy), v15 (copy), v16 (copy)
	if not p2 then
		Logger:warning(`AdService is not available. Cannot determine whether to show shimmer for universe ID { s5 }.`)

		return false
	end

	local ok, result = pcall(function() -- line: 132
		-- upvalues: p2 (copy)
		return p2:GetUniversalAppAdsEligibility()
	end)

	if not ok or not result then
		return false
	end

	local v47, _ = v19(result)

	if v47 and result.IsEligible then
		local LayerData = IXPServiceWrapper:GetLayerData(AppUserLayers.AdsPlayWithRewardBetaLayer)

		if LayerData and (LayerData[v15] and LayerData[v15] == v16) then
			return true
		end
	end

	return false
end

return function(p3, s6: string, n2: number) --[[ FetchPlayWithRewardState ]] -- line: 152
	-- upvalues: isUniverseIdInPlayWithRewardBetaAllowList (copy), v14 (copy), Promise (copy), HttpService (copy), shouldShowShimmer (copy), SetPlayWithRewardState (copy), fetchPlayWithRewardStateAsync (copy), Logger (copy)
	return function(p4) -- line: 153
		-- upvalues: isUniverseIdInPlayWithRewardBetaAllowList (copy), v14 (copy), s6 (copy), Promise (copy), HttpService (copy), shouldShowShimmer (copy), p3 (copy), SetPlayWithRewardState (copy), fetchPlayWithRewardStateAsync (copy), n2 (copy), Logger (copy)
		if not isUniverseIdInPlayWithRewardBetaAllowList(v14, s6) then
			return Promise.resolve()
		end

		local guid = HttpService:GenerateGUID(false)

		if shouldShowShimmer(p3, s6) then
			p4:dispatch(SetPlayWithRewardState(guid, s6, true, nil))
		end

		return Promise.new(function(p5, p6) -- line: 162
			-- upvalues: fetchPlayWithRewardStateAsync (copy), p3 (copy), s6 (copy), n2 (copy), guid (copy), p4 (copy), SetPlayWithRewardState (copy)
			local ok, result = pcall(function() -- line: 163
				-- upvalues: fetchPlayWithRewardStateAsync (copy), p3 (copy), s6 (copy), n2 (copy), guid (copy)
				return fetchPlayWithRewardStateAsync(p3, s6, n2, guid)
			end)

			if ok and result then
				p4:dispatch(SetPlayWithRewardState(guid, s6, false, result))
				p5()

				return
			end

			p4:dispatch(SetPlayWithRewardState(guid, s6, false, nil))
			p6(result)
		end):catch(function(p7) -- line: 173
			-- upvalues: Logger (copy), s6 (copy)
			Logger:warning(`Promise for fetching Play With Reward data rejected for universe ID { s6 }: { tostring(p7) }`)
		end)
	end
end
