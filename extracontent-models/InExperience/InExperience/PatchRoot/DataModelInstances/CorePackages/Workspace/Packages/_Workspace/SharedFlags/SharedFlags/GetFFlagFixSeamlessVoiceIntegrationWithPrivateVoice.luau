game:DefineFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2", false);
local v0 = require(script.Parent.GetFFlagEnableCrossExpVoice);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return v0() and game:GetFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2");
end;