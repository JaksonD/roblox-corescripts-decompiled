local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Types);
local l_VOICE_STATUS_0 = v1.VOICE_STATUS;
local v4 = {
    [l_VOICE_STATUS_0.ERROR_VOICE_INIT] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_SETUP] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_JOIN] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MODERATED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_FAILED] = true
};
local v5 = {
    [l_VOICE_STATUS_0.ERROR_START_BACKGROUND_DM] = true, 
    [l_VOICE_STATUS_0.ERROR_RCC_CONNECTING] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED] = true, 
    [l_VOICE_STATUS_0.ERROR_RCC_TIMEOUT] = true, 
    [l_VOICE_STATUS_0.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT] = true
};
v4[l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED] = nil;
isVoiceRetriableErrorByGameJoin = function(v6) --[[ Line: 29 ]] --[[ Name: isVoiceRetriableErrorByGameJoin ]]
    -- upvalues: v5 (copy)
    if v6 == nil then
        return false;
    else
        return v5[v6] == true;
    end;
end;
isMicPermissionsError = function(v7) --[[ Line: 36 ]] --[[ Name: isMicPermissionsError ]]
    -- upvalues: l_VOICE_STATUS_0 (copy)
    if v7 == nil then
        return false;
    else
        return v7 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED;
    end;
end;
isVoiceRetriableErrorByVoiceJoin = function(v8) --[[ Line: 43 ]] --[[ Name: isVoiceRetriableErrorByVoiceJoin ]]
    -- upvalues: v4 (copy)
    if v8 == nil then
        return false;
    else
        return v4[v8] == true;
    end;
end;
isVoiceRetriableError = function(v9) --[[ Line: 51 ]] --[[ Name: isVoiceRetriableError ]]
    return isVoiceRetriableErrorByGameJoin(v9) or isVoiceRetriableErrorByVoiceJoin(v9);
end;
return {
    isVoiceRetriableError = isVoiceRetriableError, 
    isVoiceRetriableErrorByGameJoin = isVoiceRetriableErrorByGameJoin, 
    isVoiceRetriableErrorByVoiceJoin = isVoiceRetriableErrorByVoiceJoin, 
    isMicPermissionsError = isMicPermissionsError
};