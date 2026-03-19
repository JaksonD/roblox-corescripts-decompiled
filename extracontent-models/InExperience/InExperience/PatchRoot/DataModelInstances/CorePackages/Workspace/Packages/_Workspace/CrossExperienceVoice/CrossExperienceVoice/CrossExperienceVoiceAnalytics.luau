local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Analytics);
local v4 = require(l_script_FirstAncestor_0.Flags);
local l_LoggingProtocol_0 = v1.LoggingProtocol;
local l_CrossExperience_0 = v1.CrossExperience;
local l_getMemStorageKey_0 = l_CrossExperience_0.Utils.getMemStorageKey;
local v8 = {};
v8.__index = v8;
local l_CEV_JOIN_ATTEMPT_ID_KEY_0 = l_CrossExperience_0.Constants.CEV_JOIN_ATTEMPT_ID_KEY;
v8.new = function() --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v8 (copy)
    local v10 = {
        previousStatus = nil, 
        connections = {}, 
        isInitialized = false, 
        eventManager = nil, 
        analytics = v3.Analytics()
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.initialize = function(v11, v12) --[[ Line: 94 ]] --[[ Name: initialize ]]
    v11.eventManager = v12;
    v11.isInitialized = true;
end;
v8.fireCEVAnalyticsEvent = function(v13, v14, v15) --[[ Line: 99 ]] --[[ Name: fireCEVAnalyticsEvent ]]
    -- upvalues: l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy)
    local v16 = v15 or {};
    v16.cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
    v16.clientTimeStamp = os.time();
    v13.analytics.fireAnalyticsEvent(v14, v16);
end;
v8.logPartyVoiceTimeout = function(v17, v18) --[[ Line: 106 ]] --[[ Name: logPartyVoiceTimeout ]]
    -- upvalues: v3 (copy), l_CrossExperience_0 (copy), l_Players_0 (copy)
    if not v17.isInitialized then
        return;
    else
        v17:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceStateChanged, {
            partyId = v18 or "", 
            status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT, 
            previousStatus = v17.previousStatus or "", 
            userId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0
        });
        return;
    end;
end;
v8.logPartyVoiceStatusChanged = function(v19, v20, v21, v22) --[[ Line: 119 ]] --[[ Name: logPartyVoiceStatusChanged ]]
    -- upvalues: v4 (copy), v3 (copy)
    if not v19.isInitialized then
        return;
    else
        if v19.previousStatus ~= v20.status then
            if v4.FFlagEnablePartyVoiceStatusChangedDetailAnalytics then
                if v4.FFlagPartyVoiceLogActiveDM then
                    v19:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceStateChanged, {
                        partyId = v21 or "", 
                        status = v20.status, 
                        detail = v20.detail or "", 
                        previousStatus = v19.previousStatus or "", 
                        voiceChannelId = v20.voiceChannelId, 
                        voiceSessionId = v20.voiceSessionId, 
                        userId = v20.userId, 
                        activeDm = v22 or ""
                    });
                else
                    v19:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceStateChanged, {
                        partyId = v21 or "", 
                        status = v20.status, 
                        detail = v20.detail or "", 
                        previousStatus = v19.previousStatus or "", 
                        voiceChannelId = v20.voiceChannelId, 
                        voiceSessionId = v20.voiceSessionId, 
                        userId = v20.userId, 
                        activeDm = ""
                    });
                end;
            else
                v19:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceStateChanged, {
                    partyId = v21 or "", 
                    status = v20.status, 
                    previousStatus = v19.previousStatus or "", 
                    voiceChannelId = v20.voiceChannelId, 
                    voiceSessionId = v20.voiceSessionId, 
                    userId = v20.userId
                });
            end;
        end;
        v19.previousStatus = v20.status;
        return;
    end;
end;
v8.logPartyVoiceConnectedState = function(v23, v24, v25, v26) --[[ Line: 171 ]] --[[ Name: logPartyVoiceConnectedState ]]
    -- upvalues: v4 (copy), v3 (copy)
    if not v23.isInitialized then
        return;
    else
        if v4.FFlagPartyVoiceLogActiveDM then
            v23:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
                userId = if v24.userId then v24.userId else 0, 
                partyId = v25 or "", 
                status = if v24.status then v24.status else "", 
                voiceChannelId = if v24.voiceChannelId then v24.voiceChannelId else "", 
                voiceSessionId = if v24.voiceSessionId then v24.voiceSessionId else "", 
                voicePlaySessionId = if v24.voicePlaySessionId then v24.voicePlaySessionId else "", 
                participants = if v24.participants then v24.participants else "", 
                numberActive = v24.numberActive or 0, 
                activeDm = v26 or ""
            });
        else
            v23:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
                userId = if v24.userId then v24.userId else 0, 
                partyId = v25 or "", 
                status = if v24.status then v24.status else "", 
                voiceChannelId = if v24.voiceChannelId then v24.voiceChannelId else "", 
                voiceSessionId = if v24.voiceSessionId then v24.voiceSessionId else "", 
                voicePlaySessionId = if v24.voicePlaySessionId then v24.voicePlaySessionId else "", 
                participants = if v24.participants then v24.participants else "", 
                numberActive = v24.numberActive or 0, 
                activeDm = ""
            });
        end;
        v23:logLaunchFlowEndEvent();
        return;
    end;
end;
v8.logPartyVoiceJoinAttempt = function(v27, v28) --[[ Line: 209 ]] --[[ Name: logPartyVoiceJoinAttempt ]]
    -- upvalues: v4 (copy), v3 (copy)
    if not v27.isInitialized then
        return;
    else
        if v4.FFlagPartyVoiceLogActiveDM then
            v27:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceJoinAttempt, {
                userId = if v28.userId then v28.userId else 0, 
                partyId = if v28.partyId then v28.partyId else "", 
                targetPlaceId = if v28.targetPlaceId then v28.targetPlaceId else 0, 
                isConnected = if v28.isConnected then v28.isConnected else false, 
                activeDm = if v28.activeDm then v28.activeDm else ""
            });
        else
            v27:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceJoinAttempt, {
                userId = if v28.userId then v28.userId else 0, 
                partyId = if v28.partyId then v28.partyId else "", 
                targetPlaceId = if v28.targetPlaceId then v28.targetPlaceId else 0, 
                isConnected = if v28.isConnected then v28.isConnected else false, 
                activeDm = ""
            });
        end;
        v27:logLaunchFlowBeginEvent();
        return;
    end;
end;
v8.logLaunchFlowBeginEvent = function(_) --[[ Line: 234 ]] --[[ Name: logLaunchFlowBeginEvent ]]
    -- upvalues: l_LoggingProtocol_0 (copy)
    l_LoggingProtocol_0.default:logEvent("party_voice_launch_flow_begin");
end;
v8.logLaunchFlowEndEvent = function(_) --[[ Line: 238 ]] --[[ Name: logLaunchFlowEndEvent ]]
    -- upvalues: l_LoggingProtocol_0 (copy)
    l_LoggingProtocol_0.default:logEvent("party_voice_launch_flow_end");
end;
v8.logPartyVoiceJoinFailure = function(v31, v32, v33, v34) --[[ Line: 242 ]] --[[ Name: logPartyVoiceJoinFailure ]]
    -- upvalues: v3 (copy)
    if not v31.isInitialized then
        return;
    else
        v31:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceJoinFailure, {
            partyId = v32, 
            errorMessage = v33 or "", 
            userId = v34 or 0
        });
        return;
    end;
end;
v8.logPartyVoiceUnmuteParticipant = function(v35, v36, v37) --[[ Line: 254 ]] --[[ Name: logPartyVoiceUnmuteParticipant ]]
    -- upvalues: v3 (copy)
    if not v35.isInitialized then
        return;
    else
        v35:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceUnmuteParticipant, {
            partyId = v36, 
            userId = v37 or 0
        });
        return;
    end;
end;
v8.logPartyVoiceMuteParticipant = function(v38, v39, v40) --[[ Line: 265 ]] --[[ Name: logPartyVoiceMuteParticipant ]]
    -- upvalues: v3 (copy)
    if not v38.isInitialized then
        return;
    else
        v38:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceMuteParticipant, {
            partyId = v39, 
            userId = v40 or 0
        });
        return;
    end;
end;
v8.logPartyVoiceBlockParticipant = function(v41, v42, v43) --[[ Line: 276 ]] --[[ Name: logPartyVoiceBlockParticipant ]]
    -- upvalues: v3 (copy)
    if not v41.isInitialized then
        return;
    else
        v41:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceBlockParticipant, {
            partyId = v42, 
            userId = v43 or 0
        });
        return;
    end;
end;
v8.logPartyVoiceUnblockParticipant = function(v44, v45, v46) --[[ Line: 287 ]] --[[ Name: logPartyVoiceUnblockParticipant ]]
    -- upvalues: v3 (copy)
    if not v44.isInitialized then
        return;
    else
        v44:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceUnblockParticipant, {
            partyId = v45, 
            userId = v46 or 0
        });
        return;
    end;
end;
v8.logPartyVoiceOnCrossExperienceStartedSignalReceived = function(v47, v48, v49) --[[ Line: 298 ]] --[[ Name: logPartyVoiceOnCrossExperienceStartedSignalReceived ]]
    -- upvalues: v3 (copy)
    if not v47.isInitialized then
        return;
    else
        v47:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceOnCrossExperienceStartedSignalReceived, {
            hasExperienceStarted = v48, 
            isActiveDM = v49
        });
        return;
    end;
end;
v8.logPartyVoiceStateChangeHandlerRun = function(v50, v51, v52) --[[ Line: 311 ]] --[[ Name: logPartyVoiceStateChangeHandlerRun ]]
    -- upvalues: v3 (copy)
    if not v50.isInitialized then
        return;
    else
        v50:fireCEVAnalyticsEvent(v3.EventNames.PartyVoiceStateChangeHandlerRun, {
            isActiveDM = v51, 
            status = v52.status, 
            detail = v52.detail or ""
        });
        return;
    end;
end;
v8.reset = function(v53) --[[ Line: 325 ]] --[[ Name: reset ]]
    v53.previousStatus = nil;
end;
v8.default = v8.new();
return v8;