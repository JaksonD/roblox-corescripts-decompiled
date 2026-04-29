local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local CoreScriptsRoactCommonParent = CoreScriptsRoactCommon.Parent
local DataHydration = require(CoreScriptsRoactCommonParent.DataHydration)
local Signals = require(CoreScriptsRoactCommonParent.Signals)
local SignalsReact = require(CoreScriptsRoactCommonParent.SignalsReact)
local React = require(CoreScriptsRoactCommonParent.React)
local Traversal = CoreScriptsRoactCommon.Traversal
local default = require(Traversal.LocalTraversalHistory).default
local getGameInfoStore = DataHydration.Game.getGameInfoStore
local getVotesStore = DataHydration.Game.getVotesStore

local function getNMostRecentUniqueUniverseIds(t1: {[any]: any}, _: number?) -- line: 24
	local t2 = {}
	local t3 = {}

	for _, v17 in t1 do
		if not t3[v17] then
			t3[v17] = true
			table.insert(t2, v17)
		end
	end

	return t2
end

return function(n2: number?) --[[ useHistoryItems ]] -- line: 47
	-- upvalues: React (copy), Signals (copy), default (copy), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy), SignalsReact (copy)
	local v21 = n2 or 2
	local v22 = React.useMemo(function() -- line: 49
		-- upvalues: Signals (copy), default (copy), v21 (copy), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
		return (Signals.createComputed(function(p1) -- line: 50
			-- upvalues: default (copy), v21 (copy), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
			local t4 = {}
			local v25 = default:getUniverseHistorySignal(v21)(p1)
			local v26 = getNMostRecentUniqueUniverseIds(v25, v21)
			local v27 = getGameInfoStore(p1).getAndFetchGameInfos(v26)
			local v28 = getVotesStore(p1).getAndFetchVotes(v26)

			for _, v30 in v26 do
				local v31 = if not v27[v30] or not v27[v30].data then nil else v27[v30].data(p1)
				local v32 = if not v28[v30] or not v28[v30].data then nil else v28[v30].data(p1)

				if v31 and v32 then
					table.insert(t4, {
						name = v31.name,
						placeId = tonumber(v31.rootPlaceId),
						universeId = tonumber(v31.universeId),
						rating = v32.rating
					})
				end
			end

			return t4
		end))
	end, {
		v21,
		getGameInfoStore,
		getVotesStore
	})

	return (SignalsReact.useSignalState(v22))
end
