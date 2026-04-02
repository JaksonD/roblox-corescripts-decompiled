local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v5 = require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice);
local v6 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v8 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_script_FirstAncestor_0.ChromeShared.Service) else nil;
local l_isVoiceFocused_0 = v6.Utils.isVoiceFocused;
local l_useIsVoiceFocused_0 = v5.Hooks.useIsVoiceFocused;
local l_useIsVoiceConnecting_0 = v5.Hooks.useIsVoiceConnecting;
local v12 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_VOICE_JOIN_PROGRESS_0 = v12.VOICE_JOIN_PROGRESS;
local v14 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function _(v19) --[[ Line: 36 ]]
    local v20 = false;
    return function(...) --[[ Line: 38 ]]
        -- upvalues: v20 (ref), v19 (copy)
        if not v20 then
            v20 = true;
            return v19(...);
        else
            return nil;
        end;
    end;
end;
local function v22() --[[ Line: 48 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:reportJoinVoiceUpsellEvent("Shown");
end;
local v23 = false;
local v24;
do
    local l_v23_0 = v23;
    v24 = function(...) --[[ Line: 38 ]]
        -- upvalues: l_v23_0 (ref), v22 (copy)
        if not l_v23_0 then
            l_v23_0 = true;
            return v22(...);
        else
            return nil;
        end;
    end;
end;
return function() --[[ Line: 52 ]] --[[ Name: JoinVoiceBinder ]]
    -- upvalues: l_useIsVoiceFocused_0 (copy), l_useIsVoiceConnecting_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy), v24 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_default_0 (copy), l_isVoiceFocused_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v12 (copy), v14 (copy), v15 (copy)
    local v26 = l_useIsVoiceFocused_0();
    local v27 = l_useIsVoiceConnecting_0();
    local v28 = v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v26 (copy), v27 (copy)
        return v26 or v27;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27, 
        v26
    } else l_dependencyArray_0(v27, v26));
    local v29 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v8 (ref)
        if v8 then
            return v8:integrations().join_voice;
        else
            return nil;
        end;
    end, {});
    local v31 = v3.useCallback(function(v30) --[[ Line: 71 ]]
        -- upvalues: v29 (copy), v8 (ref), v26 (copy), v24 (ref)
        if not v29 or not v8 then
            return;
        else
            if not v26 then
                if v30 == v8.AvailabilitySignal.Available then
                    v24();
                    v29.availability:available();
                    return;
                elseif v30 == v8.AvailabilitySignal.Unavailable then
                    v29.availability:unavailable();
                end;
            end;
            return;
        end;
    end, {});
    local v32 = v3.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v8 (ref), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (ref), l_default_0 (ref), v28 (copy), l_isVoiceFocused_0 (ref), v31 (copy)
        if not v8 then
            return;
        elseif l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then
            task.spawn(function() --[[ Line: 93 ]]
                -- upvalues: l_default_0 (ref), v28 (ref), l_isVoiceFocused_0 (ref), v31 (ref), v8 (ref)
                if l_default_0:ShouldShowJoinVoice() and not v28 and not l_isVoiceFocused_0() then
                    v31(v8.AvailabilitySignal.Available);
                end;
            end);
            return;
        else
            if l_default_0:ShouldShowJoinVoice() and not v28 and not l_isVoiceFocused_0() then
                v31(v8.AvailabilitySignal.Available);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29, 
        v28
    } else l_dependencyArray_0(v29, v28));
    local v34 = v3.useCallback(function(v33) --[[ Line: 114 ]]
        -- upvalues: v29 (copy), v28 (copy), l_isVoiceFocused_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v32 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (ref), l_default_0 (ref), v12 (ref), v14 (ref)
        if not v29 then
            return;
        elseif v28 or l_isVoiceFocused_0() then
            v29.availability:unavailable();
            return;
        elseif v33 == l_VOICE_JOIN_PROGRESS_0.Idle then
            v32();
            return;
        elseif not l_GetFFlagEnableVoiceUxUpdates_0() and v33 == l_VOICE_JOIN_PROGRESS_0.Suspended then
            v29.availability:available();
            return;
        else
            if v33 == l_VOICE_JOIN_PROGRESS_0.Joined then
                v29.availability:unavailable();
                if l_default_0.inExpUpsellEntrypoint == v12.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                    l_default_0:ToggleMic();
                    l_default_0:showPrompt(v14.VoiceConsentAcceptedToast);
                end;
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29, 
        v28
    } else l_dependencyArray_0(v29, v28));
    local v35 = v3.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v29 (copy)
        v29.availability:unavailable();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29
    } else l_dependencyArray_0(v29));
    local v36 = v3.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v28 (copy), l_isVoiceFocused_0 (ref), v29 (copy)
        if v28 or l_isVoiceFocused_0() then
            v29.availability:unavailable();
            return;
        else
            v29.availability:available();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29, 
        v28
    } else l_dependencyArray_0(v29, v28));
    local v40 = v3.useCallback(function() --[[ Line: 158 ]]
        -- upvalues: l_default_0 (ref), v34 (copy), v15 (ref), v35 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v36 (copy)
        local v37 = nil;
        local v38 = nil;
        local v39 = l_default_0.VoiceJoinProgressChanged.Event:Connect(v34);
        if v15() then
            v37 = l_default_0.showVoiceUI.Event:Connect(v35);
            if not l_GetFFlagEnableVoiceUxUpdates_0() then
                v38 = l_default_0.hideVoiceUI.Event:Connect(v36);
            end;
        end;
        return function() --[[ Line: 170 ]]
            -- upvalues: v39 (copy), v37 (ref), v38 (ref)
            if v39 then
                v39:Disconnect();
            end;
            if v37 then
                v37:Disconnect();
            end;
            if v38 then
                v38:Disconnect();
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: v32 (copy), v40 (copy)
        v32();
        v40();
    end, {});
    v3.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: v34 (copy), l_default_0 (ref)
        v34(l_default_0.VoiceJoinProgress);
    end, {
        v28
    });
    return nil;
end;