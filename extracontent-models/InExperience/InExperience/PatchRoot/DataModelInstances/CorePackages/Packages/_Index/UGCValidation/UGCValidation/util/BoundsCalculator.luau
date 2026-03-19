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
local v10 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidateLegFullBodySeparation);
local v12 = {};
local function v18(v13, v14, v15) --[[ Line: 30 ]] --[[ Name: orientSingleAssetToWorldAxes ]]
    -- upvalues: v4 (copy)
    if v14 ~= Enum.AssetType.LeftArm and v14 ~= Enum.AssetType.RightArm and v14 ~= Enum.AssetType.LeftLeg and v14 ~= Enum.AssetType.RightLeg then
        return;
    else
        for v16, v17 in (v4.calculateStraightenedLimb(v14, v13, v15)) do
            v13[v16] = v17;
        end;
        return;
    end;
end;
local function v34(v19, v20) --[[ Line: 51 ]] --[[ Name: orientFullBodyArmsLegsToWorldAxes ]]
    -- upvalues: v18 (copy), v5 (copy), v3 (copy)
    local function v33(v21, v22) --[[ Line: 52 ]] --[[ Name: orientAndMoveParts ]]
        -- upvalues: v18 (ref), v19 (copy), v20 (copy), v5 (ref), v3 (ref)
        v18(v19, v21, v20);
        local v23 = v5(v21);
        local v24 = v20(v23[1]);
        local v25 = v3.getRigAttachmentToParent(v21, v24.Name);
        local l_v24_FirstChild_0 = v24:FindFirstChild(v25);
        assert(l_v24_FirstChild_0);
        local v27 = v19[v24.Name] * l_v24_FirstChild_0.CFrame;
        local v28 = v20(v22);
        assert(v28);
        local l_v28_FirstChild_0 = v28:FindFirstChild(v25);
        assert(l_v28_FirstChild_0);
        local v30 = (v19[v28.Name] * l_v28_FirstChild_0.CFrame).Position - v27.Position;
        for _, v32 in v23 do
            v19[v32] = CFrame.new(v19[v32].Position + v30) * v19[v32].Rotation;
        end;
    end;
    v33(Enum.AssetType.LeftArm, "UpperTorso");
    v33(Enum.AssetType.RightArm, "UpperTorso");
    v33(Enum.AssetType.LeftLeg, "LowerTorso");
    v33(Enum.AssetType.RightLeg, "LowerTorso");
end;
local function v54(v35, v36, v37, v38, v39) --[[ Line: 83 ]] --[[ Name: calculateBoundsDataForPart ]]
    -- upvalues: v9 (copy), v6 (copy), v8 (copy), v3 (copy)
    assert(v35 ~= nil ~= (v39 ~= nil));
    local l_MeshSize_0 = v36.MeshSize;
    local v41 = v9(v36, v38) / l_MeshSize_0;
    local v42 = nil;
    if v39 then
        if v39.meshData and v39.meshData[v36.MeshId] then
            local l_verts_0 = v39.meshData[v36.MeshId].verts;
            if l_verts_0 then
                v42 = l_verts_0;
            end;
        end;
        if not v42 then
            return false, {
                "Verts not found in data cache"
            };
        end;
    end;
    if not v42 then
        local v44, v45, v46 = v6(v35, v38);
        if not v44 then
            return v44, v45;
        else
            v42 = v46;
        end;
    end;
    local v47 = {};
    for _, v49 in v42 do
        v8.expandMeshBounds(v47, v37:PointToWorldSpace(v49 * v41));
    end;
    for _, v51 in v3.getAttachments(nil, v36.Name) do
        if string.match(v51, "RigAttachment$") ~= nil then
            local l_v36_FirstChild_0 = v36:FindFirstChild(v51);
            assert(l_v36_FirstChild_0);
            local v53 = v37 * l_v36_FirstChild_0.CFrame;
            v8.expandRigAttachmentBounds(v47, v53.Position);
        end;
    end;
    v8.setOverallBounds(v47);
    return true, nil, v47;
end;
local function v76(v55, v56, v57, v58) --[[ Line: 141 ]] --[[ Name: calculateAllPartsBoundsData ]]
    -- upvalues: v10 (copy), v7 (copy), v1 (copy), v54 (copy)
    local v59 = {};
    for v60, v61 in v55 do
        local v62 = v56(v60);
        local v63 = nil;
        if not v58 then
            local v64 = nil;
            local v65 = nil;
            local v66 = nil;
            if v10() then
                local v67, v68, v69 = v7(v62, v1.MESH_CONTENT_TYPE.RENDER_MESH, v57);
                v64 = v67;
                v65 = v68;
                v66 = v69;
            else
                local v70, v71, v72 = v7(v62, v57);
                v64 = v70;
                v65 = v71;
                v66 = v72;
            end;
            if not v64 then
                return v64, v65;
            else
                v63 = v66;
            end;
        end;
        local v73, v74, v75 = v54(v63, v62, v61, v57, v58);
        if not v73 then
            return v73, v74;
        else
            v59[v60] = v75;
        end;
    end;
    return true, nil, v59;
end;
local function v86(v77, v78, v79) --[[ Line: 176 ]] --[[ Name: calculateTotalBoundsForAsset ]]
    -- upvalues: v76 (copy), v8 (copy)
    local v80, v81, v82 = v76(v77, v78, v79);
    if not v80 then
        return v80, v81;
    else
        local v83 = {};
        for _, v85 in v82 do
            v83 = v8.combineBounds(v83, v85);
        end;
        return true, nil, v83;
    end;
end;
local function v94(v87, v88) --[[ Line: 195 ]] --[[ Name: calculatePartBounds ]]
    -- upvalues: v86 (copy)
    local v89 = {
        [v87.Name] = CFrame.new()
    };
    local v91, v92, v93 = v86(v89, function(v90) --[[ Line: 200 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v87 (copy)
        assert(v90 == v87.Name);
        return v87;
    end, v88);
    if not v91 then
        return v91, v92;
    else
        return true, nil, v93;
    end;
end;
v12.calculateAssetBounds = function(v95, v96) --[[ Line: 214 ]] --[[ Name: calculateAssetBounds ]]
    -- upvalues: v94 (copy), v4 (copy), v18 (copy), v86 (copy)
    local l_assetTypeEnum_0 = v96.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        return v94(v95, v96);
    else
        local v98 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_0, v95);
        local function v100(v99) --[[ Line: 227 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v95 (copy)
            return (v95:FindFirstChild(v99));
        end;
        v18(v98, l_assetTypeEnum_0, v100);
        local v101, v102, v103 = v86(v98, v100, v96);
        if not v101 then
            return v101, v102;
        else
            return true, nil, v103;
        end;
    end;
end;
v12.calculateIndividualAssetPartsData = function(v104, v105) --[[ Line: 243 ]] --[[ Name: calculateIndividualAssetPartsData ]]
    -- upvalues: v4 (copy), v18 (copy), v76 (copy)
    local l_assetTypeEnum_1 = v105.assetTypeEnum;
    assert(l_assetTypeEnum_1);
    local v107 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_1, v104);
    local function v109(v108) --[[ Line: 252 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_1 (copy), v104 (copy)
        if l_assetTypeEnum_1 == Enum.AssetType.DynamicHead then
            return v104;
        else
            return (v104:FindFirstChild(v108));
        end;
    end;
    v18(v107, l_assetTypeEnum_1, v109);
    local v110, v111, v112 = v76(v107, v109, v105);
    if not v110 then
        return v110, v111;
    else
        local v113 = {};
        for v114, v115 in v112 do
            v113[v114] = {
                boundsData = v115, 
                cframe = v107[v114]
            };
        end;
        return true, nil, v113;
    end;
end;
v12.calculateIndividualFullBodyPartsData = function(v116, v117, v118, v119) --[[ Line: 277 ]] --[[ Name: calculateIndividualFullBodyPartsData ]]
    -- upvalues: v4 (copy), v11 (copy), v34 (copy), v76 (copy)
    local function v121(v120) --[[ Line: 283 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v116 (copy)
        return v116[v120];
    end;
    local v122 = v4.calculateAllTransformsForFullBody(v116);
    if v11() then
        if v119 then
            v34(v122, v121);
        end;
    else
        v34(v122, v121);
    end;
    local v123, v124, v125 = v76(v122, v121, v117, v118);
    if not v123 then
        return v123, v124;
    else
        local v126 = {};
        for v127, v128 in v125 do
            v126[v127] = {
                boundsData = v128, 
                cframe = v122[v127]
            };
        end;
        return true, nil, v126;
    end;
end;
v12.calculateFullBodyBounds = function(v129, v130) --[[ Line: 310 ]] --[[ Name: calculateFullBodyBounds ]]
    -- upvalues: v4 (copy), v34 (copy), v86 (copy)
    local function v132(v131) --[[ Line: 314 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v129 (copy)
        return v129[v131];
    end;
    local v133 = v4.calculateAllTransformsForFullBody(v129);
    v34(v133, v132);
    local v134, v135, v136 = v86(v133, v132, v130);
    if not v134 then
        return v134, v135;
    else
        return true, nil, v136;
    end;
end;
return v12;