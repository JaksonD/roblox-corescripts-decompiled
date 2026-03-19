local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local v2 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.BundlesMetadata);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.getRestrictedUserTable);
local v6 = require(l_Parent_0.util.createEditableInstancesForContext);
local v7 = require(l_Parent_0.util.destroyEditableInstances);
local v8 = require(l_Parent_0.util.createUGCBodyPartFolders);
local v9 = require(l_Parent_0.util.fixUpPreValidation);
local v10 = require(l_Parent_0.validation.validateInternal);
local v11 = require(l_Parent_0.validation.validateFullBody);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateDontUseRestrictedUserTable);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v14 = require(l_Parent_0.util.LegacyValidationAdapter);
local l_HttpService_0 = game:GetService("HttpService");
local v16 = {
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
return function(v17, v18, v19, v20, v21, v22) --[[ Line: 60 ]] --[[ Name: validateBundleReadyForUpload ]]
    -- upvalues: v1 (copy), v9 (copy), v8 (copy), v16 (copy), v13 (copy), l_HttpService_0 (copy), v12 (copy), v5 (copy), v6 (copy), v10 (copy), v14 (copy), v7 (copy), v2 (copy), v11 (copy)
    v20 = v20 or function() --[[ Line: 68 ]]

    end;
    assert(v20 ~= nil, "Luau");
    if not v17:IsA("Model") then
        local v23 = {
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
        return v1.resolve(v23);
    else
        v17 = v9(v17);
        local v24 = v8(v17, v18, v19, false);
        local v25 = {};
        local v26 = {};
        for v27, v28 in v18[v19].allowedAssetTypeSettings do
            local v29 = assert(Enum.AssetType[v27], "Asset type name doesn't map to an enum item");
            if v28.isEligibleForUpload then
                local v30 = true;
                if v28.minimumQuantity ~= 0 then
                    v30 = v28.minimumQuantity == 1;
                end;
                assert(v30, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                v30 = true;
                if v28.maximumQuantity ~= 0 then
                    v30 = v28.maximumQuantity == 1;
                end;
                assert(v30, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                local v31 = v24[v29];
                v30 = v31 and v31[1];
                if v28.minimumQuantity ~= 0 or v30 ~= nil then
                    table.insert(v26, {
                        assetType = v29, 
                        instance = v30, 
                        settings = v28, 
                        status = v30 == nil and "finished" or "pending"
                    });
                    if v30 == nil then
                        table.insert(v25, {
                            assetType = v29, 
                            error = {
                                type = "notFound"
                            }
                        });
                    end;
                end;
            end;
        end;
        table.sort(v26, function(v32, v33) --[[ Line: 145 ]]
            -- upvalues: v16 (ref)
            return (table.find(v16, v32.assetType) or 1e999) < (table.find(v16, v33.assetType) or 1e999);
        end);
        local v34 = {
            errors = v25, 
            pieces = v26
        };
        v20(v34);
        local v35 = nil;
        if v13() then
            v35 = l_HttpService_0:GenerateGUID();
        end;
        return v1.each(v26, function(v36, v37) --[[ Line: 164 ]]
            -- upvalues: v12 (ref), v5 (ref), v21 (copy), v22 (copy), v6 (ref), v10 (ref), v13 (ref), v14 (ref), v35 (ref), v7 (ref), v34 (ref), v20 (ref)
            if v36.status == "finished" then
                return;
            else
                assert(v36.instance ~= nil, "Unfinished piece doesn't have an instnace");
                local v38 = nil;
                local v39 = nil;
                local v40 = {
                    v36.instance
                };
                local v41 = {
                    instances = v40, 
                    assetTypeEnum = v36.assetType, 
                    allowUnreviewedAssets = false, 
                    restrictedUserIds = if v12() then nil else v5(), 
                    isServer = false, 
                    isAsync = false, 
                    allowEditableInstances = v21, 
                    bypassFlags = v22, 
                    validateMeshPartAccessories = true, 
                    requireAllFolders = false
                };
                local v42, v43 = v6.processAll(v40, v21);
                if not v42 then
                    v39 = v43;
                    v38 = false;
                else
                    v41.editableMeshes = v43.editableMeshes;
                    v41.editableImages = v43.editableImages;
                    local v44, v45 = v10(v41);
                    v38 = v44;
                    v39 = v45;
                    if v13() then
                        v44, v45 = v14.studioRFUAssetValidation(v41, v35, v38, v39);
                        v38 = v44;
                        v39 = v45;
                    end;
                    v7(v41.editableMeshes, v41.editableImages);
                end;
                v34 = table.clone(v34);
                v34.errors = table.clone(v34.errors);
                if not v38 then
                    assert(v39 ~= nil, "Failure without errors");
                    for _, v47 in v39 do
                        table.insert(v34.errors, {
                            assetType = v36.assetType, 
                            error = {
                                type = "message", 
                                message = v47
                            }
                        });
                    end;
                end;
                v34.pieces = table.clone(v34.pieces);
                v34.pieces[v37].status = "finished";
                v20(v34);
                return;
            end;
        end):andThen(function() --[[ Line: 234 ]]
            -- upvalues: v19 (copy), v2 (ref), v34 (ref), v21 (copy), v22 (copy), v6 (ref), v11 (ref), v13 (ref), v14 (ref), v35 (ref), v7 (ref), v20 (ref)
            if v19 == "Body" then
                local function v52(v48) --[[ Line: 236 ]] --[[ Name: createFullBodyData ]]
                    -- upvalues: v2 (ref)
                    local v49 = {};
                    for _, v51 in v48 do
                        if v2.isBodyPart(v51.assetType) then
                            table.insert(v49, {
                                assetTypeEnum = v51.assetType, 
                                allSelectedInstances = if v51.instance then {
                                    v51.instance
                                } else {}
                            });
                        end;
                    end;
                    return v49;
                end;
                local v53 = nil;
                local v54 = nil;
                local v55 = v52(v34.pieces);
                local v56 = {
                    fullBodyData = v55, 
                    isServer = false, 
                    allowEditableInstances = v21, 
                    bypassFlags = v22, 
                    validateMeshPartAccessories = false, 
                    requireAllFolders = false
                };
                local v57 = {};
                for _, v59 in v55 do
                    for _, v61 in v59.allSelectedInstances do
                        table.insert(v57, v61);
                    end;
                end;
                local v62, v63 = v6.processAll(v57, v21);
                if not v62 then
                    v54 = v63;
                    v53 = false;
                else
                    v56.editableMeshes = v63.editableMeshes;
                    v56.editableImages = v63.editableImages;
                    local v64, v65 = v11(v56);
                    v53 = v64;
                    v54 = v65;
                    if v13() then
                        v64, v65 = v14.studioRFUBundleValidation(v55, Enum.BundleType.BodyParts, v56, v35, v53, v54);
                        v53 = v64;
                        v54 = v65;
                    end;
                    v7(v56.editableMeshes, v56.editableImages);
                end;
                if not v53 then
                    v34 = table.clone(v34);
                    v34.errors = table.clone(v34.errors);
                    assert(v54 and #v54 > 0, "There should always be a reason for failure");
                    for _, v67 in v54 do
                        table.insert(v34.errors, {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = v67
                            }
                        });
                    end;
                end;
                v20(v34);
            end;
        end):andThen(function() --[[ Line: 317 ]]
            -- upvalues: v34 (ref)
            return v34;
        end);
    end;
end;