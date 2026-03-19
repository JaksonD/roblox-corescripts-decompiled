local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_useSelector_0 = v2.RoactUtils.Hooks.RoactRodux.useSelector;
local l_GetFFlagEnableCrossExpVoice_0 = v2.SharedFlags.GetFFlagEnableCrossExpVoice;
local v5 = require(l_script_FirstAncestor_0.Hooks.useIsVoiceFocused);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (copy), v5 (copy), l_useSelector_0 (copy), l_game_EngineFeature_0 (copy)
    if not l_GetFFlagEnableCrossExpVoice_0() then
        return false;
    else
        local v7 = v5();
        local v10 = l_useSelector_0(function(v8) --[[ Line: 16 ]]
            -- upvalues: v6 (copy)
            if v8 and v8.Squad and v8.Squad.CrossExperienceVoice then
                if table.find(v8.Squad.CrossExperienceVoice.Participants.activeUserIds, v6) ~= nil then
                    local v9 = v8.Squad.CrossExperienceVoice.Participants.participants[v6];
                    return v9 and not v9.isMuted;
                else
                    return false;
                end;
            else
                return false;
            end;
        end);
        if l_game_EngineFeature_0 and not v7 then
            return false;
        else
            return v10;
        end;
    end;
end;