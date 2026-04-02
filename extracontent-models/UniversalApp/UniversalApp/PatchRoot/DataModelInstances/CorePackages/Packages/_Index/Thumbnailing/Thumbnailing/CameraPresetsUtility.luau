local v0 = require(script.Parent.CameraUtility);
local v1 = require(script.Parent.CFrameUtility);
local v2 = require(script.Parent.CharacterUtility);
local v3 = require(script.Parent.MannequinUtility);
local v4 = game:DefineFastInt("CameraPresetHeadshotExtentScaleHundredths", 130);
local v5 = {
    GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000, 
    UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100, 
    AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23)
};
local function _(v6) --[[ Line: 18 ]] --[[ Name: getTorsoOrUpperTorso ]]
    return v6:FindFirstChild("Torso") or v6:FindFirstChild("UpperTorso");
end;
local function v15(v8, v9) --[[ Line: 22 ]] --[[ Name: getMannequinBodyParts ]]
    -- upvalues: v3 (copy)
    local v10 = {};
    if v9.RigType == Enum.HumanoidRigType.R6 then
        for v11, _ in v3.CharacterPartNames.R6 do
            if v11 ~= "CharacterMesh" and v11 ~= "HumanoidRootPart" then
                table.insert(v10, (v8:FindFirstChild(v11)));
            end;
        end;
        return v10;
    else
        if v9.RigType == Enum.HumanoidRigType.R15 then
            for v13, _ in v3.CharacterPartNames.R15 do
                if v13 ~= "HumanoidRootPart" then
                    table.insert(v10, (v8:FindFirstChild(v13)));
                end;
            end;
        end;
        return v10;
    end;
end;
v5.GetCharacterTorsoCFrame = function(v16) --[[ Line: 43 ]]
    return (v16:FindFirstChild("Torso") or v16:FindFirstChild("UpperTorso")).CFrame;
end;
v5.GetFullBodyCameraCFrame = function(v17, v18, v19, v20, v21) --[[ Line: 61 ]]
    -- upvalues: v5 (copy), v15 (copy), v2 (copy), v0 (copy)
    local v22 = v20 or 56;
    local v23 = v21 or v5.GetCharacterTorsoCFrame(v17);
    local l_LookVector_0 = v23.LookVector;
    if type(v18) == "function" then
        v18();
    end;
    local l_Humanoid_0 = v17:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        local v26 = v15(v17, l_Humanoid_0);
        local l_CFrame_0 = (v17:FindFirstChild("Torso") or v17:FindFirstChild("UpperTorso")).CFrame;
        local l_UpVector_0 = l_CFrame_0.UpVector;
        local v29 = nil;
        local v30 = nil;
        local v31 = nil;
        local v32, v33, v34 = v17:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ();
        v29 = v32;
        v30 = v33;
        v31 = v34;
        if v19 then
            v17:PivotTo(v23 * CFrame.Angles(0, math.rad(v5.AVATAR_ROTATION_DEGREE * -1), 0));
        end;
        v32, v33 = v2.CalculateBodyPartsExtents(l_CFrame_0, v26);
        v34 = math.tan((math.rad(v22 / 2)));
        local v35 = v32:Lerp(v33, v5.GOLDEN_RATIO);
        local v36 = v32:Lerp(v33, 0.5);
        local v37 = Vector3.new(v36.X, v35.Y, v36.Z);
        local v38 = l_CFrame_0:PointToWorldSpace(v37);
        local v39 = l_CFrame_0 - l_CFrame_0.Position + v38;
        if not v19 then
            local v40 = CFrame.fromEulerAnglesXYZ(v29, v30, v31);
            v39 = v40 - v40.Position + v38;
        end;
        local v41 = math.max(v37.X - v32.X, v37.Y - v32.Y);
        local v42 = math.max(v33.X - v37.X, v33.Y - v37.Y);
        local v43 = v41 * v0.DefaultBodyMarginScale / v34;
        local v44 = v42 * v0.DefaultBodyMarginScale / v34;
        local l_v43_0 = v43;
        local v46 = l_UpVector_0.Y < v5.UPVECTOR_ORENTATION_TRESHOLD;
        local v47 = l_UpVector_0.X < v5.UPVECTOR_ORENTATION_TRESHOLD;
        if v46 or v47 then
            l_v43_0 = math.max(v43, v44);
        end;
        local v48 = l_v43_0 * v0.DistanceScaleForFullBody * l_LookVector_0;
        return v0.GetCameraCFrame(v39, v48);
    end;
end;
v5.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = v5.GetFullBodyCameraCFrame;
v5.GetHeadshotCameraCFrame = function(v49, v50, v51, v52) --[[ Line: 163 ]] --[[ Name: GetHeadshotCameraCFrame ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy), v0 (copy), v4 (copy)
    local v53 = v52 or 30;
    if type(v50) == "function" then
        v50();
    end;
    if v51 then
        v49:PivotTo(v5.GetCharacterTorsoCFrame(v49) * CFrame.Angles(0, math.rad(v5.AVATAR_ROTATION_DEGREE * -1), 0));
    end;
    local l_Head_0 = v49:FindFirstChild("Head");
    if not l_Head_0 then
        error("Character is missing a Head, cannot apply upper body camera preset.");
    end;
    local l_CFrame_1 = l_Head_0.CFrame;
    local l_FaceFrontAttachment_0 = l_Head_0:FindFirstChild("FaceFrontAttachment");
    if l_FaceFrontAttachment_0 then
        l_CFrame_1 = l_FaceFrontAttachment_0.WorldCFrame;
    end;
    local v57 = v1.CalculateTargetCFrame(l_CFrame_1);
    local v58, v59 = v2.CalculateHeadExtents(v49, v57);
    local v60 = v0.CreateThumbnailCamera();
    local v61 = {
        extentScale = v4 / 100, 
        maxExtent = v59, 
        minExtent = v58, 
        optCameraXRot = v0.XRotForCloseup, 
        optFieldOfView = v53, 
        targetCFrame = v57
    };
    v0.SetupCamera(v60, v61);
end;
return v5;