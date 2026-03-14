local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_Constants_0 = require(l_script_FirstAncestor_0.dependencies).CrossExperience.Constants;
local v2 = require(l_script_FirstAncestor_0.Hooks.useVoiceStatus);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_Constants_0 (copy)
    local v3 = v2();
    local v4 = true;
    if v3 ~= l_Constants_0.VOICE_STATUS.RCC_CONNECTING then
        v4 = true;
        if v3 ~= l_Constants_0.VOICE_STATUS.RCC_CONNECTED then
            v4 = true;
            if v3 ~= l_Constants_0.VOICE_STATUS.RCC_RECONNECTING then
                v4 = true;
                if v3 ~= l_Constants_0.VOICE_STATUS.VOICE_RECONNECTING then
                    v4 = v3 == l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
                end;
            end;
        end;
    end;
    return v4;
end;