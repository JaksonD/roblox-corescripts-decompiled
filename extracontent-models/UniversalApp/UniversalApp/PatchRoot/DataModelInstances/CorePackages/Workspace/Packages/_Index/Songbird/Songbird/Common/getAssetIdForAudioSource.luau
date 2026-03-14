return function(v0) --[[ Line: 1 ]] --[[ Name: getAssetIdForAudioSource ]]
    local _ = nil;
    return (tonumber(((if v0:IsA("Sound") then v0.SoundId else if v0:IsA("AudioPlayer") then v0.Asset else nil):match("rbxassetid://(.+)"))));
end;