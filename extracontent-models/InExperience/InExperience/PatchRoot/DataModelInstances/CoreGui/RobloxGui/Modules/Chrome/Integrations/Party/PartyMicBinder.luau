local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local v4 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v6 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_script_FirstAncestor_0.Service) else nil;
local v7 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useIsVoiceFocused_0 = v4.Hooks.useIsVoiceFocused;
local l_useIsVoiceConnected_0 = v4.Hooks.useIsVoiceConnected;
return function() --[[ Line: 21 ]] --[[ Name: PartyMicBinder ]]
    -- upvalues: l_useIsVoiceFocused_0 (copy), l_useIsVoiceConnected_0 (copy), v2 (copy), v6 (copy), v7 (copy), l_game_EngineFeature_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v11 = l_useIsVoiceFocused_0();
    local v12 = l_useIsVoiceConnected_0();
    local v13 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v6 (ref), v7 (ref)
        if v6 then
            return v6:integrations()[v7.TOGGLE_MIC_INTEGRATION_ID];
        else
            return nil;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v13 (copy), v12 (copy), v11 (copy), l_game_EngineFeature_0 (ref)
        if v13 then
            if v12 and (v11 or not l_game_EngineFeature_0) then
                v13.availability:available();
                return;
            else
                v13.availability:unavailable();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v12, 
        v11, 
        v13
    } else l_dependencyArray_0(v12, v11, v13));
    return nil;
end;