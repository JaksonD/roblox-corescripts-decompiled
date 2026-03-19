local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.util.AssetCalculator);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.util.getMeshVerts);
local v7 = require(l_Parent_0.util.getMeshInfo);
local v8 = require(l_Parent_0.util.BoundsDataUtils);
local v9 = require(l_Parent_0.util.getExpectedPartSize);
local v10 = require(l_Parent_0.flags.getFFlagUGCValidateLegFullBodySeparation);
local v11 = {};
local function v17(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: orientSingleAssetToWorldAxes ]]
    -- upvalues: v4 (copy)
    if v13 ~= Enum.AssetType.LeftArm and v13 ~= Enum.AssetType.RightArm and v13 ~= Enum.AssetType.LeftLeg and v13 ~= Enum.AssetType.RightLeg then
        return;
    else
        for v15, v16 in (v4.calculateStraightenedLimb(v13, v12, v14)) do
            v12[v15] = v16;
        end;
        return;
    end;
end;
local function v33(v18, v19) --[[ Line: 49 ]] --[[ Name: orientFullBodyArmsLegsToWorldAxes ]]
    -- upvalues: v17 (copy), v5 (copy), v3 (copy)
    local function v32(v20, v21) --[[ Line: 50 ]] --[[ Name: orientAndMoveParts ]]
        -- upvalues: v17 (ref), v18 (copy), v19 (copy), v5 (ref), v3 (ref)
        v17(v18, v20, v19);
        local v22 = v5(v20);
        local v23 = v19(v22[1]);
        local v24 = v3.getRigAttachmentToParent(v20, v23.Name);
        local l_v23_FirstChild_0 = v23:FindFirstChild(v24);
        assert(l_v23_FirstChild_0);
        local v26 = v18[v23.Name] * l_v23_FirstChild_0.CFrame;
        local v27 = v19(v21);
        assert(v27);
        local l_v27_FirstChild_0 = v27:FindFirstChild(v24);
        assert(l_v27_FirstChild_0);
        local v29 = (v18[v27.Name] * l_v27_FirstChild_0.CFrame).Position - v26.Position;
        for _, v31 in v22 do
            v18[v31] = CFrame.new(v18[v31].Position + v29) * v18[v31].Rotation;
        end;
    end;
    v32(Enum.AssetType.LeftArm, "UpperTorso");
    v32(Enum.AssetType.RightArm, "UpperTorso");
    v32(Enum.AssetType.LeftLeg, "LowerTorso");
    v32(Enum.AssetType.RightLeg, "LowerTorso");
end;
local function v53(v34, v35, v36, v37, v38) --[[ Line: 81 ]] --[[ Name: calculateBoundsDataForPart ]]
    -- upvalues: v9 (copy), v6 (copy), v8 (copy), v3 (copy)
    assert(v34 ~= nil ~= (v38 ~= nil));
    local l_MeshSize_0 = v35.MeshSize;
    local v40 = v9(v35, v37) / l_MeshSize_0;
    local v41 = nil;
    if v38 then
        if v38.meshData and v38.meshData[v35.MeshId] then
            local l_verts_0 = v38.meshData[v35.MeshId].verts;
            if l_verts_0 then
                v41 = l_verts_0;
            end;
        end;
        if not v41 then
            return false, {
                "Verts not found in data cache"
            };
        end;
    end;
    if not v41 then
        local v43, v44, v45 = v6(v34, v37);
        if not v43 then
            return v43, v44;
        else
            v41 = v45;
        end;
    end;
    local v46 = {};
    for _, v48 in v41 do
        v8.expandMeshBounds(v46, v36:PointToWorldSpace(v48 * v40));
    end;
    for _, v50 in v3.getAttachments(nil, v35.Name) do
        if string.match(v50, "RigAttachment$") ~= nil then
            local l_v35_FirstChild_0 = v35:FindFirstChild(v50);
            assert(l_v35_FirstChild_0);
            local v52 = v36 * l_v35_FirstChild_0.CFrame;
            v8.expandRigAttachmentBounds(v46, v52.Position);
        end;
    end;
    v8.setOverallBounds(v46);
    return true, nil, v46;
end;
local function v72(v54, v55, v56, v57) --[[ Line: 139 ]] --[[ Name: calculateAllPartsBoundsData ]]
    -- upvalues: v7 (copy), v1 (copy), v53 (copy)
    local v58 = {};
    for v59, v60 in v54 do
        local v61 = v55(v59);
        local v62 = nil;
        if not v57 then
            local v63 = nil;
            local v64 = nil;
            local v65 = nil;
            local v66, v67, v68 = v7(v61, v1.MESH_CONTENT_TYPE.RENDER_MESH, v56);
            v63 = v66;
            v64 = v67;
            v65 = v68;
            if not v63 then
                return v63, v64;
            else
                v62 = v65;
            end;
        end;
        local v69, v70, v71 = v53(v62, v61, v60, v56, v57);
        if not v69 then
            return v69, v70;
        else
            v58[v59] = v71;
        end;
    end;
    return true, nil, v58;
end;
local function v82(v73, v74, v75) --[[ Line: 170 ]] --[[ Name: calculateTotalBoundsForAsset ]]
    -- upvalues: v72 (copy), v8 (copy)
    local v76, v77, v78 = v72(v73, v74, v75);
    if not v76 then
        return v76, v77;
    else
        local v79 = {};
        for _, v81 in v78 do
            v79 = v8.combineBounds(v79, v81);
        end;
        return true, nil, v79;
    end;
end;
local function v90(v83, v84) --[[ Line: 189 ]] --[[ Name: calculatePartBounds ]]
    -- upvalues: v82 (copy)
    local v85 = {
        [v83.Name] = CFrame.new()
    };
    local v87, v88, v89 = v82(v85, function(v86) --[[ Line: 194 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v83 (copy)
        assert(v86 == v83.Name);
        return v83;
    end, v84);
    if not v87 then
        return v87, v88;
    else
        return true, nil, v89;
    end;
end;
v11.calculateAssetBounds = function(v91, v92) --[[ Line: 208 ]] --[[ Name: calculateAssetBounds ]]
    -- upvalues: v90 (copy), v4 (copy), v17 (copy), v82 (copy)
    local l_assetTypeEnum_0 = v92.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        return v90(v91, v92);
    else
        local v94 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_0, v91);
        local function v96(v95) --[[ Line: 221 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v91 (copy)
            return (v91:FindFirstChild(v95));
        end;
        v17(v94, l_assetTypeEnum_0, v96);
        local v97, v98, v99 = v82(v94, v96, v92);
        if not v97 then
            return v97, v98;
        else
            return true, nil, v99;
        end;
    end;
end;
v11.calculateIndividualAssetPartsData = function(v100, v101) --[[ Line: 237 ]] --[[ Name: calculateIndividualAssetPartsData ]]
    -- upvalues: v4 (copy), v17 (copy), v72 (copy)
    local l_assetTypeEnum_1 = v101.assetTypeEnum;
    assert(l_assetTypeEnum_1);
    local v103 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_1, v100);
    local function v105(v104) --[[ Line: 246 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_1 (copy), v100 (copy)
        if l_assetTypeEnum_1 == Enum.AssetType.DynamicHead then
            return v100;
        else
            return (v100:FindFirstChild(v104));
        end;
    end;
    v17(v103, l_assetTypeEnum_1, v105);
    local v106, v107, v108 = v72(v103, v105, v101);
    if not v106 then
        return v106, v107;
    else
        local v109 = {};
        for v110, v111 in v108 do
            v109[v110] = {
                boundsData = v111, 
                cframe = v103[v110]
            };
        end;
        return true, nil, v109;
    end;
end;
v11.calculateIndividualFullBodyPartsData = function(v112, v113, v114, v115) --[[ Line: 271 ]] --[[ Name: calculateIndividualFullBodyPartsData ]]
    -- upvalues: v4 (copy), v10 (copy), v33 (copy), v72 (copy)
    local function v117(v116) --[[ Line: 277 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v112 (copy)
        return v112[v116];
    end;
    local v118 = v4.calculateAllTransformsForFullBody(v112);
    if v10() then
        if v115 then
            v33(v118, v117);
        end;
    else
        v33(v118, v117);
    end;
    local v119, v120, v121 = v72(v118, v117, v113, v114);
    if not v119 then
        return v119, v120;
    else
        local v122 = {};
        for v123, v124 in v121 do
            v122[v123] = {
                boundsData = v124, 
                cframe = v118[v123]
            };
        end;
        return true, nil, v122;
    end;
end;
v11.calculateFullBodyBounds = function(v125, v126) --[[ Line: 304 ]] --[[ Name: calculateFullBodyBounds ]]
    -- upvalues: v4 (copy), v33 (copy), v82 (copy)
    local function v128(v127) --[[ Line: 308 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v125 (copy)
        return v125[v127];
    end;
    local v129 = v4.calculateAllTransformsForFullBody(v125);
    v33(v129, v128);
    local v130, v131, v132 = v82(v129, v128, v126);
    if not v130 then
        return v130, v131;
    else
        return true, nil, v132;
    end;
end;
return v11;