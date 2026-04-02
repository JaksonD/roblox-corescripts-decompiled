local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.getAllInstancesIsA);
local v5 = require(l_Parent_0.util.R15plusUtils);
local v6 = require(l_Parent_0.util.Vector3Utils);
local v7 = require(l_Parent_0.util.valueToString);
local v8 = require(l_Parent_0.util.CFrameUtils);
local v9 = {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = v5.checkFlagEnabledForAllowHrd
};
local v10 = game:DefineFastInt("UGCValidationHrdDrdJointSizeHundredthsLimit", 150);
local v11 = game:DefineFastInt("UGCValidationHrdJointRangeMinXHundredths", 0);
local v12 = game:DefineFastInt("UGCValidationHrdJointRangeMaxXHundredths", 0);
local v13 = game:DefineFastInt("UGCValidationHrdJointRangeMinYHundredths", 0);
local v14 = game:DefineFastInt("UGCValidationHrdJointRangeMaxYHundredths", 0);
local v15 = game:DefineFastInt("UGCValidationHrdJointRangeMinZHundredths", 0);
local v16 = game:DefineFastInt("UGCValidationHrdJointRangeMaxZHundredths", 0);
local v17 = game:DefineFastInt("UGCValidationHrdOriginOffsetMinYHundredths", -500);
local v18 = game:DefineFastInt("UGCValidationHrdOriginOffsetMaxYHundredths", 500);
local v19 = Vector3.new(v11 / 100, v13 / 100, v15 / 100);
local v20 = Vector3.new(v12 / 100, v14 / 100, v16 / 100);
local v21 = Vector3.new(0, v17 / 100, 0);
local v22 = Vector3.new(0, v18 / 100, 0);
v9.run = function(v23, v24) --[[ Line: 32 ]]
    -- upvalues: v4 (copy), v8 (copy), v6 (copy), v21 (copy), v22 (copy), v3 (copy), v7 (copy), v5 (copy), v10 (copy), v19 (copy), v20 (copy)
    local l_rootInstance_0 = v24.rootInstance;
    for _, v27 in v4(l_rootInstance_0, "MeshPart") do
        local l_HumanoidRigDescription_0 = v27:FindFirstChildWhichIsA("HumanoidRigDescription");
        if l_HumanoidRigDescription_0 ~= nil then
            local l_OriginOffset_0 = l_HumanoidRigDescription_0.OriginOffset;
            if v27.Name == "LowerTorso" then
                if not v8.fuzzyEq(l_OriginOffset_0.Rotation, CFrame.identity) or not v6.isInRange(l_OriginOffset_0.Position, v21, v22) then
                    v23:fail(v3.Keys.HrdProperties_OriginOutsideBounds, {
                        valueMin = v7(v21), 
                        valueMax = v7(v22)
                    });
                end;
            elseif not v8.fuzzyEq(l_OriginOffset_0, CFrame.identity) then
                v23:fail(v3.Keys.HrdProperties_UncontainedJoint, {
                    jointName = "originOffset", 
                    foundMeshName = v27.Name
                });
            end;
            local l_l_HumanoidRigDescription_0_ContainedJointLabels_0 = l_HumanoidRigDescription_0:GetContainedJointLabels(v27.Name);
            for _, v32 in v5.getHrdJointLabels() do
                if l_HumanoidRigDescription_0:GetJoint(v32) then
                    if not table.find(l_l_HumanoidRigDescription_0_ContainedJointLabels_0, v32) then
                        v23:fail(v3.Keys.HrdProperties_UncontainedJoint, {
                            jointName = v32.Name, 
                            foundMeshName = v27.Name
                        });
                    else
                        local l_l_HumanoidRigDescription_0_JointSize_0 = l_HumanoidRigDescription_0:GetJointSize(v32);
                        local l_l_HumanoidRigDescription_0_JointRangeMin_0 = l_HumanoidRigDescription_0:GetJointRangeMin(v32);
                        local l_l_HumanoidRigDescription_0_JointRangeMax_0 = l_HumanoidRigDescription_0:GetJointRangeMax(v32);
                        local v36 = v10 / 100;
                        if l_l_HumanoidRigDescription_0_JointSize_0 < 0 or v36 < l_l_HumanoidRigDescription_0_JointSize_0 then
                            v23:fail(v3.Keys.HrdProperties_PropertyOutOfRange, {
                                jointName = v32.Name, 
                                propertyName = "size", 
                                currentValue = l_l_HumanoidRigDescription_0_JointSize_0, 
                                valueMin = v7(0), 
                                valueMax = v7(v36)
                            });
                        end;
                        if not v6.isInRange(l_l_HumanoidRigDescription_0_JointRangeMin_0, v19, v20) then
                            v23:fail(v3.Keys.HrdProperties_PropertyOutOfRange, {
                                jointName = v32.Name, 
                                propertyName = "rangeMin", 
                                currentValue = l_l_HumanoidRigDescription_0_JointRangeMin_0, 
                                valueMin = v7(v19), 
                                valueMax = v7(v20)
                            });
                        end;
                        if not v6.isInRange(l_l_HumanoidRigDescription_0_JointRangeMax_0, v19, v20) then
                            v23:fail(v3.Keys.HrdProperties_PropertyOutOfRange, {
                                jointName = v32.Name, 
                                propertyName = "rangeMax", 
                                currentValue = l_l_HumanoidRigDescription_0_JointRangeMax_0, 
                                valueMin = v7(v19), 
                                valueMax = v7(v20)
                            });
                        end;
                        if not v6.isFirstLessOrEqual(l_l_HumanoidRigDescription_0_JointRangeMin_0, l_l_HumanoidRigDescription_0_JointRangeMax_0) then
                            v23:fail(v3.Keys.HrdProperties_MinAboveMax, {
                                jointName = v32.Name
                            });
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return v9;