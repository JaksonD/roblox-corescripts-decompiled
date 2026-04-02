local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local l_AssetService_0 = game:GetService("AssetService");
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationAddPBRToSharedData);
local v4 = require(l_Parent_0.util.R15plusUtils);
local v5 = {};
local function v12(v6, v7, v8, v9) --[[ Line: 15 ]] --[[ Name: createCagePart ]]
    -- upvalues: l_AssetService_0 (copy)
    local l_l_AssetService_0_MeshPartAsync_0 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v8.editable));
    l_l_AssetService_0_MeshPartAsync_0.Name = ("%*_%*"):format(v6, v9);
    l_l_AssetService_0_MeshPartAsync_0.Size = l_l_AssetService_0_MeshPartAsync_0.Size * v7.scale;
    local v11 = CFrame.new(v8.origin.Position * v7.scale) * v8.origin.Rotation;
    l_l_AssetService_0_MeshPartAsync_0.CFrame = v6.CFrame * v11;
    return l_l_AssetService_0_MeshPartAsync_0;
end;
local function v26(v13, v14, v15) --[[ Line: 29 ]] --[[ Name: copyMeshPart ]]
    -- upvalues: l_AssetService_0 (copy), v3 (copy), v4 (copy)
    local l_l_AssetService_0_MeshPartAsync_1 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v14.editable));
    if v3() then
        if v15 and not v15.isPBR and v15.Texture then
            l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v15.Texture.editable);
        elseif v15 and v15.isPBR then
            local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
            if v15.ColorMap then
                l_SurfaceAppearance_0.ColorMapContent = Content.fromObject(v15.ColorMap.editable);
            end;
            if v15.MetalnessMap then
                l_SurfaceAppearance_0.MetalnessMapContent = Content.fromObject(v15.MetalnessMap.editable);
            end;
            if v15.NormalMap then
                l_SurfaceAppearance_0.NormalMapContent = Content.fromObject(v15.NormalMap.editable);
            end;
            if v15.RoughnessMap then
                l_SurfaceAppearance_0.RoughnessMapContent = Content.fromObject(v15.RoughnessMap.editable);
            end;
            l_SurfaceAppearance_0.Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    elseif v15 then
        l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v15.editable);
    end;
    l_l_AssetService_0_MeshPartAsync_1.Name = v13.Name;
    l_l_AssetService_0_MeshPartAsync_1.Size = v13.Size;
    l_l_AssetService_0_MeshPartAsync_1.CFrame = v13.CFrame;
    for _, v19 in v13:GetChildren() do
        if (v19:IsA("Attachment") or v19:IsA("FaceControls")) and (not v4.checkFlagEnabledForAllowHrd() or not v19:IsA("Bone")) then
            v19:Clone().Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    end;
    if v4.checkFlagEnabledForAllowHrd() then
        local v20 = v4.getAvatarBoneSchema(v13.Name);
        for v21, v22 in (v4.getNameWhitelistOfClassInSchema(v20, "Attachment")) do
            if v22 and l_l_AssetService_0_MeshPartAsync_1:FindFirstChild(v21) == nil then
                local l_v13_FirstChild_0 = v13:FindFirstChild(v21, true);
                local v24 = nil;
                v24 = if l_v13_FirstChild_0 ~= nil then l_v13_FirstChild_0.WorldCFrame else l_l_AssetService_0_MeshPartAsync_1.CFrame;
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Name = v21;
                l_Attachment_0.Parent = l_l_AssetService_0_MeshPartAsync_1;
                l_Attachment_0.WorldCFrame = v24;
            end;
        end;
    end;
    return l_l_AssetService_0_MeshPartAsync_1;
end;
v5.createModelForGltfExport = function(v27) --[[ Line: 105 ]] --[[ Name: createModelForGltfExport ]]
    -- upvalues: v26 (copy), v12 (copy)
    local l_Model_0 = Instance.new("Model");
    local l_Descendants_0 = v27.rootInstance:GetDescendants();
    table.insert(l_Descendants_0, v27.rootInstance);
    for _, v31 in l_Descendants_0 do
        if v31:IsA("MeshPart") then
            local l_Name_0 = v31.Name;
            local v33 = v27.renderMeshesData[l_Name_0];
            if not v33 then
                error("Missing editable data");
            end;
            local v34 = v27.meshTextures[l_Name_0];
            local v35 = v26(v31, v33, v34);
            v35.Parent = l_Model_0;
            local v36 = v27.outerCagesData[l_Name_0];
            if v36 then
                v12(v35, v33, v36, "OuterCage").Parent = l_Model_0;
            end;
            local v37 = v27.innerCagesData[l_Name_0];
            if v37 then
                v12(v35, v33, v37, "InnerCage").Parent = l_Model_0;
            end;
        end;
    end;
    l_Model_0:PivotTo(CFrame.new());
    return l_Model_0;
end;
return v5;