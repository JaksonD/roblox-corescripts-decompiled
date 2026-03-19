game:DefineFastFlag("UseAudioInstanceAdded", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("UseAudioInstanceAdded") and game:GetEngineFeature("AudioInstanceAddedApiEnabled");
end;