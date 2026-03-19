local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_ParticipantAdded_0 = require(l_script_FirstAncestor_0.Actions).ParticipantAdded;
local l_ParticipantRemoved_0 = require(l_script_FirstAncestor_0.Actions).ParticipantRemoved;
local l_ParticipantIsActive_0 = require(l_script_FirstAncestor_0.Actions).ParticipantIsActive;
local l_ParticipantIsInactive_0 = require(l_script_FirstAncestor_0.Actions).ParticipantIsInactive;
local l_ParticipantWasMuted_0 = require(l_script_FirstAncestor_0.Actions).ParticipantWasMuted;
local l_ParticipantWasUnmuted_0 = require(l_script_FirstAncestor_0.Actions).ParticipantWasUnmuted;
local l_VoiceChangerWasEnabled_0 = require(l_script_FirstAncestor_0.Actions).VoiceChangerWasEnabled;
local l_VoiceChangerWasDisabled_0 = require(l_script_FirstAncestor_0.Actions).VoiceChangerWasDisabled;
local l_VoicePackWasSet_0 = require(l_script_FirstAncestor_0.Actions).VoicePackWasSet;
local l_VoiceChangerFeedbackWasEnabled_0 = require(l_script_FirstAncestor_0.Actions).VoiceChangerFeedbackWasEnabled;
local l_VoiceChangerFeedbackWasDisabled_0 = require(l_script_FirstAncestor_0.Actions).VoiceChangerFeedbackWasDisabled;
local l_ParticipantAudioFocusChanged_0 = require(l_script_FirstAncestor_0.Actions).ParticipantAudioFocusChanged;
local l_ExperienceJoined_0 = require(l_script_FirstAncestor_0.Actions).ExperienceJoined;
local l_ExperienceLeft_0 = require(l_script_FirstAncestor_0.Actions).ExperienceLeft;
local l_RestoreState_0 = require(l_script_FirstAncestor_0.Actions).RestoreState;
local l_MuteParticipant_0 = require(l_script_FirstAncestor_0.Actions).MuteParticipant;
local l_UnmuteParticipant_0 = require(l_script_FirstAncestor_0.Actions).UnmuteParticipant;
local _ = require(l_script_FirstAncestor_0.Types);
local v22 = require(l_script_FirstAncestor_0.Utils);
local v23 = {
    participants = {}, 
    activeUserIds = {}, 
    publicVoiceFocusedUserIds = {}
};
local function _(v24) --[[ Line: 56 ]]
    -- upvalues: v23 (copy), v22 (copy)
    local l_v23_0 = v23;
    if v24 then
        l_v23_0.participants = v22.stringMapToNumberMap(v24.participants);
        l_v23_0.activeUserIds = v24.activeUserIds;
        l_v23_0.publicVoiceFocusedUserIds = v22.stringMapToNumberMap(v24.publicVoiceFocusedUserIds);
    end;
    return l_v23_0;
end;
return function(v27) --[[ Line: 67 ]]
    -- upvalues: l_Rodux_0 (copy), v23 (copy), v22 (copy), l_ParticipantAdded_0 (copy), l_Cryo_0 (copy), l_ParticipantRemoved_0 (copy), l_ParticipantWasMuted_0 (copy), l_ParticipantWasUnmuted_0 (copy), l_VoiceChangerWasEnabled_0 (copy), l_VoiceChangerWasDisabled_0 (copy), l_VoicePackWasSet_0 (copy), l_VoiceChangerFeedbackWasEnabled_0 (copy), l_VoiceChangerFeedbackWasDisabled_0 (copy), l_ParticipantIsActive_0 (copy), l_ParticipantIsInactive_0 (copy), l_ExperienceJoined_0 (copy), l_RestoreState_0 (copy), l_ParticipantAudioFocusChanged_0 (copy), l_MuteParticipant_0 (copy), l_UnmuteParticipant_0 (copy), l_ExperienceLeft_0 (copy)
    local l_createReducer_0 = l_Rodux_0.createReducer;
    local l_v23_1 = v23;
    if v27 then
        l_v23_1.participants = v22.stringMapToNumberMap(v27.participants);
        l_v23_1.activeUserIds = v27.activeUserIds;
        l_v23_1.publicVoiceFocusedUserIds = v22.stringMapToNumberMap(v27.publicVoiceFocusedUserIds);
    end;
    return l_createReducer_0(l_v23_1, {
        [l_ParticipantAdded_0.name] = function(v30, v31) --[[ Line: 70 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_participant_0 = v31.payload.participant;
            if not v30.participants[l_participant_0.userId] then
                local v33 = table.clone(v30.participants);
                v33[l_participant_0.userId] = l_participant_0;
                return l_Cryo_0.Dictionary.join(v30, {
                    participants = v33
                });
            else
                return v30;
            end;
        end, 
        [l_ParticipantRemoved_0.name] = function(v34, v35) --[[ Line: 84 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_0 = v35.payload.userId;
            if v34.participants[l_userId_0] then
                local v37 = table.clone(v34.participants);
                local v38 = table.clone(v34.activeUserIds);
                local l_publicVoiceFocusedUserIds_0 = v34.publicVoiceFocusedUserIds;
                local v40 = table.find(v38, l_userId_0);
                v37[l_userId_0] = nil;
                if l_publicVoiceFocusedUserIds_0[l_userId_0] then
                    l_publicVoiceFocusedUserIds_0 = table.clone(v34.publicVoiceFocusedUserIds);
                    l_publicVoiceFocusedUserIds_0[l_userId_0] = nil;
                end;
                if v40 then
                    table.remove(v38, v40);
                end;
                return l_Cryo_0.Dictionary.join(v34, {
                    participants = v37, 
                    activeUserIds = v38, 
                    publicVoiceFocusedUserIds = l_publicVoiceFocusedUserIds_0
                });
            else
                return v34;
            end;
        end, 
        [l_ParticipantWasMuted_0.name] = function(v41, v42) --[[ Line: 113 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_1 = v42.payload.userId;
            if v41.participants[l_userId_1] then
                local l_participants_0 = v41.participants;
                local l_activeUserIds_0 = v41.activeUserIds;
                local v46 = table.find(l_activeUserIds_0, l_userId_1);
                if not l_participants_0[l_userId_1].isMuted then
                    l_participants_0 = table.clone(v41.participants);
                    l_participants_0[l_userId_1].isMuted = true;
                end;
                if v46 then
                    l_activeUserIds_0 = table.clone(v41.activeUserIds);
                    table.remove(l_activeUserIds_0, v46);
                end;
                return l_Cryo_0.Dictionary.join(v41, {
                    participants = l_participants_0, 
                    activeUserIds = l_activeUserIds_0
                });
            else
                return v41;
            end;
        end, 
        [l_ParticipantWasUnmuted_0.name] = function(v47, v48) --[[ Line: 140 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_2 = v48.payload.userId;
            if v47.participants[l_userId_2] and v47.participants[l_userId_2].isMuted then
                local v50 = table.clone(v47.participants);
                v50[l_userId_2].isMuted = false;
                return l_Cryo_0.Dictionary.join(v47, {
                    participants = v50
                });
            else
                return v47;
            end;
        end, 
        [l_VoiceChangerWasEnabled_0.name] = function(v51, v52) --[[ Line: 156 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_3 = v52.payload.userId;
            if v51.participants[l_userId_3] then
                local v54 = table.clone(v51.participants);
                local v55 = table.clone(v51.participants[l_userId_3]);
                v55.isVoiceChangerActive = true;
                v54[l_userId_3] = v55;
                return l_Cryo_0.Dictionary.join(v51, {
                    participants = v54
                });
            else
                return v51;
            end;
        end, 
        [l_VoiceChangerWasDisabled_0.name] = function(v56, v57) --[[ Line: 175 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_4 = v57.payload.userId;
            if v56.participants[l_userId_4] then
                local v59 = table.clone(v56.participants);
                local v60 = table.clone(v56.participants[l_userId_4]);
                v60.isVoiceChangerActive = false;
                v59[l_userId_4] = v60;
                return l_Cryo_0.Dictionary.join(v56, {
                    participants = v59
                });
            else
                return v56;
            end;
        end, 
        [l_VoicePackWasSet_0.name] = function(v61, v62) --[[ Line: 194 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_5 = v62.payload.userId;
            if v61.participants[l_userId_5] then
                local v64 = table.clone(v61.participants);
                local v65 = table.clone(v61.participants[l_userId_5]);
                v65.selectedVoicePack = v62.payload.voicePackName or "None";
                v64[l_userId_5] = v65;
                return l_Cryo_0.Dictionary.union(v61, {
                    participants = v64
                });
            else
                return v61;
            end;
        end, 
        [l_VoiceChangerFeedbackWasEnabled_0.name] = function(v66, v67) --[[ Line: 210 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_6 = v67.payload.userId;
            if v66.participants[l_userId_6] then
                local v69 = table.clone(v66.participants);
                local v70 = table.clone(v66.participants[l_userId_6]);
                v70.isVoiceChangerHearMyselfActive = true;
                v69[l_userId_6] = v70;
                return l_Cryo_0.Dictionary.join(v66, {
                    participants = v69
                });
            else
                return v66;
            end;
        end, 
        [l_VoiceChangerFeedbackWasDisabled_0.name] = function(v71, v72) --[[ Line: 229 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_7 = v72.payload.userId;
            if v71.participants[l_userId_7] then
                local v74 = table.clone(v71.participants);
                local v75 = table.clone(v71.participants[l_userId_7]);
                v75.isVoiceChangerHearMyselfActive = false;
                v74[l_userId_7] = v75;
                return l_Cryo_0.Dictionary.join(v71, {
                    participants = v74
                });
            else
                return v71;
            end;
        end, 
        [l_ParticipantIsActive_0.name] = function(v76, v77) --[[ Line: 248 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_8 = v77.payload.userId;
            local v79 = table.clone(v76.activeUserIds);
            local v80 = table.find(v79, l_userId_8);
            if v80 then
                if v80 ~= #v79 then
                    table.remove(v79, v80);
                    table.insert(v79, l_userId_8);
                end;
            else
                table.insert(v79, l_userId_8);
            end;
            return l_Cryo_0.Dictionary.join(v76, {
                activeUserIds = v79
            });
        end, 
        [l_ParticipantIsInactive_0.name] = function(v81, v82) --[[ Line: 267 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_9 = v82.payload.userId;
            local v84 = table.find(v81.activeUserIds, l_userId_9);
            if v84 then
                local v85 = table.clone(v81.activeUserIds);
                table.remove(v85, v84);
                return l_Cryo_0.Dictionary.join(v81, {
                    activeUserIds = v85
                });
            else
                return v81;
            end;
        end, 
        [l_ExperienceJoined_0.name] = function(v86, v87) --[[ Line: 283 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_payload_0 = v87.payload;
            if l_payload_0.participants and l_payload_0.activeUserIds then
                return l_Cryo_0.Dictionary.join(v86, {
                    participants = l_payload_0.participants, 
                    activeUserIds = l_payload_0.activeUserIds, 
                    publicVoiceFocusedUserIds = l_payload_0.publicVoiceFocusedUserIds
                });
            else
                return v86;
            end;
        end, 
        [l_RestoreState_0.name] = function(v89, v90) --[[ Line: 295 ]]
            -- upvalues: l_Cryo_0 (ref)
            if v90.payload.Participants then
                return l_Cryo_0.Dictionary.join({}, v90.payload.Participants);
            else
                return v89;
            end;
        end, 
        [l_ParticipantAudioFocusChanged_0.name] = function(v91, v92) --[[ Line: 302 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_contextIds_0 = v92.payload.contextIds;
            local v94 = table.clone(v91.publicVoiceFocusedUserIds);
            if l_contextIds_0 then
                for v95, v96 in pairs(l_contextIds_0) do
                    local v97 = tonumber(v95);
                    if v97 then
                        if v96 == 1 then
                            v94[v97] = true;
                        else
                            v94[v97] = nil;
                        end;
                    end;
                end;
            end;
            return l_Cryo_0.Dictionary.join(v91, {
                publicVoiceFocusedUserIds = v94
            });
        end, 
        [l_MuteParticipant_0.name] = function(v98, v99) --[[ Line: 330 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_10 = v99.payload.userId;
            if v98.participants[l_userId_10] and not v98.participants[l_userId_10].isMutedLocally then
                local v101 = table.clone(v98.participants);
                v101[l_userId_10].isMutedLocally = true;
                return l_Cryo_0.Dictionary.join(v98, {
                    participants = v101
                });
            else
                return v98;
            end;
        end, 
        [l_UnmuteParticipant_0.name] = function(v102, v103) --[[ Line: 343 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_11 = v103.payload.userId;
            if v102.participants[l_userId_11] and v102.participants[l_userId_11].isMutedLocally == true then
                local v105 = table.clone(v102.participants);
                v105[l_userId_11].isMutedLocally = false;
                return l_Cryo_0.Dictionary.join(v102, {
                    participants = v105
                });
            else
                return v102;
            end;
        end, 
        [l_ExperienceLeft_0.name] = function() --[[ Line: 356 ]]
            return {
                participants = {}, 
                activeUserIds = {}, 
                publicVoiceFocusedUserIds = {}
            };
        end
    });
end;