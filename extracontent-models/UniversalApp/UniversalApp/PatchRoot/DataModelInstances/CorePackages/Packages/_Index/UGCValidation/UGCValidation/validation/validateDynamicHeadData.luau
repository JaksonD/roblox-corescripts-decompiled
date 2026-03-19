local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.validation.validateFacsJointBounds);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateGetInactiveControls);
local v8 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100;
local v9 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100;
local v10 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100;
local v11 = require(l_Parent_0.util.getExpectedPartSize);
local _ = require(l_Parent_0.util.Types);
local v13 = require(l_Parent_0.util.pcallDeferred);
local v14 = require(l_Parent_0.util.getEditableMeshFromContext);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidationUpdateHeadIsDynamic);
local v16 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs);
local v17 = nil;
v17 = if v15() then {
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
local function v22(v18, v19, v20) --[[ Line: 78 ]] --[[ Name: downloadFailure ]]
    -- upvalues: v2 (copy)
    local v21 = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", v19);
    if v18 then
        error(v21);
    end;
    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, v20);
    return false, {
        v21
    };
end;
local function v32(v23, v24) --[[ Line: 105 ]] --[[ Name: validateFacialBounds ]]
    -- upvalues: v13 (copy), v11 (copy), v14 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    local l_isServer_0 = v24.isServer;
    local v29, v30 = v13(function() --[[ Line: 111 ]]
        -- upvalues: v11 (ref), v23 (copy), v24 (copy), v14 (ref), l_UGCValidationService_0 (ref), v8 (ref)
        local v26 = v11(v23, v24);
        local v27, v28 = v14(v23, "MeshId", v24);
        if not v27 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialBounds(v28, v8, v26);
    end, v24);
    if not v29 then
        local v31 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v23:GetFullName());
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v31);
        end;
        return false, {
            v31
        };
    elseif not v30 then
        return false, {
            string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v23:GetFullName())
        };
    else
        return true;
    end;
end;
local function v42(v33, v34) --[[ Line: 145 ]] --[[ Name: validateFacialExpressiveness ]]
    -- upvalues: v13 (copy), v11 (copy), v14 (copy), l_UGCValidationService_0 (copy), v10 (copy), v9 (copy)
    local l_isServer_1 = v34.isServer;
    local v39, v40 = v13(function() --[[ Line: 151 ]]
        -- upvalues: v11 (ref), v33 (copy), v34 (copy), v14 (ref), l_UGCValidationService_0 (ref), v10 (ref)
        local v36 = v11(v33, v34);
        local v37, v38 = v14(v33, "MeshId", v34);
        if not v37 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialExpressiveness(v38, v10, v36);
    end, v34);
    if not v39 then
        local v41 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v33:GetFullName());
        if l_isServer_1 ~= nil and l_isServer_1 then
            error(v41);
        end;
        return false, {
            v41
        };
    elseif v40 < v9 then
        return false, {
            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v33:GetFullName(), v40, v9)
        };
    else
        return true;
    end;
end;
return function(v43, v44) --[[ Line: 187 ]] --[[ Name: validateDynamicHeadData ]]
    -- upvalues: v6 (copy), v14 (copy), l_UGCValidationService_0 (copy), v22 (copy), v2 (copy), v3 (copy), v7 (copy), v17 (ref), v42 (copy), v16 (copy), v32 (copy), v5 (copy), v4 (copy)
    local v45 = tick();
    if not v6() then
        return true;
    else
        local l_isServer_2 = v44.isServer;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 199 ]]
            -- upvalues: v14 (ref), v43 (copy), v44 (copy), l_UGCValidationService_0 (ref)
            local v47, v48 = v14(v43, "MeshId", v44);
            if not v47 then
                error("Failed to retrieve MeshContent");
            end;
            return l_UGCValidationService_0:ValidateDynamicHeadEditableMesh(v48);
        end);
        if not l_status_0 then
            return v22(l_isServer_2, v43.Name, v44);
        elseif not l_result_0 then
            v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, v44);
            return false, {
                string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", v43.Name)
            };
        else
            l_status_0 = v3.new();
            if v7() then
                local v51, v52;
                l_result_0, v51, v52 = pcall(function() --[[ Line: 231 ]]
                    -- upvalues: v14 (ref), v43 (copy), v44 (copy), l_UGCValidationService_0 (ref), v17 (ref)
                    local v53, v54 = v14(v43, "MeshId", v44);
                    if not v53 then
                        error("Failed to retrieve MeshContent");
                    end;
                    return l_UGCValidationService_0:GetDynamicHeadEditableMeshInactiveControls(v54, v17);
                end);
                if not l_result_0 then
                    if string.find(v51, "Download Error") == 1 then
                        return v22(l_isServer_2, v43.Name, v44);
                    else
                        assert(false, v51);
                    end;
                end;
                local v55 = #v51 == 0;
                local v56 = #v52 == 0;
                if not v55 or not v56 then
                    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, v44);
                    l_status_0:updateReasons(v55, {
                        (("%*.MeshId (%*) is missing FACS controls: %*"):format(v43.Name, v43.MeshId, (table.concat(v51, ", "))))
                    });
                    l_status_0:updateReasons(v56, {
                        (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v43.Name, v43.MeshId, (table.concat(v52, ", "))))
                    });
                end;
            end;
            l_status_0:updateReasons(v42(v43, v44));
            if not v16() then
                l_status_0:updateReasons(v32(v43, v44));
            end;
            if v5() then
                l_status_0:updateReasons(v4(v43, v44));
            end;
            v2.recordScriptTime(script.Name, v45, v44);
            return l_status_0:getFinalResults();
        end;
    end;
end;