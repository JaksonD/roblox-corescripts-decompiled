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
local v13 = game:DefineFastFlag("DelayBackgroundDMLocalPlayerLoading", false);
local v14 = game:DefineFastFlag("DelayAudioFocusReplication", false);
local v15 = game:DefineFastInt("PlayerAudioFocusReplicationTimeoutSeconds", 10);
local v16 = nil;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v16 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
end;
local function v20(v17, v18) --[[ Line: 31 ]] --[[ Name: sendAnalyticsEvent ]]
    -- upvalues: l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v16 (ref), l_RbxAnalyticsService_0 (copy)
    local v19 = v18 or {};
    v19.cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
    v19.clientTimeStamp = os.time();
    v19.userId = if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then nil else v16;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "partyVoice", v17, v19);
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v20("partyVoiceCEVChannelFileLoaded");
end;
local v21 = v7.EventManager.new(v7.Constants.EXPERIENCE_TYPE_VOICE, true);
local function _(v22, v23) --[[ Line: 51 ]] --[[ Name: notifyVoiceStatusChange ]]
    -- upvalues: v21 (copy), v7 (copy)
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = v22, 
        detail = v23
    });
end;
local function v33() --[[ Line: 59 ]] --[[ Name: ensureLocalPlayerWithTimeout ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), v12 (copy), v20 (copy), v7 (copy), v21 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        local v28 = v5.new(function(v26) --[[ Line: 63 ]]
            -- upvalues: l_Players_0 (ref)
            if l_Players_0.LocalPlayer then
                v26("loaded");
                return;
            else
                local v27 = nil;
                v27 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 68 ]]
                    -- upvalues: l_Players_0 (ref), v27 (ref), v26 (copy)
                    if l_Players_0.LocalPlayer then
                        v27:Disconnect();
                        v26("loaded");
                    end;
                end);
                return;
            end;
        end);
        local v29 = v5.delay(v12):andThen(function() --[[ Line: 78 ]]
            return "timeout";
        end);
        v5.race({
            v28, 
            v29
        }):andThen(function(v30) --[[ Line: 83 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v20 (ref), v12 (ref), v7 (ref), v21 (ref)
            if v30 == "loaded" then
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v20("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
                    timeoutSeconds = v12
                });
                return;
            else
                v20("backgroundDMLocalPlayerLoadingTimeout", {
                    timeoutSeconds = v12
                });
                local l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0 = v7.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT;
                local v32 = "LocalPlayer loading timed out after " .. v12 .. " seconds";
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0, 
                    detail = v32
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
    v16 = v13 and -1 or v33();
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v20("partyVoiceCEVChannelFileLoaded");
end;
local v34 = nil;
if not v14 then
    v34 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged");
    v20("partyVoicePlayerAudioFocusChangedLoaded");
end;
local v35 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v37 = require(l_CorePackages_0.Packages.Rodux);
local v38 = require(l_CorePackages_0.Packages.Cryo);
local l_default_1 = v35.CoreVoiceManager.default;
local l_createPersistenceMiddleware_0 = v7.Middlewares.createPersistenceMiddleware;
local v41 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v42 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v43 = if v42.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_FFlagPartyVoiceBlockSync_0 = v42.FFlagPartyVoiceBlockSync;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v42.GetFFlagVoiceChatClientRewriteMasterLua;
local v47 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v48 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v49 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v50 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local l_GetFFlagEnableLuaVoiceChatAnalytics_0 = v35.Flags.GetFFlagEnableLuaVoiceChatAnalytics;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local v54 = game:DefineFastFlag("LogPartyVoiceReconnect", false);
local v55 = game:DefineFastFlag("PartyVoiceFixCaptureVideoCheck", false);
local l_FIntPartyVoiceUndeafenDelayMS_0 = v42.FIntPartyVoiceUndeafenDelayMS;
local v57 = game:DefineFastFlag("PartyVoiceExecuteVoiceActionsPostAsyncInit", false);
local v58 = game:DefineFastInt("VoiceJoinTimeoutInSeconds", 15);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("AudioFocusManagement");
local l_game_EngineFeature_3 = game:GetEngineFeature("CevReadinessSync");
local v63 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v64 = v35.Analytics.new();
local l_observeCurrentContextId_0 = v7.Utils.observeCurrentContextId;
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Constants_0 = v7.Constants;
local l_VOICE_STATUS_0 = l_Constants_0.VOICE_STATUS;
local v69 = v42.GetFFlagFixPartyVoiceGetPermissions();
local l_FFlagEnablePartyVoiceChangersInLua_0 = v42.FFlagEnablePartyVoiceChangersInLua;
local v71 = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false);
local v72 = nil;
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    l_default_1:setOptions({
        allowSeamlessVoice = false, 
        passInitErrorInPromiseReject = true, 
        forceVoiceEnabled = true
    });
end;
local v73 = l_createPersistenceMiddleware_0({
    storeKey = v7.Constants.STORAGE_CEV_STORE_KEY
});
v20("partyVoicePersistenceMiddlewareCreated");
local l_default_2 = v7.PartyAudioPlayer.default;
local function v75() --[[ Line: 209 ]]
    -- upvalues: v37 (copy), v7 (copy)
    return v37.combineReducers({
        Squad = v37.combineReducers({
            CrossExperienceVoice = v7.installReducer()
        })
    });
end;
v20("partyVoiceCrossExperienceReducerLoaded");
local function v78(v76) --[[ Line: 220 ]]
    -- upvalues: l_default_1 (copy), v63 (copy)
    l_default_1:asyncInit():andThen(function() --[[ Line: 222 ]]
        -- upvalues: v76 (copy)
        v76();
    end):catch(function(v77) --[[ Line: 225 ]]
        -- upvalues: v63 (ref)
        v63:info("CoreVoiceManager did not initialize {}", v77);
    end);
end;
local v79 = {
    previousGroupId = nil, 
    previousMutedState = false
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local v81 = false;
local v82 = nil;
if l_game_EngineFeature_3 then
    v63:info("Registering early observer for foreground readiness signal.");
    v82 = v21:addObserver(v7.Constants.EVENTS.FOREGROUND_UI_READY, function() --[[ Line: 241 ]]
        -- upvalues: v81 (ref), v63 (copy), l_BindableEvent_0 (copy)
        if not v81 then
            v63:info("Received foreground UI readiness signal.");
            v81 = true;
            l_BindableEvent_0:Fire();
        end;
    end);
end;
local v83 = v37.Store.new(v75(), nil, {
    v37.thunkMiddleware, 
    v73.getMiddleware()
});
v20("partyVoicePersistenceMiddlewareReducerLoaded");
v21:subscribe(v83);
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
v20("partyVoiceGameLoaded");
local l_RCC_CONNECTED_0 = l_Constants_0.VOICE_STATUS.RCC_CONNECTED;
v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
    status = l_RCC_CONNECTED_0, 
    detail = nil
});
v20("partyVoiceRCCConnectedSignalFired");
v21:notify(v7.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
    jobId = if not (game.JobId ~= "") or game.JobId == nil then l_HttpService_0:GenerateGUID(true) else game.JobId, 
    placeId = game.PlaceId, 
    gameId = game.GameId
});
if v14 then
    l_RCC_CONNECTED_0 = nil;
    local v85 = false;
    do
        local l_l_RCC_CONNECTED_0_0, l_v85_0 = l_RCC_CONNECTED_0, v85;
        l_observeCurrentContextId_0(function(v88) --[[ Line: 283 ]]
            -- upvalues: l_l_RCC_CONNECTED_0_0 (ref), l_v85_0 (ref), v34 (ref)
            l_l_RCC_CONNECTED_0_0 = v88;
            print("CurrentContextId changed to", v88, "isReplicationReady:", l_v85_0);
            if l_v85_0 and v34 then
                v34:FireServer(v88);
                print("Fired PlayerAudioFocusChanged with contextId:", v88);
            end;
        end);
        print("Waiting for PlayerAudioFocusChanged to replicate...");
        v34 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged", v15);
        if v34 then
            print("PlayerAudioFocusChanged replicated successfully.");
            v20("partyVoicePlayerAudioFocusChangedLoaded");
            v34.OnClientEvent:Connect(function(v89, v90, v91) --[[ Line: 305 ]]
                -- upvalues: v21 (copy), v7 (copy)
                print("Received PlayerAudioFocusChanged OnClientEvent:", v89, v90);
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
                    userId = v89, 
                    contextId = v90, 
                    contextIds = v91
                });
            end);
            l_v85_0 = true;
            if l_l_RCC_CONNECTED_0_0 then
                v34:FireServer(l_l_RCC_CONNECTED_0_0);
                print("Fired PlayerAudioFocusChanged with latestContextId:", l_l_RCC_CONNECTED_0_0);
            end;
        else
            print("PlayerAudioFocusChanged did not replicate within timeout of ", v15, " seconds.");
            v20("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
                timeoutSeconds = v15
            });
        end;
    end;
else
    l_observeCurrentContextId_0(function(v92) --[[ Line: 331 ]]
        -- upvalues: v34 (ref)
        v34:FireServer(v92);
    end);
    v34.OnClientEvent:Connect(function(v93, v94, v95) --[[ Line: 335 ]]
        -- upvalues: v21 (copy), v7 (copy)
        v21:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
            userId = v93, 
            contextId = v94, 
            contextIds = v95
        });
    end);
end;
l_RCC_CONNECTED_0 = function(v96) --[[ Line: 344 ]]
    -- upvalues: v21 (copy), v7 (copy), v16 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
        userId = v96.UserId, 
        isLocalUser = v96.UserId == v16, 
        username = v96.Name, 
        displayname = v96.DisplayName, 
        isVoiceChangerActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        isVoiceChangerHearMyselfActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        selectedVoicePack = l_FFlagEnablePartyVoiceChangersInLua_0 and "None" or nil
    });
end;
local function v98(v97) --[[ Line: 362 ]]
    -- upvalues: v21 (copy), v7 (copy), v16 (ref), l_default_2 (copy)
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, {
        userId = v97.UserId, 
        isLocalUser = v97.UserId == v16
    });
    l_default_2:playSound("leave");
end;
local function v101(v99) --[[ Line: 370 ]]
    -- upvalues: v7 (copy), v21 (copy), v16 (ref)
    local v100 = if v99.isActive then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
    v21:notify(v100, {
        userId = v16, 
        isLocalUser = true
    });
end;
local function v104(v102) --[[ Line: 380 ]]
    -- upvalues: v71 (copy), v79 (ref), v7 (copy), v57 (copy), v78 (copy), v21 (copy), v16 (ref)
    if not v71 then
        v79.previousMutedState = v102;
    end;
    local v103 = if v102 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
    if v57 then
        v78(function() --[[ Line: 389 ]]
            -- upvalues: v21 (ref), v103 (copy), v16 (ref)
            v21:notify(v103, {
                userId = v16, 
                isLocalUser = true
            });
        end);
        return;
    else
        v21:notify(v103, {
            userId = v16, 
            isLocalUser = true
        });
        return;
    end;
end;
local function v107(v105) --[[ Line: 403 ]] --[[ Name: onLocalVoiceChangerChanged ]]
    -- upvalues: v7 (copy), v21 (copy), v16 (ref)
    local v106 = if v105 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED;
    v21:notify(v106, {
        userId = v16, 
        isLocalUser = true
    });
end;
local function v110(v108) --[[ Line: 414 ]] --[[ Name: onLocalVoiceChangerHearMyselfChanged ]]
    -- upvalues: v7 (copy), v21 (copy), v16 (ref)
    local v109 = if v108 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED;
    v21:notify(v109, {
        userId = v16, 
        isLocalUser = true
    });
end;
local function v121(v111) --[[ Line: 425 ]]
    -- upvalues: l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v7 (copy), v16 (ref), v21 (copy)
    for v112, v113 in pairs(v111) do
        local l_isSignalActive_0 = v113.isSignalActive;
        local l_isMuted_0 = v113.isMuted;
        local v116 = if l_FFlagEnablePartyVoiceChangersInLua_0 then v113.isVoiceChangerActive else nil;
        local v117 = if l_isSignalActive_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
        local v118 = if l_isMuted_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
        local v119 = if l_FFlagEnablePartyVoiceChangersInLua_0 then if v116 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil;
        local v120 = {
            userId = v112, 
            isLocalUser = v112 == v16
        };
        v21:notify(v118, v120);
        v21:notify(v117, v120);
        if l_FFlagEnablePartyVoiceChangersInLua_0 then
            v21:notify(v119, v120);
        end;
    end;
end;
local function v125(v122) --[[ Line: 458 ]]
    -- upvalues: v16 (ref), v57 (copy), v78 (copy), v71 (copy), v79 (ref), l_default_1 (copy)
    local v123 = tonumber(v122.userId);
    local v124 = v16 == v123;
    if v57 then
        v78(function() --[[ Line: 463 ]]
            -- upvalues: v124 (copy), v71 (ref), v79 (ref), l_default_1 (ref), v123 (copy)
            if v124 then
                if v71 then
                    v79.previousMutedState = not l_default_1.localMuted;
                end;
                l_default_1:ToggleMic("Squads");
                return;
            else
                l_default_1:ToggleMutePlayer(v123);
                return;
            end;
        end);
        return;
    elseif v124 then
        l_default_1:ToggleMic("Squads");
        return;
    else
        l_default_1:ToggleMutePlayer(v123);
        return;
    end;
end;
local function v128(v126) --[[ Line: 482 ]] --[[ Name: setVoicePack ]]
    -- upvalues: l_default_1 (copy), v21 (copy), v7 (copy), v16 (ref)
    local l_voicePackName_0 = v126.voicePackName;
    l_default_1:SetVoicePack(l_voicePackName_0);
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
        userId = v16, 
        isLocalUser = true, 
        voicePackName = l_voicePackName_0
    });
end;
local function v131(v129) --[[ Line: 492 ]] --[[ Name: toggleVoiceChanger ]]
    -- upvalues: v16 (ref), l_default_1 (copy)
    local v130 = tonumber(v129.userId);
    if v16 == v130 then
        l_default_1:ToggleVoiceChanger("Squads");
        return;
    else
        l_default_1:ToggleVoiceChanger(v130);
        return;
    end;
end;
local function v134(v132) --[[ Line: 503 ]] --[[ Name: toggleVoiceChangerHearMyself ]]
    -- upvalues: v16 (ref), l_default_1 (copy)
    local v133 = tonumber(v132.userId);
    if v16 == v133 then
        l_default_1:ToggleVoiceChangerHearMyself("Squads");
        return;
    else
        l_default_1:ToggleVoiceChangerHearMyself(v133);
        return;
    end;
end;
handleParticipants = function() --[[ Line: 514 ]] --[[ Name: handleParticipants ]]
    -- upvalues: l_Players_0 (copy), l_RCC_CONNECTED_0 (copy), l_default_2 (copy), v98 (copy), v16 (ref)
    l_Players_0.PlayerAdded:Connect(function(v135) --[[ Line: 515 ]]
        -- upvalues: l_RCC_CONNECTED_0 (ref), l_default_2 (ref)
        l_RCC_CONNECTED_0(v135);
        l_default_2:playSound("join");
    end);
    l_Players_0.PlayerRemoving:Connect(v98);
    for _, v137 in pairs(l_Players_0:GetPlayers()) do
        if v137:IsA("Player") then
            l_RCC_CONNECTED_0(v137);
            if v137.UserId == v16 then
                l_default_2:playSound("join");
            end;
        end;
    end;
end;
handleMicrophone = function() --[[ Line: 531 ]] --[[ Name: handleMicrophone ]]
    -- upvalues: l_default_1 (copy), v104 (copy), v21 (copy), v7 (copy), v125 (copy)
    l_default_1.muteChanged.Event:Connect(v104);
    v21:addObserver(v7.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, v125);
    v21:addObserver(v7.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, v125);
end;
handleVoiceChanger = function() --[[ Line: 537 ]] --[[ Name: handleVoiceChanger ]]
    -- upvalues: l_default_1 (copy), v107 (copy), v21 (copy), v7 (copy), v131 (copy), v128 (copy), v110 (copy), v134 (copy)
    l_default_1.voiceChangerChanged.Event:Connect(v107);
    v21:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, v131);
    v21:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, v131);
    v21:addObserver(v7.Constants.EVENTS.SET_PARTY_VOICE_PACK, v128);
    l_default_1.voiceChangerHearMyselfChanged.Event:Connect(v110);
    v21:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, v134);
    v21:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, v134);
end;
local function v141(v138) --[[ Line: 553 ]]
    -- upvalues: l_Players_0 (copy), v41 (copy), v63 (copy)
    local v139 = tonumber(v138.userId) or 0;
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v139);
    if l_l_Players_0_PlayerByUserId_0 then
        coroutine.wrap(function() --[[ Line: 557 ]]
            -- upvalues: v41 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v63 (ref)
            if v41:AddPlayerToBlockList(l_l_Players_0_PlayerByUserId_0) then
                v63:info("Participant {} was blocked from party voice", l_l_Players_0_PlayerByUserId_0.DisplayName);
            end;
        end)();
    end;
end;
local function v145(v142) --[[ Line: 566 ]]
    -- upvalues: l_Players_0 (copy), v41 (copy), v63 (copy)
    local v143 = tonumber(v142.userId) or 0;
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v143);
    if l_l_Players_0_PlayerByUserId_1 then
        coroutine.wrap(function() --[[ Line: 570 ]]
            -- upvalues: v41 (ref), l_l_Players_0_PlayerByUserId_1 (copy), v63 (ref)
            if v41:RemovePlayerFromBlockList(l_l_Players_0_PlayerByUserId_1) then
                v63:info("Participant {} was unblocked from party voice", l_l_Players_0_PlayerByUserId_1.DisplayName);
            end;
        end)();
    end;
end;
local function v146() --[[ Line: 579 ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v43 (copy)
    return l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() and v43 and v43:IsCapturingVideo();
end;
local function _(v147, v148) --[[ Line: 587 ]] --[[ Name: isAuthorizedPermission ]]
    -- upvalues: v38 (copy)
    if v147.missingPermissions then
        return not v38.List.find(v147.missingPermissions, v148);
    else
        return false;
    end;
end;
local _ = function(v150) --[[ Line: 594 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v38 (copy)
    local v151 = {
        hasMicPermissions = false
    };
    return v5.new(function(v152, _) --[[ Line: 599 ]]
        -- upvalues: l_default_0 (ref), v150 (copy), v151 (copy), v38 (ref)
        l_default_0:requestPermissions(v150):andThen(function(v154) --[[ Line: 601 ]]
            -- upvalues: v151 (ref), l_default_0 (ref), v38 (ref), v152 (copy)
            local l_v151_0 = v151;
            local l_MICROPHONE_ACCESS_0 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v151_0.hasMicPermissions = if v154.missingPermissions then not v38.List.find(v154.missingPermissions, l_MICROPHONE_ACCESS_0) else false;
            v152(v151);
        end):catch(function() --[[ Line: 606 ]]
            -- upvalues: v152 (copy), v151 (ref)
            v152(v151);
        end);
    end);
end;
local function _() --[[ Line: 612 ]] --[[ Name: initializeParticipantBlockListener ]]
    -- upvalues: v21 (copy), v7 (copy), v141 (copy), v145 (copy)
    v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v141);
    v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v145);
end;
onCoreVoiceManagerInitialized = function() --[[ Line: 623 ]] --[[ Name: onCoreVoiceManagerInitialized ]]
    -- upvalues: l_default_1 (copy), v101 (copy), v121 (copy)
    l_default_1:getService().PlayerMicActivitySignalChange:Connect(v101);
    l_default_1.participantsUpdate.Event:Connect(v121);
end;
local function _() --[[ Line: 633 ]] --[[ Name: unmuteMicrophoneOnce ]]
    -- upvalues: l_default_1 (copy), v57 (copy), v78 (copy)
    l_default_1.muteChanged.Event:Once(function(v159) --[[ Line: 634 ]]
        -- upvalues: v57 (ref), v78 (ref), l_default_1 (ref)
        if v159 ~= nil then
            if v57 then
                v78(function() --[[ Line: 637 ]]
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
local function v164(v161) --[[ Line: 647 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_1 (copy), v63 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v64 (copy)
    local v162 = l_default_1:getService();
    if not v162 then
        return nil;
    else
        v63:info("Joining default channel");
        local v163 = v162:JoinByGroupIdToken("default", v161);
        if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
            if v163 then
                v64:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v163;
            else
                v64:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v163;
    end;
end;
local function v168() --[[ Line: 669 ]] --[[ Name: validateSetup ]]
    -- upvalues: l_game_EngineFeature_1 (copy), v47 (copy), l_NotificationService_0 (copy), v63 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v48 (copy), v49 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v64 (copy), l_Constants_0 (copy), v21 (copy), v7 (copy)
    if l_game_EngineFeature_1 and v47 then
        if not l_NotificationService_0.IsConnected then
            v63:debug("NotificationService is not yet connected");
            l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
        end;
        v63:debug("NotificationService connected");
    end;
    if not l_VoiceChatService_0.UseNewAudioApi then
        if not l_Players_0.LocalPlayer.Character then
            l_Players_0.LocalPlayer.CharacterAdded:Wait();
            v63:debug("Player character loaded");
        else
            v63:debug("Player character already loaded");
        end;
    end;
    if l_game_EngineFeature_0 and v48 then
        local l_game_Service_0 = game:FindService("VoiceChatService");
        if v49 then
            if not l_game_Service_0 then
                v63:info("VoiceChatService not found. Assuming default values.");
            elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
                v63:debug("Default channel is disabled.");
                if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                    v64:reportVoiceChatJoinResult(false, "defaultDisabled");
                    local l_ERROR_VOICE_SETUP_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_SETUP_0, 
                        detail = "Default channel disabled"
                    });
                end;
                return false;
            end;
        elseif not l_game_Service_0 then
            v63:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice then
            v63:debug("Default channel is disabled.");
            if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                v64:reportVoiceChatJoinResult(false, "defaultDisabled");
                local l_ERROR_VOICE_SETUP_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_SETUP_1, 
                    detail = "Default channel disabled"
                });
            end;
            return false;
        end;
    end;
    return true;
end;
local function v172() --[[ Line: 717 ]] --[[ Name: getPlayerUsersIds ]]
    -- upvalues: l_Players_0 (copy)
    local v169 = {};
    for _, v171 in ipairs(l_Players_0:GetPlayers()) do
        table.insert(v169, v171.UserId);
    end;
    return table.concat(v169, ", ");
end;
local _ = function(v173) --[[ Line: 725 ]] --[[ Name: getPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v38 (copy)
    local v174 = {
        hasMicPermissions = false
    };
    return v5.new(function(v175, _) --[[ Line: 730 ]]
        -- upvalues: l_default_0 (ref), v173 (copy), v174 (copy), v38 (ref), v5 (ref)
        l_default_0:hasPermissions(v173):andThen(function(v177) --[[ Line: 732 ]]
            -- upvalues: v174 (ref), l_default_0 (ref), v38 (ref), v173 (ref), v5 (ref), v175 (copy)
            local l_v174_0 = v174;
            local l_MICROPHONE_ACCESS_1 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v174_0.hasMicPermissions = if v177.missingPermissions then not v38.List.find(v177.missingPermissions, l_MICROPHONE_ACCESS_1) else false;
            if not v174.hasMicPermissions then
                local l_v173_0 = v173;
                l_MICROPHONE_ACCESS_1 = {
                    hasMicPermissions = false
                };
                v5.new(function(v181, _) --[[ Line: 599 ]]
                    -- upvalues: l_default_0 (ref), l_v173_0 (copy), l_MICROPHONE_ACCESS_1 (copy), v38 (ref)
                    l_default_0:requestPermissions(l_v173_0):andThen(function(v183) --[[ Line: 601 ]]
                        -- upvalues: l_MICROPHONE_ACCESS_1 (ref), l_default_0 (ref), v38 (ref), v181 (copy)
                        local l_l_MICROPHONE_ACCESS_1_0 = l_MICROPHONE_ACCESS_1;
                        local l_MICROPHONE_ACCESS_2 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_l_MICROPHONE_ACCESS_1_0.hasMicPermissions = if v183.missingPermissions then not v38.List.find(v183.missingPermissions, l_MICROPHONE_ACCESS_2) else false;
                        v181(l_MICROPHONE_ACCESS_1);
                    end):catch(function() --[[ Line: 606 ]]
                        -- upvalues: v181 (copy), l_MICROPHONE_ACCESS_1 (ref)
                        v181(l_MICROPHONE_ACCESS_1);
                    end);
                end):andThen(v175);
                return;
            else
                v175(v174);
                return;
            end;
        end):catch(function() --[[ Line: 741 ]]
            -- upvalues: v175 (copy), v174 (ref)
            v175(v174);
        end);
    end);
end;
local v187 = false;
local function v220() --[[ Line: 749 ]] --[[ Name: setupListeners ]]
    -- upvalues: v187 (ref), v63 (copy), l_default_1 (copy), v69 (copy), v5 (copy), l_default_0 (copy), v38 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), v21 (copy), v7 (copy), v141 (copy), v145 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v78 (copy), v50 (copy), l_HttpService_0 (copy), v83 (copy), l_Constants_0 (copy), v54 (copy), v172 (copy), v16 (ref), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), v79 (ref)
    if v187 then
        v63:debug("listeners already registered, skipping duplicate setup");
        return;
    else
        v187 = true;
        v63:debug("setting up listeners for the first time");
        l_default_1:subscribe("GetPermissions", function(v188, v189) --[[ Line: 758 ]]
            -- upvalues: v69 (ref), v5 (ref), l_default_0 (ref), v38 (ref)
            if v69 then
                local v190 = {
                    hasMicPermissions = false
                };
                v5.new(function(v191, _) --[[ Line: 730 ]]
                    -- upvalues: l_default_0 (ref), v189 (copy), v190 (copy), v38 (ref), v5 (ref)
                    l_default_0:hasPermissions(v189):andThen(function(v193) --[[ Line: 732 ]]
                        -- upvalues: v190 (ref), l_default_0 (ref), v38 (ref), v189 (ref), v5 (ref), v191 (copy)
                        local l_v190_0 = v190;
                        local l_MICROPHONE_ACCESS_3 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_v190_0.hasMicPermissions = if v193.missingPermissions then not v38.List.find(v193.missingPermissions, l_MICROPHONE_ACCESS_3) else false;
                        if not v190.hasMicPermissions then
                            local l_v189_0 = v189;
                            l_MICROPHONE_ACCESS_3 = {
                                hasMicPermissions = false
                            };
                            v5.new(function(v197, _) --[[ Line: 599 ]]
                                -- upvalues: l_default_0 (ref), l_v189_0 (copy), l_MICROPHONE_ACCESS_3 (copy), v38 (ref)
                                l_default_0:requestPermissions(l_v189_0):andThen(function(v199) --[[ Line: 601 ]]
                                    -- upvalues: l_MICROPHONE_ACCESS_3 (ref), l_default_0 (ref), v38 (ref), v197 (copy)
                                    local l_l_MICROPHONE_ACCESS_3_0 = l_MICROPHONE_ACCESS_3;
                                    local l_MICROPHONE_ACCESS_4 = l_default_0.Permissions.MICROPHONE_ACCESS;
                                    l_l_MICROPHONE_ACCESS_3_0.hasMicPermissions = if v199.missingPermissions then not v38.List.find(v199.missingPermissions, l_MICROPHONE_ACCESS_4) else false;
                                    v197(l_MICROPHONE_ACCESS_3);
                                end):catch(function() --[[ Line: 606 ]]
                                    -- upvalues: v197 (copy), l_MICROPHONE_ACCESS_3 (ref)
                                    v197(l_MICROPHONE_ACCESS_3);
                                end);
                            end):andThen(v191);
                            return;
                        else
                            v191(v190);
                            return;
                        end;
                    end):catch(function() --[[ Line: 741 ]]
                        -- upvalues: v191 (copy), v190 (ref)
                        v191(v190);
                    end);
                end):andThen(v188);
                return;
            else
                v188({
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
            v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v141);
            v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v145);
        end;
        if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
            v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(v202) --[[ Line: 782 ]]
                -- upvalues: v78 (ref), l_default_1 (ref)
                v78(function() --[[ Line: 783 ]]
                    -- upvalues: l_default_1 (ref), v202 (copy)
                    l_default_1:MuteAll(true, v202.context);
                end);
            end);
            v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(v203) --[[ Line: 787 ]]
                -- upvalues: v78 (ref), l_default_1 (ref)
                v78(function() --[[ Line: 788 ]]
                    -- upvalues: l_default_1 (ref), v203 (copy)
                    l_default_1:MuteAll(false, v203.context);
                end);
            end);
        end;
        if v50 then
            v21:addObserver(v7.Constants.EVENTS.DEBUG_COMMAND, function(v204) --[[ Line: 795 ]]
                -- upvalues: l_HttpService_0 (ref), v83 (ref), l_default_1 (ref)
                if v204.name == "dump_session" then
                    print("----------- CEV BACKGROUND -----------");
                    print("Store State", l_HttpService_0:JSONEncode(v83:getState()));
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
                    for v205 in l_default_1.audioDevices do
                        if v205.Player then
                            print("Audio Device ", v205.Player.UserId, " Active:", v205.Active, " MutedByLocalPlayer:", v205.MutedByLocalUser);
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
        l_default_1:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 827 ]]
            -- upvalues: l_Constants_0 (ref), v21 (ref), v7 (ref)
            local l_ERROR_VOICE_MIC_REJECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED;
            v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MIC_REJECTED_0, 
                detail = nil
            });
        end);
        l_default_1:subscribe("OnPlayerModerated", function() --[[ Line: 831 ]]
            -- upvalues: l_Constants_0 (ref), v21 (ref), v7 (ref)
            local l_ERROR_VOICE_MODERATED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MODERATED;
            v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MODERATED_0, 
                detail = "On Player Moderated"
            });
        end);
        l_default_1:subscribe("OnInitialJoinFailed", function() --[[ Line: 835 ]]
            -- upvalues: l_Constants_0 (ref), v21 (ref), v7 (ref)
            local l_ERROR_VOICE_JOIN_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_0, 
                detail = "Initial Join failed"
            });
        end);
        l_default_1:subscribe("OnRetryRequested", function() --[[ Line: 839 ]]
            -- upvalues: v54 (ref), l_Constants_0 (ref), v21 (ref), v7 (ref)
            if v54 then
                local l_VOICE_RECONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_RECONNECTING;
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_RECONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            else
                local l_VOICE_CONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_CONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            end;
        end);
        l_default_1:subscribe("OnStateChanged", function(_, v212) --[[ Line: 847 ]]
            -- upvalues: l_default_1 (ref), v172 (ref), v21 (ref), v7 (ref), v16 (ref), l_Constants_0 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref), l_getMemStorageKey_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref), v79 (ref)
            if v212 == Enum.VoiceChatState.Joined then
                local l_l_default_1_ChannelId_0 = l_default_1:GetChannelId();
                local l_l_default_1_SessionId_0 = l_default_1:GetSessionId();
                local v215 = v172();
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    userId = v16, 
                    status = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                    voiceChannelId = l_l_default_1_ChannelId_0, 
                    voiceSessionId = l_l_default_1_SessionId_0, 
                    voicePlaySessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                    participants = v215, 
                    numberActive = #l_Players_0:GetPlayers(), 
                    cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0)
                });
                v79.previousGroupId = l_default_1.service:GetGroupId();
                return;
            elseif v212 == Enum.VoiceChatState.Failed then
                local l_ERROR_VOICE_FAILED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_FAILED;
                v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_FAILED_0, 
                    detail = nil
                });
                return;
            else
                if v212 == Enum.VoiceChatState.Ended then
                    local l_ERROR_VOICE_DISCONNECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_DISCONNECTED;
                    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_DISCONNECTED_0, 
                        detail = nil
                    });
                end;
                return;
            end;
        end);
        l_default_1:subscribe("OnReportJoinFailed", function(v218) --[[ Line: 876 ]]
            -- upvalues: v63 (ref), l_Constants_0 (ref), v21 (ref), v7 (ref)
            v63:error("CEV OnReportJoinFailed " .. v218);
            local l_ERROR_VOICE_JOIN_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_1, 
                detail = v218
            });
        end);
        return;
    end;
end;
initializeAFM = function() --[[ Line: 883 ]] --[[ Name: initializeAFM ]]
    -- upvalues: l_game_EngineFeature_2 (copy), v7 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (copy), v72 (ref), v55 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v43 (copy), v146 (copy), l_default_1 (copy), v71 (copy), v79 (ref), v63 (copy), v57 (copy), v78 (copy), v5 (copy)
    if l_game_EngineFeature_2 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 885 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            local l_CONTEXT_ID_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
            local l_FOCUS_PRIORITY_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY;
            l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
            local function v225() --[[ Line: 893 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v72 (ref), v55 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v43 (ref), v146 (ref), l_default_1 (ref), v71 (ref), v79 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v72 then
                    task.cancel(v72);
                    v72 = nil;
                end;
                if v55 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v43 or not v43:IsCapturingVideo()) or not v146 then
                    l_default_1:MuteAll(true, "AudioFocusManagement - CEV deafenAll");
                end;
                if not l_default_1.localMuted and (not v71 or v79.previousMutedState == l_default_1.localMuted) then
                    l_default_1:ToggleMic("AudioFocusManagement - CEV deafenAll");
                end;
            end;
            local function v227() --[[ Line: 908 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v72 (ref), v55 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v43 (ref), v146 (ref), l_default_1 (ref), v63 (ref), v57 (ref), v78 (ref), v71 (ref), v79 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v72 then
                    task.cancel(v72);
                    v72 = nil;
                end;
                if v55 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v43 or not v43:IsCapturingVideo()) or not v146 then
                    l_default_1:MuteAll(false, "AudioFocusManagement - CEV Mute All");
                end;
                if l_default_1.localMuted == nil then
                    v63:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce");
                    l_default_1.muteChanged.Event:Once(function(v226) --[[ Line: 634 ]]
                        -- upvalues: v57 (ref), v78 (ref), l_default_1 (ref)
                        if v226 ~= nil then
                            if v57 then
                                v78(function() --[[ Line: 637 ]]
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
                    if l_default_1.localMuted and (not v71 or v79.previousMutedState ~= l_default_1.localMuted) then
                        v63:info("CEV undeafenAll - Voice connected and muted - unmuting immediately");
                        l_default_1:ToggleMic("AudioFocusManagement - CEV undeafenAll");
                    end;
                    return;
                end;
            end;
            l_result_0.OnDeafenVoiceAudio:Connect(function(v228) --[[ Line: 927 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v72 (ref), v63 (ref), v225 (copy)
                if v228 == l_CONTEXT_ID_0 then
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v72 then
                        task.cancel(v72);
                        v72 = nil;
                    end;
                    v63:info("CEV OnDeafenVoiceAudio fired" .. v228);
                    v225();
                end;
            end);
            l_result_0.OnUndeafenVoiceAudio:Connect(function(v229) --[[ Line: 938 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), v63 (ref), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v72 (ref), v227 (copy)
                if v229 == l_CONTEXT_ID_0 then
                    v63:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", v229, l_CONTEXT_ID_0);
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 then
                        if v72 then
                            task.cancel(v72);
                        end;
                        v72 = task.delay(l_FIntPartyVoiceUndeafenDelayMS_0 / 1000, function() --[[ Line: 949 ]]
                            -- upvalues: v72 (ref), v63 (ref), v229 (copy), v227 (ref)
                            v72 = nil;
                            v63:info("CEV OnUndeafenVoiceAudio fired delayed" .. v229);
                            v227();
                        end);
                        return;
                    else
                        v63:info("CEV OnUndeafenVoiceAudio fired" .. v229);
                        v227();
                    end;
                end;
            end);
            local function _(v230, v231) --[[ Line: 961 ]]
                -- upvalues: v63 (ref), v5 (ref), l_result_0 (copy)
                v63:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", v230, v231);
                return v5.new(function(v232, v233) --[[ Line: 963 ]]
                    -- upvalues: l_result_0 (ref), v230 (copy), v231 (copy), v63 (ref)
                    local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v230, v231);
                    if l_status_1 then
                        v63:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_1);
                        v232(l_result_1);
                        return;
                    else
                        v63:info("CEV requestAudioFocusWithPromise - rejected");
                        v233("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            v63:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
            v5.new(function(v237, v238) --[[ Line: 963 ]]
                -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy), v63 (ref)
                local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                if l_status_2 then
                    v63:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_2);
                    v237(l_result_2);
                    return;
                else
                    v63:info("CEV requestAudioFocusWithPromise - rejected");
                    v238("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v241) --[[ Line: 977 ]]
                -- upvalues: v63 (ref), l_default_1 (ref), v55 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v43 (ref), v146 (ref)
                if v241 then
                    v63:info("CEV audio focus request granted, preparing to undeafen.");
                    l_default_1.muteChanged.Event:Once(function(v242) --[[ Line: 980 ]]
                        -- upvalues: v55 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v43 (ref), v146 (ref), l_default_1 (ref)
                        if v242 ~= nil and v55 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v43 or not v43:IsCapturingVideo()) or not v146 then
                            l_default_1:MuteAll(false, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                else
                    v63:info("CEV audio focus request denied, preparing to deafen.");
                    l_default_1.muteChanged.Event:Once(function(v243) --[[ Line: 990 ]]
                        -- upvalues: v55 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v43 (ref), v146 (ref), l_default_1 (ref)
                        if v243 ~= nil and v55 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v43 or not v43:IsCapturingVideo()) or not v146 then
                            l_default_1:MuteAll(true, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                end;
            end):catch(function() --[[ Line: 1000 ]]
                -- upvalues: v63 (ref)
                v63:info("[CEV] Error requesting focus inside CEV");
            end);
            return;
        else
            v63:info("AudioFocusService did not initialize");
        end;
    end;
end;
initializeVoice = function() --[[ Line: 1009 ]] --[[ Name: initializeVoice ]]
    -- upvalues: l_Constants_0 (copy), v21 (copy), v7 (copy), l_default_1 (copy), v164 (copy), v63 (copy)
    local l_VOICE_CONNECTING_1 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_1, 
        detail = nil
    });
    l_default_1:asyncInit():andThen(function() --[[ Line: 1012 ]]
        -- upvalues: v164 (ref), l_Constants_0 (ref), v21 (ref), v7 (ref)
        if v164(false) == false then
            local l_ERROR_VOICE_JOIN_2 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_2, 
                detail = "Initial Join failed"
            });
        else
            onCoreVoiceManagerInitialized();
        end;
        initializeAFM();
    end):catch(function(v246) --[[ Line: 1021 ]]
        -- upvalues: v63 (ref), l_Constants_0 (ref), v21 (ref), v7 (ref)
        v63:info("CoreVoiceManager did not initialize {}", v246);
        local v247 = "INIT_ERROR_UNKNOWN";
        if v246 then
            v247 = v246.code or v246;
        end;
        local l_ERROR_VOICE_INIT_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_INIT;
        v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_INIT_0, 
            detail = v247
        });
    end);
end;
rejoinVoice = function() --[[ Line: 1035 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_Constants_0 (copy), v21 (copy), v7 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_default_1 (copy), v79 (ref)
    local l_VOICE_CONNECTING_2 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v21:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_2, 
        detail = nil
    });
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        l_default_1:RejoinVoice();
    else
        l_default_1:RejoinChannel(v79.previousGroupId, v79.previousMutedState);
    end;
    v79 = {
        previousGroupId = nil, 
        previousMutedState = nil
    };
end;
startVoice = function() --[[ Line: 1048 ]] --[[ Name: startVoice ]]
    -- upvalues: v168 (copy), v13 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v16 (ref), v33 (copy), v63 (copy), v220 (copy)
    if v168() then
        if v13 and l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
            v16 = v33();
            v63:info("Delayed loading of LocalPlayer loaded with UserId: {}", v16);
        end;
        v220();
        initializeVoice();
    end;
end;
v21:addObserver(v7.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function() --[[ Line: 1062 ]]
    -- upvalues: v83 (copy), l_VOICE_STATUS_0 (copy), v69 (copy)
    local l_voiceStatus_0 = v83:getState().Squad.CrossExperienceVoice.Experience.voiceStatus;
    if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_SETUP then
        startVoice();
        return;
    elseif l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_INIT or v69 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED then
        initializeVoice();
        return;
    else
        if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_JOIN or not v69 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MODERATED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_FAILED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED then
            rejoinVoice();
        end;
        return;
    end;
end);
local v251 = false;
local function _() --[[ Line: 1085 ]] --[[ Name: doStartVoice ]]
    -- upvalues: v251 (ref), v82 (ref), v21 (copy), v7 (copy), v63 (copy)
    if v251 then
        return;
    else
        v251 = true;
        if v82 then
            v21:removeObserver(v82, v7.Constants.EVENTS.FOREGROUND_UI_READY);
            v82 = nil;
        end;
        v63:info("Proceeding to start voice connection.");
        startVoice();
        return;
    end;
end;
v20("startingVoiceFromCEVDefaultChannel");
if l_game_EngineFeature_3 then
    if v81 then
        v63:info("Foreground was ready before setup finished. Starting voice now.");
        if not v251 then
            v251 = true;
            if v82 then
                v21:removeObserver(v82, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                v82 = nil;
            end;
            v63:info("Proceeding to start voice connection.");
            startVoice();
        end;
    else
        v63:info("Waiting for foreground UI readiness signal (with promise race)...");
        local v254 = v5.new(function(v253) --[[ Line: 1110 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0.Event:Once(function() --[[ Line: 1111 ]]
                -- upvalues: v253 (copy)
                v253("signal");
            end);
        end);
        local v255 = v5.delay(v58):andThen(function() --[[ Line: 1117 ]]
            return "timeout";
        end);
        v5.race({
            v254, 
            v255
        }):andThen(function(v256) --[[ Line: 1121 ]]
            -- upvalues: v63 (copy), v20 (copy), v58 (copy), v251 (ref), v82 (ref), v21 (copy), v7 (copy)
            if v256 == "signal" then
                v63:info("Readiness signal received within timeout.");
            else
                v63:info("Timed out waiting for readiness signal. Starting voice anyway.");
                v20("partyVoiceInitTimedOut", {
                    timeout = v58
                });
            end;
            if v251 then
                return;
            else
                v251 = true;
                if v82 then
                    v21:removeObserver(v82, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                    v82 = nil;
                end;
                v63:info("Proceeding to start voice connection.");
                startVoice();
                return;
            end;
        end);
    end;
else
    v63:info("Foreground UI not using readiness sync. Starting voice connection immediately.");
    startVoice();
end;