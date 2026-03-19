local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateBoundsManipulation);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateAccurateBoundingBoxRasterMethod);
local v5 = require(l_Parent_0.validation.validateBodyPartMeshBounds);
local v6 = require(l_Parent_0.validation.validateAssetBounds);
local v7 = require(l_Parent_0.validation.validateAccurateBoundingBox);
local v8 = nil;
if v4() then
    v8 = require(l_Parent_0.validation.validateAccurateBoundingBoxRasterMethod);
end;
local v9 = require(l_Parent_0.validation.validateBodyPartChildAttachmentBounds);
local v10 = require(l_Parent_0.validation.validateBodyPartChildAttachmentOrientations);
local v11 = require(l_Parent_0.validation.validateBodyPartExtentsRelativeToParent);
local v12 = require(l_Parent_0.validation.validateDependencies);
local v13 = require(l_Parent_0.validation.validateDescendantMeshMetrics);
local v14 = require(l_Parent_0.validation.validateDescendantTextureMetrics);
local v15 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v16 = require(l_Parent_0.validation.validateMaterials);
local v17 = require(l_Parent_0.validation.validateTags);
local v18 = require(l_Parent_0.validation.validatePropertyRequirements);
local v19 = require(l_Parent_0.validation.validateAttributes);
local v20 = require(l_Parent_0.validation.validateHSR);
local v21 = require(l_Parent_0.validation.validateBodyPartCollisionFidelity);
local v22 = require(l_Parent_0.validation.validateModeration);
local v23 = require(l_Parent_0.validation.validateAssetTransparency);
local v24 = require(l_Parent_0.validation.validatePose);
local v25 = require(l_Parent_0.util.ValidateBodyBlockingTests);
local v26 = require(l_Parent_0.validation.ValidateMeshSizeProperty);
local v27 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v28 = require(l_Parent_0.validation.ValidateLegsSeparation);
local v29 = require(l_Parent_0.validation.ValidateTexturePack);
local v30 = require(l_Parent_0.util.validateWithSchema);
local v31 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v32 = require(l_Parent_0.validation.ValidateMeshPartOnlySkinnedToR15);
local v33 = require(l_Parent_0.util.bodyAssetMasksRenderer);
local v34 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v35 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local v36 = require(l_Parent_0.util.resetPhysicsData);
local _ = require(l_Parent_0.util.Types);
return function(v38, v39, v40) --[[ Line: 56 ]] --[[ Name: validateMeshPartBodyPart ]]
    -- upvalues: v30 (copy), v1 (copy), v2 (copy), v15 (copy), v12 (copy), v36 (copy), v34 (copy), v27 (copy), v25 (copy), v26 (copy), v31 (copy), v5 (copy), v35 (copy), v29 (copy), v9 (copy), v11 (copy), v10 (copy), v24 (copy), v6 (copy), v28 (copy), v4 (copy), v8 (ref), v33 (copy), v3 (copy), v7 (copy), v13 (copy), v14 (copy), v20 (copy), v23 (copy), v16 (copy), v18 (copy), v21 (copy), v17 (copy), v19 (copy), v32 (copy), v22 (copy)
    local l_isServer_0 = v40.isServer;
    local l_assetTypeEnum_0 = v40.assetTypeEnum;
    local l_allowUnreviewedAssets_0 = v40.allowUnreviewedAssets;
    local l_restrictedUserIds_0 = v40.restrictedUserIds;
    local v45 = v30(v39, v38, v40);
    if not v45.success then
        v1.reportFailure(v1.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, v40);
        return false, {
            string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", v38.Name), 
            v45.message
        };
    else
        if not v2() then
            local v46, v47 = v15(v38, v40);
            if not v46 then
                return v46, v47;
            end;
        end;
        local v48, v49 = v12(v38, v40);
        if not v48 then
            return v48, v49;
        else
            v48, v49 = v36({
                v38
            }, v40);
            if not v48 then
                return false, {
                    v49
                };
            else
                if v34() then
                    local v50, v51 = v27.validate(v38, v40);
                    if not v50 then
                        return false, v51;
                    end;
                end;
                local v52, v53 = v25.validate(v38, v40);
                if not v52 then
                    return false, v53;
                else
                    v52, v53 = v26.validateBodyAsset(v38, v40);
                    if not v52 then
                        return false, v53;
                    else
                        v52 = v31.new();
                        v52:updateReasons(v5(v38, v40));
                        if v35() then
                            v52:updateReasons(v29.validate(v38, true, v40));
                        end;
                        v52:updateReasons(v9(v38, v40));
                        v52:updateReasons(v11.runValidation(v38, v40));
                        v52:updateReasons(v10.runValidation(v38, v40));
                        v52:updateReasons(v24(v38, v40));
                        v52:updateReasons(v6(nil, v38, v40));
                        v52:updateReasons(v28.validateAsset(v38, v40));
                        if v4() then
                            v53 = v8.getBoundsViewsForAssetType(l_assetTypeEnum_0);
                            local v54 = nil;
                            local v55, v56 = v33.new(v38, v53, v40);
                            v48 = v55;
                            v54 = v56;
                            if v48 then
                                v52:updateReasons(v8.validate(v38, v54, v40));
                            else
                                v52:updateReasons(v48, v54);
                            end;
                        elseif v3() then
                            v52:updateReasons(v7(v38, v40));
                        end;
                        v52:updateReasons(v13(v38, v40));
                        v52:updateReasons(v14(v38, v40));
                        v52:updateReasons(v20(v38, v40));
                        v53 = tick();
                        v52:updateReasons(v23(v38, v40));
                        v1.recordScriptTime("validateAssetTransparency", v53, v40);
                        v52:updateReasons(v16(v38, v40));
                        v52:updateReasons(v18(v38, l_assetTypeEnum_0, v40));
                        v52:updateReasons(v21(v38, v40));
                        v52:updateReasons(v17(v38, v40));
                        v52:updateReasons(v19(v38, v40));
                        if l_assetTypeEnum_0 ~= Enum.AssetType.DynamicHead then
                            v52:updateReasons(v32.validateBodyParts(v38, v40));
                        end;
                        local v57 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v57 = false;
                        end;
                        if v57 then
                            v52:updateReasons(v22(v38, l_restrictedUserIds_0, v40));
                        end;
                        return v52:getFinalResults();
                    end;
                end;
            end;
        end;
    end;
end;