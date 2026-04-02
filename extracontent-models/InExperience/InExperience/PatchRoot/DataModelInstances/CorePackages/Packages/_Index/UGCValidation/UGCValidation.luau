local l_script_0 = script;
local v1 = require(l_script_0.flags.getEngineFeatureUGCValidationWithContextEntrypoint);
local v2 = require(l_script_0.Analytics);
local v3 = require(l_script_0.Constants);
local v4 = require(l_script_0.util.BundlesMetadata);
local v5 = require(l_script_0.util.canUploadBundlesAsync);
local v6 = require(l_script_0.util.createUGCBodyPartFolders);
local v7 = require(l_script_0.util.isLayeredClothing);
local v8 = require(l_script_0.util.RigidOrLayeredAllowed);
local _ = require(l_script_0.util.Types);
local v10 = require(l_script_0.util.createEditableInstancesForContext);
local v11 = require(l_script_0.util.destroyEditableInstances);
local v12 = require(l_script_0.util.ValidationHints);
local v13 = require(l_script_0.validation.validateInternal);
local v14 = require(l_script_0.validation.validateLayeredClothingAccessoryMeshPartAssetFormat);
local v15 = require(l_script_0.validation.validateLegacyAccessoryMeshPartAssetFormat);
local v16 = require(l_script_0.validation.validateFullBody);
local v17 = require(l_script_0.validation.validateShoes);
local v18 = require(l_script_0.validation.validateBundleReadyForUpload);
local v19 = require(l_script_0.validation.validateShoesBundleReadyForUpload);
local v20 = require(l_script_0.validation.validateDynamicHeadMeshPartFormat);
local v21 = require(l_script_0.validationSystem.ValidationManager);
local v22 = require(l_script_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v23 = require(l_script_0.flags.getFFlagUGCValidationCombineEntrypointResults);
local v24 = require(l_script_0.util.LegacyValidationAdapter);
local v25 = require(l_script_0.util.SplitHumanoidRigDescriptionForUpload);
local v26 = {
    ValidateAsset = v21.ValidateAsset, 
    ValidateFinalizedBundle = v21.ValidateFinalizedBundle, 
    combineResultsIntoLegacy = v24.combineResultsIntoLegacy, 
    isFolderStructureEnabled = v22, 
    isEntrypointMergingEnabled = v23, 
    SplitHrdInUpload = v25.fixUploadInstance
};
if v1() then
    v26.validateWithContext = function(v27) --[[ Line: 48 ]] --[[ Name: validateWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
        assert(v27.instances ~= nil, "instances required in validationContext for validateWithContext");
        assert(v27.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateWithContext");
        local l_instances_0 = v27.instances;
        local l_isServer_0 = v27.isServer;
        local l_assetTypeEnum_0 = v27.assetTypeEnum;
        local l_allowEditableInstances_0 = v27.allowEditableInstances;
        local v32 = tick();
        v2.setMetadata({
            entrypoint = "validate", 
            assetType = l_assetTypeEnum_0.Name, 
            isServer = l_isServer_0
        });
        local v33, v34 = v10.processAll(l_instances_0, l_allowEditableInstances_0);
        if not v33 then
            if l_isServer_0 then
                error(v34[1]);
            else
                return v33, v34;
            end;
        end;
        v27.editableMeshes = v34.editableMeshes;
        v27.editableImages = v34.editableImages;
        v27.lastTickSeconds = tick();
        if v27.requireAllFolders == nil then
            v27.requireAllFolders = true;
        end;
        local v35, v36 = v13(v27);
        v11(v27.editableMeshes, v27.editableImages);
        if v35 then
            v2.recordScriptTime(script.Name, v32, v27);
            v2.reportScriptTimes(v27);
        end;
        v2.reportCounter(v35, l_assetTypeEnum_0 == Enum.AssetType.DynamicHead and "Head" or "BodyPart", v27);
        return v35, v36;
    end;
end;
v26.validate = function(v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48) --[[ Line: 108 ]] --[[ Name: validate ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
    local v49 = tick();
    v2.setMetadata({
        entrypoint = "validate", 
        assetType = v38.Name, 
        isServer = v39
    });
    local v50, v51 = v10.processAll(v37, v44);
    if not v50 then
        if v39 then
            error(v51[1]);
        else
            return v50, v51;
        end;
    end;
    local v52 = {
        instances = v37, 
        assetTypeEnum = v38, 
        allowUnreviewedAssets = v40, 
        restrictedUserIds = v41, 
        isServer = v39, 
        token = v42, 
        universeId = v43, 
        isAsync = false, 
        allowEditableInstances = v44, 
        bypassFlags = v45, 
        validateMeshPartAccessories = v47 == nil or v47, 
        lastTickSeconds = tick(), 
        shouldYield = v46, 
        editableMeshes = v51.editableMeshes, 
        editableImages = v51.editableImages, 
        requireAllFolders = v48 == nil or v48
    };
    local v53, v54 = v13(v52);
    v11(v52.editableMeshes, v52.editableImages);
    if v53 then
        v2.recordScriptTime(script.Name, v49, v52);
        v2.reportScriptTimes(v52);
    end;
    v2.reportCounter(v53, v38 == Enum.AssetType.DynamicHead and "Head" or "BodyPart", v52);
    return v53, v54;
end;
v26.validateAsync = function(v55, v56, v57, v58, v59, v60) --[[ Line: 179 ]] --[[ Name: validateAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateAsync", 
        assetType = v56.Name, 
        isServer = v58
    });
    local v61, v62 = v10.processAll(v55);
    if not v61 then
        if v58 then
            error(v62[1]);
        else
            v57(v61, v62);
        end;
    end;
    local v63 = {
        instances = v55, 
        assetTypeEnum = v56, 
        allowUnreviewedAssets = v59, 
        restrictedUserIds = v60, 
        isServer = v58, 
        token = "", 
        isAsync = true, 
        validateMeshPartAccessories = false, 
        editableMeshes = v62.editableMeshes, 
        editableImages = v62.editableImages
    };
    coroutine.wrap(function() --[[ Line: 215 ]]
        -- upvalues: v57 (copy), v13 (ref), v63 (copy), v11 (ref)
        v57(v13(v63));
        v11(v63.editableMeshes, v63.editableImages);
    end)();
end;
v26.validateMeshPartFormat = function(v64, v65, v66, v67, v68) --[[ Line: 225 ]] --[[ Name: validateMeshPartFormat ]]
    -- upvalues: v2 (copy), v10 (copy), v20 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateMeshPartFormat", 
        assetType = v65.Name, 
        isServer = v66
    });
    assert(Enum.AssetType.DynamicHead == v65);
    local v69, v70 = v10.processAll(v64);
    if not v69 then
        if v66 then
            error(v70[1]);
        else
            return v69, v70;
        end;
    end;
    local v71 = {
        instances = v64, 
        assetTypeEnum = v65, 
        allowUnreviewedAssets = v67, 
        restrictedUserIds = v68, 
        isServer = v66, 
        validateMeshPartAccessories = false, 
        editableMeshes = v70.editableMeshes, 
        editableImages = v70.editableImages
    };
    local v72, v73 = v20(v71);
    v11(v71.editableMeshes, v71.editableImages);
    return v72, v73;
end;
v26.validateAsyncMeshPartFormat = function(v74, v75, v76, v77, v78, v79) --[[ Line: 272 ]] --[[ Name: validateAsyncMeshPartFormat ]]
    -- upvalues: v2 (copy), v10 (copy), v20 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateAsyncMeshPartFormat", 
        assetType = v75.Name, 
        isServer = v77
    });
    assert(Enum.AssetType.DynamicHead == v75);
    local v80, v81 = v10.processAll(v74);
    if not v80 then
        if v77 then
            error(v81[1]);
        else
            v76(v80, v81);
        end;
    end;
    local v82 = {
        instances = v74, 
        assetTypeEnum = v75, 
        allowUnreviewedAssets = v78, 
        restrictedUserIds = v79, 
        isServer = v77, 
        validateMeshPartAccessories = false, 
        editableMeshes = v81.editableMeshes, 
        editableImages = v81.editableImages
    };
    coroutine.wrap(function() --[[ Line: 310 ]]
        -- upvalues: v76 (copy), v20 (ref), v82 (copy), v11 (ref)
        v76(v20(v82));
        v11(v82.editableMeshes, v82.editableImages);
    end)();
end;
if v1() then
    v26.validateMeshPartAssetFormatWithContext = function(v83) --[[ Line: 320 ]] --[[ Name: validateMeshPartAssetFormatWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v7 (copy), v14 (copy), v15 (copy), v11 (copy)
        assert(v83.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAssetFormatWithContext");
        assert(v83.instances ~= nil, "instances required in validationContext for validateMeshPartAssetFormatWithContext");
        local l_instances_1 = v83.instances;
        local l_assetTypeEnum_1 = v83.assetTypeEnum;
        local l_isServer_1 = v83.isServer;
        local l_specialMeshAccessory_0 = v83.specialMeshAccessory;
        v2.setMetadata({
            entrypoint = "validateMeshPartAssetFormat2", 
            assetType = l_assetTypeEnum_1.Name, 
            isServer = l_isServer_1
        });
        local v88, v89 = v10.processAll(l_instances_1);
        if not v88 then
            if l_isServer_1 then
                error(v89[1]);
            else
                return v88, v89;
            end;
        end;
        v83.editableMeshes = v89.editableMeshes;
        v83.editableImages = v89.editableImages;
        v83.validateMeshPartAccessories = false;
        local v90 = nil;
        local v91 = nil;
        if v7(l_instances_1[1]) then
            local v92, v93 = v14(l_specialMeshAccessory_0, v83);
            v90 = v92;
            v91 = v93;
        else
            local v94, v95 = v15(l_specialMeshAccessory_0, v83);
            v90 = v94;
            v91 = v95;
        end;
        v11(v83.editableMeshes, v83.editableImages);
        return v90, v91;
    end;
end;
v26.validateMeshPartAssetFormat2 = function(v96, v97, v98, v99, v100, _) --[[ Line: 374 ]] --[[ Name: validateMeshPartAssetFormat2 ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), v14 (copy), v15 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateMeshPartAssetFormat2", 
        assetType = v98.Name, 
        isServer = v99
    });
    local v102, v103 = v10.processAll(v96);
    if not v102 then
        if v99 then
            error(v103[1]);
        else
            return v102, v103;
        end;
    end;
    local v104 = {
        instances = v96, 
        assetTypeEnum = v98, 
        allowUnreviewedAssets = v100, 
        isServer = v99, 
        validateMeshPartAccessories = false, 
        editableMeshes = v103.editableMeshes, 
        editableImages = v103.editableImages
    };
    local v105 = nil;
    local v106 = nil;
    if v7(v96[1]) then
        local v107, v108 = v14(v97, v104);
        v105 = v107;
        v106 = v108;
    else
        local v109, v110 = v15(v97, v104);
        v105 = v109;
        v106 = v110;
    end;
    v11(v104.editableMeshes, v104.editableImages);
    return v105, v106;
end;
v26.validateBundleReadyForUpload = v18;
v26.validateShoesBundleReadyForUpload = v19;
v26.util = {
    BundlesMetadata = v4, 
    createUGCBodyPartFolders = v6, 
    canUploadBundlesAsync = v5
};
v26.util.isLayeredClothingAllowed = v8.isLayeredClothingAllowed;
v26.util.isRigidAccessoryAllowed = v8.isRigidAccessoryAllowed;
if v1() then
    v26.validateFullBodyWithContext = function(v111) --[[ Line: 478 ]] --[[ Name: validateFullBodyWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v16 (copy), v11 (copy)
        assert(v111.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBodyWithContext");
        local l_isServer_2 = v111.isServer;
        local l_fullBodyData_0 = v111.fullBodyData;
        local l_allowEditableInstances_1 = v111.allowEditableInstances;
        v2.setMetadata({
            entrypoint = "validateFullBody", 
            assetType = "", 
            isServer = l_isServer_2
        });
        local v115 = tick();
        local v116 = {};
        for _, v118 in l_fullBodyData_0 do
            for _, v120 in v118.allSelectedInstances do
                table.insert(v116, v120);
            end;
        end;
        local v121, v122 = v10.processAll(v116, l_allowEditableInstances_1);
        if not v121 then
            if l_isServer_2 then
                error(v122[1]);
            else
                return v121, v122;
            end;
        end;
        v111.editableMeshes = v122.editableMeshes;
        v111.editableImages = v122.editableImages;
        v111.lastTickSeconds = tick();
        if v111.requireAllFolders == nil then
            v111.requireAllFolders = true;
        end;
        local v123, v124 = v16(v111);
        v11(v111.editableMeshes, v111.editableImages);
        if v123 then
            v2.recordScriptTime(script.Name, v115, v111);
            v2.reportScriptTimes(v111);
        end;
        v2.reportCounter(v123, "FullBody", v111);
        return v123, v124;
    end;
end;
v26.validateFullBody = function(v125, v126, v127, v128, v129, v130) --[[ Line: 541 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v2 (copy), v10 (copy), v16 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateFullBody", 
        assetType = "", 
        isServer = v126
    });
    local v131 = tick();
    local v132 = {};
    for _, v134 in v125 do
        for _, v136 in v134.allSelectedInstances do
            table.insert(v132, v136);
        end;
    end;
    local v137, v138 = v10.processAll(v132, v127);
    if not v137 then
        if v126 then
            error(v138[1]);
        else
            return v137, v138;
        end;
    end;
    local v139 = {
        fullBodyData = v125, 
        isServer = v126, 
        allowEditableInstances = v127, 
        bypassFlags = v128, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v129, 
        editableMeshes = v138.editableMeshes, 
        editableImages = v138.editableImages, 
        requireAllFolders = v130 == nil or v130
    };
    local v140, v141 = v16(v139);
    v11(v139.editableMeshes, v139.editableImages);
    if v140 then
        v2.recordScriptTime(script.Name, v131, v139);
        v2.reportScriptTimes(v139);
    end;
    v2.reportCounter(v140, "FullBody", v139);
    return v140, v141;
end;
v26.validateShoesWithContext = function(v142) --[[ Line: 603 ]] --[[ Name: validateShoesWithContext ]]
    -- upvalues: v2 (copy), v10 (copy), v17 (copy), v11 (copy)
    assert(v142.fullBodyData ~= nil, "fullBodyData required in validationContext for validateShoes");
    local l_isServer_3 = v142.isServer;
    local l_fullBodyData_1 = v142.fullBodyData;
    local l_allowEditableInstances_2 = v142.allowEditableInstances;
    v2.setMetadata({
        entrypoint = "validateShoes", 
        assetType = "", 
        isServer = l_isServer_3
    });
    local v146 = tick();
    local v147 = {};
    for _, v149 in l_fullBodyData_1 do
        for _, v151 in v149.allSelectedInstances do
            table.insert(v147, v151);
        end;
    end;
    local v152, v153 = v10.processAll(v147, l_allowEditableInstances_2);
    if not v152 then
        if l_isServer_3 then
            error(v153[1]);
        else
            return v152, v153;
        end;
    end;
    v142.editableMeshes = v153.editableMeshes;
    v142.editableImages = v153.editableImages;
    v142.lastTickSeconds = tick();
    local v154, v155 = v17(v142);
    v11(v142.editableMeshes, v142.editableImages);
    if v154 then
        v2.recordScriptTime(script.Name, v146, v142);
        v2.reportScriptTimes(v142);
    end;
    v2.reportCounter(v154, "Shoes", v142);
    return v154, v155;
end;
v26.preprocessDataAsync = function(v156, v157, v158, v159, v160) --[[ Line: 655 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v12 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "preprocessDataAsync", 
        assetType = "", 
        isServer = v157
    });
    local v161 = tick();
    local v162 = {};
    for _, v164 in v156 do
        table.insert(v162, v164);
    end;
    local v165, v166 = v10.processAll(v162, v158);
    if not v165 then
        if v157 then
            error(v166[1]);
        else
            return {
                ok = false, 
                errors = v166
            };
        end;
    end;
    local v167 = {
        isServer = v157, 
        allowEditableInstances = v158, 
        bypassFlags = v159, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v160, 
        editableMeshes = v166.editableMeshes, 
        editableImages = v166.editableImages
    };
    local v168 = v12.preprocessDataAsync(v156, v167);
    v11(v167.editableMeshes, v167.editableImages);
    if v168.ok then
        v2.recordScriptTime("preprocessDataAsync", v161, v167);
        v2.reportScriptTimes(v167);
    end;
    return v168;
end;
v26.isPreprocessDataCached = function(v169, v170, v171) --[[ Line: 714 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v2 (copy), v12 (copy)
    v2.setMetadata({
        entrypoint = "isPreprocessDataCached", 
        assetType = "", 
        isServer = v171
    });
    local v172 = tick();
    local v173 = v12.isPreprocessDataCached(v169, v170);
    local v174 = {
        isServer = v171
    };
    v2.recordScriptTime("isPreprocessDataCached", v172, v174);
    v2.reportScriptTimes(v174);
    return v173;
end;
v26.calculateScaleToValidateBoundsAsync = function(v175, v176, v177, v178, v179, v180) --[[ Line: 739 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v12 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "calculateScaleToValidateBoundsAsync", 
        assetType = "", 
        isServer = v176
    });
    local v181 = tick();
    local v182 = nil;
    if not v180 then
        local v183 = {};
        for _, v185 in v175 do
            table.insert(v183, v185);
        end;
        local v186 = nil;
        local v187, v188 = v10.processAll(v183, v177);
        v186 = v187;
        v182 = v188;
        if not v186 then
            if v176 then
                error(v182[1]);
            else
                return {
                    ok = false, 
                    errors = v182
                };
            end;
        end;
    end;
    local v189 = {
        isServer = v176, 
        allowEditableInstances = v177, 
        bypassFlags = v178, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v179
    };
    if not v180 then
        v189.editableMeshes = v182.editableMeshes;
        v189.editableImages = v182.editableImages;
    end;
    local v190 = v12.calculateScaleToValidateBoundsAsync(v175, v189, v180);
    if not v180 then
        v11(v189.editableMeshes, v189.editableImages);
    end;
    if v190.ok then
        v2.recordScriptTime("calculateScaleToValidateBoundsAsync", v181, v189);
        v2.reportScriptTimes(v189);
    end;
    return v190;
end;
v26.GUIDAttributeName = v3.GUIDAttributeName;
return v26;