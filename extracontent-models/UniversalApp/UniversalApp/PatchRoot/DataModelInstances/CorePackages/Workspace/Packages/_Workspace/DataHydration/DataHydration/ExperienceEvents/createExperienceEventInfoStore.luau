local DataHydration = script:FindFirstAncestor("DataHydration")
local DataHydrationParent = DataHydration.Parent
local Promise = require(DataHydrationParent.Promise)
local createDataCache = require(DataHydration.createDataCache)

require(DataHydration.DataHydrationTypes)

local ExperienceEventTypes = require(script.Parent.ExperienceEventTypes)
local ExperienceEventDerivedFields = require(script.Parent.ExperienceEventDerivedFields)
local ExperienceEventsUrlBuilder = require(script.Parent.ExperienceEventsUrlBuilder)
local createDataResolver = require(DataHydration.createDataResolver)
local DiscoveryUtils = require(DataHydrationParent.DiscoveryUtils)
local DiscoveryEventErrorLogger = DiscoveryUtils.DiscoveryEventErrorLogger
local logResponseError = DiscoveryUtils.logResponseError
local updateEventRsvp = require(script.Parent.updateEventRsvp)
local SharedFlags = require(DataHydrationParent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlags.FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = SharedFlags.FFlagSduiEventDetailsSupport

return function() --[[ createExperienceEventInfoStore ]] -- line: 30
	-- upvalues: createDataCache (copy), createDataResolver (copy), Promise (copy), ExperienceEventDerivedFields (copy), ExperienceEventTypes (copy), updateEventRsvp (copy), logResponseError (copy), ExperienceEventsUrlBuilder (copy), DiscoveryEventErrorLogger (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy)
	local v16 = createDataCache()
	local v17 = createDataResolver({
		cache = v16,
		supportsMultiGet = false,
		fetchFn = function(_: {[any]: any}) --[[ fetchFn ]] -- line: 35
			-- upvalues: Promise (copy)
			return Promise.resolve({})
		end
	})

	return {
		getExperienceEventInfo = v17.getCachedItem,
		getExperienceEventInfos = v17.getCachedItems,
		updateExperienceEventInfo = v16.updateItem,
		updateExperienceEventInfos = if not FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport then v16.updateItems else function(t2: {[any]: any}) --[[ updateExperienceEventInfos ]] -- line: 44
			-- upvalues: ExperienceEventDerivedFields (copy), v16 (copy)
			for v20, v21 in t2 do
				t2[v20] = ExperienceEventDerivedFields.enrichWithTimestamps(v21)
			end

			v16.updateItems(t2)
		end,
		calculateDerivedField = if not FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport then nil else ExperienceEventDerivedFields.calculateDerivedField,
		patchRsvpStatus = function(s1: string, b1: boolean) --[[ patchRsvpStatus ]] -- line: 51
			-- upvalues: v17 (copy), ExperienceEventTypes (copy), updateEventRsvp (copy), v16 (copy), logResponseError (copy), ExperienceEventsUrlBuilder (copy), DiscoveryEventErrorLogger (copy)
			local v24 = v17.getCachedItem(s1).data()
			local v25 = if not b1 then ExperienceEventTypes.EventRsvpTypes.NotGoing else ExperienceEventTypes.EventRsvpTypes.Going

			updateEventRsvp(s1, v25):andThen(function() -- line: 60
				-- upvalues: v24 (copy), b1 (copy), v16 (copy), s1 (copy)
				if v24 then
					local v26 = v24.rsvpCount or 0
					local t3 = {
						id = v24.id,
						title = v24.title,
						subtitle = v24.subtitle,
						eventStart = v24.eventStart,
						eventEnd = v24.eventEnd,
						userRsvp = b1,
						mediaAssetId = v24.mediaAssetId,
						description = v24.description,
						rsvpCount = v26 + (not b1 and -1 or 1)
					}

					v16.updateItem(s1, t3)
				end
			end):catch(function(p1) -- line: 77
				-- upvalues: v24 (copy), v16 (copy), s1 (copy), logResponseError (copy), ExperienceEventsUrlBuilder (copy), DiscoveryEventErrorLogger (copy), b1 (copy)
				if v24 then
					v16.updateItem(s1, v24)
				end

				local v29 = if type(p1) ~= "table" or not p1.StatusCode then nil else p1.StatusCode
				local v30 = if type(p1) ~= "table" or not p1.StatusMessage then if type(p1) ~= "string" then nil else p1 else p1.StatusMessage

				logResponseError(ExperienceEventsUrlBuilder.RSVP_UPDATE_URL, {
					StatusCode = v29
				})
				DiscoveryEventErrorLogger.reportError("patchRsvpStatus", "Error updating event RSVP", {
					eventId = s1,
					isRsvpGoing = b1,
					statusCode = v29,
					statusMessage = v30
				})
			end)
		end,
		clear = v17.clear,
		dispose = v17.dispose
	}
end
