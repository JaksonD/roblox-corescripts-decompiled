local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.validation.validateMeshComparison);
local v6 = require(l_Parent_0.util.getMeshSize);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local v8 = require(l_Parent_0.util.getExpectedPartSize);
local v9 = require(l_Parent_0.util.getMeshInfo);
local v10 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidationConsolidateGetMeshInfos);
local function v21(v12, v13, v14, v15, v16, v17) --[[ Line: 24 ]] --[[ Name: DEPRECATED_getMeshInfoHelper ]]
    -- upvalues: v7 (copy)
    local v18 = {
        fullName = v12:GetFullName(), 
        contentId = v14, 
        fieldName = v13, 
        context = v16, 
        scale = v15
    };
    local v19, v20 = v7(v12, v13, v17);
    if not v19 then
        return false, v18;
    else
        v18.editableMesh = v20;
        return true, v18;
    end;
end;
local function v25(v22, v23, v24) --[[ Line: 51 ]] --[[ Name: DEPRECATED_getMeshInfo ]]
    -- upvalues: v21 (copy)
    if v22:IsA("WrapTarget") then
        return v21(v22, "CageMeshId", v22.CageMeshId, v23, v22.ClassName, v24);
    elseif v22:IsA("MeshPart") then
        return v21(v22, "MeshId", v22.MeshId, v23, v22.Name, v24);
    else
        return false;
    end;
end;
local function v48(v26, v27, v28) --[[ Line: 79 ]] --[[ Name: validateWrapTargetComparison ]]
    -- upvalues: v11 (copy), v9 (copy), v4 (copy), v25 (copy), v5 (copy)
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if v11() then
        local v32, v33, v34 = v9(v27, v4.MESH_CONTENT_TYPE.RENDER_MESH, v28);
        v29 = v32;
        v30 = v33;
        v31 = v34;
    else
        local v35, v36 = v25(v27, v26, v28);
        v29 = v35;
        v31 = v36;
    end;
    if not v29 then
        local v37 = false;
        if v11() then
            return v37, v30;
        else
            return v37, {
                "Failed to load mesh data"
            };
        end;
    else
        local l_WrapTarget_0 = v27:FindFirstChildWhichIsA("WrapTarget");
        assert(l_WrapTarget_0, "Missing WrapTarget child for " .. v27.Name);
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        if v11() then
            local v42, v43, v44 = v9(l_WrapTarget_0, v4.MESH_CONTENT_TYPE.OUTER_CAGE, v28);
            v39 = v42;
            v40 = v43;
            v41 = v44;
        else
            local v45, v46 = v25(l_WrapTarget_0, v26, v28);
            v39 = v45;
            v41 = v46;
        end;
        if not v39 then
            local v47 = false;
            if v11() then
                return v47, v40;
            else
                return v47, {
                    "Failed to load mesh data"
                };
            end;
        else
            if v11() then
                v31.scale = v26;
                v41.scale = v26;
            end;
            return v5(v31, v41, v4.RenderVsWrapMeshMaxDiff, v28);
        end;
    end;
end;
local function v56(v49, v50) --[[ Line: 125 ]] --[[ Name: calculateMeshSize ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v51 = {
        fullName = v49:GetFullName(), 
        fieldName = "MeshId", 
        contentId = v49.MeshId, 
        context = v49.Name
    };
    local v52, v53 = v7(v49, "MeshId", v50);
    if not v52 then
        return false, {
            string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v51.fullName)
        };
    else
        v51.editableMesh = v53;
        local v54, v55 = v2(function() --[[ Line: 149 ]]
            -- upvalues: v6 (ref), v51 (copy)
            return v6(v51);
        end, v50);
        if not v54 then
            v3.reportFailure(v3.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, v50);
            if v50.isServer then
                error("Failed to read mesh");
            end;
            return false, {
                "Failed to read mesh"
            };
        else
            return true, nil, v55;
        end;
    end;
end;
local function v65(v57, v58) --[[ Line: 167 ]] --[[ Name: validateInternal ]]
    -- upvalues: v56 (copy), v8 (copy), v10 (copy), v48 (copy), v3 (copy)
    local v59 = tick();
    local v60, v61, v62 = v56(v57, v58);
    if not v60 or not v62 then
        return v60, v61;
    else
        local v63 = v8(v57, v58) / v62;
        local v64 = v10.new();
        v64:updateReasons(v48(v63, v57, v58));
        v3.recordScriptTime(script.Name, v59, v58);
        return v64:getFinalResults();
    end;
end;
return function(v66, v67) --[[ Line: 188 ]] --[[ Name: validateBodyPartMeshBounds ]]
    -- upvalues: v4 (copy), v65 (copy), v10 (copy)
    local l_assetTypeEnum_0 = v67.assetTypeEnum;
    local v69 = v4.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v65(v66, v67);
    else
        local v70 = v10.new();
        for v71 in pairs(v69.subParts) do
            local l_v66_FirstChild_0 = v66:FindFirstChild(v71);
            assert(l_v66_FirstChild_0);
            v70:updateReasons(v65(l_v66_FirstChild_0, v67));
        end;
        return v70:getFinalResults();
    end;
end;