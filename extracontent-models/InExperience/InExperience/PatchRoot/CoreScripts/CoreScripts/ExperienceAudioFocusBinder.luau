local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local v5 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Constants_0 = v7.Constants;
local l_FIntPartyVoiceUndeafenDelayMS_0 = v8.FIntPartyVoiceUndeafenDelayMS;
local l_GetFFlagPartyVoiceMuteScopeFix_0 = v8.GetFFlagPartyVoiceMuteScopeFix;
local v12 = game:DefineFastFlag("FixJoinVoiceDelayedAFMInit", false);
local v13 = false;
local v14 = nil;
local v15 = false;
local v16 = false;
local v17 = false;
local v18 = false;
local v19 = nil;
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    l_default_0:subscribe("OnStateChanged", function(_, v21) --[[ Line: 30 ]]
        -- upvalues: v14 (ref), v16 (ref)
        v14 = v21;
        if v21 == Enum.VoiceChatState.Ended then
            v16 = false;
        end;
    end);
    l_default_0.VoiceJoinProgressChanged.Event:Connect(function(v22) --[[ Line: 36 ]]
        -- upvalues: v5 (copy), v13 (ref)
        if v22 == v5.VOICE_JOIN_PROGRESS.Suspended then
            v13 = true;
        end;
    end);
    performVoiceOperationWhenReady = function(v23) --[[ Line: 42 ]] --[[ Name: performVoiceOperationWhenReady ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:asyncInit():andThen(function() --[[ Line: 44 ]]
            -- upvalues: v23 (copy)
            v23();
        end):catch(function() --[[ Line: 47 ]]
            -- upvalues: v3 (ref)
            v3:info("VCSM was not initialized to perform operation [CEV ExperienceAudioFocusBinder]");
        end);
    end;
    isConnectedToPublicVoice = function() --[[ Line: 52 ]] --[[ Name: isConnectedToPublicVoice ]]
        -- upvalues: l_default_0 (copy), v14 (ref)
        return not l_default_0:ShouldShowJoinVoice() or v14 == Enum.VoiceChatState.Joined;
    end;
    initializeAFM = function() --[[ Line: 57 ]] --[[ Name: initializeAFM ]]
        -- upvalues: v12 (copy), v15 (ref), v3 (copy), l_Constants_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (copy), v19 (ref), l_default_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v2 (copy), v16 (ref), v13 (ref), v18 (ref)
        if v12 and v15 then
            v3:info("VCSM was already initialized [CEV ExperienceAudioFocusBinder]");
            return;
        else
            if v12 then
                v15 = true;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                return game:GetService("AudioFocusService");
            end);
            if l_status_0 and l_result_0 then
                local l_CONTEXT_ID_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID;
                local l_FOCUS_PRIORITY_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY;
                l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
                local function v28() --[[ Line: 74 ]]
                    -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v19 (ref), l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                    if isConnectedToPublicVoice() then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v19 then
                            task.cancel(v19);
                            v19 = nil;
                        end;
                        l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                        if not l_default_0.localMuted then
                            if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                                l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                            else
                                l_default_0:ToggleMic();
                            end;
                        end;
                        l_default_0:HideVoiceUI();
                    end;
                end;
                local function v29() --[[ Line: 95 ]]
                    -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v19 (ref), l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                    if isConnectedToPublicVoice() then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v19 then
                            task.cancel(v19);
                            v19 = nil;
                        end;
                        l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                        if not l_default_0.localMuted then
                            if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                                l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                            else
                                l_default_0:ToggleMic();
                            end;
                        end;
                        l_default_0:ShowVoiceUI();
                    end;
                end;
                l_result_0.OnDeafenVoiceAudio:Connect(function(v30) --[[ Line: 115 ]]
                    -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v19 (ref), v3 (ref), v28 (copy)
                    if v30 == l_CONTEXT_ID_0 then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v19 then
                            task.cancel(v19);
                            v19 = nil;
                        end;
                        v3:info("UGC OnDeafenVoiceAudio fired" .. v30);
                        performVoiceOperationWhenReady(v28);
                    end;
                end);
                l_result_0.OnUndeafenVoiceAudio:Connect(function(v31) --[[ Line: 126 ]]
                    -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v19 (ref), v3 (ref), v29 (copy)
                    if v31 == l_CONTEXT_ID_0 then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 then
                            if v19 then
                                task.cancel(v19);
                            end;
                            v19 = task.delay(l_FIntPartyVoiceUndeafenDelayMS_0 / 1000, function() --[[ Line: 132 ]]
                                -- upvalues: v19 (ref), v3 (ref), v31 (copy), v29 (ref)
                                v19 = nil;
                                v3:info("UGC OnUndeafenVoiceAudio fired delayed" .. v31);
                                performVoiceOperationWhenReady(v29);
                            end);
                            return;
                        else
                            v3:info("UGC OnUndeafenVoiceAudio fired" .. v31);
                            performVoiceOperationWhenReady(v29);
                        end;
                    end;
                end);
                local function _(v32, v33) --[[ Line: 144 ]]
                    -- upvalues: l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v3 (ref), v2 (ref), l_result_0 (copy)
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        v3:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", v32, v33);
                    end;
                    return v2.new(function(v34, v35) --[[ Line: 148 ]]
                        -- upvalues: l_result_0 (ref), v32 (copy), v33 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v3 (ref)
                        local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v32, v33);
                        if l_status_1 then
                            if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                                v3:info("UGC requestAudioFocusWithPromise - focusGranted: {}", l_result_1);
                            end;
                            v34(l_result_1);
                            return;
                        else
                            if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                                v3:info("UGC requestAudioFocusWithPromise - rejected");
                            end;
                            v35("Failed to call RequestFocus due to an error");
                            return;
                        end;
                    end);
                end;
                local function v41(v39, v40) --[[ Line: 165 ]]
                    -- upvalues: v3 (ref), l_default_0 (ref)
                    if v39 ~= nil then
                        if v40 then
                            v3:info("UGC audio focus request granted, preparing to undeafen.");
                            l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                            l_default_0:ShowVoiceUI();
                            return;
                        else
                            v3:info("UGC audio focus requested denied, preparing to deafen.");
                            l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                            l_default_0:HideVoiceUI();
                        end;
                    end;
                end;
                local function _(v42, v43) --[[ Line: 179 ]]
                    -- upvalues: v16 (ref), v13 (ref), v41 (copy)
                    if not v16 then
                        performVoiceOperationWhenReady(function() --[[ Line: 181 ]]
                            -- upvalues: v13 (ref), v41 (ref), v42 (copy), v43 (copy)
                            if not v13 then
                                v41(v42, v43);
                            end;
                        end);
                        v16 = true;
                    end;
                end;
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v3:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                end;
                v2.new(function(v45, v46) --[[ Line: 148 ]]
                    -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v3 (ref)
                    local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                    if l_status_2 then
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            v3:info("UGC requestAudioFocusWithPromise - focusGranted: {}", l_result_2);
                        end;
                        v45(l_result_2);
                        return;
                    else
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            v3:info("UGC requestAudioFocusWithPromise - rejected");
                        end;
                        v46("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end):andThen(function(v49) --[[ Line: 191 ]]
                    -- upvalues: l_default_0 (ref), v18 (ref), v16 (ref), v13 (ref), v41 (copy)
                    l_default_0.muteChanged.Event:Connect(function(v50) --[[ Line: 192 ]]
                        -- upvalues: v18 (ref), v49 (copy), v16 (ref), v13 (ref), v41 (ref)
                        if not v18 then
                            local l_v49_0 = v49;
                            if not v16 then
                                performVoiceOperationWhenReady(function() --[[ Line: 181 ]]
                                    -- upvalues: v13 (ref), v41 (ref), v50 (copy), l_v49_0 (copy)
                                    if not v13 then
                                        v41(v50, l_v49_0);
                                    end;
                                end);
                                v16 = true;
                            end;
                            v18 = true;
                            return;
                        else
                            local v52 = isConnectedToPublicVoice();
                            if not v16 then
                                performVoiceOperationWhenReady(function() --[[ Line: 181 ]]
                                    -- upvalues: v13 (ref), v41 (ref), v50 (copy), v52 (copy)
                                    if not v13 then
                                        v41(v50, v52);
                                    end;
                                end);
                                v16 = true;
                            end;
                            return;
                        end;
                    end);
                end):catch(function() --[[ Line: 201 ]]
                    -- upvalues: v3 (ref)
                    v3:info("[UGC] Error requesting focus inside UGCdatamodel");
                end);
            end;
            return;
        end;
    end;
    local l_canUseServiceResult_0 = l_default_0.canUseServiceResult;
    if l_canUseServiceResult_0 then
        initializeAFM();
    elseif l_canUseServiceResult_0 == nil then
        if v12 then
            l_default_0:subscribe("OnVoiceChatServiceInitialized", function() --[[ Line: 212 ]]
                -- upvalues: v17 (ref)
                if v17 then
                    initializeAFM();
                    v17 = false;
                end;
            end);
        end;
        l_default_0:subscribe("OnCanUseServiceResult", function(v54) --[[ Line: 220 ]]
            -- upvalues: v12 (copy), v17 (ref), v3 (copy)
            if v54 then
                initializeAFM();
                return;
            else
                if v12 then
                    v17 = true;
                end;
                v3:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]");
                return;
            end;
        end);
    else
        v3:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]");
    end;
else
    l_default_0:asyncInit():andThen(function() --[[ Line: 235 ]]
        -- upvalues: l_Constants_0 (copy), l_default_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v3 (copy), v2 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 236 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_3 and l_result_3 then
            local l_CONTEXT_ID_1 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID;
            local l_FOCUS_PRIORITY_1 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY;
            l_result_3:RegisterContextIdFromLua(l_CONTEXT_ID_1);
            local function _() --[[ Line: 245 ]]
                -- upvalues: l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                    else
                        l_default_0:ToggleMic();
                    end;
                end;
                l_default_0:HideVoiceUI();
            end;
            local function _() --[[ Line: 259 ]]
                -- upvalues: l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                    else
                        l_default_0:ToggleMic();
                    end;
                end;
                l_default_0:ShowVoiceUI();
            end;
            l_result_3.OnDeafenVoiceAudio:Connect(function(v61) --[[ Line: 273 ]]
                -- upvalues: l_CONTEXT_ID_1 (copy), v3 (ref), l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                if v61 == l_CONTEXT_ID_1 then
                    v3:info("UGC OnDeafenVoiceAudio fired" .. v61);
                    l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                    if not l_default_0.localMuted then
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                        else
                            l_default_0:ToggleMic();
                        end;
                    end;
                    l_default_0:HideVoiceUI();
                end;
            end);
            l_result_3.OnUndeafenVoiceAudio:Connect(function(v62) --[[ Line: 280 ]]
                -- upvalues: l_CONTEXT_ID_1 (copy), v3 (ref), l_default_0 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref)
                if v62 == l_CONTEXT_ID_1 then
                    v3:info("UGC OnUndeafenVoiceAudio fired" .. v62);
                    l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                    if not l_default_0.localMuted then
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                        else
                            l_default_0:ToggleMic();
                        end;
                    end;
                    l_default_0:ShowVoiceUI();
                end;
            end);
            local function _(v63, v64) --[[ Line: 287 ]]
                -- upvalues: v2 (ref), l_result_3 (copy)
                return v2.new(function(v65, v66) --[[ Line: 288 ]]
                    -- upvalues: l_result_3 (ref), v63 (copy), v64 (copy)
                    local l_status_4, l_result_4 = pcall(l_result_3.RequestFocus, l_result_3, v63, v64);
                    if l_status_4 then
                        v65(l_result_4);
                        return;
                    else
                        v66("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            v2.new(function(v70, v71) --[[ Line: 288 ]]
                -- upvalues: l_result_3 (copy), l_CONTEXT_ID_1 (copy), l_FOCUS_PRIORITY_1 (copy)
                local l_status_5, l_result_5 = pcall(l_result_3.RequestFocus, l_result_3, l_CONTEXT_ID_1, l_FOCUS_PRIORITY_1);
                if l_status_5 then
                    v70(l_result_5);
                    return;
                else
                    v71("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v74) --[[ Line: 300 ]]
                -- upvalues: v3 (ref), l_default_0 (ref)
                if v74 then
                    v3:info("UGC audio focus request granted, preparing to undeafen.");
                    l_default_0.muteChanged.Event:Once(function(v75) --[[ Line: 303 ]]
                        -- upvalues: l_default_0 (ref)
                        if v75 ~= nil then
                            l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                        end;
                    end);
                    l_default_0:ShowVoiceUI();
                    return;
                else
                    v3:info("UGC audio focus requested denied, preparing to deafen.");
                    l_default_0.muteChanged.Event:Once(function(v76) --[[ Line: 311 ]]
                        -- upvalues: l_default_0 (ref)
                        if v76 ~= nil then
                            l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                        end;
                    end);
                    l_default_0:HideVoiceUI();
                    return;
                end;
            end):catch(function() --[[ Line: 319 ]]
                -- upvalues: v3 (ref)
                v3:info("[UGC] Error requesting focus inside UGCdatamodel");
            end);
        end;
    end):catch(function() --[[ Line: 324 ]]
        -- upvalues: v3 (copy)
        v3:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]");
    end);
end;