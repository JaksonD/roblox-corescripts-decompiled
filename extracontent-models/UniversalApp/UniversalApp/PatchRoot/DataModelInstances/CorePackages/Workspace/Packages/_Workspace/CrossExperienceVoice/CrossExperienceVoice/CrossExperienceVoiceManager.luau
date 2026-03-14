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
local v34 = game:DefineFastString("CrossExpVoicePlaceId", (tostring(v12.DEFAULT_EXPERIENCE_PLACE_ID)));
local function v35() --[[ Line: 57 ]]

end;
local function _() --[[ Line: 129 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
v17.new = function() --[[ Line: 135 ]] --[[ Name: new ]]
    -- upvalues: l_CrossExperience_0 (copy), v13 (copy), v17 (copy)
    local v37 = {
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
    setmetatable(v37, v17);
    return v37;
end;
v17.logPartyVoiceTimeout = function(v38) --[[ Line: 168 ]] --[[ Name: logPartyVoiceTimeout ]]
    v38.voiceAnalytics:logPartyVoiceTimeout(v38.currentPartyId);
end;
v17.initialize = function(v39) --[[ Line: 172 ]] --[[ Name: initialize ]]
    -- upvalues: l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), v14 (copy), v15 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), l_Players_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_NotificationService_0 (copy)
    v39.voiceAnalytics:initialize(v39.cevEventManager);
    if v39.isInitialized == true then
        return;
    else
        table.insert(v39.connections, l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 181 ]]
            -- upvalues: l_CrossExperience_0 (ref), v39 (copy)
            if (if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC) == l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP then
                v39.isActiveDM = false;
            end;
        end));
        table.insert(v39.connections, l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 191 ]]
            -- upvalues: l_CrossExperience_0 (ref), v39 (copy)
            if (if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC) == l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP then
                v39.isActiveDM = true;
            end;
        end));
        table.insert(v39.connections, l_ExperienceService_0.OnCrossExperienceStarted:Connect(function(_, _) --[[ Line: 201 ]]
            -- upvalues: v39 (copy), v14 (ref), l_CrossExperience_0 (ref), v15 (ref), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (ref), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (ref), l_Players_0 (ref), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref)
            v39.voiceAnalytics:logPartyVoiceOnCrossExperienceStartedSignalReceived(v39.hasExperienceStarted, v39.isActiveDM);
            if v39.hasExperienceStarted then
                return;
            elseif v39.observersInitialized then
                v14:info("Observers already initialized, skipping duplicate setup");
                return;
            else
                v39.observersInitialized = true;
                v14:info("Initializing observers for the first time");
                v39.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(v42) --[[ Line: 221 ]]
                    -- upvalues: v39 (ref), v15 (ref), l_CrossExperience_0 (ref), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (ref), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (ref)
                    v39.voiceAnalytics:logPartyVoiceStateChangeHandlerRun(v39.isActiveDM, v42);
                    if not v39.isActiveDM then
                        return;
                    else
                        if v15.FFlagFireErrorRCCTimeoutSignal and v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
                            v39.voiceAnalytics:logPartyVoiceTimeout(v39.currentPartyId);
                        elseif v15.FFlagPartyVoiceLogActiveDM then
                            local v43 = if v39.isActiveDM then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
                            if v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.VOICE_CONNECTED then
                                v39.voiceAnalytics:logPartyVoiceConnectedState(v42, v39.currentPartyId, v43);
                            end;
                            v39.voiceAnalytics:logPartyVoiceStatusChanged(v42, v39.currentPartyId, v43);
                        else
                            if v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.VOICE_CONNECTED then
                                v39.voiceAnalytics:logPartyVoiceConnectedState(v42, v39.currentPartyId, "");
                            end;
                            v39.voiceAnalytics:logPartyVoiceStatusChanged(v42, v39.currentPartyId, "");
                        end;
                        if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable and v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT or v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or v15.FFlagFireErrorRCCTimeoutSignal and v42.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
                            v39:leave();
                        end;
                        return;
                    end;
                end);
                v39.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(v44) --[[ Line: 272 ]]
                    -- upvalues: v39 (ref), l_Players_0 (ref)
                    v39.ExperienceJoinFailed:Fire();
                    local v45 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0;
                    local v46 = "PARTY_VOICE_GAME_JOIN_FAILED:-1";
                    if v44 and v44.state then
                        v46 = "PARTY_VOICE_GAME_JOIN_FAILED:" .. tostring(v44.state);
                    end;
                    v39.voiceAnalytics:logPartyVoiceJoinFailure(v39.currentPartyId, v46, v45);
                end);
                if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
                    v39.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function() --[[ Line: 283 ]]
                        -- upvalues: v39 (ref)
                        v39:ignoreMemoryWarning();
                        if not v39.shouldIgnoreMemoryWarning then
                            v39.MemoryLow:Fire();
                            v39.shouldIgnoreMemoryWarning = true;
                        end;
                    end);
                end;
                v39.ExperienceJoined:Fire();
                v39.hasExperienceStarted = true;
                return;
            end;
        end));
        table.insert(v39.connections, l_ExperienceService_0.OnCrossExperienceStopped:Connect(function(_, _) --[[ Line: 298 ]]
            -- upvalues: v39 (copy)
            v39:disconnect();
            v39.ExperienceLeft:Fire();
            v39:resetCEVMemStorage();
        end));
        table.insert(v39.connections, l_NotificationService_0.RobloxEventReceived:Connect(function(v49) --[[ Line: 310 ]]
            -- upvalues: v39 (copy)
            if v49.detailType == "SignOut" then
                v39:onUserLogout();
            end;
        end));
        v39.isInitialized = true;
        return;
    end;
end;
v17.onUserLogout = function(v50) --[[ Line: 319 ]] --[[ Name: onUserLogout ]]
    if v50.hasExperienceStarted then
        v50:leave();
    end;
    if v50.isConnected then
        v50:disconnect();
        v50.ExperienceLeft:Fire();
        v50:resetCEVMemStorage();
    end;
end;
v17.getIsConnected = function(v51) --[[ Line: 330 ]] --[[ Name: getIsConnected ]]
    return v51.isConnected;
end;
v17.setAsDisconnected = function(v52) --[[ Line: 334 ]] --[[ Name: setAsDisconnected ]]
    -- upvalues: l_FFlagDisconnectOnBackgroundDmPassiveState_0 (copy)
    if l_FFlagDisconnectOnBackgroundDmPassiveState_0 then
        v52.isConnected = false;
        v52.hasExperienceStarted = false;
        if v52.ExperienceLeft then
            v52.ExperienceLeft:Fire();
        end;
    end;
end;
v17.setAsConnected = function(v53) --[[ Line: 344 ]] --[[ Name: setAsConnected ]]
    if not v53.isInitialized then
        v53:initialize();
    end;
    v53.isConnected = true;
    v53.hasExperienceStarted = true;
    v53.ExperienceJoined:Fire();
end;
v17.getIsBackgroundDMActive = function(_) --[[ Line: 353 ]] --[[ Name: getIsBackgroundDMActive ]]
    -- upvalues: l_Promise_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), l_BACKGROUND_DM_STATUS_0 (copy)
    return l_Promise_0.new(function(v55, v56) --[[ Line: 354 ]]
        -- upvalues: l_Communication_0 (ref), l_CrossExperience_0 (ref), l_BACKGROUND_DM_STATUS_0 (ref)
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(v57) --[[ Line: 358 ]]
            -- upvalues: v55 (copy), l_BACKGROUND_DM_STATUS_0 (ref)
            local l_v55_0 = v55;
            local v59 = true;
            if v57.status ~= l_BACKGROUND_DM_STATUS_0.ACTIVE then
                v59 = v57.status == l_BACKGROUND_DM_STATUS_0.BACKGROUND;
            end;
            l_v55_0(v59);
        end, function() --[[ Line: 361 ]]
            -- upvalues: v56 (copy)
            v56();
        end);
    end);
end;
v17.performJoinFeasibilityCheck = function(v60) --[[ Line: 369 ]] --[[ Name: performJoinFeasibilityCheck ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_CrossExperience_0 (copy), v14 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 373 ]]
            return game:GetService("PerformanceControlService");
        end);
        if not l_status_0 or not l_result_0 then
            v60.JoinFeasibilityCheckPerformed:Fire(false);
            return false;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 382 ]]
                -- upvalues: l_result_0 (copy), l_CrossExperience_0 (ref)
                return l_result_0:IsCrossExperienceLaunchFeasible(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE);
            end);
            if not l_status_1 then
                v14:warn("performJoinFeasibilityCheck() - failed to check feasibility", l_result_1);
                v60.JoinFeasibilityCheckPerformed:Fire(false);
                return false;
            else
                v60.JoinFeasibilityCheckPerformed:Fire(l_result_1);
                return l_result_1;
            end;
        end;
    end;
end;
v17.ignoreMemoryWarning = function(_) --[[ Line: 398 ]] --[[ Name: ignoreMemoryWarning ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), v35 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return;
    else
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, v35, v35);
        return;
    end;
end;
v17.join = function(v66, v67) --[[ Line: 411 ]] --[[ Name: join ]]
    -- upvalues: v34 (copy), l_HttpService_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), l_Players_0 (copy), l_CrossExperience_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_clearTimeout_0 (copy), l_setTimeout_0 (copy), l_getFFlagJoinCrossExpVoiceWithPartyId_0 (copy), v14 (copy), l_ExperienceService_0 (copy), l_game_EngineFeature_1 (copy)
    if v67.shouldIgnoreMemoryWarning then
        v66.shouldIgnoreMemoryWarning = true;
    end;
    if not v66.isInitialized then
        v66:initialize();
    end;
    local v68 = tonumber(v34);
    if v66.isConnected and not v67.force then
        print("CrossExperienceVoiceManager:join() - already connected, returning early.");
        v66.JoinRequestSubmitted:Fire(true);
        return;
    else
        if game:GetEngineFeature("CEVGetBackgroundState") then
            local v69, v70 = v66:getIsBackgroundDMActive():await();
            if v69 and v70 and not v67.force then
                v66:setAsConnected();
                v66.JoinRequestSubmitted:Fire(true);
                return;
            end;
        end;
        v66.currentCevJoinAttemptId = l_HttpService_0:GenerateGUID(false);
        pcall(function() --[[ Line: 441 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref), v66 (copy)
            l_MemStorageService_0:SetItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0, v66.currentCevJoinAttemptId);
        end);
        v66.voiceAnalytics:logPartyVoiceJoinAttempt({
            isConnected = v66.isConnected, 
            targetPlaceId = v68, 
            partyId = v67.partyId, 
            userId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0, 
            activeDm = if v66.isActiveDM then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC
        });
        v66.JoinRequested:Fire();
        if l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 > 0 then
            if v66.joinRequestPulseCheckId then
                l_clearTimeout_0(v66.joinRequestPulseCheckId);
                v66.joinRequestPulseCheckId = nil;
            end;
            v66.joinRequestPulseCheckId = l_setTimeout_0(function() --[[ Line: 461 ]]
                -- upvalues: v66 (copy)
                v66.JoinRequestPulseCheck:Fire();
            end, l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0);
        end;
        v66.isConnected = true;
        if l_getFFlagJoinCrossExpVoiceWithPartyId_0() then
            if not v67 or not v67.partyId then
                v14:warn("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice");
                v66.isConnected = false;
                v66.currentPartyId = nil;
                v66.JoinRequestSubmitted:Fire(v66.isConnected);
                return;
            else
                v66.currentPartyId = v67.partyId;
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 480 ]]
                    -- upvalues: v14 (ref), v67 (copy), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v68 (copy), l_game_EngineFeature_1 (ref), v66 (copy)
                    v14:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. v67.partyId);
                    l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                        partyId = v67.partyId, 
                        placeId = v68, 
                        joinAttemptId = if l_game_EngineFeature_1 then v66.currentCevJoinAttemptId else nil
                    });
                end);
                if not l_status_2 then
                    v14:warn("Failed to join cross experience voice with partyId " .. v67.partyId, l_result_2);
                    local v73 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0;
                    v66.voiceAnalytics:logPartyVoiceJoinFailure(v67.partyId, l_result_2, v73);
                    v66.currentPartyId = nil;
                end;
            end;
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 498 ]]
                -- upvalues: v14 (ref), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v68 (copy), l_game_EngineFeature_1 (ref), v66 (copy)
                v14:info("CrossExperienceVoiceManager:join() - starting cross experience voice");
                l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                    placeId = v68, 
                    joinAttemptId = if l_game_EngineFeature_1 then v66.currentCevJoinAttemptId else nil
                });
            end);
            if not l_status_3 then
                v14:warn("Failed to join cross experience voice: ", l_result_3);
                v66.isConnected = false;
                v66.currentPartyId = nil;
            end;
        end;
        v66.JoinRequestSubmitted:Fire(v66.isConnected);
        return;
    end;
end;
v17.changeInputDevice = function(_, v77, v78) --[[ Line: 516 ]] --[[ Name: changeInputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v35 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, {
        deviceName = v77, 
        deviceGuid = v78
    }, v35, v35);
end;
v17.changeOutputDevice = function(_, v80, v81) --[[ Line: 523 ]] --[[ Name: changeOutputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v35 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, {
        deviceName = v80, 
        deviceGuid = v81
    }, v35, v35);
end;
v17.muteVoiceParticipant = function(v82, v83) --[[ Line: 530 ]] --[[ Name: muteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v82.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v83, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v82.currentCevJoinAttemptId else nil
    });
    v82.voiceAnalytics:logPartyVoiceMuteParticipant(v82.currentPartyId, v83);
end;
v17.unmuteVoiceParticipant = function(v84, v85) --[[ Line: 539 ]] --[[ Name: unmuteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v84.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v85, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v84.currentCevJoinAttemptId else nil
    });
    v84.voiceAnalytics:logPartyVoiceUnmuteParticipant(v84.currentPartyId, v85);
end;
v17.enableVoiceChanger = function(v86, v87) --[[ Line: 548 ]] --[[ Name: enableVoiceChanger ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v86.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, {
        userId = v87, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v86.currentCevJoinAttemptId else nil
    });
end;
v17.disableVoiceChanger = function(v88, v89) --[[ Line: 557 ]] --[[ Name: disableVoiceChanger ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v88.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, {
        userId = v89, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v88.currentCevJoinAttemptId else nil
    });
end;
v17.setVoicePack = function(v90, v91) --[[ Line: 566 ]] --[[ Name: setVoicePack ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v90.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.SET_PARTY_VOICE_PACK, {
        voicePackName = v91, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v90.currentCevJoinAttemptId else nil
    });
end;
v17.enableHearMyself = function(v92, v93) --[[ Line: 575 ]] --[[ Name: enableHearMyself ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v92.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, {
        userId = v93, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v92.currentCevJoinAttemptId else nil
    });
end;
v17.disableHearMyself = function(v94, v95) --[[ Line: 582 ]] --[[ Name: disableHearMyself ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v94.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, {
        userId = v95, 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v94.currentCevJoinAttemptId else nil
    });
end;
v17.blockVoiceParticipant = function(v96, v97) --[[ Line: 589 ]] --[[ Name: blockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if v96.isConnected then
        v96.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, {
            userId = v97, 
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v96.currentCevJoinAttemptId else nil
        });
        v96.voiceAnalytics:logPartyVoiceBlockParticipant(v96.currentPartyId, v97);
    end;
end;
v17.unblockVoiceParticipant = function(v98, v99) --[[ Line: 602 ]] --[[ Name: unblockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if v98.isConnected then
        v98.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, {
            userId = v99, 
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v98.currentCevJoinAttemptId else nil
        });
        v98.voiceAnalytics:logPartyVoiceUnblockParticipant(v98.currentPartyId, v99);
    end;
end;
v17.dumpDebugData = function(v100) --[[ Line: 615 ]] --[[ Name: dumpDebugData ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v100.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DEBUG_COMMAND, {
        name = "dump_session", 
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v100.currentCevJoinAttemptId else nil
    });
end;
v17.leave = function(v101) --[[ Line: 622 ]] --[[ Name: leave ]]
    -- upvalues: l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), l_clearTimeout_0 (copy)
    l_ExperienceService_0:StopCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {});
    if v101.joinRequestPulseCheckId then
        l_clearTimeout_0(v101.joinRequestPulseCheckId);
        v101.joinRequestPulseCheckId = nil;
    end;
    v101.voiceAnalytics:reset();
end;
v17.rejoinVoice = function(v102) --[[ Line: 633 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    v102.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {
        cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v102.currentCevJoinAttemptId else nil
    });
end;
v17.resetCEVMemStorage = function(v103) --[[ Line: 639 ]] --[[ Name: resetCEVMemStorage ]]
    -- upvalues: l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy)
    if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then
        v103.currentCevJoinAttemptId = nil;
        pcall(function() --[[ Line: 642 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref)
            l_MemStorageService_0:RemoveItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
        end);
    end;
end;
v17.disconnect = function(v104) --[[ Line: 648 ]] --[[ Name: disconnect ]]
    -- upvalues: l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), l_MemStorageService_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), v14 (copy), l_clearTimeout_0 (copy), v31 (copy)
    v104.isConnected = false;
    v104.currentPartyId = nil;
    if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then
        v104.currentCevJoinAttemptId = nil;
        pcall(function() --[[ Line: 653 ]]
            -- upvalues: l_MemStorageService_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref)
            l_MemStorageService_0:RemoveItem(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
        end);
    end;
    v104.hasExperienceStarted = false;
    v104.shouldIgnoreMemoryWarning = false;
    v14:info("Disconnecting, resetting observers");
    v104.observersInitialized = false;
    if v104.joinRequestPulseCheckId then
        l_clearTimeout_0(v104.joinRequestPulseCheckId);
        v104.joinRequestPulseCheckId = nil;
    end;
    v31.clean();
end;
v17.getAudioFocusService = function(_) --[[ Line: 672 ]] --[[ Name: getAudioFocusService ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if not l_game_EngineFeature_0 then
        return nil;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 678 ]]
            return game:GetService("AudioFocusService");
        end);
        if not l_status_4 or not l_result_4 then
            return nil;
        else
            return l_result_4;
        end;
    end;
end;
v17.getCurrentAudioContext = function(v108) --[[ Line: 688 ]] --[[ Name: getCurrentAudioContext ]]
    local v109 = v108:getAudioFocusService();
    if v109 == nil then
        return -1;
    else
        return v109:GetFocusedContextId();
    end;
end;
v17.toggleAudioFocus = function(v110) --[[ Line: 697 ]] --[[ Name: toggleAudioFocus ]]
    -- upvalues: l_AUDIO_FOCUS_MANAGEMENT_0 (copy)
    local v111 = v110:getAudioFocusService();
    if v111 == nil then
        return;
    else
        local l_v111_RegisteredContexts_0 = v111:GetRegisteredContexts();
        local v113 = false;
        local v114 = false;
        for v115, _ in pairs(l_v111_RegisteredContexts_0) do
            if v115 == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID then
                v113 = true;
            end;
            if v115 == l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID then
                v114 = true;
            end;
        end;
        if not v113 or not v114 then
            return;
        else
            v111:AcquireFocus(v111:GetFocusedContextId() == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID and l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID or l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID);
            return;
        end;
    end;
end;
v17.muteAll = function(v117, v118) --[[ Line: 726 ]] --[[ Name: muteAll ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
        return;
    else
        if v117.isConnected then
            v117.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, {
                context = v118, 
                cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v117.currentCevJoinAttemptId else nil
            });
        end;
        return;
    end;
end;
v17.unmuteAll = function(v119, v120) --[[ Line: 740 ]] --[[ Name: unmuteAll ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
        return;
    else
        if v119.isConnected then
            v119.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, {
                context = v120, 
                cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v119.currentCevJoinAttemptId else nil
            });
        end;
        return;
    end;
end;
v17.signalCevReadinessSync = function(v121) --[[ Line: 754 ]] --[[ Name: signalCevReadinessSync ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy)
    if not game:GetEngineFeature("CevReadinessSync") then
        return;
    else
        v121.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.FOREGROUND_UI_READY, {
            cevJoinAttemptId = if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v121.currentCevJoinAttemptId else nil
        });
        return;
    end;
end;
v17.default = v17.new();
return v17;