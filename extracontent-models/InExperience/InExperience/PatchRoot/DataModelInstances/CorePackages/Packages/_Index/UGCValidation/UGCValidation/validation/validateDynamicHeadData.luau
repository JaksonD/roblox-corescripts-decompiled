local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.validation.validateFacsJointBounds);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds);
local v6 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100;
local v7 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100;
local v8 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100;
local v9 = require(l_Parent_0.util.getExpectedPartSize);
local _ = require(l_Parent_0.util.Types);
local v11 = require(l_Parent_0.util.pcallDeferred);
local v12 = require(l_Parent_0.util.getEditableMeshFromContext);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidationUpdateHeadIsDynamic);
local v14 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs);
local v15 = nil;
v15 = if v13() then {
    "LeftEyeClosed", 
    "EyesLookDown", 
    "RightEyeClosed", 
    "JawDrop", 
    "Pucker", 
    "LeftLipCornerPuller", 
    "RightLipCornerPuller", 
    "ChinRaiser", 
    "ChinRaiserUpperLip", 
    "LeftCheekRaiser", 
    "RightCheekRaiser", 
    "LeftInnerBrowRaiser", 
    "RightInnerBrowRaiser", 
    "LeftLipCornerDown", 
    "RightLipCornerDown", 
    "LeftLowerLipDepressor", 
    "RightLowerLipDepressor"
} else {
    "LipsTogether", 
    "Pucker", 
    "LeftLipStretcher", 
    "RightLipStretcher", 
    "LeftLipCornerPuller", 
    "RightLipCornerPuller", 
    "LeftUpperLipRaiser", 
    "RightUpperLipRaiser", 
    "LeftLowerLipDepressor", 
    "RightLowerLipDepressor", 
    "JawDrop", 
    "LeftEyeClosed", 
    "RightEyeClosed", 
    "EyesLookRight", 
    "EyesLookLeft", 
    "EyesLookUp", 
    "EyesLookDown"
};
local function v20(v16, v17, v18) --[[ Line: 75 ]] --[[ Name: downloadFailure ]]
    -- upvalues: v2 (copy)
    local v19 = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", v17);
    if v16 then
        error(v19);
    end;
    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, v18);
    return false, {
        v19
    };
end;
local function v30(v21, v22) --[[ Line: 102 ]] --[[ Name: validateFacialBounds ]]
    -- upvalues: v11 (copy), v9 (copy), v12 (copy), l_UGCValidationService_0 (copy), v6 (copy)
    local l_isServer_0 = v22.isServer;
    local v27, v28 = v11(function() --[[ Line: 108 ]]
        -- upvalues: v9 (ref), v21 (copy), v22 (copy), v12 (ref), l_UGCValidationService_0 (ref), v6 (ref)
        local v24 = v9(v21, v22);
        local v25, v26 = v12(v21, "MeshId", v22);
        if not v25 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialBounds(v26, v6, v24);
    end, v22);
    if not v27 then
        local v29 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v21:GetFullName());
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v29);
        end;
        return false, {
            v29
        };
    elseif not v28 then
        return false, {
            string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v21:GetFullName())
        };
    else
        return true;
    end;
end;
local function v40(v31, v32) --[[ Line: 142 ]] --[[ Name: validateFacialExpressiveness ]]
    -- upvalues: v11 (copy), v9 (copy), v12 (copy), l_UGCValidationService_0 (copy), v8 (copy), v7 (copy)
    local l_isServer_1 = v32.isServer;
    local v37, v38 = v11(function() --[[ Line: 148 ]]
        -- upvalues: v9 (ref), v31 (copy), v32 (copy), v12 (ref), l_UGCValidationService_0 (ref), v8 (ref)
        local v34 = v9(v31, v32);
        local v35, v36 = v12(v31, "MeshId", v32);
        if not v35 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialExpressiveness(v36, v8, v34);
    end, v32);
    if not v37 then
        local v39 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v31:GetFullName());
        if l_isServer_1 ~= nil and l_isServer_1 then
            error(v39);
        end;
        return false, {
            v39
        };
    elseif v38 < v7 then
        return false, {
            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v31:GetFullName(), v38, v7)
        };
    else
        return true;
    end;
end;
return function(v41, v42) --[[ Line: 184 ]] --[[ Name: validateDynamicHeadData ]]
    -- upvalues: v12 (copy), l_UGCValidationService_0 (copy), v20 (copy), v2 (copy), v3 (copy), v15 (ref), v40 (copy), v14 (copy), v30 (copy), v5 (copy), v4 (copy)
    local v43 = tick();
    local l_isServer_2 = v42.isServer;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 192 ]]
        -- upvalues: v12 (ref), v41 (copy), v42 (copy), l_UGCValidationService_0 (ref)
        local v45, v46 = v12(v41, "MeshId", v42);
        if not v45 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateDynamicHeadEditableMesh(v46);
    end);
    if not l_status_0 then
        return v20(l_isServer_2, v41.Name, v42);
    elseif not l_result_0 then
        v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, v42);
        return false, {
            string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", v41.Name)
        };
    else
        l_status_0 = v3.new();
        local v49, v50;
        l_result_0, v49, v50 = pcall(function() --[[ Line: 223 ]]
            -- upvalues: v12 (ref), v41 (copy), v42 (copy), l_UGCValidationService_0 (ref), v15 (ref)
            local v51, v52 = v12(v41, "MeshId", v42);
            if not v51 then
                error("Failed to retrieve MeshContent");
            end;
            return l_UGCValidationService_0:GetDynamicHeadEditableMeshInactiveControls(v52, v15);
        end);
        if not l_result_0 then
            if string.find(v49, "Download Error") == 1 then
                return v20(l_isServer_2, v41.Name, v42);
            else
                assert(false, v49);
            end;
        end;
        local v53 = #v49 == 0;
        local v54 = #v50 == 0;
        if not v53 or not v54 then
            v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, v42);
            l_status_0:updateReasons(v53, {
                (("%*.MeshId (%*) is missing FACS controls: %*"):format(v41.Name, v41.MeshId, (table.concat(v49, ", "))))
            });
            l_status_0:updateReasons(v54, {
                (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v41.Name, v41.MeshId, (table.concat(v50, ", "))))
            });
        end;
        l_status_0:updateReasons(v40(v41, v42));
        if not v14() then
            l_status_0:updateReasons(v30(v41, v42));
        end;
        if v5() then
            l_status_0:updateReasons(v4(v41, v42));
        end;
        v2.recordScriptTime(script.Name, v43, v42);
        return l_status_0:getFinalResults();
    end;
end;