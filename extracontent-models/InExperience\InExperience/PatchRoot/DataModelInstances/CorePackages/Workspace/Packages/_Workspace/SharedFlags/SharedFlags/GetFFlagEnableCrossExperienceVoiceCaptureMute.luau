local v0 = require(script.Parent.GetFFlagEnableCrossExpVoice);
game:DefineFastFlag("EnableCrossExperienceCaptureMute", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("EnableCrossExperienceCaptureMute") and v0() and game:GetEngineFeature("CrossExperienceVoiceMuteAll");
end;