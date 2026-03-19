local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_SoundService_0 = game:GetService("SoundService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v7 = game:DefineFastFlag("DebugLogVoiceDefault", false);
local v8 = game:DefineFastFlag("SetNewDeviceToFalse", false);
local v9 = game:DefineFastFlag("FixNewPlayerCheck", false);
local v10 = game:DefineFastFlag("OnlyMakeInputsForVoiceUsers", false);
local v11 = game:DefineFastFlag("SendLikelySpeakingUsers", false);
local v12 = game:DefineFastFlag("ReceiveLikelySpeakingUsersEventV3", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioInstanceAddedApiEnabled");
local function v14(...) --[[ Line: 19 ]] --[[ Name: log ]]
    -- upvalues: v7 (copy)
    if v7 then
        print("[VoiceDefault]", ...);
    end;
end;
local v15 = {};
for v16 = 7, 80, 2 do
    v15[v16] = (v16 - 7 - 73) ^ 2 / 5329;
end;
v15[80] = 0;
if l_GetFFlagAvatarChatServiceEnabled_0() then
    local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetServerFeaturesAsync, l_AvatarChatService_0);
    if not l_status_0 then
        v14("Failed to get GetServerFeaturesAsync, returning early");
        return;
    else
        local v19 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UniverseAudio);
        local v20 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio);
        if not v19 or not v20 then
            v14("Universe or place not voice enabled, returning early");
            return;
        end;
    end;
end;
local v21 = {};
local v22 = {};
local v23 = {};
local function _(v24, v25) --[[ Line: 60 ]] --[[ Name: upsertDeviceList ]]
    if v24 == nil then
        return {
            [v25] = true
        };
    else
        v24[v25] = true;
        return v24;
    end;
end;
local function v29(v27) --[[ Line: 71 ]] --[[ Name: addEmitterToHead ]]
    -- upvalues: v14 (copy), l_VoiceChatService_0 (copy), v15 (copy)
    local l_AudioEmitter_0 = Instance.new("AudioEmitter");
    l_AudioEmitter_0.Parent = v27;
    l_AudioEmitter_0:AddTag("RbxDefaultVoiceEmitter");
    v14("Adding emitter", l_AudioEmitter_0, " to ", v27);
    if l_VoiceChatService_0.DefaultDistanceAttenuation == Enum.VoiceChatDistanceAttenuationType.Legacy then
        l_AudioEmitter_0:SetDistanceAttenuation(v15);
    end;
    return l_AudioEmitter_0;
end;
local function _(v30, v31) --[[ Line: 85 ]] --[[ Name: hookupDeviceInputToEmitter ]]
    -- upvalues: v29 (copy), v14 (copy)
    local v32 = v29(v30);
    v14("Hooking input device to emitter", v30, v31, v32);
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.Parent = v32;
    l_Wire_0.SourceInstance = v31;
    l_Wire_0.TargetInstance = v32;
end;
local function _(v35) --[[ Line: 98 ]] --[[ Name: untrackDevice ]]
    -- upvalues: v21 (copy), v22 (copy), v14 (copy)
    if v35.Player then
        v21[v35.Player][v35] = nil;
    end;
    local v36 = v22[v35];
    if not v36 then
        v14("Attempting to remove connections from untracked AudioDeviceInput");
        return;
    else
        v36.onPlayerChanged:Disconnect();
        v22[v35] = nil;
        return;
    end;
end;
local function _(v38, v39) --[[ Line: 113 ]] --[[ Name: untrackDeviceForPlayer ]]
    -- upvalues: v21 (copy), v22 (copy), v14 (copy)
    if v39 then
        local v40 = v21[v39];
        if v40 then
            v40[v38] = nil;
        end;
    end;
    local v41 = v22[v38];
    if not v41 then
        v14("Attempting to remove connections from untracked AudioDeviceInput");
        return;
    else
        v41.onPlayerChanged:Disconnect();
        v22[v38] = nil;
        return;
    end;
end;
local function v43(v44) --[[ Line: 130 ]] --[[ Name: trackDevice ]]
    -- upvalues: v21 (copy), v9 (copy), v22 (copy), v14 (copy), v43 (copy)
    local l_Player_0 = v44.Player;
    if l_Player_0 then
        local l_v21_0 = v21;
        local v47 = v21[l_Player_0];
        local v48;
        if v47 == nil then
            v48 = {
                [v44] = true
            };
        else
            v47[v44] = true;
            v48 = v47;
        end;
        l_v21_0[l_Player_0] = v48;
    end;
    local v49 = {};
    local l_l_Player_0_0 = l_Player_0;
    v49.onPlayerChanged = v44:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 138 ]]
        -- upvalues: v9 (ref), v44 (copy), l_l_Player_0_0 (ref), v21 (ref), v22 (ref), v14 (ref), v43 (ref)
        if v9 then
            local l_v44_0 = v44;
            local l_l_l_Player_0_0_0 = l_l_Player_0_0;
            if l_l_l_Player_0_0_0 then
                local v53 = v21[l_l_l_Player_0_0_0];
                if v53 then
                    v53[l_v44_0] = nil;
                end;
            end;
            local v54 = v22[l_v44_0];
            if not v54 then
                v14("Attempting to remove connections from untracked AudioDeviceInput");
            else
                v54.onPlayerChanged:Disconnect();
                v22[l_v44_0] = nil;
            end;
        else
            local l_v44_1 = v44;
            if l_v44_1.Player then
                v21[l_v44_1.Player][l_v44_1] = nil;
            end;
            local v56 = v22[l_v44_1];
            if not v56 then
                v14("Attempting to remove connections from untracked AudioDeviceInput");
            else
                v56.onPlayerChanged:Disconnect();
                v22[l_v44_1] = nil;
            end;
        end;
        l_l_Player_0_0 = v44.Player;
        v43(v44);
    end);
    v22[v44] = v49;
    if v9 then
        v44.Destroying:Connect(function() --[[ Line: 150 ]]
            -- upvalues: v44 (copy), v21 (ref), v22 (ref), v14 (ref)
            local l_v44_2 = v44;
            local l_Player_1 = v44.Player;
            if l_Player_1 then
                local v59 = v21[l_Player_1];
                if v59 then
                    v59[l_v44_2] = nil;
                end;
            end;
            local v60 = v22[l_v44_2];
            if not v60 then
                v14("Attempting to remove connections from untracked AudioDeviceInput");
                return;
            else
                v60.onPlayerChanged:Disconnect();
                v22[l_v44_2] = nil;
                return;
            end;
        end);
    else
        v44.Destroying:Connect(function() --[[ Line: 154 ]]
            -- upvalues: v44 (copy), v21 (ref), v22 (ref), v14 (ref)
            local l_v44_3 = v44;
            if l_v44_3.Player then
                v21[l_v44_3.Player][l_v44_3] = nil;
            end;
            local v62 = v22[l_v44_3];
            if not v62 then
                v14("Attempting to remove connections from untracked AudioDeviceInput");
                return;
            else
                v62.onPlayerChanged:Disconnect();
                v22[l_v44_3] = nil;
                return;
            end;
        end);
    end;
end;
local function v74(v63) --[[ Line: 160 ]] --[[ Name: createAudioDevice ]]
    -- upvalues: v10 (copy), l_VoiceChatService_0 (copy), v14 (copy), v43 (copy), v29 (copy), v23 (copy)
    if v10 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 162 ]]
            -- upvalues: l_VoiceChatService_0 (ref), v63 (copy)
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v63.UserId);
        end);
        if not l_status_1 then
            v14("Error getting voice enabled status: \"", l_result_1, "\"");
        end;
        if not l_status_1 or not l_result_1 then
            return;
        end;
    end;
    local l_AudioDeviceInput_0 = Instance.new("AudioDeviceInput");
    l_AudioDeviceInput_0.Player = v63;
    l_AudioDeviceInput_0.Parent = v63;
    l_AudioDeviceInput_0.Active = false;
    v43(l_AudioDeviceInput_0);
    if v63.Character then
        local l_Character_0 = v63.Character;
        local v68 = v29(l_Character_0);
        v14("Hooking input device to emitter", l_Character_0, l_AudioDeviceInput_0, v68);
        local l_Wire_1 = Instance.new("Wire");
        l_Wire_1.Parent = v68;
        l_Wire_1.SourceInstance = l_AudioDeviceInput_0;
        l_Wire_1.TargetInstance = v68;
    end;
    v23[v63] = v63.CharacterAdded:Connect(function(v70) --[[ Line: 182 ]]
        -- upvalues: l_AudioDeviceInput_0 (copy), v29 (ref), v14 (ref)
        local l_l_AudioDeviceInput_0_0 = l_AudioDeviceInput_0;
        local v72 = v29(v70);
        v14("Hooking input device to emitter", v70, l_l_AudioDeviceInput_0_0, v72);
        local l_Wire_2 = Instance.new("Wire");
        l_Wire_2.Parent = v72;
        l_Wire_2.SourceInstance = l_l_AudioDeviceInput_0_0;
        l_Wire_2.TargetInstance = v72;
    end);
    v14("Creating device for ", v63.Name);
end;
if l_VoiceChatService_0.UseNewAudioApi then
    v14("Using new Audio API, EnableDefaultVoice: ", l_VoiceChatService_0.EnableDefaultVoice);
    if l_VoiceChatService_0.EnableDefaultVoice then
        local l_Players_1 = game:GetService("Players");
        l_Players_1.PlayerAdded:Connect(v74);
        l_Players_1.PlayerRemoving:Connect(function(v76) --[[ Line: 193 ]]
            -- upvalues: v21 (copy), v23 (copy), v14 (copy)
            local v77 = v21[v76];
            local v78 = v23[v76];
            v14(v76.Name, "removed. Deleting instance", v77);
            if v77 then
                v21[v76] = nil;
            end;
            if v78 then
                v78:Disconnect();
            end;
        end);
        for _, v80 in l_Players_1:GetPlayers() do
            v74(v80);
        end;
    end;
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "SetUserActive";
    l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    if l_game_EngineFeature_0 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v82) --[[ Line: 215 ]]
            -- upvalues: v8 (copy), v43 (copy)
            if v82:IsA("AudioDeviceInput") then
                if v8 then
                    v82.Active = false;
                end;
                v43(v82);
            end;
        end);
    else
        game.DescendantAdded:Connect(function(v83) --[[ Line: 225 ]]
            -- upvalues: v8 (copy), v43 (copy)
            if v83:IsA("AudioDeviceInput") then
                if v8 then
                    v83.Active = false;
                end;
                v43(v83);
            end;
        end);
    end;
    for _, v85 in l_SoundService_0:GetAudioInstances() do
        if v85:IsA("AudioDeviceInput") then
            if v8 then
                v85.Active = false;
            end;
            v43(v85);
        end;
    end;
    l_RemoteEvent_0.OnServerEvent:Connect(function(v86, v87) --[[ Line: 246 ]]
        -- upvalues: v21 (copy), v14 (copy)
        local v88 = v21[v86];
        if v88 then
            v14("Setting", v86, "to", v87);
            for v89, _ in v88 do
                v89.Active = v87;
            end;
            return;
        else
            v14("Attempting to set Active property for user", v86, "without saved AudioDeviceInput");
            return;
        end;
    end);
end;
if v11 then
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "SendLikelySpeakingUsers";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v92 = {};
    local v93 = {};
    v14("Setting up likely speaking users");
    l_Players_0.PlayerAdded:Connect(function(v94) --[[ Line: 267 ]]
        -- upvalues: l_VoiceChatService_0 (copy), v93 (copy), v14 (copy), v92 (copy), l_UnreliableRemoteEvent_0 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 268 ]]
            -- upvalues: l_VoiceChatService_0 (ref), v94 (copy)
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v94.UserId);
        end);
        v93[v94.UserId] = true;
        if l_status_2 and l_result_2 then
            v14("Sending likely speaking user for ", v94.Name);
            v92[v94.UserId] = true;
            l_UnreliableRemoteEvent_0:FireAllClients(v92);
            return;
        else
            if not l_status_2 then
                v14("Error getting voice enabled status: ", l_result_2, " for ", v94.Name);
            end;
            return;
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v97) --[[ Line: 281 ]]
        -- upvalues: v92 (copy), v93 (copy)
        v92[v97.UserId] = nil;
        v93[v97.UserId] = nil;
    end);
    if v12 then
        v14("Setting Up ReceiveLikelySpeakingUsers");
        local l_RemoteEvent_1 = Instance.new("RemoteEvent");
        l_RemoteEvent_1.Name = "ReceiveLikelySpeakingUsers";
        l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
        l_RemoteEvent_1.OnServerEvent:Connect(function(v99) --[[ Line: 293 ]]
            -- upvalues: v14 (copy), v93 (copy), l_UnreliableRemoteEvent_0 (copy), v92 (copy)
            v14("Got Ping Request from ", v99.Name);
            if v93[v99.UserId] then
                v93[v99.UserId] = nil;
                l_UnreliableRemoteEvent_0:FireClient(v99, v92);
                v14("Sending likely speaking users to ", v99.Name);
            end;
        end);
    end;
end;