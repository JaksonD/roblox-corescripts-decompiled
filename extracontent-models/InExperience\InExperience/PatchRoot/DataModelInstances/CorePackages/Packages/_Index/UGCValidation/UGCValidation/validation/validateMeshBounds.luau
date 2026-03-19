local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateMeshMaxScale);
local v4 = require(l_Parent_0.flags.getFIntUGCValidateMeshCenteringHundredsThreshold);
local v5 = require(l_Parent_0.util.getMeshMinMax);
local v6 = require(l_Parent_0.Analytics);
local v7 = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10);
local v8 = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000);
local v9 = game:DefineFastFlag("RenderBoundsCheckAttachmentOrientation", false);
local function v15(v10, v11, v12) --[[ Line: 19 ]] --[[ Name: pointInBounds ]]
    local v13 = v11:PointToObjectSpace(v10);
    local v14 = false;
    if v13.X >= -v12.X / 2 then
        v14 = false;
        if v13.X <= v12.X / 2 then
            v14 = false;
            if v13.Y >= -v12.Y / 2 then
                v14 = false;
                if v13.Y <= v12.Y / 2 then
                    v14 = false;
                    if v13.Z >= -v12.Z / 2 then
                        v14 = v13.Z <= v12.Z / 2;
                    end;
                end;
            end;
        end;
    end;
    return v14;
end;
local function _(v16, v17) --[[ Line: 29 ]] --[[ Name: isSizeWithinBounds_deprecated ]]
    local v18 = false;
    if v16.Size.X <= v17.X then
        v18 = false;
        if v16.Size.Y <= v17.Y then
            v18 = v16.Size.Z <= v17.Z;
        end;
    end;
    return v18;
end;
local function _(v20, v21, v22) --[[ Line: 33 ]] --[[ Name: isSizeWithinBounds ]]
    local v23 = (v22 * v20.Size):Abs();
    local v24 = false;
    if v23.X <= v21.X then
        v24 = false;
        if v23.Y <= v21.Y then
            v24 = v23.Z <= v21.Z;
        end;
    end;
    return v24;
end;
local function _(v26) --[[ Line: 40 ]] --[[ Name: truncate ]]
    return math.floor(v26 * 100) / 100;
end;
local function v31(v28, v29, v30) --[[ Line: 44 ]] --[[ Name: getErrors ]]
    return {
        string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", v28, v29, math.floor(v30.X * 100) / 100, math.floor(v30.Y * 100) / 100, math.floor(v30.Z * 100) / 100)
    };
end;
return function(v32, v33, v34, v35, v36, v37, v38) --[[ Line: 57 ]] --[[ Name: validateMeshBounds ]]
    -- upvalues: v7 (copy), v3 (copy), v8 (copy), l_UGCValidationService_0 (copy), v6 (copy), v15 (copy), v31 (copy), v9 (copy), v5 (copy), v4 (copy)
    local l_isServer_0 = v38.isServer;
    local l_size_0 = v36.size;
    local v41 = v36.offset or Vector3.new(0, 0, 0, 0);
    local v42 = v32.CFrame * v33.CFrame * CFrame.new(v41);
    if v32.Position.X > 10000 or v32.Position.X < -10000 or v32.Position.Y > 10000 or v32.Position.Y < -10000 or v32.Position.Z > 10000 or v32.Position.Z < -10000 then
        return false, {
            "Position is outside of bounds"
        };
    elseif v42.Position.X > 10000 or v42.Position.X < -10000 or v42.Position.Y > 10000 or v42.Position.Y < -10000 or v42.Position.Z > 10000 or v42.Position.Z < -10000 then
        return false, {
            "Position is outside of bounds"
        };
    elseif v35.X < v7 / 1000 or v35.Y < v7 / 1000 or v35.Z < v7 / 1000 then
        return false, {
            "Mesh scale is too small"
        };
    elseif v3() and (v35.X > v8 / 1000 or v35.Y > v8 / 1000 or v35.Z > v8 / 1000) then
        return false, {
            (("%* mesh scale is too large"):format(v32.Name))
        };
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 110 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v34 (copy)
            return l_UGCValidationService_0:GetEditableMeshVerts(v34.editableMesh);
        end);
        if not l_status_0 then
            v6.reportFailure(v6.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, v38);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v34.fullName));
            end;
            return false, {
                string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v34.fullName)
            };
        else
            for _, v46 in pairs(l_result_0) do
                local v47 = v32.CFrame:PointToWorldSpace(v46 * v35);
                if not v15(v47, v42, l_size_0) then
                    v6.reportFailure(v6.ErrorType.validateMeshBounds_TooLarge, nil, v38);
                    return false, (v31(v34.context, v37, l_size_0));
                end;
            end;
            if v9 then
                local v48 = (v33.CFrame.Rotation * v32.Size):Abs();
                local v49 = false;
                if v48.X <= l_size_0.X then
                    v49 = false;
                    if v48.Y <= l_size_0.Y then
                        v49 = v48.Z <= l_size_0.Z;
                    end;
                end;
                if not v49 then
                    v6.reportFailure(v6.ErrorType.validateMeshBounds_TooLarge, nil, v38);
                    return false, (v31(v32:GetFullName(), v37, l_size_0));
                end;
            else
                local v50 = false;
                if v32.Size.X <= l_size_0.X then
                    v50 = false;
                    if v32.Size.Y <= l_size_0.Y then
                        v50 = v32.Size.Z <= l_size_0.Z;
                    end;
                end;
                if not v50 then
                    v6.reportFailure(v6.ErrorType.validateMeshBounds_TooLarge, nil, v38);
                    return false, (v31(v32:GetFullName(), v37, l_size_0));
                end;
            end;
            local v51 = table.clone(v34);
            v51.scale = v35;
            local v52, v53, v54, v55 = v5(v51, v38);
            if not v52 then
                return false, v53;
            else
                if not v38.allowEditableInstances then
                    local v56 = (v54 + v55) / 2;
                    if v4() / 100 < v56.Magnitude then
                        v6.reportFailure(v6.ErrorType.validateMeshBounds_Shifted, nil, v38);
                        return false, {
                            (("%*.%* has mesh data that is not centered. Please reimport this mesh with the roblox 3d importer, and ensure there is no loose geometry in the source file."):format(v34.fullName, v34.fieldName))
                        };
                    end;
                end;
                return true;
            end;
        end;
    end;
end;