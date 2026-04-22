local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local l_AssetService_0 = game:GetService("AssetService");
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationAddPBRToSharedData);
local v4 = require(l_Parent_0.validationSystem.ValidationEnums);
local v5 = require(l_Parent_0.util.R15plusUtils);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationAddGeometryToExports);
local v7 = {};
local function v14(v8, v9, v10, v11) --[[ Line: 17 ]] --[[ Name: createCagePart ]]
    -- upvalues: l_AssetService_0 (copy)
    local l_l_AssetService_0_MeshPartAsync_0 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v10.editable));
    l_l_AssetService_0_MeshPartAsync_0.Name = ("%*_%*"):format(v8, v11);
    l_l_AssetService_0_MeshPartAsync_0.Size = l_l_AssetService_0_MeshPartAsync_0.Size * v9.scale;
    local v13 = CFrame.new(v10.origin.Position * v9.scale) * v10.origin.Rotation;
    l_l_AssetService_0_MeshPartAsync_0.CFrame = v8.CFrame * v13;
    return l_l_AssetService_0_MeshPartAsync_0;
end;
local function v28(v15, v16, v17) --[[ Line: 31 ]] --[[ Name: copyMeshPart ]]
    -- upvalues: l_AssetService_0 (copy), v3 (copy), v5 (copy)
    local l_l_AssetService_0_MeshPartAsync_1 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v16.editable));
    if v3() then
        if v17 and not v17.isPBR and v17.Texture then
            l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v17.Texture.editable);
        elseif v17 and v17.isPBR then
            local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
            if v17.ColorMap then
                l_SurfaceAppearance_0.ColorMapContent = Content.fromObject(v17.ColorMap.editable);
            end;
            if v17.MetalnessMap then
                l_SurfaceAppearance_0.MetalnessMapContent = Content.fromObject(v17.MetalnessMap.editable);
            end;
            if v17.NormalMap then
                l_SurfaceAppearance_0.NormalMapContent = Content.fromObject(v17.NormalMap.editable);
            end;
            if v17.RoughnessMap then
                l_SurfaceAppearance_0.RoughnessMapContent = Content.fromObject(v17.RoughnessMap.editable);
            end;
            l_SurfaceAppearance_0.Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    elseif v17 then
        l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v17.editable);
    end;
    l_l_AssetService_0_MeshPartAsync_1.Name = v15.Name;
    l_l_AssetService_0_MeshPartAsync_1.Size = v15.Size;
    l_l_AssetService_0_MeshPartAsync_1.CFrame = v15.CFrame;
    for _, v21 in v15:GetChildren() do
        if (v21:IsA("Attachment") or v21:IsA("FaceControls")) and (not v5.checkFlagEnabledForAllowHrd() or not v21:IsA("Bone")) then
            v21:Clone().Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    end;
    if v5.checkFlagEnabledForAllowHrd() then
        local v22 = v5.getAvatarBoneSchema(v15.Name);
        for v23, v24 in (v5.getNameWhitelistOfClassInSchema(v22, "Attachment")) do
            if v24 and l_l_AssetService_0_MeshPartAsync_1:FindFirstChild(v23) == nil then
                local l_v15_FirstChild_0 = v15:FindFirstChild(v23, true);
                local v26 = nil;
                v26 = if l_v15_FirstChild_0 ~= nil then l_v15_FirstChild_0.WorldCFrame else l_l_AssetService_0_MeshPartAsync_1.CFrame;
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Name = v23;
                l_Attachment_0.Parent = l_l_AssetService_0_MeshPartAsync_1;
                l_Attachment_0.WorldCFrame = v26;
            end;
        end;
    end;
    return l_l_AssetService_0_MeshPartAsync_1;
end;
v7.createModelForGltfExport = function(v29) --[[ Line: 107 ]] --[[ Name: createModelForGltfExport ]]
    -- upvalues: v28 (copy), v14 (copy), v6 (copy), v4 (copy)
    local l_Model_0 = Instance.new("Model");
    local l_Descendants_0 = v29.rootInstance:GetDescendants();
    table.insert(l_Descendants_0, v29.rootInstance);
    for _, v33 in l_Descendants_0 do
        if v33:IsA("MeshPart") then
            local l_Name_0 = v33.Name;
            local v35 = v29.renderMeshesData[l_Name_0];
            if not v35 then
                error("Missing editable data");
            end;
            local v36 = v29.meshTextures[l_Name_0];
            local v37 = v28(v33, v35, v36);
            v37.Parent = l_Model_0;
            local v38 = v29.outerCagesData[l_Name_0];
            if v38 then
                v14(v37, v35, v38, "OuterCage").Parent = l_Model_0;
            end;
            local v39 = v29.innerCagesData[l_Name_0];
            if v39 then
                v14(v37, v35, v39, "InnerCage").Parent = l_Model_0;
            end;
            if v6() and v29.uploadCategory == v4.UploadCategory.FULL_BODY then
                v37.Name = ("%*_Geo"):format(l_Name_0);
            end;
        end;
    end;
    l_Model_0:PivotTo(CFrame.new());
    return l_Model_0;
end;
return v7;