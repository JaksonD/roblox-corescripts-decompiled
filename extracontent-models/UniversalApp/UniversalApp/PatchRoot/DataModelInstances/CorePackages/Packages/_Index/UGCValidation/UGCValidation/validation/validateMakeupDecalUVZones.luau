local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local function v8(v4, v5, v6) --[[ Line: 14 ]] --[[ Name: createIncludeError ]]
    -- upvalues: v1 (copy)
    local l_assetTypeEnum_0 = v6.assetTypeEnum;
    v1.reportFailure(v1.ErrorType.validateMakeupDecal_UVZoneError, nil, v6);
    return false, {
        string.format("Opague area of ColorMap for %s does not fall within allowed UV area of [%s] and [%s] for asset type %s", v4.Name, tostring(v5.MinBound), tostring(v5.MaxBound), l_assetTypeEnum_0.Name)
    };
end;
local function v13(v9, v10, v11) --[[ Line: 29 ]] --[[ Name: createExcludeError ]]
    -- upvalues: v1 (copy)
    local l_assetTypeEnum_1 = v11.assetTypeEnum;
    v1.reportFailure(v1.ErrorType.validateMakeupDecal_UVZoneError, nil, v11);
    return false, {
        string.format("Opague pixels in ColorMap for %s were found within a restricted UV area of [%s] and [%s] for asset type %s", v9.Name, tostring(v10.MinBound), tostring(v10.MaxBound), l_assetTypeEnum_1.Name)
    };
end;
local function v25(v14, v15, v16, v17, v18, v19) --[[ Line: 44 ]] --[[ Name: validateTextureWithBounds ]]
    -- upvalues: v8 (copy), v13 (copy)
    local v20 = v15:ReadPixelsBuffer(Vector2.new(0, 0), v15.Size);
    local v21 = 0;
    local v22 = v15.Size.Y - 1;
    for v23 = 0, buffer.len(v20) - 1, 4 do
        if v21 == v15.Size.X then
            v21 = 0;
            v22 = v22 - 1;
        end;
        local v24 = buffer.readu8(v20, v23 + 3);
        if v18.isIncludeBound then
            if (v21 < v16.X or v22 < v16.Y or v17.X < v21 or v17.Y < v22) and v24 > 0 then
                return v8(v14, v18, v19);
            end;
        elseif v16.X < v21 and v16.Y < v22 and v21 < v17.X and v22 < v17.Y and v24 > 0 then
            return v13(v14, v18, v19);
        end;
        v21 = v21 + 1;
    end;
    return true;
end;
return function(v26, v27, v28, v29, v30) --[[ Line: 81 ]] --[[ Name: validateMakeupDecalUVZones ]]
    -- upvalues: v3 (copy), v25 (copy)
    local v31 = v28.UVMaxBound - v28.UVMinBound;
    local v32 = v3.new();
    for _, v34 in v29 do
        local v35 = (v34.MinBound - v28.UVMinBound) / v31;
        local v36 = (v34.MaxBound - v28.UVMinBound) / v31;
        local v37 = v35 * v27.Size;
        local v38 = v36 * v27.Size;
        v32:updateReasons(v25(v26, v27, v37, v38, v34, v30));
    end;
    return v32:getFinalResults();
end;