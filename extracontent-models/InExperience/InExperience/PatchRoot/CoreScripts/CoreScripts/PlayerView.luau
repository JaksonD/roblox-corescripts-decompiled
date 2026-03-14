local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_PlayerViewService_0 = game:GetService("PlayerViewService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFIntPlayerViewRemoteEventTimeout)();
local v5 = l_RobloxReplicatedStorage_0:WaitForChild("RequestDeviceCameraCFrame", v4);
local v6 = l_RobloxReplicatedStorage_0:WaitForChild("ReplicateDeviceCameraCFrame", v4);
local l_game_EngineFeature_0 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
if v5 and v6 then
    v6.OnClientEvent:Connect(function(v8, v9, v10) --[[ Line: 19 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), l_PlayerViewService_0 (copy)
        if l_game_EngineFeature_0 then
            l_PlayerViewService_0:UpdateDeviceCFrame(v8, v9, v10);
        end;
    end);
    v5.OnClientEvent:Connect(function() --[[ Line: 24 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), l_PlayerViewService_0 (copy)
        if l_game_EngineFeature_0 then
            l_PlayerViewService_0:OnCameraCFrameReplicationRequest();
        end;
    end);
    return;
else
    warn("PlayerViewService failed to initialize.");
    return;
end;