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
local v11 = game:DefineFastFlag("FixJoinVoiceDelayedAFMInit", false);
local v12 = false;
local v13 = nil;
local v14 = false;
local v15 = false;
local v16 = false;
local v17 = false;
local v18 = nil;
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    l_default_0:subscribe("OnStateChanged", function(_, v20) --[[ Line: 28 ]]
        -- upvalues: v13 (ref), v15 (ref)
        v13 = v20;
        if v20 == Enum.VoiceChatState.Ended then
            v15 = false;
        end;
    end);
    l_default_0.VoiceJoinProgressChanged.Event:Connect(function(v21) --[[ Line: 34 ]]
        -- upvalues: v5 (copy), v12 (ref)
        if v21 == v5.VOICE_JOIN_PROGRESS.Suspended then
            v12 = true;
        end;
    end);
    performVoiceOperationWhenReady = function(v22) --[[ Line: 40 ]] --[[ Name: performVoiceOperationWhenReady ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:asyncInit():andThen(function() --[[ Line: 42 ]]
            -- upvalues: v22 (copy)
            v22();
        end):catch(function() --[[ Line: 45 ]]
            -- upvalues: v3 (ref)
            v3:info("VCSM was not initialized to perform operation [CEV ExperienceAudioFocusBinder]");
        end);
    end;
    isConnectedToPublicVoice = function() --[[ Line: 50 ]] --[[ Name: isConnectedToPublicVoice ]]
        -- upvalues: l_default_0 (copy), v13 (ref)
        return not l_default_0:ShouldShowJoinVoice() or v13 == Enum.VoiceChatState.Joined;
    end;
    initializeAFM = function() --[[ Line: 55 ]] --[[ Name: initializeAFM ]]
        -- upvalues: v11 (copy), v14 (ref), v3 (copy), l_Constants_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (copy), v18 (ref), l_default_0 (copy), v2 (copy), v15 (ref), v12 (ref), v17 (ref)
        if v11 and v14 then
            v3:info("VCSM was already initialized [CEV ExperienceAudioFocusBinder]");
            return;
        else
            if v11 then
                v14 = true;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
                return game:GetService("AudioFocusService");
            end);
            if l_status_0 and l_result_0 then
                local l_CONTEXT_ID_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID;
                local l_FOCUS_PRIORITY_0 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY;
                l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
                local function v27() --[[ Line: 72 ]]
                    -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v18 (ref), l_default_0 (ref)
                    if isConnectedToPublicVoice() then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v18 then
                            task.cancel(v18);
                            v18 = nil;
                        end;
                        l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                        if not l_default_0.localMuted then
                            l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                        end;
                        l_default_0:HideVoiceUI();
                    end;
                end;
                local function v28() --[[ Line: 89 ]]
                    -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v18 (ref), l_default_0 (ref)
                    if isConnectedToPublicVoice() then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v18 then
                            task.cancel(v18);
                            v18 = nil;
                        end;
                        l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                        if not l_default_0.localMuted then
                            l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                        end;
                        l_default_0:ShowVoiceUI();
                    end;
                end;
                l_result_0.OnDeafenVoiceAudio:Connect(function(v29) --[[ Line: 105 ]]
                    -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v18 (ref), v3 (ref), v27 (copy)
                    if v29 == l_CONTEXT_ID_0 then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v18 then
                            task.cancel(v18);
                            v18 = nil;
                        end;
                        v3:info("UGC OnDeafenVoiceAudio fired" .. v29);
                        performVoiceOperationWhenReady(v27);
                    end;
                end);
                l_result_0.OnUndeafenVoiceAudio:Connect(function(v30) --[[ Line: 116 ]]
                    -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v18 (ref), v3 (ref), v28 (copy)
                    if v30 == l_CONTEXT_ID_0 then
                        if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 then
                            if v18 then
                                task.cancel(v18);
                            end;
                            v18 = task.delay(l_FIntPartyVoiceUndeafenDelayMS_0 / 1000, function() --[[ Line: 122 ]]
                                -- upvalues: v18 (ref), v3 (ref), v30 (copy), v28 (ref)
                                v18 = nil;
                                v3:info("UGC OnUndeafenVoiceAudio fired delayed" .. v30);
                                performVoiceOperationWhenReady(v28);
                            end);
                            return;
                        else
                            v3:info("UGC OnUndeafenVoiceAudio fired" .. v30);
                            performVoiceOperationWhenReady(v28);
                        end;
                    end;
                end);
                local function _(v31, v32) --[[ Line: 134 ]]
                    -- upvalues: v3 (ref), v2 (ref), l_result_0 (copy)
                    v3:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", v31, v32);
                    return v2.new(function(v33, v34) --[[ Line: 136 ]]
                        -- upvalues: l_result_0 (ref), v31 (copy), v32 (copy), v3 (ref)
                        local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v31, v32);
                        if l_status_1 then
                            v3:info("UGC requestAudioFocusWithPromise - focusGranted: {}", l_result_1);
                            v33(l_result_1);
                            return;
                        else
                            v3:info("UGC requestAudioFocusWithPromise - rejected");
                            v34("Failed to call RequestFocus due to an error");
                            return;
                        end;
                    end);
                end;
                local function v40(v38, v39) --[[ Line: 149 ]]
                    -- upvalues: v3 (ref), l_default_0 (ref)
                    if v38 ~= nil then
                        if v39 then
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
                local function _(v41, v42) --[[ Line: 163 ]]
                    -- upvalues: v15 (ref), v12 (ref), v40 (copy)
                    if not v15 then
                        performVoiceOperationWhenReady(function() --[[ Line: 165 ]]
                            -- upvalues: v12 (ref), v40 (ref), v41 (copy), v42 (copy)
                            if not v12 then
                                v40(v41, v42);
                            end;
                        end);
                        v15 = true;
                    end;
                end;
                v3:info("UGC requestAudioFocusWithPromise - id: {} - priority: {}", l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                v2.new(function(v44, v45) --[[ Line: 136 ]]
                    -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy), v3 (ref)
                    local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                    if l_status_2 then
                        v3:info("UGC requestAudioFocusWithPromise - focusGranted: {}", l_result_2);
                        v44(l_result_2);
                        return;
                    else
                        v3:info("UGC requestAudioFocusWithPromise - rejected");
                        v45("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end):andThen(function(v48) --[[ Line: 175 ]]
                    -- upvalues: l_default_0 (ref), v17 (ref), v15 (ref), v12 (ref), v40 (copy)
                    l_default_0.muteChanged.Event:Connect(function(v49) --[[ Line: 176 ]]
                        -- upvalues: v17 (ref), v48 (copy), v15 (ref), v12 (ref), v40 (ref)
                        if not v17 then
                            local l_v48_0 = v48;
                            if not v15 then
                                performVoiceOperationWhenReady(function() --[[ Line: 165 ]]
                                    -- upvalues: v12 (ref), v40 (ref), v49 (copy), l_v48_0 (copy)
                                    if not v12 then
                                        v40(v49, l_v48_0);
                                    end;
                                end);
                                v15 = true;
                            end;
                            v17 = true;
                            return;
                        else
                            local v51 = isConnectedToPublicVoice();
                            if not v15 then
                                performVoiceOperationWhenReady(function() --[[ Line: 165 ]]
                                    -- upvalues: v12 (ref), v40 (ref), v49 (copy), v51 (copy)
                                    if not v12 then
                                        v40(v49, v51);
                                    end;
                                end);
                                v15 = true;
                            end;
                            return;
                        end;
                    end);
                end):catch(function() --[[ Line: 185 ]]
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
        if v11 then
            l_default_0:subscribe("OnVoiceChatServiceInitialized", function() --[[ Line: 196 ]]
                -- upvalues: v16 (ref)
                if v16 then
                    initializeAFM();
                    v16 = false;
                end;
            end);
        end;
        l_default_0:subscribe("OnCanUseServiceResult", function(v53) --[[ Line: 204 ]]
            -- upvalues: v11 (copy), v16 (ref), v3 (copy)
            if v53 then
                initializeAFM();
                return;
            else
                if v11 then
                    v16 = true;
                end;
                v3:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]");
                return;
            end;
        end);
    else
        v3:info("VCSM cannot be used [CEV ExperienceAudioFocusBinder]");
    end;
else
    l_default_0:asyncInit():andThen(function() --[[ Line: 219 ]]
        -- upvalues: l_Constants_0 (copy), l_default_0 (copy), v3 (copy), v2 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 220 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_3 and l_result_3 then
            local l_CONTEXT_ID_1 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID;
            local l_FOCUS_PRIORITY_1 = l_Constants_0.AUDIO_FOCUS_MANAGEMENT.UGC.FOCUS_PRIORITY;
            l_result_3:RegisterContextIdFromLua(l_CONTEXT_ID_1);
            local function _() --[[ Line: 229 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                end;
                l_default_0:HideVoiceUI();
            end;
            local function _() --[[ Line: 239 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                if not l_default_0.localMuted then
                    l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                end;
                l_default_0:ShowVoiceUI();
            end;
            l_result_3.OnDeafenVoiceAudio:Connect(function(v60) --[[ Line: 249 ]]
                -- upvalues: l_CONTEXT_ID_1 (copy), v3 (ref), l_default_0 (ref)
                if v60 == l_CONTEXT_ID_1 then
                    v3:info("UGC OnDeafenVoiceAudio fired" .. v60);
                    l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                    if not l_default_0.localMuted then
                        l_default_0:ToggleMic("AudioFocusManagement - UGC deafenAll");
                    end;
                    l_default_0:HideVoiceUI();
                end;
            end);
            l_result_3.OnUndeafenVoiceAudio:Connect(function(v61) --[[ Line: 256 ]]
                -- upvalues: l_CONTEXT_ID_1 (copy), v3 (ref), l_default_0 (ref)
                if v61 == l_CONTEXT_ID_1 then
                    v3:info("UGC OnUndeafenVoiceAudio fired" .. v61);
                    l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                    if not l_default_0.localMuted then
                        l_default_0:ToggleMic("AudioFocusManagement - UGC undeafenAll");
                    end;
                    l_default_0:ShowVoiceUI();
                end;
            end);
            local function _(v62, v63) --[[ Line: 263 ]]
                -- upvalues: v2 (ref), l_result_3 (copy)
                return v2.new(function(v64, v65) --[[ Line: 264 ]]
                    -- upvalues: l_result_3 (ref), v62 (copy), v63 (copy)
                    local l_status_4, l_result_4 = pcall(l_result_3.RequestFocus, l_result_3, v62, v63);
                    if l_status_4 then
                        v64(l_result_4);
                        return;
                    else
                        v65("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            v2.new(function(v69, v70) --[[ Line: 264 ]]
                -- upvalues: l_result_3 (copy), l_CONTEXT_ID_1 (copy), l_FOCUS_PRIORITY_1 (copy)
                local l_status_5, l_result_5 = pcall(l_result_3.RequestFocus, l_result_3, l_CONTEXT_ID_1, l_FOCUS_PRIORITY_1);
                if l_status_5 then
                    v69(l_result_5);
                    return;
                else
                    v70("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v73) --[[ Line: 276 ]]
                -- upvalues: v3 (ref), l_default_0 (ref)
                if v73 then
                    v3:info("UGC audio focus request granted, preparing to undeafen.");
                    l_default_0.muteChanged.Event:Once(function(v74) --[[ Line: 279 ]]
                        -- upvalues: l_default_0 (ref)
                        if v74 ~= nil then
                            l_default_0:MuteAll(false, "AudioFocusManagement UGC");
                        end;
                    end);
                    l_default_0:ShowVoiceUI();
                    return;
                else
                    v3:info("UGC audio focus requested denied, preparing to deafen.");
                    l_default_0.muteChanged.Event:Once(function(v75) --[[ Line: 287 ]]
                        -- upvalues: l_default_0 (ref)
                        if v75 ~= nil then
                            l_default_0:MuteAll(true, "AudioFocusManagement UGC");
                        end;
                    end);
                    l_default_0:HideVoiceUI();
                    return;
                end;
            end):catch(function() --[[ Line: 295 ]]
                -- upvalues: v3 (ref)
                v3:info("[UGC] Error requesting focus inside UGCdatamodel");
            end);
        end;
    end):catch(function() --[[ Line: 300 ]]
        -- upvalues: v3 (copy)
        v3:info("VCSM was not initialized [CEV ExperienceAudioFocusBinder]");
    end);
end;