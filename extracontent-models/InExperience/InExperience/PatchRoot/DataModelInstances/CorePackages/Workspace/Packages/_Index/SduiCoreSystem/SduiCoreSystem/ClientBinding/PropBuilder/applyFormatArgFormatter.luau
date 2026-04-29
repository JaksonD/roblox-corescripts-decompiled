local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local Localization = require(SduiCoreSystemParent.Localization)
local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local LocalizationService = game:GetService("LocalizationService")

local function resolveDateTimeForFormat(p1) -- line: 52
	-- upvalues: resolveDateTimeForFormat (copy)
	if type(p1) == "number" then
		return DateTime.fromUnixTimestamp(p1)
	end

	if type(p1) == "string" then
		local v13 = if type(p1) ~= "number" then if type(p1) ~= "string" then nil else tonumber(p1) else p1

		if v13 ~= nil then
			return DateTime.fromUnixTimestamp(v13)
		end

		local ok, result = pcall(function() -- line: 41
			-- upvalues: p1 (copy)
			return DateTime.fromIsoDate(p1)
		end)

		if ok and result then
			return result
		end

		return nil
	end

	if type(p1) == "table" and p1.seconds ~= nil then
		return resolveDateTimeForFormat(p1.seconds)
	end

	return nil
end

return {
	applyFormatArgFormatter = function(p2, t1: {[any]: any}, s1: string) --[[ applyFormatArgFormatter ]] -- line: 78
		-- upvalues: SduiLogger (copy), SduiErrors (copy), Localization (copy), LocalizationService (copy), resolveDateTimeForFormat (copy)
		if t1.type == "TYPE_INVALID" or t1.type == nil then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = "Formatter specified without a type"
			}, s1)

			return nil
		end

		if t1.type == "TYPE_NUMBER_ABBREVIATE" then
			local v19 = if type(p2) ~= "number" then if type(p2) ~= "string" then nil else tonumber(p2) else p2

			if v19 == nil then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_ABBREVIATE received incompatible type '{ typeof(p2) }'`
				}, s1)

				return nil
			end

			return Localization.NumberLocalization.abbreviate(v19, LocalizationService.RobloxLocaleId)
		end

		if t1.type == "TYPE_NUMBER_LOCALIZE" then
			local v20 = if type(p2) ~= "number" then if type(p2) ~= "string" then nil else tonumber(p2) else p2

			if v20 == nil then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_NUMBER_LOCALIZE received incompatible type '{ typeof(p2) }'`
				}, s1)

				return nil
			end

			return Localization.NumberLocalization.localize(v20, LocalizationService.RobloxLocaleId)
		end

		if t1.type == "TYPE_DATE_FORMAT" then
			local v21 = resolveDateTimeForFormat(p2)

			if v21 == nil then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Formatter TYPE_DATE_FORMAT received incompatible type '{ typeof(p2) }'`
				}, s1)

				return nil
			end

			local config = t1.config

			return v21:FormatLocalTime((not config or (config.type ~= "date_config" or (not config.value.pattern or config.value.pattern == ""))) and "L" or config.value.pattern, LocalizationService.RobloxLocaleId)
		end

		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
			message = `Unknown formatter type '{ t1.type }'`
		}, s1)

		return nil
	end
}
