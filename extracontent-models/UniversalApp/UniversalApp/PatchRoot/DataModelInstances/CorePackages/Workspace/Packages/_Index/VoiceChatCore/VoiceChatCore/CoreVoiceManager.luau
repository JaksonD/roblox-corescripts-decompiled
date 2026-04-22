local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_SoundService_0 = game:GetService("SoundService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_Players_1 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_AdService_0 = game:GetService("AdService");
local l_Chat_0 = game:GetService("Chat");
local v17 = require(script.Parent.Constants);
local v18 = require(script.Parent.Utils);
local l_Flags_0 = script.Parent.Flags;
local v20 = require(script.Parent.Analytics);
local l_Requests_0 = script.Parent.Requests;
local v22 = require(l_Parent_0.Promise);
local v23 = require(l_Parent_0.Cryo);
local l_default_0 = require(l_Parent_0.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_Parent_0.CallProtocol).Enums;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local v27 = require(l_Parent_0.BlockingUtility);
local v28 = require(l_Parent_0.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v29 = require(l_Flags_0.GetFFlagOverwriteIsMutedLocally)();
local v30 = require(l_Flags_0.GetFFlagReceiveLikelySpeakingUsers)();
local v31 = require(l_Flags_0.GetFFlagUseAudioInstanceAdded)();
local v32 = require(l_Flags_0.GetFFlagSetActiveWhenConnecting)();
local v33 = require(l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged)();
local v34 = game:DefineFastFlag("StringKeyFixForParticipantsTable", false);
local v35 = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false);
local v36 = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false);
local v37 = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice");
local v38 = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled");
local v39 = game:DefineFastFlag("TalkingChangedWithDebounce", false);
local v40 = game:DefineFastInt("TalkingChangedDebounceTime", 300);
local v41 = game:DefineFastFlag("SendVoiceCapturedDuringVideoCaptureEvent", false);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_Parent_0.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local v43 = require(l_Flags_0.GetFFlagLuaConsumePlayerModerated);
local v44 = require(l_Flags_0.GetFFlagEnableLuaVoiceChatAnalytics);
local v45 = require(l_Flags_0.GetFFlagUseLuaSignalrConsumer);
local v46 = require(l_Flags_0.GetFFlagClearVoiceStateOnRejoin);
local l_GetFFlagLocalMutedNilFix_0 = require(l_Parent_0.SharedFlags).GetFFlagLocalMutedNilFix;
local v48 = require(l_Flags_0.GetFFlagEnableVoiceNudge);
local v49 = require(l_Flags_0.GetFFlagEnableVoiceReverseNudge);
local v50 = require(l_Flags_0.GetFFlagClearUserFromRecentVoiceDataOnLeave);
local v51 = require(l_Flags_0.GetFIntVoiceUsersInteractionExpiryTimeSeconds);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v53 = require(l_Flags_0.GetFFlagVoiceChatServiceManagerUseAvatarChat);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_Parent_0.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v55 = require(l_Flags_0.GetFFlagBatchVoiceParticipantsUpdates);
local v56 = require(l_Flags_0.GetFIntThrottleParticipantsUpdateMs);
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local l_GetFFlagNonVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagNonVoiceFTUX;
local v59 = require(l_Flags_0.GetFFlagEnableFtuxExitOnMuteToggle);
local v60 = require(l_Flags_0.GetFFlagEnableExpJoinMicPermAnalytics);
local v61 = require(l_Flags_0.GetFFlagEnableSeamlessVoiceFeature);
local v62 = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance");
local v63 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v64 = game:DefineFastFlag("PollLikelySpeakingV2", false);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_Parent_0.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local v66 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering2", false);
local v67 = game:DefineFastFlag("StopModerationConnectionOnLeave", false);
local v68 = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_game_EngineFeature_1 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local v72 = v41 and l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0();
local l_GetFFlagEnableVoiceSignal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceSignal;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_Parent_0.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagCheckUniversePlaceBeforeSuspending_0 = require(l_Parent_0.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
local l_GetFFlagDisconnectToastClientRewrite_0 = require(l_Parent_0.SharedFlags).GetFFlagDisconnectToastClientRewrite;
local l_FFlagEnablePartyVoiceChangersInLua_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyVoiceChangersInLua;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_WATCHED_NAMESPACES_0 = v17.WATCHED_NAMESPACES;
local l_WATCHED_MESSAGE_TYPES_0 = v17.WATCHED_MESSAGE_TYPES;
local l_VOICE_CHAT_AVAILABILITY_0 = v17.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 = v17.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED;
local l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 = v17.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY;
local l_PERMISSION_STATE_0 = v17.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = v17.VOICE_JOIN_PROGRESS;
local l_FAE_ENABLED_0 = v17.FAE_ENABLED;
local l_FAE_SETTINGS_TOAST_0 = v17.FAE_SETTINGS_TOAST;
local v90 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v91 = require(l_Requests_0.GetShowPhoneVerificationUpsell);
local v92 = {
    eventName = "VoiceCapturedDuringVideoCapture", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("VoiceCapturedDuringVideoCaptureThrottlingPercentage", 10000), 
    lastUpdated = {
        26, 
        1, 
        28
    }, 
    description = "Event fired when a video capture has stopped logging if voice was captured", 
    links = ""
};
local v93 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v94 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v95 = if v72 then game:GetService("TelemetryService") else nil;
local v96 = {
    available = nil, 
    canUseServicePromise = nil, 
    userEligible = false, 
    participants = nil, 
    localMuted = nil, 
    isVoiceChangerActive = false, 
    isVoiceChangerHearMyselfActive = false, 
    currentVoicePack = nil, 
    isTalking = false, 
    previousGroupId = nil, 
    muteAll = false, 
    previousMutedState = nil, 
    permissionPromise = nil, 
    hasOptedToJoinVoiceOnAgeVerification = false, 
    permissionState = if l_GetFFlagJoinWithoutMicPermissions_0() then l_PERMISSION_STATE_0.IDLE else nil, 
    recentUsersInteractionData = nil, 
    NotificationService = l_NotificationService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    ChatService = l_Chat_0, 
    voiceEnabled = false, 
    LikelySpeakingUsersEvent = nil, 
    ReceiveLikelySpeakingUsersEvent = nil, 
    service = nil, 
    SignalREventTable = {}, 
    isInCall = false, 
    callMutedState = false, 
    audioDeviceInputAdded = nil, 
    muteChanged = Instance.new("BindableEvent"), 
    voiceChangerChanged = Instance.new("BindableEvent"), 
    voiceChangerHearMyselfChanged = Instance.new("BindableEvent"), 
    muteAllChanged = Instance.new("BindableEvent"), 
    participantLeft = Instance.new("BindableEvent"), 
    participantJoined = Instance.new("BindableEvent"), 
    participantsUpdate = Instance.new("BindableEvent"), 
    talkingChanged = Instance.new("BindableEvent"), 
    _lastTalkingChangedFireTime = 0, 
    attemptVoiceRejoin = Instance.new("BindableEvent"), 
    onPlayerMuteToggled = Instance.new("BindableEvent"), 
    setVoiceUIVisibility = Instance.new("BindableEvent"), 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = l_VOICE_JOIN_PROGRESS_0.Idle, 
    VoiceJoinProgressChanged = Instance.new("BindableEvent"), 
    mutedPlayers = {}, 
    voiceChangerActivePlayers = {}, 
    BlockStatusChanged = nil, 
    AvatarChatService = v93, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    ThirdPartyUserService = l_ThirdPartyUserService_0, 
    CaptureService = v94, 
    TelemetryService = v95, 
    SendMuteEvent = nil, 
    SetVoicePackEvent = nil, 
    VoiceChangerWasToggledEvent = nil, 
    InputToModifierWire = nil, 
    PartyVoiceDeviceInput = nil, 
    _mutedAnyone = false, 
    canUseServiceResult = nil, 
    signalRConnectionChanged = nil, 
    signalRConnection = nil, 
    AdService = l_AdService_0, 
    isPlayerWatchingAd = false, 
    options = {
        allowSeamlessVoice = true, 
        passInitErrorInPromiseReject = false, 
        forceVoiceEnabled = false
    }, 
    initializedPostSuspension = false, 
    voiceCapturedDuringVideoCapture = false
};
v96.__index = v96;
v96.new = function(v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107) --[[ Line: 303 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v20 (copy), l_AppStorageService_0 (copy), v96 (copy), v45 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v56 (copy), l_Players_1 (copy), v28 (copy), l_IXPServiceWrapper_0 (copy), v62 (copy), v63 (copy)
    local v108 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v99, 
        eventEmitter = v18.EventEmitter.new(), 
        service = v100, 
        PermissionsService = v98, 
        NotificationService = v102, 
        AvatarChatService = v103, 
        Analytics = v20.new(v101), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v97, 
        AppStorageService = v104 or l_AppStorageService_0, 
        ThirdPartyUserService = v105, 
        CaptureService = v106, 
        AdService = v107
    }, v96);
    if v45() then
        for _, v110 in l_WATCHED_MESSAGE_TYPES_0 do
            v108.SignalREventTable[v110] = Instance.new("BindableEvent");
        end;
    end;
    v108.shouldThrottleParticipantUpdate = false;
    v108.participantsStateThrottleTime = 0;
    v108.lastParticipantsStateUpdate = 0;
    v108.lastStateUpdateCounter = 0;
    if v56() > 0 then
        task.spawn(function() --[[ Line: 347 ]]
            -- upvalues: l_Players_1 (ref), v100 (copy), v28 (ref), l_IXPServiceWrapper_0 (ref), v62 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 348 ]]
                -- upvalues: l_Players_1 (ref), v100 (ref)
                if l_Players_1.LocalPlayer then
                    return v100:IsVoiceEnabledForUserIdAsync(l_Players_1.LocalPlayer.UserId);
                else
                    return false;
                end;
            end);
            if not l_status_0 then
                v28:debug("Unable to get voice enabled status: ", l_result_0);
                return;
            else
                if l_result_0 then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v62);
                end;
                return;
            end;
        end);
        v108.participantsStateThrottleTime = v56() / 1000;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 364 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v62 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v62);
        end);
        if l_status_1 and l_result_1 and l_result_1[v63] then
            v108.shouldThrottleParticipantUpdate = true;
        end;
    end;
    return v108;
end;
v96.emit = function(v115, v116, ...) --[[ Line: 375 ]] --[[ Name: emit ]]
    v115.eventEmitter:emit(v116, ...);
end;
v96.subscribe = function(v117, v118, v119) --[[ Line: 379 ]] --[[ Name: subscribe ]]
    v117.eventEmitter:addListener(v118, v119);
end;
v96.unsubscribeAll = function(v120) --[[ Line: 383 ]] --[[ Name: unsubscribeAll ]]
    v120.eventEmitter:removeAllListeners();
end;
v96.CheckCallStateWithPromise = function(v121) --[[ Line: 387 ]] --[[ Name: CheckCallStateWithPromise ]]
    -- upvalues: l_default_0 (copy), v28 (copy), l_Enums_0 (copy)
    return l_default_0:getCallState():andThen(function(v122) --[[ Line: 389 ]]
        -- upvalues: v28 (ref), l_Enums_0 (ref), v121 (copy)
        v28:trace("Got user call state");
        if v122.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v122.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
            v121.isInCall = true;
            v121.callMutedState = v122.muted;
            v28:trace("Changing call muted state to {}", v122.muted);
        end;
    end):catch(function(v123) --[[ Line: 401 ]]
        -- upvalues: v28 (ref)
        v28:trace("User not in call {}", v123);
    end);
end;
v96.CheckCallState = function(v124) --[[ Line: 407 ]] --[[ Name: CheckCallState ]]
    -- upvalues: v28 (copy), l_default_0 (copy), l_Enums_0 (copy)
    v28:trace("Checking user call state");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 409 ]]
        -- upvalues: l_default_0 (ref), v28 (ref), l_Enums_0 (ref), v124 (copy)
        l_default_0:getCallState():andThen(function(v125) --[[ Line: 411 ]]
            -- upvalues: v28 (ref), l_Enums_0 (ref), v124 (ref)
            v28:trace("Got user call state");
            if v125.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v125.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v124.isInCall = true;
                v124.callMutedState = v125.muted;
                v28:trace("Changing call muted state to {}", v125.muted);
            end;
        end):catch(function(v126) --[[ Line: 423 ]]
            -- upvalues: v28 (ref)
            v28:trace("User not in call {}", v126);
        end);
    end);
    if not l_status_2 then
        v28:debug("Error checking user call state {}", l_result_2);
    end;
end;
v96._GetShowAgeVerificationOverlay = function(v129, v130) --[[ Line: 442 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: v90 (copy), v18 (copy)
    return v90(v18.bind(v129, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), v130);
end;
v96.FetchAgeVerificationOverlay = function(v131, v132) --[[ Line: 451 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: v22 (copy)
    if not v131._getShowAgeVerificationOverlayResult then
        if not v131._getShowAgeVerificationOverlayPromise then
            v131._getShowAgeVerificationOverlayPromise = v22.new(function(v133, _) --[[ Line: 454 ]]
                -- upvalues: v131 (copy), v132 (copy)
                v131._getShowAgeVerificationOverlayResult = v131:_GetShowAgeVerificationOverlay(v132);
                v133(v131._getShowAgeVerificationOverlayResult);
            end);
        end;
        v131._getShowAgeVerificationOverlayPromise:await();
    end;
    return v131._getShowAgeVerificationOverlayResult;
end;
v96._GetShowPhoneVerificationUpsell = function(v135, v136, v137) --[[ Line: 470 ]] --[[ Name: _GetShowPhoneVerificationUpsell ]]
    -- upvalues: v91 (copy), v18 (copy)
    return (v91(v18.bind(v135, "GetRequest"), tostring(game.GameId), v136, v137));
end;
v96.FetchPhoneVerificationUpsell = function(v138, v139, v140, v141) --[[ Line: 483 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    -- upvalues: v22 (copy), v17 (copy)
    if not v138._getShowPhoneVerificationUpsellResult then
        v138._getShowPhoneVerificationUpsellResult = {};
        v138._getShowPhoneVerificationUpsellPromise = {};
    end;
    if not v138._getShowPhoneVerificationUpsellResult[v139] or v141 then
        if not v138._getShowPhoneVerificationUpsellPromise[v139] or v141 then
            v138._getShowPhoneVerificationUpsellPromise[v139] = v22.new(function(v142, _) --[[ Line: 494 ]]
                -- upvalues: v138 (copy), v139 (copy), v140 (copy), v17 (ref)
                local v144 = v138:_GetShowPhoneVerificationUpsell(v139, v140);
                v138._getShowPhoneVerificationUpsellResult[v139] = if type(v144) == "table" and v144.valueProp ~= nil then v144.valueProp else v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
                v142();
            end);
        end;
        v138._getShowPhoneVerificationUpsellPromise[v139]:await();
    end;
    return v138._getShowPhoneVerificationUpsellResult[v139];
end;
v96.DisablePhoneVerificationUpsell = function(v145) --[[ Line: 508 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    -- upvalues: v23 (copy), v17 (copy)
    v145._getShowPhoneVerificationUpsellResult = v23.Dictionary.map(v145._getShowPhoneVerificationUpsellResult, function() --[[ Line: 511 ]]
        -- upvalues: v17 (ref)
        return v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
    end);
end;
v96.GetNudgeAnalyticsData = function(v146) --[[ Line: 517 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v146:GetSessionId();
end;
v96.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v147, v148) --[[ Line: 522 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v149 = {
        isUniverseEnabledForVoice = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UniverseAudio), 
        isPlaceEnabledForVoice = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.PlaceAudio), 
        isUniverseEnabledForAvatarVideo = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UniverseVideo), 
        isPlaceEnabledForAvatarVideo = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.PlaceVideo)
    };
    local v150 = {
        isUserEligible = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserAudioEligible), 
        isVoiceEnabled = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserAudio), 
        isAvatarVideoEligible = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserVideoEligible), 
        isAvatarVideoEnabled = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserVideo), 
        isUserVerifiedForVoice = if l_GetFFlagEnableVoiceSignal_0() then v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil, 
        isBanned = v147.AvatarChatService:IsEnabled(v148, Enum.AvatarChatServiceFeature.UserBanned), 
        bannedUntil = nil
    };
    return {
        universePlaceVoiceEnabledSettings = v149, 
        voiceSettings = v150
    };
end;
v96.resolveAvatarChatUserAndPlaceSettings = function(v151) --[[ Line: 569 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    local l_status_3, l_result_3 = pcall(v151.AvatarChatService.GetClientFeaturesAsync, v151.AvatarChatService);
    if not l_status_3 then
        return nil;
    else
        return v151:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_3);
    end;
end;
v96.GetRequest = function(v154, v155, _) --[[ Line: 579 ]] --[[ Name: GetRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 580 ]]
        -- upvalues: v154 (copy), v155 (copy), l_HttpService_0 (ref)
        local l_AsyncFullUrl_0 = v154.HttpRbxApiService:GetAsyncFullUrl(v155, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_AsyncFullUrl_0);
    end);
    return l_status_4 and l_result_4;
end;
v96.PostUserVoiceConnectionStatus = function(v160, v161) --[[ Line: 588 ]] --[[ Name: PostUserVoiceConnectionStatus ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    local l_status_5, _ = pcall(function() --[[ Line: 589 ]]
        -- upvalues: l_HttpService_0 (ref), v161 (copy), v160 (copy), v17 (ref)
        local v162 = l_HttpService_0:JSONEncode({
            IsUserVoiceConnected = v161
        });
        local v163 = v160.HttpRbxApiService:PostAsyncFullUrl(v17.VOICE_URL .. "/v1/user-voice-connection-state", v162);
        return l_HttpService_0:JSONDecode(v163);
    end);
    return l_status_5;
end;
v96.GetVoiceAnalyticsData = function(v166) --[[ Line: 598 ]] --[[ Name: GetVoiceAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_RbxAnalyticsService_0 (copy)
    return {
        universeId = game.GameId, 
        placeId = game.PlaceId, 
        playSessionId = if l_game_EngineFeature_1 then l_RbxAnalyticsService_0:GetPlaySessionId() else "", 
        voiceSessionId = if v166.service then v166:GetSessionId() else "", 
        micAvailability = ""
    };
end;
v96.RecordExperienceJoinMicPermissionStatus = function(v167, v168) --[[ Line: 610 ]] --[[ Name: RecordExperienceJoinMicPermissionStatus ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), l_PERMISSION_STATE_0 (copy)
    local l_v167_VoiceAnalyticsData_0 = v167:GetVoiceAnalyticsData();
    if v168 ~= nil and typeof(v168) == "table" then
        if v168.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
            l_v167_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v167_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    elseif v167.permissionState then
        if v167.permissionState == l_PERMISSION_STATE_0.LISTEN_AND_TALK then
            l_v167_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v167_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    end;
    v167.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", l_v167_VoiceAnalyticsData_0);
end;
v96.CheckCaptureMute = function(v170) --[[ Line: 630 ]] --[[ Name: CheckCaptureMute ]]
    -- upvalues: l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy)
    if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then
        return v170.CaptureService:IsCapturingVideo();
    else
        return false;
    end;
end;
v96.ToggleMuteSome = function(v171, v172, v173, v174, v175) --[[ Line: 639 ]] --[[ Name: ToggleMuteSome ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v171:ensureInitialized("mute some players");
    v171._mutedAnyone = true;
    local v176 = {};
    v173 = v173 or v171:CheckCaptureMute();
    for _, v178 in v172 do
        if l_VoiceChatService_0.UseNewAudioApi then
            v176[v178] = true;
            v171.mutedPlayers[v178] = v173;
        else
            v171.service:SubscribePause(v178, v173);
        end;
        local v179 = v171.participants[tostring(v178)];
        if v179 then
            v179.isMutedLocally = v173;
            v171.participantsUpdate:Fire(v171.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v180 in v171.audioDevices do
            if v180.Player and v176[v180.Player.UserId] then
                if l_game_EngineFeature_0 and v180.Player ~= l_Players_0.LocalPlayer then
                    v180.MutedByLocalUser = v173;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    v180.Active = not v173;
                end;
            end;
        end;
    end;
    if v174 and v175 then
        v171.Analytics:reportVoiceMuteGroup((v171:JoinWithVoiceMuteData({
            groupType = v174, 
            context = v175, 
            muted = v173
        })));
    end;
end;
v96.GetMutedAnyone = function(v181) --[[ Line: 684 ]] --[[ Name: GetMutedAnyone ]]
    return v181._mutedAnyone;
end;
v96.ToggleMutePlayer = function(v182, v183, v184) --[[ Line: 688 ]] --[[ Name: ToggleMutePlayer ]]
    -- upvalues: l_VoiceChatService_0 (copy), v29 (copy), v28 (copy), v18 (copy), v59 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v182:ensureInitialized("mute player " .. v183);
    v182._mutedAnyone = true;
    local v185 = (if l_VoiceChatService_0.UseNewAudioApi and v29 then not v182.mutedPlayers[v183] else not v182.service:IsSubscribePaused(v183)) or v182:CheckCaptureMute();
    v28:trace("Setting mute for {} to {}", v18.shorten(v183), v185);
    if v59() then
        v182.onPlayerMuteToggled:Fire();
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        v182.mutedPlayers[v183] = v185;
        for v186 in v182.audioDevices do
            if v186.Player and v186.Player.UserId == v183 then
                if l_game_EngineFeature_0 and v186.Player ~= l_Players_0.LocalPlayer then
                    v186.MutedByLocalUser = v185;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    local v187 = v182.participants[tostring(v183)];
                    local v188 = v187 and not v187.isMuted;
                    v186.Active = not v185 and v188;
                end;
            end;
        end;
        v182:emit("OnPlayerMuted");
    else
        v182.service:SubscribePause(v183, v185);
    end;
    for _, v190 in pairs(v182.participants) do
        if v190.userId == v183 then
            v190.isMutedLocally = v185;
            v182.participantsUpdate:Fire(v182.participants);
        end;
    end;
    if v184 then
        v182.Analytics:reportVoiceMuteIndividual((v182:JoinWithVoiceMuteData({
            targetUserId = tonumber(v183), 
            context = v184, 
            muted = v185
        })));
    end;
end;
v96.MuteAll = function(v191, v192, v193) --[[ Line: 742 ]] --[[ Name: MuteAll ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v17 (copy)
    v191:ensureInitialized("mute all");
    v191._mutedAnyone = true;
    v192 = v192 or v191:CheckCaptureMute();
    if l_VoiceChatService_0.UseNewAudioApi then
        v191.muteAll = v192;
        v28:trace("Setting self mute all to {} context: {}", v192, v193);
        for v194 in v191.audioDevices do
            if v194.Player and v194.Player ~= l_Players_0.LocalPlayer then
                v28:debug("Local muting {} to '{} = {}'", v194.Player.Name, v194.Active, v192);
                if l_game_EngineFeature_0 then
                    v194.MutedByLocalUser = v192;
                else
                    local l_UserId_0 = v194.Player.UserId;
                    v191.mutedPlayers[l_UserId_0] = v192;
                    local v196 = v191.participants[tostring(l_UserId_0)];
                    local v197 = v196 and not v196.isMuted;
                    v194.Active = not v192 and v197;
                end;
            end;
        end;
    else
        v191.service:SubscribePauseAll(v192);
    end;
    for _, v199 in pairs(v191.participants) do
        v199.isMutedLocally = v192;
        v191.participantsUpdate:Fire(v191.participants);
    end;
    v191.muteAllChanged:Fire(v192);
    if v193 then
        v191.Analytics:reportVoiceMuteGroup((v191:JoinWithVoiceMuteData({
            groupType = v17.VOICE_GROUP_TYPE.ALL, 
            context = v193, 
            muted = v192
        })));
    end;
end;
v96.FetchVoicePermissions = function(v200) --[[ Line: 785 ]] --[[ Name: FetchVoicePermissions ]]
    if not v200.communicationPermissionsResult then
        v200.communicationPermissionsResult = v200:resolveAvatarChatUserAndPlaceSettings();
    end;
    return v200.communicationPermissionsResult;
end;
v96.verifyUniverseAndPlaceCanUseVoice = function(v201) --[[ Line: 793 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v20 (copy)
    local v202 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v201:resolveAvatarChatUserAndPlaceSettings() else v201:FetchAgeVerificationOverlay();
    if not v202 then
        v201:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_0 = v202.universePlaceVoiceEnabledSettings;
        return l_universePlaceVoiceEnabledSettings_0 and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice and l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice;
    end;
end;
v96.IsUserInFTUX = function(v204) --[[ Line: 813 ]] --[[ Name: IsUserInFTUX ]]
    -- upvalues: l_GetFFlagSeamlessVoiceFTUX_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v28 (copy)
    if not l_GetFFlagSeamlessVoiceFTUX_0() then
        return false;
    elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v204:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local l_AppStorageService_1 = game:GetService("AppStorageService");
        local v206 = nil;
        if not pcall(function() --[[ Line: 823 ]]
            -- upvalues: l_AppStorageService_1 (copy), v206 (ref)
            v206 = l_AppStorageService_1:GetItem("SeamlessVoiceFTUX") == "true";
        end) then
            v28:warning("Failed to read FTUX/STUX from AppStorage");
            return false;
        else
            local v207 = v204:FetchAgeVerificationOverlay();
            if type(v207) == "table" and v207.voiceSettings and v207.voiceSettings.seamlessVoiceStatus ~= 3 then
                v28:debug("User not eligible for FTUX/STUX");
                return false;
            else
                return not v206;
            end;
        end;
    end;
end;
v96.isEnableDefaultVoiceOnForPlace = function(_) --[[ Line: 846 ]] --[[ Name: isEnableDefaultVoiceOnForPlace ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    return l_VoiceChatService_0.UseNewAudioApi or l_VoiceChatService_0.EnableDefaultVoice;
end;
v96.verifyPlaceCanUseVoice = function(v209, v210, v211) --[[ Line: 857 ]] --[[ Name: verifyPlaceCanUseVoice ]]
    -- upvalues: v20 (copy)
    if not v210 or not v211 then
        v209:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    elseif not v210.isUniverseEnabledForVoice then
        v209:_reportJoinFailed("universeNotEnabled");
        return false;
    else
        v209:emit("OnUserAndPlaceCanUseVoiceResolved", v211, v210);
        if not v210.isPlaceEnabledForVoice then
            v209:_reportJoinFailed("placeNotEnabled");
            return false;
        elseif not v209:isEnableDefaultVoiceOnForPlace() then
            return false;
        else
            return true;
        end;
    end;
end;
v96.EligibleForFaeUpsell = function(v212) --[[ Line: 882 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_FAE_ENABLED_0 (copy)
    local v213 = v212:FetchAgeVerificationOverlay();
    if not v213 or type(v213) ~= "table" then
        return false;
    else
        local v214 = v213.inExperienceFaeUpsell == l_FAE_ENABLED_0;
        local l_isPlaceEnabledForVoice_0 = v213.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        return v214 and l_isPlaceEnabledForVoice_0;
    end;
end;
v96.OptUserToJoinVoice = function(v216) --[[ Line: 892 ]] --[[ Name: OptUserToJoinVoice ]]
    -- upvalues: v28 (copy)
    v28:debug("Opting user to join voice on age verification");
    v216.hasOptedToJoinVoiceOnAgeVerification = true;
end;
v96.SetupFAECompleteListener = function(v217) --[[ Line: 897 ]] --[[ Name: SetupFAECompleteListener ]]
    -- upvalues: v28 (copy)
    v28:debug("Setting up FAE complete listener");
    if game:GetEngineFeature("ChatReconcileAccess") then
        v28:debug("Using ChatService ReconcileCommunicationAccessCompleted event");
        v217.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ Line: 901 ]]
            -- upvalues: v28 (ref), v217 (copy)
            v28:debug("FAE complete listener triggered, re-fetching voice permissions");
            v217.communicationPermissionsResult = nil;
            v217:FetchVoicePermissions();
            v217._getShowAgeVerificationOverlayResult = v217:_GetShowAgeVerificationOverlay();
            if v217.hasOptedToJoinVoiceOnAgeVerification then
                v28:debug("FAE complete listener triggered, attempting voice rejoin");
                if v217:IsSeamlessVoice() then
                    v28:debug("Opting-in user to voice");
                    v217.AvatarChatService:EnableVoice();
                    v217.attemptVoiceRejoin:Fire();
                end;
            end;
        end);
    end;
end;
v96.EligibleForAgeCheckToast = function(v218) --[[ Line: 921 ]] --[[ Name: EligibleForAgeCheckToast ]]
    -- upvalues: l_FAE_SETTINGS_TOAST_0 (copy)
    local v219 = v218:FetchAgeVerificationOverlay();
    if not v219 or type(v219) ~= "table" then
        return false;
    else
        local l_isPlaceEnabledForVoice_1 = v219.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        local v221 = v219.inExperienceFaeUpsell == l_FAE_SETTINGS_TOAST_0;
        return l_isPlaceEnabledForVoice_1 and v218:isEnableDefaultVoiceOnForPlace() and v221;
    end;
end;
v96.userAndPlaceCanUseVoice = function(v222) --[[ Line: 931 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v90 (copy), v18 (copy), v20 (copy), v28 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy)
    if v222.ThirdPartyUserService ~= nil and v222.ThirdPartyUserService:IsChatRestrictionSupported() and v222.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
        return false;
    else
        local v223 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v222:resolveAvatarChatUserAndPlaceSettings() else v90(v18.bind(v222, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
        if not v223 then
            v222:_reportJoinFailed("invalidResponse", v20.ERROR);
            return false;
        else
            if v222.options.forceVoiceEnabled then
                v223.voiceSettings.isVoiceEnabled = true;
                v28:debug("bypassing voice permissions check");
            end;
            local l_universePlaceVoiceEnabledSettings_1 = v223.universePlaceVoiceEnabledSettings;
            local l_voiceSettings_0 = v223.voiceSettings;
            v28:trace("Voice settings endpoint returned {}", v223);
            if not v222:verifyPlaceCanUseVoice(l_universePlaceVoiceEnabledSettings_1, l_voiceSettings_0) then
                return false;
            else
                if l_GetFFlagEnableVoiceSignal_0() then
                    v222.communicationPermissionsResult = v223;
                    local v226 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and os.time();
                    local v227 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v222:UserVoiceEnabled() and not l_voiceSettings_0.isUserVerifiedForVoice and (v222:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v226 and v222:FetchPhoneVerificationUpsell(v17.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v226) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat);
                    if v222:UserEligibleForInExperienceUpsell() or v227 then
                        v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                    end;
                    if l_GetFFlagEnableVoiceUxUpdates_0() then
                        local l_v222_VoiceConnectCookie_0 = v222:GetVoiceConnectCookie();
                        local v229 = v222:HasSeamlessVoiceFeature(v17.SeamlessVoiceFeatures.DeferConnection) and l_v222_VoiceConnectCookie_0 == "";
                        local v230 = v222:IsSeamlessVoice() and l_v222_VoiceConnectCookie_0 == "false";
                        if v229 or v230 then
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v222:EligibleForFaeUpsell() then
                            v28:debug("Suspending voice join for FAE Eligible user");
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                            v222:SetupFAECompleteListener();
                        end;
                    else
                        if l_GetFFlagNonVoiceFTUX_0() and v222:IsUserInFTUX() then
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                        if v222:IsSeamlessVoice() and not v222:GetVoiceConnectCookieValue() then
                            v28:debug("Suspending voice join due to voice connect cookie");
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v222:IsNewSeamlessVoiceUserDisconnect() then
                            v28:debug("Suspending voice join for new seamless voice user");
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v222:IsSeamlessVoice() and v222:UserOnlyEligibleForVoice() then
                            v28:debug("Suspending voice join for opt-out user");
                            v222:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                    end;
                    task.spawn(function() --[[ Line: 1028 ]]
                        -- upvalues: v222 (copy)
                        v222:FetchAgeVerificationOverlay();
                    end);
                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v222:UserEligibleForLikelySpeakingBubbles() then
                        v222:emit("OnShowLikelySpeakingBubblesChanged", true);
                    end;
                end;
                if not l_voiceSettings_0.isVoiceEnabled then
                    v222:_reportJoinFailed("userNotEnabled");
                end;
                return l_voiceSettings_0.isVoiceEnabled;
            end;
        end;
    end;
end;
v96.voicePermissionGranted = function(_, v232) --[[ Line: 1047 ]] --[[ Name: voicePermissionGranted ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), v23 (copy)
    local _ = false;
    if typeof(v232) == "table" then
        local v234 = true;
        if v232.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v234 = not v23.List.find(v232.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v234;
    else
        return v232 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v96.RawGetPermissions = function(v235, v236) --[[ Line: 1067 ]] --[[ Name: RawGetPermissions ]]
    -- upvalues: v22 (copy)
    return v22.new(function(v237, _) --[[ Line: 1068 ]]
        -- upvalues: v235 (copy), v236 (copy)
        v235:emit("GetPermissions", function(v239) --[[ Line: 1069 ]]
            -- upvalues: v237 (copy)
            v237(v239);
        end, v236, true, true);
    end);
end;
v96.requestMicPermission = function(v240) --[[ Line: 1076 ]] --[[ Name: requestMicPermission ]]
    -- upvalues: v28 (copy), l_PermissionsProtocol_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v22 (copy), v60 (copy), v20 (copy)
    if v240.permissionPromise then
        v28:trace("PermissionProtocol already invoked");
        return v240.permissionPromise;
    else
        local v241 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v242 = nil;
        if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0(v240:IsSeamlessVoice()) then
            v28:debug("Requesting device permission");
            local v243 = nil;
            local v244 = nil;
            local v245, v246, v247 = pcall(function() --[[ Line: 1090 ]]
                -- upvalues: v240 (copy), v241 (copy)
                return v240:RawGetPermissions(v241):await();
            end);
            v243 = v245 and v246;
            v244 = v247;
            if v243 then
                if v244.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v240.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif v244.missingPermissions then
                    v240.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                elseif v244.deniedPermissions then
                    v240.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v28:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v240.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v28:error("PermissionsService call failed.");
                v240.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            end;
            v28:debug("Joining without mic permissions. Permission State: {}", v240.permissionState);
            v242 = v22.resolve();
        else
            v242 = v240.PermissionsService:requestPermissions(v241);
        end;
        v240.permissionPromise = v242:andThen(function(v248) --[[ Line: 1119 ]]
            -- upvalues: v60 (ref), v240 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v22 (ref), v28 (ref), v20 (ref), l_PermissionsProtocol_0 (ref)
            if v60() then
                v240:RecordExperienceJoinMicPermissionStatus(v248);
            end;
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                return v22.resolve();
            elseif not v248 and not v248.status then
                v28:debug("No permission response, rejecting access");
                v240:_reportJoinFailed("noPermissionResponse", v20.ERROR);
                if v240.options.passInitErrorInPromiseReject then
                    return v22.reject({
                        code = "INIT_ERROR_NO_PERM_RESPONSE"
                    });
                else
                    return v22.reject();
                end;
            else
                v28:debug("Permission status {}", v248.status);
                local v249 = v248.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if v240.options.passInitErrorInPromiseReject and not v249 then
                    return v22.reject({
                        code = "INIT_ERROR_PERM_NOT_GRANTED"
                    });
                else
                    return v249 and v22.resolve() or v22.reject();
                end;
            end;
        end):andThen(function() --[[ Line: 1143 ]]
            -- upvalues: v240 (copy), v22 (ref)
            v240:emit("OnRequestMicPermissionResolved");
            return v22.resolve();
        end):catch(function() --[[ Line: 1148 ]]
            -- upvalues: v240 (copy), v22 (ref)
            v240:emit("OnRequestMicPermissionRejected");
            if v240.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_MIC_PERM_REJECTED"
                });
            else
                return v22.reject();
            end;
        end);
        return v240.permissionPromise;
    end;
end;
v96.JoinByGroupIdToken = function(v250, v251, v252) --[[ Line: 1158 ]] --[[ Name: JoinByGroupIdToken ]]
    v250.previousGroupId = v251;
    v250.previousMutedState = v252;
    return v250.service:JoinByGroupIdToken(v251, v252);
end;
v96.EnableVoice = function(v253) --[[ Line: 1164 ]] --[[ Name: EnableVoice ]]
    -- upvalues: v28 (copy)
    v28:trace("Enabling voice");
    v253.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ Line: 1167 ]]
        -- upvalues: v253 (copy)
        v253.attemptVoiceRejoin:Fire();
    end);
    v253.AvatarChatService:EnableVoice();
end;
v96.ChangeVoiceJoinProgress = function(v254, v255) --[[ Line: 1173 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    v254.VoiceJoinProgress = v255;
    v254.VoiceJoinProgressChanged:Fire(v254.VoiceJoinProgress);
end;
v96.setOptions = function(v256, v257) --[[ Line: 1178 ]] --[[ Name: setOptions ]]
    v256.options = v257;
end;
v96.ShouldShowJoinVoiceOnDisconnect = function(v258) --[[ Line: 1182 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy)
    return v258:IsSeamlessVoice() and v258.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended;
end;
v96.IsSeamlessVoice = function(v259) --[[ Line: 1186 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy)
    if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and not v259.options.allowSeamlessVoice then
        return false;
    else
        local v260 = v259:FetchAgeVerificationOverlay();
        if type(v260) ~= "table" or not v260 or not v260.voiceSettings then
            return false;
        elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v259:verifyUniverseAndPlaceCanUseVoice() then
            return false;
        else
            local l_seamlessVoiceStatus_0 = v260.voiceSettings.seamlessVoiceStatus;
            local v262 = true;
            if l_seamlessVoiceStatus_0 ~= v17.SeamlessVoiceStatus.EnabledExistingUser then
                v262 = l_seamlessVoiceStatus_0 == v17.SeamlessVoiceStatus.EnabledNewUser;
            end;
            return v262;
        end;
    end;
end;
v96.HasSeamlessVoiceFeature = function(v263, v264) --[[ Line: 1208 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    -- upvalues: v61 (copy), v18 (copy), v17 (copy)
    if not v263.options.allowSeamlessVoice or not v263:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v265 = v263:FetchAgeVerificationOverlay();
        if not v263:_isValidAgeVerificationOverlayData(v265) then
            return false;
        else
            local l_seamlessVoiceVariant_0 = v265.voiceSettings.seamlessVoiceVariant;
            if not l_seamlessVoiceVariant_0 then
                return false;
            else
                if v61() then
                    if type(v264) == "string" then
                        v264 = {
                            v264
                        };
                    end;
                    if v61(v264) then
                        local v267 = v18.jsonDecode(l_seamlessVoiceVariant_0);
                        local v268 = {};
                        for _, v270 in pairs(v267) do
                            v268[v270] = true;
                        end;
                        if #v264 == 1 and v264[1] == v17.SeamlessVoiceFeatures.ConnectDisconnect and l_seamlessVoiceVariant_0 == v17.SeamlessVoiceVariants.OnlyConnectDisconnect then
                            return true;
                        else
                            for _, v272 in pairs(v264) do
                                if not v268[v272] then
                                    return false;
                                end;
                            end;
                            return true;
                        end;
                    end;
                else
                    local v276 = ({
                        [v17.SeamlessVoiceFeatures.ConnectDisconnect] = function(v273) --[[ Line: 1253 ]]
                            -- upvalues: v17 (ref)
                            return v273 ~= v17.SeamlessVoiceVariants.Control;
                        end, 
                        [v17.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(v274) --[[ Line: 1256 ]]
                            -- upvalues: v17 (ref)
                            return v274 == v17.SeamlessVoiceVariants.HearingWithoutMicPermissions;
                        end, 
                        [v17.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function(v275) --[[ Line: 1259 ]]
                            -- upvalues: v17 (ref)
                            return v275 == v17.SeamlessVoiceVariants.LikelySpeakingBubblesRemoved;
                        end
                    })[v264];
                    if v276 then
                        return v276(l_seamlessVoiceVariant_0);
                    end;
                end;
                return false;
            end;
        end;
    end;
end;
v96.IsNewSeamlessVoiceUserDisconnect = function(v277) --[[ Line: 1273 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    -- upvalues: v17 (copy)
    if not v277.options.allowSeamlessVoice or not v277:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v278 = v277:FetchAgeVerificationOverlay();
        if not v277:_isValidAgeVerificationOverlayData(v278) then
            return false;
        elseif v278.voiceSettings.seamlessVoiceStatus ~= v17.SeamlessVoiceStatus.EnabledNewUser then
            return false;
        else
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 1292 ]]
                -- upvalues: v277 (copy), v17 (ref)
                return v277.AppStorageService:GetItem(v17.SEAMLESS_VOICE_FTUX_KEY);
            end);
            return l_status_6 and l_result_6 == "false";
        end;
    end;
end;
v96._isValidAgeVerificationOverlayData = function(_, v282) --[[ Line: 1300 ]] --[[ Name: _isValidAgeVerificationOverlayData ]]
    local v283 = false;
    if type(v282) == "table" then
        v283 = v282 and v282.voiceSettings;
    end;
    return v283;
end;
v96.UserInInExperienceUpsellTreatment = function(v284) --[[ Line: 1304 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    -- upvalues: v17 (copy)
    local v285 = v284:FetchAgeVerificationOverlay();
    if not v285 then
        return false;
    else
        local l_showVoiceInExperienceUpsellVariant_0 = v285.showVoiceInExperienceUpsellVariant;
        local v287 = true;
        if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT1 then
            v287 = true;
            if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT2 then
                v287 = l_showVoiceInExperienceUpsellVariant_0 == v17.IN_EXP_UPSELL_VARIANT.VARIANT3;
            end;
        end;
        return v287;
    end;
end;
v96.UserOnlyEligibleForVoice = function(v288) --[[ Line: 1316 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    -- upvalues: v35 (copy)
    local l_communicationPermissionsResult_0 = v288.communicationPermissionsResult;
    if not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings or not l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        if v35 then
            v288:FetchVoicePermissions();
            l_communicationPermissionsResult_0 = v288.communicationPermissionsResult;
        else
            return false;
        end;
    end;
    return l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
end;
v96.UserOnlyEligibleForVoiceViaOverlay = function(v290) --[[ Line: 1332 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    local v291 = v290:FetchAgeVerificationOverlay();
    if not v290:_isValidAgeVerificationOverlayData(v291) then
        return false;
    else
        return v291.voiceSettings.isVerifiedForVoice and not v291.voiceSettings.isVoiceEnabled and v291.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v96.UserVoiceEnabled = function(v292) --[[ Line: 1345 ]] --[[ Name: UserVoiceEnabled ]]
    local l_communicationPermissionsResult_1 = v292.communicationPermissionsResult;
    if not l_communicationPermissionsResult_1 or not l_communicationPermissionsResult_1.voiceSettings or not l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_1.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v96.UserEligibleForInExperienceUpsell = function(v294) --[[ Line: 1355 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v295 = v294:UserOnlyEligibleForVoice();
    if not v295 then
        return false;
    elseif l_GetFFlagEnableVoiceSignal_0() then
        local v296 = v294:UserInInExperienceUpsellTreatment();
        return v295 and v296;
    else
        local v297 = v294:FetchAgeVerificationOverlay();
        return v295 and v297 and v297.showVoiceInExperienceUpsell;
    end;
end;
v96.UserEligibleForLikelySpeakingBubbles = function(v298) --[[ Line: 1376 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    local v299 = v298:UserOnlyEligibleForVoice();
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v299 and not v298:UserVoiceEnabled() and v298:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then
        return true;
    elseif not l_GetFFlagEnableSeamlessVoiceV2_0() and not v299 then
        return false;
    else
        local v300 = v298:FetchAgeVerificationOverlay();
        if l_GetFFlagEnableSeamlessVoiceV2_0() then
            if not v298:_isValidAgeVerificationOverlayData(v300) then
                return false;
            else
                local v301 = v299 and v300 and v300.showVoiceInExperienceUpsell;
                local l_showM3LikelySpeakingBubbles_0 = v300.showM3LikelySpeakingBubbles;
                return v301 or l_showM3LikelySpeakingBubbles_0;
            end;
        else
            return v299 and v300 and v300.showVoiceInExperienceUpsell;
        end;
    end;
end;
v96.canUseServiceAsync = function(v303) --[[ Line: 1414 ]] --[[ Name: canUseServiceAsync ]]
    -- upvalues: v28 (copy), v22 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy), l_VoiceChatService_0 (copy), v36 (copy), l_IXPServiceWrapper_0 (copy), v37 (copy), v38 (copy)
    if v303.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        v28:debug("Voice Chat is not Available, rejecting canUseService promise");
        if v303.options.passInitErrorInPromiseReject then
            return v22.reject({
                code = "INIT_ERROR_VOICE_NOT_SUPPORTED"
            });
        else
            return v22.reject();
        end;
    else
        if not v303.canUseServicePromise then
            v303.canUseServicePromise = v22.defer(function(v304, v305) --[[ Line: 1424 ]]
                -- upvalues: v303 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v28 (ref), l_VOICE_CHAT_AVAILABILITY_0 (ref), l_VoiceChatService_0 (ref), v36 (ref), l_IXPServiceWrapper_0 (ref), v37 (ref), v38 (ref)
                local v306 = v303:userAndPlaceCanUseVoice();
                if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                    v303.canUseServiceResult = v306;
                    v303:emit("OnCanUseServiceResult", v306);
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v303.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v28:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v303.attemptVoiceRejoin.Event:Wait();
                    v28:debug("Attempting voice rejoin");
                    v303.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true;
                    v303.userEligible = true;
                    v303.initializedPostSuspension = true;
                    v304();
                    v303:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return;
                elseif not v306 then
                    v28:info("Voice access denied");
                    v303.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    if v303.options.passInitErrorInPromiseReject then
                        v305({
                            code = "INIT_ERROR_USER_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v305();
                        return;
                    end;
                elseif game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc or not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                    v28:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                    if not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                        v303:_reportJoinFailed("universeNotEnabled");
                    elseif not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                        v303:_reportJoinFailed("placeNotEnabled");
                    end;
                    v303.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                    if v303.options.passInitErrorInPromiseReject then
                        v305({
                            code = "INIT_ERROR_PLACE_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v305();
                        return;
                    end;
                elseif v36 then
                    l_IXPServiceWrapper_0:WaitForInitialization();
                    local l_status_7, l_result_7 = pcall(function() --[[ Line: 1484 ]]
                        -- upvalues: l_IXPServiceWrapper_0 (ref), v37 (ref)
                        return l_IXPServiceWrapper_0:GetLayerData(v37);
                    end);
                    if l_status_7 and l_result_7 and l_result_7[v38] ~= nil then
                        v303.userEligible = l_result_7[v38];
                        l_IXPServiceWrapper_0:LogUserLayerExposure(v37);
                    end;
                    if v303.userEligible then
                        v304();
                        return;
                    elseif v303.options.passInitErrorInPromiseReject then
                        v305({
                            code = "INIT_ERROR_IXP_NOT_ELIGIBLE"
                        });
                        return;
                    else
                        v305();
                        return;
                    end;
                else
                    v303.userEligible = true;
                    v304();
                    return;
                end;
            end):andThen(function() --[[ Line: 1506 ]]
                -- upvalues: v303 (copy)
                return v303:requestMicPermission();
            end);
        end;
        return v303.canUseServicePromise;
    end;
end;
v96._setRecentUserState = function(v309, v310, v311) --[[ Line: 1513 ]] --[[ Name: _setRecentUserState ]]
    -- upvalues: v23 (copy)
    local v312 = v309.recentUsersInteractionData[tostring(v310)] or {};
    local v313 = v23.Dictionary.join(v312, v311);
    v309.recentUsersInteractionData = v23.Dictionary.join(v309.recentUsersInteractionData, {
        [tostring(v310)] = v313
    });
end;
v96.getRecentUsersInteractionData = function(v314) --[[ Line: 1523 ]] --[[ Name: getRecentUsersInteractionData ]]
    v314:_updateRecentUsersInteractionData();
    return v314.recentUsersInteractionData;
end;
v96.GetSignalREvent = function(v315, v316) --[[ Line: 1528 ]] --[[ Name: GetSignalREvent ]]
    return v315.SignalREventTable[v316].Event;
end;
v96.StartModerationSignal = function(v317) --[[ Line: 1533 ]] --[[ Name: StartModerationSignal ]]
    -- upvalues: v28 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy)
    if not v317.playerModeratedConnection then
        v317.playerModeratedConnection = v317:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ Line: 1536 ]]
            -- upvalues: v28 (ref), v317 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
            v28:debug("User Moderated");
            v317.previousSessionId = v317.service:GetSessionId();
            v317:emit("OnPlayerModerated");
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                l_VoiceChatService_0:notifyServerACSCleanup();
                l_VoiceChatService_0:leaveVoice();
                return;
            else
                l_VoiceChatService_0:notifyServerACSCleanup();
                v317.service:Leave();
                return;
            end;
        end);
    end;
end;
v96.StopModerationSignal = function(v318) --[[ Line: 1551 ]] --[[ Name: StopModerationSignal ]]
    if v318.playerModeratedConnection then
        v318.playerModeratedConnection:Disconnect();
        v318.playerModeratedConnection = nil;
    end;
end;
v96._updateRecentUsersInteractionData = function(v319) --[[ Line: 1558 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    -- upvalues: v34 (copy), v50 (copy), l_Players_0 (copy), v51 (copy), v23 (copy)
    local v320 = os.time();
    local v321 = {};
    if v319.recentUsersInteractionData then
        for v322, v323 in pairs(v319.recentUsersInteractionData) do
            local v324 = if v34 then v319.participants[tostring(v322)] else v319.participants[v322];
            local v325 = v50() and not l_Players_0:GetPlayerByUserId((tonumber(v322)));
            local v326 = v320 - v323.lastHeardTime >= v51();
            local v327 = not v324 or v324.isMuted;
            if v326 and v327 or v325 then
                v321[v322] = v23.None;
            end;
        end;
        v319.recentUsersInteractionData = v23.Dictionary.join(v319.recentUsersInteractionData, v321);
    end;
end;
v96.SetupParticipantListeners = function(v328) --[[ Line: 1582 ]] --[[ Name: SetupParticipantListeners ]]
    -- upvalues: v28 (copy), v50 (copy), v34 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v29 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v55 (copy), v72 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v67 (copy), v68 (copy), l_GetFFlagDisconnectToastClientRewrite_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v66 (copy), l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), v39 (copy), v43 (copy), v48 (copy), v49 (copy), v18 (copy), v92 (copy)
    v328:ensureInitialized("setup participant listeners");
    if not v328.participants then
        v328.participants = {};
        v328.recentUsersInteractionData = {};
        v328.updatedParticipants = {};
        v328.participantConnection = v328.service.ParticipantsStateChanged:Connect(function(v329, v330, v331) --[[ Line: 1591 ]]
            -- upvalues: v28 (ref), v50 (ref), v328 (copy), v34 (ref), l_Players_0 (ref), l_VoiceChatService_0 (ref), v29 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v55 (ref), v72 (ref)
            v28:trace("Participants state changed");
            for _, v333 in ipairs(v329) do
                if not v50() and not v328.participants[tostring(v333)].isMuted then
                    v328:_setRecentUserState(v333, {
                        lastHeardTime = os.time()
                    });
                end;
                v328.participants[tostring(v333)] = nil;
                v328.participantLeft:Fire(v328.participants, v333);
                v328:emit("OnVoiceParticipantRemoved", v333);
            end;
            for _, v335 in ipairs(v330) do
                v328.participantJoined:Fire(v328.participants, v335);
                v328:emit("OnVoiceParticipantAdded", v335);
            end;
            for _, v337 in pairs(v331) do
                local l_userId_0 = v337.userId;
                local v339 = if v34 then v328.participants[tostring(l_userId_0)] else v328.participants[l_userId_0];
                if not v337.isMuted or v339 and not v339.isMuted then
                    v328:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v339 or v339.isMuted ~= v337.isMuted then
                    v328:emit("OnVoiceParticipantToggleMuted", l_userId_0, v337.isMuted);
                end;
                if l_VoiceChatService_0.UseNewAudioApi and v29 then
                    v337.isMutedLocally = not not v328.mutedPlayers[l_userId_0];
                end;
                if l_VoiceChatService_0.UseNewAudioApi then
                    v337.isMutedLocally = if v328.mutedPlayers[l_userId_0] then not not v328.mutedPlayers[l_userId_0] else v337.isMutedLocally;
                end;
                if l_FFlagEnablePartyVoiceChangersInLua_0 and l_VoiceChatService_0.UseNewAudioApi then
                    v337.isVoiceChangerActive = if v328.voiceChangerActivePlayers[l_userId_0] then v328.voiceChangerActivePlayers[l_userId_0] else v337.isVoiceChangerActive;
                end;
                if v328.muteAll then
                    v337.isMutedLocally = true;
                end;
                v328.participants[tostring(l_userId_0)] = v337;
                if v55() then
                    v328.updatedParticipants[tostring(l_userId_0)] = v337;
                end;
                if v72 and v328.CaptureService:IsCapturingVideo() then
                    v328.voiceCapturedDuringVideoCapture = v328.voiceCapturedDuringVideoCapture or v337.isSignalActive;
                end;
            end;
            v328:_updateRecentUsersInteractionData();
            if v328.shouldThrottleParticipantUpdate then
                local v340 = tick();
                if v340 - v328.lastParticipantsStateUpdate >= v328.participantsStateThrottleTime and #v331 > 0 then
                    v328.lastParticipantsStateUpdate = v340;
                    v328.participantsUpdate:Fire(if v55() then v328.updatedParticipants else v328.participants);
                    v328.updatedParticipants = {};
                    return;
                elseif #v331 > 0 then
                    local v341 = v328.participantsStateThrottleTime - (v340 - v328.lastParticipantsStateUpdate);
                    v328.lastStateUpdateCounter = (v328.lastStateUpdateCounter + 1) % 100;
                    local l_lastStateUpdateCounter_0 = v328.lastStateUpdateCounter;
                    task.wait(v341);
                    if l_lastStateUpdateCounter_0 == v328.lastStateUpdateCounter then
                        v328.participantsUpdate:Fire(if v55() then v328.updatedParticipants else v328.participants);
                        v328.updatedParticipants = {};
                        return;
                    end;
                end;
            elseif #v331 > 0 then
                v328.participantsUpdate:Fire(if v55() then v328.updatedParticipants else v328.participants);
                v328.updatedParticipants = {};
            end;
        end);
        local function v350(v343, v344) --[[ Line: 1707 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v328 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v28 (ref), v67 (ref), v68 (ref), l_GetFFlagDisconnectToastClientRewrite_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
            v328:emit("OnStateChanged", v343, v344);
            local v345 = v344 == Enum.VoiceChatState.Failed;
            local v346 = v344 == Enum.VoiceChatState.Joining;
            local v347 = v344 == Enum.VoiceChatState.Leaving;
            local v348 = v344 == Enum.VoiceChatState.Ended;
            local v349 = v328.service:IsPublishPaused();
            if v349 ~= v328.localMuted and not v345 and not v346 and not v347 and not v348 then
                v328.localMuted = v349;
                v328.muteChanged:Fire(v349);
            elseif v346 or v347 or v348 then
                v328.localMuted = nil;
            end;
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() and v344 == Enum.VoiceChatState.Joined and v328.isInCall and v349 ~= v328.callMutedState then
                v28:debug("In call, setting local muted to call muted state {}", v328.callMutedState);
                v328:ToggleMic("InitInCall");
            end;
            if v67 and v344 == Enum.VoiceChatState.Joined then
                v328:StartModerationSignal();
            end;
            if v344 == Enum.VoiceChatState.Leaving then
                if not v68 or not v328.previousGroupId then
                    v328.previousGroupId = v328.service:GetGroupId();
                end;
                v328.previousMutedState = v328.service:IsPublishPaused();
            end;
            if v344 == Enum.VoiceChatState.Ended or v345 then
                v328.participants = {};
                v328.localMuted = nil;
                v328.participantsUpdate:Fire(v328.participants);
                if v67 then
                    v328:StopModerationSignal();
                end;
                if v345 then
                    v28:debug("State Changed to Failed. Reason: {}", v328.service:GetAndClearCallFailureMessage());
                end;
                if v343 == Enum.VoiceChatState.Joining or v343 == Enum.VoiceChatState.JoiningRetry or v343 == Enum.VoiceChatState.Joined then
                    if v344 == Enum.VoiceChatState.Ended then
                        v28:debug("State Changed to Ended from {}", v343);
                    end;
                    if not l_GetFFlagDisconnectToastClientRewrite_0() or not v328:IsSeamlessVoice() or v328:GetVoiceConnectCookieValue() then
                        v328:emit("OnRetryRequested");
                    end;
                end;
            end;
            if l_GetFFlagEnableVoiceSignal_0() and v328.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v344 == Enum.VoiceChatState.Joined then
                v328:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                v328:emit("OnVoiceJoin");
            end;
        end;
        if v328.service.VoiceChatState and v328.service.VoiceChatState == Enum.VoiceChatState.Joined then
            v28:debug("Joined voice chat {}", v328.service.VoiceChatState);
            v350(nil, Enum.VoiceChatState.Joined);
        end;
        v328.stateConnection = v328.service.StateChanged:Connect(v350);
        if v66 and l_VoiceChatService_0.UseNewAudioApi then
            if not v328.localMeteringTask then
                v328.localMeteringTask = task.spawn(function() --[[ Line: 1794 ]]
                    -- upvalues: v328 (copy)
                    while true do
                        v328:UpdateLocalMetering();
                        task.wait();
                    end;
                end);
            end;
        elseif v328.service:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 then
            v328.micConnection = v328.service.PlayerMicActivitySignalChange:Connect(function(v351) --[[ Line: 1803 ]]
                -- upvalues: v72 (ref), v328 (copy), l_GetFFlagLocalMutedNilFix_0 (ref), v39 (ref)
                if v72 and v328.CaptureService:IsCapturingVideo() then
                    v328.voiceCapturedDuringVideoCapture = v328.voiceCapturedDuringVideoCapture or v351.isActive;
                end;
                v328.isTalking = v351.isActive;
                if l_GetFFlagLocalMutedNilFix_0() then
                    if v328.localMuted == false then
                        if v39 then
                            v328:FireTalkingChangedDebounced(v328.isTalking);
                            return;
                        else
                            v328.talkingChanged:Fire(v328.isTalking);
                            return;
                        end;
                    end;
                elseif not v328.localMuted then
                    if v39 then
                        v328:FireTalkingChangedDebounced(v328.isTalking);
                        return;
                    else
                        v328.talkingChanged:Fire(v328.isTalking);
                    end;
                end;
            end);
        end;
        if v43() then
            v328:StartModerationSignal();
        elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
            v328.playerModeratedConnection = v328.service.LocalPlayerModerated:connect(function() --[[ Line: 1836 ]]
                -- upvalues: v28 (ref), v328 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
                v28:debug("User Moderated old");
                v328.previousSessionId = v328.service:GetSessionId();
                v328:emit("OnPlayerModerated");
                if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                    l_VoiceChatService_0:leaveVoice();
                    return;
                else
                    v328.service:Leave();
                    return;
                end;
            end);
        end;
        if v48() then
            v28:trace("Setting up voice nudge handlers");
            v328.voiceToxicityModalConnection = v328:GetSignalREvent("VoiceToxicityModal"):Connect(function(v352) --[[ Line: 1850 ]]
                -- upvalues: v328 (copy)
                v328.Analytics:reportReceivedNudge(v352, v328:GetNudgeAnalyticsData());
                v328:emit("OnVoiceToxicityModal");
            end);
            v328.VoiceToxicityToastConnection = v328:GetSignalREvent("VoiceToxicityToast"):Connect(function(v353) --[[ Line: 1856 ]]
                -- upvalues: v328 (copy)
                v328.Analytics:reportReceivedNudge(v353, v328:GetNudgeAnalyticsData());
                v328:emit("OnVoiceToxicityToast");
            end);
        end;
        if v49() then
            v28:trace("Setting up voice reverse nudge handlers");
            v328.voiceReverseNudgeConnection = v328:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(v354) --[[ Line: 1864 ]]
                -- upvalues: v328 (copy)
                v328:emit("OnVoiceReverseNudgeIconColorChange", v354);
            end);
        end;
        v328.blockConnection = v328.BlockStatusChanged:Connect(function(v355, v356) --[[ Line: 1869 ]]
            -- upvalues: v328 (copy), v28 (ref), v18 (ref)
            if v356 then
                if v328.participants[tostring(v355)] then
                    v28:debug("Blocking {}", v18.shorten(v355));
                    v328.service:SubscribeBlock(v355);
                    return;
                end;
            else
                v28:debug("UnBlocking {}", v18.shorten(v355));
                v328.service:SubscribeUnblock(v355);
            end;
        end);
        if l_VoiceChatService_0.UseNewAudioApi then
            v328:hookupAudioDeviceInputListener();
        end;
        if v328.service.TempSetMicMutedToggleMic then
            v328.tempSetMicMutedToggleMicConnection = v328.service.TempSetMicMutedToggleMic:connect(function() --[[ Line: 1887 ]]
                -- upvalues: v328 (copy)
                v328:ToggleMic("TempSetMicMutedToggleMic");
            end);
        end;
        if v72 then
            v328.videoCaptureInProgressConnection = v328.CaptureService.VideoCaptureInProgress:connect(function(v357) --[[ Line: 1894 ]]
                -- upvalues: v328 (copy), v92 (ref)
                if v357 then
                    v328.voiceCapturedDuringVideoCapture = false;
                    return;
                else
                    v328.TelemetryService:LogEvent(v92, {
                        customFields = {
                            voiceCaptured = v328.voiceCapturedDuringVideoCapture
                        }
                    });
                    return;
                end;
            end);
        end;
    end;
end;
local v358 = nil;
v96.CheckAudioInputExists = function(v359) --[[ Line: 1909 ]] --[[ Name: CheckAudioInputExists ]]
    -- upvalues: v28 (copy), v358 (ref), v22 (copy), v23 (copy)
    v28:trace("Checking for AudioDeviceInput");
    if not v358 then
        v358 = v22.new(function(v360, _) --[[ Line: 1912 ]]
            -- upvalues: v23 (ref), v359 (copy), v28 (ref)
            if #v23.Dictionary.keys(v359.audioDevices) > 0 then
                v28:trace("Found existing AudioDeviceInput");
                v360();
                return;
            else
                v359.audioDeviceInputAdded.Event:Connect(function() --[[ Line: 1917 ]]
                    -- upvalues: v28 (ref), v360 (copy)
                    v28:trace("Found new AudioDeviceInput");
                    v360();
                end);
                return;
            end;
        end);
    end;
    return v358;
end;
v96.checkAndUpdateSequence = function(v362, v363, v364) --[[ Line: 1927 ]] --[[ Name: checkAndUpdateSequence ]]
    if not v364 then
        return 0;
    elseif not v362.SequenceNumbers[v363] then
        v362.SequenceNumbers[v363] = v364;
        return 0;
    else
        local v365 = v364 - v362.SequenceNumbers[v363];
        if v365 > 0 then
            v362.SequenceNumbers[v363] = v364;
        end;
        return v365 - 1;
    end;
end;
v96.onInstanceAdded = function(v366, v367) --[[ Line: 1950 ]] --[[ Name: onInstanceAdded ]]
    -- upvalues: v28 (copy)
    if v367:IsA("AudioDeviceInput") then
        v28:debug("Found new audio device instance for {}", v367.Player and v367.Player.Name);
        v366.audioDevices[v367] = v366:CreateAudioDeviceData(v367);
        v366:emit("OnAudioDeviceInputAdded");
        v366:StartAnalysis(v367);
    end;
end;
v96.GetSendMuteEvent = function(v368) --[[ Line: 1960 ]] --[[ Name: GetSendMuteEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v368.SendMuteEvent then
        v368.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v368.SendMuteEvent;
end;
v96.GetToggleVoiceChangerEvent = function(v369) --[[ Line: 1967 ]] --[[ Name: GetToggleVoiceChangerEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v369.SendVoiceChangerEvent then
        v369.SendVoiceChangerEvent = l_ReplicatedStorage_0:WaitForChild("ToggleUserVoiceChanger", 10);
    end;
    return v369.SendVoiceChangerEvent;
end;
v96.GetInputToModifierWire = function(v370) --[[ Line: 1974 ]] --[[ Name: GetInputToModifierWire ]]
    -- upvalues: l_Players_0 (copy)
    if not v370.InputToModifierWire then
        v370.InputToModifierWire = l_Players_0.LocalPlayer:FindFirstChild("InputToModifier");
    end;
    return v370.InputToModifierWire;
end;
v96.GetPartyVoiceDeviceInput = function(v371) --[[ Line: 1981 ]] --[[ Name: GetPartyVoiceDeviceInput ]]
    -- upvalues: l_Players_0 (copy)
    if not v371.PartyVoiceDeviceInput then
        v371.PartyVoiceDeviceInput = l_Players_0.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput");
    end;
    return v371.PartyVoiceDeviceInput;
end;
v96.GetSetVoicePackEvent = function(v372) --[[ Line: 1989 ]] --[[ Name: GetSetVoicePackEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v372.SetVoicePackEvent then
        v372.SetVoicePackEvent = l_ReplicatedStorage_0:WaitForChild("SetVoicePack", 10);
    end;
    return v372.SetVoicePackEvent;
end;
v96.GetVoiceChangerWasToggledEvent = function(v373) --[[ Line: 1996 ]] --[[ Name: GetVoiceChangerWasToggledEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v373.VoiceChangerWasToggledEvent then
        v373.VoiceChangerWasToggledEvent = l_ReplicatedStorage_0:WaitForChild("VoiceChangerWasToggled", 3);
    end;
    return v373.VoiceChangerWasToggledEvent;
end;
local function _(v374, v375) --[[ Line: 2004 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v374;
    l_Wire_0.TargetInstance = v375;
    l_Wire_0.Parent = v375;
    return l_Wire_0;
end;
local function _() --[[ Line: 2013 ]] --[[ Name: GetAnalysisHost ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    return l_RobloxReplicatedStorage_0;
end;
v96.GetAnalyzer = function(_, v380) --[[ Line: 2017 ]] --[[ Name: GetAnalyzer ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v381 = v380.Name .. "_Analyzer";
    local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
    local l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = l_l_RobloxReplicatedStorage_0_0:FindFirstChild(v381);
    if not l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 then
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = Instance.new("AudioAnalyzer");
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.SpectrumEnabled = false;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Name = v381;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Parent = l_l_RobloxReplicatedStorage_0_0;
    end;
    return l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0;
end;
local function _(v384) --[[ Line: 2030 ]] --[[ Name: toDecibels ]]
    return math.log10(v384) * 20;
end;
v96.IsSignalActive = function(v386, v387) --[[ Line: 2034 ]] --[[ Name: IsSignalActive ]]
    -- upvalues: v66 (copy), l_Players_0 (copy)
    if not v66 then
        return false;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v387);
        if not l_l_Players_0_PlayerByUserId_0 then
            return false;
        else
            return math.log10(v386:GetAnalyzer(l_l_Players_0_PlayerByUserId_0).PeakLevel) * 20 > -36;
        end;
    end;
end;
v96.StopAnalysis = function(_, v390) --[[ Line: 2048 ]] --[[ Name: StopAnalysis ]]
    -- upvalues: v66 (copy), l_RobloxReplicatedStorage_0 (copy)
    if not v66 then
        return;
    else
        for _, v392 in v390:GetConnectedWires("Output") do
            local l_TargetInstance_0 = v392.TargetInstance;
            if l_TargetInstance_0 and l_TargetInstance_0:IsDescendantOf(l_RobloxReplicatedStorage_0) then
                v392:Destroy();
            end;
        end;
        return;
    end;
end;
v96.StartAnalysis = function(v394, v395) --[[ Line: 2064 ]] --[[ Name: StartAnalysis ]]
    -- upvalues: v66 (copy)
    if not v66 then
        return;
    else
        v394:StopAnalysis(v395);
        local l_Player_0 = v395.Player;
        if not l_Player_0 then
            return;
        else
            local l_v394_Analyzer_0 = v394:GetAnalyzer(l_Player_0);
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = v395;
            l_Wire_1.TargetInstance = l_v394_Analyzer_0;
            l_Wire_1.Parent = l_v394_Analyzer_0;
            return;
        end;
    end;
end;
v96.GetVoiceConnectCookie = function(v399) --[[ Line: 2078 ]] --[[ Name: GetVoiceConnectCookie ]]
    -- upvalues: v17 (copy)
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 2079 ]]
        -- upvalues: v399 (copy), v17 (ref)
        return v399.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
    end);
    if l_status_8 and l_result_8 then
        return l_result_8;
    else
        return "";
    end;
end;
v96.GetVoiceConnectCookieValue = function(v402) --[[ Line: 2090 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 2092 ]]
            -- upvalues: v402 (copy), v17 (ref)
            return v402.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
        end);
        if l_status_9 then
            return l_result_9 == "true";
        else
            return true;
        end;
    else
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2098 ]]
            -- upvalues: v402 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref)
            return v402.AppStorageService:GetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY);
        end);
        if l_status_10 then
            return l_result_10 == "true";
        else
            return true;
        end;
    end;
end;
v96.SetVoiceConnectCookieValue = function(v407, v408) --[[ Line: 2110 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        return (pcall(function() --[[ Line: 2112 ]]
            -- upvalues: v407 (copy), v17 (ref), v408 (copy)
            v407.AppStorageService:SetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(v408)));
            v407.AppStorageService:Flush();
        end));
    else
        return (pcall(function() --[[ Line: 2118 ]]
            -- upvalues: v407 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref), v408 (copy)
            v407.AppStorageService:SetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY, (tostring(v408)));
            v407.AppStorageService:Flush();
        end));
    end;
end;
v96.SetNewUserFTUXCookieValue = function(v409, v410) --[[ Line: 2131 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    -- upvalues: v17 (copy)
    return (pcall(function() --[[ Line: 2132 ]]
        -- upvalues: v409 (copy), v17 (ref), v410 (copy)
        v409.AppStorageService:SetItem(v17.SEAMLESS_VOICE_FTUX_KEY, (tostring(v410)));
        v409.AppStorageService:Flush();
    end));
end;
v96.SetAndSyncActive = function(v411, v412, v413) --[[ Line: 2139 ]] --[[ Name: SetAndSyncActive ]]
    -- upvalues: l_Players_0 (copy)
    v412.Active = v413;
    local l_v411_SendMuteEvent_0 = v411:GetSendMuteEvent();
    if l_v411_SendMuteEvent_0 and v412.Player == l_Players_0.LocalPlayer then
        l_v411_SendMuteEvent_0:FireServer(v413);
    end;
end;
v96.CreateAudioDeviceData = function(v415, v416) --[[ Line: 2148 ]] --[[ Name: CreateAudioDeviceData ]]
    -- upvalues: l_Players_0 (copy), l_game_EngineFeature_0 (copy), v32 (copy), v28 (copy), v33 (copy)
    local v417 = {};
    local v418 = v416.Player == l_Players_0.LocalPlayer;
    if l_game_EngineFeature_0 then
        if not v416.MutedByLocalUser then
            if v415.muteAll and not v418 then
                v416.MutedByLocalUser = true;
            end;
            if v416.Player and v415.mutedPlayers[v416.Player.UserId] then
                v416.MutedByLocalUser = true;
            end;
        end;
    elseif v416.Active then
        if v415.muteAll and not v418 then
            v416.Active = false;
        end;
        if v416.Player and v415.mutedPlayers[v416.Player.UserId] then
            v416.Active = false;
        end;
    end;
    if v32 and v416.Active and v418 and v415.localMuted == nil then
        v415:SetAndSyncActive(v416, false);
    end;
    if v418 and v415.localMuted ~= nil and v415.localMuted ~= not v416.Active and not v415.isInCall then
        v28:debug("Mismatch between LocalMuted and device.Active");
        local v419 = not v415.localMuted;
        v416.Active = v419;
        local l_v415_SendMuteEvent_0 = v415:GetSendMuteEvent();
        if l_v415_SendMuteEvent_0 then
            l_v415_SendMuteEvent_0:FireServer(v419);
        end;
    elseif v415.isInCall and v418 then
        local v421 = not v415.callMutedState;
        v28:debug("Overwriting Active State to match Iris call. .Active = {}", v421);
        v416.Active = v421;
        local l_v415_SendMuteEvent_1 = v415:GetSendMuteEvent();
        if l_v415_SendMuteEvent_1 then
            l_v415_SendMuteEvent_1:FireServer(v421);
        end;
    end;
    v417.onPlayerChanged = v416:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 2200 ]]
        -- upvalues: v33 (ref), v418 (ref), v416 (copy), l_Players_0 (ref), v32 (ref), v415 (copy), v28 (ref), l_game_EngineFeature_0 (ref)
        if v33 then
            v418 = v416.Player == l_Players_0.LocalPlayer;
            if v418 then
                if v32 and v416.Active and v415.localMuted == nil then
                    v415:SetAndSyncActive(v416, false);
                elseif v415.localMuted ~= nil and v415.localMuted ~= not v416.Active then
                    v28:debug("Mismatch between LocalMuted and device.Active");
                    v415:SetAndSyncActive(v416, not v415.localMuted);
                end;
            elseif v415.muteAll or v416.Player and v415.mutedPlayers[v416.Player.UserId] then
                if l_game_EngineFeature_0 then
                    v416.MutedByLocalUser = true;
                else
                    v416.Active = false;
                end;
            end;
        end;
        v415:emit("OnDevicePlayerChanged");
        v415:StartAnalysis(v416);
    end);
    v417.onMutedChanged = v416:GetPropertyChangedSignal("Muted"):Connect(function() --[[ Line: 2225 ]]
        -- upvalues: v415 (copy)
        v415:emit("OnDeviceMuteChanged");
    end);
    if not l_game_EngineFeature_0 then
        v417.onActiveChanged = v416:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 2230 ]]
            -- upvalues: v415 (copy), v418 (ref), v416 (copy)
            v415:emit("OnDeviceActiveChanged");
            if v415.muteAll and not v418 then
                v416.Active = false;
            end;
            if v416.Player and v415.mutedPlayers[v416.Player.UserId] then
                v416.Active = false;
            end;
        end);
    end;
    return v417;
end;
v96.onInstanceRemove = function(v423, v424) --[[ Line: 2244 ]] --[[ Name: onInstanceRemove ]]
    -- upvalues: v28 (copy), l_game_EngineFeature_0 (copy), v66 (copy)
    if v424:IsA("AudioDeviceInput") then
        v423:StopAnalysis(v424);
        v28:trace("Removing AudioDeviceInput {} {} {}", v424, "for user", v424.Player and v424.Player.UserId);
        local v425 = v423.audioDevices[v424];
        if v425 then
            if not l_game_EngineFeature_0 then
                v425.onActiveChanged:Disconnect();
            end;
            v425.onMutedChanged:Disconnect();
            v425.onPlayerChanged:Disconnect();
        end;
        v423.audioDevices[v424] = nil;
        v423:emit("OnAudioDeviceInputRemoved");
        if v66 and v424.Player then
            v423:GetAnalyzer(v424.Player):Destroy();
        end;
    end;
end;
v96.hookupAudioDeviceInputListener = function(v426) --[[ Line: 2265 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    -- upvalues: v28 (copy), l_Players_0 (copy), v31 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), l_CollectionService_0 (copy), v18 (copy)
    v28:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v31 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v428) --[[ Line: 2269 ]]
            -- upvalues: v426 (copy)
            v426:onInstanceAdded(v428);
        end);
    else
        game.DescendantAdded:Connect(function(v429) --[[ Line: 2273 ]]
            -- upvalues: v426 (copy)
            v426:onInstanceAdded(v429);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v28:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v426:onInstanceAdded(l_AudioDeviceInput_0);
    end;
    if l_VoiceChatService_0.EnableDefaultVoice then
        v28:debug("Creating default voice listener");
        if not game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
            local l_AudioListener_0 = Instance.new("AudioListener");
            l_AudioListener_0.Parent = workspace.CurrentCamera;
            local l_Wire_2 = Instance.new("Wire");
            l_Wire_2.Parent = l_AudioListener_0;
            local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_0.Parent = l_Wire_2;
            l_Wire_2.SourceInstance = l_AudioListener_0;
            l_Wire_2.TargetInstance = l_AudioDeviceOutput_0;
        end;
        for _, v435 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
            v18.destroyDefaultEmitter(v435);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v18.destroyDefaultEmitter);
        l_LocalPlayer_0.CharacterAdded:Connect(v18.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v18.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v436) --[[ Line: 2309 ]]
        -- upvalues: v426 (copy)
        v426:onInstanceRemove(v436);
    end);
    for _, v438 in game:GetDescendants() do
        v426:onInstanceAdded(v438);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v439) --[[ Line: 2318 ]]
        -- upvalues: v426 (copy)
        for v440 in v426.audioDevices do
            if v440.Player and v440.Player == v439 then
                v426:onInstanceRemove(v440);
            end;
        end;
    end);
end;
v96.RejoinCurrentChannel = function(v441) --[[ Line: 2328 ]] --[[ Name: RejoinCurrentChannel ]]
    -- upvalues: v46 (copy), v28 (copy)
    pcall(function() --[[ Line: 2329 ]]
        -- upvalues: v441 (copy), v46 (ref), v28 (ref)
        local l_GroupId_0 = v441.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v443 = v441.service:IsPublishPaused();
            v441.service:Leave();
            if v46() then
                v28:debug("Rejoining current channel {}", l_GroupId_0);
                v441.participants = {};
                v441.participantsUpdate:Fire(v441.participants);
            end;
            if not v441.service:JoinByGroupIdToken(l_GroupId_0, v443, true) then
                v441:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v96.RejoinChannel = function(v444, v445, v446) --[[ Line: 2348 ]] --[[ Name: RejoinChannel ]]
    -- upvalues: v28 (copy)
    v28:debug("Rejoining previous channel {} with mute status {}", v445, v446);
    if v445 and v445 ~= "" then
        pcall(function() --[[ Line: 2352 ]]
            -- upvalues: v444 (copy), v445 (copy), v446 (copy)
            v444.service:Leave();
            v444.participants = {};
            v444.participantsUpdate:Fire(v444.participants);
            if not v444.service:JoinByGroupIdToken(v445, v446, true) then
                v444:emit("OnInitialJoinFailed");
            end;
        end);
    end;
end;
v96.RejoinVoice = function(v447) --[[ Line: 2364 ]] --[[ Name: RejoinVoice ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v28 (copy), l_VoiceChatService_0 (copy)
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        v28:debug("Rejoining voice");
        v447.participants = {};
        v447.participantsUpdate:Fire(v447.participants);
        l_VoiceChatService_0:rejoinVoice();
    end;
end;
v96.watchSignalR = function(v448) --[[ Line: 2375 ]] --[[ Name: watchSignalR ]]
    -- upvalues: l_WATCHED_NAMESPACES_0 (copy), v18 (copy), v45 (copy), v28 (copy)
    v448.signalRConnection = v448.NotificationService.RobloxEventReceived:Connect(function(v449) --[[ Line: 2376 ]]
        -- upvalues: l_WATCHED_NAMESPACES_0 (ref), v18 (ref), v45 (ref), v448 (copy), v28 (ref)
        local l_namespace_0 = v449.namespace;
        if not l_WATCHED_NAMESPACES_0[l_namespace_0] then
            return;
        else
            local v451 = v18.jsonDecode(v449.detail);
            if v45() then
                local v452 = v448.SignalREventTable[v451.type];
                if v452 then
                    v452:Fire(v451);
                end;
            end;
            local l_SequenceNumber_0 = v451.SequenceNumber;
            v28:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v454 = v448:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v454 > 0 then
                v448.Analytics:reportReconnectDueToMissedSequence();
                return;
            else
                if v454 < -1 then
                    v448.Analytics:reportOutOfOrderSequence();
                end;
                return;
            end;
        end;
    end);
    v448.signalRConnectionChanged = v448.NotificationService.RobloxConnectionChanged:Connect(function(v455, v456, _, v458) --[[ Line: 2402 ]]
        -- upvalues: v28 (ref), v18 (ref), l_WATCHED_NAMESPACES_0 (ref), v448 (copy)
        if v455 == "signalR" then
            if v456 ~= Enum.ConnectionState.Connected then
                v28:info("SignalR disconnected");
                return;
            else
                for v459, v460 in pairs(v18.jsonDecode(v458)) do
                    if l_WATCHED_NAMESPACES_0[v459] then
                        v28:trace("SignalR message {}: {}", v459, v460);
                        local v461 = v448:checkAndUpdateSequence(v459, v460);
                        if v461 > 0 then
                            v448.Analytics:reportReconnectDueToMissedSequence();
                        elseif v461 < -1 then
                            v448.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v96.StopSignalRConnection = function(v462) --[[ Line: 2427 ]] --[[ Name: StopSignalRConnection ]]
    if v462.signalRConnectionChanged then
        v462.signalRConnectionChanged:Disconnect();
        v462.signalRConnectionChanged = nil;
    end;
    if v462.signalRConnection then
        v462.signalRConnection:Disconnect();
        v462.signalRConnection = nil;
    end;
end;
v96.getService = function(v463) --[[ Line: 2438 ]] --[[ Name: getService ]]
    return v463.service;
end;
v96.ToggleMic = function(v464, v465) --[[ Line: 2442 ]] --[[ Name: ToggleMic ]]
    -- upvalues: v28 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), l_PermissionsProtocol_0 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy)
    v464:ensureInitialized("toggle mic");
    if v464.localMuted == nil then
        v28:trace("ToggleMic context: {} - Voice not connected yet", v465);
        return;
    else
        v28:trace("ToggleMic context: {}", v465);
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if v464.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v28:debug("In pending mic mode, requesting permission");
                v464:emit("GetPermissions", function(v466) --[[ Line: 2455 ]]
                    -- upvalues: v464 (copy), l_PERMISSION_STATE_0 (ref), v28 (ref), v465 (copy)
                    v464.permissionState = if v466.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_AND_TALK else l_PERMISSION_STATE_0.LISTEN_ONLY;
                    v28:debug("Got permissions, setting state to {}", v464.permissionState);
                    v464:ToggleMic(v465);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return;
            elseif v464.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v28:debug("User tried to unmute despite being in listen only mode");
                v464:emit("OnPermissionRequested");
                return;
            end;
        end;
        if v464.isPlayerWatchingAd then
            v28:trace("User is watching an ad, skipping toggling mic");
            return;
        else
            if l_VoiceChatService_0.UseNewAudioApi then
                v464.localMuted = not v464.localMuted;
                local v467 = not v464.localMuted;
                v28:trace("Setting self mute to {} context: {}", v467, v465);
                local l_v464_SendMuteEvent_0 = v464:GetSendMuteEvent();
                if l_v464_SendMuteEvent_0 then
                    l_v464_SendMuteEvent_0:FireServer(v467);
                    for v469 in v464.audioDevices do
                        if v469.Player and v469.Player == l_Players_0.LocalPlayer then
                            v469.Active = v467;
                        end;
                    end;
                    v464.muteChanged:Fire(v464.localMuted);
                else
                    v28:error("Could not find SendMuteEvent");
                end;
            else
                local v470 = not v464.service:IsPublishPaused();
                v28:trace("Setting self mute to {} context: {}", v470, v465);
                v464.service:PublishPause(v470);
                v464.localMuted = v470;
                v464.muteChanged:Fire(v470);
            end;
            if not v464.localMuted then
                v464.talkingChanged:Fire(v464.isTalking);
                v464:emit("OnShowDataConsentToast");
            end;
            if v465 then
                v464.Analytics:reportVoiceMuteSelf((v464:JoinWithVoiceMuteData({
                    context = v465, 
                    muted = v464.localMuted
                })));
            end;
            return;
        end;
    end;
end;
v96.ToggleVoiceChanger = function(v471, _) --[[ Line: 2516 ]] --[[ Name: ToggleVoiceChanger ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v471:ensureInitialized("toggle voice changer");
    if v471.localMuted == nil then
        return;
    elseif l_VoiceChatService_0.UseNewAudioApi then
        v471.isVoiceChangerActive = not v471.isVoiceChangerActive;
        v28:trace("setting voice changer active to {}", v471.isVoiceChangerActive);
        local l_v471_ToggleVoiceChangerEvent_0 = v471:GetToggleVoiceChangerEvent();
        if l_v471_ToggleVoiceChangerEvent_0 then
            l_v471_ToggleVoiceChangerEvent_0:FireServer(v471.isVoiceChangerActive);
            v471.voiceChangerChanged:Fire(v471.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    else
        v471.isVoiceChangerActive = false;
        v28:trace("forcibly disabling voice changer since using old audio api", v471.isVoiceChangerActive);
        local l_v471_ToggleVoiceChangerEvent_1 = v471:GetToggleVoiceChangerEvent();
        if l_v471_ToggleVoiceChangerEvent_1 then
            l_v471_ToggleVoiceChangerEvent_1:FireServer(v471.isVoiceChangerActive);
            v471.voiceChangerChanged:Fire(v471.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    end;
end;
v96.ToggleVoiceChangerHearMyself = function(v475, _) --[[ Line: 2546 ]] --[[ Name: ToggleVoiceChangerHearMyself ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    if v475.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v475.isVoiceChangerHearMyselfActive = not v475.isVoiceChangerHearMyselfActive;
            local l_v475_InputToModifierWire_0 = v475:GetInputToModifierWire();
            local l_v475_PartyVoiceDeviceInput_0 = v475:GetPartyVoiceDeviceInput();
            if l_v475_InputToModifierWire_0 and l_v475_PartyVoiceDeviceInput_0 then
                v28:trace("setting voice changer hear myself active to {}", v475.isVoiceChangerHearMyselfActive);
                if v475.isVoiceChangerHearMyselfActive then
                    l_v475_InputToModifierWire_0.SourceInstance = l_v475_PartyVoiceDeviceInput_0;
                else
                    l_v475_InputToModifierWire_0.SourceInstance = nil;
                end;
                v475.voiceChangerHearMyselfChanged:Fire(v475.isVoiceChangerHearMyselfActive);
                return;
            else
                v28:error("Could not find InputToModifierWire or PartyVoiceDeviceInput");
            end;
        end;
        return;
    end;
end;
v96.SetVoicePack = function(v479, v480) --[[ Line: 2571 ]] --[[ Name: SetVoicePack ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v479:ensureInitialized("set voice pack");
    if v479.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v479.currentVoicePack = v480;
            v28:trace("setting current voice pack to {}", v479.currentVoicePack);
            local l_v479_SetVoicePackEvent_0 = v479:GetSetVoicePackEvent();
            if l_v479_SetVoicePackEvent_0 then
                l_v479_SetVoicePackEvent_0:FireServer("VoicePack_" .. v479.currentVoicePack);
                return;
            else
                v28:error("Could not find SetVoicePackEvent");
            end;
        end;
        return;
    end;
end;
v96.JoinWithVoiceMuteData = function(v482, v483) --[[ Line: 2590 ]] --[[ Name: JoinWithVoiceMuteData ]]
    -- upvalues: l_Players_0 (copy), v23 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return v23.Dictionary.join({
        userId = l_LocalPlayer_1.UserId, 
        clientSessionId = v482:GetSessionId(), 
        channelId = v482:GetChannelId()
    }, v483);
end;
v96._reportJoinFailed = function(v485, v486, v487) --[[ Line: 2599 ]] --[[ Name: _reportJoinFailed ]]
    -- upvalues: v44 (copy)
    if v44() then
        v485.Analytics:reportVoiceChatJoinResult(false, v486, v487);
    end;
    v485:emit("OnReportJoinFailed", v486);
end;
v96._asyncInit = function(v488) --[[ Line: 2606 ]] --[[ Name: _asyncInit ]]
    -- upvalues: v28 (copy), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy), v20 (copy), v22 (copy)
    v488:CheckCallState();
    return v488:canUseServiceAsync():andThen(function(_) --[[ Line: 2609 ]]
        -- upvalues: v28 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v488 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref), v20 (ref), v22 (ref)
        local v490 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v490 = "VoiceChatInternal";
            v28:debug("Using VoiceChatInternal");
        end;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 2615 ]]
            -- upvalues: v490 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v488 (ref)
            local l_game_Service_0 = game:GetService(v490);
            if l_game_Service_0 and (l_game_Service_0:GetVoiceChatApiVersion() < l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 or l_game_Service_0:IsContextVoiceEnabled()) then
                v488.voiceEnabled = true;
                v488.service = l_game_Service_0;
                v488:SetupParticipantListeners();
            end;
        end);
        if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            l_VoiceChatService_0:joinVoice();
            v28:debug("Starting Voice Chat Client Join Operation");
        else
            local l_VoiceChatService_1 = game:GetService("VoiceChatService");
            if l_VoiceChatService_1 then
                l_VoiceChatService_1:joinVoice();
                v28:debug("Starting Voice Chat Client Join Operation");
            end;
        end;
        if not l_status_11 then
            v28:warning("EnableVoiceChat flag is enabled but GetService panicked {}", l_result_11);
            v488:_reportJoinFailed("getServiceFailed", v20.ERROR);
            if v488.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_GET_SERVICE_FAILED"
                });
            else
                return v22.reject();
            end;
        elseif not v488.service then
            v28:debug("VoiceChatService is not set after init");
            v488:_reportJoinFailed("contextNotEnabled");
            if v488.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_CONTEXT_NOT_ENABLED"
                });
            else
                return v22.reject();
            end;
        else
            v488:emit("OnVoiceChatServiceInitialized");
            v488:watchSignalR();
            return v22.resolve();
        end;
    end);
end;
v96.UpdateLocalMetering = function(v495) --[[ Line: 2665 ]] --[[ Name: UpdateLocalMetering ]]
    -- upvalues: l_Players_0 (copy), v39 (copy)
    v495.isTalking = v495:IsSignalActive(l_Players_0.LocalPlayer.UserId);
    if v495.localMuted == false then
        if v39 then
            v495:FireTalkingChangedDebounced(v495.isTalking);
            return;
        else
            v495.talkingChanged:Fire(v495.isTalking);
        end;
    end;
end;
v96.FireTalkingChangedDebounced = function(v496, v497) --[[ Line: 2676 ]] --[[ Name: FireTalkingChangedDebounced ]]
    -- upvalues: v40 (copy)
    local l_v40_0 = v40;
    local v499 = tick() * 1000;
    if l_v40_0 < v499 - v496._lastTalkingChangedFireTime then
        v496._lastTalkingChangedFireTime = v499;
        v496.talkingChanged:Fire(v497);
    end;
end;
v96.asyncInit = function(v500) --[[ Line: 2686 ]] --[[ Name: asyncInit ]]
    -- upvalues: v28 (copy), v22 (copy), v30 (copy), l_HttpService_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v64 (copy), v17 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v34 (copy)
    if v500.service then
        v28:trace("Manager already initialized");
        return v22.resolve();
    else
        if not v500.initPromise then
            v500.initPromise = v500:_asyncInit();
            if v30 and not v500.LikelySpeakingUsersEvent then
                task.spawn(function() --[[ Line: 2698 ]]
                    -- upvalues: v500 (copy), v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref)
                    local l_v500_LikelySpeakingUsersEvent_0 = v500:GetLikelySpeakingUsersEvent();
                    if l_v500_LikelySpeakingUsersEvent_0 then
                        v28:trace("Connecting to likely speaking users");
                        l_v500_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v502) --[[ Line: 2702 ]]
                            -- upvalues: v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v500 (ref)
                            v28:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v502));
                            if l_GetFFlagShowLikelySpeakingBubbles_0() and v500:UserEligibleForLikelySpeakingBubbles() then
                                v500:emit("OnLikelySpeakingUsersUpdated", v502);
                            end;
                        end);
                    end;
                end);
            end;
            if v64 then
                v28:trace("Polling for likely speaking users");
                task.spawn(function() --[[ Line: 2716 ]]
                    -- upvalues: v500 (copy)
                    v500:SendLikelySpeakingPing();
                end);
            end;
            if v500.AdService then
                (function(v503) --[[ Line: 2722 ]] --[[ Name: setupRewardedAdMuting ]]
                    -- upvalues: v17 (ref)
                    local v504 = false;
                    v503.AdService.RewardedVideoAdStarted:Connect(function() --[[ Line: 2724 ]]
                        -- upvalues: v503 (copy), v504 (ref), v17 (ref)
                        if v503.localMuted == nil then
                            return;
                        else
                            v504 = v503.localMuted;
                            if not v503.localMuted then
                                v503:ToggleMic(v17.REWARDED_VIDEO_AD_STARTED);
                            end;
                            v503.isPlayerWatchingAd = true;
                            return;
                        end;
                    end);
                    v503.AdService.RewardedVideoAdEnded:Connect(function() --[[ Line: 2740 ]]
                        -- upvalues: v503 (copy), v504 (ref), v17 (ref)
                        if v503.localMuted == nil then
                            return;
                        else
                            v503.isPlayerWatchingAd = false;
                            if v504 ~= v503.localMuted then
                                v503:ToggleMic(v17.REWARDED_VIDEO_AD_ENDED);
                            end;
                            return;
                        end;
                    end);
                end)(v500);
            end;
            if l_FFlagEnablePartyVoiceChangersInLua_0 and not v500.voiceChangerWasToggledEvent then
                task.spawn(function() --[[ Line: 2760 ]]
                    -- upvalues: v500 (copy), v34 (ref)
                    local l_v500_VoiceChangerWasToggledEvent_0 = v500:GetVoiceChangerWasToggledEvent();
                    if l_v500_VoiceChangerWasToggledEvent_0 then
                        l_v500_VoiceChangerWasToggledEvent_0.OnClientEvent:Connect(function(v506, v507) --[[ Line: 2764 ]]
                            -- upvalues: v34 (ref), v500 (ref)
                            local v508 = if v34 then v500.participants[tostring(v506)] else v500.participants[v506];
                            if v508 then
                                v508.isVoiceChangerActive = v507;
                                v500.voiceChangerActivePlayers[v506] = v507;
                                v500.participantsUpdate:Fire(v500.participants);
                            end;
                        end);
                    end;
                end);
            end;
        end;
        return v500.initPromise;
    end;
end;
v96.GetLikelySpeakingUsersEvent = function(v509) --[[ Line: 2784 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v509.LikelySpeakingUsersEvent then
        v509.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v509.LikelySpeakingUsersEvent;
end;
v96.GetReceiveLikelySpeakingEvent = function(v510) --[[ Line: 2792 ]] --[[ Name: GetReceiveLikelySpeakingEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v510.ReceiveLikelySpeakingUsersEvent then
        v510.ReceiveLikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("ReceiveLikelySpeakingUsers", 3);
    end;
    return v510.ReceiveLikelySpeakingUsersEvent;
end;
v96.SendLikelySpeakingPing = function(v511) --[[ Line: 2800 ]] --[[ Name: SendLikelySpeakingPing ]]
    -- upvalues: v28 (copy)
    v511:FetchVoicePermissions();
    local l_v511_ReceiveLikelySpeakingEvent_0 = v511:GetReceiveLikelySpeakingEvent();
    if not l_v511_ReceiveLikelySpeakingEvent_0 or not v511:UserEligibleForLikelySpeakingBubbles() then
        v28:debug("Could not find likely speaking users event.");
        return;
    else
        v28:trace("Sending likely speaking user event");
        l_v511_ReceiveLikelySpeakingEvent_0:FireServer();
        return;
    end;
end;
v96.IsInitialized = function(v513) --[[ Line: 2811 ]] --[[ Name: IsInitialized ]]
    if v513.service then
        return true;
    else
        return false;
    end;
end;
v96.ensureInitialized = function(v514, v515) --[[ Line: 2815 ]] --[[ Name: ensureInitialized ]]
    if not v514.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v515 .. " before calling init");
    end;
end;
v96.GetSessionId = function(v516) --[[ Line: 2822 ]] --[[ Name: GetSessionId ]]
    v516:ensureInitialized("get session id");
    return v516.service:GetSessionId();
end;
v96.GetChannelId = function(v517) --[[ Line: 2827 ]] --[[ Name: GetChannelId ]]
    v517:ensureInitialized("get channel id");
    return v517.service:GetChannelId();
end;
v96.Disconnect = function(v518) --[[ Line: 2832 ]] --[[ Name: Disconnect ]]
    -- upvalues: v72 (copy)
    if v518.participantConnection then
        v518.participantConnection:Disconnect();
        v518.participantConnection = nil;
    end;
    if v518.stateConnection then
        v518.stateConnection:Disconnect();
        v518.stateConnection = nil;
    end;
    if v518.micConnection then
        v518.micConnection:Disconnect();
        v518.micConnection = nil;
    end;
    if v518.blockConnection then
        v518.blockConnection:Disconnect();
        v518.blockConnection = nil;
    end;
    if v518.playerModeratedConnection then
        v518.playerModeratedConnection:Disconnect();
        v518.playerModeratedConnection = nil;
    end;
    if v518.voiceToxicityModalConnection then
        v518.voiceToxicityModalConnection:Disconnect();
        v518.voiceToxicityModalConnection = nil;
    end;
    if v518.VoiceToxicityToastConnection then
        v518.VoiceToxicityToastConnection:Disconnect();
        v518.VoiceToxicityToastConnection = nil;
    end;
    if v518.voiceReverseNudgeConnection then
        v518.voiceReverseNudgeConnection:Disconnect();
        v518.voiceReverseNudgeConnection = nil;
    end;
    if v518.tempSetMicMutedToggleMicConnection then
        v518.tempSetMicMutedToggleMicConnection:Disconnect();
        v518.tempSetMicMutedToggleMicConnection = nil;
    end;
    if v72 and v518.videoCaptureInProgressConnection then
        v518.videoCaptureInProgressConnection:Disconnect();
        v518.videoCaptureInProgressConnection = nil;
    end;
end;
v96.RequestHidePublicVoiceUI = function(v519) --[[ Line: 2883 ]] --[[ Name: RequestHidePublicVoiceUI ]]
    task.defer(function() --[[ Line: 2884 ]]
        -- upvalues: v519 (copy)
        v519.setVoiceUIVisibility:Fire(false);
    end);
end;
v96.RequestShowPublicVoiceUI = function(v520) --[[ Line: 2889 ]] --[[ Name: RequestShowPublicVoiceUI ]]
    task.defer(function() --[[ Line: 2890 ]]
        -- upvalues: v520 (copy)
        v520.setVoiceUIVisibility:Fire(true);
    end);
end;
v96.default = v96.new(v27:GetAfterBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0, nil, nil, nil, nil, nil, l_ThirdPartyUserService_0, nil, l_AdService_0);
return v96;