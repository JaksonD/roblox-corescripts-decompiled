local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local v4 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v6 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_script_FirstAncestor_0.Service) else nil;
local v7 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
local l_useIsVoiceFocused_0 = v4.Hooks.useIsVoiceFocused;
local l_useIsVoiceConnected_0 = v4.Hooks.useIsVoiceConnected;
return function() --[[ Line: 18 ]] --[[ Name: PartyMicBinder ]]
    -- upvalues: l_useIsVoiceFocused_0 (copy), l_useIsVoiceConnected_0 (copy), v2 (copy), v6 (copy), v7 (copy), l_game_EngineFeature_0 (copy), l_dependencyArray_0 (copy)
    local v10 = l_useIsVoiceFocused_0();
    local v11 = l_useIsVoiceConnected_0();
    local v12 = v2.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v6 (ref), v7 (ref)
        if v6 then
            return v6:integrations()[v7.TOGGLE_MIC_INTEGRATION_ID];
        else
            return nil;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v12 (copy), v11 (copy), v10 (copy), l_game_EngineFeature_0 (ref)
        if v12 then
            if v11 and (v10 or not l_game_EngineFeature_0) then
                v12.availability:available();
                return;
            else
                v12.availability:unavailable();
            end;
        end;
    end, l_dependencyArray_0(v11, v10, v12));
    return nil;
end;