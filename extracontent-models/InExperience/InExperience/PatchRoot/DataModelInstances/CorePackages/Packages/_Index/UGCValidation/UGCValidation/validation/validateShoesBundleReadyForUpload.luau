local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local _ = require(l_Parent_0.util.BundlesMetadata);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.createEditableInstancesForContext);
local v5 = require(l_Parent_0.util.destroyEditableInstances);
local _ = require(l_Parent_0.util.createUGCBodyPartFolders);
local v7 = require(l_Parent_0.util.fixUpPreValidation);
local v8 = require(l_Parent_0.validation.validateInternal);
local v9 = require(l_Parent_0.validation.validateShoes);
local _ = require(l_Parent_0.validation.validateBundleReadyForUpload);
local v11 = game:DefineFastFlag("ValidateFullShoesBundleStudio", false);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v13 = require(l_Parent_0.util.LegacyValidationAdapter);
local l_HttpService_0 = game:GetService("HttpService");
return function(v15, v16, v17, v18, v19, v20) --[[ Line: 26 ]] --[[ Name: validateShoesBundleReadyForUpload ]]
    -- upvalues: v1 (copy), v7 (copy), v12 (copy), l_HttpService_0 (copy), v4 (copy), v8 (copy), v13 (copy), v5 (copy), v11 (copy), v9 (copy)
    v18 = v18 or function() --[[ Line: 34 ]]

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
        local l_LeftShoeAccessory_0 = v15:FindFirstChild("LeftShoeAccessory");
        local l_RightShoeAccessory_0 = v15:FindFirstChild("RightShoeAccessory");
        if not l_LeftShoeAccessory_0 or not l_LeftShoeAccessory_0:IsA("Accessory") or not l_RightShoeAccessory_0 or not l_RightShoeAccessory_0:IsA("Accessory") then
            local v24 = {
                errors = {
                    {
                        assetType = nil, 
                        error = {
                            type = "message", 
                            message = "Shoes must of type 'Accessory' and names must be 'LeftShoeAccessory' and 'RightShoeAccessory'"
                        }
                    }
                }, 
                pieces = {}
            };
            return v1.resolve(v24);
        else
            local v25 = {
                [Enum.AssetType.LeftShoeAccessory] = {
                    v7(l_LeftShoeAccessory_0)
                }, 
                [Enum.AssetType.RightShoeAccessory] = {
                    v7(l_RightShoeAccessory_0)
                }
            };
            local v26 = {};
            local v27 = {};
            local v28 = {};
            for v29, v30 in v16[v17].allowedAssetTypeSettings do
                local v31 = assert(Enum.AssetType[v29], "Asset type name doesn't map to an enum item");
                if v30.isEligibleForUpload then
                    local v32 = v25[v31];
                    local v33 = v32 and v32[1];
                    v26[v31] = {
                        assetType = v31, 
                        instance = v33, 
                        settings = v30, 
                        status = v33 == nil and "finished" or "pending"
                    };
                    if v33 == nil then
                        table.insert(v27, {
                            assetType = v31, 
                            error = {
                                type = "notFound"
                            }
                        });
                    end;
                end;
            end;
            table.insert(v28, v26[Enum.AssetType.LeftShoeAccessory]);
            table.insert(v28, v26[Enum.AssetType.RightShoeAccessory]);
            local v34 = {
                errors = v27, 
                pieces = v28
            };
            v18(v34);
            local v35 = nil;
            if v12() then
                v35 = l_HttpService_0:GenerateGUID();
            end;
            return v1.each(v28, function(v36, v37) --[[ Line: 128 ]]
                -- upvalues: v19 (copy), v20 (copy), v4 (ref), v8 (ref), v12 (ref), v13 (ref), v35 (ref), v5 (ref), v34 (ref), v18 (ref)
                if v36.status == "finished" then
                    return;
                else
                    assert(v36.instance ~= nil, "Unfinished piece doesn't have an instance");
                    local v38 = nil;
                    local v39 = nil;
                    local v40 = {
                        v36.instance
                    };
                    local v41 = {
                        instances = v40, 
                        assetTypeEnum = v36.assetType, 
                        allowEditableInstances = v19, 
                        bypassFlags = v20
                    };
                    local v42, v43 = v4.processAll(v40, v19);
                    if not v42 then
                        v39 = v43;
                        v38 = false;
                    else
                        v41.editableMeshes = v43.editableMeshes;
                        v41.editableImages = v43.editableImages;
                        local v44, v45 = v8(v41);
                        v38 = v44;
                        v39 = v45;
                        if v12() then
                            v44, v45 = v13.studioRFUAssetValidation(v41, v35, v38, v39);
                            v38 = v44;
                            v39 = v45;
                        end;
                        v5(v41.editableMeshes, v41.editableImages);
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
                    v18(v34);
                    return;
                end;
            end):andThen(function() --[[ Line: 190 ]]
                -- upvalues: v11 (ref), v34 (ref), v19 (copy), v20 (copy), v4 (ref), v9 (ref), v12 (ref), v13 (ref), v35 (ref), v5 (ref), v18 (ref)
                if v11 then
                    local function v52(v48) --[[ Line: 192 ]] --[[ Name: createFullBodyData ]]
                        local v49 = {};
                        for _, v51 in v48 do
                            table.insert(v49, {
                                assetTypeEnum = v51.assetType, 
                                allSelectedInstances = if v51.instance then {
                                    v51.instance
                                } else {}
                            });
                        end;
                        return v49;
                    end;
                    local v53 = nil;
                    local v54 = nil;
                    local v55 = v52(v34.pieces);
                    local v56 = {
                        fullBodyData = v55, 
                        isServer = false, 
                        allowEditableInstances = v19, 
                        bypassFlags = v20
                    };
                    local v57 = {};
                    for _, v59 in v55 do
                        for _, v61 in v59.allSelectedInstances do
                            table.insert(v57, v61);
                        end;
                    end;
                    local v62, v63 = v4.processAll(v57, v19);
                    if not v62 then
                        v54 = v63;
                        v53 = false;
                    else
                        v56.editableMeshes = v63.editableMeshes;
                        v56.editableImages = v63.editableImages;
                        local v64, v65 = v9(v56);
                        v53 = v64;
                        v54 = v65;
                        if v12() then
                            v64, v65 = v13.studioRFUBundleValidation(v55, Enum.BundleType.Shoes, v56, v35, v53, v54);
                            v53 = v64;
                            v54 = v65;
                        end;
                        v5(v56.editableMeshes, v56.editableImages);
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
                end;
                v18(v34);
            end):andThen(function() --[[ Line: 267 ]]
                -- upvalues: v34 (ref)
                return v34;
            end);
        end;
    end;
end;