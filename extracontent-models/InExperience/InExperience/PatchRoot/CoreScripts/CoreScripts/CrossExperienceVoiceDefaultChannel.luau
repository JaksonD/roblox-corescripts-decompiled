local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringTimeoutLoadingLocalPlayerInBackgroundDM;
local l_getMemStorageKey_0 = v7.Utils.getMemStorageKey;
local l_CEV_JOIN_ATTEMPT_ID_KEY_0 = v7.Constants.CEV_JOIN_ATTEMPT_ID_KEY;
local l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 = v7.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM;
local v12 = game:DefineFastInt("BackgroundDMLocalPlayerLoadingTimeoutSeconds", 12);
local v13 = game:DefineFastFlag("DelayAudioFocusReplication", false);
local v14 = game:DefineFastInt("PlayerAudioFocusReplicationTimeoutSeconds", 10);
local v15 = nil;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v15 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
end;
local function v19(v16, v17) --[[ Line: 30 ]] --[[ Name: sendAnalyticsEvent ]]
    -- upvalues: l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v15 (ref), l_RbxAnalyticsService_0 (copy)
    local v18 = v17 or {};
    v18.cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
    v18.clientTimeStamp = os.time();
    v18.userId = if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then nil else v15;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "partyVoice", v16, v18);
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v19("partyVoiceCEVChannelFileLoaded");
end;
local v20 = v7.EventManager.new(v7.Constants.EXPERIENCE_TYPE_VOICE, true);
local function _(v21, v22) --[[ Line: 51 ]] --[[ Name: notifyVoiceStatusChange ]]
    -- upvalues: v20 (copy), v7 (copy)
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = v21, 
        detail = v22
    });
end;
local function v32() --[[ Line: 59 ]] --[[ Name: ensureLocalPlayerWithTimeout ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), v12 (copy), v19 (copy), v7 (copy), v20 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        local v27 = v5.new(function(v25) --[[ Line: 63 ]]
            -- upvalues: l_Players_0 (ref)
            if l_Players_0.LocalPlayer then
                v25("loaded");
                return;
            else
                local v26 = nil;
                v26 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 68 ]]
                    -- upvalues: l_Players_0 (ref), v26 (ref), v25 (copy)
                    if l_Players_0.LocalPlayer then
                        v26:Disconnect();
                        v25("loaded");
                    end;
                end);
                return;
            end;
        end);
        local v28 = v5.delay(v12):andThen(function() --[[ Line: 78 ]]
            return "timeout";
        end);
        v5.race({
            v27, 
            v28
        }):andThen(function(v29) --[[ Line: 83 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v19 (ref), v12 (ref), v7 (ref), v20 (ref)
            if v29 == "loaded" then
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v19("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
                    timeoutSeconds = v12
                });
                return;
            else
                v19("backgroundDMLocalPlayerLoadingTimeout", {
                    timeoutSeconds = v12
                });
                local l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0 = v7.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT;
                local v31 = "LocalPlayer loading timed out after " .. v12 .. " seconds";
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0, 
                    detail = v31
                });
                l_LocalPlayer_0 = nil;
                return;
            end;
        end):await();
    end;
    if not l_LocalPlayer_0 then
        v5.new(function() --[[ Line: 110 ]]

        end):await();
    end;
    return l_LocalPlayer_0.UserId;
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v15 = -1;
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v19("partyVoiceCEVChannelFileLoaded");
end;
local v33 = nil;
if not v13 then
    v33 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged");
    v19("partyVoicePlayerAudioFocusChangedLoaded");
end;
local v34 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v36 = require(l_CorePackages_0.Packages.Rodux);
local v37 = require(l_CorePackages_0.Packages.Cryo);
local l_default_1 = v34.CoreVoiceManager.default;
local l_createPersistenceMiddleware_0 = v7.Middlewares.createPersistenceMiddleware;
local v40 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v41 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v42 = if v41.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_FFlagPartyVoiceBlockSync_0 = v41.FFlagPartyVoiceBlockSync;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v41.GetFFlagVoiceChatClientRewriteMasterLua;
local v46 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v47 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v48 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v49 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local l_GetFFlagEnableLuaVoiceChatAnalytics_0 = v34.Flags.GetFFlagEnableLuaVoiceChatAnalytics;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local v53 = game:DefineFastFlag("LogPartyVoiceReconnect", false);
local v54 = game:DefineFastFlag("PartyVoiceFixCaptureVideoCheck", false);
local l_FIntPartyVoiceUndeafenDelayMS_0 = v41.FIntPartyVoiceUndeafenDelayMS;
local v56 = game:DefineFastFlag("PartyVoiceExecuteVoiceActionsPostAsyncInit", false);
local v57 = game:DefineFastInt("VoiceJoinTimeoutInSeconds", 15);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("AudioFocusManagement");
local l_game_EngineFeature_3 = game:GetEngineFeature("CevReadinessSync");
local v62 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v63 = v34.Analytics.new();
local l_observeCurrentContextId_0 = v7.Utils.observeCurrentContextId;
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Constants_0 = v7.Constants;
local l_VOICE_STATUS_0 = l_Constants_0.VOICE_STATUS;
local v68 = v41.GetFFlagFixPartyVoiceGetPermissions();
local l_FFlagEnablePartyVoiceChangersInLua_0 = v41.FFlagEnablePartyVoiceChangersInLua;
local v70 = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false);
local v71 = nil;
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    l_default_1:setOptions({
        allowSeamlessVoice = false, 
        passInitErrorInPromiseReject = true, 
        forceVoiceEnabled = true
    });
end;
local v72 = l_createPersistenceMiddleware_0({
    storeKey = v7.Constants.STORAGE_CEV_STORE_KEY
});
v19("partyVoicePersistenceMiddlewareCreated");
local l_default_2 = v7.PartyAudioPlayer.default;
local function v74() --[[ Line: 205 ]]
    -- upvalues: v36 (copy), v7 (copy)
    return v36.combineReducers({
        Squad = v36.combineReducers({
            CrossExperienceVoice = v7.installReducer()
        })
    });
end;
v19("partyVoiceCrossExperienceReducerLoaded");
local function v77(v75) --[[ Line: 216 ]]
    -- upvalues: l_default_1 (copy), v62 (copy)
    l_default_1:asyncInit():andThen(function() --[[ Line: 218 ]]
        -- upvalues: v75 (copy)
        v75();
    end):catch(function(v76) --[[ Line: 221 ]]
        -- upvalues: v62 (ref)
        v62:info("CoreVoiceManager did not initialize {}", v76);
    end);
end;
local v78 = {
    previousGroupId = nil, 
    previousMutedState = false
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local v80 = false;
local v81 = nil;
if l_game_EngineFeature_3 then
    v62:info("Registering early observer for foreground readiness signal.");
    v81 = v20:addObserver(v7.Constants.EVENTS.FOREGROUND_UI_READY, function() --[[ Line: 237 ]]
        -- upvalues: v80 (ref), v62 (copy), l_BindableEvent_0 (copy)
        if not v80 then
            v62:info("Received foreground UI readiness signal.");
            v80 = true;
            l_BindableEvent_0:Fire();
        end;
    end);
end;
local v82 = v36.Store.new(v74(), nil, {
    v36.thunkMiddleware, 
    v72.getMiddleware()
});
v19("partyVoicePersistenceMiddlewareReducerLoaded");
v20:subscribe(v82);
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
v19("partyVoiceGameLoaded");
local l_RCC_CONNECTED_0 = l_Constants_0.VOICE_STATUS.RCC_CONNECTED;
v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
    status = l_RCC_CONNECTED_0, 
    detail = nil
});
v19("partyVoiceRCCConnectedSignalFired");
v20:notify(v7.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
    jobId = if not (game.JobId ~= "") or game.JobId == nil then l_HttpService_0:GenerateGUID(true) else game.JobId, 
    placeId = game.PlaceId, 
    gameId = game.GameId
});
if v13 then
    l_RCC_CONNECTED_0 = nil;
    local v84 = false;
    do
        local l_l_RCC_CONNECTED_0_0, l_v84_0 = l_RCC_CONNECTED_0, v84;
        l_observeCurrentContextId_0(function(v87) --[[ Line: 279 ]]
            -- upvalues: l_l_RCC_CONNECTED_0_0 (ref), l_v84_0 (ref), v33 (ref)
            l_l_RCC_CONNECTED_0_0 = v87;
            print("CurrentContextId changed to", v87, "isReplicationReady:", l_v84_0);
            if l_v84_0 and v33 then
                v33:FireServer(v87);
                print("Fired PlayerAudioFocusChanged with contextId:", v87);
            end;
        end);
        print("Waiting for PlayerAudioFocusChanged to replicate...");
        v33 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged", v14);
        if v33 then
            print("PlayerAudioFocusChanged replicated successfully.");
            v19("partyVoicePlayerAudioFocusChangedLoaded");
            v33.OnClientEvent:Connect(function(v88, v89, v90) --[[ Line: 301 ]]
                -- upvalues: v20 (copy), v7 (copy)
                print("Received PlayerAudioFocusChanged OnClientEvent:", v88, v89);
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
                    userId = v88, 
                    contextId = v89, 
                    contextIds = v90
                });
            end);
            l_v84_0 = true;
            if l_l_RCC_CONNECTED_0_0 then
                v33:FireServer(l_l_RCC_CONNECTED_0_0);
                print("Fired PlayerAudioFocusChanged with latestContextId:", l_l_RCC_CONNECTED_0_0);
            end;
        else
            print("PlayerAudioFocusChanged did not replicate within timeout of ", v14, " seconds.");
            v19("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
                timeoutSeconds = v14
            });
        end;
    end;
else
    l_observeCurrentContextId_0(function(v91) --[[ Line: 327 ]]
        -- upvalues: v33 (ref)
        v33:FireServer(v91);
    end);
    v33.OnClientEvent:Connect(function(v92, v93, v94) --[[ Line: 331 ]]
        -- upvalues: v20 (copy), v7 (copy)
        v20:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
            userId = v92, 
            contextId = v93, 
            contextIds = v94
        });
    end);
end;
l_RCC_CONNECTED_0 = function(v95) --[[ Line: 340 ]]
    -- upvalues: v20 (copy), v7 (copy), v15 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
        userId = v95.UserId, 
        isLocalUser = v95.UserId == v15, 
        username = v95.Name, 
        displayname = v95.DisplayName, 
        isVoiceChangerActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        isVoiceChangerHearMyselfActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        selectedVoicePack = l_FFlagEnablePartyVoiceChangersInLua_0 and "None" or nil
    });
end;
local function v97(v96) --[[ Line: 358 ]]
    -- upvalues: v20 (copy), v7 (copy), v15 (ref), l_default_2 (copy)
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, {
        userId = v96.UserId, 
        isLocalUser = v96.UserId == v15
    });
    l_default_2:playSound("leave");
end;
local function v100(v98) --[[ Line: 366 ]]
    -- upvalues: v7 (copy), v20 (copy), v15 (ref)
    local v99 = if v98.isActive then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
    v20:notify(v99, {
        userId = v15, 
        isLocalUser = true
    });
end;
local function v103(v101) --[[ Line: 376 ]]
    -- upvalues: v70 (copy), v78 (ref), v7 (copy), v56 (copy), v77 (copy), v20 (copy), v15 (ref)
    if not v70 then
        v78.previousMutedState = v101;
    end;
    local v102 = if v101 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
    if v56 then
        v77(function() --[[ Line: 385 ]]
            -- upvalues: v20 (ref), v102 (copy), v15 (ref)
            v20:notify(v102, {
                userId = v15, 
                isLocalUser = true
            });
        end);
        return;
    else
        v20:notify(v102, {
            userId = v15, 
            isLocalUser = true
        });
        return;
    end;
end;
local function v106(v104) --[[ Line: 399 ]] --[[ Name: onLocalVoiceChangerChanged ]]
    -- upvalues: v7 (copy), v20 (copy), v15 (ref)
    local v105 = if v104 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED;
    v20:notify(v105, {
        userId = v15, 
        isLocalUser = true
    });
end;
local function v109(v107) --[[ Line: 410 ]] --[[ Name: onLocalVoiceChangerHearMyselfChanged ]]
    -- upvalues: v7 (copy), v20 (copy), v15 (ref)
    local v108 = if v107 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED;
    v20:notify(v108, {
        userId = v15, 
        isLocalUser = true
    });
end;
local function v120(v110) --[[ Line: 421 ]]
    -- upvalues: l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v7 (copy), v15 (ref), v20 (copy)
    for v111, v112 in pairs(v110) do
        local l_isSignalActive_0 = v112.isSignalActive;
        local l_isMuted_0 = v112.isMuted;
        local v115 = if l_FFlagEnablePartyVoiceChangersInLua_0 then v112.isVoiceChangerActive else nil;
        local v116 = if l_isSignalActive_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
        local v117 = if l_isMuted_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
        local v118 = if l_FFlagEnablePartyVoiceChangersInLua_0 then if v115 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil;
        local v119 = {
            userId = v111, 
            isLocalUser = v111 == v15
        };
        v20:notify(v117, v119);
        v20:notify(v116, v119);
        if l_FFlagEnablePartyVoiceChangersInLua_0 then
            v20:notify(v118, v119);
        end;
    end;
end;
local function v124(v121) --[[ Line: 454 ]]
    -- upvalues: v15 (ref), v56 (copy), v77 (copy), v70 (copy), v78 (ref), l_default_1 (copy)
    local v122 = tonumber(v121.userId);
    local v123 = v15 == v122;
    if v56 then
        v77(function() --[[ Line: 459 ]]
            -- upvalues: v123 (copy), v70 (ref), v78 (ref), l_default_1 (ref), v122 (copy)
            if v123 then
                if v70 then
                    v78.previousMutedState = not l_default_1.localMuted;
                end;
                l_default_1:ToggleMic("Squads");
                return;
            else
                l_default_1:ToggleMutePlayer(v122);
                return;
            end;
        end);
        return;
    elseif v123 then
        l_default_1:ToggleMic("Squads");
        return;
    else
        l_default_1:ToggleMutePlayer(v122);
        return;
    end;
end;
local function v127(v125) --[[ Line: 478 ]] --[[ Name: setVoicePack ]]
    -- upvalues: l_default_1 (copy), v20 (copy), v7 (copy), v15 (ref)
    local l_voicePackName_0 = v125.voicePackName;
    l_default_1:SetVoicePack(l_voicePackName_0);
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
        userId = v15, 
        isLocalUser = true, 
        voicePackName = l_voicePackName_0
    });
end;
local function v130(v128) --[[ Line: 488 ]] --[[ Name: toggleVoiceChanger ]]
    -- upvalues: v15 (ref), l_default_1 (copy)
    local v129 = tonumber(v128.userId);
    if v15 == v129 then
        l_default_1:ToggleVoiceChanger("Squads");
        return;
    else
        l_default_1:ToggleVoiceChanger(v129);
        return;
    end;
end;
local function v133(v131) --[[ Line: 499 ]] --[[ Name: toggleVoiceChangerHearMyself ]]
    -- upvalues: v15 (ref), l_default_1 (copy)
    local v132 = tonumber(v131.userId);
    if v15 == v132 then
        l_default_1:ToggleVoiceChangerHearMyself("Squads");
        return;
    else
        l_default_1:ToggleVoiceChangerHearMyself(v132);
        return;
    end;
end;
handleParticipants = function() --[[ Line: 510 ]] --[[ Name: handleParticipants ]]
    -- upvalues: l_Players_0 (copy), l_RCC_CONNECTED_0 (copy), l_default_2 (copy), v97 (copy), v15 (ref)
    l_Players_0.PlayerAdded:Connect(function(v134) --[[ Line: 511 ]]
        -- upvalues: l_RCC_CONNECTED_0 (ref), l_default_2 (ref)
        l_RCC_CONNECTED_0(v134);
        l_default_2:playSound("join");
    end);
    l_Players_0.PlayerRemoving:Connect(v97);
    for _, v136 in pairs(l_Players_0:GetPlayers()) do
        if v136:IsA("Player") then
            l_RCC_CONNECTED_0(v136);
            if v136.UserId == v15 then
                l_default_2:playSound("join");
            end;
        end;
    end;
end;
handleMicrophone = function() --[[ Line: 527 ]] --[[ Name: handleMicrophone ]]
    -- upvalues: l_default_1 (copy), v103 (copy), v20 (copy), v7 (copy), v124 (copy)
    l_default_1.muteChanged.Event:Connect(v103);
    v20:addObserver(v7.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, v124);
    v20:addObserver(v7.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, v124);
end;
handleVoiceChanger = function() --[[ Line: 533 ]] --[[ Name: handleVoiceChanger ]]
    -- upvalues: l_default_1 (copy), v106 (copy), v20 (copy), v7 (copy), v130 (copy), v127 (copy), v109 (copy), v133 (copy)
    l_default_1.voiceChangerChanged.Event:Connect(v106);
    v20:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, v130);
    v20:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, v130);
    v20:addObserver(v7.Constants.EVENTS.SET_PARTY_VOICE_PACK, v127);
    l_default_1.voiceChangerHearMyselfChanged.Event:Connect(v109);
    v20:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, v133);
    v20:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, v133);
end;
local function v140(v137) --[[ Line: 549 ]]
    -- upvalues: l_Players_0 (copy), v40 (copy), v62 (copy)
    local v138 = tonumber(v137.userId) or 0;
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v138);
    if l_l_Players_0_PlayerByUserId_0 then
        coroutine.wrap(function() --[[ Line: 553 ]]
            -- upvalues: v40 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v62 (ref)
            if v40:AddPlayerToBlockList(l_l_Players_0_PlayerByUserId_0) then
                v62:info("Participant {} was blocked from party voice", l_l_Players_0_PlayerByUserId_0.DisplayName);
            end;
        end)();
    end;
end;
local function v144(v141) --[[ Line: 562 ]]
    -- upvalues: l_Players_0 (copy), v40 (copy), v62 (copy)
    local v142 = tonumber(v141.userId) or 0;
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v142);
    if l_l_Players_0_PlayerByUserId_1 then
        coroutine.wrap(function() --[[ Line: 566 ]]
            -- upvalues: v40 (ref), l_l_Players_0_PlayerByUserId_1 (copy), v62 (ref)
            if v40:RemovePlayerFromBlockList(l_l_Players_0_PlayerByUserId_1) then
                v62:info("Participant {} was unblocked from party voice", l_l_Players_0_PlayerByUserId_1.DisplayName);
            end;
        end)();
    end;
end;
local function v145() --[[ Line: 575 ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v42 (copy)
    return l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() and v42 and v42:IsCapturingVideo();
end;
local function _(v146, v147) --[[ Line: 583 ]] --[[ Name: isAuthorizedPermission ]]
    -- upvalues: v37 (copy)
    if v146.missingPermissions then
        return not v37.List.find(v146.missingPermissions, v147);
    else
        return false;
    end;
end;
local _ = function(v149) --[[ Line: 590 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v37 (copy)
    local v150 = {
        hasMicPermissions = false
    };
    return v5.new(function(v151, _) --[[ Line: 595 ]]
        -- upvalues: l_default_0 (ref), v149 (copy), v150 (copy), v37 (ref)
        l_default_0:requestPermissions(v149):andThen(function(v153) --[[ Line: 597 ]]
            -- upvalues: v150 (ref), l_default_0 (ref), v37 (ref), v151 (copy)
            local l_v150_0 = v150;
            local l_MICROPHONE_ACCESS_0 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v150_0.hasMicPermissions = if v153.missingPermissions then not v37.List.find(v153.missingPermissions, l_MICROPHONE_ACCESS_0) else false;
            v151(v150);
        end):catch(function() --[[ Line: 602 ]]
            -- upvalues: v151 (copy), v150 (ref)
            v151(v150);
        end);
    end);
end;
local function _() --[[ Line: 608 ]] --[[ Name: initializeParticipantBlockListener ]]
    -- upvalues: v20 (copy), v7 (copy), v140 (copy), v144 (copy)
    v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v140);
    v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v144);
end;
onCoreVoiceManagerInitialized = function() --[[ Line: 619 ]] --[[ Name: onCoreVoiceManagerInitialized ]]
    -- upvalues: l_default_1 (copy), v100 (copy), v120 (copy)
    l_default_1:getService().PlayerMicActivitySignalChange:Connect(v100);
    l_default_1.participantsUpdate.Event:Connect(v120);
end;
local function _() --[[ Line: 629 ]] --[[ Name: unmuteMicrophoneOnce ]]
    -- upvalues: l_default_1 (copy), v56 (copy), v77 (copy)
    l_default_1.muteChanged.Event:Once(function(v158) --[[ Line: 630 ]]
        -- upvalues: v56 (ref), v77 (ref), l_default_1 (ref)
        if v158 ~= nil then
            if v56 then
                v77(function() --[[ Line: 633 ]]
                    -- upvalues: l_default_1 (ref)
                    l_default_1:ToggleMic("BackgroundDM");
                end);
                return;
            else
                l_default_1:ToggleMic("BackgroundDM");
            end;
        end;
    end);
end;
local function v163(v160) --[[ Line: 643 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_1 (copy), v62 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v63 (copy)
    local v161 = l_default_1:getService();
    if not v161 then
        return nil;
    else
        v62:info("Joining default channel");
        local v162 = v161:JoinByGroupIdToken("default", v160);
        if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
            if v162 then
                v63:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v162;
            else
                v63:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v162;
    end;
end;
local function v167() --[[ Line: 665 ]] --[[ Name: validateSetup ]]
    -- upvalues: l_game_EngineFeature_1 (copy), v46 (copy), l_NotificationService_0 (copy), v62 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v47 (copy), v48 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v63 (copy), l_Constants_0 (copy), v20 (copy), v7 (copy)
    if l_game_EngineFeature_1 and v46 then
        if not l_NotificationService_0.IsConnected then
            v62:debug("NotificationService is not yet connected");
            l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
        end;
        v62:debug("NotificationService connected");
    end;
    if not l_VoiceChatService_0.UseNewAudioApi then
        if not l_Players_0.LocalPlayer.Character then
            l_Players_0.LocalPlayer.CharacterAdded:Wait();
            v62:debug("Player character loaded");
        else
            v62:debug("Player character already loaded");
        end;
    end;
    if l_game_EngineFeature_0 and v47 then
        local l_game_Service_0 = game:FindService("VoiceChatService");
        if v48 then
            if not l_game_Service_0 then
                v62:info("VoiceChatService not found. Assuming default values.");
            elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
                v62:debug("Default channel is disabled.");
                if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                    v63:reportVoiceChatJoinResult(false, "defaultDisabled");
                    local l_ERROR_VOICE_SETUP_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_SETUP_0, 
                        detail = "Default channel disabled"
                    });
                end;
                return false;
            end;
        elseif not l_game_Service_0 then
            v62:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice then
            v62:debug("Default channel is disabled.");
            if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                v63:reportVoiceChatJoinResult(false, "defaultDisabled");
                local l_ERROR_VOICE_SETUP_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_SETUP_1, 
                    detail = "Default channel disabled"
                });
            end;
            return false;
        end;
    end;
    return true;
end;
local function v171() --[[ Line: 713 ]] --[[ Name: getPlayerUsersIds ]]
    -- upvalues: l_Players_0 (copy)
    local v168 = {};
    for _, v170 in ipairs(l_Players_0:GetPlayers()) do
        table.insert(v168, v170.UserId);
    end;
    return table.concat(v168, ", ");
end;
local _ = function(v172) --[[ Line: 721 ]] --[[ Name: getPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v37 (copy)
    local v173 = {
        hasMicPermissions = false
    };
    return v5.new(function(v174, _) --[[ Line: 726 ]]
        -- upvalues: l_default_0 (ref), v172 (copy), v173 (copy), v37 (ref), v5 (ref)
        l_default_0:hasPermissions(v172):andThen(function(v176) --[[ Line: 728 ]]
            -- upvalues: v173 (ref), l_default_0 (ref), v37 (ref), v172 (ref), v5 (ref), v174 (copy)
            local l_v173_0 = v173;
            local l_MICROPHONE_ACCESS_1 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v173_0.hasMicPermissions = if v176.missingPermissions then not v37.List.find(v176.missingPermissions, l_MICROPHONE_ACCESS_1) else false;
            if not v173.hasMicPermissions then
                local l_v172_0 = v172;
                l_MICROPHONE_ACCESS_1 = {
                    hasMicPermissions = false
                };
                v5.new(function(v180, _) --[[ Line: 595 ]]
                    -- upvalues: l_default_0 (ref), l_v172_0 (copy), l_MICROPHONE_ACCESS_1 (copy), v37 (ref)
                    l_default_0:requestPermissions(l_v172_0):andThen(function(v182) --[[ Line: 597 ]]
                        -- upvalues: l_MICROPHONE_ACCESS_1 (ref), l_default_0 (ref), v37 (ref), v180 (copy)
                        local l_l_MICROPHONE_ACCESS_1_0 = l_MICROPHONE_ACCESS_1;
                        local l_MICROPHONE_ACCESS_2 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_l_MICROPHONE_ACCESS_1_0.hasMicPermissions = if v182.missingPermissions then not v37.List.find(v182.missingPermissions, l_MICROPHONE_ACCESS_2) else false;
                        v180(l_MICROPHONE_ACCESS_1);
                    end):catch(function() --[[ Line: 602 ]]
                        -- upvalues: v180 (copy), l_MICROPHONE_ACCESS_1 (ref)
                        v180(l_MICROPHONE_ACCESS_1);
                    end);
                end):andThen(v174);
                return;
            else
                v174(v173);
                return;
            end;
        end):catch(function() --[[ Line: 737 ]]
            -- upvalues: v174 (copy), v173 (ref)
            v174(v173);
        end);
    end);
end;
local v186 = false;
local function v219() --[[ Line: 745 ]] --[[ Name: setupListeners ]]
    -- upvalues: v186 (ref), v62 (copy), l_default_1 (copy), v68 (copy), v5 (copy), l_default_0 (copy), v37 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), v20 (copy), v7 (copy), v140 (copy), v144 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v77 (copy), v49 (copy), l_HttpService_0 (copy), v82 (copy), l_Constants_0 (copy), v53 (copy), v171 (copy), v15 (ref), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), v78 (ref)
    if v186 then
        v62:debug("listeners already registered, skipping duplicate setup");
        return;
    else
        v186 = true;
        v62:debug("setting up listeners for the first time");
        l_default_1:subscribe("GetPermissions", function(v187, v188) --[[ Line: 754 ]]
            -- upvalues: v68 (ref), v5 (ref), l_default_0 (ref), v37 (ref)
            if v68 then
                local v189 = {
                    hasMicPermissions = false
                };
                v5.new(function(v190, _) --[[ Line: 726 ]]
                    -- upvalues: l_default_0 (ref), v188 (copy), v189 (copy), v37 (ref), v5 (ref)
                    l_default_0:hasPermissions(v188):andThen(function(v192) --[[ Line: 728 ]]
                        -- upvalues: v189 (ref), l_default_0 (ref), v37 (ref), v188 (ref), v5 (ref), v190 (copy)
                        local l_v189_0 = v189;
                        local l_MICROPHONE_ACCESS_3 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_v189_0.hasMicPermissions = if v192.missingPermissions then not v37.List.find(v192.missingPermissions, l_MICROPHONE_ACCESS_3) else false;
                        if not v189.hasMicPermissions then
                            local l_v188_0 = v188;
                            l_MICROPHONE_ACCESS_3 = {
                                hasMicPermissions = false
                            };
                            v5.new(function(v196, _) --[[ Line: 595 ]]
                                -- upvalues: l_default_0 (ref), l_v188_0 (copy), l_MICROPHONE_ACCESS_3 (copy), v37 (ref)
                                l_default_0:requestPermissions(l_v188_0):andThen(function(v198) --[[ Line: 597 ]]
                                    -- upvalues: l_MICROPHONE_ACCESS_3 (ref), l_default_0 (ref), v37 (ref), v196 (copy)
                                    local l_l_MICROPHONE_ACCESS_3_0 = l_MICROPHONE_ACCESS_3;
                                    local l_MICROPHONE_ACCESS_4 = l_default_0.Permissions.MICROPHONE_ACCESS;
                                    l_l_MICROPHONE_ACCESS_3_0.hasMicPermissions = if v198.missingPermissions then not v37.List.find(v198.missingPermissions, l_MICROPHONE_ACCESS_4) else false;
                                    v196(l_MICROPHONE_ACCESS_3);
                                end):catch(function() --[[ Line: 602 ]]
                                    -- upvalues: v196 (copy), l_MICROPHONE_ACCESS_3 (ref)
                                    v196(l_MICROPHONE_ACCESS_3);
                                end);
                            end):andThen(v190);
                            return;
                        else
                            v190(v189);
                            return;
                        end;
                    end):catch(function() --[[ Line: 737 ]]
                        -- upvalues: v190 (copy), v189 (ref)
                        v190(v189);
                    end);
                end):andThen(v187);
                return;
            else
                v187({
                    hasMicPermissions = true
                });
                return;
            end;
        end);
        handleParticipants();
        handleMicrophone();
        if l_FFlagEnablePartyVoiceChangersInLua_0 then
            handleVoiceChanger();
        end;
        if l_FFlagPartyVoiceBlockSync_0 then
            v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v140);
            v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v144);
        end;
        if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
            v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(v201) --[[ Line: 778 ]]
                -- upvalues: v77 (ref), l_default_1 (ref)
                v77(function() --[[ Line: 779 ]]
                    -- upvalues: l_default_1 (ref), v201 (copy)
                    l_default_1:MuteAll(true, v201.context);
                end);
            end);
            v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(v202) --[[ Line: 783 ]]
                -- upvalues: v77 (ref), l_default_1 (ref)
                v77(function() --[[ Line: 784 ]]
                    -- upvalues: l_default_1 (ref), v202 (copy)
                    l_default_1:MuteAll(false, v202.context);
                end);
            end);
        end;
        if v49 then
            v20:addObserver(v7.Constants.EVENTS.DEBUG_COMMAND, function(v203) --[[ Line: 791 ]]
                -- upvalues: l_HttpService_0 (ref), v82 (ref), l_default_1 (ref)
                if v203.name == "dump_session" then
                    print("----------- CEV BACKGROUND -----------");
                    print("Store State", l_HttpService_0:JSONEncode(v82:getState()));
                    print("--------------------------------------");
                    print("CoreVoiceManager State:");
                    print("Participants", l_HttpService_0:JSONEncode(l_default_1.participants));
                    print("Local Muted", l_HttpService_0:JSONEncode({
                        value = l_default_1.localMuted
                    }));
                    print("Mute All", l_HttpService_0:JSONEncode({
                        value = l_default_1.muteAll
                    }));
                    print("Muted Anyone", l_HttpService_0:JSONEncode({
                        value = l_default_1._mutedAnyone
                    }));
                    print("Is Talking", l_HttpService_0:JSONEncode({
                        value = l_default_1.isTalking
                    }));
                    print("Muted Players", l_HttpService_0:JSONEncode(l_default_1.mutedPlayers));
                    for v204 in l_default_1.audioDevices do
                        if v204.Player then
                            print("Audio Device ", v204.Player.UserId, " Active:", v204.Active, " MutedByLocalPlayer:", v204.MutedByLocalUser);
                        end;
                    end;
                    print("Voice Enabled", l_HttpService_0:JSONEncode({
                        value = l_default_1.voiceEnabled
                    }));
                    print("Permissions Result", l_HttpService_0:JSONEncode(l_default_1.communicationPermissionsResult));
                    print("Voice Join Progress", l_HttpService_0:JSONEncode({
                        value = l_default_1.VoiceJoinProgress
                    }));
                    print("-----------------------------");
                end;
            end);
        end;
        l_default_1:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 823 ]]
            -- upvalues: l_Constants_0 (ref), v20 (ref), v7 (ref)
            local l_ERROR_VOICE_MIC_REJECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED;
            v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MIC_REJECTED_0, 
                detail = nil
            });
        end);
        l_default_1:subscribe("OnPlayerModerated", function() --[[ Line: 827 ]]
            -- upvalues: l_Constants_0 (ref), v20 (ref), v7 (ref)
            local l_ERROR_VOICE_MODERATED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MODERATED;
            v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MODERATED_0, 
                detail = "On Player Moderated"
            });
        end);
        l_default_1:subscribe("OnInitialJoinFailed", function() --[[ Line: 831 ]]
            -- upvalues: l_Constants_0 (ref), v20 (ref), v7 (ref)
            local l_ERROR_VOICE_JOIN_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_0, 
                detail = "Initial Join failed"
            });
        end);
        l_default_1:subscribe("OnRetryRequested", function() --[[ Line: 835 ]]
            -- upvalues: v53 (ref), l_Constants_0 (ref), v20 (ref), v7 (ref)
            if v53 then
                local l_VOICE_RECONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_RECONNECTING;
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_RECONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            else
                local l_VOICE_CONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_CONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            end;
        end);
        l_default_1:subscribe("OnStateChanged", function(_, v211) --[[ Line: 843 ]]
            -- upvalues: l_default_1 (ref), v171 (ref), v20 (ref), v7 (ref), v15 (ref), l_Constants_0 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref), l_getMemStorageKey_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref), v78 (ref)
            if v211 == Enum.VoiceChatState.Joined then
                local l_l_default_1_ChannelId_0 = l_default_1:GetChannelId();
                local l_l_default_1_SessionId_0 = l_default_1:GetSessionId();
                local v214 = v171();
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    userId = v15, 
                    status = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                    voiceChannelId = l_l_default_1_ChannelId_0, 
                    voiceSessionId = l_l_default_1_SessionId_0, 
                    voicePlaySessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                    participants = v214, 
                    numberActive = #l_Players_0:GetPlayers(), 
                    cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0)
                });
                v78.previousGroupId = l_default_1.service:GetGroupId();
                return;
            elseif v211 == Enum.VoiceChatState.Failed then
                local l_ERROR_VOICE_FAILED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_FAILED;
                v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_FAILED_0, 
                    detail = nil
                });
                return;
            else
                if v211 == Enum.VoiceChatState.Ended then
                    local l_ERROR_VOICE_DISCONNECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_DISCONNECTED;
                    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_DISCONNECTED_0, 
                        detail = nil
                    });
                end;
                return;
            end;
        end);
        l_default_1:subscribe("OnReportJoinFailed", function(v217) --[[ Line: 872 ]]
            -- upvalues: v62 (ref), l_Constants_0 (ref), v20 (ref), v7 (ref)
            v62:error("CEV OnReportJoinFailed " .. v217);
            local l_ERROR_VOICE_JOIN_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_1, 
                detail = v217
            });
        end);
        return;
    end;
end;
initializeAFM = function() --[[ Line: 879 ]] --[[ Name: initializeAFM ]]
    -- upvalues: l_game_EngineFeature_2 (copy), v7 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (copy), v71 (ref), v54 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v42 (copy), v145 (copy), l_default_1 (copy), v70 (copy), v78 (ref), v62 (copy), v56 (copy), v77 (copy), v5 (copy)
    if l_game_EngineFeature_2 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 881 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            local l_CONTEXT_ID_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
            local l_FOCUS_PRIORITY_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY;
            l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
            local function v224() --[[ Line: 889 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v71 (ref), v54 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v42 (ref), v145 (ref), l_default_1 (ref), v70 (ref), v78 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v71 then
                    task.cancel(v71);
                    v71 = nil;
                end;
                if v54 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v42 or not v42:IsCapturingVideo()) or not v145 then
                    l_default_1:MuteAll(true, "AudioFocusManagement - CEV deafenAll");
                end;
                if not l_default_1.localMuted and (not v70 or v78.previousMutedState == l_default_1.localMuted) then
                    l_default_1:ToggleMic("AudioFocusManagement - CEV deafenAll");
                end;
            end;
            local function v226() --[[ Line: 910 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v71 (ref), v54 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v42 (ref), v145 (ref), l_default_1 (ref), v62 (ref), v56 (ref), v77 (ref), v70 (ref), v78 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v71 then
                    task.cancel(v71);
                    v71 = nil;
                end;
                if v54 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v42 or not v42:IsCapturingVideo()) or not v145 then
                    l_default_1:MuteAll(false, "AudioFocusManagement - CEV Mute All");
                end;
                if l_default_1.localMuted == nil then
                    v62:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce");
                    l_default_1.muteChanged.Event:Once(function(v225) --[[ Line: 630 ]]
                        -- upvalues: v56 (ref), v77 (ref), l_default_1 (ref)
                        if v225 ~= nil then
                            if v56 then
                                v77(function() --[[ Line: 633 ]]
                                    -- upvalues: l_default_1 (ref)
                                    l_default_1:ToggleMic("BackgroundDM");
                                end);
                                return;
                            else
                                l_default_1:ToggleMic("BackgroundDM");
                            end;
                        end;
                    end);
                    return;
                else
                    if l_default_1.localMuted and (not v70 or v78.previousMutedState ~= l_default_1.localMuted) then
                        v62:info("CEV undeafenAll - Voice connected and muted - unmuting immediately");
                        l_default_1:ToggleMic("AudioFocusManagement - CEV undeafenAll");
                    end;
                    return;
                end;
            end;
            l_result_0.OnDeafenVoiceAudio:Connect(function(v227) --[[ Line: 935 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v71 (ref), v62 (ref), v224 (copy)
                if v227 == l_CONTEXT_ID_0 then
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v71 then
                        task.cancel(v71);
                        v71 = nil;
                    end;
                    v62:info("CEV OnDeafenVoiceAudio fired" .. v227);
                    v224();
                end;
            end);
            l_result_0.OnUndeafenVoiceAudio:Connect(function(v228) --[[ Line: 946 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), v62 (ref), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v71 (ref), v226 (copy)
                if v228 == l_CONTEXT_ID_0 then
                    v62:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", v228, l_CONTEXT_ID_0);
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 then
                        if v71 then
                            task.cancel(v71);
                        end;
                        v71 = task.delay(l_FIntPartyVoiceUndeafenDelayMS_0 / 1000, function() --[[ Line: 957 ]]
                            -- upvalues: v71 (ref), v62 (ref), v228 (copy), v226 (ref)
                            v71 = nil;
                            v62:info("CEV OnUndeafenVoiceAudio fired delayed" .. v228);
                            v226();
                        end);
                        return;
                    else
                        v62:info("CEV OnUndeafenVoiceAudio fired" .. v228);
                        v226();
                    end;
                end;
            end);
            local function _(v229, v230) --[[ Line: 969 ]]
                -- upvalues: v62 (ref), v5 (ref), l_result_0 (copy)
                v62:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", v229, v230);
                return v5.new(function(v231, v232) --[[ Line: 971 ]]
                    -- upvalues: l_result_0 (ref), v229 (copy), v230 (copy), v62 (ref)
                    local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v229, v230);
                    if l_status_1 then
                        v62:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_1);
                        v231(l_result_1);
                        return;
                    else
                        v62:info("CEV requestAudioFocusWithPromise - rejected");
                        v232("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            v62:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
            v5.new(function(v236, v237) --[[ Line: 971 ]]
                -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy), v62 (ref)
                local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                if l_status_2 then
                    v62:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_2);
                    v236(l_result_2);
                    return;
                else
                    v62:info("CEV requestAudioFocusWithPromise - rejected");
                    v237("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v240) --[[ Line: 985 ]]
                -- upvalues: v62 (ref), l_default_1 (ref), v54 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v42 (ref), v145 (ref)
                if v240 then
                    v62:info("CEV audio focus request granted, preparing to undeafen.");
                    l_default_1.muteChanged.Event:Once(function(v241) --[[ Line: 988 ]]
                        -- upvalues: v54 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v42 (ref), v145 (ref), l_default_1 (ref)
                        if v241 ~= nil and v54 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v42 or not v42:IsCapturingVideo()) or not v145 then
                            l_default_1:MuteAll(false, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                else
                    v62:info("CEV audio focus request denied, preparing to deafen.");
                    l_default_1.muteChanged.Event:Once(function(v242) --[[ Line: 998 ]]
                        -- upvalues: v54 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v42 (ref), v145 (ref), l_default_1 (ref)
                        if v242 ~= nil and v54 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v42 or not v42:IsCapturingVideo()) or not v145 then
                            l_default_1:MuteAll(true, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                end;
            end):catch(function() --[[ Line: 1008 ]]
                -- upvalues: v62 (ref)
                v62:info("[CEV] Error requesting focus inside CEV");
            end);
            return;
        else
            v62:info("AudioFocusService did not initialize");
        end;
    end;
end;
initializeVoice = function() --[[ Line: 1017 ]] --[[ Name: initializeVoice ]]
    -- upvalues: l_Constants_0 (copy), v20 (copy), v7 (copy), l_default_1 (copy), v163 (copy), v62 (copy)
    local l_VOICE_CONNECTING_1 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_1, 
        detail = nil
    });
    l_default_1:asyncInit():andThen(function() --[[ Line: 1020 ]]
        -- upvalues: v163 (ref), l_Constants_0 (ref), v20 (ref), v7 (ref)
        if v163(false) == false then
            local l_ERROR_VOICE_JOIN_2 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_2, 
                detail = "Initial Join failed"
            });
        else
            onCoreVoiceManagerInitialized();
        end;
        initializeAFM();
    end):catch(function(v245) --[[ Line: 1029 ]]
        -- upvalues: v62 (ref), l_Constants_0 (ref), v20 (ref), v7 (ref)
        v62:info("CoreVoiceManager did not initialize {}", v245);
        local v246 = "INIT_ERROR_UNKNOWN";
        if v245 then
            v246 = v245.code or v245;
        end;
        local l_ERROR_VOICE_INIT_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_INIT;
        v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_INIT_0, 
            detail = v246
        });
    end);
end;
rejoinVoice = function() --[[ Line: 1043 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_Constants_0 (copy), v20 (copy), v7 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_default_1 (copy), v78 (ref)
    local l_VOICE_CONNECTING_2 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v20:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_2, 
        detail = nil
    });
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        l_default_1:RejoinVoice();
    else
        l_default_1:RejoinChannel(v78.previousGroupId, v78.previousMutedState);
    end;
    v78 = {
        previousGroupId = nil, 
        previousMutedState = nil
    };
end;
startVoice = function() --[[ Line: 1056 ]] --[[ Name: startVoice ]]
    -- upvalues: v167 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v15 (ref), v32 (copy), v62 (copy), v219 (copy)
    if v167() then
        if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
            v15 = v32();
            v62:info("Delayed loading of LocalPlayer loaded with UserId: {}", v15);
        end;
        v219();
        initializeVoice();
    end;
end;
v20:addObserver(v7.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function() --[[ Line: 1068 ]]
    -- upvalues: v82 (copy), l_VOICE_STATUS_0 (copy), v68 (copy)
    local l_voiceStatus_0 = v82:getState().Squad.CrossExperienceVoice.Experience.voiceStatus;
    if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_SETUP then
        startVoice();
        return;
    elseif l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_INIT or v68 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED then
        initializeVoice();
        return;
    else
        if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_JOIN or not v68 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MODERATED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_FAILED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED then
            rejoinVoice();
        end;
        return;
    end;
end);
local v250 = false;
local function _() --[[ Line: 1091 ]] --[[ Name: doStartVoice ]]
    -- upvalues: v250 (ref), v81 (ref), v20 (copy), v7 (copy), v62 (copy)
    if v250 then
        return;
    else
        v250 = true;
        if v81 then
            v20:removeObserver(v81, v7.Constants.EVENTS.FOREGROUND_UI_READY);
            v81 = nil;
        end;
        v62:info("Proceeding to start voice connection.");
        startVoice();
        return;
    end;
end;
v19("startingVoiceFromCEVDefaultChannel");
if l_game_EngineFeature_3 then
    if v80 then
        v62:info("Foreground was ready before setup finished. Starting voice now.");
        if not v250 then
            v250 = true;
            if v81 then
                v20:removeObserver(v81, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                v81 = nil;
            end;
            v62:info("Proceeding to start voice connection.");
            startVoice();
        end;
    else
        v62:info("Waiting for foreground UI readiness signal (with promise race)...");
        local v253 = v5.new(function(v252) --[[ Line: 1116 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0.Event:Once(function() --[[ Line: 1117 ]]
                -- upvalues: v252 (copy)
                v252("signal");
            end);
        end);
        local v254 = v5.delay(v57):andThen(function() --[[ Line: 1123 ]]
            return "timeout";
        end);
        v5.race({
            v253, 
            v254
        }):andThen(function(v255) --[[ Line: 1127 ]]
            -- upvalues: v62 (copy), v19 (copy), v57 (copy), v250 (ref), v81 (ref), v20 (copy), v7 (copy)
            if v255 == "signal" then
                v62:info("Readiness signal received within timeout.");
            else
                v62:info("Timed out waiting for readiness signal. Starting voice anyway.");
                v19("partyVoiceInitTimedOut", {
                    timeout = v57
                });
            end;
            if v250 then
                return;
            else
                v250 = true;
                if v81 then
                    v20:removeObserver(v81, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                    v81 = nil;
                end;
                v62:info("Proceeding to start voice connection.");
                startVoice();
                return;
            end;
        end);
    end;
else
    v62:info("Foreground UI not using readiness sync. Starting voice connection immediately.");
    startVoice();
end;