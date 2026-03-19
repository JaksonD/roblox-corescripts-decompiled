local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.tryYield);
local v5 = require(l_Parent_0.util.getEditableMeshFromContext);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.BoundsCalculator);
local v8 = require(l_Parent_0.util.RasterUtil);
local v9 = require(l_Parent_0.util.TransparencyUtil);
local v10 = require(l_Parent_0.util.getExpectedPartSize);
local v11 = require(l_Parent_0.util.SummedAreaTable);
local v12 = require(l_Parent_0.ConstantsTransparencyValidation);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateMinBoundsVisibility);
local function v14() --[[ Line: 33 ]] --[[ Name: getViews ]]
    -- upvalues: v12 (copy)
    return {
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, 1, 0), 
            viewId = v12.CAMERA_ANGLES.Front
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, -1, 0), 
            viewId = v12.CAMERA_ANGLES.Back
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(-1, 0, 0, 0), 
            viewId = v12.CAMERA_ANGLES.Left
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(1, 0, 0, 0), 
            viewId = v12.CAMERA_ANGLES.Right
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, -1, 0, 0), 
            viewId = v12.CAMERA_ANGLES.Top
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, 1, 0, 0), 
            viewId = v12.CAMERA_ANGLES.Bottom
        }
    };
end;
local function _(v15) --[[ Line: 74 ]] --[[ Name: getAvatarPartScaleType ]]
    -- upvalues: v3 (copy)
    local v16 = nil;
    local l_v15_FirstChild_0 = v15:FindFirstChild("AvatarPartScaleType", true);
    if l_v15_FirstChild_0 and l_v15_FirstChild_0:IsA("StringValue") and v3.AvatarPartScaleTypes[l_v15_FirstChild_0.Value] then
        v16 = l_v15_FirstChild_0.Value;
    end;
    return v16;
end;
local function _(v19, v20) --[[ Line: 86 ]] --[[ Name: getAssetTypeMinSize ]]
    -- upvalues: v3 (copy)
    local v21 = nil;
    local l_v19_FirstChild_0 = v19:FindFirstChild("AvatarPartScaleType", true);
    if l_v19_FirstChild_0 and l_v19_FirstChild_0:IsA("StringValue") and v3.AvatarPartScaleTypes[l_v19_FirstChild_0.Value] then
        v21 = l_v19_FirstChild_0.Value;
    end;
    local l_v21_0 = v21;
    if not l_v21_0 then
        return nil;
    else
        return v3.ASSET_TYPE_INFO[v20].bounds[l_v21_0].minSize;
    end;
end;
local function _(v25, v26) --[[ Line: 94 ]] --[[ Name: getBoundingBoxFace ]]
    local v27 = CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v26.axis1, v26.axis2, v26.normal:Abs()) * v25;
    return Vector2.new(v27.X, v27.Y);
end;
local function _(v29, v30) --[[ Line: 100 ]] --[[ Name: calculateTargetPixelsPerStud ]]
    -- upvalues: v12 (copy)
    local v31 = v29.X * v29.Y;
    local v32 = math.sqrt(v12.AREA_OF_INTEREST_TARGET_PIXELS / v31);
    local v33 = math.max(v30.X, v30.Y);
    return (math.min(v32, v12.ASSET_TRANSPARENCY_MAX_RASTER_SIZE / v33));
end;
local function _(v35, v36) --[[ Line: 111 ]] --[[ Name: rasterSizeFromViewSpaceSize ]]
    local v37 = v36 * v35;
    return Vector2.new(math.floor(v37.X + 0.001), (math.floor(v37.Y + 0.001)));
end;
local function _(v39, v40) --[[ Line: 119 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v12 (copy)
    if v40 == v12.CAMERA_ANGLES.Front or v40 == v12.CAMERA_ANGLES.Back then
        return v39.X / v39.Y;
    elseif v40 == v12.CAMERA_ANGLES.Left or v40 == v12.CAMERA_ANGLES.Right then
        return v39.Z / v39.Y;
    else
        return v39.X / v39.Z;
    end;
end;
local function v49(v42, v43) --[[ Line: 137 ]] --[[ Name: getScaleFactor ]]
    -- upvalues: v12 (copy)
    local v44 = if not (v43 ~= v12.CAMERA_ANGLES.Front) or v43 == v12.CAMERA_ANGLES.Back then v42.X / v42.Y else if not (v43 ~= v12.CAMERA_ANGLES.Left) or v43 == v12.CAMERA_ANGLES.Right then v42.Z / v42.Y else v42.X / v42.Z;
    local v45 = nil;
    local v46 = nil;
    if v44 > 1 then
        v46 = v12.ASSET_TRANSPARENCY_RASTER_SIZE / v44;
        v45 = v12.ASSET_TRANSPARENCY_RASTER_SIZE;
    elseif v44 < 1 then
        v45 = v12.ASSET_TRANSPARENCY_RASTER_SIZE * v44;
        v46 = v12.ASSET_TRANSPARENCY_RASTER_SIZE;
    else
        v45 = v12.ASSET_TRANSPARENCY_RASTER_SIZE;
        v46 = v12.ASSET_TRANSPARENCY_RASTER_SIZE;
    end;
    local v47 = Vector2.new(v45 / v12.ASSET_TRANSPARENCY_RASTER_SIZE, v46 / v12.ASSET_TRANSPARENCY_RASTER_SIZE);
    local v48 = math.max(v47.X, v47.Y);
    if v48 > 1 then
        return v47 / v48;
    else
        return v47;
    end;
end;
local function v64(v50, v51, v52, v53, v54) --[[ Line: 164 ]] --[[ Name: addTransformedTriangle ]]
    -- upvalues: v9 (copy)
    local v55 = {
        orderedVerts = {}
    };
    local l_v50_FaceVertices_0 = v50:GetFaceVertices(v52);
    local l_v50_Position_0 = v50:GetPosition(l_v50_FaceVertices_0[1]);
    local l_v50_Position_1 = v50:GetPosition(l_v50_FaceVertices_0[2]);
    local l_v50_Position_2 = v50:GetPosition(l_v50_FaceVertices_0[3]);
    local v60, v61, v62, v63 = v9.transformTriangleToWorld(l_v50_Position_0, l_v50_Position_1, l_v50_Position_2, v53, v54);
    table.insert(v55.orderedVerts, v60);
    table.insert(v55.orderedVerts, v61);
    table.insert(v55.orderedVerts, v62);
    v55.normal = v63;
    table.insert(v51, v55);
    return v55;
end;
local function v76(v65, v66) --[[ Line: 193 ]] --[[ Name: updateMinMaxBounds ]]
    local l_X_0 = v65.min.X;
    local l_X_1 = v65.max.X;
    local l_Y_0 = v65.min.Y;
    local l_Y_1 = v65.max.Y;
    local l_Z_0 = v65.min.Z;
    local l_Z_1 = v65.max.Z;
    local v73 = v66.orderedVerts[1];
    local v74 = v66.orderedVerts[2];
    local v75 = v66.orderedVerts[3];
    l_X_0 = math.min(v73.X, v74.X, v75.X, l_X_0);
    l_X_1 = math.max(v73.X, v74.X, v75.X, l_X_1);
    l_Y_0 = math.min(v73.Y, v74.Y, v75.Y, l_Y_0);
    l_Y_1 = math.max(v73.Y, v74.Y, v75.Y, l_Y_1);
    l_Z_0 = math.min(v73.Z, v74.Z, v75.Z, l_Z_0);
    l_Z_1 = math.max(v73.Z, v74.Z, v75.Z, l_Z_1);
    v65.min = Vector3.new(l_X_0, l_Y_0, l_Z_0);
    v65.max = Vector3.new(l_X_1, l_Y_1, l_Z_1);
end;
local function v86(v77, v78, v79, v80, v81, v82) --[[ Line: 216 ]] --[[ Name: getCombinedMeshData ]]
    -- upvalues: v64 (copy), v76 (copy), v4 (copy)
    for _, v84 in (v77:GetFaces()) do
        local v85 = v64(v77, v78, v84, v79, v81);
        v76(v80, v85);
        v4(v82);
    end;
end;
local function v95(v87) --[[ Line: 233 ]] --[[ Name: getOpacity ]]
    local v88 = v87:ReadPixelsBuffer(Vector2.new(0, 0), v87.Size);
    local v89 = 0;
    local v90 = 0;
    for v91 = 0, buffer.len(v88) - 1, 4 do
        local v92 = buffer.readu8(v88, v91);
        local v93 = buffer.readu8(v88, v91 + 1);
        local v94 = buffer.readu8(v88, v91 + 2);
        if v92 == 0 and v93 == 0 and v94 == 0 then
            v90 = v90 + 1;
        end;
        v89 = v89 + 1;
    end;
    if v89 == 0 then
        return false, 0;
    else
        return true, 1 - v90 / v89;
    end;
end;
local function v114(v96, v97, v98, v99) --[[ Line: 256 ]] --[[ Name: getSubregionVisibility ]]
    -- upvalues: v12 (copy)
    local v100 = v97.X * v97.Y;
    local v101 = v98:GetAreaDensity(v96, v97) / v100;
    local l_v101_0 = v101;
    if v99 then
        local v103 = Vector2.one - v99;
        local v104 = v97:Dot(v99);
        local v105 = v97:Dot(v103);
        local v106 = (v103 * v105):Max(Vector2.one);
        local v107 = v105 * v12.DISTRIBUTION_SLICE_MAX;
        local v108 = 0;
        local v109 = v107 * v104;
        for v110 = 0, v104 do
            v108 = v108 + math.min(v98:GetAreaDensity(v96 + v99 * v110, v106), v107);
        end;
        local v111 = v108 / v109;
        local l_DISTRIBUTION_SCORE_WEIGHT_0 = v12.DISTRIBUTION_SCORE_WEIGHT;
        local v113 = 1 - l_DISTRIBUTION_SCORE_WEIGHT_0;
        l_v101_0 = v111 * l_DISTRIBUTION_SCORE_WEIGHT_0 + v101 * v113;
    end;
    return l_v101_0;
end;
local function v128(v115, v116, v117) --[[ Line: 292 ]] --[[ Name: getHighestSubregionVisibility ]]
    -- upvalues: v11 (copy), v12 (copy), v114 (copy)
    if v116.X * v116.Y <= 0 then
        return 0;
    else
        local v119 = v11.new(v115.Size, function(v118) --[[ Line: 298 ]]
            if v118.R > 0 or v118.G > 0 or v118.B > 0 then
                return 1;
            else
                return 0;
            end;
        end);
        v119:BuildSummedAreaTable(v115);
        local v120 = nil;
        if v12.DISTRIBUTION_ASPECT_CUTOFF then
            if v116.X / v116.Y >= v12.DISTRIBUTION_ASPECT_CUTOFF then
                v120 = Vector2.xAxis;
            elseif v116.Y / v116.X >= v12.DISTRIBUTION_ASPECT_CUTOFF then
                v120 = Vector2.yAxis;
            end;
        end;
        local v121 = 0;
        local v122 = v115.Size.Y - v116.Y;
        local v123 = v115.Size.X - v116.X;
        for v124 = 0, v122 do
            for v125 = 0, v123 do
                local v126 = Vector2.new(v125, v124);
                local v127 = v114(v126, v116, v119, v120);
                if v117 <= v127 then
                    return v127;
                else
                    v121 = math.max(v121, v127);
                end;
            end;
        end;
        return v121;
    end;
end;
local function v133(v129) --[[ Line: 335 ]] --[[ Name: checkPartsTransparency ]]
    local v130 = {};
    for _, v132 in v129 do
        if v132.Transparency ~= 0 then
            table.insert(v130, v132.Name);
        end;
    end;
    if #v130 > 0 then
        return false, {
            string.format("The following parts have a non-zero transparency: %s. Part transparency should always be exactly zero.", table.concat(v130, ", "))
        };
    else
        return true, {};
    end;
end;
return function(v134, v135) --[[ Line: 356 ]] --[[ Name: validateAssetTransparency ]]
    -- upvalues: v133 (copy), v7 (copy), v5 (copy), v10 (copy), v86 (copy), v13 (copy), v3 (copy), v6 (copy), v14 (copy), v12 (copy), v8 (copy), v128 (copy), v1 (copy), v49 (copy), v95 (copy)
    local l_assetTypeEnum_0 = v135.assetTypeEnum;
    local v137 = {};
    if v134:IsA("MeshPart") and v135.assetTypeEnum == Enum.AssetType.DynamicHead then
        table.insert(v137, v134);
    else
        assert(v134:IsA("Folder") and v135.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", v134:GetFullName()));
        for _, v139 in v134:GetChildren() do
            assert(v139:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", v134:GetFullName()));
            table.insert(v137, v139);
        end;
    end;
    local v140, v141 = v133(v137);
    if not v140 then
        return false, v141;
    else
        local v142, v143, v144 = v7.calculateIndividualAssetPartsData(v134, v135);
        if not v142 then
            return false, v143;
        else
            local v145 = {};
            local v146 = {
                min = Vector3.new(1e999, 1e999, 1e999, 0), 
                max = Vector3.new(-1e999, -1e999, -1e999, 0)
            };
            for _, v148 in v137 do
                local v149, v150 = v5(v148, "MeshId", v135);
                if not v149 then
                    return false, {
                        string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v148.Name)
                    };
                else
                    v150:Triangulate();
                    local v151 = v10(v148, v135) / v10(v148, v135, true);
                    v86(v150, v145, v144[v148.Name].cframe, v146, v151, v135);
                end;
            end;
            if (v146.max - v146.min).Magnitude == 0 then
                return false, {
                    string.format("Meshes %s should not have zero size", l_assetTypeEnum_0.Name)
                };
            elseif v13() then
                local v152 = v146.max - v146.min;
                local v153 = v146.min + v152 / 2;
                local v154 = nil;
                local l_v134_FirstChild_0 = v134:FindFirstChild("AvatarPartScaleType", true);
                if l_v134_FirstChild_0 and l_v134_FirstChild_0:IsA("StringValue") and v3.AvatarPartScaleTypes[l_v134_FirstChild_0.Value] then
                    v154 = l_v134_FirstChild_0.Value;
                end;
                local l_v154_0 = v154;
                local v157 = if not l_v154_0 then nil else v3.ASSET_TYPE_INFO[l_assetTypeEnum_0].bounds[l_v154_0].minSize;
                if not v157 then
                    return false, {};
                else
                    l_v154_0 = v152:Max(v157);
                    v154 = v6.new();
                    for _, v159 in (v14()) do
                        if #v145 == 0 then
                            v154:updateReasons(false, {
                                string.format("Mesh for %s has no triangles.", l_assetTypeEnum_0.Name)
                            });
                        else
                            local v160 = CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v159.axis1, v159.axis2, v159.normal:Abs()) * l_v154_0;
                            local v161 = Vector2.new(v160.X, v160.Y);
                            local v162 = CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v159.axis1, v159.axis2, v159.normal:Abs()) * v157;
                            local v163 = Vector2.new(v162.X, v162.Y);
                            v162 = v163.X * v163.Y;
                            local v164 = math.sqrt(v12.AREA_OF_INTEREST_TARGET_PIXELS / v162);
                            local v165 = math.max(v161.X, v161.Y);
                            v160 = math.min(v164, v12.ASSET_TRANSPARENCY_MAX_RASTER_SIZE / v165);
                            v164 = v161 * v160;
                            v162 = Vector2.new(math.floor(v164.X + 0.001), (math.floor(v164.Y + 0.001)));
                            v165 = v163 * v160;
                            v164 = Vector2.new(math.floor(v165.X + 0.001), (math.floor(v165.Y + 0.001)));
                            v165 = v8.rasterMesh(v145, v162, v159, v153, l_v154_0, v135);
                            local v166 = v12.ASSET_TRANSPARENCY_THRESHOLDS[l_assetTypeEnum_0][v159.viewId];
                            local v167 = v128(v165, v164, v166);
                            v165:Destroy();
                            if v167 == 0 and v166 > 0 then
                                v154:updateReasons(false, {
                                    string.format("Mesh for %s is completely invisible from the %s.", l_assetTypeEnum_0.Name, v159.viewId)
                                });
                            elseif v167 < v166 then
                                v154:updateReasons(false, {
                                    string.format("%s is not visible enough from the %s. The most visible region found, scored %.2f but needs to be above %.2f.", l_assetTypeEnum_0.Name, v159.viewId, v167, v166)
                                });
                            end;
                        end;
                    end;
                    if not v154:getFinalResults() then
                        v1.reportFailure(v1.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, v135);
                    end;
                    return v154:getFinalResults();
                end;
            else
                local v168 = v6.new();
                for _, v170 in (v14()) do
                    if #v145 == 0 then
                        v168:updateReasons(false, {
                            string.format("Mesh for %s has no triangles.", l_assetTypeEnum_0.Name)
                        });
                    else
                        local v171 = v146.max - v146.min;
                        local v172 = v146.min + v171 / 2;
                        local v173 = Vector2.new(v12.ASSET_TRANSPARENCY_RASTER_SIZE, v12.ASSET_TRANSPARENCY_RASTER_SIZE) * v49(v171, v170.viewId);
                        local v174 = v8.rasterMesh(v145, v173, v170, v172, v171, v135);
                        local v175 = v12.ASSET_TRANSPARENCY_THRESHOLDS[l_assetTypeEnum_0][v170.viewId];
                        local v176, v177 = v95(v174);
                        if not v176 then
                            v168:updateReasons(false, {
                                string.format("Mesh for %s is completely invisible.", l_assetTypeEnum_0.Name)
                            });
                            v174:Destroy();
                        else
                            if v177 < v175 then
                                v168:updateReasons(false, {
                                    string.format("%s is not opaque enough from the %s. Opacity is %.2f but needs to be above %.2f.", l_assetTypeEnum_0.Name, v170.viewId, v177, v175)
                                });
                            end;
                            v174:Destroy();
                        end;
                    end;
                end;
                if not v168:getFinalResults() then
                    v1.reportFailure(v1.ErrorType.validateAssetTransparency_AssetTransparencyThresholds, nil, v135);
                end;
                return v168:getFinalResults();
            end;
        end;
    end;
end;