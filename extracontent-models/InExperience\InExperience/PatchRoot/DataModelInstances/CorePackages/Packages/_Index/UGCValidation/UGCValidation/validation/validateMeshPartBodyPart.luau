local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests);
local v3 = require(l_Parent_0.validation.validateBodyPartMeshBounds);
local v4 = require(l_Parent_0.validation.validateAssetBounds);
local v5 = require(l_Parent_0.validation.validateAccurateBoundingBoxRasterMethod);
local v6 = require(l_Parent_0.validation.validateBodyPartChildAttachmentBounds);
local v7 = require(l_Parent_0.validation.validateBodyPartChildAttachmentOrientations);
local v8 = require(l_Parent_0.validation.validateBodyPartExtentsRelativeToParent);
local v9 = require(l_Parent_0.validation.validateDependencies);
local v10 = require(l_Parent_0.validation.validateDescendantMeshMetrics);
local v11 = require(l_Parent_0.validation.validateDescendantTextureMetrics);
local v12 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v13 = require(l_Parent_0.validation.validateMaterials);
local v14 = require(l_Parent_0.validation.validateTags);
local v15 = require(l_Parent_0.validation.validatePropertyRequirements);
local v16 = require(l_Parent_0.validation.validateAttributes);
local v17 = require(l_Parent_0.validation.validateHSR);
local v18 = require(l_Parent_0.validation.validateBodyPartCollisionFidelity);
local v19 = require(l_Parent_0.validation.validateModeration);
local v20 = require(l_Parent_0.validation.validateAssetTransparency);
local v21 = require(l_Parent_0.validation.validatePose);
local v22 = require(l_Parent_0.util.ValidateBodyBlockingTests);
local v23 = require(l_Parent_0.validation.ValidateMeshSizeProperty);
local v24 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v25 = require(l_Parent_0.validation.ValidateLegsSeparation);
local v26 = require(l_Parent_0.validation.ValidateTexturePack);
local v27 = require(l_Parent_0.util.validateWithSchema);
local v28 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v29 = require(l_Parent_0.validation.ValidateMeshPartOnlySkinnedToR15);
local v30 = require(l_Parent_0.util.bodyAssetMasksRenderer);
local v31 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v32 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local v33 = require(l_Parent_0.flags.getFFlagUGCValidationEnableR15plusSkinning);
local v34 = require(l_Parent_0.util.resetPhysicsData);
local _ = require(l_Parent_0.util.Types);
return function(v36, v37, v38) --[[ Line: 50 ]] --[[ Name: validateMeshPartBodyPart ]]
    -- upvalues: v27 (copy), v1 (copy), v2 (copy), v12 (copy), v9 (copy), v34 (copy), v31 (copy), v24 (copy), v22 (copy), v23 (copy), v28 (copy), v3 (copy), v32 (copy), v26 (copy), v6 (copy), v8 (copy), v7 (copy), v21 (copy), v4 (copy), v25 (copy), v5 (copy), v30 (copy), v10 (copy), v11 (copy), v17 (copy), v20 (copy), v13 (copy), v15 (copy), v18 (copy), v14 (copy), v16 (copy), v33 (copy), v29 (copy), v19 (copy)
    local l_isServer_0 = v38.isServer;
    local l_assetTypeEnum_0 = v38.assetTypeEnum;
    local l_allowUnreviewedAssets_0 = v38.allowUnreviewedAssets;
    local l_restrictedUserIds_0 = v38.restrictedUserIds;
    local v43 = v27(v37, v36, v38);
    if not v43.success then
        v1.reportFailure(v1.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, v38);
        return false, {
            string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", v36.Name), 
            v43.message
        };
    else
        if not v2() then
            local v44, v45 = v12(v36, v38);
            if not v44 then
                return v44, v45;
            end;
        end;
        local v46, v47 = v9(v36, v38);
        if not v46 then
            return v46, v47;
        else
            v46, v47 = v34({
                v36
            }, v38);
            if not v46 then
                return false, {
                    v47
                };
            else
                if v31() then
                    local v48, v49 = v24.validate(v36, v38);
                    if not v48 then
                        return false, v49;
                    end;
                end;
                local v50, v51 = v22.validate(v36, v38);
                if not v50 then
                    return false, v51;
                else
                    v50, v51 = v23.validateBodyAsset(v36, v38);
                    if not v50 then
                        return false, v51;
                    else
                        v50 = v28.new();
                        v50:updateReasons(v3(v36, v38));
                        if v32() then
                            v50:updateReasons(v26.validate(v36, true, v38));
                        end;
                        v50:updateReasons(v6(v36, v38));
                        v50:updateReasons(v8.runValidation(v36, v38));
                        v50:updateReasons(v7.runValidation(v36, v38));
                        v50:updateReasons(v21(v36, v38));
                        v50:updateReasons(v4(nil, v36, v38));
                        v50:updateReasons(v25.validateAsset(v36, v38));
                        v51 = v5.getBoundsViewsForAssetType(l_assetTypeEnum_0);
                        local v52 = nil;
                        local v53, v54 = v30.new(v36, v51, v38);
                        v46 = v53;
                        v52 = v54;
                        if v46 then
                            v50:updateReasons(v5.validate(v36, v52, v38));
                        else
                            v50:updateReasons(v46, v52);
                        end;
                        v50:updateReasons(v10(v36, v38));
                        v50:updateReasons(v11(v36, v38));
                        v50:updateReasons(v17(v36, v38));
                        v53 = tick();
                        v50:updateReasons(v20(v36, v38));
                        v1.recordScriptTime("validateAssetTransparency", v53, v38);
                        v50:updateReasons(v13(v36, v38));
                        v50:updateReasons(v15(v36, l_assetTypeEnum_0, v38));
                        v50:updateReasons(v18(v36, v38));
                        v50:updateReasons(v14(v36, v38));
                        v50:updateReasons(v16(v36, v38));
                        if not v33() and l_assetTypeEnum_0 ~= Enum.AssetType.DynamicHead then
                            v50:updateReasons(v29.validateBodyParts(v36, v38));
                        end;
                        v54 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v54 = false;
                        end;
                        if v54 then
                            v50:updateReasons(v19(v36, l_restrictedUserIds_0, v38));
                        end;
                        return v50:getFinalResults();
                    end;
                end;
            end;
        end;
    end;
end;