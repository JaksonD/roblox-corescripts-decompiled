local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local function v6(v4, v5) --[[ Line: 12 ]] --[[ Name: getContent ]]
    -- upvalues: v1 (copy)
    if v5 == v1.MESH_CONTENT_TYPE.RENDER_MESH then
        assert(v4:IsA("MeshPart"), "Only MESH_TYPE.RENDER_MESH is only supported for MeshPart");
        return v4.MeshId;
    elseif v5 == v1.MESH_CONTENT_TYPE.OUTER_CAGE then
        assert(v4:IsA("BaseWrap"), "Only MESH_TYPE.OUTER_CAGE is only supported for BaseWrap");
        return v4.CageMeshId;
    elseif v5 == v1.MESH_CONTENT_TYPE.INNER_CAGE then
        assert(v4:IsA("WrapLayer"), "Only MESH_TYPE.INNER_CAGE is only supported for WrapLayer");
        return v4.ReferenceMeshId;
    else
        error("No valid mesh content type was provided");
        return;
    end;
end;
return function(v7, v8, v9) --[[ Line: 27 ]] --[[ Name: getMeshInfo ]]
    -- upvalues: v6 (copy), v1 (copy), v3 (copy)
    local v10 = v6(v7, v8);
    local l_v7_FullName_0 = v7:GetFullName();
    local v12 = v1.MESH_CONTENT_TYPE_TO_FIELD_NAME[v8];
    local v13, v14 = v3(v7, v12, v9);
    if not v13 then
        return false, {
            string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", l_v7_FullName_0)
        };
    else
        return true, nil, {
            fullName = l_v7_FullName_0, 
            fieldName = v12, 
            contentId = v10, 
            context = v7.ClassName, 
            editableMesh = v14
        };
    end;
end;