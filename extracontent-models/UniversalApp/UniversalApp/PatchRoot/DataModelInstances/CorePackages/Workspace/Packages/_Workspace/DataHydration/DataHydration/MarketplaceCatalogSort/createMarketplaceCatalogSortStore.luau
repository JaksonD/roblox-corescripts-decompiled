local DataHydration = script:FindFirstAncestor("DataHydration")
local DataHydrationParent = DataHydration.Parent
local Promise = require(DataHydrationParent.Promise)
local Signals = require(DataHydrationParent.Signals)
local SharedFlags = require(DataHydrationParent.SharedFlags)
local createDataCache = require(DataHydration.createDataCache)
local createDataResolver = require(DataHydration.createDataResolver)

require(DataHydration.DataHydrationTypes)
require(script.Parent.MarketplaceCatalogSortStoreTypes)

local FFlagMarketplaceCatalogSortTrackLastReceived = SharedFlags.FFlagMarketplaceCatalogSortTrackLastReceived

return function() --[[ createMarketplaceCatalogSortStore ]] -- line: 22
	-- upvalues: createDataCache (copy), createDataResolver (copy), Promise (copy), FFlagMarketplaceCatalogSortTrackLastReceived (copy), Signals (copy)
	local v9 = createDataCache()
	local v10 = createDataResolver({
		cache = v9,
		fetchFn = function(_: {[any]: any}) --[[ fetchFn ]] -- line: 26
			-- upvalues: Promise (copy)
			return Promise.resolve({})
		end
	})
	local v11 = nil
	local u12 = nil

	if FFlagMarketplaceCatalogSortTrackLastReceived then
		local v13

		v11, v13 = Signals.createSignal({})
		u12 = v13
	end

	return {
		getMarketplaceCatalogSort = v10.getCachedItem,
		getMarketplaceCatalogSorts = v10.getCachedItems,
		updateMarketplaceCatalogSorts = if not FFlagMarketplaceCatalogSortTrackLastReceived then v9.updateItems else function(t2: {[any]: any}) --[[ updateMarketplaceCatalogSorts ]] -- line: 41
			-- upvalues: u12 (ref), v9 (copy)
			u12(t2)
			v9.updateItems(t2)
		end,
		updateMarketplaceCatalogSort = v9.updateItem,
		getLastReceivedSorts = v11,
		clear = if not FFlagMarketplaceCatalogSortTrackLastReceived then v10.clear else function() --[[ clear ]] -- line: 51
			-- upvalues: u12 (ref), v10 (copy)
			if u12 then
				u12({})
			end

			v10.clear()
		end,
		dispose = v10.dispose
	}
end
