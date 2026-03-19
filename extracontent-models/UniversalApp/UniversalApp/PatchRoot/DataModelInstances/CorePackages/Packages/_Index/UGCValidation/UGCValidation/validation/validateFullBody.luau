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
local _ = function(v17, v18) --[[ Line: 28 ]] --[[ Name: getInstance ]]
    for _, v20 in v17 do
        if v20.Name == v18 then
            return v20;
        end;
    end;
    return nil;
end;
local function v33(v22, v23, v24) --[[ Line: 39 ]] --[[ Name: validateAllAssetsWithSchema ]]
    -- upvalues: v9 (copy), v7 (copy), v13 (copy), v14 (copy)
    local v25 = false;
    for _, v27 in v22 do
        if Enum.AssetType.DynamicHead == v27.assetTypeEnum then
            if not v9(v27.allSelectedInstances, v24) then
                return false;
            elseif not v7(v13(v24), v27.allSelectedInstances[1], v24).success then
                return false;
            end;
        else
            for _, v29 in v23 do
                local v30;
                for _, v32 in v27.allSelectedInstances do
                    if v32.Name == v29 then
                        v30 = v32;
                        v25 = true;
                    end;
                    if v25 then
                        break;
                    end;
                end;
                if not v25 then
                    v30 = nil;
                end;
                v25 = false;
                if not v30 then
                    return false;
                elseif not v7(v14(v27.assetTypeEnum, v29, v24), v30, v24).success then
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v40(v34) --[[ Line: 78 ]] --[[ Name: validateCorrectAssetTypesExist ]]
    -- upvalues: v3 (copy)
    local v35 = {};
    local v36 = #v3.getBodyPartAssets();
    local v37 = 0;
    for _, v39 in v34 do
        if not v3.isBodyPart(v39.assetTypeEnum) then
            return false;
        elseif v35[v39.assetTypeEnum] then
            return false;
        else
            v35[v39.assetTypeEnum] = true;
            v37 = v37 + 1;
        end;
    end;
    return v37 == v36;
end;
local function v52(v41, v42) --[[ Line: 96 ]] --[[ Name: createAllBodyPartsTable ]]
    local v43 = false;
    local v44 = {};
    for _, v46 in v42 do
        if Enum.AssetType.DynamicHead == v46.assetTypeEnum then
            v44[v46.allSelectedInstances[1].Name] = v46.allSelectedInstances[1];
        else
            local v47;
            for _, v49 in v46.allSelectedInstances do
                if v49.Name == v41 then
                    v47 = v49;
                    v43 = true;
                end;
                if v43 then
                    break;
                end;
            end;
            if not v43 then
                v47 = nil;
            end;
            v43 = false;
            for _, v51 in v47:GetChildren() do
                v44[v51.Name] = v51;
            end;
        end;
    end;
    return v44;
end;
local function v61(v53, v54) --[[ Line: 111 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v16 (copy), v1 (copy)
    local v55 = {
        MeshPart = {
            "MeshId"
        }
    };
    local v56 = {
        MeshPart = {
            MeshId = true
        }
    };
    for _, v58 in v53 do
        for _, v60 in v58.allSelectedInstances do
            if not v16.parseWithErrorCheck({}, {}, v60, v55, v56, v54) then
                v1.reportFailure(v1.ErrorType.validateFullBody_MeshIdsMissing, nil, v54);
                return false, {
                    "Unable to run full body validation due to previous errors detected while processing individual body parts"
                };
            end;
        end;
    end;
    return true;
end;
local function v68(v62, v63, v64) --[[ Line: 148 ]] --[[ Name: validateInstanceHierarchy ]]
    -- upvalues: v40 (copy), v1 (copy), v33 (copy), v61 (copy)
    local v65 = if v64 then v64.isServer else nil;
    if not v40(v62) then
        v1.reportFailure(v1.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, v64);
        if v65 then
            error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.");
        end;
        return false, {
            "Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
        };
    elseif not v33(v62, v63, v64) then
        v1.reportFailure(v1.ErrorType.validateFullBody_InstancesMissing, nil, v64);
        return false, {
            "Unable to run full body validation due to previous errors detected while processing individual body parts."
        };
    else
        local v66, v67 = v61(v62, v64);
        if not v66 then
            return false, v67;
        else
            return true;
        end;
    end;
end;
local function v74(v69) --[[ Line: 182 ]] --[[ Name: resetAllPhysicsData ]]
    -- upvalues: v15 (copy)
    for _, v71 in v69.fullBodyData do
        local v72, v73 = v15(v71.allSelectedInstances, v69);
        if not v72 then
            return false, {
                v73
            };
        end;
    end;
    return true;
end;
return function(v75) --[[ Line: 195 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v2 (copy), v68 (copy), v74 (copy), v6 (copy), v52 (copy), v10 (copy), v1 (copy), v11 (copy), v8 (copy), v4 (copy), v12 (copy)
    assert(v75.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody");
    local l_fullBodyData_0 = v75.fullBodyData;
    local l_requireAllFolders_0 = v75.requireAllFolders;
    local v78 = {
        v2.FOLDER_NAMES.R15ArtistIntent
    };
    if l_requireAllFolders_0 then
        table.insert(v78, v2.FOLDER_NAMES.R15Fixed);
    end;
    local v79, v80 = v68(l_fullBodyData_0, v78, v75);
    if not v79 then
        return false, v80;
    else
        local v81, v82 = v74(v75);
        v79 = v81;
        v80 = v82;
        if not v79 then
            return false, v80;
        else
            v81 = v6.new();
            for _, v84 in v78 do
                local v85 = v52(v84, l_fullBodyData_0);
                assert(v85);
                if not v10.validateAll(v85, v75) then
                    v1.reportFailure(v1.ErrorType.validateFullBody_ZeroMeshSize, nil, v75);
                    return false, {
                        "Unable to run full body validation due to previous errors detected while processing individual body parts."
                    };
                else
                    v81:updateReasons(v11.validateFullBody(v85, v75));
                    v81:updateReasons(v8(v85, nil, v75));
                    if v4() then
                        v81:updateReasons(v12.validateFullBody(v85, v75));
                    end;
                end;
            end;
            return v81:getFinalResults();
        end;
    end;
end;