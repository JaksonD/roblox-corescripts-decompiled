local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AvatarUtil_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).AvatarUtil;
local l_ConnectionUtil_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).ConnectionUtil;
local v8 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0);
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_ConnectionUtil_0 (copy), l_VRService_0 (copy)
    local v10 = setmetatable({}, v9);
    v10.connections = l_ConnectionUtil_0.new();
    v10.VRPlayers = {};
    v10.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy)
        v10:onAvatarGesturesChanged();
    end);
    if l_VRService_0.AvatarGestures then
        v10:onAvatarGesturesChanged();
    end;
    return v10;
end;
cleanCharacter = function(v11) --[[ Line: 35 ]] --[[ Name: cleanCharacter ]]
    if v11.Character then
        local l_Humanoid_0 = v11.Character:FindFirstChild("Humanoid");
        if l_Humanoid_0 then
            for _, v14 in pairs({
                "TrackedIKLeftHand", 
                "TrackedIKRightHand", 
                "TrackedIKHead"
            }) do
                local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v14);
                if l_l_Humanoid_0_FirstChild_0 then
                    l_l_Humanoid_0_FirstChild_0:Destroy();
                end;
            end;
        end;
        for _, v17 in pairs({
            "TrackedLeftHand", 
            "TrackedRightHand", 
            "TrackedHead"
        }) do
            local l_FirstChild_0 = v11.Character:FindFirstChild(v17);
            if l_FirstChild_0 then
                l_FirstChild_0:Destroy();
            end;
        end;
    end;
end;
v9.onPlayerChanged = function(v19, v20, v21) --[[ Line: 62 ]] --[[ Name: onPlayerChanged ]]
    -- upvalues: l_AvatarUtil_0 (copy)
    v19.VRPlayers[v20] = v21 or nil;
    if v21 then
        if not v19.avatarUtil then
            v19.avatarUtil = l_AvatarUtil_0.new();
        end;
        v19.avatarUtil:connectPlayerCharacterChanges(v20, function(v22) --[[ Line: 71 ]]
            -- upvalues: v19 (copy)
            v19:onCharacterChanged(v22);
        end);
        return;
    else
        cleanCharacter(v20);
        return;
    end;
end;
v9.onPlayerAdded = function(v23, v24) --[[ Line: 79 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v8 (copy)
    if next(v23.VRPlayers) ~= nil then
        l_RbxAnalyticsService_0:ReportInfluxSeries("VRAvatarGestures", {
            placeId = game.PlaceId, 
            calledFrom = "ServerPlayerAddedWithVRPlayer", 
            playerUserID = v24.UserId
        }, v8);
    end;
end;
v9.onAvatarGesturesChanged = function(v25) --[[ Line: 90 ]] --[[ Name: onAvatarGesturesChanged ]]
    -- upvalues: l_VRService_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_Players_0 (copy)
    if l_VRService_0.AvatarGestures then
        local l_AvatarGesturesVRPlayer_0 = l_RobloxReplicatedStorage_0:FindFirstChild("AvatarGesturesVRPlayer");
        if not l_AvatarGesturesVRPlayer_0 then
            l_AvatarGesturesVRPlayer_0 = Instance.new("RemoteEvent");
            l_AvatarGesturesVRPlayer_0.Name = "AvatarGesturesVRPlayer";
            l_AvatarGesturesVRPlayer_0.Parent = l_RobloxReplicatedStorage_0;
        end;
        v25.connections:connect("VRPlayerOnServerEvent", l_AvatarGesturesVRPlayer_0.OnServerEvent, function(v27, v28) --[[ Line: 101 ]]
            -- upvalues: v25 (copy)
            v25:onPlayerChanged(v27, v28);
        end);
        v25.connections:connect("PlayerAdded", l_Players_0.PlayerAdded, function(v29) --[[ Line: 104 ]]
            -- upvalues: v25 (copy)
            v25:onPlayerAdded(v29);
        end);
        v25.connections:connect("PlayerRemoving", l_Players_0.PlayerRemoving, function(v30) --[[ Line: 107 ]]
            -- upvalues: v25 (copy)
            v25:onPlayerChanged(v30, false);
        end);
        return;
    else
        for v31 in pairs(v25.VRPlayers) do
            v25:onPlayerChanged(v31, false);
        end;
        v25.connections:disconnectAll();
        v25.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 115 ]]
            -- upvalues: v25 (copy)
            v25:onAvatarGesturesChanged();
        end);
        return;
    end;
end;
v9.findOrCreateColliders = function(_, v33, v34) --[[ Line: 121 ]] --[[ Name: findOrCreateColliders ]]
    -- upvalues: l_Players_0 (copy)
    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v34);
    local v36 = "Tracked" .. v33;
    local l_v34_FirstChild_0 = v34:FindFirstChild(v36);
    if not l_v34_FirstChild_0 then
        l_v34_FirstChild_0 = Instance.new("Part");
        l_v34_FirstChild_0.Name = v36;
        l_v34_FirstChild_0.Transparency = 1;
        l_v34_FirstChild_0.CanCollide = false;
        l_v34_FirstChild_0.Parent = v34;
        l_v34_FirstChild_0:SetNetworkOwner(l_l_Players_0_PlayerFromCharacter_0);
    end;
    local l_l_v34_FirstChild_0_FirstChild_0 = l_v34_FirstChild_0:FindFirstChild(v36 .. "Attachment");
    if not l_l_v34_FirstChild_0_FirstChild_0 then
        l_l_v34_FirstChild_0_FirstChild_0 = Instance.new("Attachment");
        l_l_v34_FirstChild_0_FirstChild_0.Name = v36 .. "Attachment";
        l_l_v34_FirstChild_0_FirstChild_0.Parent = l_v34_FirstChild_0;
    end;
    local l_l_v34_FirstChild_0_FirstChild_1 = l_v34_FirstChild_0:FindFirstChild(v36 .. "AlignPosition");
    if not l_l_v34_FirstChild_0_FirstChild_1 then
        l_l_v34_FirstChild_0_FirstChild_1 = Instance.new("AlignPosition");
        l_l_v34_FirstChild_0_FirstChild_1.Name = v36 .. "AlignPosition";
        l_l_v34_FirstChild_0_FirstChild_1.Mode = Enum.PositionAlignmentMode.OneAttachment;
        l_l_v34_FirstChild_0_FirstChild_1.Attachment0 = l_l_v34_FirstChild_0_FirstChild_0;
        l_l_v34_FirstChild_0_FirstChild_1.RigidityEnabled = true;
        l_l_v34_FirstChild_0_FirstChild_1.Parent = l_v34_FirstChild_0;
    end;
    local l_l_v34_FirstChild_0_FirstChild_2 = l_v34_FirstChild_0:FindFirstChild(v36 .. "AlignOrientation");
    if not l_l_v34_FirstChild_0_FirstChild_2 then
        l_l_v34_FirstChild_0_FirstChild_2 = Instance.new("AlignOrientation");
        l_l_v34_FirstChild_0_FirstChild_2.Name = v36 .. "AlignOrientation";
        l_l_v34_FirstChild_0_FirstChild_2.Mode = Enum.OrientationAlignmentMode.OneAttachment;
        l_l_v34_FirstChild_0_FirstChild_2.Attachment0 = l_l_v34_FirstChild_0_FirstChild_0;
        l_l_v34_FirstChild_0_FirstChild_2.RigidityEnabled = true;
        l_l_v34_FirstChild_0_FirstChild_2.Parent = l_v34_FirstChild_0;
    end;
    local l_v34_FirstChild_1 = v34:FindFirstChild(v33);
    if l_v34_FirstChild_1 then
        l_v34_FirstChild_0.Size = l_v34_FirstChild_1.Size;
        l_v34_FirstChild_0.CFrame = l_v34_FirstChild_1.CFrame;
        l_l_v34_FirstChild_0_FirstChild_1.Position = l_v34_FirstChild_1.Position;
        l_l_v34_FirstChild_0_FirstChild_2.CFrame = l_v34_FirstChild_1.CFrame;
    else
        l_v34_FirstChild_0.Size = Vector3.new(1, 1, 1, 0);
        l_v34_FirstChild_0.CFrame = v34.WorldPivot;
        l_l_v34_FirstChild_0_FirstChild_1.Position = v34.WorldPivot.Position;
        l_l_v34_FirstChild_0_FirstChild_2.CFrame = v34.WorldPivot;
    end;
    local l_Humanoid_1 = v34:FindFirstChild("Humanoid");
    if l_Humanoid_1 then
        local v43 = "TrackedIK" .. v33;
        local l_l_Humanoid_1_FirstChild_0 = l_Humanoid_1:FindFirstChild(v43);
        if not l_l_Humanoid_1_FirstChild_0 then
            l_l_Humanoid_1_FirstChild_0 = Instance.new("IKControl");
            l_l_Humanoid_1_FirstChild_0.Name = v43;
        end;
        l_l_Humanoid_1_FirstChild_0.SmoothTime = 0.1;
        l_l_Humanoid_1_FirstChild_0.Parent = l_Humanoid_1;
        l_l_Humanoid_1_FirstChild_0.Target = l_v34_FirstChild_0;
    end;
end;
v9.createHandCollider = function(v45, v46, v47) --[[ Line: 196 ]] --[[ Name: createHandCollider ]]
    v45:findOrCreateColliders(v46 .. "Hand", v47);
    local l_v47_FirstChild_0 = v47:FindFirstChild(v46 .. "Hand");
    local l_Humanoid_2 = v47:FindFirstChild("Humanoid");
    if l_Humanoid_2 then
        local l_l_Humanoid_2_FirstChild_0 = l_Humanoid_2:FindFirstChild("TrackedIK" .. v46 .. "Hand");
        if l_l_Humanoid_2_FirstChild_0 then
            l_l_Humanoid_2_FirstChild_0.Type = Enum.IKControlType.Transform;
            local l_v47_FirstChild_1 = v47:FindFirstChild(v46 .. "UpperArm");
            if l_v47_FirstChild_1 then
                l_l_Humanoid_2_FirstChild_0.ChainRoot = l_v47_FirstChild_0;
                coroutine.wrap(function() --[[ Line: 213 ]]
                    -- upvalues: l_l_Humanoid_2_FirstChild_0 (copy), l_v47_FirstChild_1 (copy)
                    task.wait(0.1);
                    l_l_Humanoid_2_FirstChild_0.ChainRoot = l_v47_FirstChild_1;
                end)();
            end;
            if l_v47_FirstChild_0 then
                l_l_Humanoid_2_FirstChild_0.EndEffector = l_v47_FirstChild_0;
            end;
            l_l_Humanoid_2_FirstChild_0.Priority = 1;
        end;
    end;
    if l_v47_FirstChild_0 then
        local l_RagdollBallSocket_0 = l_v47_FirstChild_0:FindFirstChild("RagdollBallSocket");
        if l_RagdollBallSocket_0 then
            l_RagdollBallSocket_0.LimitsEnabled = false;
        end;
    end;
end;
v9.createHeadCollider = function(v53, v54) --[[ Line: 234 ]] --[[ Name: createHeadCollider ]]
    v53:findOrCreateColliders("Head", v54);
    local l_Head_0 = v54:FindFirstChild("Head");
    local l_Humanoid_3 = v54:FindFirstChild("Humanoid");
    if l_Humanoid_3 then
        local l_TrackedIKHead_0 = l_Humanoid_3:FindFirstChild("TrackedIKHead");
        if l_TrackedIKHead_0 then
            l_TrackedIKHead_0.Type = Enum.IKControlType.Rotation;
            local l_UpperTorso_0 = v54:FindFirstChild("UpperTorso");
            if l_UpperTorso_0 then
                l_TrackedIKHead_0.ChainRoot = l_UpperTorso_0;
            end;
            if l_Head_0 then
                l_TrackedIKHead_0.EndEffector = l_Head_0;
            end;
        end;
    end;
end;
v9.onCharacterChanged = function(v59, v60) --[[ Line: 260 ]] --[[ Name: onCharacterChanged ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_l_Players_0_PlayerFromCharacter_1 = l_Players_0:GetPlayerFromCharacter(v60);
    if v59.VRPlayers[l_l_Players_0_PlayerFromCharacter_1] and l_VRService_0.AvatarGestures then
        v59:createHandCollider("Left", v60);
        v59:createHandCollider("Right", v60);
        v59:createHeadCollider(v60);
    end;
end;
return v9;