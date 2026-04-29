local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("DataHydration").Parent

require(Parent.Signals)

local createCurrentTimeSignal = require(Parent.SignalsUtils).createCurrentTimeSignal
local ExperienceEventTypes = require(script.Parent.ExperienceEventTypes)
local v5 = game:DefineFastInt("EventStatusCheckIntervalSec", 30)

local function deriveFormattedStartDate(p1, p2) -- line: 38
	-- upvalues: LocalizationService (copy)
	local eventStart = p1.eventStart
	local v24

	if not eventStart then
		v24 = nil
	else
		local ok, result = pcall(DateTime.fromIsoDate, eventStart)

		v24 = if not not ok and result ~= nil then result else nil
	end

	if not v24 then
		return nil
	end

	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local dateTime = DateTime.now()
	local v29 = v24:ToLocalTime()
	local v30 = dateTime:ToLocalTime()
	local v31 = v24:FormatLocalTime(v29.Year == v30.Year and "ddd, MMM DD" or "ll", RobloxLocaleId)
	local v32 = v24:FormatLocalTime("LT", RobloxLocaleId)

	return p2:Format("Feature.VirtualEvents.Label.DateAtTime"):gsub("{date}", v31):gsub("{time}", v32)
end

local EventStatus = ExperienceEventTypes.EventStatus

local function deriveEventStatus(p3, p4) -- line: 61
	-- upvalues: EventStatus (copy), createCurrentTimeSignal (copy), v5 (copy)
	local eventStartTimestamp = p3.eventStartTimestamp

	if not eventStartTimestamp then
		return EventStatus.Upcoming
	end

	local eventEndTimestamp = p3.eventEndTimestamp
	local v37 = createCurrentTimeSignal(v5)(p4)

	if v37 < eventStartTimestamp then
		if eventStartTimestamp - v37 <= 14400 then
			return EventStatus.UpcomingImminent
		end

		return EventStatus.Upcoming
	end

	if eventEndTimestamp and eventEndTimestamp <= v37 then
		return EventStatus.Elapsed
	end

	if eventEndTimestamp and eventEndTimestamp - v37 <= 14400 then
		return EventStatus.ElapsedImminent
	end

	return EventStatus.Ongoing
end

return {
	enrichWithTimestamps = function(p5) --[[ enrichWithTimestamps ]] -- line: 29
		local eventStart = p5.eventStart
		local v14

		if not eventStart then
			v14 = nil
		else
			local ok, result = pcall(DateTime.fromIsoDate, eventStart)

			v14 = if not not ok and result ~= nil then result else nil
		end

		local eventEnd = p5.eventEnd
		local v18

		if not eventEnd then
			v18 = nil
		else
			local ok, result = pcall(DateTime.fromIsoDate, eventEnd)

			v18 = if not not ok and result ~= nil then result else nil
		end

		p5.eventStartTimestamp = if not v14 then nil else v14.UnixTimestamp
		p5.eventEndTimestamp = if not v18 then nil else v18.UnixTimestamp

		return p5
	end,
	calculateDerivedField = function(s1: string, p6, p7, p8) --[[ calculateDerivedField ]] -- line: 90
		-- upvalues: deriveFormattedStartDate (copy), deriveEventStatus (copy), EventStatus (copy)
		if not p6 then
			return nil
		end

		if s1 == "formattedStartDate" then
			return deriveFormattedStartDate(p6, p8)
		end

		if s1 == "eventStatus" then
			return (deriveEventStatus(p6, p7))
		end

		if s1 == "isActive" then
			local v45 = deriveEventStatus(p6, p7)

			return v45 == EventStatus.Ongoing or v45 == EventStatus.ElapsedImminent
		end

		return nil
	end
}
