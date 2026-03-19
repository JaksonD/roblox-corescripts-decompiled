local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = game:DefineFastFlag("SelfViewAvatarJointUpgrade", false);
local v2 = game:DefineFastFlag("SelfViewNeckCheck", false);
local v3 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
local function v5(v4) --[[ Line: 25 ]] --[[ Name: getFaceControls ]]
    if v4 == nil then
        return;
    else
        return (v4:FindFirstChildWhichIsA("FaceControls", true));
    end;
end;
local function v15(v6, v7) --[[ Line: 32 ]] --[[ Name: getNeck ]]
    -- upvalues: v2 (copy)
    if v6 == nil or v7 == nil then
        return nil;
    else
        local l_v6_Descendants_0 = v6:GetDescendants();
        for _, v10 in l_v6_Descendants_0 do
            if v10:IsA("Motor6D") and (v10.Part1 == v7 or v10.Name == "Neck") then
                return v10;
            end;
        end;
        if v2 == true then
            for _, v12 in l_v6_Descendants_0 do
                if v12:IsA("AnimationConstraint") and v12.Parent == v7 and (v12.Attachment0 ~= nil and v12.Attachment0.Name == "NeckRigAttachment" or v12.Name == "Neck") then
                    return v12;
                end;
            end;
        else
            for _, v14 in l_v6_Descendants_0 do
                if v14:IsA("AnimationConstraint") and v14.Parent == v7 and (v14.Attachment0.Name == "NeckRigAttachment" or v14.Name == "Neck") then
                    return v14;
                end;
            end;
        end;
        return nil;
    end;
end;
local function v21(v16, v17, v18) --[[ Line: 73 ]] --[[ Name: findObjectOfNameAndTypeName ]]
    if v18 == nil then
        return nil;
    else
        for _, v20 in (v18:GetDescendants()) do
            if v20:IsA(v17) and v20.Name == v16 then
                return v20;
            end;
        end;
        return nil;
    end;
end;
local function v25(v22) --[[ Line: 86 ]] --[[ Name: getHead ]]
    -- upvalues: v21 (copy)
    if not v22 then
        return nil;
    else
        local v23 = nil;
        local v24 = if v22 == nil then nil else v22:FindFirstChildWhichIsA("FaceControls", true);
        if v24 ~= nil and v24.Parent and (v24.Parent.ClassName == "MeshPart" or v24.Parent.ClassName == "Part") then
            v23 = v24.Parent;
        end;
        if not v23 then
            v23 = v21("Head", "MeshPart", v22);
        end;
        if not v23 then
            v23 = v21("Head", "Part", v22);
        end;
        return v23;
    end;
end;
local function v31(v26, v27) --[[ Line: 119 ]] --[[ Name: getAnimator ]]
    local v28 = nil;
    local v29 = nil;
    if v27 > 0 then
        local v30 = v26:WaitForChild("Humanoid", v27);
        v29 = if v30 then if v30:IsA("Humanoid") then v30 else v26:FindFirstChildWhichIsA("Humanoid") else v26:FindFirstChildWhichIsA("Humanoid");
    else
        v29 = v26:FindFirstChildWhichIsA("Humanoid");
    end;
    if v29 ~= nil then
        v28 = if v27 > 0 then v29:WaitForChild("Animator", v27) else v29:FindFirstChild("Animator");
    end;
    if v28 == nil then
        v28 = v26:FindFirstChildWhichIsA("Animator", true);
    end;
    return v28;
end;
local v32 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local function v37(v33, v34) --[[ Line: 173 ]] --[[ Name: updateTransparency ]]
    -- upvalues: v32 (copy), l_CollectionService_0 (copy)
    for _, v36 in ipairs(v33:GetDescendants()) do
        if v36:IsA("Decal") then
            v36.Transparency = 0;
        elseif v36:IsA("MeshPart") then
            if v36.Parent and v36.Parent:IsA("Accessory") or table.find(v32, v36.Name) then
                if not table.find(v34, v36.MeshId) then
                    v34[v36.MeshId] = v36.Transparency;
                else
                    v36.Transparency = v34[v36.MeshId];
                end;
            end;
        elseif v36:IsA("Part") then
            if v36.Parent and v36.Parent:IsA("Accessory") or table.find(v32, v36.Name) then
                v36.Transparency = 0;
            end;
            if l_CollectionService_0:HasTag(v36, "__RBX__LOCKED_TRANSPARENT") then
                v36.Transparency = 1;
            end;
        end;
    end;
end;
local function v39(v38) --[[ Line: 202 ]] --[[ Name: shouldMarkCloneDirtyForDescendant ]]
    -- upvalues: v3 (copy)
    if v38:IsA("MeshPart") or v38:IsA("Part") or v38:IsA("Decal") then
        if v38.Transparency < 1 then
            return true;
        end;
    elseif v3[v38.ClassName] then
        return true;
    end;
    return false;
end;
local function v43(v40) --[[ Line: 215 ]] --[[ Name: resetPartOrientation ]]
    for _, v42 in ipairs(v40:GetDescendants()) do
        if v42:IsA("Motor6D") then
            v42.C0 = CFrame.new(v42.C0.Position);
            v42.C1 = CFrame.new(v42.C1.Position);
        end;
    end;
end;
local function _(v44, v45) --[[ Line: 224 ]] --[[ Name: removeChild ]]
    local l_v44_FirstChild_0 = v44:FindFirstChild(v45);
    if l_v44_FirstChild_0 then
        l_v44_FirstChild_0:Destroy();
    end;
end;
local function v52(v48) --[[ Line: 230 ]] --[[ Name: removeScripts ]]
    local l_Animate_0 = v48:FindFirstChild("Animate");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    l_Animate_0 = v48:FindFirstChild("Health");
    if l_Animate_0 then
        l_Animate_0:Destroy();
    end;
    for _, v51 in pairs(v48:GetDescendants()) do
        if v51:IsA("BaseScript") then
            v51:Destroy();
        end;
    end;
end;
local function v62(v53) --[[ Line: 241 ]] --[[ Name: removeTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v53);
    for _, v56 in ipairs(l_l_CollectionService_0_Tags_0) do
        if v56 ~= "NoFace" then
            l_CollectionService_0:RemoveTag(v53, v56);
        end;
    end;
    for _, v58 in ipairs(v53:GetDescendants()) do
        local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v58);
        for _, v61 in ipairs(l_l_CollectionService_0_Tags_1) do
            if v61 ~= "NoFace" then
                l_CollectionService_0:RemoveTag(v58, v61);
            end;
        end;
    end;
    l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v53);
end;
local v63 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = v1 and "AnimationConstraint" or nil, 
    BallSocketConstraint = v1 and "BallSocketConstraint" or nil, 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink", 
    Folder = "Folder", 
    RigidConstraint = "RigidConstraint", 
    WrapTextureTransfer = "WrapTextureTransfer"
};
local function v64(v65) --[[ Line: 296 ]] --[[ Name: disableScripts ]]
    -- upvalues: v64 (copy)
    for _, v67 in v65:GetChildren() do
        if v67:IsA("Script") then
            v67.Disabled = true;
            v67.Parent = nil;
        end;
        v64(v67);
    end;
end;
local function v68(v69) --[[ Line: 306 ]] --[[ Name: removeUI ]]
    -- upvalues: v68 (copy)
    for _, v71 in v69:GetChildren() do
        if v71:IsA("GuiObject") or v71:IsA("ScreenGui") or v71:IsA("BillboardGui") or v71:IsA("AdGui") or v71:IsA("SurfaceGui") then
            v71.Parent = nil;
        end;
        v68(v71);
    end;
end;
local function v72(v73) --[[ Line: 321 ]] --[[ Name: removeInstancesStrict ]]
    -- upvalues: v63 (copy), v72 (copy)
    for _, v75 in v73:GetChildren() do
        if not v63[v75.ClassName] then
            v75.Parent = nil;
        end;
        v72(v75);
    end;
end;
return {
    getFaceControls = v5, 
    getNeck = v15, 
    getHead = v25, 
    getAnimator = v31, 
    updateTransparency = v37, 
    shouldMarkCloneDirtyForDescendant = v39, 
    resetPartOrientation = v43, 
    removeScripts = v52, 
    removeTags = v62, 
    sanitizeCharacter = function(v76) --[[ Line: 330 ]] --[[ Name: sanitizeCharacter ]]
        -- upvalues: v72 (copy)
        if not v76 then
            return;
        else
            v72(v76);
            return;
        end;
    end, 
    isValidAvatar = function(v77) --[[ Line: 338 ]] --[[ Name: isValidAvatar ]]
        -- upvalues: v31 (copy), v25 (copy)
        if not v31(v77, 10) then
            return false;
        elseif not v25(v77) then
            return false;
        else
            return true;
        end;
    end, 
    hasDynamicHead = function(v78) --[[ Line: 352 ]] --[[ Name: hasDynamicHead ]]
        return (if v78 == nil then nil else v78:FindFirstChildWhichIsA("FaceControls", true)) ~= nil;
    end
};