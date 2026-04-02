local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = game:DefineFastFlag("ValidateMakeupZonesUseTolerance", false);
local v5 = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100);
local v6 = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200);
local function v11(v7, v8, v9) --[[ Line: 23 ]] --[[ Name: createIncludeError ]]
    -- upvalues: v1 (copy)
    local l_assetTypeEnum_0 = v9.assetTypeEnum;
    v1.reportFailure(v1.ErrorType.validateMakeupDecal_UVZoneError, nil, v9);
    return false, {
        string.format("Opaque area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", v7.Name, tostring(v8.MinBound), tostring(v8.MaxBound), l_assetTypeEnum_0.Name)
    };
end;
local function v16(v12, v13, v14) --[[ Line: 38 ]] --[[ Name: createExcludeError ]]
    -- upvalues: v1 (copy)
    local l_assetTypeEnum_1 = v14.assetTypeEnum;
    v1.reportFailure(v1.ErrorType.validateMakeupDecal_UVZoneError, nil, v14);
    return false, {
        string.format("Opaque pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", v12.Name, tostring(v13.MinBound), tostring(v13.MaxBound), l_assetTypeEnum_1.Name)
    };
end;
local function v28(v17, v18, v19, v20, v21, v22) --[[ Line: 53 ]] --[[ Name: validateTextureWithBounds ]]
    -- upvalues: v11 (copy), v16 (copy)
    local v23 = v18:ReadPixelsBuffer(Vector2.new(0, 0), v18.Size);
    local v24 = 0;
    local v25 = v18.Size.Y - 1;
    for v26 = 0, buffer.len(v23) - 1, 4 do
        if v24 == v18.Size.X then
            v24 = 0;
            v25 = v25 - 1;
        end;
        local v27 = buffer.readu8(v23, v26 + 3);
        if v21.isIncludeBound then
            if (v24 < v19.X or v25 < v19.Y or v20.X < v24 or v20.Y < v25) and v27 > 0 then
                return v11(v17, v21, v22);
            end;
        elseif v19.X < v24 and v19.Y < v25 and v24 < v20.X and v25 < v20.Y and v27 > 0 then
            return v16(v17, v21, v22);
        end;
        v24 = v24 + 1;
    end;
    return true;
end;
local function v42(v29, v30, v31, v32, v33, v34) --[[ Line: 91 ]] --[[ Name: validateCoverageOutsideIncludeBounds ]]
    -- upvalues: v5 (copy), v11 (copy)
    local v35 = (v32.X - v31.X) * (v32.Y - v31.Y) * v5 / 10000 * 255;
    local v36 = 0;
    local v37 = v30:ReadPixelsBuffer(Vector2.new(0, 0), v30.Size);
    local v38 = 0;
    local v39 = v30.Size.Y - 1;
    for v40 = 0, buffer.len(v37) - 1, 4 do
        if v38 == v30.Size.X then
            v38 = 0;
            v39 = v39 - 1;
        end;
        local v41 = buffer.readu8(v37, v40 + 3);
        if v41 > 0 and (v38 < v31.X or v39 < v31.Y or v32.X < v38 or v32.Y < v39) then
            v36 = v36 + v41;
        end;
        v38 = v38 + 1;
    end;
    if v35 < v36 then
        return v11(v29, v33, v34);
    else
        return true;
    end;
end;
local function v56(v43, v44, v45, v46, v47, v48) --[[ Line: 133 ]] --[[ Name: validateCoverageInsideExcludeBounds ]]
    -- upvalues: v6 (copy), v16 (copy)
    local v49 = (v46.X - v45.X) * (v46.Y - v45.Y) * v6 / 10000 * 255;
    local v50 = 0;
    local v51 = v44:ReadPixelsBuffer(Vector2.new(0, 0), v44.Size);
    local v52 = 0;
    local v53 = v44.Size.Y - 1;
    for v54 = 0, buffer.len(v51) - 1, 4 do
        if v52 == v44.Size.X then
            v52 = 0;
            v53 = v53 - 1;
        end;
        local v55 = buffer.readu8(v51, v54 + 3);
        if v55 > 0 and v45.X < v52 and v45.Y < v53 and v52 < v46.X and v53 < v46.Y then
            v50 = v50 + v55;
        end;
        v52 = v52 + 1;
    end;
    if v49 < v50 then
        return v16(v43, v47, v48);
    else
        return true;
    end;
end;
return function(v57, v58, v59, v60, v61) --[[ Line: 174 ]] --[[ Name: validateMakeupDecalUVZones ]]
    -- upvalues: v3 (copy), v4 (copy), v42 (copy), v56 (copy), v28 (copy)
    local v62 = v59.UVMaxBound - v59.UVMinBound;
    local v63 = v3.new();
    for _, v65 in v60 do
        local v66 = (v65.MinBound - v59.UVMinBound) / v62;
        local v67 = (v65.MaxBound - v59.UVMinBound) / v62;
        local v68 = v66 * v58.Size;
        local v69 = v67 * v58.Size;
        if v4 then
            if v65.isIncludeBound then
                v63:updateReasons(v42(v57, v58, v68, v69, v65, v61));
            else
                v63:updateReasons(v56(v57, v58, v68, v69, v65, v61));
            end;
        else
            v63:updateReasons(v28(v57, v58, v68, v69, v65, v61));
        end;
    end;
    return v63:getFinalResults();
end;