local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_useSelector_0 = v2.RoactUtils.Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Hooks.useIsVoiceFocused);
local l_GetFFlagEnableCrossExpVoice_0 = v2.SharedFlags.GetFFlagEnableCrossExpVoice;
return function() --[[ Line: 13 ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), v4 (copy), l_useSelector_0 (copy), l_game_EngineFeature_0 (copy)
    if not l_GetFFlagEnableCrossExpVoice_0() then
        return nil;
    else
        local v6 = v4();
        local v12 = l_useSelector_0(function(v7) --[[ Line: 19 ]]
            if v7 and v7.Squad and v7.Squad.CrossExperienceVoice then
                local l_activeUserIds_0 = v7.Squad.CrossExperienceVoice.Participants.activeUserIds;
                for v9 = #l_activeUserIds_0, 1, -1 do
                    local v10 = l_activeUserIds_0[v9];
                    local v11 = v7.Squad.CrossExperienceVoice.Participants.participants[v10];
                    if v11 and not v11.isMuted then
                        return v11;
                    end;
                end;
                return nil;
            else
                return nil;
            end;
        end);
        if l_game_EngineFeature_0 and not v6 then
            return nil;
        else
            return v12;
        end;
    end;
end;