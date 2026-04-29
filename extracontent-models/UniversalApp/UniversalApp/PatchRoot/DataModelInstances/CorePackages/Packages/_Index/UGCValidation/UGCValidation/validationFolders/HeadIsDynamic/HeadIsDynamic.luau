local ParentParent = script.Parent.Parent.Parent

require(ParentParent.util.Types)

local ValidationEnums = require(ParentParent.validationSystem.ValidationEnums)
local ErrorSourceStrings = require(ParentParent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidationDynamicHeadMinimumQualityPercent = require(ParentParent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local getFFlagUGCValidationAddGeometryToExports = require(ParentParent.flags.getFFlagUGCValidationAddGeometryToExports)
local t1 = {
	categories = { ValidationEnums.UploadCategory.DYNAMIC_HEAD },
	fflag = require(ParentParent.flags.getFFlagUGCValidateIsDynamicHead),
	shadowFlag = require(ParentParent.flags.getFFlagUGCValidationShadowIsDynamicHead),
	expectedAqsData = {
		Measure_Dynamic_Head = {}
	},
	knownAqsUserErrors = {
		INVALID_LANDMARKS = ErrorSourceStrings.Keys.DynamicHeadCageMisaligned,
		NO_FACS = ErrorSourceStrings.Keys.DynamicHeadNOFACS,
		MISSING_CAGE_INFO = ErrorSourceStrings.Keys.DynamicHeadMISSINGCAGE
	}
}
local t2 = {
	left_eye_close = ErrorSourceStrings.Keys.DynamicHeadLeftEyeNotClose,
	right_eye_close = ErrorSourceStrings.Keys.DynamicHeadRightEyeNotClose,
	mouth_open = ErrorSourceStrings.Keys.DynamicHeadMouthNotOpen,
	is_happy = ErrorSourceStrings.Keys.DynamicHeadHappyNotShown,
	is_sad = ErrorSourceStrings.Keys.DynamicHeadSadNotShown
}

function t1.run(p1, p2) -- line: 33
	-- upvalues: getFFlagUGCValidationAddGeometryToExports (copy), ErrorSourceStrings (copy), t2 (copy), getFIntUGCValidationDynamicHeadMinimumQualityPercent (copy)
	local v10 = if not getFFlagUGCValidationAddGeometryToExports() then p2.aqsSummaryData.Measure_Dynamic_Head.Head else p2.aqsSummaryData.Measure_Dynamic_Head.Head or p2.aqsSummaryData.Measure_Dynamic_Head.Head_Geo

	if v10 == nil then
		p1:fail(ErrorSourceStrings.Keys.AQSInputDataError)

		return
	end

	for v11, v12 in t2 do
		if v10[v11] ~= nil and tonumber(v10[v11]) <= getFIntUGCValidationDynamicHeadMinimumQualityPercent() / 100 then
			p1:fail(v12)
		end
	end
end

return t1
