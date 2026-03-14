local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
local l_GetFFlagEnableCrossExpVoice_0 = v1.SharedFlags.GetFFlagEnableCrossExpVoice;
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), l_useSelector_0 (copy)
    if not l_GetFFlagEnableCrossExpVoice_0() then
        return nil;
    else
        return l_useSelector_0(function(v6) --[[ Line: 12 ]]
            -- upvalues: v4 (copy), v5 (copy)
            if v6 and v6.Squad and v6.Squad.CrossExperienceVoice then
                return v6.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[v4] == true ~= (v6.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[v5] == true);
            else
                return nil;
            end;
        end);
    end;
end;