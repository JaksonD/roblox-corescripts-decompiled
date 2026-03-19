local l_SoundService_0 = game:GetService("SoundService");
return function() --[[ Line: 25 ]] --[[ Name: enableAudioPlaybackInApp ]]
    -- upvalues: l_SoundService_0 (copy)
    if game:GetEngineFeature("SoundServiceSetSoundEnabled") then
        l_SoundService_0:SetSoundEnabled(true);
    end;
end;