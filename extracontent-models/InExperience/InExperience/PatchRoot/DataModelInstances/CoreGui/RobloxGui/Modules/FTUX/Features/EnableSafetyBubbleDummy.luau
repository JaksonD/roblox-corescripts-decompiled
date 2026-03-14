local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Workspace_0 = game:GetService("Workspace");
local v5 = require(script.Parent.Parent.Utility.GenerateDummy);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_FIntSafetyBubbleRadius_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).FIntSafetyBubbleRadius;
local v8 = require(l_CorePackages_0.Workspace.Packages.VrCommon).FIntSafetyBubbleTransparencyPercent * 0.01;
local v9 = true;
local v10 = math.max(l_FIntSafetyBubbleRadius_0 * l_CurrentCamera_0.HeadScale, 0.1);
local v11 = nil;
initDummy = function() --[[ Line: 22 ]] --[[ Name: initDummy ]]
    -- upvalues: v11 (ref), v5 (copy), l_Workspace_0 (copy)
    v11 = v5(Vector3.new(0, 8.800000190734863, -50.5, 0), (Vector3.new(0, 180, 0, 0)));
    v11.Parent = l_Workspace_0;
end;
local function v18(_, v13) --[[ Line: 27 ]] --[[ Name: calculateTransparency ]]
    -- upvalues: l_VRService_0 (copy), l_CurrentCamera_0 (copy), v11 (ref), v10 (copy), v8 (copy)
    if not v13 then
        return 0;
    else
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local l_Magnitude_0 = ((l_CurrentCamera_0.CFrame * l_l_VRService_0_UserCFrame_0).Position - v11.HumanoidRootPart.Position).Magnitude;
        local _ = 0;
        local v17 = v10 * 0.75;
        return (math.clamp(if l_Magnitude_0 < v17 then v8 else (1 - (l_Magnitude_0 - v17) / (v10 - v17)) * v8, 0, 1));
    end;
end;
EnableSafetyBubbleDummy = function() --[[ Line: 50 ]] --[[ Name: EnableSafetyBubbleDummy ]]
    -- upvalues: v11 (ref), l_UserGameSettings_0 (copy), v9 (ref), v18 (copy), l_RunService_0 (copy)
    initDummy();
    local function v24() --[[ Line: 53 ]] --[[ Name: onStep ]]
        -- upvalues: v11 (ref), l_UserGameSettings_0 (ref), v9 (ref), v18 (ref)
        local l_v11_Children_0 = v11:GetChildren();
        if l_UserGameSettings_0.VRSafetyBubbleMode == Enum.VRSafetyBubbleMode.Anyone then
            v9 = false;
        else
            v9 = true;
        end;
        for _, v21 in ipairs(game.Players:GetPlayers()) do
            if v21.Character then
                local v22 = v18(v21, v9);
                v11.Head.Face.Transparency = v22;
                for v23 = 1, #l_v11_Children_0 do
                    if l_v11_Children_0[v23]:IsA("Part") then
                        l_v11_Children_0[v23].Transparency = v22;
                    end;
                end;
            end;
        end;
    end;
    l_RunService_0.Stepped:Connect(v24);
end;
return EnableSafetyBubbleDummy;