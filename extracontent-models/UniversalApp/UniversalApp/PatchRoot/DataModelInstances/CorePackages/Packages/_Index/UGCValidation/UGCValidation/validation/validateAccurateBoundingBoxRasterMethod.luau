local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.util.bodyAssetMasksRenderer);
local v3 = require(l_Parent_0.util.nelderMead);
local v4 = require(l_Parent_0.util.SummedAreaTable);
local v5 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v6 = require(l_Parent_0.util.AssetCalculator);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local v8 = require(l_Parent_0.util.getMeshVerts);
local _ = require(l_Parent_0.util.Types);
local v10 = require(l_Parent_0.util.FloatVector);
local v11 = require(l_Parent_0.util.Extents);
local v12 = require(l_Parent_0.util.tryYield);
local v13 = require(l_Parent_0.flags.validateAccurateBoundingBoxFlags);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateAccurateBoundingBoxRasterMethodTopViewFix);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidateTinyTrianglesIntersectFix);
local function _(v16, v17, v18, v19, v20) --[[ Line: 34 ]] --[[ Name: sampleAreaTable ]]
    local v21 = Vector2.new(v17, v19);
    local v22 = Vector2.new(v18, v20);
    local v23 = v21 * v16.size;
    return (v16:GetAreaDensityContinuous(v23, v22 * v16.size - v23));
end;
local function v39(v25, v26, v27) --[[ Line: 46 ]] --[[ Name: shrinkBounds ]]
    -- upvalues: v10 (copy)
    local function _(v28) --[[ Line: 47 ]]
        if v28 % 2 == 0 then
            return v28 - 1;
        else
            return v28 + 1;
        end;
    end;
    for v30 = 1, 4 do
        local v31 = v25[if v30 % 2 == 0 then v30 - 1 else v30 + 1];
        local _ = nil;
        local v33 = 1 / v27[v30 < 3 and "X" or "Y"];
        local v34 = v10.new(v25);
        local v35 = v26(v25);
        local v36 = v25[v30];
        while v33 <= math.abs(v36 - v31) do
            local v37 = (v36 + v31) / 2;
            v34[v30] = v37;
            local v38 = v26(v34);
            if v38 < v35 then
                v34[v30] = v37 + (v31 - v37) * 0.01;
                if v26(v34) - v38 > 0 then
                    v31 = v36;
                end;
                v36 = v37;
                v35 = v38;
            else
                v31 = v37;
            end;
        end;
        v25[v30] = v36;
    end;
end;
local function v43(v40, v41) --[[ Line: 91 ]] --[[ Name: createSimplex ]]
    -- upvalues: v10 (copy)
    local v42 = {};
    table.insert(v42, v40);
    table.insert(v42, v40 + v10.new(v41, 0, 0, 0));
    table.insert(v42, v40 + v10.new(0, v41, 0, 0));
    table.insert(v42, v40 + v10.new(0, 0, v41, 0));
    table.insert(v42, v40 + v10.new(0, 0, 0, v41));
    return v42;
end;
local function v77(v44, v45) --[[ Line: 101 ]] --[[ Name: calculateMinimumBoundsForView ]]
    -- upvalues: v10 (copy), v43 (copy), v4 (copy), v13 (copy), v3 (copy), v12 (copy), v39 (copy)
    local v46 = v10.new(0, 1, 0, 1);
    local v47 = v43(v46, 0.9);
    local l_mask_0 = v44.mask;
    local l_Size_0 = l_mask_0.Size;
    local v51 = v4.new(l_Size_0, function(v50) --[[ Line: 110 ]]
        if v50.R > 0 or v50.G > 0 or v50.B > 0 then
            return 1;
        else
            return 0;
        end;
    end);
    v51:BuildSummedAreaTable(l_mask_0);
    local l_v51_AreaDensity_0 = v51:GetAreaDensity(Vector2.zero, l_Size_0);
    if l_v51_AreaDensity_0 <= 0 then
        return false, {
            string.format("%s asset not visible from the %s, cannot determine quality of asset bounding box", v45.assetTypeEnum.Name, v44.viewId)
        };
    else
        local v53 = v13.targetPercentage();
        local v54 = v13.percentageWeight();
        local function v67(v55) --[[ Line: 134 ]]
            -- upvalues: v51 (copy), l_v51_AreaDensity_0 (copy), v53 (copy), v54 (copy)
            assert(v55:getSize() == 4);
            local v56 = 0;
            if v55[1] <= v55[2] and v55[3] <= v55[4] then
                local l_v51_0 = v51;
                local v58 = v55[1];
                local v59 = v55[2];
                local v60 = v55[3];
                local v61 = v55[4];
                local v62 = Vector2.new(v58, v60);
                local v63 = Vector2.new(v59, v61);
                local v64 = v62 * l_v51_0.size;
                v56 = l_v51_0:GetAreaDensityContinuous(v64, v63 * l_v51_0.size - v64);
            end;
            local v65 = math.abs(v56 / l_v51_AreaDensity_0 * 100 - v53) * v54;
            local v66 = Vector2.new(v55[2] - v55[1], v55[4] - v55[3]);
            return v65 + (v66.X + v66.Y);
        end;
        local v68 = v13.maxIterations();
        local v69 = Vector2.new(1 / l_Size_0.X, 1 / l_Size_0.Y);
        local v70 = v13.convergedLength();
        local v71 = v69.Magnitude * v70;
        local function v74(v72, v73) --[[ Line: 154 ]]
            -- upvalues: v68 (copy), v3 (ref), v71 (copy), v12 (ref), v45 (copy)
            if v68 <= v73 then
                return true;
            elseif v3.calculateMaxLengthBetweenVertices(v72) <= v71 then
                return true;
            else
                v12(v45);
                return false;
            end;
        end;
        local v75 = v3.new(v47, v67, v74);
        v75:evaluate();
        local v76 = v75.simplex[1];
        v39(v76, v67, l_Size_0);
        return true, (v10.new(math.clamp(v76[1], 0, 1), math.clamp(v76[2], 0, 1), math.clamp(v76[3], 0, 1), (math.clamp(v76[4], 0, 1))));
    end;
end;
local function v80(v78, v79) --[[ Line: 187 ]] --[[ Name: transformIsAlignedWithAxis ]]
    -- upvalues: v14 (copy)
    if v14() then
        if v79:FuzzyEq(v78.XVector:Abs()) then
            return true;
        elseif v79:FuzzyEq(v78.YVector:Abs()) then
            return true;
        end;
    elseif v79:Abs():FuzzyEq(v78.XVector) then
        return true;
    elseif v79:Abs():FuzzyEq(v78.YVector) then
        return true;
    end;
    return false;
end;
local function v85(v81, v82) --[[ Line: 205 ]] --[[ Name: alignedExtentsFromReprojectedPoint ]]
    -- upvalues: v80 (copy), v11 (copy)
    local v83 = {
        X = -1e999, 
        Y = -1e999, 
        Z = -1e999
    };
    local v84 = {
        X = 1e999, 
        Y = 1e999, 
        Z = 1e999
    };
    if v80(v82, (Vector3.new(1, 0, 0, 0))) then
        v83.X = math.max(v83.X, v81.X);
        v84.X = math.min(v84.X, v81.X);
    end;
    if v80(v82, (Vector3.new(0, 1, 0, 0))) then
        v83.Y = math.max(v83.Y, v81.Y);
        v84.Y = math.min(v84.Y, v81.Y);
    end;
    if v80(v82, (Vector3.new(0, 0, 1, 0))) then
        v83.Z = math.max(v83.Z, v81.Z);
        v84.Z = math.min(v84.Z, v81.Z);
    end;
    return v11.fromMinMax(Vector3.new(v84.X, v84.Y, v84.Z), (Vector3.new(v83.X, v83.Y, v83.Z)));
end;
local function v105(v86, v87) --[[ Line: 232 ]] --[[ Name: calculateValidBounds ]]
    -- upvalues: v11 (copy), v15 (copy), v77 (copy), v2 (copy), v85 (copy)
    local v88 = v11.new();
    local v89 = if v15() then {} else nil;
    for v90, v91 in v86 do
        local v92 = nil;
        local v93, v94 = v77(v91, v87);
        if not v93 then
            return false, v94;
        else
            v92 = v94;
            local v95 = Vector2.new(v92[2], v92[3]);
            local v96 = Vector2.new(v92[1], v92[4]);
            local v97 = v2.getViewSpacePositionFromNormalized(v95, v91.viewSpaceBounds);
            v97 = v91.view * v97;
            local v98 = v2.getViewSpacePositionFromNormalized(v96, v91.viewSpaceBounds);
            v98 = v91.view * v98;
            local v99 = v85(v97, v91.view);
            local v100 = v85(v98, v91.view);
            if v15() then
                local v101 = v11.new():unionExtents(v99):unionExtents(v100);
                local v102 = v2.opposingViewIds[v90];
                if v89[v102] then
                    v89[v102] = v101:intersectExtents(v89[v102]);
                else
                    v89[v90] = v101;
                end;
            else
                v88 = v88:unionExtents(v99):unionExtents(v100);
            end;
        end;
    end;
    if v15() then
        for _, v104 in v89 do
            v88 = v88:unionExtents(v104);
        end;
        assert(v88:isValid());
    end;
    return true, v88;
end;
local function _(v106, v107) --[[ Line: 289 ]] --[[ Name: worldSpacePositionFromPointInMeshPart ]]
    return v107.CFrame * (v106 * (v107.Size / v107.MeshSize));
end;
local function v135(v109, v110, v111, v112, v113) --[[ Line: 306 ]] --[[ Name: getHighestInflatingPointInEachAxis ]]
    -- upvalues: v8 (copy)
    local v114 = {
        X = {
            positive = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }, 
            negative = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }
        }, 
        Y = {
            positive = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }, 
            negative = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }
        }, 
        Z = {
            positive = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }, 
            negative = {
                inflationScale = 0, 
                furthestPointWorldSpace = nil
            }
        }
    };
    local v115 = v109:size();
    for v116, v117 in v111 do
        local v118, v119, v120 = v8({
            editableMesh = v117, 
            fullName = v116
        }, v113);
        if not v118 then
            return false, v119;
        else
            local v121 = v110[v116];
            for _, v123 in v120 do
                local v124 = v123 * v121.scale;
                v124 = v121.CFrame * v124;
                local v125 = v112(v116);
                local v126 = v125.CFrame * (v123 * (v125.Size / v125.MeshSize));
                v125 = (v124 - v109.max) / v115;
                local v127 = (v109.min - v124) / v115;
                for _, v129 in {
                    "X", 
                    "Y", 
                    "Z"
                } do
                    local v130 = v114[v129];
                    local l_positive_0 = v130.positive;
                    local v132 = v125[v129];
                    if l_positive_0.inflationScale < v132 then
                        l_positive_0.furthestPointWorldSpace = v126;
                        l_positive_0.inflationScale = v132;
                    end;
                    local l_negative_0 = v130.negative;
                    local v134 = v127[v129];
                    if l_negative_0.inflationScale < v134 then
                        l_negative_0.furthestPointWorldSpace = v126;
                        l_negative_0.inflationScale = v134;
                    end;
                end;
            end;
        end;
    end;
    return true, v114;
end;
local function v147(v136, v137) --[[ Line: 366 ]] --[[ Name: getBodyPartAssetEditableMeshes ]]
    -- upvalues: v7 (copy)
    local v138 = {};
    if v136:IsA("MeshPart") and v137.assetTypeEnum == Enum.AssetType.DynamicHead then
        table.insert(v138, v136);
    else
        for _, v140 in v136:GetChildren() do
            if v140:IsA("MeshPart") then
                table.insert(v138, v140);
            end;
        end;
    end;
    local v141 = {};
    for _, v143 in v138 do
        local v144, v145 = v7(v143, "MeshId", v137);
        if not v144 then
            local v146 = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v143.Name);
            if v137.isServer then
                error(v146);
            else
                return false, {
                    v146
                };
            end;
        end;
        v141[v143.Name] = v145;
    end;
    return true, v141;
end;
local function v161(v148, v149) --[[ Line: 401 ]] --[[ Name: tryReportInflationError ]]
    -- upvalues: v5 (copy), v13 (copy)
    local v150 = v5.new();
    local v151 = v13.AssetTypeToAxisThresholds[v149];
    for _, v153 in {
        "X", 
        "Y", 
        "Z"
    } do
        local v154 = v148[v153];
        local v155 = v154.negative.inflationScale + v154.positive.inflationScale;
        local v156 = v151[v153];
        if v156 < v155 then
            local v157 = {};
            if v154.positive.inflationScale > v156 * 0.2 then
                table.insert(v157, v154.positive.furthestPointWorldSpace);
            end;
            if v154.negative.inflationScale > v156 * 0.2 then
                table.insert(v157, v154.negative.furthestPointWorldSpace);
            end;
            local v158 = "";
            if #v157 > 0 then
                v158 = " near " .. string.format("{%.4f, %.4f, %.4f}", v157[1].X, v157[1].Y, v157[1].Z);
                if #v157 > 1 then
                    v158 = v158 .. string.format(", and {%.4f, %.4f, %.4f}", v157[2].X, v157[2].Y, v157[2].Z);
                end;
            end;
            local v159 = v155 * 100;
            local v160 = v156 * 100;
            v150:updateReasons(false, {
                string.format("Detected low visibility geometry%s that increases %s bounding box size by %.2f%% (threshold is %.2f%%) in the %s axis. Remove the geometry or increase its size so that it is more visible", v158, v149.Name, v159, v160, v153)
            });
        end;
    end;
    return v150;
end;
local v162 = {};
local v163 = nil;
v162.getBoundsViewsForAssetType = function(v164) --[[ Line: 459 ]] --[[ Name: getBoundsViewsForAssetType ]]
    -- upvalues: v163 (ref), v2 (copy)
    if not v163 then
        local _ = function() --[[ Line: 461 ]]
            -- upvalues: v2 (ref)
            local v165 = {};
            for _, v167 in v2.viewIds do
                v165[v167] = true;
            end;
            return v165;
        end;
        local v169 = {};
        for _, v171 in v2.viewIds do
            v169[v171] = true;
        end;
        local l_v169_0 = v169;
        l_v169_0[v2.viewIds.Left] = false;
        l_v169_0[v2.viewIds.Bottom] = false;
        local v173 = {};
        for _, v175 in v2.viewIds do
            v173[v175] = true;
        end;
        v169 = v173;
        v169[v2.viewIds.Right] = false;
        v169[v2.viewIds.Bottom] = false;
        local v176 = {};
        for _, v178 in v2.viewIds do
            v176[v178] = true;
        end;
        v173 = v176;
        v173[v2.viewIds.Left] = false;
        v173[v2.viewIds.Bottom] = false;
        local v179 = {};
        for _, v181 in v2.viewIds do
            v179[v181] = true;
        end;
        v176 = v179;
        v176[v2.viewIds.Right] = false;
        v176[v2.viewIds.Bottom] = false;
        v163 = {
            [Enum.AssetType.DynamicHead] = nil, 
            [Enum.AssetType.Torso] = nil, 
            [Enum.AssetType.LeftArm] = l_v169_0, 
            [Enum.AssetType.RightArm] = v169, 
            [Enum.AssetType.LeftLeg] = v173, 
            [Enum.AssetType.RightLeg] = v176
        };
    end;
    return v163[v164];
end;
v162.validate = function(v182, v183, v184) --[[ Line: 498 ]] --[[ Name: validate ]]
    -- upvalues: v162 (copy), v105 (copy), v6 (copy), v147 (copy), v135 (copy), v161 (copy), v1 (copy)
    local l_assetTypeEnum_0 = v184.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local function v187(v186) --[[ Line: 506 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_0 (copy), v182 (copy)
        if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
            return v182;
        else
            return (v182:FindFirstChild(v186));
        end;
    end;
    local v188 = v162.getBoundsViewsForAssetType(l_assetTypeEnum_0);
    local v189 = {};
    if v188 then
        for v190, v191 in v188 do
            if v191 then
                assert(v183.bodyAssetMasks[v190]);
                v189[v190] = v183.bodyAssetMasks[v190];
            end;
        end;
    else
        v189 = v183.bodyAssetMasks;
    end;
    local v192 = nil;
    local v193, v194 = v105(v189, v184);
    if not v193 then
        return false, v194;
    else
        v192 = v194;
        local v195 = v6.getAssetMeshesValidationSpaceTransforms(v182, v184);
        local _ = nil;
        local v197, v198 = v147(v182, v184);
        v193 = v197;
        v194 = v198;
        if not v193 then
            return false, v194;
        else
            v197, v198 = v135(v192, v195, v194, v187, v184);
            v193 = v197;
            v194 = v198;
            if not v193 then
                return false, v194;
            else
                v198 = v161(v194, l_assetTypeEnum_0);
                if not v198:getFinalResults() then
                    v1.reportFailure(v1.ErrorType.validateAccurateBoundingBox, nil, v184);
                end;
                return v198:getFinalResults();
            end;
        end;
    end;
end;
return v162;