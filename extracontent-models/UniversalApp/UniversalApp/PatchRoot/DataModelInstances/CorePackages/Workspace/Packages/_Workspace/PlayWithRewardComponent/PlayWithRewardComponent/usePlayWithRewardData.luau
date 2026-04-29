local AdService = game:GetService("AdService")
local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local FetchPlayWithRewardState = require(PlayWithRewardComponent.FetchPlayWithRewardState)
local shouldRenderPlayWithRewardBanner = require(PlayWithRewardComponent.shouldRenderPlayWithRewardBanner)
local PlayWithRewardComponentParent = PlayWithRewardComponent.Parent
local PlayWithRewardState = require(PlayWithRewardComponentParent.PlayWithRewardState)
local React = require(PlayWithRewardComponentParent.React)
local RoactUtils = require(PlayWithRewardComponentParent.RoactUtils)
local SetPlayWithRewardState = PlayWithRewardState.SetPlayWithRewardState
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch

return function(t1: {[any]: any}) --[[ usePlayWithRewardData ]] -- line: 27
	-- upvalues: useSelector (copy), useDispatch (copy), React (copy), FetchPlayWithRewardState (copy), AdService (copy), SetPlayWithRewardState (copy), shouldRenderPlayWithRewardBanner (copy)
	local universeId = t1.universeId
	local shouldFetch = t1.shouldFetch
	local v15 = useSelector(function(p1) -- line: 31
		-- upvalues: universeId (copy)
		if p1.PlayWithRewardState and p1.PlayWithRewardState.universeId == universeId then
			return p1.PlayWithRewardState
		end

		return nil
	end)
	local v16 = useSelector(function(p2) -- line: 37
		return p2.LocalUserId
	end)
	local v17 = useDispatch()
	local onFetchDispatched = t1.onFetchDispatched

	React.useEffect(function() -- line: 43
		-- upvalues: shouldFetch (copy), v16 (copy), v15 (copy), universeId (copy), onFetchDispatched (copy), v17 (copy), FetchPlayWithRewardState (copy), AdService (copy)
		if not shouldFetch then
			return
		end

		local num = tonumber(v16)

		if not num then
			return
		end

		if v15 and v15.universeId == universeId then
			return
		end

		if onFetchDispatched then
			onFetchDispatched()
		end

		v17(FetchPlayWithRewardState(AdService, universeId, num)):catch(function() -- line: 57
		end)
	end, {
		shouldFetch,
		universeId,
		v16,
		v15,
		v17,
		onFetchDispatched
	})
	React.useEffect(function() -- line: 60
		-- upvalues: v17 (copy), SetPlayWithRewardState (copy)
		return function() -- line: 61
			-- upvalues: v17 (copy), SetPlayWithRewardState (copy)
			v17(SetPlayWithRewardState("", "", false, nil))
		end
	end, { v17 })

	local v19 = false

	if v15 then
		local flowId = v15.flowId
		local universeId2 = v15.universeId
		local adData = v15.adData

		v19 = flowId ~= "" and v15.isAdDataExpected or shouldRenderPlayWithRewardBanner(universeId, flowId, universeId2, adData)
	end

	return {
		playWithRewardData = v15,
		showPlayWithReward = v19
	}
end
