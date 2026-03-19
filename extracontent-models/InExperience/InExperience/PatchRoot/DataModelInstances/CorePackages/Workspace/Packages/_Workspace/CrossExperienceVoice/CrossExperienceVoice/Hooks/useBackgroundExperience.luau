local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_GetFFlagEnableCrossExpVoice_0 = v1.SharedFlags.GetFFlagEnableCrossExpVoice;
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
return function() --[[ Line: 9 ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), l_useSelector_0 (copy)
    if not l_GetFFlagEnableCrossExpVoice_0() then
        return nil;
    else
        return l_useSelector_0(function(v4) --[[ Line: 13 ]]
            if v4 and v4.Squad and v4.Squad.CrossExperienceVoice then
                return v4.Squad.CrossExperienceVoice.Experience;
            else
                return nil;
            end;
        end);
    end;
end;