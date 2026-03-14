local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.validation.validateLCCageQuality);
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
local v17 = require(l_Parent_0.validation.validateHSR);
local v18 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v19 = require(l_Parent_0.validation.validateScaleType);
local v20 = require(l_Parent_0.validation.validateLayeredClothingInRenderBounds);
local v21 = require(l_Parent_0.validation.ValidateMeshSizeProperty);
local v22 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v23 = require(l_Parent_0.validation.validateDependencies);
local v24 = require(l_Parent_0.validation.validateSkinningTransfer);
local v25 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v26 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v27 = require(l_Parent_0.validation.validateMaxCubeDensity);
local v28 = require(l_Parent_0.validation.ValidateHSRData);
local v29 = require(l_Parent_0.validation.validateSurfaceAppearanceTextureSize);
local v30 = require(l_Parent_0.validation.ValidateTexturePack);
local v31 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v32 = require(l_Parent_0.util.createLayeredClothingSchema);
local v33 = require(l_Parent_0.util.createEyebrowEyelashSchema);
local v34 = require(l_Parent_0.util.getAttachment);
local v35 = require(l_Parent_0.util.getMeshSize);
local v36 = require(l_Parent_0.util.getEditableMeshFromContext);
local v37 = require(l_Parent_0.util.getEditableImageFromContext);
local v38 = require(l_Parent_0.util.getExpectedPartSize);
local v39 = require(l_Parent_0.util.pcallDeferred);
local v40 = require(l_Parent_0.flags.getFIntUGCValidationLCHandleScaleOffsetMaximum);
local v41 = require(l_Parent_0.flags.getEngineUGCValidateRelativeSkinningTransfer);
local v42 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v43 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoryAssetTextureLimit);
local v44 = require(l_Parent_0.flags.getFFlagUGCValidateLayeredClothingAssetSurfaceAppearanceTextureLimits);
local v45 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local v46 = require(l_Parent_0.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema);
local v47 = require(l_Parent_0.validation.ValidateMeshPartOnlySkinnedToR15);
return function(v48) --[[ Line: 61 ]] --[[ Name: validateLayeredClothingAccessory ]]
    -- upvalues: v31 (copy), v2 (copy), v3 (copy), v16 (copy), v46 (copy), v33 (copy), v32 (copy), v6 (copy), v42 (copy), v22 (copy), v23 (copy), v36 (copy), v37 (copy), v39 (copy), v35 (copy), v38 (copy), v40 (copy), v34 (copy), v9 (copy), v13 (copy), v10 (copy), v14 (copy), v43 (copy), v4 (copy), v12 (copy), v44 (copy), v29 (copy), v19 (copy), v18 (copy), v17 (copy), v28 (copy), v8 (copy), v25 (copy), v21 (copy), v11 (copy), v7 (copy), v15 (copy), v26 (copy), v27 (copy), v5 (copy), v20 (copy), v45 (copy), v30 (copy), v41 (copy), v24 (copy), v47 (copy)
    local l_instances_0 = v48.instances;
    local l_assetTypeEnum_0 = v48.assetTypeEnum;
    local l_isServer_0 = v48.isServer;
    local l_allowUnreviewedAssets_0 = v48.allowUnreviewedAssets;
    if not v31.isLayeredClothingAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, v48);
        return false, {
            string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", l_assetTypeEnum_0.Name)
        };
    else
        local v53 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v54 = nil;
        local v55 = nil;
        local v56, v57 = v16(l_instances_0, v48);
        v54 = v56;
        v55 = v57;
        if not v54 then
            return false, v55;
        else
            v56 = l_instances_0[1];
            v57 = if v46() then l_assetTypeEnum_0 == Enum.AssetType.EyebrowAccessory or l_assetTypeEnum_0 == Enum.AssetType.EyelashAccessory else false;
            local v58 = if v57 then v33(v53.attachmentNames) else v32(v53.attachmentNames);
            local v59, v60 = v6(v58, v56, v48);
            v54 = v59;
            v55 = v60;
            if not v54 then
                return false, v55;
            else
                if v42() then
                    v59, v60 = v22.validate(v56, v48);
                    v54 = v59;
                    v55 = v60;
                    if not v54 then
                        return false, v55;
                    end;
                end;
                v59, v60 = v23(v56, v48);
                v54 = v59;
                v55 = v60;
                if not v54 then
                    return false, v55;
                else
                    v59 = true;
                    v55 = {};
                    v60 = v56:FindFirstChild("Handle");
                    local v61 = {
                        fullName = v60:GetFullName(), 
                        fieldName = "MeshId", 
                        contentId = v60.MeshId, 
                        context = v56.Name
                    };
                    local v62 = false;
                    if v61.contentId ~= nil then
                        v62 = v61.contentId ~= "";
                    end;
                    local v63, v64 = v36(v60, "MeshId", v48);
                    if not v63 then
                        if not v61.contentId then
                            v62 = false;
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, v48);
                            v59 = false;
                            table.insert(v55, {
                                string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v56.Name)
                            });
                        else
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v48);
                            return false, {
                                string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v56.Name)
                            };
                        end;
                    end;
                    v61.editableMesh = v64;
                    v62 = true;
                    local l_TextureID_0 = v60.TextureID;
                    local v66 = {
                        fullName = v60:GetFullName(), 
                        fieldName = "TextureID", 
                        contentId = l_TextureID_0
                    };
                    local v67 = nil;
                    local v68 = nil;
                    if l_TextureID_0 ~= "" then
                        local v69, v70 = v37(v60, "TextureID", v48);
                        v67 = v69;
                        v68 = v70;
                        if not v67 then
                            return false, {
                                string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", v56.Name)
                            };
                        else
                            v66.editableImage = v68;
                        end;
                    end;
                    local v71, v72 = v39(function() --[[ Line: 187 ]]
                        -- upvalues: v35 (ref), v61 (copy)
                        return v35(v61);
                    end, v48);
                    if not v71 then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v48);
                        return false, {
                            string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v56.Name)
                        };
                    else
                        local v73 = v38(v60, v48) / v72;
                        if not v73:FuzzyEq(Vector3.new(1, 1, 1, 0), v40() / 1000) then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, v48);
                            table.insert(v55, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", v60.Name));
                            v59 = false;
                        end;
                        local v74 = v34(v60, v53.attachmentNames);
                        local v75 = v53.bounds[v74.Name];
                        local v76 = {};
                        local v77, v78 = v9(v56, v48);
                        v54 = v77;
                        v76 = v78;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        v77, v78 = v13(v56, nil, v48);
                        v54 = v77;
                        v76 = v78;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        v77, v78 = v10(v56, v48);
                        v54 = v77;
                        v76 = v78;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        v77, v78 = v14(v56, v48);
                        v54 = v77;
                        v76 = v78;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        v77 = nil;
                        if v43() then
                            v77 = v4.getTextureLimit(l_assetTypeEnum_0, v60, v66.fieldName);
                        end;
                        local v79;
                        v78, v79 = v12(v66, true, v48, v77);
                        v54 = v78;
                        v76 = v79;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        if v44() then
                            v78, v79 = v29(v56, v48);
                            v54 = v78;
                            v76 = v79;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        v78 = v60:FindFirstChild("AvatarPartScaleType");
                        if v78 and v78:IsA("StringValue") then
                            local v80;
                            v79, v80 = v19(v78, v48);
                            v54 = v79;
                            v76 = v80;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        if not v57 then
                            local v81;
                            v79, v81 = v18(v56, v60, v61, v73, v48);
                            v54 = v79;
                            v76 = v81;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        v79 = v60:FindFirstChildOfClass("WrapLayer");
                        if v79 == nil then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, v48);
                            table.insert(v55, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", v56.Name));
                            v59 = false;
                        else
                            local v82, v83 = v17(v79, v48);
                            v54 = v82;
                            v76 = v83;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            if not v48.allowEditableInstances then
                                local v84;
                                v83, v84 = v28.validate(v79, v48);
                                v54 = v83;
                                v76 = v84;
                                if not v54 then
                                    table.insert(v55, table.concat(v76, "\n"));
                                    v59 = false;
                                end;
                            end;
                        end;
                        v79 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v79 = false;
                        end;
                        if v79 then
                            local v85, v86 = v8(v56, {}, v48);
                            v54 = v85;
                            v76 = v86;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        if v62 then
                            local v87, v88 = v25(v61, v73, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            v87, v88 = v21.validateSingleMeshPart(v60, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            v87, v88 = v11(v60, v74, v61, v73, v75, l_assetTypeEnum_0.Name, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            v87, v88 = v7(v61, nil, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            v87, v88 = v15(v61, false, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                            v87, v88 = v26(v61, v73, v48);
                            v54 = v87;
                            v76 = v88;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        local v89, v90 = v27(v61, v48, v73);
                        v54 = v89;
                        v76 = v90;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        v89, v90 = v5(v56, v61, v48);
                        v54 = v89;
                        v76 = v90;
                        if not v54 then
                            for _, v92 in v76 do
                                table.insert(v55, v92);
                            end;
                            v59 = false;
                        end;
                        v89, v90 = v20(v56, v48);
                        v54 = v89;
                        v76 = v90;
                        if not v54 then
                            table.insert(v55, table.concat(v76, "\n"));
                            v59 = false;
                        end;
                        if v45() then
                            v89, v90 = v30.validate(v56, false, v48);
                            v54 = v89;
                            v76 = v90;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        if v41() then
                            v89, v90 = v24(v60, v48);
                            v54 = v89;
                            v76 = v90;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        if not v3.SkinningTransferRequiredTypes[l_assetTypeEnum_0] then
                            v89, v90 = v47.validateMeshPart(v60, v48);
                            v54 = v89;
                            v76 = v90;
                            if not v54 then
                                table.insert(v55, table.concat(v76, "\n"));
                                v59 = false;
                            end;
                        end;
                        return v59, v55;
                    end;
                end;
            end;
        end;
    end;
end;