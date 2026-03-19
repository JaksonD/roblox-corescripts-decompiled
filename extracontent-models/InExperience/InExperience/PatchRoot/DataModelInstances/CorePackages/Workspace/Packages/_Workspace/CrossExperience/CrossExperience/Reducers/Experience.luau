local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_SharedFlags_0 = v1.SharedFlags;
local l_ExperienceJoined_0 = require(l_script_FirstAncestor_0.Actions).ExperienceJoined;
local l_ExperienceLeft_0 = require(l_script_FirstAncestor_0.Actions).ExperienceLeft;
local l_RestoreState_0 = require(l_script_FirstAncestor_0.Actions).RestoreState;
local l_VoiceStatusChanged_0 = require(l_script_FirstAncestor_0.Actions).VoiceStatusChanged;
local _ = require(l_script_FirstAncestor_0.Types);
local v10 = require(l_script_FirstAncestor_0.Constants);
local l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 = l_SharedFlags_0.FStringTimeoutLoadingLocalPlayerInBackgroundDM;
local l_VOICE_STATUS_0 = v10.VOICE_STATUS;
local v13 = {
    jobId = nil, 
    gameId = nil, 
    placeId = nil, 
    voiceStatus = l_VOICE_STATUS_0.DISCONNECTED, 
    voiceChannelId = nil, 
    voiceSessionId = nil
};
local function _(v14, v15) --[[ Line: 29 ]] --[[ Name: isAllowedVoiceStatusTransition ]]
    -- upvalues: l_SharedFlags_0 (copy), l_VOICE_STATUS_0 (copy)
    if l_SharedFlags_0.GetFFlagFixPartyVoiceGetPermissions() and v14 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED then
        return v15 == l_VOICE_STATUS_0.VOICE_CONNECTING;
    else
        return v14 ~= v15;
    end;
end;
return function(v17) --[[ Line: 43 ]]
    -- upvalues: l_Rodux_0 (copy), v13 (copy), l_ExperienceJoined_0 (copy), l_Cryo_0 (copy), l_ExperienceLeft_0 (copy), v10 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_RestoreState_0 (copy), l_VoiceStatusChanged_0 (copy), l_SharedFlags_0 (copy), l_VOICE_STATUS_0 (copy)
    return l_Rodux_0.createReducer(v17 or v13, {
        [l_ExperienceJoined_0.name] = function(v18, v19) --[[ Line: 46 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_payload_0 = v19.payload;
            return l_Cryo_0.Dictionary.join(v18, {
                jobId = l_payload_0.jobId, 
                gameId = l_payload_0.gameId, 
                placeId = l_payload_0.placeId
            });
        end, 
        [l_ExperienceLeft_0.name] = function(v21) --[[ Line: 55 ]]
            -- upvalues: v10 (ref), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (ref)
            local l_voiceStatus_0 = v21.voiceStatus;
            local l_voiceStatus_1 = v21.voiceStatus;
            if l_voiceStatus_0 ~= v10.VOICE_STATUS.ERROR_VOICE_DISCONNECTED and l_voiceStatus_0 ~= v10.VOICE_STATUS.ERROR_START_BACKGROUND_DM and l_voiceStatus_0 ~= v10.VOICE_STATUS.ERROR_RCC_CONNECTING and l_voiceStatus_0 ~= v10.VOICE_STATUS.ERROR_RCC_TIMEOUT and (l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == v10.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable or l_voiceStatus_0 ~= v10.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT) then
                l_voiceStatus_1 = v10.VOICE_STATUS.DISCONNECTED;
            end;
            return {
                jobId = nil, 
                gameId = nil, 
                placeId = nil, 
                voiceChannelId = nil, 
                voiceSessionId = nil, 
                voiceStatus = l_voiceStatus_1
            };
        end, 
        [l_RestoreState_0.name] = function(v24, v25) --[[ Line: 84 ]]
            -- upvalues: l_Cryo_0 (ref)
            if v25.payload.Experience then
                return l_Cryo_0.Dictionary.join({}, v25.payload.Experience);
            else
                return v24;
            end;
        end, 
        [l_VoiceStatusChanged_0.name] = function(v26, v27) --[[ Line: 91 ]]
            -- upvalues: l_SharedFlags_0 (ref), l_VOICE_STATUS_0 (ref), l_Cryo_0 (ref)
            local l_voiceStatus_2 = v26.voiceStatus;
            local l_status_0 = v27.payload.status;
            if if l_SharedFlags_0.GetFFlagFixPartyVoiceGetPermissions() and l_voiceStatus_2 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED then l_status_0 == l_VOICE_STATUS_0.VOICE_CONNECTING else l_voiceStatus_2 ~= l_status_0 then
                local v30 = l_Cryo_0.Dictionary.join(v26, {
                    voiceStatus = v27.payload.status
                });
                if v27.payload.status == l_VOICE_STATUS_0.VOICE_CONNECTED then
                    v30 = l_Cryo_0.Dictionary.join(v30, {
                        voiceChannelId = v27.payload.voiceChannelId, 
                        voiceSessionId = v27.payload.voiceSessionId
                    });
                end;
                return v30;
            else
                return v26;
            end;
        end
    });
end;