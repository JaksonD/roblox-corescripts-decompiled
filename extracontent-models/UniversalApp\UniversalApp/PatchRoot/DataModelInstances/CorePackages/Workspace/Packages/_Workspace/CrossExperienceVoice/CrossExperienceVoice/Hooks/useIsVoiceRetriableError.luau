local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_Utils_0 = require(l_script_FirstAncestor_0.dependencies).CrossExperience.Utils;
local v2 = require(l_script_FirstAncestor_0.Hooks.useVoiceStatus);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_Utils_0 (copy)
    local v3 = v2();
    if v3 == nil then
        return false;
    else
        return (l_Utils_0.VoiceStatus.isVoiceRetriableError(v3));
    end;
end;