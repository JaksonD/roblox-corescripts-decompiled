local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Players_0 = game:GetService("Players");
local l_ExperienceService_0 = v1.ExperienceService.ExperienceService;
local l_CrossExperience_0 = v1.CrossExperience;
local l_React_0 = v1.React;
local l_RoactUtils_0 = v1.RoactUtils;
local l_useStore_0 = l_RoactUtils_0.Hooks.RoactRodux.useStore;
local l_useDispatch_0 = l_RoactUtils_0.Hooks.RoactRodux.useDispatch;
local l_SharedFlags_0 = v1.SharedFlags;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 = l_SharedFlags_0.FIntPartyVoiceJoinRequestPulseCheckTimeout;
local v12 = game:DefineFastFlag("DisableCrossExperienceVoiceExpListenersTeardown", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("CevReadinessSync");
local l_VoiceStatusChanged_0 = l_CrossExperience_0.Actions.VoiceStatusChanged;
local l_useEffect_0 = l_React_0.useEffect;
local v16 = require(l_script_FirstAncestor_0.Logger);
local l_default_0 = require(l_script_FirstAncestor_0.CrossExperienceVoiceManager).default;
local l_default_1 = require(l_script_FirstAncestor_0.CrossExperienceVoiceAnalytics).default;
local v19 = require(l_script_FirstAncestor_0.Flags);
local l_FFlagFireErrorRCCTimeoutSignal_0 = v19.FFlagFireErrorRCCTimeoutSignal;
local l_FFlagEnableCEVForceInitialize_0 = v19.FFlagEnableCEVForceInitialize;
local function _() --[[ Line: 34 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
return function(v23) --[[ Line: 45 ]] --[[ Name: useCrossExperienceVoice ]]
    -- upvalues: l_useStore_0 (copy), l_useDispatch_0 (copy), l_React_0 (copy), l_CrossExperience_0 (copy), v16 (copy), v12 (copy), l_default_0 (copy), l_VoiceStatusChanged_0 (copy), l_default_1 (copy), l_Players_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_FFlagFireErrorRCCTimeoutSignal_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_game_EngineFeature_0 (copy), l_ExperienceService_0 (copy), l_FFlagEnableCEVForceInitialize_0 (copy), l_useEffect_0 (copy)
    local v24 = l_useStore_0();
    local v25 = l_useDispatch_0();
    local v26 = l_React_0.useRef(nil);
    local v27 = l_React_0.useRef(nil);
    local v28 = l_React_0.useRef(nil);
    local v29 = l_React_0.useRef(nil);
    local v30 = l_React_0.useRef(nil);
    local v31 = l_React_0.useRef(nil);
    local v32 = l_React_0.useRef(nil);
    local v33 = l_React_0.useRef(nil);
    local v34 = l_React_0.useRef(nil);
    local v35 = l_React_0.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: l_CrossExperience_0 (ref)
        return l_CrossExperience_0.EventManager.new(if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC, true);
    end, {});
    local v36 = l_React_0.useRef(false);
    local function _() --[[ Line: 64 ]]
        -- upvalues: v36 (copy), v35 (copy), v24 (copy), v16 (ref)
        if v36.current then
            return;
        else
            v36.current = true;
            v35:subscribe(v24, v16);
            return;
        end;
    end;
    local function _() --[[ Line: 74 ]]
        -- upvalues: v36 (copy), v35 (copy), v24 (copy), v16 (ref)
        if not v36.current then
            return;
        else
            v36.current = false;
            v35:unsubscribe(v24, v16);
            return;
        end;
    end;
    local function v39() --[[ Line: 83 ]]
        -- upvalues: v36 (copy), v35 (copy), v24 (copy), v16 (ref), v27 (copy), v28 (copy), v29 (copy), v12 (ref), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v26 (copy)
        if v36.current then
            v36.current = false;
            v35:unsubscribe(v24, v16);
        end;
        if v27.current then
            v27.current:Disconnect();
            v27.current = nil;
        end;
        if v28.current then
            v28.current:Disconnect();
            v28.current = nil;
        end;
        if v29.current then
            v29.current:Disconnect();
            v29.current = nil;
        end;
        if not v12 then
            if v30.current then
                v30.current:Disconnect();
                v30.current = nil;
            end;
            if v31.current then
                v31.current:Disconnect();
                v31.current = nil;
            end;
        end;
        if v32.current then
            v32.current:Disconnect();
            v32.current = nil;
        end;
        if v33.current then
            v33.current:Disconnect();
            v33.current = nil;
        end;
        if v34.current then
            v34.current:Disconnect();
            v34.current = nil;
        end;
        if v26.current then
            v26.current:Disconnect();
            v26.current = nil;
        end;
    end;
    local function v43() --[[ Line: 127 ]]
        -- upvalues: v32 (copy), l_default_0 (ref), v25 (copy), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (ref), v26 (copy), v24 (copy), l_FFlagFireErrorRCCTimeoutSignal_0 (ref), v35 (copy), v23 (copy), v33 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v34 (copy), v27 (copy), v36 (copy), v16 (ref), l_game_EngineFeature_0 (ref), v28 (copy), v29 (copy), l_ExperienceService_0 (ref), v30 (copy), v31 (copy), l_FFlagEnableCEVForceInitialize_0 (ref)
        v32.current = l_default_0.JoinRequested.Event:Connect(function() --[[ Line: 128 ]]
            -- upvalues: v25 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
            v25(l_VoiceStatusChanged_0({
                status = l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING
            }));
            l_default_1:logPartyVoiceStatusChanged({
                status = l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING, 
                voiceChannelId = nil, 
                voiceSessionId = nil, 
                userId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
            });
        end);
        if l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 > 0 then
            v26.current = l_default_0.JoinRequestPulseCheck.Event:Connect(function() --[[ Line: 143 ]]
                -- upvalues: v24 (ref), l_CrossExperience_0 (ref), l_FFlagFireErrorRCCTimeoutSignal_0 (ref), v35 (ref), l_Players_0 (ref), v25 (ref), l_VoiceStatusChanged_0 (ref), v23 (ref), l_default_0 (ref)
                local v40 = v24:getState();
                if v40 and v40.Squad and v40.Squad.CrossExperienceVoice and v40.Squad.CrossExperienceVoice.Experience.voiceStatus == l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING then
                    if l_FFlagFireErrorRCCTimeoutSignal_0 then
                        v35:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                            status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT, 
                            userId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
                        });
                        return;
                    else
                        v25(l_VoiceStatusChanged_0({
                            status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT
                        }));
                        if v23 and v23.handleRCCConnectionTimeout then
                            l_default_0:logPartyVoiceTimeout();
                            l_default_0:leave();
                        end;
                    end;
                end;
            end);
        end;
        v33.current = l_default_0.JoinRequestSubmitted.Event:Connect(function(v41) --[[ Line: 172 ]]
            -- upvalues: v25 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
            if not v41 then
                v25(l_VoiceStatusChanged_0({
                    status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM
                }));
                l_default_1:logPartyVoiceStatusChanged({
                    status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM, 
                    voiceChannelId = nil, 
                    voiceSessionId = nil, 
                    userId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
                });
            end;
        end);
        if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            v34.current = l_default_0.JoinFeasibilityCheckPerformed.Event:Connect(function(v42) --[[ Line: 189 ]]
                -- upvalues: v25 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
                if not v42 then
                    v25(l_VoiceStatusChanged_0({
                        status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
                    }));
                    l_default_1:logPartyVoiceStatusChanged({
                        status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED, 
                        voiceChannelId = nil, 
                        voiceSessionId = nil, 
                        userId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
                    });
                end;
            end);
        end;
        v27.current = l_default_0.ExperienceJoined.Event:Connect(function() --[[ Line: 205 ]]
            -- upvalues: v36 (ref), v35 (ref), v24 (ref), v16 (ref), l_game_EngineFeature_0 (ref), l_default_0 (ref)
            if not v36.current then
                v36.current = true;
                v35:subscribe(v24, v16);
            end;
            if l_game_EngineFeature_0 then
                l_default_0:signalCevReadinessSync();
            end;
        end);
        v28.current = l_default_0.ExperienceJoinFailed.Event:Connect(function() --[[ Line: 213 ]]
            -- upvalues: v36 (ref), v35 (ref), v24 (ref), v16 (ref)
            if not v36.current then
                return;
            else
                v36.current = false;
                v35:unsubscribe(v24, v16);
                return;
            end;
        end);
        v29.current = l_default_0.ExperienceLeft.Event:Connect(function() --[[ Line: 217 ]]
            -- upvalues: v36 (ref), v35 (ref), v24 (ref), v16 (ref)
            if not v36.current then
                return;
            else
                v36.current = false;
                v35:unsubscribe(v24, v16);
                return;
            end;
        end);
        if l_ExperienceService_0 then
            v30.current = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 223 ]]
                -- upvalues: v36 (ref), v35 (ref), v24 (ref), v16 (ref)
                if game.PlaceId == 0 then
                    if not v36.current then
                        return;
                    else
                        v36.current = false;
                        v35:unsubscribe(v24, v16);
                    end;
                end;
            end);
            v31.current = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 229 ]]
                -- upvalues: v35 (ref), v24 (ref), v16 (ref)
                if game.PlaceId == 0 then
                    v35:restoreStateFromBackground(v24, v16);
                end;
            end);
        end;
        if l_FFlagEnableCEVForceInitialize_0 and v23 and v23.forceInitializeStoreOnMount then
            if v36.current then
                return;
            else
                v36.current = true;
                v35:subscribe(v24, v16);
            end;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 244 ]]
        -- upvalues: v43 (copy), v39 (copy)
        v43();
        return function() --[[ Line: 246 ]]
            -- upvalues: v39 (ref)
            v39();
        end;
    end, {});
    return nil;
end;