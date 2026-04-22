local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getAllInstancesIsA);
local v5 = require(l_Parent_0.util.Vector3Utils);
local v6 = require(l_Parent_0.util.valueToString);
local v7 = require(l_Parent_0.util.CFrameUtils);
local v8 = require(l_Parent_0.util.getDiffBetweenOrientations);
local v9 = {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance, 
        v2.SharedDataMember.renderMeshesData
    }, 
    fflag = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTPoseAdjustment)
};
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v11 = game:DefineFastInt("UGCValidationTposeShoulderDegreeOffsetThreshold", 30);
local v12 = game:DefineFastInt("UGCValidationTposeElbowDegreeOffsetThreshold", 30);
local v13 = game:DefineFastInt("UGCValidationTposeWristDegreeOffsetThreshold", 30);
local v14 = game:DefineFastInt("UGCValidationTposeClavicleDegreeOffsetThreshold", 30);
local v15 = game:DefineFastInt("UGCValidationTposeFingerDegreeOffsetThreshold", 30);
local v16 = game:DefineFastInt("UGCValidationTposeGeneralDegreeOffsetThreshold", 30);
local v17 = game:DefineFastInt("UGCValidationTposePositionOffsetPercentThreshold", 40) / 100;
local v18 = {
    [Enum.RigLabel.LeftShoulder] = v11, 
    [Enum.RigLabel.RightShoulder] = v11, 
    [Enum.RigLabel.LeftElbow] = v12, 
    [Enum.RigLabel.RightElbow] = v12, 
    [Enum.RigLabel.LeftWrist] = v13, 
    [Enum.RigLabel.RightWrist] = v13, 
    [Enum.RigLabel.LeftClavicle] = v14, 
    [Enum.RigLabel.RightClavicle] = v14
};
local function v26(v19, v20, v21, v22, v23, v24) --[[ Line: 42 ]] --[[ Name: checkJointTposeAdjustment ]]
    -- upvalues: l_UGCValidationService_0 (copy), v8 (copy), v3 (copy), v7 (copy), v5 (copy), v6 (copy)
    local l_l_UGCValidationService_0_ExpectedTposeRotation_0 = l_UGCValidationService_0:GetExpectedTposeRotation(v20, v22);
    if v24 < v8(v21.Rotation, l_l_UGCValidationService_0_ExpectedTposeRotation_0) then
        v19:fail(v3.Keys.HrdTposeRotation, {
            jointName = v20.Name, 
            degLimit = v24, 
            expectedOrientation = v7.getRotationString(l_l_UGCValidationService_0_ExpectedTposeRotation_0)
        });
    end;
    if not v5.isInRange(v21.Position, v23 * -1, v23) then
        v19:fail(v3.Keys.HrdTposePosition, {
            jointName = v20.Name, 
            offsetLimit = v6(v23)
        });
    end;
end;
v9.run = function(v27, v28) --[[ Line: 69 ]]
    -- upvalues: v4 (copy), v17 (copy), v26 (copy), v18 (copy), v16 (copy), v15 (copy)
    local l_rootInstance_0 = v28.rootInstance;
    for _, v31 in v4(l_rootInstance_0, "MeshPart") do
        local l_HumanoidRigDescription_0 = v31:FindFirstChildWhichIsA("HumanoidRigDescription");
        if l_HumanoidRigDescription_0 ~= nil then
            local v33 = v28.renderMeshesData[v31.Name];
            local v34 = v33.originalSize * v33.scale * v17;
            for _, v36 in (l_HumanoidRigDescription_0:GetContainedJointLabels(v31.Name)) do
                if l_HumanoidRigDescription_0:GetJoint(v36) then
                    v26(v27, v36, l_HumanoidRigDescription_0:GetTposeAdjustment(v36), l_rootInstance_0, v34, v18[v36] or v16);
                end;
            end;
            local l_DigitsRigDescription_0 = v31:FindFirstChildWhichIsA("DigitsRigDescription");
            if l_DigitsRigDescription_0 ~= nil then
                for _, v39 in l_DigitsRigDescription_0:GetJointLabels() do
                    if l_DigitsRigDescription_0:GetJoint(v39) then
                        v26(v27, v39, l_DigitsRigDescription_0:GetTposeAdjustment(v39), l_rootInstance_0, v34, v18[v39] or v15);
                    end;
                end;
            end;
        end;
    end;
end;
return v9;