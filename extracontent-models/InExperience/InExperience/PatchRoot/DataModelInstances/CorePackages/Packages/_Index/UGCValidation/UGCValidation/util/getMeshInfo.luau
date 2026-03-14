local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
local function v7(v5, v6) --[[ Line: 14 ]] --[[ Name: getContent ]]
    -- upvalues: v1 (copy)
    if v6 == v1.MESH_CONTENT_TYPE.RENDER_MESH then
        assert(v5:IsA("MeshPart"), "Only MESH_TYPE.RENDER_MESH is only supported for MeshPart");
        return v5.MeshId;
    elseif v6 == v1.MESH_CONTENT_TYPE.OUTER_CAGE then
        assert(v5:IsA("BaseWrap"), "Only MESH_TYPE.OUTER_CAGE is only supported for BaseWrap");
        return v5.CageMeshId;
    elseif v6 == v1.MESH_CONTENT_TYPE.INNER_CAGE then
        assert(v5:IsA("WrapLayer"), "Only MESH_TYPE.INNER_CAGE is only supported for WrapLayer");
        return v5.ReferenceMeshId;
    else
        error("No valid mesh content type was provided");
        return;
    end;
end;
local function v16(v8, v9, v10) --[[ Line: 29 ]] --[[ Name: getMeshInfo ]]
    -- upvalues: v7 (copy), v1 (copy), v3 (copy)
    local v11 = v7(v8, v9);
    local l_v8_FullName_0 = v8:GetFullName();
    local v13 = v1.MESH_CONTENT_TYPE_TO_FIELD_NAME[v9];
    local v14, v15 = v3(v8, v13, v10);
    if not v14 then
        return false, {
            string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", l_v8_FullName_0)
        };
    else
        return true, nil, {
            fullName = l_v8_FullName_0, 
            fieldName = v13, 
            contentId = v11, 
            context = v8.ClassName, 
            editableMesh = v15
        };
    end;
end;
local function v22(v17, v18) --[[ Line: 56 ]] --[[ Name: DEPRECATED_getMeshInfo ]]
    -- upvalues: v3 (copy)
    local l_v17_FullName_0 = v17:GetFullName();
    local v20, v21 = v3(v17, "MeshId", v18);
    if not v20 then
        return false, {
            string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", l_v17_FullName_0)
        };
    else
        return true, nil, {
            fullName = l_v17_FullName_0, 
            fieldName = "MeshId", 
            contentId = v17.MeshId, 
            context = v17.ClassName, 
            editableMesh = v21
        };
    end;
end;
if v4() then
    return v16;
else
    return v22;
end;