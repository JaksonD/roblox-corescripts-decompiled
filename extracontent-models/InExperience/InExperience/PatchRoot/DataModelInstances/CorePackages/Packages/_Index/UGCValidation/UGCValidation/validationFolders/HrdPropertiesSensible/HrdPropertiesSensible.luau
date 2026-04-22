local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.util.ValidationRulesUtil);
local v5 = require(l_Parent_0.util.getAllInstancesIsA);
local v6 = require(l_Parent_0.util.R15plusUtils);
local v7 = require(l_Parent_0.util.Vector3Utils);
local v8 = require(l_Parent_0.util.valueToString);
local v9 = require(l_Parent_0.util.CFrameUtils);
local v10 = {
    categories = {
        v2.UploadCategory.TORSO_AND_LIMBS, 
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = v6.checkFlagEnabledForAllowHrd
};
local v11 = game:DefineFastInt("UGCValidationHrdJointSizeHundredthsLimit", 150) / 100;
local v12 = game:DefineFastInt("UGCValidationHrdJointRangeMinXHundredths", 0);
local v13 = game:DefineFastInt("UGCValidationHrdJointRangeMaxXHundredths", 0);
local v14 = game:DefineFastInt("UGCValidationHrdJointRangeMinYHundredths", 0);
local v15 = game:DefineFastInt("UGCValidationHrdJointRangeMaxYHundredths", 0);
local v16 = game:DefineFastInt("UGCValidationHrdJointRangeMinZHundredths", 0);
local v17 = game:DefineFastInt("UGCValidationHrdJointRangeMaxZHundredths", 0);
local v18 = game:DefineFastInt("UGCValidationHrdOriginOffsetMinYHundredths", -500);
local v19 = game:DefineFastInt("UGCValidationHrdOriginOffsetMaxYHundredths", 500);
local v20 = Vector3.new(v12 / 100, v14 / 100, v16 / 100);
local v21 = Vector3.new(v13 / 100, v15 / 100, v17 / 100);
local v22 = Vector3.new(0, v18 / 100, 0);
local v23 = Vector3.new(0, v19 / 100, 0);
local v24 = game:DefineFastInt("UGCValidationDrdJointSizeHundredthsLimit", 150) / 100;
local v25 = game:DefineFastInt("UGCValidationDrdJointRangeMinXHundredths", 0);
local v26 = game:DefineFastInt("UGCValidationDrdJointRangeMaxXHundredths", 0);
local v27 = game:DefineFastInt("UGCValidationDrdJointRangeMinYHundredths", 0);
local v28 = game:DefineFastInt("UGCValidationDrdJointRangeMaxYHundredths", 0);
local v29 = game:DefineFastInt("UGCValidationDrdJointRangeMinZHundredths", 0);
local v30 = game:DefineFastInt("UGCValidationDrdJointRangeMaxZHundredths", 0);
local v31 = Vector3.new(v25 / 100, v27 / 100, v29 / 100);
local v32 = Vector3.new(v26 / 100, v28 / 100, v30 / 100);
local function v39(v33, v34, v35, v36, v37, v38) --[[ Line: 45 ]] --[[ Name: checkVectorRange ]]
    -- upvalues: v7 (copy), v3 (copy), v8 (copy)
    if not v7.isInRange(v36, v37, v38) then
        v33:fail(v3.Keys.HrdProperties_PropertyOutOfRange, {
            jointName = v34, 
            propertyName = v35, 
            currentValue = v8(v36), 
            valueMin = v8(v37), 
            valueMax = v8(v38)
        });
    end;
end;
local function v45(v40, v41, v42, v43, v44) --[[ Line: 64 ]] --[[ Name: checkSize ]]
    -- upvalues: v3 (copy), v8 (copy)
    if v43 < 0 or v44 < v43 then
        v40:fail(v3.Keys.HrdProperties_PropertyOutOfRange, {
            jointName = v41, 
            propertyName = v42, 
            currentValue = v8(v43), 
            valueMin = "0", 
            valueMax = v8(v44)
        });
    end;
end;
v10.run = function(v46, v47) --[[ Line: 82 ]]
    -- upvalues: v5 (copy), v4 (copy), v9 (copy), v7 (copy), v22 (copy), v23 (copy), v3 (copy), v8 (copy), v6 (copy), v45 (copy), v11 (copy), v39 (copy), v20 (copy), v21 (copy), v24 (copy), v31 (copy), v32 (copy)
    local l_rootInstance_0 = v47.rootInstance;
    for _, v50 in v5(l_rootInstance_0, "MeshPart") do
        local l_HumanoidRigDescription_0 = v50:FindFirstChildWhichIsA("HumanoidRigDescription");
        local v52 = v4.rigAttachmentToParentMap[v50.Name];
        if l_HumanoidRigDescription_0 ~= nil then
            local l_OriginOffset_0 = l_HumanoidRigDescription_0.OriginOffset;
            if v50.Name == "LowerTorso" then
                if not v9.fuzzyEq(l_OriginOffset_0.Rotation, CFrame.identity) or not v7.isInRange(l_OriginOffset_0.Position, v22, v23) then
                    v46:fail(v3.Keys.HrdProperties_OriginOutsideBounds, {
                        valueMin = v8(v22), 
                        valueMax = v8(v23)
                    });
                end;
            elseif not v9.fuzzyEq(l_OriginOffset_0, CFrame.identity) then
                v46:fail(v3.Keys.HrdProperties_UncontainedJoint, {
                    jointName = "originOffset", 
                    foundMeshName = v50.Name
                });
            end;
            local l_l_HumanoidRigDescription_0_ContainedJointLabels_0 = l_HumanoidRigDescription_0:GetContainedJointLabels(v50.Name);
            for _, v56 in v6.getHrdJointLabels() do
                local v57 = ("%*RigAttachment"):format(v56.Name) == v52;
                local l_l_HumanoidRigDescription_0_Joint_0 = l_HumanoidRigDescription_0:GetJoint(v56);
                if v57 and (not l_l_HumanoidRigDescription_0_Joint_0 or l_l_HumanoidRigDescription_0_Joint_0.Name ~= v52 or l_l_HumanoidRigDescription_0_Joint_0.ClassName ~= "Attachment") then
                    v46:fail(v3.Keys.HrdMissingStandardJoint, {
                        jointName = v56.Name
                    });
                end;
                if l_l_HumanoidRigDescription_0_Joint_0 then
                    if not table.find(l_l_HumanoidRigDescription_0_ContainedJointLabels_0, v56) then
                        v46:fail(v3.Keys.HrdProperties_UncontainedJoint, {
                            jointName = v56.Name, 
                            foundMeshName = v50.Name
                        });
                    else
                        if not v57 and (l_l_HumanoidRigDescription_0_Joint_0.Name ~= v56.Name or l_l_HumanoidRigDescription_0_Joint_0.ClassName ~= "Bone") then
                            v46:fail(v3.Keys.HrdImproperJointMapping, {
                                jointName = v56.Name, 
                                boneName = v56.Name
                            });
                        end;
                        local l_l_HumanoidRigDescription_0_JointSize_0 = l_HumanoidRigDescription_0:GetJointSize(v56);
                        local l_l_HumanoidRigDescription_0_JointRangeMin_0 = l_HumanoidRigDescription_0:GetJointRangeMin(v56);
                        local l_l_HumanoidRigDescription_0_JointRangeMax_0 = l_HumanoidRigDescription_0:GetJointRangeMax(v56);
                        v45(v46, v56.Name, "size", l_l_HumanoidRigDescription_0_JointSize_0, v11);
                        v39(v46, v56.Name, "rangeMin", l_l_HumanoidRigDescription_0_JointRangeMin_0, v20, v21);
                        v39(v46, v56.Name, "rangeMax", l_l_HumanoidRigDescription_0_JointRangeMax_0, v20, v21);
                        if not v7.isFirstLessOrEqual(l_l_HumanoidRigDescription_0_JointRangeMin_0, l_l_HumanoidRigDescription_0_JointRangeMax_0) then
                            v46:fail(v3.Keys.HrdProperties_MinAboveMax, {
                                jointName = v56.Name
                            });
                        end;
                    end;
                end;
            end;
            local l_DigitsRigDescription_0 = v50:FindFirstChildWhichIsA("DigitsRigDescription");
            if l_DigitsRigDescription_0 ~= nil then
                if (v50.Name ~= "LeftHand" or l_DigitsRigDescription_0.Side ~= Enum.DigitsRigDescriptionSide.Left) and (v50.Name ~= "RightHand" or l_DigitsRigDescription_0.Side ~= Enum.DigitsRigDescriptionSide.Right) then
                    local v63 = "None";
                    if v50.Name == "LeftHand" then
                        v63 = "Left";
                    elseif v50.Name == "RightHand" then
                        v63 = "Right";
                    end;
                    v46:fail(v3.Keys.HrdCheck_DrdInvalidSide, {
                        partName = v50.Name, 
                        expectedSide = v63, 
                        foundSide = l_DigitsRigDescription_0.Side.Name
                    });
                end;
                v45(v46, "Index", "size", l_DigitsRigDescription_0.IndexSize, v24);
                v45(v46, "Thumb", "size", l_DigitsRigDescription_0.ThumbSize, v24);
                v45(v46, "Middle", "size", l_DigitsRigDescription_0.MiddleSize, v24);
                v45(v46, "Pinky", "size", l_DigitsRigDescription_0.PinkySize, v24);
                v45(v46, "Ring", "size", l_DigitsRigDescription_0.RingSize, v24);
                v39(v46, "Index", "range", l_DigitsRigDescription_0.IndexRange, v31, v32);
                v39(v46, "Thumb", "range", l_DigitsRigDescription_0.ThumbRange, v31, v32);
                v39(v46, "Pinky", "range", l_DigitsRigDescription_0.PinkyRange, v31, v32);
                v39(v46, "Ring", "range", l_DigitsRigDescription_0.RingRange, v31, v32);
                v39(v46, "Middle", "range", l_DigitsRigDescription_0.MiddleRange, v31, v32);
            end;
        end;
    end;
end;
return v10;