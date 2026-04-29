local ParentParent = script.Parent.Parent

require(ParentParent.util.Types)

local ValidationEnums = require(ParentParent.validationSystem.ValidationEnums)
local ValidationModuleLoader = require(ParentParent.validationSystem.ValidationModuleLoader)
local FetchAllDesiredData = require(ParentParent.validationSystem.dataFetchModules.FetchAllDesiredData)
local ValidationReporter = require(ParentParent.validationSystem.ValidationReporter)
local getFFlagDebugUGCValidationPrintNewStructureResults = require(ParentParent.flags.getFFlagDebugUGCValidationPrintNewStructureResults)
local ValidationConstants = require(ParentParent.validationSystem.ValidationConstants)
local ErrorSourceStrings = require(ParentParent.validationSystem.ErrorSourceStrings)
local TelemetryService = game:GetService("TelemetryService")

game:DefineFastInt("SingleValidationTelemetryThrottleHundrethsPercent", 10000)

local t1 = {
	eventName = "UgcSingleValidationFinished",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("SingleValidationTelemetryThrottleHundrethsPercent"),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "Report single ugc validation result to EventIngest backend.",
	links = "https://create.roblox.com/docs/art/validation-errors"
}

local function reportSingleResult(s1: string, p1, s2: string, s3: string, n1: number) -- line: 41
	-- upvalues: TelemetryService (copy), t1 (copy)
	local t2 = {
		validationJobId = p1.jobId,
		validationSource = p1.consumerConfig.source,
		validationEnum = s1,
		status = s2,
		durationMs = n1,
		additional_info = s3
	}

	TelemetryService:LogEvent(t1, {
		customFields = t2
	})
end
local function getMissingData(p2, t3: {[any]: any}) -- line: 60
	-- upvalues: FetchAllDesiredData (copy)
	local t4 = {}

	for _, v24 in t3 do
		if p2[v24] == nil or p2[v24] == FetchAllDesiredData.DATA_FETCH_FAILURE then
			table.insert(t4, v24)
		end
	end

	return t4
end
local function checkAqsReturnSchema(p3, p4) -- line: 71
	-- upvalues: checkAqsReturnSchema (copy)
	if typeof(p3) ~= "table" then
		return false
	end

	for v27, v28 in p4 do
		if type(v28) == "table" and not checkAqsReturnSchema(p3[v27], v28) then
			return false
		end

		if type(v28) == "string" and not tonumber(p3[v28]) then
			return false
		end
	end

	return true
end

return function(s4: string, p5, t5: {[any]: any}) --[[ ValidationTestWrapper ]] -- line: 93
	-- upvalues: ValidationModuleLoader (copy), ValidationReporter (copy), ValidationEnums (copy), reportSingleResult (copy), getMissingData (copy), ValidationConstants (copy), ErrorSourceStrings (copy), checkAqsReturnSchema (copy), getFFlagDebugUGCValidationPrintNewStructureResults (copy)
	local v36 = ValidationModuleLoader.getValidationModule(s4)
	local v37 = ValidationReporter.new(s4)

	for _, v39 in v36.prereqTests do
		if t5[v39] ~= ValidationEnums.Status.PASS then
			local v40 = v37:complete()

			reportSingleResult(s4, p5, v40.status, v40.telemetryContext, v40.duration)

			return v40
		end
	end

	local v41 = getMissingData(p5, v36.requiredData)

	if #v41 > 0 then
		v37:err(`Missing required data: { table.concat(v41, ", ") }`)

		local v42 = v37:complete()

		reportSingleResult(s4, p5, v42.status, v42.telemetryContext, v42.duration)

		return v42
	end

	if next(v36.expectedAqsData) ~= nil then
		for v43, _ in v36.expectedAqsData do
			local v45 = p5.aqsSummaryData[v43]
			local v46 = false

			if v45 and v45.Error then
				for _, v48 in v45.Error do
					if v36.knownAqsUserErrors[v48] == nil then
						if table.find(ValidationConstants.AQSInternalErrorEnum, v48) ~= nil and v46 == false then
							v37:fail(ErrorSourceStrings.Keys.AQSInternalError)
							v46 = true

							continue
						end

						v37:err(`Unexpected error enum { v48 }`)

						local v49 = v37:complete()

						reportSingleResult(s4, p5, v49.status, v49.telemetryContext, v49.duration)

						return v49
					end

					v37:fail(v36.knownAqsUserErrors[v48])
				end

				local v50 = v37:complete()

				reportSingleResult(s4, p5, v50.status, v50.telemetryContext, v50.duration)

				return v50
			end
		end

		if false then
			local v51 = v37:complete()

			reportSingleResult(s4, p5, v51.status, v51.telemetryContext, v51.duration)

			return v51
		end

		if not checkAqsReturnSchema(p5.aqsSummaryData, v36.expectedAqsData) then
			v37:err("Missing expected AQS schema")

			local v52 = v37:complete()

			reportSingleResult(s4, p5, v52.status, v52.telemetryContext, v52.duration)

			return v52
		end
	end

	v37:begin()

	if #getMissingData(p5, v36.conditionalData) > 0 then
		local v53 = v37:complete()

		reportSingleResult(s4, p5, v53.status, v53.telemetryContext, v53.duration)

		return v53
	end

	local ok, result = pcall(function() -- line: 162
		-- upvalues: v36 (copy), v37 (copy), p5 (copy)
		v36.run(v37, p5)
	end)

	if not ok then
		if getFFlagDebugUGCValidationPrintNewStructureResults() then
			print("Validation error:", result)
			print("As this is in debug mode, we will re-call the function for a full error trace: ")
			v36.run(v37, p5)
		end

		v37:err(result)
	end

	local v56 = v37:complete()

	reportSingleResult(s4, p5, v56.status, v56.telemetryContext, v56.duration)

	return v56
end
