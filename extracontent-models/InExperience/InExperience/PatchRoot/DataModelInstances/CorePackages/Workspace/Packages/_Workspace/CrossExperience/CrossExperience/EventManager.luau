local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Communication);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Actions);
local v7 = require(l_script_FirstAncestor_0.Models);
local v8 = require(l_script_FirstAncestor_0.Utils);
local v9 = require(l_script_FirstAncestor_0.Utils.EventQueue);
local v10 = require(l_script_FirstAncestor_0.Middlewares.createPersistenceMiddleware);
local v11 = game:DefineFastFlag("EnableCrossExpEventLogging", false);
local l_SharedFlags_0 = v2.SharedFlags;
local l_FFlagPartyVoiceBlockSync_0 = l_SharedFlags_0.FFlagPartyVoiceBlockSync;
local l_FFlagEnablePartyVoiceChangersInLua_0 = l_SharedFlags_0.FFlagEnablePartyVoiceChangersInLua;
local l_Cryo_0 = v2.Cryo;
local v16 = 0;
local v17 = l_HttpService_0:GenerateGUID(false);
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20) --[[ Line: 105 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v18 (copy)
    local v21 = {
        observers = {}, 
        experienceType = v19, 
        isSubscribed = false, 
        eventQueue = v9.new(v20)
    };
    setmetatable(v21, v18);
    return v21;
end;
local function _(v22) --[[ Line: 116 ]]
    return {
        userId = tonumber(v22.userId) or -1, 
        isLocalUser = v22.isLocalUser
    };
end;
v18.notify = function(_, v25, v26) --[[ Line: 123 ]] --[[ Name: notify ]]
    -- upvalues: v16 (ref), v17 (copy), v4 (copy)
    if not v26 then
        v26 = {};
    end;
    v16 = v16 + 1;
    v26._seq = v16;
    v26._origin = v17;
    v4.notify(v25, v26);
end;
v18.removeObserver = function(v27, v28, v29) --[[ Line: 134 ]] --[[ Name: removeObserver ]]
    -- upvalues: v4 (copy)
    v4.removeObserver(v27.experienceType, v29, v28);
end;
v18.addObserver = function(v30, v31, v32) --[[ Line: 138 ]] --[[ Name: addObserver ]]
    -- upvalues: v4 (copy)
    local v34 = v4.addObserver(v30.experienceType, v31, function(v33) --[[ Line: 139 ]]
        -- upvalues: v30 (copy), v31 (copy), v32 (copy)
        v30.eventQueue:process(v31, v33, v32);
    end);
    table.insert(v30.observers, {
        id = v34, 
        event = v31
    });
end;
local v35 = v10({
    storeKey = v5.STORAGE_CEV_STORE_KEY
});
v18.subscribe = function(v36, v37, v38) --[[ Line: 154 ]] --[[ Name: subscribe ]]
    -- upvalues: v11 (copy), v5 (copy), v6 (copy), l_Cryo_0 (copy), v7 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy)
    if v36.isSubscribed then
        return;
    else
        v36.isSubscribed = true;
        if v38 and v11 then
            v38:info("{}: Subscribing to the CEV Store", v36.experienceType);
        end;
        v36:addObserver(v5.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(v39) --[[ Line: 167 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref), v5 (ref)
            if v38 and v11 then
                v38:info("{}: Experience Party Voice Game Join Failed: {}", v36.experienceType, v39.state);
            end;
            v37:dispatch(v6.VoiceStatusChanged({
                status = v5.VOICE_STATUS.ERROR_RCC_CONNECTING
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(v40) --[[ Line: 180 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v5 (ref), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Experience Voice Status Changed: {}, {}, {}, {}", v36.experienceType, v40.status, v40.detail, v40.voiceChannelId, v40.voiceSessionId);
            end;
            if v40.status == v5.VOICE_STATUS.VOICE_CONNECTED then
                if not v40.voiceChannelId and v38 then
                    v38:warning("Voice channel id is expected");
                end;
                if not v40.voiceSessionId then
                    v38:warning("Voice session id is expected");
                end;
            end;
            v37:dispatch(v6.VoiceStatusChanged({
                status = v40.status, 
                voiceChannelId = v40.voiceChannelId, 
                voiceSessionId = v40.voiceSessionId
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, function(v41) --[[ Line: 212 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), l_Cryo_0 (ref), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Experience joined JobID: {}, GameID: {}, PlaceId: {}", v36.experienceType, v41.jobId, v41.gameId, v41.placeId);
            end;
            local v42 = v36:getBackgroundStateSnapshot();
            local l_v41_0 = v41;
            if v42 and v42.Participants then
                l_v41_0 = l_Cryo_0.Dictionary.join(l_v41_0, v42.Participants);
            end;
            v37:dispatch(v6.ExperienceJoined(l_v41_0));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, function(v44) --[[ Line: 234 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant Audio Focus Changed {} = {}", v36.experienceType, v44.userId, v44.contextId);
            end;
            v37:dispatch(v6.ParticipantAudioFocusChanged({
                userId = v44.userId, 
                contextId = v44.contextId, 
                contextIds = v44.contextIds
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, function(v45) --[[ Line: 254 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v7 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant added {}", v36.experienceType, v45.userId);
            end;
            local v46 = v7.ParticipantModel.format({
                userId = v45.userId, 
                isLocalUser = v45.isLocalUser, 
                username = v45.username, 
                displayname = v45.displayname, 
                isActive = false, 
                isMuted = false, 
                isMutedLocally = false, 
                isVoiceChangerActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
                isVoiceChangerHearMyselfActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
                selectedVoicePack = if l_FFlagEnablePartyVoiceChangersInLua_0 then v45.selectedVoicePack else nil
            });
            v37:dispatch(v6.ParticipantAdded(v46));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, function(v47) --[[ Line: 276 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant removed {}", v36.experienceType, v47.userId);
            end;
            v37:dispatch(v6.ParticipantRemoved({
                userId = tonumber(v47.userId) or -1, 
                isLocalUser = v47.isLocalUser
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE, function(v48) --[[ Line: 286 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is active {}", v36.experienceType, v48.userId);
            end;
            v37:dispatch(v6.ParticipantIsActive({
                userId = tonumber(v48.userId) or -1, 
                isLocalUser = v48.isLocalUser
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, function(v49) --[[ Line: 296 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is inactive {}", v36.experienceType, v49.userId);
            end;
            v37:dispatch(v6.ParticipantIsInactive({
                userId = tonumber(v49.userId) or -1, 
                isLocalUser = v49.isLocalUser
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED, function(v50) --[[ Line: 306 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is was muted {}", v36.experienceType, v50.userId);
            end;
            v37:dispatch(v6.ParticipantWasMuted({
                userId = tonumber(v50.userId) or -1, 
                isLocalUser = v50.isLocalUser
            }));
        end);
        v36:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, function(v51) --[[ Line: 316 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is was unmuted {}", v36.experienceType, v51.userId);
            end;
            v37:dispatch(v6.ParticipantWasUnmuted({
                userId = tonumber(v51.userId) or -1, 
                isLocalUser = v51.isLocalUser
            }));
        end);
        if l_FFlagEnablePartyVoiceChangersInLua_0 then
            v36:addObserver(v5.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED, function(v52) --[[ Line: 327 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
                if v38 and v11 then
                    v38:info("{}: Participant voice changer was enabled {}", v36.experienceType, v52.userId);
                end;
                v37:dispatch(v6.VoiceChangerWasEnabled({
                    userId = tonumber(v52.userId) or -1, 
                    isLocalUser = v52.isLocalUser
                }));
            end);
            v36:addObserver(v5.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, function(v53) --[[ Line: 337 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
                if v38 and v11 then
                    v38:info("{}: Participant voice changer was disabled {}", v36.experienceType, v53.userId);
                end;
                v37:dispatch(v6.VoiceChangerWasDisabled({
                    userId = tonumber(v53.userId) or -1, 
                    isLocalUser = v53.isLocalUser
                }));
            end);
            v36:addObserver(v5.EVENTS.PARTY_VOICE_PACK_WAS_SET, function(v54) --[[ Line: 347 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
                if v38 and v11 then
                    v38:info("{}: Participant {} voice pack was set to {}", v36.experienceType, v54.userId, v54.voicePackName);
                end;
                v37:dispatch(v6.VoicePackWasSet({
                    userId = tonumber(v54.userId) or -1, 
                    isLocalUser = v54.isLocalUser, 
                    voicePackName = v54.voicePackName
                }));
            end);
            v36:addObserver(v5.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED, function(v55) --[[ Line: 366 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
                if v38 and v11 then
                    v38:info("{}: Participant voice changer feedback was enabled {}", v36.experienceType, v55.userId);
                end;
                v37:dispatch(v6.VoiceChangerFeedbackWasEnabled({
                    userId = tonumber(v55.userId) or -1, 
                    isLocalUser = v55.isLocalUser
                }));
            end);
            v36:addObserver(v5.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, function(v56) --[[ Line: 380 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
                if v38 and v11 then
                    v38:info("{}: Participant voice changer feedback was disabled {}", v36.experienceType, v56.userId);
                end;
                v37:dispatch(v6.VoiceChangerFeedbackWasDisabled({
                    userId = tonumber(v56.userId) or -1, 
                    isLocalUser = v56.isLocalUser
                }));
            end);
        end;
        v36:addObserver(v5.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, function(v57) --[[ Line: 395 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is muted locally {}", v36.experienceType, v57.userId);
            end;
            v37:dispatch(v6.MuteParticipant({
                userId = tonumber(v57.userId) or -1, 
                isLocalUser = v57.isLocalUser
            }));
        end);
        v36:addObserver(v5.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, function(v58) --[[ Line: 405 ]]
            -- upvalues: v38 (copy), v11 (ref), v36 (copy), v37 (copy), v6 (ref)
            if v38 and v11 then
                v38:info("{}: Participant is unmuted locally {}", v36.experienceType, v58.userId);
            end;
            v37:dispatch(v6.UnmuteParticipant({
                userId = tonumber(v58.userId) or -1, 
                isLocalUser = v58.isLocalUser
            }));
        end);
        if l_FFlagPartyVoiceBlockSync_0 then
            v36:addObserver(v5.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, function(v59) --[[ Line: 416 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy)
                if v38 and v11 then
                    v38:info("{}: Participant was blocked {} from party voice", v36.experienceType, v59.userId);
                end;
            end);
            v36:addObserver(v5.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, function(v60) --[[ Line: 425 ]]
                -- upvalues: v38 (copy), v11 (ref), v36 (copy)
                if v38 and v11 then
                    v38:info("{}: Participant was unblocked {} from party voice", v36.experienceType, v60.userId);
                end;
            end);
        end;
        return;
    end;
end;
v18.getBackgroundStateSnapshot = function(_) --[[ Line: 434 ]] --[[ Name: getBackgroundStateSnapshot ]]
    -- upvalues: v35 (copy), v8 (copy)
    local v62 = v35.restore();
    if v62 and v62.Squad and v62.Squad.CrossExperienceVoice then
        return {
            Experience = v62.Squad.CrossExperienceVoice.Experience, 
            Participants = {
                participants = v8.stringMapToNumberMap(v62.Squad.CrossExperienceVoice.Participants.participants), 
                activeUserIds = v62.Squad.CrossExperienceVoice.Participants.activeUserIds, 
                publicVoiceFocusedUserIds = v8.stringMapToNumberMap(v62.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds)
            }
        };
    else
        return nil;
    end;
end;
v18.restoreStateFromBackground = function(v63, v64, v65) --[[ Line: 452 ]] --[[ Name: restoreStateFromBackground ]]
    -- upvalues: v11 (copy), l_HttpService_0 (copy), v6 (copy)
    local v66 = v63:getBackgroundStateSnapshot();
    if v66 then
        if v65 and v11 then
            v65:info("{}: Restoring state from background {}", v63.experienceType, l_HttpService_0:JSONEncode(v66));
        end;
        v64:dispatch(v6.RestoreState(v66));
    end;
end;
v18.unsubscribe = function(v67, v68, v69) --[[ Line: 462 ]] --[[ Name: unsubscribe ]]
    -- upvalues: v11 (copy), v6 (copy)
    if v69 and v11 then
        v69:info("{}: Unsubscribing from the CEV Store", v67.experienceType);
    end;
    v68:dispatch(v6.ExperienceLeft());
    for _, v71 in ipairs(v67.observers) do
        v67:removeObserver(v71.id, v71.event);
    end;
    v67.isSubscribed = false;
    v67.observers = {};
    v67.eventQueue:reset();
end;
return v18;