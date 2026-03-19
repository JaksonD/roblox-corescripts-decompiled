local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v7 = require(l_Parent_0.validation.validateCageUVs);
local v8 = require(l_Parent_0.validation.validateMeshVertColors);
local v9 = require(l_Parent_0.validation.validateCageUVTriangleArea);
local v10 = require(l_Parent_0.validation.validateMeshTriangleArea);
local v11 = require(l_Parent_0.validation.validateCageUVValues);
local v12 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v13 = require(l_Parent_0.validation.validateSkinningTransfer);
local v14 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v15 = require(l_Parent_0.util.ParseContentIds);
local v16 = require(l_Parent_0.util.getMeshMinMax);
local v17 = require(l_Parent_0.util.getEditableMeshFromContext);
local v18 = require(l_Parent_0.util.floatEquals);
local v19 = require(l_Parent_0.util.getExpectedPartSize);
local v20 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestBody);
local v21 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v22 = require(l_Parent_0.flags.getFIntUGCValidateTriangleLimitTolerance);
local v23 = require(l_Parent_0.flags.getEngineUGCValidateRelativeSkinningTransfer);
local function v34(v24, v25, v26, v27) --[[ Line: 35 ]] --[[ Name: validateIsSkinned ]]
    -- upvalues: v3 (copy), v2 (copy), v21 (copy), v17 (copy), l_UGCValidationService_0 (copy)
    local l_v24_Attribute_0 = v24:GetAttribute(v3.AlternateMeshIdAttributeName);
    if not v24.HasSkinnedMesh and (l_v24_Attribute_0 == nil or l_v24_Attribute_0 == "" or not v26) then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, v27);
        return false, {
            (("Missing skinning data for %*.MeshId. You need to skin your model."):format(v24.Name))
        };
    elseif not v21() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 57 ]]
            -- upvalues: v17 (ref), v24 (copy), v27 (copy), l_UGCValidationService_0 (ref)
            local v29, v30 = v17(v24, "MeshId", v27);
            if not v29 then
                error("Failed to retrieve MeshContent");
            end;
            return l_UGCValidationService_0:ValidateSkinnedEditableMesh(v30);
        end);
        if not l_status_0 then
            if v25 then
                error("Failed to retrieve mesh data to validate skinned mesh");
            end;
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v27);
            return false, {
                "Failed to retrieve mesh data to validate skinned mesh"
            };
        elseif not l_result_0 then
            local v33 = ("Detected mismatch between model and skinned data for %*. You need to re-skin your model to fix this issue."):format(v24.Name);
            if v25 then
                error(v33);
            end;
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, v27);
            return false, {
                v33
            };
        else
            return true;
        end;
    end;
end;
local function v50(v35, v36, v37) --[[ Line: 100 ]] --[[ Name: validateTotalAssetTriangles ]]
    -- upvalues: v3 (copy), v17 (copy), v2 (copy), v5 (copy), l_UGCValidationService_0 (copy), v22 (copy)
    local l_isServer_0 = v37.isServer;
    local v39 = assert(v3.ASSET_RENDER_MESH_MAX_TRIANGLES[v36.Name]);
    local v47, v48, v49 = (function() --[[ Line: 108 ]] --[[ Name: calculateTotalAssetTriangles ]]
        -- upvalues: v35 (copy), v17 (ref), v37 (copy), v2 (ref), v5 (ref), l_UGCValidationService_0 (ref)
        local v40 = 0;
        for _, v42 in v35 do
            if v42.instance.ClassName == "MeshPart" then
                assert(v42.fieldName == "MeshId");
                local v43, v44 = v17(v42.instance, v42.fieldName, v37);
                if not v43 then
                    v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v37);
                    return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v42.instance.Name);
                else
                    local v45, v46 = v5(function() --[[ Line: 131 ]]
                        -- upvalues: l_UGCValidationService_0 (ref), v44 (copy)
                        return l_UGCValidationService_0:GetEditableMeshTriCount(v44);
                    end, v37);
                    if not v45 then
                        return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v42.instance.Name);
                    else
                        v40 = v40 + v46;
                    end;
                end;
            end;
        end;
        return true, nil, v40;
    end)();
    if not v47 then
        if l_isServer_0 then
            error(v48);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, v37);
        return false, {
            v48
        };
    elseif v39 + v39 * (v22() / 100) < v49 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, v37);
        return false, {
            string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", v49, v36.Name, v39)
        };
    else
        return true;
    end;
end;
local function v55(v51, v52, v53, v54) --[[ Line: 186 ]] --[[ Name: validateMeshIsAtOrigin ]]
    -- upvalues: v2 (copy)
    if (v52 + (v53 - v52) / 2).Magnitude > 0.001 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, v54);
        return false, {
            string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", v51.fullName, 0.001)
        };
    else
        return true;
    end;
end;
return function(v56, v57) --[[ Line: 217 ]] --[[ Name: validateDescendantMeshMetrics ]]
    -- upvalues: v14 (copy), v15 (copy), v3 (copy), v50 (copy), v2 (copy), v17 (copy), v16 (copy), v55 (copy), v18 (copy), v19 (copy), v12 (copy), v20 (copy), v6 (copy), v8 (copy), v34 (copy), v23 (copy), v13 (copy), v10 (copy), v7 (copy), v9 (copy), v11 (copy)
    local l_isServer_1 = v57.isServer;
    assert(v57.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics");
    local l_assetTypeEnum_0 = v57.assetTypeEnum;
    local l_allowEditableInstances_0 = v57.allowEditableInstances;
    local v61 = v14.new();
    local v62 = v15.parse(v56, v3.MESH_CONTENT_ID_FIELDS, v57);
    local v63 = tick();
    v61:updateReasons(v50(v62, l_assetTypeEnum_0, v57));
    v2.recordScriptTime("validateTotalAssetTriangles", v63, v57);
    for _, v65 in v62 do
        local v66 = {
            fullName = v65.instance:GetFullName(), 
            fieldName = v65.fieldName, 
            contentId = v65.instance[v65.fieldName], 
            context = v65.instance.Name
        };
        local v67, v68 = v17(v65.instance, v65.fieldName, v57);
        if not v67 then
            return false, {
                string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v65.instance.Name)
            };
        else
            v66.editableMesh = v68;
            if v65.instance.ClassName == "MeshPart" then
                assert(v65.fieldName == "MeshId");
                local v69, v70, v71, v72 = v16(v66, v57);
                if not v69 then
                    v61:updateReasons(false, v70);
                end;
                if v69 then
                    v63 = tick();
                    v61:updateReasons(v55(v66, v71, v72, v57));
                    v2.recordScriptTime("validateMeshIsAtOrigin", v63, v57);
                end;
                if v71 and v72 then
                    local v73 = v72 - v71;
                    if v18(v73.X, 0) or v18(v73.Y, 0) or v18(v73.Z, 0) then
                        v61:updateReasons(false, {
                            "Mesh size is zero for " .. v66.fullName .. ". You need to rescale your mesh."
                        });
                    else
                        local v74 = v19(v65.instance, v57) / v73;
                        v61:updateReasons(v12(v66, v74, v57));
                        if v20() then
                            v61:updateReasons(v6(v66, v74, v57));
                        end;
                    end;
                end;
                v61:updateReasons(v8(v66, true, v57));
                v63 = tick();
                v61:updateReasons(v34(v65.instance, l_isServer_1, l_allowEditableInstances_0, v57));
                v2.recordScriptTime("validateIsSkinned", v63, v57);
                if v23() then
                    v61:updateReasons(v13(v65.instance, v57));
                end;
                v61:updateReasons(v10(v66, v57));
            elseif v65.instance.ClassName == "WrapTarget" then
                assert(v65.fieldName == "CageMeshId");
                v66.fullName = v66.fullName .. "OuterCage";
                v61:updateReasons(v7(v66, v65.instance, v57));
                v61:updateReasons(v9(v66, v57));
                v61:updateReasons(v11(v66, v65.instance, v57));
                v61:updateReasons(v10(v66, v57));
            end;
        end;
    end;
    return v61:getFinalResults();
end;