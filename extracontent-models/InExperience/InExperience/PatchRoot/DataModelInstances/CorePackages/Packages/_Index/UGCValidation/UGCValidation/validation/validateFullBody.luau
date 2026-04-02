local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateLegFullBodySeparation);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.validateWithSchema);
local v8 = require(l_Parent_0.validation.validateAssetBounds);
local v9 = require(l_Parent_0.validation.validateSingleInstance);
local v10 = require(l_Parent_0.util.ValidateBodyBlockingTests);
local v11 = require(l_Parent_0.validation.ValidateAssetBodyPartCages);
local v12 = require(l_Parent_0.validation.ValidateLegsSeparation);
local v13 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
local v14 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local v15 = require(l_Parent_0.util.resetPhysicsData);
local v16 = require(l_Parent_0.util.ParseContentIds);
local v17 = require(l_Parent_0.util.R15plusUtils);
local v18 = require(l_Parent_0.flags.getFFlagDebugAllowHRDUploadOnBundleBackend);
local _ = function(v19, v20) --[[ Line: 30 ]] --[[ Name: getInstance ]]
    for _, v22 in v19 do
        if v22.Name == v20 then
            return v22;
        end;
    end;
    return nil;
end;
local function v35(v24, v25, v26) --[[ Line: 41 ]] --[[ Name: validateAllAssetsWithSchema ]]
    -- upvalues: v9 (copy), v7 (copy), v13 (copy), v14 (copy)
    local v27 = false;
    for _, v29 in v24 do
        if Enum.AssetType.DynamicHead == v29.assetTypeEnum then
            if not v9(v29.allSelectedInstances, v26) then
                return false;
            elseif not v7(v13(v26), v29.allSelectedInstances[1], v26).success then
                return false;
            end;
        else
            for _, v31 in v25 do
                local v32;
                for _, v34 in v29.allSelectedInstances do
                    if v34.Name == v31 then
                        v32 = v34;
                        v27 = true;
                    end;
                    if v27 then
                        break;
                    end;
                end;
                if not v27 then
                    v32 = nil;
                end;
                v27 = false;
                if not v32 then
                    return false;
                elseif not v7(v14(v29.assetTypeEnum, v31, v26), v32, v26).success then
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v42(v36) --[[ Line: 80 ]] --[[ Name: validateCorrectAssetTypesExist ]]
    -- upvalues: v3 (copy)
    local v37 = {};
    local v38 = #v3.getBodyPartAssets();
    local v39 = 0;
    for _, v41 in v36 do
        if not v3.isBodyPart(v41.assetTypeEnum) then
            return false;
        elseif v37[v41.assetTypeEnum] then
            return false;
        else
            v37[v41.assetTypeEnum] = true;
            v39 = v39 + 1;
        end;
    end;
    return v39 == v38;
end;
local function v54(v43, v44) --[[ Line: 98 ]] --[[ Name: createAllBodyPartsTable ]]
    local v45 = false;
    local v46 = {};
    for _, v48 in v44 do
        if Enum.AssetType.DynamicHead == v48.assetTypeEnum then
            v46[v48.allSelectedInstances[1].Name] = v48.allSelectedInstances[1];
        else
            local v49;
            for _, v51 in v48.allSelectedInstances do
                if v51.Name == v43 then
                    v49 = v51;
                    v45 = true;
                end;
                if v45 then
                    break;
                end;
            end;
            if not v45 then
                v49 = nil;
            end;
            v45 = false;
            for _, v53 in v49:GetChildren() do
                v46[v53.Name] = v53;
            end;
        end;
    end;
    return v46;
end;
local function v63(v55, v56) --[[ Line: 113 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v16 (copy), v1 (copy)
    local v57 = {
        MeshPart = {
            "MeshId"
        }
    };
    local v58 = {
        MeshPart = {
            MeshId = true
        }
    };
    for _, v60 in v55 do
        for _, v62 in v60.allSelectedInstances do
            if not v16.parseWithErrorCheck({}, {}, v62, v57, v58, v56) then
                v1.reportFailure(v1.ErrorType.validateFullBody_MeshIdsMissing, nil, v56);
                return false, {
                    "Unable to run full body validation due to previous errors detected while processing individual body parts"
                };
            end;
        end;
    end;
    return true;
end;
local function v70(v64, v65, v66) --[[ Line: 150 ]] --[[ Name: validateInstanceHierarchy ]]
    -- upvalues: v42 (copy), v1 (copy), v35 (copy), v63 (copy)
    local v67 = if v66 then v66.isServer else nil;
    if not v42(v64) then
        v1.reportFailure(v1.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, v66);
        if v67 then
            error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.");
        end;
        return false, {
            "Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
        };
    elseif not v35(v64, v65, v66) then
        v1.reportFailure(v1.ErrorType.validateFullBody_InstancesMissing, nil, v66);
        return false, {
            "Unable to run full body validation due to previous errors detected while processing individual body parts."
        };
    else
        local v68, v69 = v63(v64, v66);
        if not v68 then
            return false, v69;
        else
            return true;
        end;
    end;
end;
local function v76(v71) --[[ Line: 184 ]] --[[ Name: resetAllPhysicsData ]]
    -- upvalues: v15 (copy)
    for _, v73 in v71.fullBodyData do
        local v74, v75 = v15(v73.allSelectedInstances, v71);
        if not v74 then
            return false, {
                v75
            };
        end;
    end;
    return true;
end;
return function(v77) --[[ Line: 197 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v18 (copy), v17 (copy), v2 (copy), v70 (copy), v76 (copy), v6 (copy), v54 (copy), v10 (copy), v1 (copy), v11 (copy), v8 (copy), v4 (copy), v12 (copy)
    assert(v77.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody");
    local l_fullBodyData_0 = v77.fullBodyData;
    local l_requireAllFolders_0 = v77.requireAllFolders;
    if v18() then
        v17.setIsBackendBundleUpload(v77.isBackendBundleUpload == true);
    end;
    local v80 = {
        v2.FOLDER_NAMES.R15ArtistIntent
    };
    if l_requireAllFolders_0 then
        table.insert(v80, v2.FOLDER_NAMES.R15Fixed);
    end;
    local v81, v82 = v70(l_fullBodyData_0, v80, v77);
    if not v81 then
        if v18() then
            v17.setIsBackendBundleUpload(false);
        end;
        return false, v82;
    else
        local v83, v84 = v76(v77);
        v81 = v83;
        v82 = v84;
        if not v81 then
            if v18() then
                v17.setIsBackendBundleUpload(false);
            end;
            return false, v82;
        else
            v83 = v6.new();
            for _, v86 in v80 do
                local v87 = v54(v86, l_fullBodyData_0);
                assert(v87);
                if not v10.validateAll(v87, v77) then
                    v1.reportFailure(v1.ErrorType.validateFullBody_ZeroMeshSize, nil, v77);
                    if v18() then
                        v17.setIsBackendBundleUpload(false);
                    end;
                    return false, {
                        "Unable to run full body validation due to previous errors detected while processing individual body parts."
                    };
                else
                    v83:updateReasons(v11.validateFullBody(v87, v77));
                    v83:updateReasons(v8(v87, nil, v77));
                    if v4() then
                        v83:updateReasons(v12.validateFullBody(v87, v77));
                    end;
                end;
            end;
            if v18() then
                v17.setIsBackendBundleUpload(false);
            end;
            return v83:getFinalResults();
        end;
    end;
end;