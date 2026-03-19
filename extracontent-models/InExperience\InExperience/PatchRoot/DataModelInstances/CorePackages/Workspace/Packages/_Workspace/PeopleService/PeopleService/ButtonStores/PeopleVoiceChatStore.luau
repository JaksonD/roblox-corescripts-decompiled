local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_1.Signals);
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_VoiceChat_0 = l_Modules_0:WaitForChild("VoiceChat");
local l_Flags_0 = l_Modules_0:WaitForChild("Flags");
local l_default_0 = require(l_VoiceChat_0:WaitForChild("VoiceChatServiceManager")).default;
local l_Constants_0 = require(l_VoiceChat_0:WaitForChild("Constants"));
local l_VOICE_STATE_0 = l_Constants_0.VOICE_STATE;
local v12 = require(l_Parent_1.ExpChat).Stores.GetVoiceStore(false);
local v13 = require(l_Parent_1.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_GetFFlagVoiceChatUILogging_0 = require(l_Flags_0:WaitForChild("GetFFlagVoiceChatUILogging"));
local l_GetFFlagNewPeoplePageIcons_0 = require(l_Parent_0.Flags).GetFFlagNewPeoplePageIcons;
local l_GetFFlagAddPeoplePageCardLayout_0 = require(l_Parent_0.Flags).GetFFlagAddPeoplePageCardLayout;
local v17 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v19 = require(l_Parent_0.Constants);
local l_FRAME_BUFFER_0 = v19.VOICE_CHAT.MIC_ANIMATION.FRAME_BUFFER;
local l_ICONS_0 = v19.VOICE_CHAT.ICONS;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
return ((function() --[[ Line: 69 ]] --[[ Name: createPeopleVoiceChatStore ]]
    -- upvalues: v5 (copy), l_RunService_0 (copy), l_FRAME_BUFFER_0 (copy), l_PlayerMuteStatusIcons_0 (copy), l_default_0 (copy), v12 (copy), l_Players_0 (copy), l_VOICE_STATE_0 (copy), l_Constants_0 (copy), v17 (copy), l_game_EngineFeature_0 (copy), l_ICONS_0 (copy), l_GetFFlagNewPeoplePageIcons_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), l_GetFFlagVoiceChatUILogging_0 (copy), v13 (copy)
    local v23, v24 = v5.createSignal(false);
    local v25, v26 = v5.createSignal(false);
    local v27, v28 = v5.createSignal(nil);
    local v29, v30 = v5.createSignal(false);
    local v31, v32 = v5.createSignal(0);
    local v33, v34 = v5.createSignal(0);
    local v35 = 0;
    local v36 = nil;
    local function _() --[[ Line: 84 ]] --[[ Name: startMicAnimation ]]
        -- upvalues: v36 (ref), l_RunService_0 (ref), v29 (copy), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (copy), v34 (copy)
        if v36 then
            return;
        else
            v36 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 89 ]]
                -- upvalues: v29 (ref), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (ref), v34 (ref)
                if v29(false) then
                    v35 = v35 + 1;
                    if l_FRAME_BUFFER_0 < v35 then
                        local v37 = math.random();
                        v32(v37);
                        v35 = 0;
                        return;
                    end;
                else
                    v35 = v35 + 1;
                    if l_FRAME_BUFFER_0 < v35 then
                        local v38 = math.random();
                        v34(v38);
                        v35 = 0;
                    end;
                end;
            end);
            return;
        end;
    end;
    local function _() --[[ Line: 110 ]] --[[ Name: stopMicAnimation ]]
        -- upvalues: v36 (ref)
        if v36 then
            v36:Disconnect();
            v36 = nil;
        end;
    end;
    local function v46() --[[ Line: 117 ]] --[[ Name: getMuteSelfIcon ]]
        -- upvalues: v5 (ref), v27 (copy), v29 (copy), l_PlayerMuteStatusIcons_0 (ref), v31 (copy), l_default_0 (ref)
        return v5.createComputed(function(v41) --[[ Line: 118 ]]
            -- upvalues: v27 (ref), v29 (ref), l_PlayerMuteStatusIcons_0 (ref), v31 (ref), l_default_0 (ref)
            local v42 = v27(v41);
            local v43 = v29(v41);
            local _ = nil;
            if v42 == nil then
                return l_PlayerMuteStatusIcons_0.Loading;
            elseif v42 then
                return l_PlayerMuteStatusIcons_0.MicOff;
            elseif v43 then
                local v45 = math.floor(0.5 + 5 * v31(v41)) * 20;
                return (l_default_0:GetIcon("Unmuted" .. tostring(v45), "MicLight"));
            else
                return l_PlayerMuteStatusIcons_0.MicOn;
            end;
        end);
    end;
    local v53 = v5.createComputed(function(v47) --[[ Line: 140 ]]
        -- upvalues: v23 (copy), l_default_0 (ref), v12 (ref), l_Players_0 (ref), l_VOICE_STATE_0 (ref)
        if not v23(v47) or not l_default_0.voiceUIVisible then
            return false;
        else
            local v48 = v12.getVoiceParticipants(v47);
            if not v48 then
                return false;
            else
                local v49 = true;
                for v50, v51 in pairs(v48) do
                    local v52 = tonumber(v50);
                    if v52 and l_Players_0.LocalPlayer and v52 ~= l_Players_0.LocalPlayer.UserId and v51 ~= l_VOICE_STATE_0.LOCAL_MUTED then
                        return false;
                    end;
                end;
                return v49;
            end;
        end;
    end);
    local function v55() --[[ Line: 167 ]] --[[ Name: toggleMuteAll ]]
        -- upvalues: v23 (copy), v53 (copy), l_default_0 (ref), l_Constants_0 (ref)
        if not v23(false) then
            return;
        else
            local v54 = not v53(false);
            l_default_0:MuteAll(v54, l_Constants_0.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
            return;
        end;
    end;
    local function v56() --[[ Line: 177 ]] --[[ Name: toggleMuteSelf ]]
        -- upvalues: v23 (copy), l_default_0 (ref)
        if not v23(false) then
            return;
        else
            l_default_0:ToggleMic("InGameMenuPlayers");
            return;
        end;
    end;
    local function v58(v57) --[[ Line: 186 ]] --[[ Name: SubscribeRetry ]]
        -- upvalues: v23 (copy), l_default_0 (ref)
        if not v23(false) then
            return;
        else
            l_default_0:SubscribeRetry(v57);
            return;
        end;
    end;
    local function v63(v59) --[[ Line: 195 ]] --[[ Name: getPlayerMuteState ]]
        -- upvalues: v5 (ref), v12 (ref), l_VOICE_STATE_0 (ref)
        return v5.createComputed(function(v60) --[[ Line: 196 ]]
            -- upvalues: v12 (ref), v59 (copy), l_VOICE_STATE_0 (ref)
            local v61 = v12.getOrCreateVoiceState(v59)(v60);
            if not v61 then
                return false;
            else
                local v62 = true;
                if v61 ~= l_VOICE_STATE_0.LOCAL_MUTED then
                    v62 = v61 == l_VOICE_STATE_0.MUTED;
                end;
                return v62;
            end;
        end);
    end;
    local function v66(v64) --[[ Line: 208 ]] --[[ Name: togglePlayerMute ]]
        -- upvalues: v23 (copy), v25 (copy), l_default_0 (ref), l_Constants_0 (ref), v17 (ref), l_game_EngineFeature_0 (ref)
        if not v23(false) then
            return;
        elseif not v25(false) then
            return;
        else
            local v65 = l_default_0.participants[tostring(v64)];
            if v65 and v65.subscriptionCompleted then
                l_default_0:ToggleMutePlayer(tonumber(v64), l_Constants_0.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                return;
            else
                if v65 and v65.subscriptionFailed then
                    if v17 then
                        if not l_game_EngineFeature_0 then
                            l_default_0:SubscribeRetry(v64);
                            return;
                        end;
                    else
                        l_default_0:SubscribeRetry(v64);
                        return;
                    end;
                else
                    l_default_0:ToggleMutePlayer(tonumber(v64), l_Constants_0.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                end;
                return;
            end;
        end;
    end;
    local function v69(v67) --[[ Line: 241 ]] --[[ Name: getPlayerShouldShowMuteButton ]]
        -- upvalues: v5 (ref), v25 (copy), l_Players_0 (ref), v12 (ref)
        return v5.createComputed(function(v68) --[[ Line: 242 ]]
            -- upvalues: v25 (ref), l_Players_0 (ref), v67 (copy), v12 (ref)
            if not v25(v68) or l_Players_0.LocalPlayer and v67 == l_Players_0.LocalPlayer.UserId then
                return false;
            else
                return v12.getOrCreateVoiceState(v67)(v68) ~= nil;
            end;
        end);
    end;
    local function v74(v70) --[[ Line: 253 ]] --[[ Name: getPlayerAnimatedIcon ]]
        -- upvalues: v5 (ref), v12 (ref), l_ICONS_0 (ref), l_VOICE_STATE_0 (ref), l_GetFFlagNewPeoplePageIcons_0 (ref), v33 (copy)
        return v5.createComputed(function(v71) --[[ Line: 254 ]]
            -- upvalues: v12 (ref), v70 (copy), l_ICONS_0 (ref), l_VOICE_STATE_0 (ref), l_GetFFlagNewPeoplePageIcons_0 (ref), v33 (ref)
            local v72 = v12.getOrCreateVoiceState(v70)(v71);
            if not v72 then
                return l_ICONS_0.DEFAULT_SPEAKER;
            elseif v72 == l_VOICE_STATE_0.LOCAL_MUTED or v72 == l_VOICE_STATE_0.MUTED then
                if l_GetFFlagNewPeoplePageIcons_0() then
                    return l_ICONS_0.MUTED_SPEAKER;
                else
                    return l_ICONS_0.SPEAKER_OFF;
                end;
            elseif v72 == l_VOICE_STATE_0.TALKING then
                local v73 = math.floor(0.5 + 5 * v33(v71)) * 20;
                return string.format(l_ICONS_0.ANIMATED_SPEAKER_FORMAT, v73);
            else
                return l_ICONS_0.DEFAULT_SPEAKER;
            end;
        end);
    end;
    local function v77(v75) --[[ Line: 278 ]] --[[ Name: getPlayerIsLocalMuted ]]
        -- upvalues: v5 (ref), v12 (ref), l_VOICE_STATE_0 (ref)
        return v5.createComputed(function(v76) --[[ Line: 279 ]]
            -- upvalues: v75 (copy), v12 (ref), l_VOICE_STATE_0 (ref)
            if not v75 then
                return false;
            else
                return v12.getOrCreateVoiceState(v75)(v76) == l_VOICE_STATE_0.LOCAL_MUTED;
            end;
        end);
    end;
    local v80 = l_GetFFlagAddPeoplePageCardLayout_0() and function(v78) --[[ Line: 291 ]]
        -- upvalues: v5 (ref), v12 (ref), l_VOICE_STATE_0 (ref)
        return v5.createComputed(function(v79) --[[ Line: 292 ]]
            -- upvalues: v12 (ref), v78 (copy), l_VOICE_STATE_0 (ref)
            return v12.getOrCreateVoiceState(v78)(v79) == l_VOICE_STATE_0.TALKING;
        end);
    end or nil;
    local function v96() --[[ Line: 300 ]] --[[ Name: initializeVoiceChat ]]
        -- upvalues: l_default_0 (ref), v24 (copy), l_Players_0 (ref), v12 (ref), v28 (copy), v30 (copy), v26 (copy), v36 (ref), l_RunService_0 (ref), v29 (copy), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (copy), v34 (copy), l_GetFFlagVoiceChatUILogging_0 (ref), v13 (ref)
        if not game:GetEngineFeature("VoiceChatSupported") then
            return;
        else
            l_default_0:asyncInit():andThen(function() --[[ Line: 307 ]]
                -- upvalues: v24 (ref), l_default_0 (ref), l_Players_0 (ref), v12 (ref), v28 (ref), v30 (ref), v26 (ref), v36 (ref), l_RunService_0 (ref), v29 (ref), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (ref), v34 (ref)
                v24(true);
                l_default_0:SetupParticipantListeners();
                for v81, _ in pairs(l_default_0.participants) do
                    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                    if l_LocalPlayer_0 and v81 ~= tostring(l_LocalPlayer_0.UserId) then
                        v12.handleVoiceParticipantAdded(v81);
                    end;
                end;
                if l_default_0.participants and next(l_default_0.participants) then
                    v12.handleVoiceParticipantsChanged(l_default_0.participants);
                end;
                l_default_0.muteChanged.Event:Connect(function(v84) --[[ Line: 324 ]]
                    -- upvalues: v28 (ref)
                    v28(v84);
                end);
                l_default_0.talkingChanged.Event:Connect(function(v85) --[[ Line: 329 ]]
                    -- upvalues: v30 (ref)
                    v30(v85);
                end);
                v28(l_default_0.localMuted);
                v30(l_default_0.isTalking);
                l_default_0.participantsUpdate.Event:Connect(function(v86) --[[ Line: 338 ]]
                    -- upvalues: v12 (ref)
                    v12.handleVoiceParticipantsChanged(v86);
                end);
                l_default_0.participantJoined.Event:Connect(function(_, v88) --[[ Line: 342 ]]
                    -- upvalues: v12 (ref)
                    v12.handleVoiceParticipantAdded((tostring(v88)));
                end);
                l_default_0.participantLeft.Event:Connect(function(_, v90) --[[ Line: 346 ]]
                    -- upvalues: v12 (ref)
                    v12.handleVoiceParticipantRemoved((tostring(v90)));
                end);
                l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 351 ]]
                    -- upvalues: v26 (ref), v36 (ref), l_RunService_0 (ref), v29 (ref), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (ref), v34 (ref)
                    v26(true);
                    if v36 then
                        return;
                    else
                        v36 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 89 ]]
                            -- upvalues: v29 (ref), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (ref), v34 (ref)
                            if v29(false) then
                                v35 = v35 + 1;
                                if l_FRAME_BUFFER_0 < v35 then
                                    local v91 = math.random();
                                    v32(v91);
                                    v35 = 0;
                                    return;
                                end;
                            else
                                v35 = v35 + 1;
                                if l_FRAME_BUFFER_0 < v35 then
                                    local v92 = math.random();
                                    v34(v92);
                                    v35 = 0;
                                end;
                            end;
                        end);
                        return;
                    end;
                end);
                l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 356 ]]
                    -- upvalues: v26 (ref), v36 (ref)
                    v26(false);
                    if v36 then
                        v36:Disconnect();
                        v36 = nil;
                    end;
                end);
                if l_default_0.voiceUIVisible then
                    v26(true);
                end;
                if v36 then
                    return;
                else
                    v36 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 89 ]]
                        -- upvalues: v29 (ref), v35 (ref), l_FRAME_BUFFER_0 (ref), v32 (ref), v34 (ref)
                        if v29(false) then
                            v35 = v35 + 1;
                            if l_FRAME_BUFFER_0 < v35 then
                                local v93 = math.random();
                                v32(v93);
                                v35 = 0;
                                return;
                            end;
                        else
                            v35 = v35 + 1;
                            if l_FRAME_BUFFER_0 < v35 then
                                local v94 = math.random();
                                v34(v94);
                                v35 = 0;
                            end;
                        end;
                    end);
                    return;
                end;
            end):catch(function(_) --[[ Line: 368 ]]
                -- upvalues: l_GetFFlagVoiceChatUILogging_0 (ref), v13 (ref), v36 (ref)
                if l_GetFFlagVoiceChatUILogging_0() then
                    v13:warning("Failed to init VoiceChatServiceManager");
                end;
                if v36 then
                    v36:Disconnect();
                    v36 = nil;
                end;
            end);
            return;
        end;
    end;
    local function v97() --[[ Line: 378 ]] --[[ Name: cleanup ]]
        -- upvalues: v36 (ref)
        if v36 then
            v36:Disconnect();
            v36 = nil;
        end;
    end;
    v96();
    return {
        voiceChatServiceConnected = v23, 
        voiceUIVisible = v25, 
        allPlayersMuted = v53, 
        voiceParticipants = v12.getVoiceParticipants, 
        localMuted = v27, 
        localTalking = v29, 
        toggleMuteAll = v55, 
        toggleMuteSelf = v56, 
        SubscribeRetry = v58, 
        getPlayerMuteState = v63, 
        togglePlayerMute = v66, 
        getPlayerShouldShowMuteButton = v69, 
        getPlayerAnimatedIcon = v74, 
        getPlayerIsLocalMuted = v77, 
        getPlayerIsTalking = if l_GetFFlagAddPeoplePageCardLayout_0() then v80 else nil, 
        getMuteSelfIcon = v46, 
        cleanup = v97
    };
end)());