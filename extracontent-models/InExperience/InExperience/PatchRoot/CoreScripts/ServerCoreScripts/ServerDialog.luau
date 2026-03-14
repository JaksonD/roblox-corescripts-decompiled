local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "SetDialogInUse";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local v3 = {};
local function v7(v4, v5, v6) --[[ Line: 10 ]] --[[ Name: setDialogInUse ]]
    -- upvalues: v3 (copy)
    if typeof(v5) ~= "Instance" or not v5:IsA("Dialog") then
        return;
    elseif type(v6) ~= "boolean" then
        return;
    elseif typeof(v4) ~= "Instance" or not v4:IsA("Player") then
        return;
    else
        if v5 then
            v5:SetPlayerIsUsing(v4, v6);
            v3[v4] = v6 and v5 or nil;
        end;
        return;
    end;
end;
l_Players_0.PlayerRemoving:Connect(function(v8) --[[ Line: 29 ]]
    -- upvalues: v3 (copy)
    local v9 = v3[v8];
    if v9 then
        v9:SetPlayerIsUsing(v8, false);
        v3[v8] = nil;
    end;
end);
l_RemoteEvent_0.OnServerEvent:Connect(v7);