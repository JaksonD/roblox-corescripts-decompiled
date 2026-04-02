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
local l_game_EngineFeature_0 = game:GetEngineFeature("CevReadinessSync");
local l_VoiceStatusChanged_0 = l_CrossExperience_0.Actions.VoiceStatusChanged;
local l_useEffect_0 = l_React_0.useEffect;
local v15 = require(l_script_FirstAncestor_0.Logger);
local l_default_0 = require(l_script_FirstAncestor_0.CrossExperienceVoiceManager).default;
local l_default_1 = require(l_script_FirstAncestor_0.CrossExperienceVoiceAnalytics).default;
local v18 = require(l_script_FirstAncestor_0.Flags);
local l_FFlagFireErrorRCCTimeoutSignal_0 = v18.FFlagFireErrorRCCTimeoutSignal;
local l_FFlagEnableCEVForceInitialize_0 = v18.FFlagEnableCEVForceInitialize;
local function _() --[[ Line: 31 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
return function(v22) --[[ Line: 42 ]] --[[ Name: useCrossExperienceVoice ]]
    -- upvalues: l_useStore_0 (copy), l_useDispatch_0 (copy), l_React_0 (copy), l_CrossExperience_0 (copy), v15 (copy), l_default_0 (copy), l_VoiceStatusChanged_0 (copy), l_default_1 (copy), l_Players_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_FFlagFireErrorRCCTimeoutSignal_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_game_EngineFeature_0 (copy), l_ExperienceService_0 (copy), l_FFlagEnableCEVForceInitialize_0 (copy), l_useEffect_0 (copy)
    local v23 = l_useStore_0();
    local v24 = l_useDispatch_0();
    local v25 = l_React_0.useRef(nil);
    local v26 = l_React_0.useRef(nil);
    local v27 = l_React_0.useRef(nil);
    local v28 = l_React_0.useRef(nil);
    local v29 = l_React_0.useRef(nil);
    local v30 = l_React_0.useRef(nil);
    local v31 = l_React_0.useRef(nil);
    local v32 = l_React_0.useRef(nil);
    local v33 = l_React_0.useRef(nil);
    local v34 = l_React_0.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: l_CrossExperience_0 (ref)
        return l_CrossExperience_0.EventManager.new(if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC, true);
    end, {});
    local v35 = l_React_0.useRef(false);
    local function _() --[[ Line: 61 ]]
        -- upvalues: v35 (copy), v34 (copy), v23 (copy), v15 (ref)
        if v35.current then
            return;
        else
            v35.current = true;
            v34:subscribe(v23, v15);
            return;
        end;
    end;
    local function _() --[[ Line: 71 ]]
        -- upvalues: v35 (copy), v34 (copy), v23 (copy), v15 (ref)
        if not v35.current then
            return;
        else
            v35.current = false;
            v34:unsubscribe(v23, v15);
            return;
        end;
    end;
    local function v38() --[[ Line: 80 ]]
        -- upvalues: v35 (copy), v34 (copy), v23 (copy), v15 (ref), v26 (copy), v27 (copy), v28 (copy), v31 (copy), v32 (copy), v33 (copy), v25 (copy)
        if v35.current then
            v35.current = false;
            v34:unsubscribe(v23, v15);
        end;
        if v26.current then
            v26.current:Disconnect();
            v26.current = nil;
        end;
        if v27.current then
            v27.current:Disconnect();
            v27.current = nil;
        end;
        if v28.current then
            v28.current:Disconnect();
            v28.current = nil;
        end;
        if v31.current then
            v31.current:Disconnect();
            v31.current = nil;
        end;
        if v32.current then
            v32.current:Disconnect();
            v32.current = nil;
        end;
        if v33.current then
            v33.current:Disconnect();
            v33.current = nil;
        end;
        if v25.current then
            v25.current:Disconnect();
            v25.current = nil;
        end;
    end;
    local function v42() --[[ Line: 112 ]]
        -- upvalues: v31 (copy), l_default_0 (ref), v24 (copy), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (ref), v25 (copy), v23 (copy), l_FFlagFireErrorRCCTimeoutSignal_0 (ref), v34 (copy), v22 (copy), v32 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v33 (copy), v26 (copy), v35 (copy), v15 (ref), l_game_EngineFeature_0 (ref), v27 (copy), v28 (copy), l_ExperienceService_0 (ref), v29 (copy), v30 (copy), l_FFlagEnableCEVForceInitialize_0 (ref)
        v31.current = l_default_0.JoinRequested.Event:Connect(function() --[[ Line: 113 ]]
            -- upvalues: v24 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
            v24(l_VoiceStatusChanged_0({
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
            v25.current = l_default_0.JoinRequestPulseCheck.Event:Connect(function() --[[ Line: 128 ]]
                -- upvalues: v23 (ref), l_CrossExperience_0 (ref), l_FFlagFireErrorRCCTimeoutSignal_0 (ref), v34 (ref), l_Players_0 (ref), v24 (ref), l_VoiceStatusChanged_0 (ref), v22 (ref), l_default_0 (ref)
                local v39 = v23:getState();
                if v39 and v39.Squad and v39.Squad.CrossExperienceVoice and v39.Squad.CrossExperienceVoice.Experience.voiceStatus == l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING then
                    if l_FFlagFireErrorRCCTimeoutSignal_0 then
                        v34:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                            status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT, 
                            userId = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
                        });
                        return;
                    else
                        v24(l_VoiceStatusChanged_0({
                            status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT
                        }));
                        if v22 and v22.handleRCCConnectionTimeout then
                            l_default_0:logPartyVoiceTimeout();
                            l_default_0:leave();
                        end;
                    end;
                end;
            end);
        end;
        v32.current = l_default_0.JoinRequestSubmitted.Event:Connect(function(v40) --[[ Line: 157 ]]
            -- upvalues: v24 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
            if not v40 then
                v24(l_VoiceStatusChanged_0({
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
            v33.current = l_default_0.JoinFeasibilityCheckPerformed.Event:Connect(function(v41) --[[ Line: 174 ]]
                -- upvalues: v24 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), l_default_1 (ref), l_Players_0 (ref)
                if not v41 then
                    v24(l_VoiceStatusChanged_0({
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
        v26.current = l_default_0.ExperienceJoined.Event:Connect(function() --[[ Line: 190 ]]
            -- upvalues: v35 (ref), v34 (ref), v23 (ref), v15 (ref), l_game_EngineFeature_0 (ref), l_default_0 (ref)
            if not v35.current then
                v35.current = true;
                v34:subscribe(v23, v15);
            end;
            if l_game_EngineFeature_0 then
                l_default_0:signalCevReadinessSync();
            end;
        end);
        v27.current = l_default_0.ExperienceJoinFailed.Event:Connect(function() --[[ Line: 198 ]]
            -- upvalues: v35 (ref), v34 (ref), v23 (ref), v15 (ref)
            if not v35.current then
                return;
            else
                v35.current = false;
                v34:unsubscribe(v23, v15);
                return;
            end;
        end);
        v28.current = l_default_0.ExperienceLeft.Event:Connect(function() --[[ Line: 202 ]]
            -- upvalues: v35 (ref), v34 (ref), v23 (ref), v15 (ref)
            if not v35.current then
                return;
            else
                v35.current = false;
                v34:unsubscribe(v23, v15);
                return;
            end;
        end);
        if l_ExperienceService_0 then
            v29.current = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 208 ]]
                -- upvalues: v35 (ref), v34 (ref), v23 (ref), v15 (ref)
                if game.PlaceId == 0 then
                    if not v35.current then
                        return;
                    else
                        v35.current = false;
                        v34:unsubscribe(v23, v15);
                    end;
                end;
            end);
            v30.current = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 214 ]]
                -- upvalues: v34 (ref), v23 (ref), v15 (ref)
                if game.PlaceId == 0 then
                    v34:restoreStateFromBackground(v23, v15);
                end;
            end);
        end;
        if l_FFlagEnableCEVForceInitialize_0 and v22 and v22.forceInitializeStoreOnMount then
            if v35.current then
                return;
            else
                v35.current = true;
                v34:subscribe(v23, v15);
            end;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 229 ]]
        -- upvalues: v42 (copy), v38 (copy)
        v42();
        return function() --[[ Line: 231 ]]
            -- upvalues: v38 (ref)
            v38();
        end;
    end, {});
    return nil;
end;