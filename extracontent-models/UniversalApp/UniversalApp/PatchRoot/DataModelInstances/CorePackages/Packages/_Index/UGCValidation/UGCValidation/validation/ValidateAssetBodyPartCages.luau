local l_Parent_0 = script.Parent.Parent;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v6 = require(l_util_0.pcallDeferred);
local v7 = require(l_util_0.FailureReasonsAccumulator);
local v8 = require(l_util_0.getExpectedPartSize);
local v9 = require(l_util_0.getMeshInfo);
local v10 = require(l_util_0.AssetCalculator);
local l_flags_0 = l_Parent_0.flags;
local v12 = require(l_flags_0.GetFStringUGCValidationMaxCageDistance);
local v13 = {};
local function v27(v14, v15) --[[ Line: 26 ]] --[[ Name: validateInternal ]]
    -- upvalues: v9 (copy), v3 (copy), v8 (copy), v6 (copy), l_UGCValidationService_0 (copy), v2 (copy), v12 (copy)
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19, v20, v21 = v9(v14, v3.MESH_CONTENT_TYPE.RENDER_MESH, v15);
    v16 = v19;
    v17 = v20;
    v18 = v21;
    if not v16 then
        return false, v17;
    else
        v19 = v14:FindFirstChildWhichIsA("WrapTarget");
        assert(v19, "Missing WrapTarget child for " .. v14.Name);
        v20 = nil;
        v21 = nil;
        local v22 = nil;
        local v23, v24, v25 = v9(v19, v3.MESH_CONTENT_TYPE.OUTER_CAGE, v15);
        v20 = v23;
        v21 = v24;
        v22 = v25;
        if not v20 then
            return false, v21;
        else
            v23 = v8(v14, v15) / v8(v14, v15, true);
            v24, v25 = v6(function() --[[ Line: 50 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v22 (ref), v18 (ref), v19 (copy), v23 (copy)
                return l_UGCValidationService_0:CalculateBodyPartMaxCageDistance(v22.editableMesh, v18.editableMesh, v19.CageOrigin, v23);
            end, v15);
            if not v24 then
                local v26 = ("Failed to execute body part max cage distance check. Make sure %*'s render mesh and its WrapTarget's cage mesh exist, and try again."):format(v14.Name);
                if v15.isServer ~= nil and v15.isServer then
                    error(v26);
                end;
                v2.reportFailure(v2.ErrorType.validateBodyPartCage_FailedToExecute, nil, v15);
                return false, {
                    v26
                };
            elseif v12.asNumber() < v25 then
                v2.reportFailure(v2.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, v15);
                return false, {
                    string.format("Cage mesh verts referenced in %s.%s.CageMeshId were found that are %.2f studs outside the %s render mesh. %s studs is the maximum. Reduce the size of your cage mesh.", v14.Name, v19.Name, v25, v14.Name, v12.asString())
                };
            else
                return true;
            end;
        end;
    end;
end;
v13.validateSingleBodyPart = function(v28, v29) --[[ Line: 93 ]] --[[ Name: validateSingleBodyPart ]]
    -- upvalues: v3 (copy), v7 (copy), v27 (copy), v2 (copy)
    local v30 = tick();
    local v31 = v3.ASSET_TYPE_INFO[v29.assetTypeEnum];
    local v32 = v7.new();
    if Enum.AssetType.DynamicHead == v29.assetTypeEnum then
        return v27(v28, v29);
    else
        for v33 in pairs(v31.subParts) do
            local l_v28_FirstChild_0 = v28:FindFirstChild(v33);
            assert(l_v28_FirstChild_0, "expected parts have been checked for existance before calling this function");
            v32:updateReasons(v27(l_v28_FirstChild_0, v29));
        end;
        v2.recordScriptTime(script.Name, v30, v29);
        return v32:getFinalResults();
    end;
end;
v13.validateFullBody = function(v35, v36) --[[ Line: 116 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v10 (copy), v9 (copy), v3 (copy), v8 (copy), v6 (copy), l_UGCValidationService_0 (copy), v2 (copy), v12 (copy)
    local v37 = tick();
    local v38 = v10.calculateAllTransformsForFullBody(v35);
    local v39 = {};
    for _, v41 in v35 do
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local v45, v46, v47 = v9(v41, v3.MESH_CONTENT_TYPE.RENDER_MESH, v36);
        v42 = v45;
        v43 = v46;
        v44 = v47;
        if not v42 then
            return false, v43;
        else
            v45 = v41:FindFirstChildWhichIsA("WrapTarget");
            assert(v45, "Missing WrapTarget child for " .. v41.Name);
            v46 = nil;
            v47 = nil;
            local v48 = nil;
            local v49, v50, v51 = v9(v45, v3.MESH_CONTENT_TYPE.OUTER_CAGE, v36);
            v46 = v49;
            v47 = v50;
            v48 = v51;
            if not v46 then
                return false, v47;
            else
                v49 = v8(v41, v36) / v8(v41, v36, true);
                table.insert(v39, {
                    renderMesh = v44.editableMesh, 
                    outerCage = v48.editableMesh, 
                    renderMeshTransform = v38[v41.Name], 
                    outerCageLocalTransform = v45.CageOrigin, 
                    scale = v49, 
                    name = v41.Name
                });
            end;
        end;
    end;
    local v52, v53, v54 = v6(function() --[[ Line: 158 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v39 (copy)
        return l_UGCValidationService_0:CalculateBodyMaxCageDistance(v39);
    end, v36);
    v2.recordScriptTime(script.Name, v37, v36);
    if not v52 then
        if v36.isServer ~= nil and v36.isServer then
            error("Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again.");
        end;
        v2.reportFailure(v2.ErrorType.validateBodyPartCage_FailedToExecute, nil, v36);
        return false, {
            "Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again."
        };
    elseif v12.asNumber() < v53 then
        v2.reportFailure(v2.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, v36);
        return false, {
            string.format("A vertex was found on the %s's cage mesh that is %.2f studs away from the closest render mesh. %s studs is the maximum. Make the cage mesh more closely match the shape and size of the render mesh.", v54, v53, v12.asString()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#bodyCageMaxSize)"
        };
    else
        return true;
    end;
end;
return v13;