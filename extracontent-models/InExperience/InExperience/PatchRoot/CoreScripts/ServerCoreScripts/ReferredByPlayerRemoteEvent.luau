local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent() then
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "ReferredPlayerJoin";
    l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    l_Players_0.PlayerAdded:Connect(function(v4) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_RemoteEvent_0 (copy)
        local l_v4_JoinData_0 = v4:GetJoinData();
        local v6 = l_v4_JoinData_0 and tonumber(l_v4_JoinData_0.ReferredByPlayerId);
        if v6 and v6 ~= 0 then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v6);
            if l_l_Players_0_PlayerByUserId_0 then
                l_RemoteEvent_0:FireClient(l_l_Players_0_PlayerByUserId_0, v4);
            end;
        end;
    end);
end;