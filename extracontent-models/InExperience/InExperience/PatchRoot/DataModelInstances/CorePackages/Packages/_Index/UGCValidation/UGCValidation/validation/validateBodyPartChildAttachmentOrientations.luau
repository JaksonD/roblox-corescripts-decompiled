local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.util.getDiffBetweenOrientations);
local v5 = require(l_Parent_0.util.floatEquals);
local v6 = require(l_Parent_0.util.valueToString);
local v7 = require(l_Parent_0.util.R15plusUtils);
local v8 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v9 = {};
game:DefineFastInt("UGCValidationAttRotLimitRootAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitFaceFrontAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitHatAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitHairAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitFaceCenterAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitRightFootAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitLeftFootAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitBodyFrontAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitBodyBackAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitLeftCollarAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitRightCollarAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitNeckAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitWaistCenterAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitWaistFrontAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitWaistBackAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitLeftShoulderAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitLeftGripAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitRightShoulderAttachment", 30);
game:DefineFastInt("UGCValidationAttRotLimitRightGripAttachment", 30);
local v10 = {
    RootAttachment = function() --[[ Line: 45 ]] --[[ Name: RootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRootAttachment");
    end, 
    FaceFrontAttachment = function() --[[ Line: 48 ]] --[[ Name: FaceFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitFaceFrontAttachment");
    end, 
    HatAttachment = function() --[[ Line: 51 ]] --[[ Name: HatAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitHatAttachment");
    end, 
    HairAttachment = function() --[[ Line: 54 ]] --[[ Name: HairAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitHairAttachment");
    end, 
    FaceCenterAttachment = function() --[[ Line: 57 ]] --[[ Name: FaceCenterAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitFaceCenterAttachment");
    end, 
    RightFootAttachment = function() --[[ Line: 60 ]] --[[ Name: RightFootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightFootAttachment");
    end, 
    LeftFootAttachment = function() --[[ Line: 63 ]] --[[ Name: LeftFootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftFootAttachment");
    end, 
    BodyFrontAttachment = function() --[[ Line: 66 ]] --[[ Name: BodyFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitBodyFrontAttachment");
    end, 
    BodyBackAttachment = function() --[[ Line: 69 ]] --[[ Name: BodyBackAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitBodyBackAttachment");
    end, 
    LeftCollarAttachment = function() --[[ Line: 72 ]] --[[ Name: LeftCollarAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftCollarAttachment");
    end, 
    RightCollarAttachment = function() --[[ Line: 75 ]] --[[ Name: RightCollarAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightCollarAttachment");
    end, 
    NeckAttachment = function() --[[ Line: 78 ]] --[[ Name: NeckAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitNeckAttachment");
    end, 
    WaistCenterAttachment = function() --[[ Line: 81 ]] --[[ Name: WaistCenterAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistCenterAttachment");
    end, 
    WaistFrontAttachment = function() --[[ Line: 84 ]] --[[ Name: WaistFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistFrontAttachment");
    end, 
    WaistBackAttachment = function() --[[ Line: 87 ]] --[[ Name: WaistBackAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistBackAttachment");
    end, 
    LeftShoulderAttachment = function() --[[ Line: 90 ]] --[[ Name: LeftShoulderAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftShoulderAttachment");
    end, 
    LeftGripAttachment = function() --[[ Line: 93 ]] --[[ Name: LeftGripAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftGripAttachment");
    end, 
    RightShoulderAttachment = function() --[[ Line: 96 ]] --[[ Name: RightShoulderAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightShoulderAttachment");
    end, 
    RightGripAttachment = function() --[[ Line: 99 ]] --[[ Name: RightGripAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightGripAttachment");
    end
};
local v11 = CFrame.new(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -1, 0))) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0);
v9.expectedGripAttCFrameRotation = function(v12, v13) --[[ Line: 108 ]] --[[ Name: expectedGripAttCFrameRotation ]]
    -- upvalues: v7 (copy), v8 (copy), v11 (copy)
    local v14 = true;
    if v13 ~= Enum.AssetType.RightArm then
        v14 = v13 == Enum.AssetType.LeftArm;
    end;
    assert(v14);
    local v15 = v13 == Enum.AssetType.RightArm and "Right" or "Left";
    v14 = v12:FindFirstChild(v15 .. "LowerArm");
    local l_v12_FirstChild_0 = v12:FindFirstChild(v15 .. "Hand");
    assert(v14);
    assert(l_v12_FirstChild_0);
    local l_v14_FirstChild_0 = v14:FindFirstChild(v15 .. "ElbowRigAttachment", v7.checkFlagEnabledForAllowHrd());
    local l_v14_FirstChild_1 = v14:FindFirstChild(v15 .. "WristRigAttachment", v7.checkFlagEnabledForAllowHrd());
    local l_l_v12_FirstChild_0_FirstChild_0 = l_v12_FirstChild_0:FindFirstChild(v15 .. "WristRigAttachment", v7.checkFlagEnabledForAllowHrd());
    local l_l_v12_FirstChild_0_FirstChild_1 = l_v12_FirstChild_0:FindFirstChild(v15 .. "GripAttachment", v7.checkFlagEnabledForAllowHrd());
    assert(l_v14_FirstChild_0);
    assert(l_v14_FirstChild_1);
    assert(l_l_v12_FirstChild_0_FirstChild_0);
    assert(l_l_v12_FirstChild_0_FirstChild_1);
    local v21 = v8(l_l_v12_FirstChild_0_FirstChild_0);
    local v22 = v21 * v8(l_v14_FirstChild_1):Inverse() * v8(l_v14_FirstChild_0);
    local v23 = v21.Position - v22.Position;
    local v24 = 1.5707963267948966 - math.acos(Vector3.new(v23.X, math.max(0, -v23.Y), 0).Unit.X);
    return CFrame.fromEulerAnglesXYZ(0, 0, v24) * v11.Rotation;
end;
v9.runValidation = function(v25, v26) --[[ Line: 161 ]] --[[ Name: runValidation ]]
    -- upvalues: v3 (copy), v8 (copy), v5 (copy), v1 (copy), v10 (copy), v9 (copy), v4 (copy), v6 (copy)
    local v27 = v3.new();
    for _, v29 in (v25:GetDescendants()) do
        if v29.ClassName == "Attachment" then
            local v30 = string.sub(v29.Name, -13) == "RigAttachment";
            local v31 = string.sub(v29.Name, -14) == "GripAttachment";
            if v30 then
                local v32, v33, v34 = v8(v29):ToOrientation();
                if not v5(v32, 0) or not v5(v33, 0) or not v5(v34, 0) then
                    v1.reportFailure(v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedRig, nil, v26);
                    v27:updateReasons(false, {
                        string.format("Rig attachments cannot be rotated, please set %s's orientation to (0,0,0)", v29:GetFullName())
                    });
                end;
            elseif v10[v29.Name] ~= nil then
                local v35 = CFrame.new();
                if v31 then
                    assert(v26.assetTypeEnum);
                    v35 = v9.expectedGripAttCFrameRotation(v25, v26.assetTypeEnum);
                end;
                if v4(v35, v8(v29)) > v10[v29.Name]() then
                    v1.reportFailure(v31 and v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedGrip or v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedBasic, nil, v26);
                    local v36 = Vector3.new(v35:ToOrientation());
                    v36 = Vector3.new(math.deg(v36.X), math.deg(v36.Y), (math.deg(v36.Z)));
                    v27:updateReasons(false, {
                        string.format("Attachment %s's orientation deviates too far from expectation, which will make attached accessories look unaligned. Recommended orientation is %s, and you can deviate up to %d degrees", v29:GetFullName(), v6(v36), v10[v29.Name]())
                    });
                end;
            end;
        end;
    end;
    return v27:getFinalResults();
end;
return v9;