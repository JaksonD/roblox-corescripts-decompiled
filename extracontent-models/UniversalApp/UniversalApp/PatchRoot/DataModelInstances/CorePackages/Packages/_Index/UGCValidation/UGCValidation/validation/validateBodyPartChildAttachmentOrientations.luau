local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.util.getDiffBetweenOrientations);
local v5 = require(l_Parent_0.util.floatEquals);
local v6 = require(l_Parent_0.util.valueToString);
local v7 = {};
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
local v8 = {
    RootAttachment = function() --[[ Line: 43 ]] --[[ Name: RootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRootAttachment");
    end, 
    FaceFrontAttachment = function() --[[ Line: 46 ]] --[[ Name: FaceFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitFaceFrontAttachment");
    end, 
    HatAttachment = function() --[[ Line: 49 ]] --[[ Name: HatAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitHatAttachment");
    end, 
    HairAttachment = function() --[[ Line: 52 ]] --[[ Name: HairAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitHairAttachment");
    end, 
    FaceCenterAttachment = function() --[[ Line: 55 ]] --[[ Name: FaceCenterAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitFaceCenterAttachment");
    end, 
    RightFootAttachment = function() --[[ Line: 58 ]] --[[ Name: RightFootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightFootAttachment");
    end, 
    LeftFootAttachment = function() --[[ Line: 61 ]] --[[ Name: LeftFootAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftFootAttachment");
    end, 
    BodyFrontAttachment = function() --[[ Line: 64 ]] --[[ Name: BodyFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitBodyFrontAttachment");
    end, 
    BodyBackAttachment = function() --[[ Line: 67 ]] --[[ Name: BodyBackAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitBodyBackAttachment");
    end, 
    LeftCollarAttachment = function() --[[ Line: 70 ]] --[[ Name: LeftCollarAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftCollarAttachment");
    end, 
    RightCollarAttachment = function() --[[ Line: 73 ]] --[[ Name: RightCollarAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightCollarAttachment");
    end, 
    NeckAttachment = function() --[[ Line: 76 ]] --[[ Name: NeckAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitNeckAttachment");
    end, 
    WaistCenterAttachment = function() --[[ Line: 79 ]] --[[ Name: WaistCenterAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistCenterAttachment");
    end, 
    WaistFrontAttachment = function() --[[ Line: 82 ]] --[[ Name: WaistFrontAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistFrontAttachment");
    end, 
    WaistBackAttachment = function() --[[ Line: 85 ]] --[[ Name: WaistBackAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitWaistBackAttachment");
    end, 
    LeftShoulderAttachment = function() --[[ Line: 88 ]] --[[ Name: LeftShoulderAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftShoulderAttachment");
    end, 
    LeftGripAttachment = function() --[[ Line: 91 ]] --[[ Name: LeftGripAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitLeftGripAttachment");
    end, 
    RightShoulderAttachment = function() --[[ Line: 94 ]] --[[ Name: RightShoulderAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightShoulderAttachment");
    end, 
    RightGripAttachment = function() --[[ Line: 97 ]] --[[ Name: RightGripAttachment ]]
        return game:GetFastInt("UGCValidationAttRotLimitRightGripAttachment");
    end
};
local v9 = CFrame.new(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -1, 0))) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0);
v7.expectedGripAttCFrameRotation = function(v10, v11) --[[ Line: 106 ]] --[[ Name: expectedGripAttCFrameRotation ]]
    -- upvalues: v9 (copy)
    local v12 = true;
    if v11 ~= Enum.AssetType.RightArm then
        v12 = v11 == Enum.AssetType.LeftArm;
    end;
    assert(v12);
    local v13 = v11 == Enum.AssetType.RightArm and "Right" or "Left";
    v12 = v10:FindFirstChild(v13 .. "LowerArm");
    local l_v10_FirstChild_0 = v10:FindFirstChild(v13 .. "Hand");
    assert(v12);
    assert(l_v10_FirstChild_0);
    local l_v12_FirstChild_0 = v12:FindFirstChild(v13 .. "ElbowRigAttachment");
    local l_v12_FirstChild_1 = v12:FindFirstChild(v13 .. "WristRigAttachment");
    local l_l_v10_FirstChild_0_FirstChild_0 = l_v10_FirstChild_0:FindFirstChild(v13 .. "WristRigAttachment");
    local l_l_v10_FirstChild_0_FirstChild_1 = l_v10_FirstChild_0:FindFirstChild(v13 .. "GripAttachment");
    assert(l_v12_FirstChild_0);
    assert(l_v12_FirstChild_1);
    assert(l_l_v10_FirstChild_0_FirstChild_0);
    assert(l_l_v10_FirstChild_0_FirstChild_1);
    local l_CFrame_0 = l_l_v10_FirstChild_0_FirstChild_0.CFrame;
    local v20 = l_CFrame_0 * l_v12_FirstChild_1.CFrame:Inverse() * l_v12_FirstChild_0.CFrame;
    local v21 = l_CFrame_0.Position - v20.Position;
    local v22 = 1.5707963267948966 - math.acos(Vector3.new(v21.X, math.max(0, -v21.Y), 0).Unit.X);
    return CFrame.fromEulerAnglesXYZ(0, 0, v22) * v9.Rotation;
end;
v7.runValidation = function(v23, v24) --[[ Line: 150 ]] --[[ Name: runValidation ]]
    -- upvalues: v3 (copy), v5 (copy), v1 (copy), v8 (copy), v7 (copy), v4 (copy), v6 (copy)
    local v25 = v3.new();
    for _, v27 in (v23:GetDescendants()) do
        if v27.ClassName == "Attachment" then
            local v28 = string.sub(v27.Name, -13) == "RigAttachment";
            local v29 = string.sub(v27.Name, -14) == "GripAttachment";
            if v28 then
                local v30, v31, v32 = v27.CFrame:ToOrientation();
                if not v5(v30, 0) or not v5(v31, 0) or not v5(v32, 0) then
                    v1.reportFailure(v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedRig, nil, v24);
                    v25:updateReasons(false, {
                        string.format("Rig attachments cannot be rotated, please set %s's orientation to (0,0,0)", v27:GetFullName())
                    });
                end;
            elseif v8[v27.Name] ~= nil then
                local v33 = CFrame.new();
                if v29 then
                    assert(v24.assetTypeEnum);
                    v33 = v7.expectedGripAttCFrameRotation(v23, v24.assetTypeEnum);
                end;
                if v4(v33, v27.CFrame) > v8[v27.Name]() then
                    v1.reportFailure(v29 and v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedGrip or v1.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedBasic, nil, v24);
                    local v34 = Vector3.new(v33:ToOrientation());
                    v34 = Vector3.new(math.deg(v34.X), math.deg(v34.Y), (math.deg(v34.Z)));
                    v25:updateReasons(false, {
                        string.format("Attachment %s's orientation deviates too far from expectation, which will make attached accessories look unaligned. Recommended orientation is %s, and you can deviate up to %d degrees", v27:GetFullName(), v6(v34), v8[v27.Name]())
                    });
                end;
            end;
        end;
    end;
    return v25:getFinalResults();
end;
return v7;