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
local v11 = require(l_Parent_0.util.R15plusUtils);
local v12 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v13 = {};
local function v19(v14, v15, v16) --[[ Line: 33 ]] --[[ Name: orientSingleAssetToWorldAxes ]]
    -- upvalues: v4 (copy)
    if v15 ~= Enum.AssetType.LeftArm and v15 ~= Enum.AssetType.RightArm and v15 ~= Enum.AssetType.LeftLeg and v15 ~= Enum.AssetType.RightLeg then
        return;
    else
        for v17, v18 in (v4.calculateStraightenedLimb(v15, v14, v16)) do
            v14[v17] = v18;
        end;
        return;
    end;
end;
local function v35(v20, v21) --[[ Line: 54 ]] --[[ Name: orientFullBodyArmsLegsToWorldAxes ]]
    -- upvalues: v19 (copy), v5 (copy), v3 (copy), v11 (copy), v12 (copy)
    local function v34(v22, v23) --[[ Line: 55 ]] --[[ Name: orientAndMoveParts ]]
        -- upvalues: v19 (ref), v20 (copy), v21 (copy), v5 (ref), v3 (ref), v11 (ref), v12 (ref)
        v19(v20, v22, v21);
        local v24 = v5(v22);
        local v25 = v21(v24[1]);
        local v26 = v3.getRigAttachmentToParent(v22, v25.Name);
        local l_v25_FirstChild_0 = v25:FindFirstChild(v26, v11.checkFlagEnabledForAllowHrd());
        assert(l_v25_FirstChild_0);
        local v28 = v20[v25.Name] * v12(l_v25_FirstChild_0);
        local v29 = v21(v23);
        assert(v29);
        local l_v29_FirstChild_0 = v29:FindFirstChild(v26, v11.checkFlagEnabledForAllowHrd());
        assert(l_v29_FirstChild_0);
        local v31 = (v20[v29.Name] * v12(l_v29_FirstChild_0)).Position - v28.Position;
        for _, v33 in v24 do
            v20[v33] = CFrame.new(v20[v33].Position + v31) * v20[v33].Rotation;
        end;
    end;
    v34(Enum.AssetType.LeftArm, "UpperTorso");
    v34(Enum.AssetType.RightArm, "UpperTorso");
    v34(Enum.AssetType.LeftLeg, "LowerTorso");
    v34(Enum.AssetType.RightLeg, "LowerTorso");
end;
local function v55(v36, v37, v38, v39, v40) --[[ Line: 90 ]] --[[ Name: calculateBoundsDataForPart ]]
    -- upvalues: v9 (copy), v6 (copy), v8 (copy), v3 (copy), v11 (copy), v12 (copy)
    assert(v36 ~= nil ~= (v40 ~= nil));
    local l_MeshSize_0 = v37.MeshSize;
    local v42 = v9(v37, v39) / l_MeshSize_0;
    local v43 = nil;
    if v40 then
        if v40.meshData and v40.meshData[v37.MeshId] then
            local l_verts_0 = v40.meshData[v37.MeshId].verts;
            if l_verts_0 then
                v43 = l_verts_0;
            end;
        end;
        if not v43 then
            return false, {
                "Verts not found in data cache"
            };
        end;
    end;
    if not v43 then
        local v45, v46, v47 = v6(v36, v39);
        if not v45 then
            return v45, v46;
        else
            v43 = v47;
        end;
    end;
    local v48 = {};
    for _, v50 in v43 do
        v8.expandMeshBounds(v48, v38:PointToWorldSpace(v50 * v42));
    end;
    for _, v52 in v3.getAttachments(nil, v37.Name) do
        if string.match(v52, "RigAttachment$") ~= nil then
            local l_v37_FirstChild_0 = v37:FindFirstChild(v52, v11.checkFlagEnabledForAllowHrd());
            assert(l_v37_FirstChild_0);
            local v54 = v38 * v12(l_v37_FirstChild_0);
            v8.expandRigAttachmentBounds(v48, v54.Position);
        end;
    end;
    v8.setOverallBounds(v48);
    return true, nil, v48;
end;
local function v74(v56, v57, v58, v59) --[[ Line: 148 ]] --[[ Name: calculateAllPartsBoundsData ]]
    -- upvalues: v7 (copy), v1 (copy), v55 (copy)
    local v60 = {};
    for v61, v62 in v56 do
        local v63 = v57(v61);
        local v64 = nil;
        if not v59 then
            local v65 = nil;
            local v66 = nil;
            local v67 = nil;
            local v68, v69, v70 = v7(v63, v1.MESH_CONTENT_TYPE.RENDER_MESH, v58);
            v65 = v68;
            v66 = v69;
            v67 = v70;
            if not v65 then
                return v65, v66;
            else
                v64 = v67;
            end;
        end;
        local v71, v72, v73 = v55(v64, v63, v62, v58, v59);
        if not v71 then
            return v71, v72;
        else
            v60[v61] = v73;
        end;
    end;
    return true, nil, v60;
end;
local function v84(v75, v76, v77) --[[ Line: 179 ]] --[[ Name: calculateTotalBoundsForAsset ]]
    -- upvalues: v74 (copy), v8 (copy)
    local v78, v79, v80 = v74(v75, v76, v77);
    if not v78 then
        return v78, v79;
    else
        local v81 = {};
        for _, v83 in v80 do
            v81 = v8.combineBounds(v81, v83);
        end;
        return true, nil, v81;
    end;
end;
local function v92(v85, v86) --[[ Line: 198 ]] --[[ Name: calculatePartBounds ]]
    -- upvalues: v84 (copy)
    local v87 = {
        [v85.Name] = CFrame.new()
    };
    local v89, v90, v91 = v84(v87, function(v88) --[[ Line: 203 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v85 (copy)
        assert(v88 == v85.Name);
        return v85;
    end, v86);
    if not v89 then
        return v89, v90;
    else
        return true, nil, v91;
    end;
end;
v13.calculateAssetBounds = function(v93, v94) --[[ Line: 217 ]] --[[ Name: calculateAssetBounds ]]
    -- upvalues: v92 (copy), v4 (copy), v19 (copy), v84 (copy)
    local l_assetTypeEnum_0 = v94.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        return v92(v93, v94);
    else
        local v96 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_0, v93);
        local function v98(v97) --[[ Line: 230 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v93 (copy)
            return (v93:FindFirstChild(v97));
        end;
        v19(v96, l_assetTypeEnum_0, v98);
        local v99, v100, v101 = v84(v96, v98, v94);
        if not v99 then
            return v99, v100;
        else
            return true, nil, v101;
        end;
    end;
end;
v13.calculateIndividualAssetPartsData = function(v102, v103) --[[ Line: 246 ]] --[[ Name: calculateIndividualAssetPartsData ]]
    -- upvalues: v4 (copy), v19 (copy), v74 (copy)
    local l_assetTypeEnum_1 = v103.assetTypeEnum;
    assert(l_assetTypeEnum_1);
    local v105 = v4.calculateAllTransformsForAsset(l_assetTypeEnum_1, v102);
    local function v107(v106) --[[ Line: 255 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_1 (copy), v102 (copy)
        if l_assetTypeEnum_1 == Enum.AssetType.DynamicHead then
            return v102;
        else
            return (v102:FindFirstChild(v106));
        end;
    end;
    v19(v105, l_assetTypeEnum_1, v107);
    local v108, v109, v110 = v74(v105, v107, v103);
    if not v108 then
        return v108, v109;
    else
        local v111 = {};
        for v112, v113 in v110 do
            v111[v112] = {
                boundsData = v113, 
                cframe = v105[v112]
            };
        end;
        return true, nil, v111;
    end;
end;
v13.calculateIndividualFullBodyPartsData = function(v114, v115, v116, v117) --[[ Line: 280 ]] --[[ Name: calculateIndividualFullBodyPartsData ]]
    -- upvalues: v4 (copy), v10 (copy), v35 (copy), v74 (copy)
    local function v119(v118) --[[ Line: 286 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v114 (copy)
        return v114[v118];
    end;
    local v120 = v4.calculateAllTransformsForFullBody(v114);
    if v10() then
        if v117 then
            v35(v120, v119);
        end;
    else
        v35(v120, v119);
    end;
    local v121, v122, v123 = v74(v120, v119, v115, v116);
    if not v121 then
        return v121, v122;
    else
        local v124 = {};
        for v125, v126 in v123 do
            v124[v125] = {
                boundsData = v126, 
                cframe = v120[v125]
            };
        end;
        return true, nil, v124;
    end;
end;
v13.calculateFullBodyBounds = function(v127, v128) --[[ Line: 313 ]] --[[ Name: calculateFullBodyBounds ]]
    -- upvalues: v4 (copy), v35 (copy), v84 (copy)
    local function v130(v129) --[[ Line: 317 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v127 (copy)
        return v127[v129];
    end;
    local v131 = v4.calculateAllTransformsForFullBody(v127);
    v35(v131, v130);
    local v132, v133, v134 = v84(v131, v130, v128);
    if not v132 then
        return v132, v133;
    else
        return true, nil, v134;
    end;
end;
return v13;