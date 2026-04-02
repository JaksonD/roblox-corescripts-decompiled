local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.tryYield);
local v4 = require(l_Parent_0.util.getEditableMeshFromContext);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.util.BoundsCalculator);
local v7 = require(l_Parent_0.util.RasterUtil);
local v8 = require(l_Parent_0.util.TransparencyUtil);
local v9 = require(l_Parent_0.util.getExpectedPartSize);
local v10 = require(l_Parent_0.ConstantsTransparencyValidation);
local function v11() --[[ Line: 26 ]] --[[ Name: getViews ]]
    -- upvalues: v10 (copy)
    return {
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, 1, 0), 
            viewId = v10.CAMERA_ANGLES.Front
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, -1, 0), 
            viewId = v10.CAMERA_ANGLES.Back
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(-1, 0, 0, 0), 
            viewId = v10.CAMERA_ANGLES.Left
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(1, 0, 0, 0), 
            viewId = v10.CAMERA_ANGLES.Right
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, -1, 0, 0), 
            viewId = v10.CAMERA_ANGLES.Top
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, 1, 0, 0), 
            viewId = v10.CAMERA_ANGLES.Bottom
        }
    };
end;
local function _(v12, v13) --[[ Line: 67 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v10 (copy)
    if v13 == v10.CAMERA_ANGLES.Front or v13 == v10.CAMERA_ANGLES.Back then
        return v12.X / v12.Y;
    elseif v13 == v10.CAMERA_ANGLES.Left or v13 == v10.CAMERA_ANGLES.Right then
        return v12.Z / v12.Y;
    else
        return v12.X / v12.Z;
    end;
end;
local function v22(v15, v16) --[[ Line: 84 ]] --[[ Name: getScaleFactor ]]
    -- upvalues: v10 (copy)
    local v17 = if not (v16 ~= v10.CAMERA_ANGLES.Front) or v16 == v10.CAMERA_ANGLES.Back then v15.X / v15.Y else if not (v16 ~= v10.CAMERA_ANGLES.Left) or v16 == v10.CAMERA_ANGLES.Right then v15.Z / v15.Y else v15.X / v15.Z;
    local v18 = nil;
    local v19 = nil;
    if v17 > 1 then
        v19 = v10.ASSET_TRANSPARENCY_RASTER_SIZE / v17;
        v18 = v10.ASSET_TRANSPARENCY_RASTER_SIZE;
    elseif v17 < 1 then
        v18 = v10.ASSET_TRANSPARENCY_RASTER_SIZE * v17;
        v19 = v10.ASSET_TRANSPARENCY_RASTER_SIZE;
    else
        v18 = v10.ASSET_TRANSPARENCY_RASTER_SIZE;
        v19 = v10.ASSET_TRANSPARENCY_RASTER_SIZE;
    end;
    local v20 = Vector2.new(v18 / v10.ASSET_TRANSPARENCY_RASTER_SIZE, v19 / v10.ASSET_TRANSPARENCY_RASTER_SIZE);
    local v21 = math.max(v20.X, v20.Y);
    if v21 > 1 then
        return v20 / v21;
    else
        return v20;
    end;
end;
local function v37(v23, v24, v25, v26, v27) --[[ Line: 111 ]] --[[ Name: addTransformedTriangle ]]
    -- upvalues: v8 (copy)
    local v28 = {
        orderedVerts = {}
    };
    local l_v23_FaceVertices_0 = v23:GetFaceVertices(v25);
    local l_v23_Position_0 = v23:GetPosition(l_v23_FaceVertices_0[1]);
    local l_v23_Position_1 = v23:GetPosition(l_v23_FaceVertices_0[2]);
    local l_v23_Position_2 = v23:GetPosition(l_v23_FaceVertices_0[3]);
    local v33, v34, v35, v36 = v8.transformTriangleToWorld(l_v23_Position_0, l_v23_Position_1, l_v23_Position_2, v26, v27);
    table.insert(v28.orderedVerts, v33);
    table.insert(v28.orderedVerts, v34);
    table.insert(v28.orderedVerts, v35);
    v28.normal = v36;
    table.insert(v24, v28);
    return v28;
end;
local function v49(v38, v39) --[[ Line: 140 ]] --[[ Name: updateMinMaxBounds ]]
    local l_X_0 = v38.min.X;
    local l_X_1 = v38.max.X;
    local l_Y_0 = v38.min.Y;
    local l_Y_1 = v38.max.Y;
    local l_Z_0 = v38.min.Z;
    local l_Z_1 = v38.max.Z;
    local v46 = v39.orderedVerts[1];
    local v47 = v39.orderedVerts[2];
    local v48 = v39.orderedVerts[3];
    l_X_0 = math.min(v46.X, v47.X, v48.X, l_X_0);
    l_X_1 = math.max(v46.X, v47.X, v48.X, l_X_1);
    l_Y_0 = math.min(v46.Y, v47.Y, v48.Y, l_Y_0);
    l_Y_1 = math.max(v46.Y, v47.Y, v48.Y, l_Y_1);
    l_Z_0 = math.min(v46.Z, v47.Z, v48.Z, l_Z_0);
    l_Z_1 = math.max(v46.Z, v47.Z, v48.Z, l_Z_1);
    v38.min = Vector3.new(l_X_0, l_Y_0, l_Z_0);
    v38.max = Vector3.new(l_X_1, l_Y_1, l_Z_1);
end;
local function v59(v50, v51, v52, v53, v54, v55) --[[ Line: 163 ]] --[[ Name: getCombinedMeshData ]]
    -- upvalues: v37 (copy), v49 (copy), v3 (copy)
    for _, v57 in (v50:GetFaces()) do
        local v58 = v37(v50, v51, v57, v52, v54);
        v49(v53, v58);
        v3(v55);
    end;
end;
local function v68(v60) --[[ Line: 179 ]] --[[ Name: getOpacity ]]
    local v61 = v60:ReadPixelsBuffer(Vector2.new(0, 0), v60.Size);
    local v62 = 0;
    local v63 = 0;
    for v64 = 0, buffer.len(v61) - 1, 4 do
        local v65 = buffer.readu8(v61, v64);
        local v66 = buffer.readu8(v61, v64 + 1);
        local v67 = buffer.readu8(v61, v64 + 2);
        if v65 == 0 and v66 == 0 and v67 == 0 then
            v63 = v63 + 1;
        end;
        v62 = v62 + 1;
    end;
    if v62 == 0 then
        return false, 0;
    else
        return true, 1 - v63 / v62;
    end;
end;
local function v73(v69) --[[ Line: 202 ]] --[[ Name: checkPartsTransparency ]]
    local v70 = {};
    for _, v72 in v69 do
        if v72.Transparency ~= 0 then
            table.insert(v70, v72.Name);
        end;
    end;
    if #v70 > 0 then
        return false, {
            string.format("The following parts have a non-zero transparency: %s. Part transparency should always be exactly zero.", table.concat(v70, ", "))
        };
    else
        return true, {};
    end;
end;
return function(v74, v75) --[[ Line: 223 ]] --[[ Name: validateAssetTransparency ]]
    -- upvalues: v73 (copy), v6 (copy), v4 (copy), v9 (copy), v59 (copy), v5 (copy), v11 (copy), v10 (copy), v22 (copy), v7 (copy), v68 (copy), v1 (copy)
    local l_assetTypeEnum_0 = v75.assetTypeEnum;
    local v77 = {};
    if v74:IsA("MeshPart") and v75.assetTypeEnum == Enum.AssetType.DynamicHead then
        table.insert(v77, v74);
    else
        assert(v74:IsA("Folder") and v75.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", v74:GetFullName()));
        for _, v79 in v74:GetChildren() do
            assert(v79:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", v74:GetFullName()));
            table.insert(v77, v79);
        end;
    end;
    local v80, v81 = v73(v77);
    if not v80 then
        return false, v81;
    else
        local v82, v83, v84 = v6.calculateIndividualAssetPartsData(v74, v75);
        if not v82 then
            return false, v83;
        else
            local v85 = {};
            local v86 = {
                min = Vector3.new(1e999, 1e999, 1e999, 0), 
                max = Vector3.new(-1e999, -1e999, -1e999, 0)
            };
            for _, v88 in v77 do
                local v89, v90 = v4(v88, "MeshId", v75);
                if not v89 then
                    return false, {
                        string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v88.Name)
                    };
                else
                    v90:Triangulate();
                    local v91 = v9(v88, v75) / v9(v88, v75, true);
                    v59(v90, v85, v84[v88.Name].cframe, v86, v91, v75);
                end;
            end;
            if (v86.max - v86.min).Magnitude == 0 then
                return false, {
                    string.format("Meshes %s should not have zero size", l_assetTypeEnum_0.Name)
                };
            else
                local v92 = v5.new();
                for _, v94 in (v11()) do
                    if #v85 == 0 then
                        v92:updateReasons(false, {
                            string.format("Mesh for %s has no triangles.", l_assetTypeEnum_0.Name)
                        });
                    else
                        local v95 = v86.max - v86.min;
                        local v96 = v86.min + v95 / 2;
                        local v97 = Vector2.new(v10.ASSET_TRANSPARENCY_RASTER_SIZE, v10.ASSET_TRANSPARENCY_RASTER_SIZE) * v22(v95, v94.viewId);
                        local v98 = v7.rasterMesh(v85, v97, v94, v96, v95, v75);
                        local v99 = v10.ASSET_TRANSPARENCY_THRESHOLDS[l_assetTypeEnum_0][v94.viewId];
                        local v100, v101 = v68(v98);
                        if not v100 then
                            v92:updateReasons(false, {
                                string.format("Mesh for %s is completely invisible.", l_assetTypeEnum_0.Name)
                            });
                            v98:Destroy();
                        else
                            if v101 < v99 then
                                v92:updateReasons(false, {
                                    string.format("%s is not opaque enough from the %s. Opacity is %.2f but needs to be above %.2f.", l_assetTypeEnum_0.Name, v94.viewId, v101, v99)
                                });
                            end;
                            v98:Destroy();
                        end;
                    end;
                end;
                if not v92:getFinalResults() then
                    v1.reportFailure(v1.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, v75);
                end;
                return v92:getFinalResults();
            end;
        end;
    end;
end;