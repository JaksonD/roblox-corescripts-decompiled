local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.util.createEditableInstancesForContext);
local v2 = require(l_Parent_0.util.getMeshSize);
local l_SharedDataMember_0 = require(l_Parent_0.validationSystem.ValidationEnums).SharedDataMember;
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationAddPBRToSharedData);
local v11 = {
    cleanup = function(v6) --[[ Line: 19 ]] --[[ Name: cleanup ]]
        -- upvalues: v5 (copy)
        for v7, v8 in v6 do
            if v8.createdInValidation then
                v8.editable:Destroy();
            end;
            if v5() and v8.isPBR ~= nil then
                for _, v10 in v8 do
                    if typeof(v10) == "table" and v10.createdInValidation then
                        v10.editable:Destroy();
                    end;
                end;
            end;
            v6[v7] = nil;
        end;
    end
};
local function v20(v12, v13, v14) --[[ Line: 44 ]] --[[ Name: getMeshData ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v15 = v12:IsA("MeshPart") and v12.MeshContent or Content.fromUri(v12.MeshId);
    local v16, v17 = v1.getEditableInstanceInfo(v15, v14, "EditableMesh", v13);
    if not v16 then
        return false;
    else
        local v18 = nil;
        local v19 = nil;
        if v12:IsA("MeshPart") then
            if v12.MeshContent.SourceType == Enum.ContentSourceType.Object then
                v18 = v2({
                    editableMesh = v17.instance
                });
                v19 = Vector3.new(1, 1, 1, 0);
            else
                v18 = v12.MeshSize;
                v19 = v12.Size / v12.MeshSize;
            end;
        elseif v12:IsA("SpecialMesh") then
            v18 = v2({
                editableMesh = v17.instance
            });
            v19 = v12.Scale;
        end;
        return true, {
            editable = v17.instance, 
            createdInValidation = v17.created, 
            originalSize = v18, 
            scale = v19
        };
    end;
end;
local function v27(v21, v22, v23) --[[ Line: 84 ]] --[[ Name: getTextureData_deprecated ]]
    -- upvalues: v1 (copy)
    local v24 = nil;
    v24 = if v21:IsA("MeshPart") then v21.TextureContent else Content.fromUri(v21.TextureId);
    local v25, v26 = v1.getEditableInstanceInfo(v24, v23, "EditableImage", v22);
    if v25 then
        return true, {
            editable = v26.instance, 
            createdInValidation = v26.created
        };
    else
        return false;
    end;
end;
local function v39(v28, v29, v30) --[[ Line: 112 ]] --[[ Name: getTextureData ]]
    -- upvalues: v1 (copy), v11 (copy)
    local l_SurfaceAppearance_0 = v28:FindFirstChildWhichIsA("SurfaceAppearance");
    local v32 = {};
    if l_SurfaceAppearance_0 ~= nil then
        v32 = {
            isPBR = true, 
            ColorMap = l_SurfaceAppearance_0.ColorMapContent, 
            MetalnessMap = l_SurfaceAppearance_0.MetalnessMapContent, 
            NormalMap = l_SurfaceAppearance_0.NormalMapContent, 
            RoughnessMap = l_SurfaceAppearance_0.RoughnessMapContent
        };
    else
        local v33 = nil;
        v33 = if v28:IsA("MeshPart") then v28.TextureContent else Content.fromUri(v28.TextureId);
        v32 = {
            isPBR = false, 
            Texture = v33
        };
    end;
    local v34 = {
        isPBR = v32.isPBR
    };
    for v35, v36 in v32 do
        if v35 ~= "isPBR" and v36.SourceType ~= Enum.ContentSourceType.None then
            local v37, v38 = v1.getEditableInstanceInfo(v36, v30, "EditableImage", v29);
            if not v37 then
                v11.cleanup(v34);
                return false;
            else
                v34[v35] = {
                    editable = v38.instance, 
                    createdInValidation = v38.created
                };
            end;
        end;
    end;
    return true, v34;
end;
local function v48(v40, v41, v42, v43) --[[ Line: 168 ]] --[[ Name: getCageData ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v44 = nil;
    local v45 = nil;
    if not v41 and v40.ClassName == "WrapLayer" then
        v44 = v40.ReferenceMeshContent;
        v45 = v40.ReferenceOrigin;
    else
        v44 = v40.CageMeshContent;
        v45 = v40.CageOrigin;
    end;
    local v46, v47 = v1.getEditableInstanceInfo(v44, v43, "EditableMesh", v42);
    if v46 then
        return true, {
            editable = v47.instance, 
            createdInValidation = v47.created, 
            originalSize = v2({
                editableMesh = v47.instance
            }), 
            origin = v45
        };
    else
        return false;
    end;
end;
local function v53(v49, v50) --[[ Line: 202 ]] --[[ Name: getDataInstance_deprecated ]]
    -- upvalues: l_SharedDataMember_0 (copy)
    if v49:IsA("MeshPart") or v49:IsA("Part") and v49:FindFirstChildOfClass("SpecialMesh") then
        local v51 = v49:IsA("MeshPart") and v49 or v49:FindFirstChildOfClass("SpecialMesh");
        if v50 == l_SharedDataMember_0.meshTextures and (v51.ClassName == "MeshPart" and v51.TextureContent.SourceType == Enum.ContentSourceType.None or v51.ClassName == "SpecialMesh" and v51.TextureId == "") then
            return false;
        elseif v50 == l_SharedDataMember_0.renderMeshesData or v50 == l_SharedDataMember_0.meshTextures then
            return true, v51;
        else
            local l_BaseWrap_0 = v49:FindFirstChildWhichIsA("BaseWrap");
            if v50 == l_SharedDataMember_0.outerCagesData then
                return true, l_BaseWrap_0;
            elseif v50 == l_SharedDataMember_0.innerCagesData and l_BaseWrap_0 and l_BaseWrap_0.ClassName == "WrapLayer" then
                return true, l_BaseWrap_0;
            end;
        end;
    end;
    return false;
end;
local function v61(v54, v55) --[[ Line: 237 ]] --[[ Name: getDataInstance ]]
    -- upvalues: l_SharedDataMember_0 (copy)
    local v56 = v54:IsA("MeshPart") and v54 or v54:FindFirstChildOfClass("SpecialMesh");
    if v56 then
        local l_BaseWrap_1 = v54:FindFirstChildWhichIsA("BaseWrap");
        if v55 == l_SharedDataMember_0.renderMeshesData then
            return true, v56;
        elseif v55 == l_SharedDataMember_0.meshTextures then
            local v58 = v56:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil;
            local v59 = false;
            if v56.ClassName == "SpecialMesh" then
                v59 = v56.TextureId ~= "";
            end;
            local v60 = false;
            if v56.ClassName == "MeshPart" then
                v60 = v56.TextureContent.SourceType ~= Enum.ContentSourceType.None;
            end;
            return v60 or v58 or v59, v56;
        elseif v55 == l_SharedDataMember_0.outerCagesData and l_BaseWrap_1 then
            return l_BaseWrap_1.CageMeshContent.SourceType ~= Enum.ContentSourceType.None, l_BaseWrap_1;
        elseif v55 == l_SharedDataMember_0.innerCagesData and l_BaseWrap_1 and l_BaseWrap_1.ClassName == "WrapLayer" then
            return l_BaseWrap_1.ReferenceMeshContent.SourceType ~= Enum.ContentSourceType.None, l_BaseWrap_1;
        end;
    end;
    return false;
end;
v11.getDatas = function(v62, v63, v64, v65, v66) --[[ Line: 267 ]] --[[ Name: getDatas ]]
    -- upvalues: v5 (copy), v61 (copy), v53 (copy), l_SharedDataMember_0 (copy), v20 (copy), v48 (copy), v39 (copy), v27 (copy), v11 (copy)
    local v67 = {};
    local l_v62_Descendants_0 = v62:GetDescendants();
    table.insert(l_v62_Descendants_0, v62);
    for _, v70 in l_v62_Descendants_0 do
        local v71 = nil;
        local v72 = nil;
        if v5() then
            local v73, v74 = v61(v70, v63);
            v71 = v73;
            v72 = v74;
        else
            local v75, v76 = v53(v70, v63);
            v71 = v75;
            v72 = v76;
        end;
        if v71 then
            local v77 = nil;
            local v78 = nil;
            if v63 == l_SharedDataMember_0.renderMeshesData then
                local v79, v80 = v20(v72, v64, v65);
                v77 = v79;
                v78 = v80;
            elseif v63 == l_SharedDataMember_0.innerCagesData or v63 == l_SharedDataMember_0.outerCagesData then
                local v81 = v63 == l_SharedDataMember_0.outerCagesData;
                local v82, v83 = v48(v72, v81, v64, v65);
                v77 = v82;
                v78 = v83;
            elseif v63 == l_SharedDataMember_0.meshTextures then
                if v5() then
                    local v84, v85 = v39(v72, v64, v66);
                    v77 = v84;
                    v78 = v85;
                else
                    local v86, v87 = v27(v72, v64, v66);
                    v77 = v86;
                    v78 = v87;
                end;
            end;
            if not v77 or v78 == nil then
                v11.cleanup(v67);
                return;
            else
                v67[v70.Name] = v78;
            end;
        end;
    end;
    return v67;
end;
return v11;