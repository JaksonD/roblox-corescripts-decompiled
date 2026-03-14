local v0 = require(script.Parent.CameraUtility);
local v1 = require(script.Parent.CharacterUtility);
local v2 = require(script.Parent.MannequinUtility);
local v3 = game:DefineFastFlag("UseFaceFrontRotationForEmote", false);
local v4 = {
    GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000, 
    UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100, 
    AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23)
};
local function _(v5) --[[ Line: 19 ]] --[[ Name: getTorsoOrUpperTorso ]]
    return v5:FindFirstChild("Torso") or v5:FindFirstChild("UpperTorso");
end;
local function v14(v7, v8) --[[ Line: 23 ]] --[[ Name: getMannequinBodyParts ]]
    -- upvalues: v2 (copy)
    local v9 = {};
    if v8.RigType == Enum.HumanoidRigType.R6 then
        for v10, _ in v2.CharacterPartNames.R6 do
            if v10 ~= "CharacterMesh" and v10 ~= "HumanoidRootPart" then
                table.insert(v9, (v7:FindFirstChild(v10)));
            end;
        end;
        return v9;
    else
        if v8.RigType == Enum.HumanoidRigType.R15 then
            for v12, _ in v2.CharacterPartNames.R15 do
                if v12 ~= "HumanoidRootPart" then
                    table.insert(v9, (v7:FindFirstChild(v12)));
                end;
            end;
        end;
        return v9;
    end;
end;
v4.GetCharacterTorsoCFrame = function(v15) --[[ Line: 44 ]]
    return (v15:FindFirstChild("Torso") or v15:FindFirstChild("UpperTorso")).CFrame;
end;
v4.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = function(v16, v17, v18, v19, v20) --[[ Line: 61 ]]
    -- upvalues: v4 (copy), v14 (copy), v3 (copy), v1 (copy), v0 (copy)
    local v21 = v19 or 56;
    local v22 = v20 or v4.GetCharacterTorsoCFrame(v16);
    local l_LookVector_0 = v22.LookVector;
    if type(v17) == "function" then
        v17();
    end;
    local l_Humanoid_0 = v16:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        local v25 = v14(v16, l_Humanoid_0);
        local l_CFrame_0 = (v16:FindFirstChild("Torso") or v16:FindFirstChild("UpperTorso")).CFrame;
        local l_UpVector_0 = l_CFrame_0.UpVector;
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if v3 then
            local v31, v32, v33 = v16:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ();
            v28 = v31;
            v29 = v32;
            v30 = v33;
        end;
        if v18 then
            v16:PivotTo(v22 * CFrame.Angles(0, math.rad(v4.AVATAR_ROTATION_DEGREE * -1), 0));
        end;
        local v34, v35 = v1.CalculateBodyPartsExtents(l_CFrame_0, v25);
        local v36 = math.tan((math.rad(v21 / 2)));
        local v37 = v34:Lerp(v35, v4.GOLDEN_RATIO);
        local v38 = v34:Lerp(v35, 0.5);
        local v39 = Vector3.new(v38.X, v37.Y, v38.Z);
        local v40 = l_CFrame_0:PointToWorldSpace(v39);
        local v41 = l_CFrame_0 - l_CFrame_0.Position + v40;
        if v3 and not v18 then
            local v42 = CFrame.fromEulerAnglesXYZ(v28, v29, v30);
            v41 = v42 - v42.Position + v40;
        end;
        local v43 = math.max(v39.X - v34.X, v39.Y - v34.Y);
        local v44 = math.max(v35.X - v39.X, v35.Y - v39.Y);
        local v45 = v43 * v0.DefaultBodyMarginScale / v36;
        local v46 = v44 * v0.DefaultBodyMarginScale / v36;
        local l_v45_0 = v45;
        local v48 = l_UpVector_0.Y < v4.UPVECTOR_ORENTATION_TRESHOLD;
        local v49 = l_UpVector_0.X < v4.UPVECTOR_ORENTATION_TRESHOLD;
        if v48 or v49 then
            l_v45_0 = math.max(v45, v46);
        end;
        local v50 = l_v45_0 * v0.DistanceScaleForFullBody * l_LookVector_0;
        return v0.GetCameraCFrame(v41, v50);
    end;
end;
return v4;