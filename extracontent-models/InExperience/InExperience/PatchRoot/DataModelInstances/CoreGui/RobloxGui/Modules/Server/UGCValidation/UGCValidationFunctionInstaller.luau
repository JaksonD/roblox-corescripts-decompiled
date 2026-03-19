local l_CorePackages_0 = game:GetService("CorePackages");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v2 = require(l_CorePackages_0.Packages.UGCValidation);
local l_game_EngineFeature_0 = game:GetEngineFeature("UGCValidationWithContextEntrypointFeature");
local function v31(v4) --[[ Line: 8 ]] --[[ Name: UGCValidationFunction ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v2 (copy)
    local l_instances_0 = v4.instances;
    local l_assetType_0 = v4.assetType;
    local l_isServer_0 = v4.isServer;
    local l_fullBodyData_0 = v4.fullBodyData;
    local l_allowUnreviewedAssets_0 = v4.allowUnreviewedAssets;
    local l_restrictedUserIds_0 = v4.restrictedUserIds;
    local l_token_0 = v4.token;
    local l_universeId_0 = v4.universeId;
    local l_requireAllFolders_0 = v4.requireAllFolders;
    local v14 = {
        skipSnapshot = true, 
        skipPhysicsDataReset = true, 
        skipValidateHSR = true
    };
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    if l_game_EngineFeature_0 then
        v15 = {
            instances = l_instances_0, 
            assetTypeEnum = l_assetType_0, 
            isServer = l_isServer_0, 
            allowUnreviewedAssets = l_allowUnreviewedAssets_0, 
            restrictedUserIds = l_restrictedUserIds_0, 
            token = l_token_0, 
            universeId = l_universeId_0, 
            allowEditableInstances = true, 
            shouldYield = true, 
            validateMeshPartAccessories = true, 
            requireAllFolders = l_requireAllFolders_0, 
            bypassFlags = v14
        };
        v16 = {
            fullBodyData = l_fullBodyData_0, 
            isServer = l_isServer_0, 
            allowEditableInstances = true, 
            bypassFlags = v14, 
            shouldYield = true, 
            requireAllFolders = l_requireAllFolders_0, 
            validateMeshPartAccessories = false
        };
        if l_fullBodyData_0 then
            local v19, v20 = v2.validateFullBodyWithContext(v16);
            v17 = v19;
            v18 = v20;
        else
            local v21, v22 = v2.validateWithContext(v15);
            v17 = v21;
            v18 = v22;
        end;
    elseif l_fullBodyData_0 then
        local v23, v24 = v2.validateFullBody(l_fullBodyData_0, l_isServer_0, true, v14, true, l_requireAllFolders_0);
        v17 = v23;
        v18 = v24;
    else
        local v25, v26 = v2.validate(l_instances_0, l_assetType_0, l_isServer_0, l_allowUnreviewedAssets_0, l_restrictedUserIds_0, l_token_0, l_universeId_0, true, v14, true, true, l_requireAllFolders_0);
        v17 = v25;
        v18 = v26;
    end;
    if v2.isFolderStructureEnabled and v2.isFolderStructureEnabled() then
        local v27 = {
            source = l_isServer_0 and "InExpServer" or "InExpClient", 
            enforceR15FolderStructure = l_requireAllFolders_0 or false
        };
        local v28 = nil;
        v28 = if l_fullBodyData_0 then v2.ValidateFinalizedBundle(l_fullBodyData_0, Enum.BundleType.BodyParts, v27) else v2.ValidateAsset(l_instances_0, l_assetType_0, v27);
        if v2.isEntrypointMergingEnabled and v2.isEntrypointMergingEnabled() then
            local v29, v30 = v2.combineResultsIntoLegacy(v17, v18, v28);
            v17 = v29;
            v18 = v30;
        end;
    end;
    if not v17 then
        return false, v18;
    else
        return true, {
            "Success"
        };
    end;
end;
return function() --[[ Line: 115 ]] --[[ Name: Install ]]
    -- upvalues: l_UGCValidationService_0 (copy), v31 (copy)
    l_UGCValidationService_0:RegisterUGCValidationFunction(v31);
end;