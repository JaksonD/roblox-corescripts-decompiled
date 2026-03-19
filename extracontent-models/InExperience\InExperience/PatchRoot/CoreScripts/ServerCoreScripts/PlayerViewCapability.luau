local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999);
assert(v2 ~= nil, "RobloxGui should exist");
local v3 = require(v2.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled);
local v4 = game:DefineFastFlag("EnablePlayerViewRemoteEventUserIdValidation2", false);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "RequestDeviceCameraOrientationCapability";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local v6 = {};
l_RemoteEvent_0.OnServerEvent:Connect(function(v7, v8) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_RemoteEvent_0 (copy)
    local v9 = os.clock();
    local v10 = v6[v7.UserId];
    if v10 and v9 - v10 < 2 then
        return;
    elseif typeof(v8) ~= "Instance" or not v8:IsA("Player") then
        return;
    else
        v6[v7.UserId] = v9;
        local l_OsPlatform_0 = v8.OsPlatform;
        local l_l_RemoteEvent_0_0 = l_RemoteEvent_0;
        local l_v7_0 = v7;
        local l_v8_0 = v8;
        local v15 = true;
        if l_OsPlatform_0 ~= "iOS" then
            v15 = l_OsPlatform_0 == "Android";
        end;
        l_l_RemoteEvent_0_0:FireClient(l_v7_0, l_v8_0, v15);
        return;
    end;
end);
l_Players_0.PlayerRemoving:Connect(function(v16) --[[ Line: 37 ]]
    -- upvalues: v6 (copy)
    v6[v16.UserId] = nil;
end);
if v3() then
    local l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "RequestDeviceCameraCFrame";
    l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "ReplicateDeviceCameraCFrame";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v19 = {};
    l_Players_0.PlayerRemoving:Connect(function(v20) --[[ Line: 52 ]]
        -- upvalues: v19 (copy)
        v19[tostring(v20.UserId)] = nil;
    end);
    l_RemoteEvent_1.OnServerEvent:Connect(function(v21, v22) --[[ Line: 57 ]]
        -- upvalues: v4 (copy), l_Players_0 (copy), v19 (copy), l_RemoteEvent_1 (copy)
        if v4 then
            if typeof(v22) ~= "number" or v22 <= 0 or v21.UserId == v22 or math.floor(v22) ~= v22 then
                return;
            end;
        elseif typeof(v22) ~= "number" or v22 <= 0 or v21.UserId == v22 then
            return;
        end;
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v22);
        if not l_l_Players_0_PlayerByUserId_0 then
            return;
        else
            local v24 = tostring(l_l_Players_0_PlayerByUserId_0.UserId);
            if not v19[v24] then
                v19[v24] = {};
            end;
            v19[v24][tostring(v21.UserId)] = os.clock();
            l_RemoteEvent_1:FireClient(l_l_Players_0_PlayerByUserId_0);
            return;
        end;
    end);
    l_UnreliableRemoteEvent_0.OnServerEvent:Connect(function(v25, v26, v27) --[[ Line: 83 ]]
        -- upvalues: v19 (copy), l_Players_0 (copy), l_UnreliableRemoteEvent_0 (copy)
        if typeof(v26) ~= "CFrame" or typeof(v27) ~= "number" or v27 <= 0 then
            return;
        else
            local v28 = tostring(v25.UserId);
            if v19[v28] then
                local v29 = {};
                for v30, v31 in v19[v28] do
                    if os.clock() - v31 > 5 then
                        table.insert(v29, v30);
                    else
                        local v32 = tonumber(v30);
                        if v32 then
                            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v32);
                            if l_l_Players_0_PlayerByUserId_1 then
                                l_UnreliableRemoteEvent_0:FireClient(l_l_Players_0_PlayerByUserId_1, v25, v26, v27);
                            end;
                        end;
                    end;
                end;
                for _, v35 in v29 do
                    v19[v28][v35] = nil;
                end;
            end;
            return;
        end;
    end);
end;