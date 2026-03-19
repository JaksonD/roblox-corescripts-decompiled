local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Players_0 = game:GetService("Players");
local l_AvatarUtil_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).AvatarUtil;
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_AvatarUtil_0 (copy), l_VRService_0 (copy), l_UserGameSettings_0 (copy)
    local v6 = setmetatable({}, v5);
    v6.avatarUtil = l_AvatarUtil_0.new();
    l_VRService_0:GetPropertyChangedSignal("AutomaticScaling"):Connect(function() --[[ Line: 17 ]]
        -- upvalues: v6 (copy)
        v6:onScalingChanged();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("PlayerHeight"):Connect(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy)
        v6:onPlayerHeightChanged();
    end);
    l_VRService_0.UserCFrameChanged:Connect(function(v7, _) --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        if v7 == Enum.UserCFrame.Floor then
            v6:onPlayerHeightChanged();
        end;
    end);
    v6:onScalingChanged();
    return v6;
end;
v5.setHeadScale = function(v9, v10) --[[ Line: 35 ]] --[[ Name: setHeadScale ]]
    -- upvalues: l_VRService_0 (copy), l_UserGameSettings_0 (copy)
    if l_VRService_0.AutomaticScaling ~= Enum.VRScaling.World then
        return;
    else
        local l_v9_SubjectHeight_0 = v9:GetSubjectHeight(v10);
        if not l_v9_SubjectHeight_0 or l_v9_SubjectHeight_0 <= 0 then
            return;
        else
            local v12 = -l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y;
            local v13 = nil;
            v13 = if v12 < 0.8 * l_UserGameSettings_0.PlayerHeight then l_v9_SubjectHeight_0 / l_UserGameSettings_0.PlayerHeight else l_v9_SubjectHeight_0 / v12;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if not l_CurrentCamera_0 then
                return;
            else
                l_CurrentCamera_0.HeadScale = v13;
                return;
            end;
        end;
    end;
end;
v5.GetSubjectHeight = function(_, v16) --[[ Line: 64 ]] --[[ Name: GetSubjectHeight ]]
    local l_Humanoid_0 = v16:FindFirstChild("Humanoid");
    if l_Humanoid_0 and l_Humanoid_0:GetState() == Enum.HumanoidStateType.Dead then
        return;
    else
        local v18 = l_Humanoid_0 and l_Humanoid_0.RootPart or v16:FindFirstChild("HumanoidRootPart");
        if v18 and l_Humanoid_0 then
            local l_HipHeight_0 = l_Humanoid_0.HipHeight;
            if l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
                l_HipHeight_0 = 2;
            end;
            if l_Humanoid_0.AutomaticScalingEnabled then
                local v20 = v18.Size.Y / 2 + 0.5;
                return v18.Size.Y / 2 + l_HipHeight_0 + v20 + l_Humanoid_0.CameraOffset.Y;
            else
                return v18.Size.Y / 2 + l_HipHeight_0 + 2 + l_Humanoid_0.CameraOffset.Y;
            end;
        else
            return nil;
        end;
    end;
end;
v5.onPlayerHeightChanged = function(v21) --[[ Line: 93 ]] --[[ Name: onPlayerHeightChanged ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character then
        v21:setHeadScale(l_Players_0.LocalPlayer.Character);
    end;
end;
v5.onScalingChanged = function(v22) --[[ Line: 100 ]] --[[ Name: onScalingChanged ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.AutomaticScaling == Enum.VRScaling.World then
        if not v22.characterChangedConnection then
            v22.characterChangedConnection = v22.avatarUtil:connectLocalCharacterChanges(function(v23) --[[ Line: 104 ]]
                -- upvalues: v22 (copy)
                v22:setHeadScale(v23);
            end);
            return;
        end;
    elseif v22.characterChangedConnection then
        v22.characterChangedConnection:Disconnect();
        v22.characterChangedConnection = nil;
    end;
end;
return v5.new();