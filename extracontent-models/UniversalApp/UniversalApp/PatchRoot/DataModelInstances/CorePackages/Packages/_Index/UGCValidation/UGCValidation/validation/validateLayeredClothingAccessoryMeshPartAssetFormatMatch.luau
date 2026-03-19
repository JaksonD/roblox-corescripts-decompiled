local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: validateLayeredClothingAccessoryMeshPartAssetFormatMatch ]]
    -- upvalues: v1 (copy)
    local l_Handle_0 = v3:FindFirstChild("Handle");
    assert(l_Handle_0 and l_Handle_0:IsA("MeshPart"));
    local l_Handle_1 = v4:FindFirstChild("Handle");
    assert(l_Handle_1 and l_Handle_1:IsA("MeshPart"));
    if l_Handle_0.MeshId ~= l_Handle_1.MeshId then
        v1.reportFailure(v1.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch, nil, v5);
        return false, {
            string.format("Model meshId mismatch between MeshPart.MeshId and SpecialMesh.MeshId for %s. You need to match the meshIds and try again.", v3.Name)
        };
    elseif l_Handle_0.TextureID ~= l_Handle_1.TextureID then
        v1.reportFailure(v1.ErrorType.validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch, nil, v5);
        return false, {
            string.format("Model textureId mismatch between MeshPart.TextureID and SpecialMesh.TextureId for %s. You need to match the textureIds and try again.", v3.Name)
        };
    else
        return true;
    end;
end;