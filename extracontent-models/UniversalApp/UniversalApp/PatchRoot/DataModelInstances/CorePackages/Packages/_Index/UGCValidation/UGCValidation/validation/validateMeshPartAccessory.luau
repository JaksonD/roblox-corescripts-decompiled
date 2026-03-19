local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v6 = require(l_Parent_0.validation.validateInstanceTree);
local v7 = require(l_Parent_0.validation.validateMeshTriangles);
local v8 = require(l_Parent_0.validation.validateModeration);
local v9 = require(l_Parent_0.validation.validateMaterials);
local v10 = require(l_Parent_0.validation.validateTags);
local v11 = require(l_Parent_0.validation.validateMeshBounds);
local v12 = require(l_Parent_0.validation.validateTextureSize);
local v13 = require(l_Parent_0.validation.validatePropertyRequirements);
local v14 = require(l_Parent_0.validation.validateAttributes);
local v15 = require(l_Parent_0.validation.validateMeshVertColors);
local v16 = require(l_Parent_0.validation.validateSingleInstance);
local v17 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v18 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v19 = require(l_Parent_0.validation.validateSurfaceAppearanceTextureSize);
local v20 = require(l_Parent_0.validation.ValidateTexturePack);
local v21 = require(l_Parent_0.validation.validateSurfaceAppearanceTransparency);
local v22 = require(l_Parent_0.validation.validateScaleType);
local v23 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v24 = require(l_Parent_0.validation.validateRigidMeshNotSkinned);
local v25 = require(l_Parent_0.validation.ValidateMeshSizeProperty);
local v26 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v27 = require(l_Parent_0.validation.validateDependencies);
local v28 = require(l_Parent_0.util.createMeshPartAccessorySchema);
local v29 = require(l_Parent_0.util.getAttachment);
local v30 = require(l_Parent_0.util.getMeshSize);
local v31 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v32 = require(l_Parent_0.util.getEditableMeshFromContext);
local v33 = require(l_Parent_0.util.getEditableImageFromContext);
local v34 = require(l_Parent_0.util.getExpectedPartSize);
local v35 = require(l_Parent_0.util.pcallDeferred);
local v36 = require(l_Parent_0.util.getAccessoryScale);
local v37 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v38 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned);
local v39 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v40 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoryAssetTextureLimit);
local v41 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local v42 = game:DefineFastFlag("MeshpartAccessoryCheckAvatarPartScaleType", false);
return function(v43) --[[ Line: 53 ]] --[[ Name: validateMeshPartAccessory ]]
    -- upvalues: v37 (copy), v2 (copy), v3 (copy), v16 (copy), v28 (copy), v6 (copy), v39 (copy), v26 (copy), v27 (copy), v31 (copy), v32 (copy), v33 (copy), v35 (copy), v30 (copy), v34 (copy), v29 (copy), v9 (copy), v13 (copy), v10 (copy), v14 (copy), v40 (copy), v4 (copy), v12 (copy), v17 (copy), v8 (copy), v42 (copy), v36 (copy), v23 (copy), v25 (copy), v11 (copy), v7 (copy), v15 (copy), v5 (copy), v18 (copy), v19 (copy), v21 (copy), v41 (copy), v20 (copy), v38 (copy), v24 (copy), v22 (copy)
    assert(v43.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory");
    local l_instances_0 = v43.instances;
    local l_assetTypeEnum_0 = v43.assetTypeEnum;
    local l_isServer_0 = v43.isServer;
    local l_allowUnreviewedAssets_0 = v43.allowUnreviewedAssets;
    if not v37.isRigidAccessoryAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, v43);
        return false, {
            string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", l_assetTypeEnum_0.Name)
        };
    else
        local v48 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v49 = nil;
        local v50 = nil;
        local v51, v52 = v16(l_instances_0, v43);
        v49 = v51;
        v50 = v52;
        if not v49 then
            return false, v50;
        else
            v51 = l_instances_0[1];
            v52 = v28(v48.attachmentNames);
            local v53, v54 = v6(v52, v51, v43);
            v49 = v53;
            v50 = v54;
            if not v49 then
                return false, v50;
            else
                if v39() then
                    v53, v54 = v26.validate(v51, v43);
                    v49 = v53;
                    v50 = v54;
                    if not v49 then
                        return false, v50;
                    end;
                end;
                v53, v54 = v27(v51, v43);
                v49 = v53;
                v50 = v54;
                if not v49 then
                    return false, v50;
                else
                    v53 = v51:FindFirstChild("Handle");
                    v54 = {
                        fullName = v53:GetFullName(), 
                        fieldName = "MeshId", 
                        contentId = v53.MeshId, 
                        context = v51.Name
                    };
                    local v55 = v31.new();
                    if v53.DoubleSided then
                        v55:updateReasons(false, {
                            string.format("MeshPart '%s' is double-sided. Double-sided meshes are not allowed in rigid accessories.", v53:GetFullName())
                        });
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_DoubleSided, nil, v43);
                    end;
                    local v56 = false;
                    if v54.contentId ~= nil then
                        v56 = v54.contentId ~= "";
                    end;
                    local v57, v58 = v32(v53, "MeshId", v43);
                    if not v57 then
                        if not v54.contentId then
                            v56 = false;
                            v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_NoMeshId, nil, v43);
                            v55:updateReasons(false, {
                                string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", v53:GetFullName())
                            });
                        else
                            v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, v43);
                            return false, {
                                string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v51.Name)
                            };
                        end;
                    end;
                    v54.editableMesh = v58;
                    v56 = true;
                    local l_TextureID_0 = v53.TextureID;
                    local v60 = {
                        fullName = v53:GetFullName(), 
                        fieldName = "TextureID", 
                        contentId = l_TextureID_0
                    };
                    local _, v62 = v33(v53, "TextureID", v43);
                    v60.editableImage = v62;
                    local v63, v64 = v35(function() --[[ Line: 169 ]]
                        -- upvalues: v30 (ref), v54 (copy)
                        return v30(v54);
                    end, v43);
                    if not v63 then
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, v43);
                        return false, {
                            string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v51.Name)
                        };
                    else
                        local v65 = v34(v53, v43) / v64;
                        local v66 = v29(v53, v48.attachmentNames);
                        assert(v66);
                        local v67 = assert(v48.bounds[v66.Name], "Could not find bounds for " .. v66.Name);
                        v55:updateReasons(v9(v51, v43));
                        v55:updateReasons(v13(v51, nil, v43));
                        v55:updateReasons(v10(v51, v43));
                        v55:updateReasons(v14(v51, v43));
                        local v68 = nil;
                        if v40() then
                            v68 = v4.getTextureLimit(l_assetTypeEnum_0, v53, v60.fieldName);
                        end;
                        v55:updateReasons(v12(v60, true, v43, v68));
                        v55:updateReasons(v17(v51, v53, v54, v65, v43));
                        local v69 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v69 = false;
                        end;
                        if v69 then
                            v55:updateReasons(v8(v51, {}, v43));
                        end;
                        if v42 and v53:FindFirstChild("AvatarPartScaleType") then
                            local v70 = v36(v53, v66);
                            v67 = {
                                size = v67.size / v70, 
                                offset = if v67.offset then v67.offset / v70 else nil
                            };
                        end;
                        if v56 then
                            v55:updateReasons(v23(v54, v65, v43));
                            v55:updateReasons(v25.validateSingleMeshPart(v53, v43));
                            v55:updateReasons(v11(v53, v66, v54, v65, v67, l_assetTypeEnum_0.Name, v43));
                            v55:updateReasons(v7(v54, nil, v43));
                            v55:updateReasons(v15(v54, false, v43));
                            v55:updateReasons(v5(v54, v65, v43));
                        end;
                        v55:updateReasons(v18(v51, v43));
                        v55:updateReasons(v19(v51, v43));
                        v55:updateReasons(v21(v51, v43));
                        if v41() then
                            v55:updateReasons(v20.validate(v51, false, v43));
                        end;
                        if v38() and not v43.allowEditableInstances then
                            v55:updateReasons(v24(v54.contentId, v43));
                        end;
                        local l_AvatarPartScaleType_0 = v53:FindFirstChild("AvatarPartScaleType");
                        if l_AvatarPartScaleType_0 and l_AvatarPartScaleType_0:IsA("StringValue") then
                            v55:updateReasons(v22(l_AvatarPartScaleType_0, v43));
                        end;
                        return v55:getFinalResults();
                    end;
                end;
            end;
        end;
    end;
end;