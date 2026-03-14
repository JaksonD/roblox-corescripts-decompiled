local l_SoundService_0 = game:GetService("SoundService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function _() --[[ Line: 7 ]] --[[ Name: ShouldUseDefaultVoice ]]
    -- upvalues: l_SoundService_0 (copy), l_VoiceChatService_0 (copy)
    local v5 = false;
    if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default then
        v5 = false;
        if l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled then
            v5 = l_VoiceChatService_0.EnableDefaultVoice;
        end;
    end;
    return v5;
end;
local function _() --[[ Line: 13 ]] --[[ Name: ShouldUseCamera ]]
    -- upvalues: l_SoundService_0 (copy)
    return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera;
end;
local function _() --[[ Line: 17 ]] --[[ Name: ShouldUseCharacter ]]
    -- upvalues: l_SoundService_0 (copy)
    return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character;
end;
local function _() --[[ Line: 21 ]] --[[ Name: ShouldSpawnListener ]]
    -- upvalues: l_SoundService_0 (copy), l_VoiceChatService_0 (copy)
    if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.None then
        return false;
    else
        return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default and l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled and l_VoiceChatService_0.EnableDefaultVoice;
    end;
end;
local function _(v10, v11) --[[ Line: 28 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v10;
    l_Wire_0.TargetInstance = v11;
    l_Wire_0.Parent = v10;
    return l_Wire_0;
end;
local function _() --[[ Line: 36 ]] --[[ Name: GetMainOut ]]
    -- upvalues: l_SoundService_0 (copy)
    local l_l_SoundService_0_FirstChildWhichIsA_0 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
    if not l_l_SoundService_0_FirstChildWhichIsA_0 then
        local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
        l_AudioDeviceOutput_0.Parent = l_SoundService_0;
        l_l_SoundService_0_FirstChildWhichIsA_0 = l_AudioDeviceOutput_0;
    end;
    return l_l_SoundService_0_FirstChildWhichIsA_0;
end;
local function v17(v18) --[[ Line: 46 ]] --[[ Name: SpawnCharacterListener ]]
    -- upvalues: v17 (copy), l_SoundService_0 (copy), l_RunService_0 (copy)
    local l_PrimaryPart_0 = v18.PrimaryPart;
    if not l_PrimaryPart_0 then
        v18:GetPropertyChangedSignal("PrimaryPart"):Once(function() --[[ Line: 49 ]]
            -- upvalues: v17 (ref), v18 (copy)
            v17(v18);
        end);
        return;
    else
        local l_Attachment_0 = Instance.new("Attachment");
        local function v23() --[[ Line: 56 ]] --[[ Name: UpdateCFrame ]]
            -- upvalues: l_Attachment_0 (copy)
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if not l_CurrentCamera_0 then
                return;
            else
                local l_Rotation_0 = l_CurrentCamera_0.CFrame.Rotation;
                l_Attachment_0.WorldAxis = l_Rotation_0.XVector;
                l_Attachment_0.WorldSecondaryAxis = l_Rotation_0.YVector;
                return;
            end;
        end;
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if l_CurrentCamera_1 then
            local l_Rotation_1 = l_CurrentCamera_1.CFrame.Rotation;
            l_Attachment_0.WorldAxis = l_Rotation_1.XVector;
            l_Attachment_0.WorldSecondaryAxis = l_Rotation_1.YVector;
        end;
        l_CurrentCamera_1 = Instance.new("AudioListener");
        l_CurrentCamera_1.Parent = l_Attachment_0;
        l_Attachment_0.Parent = l_PrimaryPart_0;
        local l_l_SoundService_0_FirstChildWhichIsA_1 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
        if not l_l_SoundService_0_FirstChildWhichIsA_1 then
            local l_AudioDeviceOutput_1 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_1.Parent = l_SoundService_0;
            l_l_SoundService_0_FirstChildWhichIsA_1 = l_AudioDeviceOutput_1;
        end;
        local l_l_l_SoundService_0_FirstChildWhichIsA_1_0 = l_l_SoundService_0_FirstChildWhichIsA_1;
        l_l_SoundService_0_FirstChildWhichIsA_1 = Instance.new("Wire");
        l_l_SoundService_0_FirstChildWhichIsA_1.SourceInstance = l_CurrentCamera_1;
        l_l_SoundService_0_FirstChildWhichIsA_1.TargetInstance = l_l_l_SoundService_0_FirstChildWhichIsA_1_0;
        l_l_SoundService_0_FirstChildWhichIsA_1.Parent = l_CurrentCamera_1;
        l_l_SoundService_0_FirstChildWhichIsA_1 = l_RunService_0.Heartbeat:Connect(v23);
        local v29 = nil;
        v29 = l_Attachment_0.AncestryChanged:Connect(function() --[[ Line: 76 ]]
            -- upvalues: l_Attachment_0 (copy), l_l_SoundService_0_FirstChildWhichIsA_1 (copy), v29 (ref)
            if not l_Attachment_0:IsDescendantOf(game) then
                l_l_SoundService_0_FirstChildWhichIsA_1:Disconnect();
                v29:Disconnect();
            end;
        end);
        return;
    end;
end;
local v30 = false;
local function v39() --[[ Line: 86 ]] --[[ Name: Initialize ]]
    -- upvalues: l_SoundService_0 (copy), l_VoiceChatService_0 (copy), v30 (ref), l_LocalPlayer_0 (copy), v17 (copy)
    if not (l_SoundService_0.DefaultListenerLocation ~= Enum.ListenerLocation.None and (l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default and l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled and l_VoiceChatService_0.EnableDefaultVoice)) then
        return;
    elseif v30 then
        return;
    else
        if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                v17(l_Character_0);
            end;
            l_LocalPlayer_0.CharacterAdded:Connect(v17);
        elseif l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera then
            local l_l_SoundService_0_FirstChildWhichIsA_2 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
            if not l_l_SoundService_0_FirstChildWhichIsA_2 then
                local l_AudioDeviceOutput_2 = Instance.new("AudioDeviceOutput");
                l_AudioDeviceOutput_2.Parent = l_SoundService_0;
                l_l_SoundService_0_FirstChildWhichIsA_2 = l_AudioDeviceOutput_2;
            end;
            local l_l_l_SoundService_0_FirstChildWhichIsA_2_0 = l_l_SoundService_0_FirstChildWhichIsA_2;
            l_l_SoundService_0_FirstChildWhichIsA_2 = Instance.new("AudioListener");
            l_l_SoundService_0_FirstChildWhichIsA_2.Parent = workspace.CurrentCamera;
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = l_l_SoundService_0_FirstChildWhichIsA_2;
            l_Wire_1.TargetInstance = l_l_l_SoundService_0_FirstChildWhichIsA_2_0;
            l_Wire_1.Parent = l_l_SoundService_0_FirstChildWhichIsA_2;
        else
            local v36 = false;
            if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default then
                v36 = false;
                if l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled then
                    v36 = l_VoiceChatService_0.EnableDefaultVoice;
                end;
            end;
            if v36 then
                v36 = Instance.new("AudioListener");
                v36.Parent = workspace.CurrentCamera;
                local l_Wire_2 = Instance.new("Wire");
                l_Wire_2.Parent = v36;
                local l_AudioDeviceOutput_3 = Instance.new("AudioDeviceOutput");
                l_AudioDeviceOutput_3.Parent = l_Wire_2;
                l_Wire_2.SourceInstance = v36;
                l_Wire_2.TargetInstance = l_AudioDeviceOutput_3;
            end;
        end;
        v30 = true;
        return;
    end;
end;
v39();
l_SoundService_0:GetPropertyChangedSignal("DefaultListenerLocation"):Connect(v39);
l_VoiceChatService_0:GetPropertyChangedSignal("UseAudioApi"):Connect(v39);
l_VoiceChatService_0:GetPropertyChangedSignal("EnableDefaultVoice"):Connect(v39);