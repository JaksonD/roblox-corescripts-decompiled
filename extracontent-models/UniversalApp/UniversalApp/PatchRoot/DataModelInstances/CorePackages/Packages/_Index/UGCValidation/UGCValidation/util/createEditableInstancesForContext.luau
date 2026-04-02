local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
local l_AssetService_0 = game:GetService("AssetService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.destroyEditableInstances);
local l_game_EngineFeature_0 = game:GetEngineFeature("EngineCreateEditableImageOriginalSizeEnabled");
local function _(v8, v9, v10, v11, v12) --[[ Line: 18 ]] --[[ Name: addEditableInstance ]]
    local l_editableMeshes_0 = v8.editableMeshes;
    if v12 == "EditableImage" then
        l_editableMeshes_0 = v8.editableImages;
    end;
    if not l_editableMeshes_0[v9] then
        l_editableMeshes_0[v9] = {};
    end;
    l_editableMeshes_0[v9][v10] = v11;
end;
local function v20(v15, v16, v17) --[[ Line: 31 ]] --[[ Name: createEditableInstanceFromId ]]
    -- upvalues: l_AssetService_0 (copy), l_game_EngineFeature_0 (copy), l_UGCValidationService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 32 ]]
        -- upvalues: v17 (copy), l_AssetService_0 (ref), v15 (copy), l_game_EngineFeature_0 (ref), l_UGCValidationService_0 (ref)
        if v17 == "EditableMesh" then
            return l_AssetService_0:CreateEditableMeshAsync(v15);
        elseif l_game_EngineFeature_0 then
            return l_UGCValidationService_0:CreateEditableImageOriginalSizeAsync(v15.Uri);
        else
            return (l_AssetService_0:CreateEditableImageAsync(v15));
        end;
    end);
    if not l_status_0 then
        return l_status_0, l_result_0;
    else
        v16[v15.Uri] = l_result_0;
        return true, {
            created = true, 
            instance = l_result_0
        };
    end;
end;
v1.getEditableInstanceInfo = function(v21, v22, v23, v24) --[[ Line: 55 ]] --[[ Name: getEditableInstanceInfo ]]
    -- upvalues: v20 (copy)
    local v25 = nil;
    if v24 then
        v25 = v21.Object;
    end;
    if not v25 then
        local l_Uri_0 = v21.Uri;
        if l_Uri_0 and l_Uri_0 ~= "" then
            v25 = v22[l_Uri_0];
            if not v25 then
                return v20(v21, v22, v23);
            end;
        end;
    end;
    return true, {
        instance = v25, 
        created = false
    };
end;
local function _(v27, v28, v29, v30) --[[ Line: 81 ]] --[[ Name: addContent ]]
    v27[v28] = {
        content = v29, 
        contentType = v30
    };
end;
local function v34(v32, v33) --[[ Line: 88 ]] --[[ Name: getTextureContentMap ]]
    -- upvalues: v2 (copy)
    if v32:IsA("MeshPart") then
        v33.TextureID = {
            content = v32.TextureContent, 
            contentType = "EditableImage"
        };
        return;
    elseif v32:IsA("SpecialMesh") then
        v33.TextureId = {
            content = Content.fromUri(v32.TextureId), 
            contentType = "EditableImage"
        };
        return;
    else
        if v32:IsA("SurfaceAppearance") or v2() and v32:IsA("Decal") then
            v33.ColorMap = {
                content = v32.ColorMapContent, 
                contentType = "EditableImage"
            };
            v33.MetalnessMap = {
                content = v32.MetalnessMapContent, 
                contentType = "EditableImage"
            };
            v33.NormalMap = {
                content = v32.NormalMapContent, 
                contentType = "EditableImage"
            };
            v33.RoughnessMap = {
                content = v32.RoughnessMapContent, 
                contentType = "EditableImage"
            };
        end;
        return;
    end;
end;
local function _(v35) --[[ Line: 127 ]] --[[ Name: getCageMeshContent ]]
    return v35.CageMeshContent;
end;
local function v39(v37, v38) --[[ Line: 131 ]] --[[ Name: getMeshContentMap ]]
    -- upvalues: v2 (copy)
    if v37:IsA("MeshPart") then
        v38.MeshId = {
            content = v37.MeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v37:IsA("WrapTarget") then
        v38.CageMeshId = {
            content = v37.CageMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v37:IsA("WrapLayer") then
        v38.CageMeshId = {
            content = v37.CageMeshContent, 
            contentType = "EditableMesh"
        };
        v38.ReferenceMeshId = {
            content = v37.ReferenceMeshContent, 
            contentType = "EditableMesh"
        };
        return;
    elseif v37:IsA("SpecialMesh") then
        v38.MeshId = {
            content = Content.fromUri(v37.MeshId), 
            contentType = "EditableMesh"
        };
        return;
    else
        if v2() and v37:IsA("WrapTextureTransfer") then
            v38.ReferenceCageMeshContent = {
                content = v37.ReferenceCageMeshContent, 
                contentType = "EditableMesh"
            };
        end;
        return;
    end;
end;
v1.getOrCreateEditableInstances = function(v40, v41, v42, v43) --[[ Line: 152 ]] --[[ Name: getOrCreateEditableInstances ]]
    -- upvalues: v39 (copy), v34 (copy), v1 (copy)
    local v44 = {};
    v39(v40, v44);
    v34(v40, v44);
    for v45, v46 in v44 do
        local l_contentType_0 = v46.contentType;
        local v48, v49 = v1.getEditableInstanceInfo(v46.content, v41, l_contentType_0, v43);
        if not v48 then
            return v48, v49;
        else
            local l_editableMeshes_1 = v42.editableMeshes;
            if l_contentType_0 == "EditableImage" then
                l_editableMeshes_1 = v42.editableImages;
            end;
            if not l_editableMeshes_1[v40] then
                l_editableMeshes_1[v40] = {};
            end;
            l_editableMeshes_1[v40][v45] = v49;
        end;
    end;
    return true;
end;
v1.processAll = function(v51, v52) --[[ Line: 180 ]] --[[ Name: processAll ]]
    -- upvalues: v1 (copy), v6 (copy)
    local v53 = {
        editableMeshes = {}, 
        editableImages = {}
    };
    local v54 = {};
    for _, v56 in v51 do
        local l_v56_Descendants_0 = v56:GetDescendants();
        table.insert(l_v56_Descendants_0, v56);
        for _, v59 in pairs(l_v56_Descendants_0) do
            local v60, v61 = v1.getOrCreateEditableInstances(v59, v54, v53, v52);
            if not v60 then
                v6(v53.editableMeshes, v53.editableImages);
                return false, {
                    v61
                };
            end;
        end;
    end;
    return true, v53;
end;
return v1;