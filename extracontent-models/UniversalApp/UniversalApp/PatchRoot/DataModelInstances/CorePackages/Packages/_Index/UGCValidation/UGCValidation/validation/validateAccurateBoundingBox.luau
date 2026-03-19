local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.AssetCalculator);
local v4 = require(l_Parent_0.util.getExpectedPartSize);
local v5 = require(l_Parent_0.util.getEditableMeshFromContext);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.pcallDeferred);
local _ = require(l_Parent_0.util.Types);
local v9 = require(l_Parent_0.flags.getFStringUGCValidateBoundsInflationThreshold);
local function _(v10, v11) --[[ Line: 30 ]] --[[ Name: calculateExtentsUnion ]]
    return {
        min = v10.min:Min(v11.min), 
        max = v10.max:Max(v11.max)
    };
end;
local function v16(v13) --[[ Line: 37 ]] --[[ Name: checkExtentsValid ]]
    for _, v15 in {
        "X", 
        "Y", 
        "Z"
    } do
        if v13.max[v15] < v13.min[v15] then
            return false;
        end;
    end;
    return true;
end;
local function _(v17, v18, v19, v20, v21) --[[ Line: 46 ]] --[[ Name: validationSpaceToWorldSpace ]]
    return v20 * (v18:Inverse() * v17 / v19 * v21);
end;
local function v30(v23, v24) --[[ Line: 59 ]] --[[ Name: calculateAmountInflated ]]
    local v25 = {
        min = v23.min:Min(v24.min), 
        max = v23.max:Max(v24.max)
    };
    local v26 = 0;
    for _, v28 in {
        "X", 
        "Y", 
        "Z"
    } do
        local v29 = math.abs(v23.max[v28] - v23.min[v28]);
        v26 = math.max(v26, (math.abs(math.abs(v25.max[v28] - v25.min[v28]) - v29)));
    end;
    return v26;
end;
local function v36(v31, v32) --[[ Line: 76 ]] --[[ Name: getPartNamesInAsset ]]
    local v33 = {};
    if v32 == Enum.AssetType.DynamicHead then
        table.insert(v33, v31.Name);
        return v33;
    else
        for _, v35 in v31:GetChildren() do
            if v35:IsA("MeshPart") then
                table.insert(v33, v35.Name);
            end;
        end;
        return v33;
    end;
end;
local function v44(v37, v38, v39) --[[ Line: 92 ]] --[[ Name: calculateMeshScales ]]
    -- upvalues: v4 (copy)
    local v40 = {};
    for _, v42 in v37 do
        local v43 = v39(v42);
        v40[v42] = v4(v43, v38) / v4(v43, v38, true);
    end;
    return v40;
end;
local function v63(v45, v46, v47, v48, v49, v50) --[[ Line: 108 ]] --[[ Name: checkInflatingGeo ]]
    -- upvalues: v30 (copy), v9 (copy)
    local v51 = {};
    for _, v53 in v46 do
        local v54 = v30(v45, v53.extents);
        table.insert(v51, {
            extents = v53.extents, 
            inflated = v54, 
            worldSpacePosition = v53.worldSpacePosition
        });
    end;
    table.sort(v51, function(v55, v56) --[[ Line: 125 ]]
        return v55.inflated > v56.inflated;
    end);
    local v57 = tonumber(v9());
    local v58 = {};
    local v59 = 1;
    while v59 <= #v51 and v57 < v51[v59].inflated and #v58 < v47 do
        table.insert(v58, v51[v59]);
        v59 = v59 + 1;
    end;
    if #v58 > 0 then
        local v60 = "";
        for v61 = 1, #v58 do
            if v61 > 1 then
                v60 = if v61 == #v58 then v60 .. ", and " else v60 .. ", ";
            end;
            local l_worldSpacePosition_0 = v58[v61].worldSpacePosition;
            v60 = v60 .. string.format("{%.4f, %.4f, %.4f}", l_worldSpacePosition_0.X, l_worldSpacePosition_0.Y, l_worldSpacePosition_0.Z);
        end;
        v50:updateReasons(false, {
            string.format("Detected %s centered around: %s that increases %s bounding box. Remove the geometry or increase its size so that it is more visible", v48, v60, v49.Name)
        });
    end;
end;
local function v82(v64, v65, v66, v67, v68, v69) --[[ Line: 167 ]] --[[ Name: getWorldPositions ]]
    local v70 = {};
    for _, v72 in v68 do
        local v73 = v69(v72);
        local l_CFrame_0 = v73.CFrame;
        local v75 = v73.Size / v73.MeshSize;
        for _, v77 in v64[v72][v67] do
            local v78 = (v77.min + v77.max) / 2;
            local v79 = v65[v72];
            local v80 = v66[v72];
            local v81 = l_CFrame_0 * (v79:Inverse() * v78 / v80 * v75);
            table.insert(v70, {
                extents = v77, 
                worldSpacePosition = v81
            });
        end;
    end;
    return v70;
end;
return function(v83, v84) --[[ Line: 202 ]] --[[ Name: validateAccurateBoundingBox ]]
    -- upvalues: v36 (copy), v3 (copy), v44 (copy), v5 (copy), v7 (copy), l_UGCValidationService_0 (copy), v16 (copy), v82 (copy), v6 (copy), v63 (copy), v2 (copy)
    local l_assetTypeEnum_0 = v84.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local v86 = v36(v83, l_assetTypeEnum_0);
    local v87 = v3.calculateAllTransformsForAsset(l_assetTypeEnum_0, v83);
    local function v89(v88) --[[ Line: 213 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_0 (copy), v83 (copy)
        if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
            return v83;
        else
            return (v83:FindFirstChild(v88));
        end;
    end;
    if l_assetTypeEnum_0 ~= Enum.AssetType.DynamicHead and l_assetTypeEnum_0 ~= Enum.AssetType.Torso then
        for v90, v91 in (v3.calculateStraightenedLimb(l_assetTypeEnum_0, v87, v89)) do
            v87[v90] = v91;
        end;
    end;
    local v92 = v44(v86, v84, v89);
    local v93 = {};
    for _, v95 in v86 do
        local v96 = if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then v83 else v83:FindFirstChild(v95);
        local v97, v98 = v5(v96, "MeshId", v84);
        if not v97 then
            return false, {
                string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v96.Name)
            };
        else
            v93[v95] = v98;
        end;
    end;
    local v99 = {};
    local v100 = {};
    local v101 = {};
    for _, v103 in v86 do
        table.insert(v99, v93[v103]);
        table.insert(v100, v87[v103]);
        table.insert(v101, v92[v103]);
    end;
    local v104, v105 = v7(function() --[[ Line: 254 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v99 (copy), v100 (copy), v101 (copy)
        return l_UGCValidationService_0:GetBoundingBoxManipulationData(v99, v100, v101);
    end, v84);
    if not v104 then
        local v106 = string.format("Could not get bounding box manipulation metrics for %s", l_assetTypeEnum_0.Name);
        if v84.isServer then
            error(v106);
        else
            return false, {
                v106
            };
        end;
    end;
    local v107 = {
        min = v105.minValidExtents, 
        max = v105.maxValidExtents
    };
    if not v16(v107) then
        return false, {
            string.format("%s mesh is too small or made of disconnected pieces that are too small", l_assetTypeEnum_0.Name)
        };
    else
        local v108 = {};
        for v109, v110 in v105.partsProblemGeos do
            v108[v86[v109]] = v110;
        end;
        local v111 = v82(v108, v87, v92, "smallIslands", v86, v89);
        local v112 = v82(v108, v87, v92, "skinnyTris", v86, v89);
        local v113 = v6.new();
        v63(v107, v111, 3, "small geometry", l_assetTypeEnum_0, v113);
        v63(v107, v112, 3, "skinny triangle(s)", l_assetTypeEnum_0, v113);
        if not v113:getFinalResults() then
            v2.reportFailure(v2.ErrorType.validateAccurateBoundingBox, nil, v84);
        end;
        return v113:getFinalResults();
    end;
end;