local DataHydration = script:FindFirstAncestor("DataHydration")
local DataHydrationParent = DataHydration.Parent
local Dash = require(DataHydrationParent.Dash)
local createDataCache = require(DataHydration.createDataCache)
local createDataResolver = require(DataHydration.createDataResolver)

require(DataHydration.DataHydrationTypes)

local fetchPlayability = require(script.Parent.fetchPlayability)
local PlayabilityStoreTypes = require(script.Parent.PlayabilityStoreTypes)
local DiscoveryUtils = require(DataHydrationParent.DiscoveryUtils)
local logResponseError = DiscoveryUtils.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtils.DiscoveryEventErrorLogger
local v11 = require(DataHydrationParent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds()

return function() --[[ createPlayabilityStore ]] -- line: 23
	-- upvalues: createDataCache (copy), v11 (copy), createDataResolver (copy), logResponseError (copy), DiscoveryEventErrorLogger (copy), Dash (copy), fetchPlayability (copy), PlayabilityStoreTypes (copy)
	local v12 = createDataCache(v11)
	local v13 = createDataResolver({
		cache = v12,
		logError = function(p1) --[[ logError ]] -- line: 28
			-- upvalues: logResponseError (copy), DiscoveryEventErrorLogger (copy)
			if type(p1) == "table" then
				if p1.responseCode then
					logResponseError("v1/games/multiget-playability-status", {
						StatusCode = tonumber(p1.responseCode)
					})
				end

				if p1.errorType and p1.errorMessage then
					DiscoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)

					return
				end
			else
				DiscoveryEventErrorLogger.reportError("FetchPlayabilityError", (tostring(p1)))
			end
		end,
		fetchFn = function(t1: {[any]: any}) --[[ fetchFn ]] -- line: 48
			-- upvalues: Dash (copy), fetchPlayability (copy), PlayabilityStoreTypes (copy)
			local v16 = Dash.keys(t1)

			return fetchPlayability(v16):andThen(function(p2) -- line: 53
				-- upvalues: v16 (copy), PlayabilityStoreTypes (copy)
				if not p2 or not p2.responseBody then
					error({
						responseCode = p2 and p2.responseCode,
						errorType = "FetchPlayabilityResponseError",
						errorMessage = not p2 and "No response" or "Missing response body",
						customFields = {
							universeIds = v16
						}
					})
				end

				local v18, v19 = PlayabilityStoreTypes.playabilityResponseValidator(p2.responseBody)

				if not v18 then
					error({
						responseCode = p2.responseCode,
						errorType = "FetchPlayabilityResponseInvalidInterface",
						errorMessage = v19,
						customFields = {
							universeIds = v16
						}
					})
				end

				local t2 = {}

				for _, v22 in p2.responseBody do
					t2[tostring(v22.universeId)] = {
						isPlayable = v22.isPlayable,
						playabilityStatus = v22.playabilityStatus
					}
				end

				return t2
			end):catch(function(p3) -- line: 85
				error(p3)
			end)
		end
	})

	return {
		fetchPlayability = v13.fetchItem,
		getPlayability = v13.getCachedItem,
		getAndFetchPlayability = v13.getAndFetchItem,
		updatePlayability = v12.updateItem,
		updatePlayabilities = v12.updateItems,
		clear = v13.clear,
		dispose = v13.dispose
	}
end
