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
local function _(v18) --[[ Line: 33 ]]
    local v19 = false;
    return function(...) --[[ Line: 35 ]]
        -- upvalues: v19 (ref), v18 (copy)
        if not v19 then
            v19 = true;
            return v18(...);
        else
            return nil;
        end;
    end;
end;
local function v21() --[[ Line: 45 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:reportJoinVoiceUpsellEvent("Shown");
end;
local v22 = false;
local v23;
do
    local l_v22_0 = v22;
    v23 = function(...) --[[ Line: 35 ]]
        -- upvalues: l_v22_0 (ref), v21 (copy)
        if not l_v22_0 then
            l_v22_0 = true;
            return v21(...);
        else
            return nil;
        end;
    end;
end;
return function() --[[ Line: 49 ]] --[[ Name: JoinVoiceBinder ]]
    -- upvalues: l_useIsVoiceFocused_0 (copy), l_useIsVoiceConnecting_0 (copy), v3 (copy), l_dependencyArray_0 (copy), v8 (copy), v23 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_default_0 (copy), l_isVoiceFocused_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), v12 (copy), v14 (copy), v15 (copy)
    local v25 = l_useIsVoiceFocused_0();
    local v26 = l_useIsVoiceConnecting_0();
    local v27 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v25 (copy), v26 (copy)
        return v25 or v26;
    end, l_dependencyArray_0(v26, v25));
    local v28 = v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v8 (ref)
        if v8 then
            return v8:integrations().join_voice;
        else
            return nil;
        end;
    end, {});
    local v30 = v3.useCallback(function(v29) --[[ Line: 63 ]]
        -- upvalues: v28 (copy), v8 (ref), v25 (copy), v23 (ref)
        if not v28 or not v8 then
            return;
        else
            if not v25 then
                if v29 == v8.AvailabilitySignal.Available then
                    v23();
                    v28.availability:available();
                    return;
                elseif v29 == v8.AvailabilitySignal.Unavailable then
                    v28.availability:unavailable();
                end;
            end;
            return;
        end;
    end, {});
    local v31 = v3.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v8 (ref), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (ref), l_default_0 (ref), v27 (copy), l_isVoiceFocused_0 (ref), v30 (copy)
        if not v8 then
            return;
        elseif l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then
            task.spawn(function() --[[ Line: 84 ]]
                -- upvalues: l_default_0 (ref), v27 (ref), l_isVoiceFocused_0 (ref), v30 (ref), v8 (ref)
                if l_default_0:ShouldShowJoinVoice() and not v27 and not l_isVoiceFocused_0() then
                    v30(v8.AvailabilitySignal.Available);
                end;
            end);
            return;
        else
            if l_default_0:ShouldShowJoinVoice() and not v27 and not l_isVoiceFocused_0() then
                v30(v8.AvailabilitySignal.Available);
            end;
            return;
        end;
    end, l_dependencyArray_0(v28, v27));
    local v33 = v3.useCallback(function(v32) --[[ Line: 100 ]]
        -- upvalues: v28 (copy), v27 (copy), l_isVoiceFocused_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v31 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (ref), l_default_0 (ref), v12 (ref), v14 (ref)
        if not v28 then
            return;
        elseif v27 or l_isVoiceFocused_0() then
            v28.availability:unavailable();
            return;
        elseif v32 == l_VOICE_JOIN_PROGRESS_0.Idle then
            v31();
            return;
        elseif not l_GetFFlagEnableVoiceUxUpdates_0() and v32 == l_VOICE_JOIN_PROGRESS_0.Suspended then
            v28.availability:available();
            return;
        else
            if v32 == l_VOICE_JOIN_PROGRESS_0.Joined then
                v28.availability:unavailable();
                if l_default_0.inExpUpsellEntrypoint == v12.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                    l_default_0:ToggleMic();
                    l_default_0:showPrompt(v14.VoiceConsentAcceptedToast);
                end;
            end;
            return;
        end;
    end, l_dependencyArray_0(v28, v27));
    local v34 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v28 (copy)
        v28.availability:unavailable();
    end, l_dependencyArray_0(v28));
    local v35 = v3.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v27 (copy), l_isVoiceFocused_0 (ref), v28 (copy)
        if v27 or l_isVoiceFocused_0() then
            v28.availability:unavailable();
            return;
        else
            v28.availability:available();
            return;
        end;
    end, l_dependencyArray_0(v28, v27));
    local v39 = v3.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: l_default_0 (ref), v33 (copy), v15 (ref), v34 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (ref), v35 (copy)
        local v36 = nil;
        local v37 = nil;
        local v38 = l_default_0.VoiceJoinProgressChanged.Event:Connect(v33);
        if v15() then
            v36 = l_default_0.showVoiceUI.Event:Connect(v34);
            if not l_GetFFlagEnableVoiceUxUpdates_0() then
                v37 = l_default_0.hideVoiceUI.Event:Connect(v35);
            end;
        end;
        return function() --[[ Line: 145 ]]
            -- upvalues: v38 (copy), v36 (ref), v37 (ref)
            if v38 then
                v38:Disconnect();
            end;
            if v36 then
                v36:Disconnect();
            end;
            if v37 then
                v37:Disconnect();
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: v31 (copy), v39 (copy)
        v31();
        v39();
    end, {});
    v3.useEffect(function() --[[ Line: 163 ]]
        -- upvalues: v33 (copy), l_default_0 (ref)
        v33(l_default_0.VoiceJoinProgress);
    end, {
        v27
    });
    return nil;
end;