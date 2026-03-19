local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_GetFFlagPartyVoiceMuteScopeFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPartyVoiceMuteScopeFix;
local l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringTimeoutLoadingLocalPlayerInBackgroundDM;
local l_getMemStorageKey_0 = v7.Utils.getMemStorageKey;
local l_CEV_JOIN_ATTEMPT_ID_KEY_0 = v7.Constants.CEV_JOIN_ATTEMPT_ID_KEY;
local l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 = v7.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM;
local v13 = game:DefineFastInt("BackgroundDMLocalPlayerLoadingTimeoutSeconds", 12);
local v14 = game:DefineFastFlag("DelayBackgroundDMLocalPlayerLoading", false);
local v15 = game:DefineFastFlag("DelayAudioFocusReplication", false);
local v16 = game:DefineFastInt("PlayerAudioFocusReplicationTimeoutSeconds", 10);
local v17 = nil;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v17 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
end;
local function v21(v18, v19) --[[ Line: 33 ]] --[[ Name: sendAnalyticsEvent ]]
    -- upvalues: l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v17 (ref), l_RbxAnalyticsService_0 (copy)
    local v20 = v19 or {};
    v20.cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0);
    v20.clientTimeStamp = os.time();
    v20.userId = if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then nil else v17;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "partyVoice", v18, v20);
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v21("partyVoiceCEVChannelFileLoaded");
end;
local v22 = v7.EventManager.new(v7.Constants.EXPERIENCE_TYPE_VOICE, true);
local function _(v23, v24) --[[ Line: 53 ]] --[[ Name: notifyVoiceStatusChange ]]
    -- upvalues: v22 (copy), v7 (copy)
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = v23, 
        detail = v24
    });
end;
local function v34() --[[ Line: 61 ]] --[[ Name: ensureLocalPlayerWithTimeout ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), v13 (copy), v21 (copy), v7 (copy), v22 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        local v29 = v5.new(function(v27) --[[ Line: 65 ]]
            -- upvalues: l_Players_0 (ref)
            if l_Players_0.LocalPlayer then
                v27("loaded");
                return;
            else
                local v28 = nil;
                v28 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 70 ]]
                    -- upvalues: l_Players_0 (ref), v28 (ref), v27 (copy)
                    if l_Players_0.LocalPlayer then
                        v28:Disconnect();
                        v27("loaded");
                    end;
                end);
                return;
            end;
        end);
        local v30 = v5.delay(v13):andThen(function() --[[ Line: 80 ]]
            return "timeout";
        end);
        v5.race({
            v29, 
            v30
        }):andThen(function(v31) --[[ Line: 85 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (ref), v21 (ref), v13 (ref), v7 (ref), v22 (ref)
            if v31 == "loaded" then
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v21("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
                    timeoutSeconds = v13
                });
                return;
            else
                v21("backgroundDMLocalPlayerLoadingTimeout", {
                    timeoutSeconds = v13
                });
                local l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0 = v7.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT;
                local v33 = "LocalPlayer loading timed out after " .. v13 .. " seconds";
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT_0, 
                    detail = v33
                });
                l_LocalPlayer_0 = nil;
                return;
            end;
        end):await();
    end;
    if not l_LocalPlayer_0 then
        v5.new(function() --[[ Line: 112 ]]

        end):await();
    end;
    return l_LocalPlayer_0.UserId;
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v17 = v14 and -1 or v34();
end;
if l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 == l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
    v21("partyVoiceCEVChannelFileLoaded");
end;
local v35 = nil;
if not v15 then
    v35 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged");
    v21("partyVoicePlayerAudioFocusChangedLoaded");
end;
local v36 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v38 = require(l_CorePackages_0.Packages.Rodux);
local v39 = require(l_CorePackages_0.Packages.Cryo);
local l_default_1 = v36.CoreVoiceManager.default;
local l_createPersistenceMiddleware_0 = v7.Middlewares.createPersistenceMiddleware;
local v42 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v43 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v44 = if v43.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_FFlagPartyVoiceBlockSync_0 = v43.FFlagPartyVoiceBlockSync;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v43.GetFFlagVoiceChatClientRewriteMasterLua;
local v48 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v49 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v50 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v51 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local l_GetFFlagEnableLuaVoiceChatAnalytics_0 = v36.Flags.GetFFlagEnableLuaVoiceChatAnalytics;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local v55 = game:DefineFastFlag("LogPartyVoiceReconnect", false);
local v56 = game:DefineFastFlag("PartyVoiceFixCaptureVideoCheck", false);
local l_FIntPartyVoiceUndeafenDelayMS_0 = v43.FIntPartyVoiceUndeafenDelayMS;
local v58 = game:DefineFastFlag("PartyVoiceExecuteVoiceActionsPostAsyncInit", false);
local v59 = game:DefineFastInt("VoiceJoinTimeoutInSeconds", 15);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("AudioFocusManagement");
local l_game_EngineFeature_3 = game:GetEngineFeature("CevReadinessSync");
local v64 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v65 = v36.Analytics.new();
local l_observeCurrentContextId_0 = v7.Utils.observeCurrentContextId;
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Constants_0 = v7.Constants;
local l_VOICE_STATUS_0 = l_Constants_0.VOICE_STATUS;
local v70 = v43.GetFFlagFixPartyVoiceGetPermissions();
local l_FFlagEnablePartyVoiceChangersInLua_0 = v43.FFlagEnablePartyVoiceChangersInLua;
local v72 = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false);
local v73 = nil;
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    l_default_1:setOptions({
        allowSeamlessVoice = false, 
        passInitErrorInPromiseReject = true, 
        forceVoiceEnabled = true
    });
end;
local v74 = l_createPersistenceMiddleware_0({
    storeKey = v7.Constants.STORAGE_CEV_STORE_KEY
});
v21("partyVoicePersistenceMiddlewareCreated");
local l_default_2 = v7.PartyAudioPlayer.default;
local function v76() --[[ Line: 211 ]]
    -- upvalues: v38 (copy), v7 (copy)
    return v38.combineReducers({
        Squad = v38.combineReducers({
            CrossExperienceVoice = v7.installReducer()
        })
    });
end;
v21("partyVoiceCrossExperienceReducerLoaded");
local function v79(v77) --[[ Line: 222 ]]
    -- upvalues: l_default_1 (copy), v64 (copy)
    l_default_1:asyncInit():andThen(function() --[[ Line: 224 ]]
        -- upvalues: v77 (copy)
        v77();
    end):catch(function(v78) --[[ Line: 227 ]]
        -- upvalues: v64 (ref)
        v64:info("CoreVoiceManager did not initialize {}", v78);
    end);
end;
local v80 = {
    previousGroupId = nil, 
    previousMutedState = false
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local v82 = false;
local v83 = nil;
if l_game_EngineFeature_3 then
    v64:info("Registering early observer for foreground readiness signal.");
    v83 = v22:addObserver(v7.Constants.EVENTS.FOREGROUND_UI_READY, function() --[[ Line: 243 ]]
        -- upvalues: v82 (ref), v64 (copy), l_BindableEvent_0 (copy)
        if not v82 then
            v64:info("Received foreground UI readiness signal.");
            v82 = true;
            l_BindableEvent_0:Fire();
        end;
    end);
end;
local v84 = v38.Store.new(v76(), nil, {
    v38.thunkMiddleware, 
    v74.getMiddleware()
});
v21("partyVoicePersistenceMiddlewareReducerLoaded");
v22:subscribe(v84);
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
v21("partyVoiceGameLoaded");
local l_RCC_CONNECTED_0 = l_Constants_0.VOICE_STATUS.RCC_CONNECTED;
v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
    status = l_RCC_CONNECTED_0, 
    detail = nil
});
v21("partyVoiceRCCConnectedSignalFired");
v22:notify(v7.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
    jobId = if not (game.JobId ~= "") or game.JobId == nil then l_HttpService_0:GenerateGUID(true) else game.JobId, 
    placeId = game.PlaceId, 
    gameId = game.GameId
});
if v15 then
    l_RCC_CONNECTED_0 = nil;
    local v86 = false;
    do
        local l_l_RCC_CONNECTED_0_0, l_v86_0 = l_RCC_CONNECTED_0, v86;
        l_observeCurrentContextId_0(function(v89) --[[ Line: 285 ]]
            -- upvalues: l_l_RCC_CONNECTED_0_0 (ref), l_v86_0 (ref), v35 (ref)
            l_l_RCC_CONNECTED_0_0 = v89;
            print("CurrentContextId changed to", v89, "isReplicationReady:", l_v86_0);
            if l_v86_0 and v35 then
                v35:FireServer(v89);
                print("Fired PlayerAudioFocusChanged with contextId:", v89);
            end;
        end);
        print("Waiting for PlayerAudioFocusChanged to replicate...");
        v35 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged", v16);
        if v35 then
            print("PlayerAudioFocusChanged replicated successfully.");
            v21("partyVoicePlayerAudioFocusChangedLoaded");
            v35.OnClientEvent:Connect(function(v90, v91, v92) --[[ Line: 307 ]]
                -- upvalues: v22 (copy), v7 (copy)
                print("Received PlayerAudioFocusChanged OnClientEvent:", v90, v91);
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
                    userId = v90, 
                    contextId = v91, 
                    contextIds = v92
                });
            end);
            l_v86_0 = true;
            if l_l_RCC_CONNECTED_0_0 then
                v35:FireServer(l_l_RCC_CONNECTED_0_0);
                print("Fired PlayerAudioFocusChanged with latestContextId:", l_l_RCC_CONNECTED_0_0);
            end;
        else
            print("PlayerAudioFocusChanged did not replicate within timeout of ", v16, " seconds.");
            v21("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
                timeoutSeconds = v16
            });
        end;
    end;
else
    l_observeCurrentContextId_0(function(v93) --[[ Line: 333 ]]
        -- upvalues: v35 (ref)
        v35:FireServer(v93);
    end);
    v35.OnClientEvent:Connect(function(v94, v95, v96) --[[ Line: 337 ]]
        -- upvalues: v22 (copy), v7 (copy)
        v22:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
            userId = v94, 
            contextId = v95, 
            contextIds = v96
        });
    end);
end;
l_RCC_CONNECTED_0 = function(v97) --[[ Line: 346 ]]
    -- upvalues: v22 (copy), v7 (copy), v17 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
        userId = v97.UserId, 
        isLocalUser = v97.UserId == v17, 
        username = v97.Name, 
        displayname = v97.DisplayName, 
        isVoiceChangerActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        isVoiceChangerHearMyselfActive = not l_FFlagEnablePartyVoiceChangersInLua_0 and nil, 
        selectedVoicePack = l_FFlagEnablePartyVoiceChangersInLua_0 and "None" or nil
    });
end;
local function v99(v98) --[[ Line: 364 ]]
    -- upvalues: v22 (copy), v7 (copy), v17 (ref), l_default_2 (copy)
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, {
        userId = v98.UserId, 
        isLocalUser = v98.UserId == v17
    });
    l_default_2:playSound("leave");
end;
local function v102(v100) --[[ Line: 372 ]]
    -- upvalues: v7 (copy), v22 (copy), v17 (ref)
    local v101 = if v100.isActive then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
    v22:notify(v101, {
        userId = v17, 
        isLocalUser = true
    });
end;
local function v105(v103) --[[ Line: 382 ]]
    -- upvalues: v72 (copy), v80 (ref), v7 (copy), v58 (copy), v79 (copy), v22 (copy), v17 (ref)
    if not v72 then
        v80.previousMutedState = v103;
    end;
    local v104 = if v103 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
    if v58 then
        v79(function() --[[ Line: 391 ]]
            -- upvalues: v22 (ref), v104 (copy), v17 (ref)
            v22:notify(v104, {
                userId = v17, 
                isLocalUser = true
            });
        end);
        return;
    else
        v22:notify(v104, {
            userId = v17, 
            isLocalUser = true
        });
        return;
    end;
end;
local function v108(v106) --[[ Line: 405 ]] --[[ Name: onLocalVoiceChangerChanged ]]
    -- upvalues: v7 (copy), v22 (copy), v17 (ref)
    local v107 = if v106 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED;
    v22:notify(v107, {
        userId = v17, 
        isLocalUser = true
    });
end;
local function v111(v109) --[[ Line: 416 ]] --[[ Name: onLocalVoiceChangerHearMyselfChanged ]]
    -- upvalues: v7 (copy), v22 (copy), v17 (ref)
    local v110 = if v109 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED;
    v22:notify(v110, {
        userId = v17, 
        isLocalUser = true
    });
end;
local function v122(v112) --[[ Line: 427 ]]
    -- upvalues: l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v7 (copy), v17 (ref), v22 (copy)
    for v113, v114 in pairs(v112) do
        local l_isSignalActive_0 = v114.isSignalActive;
        local l_isMuted_0 = v114.isMuted;
        local v117 = if l_FFlagEnablePartyVoiceChangersInLua_0 then v114.isVoiceChangerActive else nil;
        local v118 = if l_isSignalActive_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
        local v119 = if l_isMuted_0 then v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v7.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
        local v120 = if l_FFlagEnablePartyVoiceChangersInLua_0 then if v117 then v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else v7.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil;
        local v121 = {
            userId = v113, 
            isLocalUser = v113 == v17
        };
        v22:notify(v119, v121);
        v22:notify(v118, v121);
        if l_FFlagEnablePartyVoiceChangersInLua_0 then
            v22:notify(v120, v121);
        end;
    end;
end;
local function v126(v123) --[[ Line: 460 ]]
    -- upvalues: v17 (ref), v58 (copy), v79 (copy), v72 (copy), v80 (ref), l_default_1 (copy)
    local v124 = tonumber(v123.userId);
    local v125 = v17 == v124;
    if v58 then
        v79(function() --[[ Line: 465 ]]
            -- upvalues: v125 (copy), v72 (ref), v80 (ref), l_default_1 (ref), v124 (copy)
            if v125 then
                if v72 then
                    v80.previousMutedState = not l_default_1.localMuted;
                end;
                l_default_1:ToggleMic("Squads");
                return;
            else
                l_default_1:ToggleMutePlayer(v124);
                return;
            end;
        end);
        return;
    elseif v125 then
        l_default_1:ToggleMic("Squads");
        return;
    else
        l_default_1:ToggleMutePlayer(v124);
        return;
    end;
end;
local function v129(v127) --[[ Line: 484 ]] --[[ Name: setVoicePack ]]
    -- upvalues: l_default_1 (copy), v22 (copy), v7 (copy), v17 (ref)
    local l_voicePackName_0 = v127.voicePackName;
    l_default_1:SetVoicePack(l_voicePackName_0);
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
        userId = v17, 
        isLocalUser = true, 
        voicePackName = l_voicePackName_0
    });
end;
local function v132(v130) --[[ Line: 494 ]] --[[ Name: toggleVoiceChanger ]]
    -- upvalues: v17 (ref), l_default_1 (copy)
    local v131 = tonumber(v130.userId);
    if v17 == v131 then
        l_default_1:ToggleVoiceChanger("Squads");
        return;
    else
        l_default_1:ToggleVoiceChanger(v131);
        return;
    end;
end;
local function v135(v133) --[[ Line: 505 ]] --[[ Name: toggleVoiceChangerHearMyself ]]
    -- upvalues: v17 (ref), l_default_1 (copy)
    local v134 = tonumber(v133.userId);
    if v17 == v134 then
        l_default_1:ToggleVoiceChangerHearMyself("Squads");
        return;
    else
        l_default_1:ToggleVoiceChangerHearMyself(v134);
        return;
    end;
end;
handleParticipants = function() --[[ Line: 516 ]] --[[ Name: handleParticipants ]]
    -- upvalues: l_Players_0 (copy), l_RCC_CONNECTED_0 (copy), l_default_2 (copy), v99 (copy), v17 (ref)
    l_Players_0.PlayerAdded:Connect(function(v136) --[[ Line: 517 ]]
        -- upvalues: l_RCC_CONNECTED_0 (ref), l_default_2 (ref)
        l_RCC_CONNECTED_0(v136);
        l_default_2:playSound("join");
    end);
    l_Players_0.PlayerRemoving:Connect(v99);
    for _, v138 in pairs(l_Players_0:GetPlayers()) do
        if v138:IsA("Player") then
            l_RCC_CONNECTED_0(v138);
            if v138.UserId == v17 then
                l_default_2:playSound("join");
            end;
        end;
    end;
end;
handleMicrophone = function() --[[ Line: 533 ]] --[[ Name: handleMicrophone ]]
    -- upvalues: l_default_1 (copy), v105 (copy), v22 (copy), v7 (copy), v126 (copy)
    l_default_1.muteChanged.Event:Connect(v105);
    v22:addObserver(v7.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, v126);
    v22:addObserver(v7.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, v126);
end;
handleVoiceChanger = function() --[[ Line: 539 ]] --[[ Name: handleVoiceChanger ]]
    -- upvalues: l_default_1 (copy), v108 (copy), v22 (copy), v7 (copy), v132 (copy), v129 (copy), v111 (copy), v135 (copy)
    l_default_1.voiceChangerChanged.Event:Connect(v108);
    v22:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, v132);
    v22:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, v132);
    v22:addObserver(v7.Constants.EVENTS.SET_PARTY_VOICE_PACK, v129);
    l_default_1.voiceChangerHearMyselfChanged.Event:Connect(v111);
    v22:addObserver(v7.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, v135);
    v22:addObserver(v7.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, v135);
end;
local function v142(v139) --[[ Line: 555 ]]
    -- upvalues: l_Players_0 (copy), v42 (copy), v64 (copy)
    local v140 = tonumber(v139.userId) or 0;
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v140);
    if l_l_Players_0_PlayerByUserId_0 then
        coroutine.wrap(function() --[[ Line: 559 ]]
            -- upvalues: v42 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v64 (ref)
            if v42:AddPlayerToBlockList(l_l_Players_0_PlayerByUserId_0) then
                v64:info("Participant {} was blocked from party voice", l_l_Players_0_PlayerByUserId_0.DisplayName);
            end;
        end)();
    end;
end;
local function v146(v143) --[[ Line: 568 ]]
    -- upvalues: l_Players_0 (copy), v42 (copy), v64 (copy)
    local v144 = tonumber(v143.userId) or 0;
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v144);
    if l_l_Players_0_PlayerByUserId_1 then
        coroutine.wrap(function() --[[ Line: 572 ]]
            -- upvalues: v42 (ref), l_l_Players_0_PlayerByUserId_1 (copy), v64 (ref)
            if v42:RemovePlayerFromBlockList(l_l_Players_0_PlayerByUserId_1) then
                v64:info("Participant {} was unblocked from party voice", l_l_Players_0_PlayerByUserId_1.DisplayName);
            end;
        end)();
    end;
end;
local function v147() --[[ Line: 581 ]]
    -- upvalues: l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v44 (copy)
    return l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() and v44 and v44:IsCapturingVideo();
end;
local function _(v148, v149) --[[ Line: 589 ]] --[[ Name: isAuthorizedPermission ]]
    -- upvalues: v39 (copy)
    if v148.missingPermissions then
        return not v39.List.find(v148.missingPermissions, v149);
    else
        return false;
    end;
end;
local _ = function(v151) --[[ Line: 596 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v39 (copy)
    local v152 = {
        hasMicPermissions = false
    };
    return v5.new(function(v153, _) --[[ Line: 601 ]]
        -- upvalues: l_default_0 (ref), v151 (copy), v152 (copy), v39 (ref)
        l_default_0:requestPermissions(v151):andThen(function(v155) --[[ Line: 603 ]]
            -- upvalues: v152 (ref), l_default_0 (ref), v39 (ref), v153 (copy)
            local l_v152_0 = v152;
            local l_MICROPHONE_ACCESS_0 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v152_0.hasMicPermissions = if v155.missingPermissions then not v39.List.find(v155.missingPermissions, l_MICROPHONE_ACCESS_0) else false;
            v153(v152);
        end):catch(function() --[[ Line: 608 ]]
            -- upvalues: v153 (copy), v152 (ref)
            v153(v152);
        end);
    end);
end;
local function _() --[[ Line: 614 ]] --[[ Name: initializeParticipantBlockListener ]]
    -- upvalues: v22 (copy), v7 (copy), v142 (copy), v146 (copy)
    v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v142);
    v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v146);
end;
onCoreVoiceManagerInitialized = function() --[[ Line: 625 ]] --[[ Name: onCoreVoiceManagerInitialized ]]
    -- upvalues: l_default_1 (copy), v102 (copy), v122 (copy)
    l_default_1:getService().PlayerMicActivitySignalChange:Connect(v102);
    l_default_1.participantsUpdate.Event:Connect(v122);
end;
local function _() --[[ Line: 635 ]] --[[ Name: unmuteMicrophoneOnce ]]
    -- upvalues: l_default_1 (copy), v58 (copy), v79 (copy)
    l_default_1.muteChanged.Event:Once(function(v160) --[[ Line: 636 ]]
        -- upvalues: v58 (ref), v79 (ref), l_default_1 (ref)
        if v160 ~= nil then
            if v58 then
                v79(function() --[[ Line: 639 ]]
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
local function v165(v162) --[[ Line: 649 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_1 (copy), v64 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v65 (copy)
    local v163 = l_default_1:getService();
    if not v163 then
        return nil;
    else
        v64:info("Joining default channel");
        local v164 = v163:JoinByGroupIdToken("default", v162);
        if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
            if v164 then
                v65:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v164;
            else
                v65:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v164;
    end;
end;
local function v169() --[[ Line: 671 ]] --[[ Name: validateSetup ]]
    -- upvalues: l_game_EngineFeature_1 (copy), v48 (copy), l_NotificationService_0 (copy), v64 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v49 (copy), v50 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v65 (copy), l_Constants_0 (copy), v22 (copy), v7 (copy)
    if l_game_EngineFeature_1 and v48 then
        if not l_NotificationService_0.IsConnected then
            v64:debug("NotificationService is not yet connected");
            l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
        end;
        v64:debug("NotificationService connected");
    end;
    if not l_VoiceChatService_0.UseNewAudioApi then
        if not l_Players_0.LocalPlayer.Character then
            l_Players_0.LocalPlayer.CharacterAdded:Wait();
            v64:debug("Player character loaded");
        else
            v64:debug("Player character already loaded");
        end;
    end;
    if l_game_EngineFeature_0 and v49 then
        local l_game_Service_0 = game:FindService("VoiceChatService");
        if v50 then
            if not l_game_Service_0 then
                v64:info("VoiceChatService not found. Assuming default values.");
            elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
                v64:debug("Default channel is disabled.");
                if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                    v65:reportVoiceChatJoinResult(false, "defaultDisabled");
                    local l_ERROR_VOICE_SETUP_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_SETUP_0, 
                        detail = "Default channel disabled"
                    });
                end;
                return false;
            end;
        elseif not l_game_Service_0 then
            v64:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice then
            v64:debug("Default channel is disabled.");
            if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                v65:reportVoiceChatJoinResult(false, "defaultDisabled");
                local l_ERROR_VOICE_SETUP_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_SETUP_1, 
                    detail = "Default channel disabled"
                });
            end;
            return false;
        end;
    end;
    return true;
end;
local function v173() --[[ Line: 719 ]] --[[ Name: getPlayerUsersIds ]]
    -- upvalues: l_Players_0 (copy)
    local v170 = {};
    for _, v172 in ipairs(l_Players_0:GetPlayers()) do
        table.insert(v170, v172.UserId);
    end;
    return table.concat(v170, ", ");
end;
local _ = function(v174) --[[ Line: 727 ]] --[[ Name: getPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v39 (copy)
    local v175 = {
        hasMicPermissions = false
    };
    return v5.new(function(v176, _) --[[ Line: 732 ]]
        -- upvalues: l_default_0 (ref), v174 (copy), v175 (copy), v39 (ref), v5 (ref)
        l_default_0:hasPermissions(v174):andThen(function(v178) --[[ Line: 734 ]]
            -- upvalues: v175 (ref), l_default_0 (ref), v39 (ref), v174 (ref), v5 (ref), v176 (copy)
            local l_v175_0 = v175;
            local l_MICROPHONE_ACCESS_1 = l_default_0.Permissions.MICROPHONE_ACCESS;
            l_v175_0.hasMicPermissions = if v178.missingPermissions then not v39.List.find(v178.missingPermissions, l_MICROPHONE_ACCESS_1) else false;
            if not v175.hasMicPermissions then
                local l_v174_0 = v174;
                l_MICROPHONE_ACCESS_1 = {
                    hasMicPermissions = false
                };
                v5.new(function(v182, _) --[[ Line: 601 ]]
                    -- upvalues: l_default_0 (ref), l_v174_0 (copy), l_MICROPHONE_ACCESS_1 (copy), v39 (ref)
                    l_default_0:requestPermissions(l_v174_0):andThen(function(v184) --[[ Line: 603 ]]
                        -- upvalues: l_MICROPHONE_ACCESS_1 (ref), l_default_0 (ref), v39 (ref), v182 (copy)
                        local l_l_MICROPHONE_ACCESS_1_0 = l_MICROPHONE_ACCESS_1;
                        local l_MICROPHONE_ACCESS_2 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_l_MICROPHONE_ACCESS_1_0.hasMicPermissions = if v184.missingPermissions then not v39.List.find(v184.missingPermissions, l_MICROPHONE_ACCESS_2) else false;
                        v182(l_MICROPHONE_ACCESS_1);
                    end):catch(function() --[[ Line: 608 ]]
                        -- upvalues: v182 (copy), l_MICROPHONE_ACCESS_1 (ref)
                        v182(l_MICROPHONE_ACCESS_1);
                    end);
                end):andThen(v176);
                return;
            else
                v176(v175);
                return;
            end;
        end):catch(function() --[[ Line: 743 ]]
            -- upvalues: v176 (copy), v175 (ref)
            v176(v175);
        end);
    end);
end;
local v188 = false;
local function v222() --[[ Line: 751 ]] --[[ Name: setupListeners ]]
    -- upvalues: v188 (ref), v64 (copy), l_default_1 (copy), v70 (copy), v5 (copy), l_default_0 (copy), v39 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), v22 (copy), v7 (copy), v142 (copy), v146 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v79 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v58 (copy), v51 (copy), l_HttpService_0 (copy), v84 (copy), l_Constants_0 (copy), v55 (copy), v173 (copy), v17 (ref), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_getMemStorageKey_0 (copy), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (copy), v80 (ref)
    if v188 then
        v64:debug("listeners already registered, skipping duplicate setup");
        return;
    else
        v188 = true;
        v64:debug("setting up listeners for the first time");
        l_default_1:subscribe("GetPermissions", function(v189, v190) --[[ Line: 760 ]]
            -- upvalues: v70 (ref), v5 (ref), l_default_0 (ref), v39 (ref)
            if v70 then
                local v191 = {
                    hasMicPermissions = false
                };
                v5.new(function(v192, _) --[[ Line: 732 ]]
                    -- upvalues: l_default_0 (ref), v190 (copy), v191 (copy), v39 (ref), v5 (ref)
                    l_default_0:hasPermissions(v190):andThen(function(v194) --[[ Line: 734 ]]
                        -- upvalues: v191 (ref), l_default_0 (ref), v39 (ref), v190 (ref), v5 (ref), v192 (copy)
                        local l_v191_0 = v191;
                        local l_MICROPHONE_ACCESS_3 = l_default_0.Permissions.MICROPHONE_ACCESS;
                        l_v191_0.hasMicPermissions = if v194.missingPermissions then not v39.List.find(v194.missingPermissions, l_MICROPHONE_ACCESS_3) else false;
                        if not v191.hasMicPermissions then
                            local l_v190_0 = v190;
                            l_MICROPHONE_ACCESS_3 = {
                                hasMicPermissions = false
                            };
                            v5.new(function(v198, _) --[[ Line: 601 ]]
                                -- upvalues: l_default_0 (ref), l_v190_0 (copy), l_MICROPHONE_ACCESS_3 (copy), v39 (ref)
                                l_default_0:requestPermissions(l_v190_0):andThen(function(v200) --[[ Line: 603 ]]
                                    -- upvalues: l_MICROPHONE_ACCESS_3 (ref), l_default_0 (ref), v39 (ref), v198 (copy)
                                    local l_l_MICROPHONE_ACCESS_3_0 = l_MICROPHONE_ACCESS_3;
                                    local l_MICROPHONE_ACCESS_4 = l_default_0.Permissions.MICROPHONE_ACCESS;
                                    l_l_MICROPHONE_ACCESS_3_0.hasMicPermissions = if v200.missingPermissions then not v39.List.find(v200.missingPermissions, l_MICROPHONE_ACCESS_4) else false;
                                    v198(l_MICROPHONE_ACCESS_3);
                                end):catch(function() --[[ Line: 608 ]]
                                    -- upvalues: v198 (copy), l_MICROPHONE_ACCESS_3 (ref)
                                    v198(l_MICROPHONE_ACCESS_3);
                                end);
                            end):andThen(v192);
                            return;
                        else
                            v192(v191);
                            return;
                        end;
                    end):catch(function() --[[ Line: 743 ]]
                        -- upvalues: v192 (copy), v191 (ref)
                        v192(v191);
                    end);
                end):andThen(v189);
                return;
            else
                v189({
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
            v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v142);
            v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v146);
        end;
        if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
            v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(v203) --[[ Line: 784 ]]
                -- upvalues: v79 (ref), l_default_1 (ref)
                v79(function() --[[ Line: 785 ]]
                    -- upvalues: l_default_1 (ref), v203 (copy)
                    l_default_1:MuteAll(true, v203.context);
                end);
            end);
            v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(v204) --[[ Line: 789 ]]
                -- upvalues: v79 (ref), l_default_1 (ref)
                v79(function() --[[ Line: 790 ]]
                    -- upvalues: l_default_1 (ref), v204 (copy)
                    l_default_1:MuteAll(false, v204.context);
                end);
            end);
        end;
        if not l_GetFFlagPartyVoiceMuteScopeFix_0() then
            l_default_1.muteChanged.Event:Once(function(v205) --[[ Line: 636 ]]
                -- upvalues: v58 (ref), v79 (ref), l_default_1 (ref)
                if v205 ~= nil then
                    if v58 then
                        v79(function() --[[ Line: 639 ]]
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
        if v51 then
            v22:addObserver(v7.Constants.EVENTS.DEBUG_COMMAND, function(v206) --[[ Line: 803 ]]
                -- upvalues: l_HttpService_0 (ref), v84 (ref), l_default_1 (ref)
                if v206.name == "dump_session" then
                    print("----------- CEV BACKGROUND -----------");
                    print("Store State", l_HttpService_0:JSONEncode(v84:getState()));
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
                    for v207 in l_default_1.audioDevices do
                        if v207.Player then
                            print("Audio Device ", v207.Player.UserId, " Active:", v207.Active, " MutedByLocalPlayer:", v207.MutedByLocalUser);
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
        l_default_1:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 835 ]]
            -- upvalues: l_Constants_0 (ref), v22 (ref), v7 (ref)
            local l_ERROR_VOICE_MIC_REJECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED;
            v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MIC_REJECTED_0, 
                detail = nil
            });
        end);
        l_default_1:subscribe("OnPlayerModerated", function() --[[ Line: 839 ]]
            -- upvalues: l_Constants_0 (ref), v22 (ref), v7 (ref)
            local l_ERROR_VOICE_MODERATED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MODERATED;
            v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_MODERATED_0, 
                detail = "On Player Moderated"
            });
        end);
        l_default_1:subscribe("OnInitialJoinFailed", function() --[[ Line: 843 ]]
            -- upvalues: l_Constants_0 (ref), v22 (ref), v7 (ref)
            local l_ERROR_VOICE_JOIN_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_0, 
                detail = "Initial Join failed"
            });
        end);
        l_default_1:subscribe("OnRetryRequested", function() --[[ Line: 847 ]]
            -- upvalues: v55 (ref), l_Constants_0 (ref), v22 (ref), v7 (ref)
            if v55 then
                local l_VOICE_RECONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_RECONNECTING;
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_RECONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            else
                local l_VOICE_CONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_VOICE_CONNECTING_0, 
                    detail = "Retry requested"
                });
                return;
            end;
        end);
        l_default_1:subscribe("OnStateChanged", function(_, v214) --[[ Line: 855 ]]
            -- upvalues: l_default_1 (ref), v173 (ref), v22 (ref), v7 (ref), v17 (ref), l_Constants_0 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref), l_getMemStorageKey_0 (ref), l_CEV_JOIN_ATTEMPT_ID_KEY_0 (ref), v80 (ref)
            if v214 == Enum.VoiceChatState.Joined then
                local l_l_default_1_ChannelId_0 = l_default_1:GetChannelId();
                local l_l_default_1_SessionId_0 = l_default_1:GetSessionId();
                local v217 = v173();
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    userId = v17, 
                    status = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                    voiceChannelId = l_l_default_1_ChannelId_0, 
                    voiceSessionId = l_l_default_1_SessionId_0, 
                    voicePlaySessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                    participants = v217, 
                    numberActive = #l_Players_0:GetPlayers(), 
                    cevJoinAttemptId = l_getMemStorageKey_0(l_CEV_JOIN_ATTEMPT_ID_KEY_0)
                });
                v80.previousGroupId = l_default_1.service:GetGroupId();
                return;
            elseif v214 == Enum.VoiceChatState.Failed then
                local l_ERROR_VOICE_FAILED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_FAILED;
                v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_FAILED_0, 
                    detail = nil
                });
                return;
            else
                if v214 == Enum.VoiceChatState.Ended then
                    local l_ERROR_VOICE_DISCONNECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_DISCONNECTED;
                    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_DISCONNECTED_0, 
                        detail = nil
                    });
                end;
                return;
            end;
        end);
        l_default_1:subscribe("OnReportJoinFailed", function(v220) --[[ Line: 884 ]]
            -- upvalues: v64 (ref), l_Constants_0 (ref), v22 (ref), v7 (ref)
            v64:error("CEV OnReportJoinFailed " .. v220);
            local l_ERROR_VOICE_JOIN_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_1, 
                detail = v220
            });
        end);
        return;
    end;
end;
initializeAFM = function() --[[ Line: 891 ]] --[[ Name: initializeAFM ]]
    -- upvalues: l_game_EngineFeature_2 (copy), v7 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (copy), v73 (ref), v56 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), v44 (copy), v147 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), l_default_1 (copy), v72 (copy), v80 (ref), v64 (copy), v58 (copy), v79 (copy), v5 (copy)
    if l_game_EngineFeature_2 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 893 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            local l_CONTEXT_ID_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
            local l_FOCUS_PRIORITY_0 = v7.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY;
            l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
            local function v227() --[[ Line: 901 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v73 (ref), v56 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v44 (ref), v147 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), l_default_1 (ref), v72 (ref), v80 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v73 then
                    task.cancel(v73);
                    v73 = nil;
                end;
                if v56 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v44 or not v44:IsCapturingVideo()) or not v147 then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        l_default_1:MuteAll(true, "AudioFocusManagement - CEV deafenAll");
                    else
                        l_default_1:MuteAll(true, "AudioFocusManagement CEV");
                    end;
                end;
                if not l_default_1.localMuted and (not v72 or v80.previousMutedState == l_default_1.localMuted) then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        l_default_1:ToggleMic("AudioFocusManagement - CEV deafenAll");
                        return;
                    else
                        l_default_1:ToggleMic();
                    end;
                end;
            end;
            local function v229() --[[ Line: 924 ]]
                -- upvalues: l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v73 (ref), v56 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v44 (ref), v147 (ref), l_default_1 (ref), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref), v58 (ref), v79 (ref), v72 (ref), v80 (ref)
                if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v73 then
                    task.cancel(v73);
                    v73 = nil;
                end;
                if v56 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v44 or not v44:IsCapturingVideo()) or not v147 then
                    l_default_1:MuteAll(false, "AudioFocusManagement - CEV Mute All");
                end;
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    if l_default_1.localMuted == nil then
                        v64:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce");
                        l_default_1.muteChanged.Event:Once(function(v228) --[[ Line: 636 ]]
                            -- upvalues: v58 (ref), v79 (ref), l_default_1 (ref)
                            if v228 ~= nil then
                                if v58 then
                                    v79(function() --[[ Line: 639 ]]
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
                    elseif l_default_1.localMuted and (not v72 or v80.previousMutedState ~= l_default_1.localMuted) then
                        v64:info("CEV undeafenAll - Voice connected and muted - unmuting immediately");
                        l_default_1:ToggleMic("AudioFocusManagement - CEV undeafenAll");
                        return;
                    end;
                elseif l_default_1.localMuted then
                    l_default_1:ToggleMic();
                end;
            end;
            l_result_0.OnDeafenVoiceAudio:Connect(function(v230) --[[ Line: 949 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v73 (ref), v64 (ref), v227 (copy)
                if v230 == l_CONTEXT_ID_0 then
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 and v73 then
                        task.cancel(v73);
                        v73 = nil;
                    end;
                    v64:info("CEV OnDeafenVoiceAudio fired" .. v230);
                    v227();
                end;
            end);
            l_result_0.OnUndeafenVoiceAudio:Connect(function(v231) --[[ Line: 960 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref), l_FIntPartyVoiceUndeafenDelayMS_0 (ref), v73 (ref), v229 (copy)
                if v231 == l_CONTEXT_ID_0 then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        v64:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", v231, l_CONTEXT_ID_0);
                    end;
                    if l_FIntPartyVoiceUndeafenDelayMS_0 > 0 then
                        if v73 then
                            task.cancel(v73);
                        end;
                        v73 = task.delay(l_FIntPartyVoiceUndeafenDelayMS_0 / 1000, function() --[[ Line: 973 ]]
                            -- upvalues: v73 (ref), v64 (ref), v231 (copy), v229 (ref)
                            v73 = nil;
                            v64:info("CEV OnUndeafenVoiceAudio fired delayed" .. v231);
                            v229();
                        end);
                        return;
                    else
                        v64:info("CEV OnUndeafenVoiceAudio fired" .. v231);
                        v229();
                    end;
                end;
            end);
            local function _(v232, v233) --[[ Line: 985 ]]
                -- upvalues: l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref), v5 (ref), l_result_0 (copy)
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v64:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", v232, v233);
                end;
                return v5.new(function(v234, v235) --[[ Line: 989 ]]
                    -- upvalues: l_result_0 (ref), v232 (copy), v233 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref)
                    local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v232, v233);
                    if l_status_1 then
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            v64:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_1);
                        end;
                        v234(l_result_1);
                        return;
                    else
                        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                            v64:info("CEV requestAudioFocusWithPromise - rejected");
                        end;
                        v235("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                v64:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
            end;
            v5.new(function(v239, v240) --[[ Line: 989 ]]
                -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref)
                local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                if l_status_2 then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        v64:info("CEV requestAudioFocusWithPromise - focusGranted: {}", l_result_2);
                    end;
                    v239(l_result_2);
                    return;
                else
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        v64:info("CEV requestAudioFocusWithPromise - rejected");
                    end;
                    v240("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v243) --[[ Line: 1007 ]]
                -- upvalues: l_GetFFlagPartyVoiceMuteScopeFix_0 (ref), v64 (ref), l_default_1 (ref), v56 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v44 (ref), v147 (ref)
                if v243 then
                    if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                        v64:info("CEV audio focus request granted, preparing to undeafen.");
                    end;
                    l_default_1.muteChanged.Event:Once(function(v244) --[[ Line: 1012 ]]
                        -- upvalues: v56 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v44 (ref), v147 (ref), l_default_1 (ref)
                        if v244 ~= nil and v56 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v44 or not v44:IsCapturingVideo()) or not v147 then
                            l_default_1:MuteAll(false, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                else
                    v64:info("CEV audio focus request denied, preparing to deafen.");
                    l_default_1.muteChanged.Event:Once(function(v245) --[[ Line: 1022 ]]
                        -- upvalues: v56 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), v44 (ref), v147 (ref), l_default_1 (ref)
                        if v245 ~= nil and v56 and (not l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() or not v44 or not v44:IsCapturingVideo()) or not v147 then
                            l_default_1:MuteAll(true, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                end;
            end):catch(function() --[[ Line: 1032 ]]
                -- upvalues: v64 (ref)
                v64:info("[CEV] Error requesting focus inside CEV");
            end);
            return;
        else
            v64:info("AudioFocusService did not initialize");
        end;
    end;
end;
initializeVoice = function() --[[ Line: 1041 ]] --[[ Name: initializeVoice ]]
    -- upvalues: l_Constants_0 (copy), v22 (copy), v7 (copy), l_default_1 (copy), v165 (copy), v64 (copy)
    local l_VOICE_CONNECTING_1 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_1, 
        detail = nil
    });
    l_default_1:asyncInit():andThen(function() --[[ Line: 1044 ]]
        -- upvalues: v165 (ref), l_Constants_0 (ref), v22 (ref), v7 (ref)
        if v165(false) == false then
            local l_ERROR_VOICE_JOIN_2 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_2, 
                detail = "Initial Join failed"
            });
        else
            onCoreVoiceManagerInitialized();
        end;
        initializeAFM();
    end):catch(function(v248) --[[ Line: 1053 ]]
        -- upvalues: v64 (ref), l_Constants_0 (ref), v22 (ref), v7 (ref)
        v64:info("CoreVoiceManager did not initialize {}", v248);
        local v249 = "INIT_ERROR_UNKNOWN";
        if v248 then
            v249 = v248.code or v248;
        end;
        local l_ERROR_VOICE_INIT_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_INIT;
        v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_INIT_0, 
            detail = v249
        });
    end);
end;
rejoinVoice = function() --[[ Line: 1067 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_Constants_0 (copy), v22 (copy), v7 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_default_1 (copy), v80 (ref)
    local l_VOICE_CONNECTING_2 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v22:notify(v7.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_2, 
        detail = nil
    });
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        l_default_1:RejoinVoice();
    else
        l_default_1:RejoinChannel(v80.previousGroupId, v80.previousMutedState);
    end;
    v80 = {
        previousGroupId = nil, 
        previousMutedState = nil
    };
end;
startVoice = function() --[[ Line: 1080 ]] --[[ Name: startVoice ]]
    -- upvalues: v169 (copy), v14 (copy), l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 (copy), l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0 (copy), v17 (ref), v34 (copy), v64 (copy), v222 (copy)
    if v169() then
        if v14 and l_FStringTimeoutLoadingLocalPlayerInBackgroundDM_0 ~= l_LOCAL_PLAYER_LOADING_TIMEOUT_ENUM_0.Disable then
            v17 = v34();
            v64:info("Delayed loading of LocalPlayer loaded with UserId: {}", v17);
        end;
        v222();
        initializeVoice();
    end;
end;
v22:addObserver(v7.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function() --[[ Line: 1094 ]]
    -- upvalues: v84 (copy), l_VOICE_STATUS_0 (copy), v70 (copy)
    local l_voiceStatus_0 = v84:getState().Squad.CrossExperienceVoice.Experience.voiceStatus;
    if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_SETUP then
        startVoice();
        return;
    elseif l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_INIT or v70 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED then
        initializeVoice();
        return;
    else
        if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_JOIN or not v70 and l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MODERATED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_FAILED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED then
            rejoinVoice();
        end;
        return;
    end;
end);
local v253 = false;
local function _() --[[ Line: 1117 ]] --[[ Name: doStartVoice ]]
    -- upvalues: v253 (ref), v83 (ref), v22 (copy), v7 (copy), v64 (copy)
    if v253 then
        return;
    else
        v253 = true;
        if v83 then
            v22:removeObserver(v83, v7.Constants.EVENTS.FOREGROUND_UI_READY);
            v83 = nil;
        end;
        v64:info("Proceeding to start voice connection.");
        startVoice();
        return;
    end;
end;
v21("startingVoiceFromCEVDefaultChannel");
if l_game_EngineFeature_3 then
    if v82 then
        v64:info("Foreground was ready before setup finished. Starting voice now.");
        if not v253 then
            v253 = true;
            if v83 then
                v22:removeObserver(v83, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                v83 = nil;
            end;
            v64:info("Proceeding to start voice connection.");
            startVoice();
        end;
    else
        v64:info("Waiting for foreground UI readiness signal (with promise race)...");
        local v256 = v5.new(function(v255) --[[ Line: 1142 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0.Event:Once(function() --[[ Line: 1143 ]]
                -- upvalues: v255 (copy)
                v255("signal");
            end);
        end);
        local v257 = v5.delay(v59):andThen(function() --[[ Line: 1149 ]]
            return "timeout";
        end);
        v5.race({
            v256, 
            v257
        }):andThen(function(v258) --[[ Line: 1153 ]]
            -- upvalues: v64 (copy), v21 (copy), v59 (copy), v253 (ref), v83 (ref), v22 (copy), v7 (copy)
            if v258 == "signal" then
                v64:info("Readiness signal received within timeout.");
            else
                v64:info("Timed out waiting for readiness signal. Starting voice anyway.");
                v21("partyVoiceInitTimedOut", {
                    timeout = v59
                });
            end;
            if v253 then
                return;
            else
                v253 = true;
                if v83 then
                    v22:removeObserver(v83, v7.Constants.EVENTS.FOREGROUND_UI_READY);
                    v83 = nil;
                end;
                v64:info("Proceeding to start voice connection.");
                startVoice();
                return;
            end;
        end);
    end;
else
    v64:info("Foreground UI not using readiness sync. Starting voice connection immediately.");
    startVoice();
end;