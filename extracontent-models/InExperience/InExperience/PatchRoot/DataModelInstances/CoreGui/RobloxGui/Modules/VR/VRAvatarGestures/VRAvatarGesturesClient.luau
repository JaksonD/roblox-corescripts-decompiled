local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon);
local l_ConnectionUtil_0 = v7.ConnectionUtil;
local l_AvatarUtil_0 = v7.AvatarUtil;
local v10 = game:DefineFastFlag("DebugImmersionModeNonVR", false);
local v11 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0);
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), l_ConnectionUtil_0 (copy), l_VRService_0 (copy)
    local v13 = setmetatable({}, v12);
    v13.partCFrameMap = {};
    v13.connections = l_ConnectionUtil_0.new();
    v13.analyticsSendEnabled = true;
    v13.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 60 ]]
        -- upvalues: v13 (copy)
        v13:onAvatarGesturesChanged();
    end);
    if l_VRService_0.AvatarGestures then
        v13:onAvatarGesturesChanged();
    end;
    return v13;
end;
v12.onCharacterChanged = function(v14, v15) --[[ Line: 65 ]] --[[ Name: onCharacterChanged ]]
    -- upvalues: l_VRService_0 (copy)
    local l_Humanoid_0 = v15:FindFirstChild("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        for _, v18 in pairs({
            "TrackedIKLeftHand", 
            "TrackedIKRightHand", 
            "TrackedIKHead"
        }) do
            local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v18);
            if l_l_Humanoid_0_FirstChild_0 then
                l_l_Humanoid_0_FirstChild_0.SmoothTime = 0;
            end;
        end;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return;
        else
            local function v25(v21) --[[ Line: 86 ]] --[[ Name: updateSeated ]]
                -- upvalues: l_CurrentCamera_0 (copy), l_Humanoid_0 (copy)
                local v22 = l_CurrentCamera_0.CameraSubject and l_CurrentCamera_0.CameraSubject:IsA("VehicleSeat");
                local v23 = (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5;
                local l_TrackedIKHead_0 = l_Humanoid_0:FindFirstChild("TrackedIKHead");
                if l_TrackedIKHead_0 then
                    if v21 and not v22 and v23 then
                        l_TrackedIKHead_0.Type = Enum.IKControlType.Transform;
                        return;
                    else
                        l_TrackedIKHead_0.Type = Enum.IKControlType.Rotation;
                    end;
                end;
            end;
            v25(l_Humanoid_0.Sit);
            v14.connections:connect("Seated", l_Humanoid_0.Seated, function(v26) --[[ Line: 102 ]]
                -- upvalues: v25 (copy), l_CurrentCamera_0 (copy), l_VRService_0 (ref)
                v25(v26);
                if v26 and (l_CurrentCamera_0.CFrame.Position - l_CurrentCamera_0.Focus.Position).Magnitude <= 5 then
                    l_VRService_0:RecenterUserHeadCFrame();
                end;
            end);
            return;
        end;
    end;
end;
v12.onAvatarGesturesChanged = function(v27) --[[ Line: 111 ]] --[[ Name: onAvatarGesturesChanged ]]
    -- upvalues: l_VRService_0 (copy), v10 (copy), l_RobloxReplicatedStorage_0 (copy), l_AvatarUtil_0 (copy), l_Players_0 (copy), l_RbxAnalyticsService_0 (copy), v11 (copy)
    if l_VRService_0.AvatarGestures then
        if l_VRService_0.VREnabled or v10 then
            local v28 = l_RobloxReplicatedStorage_0:WaitForChild("AvatarGesturesVRPlayer", 5);
            if not v28 then
                warn("VRService.AvatarGestures failed to connect to server");
                return;
            else
                v28:FireServer(true);
                v27:connectInputCFrames();
                if not v27.avatarUtil then
                    v27.avatarUtil = l_AvatarUtil_0.new();
                    v27.avatarUtil:connectLocalCharacterChanges(function(v29) --[[ Line: 128 ]]
                        -- upvalues: v27 (copy)
                        v27:onCharacterChanged(v29);
                    end);
                elseif l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character then
                    v27:onCharacterChanged(l_Players_0.LocalPlayer.Character);
                end;
                if v27.analyticsSendEnabled then
                    v27.analyticsSendEnabled = nil;
                    l_RbxAnalyticsService_0:ReportInfluxSeries("VRAvatarGestures", {
                        placeId = game.PlaceId, 
                        calledFrom = "ClientJoined"
                    }, v11);
                    return;
                end;
            end;
        end;
    else
        if l_VRService_0.VREnabled or v10 then
            local l_AvatarGesturesVRPlayer_0 = l_RobloxReplicatedStorage_0:FindFirstChild("AvatarGesturesVRPlayer");
            if l_AvatarGesturesVRPlayer_0 then
                l_AvatarGesturesVRPlayer_0:FireServer(false);
            end;
        end;
        v27.connections:disconnectAll();
        v27.connections:connect("AvatarGestures", l_VRService_0:GetPropertyChangedSignal("AvatarGestures"), function() --[[ Line: 157 ]]
            -- upvalues: v27 (copy)
            v27:onAvatarGesturesChanged();
        end);
    end;
end;
v12.updateCFrames = function(_, v32, v33) --[[ Line: 161 ]] --[[ Name: updateCFrames ]]
    -- upvalues: l_Players_0 (copy), l_VRService_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_Players_0.LocalPlayer then
        return;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_LocalPlayer_0.Character then
            return;
        else
            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v32);
            if not l_l_Character_0_FirstChild_0 then
                return;
            else
                local l_CurrentCamera_1 = workspace.CurrentCamera;
                if not l_CurrentCamera_1 then
                    return;
                elseif not l_l_Character_0_FirstChild_0:FindFirstChild(v32 .. "Attachment") then
                    return;
                else
                    local l_l_l_Character_0_FirstChild_0_FirstChild_0 = l_l_Character_0_FirstChild_0:FindFirstChild(v32 .. "AlignPosition");
                    if not l_l_l_Character_0_FirstChild_0_FirstChild_0 then
                        return;
                    else
                        local l_l_l_Character_0_FirstChild_0_FirstChild_1 = l_l_Character_0_FirstChild_0:FindFirstChild(v32 .. "AlignOrientation");
                        if not l_l_l_Character_0_FirstChild_0_FirstChild_1 then
                            return;
                        else
                            if l_VRService_0.VREnabled then
                                v33 = v33.Rotation + v33.Position * l_CurrentCamera_1.HeadScale;
                                local v40 = l_CurrentCamera_1.CFrame * v33;
                                local l_Head_0 = l_Character_0:FindFirstChild("Head");
                                if (l_CurrentCamera_1.CFrame.Position - l_CurrentCamera_1.Focus.Position).Magnitude > 5 and l_Head_0 then
                                    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                                    l_l_VRService_0_UserCFrame_0 = l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_1.HeadScale;
                                    local v43 = l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_0 * CFrame.new(0, 0, 0.5);
                                    if v32 ~= "TrackedHead" then
                                        local v44 = l_Head_0.CFrame:ToWorldSpace(v43:ToObjectSpace(v40));
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v44.Position;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v44 * CFrame.Angles(1.5707963267948966, 0, 0);
                                    else
                                        local l_CFrame_0 = l_Character_0.PrimaryPart.CFrame;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = (l_CFrame_0 * CFrame.new(0, l_CFrame_0.Position.Y * 0.25, -l_CFrame_0.Position.Y * 0.125)).Position;
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = l_CFrame_0 * v33;
                                    end;
                                else
                                    l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v40.Position;
                                    if v32 ~= "TrackedHead" then
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v40 * CFrame.Angles(1.5707963267948966, 0, 0);
                                    else
                                        l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v40;
                                    end;
                                end;
                            else
                                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                local v47 = nil;
                                v47 = if v32 ~= "TrackedHead" then l_HumanoidRootPart_0.CFrame * v33 * CFrame.Angles(0, 0, (math.rad(time() * 30))) * CFrame.new(1, 0, -0.5) else l_HumanoidRootPart_0.CFrame * v33;
                                if l_HumanoidRootPart_0 then
                                    l_l_l_Character_0_FirstChild_0_FirstChild_0.Position = v47.Position;
                                    l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame = v47;
                                end;
                            end;
                            l_l_Character_0_FirstChild_0.CFrame = CFrame.new(l_l_l_Character_0_FirstChild_0_FirstChild_0.Position) * l_l_l_Character_0_FirstChild_0_FirstChild_1.CFrame.Rotation;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v12.steppedCframes = function(v48) --[[ Line: 253 ]] --[[ Name: steppedCframes ]]
    for v49, v50 in pairs(v48.partCFrameMap) do
        v48:updateCFrames(v49, v50);
    end;
end;
v12.connectInputCFrames = function(v51) --[[ Line: 259 ]] --[[ Name: connectInputCFrames ]]
    -- upvalues: l_VRService_0 (copy), v10 (copy), l_RunService_0 (copy)
    if l_VRService_0.VREnabled then
        v51.connections:connect("UserCFrameChanged", l_VRService_0.UserCFrameChanged, function(v52, v53) --[[ Line: 261 ]]
            -- upvalues: v51 (copy)
            if v52 == Enum.UserCFrame.LeftHand then
                v51.partCFrameMap.TrackedLeftHand = v53;
                return;
            elseif v52 == Enum.UserCFrame.RightHand then
                v51.partCFrameMap.TrackedRightHand = v53;
                return;
            else
                if v52 == Enum.UserCFrame.Head then
                    v51.partCFrameMap.TrackedHead = v53;
                end;
                return;
            end;
        end);
    elseif v10 then
        v51.connections:connect("NonVRSimulateInput", l_RunService_0.RenderStepped, function(_) --[[ Line: 271 ]]
            -- upvalues: v51 (copy)
            v51.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5);
            v51.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5);
            v51.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0);
        end);
    end;
    if l_VRService_0.VREnabled or v10 then
        v51.connections:connect("RenderStepped", l_RunService_0.RenderStepped, function(_) --[[ Line: 279 ]]
            -- upvalues: v51 (copy)
            v51:steppedCframes();
        end);
    end;
end;
return v12.new();