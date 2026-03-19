local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local l_AssetService_0 = game:GetService("AssetService");
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationAddPBRToSharedData);
local v4 = {};
local function v11(v5, v6, v7, v8) --[[ Line: 14 ]] --[[ Name: createCagePart ]]
    -- upvalues: l_AssetService_0 (copy)
    local l_l_AssetService_0_MeshPartAsync_0 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v7.editable));
    l_l_AssetService_0_MeshPartAsync_0.Name = ("%*_%*"):format(v5, v8);
    l_l_AssetService_0_MeshPartAsync_0.Size = l_l_AssetService_0_MeshPartAsync_0.Size * v6.scale;
    local v10 = CFrame.new(v7.origin.Position * v6.scale) * v7.origin.Rotation;
    l_l_AssetService_0_MeshPartAsync_0.CFrame = v5.CFrame * v10;
    return l_l_AssetService_0_MeshPartAsync_0;
end;
local function v19(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: copyMeshPart ]]
    -- upvalues: l_AssetService_0 (copy), v3 (copy)
    local l_l_AssetService_0_MeshPartAsync_1 = l_AssetService_0:CreateMeshPartAsync(Content.fromObject(v13.editable));
    if v3() then
        if v14 and not v14.isPBR and v14.Texture then
            l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v14.Texture.editable);
        elseif v14 and v14.isPBR then
            local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
            if v14.ColorMap then
                l_SurfaceAppearance_0.ColorMapContent = Content.fromObject(v14.ColorMap.editable);
            end;
            if v14.MetalnessMap then
                l_SurfaceAppearance_0.MetalnessMapContent = Content.fromObject(v14.MetalnessMap.editable);
            end;
            if v14.NormalMap then
                l_SurfaceAppearance_0.NormalMapContent = Content.fromObject(v14.NormalMap.editable);
            end;
            if v14.RoughnessMap then
                l_SurfaceAppearance_0.RoughnessMapContent = Content.fromObject(v14.RoughnessMap.editable);
            end;
            l_SurfaceAppearance_0.Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    elseif v14 then
        l_l_AssetService_0_MeshPartAsync_1.TextureContent = Content.fromObject(v14.editable);
    end;
    l_l_AssetService_0_MeshPartAsync_1.Name = v12.Name;
    l_l_AssetService_0_MeshPartAsync_1.Size = v12.Size;
    l_l_AssetService_0_MeshPartAsync_1.CFrame = v12.CFrame;
    for _, v18 in v12:GetChildren() do
        if v18:IsA("Attachment") or v18:IsA("FaceControls") then
            v18:Clone().Parent = l_l_AssetService_0_MeshPartAsync_1;
        end;
    end;
    return l_l_AssetService_0_MeshPartAsync_1;
end;
v4.createModelForGltfExport = function(v20) --[[ Line: 74 ]] --[[ Name: createModelForGltfExport ]]
    -- upvalues: v19 (copy), v11 (copy)
    local l_Model_0 = Instance.new("Model");
    local l_Descendants_0 = v20.rootInstance:GetDescendants();
    table.insert(l_Descendants_0, v20.rootInstance);
    for _, v24 in l_Descendants_0 do
        if v24:IsA("MeshPart") then
            local l_Name_0 = v24.Name;
            local v26 = v20.renderMeshesData[l_Name_0];
            if not v26 then
                error("Missing editable data");
            end;
            local v27 = v20.meshTextures[l_Name_0];
            local v28 = v19(v24, v26, v27);
            v28.Parent = l_Model_0;
            local v29 = v20.outerCagesData[l_Name_0];
            if v29 then
                v11(v28, v26, v29, "OuterCage").Parent = l_Model_0;
            end;
            local v30 = v20.innerCagesData[l_Name_0];
            if v30 then
                v11(v28, v26, v30, "InnerCage").Parent = l_Model_0;
            end;
        end;
    end;
    l_Model_0:PivotTo(CFrame.new());
    return l_Model_0;
end;
return v4;