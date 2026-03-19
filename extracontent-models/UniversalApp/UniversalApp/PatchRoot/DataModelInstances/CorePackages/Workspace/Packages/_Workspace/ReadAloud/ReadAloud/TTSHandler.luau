local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.TextUtility);
local v2 = require(l_Parent_0.Properties);
local v3 = require(l_Parent_0.TTSHandlerState);
local v4 = require(l_Parent_0.SystemReadoutText);
local v5 = require(l_Parent_0.AudioTTSTape);
local v6 = require(l_Parent_0.CreateLogger);
local v7 = require(l_Parent_0.getFFlagReadAloudDebugPrintouts)();
local v8 = if v7 then v6(script.Name) else nil;
local v9 = {};
v9.__index = v9;
v9.SetVolume = function(v10, v11) --[[ Line: 64 ]] --[[ Name: SetVolume ]]
    v11 = math.clamp(v11, 0, 3);
    v10.TTSTape:SetVolume(v11);
    v10.systemAudioTTS.Volume = v11;
end;
v9.SetVoiceId = function(v12, v13) --[[ Line: 69 ]] --[[ Name: SetVoiceId ]]
    local v14 = tostring((math.clamp(math.round(v13), 1, 8)));
    v12.TTSTape:SetVoiceId(v14);
    v12.systemAudioTTS.VoiceId = v14;
end;
v9.SetPitch = function(v15, v16) --[[ Line: 74 ]] --[[ Name: SetPitch ]]
    v16 = math.clamp(v16, -12, 12);
    v15.TTSTape:SetPitch(v16);
    v15.systemAudioTTS.Pitch = v16;
end;
v9.SetSpeed = function(v17, v18) --[[ Line: 79 ]] --[[ Name: SetSpeed ]]
    v18 = math.clamp(v18, 0.5, 2);
    v17.TTSTape:SetSpeed(v18);
    v17.systemAudioTTS.Speed = v18;
end;
v9.SetText = function(v19, v20) --[[ Line: 85 ]] --[[ Name: SetText ]]
    -- upvalues: v1 (copy)
    v19.originalText = v20;
    v19.cleanedText = v1.cleanText(v20);
    v19.splitText = v1.splitTextToReadableChunks(v19.cleanedText);
    v19.TTSTape:SetTextChunks(v19.splitText);
end;
v9.UpdateSettings = function(v21, v22, v23, v24, v25) --[[ Line: 94 ]] --[[ Name: UpdateSettings ]]
    -- upvalues: v2 (copy)
    v21:SetVolume(v22 or v2.DefaultVolume);
    v21:SetVoiceId(v23 or v2.DefaultVoiceId);
    v21:SetPitch(v24 or v2.DefaultPitch);
    v21:SetSpeed(v25 or v2.DefaultSpeed);
end;
v9.SetState = function(v26, v27) --[[ Line: 102 ]] --[[ Name: SetState ]]
    v26.State = v27;
    v26.StateChanged:Fire();
end;
v9.Play = function(v28) --[[ Line: 108 ]] --[[ Name: Play ]]
    -- upvalues: v3 (copy), v8 (copy), v7 (copy)
    if not v28.TTSTape:IsLoaded() then
        v28:SetState(v3.Loading);
        local v29 = v28.TTSTape:Load();
        local l_status_0 = v29.status;
        local l_time_0 = v29.time;
        if l_status_0 ~= Enum.AssetFetchStatus.Success then
            v8:error("TTSHandler failed to load audio, with status", l_status_0);
            v28.State = "Idle";
            v28:ReadSystemTextFromKey("FailedToRead");
            return;
        elseif v7 then
            v8:info((("Loaded audio in %* seconds"):format(l_time_0)));
        end;
    end;
    v28:SetState(v3.Playing);
    v28.TTSTape:Play();
end;
v9.Pause = function(v32) --[[ Line: 132 ]] --[[ Name: Pause ]]
    -- upvalues: v3 (copy)
    v32:SetState(v3.Paused);
    v32.TTSTape:Pause();
end;
v9.ReadSystemTextFromKey = function(v33, v34) --[[ Line: 137 ]] --[[ Name: ReadSystemTextFromKey ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy)
    local v35 = v4[v34];
    if v7 then
        v8:info("TTSHandler system is reading", v4[v34]);
    end;
    v33.systemAudioTTS.Text = v35;
    v33.systemAudioTTS:LoadAsync();
    v33.systemAudioTTS:Play();
end;
v9.CleanUp = function(v36) --[[ Line: 148 ]] --[[ Name: CleanUp ]]
    local l_instanceFolder_0 = v36.instanceFolder;
    if l_instanceFolder_0 then
        v36.instanceFolder = nil;
        l_instanceFolder_0:Destroy();
    end;
end;
v9.__gc = function(v38) --[[ Line: 155 ]] --[[ Name: __gc ]]
    v38:CleanUp();
end;
v9.new = function(v39, v40, v41, v42, v43, v44) --[[ Line: 161 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v3 (copy), v5 (copy), v2 (copy), v7 (copy), v8 (copy)
    local v45 = {};
    setmetatable(v45, v9);
    v45.StateChanged = Instance.new("BindableEvent");
    v45:SetState(v3.Idle);
    v45.originalText = "";
    v45.cleanedText = "";
    v45.splitText = {};
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Read Aloud";
    l_Folder_0.Parent = workspace;
    v45.instanceFolder = l_Folder_0;
    local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
    l_AudioDeviceOutput_0.Parent = l_Folder_0;
    local l_AudioTextToSpeech_0 = Instance.new("AudioTextToSpeech");
    l_AudioTextToSpeech_0.Name = "System Readout";
    l_AudioTextToSpeech_0.Parent = l_Folder_0;
    v45.systemAudioTTS = l_AudioTextToSpeech_0;
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.Parent = l_AudioTextToSpeech_0;
    l_Wire_0.SourceInstance = l_AudioTextToSpeech_0;
    l_Wire_0.TargetInstance = l_AudioDeviceOutput_0;
    v45.TTSTape = v5.new(v43 or 1 + v2.NumPreloadedAudioChunks, v44 or v2.PreloadNextDelay, l_Folder_0, l_AudioDeviceOutput_0);
    v45.TTSTape.AudioEnded.Event:Connect(function() --[[ Line: 205 ]]
        -- upvalues: v45 (copy), v3 (ref)
        v45:SetState(v3.Idle);
    end);
    v45:UpdateSettings(v39, v40, v41, v42);
    if v7 then
        v45.StateChanged.Event:Connect(function() --[[ Line: 212 ]]
            -- upvalues: v8 (ref), v45 (copy)
            v8:info((("TTSHandler updated state to %*"):format(v45.State)));
        end);
    end;
    return v45;
end;
return v9;