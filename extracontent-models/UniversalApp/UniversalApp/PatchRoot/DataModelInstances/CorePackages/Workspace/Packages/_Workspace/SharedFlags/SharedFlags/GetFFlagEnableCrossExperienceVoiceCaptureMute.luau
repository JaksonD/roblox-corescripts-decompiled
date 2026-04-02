local v0 = require(script.Parent.GetFFlagEnableCrossExpVoice);
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetEngineFeature("CrossExperienceVoiceMuteAll");
end;