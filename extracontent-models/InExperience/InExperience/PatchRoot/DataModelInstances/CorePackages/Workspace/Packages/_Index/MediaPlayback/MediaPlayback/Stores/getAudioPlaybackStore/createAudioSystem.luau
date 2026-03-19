local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_script_FirstAncestor_0.Common.assetIdAsContent);
local function v8(v3) --[[ Line: 14 ]] --[[ Name: getOrCreateInstances ]]
    local l_AudioPlayback_0 = v3:FindFirstChild("AudioPlayback");
    local v5 = if l_AudioPlayback_0 then l_AudioPlayback_0:FindFirstChildWhichIsA("AudioDeviceOutput") else nil;
    if l_AudioPlayback_0 and v5 then
        return {
            container = l_AudioPlayback_0, 
            audioOutput = v5
        };
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "AudioPlayback";
        local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
        l_AudioDeviceOutput_0.Parent = l_Folder_0;
        l_Folder_0.Parent = v3;
        return {
            container = l_Folder_0, 
            audioOutput = l_AudioDeviceOutput_0
        };
    end;
end;
return function(v9) --[[ Line: 42 ]] --[[ Name: createAudioSystem ]]
    -- upvalues: v8 (copy), l_CoreGui_0 (copy), v2 (copy)
    local v10 = v8(l_CoreGui_0);
    local l_AudioPlayer_0 = Instance.new("AudioPlayer");
    l_AudioPlayer_0.Asset = v2(v9);
    l_AudioPlayer_0.Name = ("AudioPlayer_%*"):format(l_AudioPlayer_0.Asset);
    l_AudioPlayer_0.Parent = v10.container;
    l_AudioPlayer_0.PlaybackSpeed = 0;
    l_AudioPlayer_0:Play();
    local function v12() --[[ Line: 71 ]] --[[ Name: destroy ]]
        -- upvalues: l_AudioPlayer_0 (copy), v10 (copy)
        l_AudioPlayer_0:Destroy();
        if not v10.container:FindFirstChildWhichIsA("AudioPlayer") then
            v10.container:Destroy();
        end;
    end;
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = l_AudioPlayer_0;
    l_Wire_0.TargetInstance = v10.audioOutput;
    l_Wire_0.Parent = l_AudioPlayer_0;
    return {
        audioPlayer = l_AudioPlayer_0, 
        destroy = v12
    };
end;