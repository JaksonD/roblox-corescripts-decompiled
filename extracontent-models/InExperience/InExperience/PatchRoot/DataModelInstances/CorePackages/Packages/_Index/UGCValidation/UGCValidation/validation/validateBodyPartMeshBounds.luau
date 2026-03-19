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
local function v24(v11, v12, v13) --[[ Line: 21 ]] --[[ Name: validateWrapTargetComparison ]]
    -- upvalues: v9 (copy), v4 (copy), v5 (copy)
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17, v18, v19 = v9(v12, v4.MESH_CONTENT_TYPE.RENDER_MESH, v13);
    v14 = v17;
    v15 = v18;
    v16 = v19;
    if not v14 then
        return false, v15;
    else
        v17 = v12:FindFirstChildWhichIsA("WrapTarget");
        assert(v17, "Missing WrapTarget child for " .. v12.Name);
        v18 = nil;
        v19 = nil;
        local v20 = nil;
        local v21, v22, v23 = v9(v17, v4.MESH_CONTENT_TYPE.OUTER_CAGE, v13);
        v18 = v21;
        v19 = v22;
        v20 = v23;
        if not v18 then
            return false, v19;
        else
            v16.scale = v11;
            v20.scale = v11;
            return v5(v16, v20, v4.RenderVsWrapMeshMaxDiff, v13);
        end;
    end;
end;
local function v32(v25, v26) --[[ Line: 52 ]] --[[ Name: calculateMeshSize ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v3 (copy)
    local v27 = {
        fullName = v25:GetFullName(), 
        fieldName = "MeshId", 
        contentId = v25.MeshId, 
        context = v25.Name
    };
    local v28, v29 = v7(v25, "MeshId", v26);
    if not v28 then
        return false, {
            string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v27.fullName)
        };
    else
        v27.editableMesh = v29;
        local v30, v31 = v2(function() --[[ Line: 76 ]]
            -- upvalues: v6 (ref), v27 (copy)
            return v6(v27);
        end, v26);
        if not v30 then
            v3.reportFailure(v3.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, v26);
            if v26.isServer then
                error("Failed to read mesh");
            end;
            return false, {
                "Failed to read mesh"
            };
        else
            return true, nil, v31;
        end;
    end;
end;
local function v41(v33, v34) --[[ Line: 94 ]] --[[ Name: validateInternal ]]
    -- upvalues: v32 (copy), v8 (copy), v10 (copy), v24 (copy), v3 (copy)
    local v35 = tick();
    local v36, v37, v38 = v32(v33, v34);
    if not v36 or not v38 then
        return v36, v37;
    else
        local v39 = v8(v33, v34) / v38;
        local v40 = v10.new();
        v40:updateReasons(v24(v39, v33, v34));
        v3.recordScriptTime(script.Name, v35, v34);
        return v40:getFinalResults();
    end;
end;
return function(v42, v43) --[[ Line: 115 ]] --[[ Name: validateBodyPartMeshBounds ]]
    -- upvalues: v4 (copy), v41 (copy), v10 (copy)
    local l_assetTypeEnum_0 = v43.assetTypeEnum;
    local v45 = v4.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v41(v42, v43);
    else
        local v46 = v10.new();
        for v47 in pairs(v45.subParts) do
            local l_v42_FirstChild_0 = v42:FindFirstChild(v47);
            assert(l_v42_FirstChild_0);
            v46:updateReasons(v41(l_v42_FirstChild_0, v43));
        end;
        return v46:getFinalResults();
    end;
end;