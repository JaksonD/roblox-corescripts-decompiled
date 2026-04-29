local Parent = script:FindFirstAncestor("DiscoverySignalsActionHandlers").Parent
local ActionHandlers = require(Parent.SignalsMiddleware).ActionHandlers
local DataHydration = require(Parent.DataHydration)
local SetPlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.SetPlayabilityStatus

return function(p1) --[[ registerDiscoverySignalsActionHandlers ]] -- line: 10
	-- upvalues: ActionHandlers (copy), SetPlayabilityStatus (copy), DataHydration (copy)
	ActionHandlers.register(p1, SetPlayabilityStatus.name, function(p2) -- line: 11
		-- upvalues: DataHydration (copy)
		local t1 = {}

		for v8, v9 in p2.playabilityStatus do
			t1[tostring(v8)] = {
				isPlayable = v9.isPlayable,
				playabilityStatus = v9.playabilityStatus
			}
		end

		DataHydration.Game.getPlayabilityStore(false).updatePlayabilities(t1)

		return false
	end)
end
