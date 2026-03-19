local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_useSelector_0 = require(l_script_FirstAncestor_0.dependencies).RoactUtils.Hooks.RoactRodux.useSelector;
return function(v2) --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v3) --[[ Line: 8 ]]
        -- upvalues: v2 (copy)
        if v3 and v3.Squad and v3.Squad.CrossExperienceVoice then
            local v4 = v3.Squad.CrossExperienceVoice.Participants.participants[v2];
            if v4 then
                return v4.isMutedLocally;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end);
end;