local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = game:DefineFastInt("PartyVoiceAudioFaderVolumePerc", 100);
local l_game_EngineFeature_1 = game:GetEngineFeature("AudioPlayerUpdateAssetAPI");
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v8 = {
        audioPlayers = {}, 
        isInitialized = false, 
        sfxAudioFader = nil, 
        onPartyVoiceVolumeChangedSignal = nil
    };
    setmetatable(v8, v7);
    return v8;
end;
v7.addSound = function(v9, v10, v11) --[[ Line: 28 ]] --[[ Name: addSound ]]
    -- upvalues: l_game_EngineFeature_1 (copy)
    local l_AudioPlayer_0 = Instance.new("AudioPlayer");
    l_AudioPlayer_0.Parent = workspace;
    if l_game_EngineFeature_1 then
        l_AudioPlayer_0.Asset = v11;
    else
        l_AudioPlayer_0.AssetId = v11;
    end;
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.Parent = workspace;
    l_Wire_0.SourceInstance = l_AudioPlayer_0;
    l_Wire_0.TargetInstance = v9.sfxAudioFader;
    v9.audioPlayers[v10] = l_AudioPlayer_0;
end;
v7.initialize = function(v14) --[[ Line: 46 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy), l_ReplicatedStorage_0 (copy), l_game_EngineFeature_0 (copy), l_UserGameSettings_0 (copy)
    if v5 ~= 100 then
        l_ReplicatedStorage_0:WaitForChild("AudioFader").Volume = v5 / 100;
    end;
    local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
    l_AudioDeviceOutput_0.Parent = workspace;
    local l_AudioFader_0 = Instance.new("AudioFader");
    l_AudioFader_0.Parent = workspace;
    if v5 ~= 100 then
        l_AudioFader_0.Volume = v5 / 100;
    end;
    local l_Wire_1 = Instance.new("Wire");
    l_Wire_1.Parent = workspace;
    l_Wire_1.SourceInstance = l_AudioFader_0;
    l_Wire_1.TargetInstance = l_AudioDeviceOutput_0;
    v14.sfxAudioFader = l_AudioFader_0;
    v14:addSound("join", "rbxassetid://87296803139875");
    v14:addSound("leave", "rbxassetid://108128059974752");
    v14.isInitialized = true;
    if l_game_EngineFeature_0 then
        v14.onPartyVoiceVolumeChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function() --[[ Line: 75 ]]
            -- upvalues: v14 (copy)
            v14:playSound("join");
        end);
    end;
end;
v7.playSound = function(v18, v19) --[[ Line: 81 ]] --[[ Name: playSound ]]
    if not v18.isInitialized then
        v18:initialize();
    end;
    if not v18.isInitialized or not v18.audioPlayers[v19] then
        return;
    else
        v18.audioPlayers[v19].TimePosition = 0;
        v18.audioPlayers[v19]:Play();
        return;
    end;
end;
v7.disconnect = function(v20) --[[ Line: 94 ]] --[[ Name: disconnect ]]
    if v20.onPartyVoiceVolumeChangedSignal then
        v20.onPartyVoiceVolumeChangedSignal:Disconnect();
    end;
end;
v7.default = v7.new();
return v7;