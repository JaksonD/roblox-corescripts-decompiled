local UGCValidationService = game:GetService("UGCValidationService")
local ParentParent = script.Parent.Parent
local Analytics = require(ParentParent.Analytics)
local FailureReasonsAccumulator = require(ParentParent.util.FailureReasonsAccumulator)
local validateFacsJointBounds = require(ParentParent.validation.validateFacsJointBounds)
local getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds = require(ParentParent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local v7 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local v8 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100
local v9 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100
local getExpectedPartSize = require(ParentParent.util.getExpectedPartSize)

require(ParentParent.util.Types)

local pcallDeferred = require(ParentParent.util.pcallDeferred)
local getEditableMeshFromContext = require(ParentParent.util.getEditableMeshFromContext)
local getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs = require(ParentParent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs)
local t1 = {
	"LeftEyeClosed",
	"EyesLookDown",
	"RightEyeClosed",
	"JawDrop",
	"Pucker",
	"LeftLipCornerPuller",
	"RightLipCornerPuller",
	"ChinRaiser",
	"ChinRaiserUpperLip",
	"LeftCheekRaiser",
	"RightCheekRaiser",
	"LeftInnerBrowRaiser",
	"RightInnerBrowRaiser",
	"LeftLipCornerDown",
	"RightLipCornerDown",
	"LeftLowerLipDepressor",
	"RightLowerLipDepressor"
}

local function downloadFailure(b1: boolean?, s1: string?, p1) -- line: 51
	-- upvalues: Analytics (copy)
	local v21 = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", s1)

	if b1 then
		error(v21)
	end

	Analytics.reportFailure(Analytics.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, p1)

	return false, { v21 }
end
local function validateFacialBounds(p2, p3) -- line: 78
	-- upvalues: pcallDeferred (copy), getExpectedPartSize (copy), getEditableMeshFromContext (copy), UGCValidationService (copy), v7 (copy)
	local isServer = p3.isServer
	local v25, v26 = pcallDeferred(function() -- line: 84
		-- upvalues: getExpectedPartSize (copy), p2 (copy), p3 (copy), getEditableMeshFromContext (copy), UGCValidationService (copy), v7 (copy)
		local v46 = getExpectedPartSize(p2, p3)
		local v47, v48 = getEditableMeshFromContext(p2, "MeshId", p3)

		if not v47 then
			error("Failed to retrieve MeshContent")
		end

		return UGCValidationService:ValidateEditableMeshFacialBounds(v48, v7, v46)
	end, p3)

	if not v25 then
		local v27 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p2:GetFullName())

		if isServer ~= nil and isServer then
			error(v27)
		end

		return false, { v27 }
	end

	if not v26 then
		return false, { string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", p2:GetFullName()) }
	end

	return true
end
local function validateFacialExpressiveness(p4, p5) -- line: 118
	-- upvalues: pcallDeferred (copy), getExpectedPartSize (copy), getEditableMeshFromContext (copy), UGCValidationService (copy), v9 (copy), v8 (copy)
	local isServer = p5.isServer
	local v31, v32 = pcallDeferred(function() -- line: 124
		-- upvalues: getExpectedPartSize (copy), p4 (copy), p5 (copy), getEditableMeshFromContext (copy), UGCValidationService (copy), v9 (copy)
		local v49 = getExpectedPartSize(p4, p5)
		local v50, v51 = getEditableMeshFromContext(p4, "MeshId", p5)

		if not v50 then
			error("Failed to retrieve MeshContent")
		end

		return UGCValidationService:ValidateEditableMeshFacialExpressiveness(v51, v9, v49)
	end, p5)

	if not v31 then
		local v33 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p4:GetFullName())

		if isServer ~= nil and isServer then
			error(v33)
		end

		return false, { v33 }
	end

	if v32 < v8 then
		return false, { string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", p4:GetFullName(), v32, v8) }
	end

	return true
end

return function(p6, p7) --[[ validateDynamicHeadData ]] -- line: 160
	-- upvalues: getEditableMeshFromContext (copy), UGCValidationService (copy), downloadFailure (copy), Analytics (copy), FailureReasonsAccumulator (copy), t1 (copy), validateFacialExpressiveness (copy), getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs (copy), validateFacialBounds (copy), getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds (copy), validateFacsJointBounds (copy)
	local timestamp = tick()
	local isServer = p7.isServer
	local ok, result = pcall(function() -- line: 168
		-- upvalues: getEditableMeshFromContext (copy), p6 (copy), p7 (copy), UGCValidationService (copy)
		local v52, v53 = getEditableMeshFromContext(p6, "MeshId", p7)

		if not v52 then
			error("Failed to retrieve MeshContent")
		end

		return UGCValidationService:ValidateDynamicHeadEditableMesh(v53)
	end)

	if not ok then
		return downloadFailure(isServer, p6.Name, p7)
	end

	if not result then
		Analytics.reportFailure(Analytics.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, p7)

		return false, { string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", p6.Name) }
	end

	local v40 = FailureReasonsAccumulator.new()
	local ok2, result2, v43 = pcall(function() -- line: 199
		-- upvalues: getEditableMeshFromContext (copy), p6 (copy), p7 (copy), UGCValidationService (copy), t1 (copy)
		local v54, v55 = getEditableMeshFromContext(p6, "MeshId", p7)

		if not v54 then
			error("Failed to retrieve MeshContent")
		end

		return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(v55, t1)
	end)

	if not ok2 then
		if string.find(result2, "Download Error") == 1 then
			return downloadFailure(isServer, p6.Name, p7)
		end

		assert(false, result2)
	end

	local v44 = #result2 == 0
	local v45 = #v43 == 0

	if not v44 or not v45 then
		Analytics.reportFailure(Analytics.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, p7)
		v40:updateReasons(v44, { `{ p6.Name }.MeshId ({ p6.MeshId }) is missing FACS controls: { table.concat(result2, ", ") }` })
		v40:updateReasons(v45, { `{ p6.Name }.MeshId ({ p6.MeshId }) has inactive FACS controls: { table.concat(v43, ", ") }` })
	end

	v40:updateReasons(validateFacialExpressiveness(p6, p7))

	if not getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs() then
		v40:updateReasons(validateFacialBounds(p6, p7))
	end

	if getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds() then
		v40:updateReasons(validateFacsJointBounds(p6, p7))
	end

	Analytics.recordScriptTime(script.Name, timestamp, p7)

	return v40:getFinalResults()
end
