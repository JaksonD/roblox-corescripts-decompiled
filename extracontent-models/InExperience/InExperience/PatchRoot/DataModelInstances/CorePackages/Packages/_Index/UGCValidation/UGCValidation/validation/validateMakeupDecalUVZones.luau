local ParentParent = script.Parent.Parent
local Analytics = require(ParentParent.Analytics)

require(ParentParent.util.Types)

local FailureReasonsAccumulator = require(ParentParent.util.FailureReasonsAccumulator)
local v4 = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local v5 = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)

local function createIncludeError(p1, p2, p3) -- line: 21
	-- upvalues: Analytics (copy)
	local assetTypeEnum = p3.assetTypeEnum

	Analytics.reportFailure(Analytics.ErrorType.validateMakeupDecal_UVZoneError, nil, p3)

	return false, { string.format("Opaque area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", p1.Name, tostring(p2.MinBound), tostring(p2.MaxBound), assetTypeEnum.Name) }
end
local function createExcludeError(p4, p5, p6) -- line: 36
	-- upvalues: Analytics (copy)
	local assetTypeEnum = p6.assetTypeEnum

	Analytics.reportFailure(Analytics.ErrorType.validateMakeupDecal_UVZoneError, nil, p6)

	return false, { string.format("Opaque pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", p4.Name, tostring(p5.MinBound), tostring(p5.MaxBound), assetTypeEnum.Name) }
end
local function validateCoverageOutsideIncludeBounds(p7, p8, vector2: Vector2, vector2_2: Vector2, p9, p10) -- line: 52
	-- upvalues: v4 (copy), createIncludeError (copy)
	local v24 = (vector2_2.X - vector2.X) * (vector2_2.Y - vector2.Y) * v4 / 10000 * 255
	local n1 = 0
	local v26 = p8:ReadPixelsBuffer(Vector2.new(0, 0), p8.Size)
	local n2 = 0
	local v28 = p8.Size.Y - 1

	for i = 0, buffer.len(v26) - 1, 4 do
		if n2 == p8.Size.X then
			n2 = 0
			v28 -= 1
		end

		local v30 = buffer.readu8(v26, i + 3)

		if v30 > 0 and (n2 < vector2.X or v28 < vector2.Y or n2 > vector2_2.X or v28 > vector2_2.Y) then
			n1 += v30
		end

		n2 += 1
	end

	if v24 < n1 then
		return createIncludeError(p7, p9, p10)
	end

	return true
end
local function validateCoverageInsideExcludeBounds(p11, p12, vector2: Vector2, vector2_3: Vector2, p13, p14) -- line: 94
	-- upvalues: v5 (copy), createExcludeError (copy)
	local v37 = (vector2_3.X - vector2.X) * (vector2_3.Y - vector2.Y) * v5 / 10000 * 255
	local n3 = 0
	local v39 = p12:ReadPixelsBuffer(Vector2.new(0, 0), p12.Size)
	local n4 = 0
	local v41 = p12.Size.Y - 1

	for i = 0, buffer.len(v39) - 1, 4 do
		if n4 == p12.Size.X then
			n4 = 0
			v41 -= 1
		end

		local v43 = buffer.readu8(v39, i + 3)

		if v43 > 0 and n4 > vector2.X and v41 > vector2.Y and n4 < vector2_3.X and v41 < vector2_3.Y then
			n3 += v43
		end

		n4 += 1
	end

	if v37 < n3 then
		return createExcludeError(p11, p13, p14)
	end

	return true
end

return function(p15, p16, p17, p18, p19) --[[ validateMakeupDecalUVZones ]] -- line: 135
	-- upvalues: FailureReasonsAccumulator (copy), validateCoverageOutsideIncludeBounds (copy), validateCoverageInsideExcludeBounds (copy)
	local v49 = p17.UVMaxBound - p17.UVMinBound
	local v50 = FailureReasonsAccumulator.new()

	for _, v52 in p18 do
		local v53 = (v52.MinBound - p17.UVMinBound) / v49
		local v54 = (v52.MaxBound - p17.UVMinBound) / v49
		local v55 = v53 * p16.Size
		local v56 = v54 * p16.Size

		if v52.isIncludeBound then
			v50:updateReasons(validateCoverageOutsideIncludeBounds(p15, p16, v55, v56, v52, p19))
		else
			v50:updateReasons(validateCoverageInsideExcludeBounds(p15, p16, v55, v56, v52, p19))
		end
	end

	return v50:getFinalResults()
end
