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
local v18 = require(l_Parent_0.validation.validateScaleType);
local v19 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v20 = require(l_Parent_0.validation.validateRigidMeshNotSkinned);
local v21 = require(l_Parent_0.validation.validateDependencies);
local v22 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v23 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v24 = require(l_Parent_0.util.createAccessorySchema);
local v25 = require(l_Parent_0.util.getAttachment);
local v26 = require(l_Parent_0.util.getAccessoryScale);
local v27 = require(l_Parent_0.util.getEditableMeshFromContext);
local v28 = require(l_Parent_0.util.getEditableImageFromContext);
local v29 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned);
local v30 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v31 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoryAssetTextureLimit);
local v32 = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false);
return function(v33) --[[ Line: 44 ]] --[[ Name: validateLegacyAccessory ]]
    -- upvalues: v23 (copy), v2 (copy), v3 (copy), v16 (copy), v24 (copy), v6 (copy), v30 (copy), v22 (copy), v21 (copy), v25 (copy), v27 (copy), v28 (copy), v9 (copy), v13 (copy), v10 (copy), v14 (copy), v31 (copy), v4 (copy), v12 (copy), v18 (copy), v17 (copy), v8 (copy), v19 (copy), v32 (copy), v26 (copy), v11 (copy), v7 (copy), v15 (copy), v5 (copy), v29 (copy), v20 (copy)
    local l_instances_0 = v33.instances;
    local l_assetTypeEnum_0 = v33.assetTypeEnum;
    local l_isServer_0 = v33.isServer;
    local l_allowUnreviewedAssets_0 = v33.allowUnreviewedAssets;
    if not v23.isRigidAccessoryAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, v33);
        return false, {
            string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", l_assetTypeEnum_0.Name)
        };
    else
        local v38 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v39 = nil;
        local v40 = nil;
        local v41, v42 = v16(l_instances_0, v33);
        v39 = v41;
        v40 = v42;
        if not v39 then
            return false, v40;
        else
            v41 = l_instances_0[1];
            v42 = v24(v38.attachmentNames);
            local v43, v44 = v6(v42, v41, v33);
            v39 = v43;
            v40 = v44;
            if not v39 then
                return false, v40;
            else
                if v30() then
                    v43, v44 = v22.validate(v41, v33);
                    v39 = v43;
                    v40 = v44;
                    if not v39 then
                        return false, v40;
                    end;
                end;
                v43, v44 = v21(v41, v33);
                v39 = v43;
                v40 = v44;
                if not v39 then
                    return false, v40;
                else
                    v43 = v41:FindFirstChild("Handle");
                    v44 = v43:FindFirstChildOfClass("SpecialMesh");
                    local v45 = {
                        fullName = v44:GetFullName(), 
                        fieldName = "MeshId", 
                        contentId = v44.MeshId, 
                        context = v41.Name
                    };
                    local l_Scale_0 = v44.Scale;
                    local v47 = v25(v43, v38.attachmentNames);
                    local v48 = assert(v38.bounds[v47.Name], "Could not find bounds for " .. v47.Name);
                    local v49 = true;
                    v40 = {};
                    local v50 = false;
                    if v45.contentId ~= nil then
                        v50 = v45.contentId ~= "";
                    end;
                    local v51, v52 = v27(v44, "MeshId", v33);
                    if not v51 then
                        if not v45.contentId then
                            v50 = false;
                            v49 = false;
                            table.insert(v40, {
                                string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", v41.Name)
                            });
                        else
                            return false, {
                                string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", v41.Name)
                            };
                        end;
                    end;
                    v45.editableMesh = v52;
                    v50 = true;
                    local v53 = {
                        fullName = v44:GetFullName(), 
                        fieldName = "TextureId", 
                        contentId = v44.TextureId
                    };
                    local v54, v55 = v28(v44, "TextureId", v33);
                    if not v54 then
                        return false, {
                            string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", v41.Name)
                        };
                    else
                        v53.editableImage = v55;
                        local v56 = {};
                        local v57, v58 = v9(v41, v33);
                        v39 = v57;
                        v56 = v58;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v57, v58 = v13(v41, nil, v33);
                        v39 = v57;
                        v56 = v58;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v57, v58 = v10(v41, v33);
                        v39 = v57;
                        v56 = v58;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v57, v58 = v14(v41, v33);
                        v39 = v57;
                        v56 = v58;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v57 = nil;
                        if v31() then
                            v57 = v4.getTextureLimit(l_assetTypeEnum_0, v44, v53.fieldName);
                        end;
                        local v59;
                        v58, v59 = v12(v53, nil, v33, v57);
                        v39 = v58;
                        v56 = v59;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v58 = v43:FindFirstChild("AvatarPartScaleType");
                        if v58 and v58:IsA("StringValue") then
                            local v60;
                            v59, v60 = v18(v58, v33);
                            v39 = v59;
                            v56 = v60;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                        end;
                        local v61;
                        v59, v61 = v17(v41, v43, v45, l_Scale_0, v33);
                        v39 = v59;
                        v56 = v61;
                        if not v39 then
                            table.insert(v40, table.concat(v56, "\n"));
                            v49 = false;
                        end;
                        v59 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v59 = false;
                        end;
                        if v59 then
                            local v62;
                            v61, v62 = v8(v41, {}, v33);
                            v39 = v61;
                            v56 = v62;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                        end;
                        if v50 then
                            local v63;
                            v61, v63 = v19(v45, l_Scale_0, v33);
                            v39 = v61;
                            v56 = v63;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                            if v32 and v43:FindFirstChild("AvatarPartScaleType") then
                                v61 = v26(v43, v47);
                                v48 = {
                                    size = v48.size / v61, 
                                    offset = if v48.offset then v48.offset / v61 else nil
                                };
                            end;
                            v61, v63 = v11(v43, v47, v45, l_Scale_0, v48, l_assetTypeEnum_0.Name, v33);
                            v39 = v61;
                            v56 = v63;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                            v61, v63 = v7(v45, nil, v33);
                            v39 = v61;
                            v56 = v63;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                            v61, v63 = v15(v45, false, v33);
                            v39 = v61;
                            v56 = v63;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                            v61, v63 = v5(v45, l_Scale_0, v33);
                            v39 = v61;
                            v56 = v63;
                            if not v39 then
                                table.insert(v40, table.concat(v56, "\n"));
                                v49 = false;
                            end;
                            if v29() then
                                v61, v63 = v20(v45.contentId, v33);
                                v39 = v61;
                                v56 = v63;
                                if not v39 then
                                    table.insert(v40, table.concat(v56, "\n"));
                                    v49 = false;
                                end;
                            end;
                        end;
                        return v49, v40;
                    end;
                end;
            end;
        end;
    end;
end;