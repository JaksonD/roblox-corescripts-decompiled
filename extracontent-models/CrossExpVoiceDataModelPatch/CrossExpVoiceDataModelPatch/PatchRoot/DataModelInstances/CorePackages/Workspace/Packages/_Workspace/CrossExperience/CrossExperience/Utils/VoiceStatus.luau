local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Types);
local l_VOICE_STATUS_0 = v2.VOICE_STATUS;
local l_SharedFlags_0 = v1.SharedFlags;
local v6 = {
    [l_VOICE_STATUS_0.ERROR_VOICE_INIT] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_SETUP] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_JOIN] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MODERATED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_FAILED] = true
};
local v7 = {
    [l_VOICE_STATUS_0.ERROR_START_BACKGROUND_DM] = true, 
    [l_VOICE_STATUS_0.ERROR_RCC_CONNECTING] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED] = true, 
    [l_VOICE_STATUS_0.ERROR_RCC_TIMEOUT] = true, 
    [l_VOICE_STATUS_0.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT] = true
};
if l_SharedFlags_0.FFlagPartyVoiceEnableMicPermissionsBanner then
    v6[l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED] = nil;
end;
isVoiceRetriableErrorByGameJoin = function(v8) --[[ Line: 36 ]] --[[ Name: isVoiceRetriableErrorByGameJoin ]]
    -- upvalues: v7 (copy)
    if v8 == nil then
        return false;
    else
        return v7[v8] == true;
    end;
end;
isMicPermissionsError = function(v9) --[[ Line: 43 ]] --[[ Name: isMicPermissionsError ]]
    -- upvalues: l_VOICE_STATUS_0 (copy)
    if v9 == nil then
        return false;
    else
        return v9 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED;
    end;
end;
isVoiceRetriableErrorByVoiceJoin = function(v10) --[[ Line: 50 ]] --[[ Name: isVoiceRetriableErrorByVoiceJoin ]]
    -- upvalues: v6 (copy)
    if v10 == nil then
        return false;
    else
        return v6[v10] == true;
    end;
end;
isVoiceRetriableError = function(v11) --[[ Line: 58 ]] --[[ Name: isVoiceRetriableError ]]
    return isVoiceRetriableErrorByGameJoin(v11) or isVoiceRetriableErrorByVoiceJoin(v11);
end;
return {
    isVoiceRetriableError = isVoiceRetriableError, 
    isVoiceRetriableErrorByGameJoin = isVoiceRetriableErrorByGameJoin, 
    isVoiceRetriableErrorByVoiceJoin = isVoiceRetriableErrorByVoiceJoin, 
    isMicPermissionsError = isMicPermissionsError
};