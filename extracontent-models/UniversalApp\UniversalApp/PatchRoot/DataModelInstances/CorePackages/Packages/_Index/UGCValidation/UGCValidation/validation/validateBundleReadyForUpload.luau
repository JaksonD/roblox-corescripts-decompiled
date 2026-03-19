local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local v2 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.BundlesMetadata);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.createEditableInstancesForContext);
local v6 = require(l_Parent_0.util.destroyEditableInstances);
local v7 = require(l_Parent_0.util.createUGCBodyPartFolders);
local v8 = require(l_Parent_0.util.fixUpPreValidation);
local v9 = require(l_Parent_0.validation.validateInternal);
local v10 = require(l_Parent_0.validation.validateFullBody);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v12 = require(l_Parent_0.util.LegacyValidationAdapter);
local l_HttpService_0 = game:GetService("HttpService");
local v14 = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.Torso, 
    Enum.AssetType.LeftArm, 
    Enum.AssetType.RightArm, 
    Enum.AssetType.LeftLeg, 
    Enum.AssetType.RightLeg, 
    Enum.AssetType.HairAccessory, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory
};
return function(v15, v16, v17, v18, v19, v20) --[[ Line: 57 ]] --[[ Name: validateBundleReadyForUpload ]]
    -- upvalues: v1 (copy), v8 (copy), v7 (copy), v14 (copy), v11 (copy), l_HttpService_0 (copy), v5 (copy), v9 (copy), v12 (copy), v6 (copy), v2 (copy), v10 (copy)
    v18 = v18 or function() --[[ Line: 65 ]]

    end;
    assert(v18 ~= nil, "Luau");
    if not v15:IsA("Model") then
        local v21 = {
            errors = {
                {
                    assetType = nil, 
                    error = {
                        type = "message", 
                        message = "Invalid root instance, must be a model"
                    }
                }
            }, 
            pieces = {}
        };
        return v1.resolve(v21);
    else
        v15 = v8(v15);
        local v22 = v7(v15, v16, v17, false);
        local v23 = {};
        local v24 = {};
        for v25, v26 in v16[v17].allowedAssetTypeSettings do
            local v27 = assert(Enum.AssetType[v25], "Asset type name doesn't map to an enum item");
            if v26.isEligibleForUpload then
                local v28 = true;
                if v26.minimumQuantity ~= 0 then
                    v28 = v26.minimumQuantity == 1;
                end;
                assert(v28, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                v28 = true;
                if v26.maximumQuantity ~= 0 then
                    v28 = v26.maximumQuantity == 1;
                end;
                assert(v28, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                local v29 = v22[v27];
                v28 = v29 and v29[1];
                if v26.minimumQuantity ~= 0 or v28 ~= nil then
                    table.insert(v24, {
                        assetType = v27, 
                        instance = v28, 
                        settings = v26, 
                        status = v28 == nil and "finished" or "pending"
                    });
                    if v28 == nil then
                        table.insert(v23, {
                            assetType = v27, 
                            error = {
                                type = "notFound"
                            }
                        });
                    end;
                end;
            end;
        end;
        table.sort(v24, function(v30, v31) --[[ Line: 142 ]]
            -- upvalues: v14 (ref)
            return (table.find(v14, v30.assetType) or 1e999) < (table.find(v14, v31.assetType) or 1e999);
        end);
        local v32 = {
            errors = v23, 
            pieces = v24
        };
        v18(v32);
        local v33 = nil;
        if v11() then
            v33 = l_HttpService_0:GenerateGUID();
        end;
        return v1.each(v24, function(v34, v35) --[[ Line: 161 ]]
            -- upvalues: v19 (copy), v20 (copy), v5 (ref), v9 (ref), v11 (ref), v12 (ref), v33 (ref), v6 (ref), v32 (ref), v18 (ref)
            if v34.status == "finished" then
                return;
            else
                assert(v34.instance ~= nil, "Unfinished piece doesn't have an instnace");
                local v36 = nil;
                local v37 = nil;
                local v38 = {
                    v34.instance
                };
                local v39 = {
                    instances = v38, 
                    assetTypeEnum = v34.assetType, 
                    allowUnreviewedAssets = false, 
                    isServer = false, 
                    isAsync = false, 
                    allowEditableInstances = v19, 
                    bypassFlags = v20, 
                    validateMeshPartAccessories = true, 
                    requireAllFolders = false
                };
                local v40, v41 = v5.processAll(v38, v19);
                if not v40 then
                    v37 = v41;
                    v36 = false;
                else
                    v39.editableMeshes = v41.editableMeshes;
                    v39.editableImages = v41.editableImages;
                    local v42, v43 = v9(v39);
                    v36 = v42;
                    v37 = v43;
                    if v11() then
                        v42, v43 = v12.studioRFUAssetValidation(v39, v33, v36, v37);
                        v36 = v42;
                        v37 = v43;
                    end;
                    v6(v39.editableMeshes, v39.editableImages);
                end;
                v32 = table.clone(v32);
                v32.errors = table.clone(v32.errors);
                if not v36 then
                    assert(v37 ~= nil, "Failure without errors");
                    for _, v45 in v37 do
                        table.insert(v32.errors, {
                            assetType = v34.assetType, 
                            error = {
                                type = "message", 
                                message = v45
                            }
                        });
                    end;
                end;
                v32.pieces = table.clone(v32.pieces);
                v32.pieces[v35].status = "finished";
                v18(v32);
                return;
            end;
        end):andThen(function() --[[ Line: 228 ]]
            -- upvalues: v17 (copy), v2 (ref), v32 (ref), v19 (copy), v20 (copy), v5 (ref), v10 (ref), v11 (ref), v12 (ref), v33 (ref), v6 (ref), v18 (ref)
            if v17 == "Body" then
                local function v50(v46) --[[ Line: 230 ]] --[[ Name: createFullBodyData ]]
                    -- upvalues: v2 (ref)
                    local v47 = {};
                    for _, v49 in v46 do
                        if v2.isBodyPart(v49.assetType) then
                            table.insert(v47, {
                                assetTypeEnum = v49.assetType, 
                                allSelectedInstances = if v49.instance then {
                                    v49.instance
                                } else {}
                            });
                        end;
                    end;
                    return v47;
                end;
                local v51 = nil;
                local v52 = nil;
                local v53 = v50(v32.pieces);
                local v54 = {
                    fullBodyData = v53, 
                    isServer = false, 
                    allowEditableInstances = v19, 
                    bypassFlags = v20, 
                    validateMeshPartAccessories = false, 
                    requireAllFolders = false
                };
                local v55 = {};
                for _, v57 in v53 do
                    for _, v59 in v57.allSelectedInstances do
                        table.insert(v55, v59);
                    end;
                end;
                local v60, v61 = v5.processAll(v55, v19);
                if not v60 then
                    v52 = v61;
                    v51 = false;
                else
                    v54.editableMeshes = v61.editableMeshes;
                    v54.editableImages = v61.editableImages;
                    local v62, v63 = v10(v54);
                    v51 = v62;
                    v52 = v63;
                    if v11() then
                        v62, v63 = v12.studioRFUBundleValidation(v53, Enum.BundleType.BodyParts, v54, v33, v51, v52);
                        v51 = v62;
                        v52 = v63;
                    end;
                    v6(v54.editableMeshes, v54.editableImages);
                end;
                if not v51 then
                    v32 = table.clone(v32);
                    v32.errors = table.clone(v32.errors);
                    assert(v52 and #v52 > 0, "There should always be a reason for failure");
                    for _, v65 in v52 do
                        table.insert(v32.errors, {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = v65
                            }
                        });
                    end;
                end;
                v18(v32);
            end;
        end):andThen(function() --[[ Line: 311 ]]
            -- upvalues: v32 (ref)
            return v32;
        end);
    end;
end;