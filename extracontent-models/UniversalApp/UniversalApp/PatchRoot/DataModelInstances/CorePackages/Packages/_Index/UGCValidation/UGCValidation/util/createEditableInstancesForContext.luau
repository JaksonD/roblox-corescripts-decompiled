local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
local l_AssetService_0 = game:GetService("AssetService");
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.destroyEditableInstances);
local function _(v6, v7, v8, v9, v10) --[[ Line: 14 ]] --[[ Name: addEditableInstance ]]
    local l_editableMeshes_0 = v6.editableMeshes;
    if v10 == "EditableImage" then
        l_editableMeshes_0 = v6.editableImages;
    end;
    if not l_editableMeshes_0[v7] then
        l_editableMeshes_0[v7] = {};
    end;
    l_editableMeshes_0[v7][v8] = v9;
end;
local function v18(v13, v14, v15) --[[ Line: 27 ]] --[[ Name: createEditableInstanceFromId ]]
    -- upvalues: l_AssetService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 28 ]]
        -- upvalues: v15 (copy), l_AssetService_0 (ref), v13 (copy)
        if v15 == "EditableMesh" then
            return l_AssetService_0:CreateEditableMeshAsync(v13);
        else
            return (l_AssetService_0:CreateEditableImageAsync(v13));
        end;
    end);
    if not l_status_0 then
        return l_status_0, l_result_0;
    else
        v14[v13.Uri] = l_result_0;
        return true, {
            created = true, 
            instance = l_result_0
        };
    end;
end;
v1.getEditableInstanceInfo = function(v19, v20, v21, v22) --[[ Line: 47 ]] --[[ Name: getEditableInstanceInfo ]]
    -- upvalues: v18 (copy)
    local v23 = nil;
    if v22 then
        v23 = v19.Object;
    end;
    if not v23 then
        local l_Uri_0 = v19.Uri;
        if l_Uri_0 and l_Uri_0 ~= "" then
            v23 = v20[l_Uri_0];
            if not v23 then
                return v18(v19, v20, v21);
            end;
        end;
    end;
    return true, {
        instance = v23, 
        created = false
    };
end;
local function _(v25, v26, v27, v28) --[[ Line: 73 ]] --[[ Name: addContent ]]
    v25[v26] = {
        content = v27, 
        contentType = v28
    };
end;
local function v32(v30, v31) --[[ Line: 80 ]] --[[ Name: getTextureContentMap ]]
    -- upvalues: v2 (copy)
    if v30:IsA("MeshPart") then
        v31.TextureID = {
            content = v30.TextureContent, 
            contentType = "EditableImage"
        };
        return;
    elseif v30:IsA("SpecialMesh") then
        v31.TextureId = {
            content = Content.fromUri(v30.TextureId), 
            contentType = "EditableImage"
        };
        return;
    else
        if v30:IsA("SurfaceAppearance") or v2() and v30:IsA("Decal") then
            v31.ColorMap = {
                content = v30.ColorMapContent, 
                contentType = "EditableImage"
            };
            v31.MetalnessMap = {
                content = v30.MetalnessMapContent, 
                contentType = "EditableImage"
            };
            v31.NormalMap = {
                content = v30.NormalMapContent, 
                contentType = "EditableImage"
            };
            v31.RoughnessMap = {
                content = v30.RoughnessMapContent, 
                contentType = "EditableImage"
            };
        end;
        return;
    end;
end;
local function _(v33) --[[ Line: 119 ]] --[[ Name: getCageMeshContent ]]
    return v33.CageMeshContent;
end;
local function v37(v35, v36) --[[ Line: 123 ]] --[[ Name: getMeshContentMap ]]
    -- upvalues: v2 (copy)
    if v35:IsA("MeshPart") then
        v36.MeshId = {
            content = v35.MeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v35:IsA("WrapTarget") then
        v36.CageMeshId = {
            content = v35.CageMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v35:IsA("WrapLayer") then
        v36.CageMeshId = {
            content = v35.CageMeshContent, 
            contentType = "EditableMesh"
        };
        v36.ReferenceMeshId = {
            content = v35.ReferenceMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v35:IsA("SpecialMesh") then
        v36.MeshId = {
            content = Content.fromUri(v35.MeshId), 
            contentType = "EditableMesh"
        };
        return;
    else
        if v2() and v35:IsA("WrapTextureTransfer") then
            v36.ReferenceCageMeshContent = {
                content = v35.ReferenceCageMeshContent, 
                contentType = "EditableMesh"
            };
        end;
        return;
    end;
end;
v1.getOrCreateEditableInstances = function(v38, v39, v40, v41) --[[ Line: 144 ]] --[[ Name: getOrCreateEditableInstances ]]
    -- upvalues: v37 (copy), v32 (copy), v1 (copy)
    local v42 = {};
    v37(v38, v42);
    v32(v38, v42);
    for v43, v44 in v42 do
        local l_contentType_0 = v44.contentType;
        local v46, v47 = v1.getEditableInstanceInfo(v44.content, v39, l_contentType_0, v41);
        if not v46 then
            return v46, v47;
        else
            local l_editableMeshes_1 = v40.editableMeshes;
            if l_contentType_0 == "EditableImage" then
                l_editableMeshes_1 = v40.editableImages;
            end;
            if not l_editableMeshes_1[v38] then
                l_editableMeshes_1[v38] = {};
            end;
            l_editableMeshes_1[v38][v43] = v47;
        end;
    end;
    return true;
end;
v1.processAll = function(v49, v50) --[[ Line: 172 ]] --[[ Name: processAll ]]
    -- upvalues: v1 (copy), v5 (copy)
    local v51 = {
        editableMeshes = {}, 
        editableImages = {}
    };
    local v52 = {};
    for _, v54 in v49 do
        local l_v54_Descendants_0 = v54:GetDescendants();
        table.insert(l_v54_Descendants_0, v54);
        for _, v57 in pairs(l_v54_Descendants_0) do
            local v58, v59 = v1.getOrCreateEditableInstances(v57, v52, v51, v50);
            if not v58 then
                v5(v51.editableMeshes, v51.editableImages);
                return false, {
                    v59
                };
            end;
        end;
    end;
    return true, v51;
end;
return v1;