local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.canBeNormalized);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.util.AssetTraversalUtils);
local v7 = require(l_Parent_0.util.getMeshScales);
local v8 = {
    root = "LowerTorso", 
    children = {
        UpperTorso = {
            children = {
                Head = v6.assetHierarchy[Enum.AssetType.DynamicHead], 
                LeftUpperArm = v6.assetHierarchy[Enum.AssetType.LeftArm], 
                RightUpperArm = v6.assetHierarchy[Enum.AssetType.RightArm]
            }
        }, 
        LeftUpperLeg = v6.assetHierarchy[Enum.AssetType.LeftLeg], 
        RightUpperLeg = v6.assetHierarchy[Enum.AssetType.RightLeg]
    }
};
local v9 = {
    root = "HumanoidRootPart", 
    children = {
        LowerTorso = v8
    }
};
local v10 = {};
local function v16(v11, v12) --[[ Line: 55 ]] --[[ Name: calculateCFrame ]]
    -- upvalues: v4 (copy)
    local v13 = v11 - v12;
    if not v4(v13) then
        return;
    else
        v13 = v13.Unit;
        local l_Unit_0 = v13:Cross((Vector3.new(0, 0, 1, 0))).Unit;
        if not v4(l_Unit_0) then
            l_Unit_0 = v13:Cross(if v13.Z < 0 then Vector3.new(0, 1, 0, 0) else Vector3.new(-0, -1, -0, -0)).Unit;
        end;
        local l_Unit_1 = l_Unit_0:Cross(v13).Unit;
        return CFrame.fromMatrix(v11, l_Unit_0, v13, l_Unit_1);
    end;
end;
local function v28(v17, v18, v19, v20, v21) --[[ Line: 74 ]] --[[ Name: calculatePartTransformInHierarchy ]]
    -- upvalues: v2 (copy)
    local v22 = if v21 and v21[v17.Name] then v21[v17.Name] else CFrame.new();
    local l_v19_0 = v19;
    if v18 then
        local v24 = v20(v18);
        assert(v24);
        local v25 = v2.getRigAttachmentToParent(nil, v17.Name);
        local l_v24_FirstChild_0 = v24:FindFirstChild(v25);
        assert(l_v24_FirstChild_0);
        local l_v17_FirstChild_0 = v17:FindFirstChild(v25);
        assert(l_v17_FirstChild_0);
        return l_v19_0 * l_v24_FirstChild_0.CFrame * v22 * l_v17_FirstChild_0.CFrame:Inverse();
    else
        return v22;
    end;
end;
local function v42(v29, v30, v31) --[[ Line: 105 ]] --[[ Name: calculateHierarchyTransforms ]]
    -- upvalues: v28 (copy)
    local v32 = {};
    local function v33(v34, v35, v36, v37) --[[ Line: 112 ]] --[[ Name: calculateAllTransformsInternal ]]
        -- upvalues: v30 (copy), v28 (ref), v31 (copy), v32 (copy), v33 (copy)
        local v38 = v30(v34);
        assert(v38);
        local v39 = v28(v38, v35, v37, v30, v31);
        v32[v38.Name] = v39;
        if not v36.children then
            return;
        else
            for v40, v41 in v36.children do
                v33(v40, v34, v41, v39);
            end;
            return;
        end;
    end;
    v33(v29.root, nil, v29, CFrame.new());
    return v32;
end;
local function _(v43, v44) --[[ Line: 133 ]] --[[ Name: calculateLocalSpaceTransform ]]
    local v45 = v43.Rotation:Inverse() * v44.Rotation;
    local v46 = v43.Rotation:Inverse() * (v44.Position - v43.Position);
    return CFrame.new(v46) * v45;
end;
local function v53(v48, v49) --[[ Line: 140 ]] --[[ Name: calculateAssetCFrameFromPartsCFrames ]]
    -- upvalues: v5 (copy), v16 (copy)
    local v50 = v5(v48);
    local l_Position_0 = v49[v50[1]].Position;
    local l_Position_1 = v49[v50[3]].Position;
    return v16(l_Position_0, l_Position_1);
end;
local function _(v54) --[[ Line: 151 ]] --[[ Name: assertTypesToOrient ]]
    local v55 = true;
    if v54 ~= Enum.AssetType.LeftArm then
        v55 = true;
        if v54 ~= Enum.AssetType.RightArm then
            v55 = true;
            if v54 ~= Enum.AssetType.LeftLeg then
                v55 = v54 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v55);
end;
local function _(v57, v58, v59) --[[ Line: 160 ]] --[[ Name: getAttachmentCFrame ]]
    local l_v57_FirstChild_0 = v57:FindFirstChild(v58);
    assert(l_v57_FirstChild_0);
    return v59 * l_v57_FirstChild_0.CFrame;
end;
v10.calculatePartCFrameFromRigAttachments = function(v62, v63, v64) --[[ Line: 166 ]] --[[ Name: calculatePartCFrameFromRigAttachments ]]
    -- upvalues: v2 (copy), v6 (copy), v16 (copy)
    local v65 = true;
    if v62 ~= Enum.AssetType.LeftArm then
        v65 = true;
        if v62 ~= Enum.AssetType.RightArm then
            v65 = true;
            if v62 ~= Enum.AssetType.LeftLeg then
                v65 = v62 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v65);
    local v66 = v2.getRigAttachmentToParent(v62, v63.Name);
    if v66 == "" then
        return;
    else
        local l_v63_FirstChild_0 = v63:FindFirstChild(v66);
        assert(l_v63_FirstChild_0);
        v65 = v64 * l_v63_FirstChild_0.CFrame;
        l_v63_FirstChild_0 = v6.getAssetRigChild(v62, v63.Name);
        if not l_v63_FirstChild_0 then
            return;
        else
            local l_v63_FirstChild_1 = v63:FindFirstChild((v2.getRigAttachmentToParent(v62, l_v63_FirstChild_0)));
            assert(l_v63_FirstChild_1);
            local v69 = v64 * l_v63_FirstChild_1.CFrame;
            return v16(v65.Position, v69.Position);
        end;
    end;
end;
v10.calculateStraightenedLimb = function(v70, v71, v72) --[[ Line: 190 ]] --[[ Name: calculateStraightenedLimb ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v10 (copy), v2 (copy)
    local v73 = true;
    if v70 ~= Enum.AssetType.LeftArm then
        v73 = true;
        if v70 ~= Enum.AssetType.RightArm then
            v73 = true;
            if v70 ~= Enum.AssetType.LeftLeg then
                v73 = v70 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v73);
    local v74 = v1.Dictionary.join(v71);
    v73 = nil;
    local v75 = CFrame.new();
    for _, v77 in v5(v70) do
        local v78 = v72(v77);
        local l_v75_0 = v75;
        local v80 = v6.getAssetRigChild(v70, v77);
        local v81 = v80 == nil;
        if not v81 then
            l_v75_0 = v10.calculatePartCFrameFromRigAttachments(v70, v78, v71[v77]) or l_v75_0;
        end;
        local l_l_v75_0_0 = l_v75_0;
        local v83 = v71[v77];
        local v84 = l_l_v75_0_0.Rotation:Inverse() * v83.Rotation;
        local v85 = l_l_v75_0_0.Rotation:Inverse() * (v83.Position - l_l_v75_0_0.Position);
        v74[v77] = CFrame.new(v85) * v84;
        if v73 then
            l_l_v75_0_0 = v2.getRigAttachmentToParent(v70, v77);
            v83 = v74[v77];
            v84 = v78:FindFirstChild(l_l_v75_0_0);
            assert(v84);
            l_l_v75_0_0 = v73 - (v83 * v84.CFrame).Position;
            v74[v77] = CFrame.new(v74[v77].Position + l_l_v75_0_0) * v74[v77].Rotation;
        end;
        if not v81 then
            v75 = l_v75_0;
            l_l_v75_0_0 = v2.getRigAttachmentToParent(v70, v80);
            v83 = v74[v77];
            v84 = v78:FindFirstChild(l_l_v75_0_0);
            assert(v84);
            v73 = (v83 * v84.CFrame).Position;
        end;
    end;
    return v74;
end;
v10.calculateAssetCFrame = function(v86, v87) --[[ Line: 243 ]] --[[ Name: calculateAssetCFrame ]]
    -- upvalues: v10 (copy), v53 (copy)
    local v88 = v10.calculateAllTransformsForAsset(v86, v87);
    if Enum.AssetType.DynamicHead == v86 then
        return v88.Head;
    elseif Enum.AssetType.Torso == v86 then
        return v88.LowerTorso;
    else
        return v53(v86, v88);
    end;
end;
v10.calculateAllTransformsForAsset = function(v89, v90) --[[ Line: 254 ]] --[[ Name: calculateAllTransformsForAsset ]]
    -- upvalues: v42 (copy), v6 (copy)
    if Enum.AssetType.DynamicHead == v89 then
        return {
            Head = CFrame.new()
        };
    else
        return (v42(v6.assetHierarchy[v89], function(v91) --[[ Line: 259 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v90 (copy)
            return (v90:FindFirstChild(v91));
        end));
    end;
end;
v10.calculateAllTransformsForFullBody = function(v92, v93) --[[ Line: 266 ]] --[[ Name: calculateAllTransformsForFullBody ]]
    -- upvalues: v9 (copy), v8 (copy), v42 (copy)
    return (v42(if v93 then v9 else v8, function(v94) --[[ Line: 270 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v92 (copy)
        return v92[v94];
    end, v93));
end;
v10.calculatePartsLocalToAsset = function(v95, v96) --[[ Line: 278 ]] --[[ Name: calculatePartsLocalToAsset ]]
    -- upvalues: v5 (copy), v16 (copy)
    local v97 = true;
    if v95 ~= Enum.AssetType.LeftArm then
        v97 = true;
        if v95 ~= Enum.AssetType.RightArm then
            v97 = true;
            if v95 ~= Enum.AssetType.LeftLeg then
                v97 = v95 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v97);
    v97 = v5(v95);
    local l_Position_2 = v96[v97[1]].Position;
    local l_Position_3 = v96[v97[3]].Position;
    local v100 = v16(l_Position_2, l_Position_3);
    v97 = {};
    for _, v102 in v5(v95) do
        local v103;
        if v100 then
            local v104 = v96[v102];
            local v105 = v100.Rotation:Inverse() * v104.Rotation;
            local v106 = v100.Rotation:Inverse() * (v104.Position - v100.Position);
            v103 = CFrame.new(v106) * v105;
        else
            v103 = v96[v102];
        end;
        v97[v102] = v103;
    end;
    return v97;
end;
v10.getBodyPartsToParents = function() --[[ Line: 300 ]] --[[ Name: getBodyPartsToParents ]]
    -- upvalues: v8 (copy)
    local v107 = {};
    local function v108(v109, v110, v111) --[[ Line: 303 ]] --[[ Name: calculateAllTransformsInternal ]]
        -- upvalues: v107 (copy), v108 (copy)
        v107[v109] = v110 or "HumanoidRootPart";
        if not v111.children then
            return;
        else
            for v112, v113 in v111.children do
                v108(v112, v109, v113);
            end;
            return;
        end;
    end;
    v108(v8.root, nil, v8);
    return v107;
end;
v10.getAssetMeshesValidationSpaceTransforms = function(v114, v115) --[[ Line: 319 ]] --[[ Name: getAssetMeshesValidationSpaceTransforms ]]
    -- upvalues: v10 (copy), v7 (copy)
    local l_assetTypeEnum_0 = v115.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local v117 = {};
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        table.insert(v117, v114.Name);
    else
        for _, v119 in v114:GetChildren() do
            if v119:IsA("MeshPart") then
                table.insert(v117, v119.Name);
            end;
        end;
    end;
    local v120 = v10.calculateAllTransformsForAsset(l_assetTypeEnum_0, v114);
    local function v122(v121) --[[ Line: 340 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_0 (copy), v114 (copy)
        if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
            return v114;
        else
            return (v114:FindFirstChild(v121));
        end;
    end;
    if l_assetTypeEnum_0 ~= Enum.AssetType.DynamicHead and l_assetTypeEnum_0 ~= Enum.AssetType.Torso then
        for v123, v124 in (v10.calculateStraightenedLimb(l_assetTypeEnum_0, v120, v122)) do
            v120[v123] = v124;
        end;
    end;
    local v125 = v7(v117, v122, v115);
    local v126 = {};
    for _, v128 in v117 do
        v126[v128] = {
            CFrame = v120[v128], 
            scale = v125[v128]
        };
    end;
    return v126;
end;
return v10;