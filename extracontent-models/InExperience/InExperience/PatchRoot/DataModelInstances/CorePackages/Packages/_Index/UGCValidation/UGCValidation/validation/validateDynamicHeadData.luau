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
local v16 = nil;
v16 = if v15() then {
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
local function v21(v17, v18, v19) --[[ Line: 77 ]] --[[ Name: downloadFailure ]]
    -- upvalues: v2 (copy)
    local v20 = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", v18);
    if v17 then
        error(v20);
    end;
    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, v19);
    return false, {
        v20
    };
end;
local function v31(v22, v23) --[[ Line: 104 ]] --[[ Name: validateFacialBounds ]]
    -- upvalues: v13 (copy), v11 (copy), v14 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    local l_isServer_0 = v23.isServer;
    local v28, v29 = v13(function() --[[ Line: 110 ]]
        -- upvalues: v11 (ref), v22 (copy), v23 (copy), v14 (ref), l_UGCValidationService_0 (ref), v8 (ref)
        local v25 = v11(v22, v23);
        local v26, v27 = v14(v22, "MeshId", v23);
        if not v26 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialBounds(v27, v8, v25);
    end, v23);
    if not v28 then
        local v30 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v22:GetFullName());
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v30);
        end;
        return false, {
            v30
        };
    elseif not v29 then
        return false, {
            string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v22:GetFullName())
        };
    else
        return true;
    end;
end;
local function v41(v32, v33) --[[ Line: 144 ]] --[[ Name: validateFacialExpressiveness ]]
    -- upvalues: v13 (copy), v11 (copy), v14 (copy), l_UGCValidationService_0 (copy), v10 (copy), v9 (copy)
    local l_isServer_1 = v33.isServer;
    local v38, v39 = v13(function() --[[ Line: 150 ]]
        -- upvalues: v11 (ref), v32 (copy), v33 (copy), v14 (ref), l_UGCValidationService_0 (ref), v10 (ref)
        local v35 = v11(v32, v33);
        local v36, v37 = v14(v32, "MeshId", v33);
        if not v36 then
            error("Failed to retrieve MeshContent");
        end;
        return l_UGCValidationService_0:ValidateEditableMeshFacialExpressiveness(v37, v10, v35);
    end, v33);
    if not v38 then
        local v40 = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", v32:GetFullName());
        if l_isServer_1 ~= nil and l_isServer_1 then
            error(v40);
        end;
        return false, {
            v40
        };
    elseif v39 < v9 then
        return false, {
            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v32:GetFullName(), v39, v9)
        };
    else
        return true;
    end;
end;
return function(v42, v43) --[[ Line: 186 ]] --[[ Name: validateDynamicHeadData ]]
    -- upvalues: v6 (copy), v14 (copy), l_UGCValidationService_0 (copy), v21 (copy), v2 (copy), v3 (copy), v7 (copy), v16 (ref), v41 (copy), v31 (copy), v5 (copy), v4 (copy)
    local v44 = tick();
    if not v6() then
        return true;
    else
        local l_isServer_2 = v43.isServer;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 198 ]]
            -- upvalues: v14 (ref), v42 (copy), v43 (copy), l_UGCValidationService_0 (ref)
            local v46, v47 = v14(v42, "MeshId", v43);
            if not v46 then
                error("Failed to retrieve MeshContent");
            end;
            return l_UGCValidationService_0:ValidateDynamicHeadEditableMesh(v47);
        end);
        if not l_status_0 then
            return v21(l_isServer_2, v42.Name, v43);
        elseif not l_result_0 then
            v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, v43);
            return false, {
                string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", v42.Name)
            };
        else
            l_status_0 = v3.new();
            if v7() then
                local v50, v51;
                l_result_0, v50, v51 = pcall(function() --[[ Line: 230 ]]
                    -- upvalues: v14 (ref), v42 (copy), v43 (copy), l_UGCValidationService_0 (ref), v16 (ref)
                    local v52, v53 = v14(v42, "MeshId", v43);
                    if not v52 then
                        error("Failed to retrieve MeshContent");
                    end;
                    return l_UGCValidationService_0:GetDynamicHeadEditableMeshInactiveControls(v53, v16);
                end);
                if not l_result_0 then
                    if string.find(v50, "Download Error") == 1 then
                        return v21(l_isServer_2, v42.Name, v43);
                    else
                        assert(false, v50);
                    end;
                end;
                local v54 = #v50 == 0;
                local v55 = #v51 == 0;
                if not v54 or not v55 then
                    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, v43);
                    l_status_0:updateReasons(v54, {
                        (("%*.MeshId (%*) is missing FACS controls: %*"):format(v42.Name, v42.MeshId, (table.concat(v50, ", "))))
                    });
                    l_status_0:updateReasons(v55, {
                        (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v42.Name, v42.MeshId, (table.concat(v51, ", "))))
                    });
                end;
            end;
            l_status_0:updateReasons(v41(v42, v43));
            l_status_0:updateReasons(v31(v42, v43));
            if v5() then
                l_status_0:updateReasons(v4(v42, v43));
            end;
            v2.recordScriptTime(script.Name, v44, v43);
            return l_status_0:getFinalResults();
        end;
    end;
end;