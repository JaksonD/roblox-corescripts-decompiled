local v0 = require(script.Parent.CameraUtility);
local v1 = require(script.Parent.CFrameUtility);
local v2 = require(script.Parent.CharacterUtility);
local v3 = require(script.Parent.MannequinUtility);
local v4 = game:DefineFastFlag("UseFaceFrontRotationForEmote", false);
local v5 = game:DefineFastInt("CameraPresetHeadshotExtentScaleHundredths", 130);
local v6 = {
    GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000, 
    UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100, 
    AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23)
};
local function _(v7) --[[ Line: 21 ]] --[[ Name: getTorsoOrUpperTorso ]]
    return v7:FindFirstChild("Torso") or v7:FindFirstChild("UpperTorso");
end;
local function v16(v9, v10) --[[ Line: 25 ]] --[[ Name: getMannequinBodyParts ]]
    -- upvalues: v3 (copy)
    local v11 = {};
    if v10.RigType == Enum.HumanoidRigType.R6 then
        for v12, _ in v3.CharacterPartNames.R6 do
            if v12 ~= "CharacterMesh" and v12 ~= "HumanoidRootPart" then
                table.insert(v11, (v9:FindFirstChild(v12)));
            end;
        end;
        return v11;
    else
        if v10.RigType == Enum.HumanoidRigType.R15 then
            for v14, _ in v3.CharacterPartNames.R15 do
                if v14 ~= "HumanoidRootPart" then
                    table.insert(v11, (v9:FindFirstChild(v14)));
                end;
            end;
        end;
        return v11;
    end;
end;
v6.GetCharacterTorsoCFrame = function(v17) --[[ Line: 46 ]]
    return (v17:FindFirstChild("Torso") or v17:FindFirstChild("UpperTorso")).CFrame;
end;
v6.GetFullBodyCameraCFrame = function(v18, v19, v20, v21, v22) --[[ Line: 64 ]]
    -- upvalues: v6 (copy), v16 (copy), v4 (copy), v2 (copy), v0 (copy)
    local v23 = v21 or 56;
    local v24 = v22 or v6.GetCharacterTorsoCFrame(v18);
    local l_LookVector_0 = v24.LookVector;
    if type(v19) == "function" then
        v19();
    end;
    local l_Humanoid_0 = v18:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        local v27 = v16(v18, l_Humanoid_0);
        local l_CFrame_0 = (v18:FindFirstChild("Torso") or v18:FindFirstChild("UpperTorso")).CFrame;
        local l_UpVector_0 = l_CFrame_0.UpVector;
        local v30 = nil;
        local v31 = nil;
        local v32 = nil;
        if v4 then
            local v33, v34, v35 = v18:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ();
            v30 = v33;
            v31 = v34;
            v32 = v35;
        end;
        if v20 then
            v18:PivotTo(v24 * CFrame.Angles(0, math.rad(v6.AVATAR_ROTATION_DEGREE * -1), 0));
        end;
        local v36, v37 = v2.CalculateBodyPartsExtents(l_CFrame_0, v27);
        local v38 = math.tan((math.rad(v23 / 2)));
        local v39 = v36:Lerp(v37, v6.GOLDEN_RATIO);
        local v40 = v36:Lerp(v37, 0.5);
        local v41 = Vector3.new(v40.X, v39.Y, v40.Z);
        local v42 = l_CFrame_0:PointToWorldSpace(v41);
        local v43 = l_CFrame_0 - l_CFrame_0.Position + v42;
        if v4 and not v20 then
            local v44 = CFrame.fromEulerAnglesXYZ(v30, v31, v32);
            v43 = v44 - v44.Position + v42;
        end;
        local v45 = math.max(v41.X - v36.X, v41.Y - v36.Y);
        local v46 = math.max(v37.X - v41.X, v37.Y - v41.Y);
        local v47 = v45 * v0.DefaultBodyMarginScale / v38;
        local v48 = v46 * v0.DefaultBodyMarginScale / v38;
        local l_v47_0 = v47;
        local v50 = l_UpVector_0.Y < v6.UPVECTOR_ORENTATION_TRESHOLD;
        local v51 = l_UpVector_0.X < v6.UPVECTOR_ORENTATION_TRESHOLD;
        if v50 or v51 then
            l_v47_0 = math.max(v47, v48);
        end;
        local v52 = l_v47_0 * v0.DistanceScaleForFullBody * l_LookVector_0;
        return v0.GetCameraCFrame(v43, v52);
    end;
end;
v6.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = v6.GetFullBodyCameraCFrame;
v6.GetHeadshotCameraCFrame = function(v53, v54, v55, v56) --[[ Line: 168 ]] --[[ Name: GetHeadshotCameraCFrame ]]
    -- upvalues: v6 (copy), v1 (copy), v2 (copy), v0 (copy), v5 (copy)
    local v57 = v56 or 30;
    if type(v54) == "function" then
        v54();
    end;
    if v55 then
        v53:PivotTo(v6.GetCharacterTorsoCFrame(v53) * CFrame.Angles(0, math.rad(v6.AVATAR_ROTATION_DEGREE * -1), 0));
    end;
    local l_Head_0 = v53:FindFirstChild("Head");
    if not l_Head_0 then
        error("Character is missing a Head, cannot apply upper body camera preset.");
    end;
    local l_CFrame_1 = l_Head_0.CFrame;
    local l_FaceFrontAttachment_0 = l_Head_0:FindFirstChild("FaceFrontAttachment");
    if l_FaceFrontAttachment_0 then
        l_CFrame_1 = l_FaceFrontAttachment_0.WorldCFrame;
    end;
    local v61 = v1.CalculateTargetCFrame(l_CFrame_1);
    local v62, v63 = v2.CalculateHeadExtents(v53, v61);
    local v64 = v0.CreateThumbnailCamera();
    local v65 = {
        extentScale = v5 / 100, 
        maxExtent = v63, 
        minExtent = v62, 
        optCameraXRot = v0.XRotForCloseup, 
        optFieldOfView = v57, 
        targetCFrame = v61
    };
    v0.SetupCamera(v64, v65);
end;
return v6;