local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: validateLegacyAccessoryMeshPartAssetFormatMatch ]]
    -- upvalues: v1 (copy)
    local l_Handle_0 = v3:FindFirstChild("Handle");
    assert(l_Handle_0 and l_Handle_0:IsA("MeshPart"));
    local l_Handle_1 = v4:FindFirstChild("Handle");
    assert(l_Handle_1 and l_Handle_1:IsA("Part"));
    local l_SpecialMesh_0 = l_Handle_1:FindFirstChildOfClass("SpecialMesh");
    assert(l_SpecialMesh_0);
    if l_Handle_0.MeshId ~= l_SpecialMesh_0.MeshId then
        v1.reportFailure(v1.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, v5);
        return false, {
            string.format("Model meshId mismatch with rigid accessory SpecialMesh.MeshId for '%s'. You need to match the meshIds and try again.", v3.Name)
        };
    else
        local l_TextureID_0 = l_Handle_0.TextureID;
        if l_TextureID_0 == "" then
            local l_SurfaceAppearance_0 = l_Handle_0:FindFirstChildOfClass("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                l_TextureID_0 = l_SurfaceAppearance_0.ColorMap;
            end;
        end;
        if l_TextureID_0 ~= l_SpecialMesh_0.TextureId then
            v1.reportFailure(v1.ErrorType.validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, v5);
            return false, {
                string.format("Model textureId mismatch with rigid accessory SpecialMesh.TextureId for '%s'. You need to match the textureIds and try again.", v3.Name)
            };
        else
            return true;
        end;
    end;
end;