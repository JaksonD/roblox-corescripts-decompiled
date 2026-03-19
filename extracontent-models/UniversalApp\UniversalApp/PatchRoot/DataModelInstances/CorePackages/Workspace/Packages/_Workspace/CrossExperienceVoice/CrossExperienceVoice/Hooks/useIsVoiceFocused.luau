local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_AUDIO_FOCUS_MANAGEMENT_0 = require(l_script_FirstAncestor_0.dependencies).CrossExperience.Constants.AUDIO_FOCUS_MANAGEMENT;
local v2 = require(l_script_FirstAncestor_0.Hooks.useAudioCurrentContextId);
local l_CONTEXT_ID_0 = l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID;
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_CONTEXT_ID_0 (copy)
    return v2() == l_CONTEXT_ID_0;
end;