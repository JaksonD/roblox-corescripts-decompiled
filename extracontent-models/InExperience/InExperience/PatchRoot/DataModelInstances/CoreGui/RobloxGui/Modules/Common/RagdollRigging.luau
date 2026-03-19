local l_RunService_0 = game:GetService("RunService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local v2 = {};
local v3 = {
    UpperAngle = 45, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 40, 
    FrictionTorque = 400, 
    StrengthTorque = 400, 
    ReferenceMass = 1.0249234437943
};
local v4 = {
    UpperAngle = 20, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 20, 
    FrictionTorque = 750, 
    StrengthTorque = 5000, 
    ReferenceMass = 2.861558675766
};
local v5 = {
    UpperAngle = 10, 
    TwistLowerAngle = -10, 
    TwistUpperAngle = 10, 
    StrengthTorque = 400, 
    ReferenceMass = 0.43671694397926
};
local v6 = {
    UpperAngle = 20, 
    TwistLowerAngle = 5, 
    TwistUpperAngle = 120, 
    StrengthTorque = 1200, 
    ReferenceMass = 0.70196455717087
};
local v7 = {
    UpperAngle = 30, 
    TwistLowerAngle = -10, 
    TwistUpperAngle = 10, 
    StrengthTorque = 400, 
    ReferenceMass = 0.69132566452026
};
local v8 = {
    UpperAngle = 5, 
    TwistLowerAngle = -120, 
    TwistUpperAngle = -5, 
    StrengthTorque = 2000, 
    ReferenceMass = 0.65389388799667
};
local v9 = {
    UpperAngle = 110, 
    TwistLowerAngle = -85, 
    TwistUpperAngle = 85, 
    FrictionTorque = 600, 
    StrengthTorque = 4000, 
    ReferenceMass = 0.90918225049973
};
local v10 = {
    UpperAngle = 40, 
    TwistLowerAngle = -5, 
    TwistUpperAngle = 80, 
    FrictionTorque = 600, 
    StrengthTorque = 4000, 
    ReferenceMass = 1.9175016880035
};
local v11 = {
    UpperAngle = 30, 
    TwistLowerAngle = -40, 
    TwistUpperAngle = 40
};
local v12 = {
    UpperAngle = 110, 
    TwistLowerAngle = -85, 
    TwistUpperAngle = 85
};
local v13 = {
    UpperAngle = 40, 
    TwistLowerAngle = -5, 
    TwistUpperAngle = 80
};
local v14 = Vector3.new();
local v15 = {
    {
        "UpperTorso", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        "RightShoulderRigAttachment"
    }, 
    {
        "RightUpperArm", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, Vector3.new(0, -1, 0, 0), (Vector3.new(1, 0, 0, 0))), 
        "RightShoulderRigAttachment"
    }, 
    {
        "UpperTorso", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, Vector3.new(-1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        "LeftShoulderRigAttachment"
    }, 
    {
        "LeftUpperArm", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(v14, Vector3.new(0, -1, 0, 0), (Vector3.new(-1, 0, 0, 0))), 
        "LeftShoulderRigAttachment"
    }
};
local v16 = {
    {
        "UpperTorso", 
        "Head", 
        "NeckRigAttachment", 
        v3
    }, 
    {
        "LowerTorso", 
        "UpperTorso", 
        "WaistRigAttachment", 
        v4
    }, 
    {
        "UpperTorso", 
        "LeftUpperArm", 
        "LeftShoulderRagdollAttachment", 
        v9
    }, 
    {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftElbowRigAttachment", 
        v6
    }, 
    {
        "LeftLowerArm", 
        "LeftHand", 
        "LeftWristRigAttachment", 
        v7
    }, 
    {
        "UpperTorso", 
        "RightUpperArm", 
        "RightShoulderRagdollAttachment", 
        v9
    }, 
    {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightElbowRigAttachment", 
        v6
    }, 
    {
        "RightLowerArm", 
        "RightHand", 
        "RightWristRigAttachment", 
        v7
    }, 
    {
        "LowerTorso", 
        "LeftUpperLeg", 
        "LeftHipRigAttachment", 
        v10
    }, 
    {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftKneeRigAttachment", 
        v8
    }, 
    {
        "LeftLowerLeg", 
        "LeftFoot", 
        "LeftAnkleRigAttachment", 
        v5
    }, 
    {
        "LowerTorso", 
        "RightUpperLeg", 
        "RightHipRigAttachment", 
        v10
    }, 
    {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightKneeRigAttachment", 
        v8
    }, 
    {
        "RightLowerLeg", 
        "RightFoot", 
        "RightAnkleRigAttachment", 
        v5
    }
};
local v17 = {
    {
        "LowerTorso", 
        "LeftUpperArm"
    }, 
    {
        "LeftUpperArm", 
        "LeftHand"
    }, 
    {
        "LowerTorso", 
        "RightUpperArm"
    }, 
    {
        "RightUpperArm", 
        "RightHand"
    }, 
    {
        "LeftUpperLeg", 
        "RightUpperLeg"
    }, 
    {
        "UpperTorso", 
        "RightUpperLeg"
    }, 
    {
        "RightUpperLeg", 
        "RightFoot"
    }, 
    {
        "UpperTorso", 
        "LeftUpperLeg"
    }, 
    {
        "LeftUpperLeg", 
        "LeftFoot"
    }, 
    {
        "UpperTorso", 
        "LeftLowerLeg"
    }, 
    {
        "UpperTorso", 
        "RightLowerLeg"
    }, 
    {
        "LowerTorso", 
        "LeftLowerLeg"
    }, 
    {
        "LowerTorso", 
        "RightLowerLeg"
    }, 
    {
        "UpperTorso", 
        "LeftLowerArm"
    }, 
    {
        "UpperTorso", 
        "RightLowerArm"
    }, 
    {
        "Head", 
        "LeftUpperArm"
    }, 
    {
        "Head", 
        "RightUpperArm"
    }
};
local v18 = {
    {
        "Waist", 
        "UpperTorso"
    }, 
    {
        "Neck", 
        "Head"
    }, 
    {
        "LeftShoulder", 
        "LeftUpperArm"
    }, 
    {
        "LeftElbow", 
        "LeftLowerArm"
    }, 
    {
        "LeftWrist", 
        "LeftHand"
    }, 
    {
        "RightShoulder", 
        "RightUpperArm"
    }, 
    {
        "RightElbow", 
        "RightLowerArm"
    }, 
    {
        "RightWrist", 
        "RightHand"
    }, 
    {
        "LeftHip", 
        "LeftUpperLeg"
    }, 
    {
        "LeftKnee", 
        "LeftLowerLeg"
    }, 
    {
        "LeftAnkle", 
        "LeftFoot"
    }, 
    {
        "RightHip", 
        "RightUpperLeg"
    }, 
    {
        "RightKnee", 
        "RightLowerLeg"
    }, 
    {
        "RightAnkle", 
        "RightFoot"
    }
};
local v19 = {
    {
        "Head", 
        "NeckAttachment", 
        CFrame.new(0, -0.5, 0)
    }, 
    {
        "Torso", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(1, 0.5, 0, 0), Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0)))
    }, 
    {
        "Right Arm", 
        "RightShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(-0.5, 0.5, 0, 0), Vector3.new(0, -1, 0, 0), (Vector3.new(1, 0, 0, 0)))
    }, 
    {
        "Torso", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(-1, 0.5, 0, 0), Vector3.new(-1, 0, 0, 0), (Vector3.new(0, 1, 0, 0)))
    }, 
    {
        "Left Arm", 
        "LeftShoulderRagdollAttachment", 
        CFrame.fromMatrix(Vector3.new(0.5, 0.5, 0, 0), Vector3.new(0, -1, 0, 0), (Vector3.new(-1, 0, 0, 0)))
    }, 
    {
        "Torso", 
        "RightHipAttachment", 
        CFrame.new(0.5, -1, 0)
    }, 
    {
        "Right Leg", 
        "RightHipAttachment", 
        CFrame.new(0, 1, 0)
    }, 
    {
        "Torso", 
        "LeftHipAttachment", 
        CFrame.new(-0.5, -1, 0)
    }, 
    {
        "Left Leg", 
        "LeftHipAttachment", 
        CFrame.new(0, 1, 0)
    }
};
local v20 = {
    {
        "Torso", 
        "Head", 
        "NeckAttachment", 
        v11
    }, 
    {
        "Torso", 
        "Left Leg", 
        "LeftHipAttachment", 
        v13
    }, 
    {
        "Torso", 
        "Right Leg", 
        "RightHipAttachment", 
        v13
    }, 
    {
        "Torso", 
        "Left Arm", 
        "LeftShoulderRagdollAttachment", 
        v12
    }, 
    {
        "Torso", 
        "Right Arm", 
        "RightShoulderRagdollAttachment", 
        v12
    }
};
local v21 = {
    {
        "Left Leg", 
        "Right Leg"
    }, 
    {
        "Head", 
        "Right Arm"
    }, 
    {
        "Head", 
        "Left Arm"
    }
};
local v22 = {
    {
        "Neck", 
        "Torso"
    }, 
    {
        "Left Shoulder", 
        "Torso"
    }, 
    {
        "Right Shoulder", 
        "Torso"
    }, 
    {
        "Left Hip", 
        "Torso"
    }, 
    {
        "Right Hip", 
        "Torso"
    }
};
local function v28(v23) --[[ Line: 238 ]] --[[ Name: indexParts ]]
    local v24 = {};
    for _, v26 in ipairs(v23:GetChildren()) do
        if v26:IsA("BasePart") then
            local l_name_0 = v26.name;
            if not v24[l_name_0] then
                v24[l_name_0] = v26;
            end;
        end;
    end;
    return v24;
end;
local function v49(v29, v30, v31) --[[ Line: 252 ]] --[[ Name: createRigJoints ]]
    if v31 then
        local l_AnimationConstraint_0 = Instance.new("AnimationConstraint");
        l_AnimationConstraint_0.Name = "Root";
        l_AnimationConstraint_0.Attachment0 = v29.HumanoidRootPart.RootRigAttachment;
        l_AnimationConstraint_0.Attachment1 = v29.LowerTorso.RootRigAttachment;
        l_AnimationConstraint_0.IsKinematic = true;
        v29.LowerTorso.Root:Destroy();
        l_AnimationConstraint_0.Parent = v29.LowerTorso;
    end;
    for _, v34 in ipairs(v30) do
        local v35, v36, v37, v38 = unpack(v34);
        local v39 = v29[v35];
        local v40 = v29[v36];
        if v39 and v40 then
            local l_v39_FirstChild_0 = v39:FindFirstChild(v37);
            local l_v40_FirstChild_0 = v40:FindFirstChild(v37);
            if l_v39_FirstChild_0 and l_v40_FirstChild_0 and l_v39_FirstChild_0:IsA("Attachment") and l_v40_FirstChild_0:IsA("Attachment") then
                local l_RagdollBallSocket_0 = v40:FindFirstChild("RagdollBallSocket");
                if not l_RagdollBallSocket_0 then
                    l_RagdollBallSocket_0 = Instance.new("BallSocketConstraint");
                    l_RagdollBallSocket_0.Name = "RagdollBallSocket";
                end;
                l_RagdollBallSocket_0.Attachment0 = l_v39_FirstChild_0;
                l_RagdollBallSocket_0.Attachment1 = l_v40_FirstChild_0;
                l_RagdollBallSocket_0.LimitsEnabled = true;
                l_RagdollBallSocket_0.UpperAngle = v38.UpperAngle;
                l_RagdollBallSocket_0.TwistLimitsEnabled = true;
                l_RagdollBallSocket_0.TwistLowerAngle = v38.TwistLowerAngle;
                l_RagdollBallSocket_0.TwistUpperAngle = v38.TwistUpperAngle;
                local v44 = workspace.Gravity / 196.2;
                if v31 then
                    v44 = math.max(v44, 0.2);
                end;
                local l_ReferenceMass_0 = v38.ReferenceMass;
                local v46 = l_ReferenceMass_0 and v40:GetMass() / l_ReferenceMass_0 or 1;
                l_RagdollBallSocket_0.MaxFrictionTorque = (v38.FrictionTorque or 500) * v46 * v44;
                if v31 then
                    l_RagdollBallSocket_0.MaxFrictionTorque = l_RagdollBallSocket_0.MaxFrictionTorque / 100;
                end;
                l_RagdollBallSocket_0.Parent = v40;
                if v31 then
                    local l_Motor6D_0 = v40:FindFirstChildWhichIsA("Motor6D");
                    assert(l_Motor6D_0);
                    local l_AnimationConstraint_1 = Instance.new("AnimationConstraint");
                    l_AnimationConstraint_1.Name = l_Motor6D_0.Name;
                    l_AnimationConstraint_1.Attachment0 = l_Motor6D_0.Part0:FindFirstChild(l_Motor6D_0.Name .. "RigAttachment");
                    l_AnimationConstraint_1.Attachment1 = l_Motor6D_0.Part1:FindFirstChild(l_Motor6D_0.Name .. "RigAttachment");
                    l_AnimationConstraint_1.IsKinematic = true;
                    l_AnimationConstraint_1.MaxTorque = (v38.StrengthTorque or 500) * v46 * v44;
                    l_AnimationConstraint_1.MaxForce = 0;
                    l_AnimationConstraint_1.Parent = l_Motor6D_0.parent;
                    l_Motor6D_0:Destroy();
                end;
            end;
        end;
    end;
end;
local function v61(v50, v51) --[[ Line: 320 ]] --[[ Name: createAdditionalAttachments ]]
    for _, v53 in ipairs(v51) do
        local v54, v55, v56, v57 = unpack(v53);
        local v58 = v50[v54];
        if v58 then
            local l_v58_FirstChild_0 = v58:FindFirstChild(v55);
            if not l_v58_FirstChild_0 or l_v58_FirstChild_0:IsA("Attachment") then
                if v57 then
                    local l_v58_FirstChild_1 = v58:FindFirstChild(v57);
                    if l_v58_FirstChild_1 and l_v58_FirstChild_1:IsA("Attachment") then
                        v56 = l_v58_FirstChild_1.CFrame * v56;
                    end;
                end;
                if not l_v58_FirstChild_0 then
                    l_v58_FirstChild_0 = Instance.new("Attachment");
                    l_v58_FirstChild_0.Name = v55;
                    l_v58_FirstChild_0.CFrame = v56;
                    l_v58_FirstChild_0.Parent = v58;
                else
                    l_v58_FirstChild_0.CFrame = v56;
                end;
            end;
        end;
    end;
end;
local function v85(v62, v63) --[[ Line: 348 ]] --[[ Name: createNoCollides ]]
    local v64 = {};
    for _, v66 in ipairs(v63) do
        local v67, v68 = unpack(v66);
        local v69 = v62[v67];
        local v70 = v62[v68];
        if v69 and v70 then
            local v71 = v64[v70];
            if not v71 then
                v71 = {};
                v64[v70] = v71;
            end;
            v71[v69] = true;
        end;
    end;
    local v72 = {};
    for v73, v74 in pairs(v64) do
        local v75 = {};
        for _, v77 in ipairs(v73:GetChildren()) do
            if v77:IsA("NoCollisionConstraint") and v77.Name == "RagdollNoCollision" then
                local l_Part0_0 = v77.Part0;
                if v77.Part1 == v73 and v74[l_Part0_0] then
                    v74[l_Part0_0] = nil;
                else
                    table.insert(v75, v77);
                end;
            end;
        end;
        v72[v73] = v75;
    end;
    for v79, v80 in pairs(v64) do
        local v81 = v72[v79];
        for v82, _ in pairs(v80) do
            local v84 = table.remove(v81) or Instance.new("NoCollisionConstraint");
            v84.Name = "RagdollNoCollision";
            v84.Part0 = v82;
            v84.Part1 = v79;
            v84.Parent = v79;
        end;
    end;
end;
local function _(v86, v87) --[[ Line: 407 ]] --[[ Name: isAttachmetInPart ]]
    return v86 and v86.Parent == v87 or false;
end;
local function _(v89, v90, v91, v92) --[[ Line: 411 ]] --[[ Name: checkValidAttachment ]]
    if (v91 and v91.Parent == v89 or false) and (v92 and v92.Parent == v90 or false) then
        return true;
    elseif (v91 and v91.Parent == v90 or false) and (v92 and v92.Parent == v89 or false) then
        return true;
    else
        return false;
    end;
end;
local function v100(v94, v95) --[[ Line: 423 ]] --[[ Name: hasValidConstraint ]]
    for _, v97 in ipairs(v95:GetChildren()) do
        if v97:IsA("BallSocketConstraint") then
            local l_Attachment0_0 = v97.Attachment0;
            local l_Attachment1_0 = v97.Attachment1;
            if (l_Attachment0_0 and l_Attachment0_0.Parent == v94 or false) and (l_Attachment1_0 and l_Attachment1_0.Parent == v95 or false) and true or (l_Attachment0_0 and l_Attachment0_0.Parent == v95 or false) and (l_Attachment1_0 and l_Attachment1_0.Parent == v94 or false) and true or false then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v106(v101) --[[ Line: 438 ]] --[[ Name: hasRagdollJoint ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v100 (copy)
    if l_game_EngineFeature_0 and not v101:IsA("Motor6D") and not v101:IsA("AnimationConstraint") then
        return false;
    else
        local v102 = nil;
        local v103 = nil;
        if v101:IsA("Motor6D") then
            v102 = v101.Part0;
            v103 = v101.Part1;
        elseif l_game_EngineFeature_0 and v101:IsA("AnimationConstraint") then
            local l_Attachment0_1 = v101.Attachment0;
            local l_Attachment1_1 = v101.Attachment1;
            v102 = l_Attachment0_1 and l_Attachment0_1.Parent;
            v103 = l_Attachment1_1 and l_Attachment1_1.Parent;
        end;
        if not v102 or not v103 then
            return false;
        elseif v100(v102, v103) then
            return true;
        elseif v100(v103, v102) then
            return true;
        else
            return false;
        end;
    end;
end;
local function v114(v107, v108) --[[ Line: 470 ]] --[[ Name: disableMotorSet ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v106 (copy)
    local v109 = {};
    for _, v111 in ipairs(v108) do
        local l_v107_FirstChild_0 = v107:FindFirstChild(v111[2]);
        if l_v107_FirstChild_0 then
            local l_l_v107_FirstChild_0_FirstChild_0 = l_v107_FirstChild_0:FindFirstChild(v111[1]);
            if l_l_v107_FirstChild_0_FirstChild_0 and (l_game_EngineFeature_0 or l_l_v107_FirstChild_0_FirstChild_0:IsA("Motor6D")) and v106(l_l_v107_FirstChild_0_FirstChild_0) then
                table.insert(v109, l_l_v107_FirstChild_0_FirstChild_0);
                l_l_v107_FirstChild_0_FirstChild_0.Enabled = false;
            end;
        end;
    end;
    return v109;
end;
v2.createRagdollJoints = function(v115, v116, v117) --[[ Line: 486 ]] --[[ Name: createRagdollJoints ]]
    -- upvalues: v28 (copy), v61 (copy), v19 (copy), v49 (copy), v20 (copy), v85 (copy), v21 (copy), v15 (copy), v16 (copy), v17 (copy)
    local v118 = v28(v115);
    if v116 == Enum.HumanoidRigType.R6 then
        v61(v118, v19);
        v49(v118, v20, false);
        v85(v118, v21);
        return;
    elseif v116 == Enum.HumanoidRigType.R15 then
        v61(v118, v15);
        v49(v118, v16, v117);
        v85(v118, v17);
        return;
    else
        error("unknown rig type", 2);
        return;
    end;
end;
v2.disableMotors = function(v119, v120) --[[ Line: 501 ]] --[[ Name: disableMotors ]]
    -- upvalues: v114 (copy), v22 (copy), v18 (copy)
    local v121 = nil;
    if v120 == Enum.HumanoidRigType.R6 then
        v121 = v114(v119, v22);
    elseif v120 == Enum.HumanoidRigType.R15 then
        v121 = v114(v119, v18);
    else
        error("unknown rig type", 2);
    end;
    local v122 = v119.PrimaryPart or v119:FindFirstChild("HumanoidRootPart");
    if v122 and v122:IsA("BasePart") then
        v122.CanCollide = false;
    end;
    local l_Head_0 = v119:FindFirstChild("Head");
    if l_Head_0 and l_Head_0:IsA("BasePart") then
        l_Head_0.CanCollide = true;
    end;
    return v121;
end;
v2.disableParticleEmittersAndFadeOut = function(v124, v125) --[[ Line: 530 ]] --[[ Name: disableParticleEmittersAndFadeOut ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsServer() then
        error("disableParticleEmittersAndFadeOut should not be called on the server.", 2);
    end;
    local l_v124_Descendants_0 = v124:GetDescendants();
    local v127 = {};
    for _, v129 in pairs(l_v124_Descendants_0) do
        if v129:IsA("BasePart") or v129:IsA("Decal") then
            v127[v129] = v129.Transparency;
        elseif v129:IsA("ParticleEmitter") then
            v129.Enabled = false;
        end;
    end;
    local v130 = 0;
    while v130 < v125 do
        v130 = v130 + l_RunService_0.Heartbeat:Wait();
        local v131 = math.min(v130 / v125, 1);
        for v132, v133 in pairs(v127) do
            v132.Transparency = (1 - v131) * v133 + v131;
        end;
    end;
end;
v2.easeNongraphicJointFriction = function(v134, v135) --[[ Line: 558 ]] --[[ Name: easeNongraphicJointFriction ]]
    -- upvalues: l_RunService_0 (copy)
    local l_v134_Descendants_0 = v134:GetDescendants();
    local v137 = {};
    for _, v139 in pairs(l_v134_Descendants_0) do
        if v139:IsA("BallSocketConstraint") and v139.Name == "RagdollBallSocket" then
            v139.MaxFrictionTorque = v139.MaxFrictionTorque * 100;
            local l_MaxFrictionTorque_0 = v139.MaxFrictionTorque;
            local l_Name_0 = v139.Parent.Name;
            v137[v139] = {
                v139, 
                l_MaxFrictionTorque_0, 
                l_MaxFrictionTorque_0 * ((not (l_Name_0 ~= "UpperTorso") or l_Name_0 == "Head") and 0.5 or 0.05)
            };
        end;
    end;
    local v142 = 0;
    while v142 < v135 do
        local _, v144 = l_RunService_0.Stepped:Wait();
        v142 = v142 + v144;
        local v145 = math.min(v142 / v135, 1);
        for _, v147 in pairs(v137) do
            local v148, v149, v150 = unpack(v147);
            v148.MaxFrictionTorque = (1 - v145) * v149 + v145 * v150;
        end;
    end;
end;
v2.easeJointFriction_OLD = function(v151, v152) --[[ Line: 587 ]] --[[ Name: easeJointFriction_OLD ]]
    -- upvalues: l_RunService_0 (copy)
    local l_v151_Descendants_0 = v151:GetDescendants();
    local v154 = {};
    for _, v156 in pairs(l_v151_Descendants_0) do
        if v156:IsA("BallSocketConstraint") and v156.Name == "RagdollBallSocket" then
            local l_MaxFrictionTorque_1 = v156.MaxFrictionTorque;
            local l_Name_1 = v156.Parent.Name;
            v154[v156] = {
                v156, 
                l_MaxFrictionTorque_1, 
                l_MaxFrictionTorque_1 * ((not (l_Name_1 ~= "UpperTorso") or l_Name_1 == "Head") and 0.5 or 0.05)
            };
        end;
    end;
    local v159 = 0;
    while v159 < v152 do
        local _, v161 = l_RunService_0.Stepped:Wait();
        v159 = v159 + v161;
        local v162 = math.min(v159 / v152, 1);
        for _, v164 in pairs(v154) do
            local v165, v166, v167 = unpack(v164);
            v165.MaxFrictionTorque = (1 - v162) * v166 + v162 * v167;
        end;
    end;
end;
return v2;