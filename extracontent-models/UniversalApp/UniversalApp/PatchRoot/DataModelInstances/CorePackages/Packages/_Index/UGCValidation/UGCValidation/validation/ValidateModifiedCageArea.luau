local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.getMeshVerts);
local v8 = require(l_Parent_0.util.CollisionTestUtil);
local v9 = require(l_Parent_0.util.StringUtil);
local v10 = game:DefineFastInt("UGCValidateExcludedUVModifyRequirements", 14);
local v11 = game:DefineFastInt("UGCValidatePartUVModifyRequirements", 45);
local v12 = game:DefineFastInt("UGCValidateRenderMeshInsideModifiedArea", 70);
local v13 = tonumber((game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1")));
local v14 = {};
local v15 = {
    [Enum.AssetType.LeftShoeAccessory] = {
        allowedParts = {
            LeftFoot = true, 
            LeftLowerLeg = true, 
            LeftUpperLeg = true
        }, 
        mainParts = {
            LeftFoot = true
        }
    }, 
    [Enum.AssetType.RightShoeAccessory] = {
        allowedParts = {
            RightFoot = true, 
            RightLowerLeg = true, 
            RightUpperLeg = true
        }, 
        mainParts = {
            RightFoot = true
        }
    }
};
local function v19(v16, v17, v18) --[[ Line: 58 ]] --[[ Name: reportTestFailedToExecute ]]
    -- upvalues: v2 (copy)
    if v18.isServer ~= nil and v18.isServer then
        error(v16);
    end;
    v2.reportFailure(v17, nil, v18);
    return false, {
        v16
    };
end;
local function v25(v20) --[[ Line: 73 ]] --[[ Name: gatherUVs ]]
    -- upvalues: v3 (copy)
    local v21 = {};
    for v22 in v20 do
        for _, v24 in (assert(v3[v22], "Body area not found in UV reference values")) do
            table.insert(v21, v24);
        end;
    end;
    return v21;
end;
local function v29(v26) --[[ Line: 87 ]] --[[ Name: lazyGetUVsExcludedForAssetType ]]
    -- upvalues: v3 (copy), v25 (copy)
    if not v26.uVsDisallowedForAssetType then
        local v27 = {};
        for v28 in v3 do
            if not v26.allowedParts[v28] then
                v27[v28] = true;
            end;
        end;
        v26.uVsDisallowedForAssetType = v25(v27);
    end;
    return v26.uVsDisallowedForAssetType;
end;
local function _(v30) --[[ Line: 102 ]] --[[ Name: lazyGetUVsForAssetType ]]
    -- upvalues: v25 (copy)
    if not v30.uVsForAssetType then
        v30.uVsForAssetType = v25(v30.allowedParts);
    end;
    return v30.uVsForAssetType;
end;
local function _(v32) --[[ Line: 110 ]] --[[ Name: lazyGetMainUVsForAssetType ]]
    -- upvalues: v25 (copy)
    if not v32.mainUVsForAssetType then
        v32.mainUVsForAssetType = v25(v32.mainParts);
    end;
    return v32.mainUVsForAssetType;
end;
v14.validateExcludedModifiedUVs = function(v34, v35, v36, v37, v38) --[[ Line: 121 ]] --[[ Name: validateExcludedModifiedUVs ]]
    -- upvalues: v15 (copy), v29 (copy), v5 (copy), l_UGCValidationService_0 (copy), v19 (copy), v2 (copy), v10 (copy), v9 (copy)
    local v39 = assert(v15[v38.assetTypeEnum], "bodyArea should be defined");
    local v40 = v29(v39);
    if #v40 == 0 then
        return true;
    else
        local v41, v42, v43, v44 = v5(function() --[[ Line: 136 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v40 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy)
            return l_UGCValidationService_0:CalculateEditableMeshNumModifiedCageUVsInSet(v40, v34.editableMesh, v35, v36.editableMesh, v37);
        end, v38);
        if not v41 then
            return v19("Failed to execute excluded modified cage UV check. Make sure both cage meshes exists and try again.", v2.ErrorType.validateExcludedModifiedCageUVs_FailedToExecute, v38);
        else
            assert(v42 == #v40, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique");
            if v43 == 0 then
                return true;
            else
                local v45 = v44 / v43 * 100;
                if v10 < v45 then
                    v2.reportFailure(v2.ErrorType.validateExcludedModifiedCageUVs_UnexpectedUVValue, nil, v38);
                    return false, {
                        string.format("%d%% of modified cage UVs in WrapLayer CageMesh (outer mesh) are outside the expected region of the body. For a %s no more than %d%% of the modified UVs can be outside the %s area. Move your asset to the correct area of the body.", math.floor(v45), v38.assetTypeEnum.Name, v10, v9.keysToString(v39.allowedParts, "/"))
                    };
                else
                    return true;
                end;
            end;
        end;
    end;
end;
v14.validateMainModifiedUVs = function(v46, v47, v48, v49, v50) --[[ Line: 190 ]] --[[ Name: validateMainModifiedUVs ]]
    -- upvalues: v15 (copy), v25 (copy), v5 (copy), l_UGCValidationService_0 (copy), v19 (copy), v2 (copy), v11 (copy), v9 (copy)
    local v51 = assert(v15[v50.assetTypeEnum], "bodyArea should be defined");
    if not v51.mainUVsForAssetType then
        v51.mainUVsForAssetType = v25(v51.mainParts);
    end;
    local l_mainUVsForAssetType_0 = v51.mainUVsForAssetType;
    if #l_mainUVsForAssetType_0 == 0 then
        return true;
    else
        local v53, v54, _, v56 = v5(function() --[[ Line: 205 ]]
            -- upvalues: l_UGCValidationService_0 (ref), l_mainUVsForAssetType_0 (copy), v46 (copy), v47 (copy), v48 (copy), v49 (copy)
            return l_UGCValidationService_0:CalculateEditableMeshNumModifiedCageUVsInSet(l_mainUVsForAssetType_0, v46.editableMesh, v47, v48.editableMesh, v49);
        end, v50);
        if not v53 then
            return v19("Failed to execute main modified cage UV check. Make sure both cage meshes exists and try again.", v2.ErrorType.validateMainModifiedCageUVs_FailedToExecute, v50);
        else
            assert(v54 == #l_mainUVsForAssetType_0, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique");
            local v57 = v56 / v54 * 100;
            if not (v11 <= v57) then
                v2.reportFailure(v2.ErrorType.validateMainModifiedCageUVs_TooFewModifiedUVsFound, nil, v50);
                return false, {
                    string.format("The WrapLayer CageMesh (outer mesh) for a %s must modify %d%% of the cage UVs in the %s area. Currently only %d%% are modified. Move your asset to the correct area of the body.", v50.assetTypeEnum.Name, v11, v9.keysToString(v51.mainParts, "/"), (math.floor(v57)))
                };
            else
                return true;
            end;
        end;
    end;
end;
v14.validateRenderMeshInsideModifiedOuterCageArea = function(v58, v59, v60, v61, v62, v63) --[[ Line: 251 ]] --[[ Name: validateRenderMeshInsideModifiedOuterCageArea ]]
    -- upvalues: v15 (copy), v25 (copy), v5 (copy), l_UGCValidationService_0 (copy), v7 (copy), v19 (copy), v2 (copy), v13 (copy), v8 (copy), v12 (copy), v9 (copy)
    local v64 = assert(v15[v63.assetTypeEnum], "bodyArea should be defined");
    if not v64.uVsForAssetType then
        v64.uVsForAssetType = v25(v64.allowedParts);
    end;
    local l_uVsForAssetType_0 = v64.uVsForAssetType;
    if #l_uVsForAssetType_0 == 0 then
        return true;
    else
        local v66, v67, v68 = v5(function() --[[ Line: 267 ]]
            -- upvalues: l_UGCValidationService_0 (ref), l_uVsForAssetType_0 (copy), v59 (copy), v60 (copy), v61 (copy), v62 (copy)
            return l_UGCValidationService_0:CalculateEditableMeshModifiedCageBoundingBox(l_uVsForAssetType_0, v59.editableMesh, v60, v61.editableMesh, v62);
        end, v63);
        local v69 = nil;
        if v66 then
            local v70 = nil;
            local v71 = nil;
            local v72, v73, v74 = v7(v58, v63);
            v66 = v72;
            v70 = v73;
            v71 = v74;
            if v66 then
                if v71 and #v71 > 0 then
                    v69 = v71;
                else
                    v66 = false;
                end;
            end;
        end;
        if not v66 then
            return v19("Failed to execute testing render mesh inside bounding box of outer cage modified area. Make sure both cage meshes and render mesh exist and try again.", v2.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute, v63);
        else
            v68 = v68 * v13;
            local v75 = 0;
            for _, v77 in v69 do
                if v8.pointInAxisAlignedBounds(v77, v67, v68) then
                    v75 = v75 + 1;
                end;
            end;
            local v78 = v75 / #v69 * 100;
            if not (v12 <= v78) then
                v2.reportFailure(v2.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly, nil, v63);
                local v79 = v9.keysToString(v64.allowedParts, "/");
                return false, {
                    string.format("Only %d%% of the render mesh verts are situated in the modified %s area of the WrapLayer CageMesh (outer mesh). %d%% is required. Move the render mesh to be within the modified %s area of the WrapLayer CageMesh (outer mesh).", math.floor(v78), v79, v12, v79)
                };
            else
                return true;
            end;
        end;
    end;
end;
v14.validate = function(v80, v81, v82, v83, v84, v85) --[[ Line: 330 ]] --[[ Name: validate ]]
    -- upvalues: v15 (copy), v6 (copy), v14 (copy)
    local v86 = if v85.assetTypeEnum then v15[v85.assetTypeEnum] else nil;
    if not v86 then
        return true;
    else
        assert(v86.allowedParts, "bodyArea.allowedParts should be defined");
        assert(v86.mainParts, "bodyArea.mainParts should be defined");
        local v87 = v6.new();
        v87:updateReasons(v14.validateExcludedModifiedUVs(v80, v81, v82, v83, v85));
        v87:updateReasons(v14.validateMainModifiedUVs(v80, v81, v82, v83, v85));
        v87:updateReasons(v14.validateRenderMeshInsideModifiedOuterCageArea(v84, v80, v81, v82, v83, v85));
        return v87:getFinalResults();
    end;
end;
return v14;