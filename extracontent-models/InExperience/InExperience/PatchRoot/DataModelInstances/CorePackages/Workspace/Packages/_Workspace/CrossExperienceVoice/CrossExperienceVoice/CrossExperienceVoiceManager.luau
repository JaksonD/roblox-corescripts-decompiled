local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v6.Promise;
local l_CrossExperience_0 = v6.CrossExperience;
local l_Communication_0 = l_CrossExperience_0.Communication;
local l_SharedFlags_0 = v6.SharedFlags;
local l_LuauPolyfill_0 = v6.LuauPolyfill;
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local v13 = require(l_script_FirstAncestor_0.CrossExperienceVoiceAnalytics);
local v14 = require(l_script_FirstAncestor_0.Logger);
local v15 = require(l_script_FirstAncestor_0.Flags);
local l_createPersistenceMiddleware_0 = l_CrossExperience_0.Middlewares.createPersistenceMiddleware;
local v17 = {};
v17.__index = v17;
local l_getFFlagJoinCrossExpVoiceWithPartyId_0 = l_SharedFlags_0.getFFlagJoinCrossExpVoiceWithPartyId;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = l_SharedFlags_0.GetFFlagEnableCrossExperienceVoiceCaptureMute;
local l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 = l_SharedFlags_0.FFlagRecordCevJoinAttemptIdInObserverSetup;
local l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 = l_SharedFlags_0.FStringTimeoutLoadingLocalPlayerInBackgroundDM;
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_game_EngineFeature_1 = game:GetEngineFeature("RecordJoinAttemptIdForCEV");
local l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 = l_SharedFlags_0.FIntPartyVoiceJoinRequestPulseCheckTimeout;
local l_FFlagDisconnectOnBackgroundDmPassiveState_0 = l_SharedFlags_0.FFlagDisconnectOnBackgroundDmPassiveState;
local l_BACKGROUND_DM_STATUS_0 = l_CrossExperience_0.Constants.BACKGROUND_DM_STATUS;
local l_AUDIO_FOCUS_MANAGEMENT_0 = l_CrossExperience_0.Constants.AUDIO_FOCUS_MANAGEMENT;
local l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 = l_CrossExperience_0.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM;
local l_CEV_JOIN_ATTEMPT_ID_KEY_0 = l_CrossExperience_0.Constants.CEV_JOIN_ATTEMPT_ID_KEY;
local v31 = l_createPersistenceMiddleware_0({
    storeKey = l_CrossExperience_0.Constants.STORAGE_CEV_STORE_KEY
});
local l_setTimeout_0 = l_LuauPolyfill_0.setTimeout;
local l_clearTimeout_0 = l_LuauPolyfill_0.clearTimeout;
local l_FFlagFixCrossExperienceVoiceExecutePrint_0 = l_SharedFlags_0.FFlagFixCrossExperienceVoiceExecutePrint;
local v35 = game:DefineFastString("CrossExpVoicePlaceId", (tostring(v12.DEFAULT_EXPERIENCE_PLACE_ID)));
local function v36() --[[ Line: 59 ]]

end;
local function _() --[[ Line: 131 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
v17.new = function() --[[ Line: 137 ]] --[[ Name: new ]]
    -- upvalues: l_CrossExperience_0 (copy), v13 (copy), v17 (copy)
    local v38 = {
        joinRequestPulseCheckId = nil, 
        connections = {}, 
        isInitialized = false, 
        isConnected = false, 
        shouldIgnoreMemoryWarning = false, 
        hasExperienceStarted = false, 
        observersInitialized = false, 
        currentCevJoinAttemptId = nil, 
        ExperienceJoined = Instance.new("BindableEvent"), 
        ExperienceJoinFailed = Instance.new("BindableEvent"), 
        ExperienceLeft = Instance.new("BindableEvent"), 
        JoinFeasibilityCheckPerformed = Instance.new("BindableEvent"), 
        JoinRequestPulseCheck = Instance.new("BindableEvent"), 
        JoinRequested = Instance.new("BindableEvent"), 
        JoinRequestSubmitted = Instance.new("BindableEvent"), 
        MemoryLow = Instance.new("BindableEvent"), 
        VoiceEuModalConsented = Instance.new("BindableEvent"), 
        VoiceEuModalRefused = Instance.new("BindableEvent"), 
        cevEventManager = l_CrossExperience_0.EventManager.new(if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC, false), 
        voiceAnalytics = v13.default, 
        isActiveDM = true
    };
    setmetatable(v38, v17);
    return v38;
end;
v17.logPartyVoiceTimeout = function(v39) --[[ Line: 170 ]] --[[ Name: logPartyVoiceTimeout ]]
    v39.voiceAnalytics:logPartyVoiceTimeout(v39.currentPartyId);
end;
v17.initialize = function(v40) --[[ Line: 174 ]] --[[ Name: initialize ]]
    -- upvalues: l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), v14 (copy), v15 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), l_Players_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_NotificationService_0 (copy)
    v40.voiceAnalytics:initialize(v40.cevEventManager);
    if v40.isInitialized == true then
        return;
    else
        table.insert(v40.connections, l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 183 ]]
            -- upvalues: l_CrossExperience_0 (ref), v40 (copy)
            if (if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC) == l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP then
                v40.isActiveDM = false;
            end;
        end));
        table.insert(v40.connections, l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 193 ]]
            -- upvalues: l_CrossExperience_0 (ref), v40 (copy)
            if (if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC) == l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP then
                v40.isActiveDM = true;
            end;
        end));
        table.insert(v40.connections, l_ExperienceService_0.OnCrossExperienceStarted:Connect(function(_, _) --[[ Line: 203 ]]
            -- upvalues: v40 (copy), v14 (ref), l_CrossExperience_0 (ref), v15 (ref), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (ref), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (ref), l_Players_0 (ref), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref)
            v40.voiceAnalytics:logPartyVoiceOnCrossExperienceStartedSignalReceived(v40.hasExperienceStarted, v40.isActiveDM);
            if v40.hasExperienceStarted then
                return;
            elseif v40.observersInitialized then
                v14:info("Observers already initialized, skipping duplicate setup");
                return;
            else
                v40.observersInitialized = true;
                v14:info("Initializing observers for the first time");
                v40.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(v43) --[[ Line: 223 ]]
                    -- upvalues: v40 (ref), v15 (ref), l_CrossExperience_0 (ref), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (ref), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (ref)
                    v40.voiceAnalytics:logPartyVoiceStateChangeHandlerRun(v40.isActiveDM, v43);
                    if not v40.isActiveDM then
                        return;
                    else
                        if v15.FFlagFireErrorRCCTimeoutSignal and v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
                            v40.voiceAnalytics:logPartyVoiceTimeout(v40.currentPartyId);
                        elseif v15.FFlagPartyVoiceLogActiveDM then
                            local v44 = if v40.isActiveDM then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
                            if v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.VOICE_CONNECTED then
                                v40.voiceAnalytics:logPartyVoiceConnectedState(v43, v40.currentPartyId, v44);
                            end;
                            v40.voiceAnalytics:logPartyVoiceStatusChanged(v43, v40.currentPartyId, v44);
                        else
                            if v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.VOICE_CONNECTED then
                                v40.voiceAnalytics:logPartyVoiceConnectedState(v43, v40.currentPartyId, "");
                            end;
                            v40.voiceAnalytics:logPartyVoiceStatusChanged(v43, v40.currentPartyId, "");
                        end;
                        if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable and v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT or v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or v15.FFlagFireErrorRCCTimeoutSignal and v43.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
                            v40:leave();
                        end;
                        return;
                    end;
                end);
                v40.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(v45) --[[ Line: 274 ]]
                    -- upvalues: v40 (ref), l_Players_0 (ref)
                    v40.ExperienceJoinFailed:Fire();
                    local v46 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0;
                    local v47 = "PARTY_VOICE_GAME_JOIN_FAILED:-1";
                    if v45 and v45.state then
                        v47 = "PARTY_VOICE_GAME_JOIN_FAILED:" .. tostring(v45.state);
                    end;
                    v40.voiceAnalytics:logPartyVoiceJoinFailure(v40.currentPartyId, v47, v46);
                end);
                if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
                    v40.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function() --[[ Line: 285 ]]
                        -- upvalues: v40 (ref)
                        v40:ignoreMemoryWarning();
                        if not v40.shouldIgnoreMemoryWarning then
                            v40.MemoryLow:Fire();
                            v40.shouldIgnoreMemoryWarning = true;
                        end;
                    end);
                end;
                v40.ExperienceJoined:Fire();
                v40.hasExperienceStarted = true;
                return;
            end;
        end));
        table.insert(v40.connections, l_ExperienceService_0.OnCrossExperienceStopped:Connect(function(_, _) --[[ Line: 300 ]]
            -- upvalues: v40 (copy)
            v40:disconnect();
            v40.ExperienceLeft:Fire();
            v40:resetCEVMemStorage();
        end));
        table.insert(v40.connections, l_NotificationService_0.RobloxEventReceived:Connect(function(v50) --[[ Line: 312 ]]
            -- upvalues: v40 (copy)
            if v50.detailType == "SignOut" then
                v40:onUserLogout();
            end;
        end));
        v40.isInitialized = true;
        return;
    end;
end;
v17.onUserLogout = function(v51) --[[ Line: 321 ]] --[[ Name: onUserLogout ]]
    if v51.hasExperienceStarted then
        v51:leave();
    end;
    if v51.isConnected then
        v51:disconnect();
        v51.ExperienceLeft:Fire();
        v51:resetCEVMemStorage();
    end;
end;
v17.getIsConnected = function(v52) --[[ Line: 332 ]] --[[ Name: getIsConnected ]]
    return v52.isConnected;
end;
v17.setAsDisconnected = function(v53) --[[ Line: 336 ]] --[[ Name: setAsDisconnected ]]
    -- upvalues: l_FFlagDisconnectOnBackgroundDmPassiveState_0 (copy)
    if l_FFlagDisconnectOnBackgroundDmPassiveState_0 then
        v53.isConnected = false;
        v53.hasExperienceStarted = false;
        if v53.ExperienceLeft then
            v53.ExperienceLeft:Fire();
        end;
    end;
end;
v17.setAsConnected = function(v54) --[[ Line: 346 ]] --[[ Name: setAsConnected ]]
    if not v54.isInitialized then
        v54:initialize();
    end;
    v54.isConnected = true;
    v54.hasExperienceStarted = true;
    v54.ExperienceJoined:Fire();
end;
v17.getIsBackgroundDMActive = function(_) --[[ Line: 355 ]] --[[ Name: getIsBackgroundDMActive ]]
    -- upvalues: l_Promise_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), l_BACKGROUND_DM_STATUS_0 (copy)
    return l_Promise_0.new(function(v56, v57) --[[ Line: 356 ]]
        -- upvalues: l_Communication_0 (ref), l_CrossExperience_0 (ref), l_BACKGROUND_DM_STATUS_0 (ref)
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(v58) --[[ Line: 360 ]]
            -- upvalues: v56 (copy), l_BACKGROUND_DM_STATUS_0 (ref)
            local l_v56_0 = v56;
            local v60 = true;
            if v58.status ~= l_BACKGROUND_DM_STATUS_0.ACTIVE then
                v60 = v58.status == l_BACKGROUND_DM_STATUS_0.BACKGROUND;
            end;
            l_v56_0(v60);
        end, function() --[[ Line: 363 ]]
            -- upvalues: v57 (copy)
            v57();
        end);
    end);
end;
v17.performJoinFeasibilityCheck = function(v61) --[[ Line: 371 ]] --[[ Name: performJoinFeasibilityCheck ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_CrossExperience_0 (copy), l_FFlagFixCrossExperienceVoiceExecutePrint_0 (copy), v14 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 375 ]]
            return game:GetService("PerformanceControlService");
        end);
        if not l_status_0 or not l_result_0 then
            v61.JoinFeasibilityCheckPerformed:Fire(false);
            return false;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 384 ]]
                -- upvalues: l_result_0 (copy), l_CrossExperience_0 (ref)
                return l_result_0:IsCrossExperienceLaunchFeasible(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE);
            end);
            if not l_status_1 then
                if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
                    v14:warning("performJoinFeasibilityCheck() - failed to check feasibility", l_result_1);
                else
                    v14:warn("performJoinFeasibilityCheck() - failed to check feasibility", l_result_1);
                end;
                v61.JoinFeasibilityCheckPerformed:Fire(false);
                return false;
            else
                v61.JoinFeasibilityCheckPerformed:Fire(l_result_1);
                return l_result_1;
            end;
        end;
    end;
end;
v17.ignoreMemoryWarning = function(_) --[[ Line: 404 ]] --[[ Name: ignoreMemoryWarning ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), v36 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return;
    else
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, v36, v36);
        return;
    end;
end;
v17.join = function(v67, v68) --[[ Line: 417 ]] --[[ Name: join ]]
    -- upvalues: v35 (copy), l_FFlagFixCrossExperienceVoiceExecutePrint_0 (copy), v14 (copy), l_HttpService_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), l_Players_0 (copy), l_CrossExperience_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy), l_getFFlagJoinCrossExpVoiceWithPartyId_0 (copy), l_ExperienceService_0 (copy), l_game_EngineFeature_1 (copy)
    if v68.shouldIgnoreMemoryWarning then
        v67.shouldIgnoreMemoryWarning = true;
    end;
    if not v67.isInitialized then
        v67:initialize();
    end;
    local v69 = tonumber(v35);
    if v67.isConnected and not v68.force then
        if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
            v14:info("CrossExperienceVoiceManager:join() - already connected, returning early.");
        else
            print("CrossExperienceVoiceManager:join() - already connected, returning early.");
        end;
        v67.JoinRequestSubmitted:Fire(true);
        return;
    else
        if game:GetEngineFeature("CEVGetBackgroundState") then
            local v70, v71 = v67:getIsBackgroundDMActive():await();
            if v70 and v71 and not v68.force then
                v67:setAsConnected();
                v67.JoinRequestSubmitted:Fire(true);
                return;
            end;
        end;
        v67.currentCevJoinAttemptId = l_HttpService_0:GenerateGUID(false);
        pcall(function() --[[ Line: 451 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref), v67 (copy)
            l_MemStorageService_0:SetItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0, v67.currentCevJoinAttemptId);
        end);
        v67.voiceAnalytics:logPartyVoiceJoinAttempt({
            isConnected = v67.isConnected, 
            targetPlaceId = v69, 
            partyId = v68.partyId, 
            userId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0, 
            activeDm = if v67.isActiveDM then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC
        });
        v67.JoinRequested:Fire();
        if l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 > 0 then
            if v67.joinRequestPulseCheckId then
                l_clearTimeout_0(v67.joinRequestPulseCheckId);
                v67.joinRequestPulseCheckId = nil;
            end;
            v67.joinRequestPulseCheckId = l_setTimeout_0(function() --[[ Line: 471 ]]
                -- upvalues: v67 (copy)
                v67.JoinRequestPulseCheck:Fire();
            end, l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0);
        end;
        v67.isConnected = true;
        if l_getFFlagJoinCrossExpVoiceWithPartyId_0() then
            if not v68 or not v68.partyId then
                if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
                    v14:warning("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice");
                else
                    v14:warn("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice");
                end;
                v67.isConnected = false;
                v67.currentPartyId = nil;
                v67.JoinRequestSubmitted:Fire(v67.isConnected);
                return;
            else
                v67.currentPartyId = v68.partyId;
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 496 ]]
                    -- upvalues: v14 (ref), v68 (copy), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v69 (copy), l_game_EngineFeature_1 (ref), v67 (copy)
                    v14:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. v68.partyId);
                    l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                        partyId = v68.partyId, 
                        placeId = v69, 
                        joinAttemptId = if l_game_EngineFeature_1 then v67.currentCevJoinAttemptId else nil
                    });
                end);
                if not l_status_2 then
                    if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
                        v14:warning("Failed to join cross experience voice with partyId " .. v68.partyId, l_result_2);
                    else
                        v14:warn("Failed to join cross experience voice with partyId " .. v68.partyId, l_result_2);
                    end;
                    local v74 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0;
                    v67.voiceAnalytics:logPartyVoiceJoinFailure(v68.partyId, l_result_2, v74);
                    v67.currentPartyId = nil;
                end;
            end;
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 518 ]]
                -- upvalues: v14 (ref), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v69 (copy), l_game_EngineFeature_1 (ref), v67 (copy)
                v14:info("CrossExperienceVoiceManager:join() - starting cross experience voice");
                l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                    placeId = v69, 
                    joinAttemptId = if l_game_EngineFeature_1 then v67.currentCevJoinAttemptId else nil
                });
            end);
            if not l_status_3 then
                if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
                    v14:warning("Failed to join cross experience voice: ", l_result_3);
                else
                    v14:warn("Failed to join cross experience voice: ", l_result_3);
                end;
                v67.isConnected = false;
                v67.currentPartyId = nil;
            end;
        end;
        v67.JoinRequestSubmitted:Fire(v67.isConnected);
        return;
    end;
end;
v17.changeInputDevice = function(_, v78, v79) --[[ Line: 540 ]] --[[ Name: changeInputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v36 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, {
        deviceName = v78, 
        deviceGuid = v79
    }, v36, v36);
end;
v17.changeOutputDevice = function(_, v81, v82) --[[ Line: 547 ]] --[[ Name: changeOutputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v36 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, {
        deviceName = v81, 
        deviceGuid = v82
    }, v36, v36);
end;
v17.muteVoiceParticipant = function(v83, v84) --[[ Line: 554 ]] --[[ Name: muteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v83.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v84, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v83.currentCevJoinAttemptId else nil
    });
    v83.voiceAnalytics:logPartyVoiceMuteParticipant(v83.currentPartyId, v84);
end;
v17.unmuteVoiceParticipant = function(v85, v86) --[[ Line: 563 ]] --[[ Name: unmuteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v85.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v86, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v85.currentCevJoinAttemptId else nil
    });
    v85.voiceAnalytics:logPartyVoiceUnmuteParticipant(v85.currentPartyId, v86);
end;
v17.enableVoiceChanger = function(v87, v88) --[[ Line: 572 ]] --[[ Name: enableVoiceChanger ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v87.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, {
        userId = v88, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v87.currentCevJoinAttemptId else nil
    });
end;
v17.disableVoiceChanger = function(v89, v90) --[[ Line: 581 ]] --[[ Name: disableVoiceChanger ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v89.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, {
        userId = v90, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v89.currentCevJoinAttemptId else nil
    });
end;
v17.setVoicePack = function(v91, v92) --[[ Line: 590 ]] --[[ Name: setVoicePack ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v91.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.SET_PARTY_VOICE_PACK, {
        voicePackName = v92, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v91.currentCevJoinAttemptId else nil
    });
end;
v17.enableHearMyself = function(v93, v94) --[[ Line: 599 ]] --[[ Name: enableHearMyself ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v93.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, {
        userId = v94, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v93.currentCevJoinAttemptId else nil
    });
end;
v17.disableHearMyself = function(v95, v96) --[[ Line: 606 ]] --[[ Name: disableHearMyself ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v95.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, {
        userId = v96, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v95.currentCevJoinAttemptId else nil
    });
end;
v17.blockVoiceParticipant = function(v97, v98) --[[ Line: 613 ]] --[[ Name: blockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if v97.isConnected then
        v97.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, {
            userId = v98, 
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v97.currentCevJoinAttemptId else nil
        });
        v97.voiceAnalytics:logPartyVoiceBlockParticipant(v97.currentPartyId, v98);
    end;
end;
v17.unblockVoiceParticipant = function(v99, v100) --[[ Line: 626 ]] --[[ Name: unblockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if v99.isConnected then
        v99.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, {
            userId = v100, 
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v99.currentCevJoinAttemptId else nil
        });
        v99.voiceAnalytics:logPartyVoiceUnblockParticipant(v99.currentPartyId, v100);
    end;
end;
v17.dumpDebugData = function(v101) --[[ Line: 639 ]] --[[ Name: dumpDebugData ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v101.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DEBUG_COMMAND, {
        name = "dump_session", 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v101.currentCevJoinAttemptId else nil
    });
end;
v17.leave = function(v102) --[[ Line: 646 ]] --[[ Name: leave ]]
    -- upvalues: l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), l_clearTimeout_0 (copy)
    l_ExperienceService_0:StopCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {});
    if v102.joinRequestPulseCheckId then
        l_clearTimeout_0(v102.joinRequestPulseCheckId);
        v102.joinRequestPulseCheckId = nil;
    end;
    v102.voiceAnalytics:reset();
end;
v17.rejoinVoice = function(v103) --[[ Line: 657 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v103.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v103.currentCevJoinAttemptId else nil
    });
end;
v17.resetCEVMemStorage = function(v104) --[[ Line: 663 ]] --[[ Name: resetCEVMemStorage ]]
    -- upvalues: l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy)
    if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then
        v104.currentCevJoinAttemptId = nil;
        pcall(function() --[[ Line: 666 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref)
            l_MemStorageService_0:RemoveItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
        end);
    end;
end;
v17.disconnect = function(v105) --[[ Line: 672 ]] --[[ Name: disconnect ]]
    -- upvalues: l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), v14 (copy), l_clearTimeout_0 (copy), v31 (copy)
    v105.isConnected = false;
    v105.currentPartyId = nil;
    if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then
        v105.currentCevJoinAttemptId = nil;
        pcall(function() --[[ Line: 677 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref)
            l_MemStorageService_0:RemoveItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
        end);
    end;
    v105.hasExperienceStarted = false;
    v105.shouldIgnoreMemoryWarning = false;
    v14:info("Disconnecting, resetting observers");
    v105.observersInitialized = false;
    if v105.joinRequestPulseCheckId then
        l_clearTimeout_0(v105.joinRequestPulseCheckId);
        v105.joinRequestPulseCheckId = nil;
    end;
    v31.clean();
end;
v17.getAudioFocusService = function(_) --[[ Line: 696 ]] --[[ Name: getAudioFocusService ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if not l_game_EngineFeature_0 then
        return nil;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 702 ]]
            return game:GetService("AudioFocusService");
        end);
        if not l_status_4 or not l_result_4 then
            return nil;
        else
            return l_result_4;
        end;
    end;
end;
v17.getCurrentAudioContext = function(v109) --[[ Line: 712 ]] --[[ Name: getCurrentAudioContext ]]
    local v110 = v109:getAudioFocusService();
    if v110 == nil then
        return -1;
    else
        return v110:GetFocusedContextId();
    end;
end;
v17.toggleAudioFocus = function(v111) --[[ Line: 721 ]] --[[ Name: toggleAudioFocus ]]
    -- upvalues: l_AUDIO_FOCUS_MANAGEMENT_0 (copy)
    local v112 = v111:getAudioFocusService();
    if v112 == nil then
        return;
    else
        local l_v112_RegisteredContexts_0 = v112:GetRegisteredContexts();
        local v114 = false;
        local v115 = false;
        for v116, _ in pairs(l_v112_RegisteredContexts_0) do
            if v116 == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID then
                v114 = true;
            end;
            if v116 == l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID then
                v115 = true;
            end;
        end;
        if not v114 or not v115 then
            return;
        else
            v112:AcquireFocus(v112:GetFocusedContextId() == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID and l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID or l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID);
            return;
        end;
    end;
end;
v17.muteAll = function(v118, v119) --[[ Line: 750 ]] --[[ Name: muteAll ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
        return;
    else
        if v118.isConnected then
            v118.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, {
                context = v119, 
                cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v118.currentCevJoinAttemptId else nil
            });
        end;
        return;
    end;
end;
v17.unmuteAll = function(v120, v121) --[[ Line: 764 ]] --[[ Name: unmuteAll ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
        return;
    else
        if v120.isConnected then
            v120.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, {
                context = v121, 
                cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v120.currentCevJoinAttemptId else nil
            });
        end;
        return;
    end;
end;
v17.signalCevReadinessSync = function(v122) --[[ Line: 778 ]] --[[ Name: signalCevReadinessSync ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not game:GetEngineFeature("CevReadinessSync") then
        return;
    else
        v122.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.FOREGROUND_UI_READY, {
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v122.currentCevJoinAttemptId else nil
        });
        return;
    end;
end;
v17.default = v17.new();
return v17;