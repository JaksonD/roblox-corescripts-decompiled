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
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateTinyTrianglesIntersectFix);
local function _(v15, v16, v17, v18, v19) --[[ Line: 32 ]] --[[ Name: sampleAreaTable ]]
    local v20 = Vector2.new(v16, v18);
    local v21 = Vector2.new(v17, v19);
    local v22 = v20 * v15.size;
    return (v15:GetAreaDensityContinuous(v22, v21 * v15.size - v22));
end;
local function v38(v24, v25, v26) --[[ Line: 44 ]] --[[ Name: shrinkBounds ]]
    -- upvalues: v10 (copy)
    local function _(v27) --[[ Line: 45 ]]
        if v27 % 2 == 0 then
            return v27 - 1;
        else
            return v27 + 1;
        end;
    end;
    for v29 = 1, 4 do
        local v30 = v24[if v29 % 2 == 0 then v29 - 1 else v29 + 1];
        local _ = nil;
        local v32 = 1 / v26[v29 < 3 and "X" or "Y"];
        local v33 = v10.new(v24);
        local v34 = v25(v24);
        local v35 = v24[v29];
        while v32 <= math.abs(v35 - v30) do
            local v36 = (v35 + v30) / 2;
            v33[v29] = v36;
            local v37 = v25(v33);
            if v37 < v34 then
                v33[v29] = v36 + (v30 - v36) * 0.01;
                if v25(v33) - v37 > 0 then
                    v30 = v35;
                end;
                v35 = v36;
                v34 = v37;
            else
                v30 = v36;
            end;
        end;
        v24[v29] = v35;
    end;
end;
local function v42(v39, v40) --[[ Line: 89 ]] --[[ Name: createSimplex ]]
    -- upvalues: v10 (copy)
    local v41 = {};
    table.insert(v41, v39);
    table.insert(v41, v39 + v10.new(v40, 0, 0, 0));
    table.insert(v41, v39 + v10.new(0, v40, 0, 0));
    table.insert(v41, v39 + v10.new(0, 0, v40, 0));
    table.insert(v41, v39 + v10.new(0, 0, 0, v40));
    return v41;
end;
local function v76(v43, v44) --[[ Line: 99 ]] --[[ Name: calculateMinimumBoundsForView ]]
    -- upvalues: v10 (copy), v42 (copy), v4 (copy), v13 (copy), v3 (copy), v12 (copy), v38 (copy)
    local v45 = v10.new(0, 1, 0, 1);
    local v46 = v42(v45, 0.9);
    local l_mask_0 = v43.mask;
    local l_Size_0 = l_mask_0.Size;
    local v50 = v4.new(l_Size_0, function(v49) --[[ Line: 108 ]]
        if v49.R > 0 or v49.G > 0 or v49.B > 0 then
            return 1;
        else
            return 0;
        end;
    end);
    v50:BuildSummedAreaTable(l_mask_0);
    local l_v50_AreaDensity_0 = v50:GetAreaDensity(Vector2.zero, l_Size_0);
    if l_v50_AreaDensity_0 <= 0 then
        return false, {
            string.format("%s asset not visible from the %s, cannot determine quality of asset bounding box", v44.assetTypeEnum.Name, v43.viewId)
        };
    else
        local v52 = v13.targetPercentage();
        local v53 = v13.percentageWeight();
        local function v66(v54) --[[ Line: 132 ]]
            -- upvalues: v50 (copy), l_v50_AreaDensity_0 (copy), v52 (copy), v53 (copy)
            assert(v54:getSize() == 4);
            local v55 = 0;
            if v54[1] <= v54[2] and v54[3] <= v54[4] then
                local l_v50_0 = v50;
                local v57 = v54[1];
                local v58 = v54[2];
                local v59 = v54[3];
                local v60 = v54[4];
                local v61 = Vector2.new(v57, v59);
                local v62 = Vector2.new(v58, v60);
                local v63 = v61 * l_v50_0.size;
                v55 = l_v50_0:GetAreaDensityContinuous(v63, v62 * l_v50_0.size - v63);
            end;
            local v64 = math.abs(v55 / l_v50_AreaDensity_0 * 100 - v52) * v53;
            local v65 = Vector2.new(v54[2] - v54[1], v54[4] - v54[3]);
            return v64 + (v65.X + v65.Y);
        end;
        local v67 = v13.maxIterations();
        local v68 = Vector2.new(1 / l_Size_0.X, 1 / l_Size_0.Y);
        local v69 = v13.convergedLength();
        local v70 = v68.Magnitude * v69;
        local function v73(v71, v72) --[[ Line: 152 ]]
            -- upvalues: v67 (copy), v3 (ref), v70 (copy), v12 (ref), v44 (copy)
            if v67 <= v72 then
                return true;
            elseif v3.calculateMaxLengthBetweenVertices(v71) <= v70 then
                return true;
            else
                v12(v44);
                return false;
            end;
        end;
        local v74 = v3.new(v46, v66, v73);
        v74:evaluate();
        local v75 = v74.simplex[1];
        v38(v75, v66, l_Size_0);
        return true, (v10.new(math.clamp(v75[1], 0, 1), math.clamp(v75[2], 0, 1), math.clamp(v75[3], 0, 1), (math.clamp(v75[4], 0, 1))));
    end;
end;
local function _(v77, v78) --[[ Line: 185 ]] --[[ Name: transformIsAlignedWithAxis ]]
    if v78:FuzzyEq(v77.XVector:Abs()) then
        return true;
    elseif v78:FuzzyEq(v77.YVector:Abs()) then
        return true;
    else
        return false;
    end;
end;
local function v84(v80, v81) --[[ Line: 195 ]] --[[ Name: alignedExtentsFromReprojectedPoint ]]
    -- upvalues: v11 (copy)
    local v82 = {
        X = -1e999, 
        Y = -1e999, 
        Z = -1e999
    };
    local v83 = {
        X = 1e999, 
        Y = 1e999, 
        Z = 1e999
    };
    if Vector3.new(1, 0, 0, 0):FuzzyEq(v81.XVector:Abs()) and true or Vector3.new(1, 0, 0, 0):FuzzyEq(v81.YVector:Abs()) and true or false then
        v82.X = math.max(v82.X, v80.X);
        v83.X = math.min(v83.X, v80.X);
    end;
    if Vector3.new(0, 1, 0, 0):FuzzyEq(v81.XVector:Abs()) and true or Vector3.new(0, 1, 0, 0):FuzzyEq(v81.YVector:Abs()) and true or false then
        v82.Y = math.max(v82.Y, v80.Y);
        v83.Y = math.min(v83.Y, v80.Y);
    end;
    if Vector3.new(0, 0, 1, 0):FuzzyEq(v81.XVector:Abs()) and true or Vector3.new(0, 0, 1, 0):FuzzyEq(v81.YVector:Abs()) and true or false then
        v82.Z = math.max(v82.Z, v80.Z);
        v83.Z = math.min(v83.Z, v80.Z);
    end;
    return v11.fromMinMax(Vector3.new(v83.X, v83.Y, v83.Z), (Vector3.new(v82.X, v82.Y, v82.Z)));
end;
local function v104(v85, v86) --[[ Line: 222 ]] --[[ Name: calculateValidBounds ]]
    -- upvalues: v11 (copy), v14 (copy), v76 (copy), v2 (copy), v84 (copy)
    local v87 = v11.new();
    local v88 = if v14() then {} else nil;
    for v89, v90 in v85 do
        local v91 = nil;
        local v92, v93 = v76(v90, v86);
        if not v92 then
            return false, v93;
        else
            v91 = v93;
            local v94 = Vector2.new(v91[2], v91[3]);
            local v95 = Vector2.new(v91[1], v91[4]);
            local v96 = v2.getViewSpacePositionFromNormalized(v94, v90.viewSpaceBounds);
            v96 = v90.view * v96;
            local v97 = v2.getViewSpacePositionFromNormalized(v95, v90.viewSpaceBounds);
            v97 = v90.view * v97;
            local v98 = v84(v96, v90.view);
            local v99 = v84(v97, v90.view);
            if v14() then
                local v100 = v11.new():unionExtents(v98):unionExtents(v99);
                local v101 = v2.opposingViewIds[v89];
                if v88[v101] then
                    v88[v101] = v100:intersectExtents(v88[v101]);
                else
                    v88[v89] = v100;
                end;
            else
                v87 = v87:unionExtents(v98):unionExtents(v99);
            end;
        end;
    end;
    if v14() then
        for _, v103 in v88 do
            v87 = v87:unionExtents(v103);
        end;
        assert(v87:isValid());
    end;
    return true, v87;
end;
local function _(v105, v106) --[[ Line: 279 ]] --[[ Name: worldSpacePositionFromPointInMeshPart ]]
    return v106.CFrame * (v105 * (v106.Size / v106.MeshSize));
end;
local function v134(v108, v109, v110, v111, v112) --[[ Line: 296 ]] --[[ Name: getHighestInflatingPointInEachAxis ]]
    -- upvalues: v8 (copy)
    local v113 = {
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
    local v114 = v108:size();
    for v115, v116 in v110 do
        local v117, v118, v119 = v8({
            editableMesh = v116, 
            fullName = v115
        }, v112);
        if not v117 then
            return false, v118;
        else
            local v120 = v109[v115];
            for _, v122 in v119 do
                local v123 = v122 * v120.scale;
                v123 = v120.CFrame * v123;
                local v124 = v111(v115);
                local v125 = v124.CFrame * (v122 * (v124.Size / v124.MeshSize));
                v124 = (v123 - v108.max) / v114;
                local v126 = (v108.min - v123) / v114;
                for _, v128 in {
                    "X", 
                    "Y", 
                    "Z"
                } do
                    local v129 = v113[v128];
                    local l_positive_0 = v129.positive;
                    local v131 = v124[v128];
                    if l_positive_0.inflationScale < v131 then
                        l_positive_0.furthestPointWorldSpace = v125;
                        l_positive_0.inflationScale = v131;
                    end;
                    local l_negative_0 = v129.negative;
                    local v133 = v126[v128];
                    if l_negative_0.inflationScale < v133 then
                        l_negative_0.furthestPointWorldSpace = v125;
                        l_negative_0.inflationScale = v133;
                    end;
                end;
            end;
        end;
    end;
    return true, v113;
end;
local function v146(v135, v136) --[[ Line: 356 ]] --[[ Name: getBodyPartAssetEditableMeshes ]]
    -- upvalues: v7 (copy)
    local v137 = {};
    if v135:IsA("MeshPart") and v136.assetTypeEnum == Enum.AssetType.DynamicHead then
        table.insert(v137, v135);
    else
        for _, v139 in v135:GetChildren() do
            if v139:IsA("MeshPart") then
                table.insert(v137, v139);
            end;
        end;
    end;
    local v140 = {};
    for _, v142 in v137 do
        local v143, v144 = v7(v142, "MeshId", v136);
        if not v143 then
            local v145 = string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v142.Name);
            if v136.isServer then
                error(v145);
            else
                return false, {
                    v145
                };
            end;
        end;
        v140[v142.Name] = v144;
    end;
    return true, v140;
end;
local function v160(v147, v148) --[[ Line: 391 ]] --[[ Name: tryReportInflationError ]]
    -- upvalues: v5 (copy), v13 (copy)
    local v149 = v5.new();
    local v150 = v13.AssetTypeToAxisThresholds[v148];
    for _, v152 in {
        "X", 
        "Y", 
        "Z"
    } do
        local v153 = v147[v152];
        local v154 = v153.negative.inflationScale + v153.positive.inflationScale;
        local v155 = v150[v152];
        if v155 < v154 then
            local v156 = {};
            if v153.positive.inflationScale > v155 * 0.2 then
                table.insert(v156, v153.positive.furthestPointWorldSpace);
            end;
            if v153.negative.inflationScale > v155 * 0.2 then
                table.insert(v156, v153.negative.furthestPointWorldSpace);
            end;
            local v157 = "";
            if #v156 > 0 then
                v157 = " near " .. string.format("{%.4f, %.4f, %.4f}", v156[1].X, v156[1].Y, v156[1].Z);
                if #v156 > 1 then
                    v157 = v157 .. string.format(", and {%.4f, %.4f, %.4f}", v156[2].X, v156[2].Y, v156[2].Z);
                end;
            end;
            local v158 = v154 * 100;
            local v159 = v155 * 100;
            v149:updateReasons(false, {
                string.format("Detected low visibility geometry%s that increases %s bounding box size by %.2f%% (threshold is %.2f%%) in the %s axis. Remove the geometry or increase its size so that it is more visible", v157, v148.Name, v158, v159, v152)
            });
        end;
    end;
    return v149;
end;
local v161 = {};
local v162 = nil;
v161.getBoundsViewsForAssetType = function(v163) --[[ Line: 449 ]] --[[ Name: getBoundsViewsForAssetType ]]
    -- upvalues: v162 (ref), v2 (copy)
    if not v162 then
        local _ = function() --[[ Line: 451 ]]
            -- upvalues: v2 (ref)
            local v164 = {};
            for _, v166 in v2.viewIds do
                v164[v166] = true;
            end;
            return v164;
        end;
        local v168 = {};
        for _, v170 in v2.viewIds do
            v168[v170] = true;
        end;
        local l_v168_0 = v168;
        l_v168_0[v2.viewIds.Left] = false;
        l_v168_0[v2.viewIds.Bottom] = false;
        local v172 = {};
        for _, v174 in v2.viewIds do
            v172[v174] = true;
        end;
        v168 = v172;
        v168[v2.viewIds.Right] = false;
        v168[v2.viewIds.Bottom] = false;
        local v175 = {};
        for _, v177 in v2.viewIds do
            v175[v177] = true;
        end;
        v172 = v175;
        v172[v2.viewIds.Left] = false;
        v172[v2.viewIds.Bottom] = false;
        local v178 = {};
        for _, v180 in v2.viewIds do
            v178[v180] = true;
        end;
        v175 = v178;
        v175[v2.viewIds.Right] = false;
        v175[v2.viewIds.Bottom] = false;
        v162 = {
            [Enum.AssetType.DynamicHead] = nil, 
            [Enum.AssetType.Torso] = nil, 
            [Enum.AssetType.LeftArm] = l_v168_0, 
            [Enum.AssetType.RightArm] = v168, 
            [Enum.AssetType.LeftLeg] = v172, 
            [Enum.AssetType.RightLeg] = v175
        };
    end;
    return v162[v163];
end;
v161.validate = function(v181, v182, v183) --[[ Line: 488 ]] --[[ Name: validate ]]
    -- upvalues: v161 (copy), v104 (copy), v6 (copy), v146 (copy), v134 (copy), v160 (copy), v1 (copy)
    local l_assetTypeEnum_0 = v183.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local function v186(v185) --[[ Line: 496 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_0 (copy), v181 (copy)
        if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
            return v181;
        else
            return (v181:FindFirstChild(v185));
        end;
    end;
    local v187 = v161.getBoundsViewsForAssetType(l_assetTypeEnum_0);
    local v188 = {};
    if v187 then
        for v189, v190 in v187 do
            if v190 then
                assert(v182.bodyAssetMasks[v189]);
                v188[v189] = v182.bodyAssetMasks[v189];
            end;
        end;
    else
        v188 = v182.bodyAssetMasks;
    end;
    local v191 = nil;
    local v192, v193 = v104(v188, v183);
    if not v192 then
        return false, v193;
    else
        v191 = v193;
        local v194 = v6.getAssetMeshesValidationSpaceTransforms(v181, v183);
        local _ = nil;
        local v196, v197 = v146(v181, v183);
        v192 = v196;
        v193 = v197;
        if not v192 then
            return false, v193;
        else
            v196, v197 = v134(v191, v194, v193, v186, v183);
            v192 = v196;
            v193 = v197;
            if not v192 then
                return false, v193;
            else
                v197 = v160(v193, l_assetTypeEnum_0);
                if not v197:getFinalResults() then
                    v1.reportFailure(v1.ErrorType.validateAccurateBoundingBox, nil, v183);
                end;
                return v197:getFinalResults();
            end;
        end;
    end;
end;
return v161;