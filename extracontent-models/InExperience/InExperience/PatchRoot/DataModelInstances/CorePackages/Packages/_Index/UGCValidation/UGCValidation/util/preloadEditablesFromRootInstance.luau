local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = {
    MeshId = true, 
    CageMeshId = true, 
    ReferenceMeshId = true
};
local v2 = {
    TextureId = true, 
    MetalnessMap = true, 
    NormalMap = true, 
    RoughnessMap = true
};
return function(v3) --[[ Line: 15 ]] --[[ Name: preloadEditablesFromRootInstance ]]
    -- upvalues: v1 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    local v4 = {};
    local v5 = {};
    local l_v3_Descendants_0 = v3:GetDescendants();
    table.insert(l_v3_Descendants_0, v3);
    for _, v8 in l_v3_Descendants_0 do
        if v8:IsA("BinaryStringValue") and v1[v8.Name] then
            v4[v8.Parent[v8.Name]] = l_UGCValidationService_0:CreateEditableMeshFromBinaryStringRobloxOnly(v8);
        elseif v8:IsA("BinaryStringValue") and v2[v8.Name] then
            v5[v8.Parent[v8.Name]] = l_UGCValidationService_0:CreateEditableImageFromBinaryStringRobloxOnly(v8);
        end;
    end;
    return v4, v5;
end;