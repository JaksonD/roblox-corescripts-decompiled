local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local v3 = game:DefineFastString("SquadQuickStartExperimentLayer", "Party.Formation.Create.User")
local v4 = game:DefineFastString("SquadEnablePartyQuickStartVariant", "enablePartyQuickStartChanges")
local v5 = game:DefineFastFlag("EnablePartyQuickStartChanges2", false)
local v6 = game:DefineFastFlag("PartyFormationCreateUserExposureEnabled", false)

return {
	getPartyQuickStartChangesEnabled = function() --[[ getPartyQuickStartChangesEnabled ]] -- line: 25
		-- upvalues: v5 (copy), v4 (copy), ExperimentCacheManager (copy), v3 (copy)
		local v9 = v5

		if not v9 then
			local v10 = v4
			local v11 = ExperimentCacheManager.default:getLayerVariables(v3)

			if v11 and v11[v10] ~= nil then
				return v11[v10]
			end

			v9 = false
		end

		return v9
	end,
	logExposure = function() --[[ logExposure ]] -- line: 29
		-- upvalues: v6 (copy), ExperimentCacheManager (copy), v3 (copy)
		if v6 and ExperimentCacheManager.default:getLayerVariables(v3) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(v3)
		end
	end,
	isLogExposureEnabled = v6
}
