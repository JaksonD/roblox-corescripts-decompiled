local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.canBeNormalized);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.util.AssetTraversalUtils);
local v7 = require(l_Parent_0.util.getMeshScales);
local v8 = require(l_Parent_0.util.R15plusUtils);
local v9 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v10 = {
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
local v11 = {
    root = "HumanoidRootPart", 
    children = {
        LowerTorso = v10
    }
};
local v12 = {};
local function v18(v13, v14) --[[ Line: 60 ]] --[[ Name: calculateCFrame ]]
    -- upvalues: v4 (copy)
    local v15 = v13 - v14;
    if not v4(v15) then
        return;
    else
        v15 = v15.Unit;
        local l_Unit_0 = v15:Cross((Vector3.new(0, 0, 1, 0))).Unit;
        if not v4(l_Unit_0) then
            l_Unit_0 = v15:Cross(if v15.Z < 0 then Vector3.new(0, 1, 0, 0) else Vector3.new(-0, -1, -0, -0)).Unit;
        end;
        local l_Unit_1 = l_Unit_0:Cross(v15).Unit;
        return CFrame.fromMatrix(v13, l_Unit_0, v15, l_Unit_1);
    end;
end;
local function v30(v19, v20, v21, v22, v23) --[[ Line: 79 ]] --[[ Name: calculatePartTransformInHierarchy ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy)
    local v24 = if v23 and v23[v19.Name] then v23[v19.Name] else CFrame.new();
    local l_v21_0 = v21;
    if v20 then
        local v26 = v22(v20);
        assert(v26);
        local v27 = v2.getRigAttachmentToParent(nil, v19.Name);
        local l_v26_FirstChild_0 = v26:FindFirstChild(v27, v8.checkFlagEnabledForAllowHrd());
        assert(l_v26_FirstChild_0);
        local l_v19_FirstChild_0 = v19:FindFirstChild(v27, v8.checkFlagEnabledForAllowHrd());
        assert(l_v19_FirstChild_0);
        return l_v21_0 * v9(l_v26_FirstChild_0) * v24 * v9(l_v19_FirstChild_0):Inverse();
    else
        return v24;
    end;
end;
local function v44(v31, v32, v33) --[[ Line: 112 ]] --[[ Name: calculateHierarchyTransforms ]]
    -- upvalues: v30 (copy)
    local v34 = {};
    local function v35(v36, v37, v38, v39) --[[ Line: 119 ]] --[[ Name: calculateAllTransformsInternal ]]
        -- upvalues: v32 (copy), v30 (ref), v33 (copy), v34 (copy), v35 (copy)
        local v40 = v32(v36);
        assert(v40);
        local v41 = v30(v40, v37, v39, v32, v33);
        v34[v40.Name] = v41;
        if not v38.children then
            return;
        else
            for v42, v43 in v38.children do
                v35(v42, v36, v43, v41);
            end;
            return;
        end;
    end;
    v35(v31.root, nil, v31, CFrame.new());
    return v34;
end;
local function _(v45, v46) --[[ Line: 140 ]] --[[ Name: calculateLocalSpaceTransform ]]
    local v47 = v45.Rotation:Inverse() * v46.Rotation;
    local v48 = v45.Rotation:Inverse() * (v46.Position - v45.Position);
    return CFrame.new(v48) * v47;
end;
local function v55(v50, v51) --[[ Line: 147 ]] --[[ Name: calculateAssetCFrameFromPartsCFrames ]]
    -- upvalues: v5 (copy), v18 (copy)
    local v52 = v5(v50);
    local l_Position_0 = v51[v52[1]].Position;
    local l_Position_1 = v51[v52[3]].Position;
    return v18(l_Position_0, l_Position_1);
end;
local function _(v56) --[[ Line: 158 ]] --[[ Name: assertTypesToOrient ]]
    local v57 = true;
    if v56 ~= Enum.AssetType.LeftArm then
        v57 = true;
        if v56 ~= Enum.AssetType.RightArm then
            v57 = true;
            if v56 ~= Enum.AssetType.LeftLeg then
                v57 = v56 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v57);
end;
local function _(v59, v60, v61) --[[ Line: 167 ]] --[[ Name: getAttachmentCFrame ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v59_FirstChild_0 = v59:FindFirstChild(v60, v8.checkFlagEnabledForAllowHrd());
    assert(l_v59_FirstChild_0);
    return v61 * v9(l_v59_FirstChild_0);
end;
v12.calculatePartCFrameFromRigAttachments = function(v64, v65, v66) --[[ Line: 174 ]] --[[ Name: calculatePartCFrameFromRigAttachments ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy), v6 (copy), v18 (copy)
    local v67 = true;
    if v64 ~= Enum.AssetType.LeftArm then
        v67 = true;
        if v64 ~= Enum.AssetType.RightArm then
            v67 = true;
            if v64 ~= Enum.AssetType.LeftLeg then
                v67 = v64 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v67);
    local v68 = v2.getRigAttachmentToParent(v64, v65.Name);
    if v68 == "" then
        return;
    else
        local l_v65_FirstChild_0 = v65:FindFirstChild(v68, v8.checkFlagEnabledForAllowHrd());
        assert(l_v65_FirstChild_0);
        v67 = v66 * v9(l_v65_FirstChild_0);
        l_v65_FirstChild_0 = v6.getAssetRigChild(v64, v65.Name);
        if not l_v65_FirstChild_0 then
            return;
        else
            local l_v65_FirstChild_1 = v65:FindFirstChild(v2.getRigAttachmentToParent(v64, l_v65_FirstChild_0), v8.checkFlagEnabledForAllowHrd());
            assert(l_v65_FirstChild_1);
            local v71 = v66 * v9(l_v65_FirstChild_1);
            return v18(v67.Position, v71.Position);
        end;
    end;
end;
v12.calculateStraightenedLimb = function(v72, v73, v74) --[[ Line: 198 ]] --[[ Name: calculateStraightenedLimb ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v12 (copy), v2 (copy), v8 (copy), v9 (copy)
    local v75 = true;
    if v72 ~= Enum.AssetType.LeftArm then
        v75 = true;
        if v72 ~= Enum.AssetType.RightArm then
            v75 = true;
            if v72 ~= Enum.AssetType.LeftLeg then
                v75 = v72 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v75);
    local v76 = v1.Dictionary.join(v73);
    v75 = nil;
    local v77 = CFrame.new();
    for _, v79 in v5(v72) do
        local v80 = v74(v79);
        local l_v77_0 = v77;
        local v82 = v6.getAssetRigChild(v72, v79);
        local v83 = v82 == nil;
        if not v83 then
            l_v77_0 = v12.calculatePartCFrameFromRigAttachments(v72, v80, v73[v79]) or l_v77_0;
        end;
        local l_l_v77_0_0 = l_v77_0;
        local v85 = v73[v79];
        local v86 = l_l_v77_0_0.Rotation:Inverse() * v85.Rotation;
        local v87 = l_l_v77_0_0.Rotation:Inverse() * (v85.Position - l_l_v77_0_0.Position);
        v76[v79] = CFrame.new(v87) * v86;
        if v75 then
            l_l_v77_0_0 = v2.getRigAttachmentToParent(v72, v79);
            v85 = v76[v79];
            v86 = v80:FindFirstChild(l_l_v77_0_0, v8.checkFlagEnabledForAllowHrd());
            assert(v86);
            l_l_v77_0_0 = v75 - (v85 * v9(v86)).Position;
            v76[v79] = CFrame.new(v76[v79].Position + l_l_v77_0_0) * v76[v79].Rotation;
        end;
        if not v83 then
            v77 = l_v77_0;
            l_l_v77_0_0 = v2.getRigAttachmentToParent(v72, v82);
            v85 = v76[v79];
            v86 = v80:FindFirstChild(l_l_v77_0_0, v8.checkFlagEnabledForAllowHrd());
            assert(v86);
            v75 = (v85 * v9(v86)).Position;
        end;
    end;
    return v76;
end;
v12.calculateAssetCFrame = function(v88, v89) --[[ Line: 251 ]] --[[ Name: calculateAssetCFrame ]]
    -- upvalues: v12 (copy), v55 (copy)
    local v90 = v12.calculateAllTransformsForAsset(v88, v89);
    if Enum.AssetType.DynamicHead == v88 then
        return v90.Head;
    elseif Enum.AssetType.Torso == v88 then
        return v90.LowerTorso;
    else
        return v55(v88, v90);
    end;
end;
v12.calculateAllTransformsForAsset = function(v91, v92) --[[ Line: 262 ]] --[[ Name: calculateAllTransformsForAsset ]]
    -- upvalues: v44 (copy), v6 (copy)
    if Enum.AssetType.DynamicHead == v91 then
        return {
            Head = CFrame.new()
        };
    else
        return (v44(v6.assetHierarchy[v91], function(v93) --[[ Line: 267 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v92 (copy)
            return (v92:FindFirstChild(v93));
        end));
    end;
end;
v12.calculateAllTransformsForFullBody = function(v94, v95) --[[ Line: 274 ]] --[[ Name: calculateAllTransformsForFullBody ]]
    -- upvalues: v11 (copy), v10 (copy), v44 (copy)
    return (v44(if v95 then v11 else v10, function(v96) --[[ Line: 278 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v94 (copy)
        return v94[v96];
    end, v95));
end;
v12.calculatePartsLocalToAsset = function(v97, v98) --[[ Line: 286 ]] --[[ Name: calculatePartsLocalToAsset ]]
    -- upvalues: v5 (copy), v18 (copy)
    local v99 = true;
    if v97 ~= Enum.AssetType.LeftArm then
        v99 = true;
        if v97 ~= Enum.AssetType.RightArm then
            v99 = true;
            if v97 ~= Enum.AssetType.LeftLeg then
                v99 = v97 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v99);
    v99 = v5(v97);
    local l_Position_2 = v98[v99[1]].Position;
    local l_Position_3 = v98[v99[3]].Position;
    local v102 = v18(l_Position_2, l_Position_3);
    v99 = {};
    for _, v104 in v5(v97) do
        local v105;
        if v102 then
            local v106 = v98[v104];
            local v107 = v102.Rotation:Inverse() * v106.Rotation;
            local v108 = v102.Rotation:Inverse() * (v106.Position - v102.Position);
            v105 = CFrame.new(v108) * v107;
        else
            v105 = v98[v104];
        end;
        v99[v104] = v105;
    end;
    return v99;
end;
v12.getBodyPartsToParents = function() --[[ Line: 308 ]] --[[ Name: getBodyPartsToParents ]]
    -- upvalues: v10 (copy)
    local v109 = {};
    local function v110(v111, v112, v113) --[[ Line: 311 ]] --[[ Name: calculateAllTransformsInternal ]]
        -- upvalues: v109 (copy), v110 (copy)
        v109[v111] = v112 or "HumanoidRootPart";
        if not v113.children then
            return;
        else
            for v114, v115 in v113.children do
                v110(v114, v111, v115);
            end;
            return;
        end;
    end;
    local l_root_0 = v10.root;
    local l_v10_0 = v10;
    v109[l_root_0] = "HumanoidRootPart";
    if not l_v10_0.children then
        return v109;
    else
        for v118, v119 in l_v10_0.children do
            v110(v118, l_root_0, v119);
        end;
        return v109;
    end;
end;
v12.getAssetMeshesValidationSpaceTransforms = function(v120, v121) --[[ Line: 327 ]] --[[ Name: getAssetMeshesValidationSpaceTransforms ]]
    -- upvalues: v12 (copy), v7 (copy)
    local l_assetTypeEnum_0 = v121.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    local v123 = {};
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        table.insert(v123, v120.Name);
    else
        for _, v125 in v120:GetChildren() do
            if v125:IsA("MeshPart") then
                table.insert(v123, v125.Name);
            end;
        end;
    end;
    local v126 = v12.calculateAllTransformsForAsset(l_assetTypeEnum_0, v120);
    local function v128(v127) --[[ Line: 348 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_0 (copy), v120 (copy)
        if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
            return v120;
        else
            return (v120:FindFirstChild(v127));
        end;
    end;
    if l_assetTypeEnum_0 ~= Enum.AssetType.DynamicHead and l_assetTypeEnum_0 ~= Enum.AssetType.Torso then
        for v129, v130 in (v12.calculateStraightenedLimb(l_assetTypeEnum_0, v126, v128)) do
            v126[v129] = v130;
        end;
    end;
    local v131 = v7(v123, v128, v121);
    local v132 = {};
    for _, v134 in v123 do
        v132[v134] = {
            CFrame = v126[v134], 
            scale = v131[v134]
        };
    end;
    return v132;
end;
return v12;