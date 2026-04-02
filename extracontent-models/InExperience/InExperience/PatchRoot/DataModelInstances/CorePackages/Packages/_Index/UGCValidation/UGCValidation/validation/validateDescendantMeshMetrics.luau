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
local v21 = require(l_Parent_0.flags.getFIntUGCValidateTriangleLimitTolerance);
local v22 = require(l_Parent_0.flags.getEngineUGCValidateRelativeSkinningTransfer);
local function v33(v23, v24, v25, v26) --[[ Line: 34 ]] --[[ Name: validateIsSkinned ]]
    -- upvalues: v3 (copy), v2 (copy), v17 (copy), l_UGCValidationService_0 (copy)
    local l_v23_Attribute_0 = v23:GetAttribute(v3.AlternateMeshIdAttributeName);
    if not v23.HasSkinnedMesh and (l_v23_Attribute_0 == nil or l_v23_Attribute_0 == "" or not v25) then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, v26);
        return false, {
            (("Missing skinning data for %*.MeshId. You need to skin your model."):format(v23.Name))
        };
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: v17 (ref), v23 (copy), v26 (copy), l_UGCValidationService_0 (ref)
            local v28, v29 = v17(v23, "MeshId", v26);
            if not v28 then
                error("Failed to retrieve MeshContent");
            end;
            return l_UGCValidationService_0:ValidateSkinnedEditableMesh(v29);
        end);
        if not l_status_0 then
            if v24 then
                error("Failed to retrieve mesh data to validate skinned mesh");
            end;
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v26);
            return false, {
                "Failed to retrieve mesh data to validate skinned mesh"
            };
        elseif not l_result_0 then
            local v32 = ("Detected mismatch between model and skinned data for %*. You need to re-skin your model to fix this issue."):format(v23.Name);
            if v24 then
                error(v32);
            end;
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, v26);
            return false, {
                v32
            };
        else
            return true;
        end;
    end;
end;
local function v49(v34, v35, v36) --[[ Line: 95 ]] --[[ Name: validateTotalAssetTriangles ]]
    -- upvalues: v3 (copy), v17 (copy), v2 (copy), v5 (copy), l_UGCValidationService_0 (copy), v21 (copy)
    local l_isServer_0 = v36.isServer;
    local v38 = assert(v3.ASSET_RENDER_MESH_MAX_TRIANGLES[v35.Name]);
    local v46, v47, v48 = (function() --[[ Line: 103 ]] --[[ Name: calculateTotalAssetTriangles ]]
        -- upvalues: v34 (copy), v17 (ref), v36 (copy), v2 (ref), v5 (ref), l_UGCValidationService_0 (ref)
        local v39 = 0;
        for _, v41 in v34 do
            if v41.instance.ClassName == "MeshPart" then
                assert(v41.fieldName == "MeshId");
                local v42, v43 = v17(v41.instance, v41.fieldName, v36);
                if not v42 then
                    v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v36);
                    return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v41.instance.Name);
                else
                    local v44, v45 = v5(function() --[[ Line: 126 ]]
                        -- upvalues: l_UGCValidationService_0 (ref), v43 (copy)
                        return l_UGCValidationService_0:GetEditableMeshTriCount(v43);
                    end, v36);
                    if not v44 then
                        return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v41.instance.Name);
                    else
                        v39 = v39 + v45;
                    end;
                end;
            end;
        end;
        return true, nil, v39;
    end)();
    if not v46 then
        if l_isServer_0 then
            error(v47);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, v36);
        return false, {
            v47
        };
    elseif v38 + v38 * (v21() / 100) < v48 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, v36);
        return false, {
            string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", v48, v35.Name, v38)
        };
    else
        return true;
    end;
end;
local function v54(v50, v51, v52, v53) --[[ Line: 181 ]] --[[ Name: validateMeshIsAtOrigin ]]
    -- upvalues: v2 (copy)
    if (v51 + (v52 - v51) / 2).Magnitude > 0.001 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, v53);
        return false, {
            string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", v50.fullName, 0.001)
        };
    else
        return true;
    end;
end;
return function(v55, v56) --[[ Line: 212 ]] --[[ Name: validateDescendantMeshMetrics ]]
    -- upvalues: v14 (copy), v15 (copy), v3 (copy), v49 (copy), v2 (copy), v17 (copy), v16 (copy), v54 (copy), v18 (copy), v19 (copy), v12 (copy), v20 (copy), v6 (copy), v8 (copy), v33 (copy), v22 (copy), v13 (copy), v10 (copy), v7 (copy), v9 (copy), v11 (copy)
    local l_isServer_1 = v56.isServer;
    assert(v56.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics");
    local l_assetTypeEnum_0 = v56.assetTypeEnum;
    local l_allowEditableInstances_0 = v56.allowEditableInstances;
    local v60 = v14.new();
    local v61 = v15.parse(v55, v3.MESH_CONTENT_ID_FIELDS, v56);
    local v62 = tick();
    v60:updateReasons(v49(v61, l_assetTypeEnum_0, v56));
    v2.recordScriptTime("validateTotalAssetTriangles", v62, v56);
    for _, v64 in v61 do
        local v65 = {
            fullName = v64.instance:GetFullName(), 
            fieldName = v64.fieldName, 
            contentId = v64.instance[v64.fieldName], 
            context = v64.instance.Name
        };
        local v66, v67 = v17(v64.instance, v64.fieldName, v56);
        if not v66 then
            return false, {
                string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v64.instance.Name)
            };
        else
            v65.editableMesh = v67;
            if v64.instance.ClassName == "MeshPart" then
                assert(v64.fieldName == "MeshId");
                local v68, v69, v70, v71 = v16(v65, v56);
                if not v68 then
                    v60:updateReasons(false, v69);
                end;
                if v68 then
                    v62 = tick();
                    v60:updateReasons(v54(v65, v70, v71, v56));
                    v2.recordScriptTime("validateMeshIsAtOrigin", v62, v56);
                end;
                if v70 and v71 then
                    local v72 = v71 - v70;
                    if v18(v72.X, 0) or v18(v72.Y, 0) or v18(v72.Z, 0) then
                        v60:updateReasons(false, {
                            "Mesh size is zero for " .. v65.fullName .. ". You need to rescale your mesh."
                        });
                    else
                        local v73 = v19(v64.instance, v56) / v72;
                        v60:updateReasons(v12(v65, v73, v56));
                        if v20() then
                            v60:updateReasons(v6(v65, v73, v56));
                        end;
                    end;
                end;
                v60:updateReasons(v8(v65, true, v56));
                v62 = tick();
                v60:updateReasons(v33(v64.instance, l_isServer_1, l_allowEditableInstances_0, v56));
                v2.recordScriptTime("validateIsSkinned", v62, v56);
                if v22() then
                    v60:updateReasons(v13(v64.instance, v56));
                end;
                v60:updateReasons(v10(v65, v56));
            elseif v64.instance.ClassName == "WrapTarget" then
                assert(v64.fieldName == "CageMeshId");
                v65.fullName = v65.fullName .. "OuterCage";
                v60:updateReasons(v7(v65, v64.instance, v56));
                v60:updateReasons(v9(v65, v56));
                v60:updateReasons(v11(v65, v64.instance, v56));
                v60:updateReasons(v10(v65, v56));
            end;
        end;
    end;
    return v60:getFinalResults();
end;