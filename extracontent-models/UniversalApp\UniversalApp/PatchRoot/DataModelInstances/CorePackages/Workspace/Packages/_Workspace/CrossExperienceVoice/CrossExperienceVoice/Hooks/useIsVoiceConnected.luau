local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_Constants_0 = require(l_script_FirstAncestor_0.dependencies).CrossExperience.Constants;
local v2 = require(l_script_FirstAncestor_0.Hooks.useVoiceStatus);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_Constants_0 (copy)
    return v2() == l_Constants_0.VOICE_STATUS.VOICE_CONNECTED;
end;