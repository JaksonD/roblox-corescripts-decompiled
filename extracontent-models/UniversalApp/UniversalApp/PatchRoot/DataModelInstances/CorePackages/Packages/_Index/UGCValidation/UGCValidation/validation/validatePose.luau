local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.AssetCalculator);
local v2 = require(l_Parent_0.util.canBeNormalized);
local v3 = require(l_Parent_0.util.prettyPrintVector3);
local v4 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v5 = require(l_Parent_0.util.AssetTraversalUtils);
local _ = require(l_Parent_0.util.Types);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateStraightenLimbsPose);
local v8 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v9 = game:DefineFastInt("UGCValidatePoseDegFromXYPlane", 20);
local v10 = game:DefineFastInt("UGCValidatePoseArmMinDegFromXVectorOnXYPlane", -90);
local v11 = game:DefineFastInt("UGCValidatePoseArmMaxDegFromXVectorOnXYPlane", 30);
local v12 = game:DefineFastInt("UGCValidatePoseLegMinDegFromXVectorOnXYPlane", -93);
local v13 = game:DefineFastInt("UGCValidatePoseLegMaxDegFromXVectorOnXYPlane", -60);
local v14 = game:DefineFastInt("UGCValidatePartDegFromXYPlane", 30);
local v15 = game:DefineFastInt("UGCValidatePartArmMinDegFromXVectorOnXYPlane", -110);
local v16 = game:DefineFastInt("UGCValidatePartArmMaxDegFromXVectorOnXYPlane", 40);
local v17 = game:DefineFastInt("UGCValidatePartLegMinDegFromXVectorOnXYPlane", -93);
local v18 = game:DefineFastInt("UGCValidatePartLegMaxDegFromXVectorOnXYPlane", -60);
local function v26(v19, v20, v21, v22) --[[ Line: 38 ]] --[[ Name: validateAngleFromXYPlane ]]
    -- upvalues: v8 (copy), v7 (copy), v14 (copy), v9 (copy)
    local v23 = v8.new();
    local v24 = math.deg((math.acos((v20:Dot(v21)))));
    local v25 = if v7() and v22 then v14 else v9;
    if v25 < v24 then
        v23:updateReasons(false, {
            string.format("%s is at a %d degree angle from the X,Y plane, it must be within %d degrees. Make sure the character is in I pose, A pose, or T pose", if v7() and v22 then v19.Name .. " (" .. v22 .. ")" else v19.Name, v24, v25)
        });
    end;
    return v23:getFinalResults();
end;
local function v35(v27, v28, v29, v30, v31, v32) --[[ Line: 65 ]] --[[ Name: validateAngleFromWorldXVectorOnXYPlane ]]
    -- upvalues: v8 (copy), v7 (copy), v3 (copy)
    local v33 = math.deg((math.acos((v28:Dot(v29)))));
    if v28.Y <= 0 then
        v33 = -v33;
    end;
    local v34 = v8.new();
    if v33 < v30 or v31 < v33 then
        v34:updateReasons(false, {
            string.format("%s is at a %d angle of the [%s] vector on the X,Y plane, it must be between %d and %d degrees. Make sure the character is in I pose, A pose, or T pose", if v7() and v32 then v27.Name .. " (" .. v32 .. ")" else v27.Name, v33, v3(v29), v30, v31)
        });
    end;
    return v34:getFinalResults();
end;
local function v46(v36, v37, v38) --[[ Line: 95 ]] --[[ Name: validateInternal ]]
    -- upvalues: v2 (copy), v8 (copy), v26 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v35 (copy)
    if not v37 then
        return false, {
            string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", if v38 then v36.Name .. " (" .. v38 .. ")" else v36.Name)
        };
    else
        local v39 = v37.YVector.Unit - Vector3.new(0, 0, 1, 0) * v37.YVector.Unit:Dot((Vector3.new(0, 0, 1, 0)));
        if not v2(v39) then
            return false, {
                string.format("%s is pointing along the world Z vector. Make sure the character is in I pose, A pose, or T pose", if v38 then v36.Name .. " (" .. v38 .. ")" else v36.Name)
            };
        else
            local v40 = -v39.Unit;
            local v41 = -v37.YVector.Unit;
            local v42 = v8.new();
            v42:updateReasons(v26(v36, v40, v41, v38));
            local v43 = if not (v36 ~= Enum.AssetType.RightArm) or v36 == Enum.AssetType.RightLeg then Vector3.new(1, 0, 0, 0) else Vector3.new(-1, -0, -0, -0);
            local v44 = nil;
            local v45 = nil;
            if v38 then
                if v36 == Enum.AssetType.RightArm or v36 == Enum.AssetType.LeftArm then
                    v44 = v15;
                    v45 = v16;
                else
                    v44 = v17;
                    v45 = v18;
                end;
            elseif v36 == Enum.AssetType.RightArm or v36 == Enum.AssetType.LeftArm then
                v44 = v10;
                v45 = v11;
            else
                v44 = v12;
                v45 = v13;
            end;
            v42:updateReasons(v35(v36, v40, v43, v44, v45, v38));
            return v42:getFinalResults();
        end;
    end;
end;
local function v54(v47, v48) --[[ Line: 164 ]] --[[ Name: validateAssetParts ]]
    -- upvalues: v1 (copy), v8 (copy), v4 (copy), v5 (copy), v46 (copy)
    local v49 = v1.calculateAllTransformsForAsset(v47, v48);
    local v50 = v8.new();
    for _, v52 in v4(v47) do
        if v5.getAssetRigChild(v47, v52) then
            local v53 = v1.calculatePartCFrameFromRigAttachments(v47, v48:FindFirstChild(v52), v49[v52]);
            v50:updateReasons(v46(v47, v53, v52));
        end;
    end;
    return v50:getFinalResults();
end;
return function(v55, v56) --[[ Line: 182 ]] --[[ Name: validatePose ]]
    -- upvalues: v1 (copy), v7 (copy), v8 (copy), v46 (copy), v54 (copy), v2 (copy), v26 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v35 (copy)
    local l_assetTypeEnum_0 = v56.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 ~= Enum.AssetType.LeftArm and l_assetTypeEnum_0 ~= Enum.AssetType.RightArm and l_assetTypeEnum_0 ~= Enum.AssetType.LeftLeg and l_assetTypeEnum_0 ~= Enum.AssetType.RightLeg then
        return true;
    else
        local v58 = v1.calculateAssetCFrame(l_assetTypeEnum_0, v55);
        if v7() then
            local v59 = v8.new();
            v59:updateReasons(v46(l_assetTypeEnum_0, v58));
            v59:updateReasons(v54(l_assetTypeEnum_0, v55));
            return v59:getFinalResults();
        elseif not v58 then
            return false, {
                string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", l_assetTypeEnum_0.Name)
            };
        else
            local v60 = v58.YVector.Unit - Vector3.new(0, 0, 1, 0) * v58.YVector.Unit:Dot((Vector3.new(0, 0, 1, 0)));
            if not v2(v60) then
                return false, {
                    string.format("%s is pointing along the world Z vector. Make sure the character is in I pose, A pose, or T pose", l_assetTypeEnum_0.Name)
                };
            else
                local v61 = -v60.Unit;
                local v62 = -v58.YVector.Unit;
                local v63 = v8.new();
                v63:updateReasons(v26(l_assetTypeEnum_0, v61, v62));
                local v64 = if not (l_assetTypeEnum_0 ~= Enum.AssetType.RightArm) or l_assetTypeEnum_0 == Enum.AssetType.RightLeg then Vector3.new(1, 0, 0, 0) else Vector3.new(-1, -0, -0, -0);
                local v65 = nil;
                local v66 = nil;
                if l_assetTypeEnum_0 == Enum.AssetType.RightArm or l_assetTypeEnum_0 == Enum.AssetType.LeftArm then
                    v65 = v10;
                    v66 = v11;
                else
                    v65 = v12;
                    v66 = v13;
                end;
                v63:updateReasons(v35(l_assetTypeEnum_0, v61, v64, v65, v66));
                return v63:getFinalResults();
            end;
        end;
    end;
end;