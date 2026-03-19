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
local v25 = {
    ValidateAsset = v21.ValidateAsset, 
    ValidateFinalizedBundle = v21.ValidateFinalizedBundle, 
    combineResultsIntoLegacy = v24.combineResultsIntoLegacy, 
    isFolderStructureEnabled = v22, 
    isEntrypointMergingEnabled = v23
};
if v1() then
    v25.validateWithContext = function(v26) --[[ Line: 46 ]] --[[ Name: validateWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
        assert(v26.instances ~= nil, "instances required in validationContext for validateWithContext");
        assert(v26.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateWithContext");
        local l_instances_0 = v26.instances;
        local l_isServer_0 = v26.isServer;
        local l_assetTypeEnum_0 = v26.assetTypeEnum;
        local l_allowEditableInstances_0 = v26.allowEditableInstances;
        local v31 = tick();
        v2.setMetadata({
            entrypoint = "validate", 
            assetType = l_assetTypeEnum_0.Name, 
            isServer = l_isServer_0
        });
        local v32, v33 = v10.processAll(l_instances_0, l_allowEditableInstances_0);
        if not v32 then
            if l_isServer_0 then
                error(v33[1]);
            else
                return v32, v33;
            end;
        end;
        v26.editableMeshes = v33.editableMeshes;
        v26.editableImages = v33.editableImages;
        v26.lastTickSeconds = tick();
        if v26.requireAllFolders == nil then
            v26.requireAllFolders = true;
        end;
        local v34, v35 = v13(v26);
        v11(v26.editableMeshes, v26.editableImages);
        if v34 then
            v2.recordScriptTime(script.Name, v31, v26);
            v2.reportScriptTimes(v26);
        end;
        v2.reportCounter(v34, l_assetTypeEnum_0 == Enum.AssetType.DynamicHead and "Head" or "BodyPart", v26);
        return v34, v35;
    end;
end;
v25.validate = function(v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47) --[[ Line: 106 ]] --[[ Name: validate ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
    local v48 = tick();
    v2.setMetadata({
        entrypoint = "validate", 
        assetType = v37.Name, 
        isServer = v38
    });
    local v49, v50 = v10.processAll(v36, v43);
    if not v49 then
        if v38 then
            error(v50[1]);
        else
            return v49, v50;
        end;
    end;
    local v51 = {
        instances = v36, 
        assetTypeEnum = v37, 
        allowUnreviewedAssets = v39, 
        restrictedUserIds = v40, 
        isServer = v38, 
        token = v41, 
        universeId = v42, 
        isAsync = false, 
        allowEditableInstances = v43, 
        bypassFlags = v44, 
        validateMeshPartAccessories = v46 == nil or v46, 
        lastTickSeconds = tick(), 
        shouldYield = v45, 
        editableMeshes = v50.editableMeshes, 
        editableImages = v50.editableImages, 
        requireAllFolders = v47 == nil or v47
    };
    local v52, v53 = v13(v51);
    v11(v51.editableMeshes, v51.editableImages);
    if v52 then
        v2.recordScriptTime(script.Name, v48, v51);
        v2.reportScriptTimes(v51);
    end;
    v2.reportCounter(v52, v37 == Enum.AssetType.DynamicHead and "Head" or "BodyPart", v51);
    return v52, v53;
end;
v25.validateAsync = function(v54, v55, v56, v57, v58, v59) --[[ Line: 177 ]] --[[ Name: validateAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v13 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateAsync", 
        assetType = v55.Name, 
        isServer = v57
    });
    local v60, v61 = v10.processAll(v54);
    if not v60 then
        if v57 then
            error(v61[1]);
        else
            v56(v60, v61);
        end;
    end;
    local v62 = {
        instances = v54, 
        assetTypeEnum = v55, 
        allowUnreviewedAssets = v58, 
        restrictedUserIds = v59, 
        isServer = v57, 
        token = "", 
        isAsync = true, 
        validateMeshPartAccessories = false, 
        editableMeshes = v61.editableMeshes, 
        editableImages = v61.editableImages
    };
    coroutine.wrap(function() --[[ Line: 213 ]]
        -- upvalues: v56 (copy), v13 (ref), v62 (copy), v11 (ref)
        v56(v13(v62));
        v11(v62.editableMeshes, v62.editableImages);
    end)();
end;
v25.validateMeshPartFormat = function(v63, v64, v65, v66, v67) --[[ Line: 223 ]] --[[ Name: validateMeshPartFormat ]]
    -- upvalues: v2 (copy), v10 (copy), v20 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateMeshPartFormat", 
        assetType = v64.Name, 
        isServer = v65
    });
    assert(Enum.AssetType.DynamicHead == v64);
    local v68, v69 = v10.processAll(v63);
    if not v68 then
        if v65 then
            error(v69[1]);
        else
            return v68, v69;
        end;
    end;
    local v70 = {
        instances = v63, 
        assetTypeEnum = v64, 
        allowUnreviewedAssets = v66, 
        restrictedUserIds = v67, 
        isServer = v65, 
        validateMeshPartAccessories = false, 
        editableMeshes = v69.editableMeshes, 
        editableImages = v69.editableImages
    };
    local v71, v72 = v20(v70);
    v11(v70.editableMeshes, v70.editableImages);
    return v71, v72;
end;
v25.validateAsyncMeshPartFormat = function(v73, v74, v75, v76, v77, v78) --[[ Line: 270 ]] --[[ Name: validateAsyncMeshPartFormat ]]
    -- upvalues: v2 (copy), v10 (copy), v20 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateAsyncMeshPartFormat", 
        assetType = v74.Name, 
        isServer = v76
    });
    assert(Enum.AssetType.DynamicHead == v74);
    local v79, v80 = v10.processAll(v73);
    if not v79 then
        if v76 then
            error(v80[1]);
        else
            v75(v79, v80);
        end;
    end;
    local v81 = {
        instances = v73, 
        assetTypeEnum = v74, 
        allowUnreviewedAssets = v77, 
        restrictedUserIds = v78, 
        isServer = v76, 
        validateMeshPartAccessories = false, 
        editableMeshes = v80.editableMeshes, 
        editableImages = v80.editableImages
    };
    coroutine.wrap(function() --[[ Line: 308 ]]
        -- upvalues: v75 (copy), v20 (ref), v81 (copy), v11 (ref)
        v75(v20(v81));
        v11(v81.editableMeshes, v81.editableImages);
    end)();
end;
if v1() then
    v25.validateMeshPartAssetFormatWithContext = function(v82) --[[ Line: 318 ]] --[[ Name: validateMeshPartAssetFormatWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v7 (copy), v14 (copy), v15 (copy), v11 (copy)
        assert(v82.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAssetFormatWithContext");
        assert(v82.instances ~= nil, "instances required in validationContext for validateMeshPartAssetFormatWithContext");
        local l_instances_1 = v82.instances;
        local l_assetTypeEnum_1 = v82.assetTypeEnum;
        local l_isServer_1 = v82.isServer;
        local l_specialMeshAccessory_0 = v82.specialMeshAccessory;
        v2.setMetadata({
            entrypoint = "validateMeshPartAssetFormat2", 
            assetType = l_assetTypeEnum_1.Name, 
            isServer = l_isServer_1
        });
        local v87, v88 = v10.processAll(l_instances_1);
        if not v87 then
            if l_isServer_1 then
                error(v88[1]);
            else
                return v87, v88;
            end;
        end;
        v82.editableMeshes = v88.editableMeshes;
        v82.editableImages = v88.editableImages;
        v82.validateMeshPartAccessories = false;
        local v89 = nil;
        local v90 = nil;
        if v7(l_instances_1[1]) then
            local v91, v92 = v14(l_specialMeshAccessory_0, v82);
            v89 = v91;
            v90 = v92;
        else
            local v93, v94 = v15(l_specialMeshAccessory_0, v82);
            v89 = v93;
            v90 = v94;
        end;
        v11(v82.editableMeshes, v82.editableImages);
        return v89, v90;
    end;
end;
v25.validateMeshPartAssetFormat2 = function(v95, v96, v97, v98, v99, _) --[[ Line: 372 ]] --[[ Name: validateMeshPartAssetFormat2 ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), v14 (copy), v15 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateMeshPartAssetFormat2", 
        assetType = v97.Name, 
        isServer = v98
    });
    local v101, v102 = v10.processAll(v95);
    if not v101 then
        if v98 then
            error(v102[1]);
        else
            return v101, v102;
        end;
    end;
    local v103 = {
        instances = v95, 
        assetTypeEnum = v97, 
        allowUnreviewedAssets = v99, 
        isServer = v98, 
        validateMeshPartAccessories = false, 
        editableMeshes = v102.editableMeshes, 
        editableImages = v102.editableImages
    };
    local v104 = nil;
    local v105 = nil;
    if v7(v95[1]) then
        local v106, v107 = v14(v96, v103);
        v104 = v106;
        v105 = v107;
    else
        local v108, v109 = v15(v96, v103);
        v104 = v108;
        v105 = v109;
    end;
    v11(v103.editableMeshes, v103.editableImages);
    return v104, v105;
end;
v25.validateBundleReadyForUpload = v18;
v25.validateShoesBundleReadyForUpload = v19;
v25.util = {
    BundlesMetadata = v4, 
    createUGCBodyPartFolders = v6, 
    canUploadBundlesAsync = v5
};
v25.util.isLayeredClothingAllowed = v8.isLayeredClothingAllowed;
v25.util.isRigidAccessoryAllowed = v8.isRigidAccessoryAllowed;
if v1() then
    v25.validateFullBodyWithContext = function(v110) --[[ Line: 476 ]] --[[ Name: validateFullBodyWithContext ]]
        -- upvalues: v2 (copy), v10 (copy), v16 (copy), v11 (copy)
        assert(v110.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBodyWithContext");
        local l_isServer_2 = v110.isServer;
        local l_fullBodyData_0 = v110.fullBodyData;
        local l_allowEditableInstances_1 = v110.allowEditableInstances;
        v2.setMetadata({
            entrypoint = "validateFullBody", 
            assetType = "", 
            isServer = l_isServer_2
        });
        local v114 = tick();
        local v115 = {};
        for _, v117 in l_fullBodyData_0 do
            for _, v119 in v117.allSelectedInstances do
                table.insert(v115, v119);
            end;
        end;
        local v120, v121 = v10.processAll(v115, l_allowEditableInstances_1);
        if not v120 then
            if l_isServer_2 then
                error(v121[1]);
            else
                return v120, v121;
            end;
        end;
        v110.editableMeshes = v121.editableMeshes;
        v110.editableImages = v121.editableImages;
        v110.lastTickSeconds = tick();
        if v110.requireAllFolders == nil then
            v110.requireAllFolders = true;
        end;
        local v122, v123 = v16(v110);
        v11(v110.editableMeshes, v110.editableImages);
        if v122 then
            v2.recordScriptTime(script.Name, v114, v110);
            v2.reportScriptTimes(v110);
        end;
        v2.reportCounter(v122, "FullBody", v110);
        return v122, v123;
    end;
end;
v25.validateFullBody = function(v124, v125, v126, v127, v128, v129) --[[ Line: 539 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v2 (copy), v10 (copy), v16 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "validateFullBody", 
        assetType = "", 
        isServer = v125
    });
    local v130 = tick();
    local v131 = {};
    for _, v133 in v124 do
        for _, v135 in v133.allSelectedInstances do
            table.insert(v131, v135);
        end;
    end;
    local v136, v137 = v10.processAll(v131, v126);
    if not v136 then
        if v125 then
            error(v137[1]);
        else
            return v136, v137;
        end;
    end;
    local v138 = {
        fullBodyData = v124, 
        isServer = v125, 
        allowEditableInstances = v126, 
        bypassFlags = v127, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v128, 
        editableMeshes = v137.editableMeshes, 
        editableImages = v137.editableImages, 
        requireAllFolders = v129 == nil or v129
    };
    local v139, v140 = v16(v138);
    v11(v138.editableMeshes, v138.editableImages);
    if v139 then
        v2.recordScriptTime(script.Name, v130, v138);
        v2.reportScriptTimes(v138);
    end;
    v2.reportCounter(v139, "FullBody", v138);
    return v139, v140;
end;
v25.validateShoesWithContext = function(v141) --[[ Line: 601 ]] --[[ Name: validateShoesWithContext ]]
    -- upvalues: v2 (copy), v10 (copy), v17 (copy), v11 (copy)
    assert(v141.fullBodyData ~= nil, "fullBodyData required in validationContext for validateShoes");
    local l_isServer_3 = v141.isServer;
    local l_fullBodyData_1 = v141.fullBodyData;
    local l_allowEditableInstances_2 = v141.allowEditableInstances;
    v2.setMetadata({
        entrypoint = "validateShoes", 
        assetType = "", 
        isServer = l_isServer_3
    });
    local v145 = tick();
    local v146 = {};
    for _, v148 in l_fullBodyData_1 do
        for _, v150 in v148.allSelectedInstances do
            table.insert(v146, v150);
        end;
    end;
    local v151, v152 = v10.processAll(v146, l_allowEditableInstances_2);
    if not v151 then
        if l_isServer_3 then
            error(v152[1]);
        else
            return v151, v152;
        end;
    end;
    v141.editableMeshes = v152.editableMeshes;
    v141.editableImages = v152.editableImages;
    v141.lastTickSeconds = tick();
    local v153, v154 = v17(v141);
    v11(v141.editableMeshes, v141.editableImages);
    if v153 then
        v2.recordScriptTime(script.Name, v145, v141);
        v2.reportScriptTimes(v141);
    end;
    v2.reportCounter(v153, "Shoes", v141);
    return v153, v154;
end;
v25.preprocessDataAsync = function(v155, v156, v157, v158, v159) --[[ Line: 653 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v12 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "preprocessDataAsync", 
        assetType = "", 
        isServer = v156
    });
    local v160 = tick();
    local v161 = {};
    for _, v163 in v155 do
        table.insert(v161, v163);
    end;
    local v164, v165 = v10.processAll(v161, v157);
    if not v164 then
        if v156 then
            error(v165[1]);
        else
            return {
                ok = false, 
                errors = v165
            };
        end;
    end;
    local v166 = {
        isServer = v156, 
        allowEditableInstances = v157, 
        bypassFlags = v158, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v159, 
        editableMeshes = v165.editableMeshes, 
        editableImages = v165.editableImages
    };
    local v167 = v12.preprocessDataAsync(v155, v166);
    v11(v166.editableMeshes, v166.editableImages);
    if v167.ok then
        v2.recordScriptTime("preprocessDataAsync", v160, v166);
        v2.reportScriptTimes(v166);
    end;
    return v167;
end;
v25.isPreprocessDataCached = function(v168, v169, v170) --[[ Line: 712 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v2 (copy), v12 (copy)
    v2.setMetadata({
        entrypoint = "isPreprocessDataCached", 
        assetType = "", 
        isServer = v170
    });
    local v171 = tick();
    local v172 = v12.isPreprocessDataCached(v168, v169);
    local v173 = {
        isServer = v170
    };
    v2.recordScriptTime("isPreprocessDataCached", v171, v173);
    v2.reportScriptTimes(v173);
    return v172;
end;
v25.calculateScaleToValidateBoundsAsync = function(v174, v175, v176, v177, v178, v179) --[[ Line: 737 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v2 (copy), v10 (copy), v12 (copy), v11 (copy)
    v2.setMetadata({
        entrypoint = "calculateScaleToValidateBoundsAsync", 
        assetType = "", 
        isServer = v175
    });
    local v180 = tick();
    local v181 = nil;
    if not v179 then
        local v182 = {};
        for _, v184 in v174 do
            table.insert(v182, v184);
        end;
        local v185 = nil;
        local v186, v187 = v10.processAll(v182, v176);
        v185 = v186;
        v181 = v187;
        if not v185 then
            if v175 then
                error(v181[1]);
            else
                return {
                    ok = false, 
                    errors = v181
                };
            end;
        end;
    end;
    local v188 = {
        isServer = v175, 
        allowEditableInstances = v176, 
        bypassFlags = v177, 
        validateMeshPartAccessories = false, 
        lastTickSeconds = tick(), 
        shouldYield = v178
    };
    if not v179 then
        v188.editableMeshes = v181.editableMeshes;
        v188.editableImages = v181.editableImages;
    end;
    local v189 = v12.calculateScaleToValidateBoundsAsync(v174, v188, v179);
    if not v179 then
        v11(v188.editableMeshes, v188.editableImages);
    end;
    if v189.ok then
        v2.recordScriptTime("calculateScaleToValidateBoundsAsync", v180, v188);
        v2.reportScriptTimes(v188);
    end;
    return v189;
end;
v25.GUIDAttributeName = v3.GUIDAttributeName;
return v25;