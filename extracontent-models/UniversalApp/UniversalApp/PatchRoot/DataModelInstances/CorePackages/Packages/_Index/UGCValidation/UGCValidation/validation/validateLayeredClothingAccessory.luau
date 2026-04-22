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
local v48 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning);
return function(v49) --[[ Line: 63 ]] --[[ Name: validateLayeredClothingAccessory ]]
    -- upvalues: v31 (copy), v2 (copy), v3 (copy), v16 (copy), v46 (copy), v33 (copy), v32 (copy), v6 (copy), v42 (copy), v22 (copy), v23 (copy), v36 (copy), v37 (copy), v39 (copy), v35 (copy), v38 (copy), v40 (copy), v34 (copy), v9 (copy), v13 (copy), v10 (copy), v14 (copy), v43 (copy), v4 (copy), v12 (copy), v44 (copy), v29 (copy), v19 (copy), v18 (copy), v17 (copy), v28 (copy), v8 (copy), v25 (copy), v21 (copy), v11 (copy), v7 (copy), v15 (copy), v26 (copy), v27 (copy), v5 (copy), v20 (copy), v45 (copy), v30 (copy), v48 (copy), v41 (copy), v24 (copy), v47 (copy)
    local l_instances_0 = v49.instances;
    local l_assetTypeEnum_0 = v49.assetTypeEnum;
    local l_isServer_0 = v49.isServer;
    local l_allowUnreviewedAssets_0 = v49.allowUnreviewedAssets;
    if not v31.isLayeredClothingAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, v49);
        return false, {
            string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", l_assetTypeEnum_0.Name)
        };
    else
        local v54 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v55 = nil;
        local v56 = nil;
        local v57, v58 = v16(l_instances_0, v49);
        v55 = v57;
        v56 = v58;
        if not v55 then
            return false, v56;
        else
            v57 = l_instances_0[1];
            v58 = if v46() then l_assetTypeEnum_0 == Enum.AssetType.EyebrowAccessory or l_assetTypeEnum_0 == Enum.AssetType.EyelashAccessory else false;
            local v59 = if v58 then v33(v54.attachmentNames) else v32(v54.attachmentNames);
            local v60, v61 = v6(v59, v57, v49);
            v55 = v60;
            v56 = v61;
            if not v55 then
                return false, v56;
            else
                if v42() then
                    v60, v61 = v22.validate(v57, v49);
                    v55 = v60;
                    v56 = v61;
                    if not v55 then
                        return false, v56;
                    end;
                end;
                v60, v61 = v23(v57, v49);
                v55 = v60;
                v56 = v61;
                if not v55 then
                    return false, v56;
                else
                    v60 = true;
                    v56 = {};
                    v61 = v57:FindFirstChild("Handle");
                    local v62 = {
                        fullName = v61:GetFullName(), 
                        fieldName = "MeshId", 
                        contentId = v61.MeshId, 
                        context = v57.Name
                    };
                    local v63 = false;
                    if v62.contentId ~= nil then
                        v63 = v62.contentId ~= "";
                    end;
                    local v64, v65 = v36(v61, "MeshId", v49);
                    if not v64 then
                        if not v62.contentId then
                            v63 = false;
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, v49);
                            v60 = false;
                            table.insert(v56, {
                                string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v57.Name)
                            });
                        else
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v49);
                            return false, {
                                string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v57.Name)
                            };
                        end;
                    end;
                    v62.editableMesh = v65;
                    v63 = true;
                    local l_TextureID_0 = v61.TextureID;
                    local v67 = {
                        fullName = v61:GetFullName(), 
                        fieldName = "TextureID", 
                        contentId = l_TextureID_0
                    };
                    local v68 = nil;
                    local v69 = nil;
                    if l_TextureID_0 ~= "" then
                        local v70, v71 = v37(v61, "TextureID", v49);
                        v68 = v70;
                        v69 = v71;
                        if not v68 then
                            return false, {
                                string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", v57.Name)
                            };
                        else
                            v67.editableImage = v69;
                        end;
                    end;
                    local v72, v73 = v39(function() --[[ Line: 189 ]]
                        -- upvalues: v35 (ref), v62 (copy)
                        return v35(v62);
                    end, v49);
                    if not v72 then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v49);
                        return false, {
                            string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v57.Name)
                        };
                    else
                        local v74 = v38(v61, v49) / v73;
                        if not v74:FuzzyEq(Vector3.new(1, 1, 1, 0), v40() / 1000) then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_HandleIsScaled, nil, v49);
                            table.insert(v56, string.format("%s has been scaled, but mesh parts with wrap layers do not support scaling. You need to change the Size property to match the MeshSize property.", v61.Name));
                            v60 = false;
                        end;
                        local v75 = v34(v61, v54.attachmentNames);
                        local v76 = v54.bounds[v75.Name];
                        local v77 = {};
                        local v78, v79 = v9(v57, v49);
                        v55 = v78;
                        v77 = v79;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        v78, v79 = v13(v57, nil, v49);
                        v55 = v78;
                        v77 = v79;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        v78, v79 = v10(v57, v49);
                        v55 = v78;
                        v77 = v79;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        v78, v79 = v14(v57, v49);
                        v55 = v78;
                        v77 = v79;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        v78 = nil;
                        if v43() then
                            v78 = v4.getTextureLimit(l_assetTypeEnum_0, v61, v67.fieldName);
                        end;
                        local v80;
                        v79, v80 = v12(v67, true, v49, v78);
                        v55 = v79;
                        v77 = v80;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        if v44() then
                            v79, v80 = v29(v57, v49);
                            v55 = v79;
                            v77 = v80;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        v79 = v61:FindFirstChild("AvatarPartScaleType");
                        if v79 and v79:IsA("StringValue") then
                            local v81;
                            v80, v81 = v19(v79, v49);
                            v55 = v80;
                            v77 = v81;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        if not v58 then
                            local v82;
                            v80, v82 = v18(v57, v61, v62, v74, v49);
                            v55 = v80;
                            v77 = v82;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        v80 = v61:FindFirstChildOfClass("WrapLayer");
                        if v80 == nil then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, v49);
                            table.insert(v56, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", v57.Name));
                            v60 = false;
                        else
                            local v83, v84 = v17(v80, v49);
                            v55 = v83;
                            v77 = v84;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            if not v49.allowEditableInstances then
                                local v85;
                                v84, v85 = v28.validate(v80, v49);
                                v55 = v84;
                                v77 = v85;
                                if not v55 then
                                    table.insert(v56, table.concat(v77, "\n"));
                                    v60 = false;
                                end;
                            end;
                        end;
                        v80 = not l_isServer_0;
                        if l_allowUnreviewedAssets_0 then
                            v80 = false;
                        end;
                        if v80 then
                            local v86, v87 = v8(v57, {}, v49);
                            v55 = v86;
                            v77 = v87;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        if v63 then
                            local v88, v89 = v25(v62, v74, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            v88, v89 = v21.validateSingleMeshPart(v61, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            v88, v89 = v11(v61, v75, v62, v74, v76, l_assetTypeEnum_0.Name, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            v88, v89 = v7(v62, nil, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            v88, v89 = v15(v62, false, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                            v88, v89 = v26(v62, v74, v49);
                            v55 = v88;
                            v77 = v89;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        local v90, v91 = v27(v62, v49, v74);
                        v55 = v90;
                        v77 = v91;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        v90, v91 = v5(v57, v62, v49);
                        v55 = v90;
                        v77 = v91;
                        if not v55 then
                            for _, v93 in v77 do
                                table.insert(v56, v93);
                            end;
                            v60 = false;
                        end;
                        v90, v91 = v20(v57, v49);
                        v55 = v90;
                        v77 = v91;
                        if not v55 then
                            table.insert(v56, table.concat(v77, "\n"));
                            v60 = false;
                        end;
                        if v45() then
                            v90, v91 = v30.validate(v57, false, v49);
                            v55 = v90;
                            v77 = v91;
                            if not v55 then
                                table.insert(v56, table.concat(v77, "\n"));
                                v60 = false;
                            end;
                        end;
                        if not v48() then
                            if v41() then
                                v90, v91 = v24(v61, v49);
                                v55 = v90;
                                v77 = v91;
                                if not v55 then
                                    table.insert(v56, table.concat(v77, "\n"));
                                    v60 = false;
                                end;
                            end;
                            if not v3.SkinningTransferRequiredTypes[l_assetTypeEnum_0] then
                                v90, v91 = v47.validateMeshPart(v61, v49);
                                v55 = v90;
                                v77 = v91;
                                if not v55 then
                                    table.insert(v56, table.concat(v77, "\n"));
                                    v60 = false;
                                end;
                            end;
                        end;
                        return v60, v56;
                    end;
                end;
            end;
        end;
    end;
end;