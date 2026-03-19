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
local v55 = require(l_Parent_0.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v56 = require(l_Flags_0.GetFFlagBatchVoiceParticipantsUpdates);
local v57 = require(l_Flags_0.GetFIntThrottleParticipantsUpdateMs);
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local l_GetFFlagNonVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagNonVoiceFTUX;
local v60 = require(l_Flags_0.GetFFlagEnableFtuxExitOnMuteToggle);
local v61 = require(l_Flags_0.GetFFlagEnableExpJoinMicPermAnalytics);
local v62 = require(l_Flags_0.GetFFlagEnableSeamlessVoiceFeature);
local v63 = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance");
local v64 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v65 = game:DefineFastFlag("PollLikelySpeakingV2", false);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_Parent_0.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local v67 = require(l_Flags_0.GetFFlagEmitVoiceRejoinStatus);
local v68 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering2", false);
local v69 = game:DefineFastFlag("StopModerationConnectionOnLeave", false);
local v70 = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_game_EngineFeature_1 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local v74 = v41 and l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0();
local l_GetFFlagEnableVoiceSignal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceSignal;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_Parent_0.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagCheckUniversePlaceBeforeSuspending_0 = require(l_Parent_0.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
local l_GetFFlagDisconnectToastClientRewrite_0 = require(l_Parent_0.SharedFlags).GetFFlagDisconnectToastClientRewrite;
local l_GetFFlagEnableVrVoiceParity_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVrVoiceParity;
local l_FFlagEnablePartyVoiceChangersInLua_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyVoiceChangersInLua;
local l_GetFFlagPartyVoiceMuteScopeFix_0 = require(l_Parent_0.SharedFlags).GetFFlagPartyVoiceMuteScopeFix;
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
local v94 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v95 = require(l_Requests_0.GetShowPhoneVerificationUpsell);
local v96 = {
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
local v97 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v98 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v99 = if v74 then game:GetService("TelemetryService") else nil;
local v100 = {
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
    AvatarChatService = v97, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    ThirdPartyUserService = l_ThirdPartyUserService_0, 
    CaptureService = v98, 
    TelemetryService = v99, 
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
v100.__index = v100;
v100.new = function(v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111) --[[ Line: 307 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v20 (copy), l_AppStorageService_0 (copy), v100 (copy), v45 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v57 (copy), l_Players_1 (copy), v28 (copy), l_IXPServiceWrapper_0 (copy), v63 (copy), v64 (copy)
    local v112 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v103, 
        eventEmitter = v18.EventEmitter.new(), 
        service = v104, 
        PermissionsService = v102, 
        NotificationService = v106, 
        AvatarChatService = v107, 
        Analytics = v20.new(v105), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v101, 
        AppStorageService = v108 or l_AppStorageService_0, 
        ThirdPartyUserService = v109, 
        CaptureService = v110, 
        AdService = v111
    }, v100);
    if v45() then
        for _, v114 in l_WATCHED_MESSAGE_TYPES_0 do
            v112.SignalREventTable[v114] = Instance.new("BindableEvent");
        end;
    end;
    v112.shouldThrottleParticipantUpdate = false;
    v112.participantsStateThrottleTime = 0;
    v112.lastParticipantsStateUpdate = 0;
    v112.lastStateUpdateCounter = 0;
    if v57() > 0 then
        task.spawn(function() --[[ Line: 351 ]]
            -- upvalues: l_Players_1 (ref), v104 (copy), v28 (ref), l_IXPServiceWrapper_0 (ref), v63 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 352 ]]
                -- upvalues: l_Players_1 (ref), v104 (ref)
                if l_Players_1.LocalPlayer then
                    return v104:IsVoiceEnabledForUserIdAsync(l_Players_1.LocalPlayer.UserId);
                else
                    return false;
                end;
            end);
            if not l_status_0 then
                v28:debug("Unable to get voice enabled status: ", l_result_0);
                return;
            else
                if l_result_0 then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v63);
                end;
                return;
            end;
        end);
        v112.participantsStateThrottleTime = v57() / 1000;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 368 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v63 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v63);
        end);
        if l_status_1 and l_result_1 and l_result_1[v64] then
            v112.shouldThrottleParticipantUpdate = true;
        end;
    end;
    return v112;
end;
v100.emit = function(v119, v120, ...) --[[ Line: 379 ]] --[[ Name: emit ]]
    v119.eventEmitter:emit(v120, ...);
end;
v100.subscribe = function(v121, v122, v123) --[[ Line: 383 ]] --[[ Name: subscribe ]]
    v121.eventEmitter:addListener(v122, v123);
end;
v100.unsubscribeAll = function(v124) --[[ Line: 387 ]] --[[ Name: unsubscribeAll ]]
    v124.eventEmitter:removeAllListeners();
end;
v100.CheckCallStateWithPromise = function(v125) --[[ Line: 391 ]] --[[ Name: CheckCallStateWithPromise ]]
    -- upvalues: l_default_0 (copy), v28 (copy), l_Enums_0 (copy)
    return l_default_0:getCallState():andThen(function(v126) --[[ Line: 393 ]]
        -- upvalues: v28 (ref), l_Enums_0 (ref), v125 (copy)
        v28:trace("Got user call state");
        if v126.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v126.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
            v125.isInCall = true;
            v125.callMutedState = v126.muted;
            v28:trace("Changing call muted state to {}", v126.muted);
        end;
    end):catch(function(v127) --[[ Line: 405 ]]
        -- upvalues: v28 (ref)
        v28:trace("User not in call {}", v127);
    end);
end;
v100.CheckCallState = function(v128) --[[ Line: 411 ]] --[[ Name: CheckCallState ]]
    -- upvalues: v28 (copy), l_default_0 (copy), l_Enums_0 (copy)
    v28:trace("Checking user call state");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 413 ]]
        -- upvalues: l_default_0 (ref), v28 (ref), l_Enums_0 (ref), v128 (copy)
        l_default_0:getCallState():andThen(function(v129) --[[ Line: 415 ]]
            -- upvalues: v28 (ref), l_Enums_0 (ref), v128 (ref)
            v28:trace("Got user call state");
            if v129.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v129.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v128.isInCall = true;
                v128.callMutedState = v129.muted;
                v28:trace("Changing call muted state to {}", v129.muted);
            end;
        end):catch(function(v130) --[[ Line: 427 ]]
            -- upvalues: v28 (ref)
            v28:trace("User not in call {}", v130);
        end);
    end);
    if not l_status_2 then
        v28:debug("Error checking user call state {}", l_result_2);
    end;
end;
v100._GetShowAgeVerificationOverlay = function(v133, v134) --[[ Line: 446 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: v94 (copy), v18 (copy)
    return v94(v18.bind(v133, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), v134);
end;
v100.FetchAgeVerificationOverlay = function(v135, v136) --[[ Line: 455 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: v22 (copy)
    if not v135._getShowAgeVerificationOverlayResult then
        if not v135._getShowAgeVerificationOverlayPromise then
            v135._getShowAgeVerificationOverlayPromise = v22.new(function(v137, _) --[[ Line: 458 ]]
                -- upvalues: v135 (copy), v136 (copy)
                v135._getShowAgeVerificationOverlayResult = v135:_GetShowAgeVerificationOverlay(v136);
                v137(v135._getShowAgeVerificationOverlayResult);
            end);
        end;
        v135._getShowAgeVerificationOverlayPromise:await();
    end;
    return v135._getShowAgeVerificationOverlayResult;
end;
v100._GetShowPhoneVerificationUpsell = function(v139, v140, v141) --[[ Line: 474 ]] --[[ Name: _GetShowPhoneVerificationUpsell ]]
    -- upvalues: v95 (copy), v18 (copy)
    return (v95(v18.bind(v139, "GetRequest"), tostring(game.GameId), v140, v141));
end;
v100.FetchPhoneVerificationUpsell = function(v142, v143, v144, v145) --[[ Line: 487 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    -- upvalues: v22 (copy), v17 (copy)
    if not v142._getShowPhoneVerificationUpsellResult then
        v142._getShowPhoneVerificationUpsellResult = {};
        v142._getShowPhoneVerificationUpsellPromise = {};
    end;
    if not v142._getShowPhoneVerificationUpsellResult[v143] or v145 then
        if not v142._getShowPhoneVerificationUpsellPromise[v143] or v145 then
            v142._getShowPhoneVerificationUpsellPromise[v143] = v22.new(function(v146, _) --[[ Line: 498 ]]
                -- upvalues: v142 (copy), v143 (copy), v144 (copy), v17 (ref)
                local v148 = v142:_GetShowPhoneVerificationUpsell(v143, v144);
                v142._getShowPhoneVerificationUpsellResult[v143] = if type(v148) == "table" and v148.valueProp ~= nil then v148.valueProp else v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
                v146();
            end);
        end;
        v142._getShowPhoneVerificationUpsellPromise[v143]:await();
    end;
    return v142._getShowPhoneVerificationUpsellResult[v143];
end;
v100.DisablePhoneVerificationUpsell = function(v149) --[[ Line: 512 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    -- upvalues: v23 (copy), v17 (copy)
    v149._getShowPhoneVerificationUpsellResult = v23.Dictionary.map(v149._getShowPhoneVerificationUpsellResult, function() --[[ Line: 515 ]]
        -- upvalues: v17 (ref)
        return v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
    end);
end;
v100.GetNudgeAnalyticsData = function(v150) --[[ Line: 521 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v150:GetSessionId();
end;
v100.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v151, v152) --[[ Line: 526 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v153 = {
        isUniverseEnabledForVoice = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UniverseAudio), 
        isPlaceEnabledForVoice = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.PlaceAudio), 
        isUniverseEnabledForAvatarVideo = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UniverseVideo), 
        isPlaceEnabledForAvatarVideo = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.PlaceVideo)
    };
    local v154 = {
        isUserEligible = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserAudioEligible), 
        isVoiceEnabled = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserAudio), 
        isAvatarVideoEligible = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserVideoEligible), 
        isAvatarVideoEnabled = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserVideo), 
        isUserVerifiedForVoice = if l_GetFFlagEnableVoiceSignal_0() then v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil, 
        isBanned = v151.AvatarChatService:IsEnabled(v152, Enum.AvatarChatServiceFeature.UserBanned), 
        bannedUntil = nil
    };
    return {
        universePlaceVoiceEnabledSettings = v153, 
        voiceSettings = v154
    };
end;
v100.resolveAvatarChatUserAndPlaceSettings = function(v155) --[[ Line: 573 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    local l_status_3, l_result_3 = pcall(v155.AvatarChatService.GetClientFeaturesAsync, v155.AvatarChatService);
    if not l_status_3 then
        return nil;
    else
        return v155:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_3);
    end;
end;
v100.GetRequest = function(v158, v159, _) --[[ Line: 583 ]] --[[ Name: GetRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 584 ]]
        -- upvalues: v158 (copy), v159 (copy), l_HttpService_0 (ref)
        local l_AsyncFullUrl_0 = v158.HttpRbxApiService:GetAsyncFullUrl(v159, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_AsyncFullUrl_0);
    end);
    return l_status_4 and l_result_4;
end;
v100.PostUserVoiceConnectionStatus = function(v164, v165) --[[ Line: 592 ]] --[[ Name: PostUserVoiceConnectionStatus ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    local l_status_5, _ = pcall(function() --[[ Line: 593 ]]
        -- upvalues: l_HttpService_0 (ref), v165 (copy), v164 (copy), v17 (ref)
        local v166 = l_HttpService_0:JSONEncode({
            IsUserVoiceConnected = v165
        });
        local v167 = v164.HttpRbxApiService:PostAsyncFullUrl(v17.VOICE_URL .. "/v1/user-voice-connection-state", v166);
        return l_HttpService_0:JSONDecode(v167);
    end);
    return l_status_5;
end;
v100.GetVoiceAnalyticsData = function(v170) --[[ Line: 602 ]] --[[ Name: GetVoiceAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_RbxAnalyticsService_0 (copy)
    return {
        universeId = game.GameId, 
        placeId = game.PlaceId, 
        playSessionId = if l_game_EngineFeature_1 then l_RbxAnalyticsService_0:GetPlaySessionId() else "", 
        voiceSessionId = if v170.service then v170:GetSessionId() else "", 
        micAvailability = ""
    };
end;
v100.RecordExperienceJoinMicPermissionStatus = function(v171, v172) --[[ Line: 614 ]] --[[ Name: RecordExperienceJoinMicPermissionStatus ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), l_PERMISSION_STATE_0 (copy)
    local l_v171_VoiceAnalyticsData_0 = v171:GetVoiceAnalyticsData();
    if v172 ~= nil and typeof(v172) == "table" then
        if v172.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
            l_v171_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v171_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    elseif v171.permissionState then
        if v171.permissionState == l_PERMISSION_STATE_0.LISTEN_AND_TALK then
            l_v171_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v171_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    end;
    v171.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", l_v171_VoiceAnalyticsData_0);
end;
v100.CheckCaptureMute = function(v174) --[[ Line: 634 ]] --[[ Name: CheckCaptureMute ]]
    -- upvalues: l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy)
    if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then
        return v174.CaptureService:IsCapturingVideo();
    else
        return false;
    end;
end;
v100.ToggleMuteSome = function(v175, v176, v177, v178, v179) --[[ Line: 643 ]] --[[ Name: ToggleMuteSome ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v175:ensureInitialized("mute some players");
    v175._mutedAnyone = true;
    local v180 = {};
    v177 = v177 or v175:CheckCaptureMute();
    for _, v182 in v176 do
        if l_VoiceChatService_0.UseNewAudioApi then
            v180[v182] = true;
            v175.mutedPlayers[v182] = v177;
        else
            v175.service:SubscribePause(v182, v177);
        end;
        local v183 = v175.participants[tostring(v182)];
        if v183 then
            v183.isMutedLocally = v177;
            v175.participantsUpdate:Fire(v175.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v184 in v175.audioDevices do
            if v184.Player and v180[v184.Player.UserId] then
                if l_game_EngineFeature_0 and v184.Player ~= l_Players_0.LocalPlayer then
                    v184.MutedByLocalUser = v177;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    v184.Active = not v177;
                end;
            end;
        end;
    end;
    if v178 and v179 then
        v175.Analytics:reportVoiceMuteGroup((v175:JoinWithVoiceMuteData({
            groupType = v178, 
            context = v179, 
            muted = v177
        })));
    end;
end;
v100.GetMutedAnyone = function(v185) --[[ Line: 688 ]] --[[ Name: GetMutedAnyone ]]
    return v185._mutedAnyone;
end;
v100.ToggleMutePlayer = function(v186, v187, v188) --[[ Line: 692 ]] --[[ Name: ToggleMutePlayer ]]
    -- upvalues: l_VoiceChatService_0 (copy), v29 (copy), v28 (copy), v18 (copy), v60 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v186:ensureInitialized("mute player " .. v187);
    v186._mutedAnyone = true;
    local v189 = (if l_VoiceChatService_0.UseNewAudioApi and v29 then not v186.mutedPlayers[v187] else not v186.service:IsSubscribePaused(v187)) or v186:CheckCaptureMute();
    v28:trace("Setting mute for {} to {}", v18.shorten(v187), v189);
    if v60() then
        v186.onPlayerMuteToggled:Fire();
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        v186.mutedPlayers[v187] = v189;
        for v190 in v186.audioDevices do
            if v190.Player and v190.Player.UserId == v187 then
                if l_game_EngineFeature_0 and v190.Player ~= l_Players_0.LocalPlayer then
                    v190.MutedByLocalUser = v189;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    local v191 = v186.participants[tostring(v187)];
                    local v192 = v191 and not v191.isMuted;
                    v190.Active = not v189 and v192;
                end;
            end;
        end;
        v186:emit("OnPlayerMuted");
    else
        v186.service:SubscribePause(v187, v189);
    end;
    for _, v194 in pairs(v186.participants) do
        if v194.userId == v187 then
            v194.isMutedLocally = v189;
            v186.participantsUpdate:Fire(v186.participants);
        end;
    end;
    if v188 then
        v186.Analytics:reportVoiceMuteIndividual((v186:JoinWithVoiceMuteData({
            targetUserId = tonumber(v187), 
            context = v188, 
            muted = v189
        })));
    end;
end;
v100.MuteAll = function(v195, v196, v197) --[[ Line: 746 ]] --[[ Name: MuteAll ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v28 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v17 (copy)
    v195:ensureInitialized("mute all");
    v195._mutedAnyone = true;
    v196 = v196 or v195:CheckCaptureMute();
    if l_VoiceChatService_0.UseNewAudioApi then
        v195.muteAll = v196;
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("Setting self mute all to {} context: {}", v196, v197);
        else
            v28:trace("Setting self mute all to {}", v196);
        end;
        for v198 in v195.audioDevices do
            if v198.Player and v198.Player ~= l_Players_0.LocalPlayer then
                v28:debug("Local muting {} to '{} = {}'", v198.Player.Name, v198.Active, v196);
                if l_game_EngineFeature_0 then
                    v198.MutedByLocalUser = v196;
                else
                    local l_UserId_0 = v198.Player.UserId;
                    v195.mutedPlayers[l_UserId_0] = v196;
                    local v200 = v195.participants[tostring(l_UserId_0)];
                    local v201 = v200 and not v200.isMuted;
                    v198.Active = not v196 and v201;
                end;
            end;
        end;
    else
        v195.service:SubscribePauseAll(v196);
    end;
    for _, v203 in pairs(v195.participants) do
        v203.isMutedLocally = v196;
        v195.participantsUpdate:Fire(v195.participants);
    end;
    v195.muteAllChanged:Fire(v196);
    if v197 then
        v195.Analytics:reportVoiceMuteGroup((v195:JoinWithVoiceMuteData({
            groupType = v17.VOICE_GROUP_TYPE.ALL, 
            context = v197, 
            muted = v196
        })));
    end;
end;
v100.FetchVoicePermissions = function(v204) --[[ Line: 793 ]] --[[ Name: FetchVoicePermissions ]]
    if not v204.communicationPermissionsResult then
        v204.communicationPermissionsResult = v204:resolveAvatarChatUserAndPlaceSettings();
    end;
    return v204.communicationPermissionsResult;
end;
v100.verifyUniverseAndPlaceCanUseVoice = function(v205) --[[ Line: 801 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v20 (copy)
    local v206 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v205:resolveAvatarChatUserAndPlaceSettings() else v205:FetchAgeVerificationOverlay();
    if not v206 then
        v205:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_0 = v206.universePlaceVoiceEnabledSettings;
        return l_universePlaceVoiceEnabledSettings_0 and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice and l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice;
    end;
end;
v100.IsUserInFTUX = function(v208) --[[ Line: 821 ]] --[[ Name: IsUserInFTUX ]]
    -- upvalues: l_GetFFlagSeamlessVoiceFTUX_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v28 (copy)
    if not l_GetFFlagSeamlessVoiceFTUX_0() then
        return false;
    elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v208:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local l_AppStorageService_1 = game:GetService("AppStorageService");
        local v210 = nil;
        if not pcall(function() --[[ Line: 831 ]]
            -- upvalues: l_AppStorageService_1 (copy), v210 (ref)
            v210 = l_AppStorageService_1:GetItem("SeamlessVoiceFTUX") == "true";
        end) then
            v28:warning("Failed to read FTUX/STUX from AppStorage");
            return false;
        else
            local v211 = v208:FetchAgeVerificationOverlay();
            if type(v211) == "table" and v211.voiceSettings and v211.voiceSettings.seamlessVoiceStatus ~= 3 then
                v28:debug("User not eligible for FTUX/STUX");
                return false;
            else
                return not v210;
            end;
        end;
    end;
end;
v100.isEnableDefaultVoiceOnForPlace = function(_) --[[ Line: 854 ]] --[[ Name: isEnableDefaultVoiceOnForPlace ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    return l_VoiceChatService_0.UseNewAudioApi or l_VoiceChatService_0.EnableDefaultVoice;
end;
v100.verifyPlaceCanUseVoice = function(v213, v214, v215) --[[ Line: 865 ]] --[[ Name: verifyPlaceCanUseVoice ]]
    -- upvalues: v20 (copy)
    if not v214 or not v215 then
        v213:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    elseif not v214.isUniverseEnabledForVoice then
        v213:_reportJoinFailed("universeNotEnabled");
        return false;
    else
        v213:emit("OnUserAndPlaceCanUseVoiceResolved", v215, v214);
        if not v214.isPlaceEnabledForVoice then
            v213:_reportJoinFailed("placeNotEnabled");
            return false;
        elseif not v213:isEnableDefaultVoiceOnForPlace() then
            return false;
        else
            return true;
        end;
    end;
end;
v100.EligibleForFaeUpsell = function(v216) --[[ Line: 890 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_FAE_ENABLED_0 (copy)
    local v217 = v216:FetchAgeVerificationOverlay();
    if not v217 or type(v217) ~= "table" then
        return false;
    else
        local v218 = v217.inExperienceFaeUpsell == l_FAE_ENABLED_0;
        local l_isPlaceEnabledForVoice_0 = v217.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        return v218 and l_isPlaceEnabledForVoice_0;
    end;
end;
v100.OptUserToJoinVoice = function(v220) --[[ Line: 900 ]] --[[ Name: OptUserToJoinVoice ]]
    -- upvalues: v28 (copy)
    v28:debug("Opting user to join voice on age verification");
    v220.hasOptedToJoinVoiceOnAgeVerification = true;
end;
v100.SetupFAECompleteListener = function(v221) --[[ Line: 905 ]] --[[ Name: SetupFAECompleteListener ]]
    -- upvalues: v28 (copy)
    v28:debug("Setting up FAE complete listener");
    if game:GetEngineFeature("ChatReconcileAccess") then
        v28:debug("Using ChatService ReconcileCommunicationAccessCompleted event");
        v221.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ Line: 909 ]]
            -- upvalues: v28 (ref), v221 (copy)
            v28:debug("FAE complete listener triggered, re-fetching voice permissions");
            v221.communicationPermissionsResult = nil;
            v221:FetchVoicePermissions();
            v221._getShowAgeVerificationOverlayResult = v221:_GetShowAgeVerificationOverlay();
            if v221.hasOptedToJoinVoiceOnAgeVerification then
                v28:debug("FAE complete listener triggered, attempting voice rejoin");
                if v221:IsSeamlessVoice() then
                    v28:debug("Opting-in user to voice");
                    v221.AvatarChatService:EnableVoice();
                    v221.attemptVoiceRejoin:Fire();
                end;
            end;
        end);
    end;
end;
v100.EligibleForAgeCheckToast = function(v222) --[[ Line: 929 ]] --[[ Name: EligibleForAgeCheckToast ]]
    -- upvalues: l_FAE_SETTINGS_TOAST_0 (copy)
    local v223 = v222:FetchAgeVerificationOverlay();
    if not v223 or type(v223) ~= "table" then
        return false;
    else
        local l_isPlaceEnabledForVoice_1 = v223.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        local v225 = v223.inExperienceFaeUpsell == l_FAE_SETTINGS_TOAST_0;
        return l_isPlaceEnabledForVoice_1 and v222:isEnableDefaultVoiceOnForPlace() and v225;
    end;
end;
v100.userAndPlaceCanUseVoice = function(v226) --[[ Line: 939 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v94 (copy), v18 (copy), v20 (copy), v28 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy)
    if v226.ThirdPartyUserService ~= nil and v226.ThirdPartyUserService:IsChatRestrictionSupported() and v226.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
        return false;
    else
        local v227 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v226:resolveAvatarChatUserAndPlaceSettings() else v94(v18.bind(v226, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
        if not v227 then
            v226:_reportJoinFailed("invalidResponse", v20.ERROR);
            return false;
        else
            if v226.options.forceVoiceEnabled then
                v227.voiceSettings.isVoiceEnabled = true;
                v28:debug("bypassing voice permissions check");
            end;
            local l_universePlaceVoiceEnabledSettings_1 = v227.universePlaceVoiceEnabledSettings;
            local l_voiceSettings_0 = v227.voiceSettings;
            v28:trace("Voice settings endpoint returned {}", v227);
            if not v226:verifyPlaceCanUseVoice(l_universePlaceVoiceEnabledSettings_1, l_voiceSettings_0) then
                return false;
            else
                if l_GetFFlagEnableVoiceSignal_0() then
                    v226.communicationPermissionsResult = v227;
                    local v230 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and os.time();
                    local v231 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v226:UserVoiceEnabled() and not l_voiceSettings_0.isUserVerifiedForVoice and (v226:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v230 and v226:FetchPhoneVerificationUpsell(v17.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v230) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat);
                    if v226:UserEligibleForInExperienceUpsell() or v231 then
                        v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                    end;
                    if l_GetFFlagEnableVoiceUxUpdates_0() then
                        local l_v226_VoiceConnectCookie_0 = v226:GetVoiceConnectCookie();
                        local v233 = v226:HasSeamlessVoiceFeature(v17.SeamlessVoiceFeatures.DeferConnection) and l_v226_VoiceConnectCookie_0 == "";
                        local v234 = v226:IsSeamlessVoice() and l_v226_VoiceConnectCookie_0 == "false";
                        if v233 or v234 then
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v226:EligibleForFaeUpsell() then
                            v28:debug("Suspending voice join for FAE Eligible user");
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                            v226:SetupFAECompleteListener();
                        end;
                    else
                        if l_GetFFlagNonVoiceFTUX_0() and v226:IsUserInFTUX() then
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                        if v226:IsSeamlessVoice() and not v226:GetVoiceConnectCookieValue() then
                            v28:debug("Suspending voice join due to voice connect cookie");
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v226:IsNewSeamlessVoiceUserDisconnect() then
                            v28:debug("Suspending voice join for new seamless voice user");
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v226:IsSeamlessVoice() and v226:UserOnlyEligibleForVoice() then
                            v28:debug("Suspending voice join for opt-out user");
                            v226:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                    end;
                    task.spawn(function() --[[ Line: 1036 ]]
                        -- upvalues: v226 (copy)
                        v226:FetchAgeVerificationOverlay();
                    end);
                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v226:UserEligibleForLikelySpeakingBubbles() then
                        v226:emit("OnShowLikelySpeakingBubblesChanged", true);
                    end;
                end;
                if not l_voiceSettings_0.isVoiceEnabled then
                    v226:_reportJoinFailed("userNotEnabled");
                end;
                return l_voiceSettings_0.isVoiceEnabled;
            end;
        end;
    end;
end;
v100.voicePermissionGranted = function(_, v236) --[[ Line: 1055 ]] --[[ Name: voicePermissionGranted ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), v23 (copy)
    local _ = false;
    if typeof(v236) == "table" then
        local v238 = true;
        if v236.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v238 = not v23.List.find(v236.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v238;
    else
        return v236 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v100.RawGetPermissions = function(v239, v240) --[[ Line: 1075 ]] --[[ Name: RawGetPermissions ]]
    -- upvalues: v22 (copy)
    return v22.new(function(v241, _) --[[ Line: 1076 ]]
        -- upvalues: v239 (copy), v240 (copy)
        v239:emit("GetPermissions", function(v243) --[[ Line: 1077 ]]
            -- upvalues: v241 (copy)
            v241(v243);
        end, v240, true, true);
    end);
end;
v100.requestMicPermission = function(v244) --[[ Line: 1084 ]] --[[ Name: requestMicPermission ]]
    -- upvalues: v28 (copy), l_PermissionsProtocol_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v22 (copy), v55 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), v61 (copy), v20 (copy)
    if v244.permissionPromise then
        v28:trace("PermissionProtocol already invoked");
        return v244.permissionPromise;
    else
        local v245 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v246 = nil;
        if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0(v244:IsSeamlessVoice()) then
            v28:debug("Requesting device permission");
            local v247 = nil;
            local v248 = nil;
            local v249, v250, v251 = pcall(function() --[[ Line: 1098 ]]
                -- upvalues: v244 (copy), v245 (copy)
                return v244:RawGetPermissions(v245):await();
            end);
            v247 = v249 and v250;
            v248 = v251;
            if v247 then
                if v248.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v244.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif v248.missingPermissions then
                    v244.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                elseif v248.deniedPermissions then
                    v244.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v28:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v244.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v28:error("PermissionsService call failed.");
                v244.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            end;
            v28:debug("Joining without mic permissions. Permission State: {}", v244.permissionState);
            v246 = v22.resolve();
        else
            v246 = if v55 then v22.new(function(v252, _) --[[ Line: 1127 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_GetFFlagEnableVrVoiceParity_0 (ref), v244 (copy), v245 (copy)
                local function v256(v254) --[[ Line: 1128 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v252 (copy)
                    local v255 = {
                        status = v254.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                    };
                    v252(v255);
                end;
                if l_GetFFlagEnableVrVoiceParity_0() then
                    v244:emit("GetPermissions", v256, v245, false, false);
                    return;
                else
                    v244:emit("GetPermissions", v256, v245);
                    return;
                end;
            end) else v244.PermissionsService:requestPermissions(v245);
        end;
        v244.permissionPromise = v246:andThen(function(v257) --[[ Line: 1147 ]]
            -- upvalues: v61 (ref), v244 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v22 (ref), v28 (ref), v20 (ref), v55 (ref), l_PermissionsProtocol_0 (ref)
            if v61() then
                v244:RecordExperienceJoinMicPermissionStatus(v257);
            end;
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                return v22.resolve();
            elseif not v257 and not v257.status then
                v28:debug("No permission response, rejecting access");
                v244:_reportJoinFailed("noPermissionResponse", v20.ERROR);
                if v244.options.passInitErrorInPromiseReject then
                    return v22.reject({
                        code = "INIT_ERROR_NO_PERM_RESPONSE"
                    });
                else
                    return v22.reject();
                end;
            else
                v28:debug("Permission status {}", v257.status);
                local v258 = nil;
                v258 = if v55 then v244:voicePermissionGranted(v257) else v257.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if v244.options.passInitErrorInPromiseReject and not v258 then
                    return v22.reject({
                        code = "INIT_ERROR_PERM_NOT_GRANTED"
                    });
                else
                    return v258 and v22.resolve() or v22.reject();
                end;
            end;
        end):andThen(function() --[[ Line: 1176 ]]
            -- upvalues: v244 (copy), v22 (ref)
            v244:emit("OnRequestMicPermissionResolved");
            return v22.resolve();
        end):catch(function() --[[ Line: 1181 ]]
            -- upvalues: v244 (copy), v22 (ref)
            v244:emit("OnRequestMicPermissionRejected");
            if v244.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_MIC_PERM_REJECTED"
                });
            else
                return v22.reject();
            end;
        end);
        return v244.permissionPromise;
    end;
end;
v100.JoinByGroupIdToken = function(v259, v260, v261) --[[ Line: 1191 ]] --[[ Name: JoinByGroupIdToken ]]
    v259.previousGroupId = v260;
    v259.previousMutedState = v261;
    return v259.service:JoinByGroupIdToken(v260, v261);
end;
v100.EnableVoice = function(v262) --[[ Line: 1197 ]] --[[ Name: EnableVoice ]]
    -- upvalues: v28 (copy)
    v28:trace("Enabling voice");
    v262.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ Line: 1200 ]]
        -- upvalues: v262 (copy)
        v262.attemptVoiceRejoin:Fire();
    end);
    v262.AvatarChatService:EnableVoice();
end;
v100.ChangeVoiceJoinProgress = function(v263, v264) --[[ Line: 1206 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    v263.VoiceJoinProgress = v264;
    v263.VoiceJoinProgressChanged:Fire(v263.VoiceJoinProgress);
end;
v100.setOptions = function(v265, v266) --[[ Line: 1211 ]] --[[ Name: setOptions ]]
    v265.options = v266;
end;
v100.ShouldShowJoinVoiceOnDisconnect = function(v267) --[[ Line: 1215 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy)
    return v267:IsSeamlessVoice() and v267.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended;
end;
v100.IsSeamlessVoice = function(v268) --[[ Line: 1219 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy)
    if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and not v268.options.allowSeamlessVoice then
        return false;
    else
        local v269 = v268:FetchAgeVerificationOverlay();
        if type(v269) ~= "table" or not v269 or not v269.voiceSettings then
            return false;
        elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v268:verifyUniverseAndPlaceCanUseVoice() then
            return false;
        else
            local l_seamlessVoiceStatus_0 = v269.voiceSettings.seamlessVoiceStatus;
            local v271 = true;
            if l_seamlessVoiceStatus_0 ~= v17.SeamlessVoiceStatus.EnabledExistingUser then
                v271 = l_seamlessVoiceStatus_0 == v17.SeamlessVoiceStatus.EnabledNewUser;
            end;
            return v271;
        end;
    end;
end;
v100.HasSeamlessVoiceFeature = function(v272, v273) --[[ Line: 1241 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    -- upvalues: v62 (copy), v18 (copy), v17 (copy)
    if not v272.options.allowSeamlessVoice or not v272:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v274 = v272:FetchAgeVerificationOverlay();
        if not v272:_isValidAgeVerificationOverlayData(v274) then
            return false;
        else
            local l_seamlessVoiceVariant_0 = v274.voiceSettings.seamlessVoiceVariant;
            if not l_seamlessVoiceVariant_0 then
                return false;
            else
                if v62() then
                    if type(v273) == "string" then
                        v273 = {
                            v273
                        };
                    end;
                    if v62(v273) then
                        local v276 = v18.jsonDecode(l_seamlessVoiceVariant_0);
                        local v277 = {};
                        for _, v279 in pairs(v276) do
                            v277[v279] = true;
                        end;
                        if #v273 == 1 and v273[1] == v17.SeamlessVoiceFeatures.ConnectDisconnect and l_seamlessVoiceVariant_0 == v17.SeamlessVoiceVariants.OnlyConnectDisconnect then
                            return true;
                        else
                            for _, v281 in pairs(v273) do
                                if not v277[v281] then
                                    return false;
                                end;
                            end;
                            return true;
                        end;
                    end;
                else
                    local v285 = ({
                        [v17.SeamlessVoiceFeatures.ConnectDisconnect] = function(v282) --[[ Line: 1286 ]]
                            -- upvalues: v17 (ref)
                            return v282 ~= v17.SeamlessVoiceVariants.Control;
                        end, 
                        [v17.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(v283) --[[ Line: 1289 ]]
                            -- upvalues: v17 (ref)
                            return v283 == v17.SeamlessVoiceVariants.HearingWithoutMicPermissions;
                        end, 
                        [v17.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function(v284) --[[ Line: 1292 ]]
                            -- upvalues: v17 (ref)
                            return v284 == v17.SeamlessVoiceVariants.LikelySpeakingBubblesRemoved;
                        end
                    })[v273];
                    if v285 then
                        return v285(l_seamlessVoiceVariant_0);
                    end;
                end;
                return false;
            end;
        end;
    end;
end;
v100.IsNewSeamlessVoiceUserDisconnect = function(v286) --[[ Line: 1306 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    -- upvalues: v17 (copy)
    if not v286.options.allowSeamlessVoice or not v286:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v287 = v286:FetchAgeVerificationOverlay();
        if not v286:_isValidAgeVerificationOverlayData(v287) then
            return false;
        elseif v287.voiceSettings.seamlessVoiceStatus ~= v17.SeamlessVoiceStatus.EnabledNewUser then
            return false;
        else
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 1325 ]]
                -- upvalues: v286 (copy), v17 (ref)
                return v286.AppStorageService:GetItem(v17.SEAMLESS_VOICE_FTUX_KEY);
            end);
            return l_status_6 and l_result_6 == "false";
        end;
    end;
end;
v100._isValidAgeVerificationOverlayData = function(_, v291) --[[ Line: 1333 ]] --[[ Name: _isValidAgeVerificationOverlayData ]]
    local v292 = false;
    if type(v291) == "table" then
        v292 = v291 and v291.voiceSettings;
    end;
    return v292;
end;
v100.UserInInExperienceUpsellTreatment = function(v293) --[[ Line: 1337 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    -- upvalues: v17 (copy)
    local v294 = v293:FetchAgeVerificationOverlay();
    if not v294 then
        return false;
    else
        local l_showVoiceInExperienceUpsellVariant_0 = v294.showVoiceInExperienceUpsellVariant;
        local v296 = true;
        if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT1 then
            v296 = true;
            if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT2 then
                v296 = l_showVoiceInExperienceUpsellVariant_0 == v17.IN_EXP_UPSELL_VARIANT.VARIANT3;
            end;
        end;
        return v296;
    end;
end;
v100.UserOnlyEligibleForVoice = function(v297) --[[ Line: 1349 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    -- upvalues: v35 (copy)
    local l_communicationPermissionsResult_0 = v297.communicationPermissionsResult;
    if not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings or not l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        if v35 then
            v297:FetchVoicePermissions();
            l_communicationPermissionsResult_0 = v297.communicationPermissionsResult;
        else
            return false;
        end;
    end;
    return l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
end;
v100.UserOnlyEligibleForVoiceViaOverlay = function(v299) --[[ Line: 1365 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    local v300 = v299:FetchAgeVerificationOverlay();
    if not v299:_isValidAgeVerificationOverlayData(v300) then
        return false;
    else
        return v300.voiceSettings.isVerifiedForVoice and not v300.voiceSettings.isVoiceEnabled and v300.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v100.UserVoiceEnabled = function(v301) --[[ Line: 1378 ]] --[[ Name: UserVoiceEnabled ]]
    local l_communicationPermissionsResult_1 = v301.communicationPermissionsResult;
    if not l_communicationPermissionsResult_1 or not l_communicationPermissionsResult_1.voiceSettings or not l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_1.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v100.UserEligibleForInExperienceUpsell = function(v303) --[[ Line: 1388 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v304 = v303:UserOnlyEligibleForVoice();
    if not v304 then
        return false;
    elseif l_GetFFlagEnableVoiceSignal_0() then
        local v305 = v303:UserInInExperienceUpsellTreatment();
        return v304 and v305;
    else
        local v306 = v303:FetchAgeVerificationOverlay();
        return v304 and v306 and v306.showVoiceInExperienceUpsell;
    end;
end;
v100.UserEligibleForLikelySpeakingBubbles = function(v307) --[[ Line: 1409 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    local v308 = v307:UserOnlyEligibleForVoice();
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v308 and not v307:UserVoiceEnabled() and v307:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then
        return true;
    elseif not l_GetFFlagEnableSeamlessVoiceV2_0() and not v308 then
        return false;
    else
        local v309 = v307:FetchAgeVerificationOverlay();
        if l_GetFFlagEnableSeamlessVoiceV2_0() then
            if not v307:_isValidAgeVerificationOverlayData(v309) then
                return false;
            else
                local v310 = v308 and v309 and v309.showVoiceInExperienceUpsell;
                local l_showM3LikelySpeakingBubbles_0 = v309.showM3LikelySpeakingBubbles;
                return v310 or l_showM3LikelySpeakingBubbles_0;
            end;
        else
            return v308 and v309 and v309.showVoiceInExperienceUpsell;
        end;
    end;
end;
v100.canUseServiceAsync = function(v312) --[[ Line: 1447 ]] --[[ Name: canUseServiceAsync ]]
    -- upvalues: v28 (copy), v22 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v67 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy), l_VoiceChatService_0 (copy), v36 (copy), l_IXPServiceWrapper_0 (copy), v37 (copy), v38 (copy)
    if v312.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        v28:debug("Voice Chat is not Available, rejecting canUseService promise");
        if v312.options.passInitErrorInPromiseReject then
            return v22.reject({
                code = "INIT_ERROR_VOICE_NOT_SUPPORTED"
            });
        else
            return v22.reject();
        end;
    else
        if not v312.canUseServicePromise then
            v312.canUseServicePromise = v22.defer(function(v313, v314) --[[ Line: 1457 ]]
                -- upvalues: v312 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v28 (ref), v67 (ref), l_VOICE_CHAT_AVAILABILITY_0 (ref), l_VoiceChatService_0 (ref), v36 (ref), l_IXPServiceWrapper_0 (ref), v37 (ref), v38 (ref)
                local v315 = v312:userAndPlaceCanUseVoice();
                if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                    v312.canUseServiceResult = v315;
                    v312:emit("OnCanUseServiceResult", v315);
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v312.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v28:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v312.attemptVoiceRejoin.Event:Wait();
                    v28:debug("Attempting voice rejoin");
                    v312.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true;
                    v312.userEligible = true;
                    if v67() then
                        v312.initializedPostSuspension = true;
                    end;
                    v313();
                    v312:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return;
                elseif not v315 then
                    v28:info("Voice access denied");
                    v312.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    if v312.options.passInitErrorInPromiseReject then
                        v314({
                            code = "INIT_ERROR_USER_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v314();
                        return;
                    end;
                elseif game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc or not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                    v28:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                    if not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                        v312:_reportJoinFailed("universeNotEnabled");
                    elseif not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                        v312:_reportJoinFailed("placeNotEnabled");
                    end;
                    v312.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                    if v312.options.passInitErrorInPromiseReject then
                        v314({
                            code = "INIT_ERROR_PLACE_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v314();
                        return;
                    end;
                elseif v36 then
                    l_IXPServiceWrapper_0:WaitForInitialization();
                    local l_status_7, l_result_7 = pcall(function() --[[ Line: 1519 ]]
                        -- upvalues: l_IXPServiceWrapper_0 (ref), v37 (ref)
                        return l_IXPServiceWrapper_0:GetLayerData(v37);
                    end);
                    if l_status_7 and l_result_7 and l_result_7[v38] ~= nil then
                        v312.userEligible = l_result_7[v38];
                        l_IXPServiceWrapper_0:LogUserLayerExposure(v37);
                    end;
                    if v312.userEligible then
                        v313();
                        return;
                    elseif v312.options.passInitErrorInPromiseReject then
                        v314({
                            code = "INIT_ERROR_IXP_NOT_ELIGIBLE"
                        });
                        return;
                    else
                        v314();
                        return;
                    end;
                else
                    v312.userEligible = true;
                    v313();
                    return;
                end;
            end):andThen(function() --[[ Line: 1541 ]]
                -- upvalues: v312 (copy)
                return v312:requestMicPermission();
            end);
        end;
        return v312.canUseServicePromise;
    end;
end;
v100._setRecentUserState = function(v318, v319, v320) --[[ Line: 1548 ]] --[[ Name: _setRecentUserState ]]
    -- upvalues: v23 (copy)
    local v321 = v318.recentUsersInteractionData[tostring(v319)] or {};
    local v322 = v23.Dictionary.join(v321, v320);
    v318.recentUsersInteractionData = v23.Dictionary.join(v318.recentUsersInteractionData, {
        [tostring(v319)] = v322
    });
end;
v100.getRecentUsersInteractionData = function(v323) --[[ Line: 1558 ]] --[[ Name: getRecentUsersInteractionData ]]
    v323:_updateRecentUsersInteractionData();
    return v323.recentUsersInteractionData;
end;
v100.GetSignalREvent = function(v324, v325) --[[ Line: 1563 ]] --[[ Name: GetSignalREvent ]]
    return v324.SignalREventTable[v325].Event;
end;
v100.StartModerationSignal = function(v326) --[[ Line: 1568 ]] --[[ Name: StartModerationSignal ]]
    -- upvalues: v28 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy)
    if not v326.playerModeratedConnection then
        v326.playerModeratedConnection = v326:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ Line: 1571 ]]
            -- upvalues: v28 (ref), v326 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
            v28:debug("User Moderated");
            v326.previousSessionId = v326.service:GetSessionId();
            v326:emit("OnPlayerModerated");
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                l_VoiceChatService_0:notifyServerACSCleanup();
                l_VoiceChatService_0:leaveVoice();
                return;
            else
                l_VoiceChatService_0:notifyServerACSCleanup();
                v326.service:Leave();
                return;
            end;
        end);
    end;
end;
v100.StopModerationSignal = function(v327) --[[ Line: 1586 ]] --[[ Name: StopModerationSignal ]]
    if v327.playerModeratedConnection then
        v327.playerModeratedConnection:Disconnect();
        v327.playerModeratedConnection = nil;
    end;
end;
v100._updateRecentUsersInteractionData = function(v328) --[[ Line: 1593 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    -- upvalues: v34 (copy), v50 (copy), l_Players_0 (copy), v51 (copy), v23 (copy)
    local v329 = os.time();
    local v330 = {};
    if v328.recentUsersInteractionData then
        for v331, v332 in pairs(v328.recentUsersInteractionData) do
            local v333 = if v34 then v328.participants[tostring(v331)] else v328.participants[v331];
            local v334 = v50() and not l_Players_0:GetPlayerByUserId((tonumber(v331)));
            local v335 = v329 - v332.lastHeardTime >= v51();
            local v336 = not v333 or v333.isMuted;
            if v335 and v336 or v334 then
                v330[v331] = v23.None;
            end;
        end;
        v328.recentUsersInteractionData = v23.Dictionary.join(v328.recentUsersInteractionData, v330);
    end;
end;
v100.SetupParticipantListeners = function(v337) --[[ Line: 1617 ]] --[[ Name: SetupParticipantListeners ]]
    -- upvalues: v28 (copy), v50 (copy), v34 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v29 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v56 (copy), v74 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v69 (copy), v70 (copy), l_GetFFlagDisconnectToastClientRewrite_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v68 (copy), l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), v39 (copy), v43 (copy), v48 (copy), v49 (copy), v18 (copy), v96 (copy)
    v337:ensureInitialized("setup participant listeners");
    if not v337.participants then
        v337.participants = {};
        v337.recentUsersInteractionData = {};
        v337.updatedParticipants = {};
        v337.participantConnection = v337.service.ParticipantsStateChanged:Connect(function(v338, v339, v340) --[[ Line: 1626 ]]
            -- upvalues: v28 (ref), v50 (ref), v337 (copy), v34 (ref), l_Players_0 (ref), l_VoiceChatService_0 (ref), v29 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v56 (ref), v74 (ref)
            v28:trace("Participants state changed");
            for _, v342 in ipairs(v338) do
                if not v50() and not v337.participants[tostring(v342)].isMuted then
                    v337:_setRecentUserState(v342, {
                        lastHeardTime = os.time()
                    });
                end;
                v337.participants[tostring(v342)] = nil;
                v337.participantLeft:Fire(v337.participants, v342);
                v337:emit("OnVoiceParticipantRemoved", v342);
            end;
            for _, v344 in ipairs(v339) do
                v337.participantJoined:Fire(v337.participants, v344);
                v337:emit("OnVoiceParticipantAdded", v344);
            end;
            for _, v346 in pairs(v340) do
                local l_userId_0 = v346.userId;
                local v348 = if v34 then v337.participants[tostring(l_userId_0)] else v337.participants[l_userId_0];
                if not v346.isMuted or v348 and not v348.isMuted then
                    v337:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v348 or v348.isMuted ~= v346.isMuted then
                    v337:emit("OnVoiceParticipantToggleMuted", l_userId_0, v346.isMuted);
                end;
                if l_VoiceChatService_0.UseNewAudioApi and v29 then
                    v346.isMutedLocally = not not v337.mutedPlayers[l_userId_0];
                end;
                if l_VoiceChatService_0.UseNewAudioApi then
                    v346.isMutedLocally = if v337.mutedPlayers[l_userId_0] then not not v337.mutedPlayers[l_userId_0] else v346.isMutedLocally;
                end;
                if l_FFlagEnablePartyVoiceChangersInLua_0 and l_VoiceChatService_0.UseNewAudioApi then
                    v346.isVoiceChangerActive = if v337.voiceChangerActivePlayers[l_userId_0] then v337.voiceChangerActivePlayers[l_userId_0] else v346.isVoiceChangerActive;
                end;
                if v337.muteAll then
                    v346.isMutedLocally = true;
                end;
                v337.participants[tostring(l_userId_0)] = v346;
                if v56() then
                    v337.updatedParticipants[tostring(l_userId_0)] = v346;
                end;
                if v74 and v337.CaptureService:IsCapturingVideo() then
                    v337.voiceCapturedDuringVideoCapture = v337.voiceCapturedDuringVideoCapture or v346.isSignalActive;
                end;
            end;
            v337:_updateRecentUsersInteractionData();
            if v337.shouldThrottleParticipantUpdate then
                local v349 = tick();
                if v349 - v337.lastParticipantsStateUpdate >= v337.participantsStateThrottleTime and #v340 > 0 then
                    v337.lastParticipantsStateUpdate = v349;
                    v337.participantsUpdate:Fire(if v56() then v337.updatedParticipants else v337.participants);
                    v337.updatedParticipants = {};
                    return;
                elseif #v340 > 0 then
                    local v350 = v337.participantsStateThrottleTime - (v349 - v337.lastParticipantsStateUpdate);
                    v337.lastStateUpdateCounter = (v337.lastStateUpdateCounter + 1) % 100;
                    local l_lastStateUpdateCounter_0 = v337.lastStateUpdateCounter;
                    task.wait(v350);
                    if l_lastStateUpdateCounter_0 == v337.lastStateUpdateCounter then
                        v337.participantsUpdate:Fire(if v56() then v337.updatedParticipants else v337.participants);
                        v337.updatedParticipants = {};
                        return;
                    end;
                end;
            elseif #v340 > 0 then
                v337.participantsUpdate:Fire(if v56() then v337.updatedParticipants else v337.participants);
                v337.updatedParticipants = {};
            end;
        end);
        local function v359(v352, v353) --[[ Line: 1742 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v337 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v28 (ref), v69 (ref), v70 (ref), l_GetFFlagDisconnectToastClientRewrite_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
            v337:emit("OnStateChanged", v352, v353);
            local v354 = v353 == Enum.VoiceChatState.Failed;
            local v355 = v353 == Enum.VoiceChatState.Joining;
            local v356 = v353 == Enum.VoiceChatState.Leaving;
            local v357 = v353 == Enum.VoiceChatState.Ended;
            local v358 = v337.service:IsPublishPaused();
            if v358 ~= v337.localMuted and not v354 and not v355 and not v356 and not v357 then
                v337.localMuted = v358;
                v337.muteChanged:Fire(v358);
            elseif v355 or v356 or v357 then
                v337.localMuted = nil;
            end;
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() and v353 == Enum.VoiceChatState.Joined and v337.isInCall and v358 ~= v337.callMutedState then
                v28:debug("In call, setting local muted to call muted state {}", v337.callMutedState);
                v337:ToggleMic("InitInCall");
            end;
            if v69 and v353 == Enum.VoiceChatState.Joined then
                v337:StartModerationSignal();
            end;
            if v353 == Enum.VoiceChatState.Leaving then
                if not v70 or not v337.previousGroupId then
                    v337.previousGroupId = v337.service:GetGroupId();
                end;
                v337.previousMutedState = v337.service:IsPublishPaused();
            end;
            if v353 == Enum.VoiceChatState.Ended or v354 then
                v337.participants = {};
                v337.localMuted = nil;
                v337.participantsUpdate:Fire(v337.participants);
                if v69 then
                    v337:StopModerationSignal();
                end;
                if v354 then
                    v28:debug("State Changed to Failed. Reason: {}", v337.service:GetAndClearCallFailureMessage());
                end;
                if v352 == Enum.VoiceChatState.Joining or v352 == Enum.VoiceChatState.JoiningRetry or v352 == Enum.VoiceChatState.Joined then
                    if v353 == Enum.VoiceChatState.Ended then
                        v28:debug("State Changed to Ended from {}", v352);
                    end;
                    if not l_GetFFlagDisconnectToastClientRewrite_0() or not v337:IsSeamlessVoice() or v337:GetVoiceConnectCookieValue() then
                        v337:emit("OnRetryRequested");
                    end;
                end;
            end;
            if l_GetFFlagEnableVoiceSignal_0() and v337.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v353 == Enum.VoiceChatState.Joined then
                v337:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                v337:emit("OnVoiceJoin");
            end;
        end;
        if v337.service.VoiceChatState and v337.service.VoiceChatState == Enum.VoiceChatState.Joined then
            v28:debug("Joined voice chat {}", v337.service.VoiceChatState);
            v359(nil, Enum.VoiceChatState.Joined);
        end;
        v337.stateConnection = v337.service.StateChanged:Connect(v359);
        if v68 and l_VoiceChatService_0.UseNewAudioApi then
            if not v337.localMeteringTask then
                v337.localMeteringTask = task.spawn(function() --[[ Line: 1829 ]]
                    -- upvalues: v337 (copy)
                    while true do
                        v337:UpdateLocalMetering();
                        task.wait();
                    end;
                end);
            end;
        elseif v337.service:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 then
            v337.micConnection = v337.service.PlayerMicActivitySignalChange:Connect(function(v360) --[[ Line: 1838 ]]
                -- upvalues: v74 (ref), v337 (copy), l_GetFFlagLocalMutedNilFix_0 (ref), v39 (ref)
                if v74 and v337.CaptureService:IsCapturingVideo() then
                    v337.voiceCapturedDuringVideoCapture = v337.voiceCapturedDuringVideoCapture or v360.isActive;
                end;
                v337.isTalking = v360.isActive;
                if l_GetFFlagLocalMutedNilFix_0() then
                    if v337.localMuted == false then
                        if v39 then
                            v337:FireTalkingChangedDebounced(v337.isTalking);
                            return;
                        else
                            v337.talkingChanged:Fire(v337.isTalking);
                            return;
                        end;
                    end;
                elseif not v337.localMuted then
                    if v39 then
                        v337:FireTalkingChangedDebounced(v337.isTalking);
                        return;
                    else
                        v337.talkingChanged:Fire(v337.isTalking);
                    end;
                end;
            end);
        end;
        if v43() then
            v337:StartModerationSignal();
        elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
            v337.playerModeratedConnection = v337.service.LocalPlayerModerated:connect(function() --[[ Line: 1871 ]]
                -- upvalues: v28 (ref), v337 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
                v28:debug("User Moderated old");
                v337.previousSessionId = v337.service:GetSessionId();
                v337:emit("OnPlayerModerated");
                if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                    l_VoiceChatService_0:leaveVoice();
                    return;
                else
                    v337.service:Leave();
                    return;
                end;
            end);
        end;
        if v48() then
            v28:trace("Setting up voice nudge handlers");
            v337.voiceToxicityModalConnection = v337:GetSignalREvent("VoiceToxicityModal"):Connect(function(v361) --[[ Line: 1885 ]]
                -- upvalues: v337 (copy)
                v337.Analytics:reportReceivedNudge(v361, v337:GetNudgeAnalyticsData());
                v337:emit("OnVoiceToxicityModal");
            end);
            v337.VoiceToxicityToastConnection = v337:GetSignalREvent("VoiceToxicityToast"):Connect(function(v362) --[[ Line: 1891 ]]
                -- upvalues: v337 (copy)
                v337.Analytics:reportReceivedNudge(v362, v337:GetNudgeAnalyticsData());
                v337:emit("OnVoiceToxicityToast");
            end);
        end;
        if v49() then
            v28:trace("Setting up voice reverse nudge handlers");
            v337.voiceReverseNudgeConnection = v337:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(v363) --[[ Line: 1899 ]]
                -- upvalues: v337 (copy)
                v337:emit("OnVoiceReverseNudgeIconColorChange", v363);
            end);
        end;
        v337.blockConnection = v337.BlockStatusChanged:Connect(function(v364, v365) --[[ Line: 1904 ]]
            -- upvalues: v337 (copy), v28 (ref), v18 (ref)
            if v365 then
                if v337.participants[tostring(v364)] then
                    v28:debug("Blocking {}", v18.shorten(v364));
                    v337.service:SubscribeBlock(v364);
                    return;
                end;
            else
                v28:debug("UnBlocking {}", v18.shorten(v364));
                v337.service:SubscribeUnblock(v364);
            end;
        end);
        if l_VoiceChatService_0.UseNewAudioApi then
            v337:hookupAudioDeviceInputListener();
        end;
        if v337.service.TempSetMicMutedToggleMic then
            v337.tempSetMicMutedToggleMicConnection = v337.service.TempSetMicMutedToggleMic:connect(function() --[[ Line: 1922 ]]
                -- upvalues: v337 (copy)
                v337:ToggleMic("TempSetMicMutedToggleMic");
            end);
        end;
        if v74 then
            v337.videoCaptureInProgressConnection = v337.CaptureService.VideoCaptureInProgress:connect(function(v366) --[[ Line: 1929 ]]
                -- upvalues: v337 (copy), v96 (ref)
                if v366 then
                    v337.voiceCapturedDuringVideoCapture = false;
                    return;
                else
                    v337.TelemetryService:LogEvent(v96, {
                        customFields = {
                            voiceCaptured = v337.voiceCapturedDuringVideoCapture
                        }
                    });
                    return;
                end;
            end);
        end;
    end;
end;
local v367 = nil;
v100.CheckAudioInputExists = function(v368) --[[ Line: 1944 ]] --[[ Name: CheckAudioInputExists ]]
    -- upvalues: v28 (copy), v367 (ref), v22 (copy), v23 (copy)
    v28:trace("Checking for AudioDeviceInput");
    if not v367 then
        v367 = v22.new(function(v369, _) --[[ Line: 1947 ]]
            -- upvalues: v23 (ref), v368 (copy), v28 (ref)
            if #v23.Dictionary.keys(v368.audioDevices) > 0 then
                v28:trace("Found existing AudioDeviceInput");
                v369();
                return;
            else
                v368.audioDeviceInputAdded.Event:Connect(function() --[[ Line: 1952 ]]
                    -- upvalues: v28 (ref), v369 (copy)
                    v28:trace("Found new AudioDeviceInput");
                    v369();
                end);
                return;
            end;
        end);
    end;
    return v367;
end;
v100.checkAndUpdateSequence = function(v371, v372, v373) --[[ Line: 1962 ]] --[[ Name: checkAndUpdateSequence ]]
    if not v373 then
        return 0;
    elseif not v371.SequenceNumbers[v372] then
        v371.SequenceNumbers[v372] = v373;
        return 0;
    else
        local v374 = v373 - v371.SequenceNumbers[v372];
        if v374 > 0 then
            v371.SequenceNumbers[v372] = v373;
        end;
        return v374 - 1;
    end;
end;
v100.onInstanceAdded = function(v375, v376) --[[ Line: 1985 ]] --[[ Name: onInstanceAdded ]]
    -- upvalues: v28 (copy)
    if v376:IsA("AudioDeviceInput") then
        v28:debug("Found new audio device instance for {}", v376.Player and v376.Player.Name);
        v375.audioDevices[v376] = v375:CreateAudioDeviceData(v376);
        v375:emit("OnAudioDeviceInputAdded");
        v375:StartAnalysis(v376);
    end;
end;
v100.GetSendMuteEvent = function(v377) --[[ Line: 1995 ]] --[[ Name: GetSendMuteEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v377.SendMuteEvent then
        v377.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v377.SendMuteEvent;
end;
v100.GetToggleVoiceChangerEvent = function(v378) --[[ Line: 2002 ]] --[[ Name: GetToggleVoiceChangerEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v378.SendVoiceChangerEvent then
        v378.SendVoiceChangerEvent = l_ReplicatedStorage_0:WaitForChild("ToggleUserVoiceChanger", 10);
    end;
    return v378.SendVoiceChangerEvent;
end;
v100.GetInputToModifierWire = function(v379) --[[ Line: 2009 ]] --[[ Name: GetInputToModifierWire ]]
    -- upvalues: l_Players_0 (copy)
    if not v379.InputToModifierWire then
        v379.InputToModifierWire = l_Players_0.LocalPlayer:FindFirstChild("InputToModifier");
    end;
    return v379.InputToModifierWire;
end;
v100.GetPartyVoiceDeviceInput = function(v380) --[[ Line: 2016 ]] --[[ Name: GetPartyVoiceDeviceInput ]]
    -- upvalues: l_Players_0 (copy)
    if not v380.PartyVoiceDeviceInput then
        v380.PartyVoiceDeviceInput = l_Players_0.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput");
    end;
    return v380.PartyVoiceDeviceInput;
end;
v100.GetSetVoicePackEvent = function(v381) --[[ Line: 2024 ]] --[[ Name: GetSetVoicePackEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v381.SetVoicePackEvent then
        v381.SetVoicePackEvent = l_ReplicatedStorage_0:WaitForChild("SetVoicePack", 10);
    end;
    return v381.SetVoicePackEvent;
end;
v100.GetVoiceChangerWasToggledEvent = function(v382) --[[ Line: 2031 ]] --[[ Name: GetVoiceChangerWasToggledEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v382.VoiceChangerWasToggledEvent then
        v382.VoiceChangerWasToggledEvent = l_ReplicatedStorage_0:WaitForChild("VoiceChangerWasToggled", 3);
    end;
    return v382.VoiceChangerWasToggledEvent;
end;
local function _(v383, v384) --[[ Line: 2039 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v383;
    l_Wire_0.TargetInstance = v384;
    l_Wire_0.Parent = v384;
    return l_Wire_0;
end;
local function _() --[[ Line: 2048 ]] --[[ Name: GetAnalysisHost ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    return l_RobloxReplicatedStorage_0;
end;
v100.GetAnalyzer = function(_, v389) --[[ Line: 2052 ]] --[[ Name: GetAnalyzer ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v390 = v389.Name .. "_Analyzer";
    local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
    local l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = l_l_RobloxReplicatedStorage_0_0:FindFirstChild(v390);
    if not l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 then
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = Instance.new("AudioAnalyzer");
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.SpectrumEnabled = false;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Name = v390;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Parent = l_l_RobloxReplicatedStorage_0_0;
    end;
    return l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0;
end;
local function _(v393) --[[ Line: 2065 ]] --[[ Name: toDecibels ]]
    return math.log10(v393) * 20;
end;
v100.IsSignalActive = function(v395, v396) --[[ Line: 2069 ]] --[[ Name: IsSignalActive ]]
    -- upvalues: v68 (copy), l_Players_0 (copy)
    if not v68 then
        return false;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v396);
        if not l_l_Players_0_PlayerByUserId_0 then
            return false;
        else
            return math.log10(v395:GetAnalyzer(l_l_Players_0_PlayerByUserId_0).PeakLevel) * 20 > -36;
        end;
    end;
end;
v100.StopAnalysis = function(_, v399) --[[ Line: 2083 ]] --[[ Name: StopAnalysis ]]
    -- upvalues: v68 (copy), l_RobloxReplicatedStorage_0 (copy)
    if not v68 then
        return;
    else
        for _, v401 in v399:GetConnectedWires("Output") do
            local l_TargetInstance_0 = v401.TargetInstance;
            if l_TargetInstance_0 and l_TargetInstance_0:IsDescendantOf(l_RobloxReplicatedStorage_0) then
                v401:Destroy();
            end;
        end;
        return;
    end;
end;
v100.StartAnalysis = function(v403, v404) --[[ Line: 2099 ]] --[[ Name: StartAnalysis ]]
    -- upvalues: v68 (copy)
    if not v68 then
        return;
    else
        v403:StopAnalysis(v404);
        local l_Player_0 = v404.Player;
        if not l_Player_0 then
            return;
        else
            local l_v403_Analyzer_0 = v403:GetAnalyzer(l_Player_0);
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = v404;
            l_Wire_1.TargetInstance = l_v403_Analyzer_0;
            l_Wire_1.Parent = l_v403_Analyzer_0;
            return;
        end;
    end;
end;
v100.GetVoiceConnectCookie = function(v408) --[[ Line: 2113 ]] --[[ Name: GetVoiceConnectCookie ]]
    -- upvalues: v17 (copy)
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 2114 ]]
        -- upvalues: v408 (copy), v17 (ref)
        return v408.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
    end);
    if l_status_8 and l_result_8 then
        return l_result_8;
    else
        return "";
    end;
end;
v100.GetVoiceConnectCookieValue = function(v411) --[[ Line: 2125 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 2127 ]]
            -- upvalues: v411 (copy), v17 (ref)
            return v411.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
        end);
        if l_status_9 then
            return l_result_9 == "true";
        else
            return true;
        end;
    else
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2133 ]]
            -- upvalues: v411 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref)
            return v411.AppStorageService:GetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY);
        end);
        if l_status_10 then
            return l_result_10 == "true";
        else
            return true;
        end;
    end;
end;
v100.SetVoiceConnectCookieValue = function(v416, v417) --[[ Line: 2145 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        return (pcall(function() --[[ Line: 2147 ]]
            -- upvalues: v416 (copy), v17 (ref), v417 (copy)
            v416.AppStorageService:SetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(v417)));
            v416.AppStorageService:Flush();
        end));
    else
        return (pcall(function() --[[ Line: 2153 ]]
            -- upvalues: v416 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref), v417 (copy)
            v416.AppStorageService:SetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY, (tostring(v417)));
            v416.AppStorageService:Flush();
        end));
    end;
end;
v100.SetNewUserFTUXCookieValue = function(v418, v419) --[[ Line: 2166 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    -- upvalues: v17 (copy)
    return (pcall(function() --[[ Line: 2167 ]]
        -- upvalues: v418 (copy), v17 (ref), v419 (copy)
        v418.AppStorageService:SetItem(v17.SEAMLESS_VOICE_FTUX_KEY, (tostring(v419)));
        v418.AppStorageService:Flush();
    end));
end;
v100.SetAndSyncActive = function(v420, v421, v422) --[[ Line: 2174 ]] --[[ Name: SetAndSyncActive ]]
    -- upvalues: l_Players_0 (copy)
    v421.Active = v422;
    local l_v420_SendMuteEvent_0 = v420:GetSendMuteEvent();
    if l_v420_SendMuteEvent_0 and v421.Player == l_Players_0.LocalPlayer then
        l_v420_SendMuteEvent_0:FireServer(v422);
    end;
end;
v100.CreateAudioDeviceData = function(v424, v425) --[[ Line: 2183 ]] --[[ Name: CreateAudioDeviceData ]]
    -- upvalues: l_Players_0 (copy), l_game_EngineFeature_0 (copy), v32 (copy), v28 (copy), v33 (copy)
    local v426 = {};
    local v427 = v425.Player == l_Players_0.LocalPlayer;
    if l_game_EngineFeature_0 then
        if not v425.MutedByLocalUser then
            if v424.muteAll and not v427 then
                v425.MutedByLocalUser = true;
            end;
            if v425.Player and v424.mutedPlayers[v425.Player.UserId] then
                v425.MutedByLocalUser = true;
            end;
        end;
    elseif v425.Active then
        if v424.muteAll and not v427 then
            v425.Active = false;
        end;
        if v425.Player and v424.mutedPlayers[v425.Player.UserId] then
            v425.Active = false;
        end;
    end;
    if v32 and v425.Active and v427 and v424.localMuted == nil then
        v424:SetAndSyncActive(v425, false);
    end;
    if v427 and v424.localMuted ~= nil and v424.localMuted ~= not v425.Active and not v424.isInCall then
        v28:debug("Mismatch between LocalMuted and device.Active");
        local v428 = not v424.localMuted;
        v425.Active = v428;
        local l_v424_SendMuteEvent_0 = v424:GetSendMuteEvent();
        if l_v424_SendMuteEvent_0 then
            l_v424_SendMuteEvent_0:FireServer(v428);
        end;
    elseif v424.isInCall and v427 then
        local v430 = not v424.callMutedState;
        v28:debug("Overwriting Active State to match Iris call. .Active = {}", v430);
        v425.Active = v430;
        local l_v424_SendMuteEvent_1 = v424:GetSendMuteEvent();
        if l_v424_SendMuteEvent_1 then
            l_v424_SendMuteEvent_1:FireServer(v430);
        end;
    end;
    v426.onPlayerChanged = v425:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 2235 ]]
        -- upvalues: v33 (ref), v427 (ref), v425 (copy), l_Players_0 (ref), v32 (ref), v424 (copy), v28 (ref), l_game_EngineFeature_0 (ref)
        if v33 then
            v427 = v425.Player == l_Players_0.LocalPlayer;
            if v427 then
                if v32 and v425.Active and v424.localMuted == nil then
                    v424:SetAndSyncActive(v425, false);
                elseif v424.localMuted ~= nil and v424.localMuted ~= not v425.Active then
                    v28:debug("Mismatch between LocalMuted and device.Active");
                    v424:SetAndSyncActive(v425, not v424.localMuted);
                end;
            elseif v424.muteAll or v425.Player and v424.mutedPlayers[v425.Player.UserId] then
                if l_game_EngineFeature_0 then
                    v425.MutedByLocalUser = true;
                else
                    v425.Active = false;
                end;
            end;
        end;
        v424:emit("OnDevicePlayerChanged");
        v424:StartAnalysis(v425);
    end);
    v426.onMutedChanged = v425:GetPropertyChangedSignal("Muted"):Connect(function() --[[ Line: 2260 ]]
        -- upvalues: v424 (copy)
        v424:emit("OnDeviceMuteChanged");
    end);
    if not l_game_EngineFeature_0 then
        v426.onActiveChanged = v425:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 2265 ]]
            -- upvalues: v424 (copy), v427 (ref), v425 (copy)
            v424:emit("OnDeviceActiveChanged");
            if v424.muteAll and not v427 then
                v425.Active = false;
            end;
            if v425.Player and v424.mutedPlayers[v425.Player.UserId] then
                v425.Active = false;
            end;
        end);
    end;
    return v426;
end;
v100.onInstanceRemove = function(v432, v433) --[[ Line: 2279 ]] --[[ Name: onInstanceRemove ]]
    -- upvalues: v28 (copy), l_game_EngineFeature_0 (copy), v68 (copy)
    if v433:IsA("AudioDeviceInput") then
        v432:StopAnalysis(v433);
        v28:trace("Removing AudioDeviceInput {} {} {}", v433, "for user", v433.Player and v433.Player.UserId);
        local v434 = v432.audioDevices[v433];
        if v434 then
            if not l_game_EngineFeature_0 then
                v434.onActiveChanged:Disconnect();
            end;
            v434.onMutedChanged:Disconnect();
            v434.onPlayerChanged:Disconnect();
        end;
        v432.audioDevices[v433] = nil;
        v432:emit("OnAudioDeviceInputRemoved");
        if v68 and v433.Player then
            v432:GetAnalyzer(v433.Player):Destroy();
        end;
    end;
end;
v100.hookupAudioDeviceInputListener = function(v435) --[[ Line: 2300 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    -- upvalues: v28 (copy), l_Players_0 (copy), v31 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), l_CollectionService_0 (copy), v18 (copy)
    v28:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v31 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v437) --[[ Line: 2304 ]]
            -- upvalues: v435 (copy)
            v435:onInstanceAdded(v437);
        end);
    else
        game.DescendantAdded:Connect(function(v438) --[[ Line: 2308 ]]
            -- upvalues: v435 (copy)
            v435:onInstanceAdded(v438);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v28:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v435:onInstanceAdded(l_AudioDeviceInput_0);
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
        for _, v444 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
            v18.destroyDefaultEmitter(v444);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v18.destroyDefaultEmitter);
        l_LocalPlayer_0.CharacterAdded:Connect(v18.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v18.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v445) --[[ Line: 2344 ]]
        -- upvalues: v435 (copy)
        v435:onInstanceRemove(v445);
    end);
    for _, v447 in game:GetDescendants() do
        v435:onInstanceAdded(v447);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v448) --[[ Line: 2353 ]]
        -- upvalues: v435 (copy)
        for v449 in v435.audioDevices do
            if v449.Player and v449.Player == v448 then
                v435:onInstanceRemove(v449);
            end;
        end;
    end);
end;
v100.RejoinCurrentChannel = function(v450) --[[ Line: 2363 ]] --[[ Name: RejoinCurrentChannel ]]
    -- upvalues: v46 (copy), v28 (copy)
    pcall(function() --[[ Line: 2364 ]]
        -- upvalues: v450 (copy), v46 (ref), v28 (ref)
        local l_GroupId_0 = v450.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v452 = v450.service:IsPublishPaused();
            v450.service:Leave();
            if v46() then
                v28:debug("Rejoining current channel {}", l_GroupId_0);
                v450.participants = {};
                v450.participantsUpdate:Fire(v450.participants);
            end;
            if not v450.service:JoinByGroupIdToken(l_GroupId_0, v452, true) then
                v450:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v100.RejoinChannel = function(v453, v454, v455) --[[ Line: 2383 ]] --[[ Name: RejoinChannel ]]
    -- upvalues: v28 (copy)
    v28:debug("Rejoining previous channel {} with mute status {}", v454, v455);
    if v454 and v454 ~= "" then
        pcall(function() --[[ Line: 2387 ]]
            -- upvalues: v453 (copy), v454 (copy), v455 (copy)
            v453.service:Leave();
            v453.participants = {};
            v453.participantsUpdate:Fire(v453.participants);
            if not v453.service:JoinByGroupIdToken(v454, v455, true) then
                v453:emit("OnInitialJoinFailed");
            end;
        end);
    end;
end;
v100.RejoinVoice = function(v456) --[[ Line: 2399 ]] --[[ Name: RejoinVoice ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v28 (copy), l_VoiceChatService_0 (copy)
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        v28:debug("Rejoining voice");
        v456.participants = {};
        v456.participantsUpdate:Fire(v456.participants);
        l_VoiceChatService_0:rejoinVoice();
    end;
end;
v100.watchSignalR = function(v457) --[[ Line: 2410 ]] --[[ Name: watchSignalR ]]
    -- upvalues: l_WATCHED_NAMESPACES_0 (copy), v18 (copy), v45 (copy), v28 (copy)
    v457.signalRConnection = v457.NotificationService.RobloxEventReceived:Connect(function(v458) --[[ Line: 2411 ]]
        -- upvalues: l_WATCHED_NAMESPACES_0 (ref), v18 (ref), v45 (ref), v457 (copy), v28 (ref)
        local l_namespace_0 = v458.namespace;
        if not l_WATCHED_NAMESPACES_0[l_namespace_0] then
            return;
        else
            local v460 = v18.jsonDecode(v458.detail);
            if v45() then
                local v461 = v457.SignalREventTable[v460.type];
                if v461 then
                    v461:Fire(v460);
                end;
            end;
            local l_SequenceNumber_0 = v460.SequenceNumber;
            v28:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v463 = v457:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v463 > 0 then
                v457.Analytics:reportReconnectDueToMissedSequence();
                return;
            else
                if v463 < -1 then
                    v457.Analytics:reportOutOfOrderSequence();
                end;
                return;
            end;
        end;
    end);
    v457.signalRConnectionChanged = v457.NotificationService.RobloxConnectionChanged:Connect(function(v464, v465, _, v467) --[[ Line: 2437 ]]
        -- upvalues: v28 (ref), v18 (ref), l_WATCHED_NAMESPACES_0 (ref), v457 (copy)
        if v464 == "signalR" then
            if v465 ~= Enum.ConnectionState.Connected then
                v28:info("SignalR disconnected");
                return;
            else
                for v468, v469 in pairs(v18.jsonDecode(v467)) do
                    if l_WATCHED_NAMESPACES_0[v468] then
                        v28:trace("SignalR message {}: {}", v468, v469);
                        local v470 = v457:checkAndUpdateSequence(v468, v469);
                        if v470 > 0 then
                            v457.Analytics:reportReconnectDueToMissedSequence();
                        elseif v470 < -1 then
                            v457.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v100.StopSignalRConnection = function(v471) --[[ Line: 2462 ]] --[[ Name: StopSignalRConnection ]]
    if v471.signalRConnectionChanged then
        v471.signalRConnectionChanged:Disconnect();
        v471.signalRConnectionChanged = nil;
    end;
    if v471.signalRConnection then
        v471.signalRConnection:Disconnect();
        v471.signalRConnection = nil;
    end;
end;
v100.getService = function(v472) --[[ Line: 2473 ]] --[[ Name: getService ]]
    return v472.service;
end;
v100.ToggleMic = function(v473, v474) --[[ Line: 2477 ]] --[[ Name: ToggleMic ]]
    -- upvalues: l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v28 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), l_PermissionsProtocol_0 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy)
    v473:ensureInitialized("toggle mic");
    if v473.localMuted == nil then
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("ToggleMic context: {} - Voice not connected yet", v474);
        end;
        return;
    else
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("ToggleMic context: {}", v474);
        end;
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if v473.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v28:debug("In pending mic mode, requesting permission");
                v473:emit("GetPermissions", function(v475) --[[ Line: 2494 ]]
                    -- upvalues: v473 (copy), l_PERMISSION_STATE_0 (ref), v28 (ref), v474 (copy)
                    v473.permissionState = if v475.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_AND_TALK else l_PERMISSION_STATE_0.LISTEN_ONLY;
                    v28:debug("Got permissions, setting state to {}", v473.permissionState);
                    v473:ToggleMic(v474);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return;
            elseif v473.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v28:debug("User tried to unmute despite being in listen only mode");
                v473:emit("OnPermissionRequested");
                return;
            end;
        end;
        if v473.isPlayerWatchingAd then
            v28:trace("User is watching an ad, skipping toggling mic");
            return;
        else
            if l_VoiceChatService_0.UseNewAudioApi then
                v473.localMuted = not v473.localMuted;
                local v476 = not v473.localMuted;
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v28:trace("Setting self mute to {} context: {}", v476, v474);
                else
                    v28:trace("Setting self mute to {}", v476);
                end;
                local l_v473_SendMuteEvent_0 = v473:GetSendMuteEvent();
                if l_v473_SendMuteEvent_0 then
                    l_v473_SendMuteEvent_0:FireServer(v476);
                    for v478 in v473.audioDevices do
                        if v478.Player and v478.Player == l_Players_0.LocalPlayer then
                            v478.Active = v476;
                        end;
                    end;
                    v473.muteChanged:Fire(v473.localMuted);
                else
                    v28:error("Could not find SendMuteEvent");
                end;
            else
                local v479 = not v473.service:IsPublishPaused();
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v28:trace("Setting self mute to {} context: {}", v479, v474);
                else
                    v28:trace("Setting self mute to {}", v479);
                end;
                v473.service:PublishPause(v479);
                v473.localMuted = v479;
                v473.muteChanged:Fire(v479);
            end;
            if not v473.localMuted then
                v473.talkingChanged:Fire(v473.isTalking);
                v473:emit("OnShowDataConsentToast");
            end;
            if v474 then
                v473.Analytics:reportVoiceMuteSelf((v473:JoinWithVoiceMuteData({
                    context = v474, 
                    muted = v473.localMuted
                })));
            end;
            return;
        end;
    end;
end;
v100.ToggleVoiceChanger = function(v480, _) --[[ Line: 2563 ]] --[[ Name: ToggleVoiceChanger ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v480:ensureInitialized("toggle voice changer");
    if v480.localMuted == nil then
        return;
    elseif l_VoiceChatService_0.UseNewAudioApi then
        v480.isVoiceChangerActive = not v480.isVoiceChangerActive;
        v28:trace("setting voice changer active to {}", v480.isVoiceChangerActive);
        local l_v480_ToggleVoiceChangerEvent_0 = v480:GetToggleVoiceChangerEvent();
        if l_v480_ToggleVoiceChangerEvent_0 then
            l_v480_ToggleVoiceChangerEvent_0:FireServer(v480.isVoiceChangerActive);
            v480.voiceChangerChanged:Fire(v480.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    else
        v480.isVoiceChangerActive = false;
        v28:trace("forcibly disabling voice changer since using old audio api", v480.isVoiceChangerActive);
        local l_v480_ToggleVoiceChangerEvent_1 = v480:GetToggleVoiceChangerEvent();
        if l_v480_ToggleVoiceChangerEvent_1 then
            l_v480_ToggleVoiceChangerEvent_1:FireServer(v480.isVoiceChangerActive);
            v480.voiceChangerChanged:Fire(v480.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    end;
end;
v100.ToggleVoiceChangerHearMyself = function(v484, _) --[[ Line: 2593 ]] --[[ Name: ToggleVoiceChangerHearMyself ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    if v484.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v484.isVoiceChangerHearMyselfActive = not v484.isVoiceChangerHearMyselfActive;
            local l_v484_InputToModifierWire_0 = v484:GetInputToModifierWire();
            local l_v484_PartyVoiceDeviceInput_0 = v484:GetPartyVoiceDeviceInput();
            if l_v484_InputToModifierWire_0 and l_v484_PartyVoiceDeviceInput_0 then
                v28:trace("setting voice changer hear myself active to {}", v484.isVoiceChangerHearMyselfActive);
                if v484.isVoiceChangerHearMyselfActive then
                    l_v484_InputToModifierWire_0.SourceInstance = l_v484_PartyVoiceDeviceInput_0;
                else
                    l_v484_InputToModifierWire_0.SourceInstance = nil;
                end;
                v484.voiceChangerHearMyselfChanged:Fire(v484.isVoiceChangerHearMyselfActive);
                return;
            else
                v28:error("Could not find InputToModifierWire or PartyVoiceDeviceInput");
            end;
        end;
        return;
    end;
end;
v100.SetVoicePack = function(v488, v489) --[[ Line: 2618 ]] --[[ Name: SetVoicePack ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v488:ensureInitialized("set voice pack");
    if v488.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v488.currentVoicePack = v489;
            v28:trace("setting current voice pack to {}", v488.currentVoicePack);
            local l_v488_SetVoicePackEvent_0 = v488:GetSetVoicePackEvent();
            if l_v488_SetVoicePackEvent_0 then
                l_v488_SetVoicePackEvent_0:FireServer("VoicePack_" .. v488.currentVoicePack);
                return;
            else
                v28:error("Could not find SetVoicePackEvent");
            end;
        end;
        return;
    end;
end;
v100.JoinWithVoiceMuteData = function(v491, v492) --[[ Line: 2637 ]] --[[ Name: JoinWithVoiceMuteData ]]
    -- upvalues: l_Players_0 (copy), v23 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return v23.Dictionary.join({
        userId = l_LocalPlayer_1.UserId, 
        clientSessionId = v491:GetSessionId(), 
        channelId = v491:GetChannelId()
    }, v492);
end;
v100._reportJoinFailed = function(v494, v495, v496) --[[ Line: 2646 ]] --[[ Name: _reportJoinFailed ]]
    -- upvalues: v44 (copy)
    if v44() then
        v494.Analytics:reportVoiceChatJoinResult(false, v495, v496);
    end;
    v494:emit("OnReportJoinFailed", v495);
end;
v100._asyncInit = function(v497) --[[ Line: 2653 ]] --[[ Name: _asyncInit ]]
    -- upvalues: v28 (copy), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy), v20 (copy), v22 (copy)
    v497:CheckCallState();
    return v497:canUseServiceAsync():andThen(function(_) --[[ Line: 2656 ]]
        -- upvalues: v28 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v497 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref), v20 (ref), v22 (ref)
        local v499 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v499 = "VoiceChatInternal";
            v28:debug("Using VoiceChatInternal");
        end;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 2662 ]]
            -- upvalues: v499 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v497 (ref)
            local l_game_Service_0 = game:GetService(v499);
            if l_game_Service_0 and (l_game_Service_0:GetVoiceChatApiVersion() < l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 or l_game_Service_0:IsContextVoiceEnabled()) then
                v497.voiceEnabled = true;
                v497.service = l_game_Service_0;
                v497:SetupParticipantListeners();
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
            v497:_reportJoinFailed("getServiceFailed", v20.ERROR);
            if v497.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_GET_SERVICE_FAILED"
                });
            else
                return v22.reject();
            end;
        elseif not v497.service then
            v28:debug("VoiceChatService is not set after init");
            v497:_reportJoinFailed("contextNotEnabled");
            if v497.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_CONTEXT_NOT_ENABLED"
                });
            else
                return v22.reject();
            end;
        else
            v497:emit("OnVoiceChatServiceInitialized");
            v497:watchSignalR();
            return v22.resolve();
        end;
    end);
end;
v100.UpdateLocalMetering = function(v504) --[[ Line: 2712 ]] --[[ Name: UpdateLocalMetering ]]
    -- upvalues: l_Players_0 (copy), v39 (copy)
    v504.isTalking = v504:IsSignalActive(l_Players_0.LocalPlayer.UserId);
    if v504.localMuted == false then
        if v39 then
            v504:FireTalkingChangedDebounced(v504.isTalking);
            return;
        else
            v504.talkingChanged:Fire(v504.isTalking);
        end;
    end;
end;
v100.FireTalkingChangedDebounced = function(v505, v506) --[[ Line: 2723 ]] --[[ Name: FireTalkingChangedDebounced ]]
    -- upvalues: v40 (copy)
    local l_v40_0 = v40;
    local v508 = tick() * 1000;
    if l_v40_0 < v508 - v505._lastTalkingChangedFireTime then
        v505._lastTalkingChangedFireTime = v508;
        v505.talkingChanged:Fire(v506);
    end;
end;
v100.asyncInit = function(v509) --[[ Line: 2733 ]] --[[ Name: asyncInit ]]
    -- upvalues: v28 (copy), v22 (copy), v30 (copy), l_HttpService_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v65 (copy), v17 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v34 (copy)
    if v509.service then
        v28:trace("Manager already initialized");
        return v22.resolve();
    else
        if not v509.initPromise then
            v509.initPromise = v509:_asyncInit();
            if v30 and not v509.LikelySpeakingUsersEvent then
                task.spawn(function() --[[ Line: 2745 ]]
                    -- upvalues: v509 (copy), v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref)
                    local l_v509_LikelySpeakingUsersEvent_0 = v509:GetLikelySpeakingUsersEvent();
                    if l_v509_LikelySpeakingUsersEvent_0 then
                        v28:trace("Connecting to likely speaking users");
                        l_v509_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v511) --[[ Line: 2749 ]]
                            -- upvalues: v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v509 (ref)
                            v28:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v511));
                            if l_GetFFlagShowLikelySpeakingBubbles_0() and v509:UserEligibleForLikelySpeakingBubbles() then
                                v509:emit("OnLikelySpeakingUsersUpdated", v511);
                            end;
                        end);
                    end;
                end);
            end;
            if v65 then
                v28:trace("Polling for likely speaking users");
                task.spawn(function() --[[ Line: 2763 ]]
                    -- upvalues: v509 (copy)
                    v509:SendLikelySpeakingPing();
                end);
            end;
            if v509.AdService then
                (function(v512) --[[ Line: 2769 ]] --[[ Name: setupRewardedAdMuting ]]
                    -- upvalues: v17 (ref)
                    local v513 = false;
                    v512.AdService.RewardedVideoAdStarted:Connect(function() --[[ Line: 2771 ]]
                        -- upvalues: v512 (copy), v513 (ref), v17 (ref)
                        if v512.localMuted == nil then
                            return;
                        else
                            v513 = v512.localMuted;
                            if not v512.localMuted then
                                v512:ToggleMic(v17.REWARDED_VIDEO_AD_STARTED);
                            end;
                            v512.isPlayerWatchingAd = true;
                            return;
                        end;
                    end);
                    v512.AdService.RewardedVideoAdEnded:Connect(function() --[[ Line: 2787 ]]
                        -- upvalues: v512 (copy), v513 (ref), v17 (ref)
                        if v512.localMuted == nil then
                            return;
                        else
                            v512.isPlayerWatchingAd = false;
                            if v513 ~= v512.localMuted then
                                v512:ToggleMic(v17.REWARDED_VIDEO_AD_ENDED);
                            end;
                            return;
                        end;
                    end);
                end)(v509);
            end;
            if l_FFlagEnablePartyVoiceChangersInLua_0 and not v509.voiceChangerWasToggledEvent then
                task.spawn(function() --[[ Line: 2807 ]]
                    -- upvalues: v509 (copy), v34 (ref)
                    local l_v509_VoiceChangerWasToggledEvent_0 = v509:GetVoiceChangerWasToggledEvent();
                    if l_v509_VoiceChangerWasToggledEvent_0 then
                        l_v509_VoiceChangerWasToggledEvent_0.OnClientEvent:Connect(function(v515, v516) --[[ Line: 2811 ]]
                            -- upvalues: v34 (ref), v509 (ref)
                            local v517 = if v34 then v509.participants[tostring(v515)] else v509.participants[v515];
                            if v517 then
                                v517.isVoiceChangerActive = v516;
                                v509.voiceChangerActivePlayers[v515] = v516;
                                v509.participantsUpdate:Fire(v509.participants);
                            end;
                        end);
                    end;
                end);
            end;
        end;
        return v509.initPromise;
    end;
end;
v100.GetLikelySpeakingUsersEvent = function(v518) --[[ Line: 2831 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v518.LikelySpeakingUsersEvent then
        v518.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v518.LikelySpeakingUsersEvent;
end;
v100.GetReceiveLikelySpeakingEvent = function(v519) --[[ Line: 2839 ]] --[[ Name: GetReceiveLikelySpeakingEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v519.ReceiveLikelySpeakingUsersEvent then
        v519.ReceiveLikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("ReceiveLikelySpeakingUsers", 3);
    end;
    return v519.ReceiveLikelySpeakingUsersEvent;
end;
v100.SendLikelySpeakingPing = function(v520) --[[ Line: 2847 ]] --[[ Name: SendLikelySpeakingPing ]]
    -- upvalues: v28 (copy)
    v520:FetchVoicePermissions();
    local l_v520_ReceiveLikelySpeakingEvent_0 = v520:GetReceiveLikelySpeakingEvent();
    if not l_v520_ReceiveLikelySpeakingEvent_0 or not v520:UserEligibleForLikelySpeakingBubbles() then
        v28:debug("Could not find likely speaking users event.");
        return;
    else
        v28:trace("Sending likely speaking user event");
        l_v520_ReceiveLikelySpeakingEvent_0:FireServer();
        return;
    end;
end;
v100.IsInitialized = function(v522) --[[ Line: 2858 ]] --[[ Name: IsInitialized ]]
    if v522.service then
        return true;
    else
        return false;
    end;
end;
v100.ensureInitialized = function(v523, v524) --[[ Line: 2862 ]] --[[ Name: ensureInitialized ]]
    if not v523.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v524 .. " before calling init");
    end;
end;
v100.GetSessionId = function(v525) --[[ Line: 2869 ]] --[[ Name: GetSessionId ]]
    v525:ensureInitialized("get session id");
    return v525.service:GetSessionId();
end;
v100.GetChannelId = function(v526) --[[ Line: 2874 ]] --[[ Name: GetChannelId ]]
    v526:ensureInitialized("get channel id");
    return v526.service:GetChannelId();
end;
v100.Disconnect = function(v527) --[[ Line: 2879 ]] --[[ Name: Disconnect ]]
    -- upvalues: v74 (copy)
    if v527.participantConnection then
        v527.participantConnection:Disconnect();
        v527.participantConnection = nil;
    end;
    if v527.stateConnection then
        v527.stateConnection:Disconnect();
        v527.stateConnection = nil;
    end;
    if v527.micConnection then
        v527.micConnection:Disconnect();
        v527.micConnection = nil;
    end;
    if v527.blockConnection then
        v527.blockConnection:Disconnect();
        v527.blockConnection = nil;
    end;
    if v527.playerModeratedConnection then
        v527.playerModeratedConnection:Disconnect();
        v527.playerModeratedConnection = nil;
    end;
    if v527.voiceToxicityModalConnection then
        v527.voiceToxicityModalConnection:Disconnect();
        v527.voiceToxicityModalConnection = nil;
    end;
    if v527.VoiceToxicityToastConnection then
        v527.VoiceToxicityToastConnection:Disconnect();
        v527.VoiceToxicityToastConnection = nil;
    end;
    if v527.voiceReverseNudgeConnection then
        v527.voiceReverseNudgeConnection:Disconnect();
        v527.voiceReverseNudgeConnection = nil;
    end;
    if v527.tempSetMicMutedToggleMicConnection then
        v527.tempSetMicMutedToggleMicConnection:Disconnect();
        v527.tempSetMicMutedToggleMicConnection = nil;
    end;
    if v74 and v527.videoCaptureInProgressConnection then
        v527.videoCaptureInProgressConnection:Disconnect();
        v527.videoCaptureInProgressConnection = nil;
    end;
end;
v100.RequestHidePublicVoiceUI = function(v528) --[[ Line: 2930 ]] --[[ Name: RequestHidePublicVoiceUI ]]
    task.defer(function() --[[ Line: 2931 ]]
        -- upvalues: v528 (copy)
        v528.setVoiceUIVisibility:Fire(false);
    end);
end;
v100.RequestShowPublicVoiceUI = function(v529) --[[ Line: 2936 ]] --[[ Name: RequestShowPublicVoiceUI ]]
    task.defer(function() --[[ Line: 2937 ]]
        -- upvalues: v529 (copy)
        v529.setVoiceUIVisibility:Fire(true);
    end);
end;
v100.default = v100.new(v27:GetAfterBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0, nil, nil, nil, nil, nil, l_ThirdPartyUserService_0, nil, l_AdService_0);
return v100;