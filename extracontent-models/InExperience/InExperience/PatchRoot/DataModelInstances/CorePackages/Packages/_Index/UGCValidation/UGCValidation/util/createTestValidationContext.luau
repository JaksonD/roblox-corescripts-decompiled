local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local _ = require(l_Parent_0.util.Types);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_UGCValidationService_0 (copy)
    local v5 = {
        isServer = true, 
        assetTypeEnum = v3, 
        validateMeshPartAccessories = false
    };
    local v6 = {};
    local v7 = {};
    for _, v9 in v4 do
        for _, v11 in v9:GetDescendants() do
            if v11:IsA("BinaryStringValue") then
                if v11.Name == "MeshId" or v11.Name == "CageMeshId" or v11.Name == "ReferenceMeshId" then
                    if not v6[v11.Parent] then
                        v6[v11.Parent] = {};
                    end;
                    v6[v11.Parent][v11.Name] = {
                        created = true, 
                        instance = l_UGCValidationService_0:CreateEditableMeshFromBinaryStringRobloxOnly(v11)
                    };
                else
                    if not v7[v11.Parent] then
                        v7[v11.Parent] = {};
                    end;
                    v7[v11.Parent][v11.Name] = {
                        created = true, 
                        instance = l_UGCValidationService_0:CreateEditableImageFromBinaryStringRobloxOnly(v11)
                    };
                end;
            end;
        end;
    end;
    v5.editableMeshes = v6;
    v5.editableImages = v7;
    return v5;
end;