local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local _ = game:GetService("StarterPlayer");
local l_Common_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common");
local l_RagdollRigging_0 = require(l_Common_0:FindFirstChild("RagdollRigging"));
local l_HumanoidReadyUtil_0 = require(l_Common_0:FindFirstChild("HumanoidReadyUtil"));
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = l_RobloxReplicatedStorage_0:WaitForChild("DeathType", 1e999);
if not v9 or not l_game_EngineFeature_0 and v9.Value ~= "Ragdoll" then
    return;
else
    local v10 = nil;
    if not l_game_EngineFeature_0 then
        v10 = l_RobloxReplicatedStorage_0:WaitForChild("OnRagdoll", 1e999);
        if not v10 or not v10:IsA("RemoteEvent") then
            return;
        end;
    end;
    local function v15(v11, v12) --[[ Line: 36 ]] --[[ Name: onOwnedHumanoidDeath ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v9 (copy), l_RagdollRigging_0 (copy), v10 (ref)
        if l_game_EngineFeature_0 then
            if v9.Value == "Ragdoll" then
                l_RagdollRigging_0.disableMotors(v11, v12.RigType);
                return;
            end;
        else
            local v13 = l_RagdollRigging_0.disableMotors(v11, v12.RigType);
            local l_Animator_0 = v12:FindFirstChildWhichIsA("Animator");
            if l_Animator_0 then
                l_Animator_0:ApplyJointVelocities(v13);
            end;
            v10:FireServer(v12);
            wait(0.1);
            l_RagdollRigging_0.easeJointFriction_OLD(v11, 0.85);
        end;
    end;
    l_HumanoidReadyUtil_0.registerHumanoidReady(function(v16, v17, v18) --[[ Line: 91 ]]
        -- upvalues: v9 (copy), l_RagdollRigging_0 (copy), l_LocalPlayer_0 (ref), v15 (copy)
        local v19 = nil;
        local v20 = nil;
        local function _() --[[ Line: 94 ]] --[[ Name: disconnect ]]
            -- upvalues: v19 (ref), v20 (ref)
            v19:Disconnect();
            v20:Disconnect();
        end;
        v20 = v18.Died:Connect(function() --[[ Line: 100 ]]
            -- upvalues: v19 (ref), v20 (ref), v9 (ref), l_RagdollRigging_0 (ref), v17 (copy), v16 (copy), l_LocalPlayer_0 (ref), v15 (ref), v18 (copy)
            v19:Disconnect();
            v20:Disconnect();
            if v9.Value == "Ragdoll" then
                delay(2, function() --[[ Line: 105 ]]
                    -- upvalues: l_RagdollRigging_0 (ref), v17 (ref)
                    l_RagdollRigging_0.disableParticleEmittersAndFadeOut(v17, 0.4);
                end);
            end;
            if v16 == l_LocalPlayer_0 then
                v15(v17, v18);
            end;
        end);
        v19 = v16.CharacterRemoving:Connect(function(v22) --[[ Line: 117 ]]
            -- upvalues: v17 (copy), v19 (ref), v20 (ref)
            if v22 == v17 then
                v19:Disconnect();
                v20:Disconnect();
            end;
        end);
    end);
    return;
end;