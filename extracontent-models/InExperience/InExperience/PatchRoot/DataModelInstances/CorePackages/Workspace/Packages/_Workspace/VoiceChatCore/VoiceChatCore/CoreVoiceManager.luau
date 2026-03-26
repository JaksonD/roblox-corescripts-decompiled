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
local v67 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering2", false);
local v68 = game:DefineFastFlag("StopModerationConnectionOnLeave", false);
local v69 = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_game_EngineFeature_1 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local v73 = v41 and l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0();
local l_GetFFlagEnableVoiceSignal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceSignal;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_Parent_0.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagCheckUniversePlaceBeforeSuspending_0 = require(l_Parent_0.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
local l_GetFFlagDisconnectToastClientRewrite_0 = require(l_Parent_0.SharedFlags).GetFFlagDisconnectToastClientRewrite;
local l_GetFFlagEnableVrVoiceParity_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVrVoiceParity;
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
local v92 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v93 = require(l_Requests_0.GetShowPhoneVerificationUpsell);
local v94 = {
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
local v95 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v96 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v97 = if v73 then game:GetService("TelemetryService") else nil;
local v98 = {
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
    AvatarChatService = v95, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    ThirdPartyUserService = l_ThirdPartyUserService_0, 
    CaptureService = v96, 
    TelemetryService = v97, 
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
v98.__index = v98;
v98.new = function(v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109) --[[ Line: 305 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v20 (copy), l_AppStorageService_0 (copy), v98 (copy), v45 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v57 (copy), l_Players_1 (copy), v28 (copy), l_IXPServiceWrapper_0 (copy), v63 (copy), v64 (copy)
    local v110 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v101, 
        eventEmitter = v18.EventEmitter.new(), 
        service = v102, 
        PermissionsService = v100, 
        NotificationService = v104, 
        AvatarChatService = v105, 
        Analytics = v20.new(v103), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v99, 
        AppStorageService = v106 or l_AppStorageService_0, 
        ThirdPartyUserService = v107, 
        CaptureService = v108, 
        AdService = v109
    }, v98);
    if v45() then
        for _, v112 in l_WATCHED_MESSAGE_TYPES_0 do
            v110.SignalREventTable[v112] = Instance.new("BindableEvent");
        end;
    end;
    v110.shouldThrottleParticipantUpdate = false;
    v110.participantsStateThrottleTime = 0;
    v110.lastParticipantsStateUpdate = 0;
    v110.lastStateUpdateCounter = 0;
    if v57() > 0 then
        task.spawn(function() --[[ Line: 349 ]]
            -- upvalues: l_Players_1 (ref), v102 (copy), v28 (ref), l_IXPServiceWrapper_0 (ref), v63 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 350 ]]
                -- upvalues: l_Players_1 (ref), v102 (ref)
                if l_Players_1.LocalPlayer then
                    return v102:IsVoiceEnabledForUserIdAsync(l_Players_1.LocalPlayer.UserId);
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
        v110.participantsStateThrottleTime = v57() / 1000;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 366 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v63 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v63);
        end);
        if l_status_1 and l_result_1 and l_result_1[v64] then
            v110.shouldThrottleParticipantUpdate = true;
        end;
    end;
    return v110;
end;
v98.emit = function(v117, v118, ...) --[[ Line: 377 ]] --[[ Name: emit ]]
    v117.eventEmitter:emit(v118, ...);
end;
v98.subscribe = function(v119, v120, v121) --[[ Line: 381 ]] --[[ Name: subscribe ]]
    v119.eventEmitter:addListener(v120, v121);
end;
v98.unsubscribeAll = function(v122) --[[ Line: 385 ]] --[[ Name: unsubscribeAll ]]
    v122.eventEmitter:removeAllListeners();
end;
v98.CheckCallStateWithPromise = function(v123) --[[ Line: 389 ]] --[[ Name: CheckCallStateWithPromise ]]
    -- upvalues: l_default_0 (copy), v28 (copy), l_Enums_0 (copy)
    return l_default_0:getCallState():andThen(function(v124) --[[ Line: 391 ]]
        -- upvalues: v28 (ref), l_Enums_0 (ref), v123 (copy)
        v28:trace("Got user call state");
        if v124.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v124.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
            v123.isInCall = true;
            v123.callMutedState = v124.muted;
            v28:trace("Changing call muted state to {}", v124.muted);
        end;
    end):catch(function(v125) --[[ Line: 403 ]]
        -- upvalues: v28 (ref)
        v28:trace("User not in call {}", v125);
    end);
end;
v98.CheckCallState = function(v126) --[[ Line: 409 ]] --[[ Name: CheckCallState ]]
    -- upvalues: v28 (copy), l_default_0 (copy), l_Enums_0 (copy)
    v28:trace("Checking user call state");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 411 ]]
        -- upvalues: l_default_0 (ref), v28 (ref), l_Enums_0 (ref), v126 (copy)
        l_default_0:getCallState():andThen(function(v127) --[[ Line: 413 ]]
            -- upvalues: v28 (ref), l_Enums_0 (ref), v126 (ref)
            v28:trace("Got user call state");
            if v127.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v127.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v126.isInCall = true;
                v126.callMutedState = v127.muted;
                v28:trace("Changing call muted state to {}", v127.muted);
            end;
        end):catch(function(v128) --[[ Line: 425 ]]
            -- upvalues: v28 (ref)
            v28:trace("User not in call {}", v128);
        end);
    end);
    if not l_status_2 then
        v28:debug("Error checking user call state {}", l_result_2);
    end;
end;
v98._GetShowAgeVerificationOverlay = function(v131, v132) --[[ Line: 444 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: v92 (copy), v18 (copy)
    return v92(v18.bind(v131, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), v132);
end;
v98.FetchAgeVerificationOverlay = function(v133, v134) --[[ Line: 453 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: v22 (copy)
    if not v133._getShowAgeVerificationOverlayResult then
        if not v133._getShowAgeVerificationOverlayPromise then
            v133._getShowAgeVerificationOverlayPromise = v22.new(function(v135, _) --[[ Line: 456 ]]
                -- upvalues: v133 (copy), v134 (copy)
                v133._getShowAgeVerificationOverlayResult = v133:_GetShowAgeVerificationOverlay(v134);
                v135(v133._getShowAgeVerificationOverlayResult);
            end);
        end;
        v133._getShowAgeVerificationOverlayPromise:await();
    end;
    return v133._getShowAgeVerificationOverlayResult;
end;
v98._GetShowPhoneVerificationUpsell = function(v137, v138, v139) --[[ Line: 472 ]] --[[ Name: _GetShowPhoneVerificationUpsell ]]
    -- upvalues: v93 (copy), v18 (copy)
    return (v93(v18.bind(v137, "GetRequest"), tostring(game.GameId), v138, v139));
end;
v98.FetchPhoneVerificationUpsell = function(v140, v141, v142, v143) --[[ Line: 485 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    -- upvalues: v22 (copy), v17 (copy)
    if not v140._getShowPhoneVerificationUpsellResult then
        v140._getShowPhoneVerificationUpsellResult = {};
        v140._getShowPhoneVerificationUpsellPromise = {};
    end;
    if not v140._getShowPhoneVerificationUpsellResult[v141] or v143 then
        if not v140._getShowPhoneVerificationUpsellPromise[v141] or v143 then
            v140._getShowPhoneVerificationUpsellPromise[v141] = v22.new(function(v144, _) --[[ Line: 496 ]]
                -- upvalues: v140 (copy), v141 (copy), v142 (copy), v17 (ref)
                local v146 = v140:_GetShowPhoneVerificationUpsell(v141, v142);
                v140._getShowPhoneVerificationUpsellResult[v141] = if type(v146) == "table" and v146.valueProp ~= nil then v146.valueProp else v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
                v144();
            end);
        end;
        v140._getShowPhoneVerificationUpsellPromise[v141]:await();
    end;
    return v140._getShowPhoneVerificationUpsellResult[v141];
end;
v98.DisablePhoneVerificationUpsell = function(v147) --[[ Line: 510 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    -- upvalues: v23 (copy), v17 (copy)
    v147._getShowPhoneVerificationUpsellResult = v23.Dictionary.map(v147._getShowPhoneVerificationUpsellResult, function() --[[ Line: 513 ]]
        -- upvalues: v17 (ref)
        return v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
    end);
end;
v98.GetNudgeAnalyticsData = function(v148) --[[ Line: 519 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v148:GetSessionId();
end;
v98.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v149, v150) --[[ Line: 524 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v151 = {
        isUniverseEnabledForVoice = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UniverseAudio), 
        isPlaceEnabledForVoice = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.PlaceAudio), 
        isUniverseEnabledForAvatarVideo = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UniverseVideo), 
        isPlaceEnabledForAvatarVideo = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.PlaceVideo)
    };
    local v152 = {
        isUserEligible = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserAudioEligible), 
        isVoiceEnabled = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserAudio), 
        isAvatarVideoEligible = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserVideoEligible), 
        isAvatarVideoEnabled = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserVideo), 
        isUserVerifiedForVoice = if l_GetFFlagEnableVoiceSignal_0() then v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil, 
        isBanned = v149.AvatarChatService:IsEnabled(v150, Enum.AvatarChatServiceFeature.UserBanned), 
        bannedUntil = nil
    };
    return {
        universePlaceVoiceEnabledSettings = v151, 
        voiceSettings = v152
    };
end;
v98.resolveAvatarChatUserAndPlaceSettings = function(v153) --[[ Line: 571 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    local l_status_3, l_result_3 = pcall(v153.AvatarChatService.GetClientFeaturesAsync, v153.AvatarChatService);
    if not l_status_3 then
        return nil;
    else
        return v153:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_3);
    end;
end;
v98.GetRequest = function(v156, v157, _) --[[ Line: 581 ]] --[[ Name: GetRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 582 ]]
        -- upvalues: v156 (copy), v157 (copy), l_HttpService_0 (ref)
        local l_AsyncFullUrl_0 = v156.HttpRbxApiService:GetAsyncFullUrl(v157, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_AsyncFullUrl_0);
    end);
    return l_status_4 and l_result_4;
end;
v98.PostUserVoiceConnectionStatus = function(v162, v163) --[[ Line: 590 ]] --[[ Name: PostUserVoiceConnectionStatus ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    local l_status_5, _ = pcall(function() --[[ Line: 591 ]]
        -- upvalues: l_HttpService_0 (ref), v163 (copy), v162 (copy), v17 (ref)
        local v164 = l_HttpService_0:JSONEncode({
            IsUserVoiceConnected = v163
        });
        local v165 = v162.HttpRbxApiService:PostAsyncFullUrl(v17.VOICE_URL .. "/v1/user-voice-connection-state", v164);
        return l_HttpService_0:JSONDecode(v165);
    end);
    return l_status_5;
end;
v98.GetVoiceAnalyticsData = function(v168) --[[ Line: 600 ]] --[[ Name: GetVoiceAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_RbxAnalyticsService_0 (copy)
    return {
        universeId = game.GameId, 
        placeId = game.PlaceId, 
        playSessionId = if l_game_EngineFeature_1 then l_RbxAnalyticsService_0:GetPlaySessionId() else "", 
        voiceSessionId = if v168.service then v168:GetSessionId() else "", 
        micAvailability = ""
    };
end;
v98.RecordExperienceJoinMicPermissionStatus = function(v169, v170) --[[ Line: 612 ]] --[[ Name: RecordExperienceJoinMicPermissionStatus ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), l_PERMISSION_STATE_0 (copy)
    local l_v169_VoiceAnalyticsData_0 = v169:GetVoiceAnalyticsData();
    if v170 ~= nil and typeof(v170) == "table" then
        if v170.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
            l_v169_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v169_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    elseif v169.permissionState then
        if v169.permissionState == l_PERMISSION_STATE_0.LISTEN_AND_TALK then
            l_v169_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v169_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    end;
    v169.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", l_v169_VoiceAnalyticsData_0);
end;
v98.CheckCaptureMute = function(v172) --[[ Line: 632 ]] --[[ Name: CheckCaptureMute ]]
    -- upvalues: l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy)
    if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then
        return v172.CaptureService:IsCapturingVideo();
    else
        return false;
    end;
end;
v98.ToggleMuteSome = function(v173, v174, v175, v176, v177) --[[ Line: 641 ]] --[[ Name: ToggleMuteSome ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v173:ensureInitialized("mute some players");
    v173._mutedAnyone = true;
    local v178 = {};
    v175 = v175 or v173:CheckCaptureMute();
    for _, v180 in v174 do
        if l_VoiceChatService_0.UseNewAudioApi then
            v178[v180] = true;
            v173.mutedPlayers[v180] = v175;
        else
            v173.service:SubscribePause(v180, v175);
        end;
        local v181 = v173.participants[tostring(v180)];
        if v181 then
            v181.isMutedLocally = v175;
            v173.participantsUpdate:Fire(v173.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v182 in v173.audioDevices do
            if v182.Player and v178[v182.Player.UserId] then
                if l_game_EngineFeature_0 and v182.Player ~= l_Players_0.LocalPlayer then
                    v182.MutedByLocalUser = v175;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    v182.Active = not v175;
                end;
            end;
        end;
    end;
    if v176 and v177 then
        v173.Analytics:reportVoiceMuteGroup((v173:JoinWithVoiceMuteData({
            groupType = v176, 
            context = v177, 
            muted = v175
        })));
    end;
end;
v98.GetMutedAnyone = function(v183) --[[ Line: 686 ]] --[[ Name: GetMutedAnyone ]]
    return v183._mutedAnyone;
end;
v98.ToggleMutePlayer = function(v184, v185, v186) --[[ Line: 690 ]] --[[ Name: ToggleMutePlayer ]]
    -- upvalues: l_VoiceChatService_0 (copy), v29 (copy), v28 (copy), v18 (copy), v60 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v184:ensureInitialized("mute player " .. v185);
    v184._mutedAnyone = true;
    local v187 = (if l_VoiceChatService_0.UseNewAudioApi and v29 then not v184.mutedPlayers[v185] else not v184.service:IsSubscribePaused(v185)) or v184:CheckCaptureMute();
    v28:trace("Setting mute for {} to {}", v18.shorten(v185), v187);
    if v60() then
        v184.onPlayerMuteToggled:Fire();
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        v184.mutedPlayers[v185] = v187;
        for v188 in v184.audioDevices do
            if v188.Player and v188.Player.UserId == v185 then
                if l_game_EngineFeature_0 and v188.Player ~= l_Players_0.LocalPlayer then
                    v188.MutedByLocalUser = v187;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    local v189 = v184.participants[tostring(v185)];
                    local v190 = v189 and not v189.isMuted;
                    v188.Active = not v187 and v190;
                end;
            end;
        end;
        v184:emit("OnPlayerMuted");
    else
        v184.service:SubscribePause(v185, v187);
    end;
    for _, v192 in pairs(v184.participants) do
        if v192.userId == v185 then
            v192.isMutedLocally = v187;
            v184.participantsUpdate:Fire(v184.participants);
        end;
    end;
    if v186 then
        v184.Analytics:reportVoiceMuteIndividual((v184:JoinWithVoiceMuteData({
            targetUserId = tonumber(v185), 
            context = v186, 
            muted = v187
        })));
    end;
end;
v98.MuteAll = function(v193, v194, v195) --[[ Line: 744 ]] --[[ Name: MuteAll ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v17 (copy)
    v193:ensureInitialized("mute all");
    v193._mutedAnyone = true;
    v194 = v194 or v193:CheckCaptureMute();
    if l_VoiceChatService_0.UseNewAudioApi then
        v193.muteAll = v194;
        v28:trace("Setting self mute all to {} context: {}", v194, v195);
        for v196 in v193.audioDevices do
            if v196.Player and v196.Player ~= l_Players_0.LocalPlayer then
                v28:debug("Local muting {} to '{} = {}'", v196.Player.Name, v196.Active, v194);
                if l_game_EngineFeature_0 then
                    v196.MutedByLocalUser = v194;
                else
                    local l_UserId_0 = v196.Player.UserId;
                    v193.mutedPlayers[l_UserId_0] = v194;
                    local v198 = v193.participants[tostring(l_UserId_0)];
                    local v199 = v198 and not v198.isMuted;
                    v196.Active = not v194 and v199;
                end;
            end;
        end;
    else
        v193.service:SubscribePauseAll(v194);
    end;
    for _, v201 in pairs(v193.participants) do
        v201.isMutedLocally = v194;
        v193.participantsUpdate:Fire(v193.participants);
    end;
    v193.muteAllChanged:Fire(v194);
    if v195 then
        v193.Analytics:reportVoiceMuteGroup((v193:JoinWithVoiceMuteData({
            groupType = v17.VOICE_GROUP_TYPE.ALL, 
            context = v195, 
            muted = v194
        })));
    end;
end;
v98.FetchVoicePermissions = function(v202) --[[ Line: 787 ]] --[[ Name: FetchVoicePermissions ]]
    if not v202.communicationPermissionsResult then
        v202.communicationPermissionsResult = v202:resolveAvatarChatUserAndPlaceSettings();
    end;
    return v202.communicationPermissionsResult;
end;
v98.verifyUniverseAndPlaceCanUseVoice = function(v203) --[[ Line: 795 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v20 (copy)
    local v204 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v203:resolveAvatarChatUserAndPlaceSettings() else v203:FetchAgeVerificationOverlay();
    if not v204 then
        v203:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_0 = v204.universePlaceVoiceEnabledSettings;
        return l_universePlaceVoiceEnabledSettings_0 and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice and l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice;
    end;
end;
v98.IsUserInFTUX = function(v206) --[[ Line: 815 ]] --[[ Name: IsUserInFTUX ]]
    -- upvalues: l_GetFFlagSeamlessVoiceFTUX_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v28 (copy)
    if not l_GetFFlagSeamlessVoiceFTUX_0() then
        return false;
    elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v206:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local l_AppStorageService_1 = game:GetService("AppStorageService");
        local v208 = nil;
        if not pcall(function() --[[ Line: 825 ]]
            -- upvalues: l_AppStorageService_1 (copy), v208 (ref)
            v208 = l_AppStorageService_1:GetItem("SeamlessVoiceFTUX") == "true";
        end) then
            v28:warning("Failed to read FTUX/STUX from AppStorage");
            return false;
        else
            local v209 = v206:FetchAgeVerificationOverlay();
            if type(v209) == "table" and v209.voiceSettings and v209.voiceSettings.seamlessVoiceStatus ~= 3 then
                v28:debug("User not eligible for FTUX/STUX");
                return false;
            else
                return not v208;
            end;
        end;
    end;
end;
v98.isEnableDefaultVoiceOnForPlace = function(_) --[[ Line: 848 ]] --[[ Name: isEnableDefaultVoiceOnForPlace ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    return l_VoiceChatService_0.UseNewAudioApi or l_VoiceChatService_0.EnableDefaultVoice;
end;
v98.verifyPlaceCanUseVoice = function(v211, v212, v213) --[[ Line: 859 ]] --[[ Name: verifyPlaceCanUseVoice ]]
    -- upvalues: v20 (copy)
    if not v212 or not v213 then
        v211:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    elseif not v212.isUniverseEnabledForVoice then
        v211:_reportJoinFailed("universeNotEnabled");
        return false;
    else
        v211:emit("OnUserAndPlaceCanUseVoiceResolved", v213, v212);
        if not v212.isPlaceEnabledForVoice then
            v211:_reportJoinFailed("placeNotEnabled");
            return false;
        elseif not v211:isEnableDefaultVoiceOnForPlace() then
            return false;
        else
            return true;
        end;
    end;
end;
v98.EligibleForFaeUpsell = function(v214) --[[ Line: 884 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_FAE_ENABLED_0 (copy)
    local v215 = v214:FetchAgeVerificationOverlay();
    if not v215 or type(v215) ~= "table" then
        return false;
    else
        local v216 = v215.inExperienceFaeUpsell == l_FAE_ENABLED_0;
        local l_isPlaceEnabledForVoice_0 = v215.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        return v216 and l_isPlaceEnabledForVoice_0;
    end;
end;
v98.OptUserToJoinVoice = function(v218) --[[ Line: 894 ]] --[[ Name: OptUserToJoinVoice ]]
    -- upvalues: v28 (copy)
    v28:debug("Opting user to join voice on age verification");
    v218.hasOptedToJoinVoiceOnAgeVerification = true;
end;
v98.SetupFAECompleteListener = function(v219) --[[ Line: 899 ]] --[[ Name: SetupFAECompleteListener ]]
    -- upvalues: v28 (copy)
    v28:debug("Setting up FAE complete listener");
    if game:GetEngineFeature("ChatReconcileAccess") then
        v28:debug("Using ChatService ReconcileCommunicationAccessCompleted event");
        v219.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ Line: 903 ]]
            -- upvalues: v28 (ref), v219 (copy)
            v28:debug("FAE complete listener triggered, re-fetching voice permissions");
            v219.communicationPermissionsResult = nil;
            v219:FetchVoicePermissions();
            v219._getShowAgeVerificationOverlayResult = v219:_GetShowAgeVerificationOverlay();
            if v219.hasOptedToJoinVoiceOnAgeVerification then
                v28:debug("FAE complete listener triggered, attempting voice rejoin");
                if v219:IsSeamlessVoice() then
                    v28:debug("Opting-in user to voice");
                    v219.AvatarChatService:EnableVoice();
                    v219.attemptVoiceRejoin:Fire();
                end;
            end;
        end);
    end;
end;
v98.EligibleForAgeCheckToast = function(v220) --[[ Line: 923 ]] --[[ Name: EligibleForAgeCheckToast ]]
    -- upvalues: l_FAE_SETTINGS_TOAST_0 (copy)
    local v221 = v220:FetchAgeVerificationOverlay();
    if not v221 or type(v221) ~= "table" then
        return false;
    else
        local l_isPlaceEnabledForVoice_1 = v221.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        local v223 = v221.inExperienceFaeUpsell == l_FAE_SETTINGS_TOAST_0;
        return l_isPlaceEnabledForVoice_1 and v220:isEnableDefaultVoiceOnForPlace() and v223;
    end;
end;
v98.userAndPlaceCanUseVoice = function(v224) --[[ Line: 933 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v92 (copy), v18 (copy), v20 (copy), v28 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy)
    if v224.ThirdPartyUserService ~= nil and v224.ThirdPartyUserService:IsChatRestrictionSupported() and v224.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
        return false;
    else
        local v225 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v224:resolveAvatarChatUserAndPlaceSettings() else v92(v18.bind(v224, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
        if not v225 then
            v224:_reportJoinFailed("invalidResponse", v20.ERROR);
            return false;
        else
            if v224.options.forceVoiceEnabled then
                v225.voiceSettings.isVoiceEnabled = true;
                v28:debug("bypassing voice permissions check");
            end;
            local l_universePlaceVoiceEnabledSettings_1 = v225.universePlaceVoiceEnabledSettings;
            local l_voiceSettings_0 = v225.voiceSettings;
            v28:trace("Voice settings endpoint returned {}", v225);
            if not v224:verifyPlaceCanUseVoice(l_universePlaceVoiceEnabledSettings_1, l_voiceSettings_0) then
                return false;
            else
                if l_GetFFlagEnableVoiceSignal_0() then
                    v224.communicationPermissionsResult = v225;
                    local v228 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and os.time();
                    local v229 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v224:UserVoiceEnabled() and not l_voiceSettings_0.isUserVerifiedForVoice and (v224:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v228 and v224:FetchPhoneVerificationUpsell(v17.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v228) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat);
                    if v224:UserEligibleForInExperienceUpsell() or v229 then
                        v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                    end;
                    if l_GetFFlagEnableVoiceUxUpdates_0() then
                        local l_v224_VoiceConnectCookie_0 = v224:GetVoiceConnectCookie();
                        local v231 = v224:HasSeamlessVoiceFeature(v17.SeamlessVoiceFeatures.DeferConnection) and l_v224_VoiceConnectCookie_0 == "";
                        local v232 = v224:IsSeamlessVoice() and l_v224_VoiceConnectCookie_0 == "false";
                        if v231 or v232 then
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v224:EligibleForFaeUpsell() then
                            v28:debug("Suspending voice join for FAE Eligible user");
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                            v224:SetupFAECompleteListener();
                        end;
                    else
                        if l_GetFFlagNonVoiceFTUX_0() and v224:IsUserInFTUX() then
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                        if v224:IsSeamlessVoice() and not v224:GetVoiceConnectCookieValue() then
                            v28:debug("Suspending voice join due to voice connect cookie");
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v224:IsNewSeamlessVoiceUserDisconnect() then
                            v28:debug("Suspending voice join for new seamless voice user");
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v224:IsSeamlessVoice() and v224:UserOnlyEligibleForVoice() then
                            v28:debug("Suspending voice join for opt-out user");
                            v224:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                    end;
                    task.spawn(function() --[[ Line: 1030 ]]
                        -- upvalues: v224 (copy)
                        v224:FetchAgeVerificationOverlay();
                    end);
                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v224:UserEligibleForLikelySpeakingBubbles() then
                        v224:emit("OnShowLikelySpeakingBubblesChanged", true);
                    end;
                end;
                if not l_voiceSettings_0.isVoiceEnabled then
                    v224:_reportJoinFailed("userNotEnabled");
                end;
                return l_voiceSettings_0.isVoiceEnabled;
            end;
        end;
    end;
end;
v98.voicePermissionGranted = function(_, v234) --[[ Line: 1049 ]] --[[ Name: voicePermissionGranted ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), v23 (copy)
    local _ = false;
    if typeof(v234) == "table" then
        local v236 = true;
        if v234.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v236 = not v23.List.find(v234.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v236;
    else
        return v234 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v98.RawGetPermissions = function(v237, v238) --[[ Line: 1069 ]] --[[ Name: RawGetPermissions ]]
    -- upvalues: v22 (copy)
    return v22.new(function(v239, _) --[[ Line: 1070 ]]
        -- upvalues: v237 (copy), v238 (copy)
        v237:emit("GetPermissions", function(v241) --[[ Line: 1071 ]]
            -- upvalues: v239 (copy)
            v239(v241);
        end, v238, true, true);
    end);
end;
v98.requestMicPermission = function(v242) --[[ Line: 1078 ]] --[[ Name: requestMicPermission ]]
    -- upvalues: v28 (copy), l_PermissionsProtocol_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v22 (copy), v55 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), v61 (copy), v20 (copy)
    if v242.permissionPromise then
        v28:trace("PermissionProtocol already invoked");
        return v242.permissionPromise;
    else
        local v243 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v244 = nil;
        if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0(v242:IsSeamlessVoice()) then
            v28:debug("Requesting device permission");
            local v245 = nil;
            local v246 = nil;
            local v247, v248, v249 = pcall(function() --[[ Line: 1092 ]]
                -- upvalues: v242 (copy), v243 (copy)
                return v242:RawGetPermissions(v243):await();
            end);
            v245 = v247 and v248;
            v246 = v249;
            if v245 then
                if v246.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v242.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif v246.missingPermissions then
                    v242.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                elseif v246.deniedPermissions then
                    v242.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v28:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v242.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v28:error("PermissionsService call failed.");
                v242.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            end;
            v28:debug("Joining without mic permissions. Permission State: {}", v242.permissionState);
            v244 = v22.resolve();
        else
            v244 = if v55 then v22.new(function(v250, _) --[[ Line: 1121 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_GetFFlagEnableVrVoiceParity_0 (ref), v242 (copy), v243 (copy)
                local function v254(v252) --[[ Line: 1122 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v250 (copy)
                    local v253 = {
                        status = v252.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                    };
                    v250(v253);
                end;
                if l_GetFFlagEnableVrVoiceParity_0() then
                    v242:emit("GetPermissions", v254, v243, false, false);
                    return;
                else
                    v242:emit("GetPermissions", v254, v243);
                    return;
                end;
            end) else v242.PermissionsService:requestPermissions(v243);
        end;
        v242.permissionPromise = v244:andThen(function(v255) --[[ Line: 1141 ]]
            -- upvalues: v61 (ref), v242 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v22 (ref), v28 (ref), v20 (ref), v55 (ref), l_PermissionsProtocol_0 (ref)
            if v61() then
                v242:RecordExperienceJoinMicPermissionStatus(v255);
            end;
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                return v22.resolve();
            elseif not v255 and not v255.status then
                v28:debug("No permission response, rejecting access");
                v242:_reportJoinFailed("noPermissionResponse", v20.ERROR);
                if v242.options.passInitErrorInPromiseReject then
                    return v22.reject({
                        code = "INIT_ERROR_NO_PERM_RESPONSE"
                    });
                else
                    return v22.reject();
                end;
            else
                v28:debug("Permission status {}", v255.status);
                local v256 = nil;
                v256 = if v55 then v242:voicePermissionGranted(v255) else v255.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if v242.options.passInitErrorInPromiseReject and not v256 then
                    return v22.reject({
                        code = "INIT_ERROR_PERM_NOT_GRANTED"
                    });
                else
                    return v256 and v22.resolve() or v22.reject();
                end;
            end;
        end):andThen(function() --[[ Line: 1170 ]]
            -- upvalues: v242 (copy), v22 (ref)
            v242:emit("OnRequestMicPermissionResolved");
            return v22.resolve();
        end):catch(function() --[[ Line: 1175 ]]
            -- upvalues: v242 (copy), v22 (ref)
            v242:emit("OnRequestMicPermissionRejected");
            if v242.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_MIC_PERM_REJECTED"
                });
            else
                return v22.reject();
            end;
        end);
        return v242.permissionPromise;
    end;
end;
v98.JoinByGroupIdToken = function(v257, v258, v259) --[[ Line: 1185 ]] --[[ Name: JoinByGroupIdToken ]]
    v257.previousGroupId = v258;
    v257.previousMutedState = v259;
    return v257.service:JoinByGroupIdToken(v258, v259);
end;
v98.EnableVoice = function(v260) --[[ Line: 1191 ]] --[[ Name: EnableVoice ]]
    -- upvalues: v28 (copy)
    v28:trace("Enabling voice");
    v260.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ Line: 1194 ]]
        -- upvalues: v260 (copy)
        v260.attemptVoiceRejoin:Fire();
    end);
    v260.AvatarChatService:EnableVoice();
end;
v98.ChangeVoiceJoinProgress = function(v261, v262) --[[ Line: 1200 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    v261.VoiceJoinProgress = v262;
    v261.VoiceJoinProgressChanged:Fire(v261.VoiceJoinProgress);
end;
v98.setOptions = function(v263, v264) --[[ Line: 1205 ]] --[[ Name: setOptions ]]
    v263.options = v264;
end;
v98.ShouldShowJoinVoiceOnDisconnect = function(v265) --[[ Line: 1209 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy)
    return v265:IsSeamlessVoice() and v265.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended;
end;
v98.IsSeamlessVoice = function(v266) --[[ Line: 1213 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy)
    if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and not v266.options.allowSeamlessVoice then
        return false;
    else
        local v267 = v266:FetchAgeVerificationOverlay();
        if type(v267) ~= "table" or not v267 or not v267.voiceSettings then
            return false;
        elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v266:verifyUniverseAndPlaceCanUseVoice() then
            return false;
        else
            local l_seamlessVoiceStatus_0 = v267.voiceSettings.seamlessVoiceStatus;
            local v269 = true;
            if l_seamlessVoiceStatus_0 ~= v17.SeamlessVoiceStatus.EnabledExistingUser then
                v269 = l_seamlessVoiceStatus_0 == v17.SeamlessVoiceStatus.EnabledNewUser;
            end;
            return v269;
        end;
    end;
end;
v98.HasSeamlessVoiceFeature = function(v270, v271) --[[ Line: 1235 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    -- upvalues: v62 (copy), v18 (copy), v17 (copy)
    if not v270.options.allowSeamlessVoice or not v270:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v272 = v270:FetchAgeVerificationOverlay();
        if not v270:_isValidAgeVerificationOverlayData(v272) then
            return false;
        else
            local l_seamlessVoiceVariant_0 = v272.voiceSettings.seamlessVoiceVariant;
            if not l_seamlessVoiceVariant_0 then
                return false;
            else
                if v62() then
                    if type(v271) == "string" then
                        v271 = {
                            v271
                        };
                    end;
                    if v62(v271) then
                        local v274 = v18.jsonDecode(l_seamlessVoiceVariant_0);
                        local v275 = {};
                        for _, v277 in pairs(v274) do
                            v275[v277] = true;
                        end;
                        if #v271 == 1 and v271[1] == v17.SeamlessVoiceFeatures.ConnectDisconnect and l_seamlessVoiceVariant_0 == v17.SeamlessVoiceVariants.OnlyConnectDisconnect then
                            return true;
                        else
                            for _, v279 in pairs(v271) do
                                if not v275[v279] then
                                    return false;
                                end;
                            end;
                            return true;
                        end;
                    end;
                else
                    local v283 = ({
                        [v17.SeamlessVoiceFeatures.ConnectDisconnect] = function(v280) --[[ Line: 1280 ]]
                            -- upvalues: v17 (ref)
                            return v280 ~= v17.SeamlessVoiceVariants.Control;
                        end, 
                        [v17.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(v281) --[[ Line: 1283 ]]
                            -- upvalues: v17 (ref)
                            return v281 == v17.SeamlessVoiceVariants.HearingWithoutMicPermissions;
                        end, 
                        [v17.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function(v282) --[[ Line: 1286 ]]
                            -- upvalues: v17 (ref)
                            return v282 == v17.SeamlessVoiceVariants.LikelySpeakingBubblesRemoved;
                        end
                    })[v271];
                    if v283 then
                        return v283(l_seamlessVoiceVariant_0);
                    end;
                end;
                return false;
            end;
        end;
    end;
end;
v98.IsNewSeamlessVoiceUserDisconnect = function(v284) --[[ Line: 1300 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    -- upvalues: v17 (copy)
    if not v284.options.allowSeamlessVoice or not v284:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v285 = v284:FetchAgeVerificationOverlay();
        if not v284:_isValidAgeVerificationOverlayData(v285) then
            return false;
        elseif v285.voiceSettings.seamlessVoiceStatus ~= v17.SeamlessVoiceStatus.EnabledNewUser then
            return false;
        else
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 1319 ]]
                -- upvalues: v284 (copy), v17 (ref)
                return v284.AppStorageService:GetItem(v17.SEAMLESS_VOICE_FTUX_KEY);
            end);
            return l_status_6 and l_result_6 == "false";
        end;
    end;
end;
v98._isValidAgeVerificationOverlayData = function(_, v289) --[[ Line: 1327 ]] --[[ Name: _isValidAgeVerificationOverlayData ]]
    local v290 = false;
    if type(v289) == "table" then
        v290 = v289 and v289.voiceSettings;
    end;
    return v290;
end;
v98.UserInInExperienceUpsellTreatment = function(v291) --[[ Line: 1331 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    -- upvalues: v17 (copy)
    local v292 = v291:FetchAgeVerificationOverlay();
    if not v292 then
        return false;
    else
        local l_showVoiceInExperienceUpsellVariant_0 = v292.showVoiceInExperienceUpsellVariant;
        local v294 = true;
        if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT1 then
            v294 = true;
            if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT2 then
                v294 = l_showVoiceInExperienceUpsellVariant_0 == v17.IN_EXP_UPSELL_VARIANT.VARIANT3;
            end;
        end;
        return v294;
    end;
end;
v98.UserOnlyEligibleForVoice = function(v295) --[[ Line: 1343 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    -- upvalues: v35 (copy)
    local l_communicationPermissionsResult_0 = v295.communicationPermissionsResult;
    if not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings or not l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        if v35 then
            v295:FetchVoicePermissions();
            l_communicationPermissionsResult_0 = v295.communicationPermissionsResult;
        else
            return false;
        end;
    end;
    return l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
end;
v98.UserOnlyEligibleForVoiceViaOverlay = function(v297) --[[ Line: 1359 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    local v298 = v297:FetchAgeVerificationOverlay();
    if not v297:_isValidAgeVerificationOverlayData(v298) then
        return false;
    else
        return v298.voiceSettings.isVerifiedForVoice and not v298.voiceSettings.isVoiceEnabled and v298.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v98.UserVoiceEnabled = function(v299) --[[ Line: 1372 ]] --[[ Name: UserVoiceEnabled ]]
    local l_communicationPermissionsResult_1 = v299.communicationPermissionsResult;
    if not l_communicationPermissionsResult_1 or not l_communicationPermissionsResult_1.voiceSettings or not l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_1.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v98.UserEligibleForInExperienceUpsell = function(v301) --[[ Line: 1382 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v302 = v301:UserOnlyEligibleForVoice();
    if not v302 then
        return false;
    elseif l_GetFFlagEnableVoiceSignal_0() then
        local v303 = v301:UserInInExperienceUpsellTreatment();
        return v302 and v303;
    else
        local v304 = v301:FetchAgeVerificationOverlay();
        return v302 and v304 and v304.showVoiceInExperienceUpsell;
    end;
end;
v98.UserEligibleForLikelySpeakingBubbles = function(v305) --[[ Line: 1403 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    local v306 = v305:UserOnlyEligibleForVoice();
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v306 and not v305:UserVoiceEnabled() and v305:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then
        return true;
    elseif not l_GetFFlagEnableSeamlessVoiceV2_0() and not v306 then
        return false;
    else
        local v307 = v305:FetchAgeVerificationOverlay();
        if l_GetFFlagEnableSeamlessVoiceV2_0() then
            if not v305:_isValidAgeVerificationOverlayData(v307) then
                return false;
            else
                local v308 = v306 and v307 and v307.showVoiceInExperienceUpsell;
                local l_showM3LikelySpeakingBubbles_0 = v307.showM3LikelySpeakingBubbles;
                return v308 or l_showM3LikelySpeakingBubbles_0;
            end;
        else
            return v306 and v307 and v307.showVoiceInExperienceUpsell;
        end;
    end;
end;
v98.canUseServiceAsync = function(v310) --[[ Line: 1441 ]] --[[ Name: canUseServiceAsync ]]
    -- upvalues: v28 (copy), v22 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy), l_VoiceChatService_0 (copy), v36 (copy), l_IXPServiceWrapper_0 (copy), v37 (copy), v38 (copy)
    if v310.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        v28:debug("Voice Chat is not Available, rejecting canUseService promise");
        if v310.options.passInitErrorInPromiseReject then
            return v22.reject({
                code = "INIT_ERROR_VOICE_NOT_SUPPORTED"
            });
        else
            return v22.reject();
        end;
    else
        if not v310.canUseServicePromise then
            v310.canUseServicePromise = v22.defer(function(v311, v312) --[[ Line: 1451 ]]
                -- upvalues: v310 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v28 (ref), l_VOICE_CHAT_AVAILABILITY_0 (ref), l_VoiceChatService_0 (ref), v36 (ref), l_IXPServiceWrapper_0 (ref), v37 (ref), v38 (ref)
                local v313 = v310:userAndPlaceCanUseVoice();
                if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                    v310.canUseServiceResult = v313;
                    v310:emit("OnCanUseServiceResult", v313);
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v310.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v28:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v310.attemptVoiceRejoin.Event:Wait();
                    v28:debug("Attempting voice rejoin");
                    v310.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true;
                    v310.userEligible = true;
                    v310.initializedPostSuspension = true;
                    v311();
                    v310:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return;
                elseif not v313 then
                    v28:info("Voice access denied");
                    v310.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    if v310.options.passInitErrorInPromiseReject then
                        v312({
                            code = "INIT_ERROR_USER_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v312();
                        return;
                    end;
                elseif game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc or not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                    v28:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                    if not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                        v310:_reportJoinFailed("universeNotEnabled");
                    elseif not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                        v310:_reportJoinFailed("placeNotEnabled");
                    end;
                    v310.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                    if v310.options.passInitErrorInPromiseReject then
                        v312({
                            code = "INIT_ERROR_PLACE_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v312();
                        return;
                    end;
                elseif v36 then
                    l_IXPServiceWrapper_0:WaitForInitialization();
                    local l_status_7, l_result_7 = pcall(function() --[[ Line: 1511 ]]
                        -- upvalues: l_IXPServiceWrapper_0 (ref), v37 (ref)
                        return l_IXPServiceWrapper_0:GetLayerData(v37);
                    end);
                    if l_status_7 and l_result_7 and l_result_7[v38] ~= nil then
                        v310.userEligible = l_result_7[v38];
                        l_IXPServiceWrapper_0:LogUserLayerExposure(v37);
                    end;
                    if v310.userEligible then
                        v311();
                        return;
                    elseif v310.options.passInitErrorInPromiseReject then
                        v312({
                            code = "INIT_ERROR_IXP_NOT_ELIGIBLE"
                        });
                        return;
                    else
                        v312();
                        return;
                    end;
                else
                    v310.userEligible = true;
                    v311();
                    return;
                end;
            end):andThen(function() --[[ Line: 1533 ]]
                -- upvalues: v310 (copy)
                return v310:requestMicPermission();
            end);
        end;
        return v310.canUseServicePromise;
    end;
end;
v98._setRecentUserState = function(v316, v317, v318) --[[ Line: 1540 ]] --[[ Name: _setRecentUserState ]]
    -- upvalues: v23 (copy)
    local v319 = v316.recentUsersInteractionData[tostring(v317)] or {};
    local v320 = v23.Dictionary.join(v319, v318);
    v316.recentUsersInteractionData = v23.Dictionary.join(v316.recentUsersInteractionData, {
        [tostring(v317)] = v320
    });
end;
v98.getRecentUsersInteractionData = function(v321) --[[ Line: 1550 ]] --[[ Name: getRecentUsersInteractionData ]]
    v321:_updateRecentUsersInteractionData();
    return v321.recentUsersInteractionData;
end;
v98.GetSignalREvent = function(v322, v323) --[[ Line: 1555 ]] --[[ Name: GetSignalREvent ]]
    return v322.SignalREventTable[v323].Event;
end;
v98.StartModerationSignal = function(v324) --[[ Line: 1560 ]] --[[ Name: StartModerationSignal ]]
    -- upvalues: v28 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy)
    if not v324.playerModeratedConnection then
        v324.playerModeratedConnection = v324:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ Line: 1563 ]]
            -- upvalues: v28 (ref), v324 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
            v28:debug("User Moderated");
            v324.previousSessionId = v324.service:GetSessionId();
            v324:emit("OnPlayerModerated");
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                l_VoiceChatService_0:notifyServerACSCleanup();
                l_VoiceChatService_0:leaveVoice();
                return;
            else
                l_VoiceChatService_0:notifyServerACSCleanup();
                v324.service:Leave();
                return;
            end;
        end);
    end;
end;
v98.StopModerationSignal = function(v325) --[[ Line: 1578 ]] --[[ Name: StopModerationSignal ]]
    if v325.playerModeratedConnection then
        v325.playerModeratedConnection:Disconnect();
        v325.playerModeratedConnection = nil;
    end;
end;
v98._updateRecentUsersInteractionData = function(v326) --[[ Line: 1585 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    -- upvalues: v34 (copy), v50 (copy), l_Players_0 (copy), v51 (copy), v23 (copy)
    local v327 = os.time();
    local v328 = {};
    if v326.recentUsersInteractionData then
        for v329, v330 in pairs(v326.recentUsersInteractionData) do
            local v331 = if v34 then v326.participants[tostring(v329)] else v326.participants[v329];
            local v332 = v50() and not l_Players_0:GetPlayerByUserId((tonumber(v329)));
            local v333 = v327 - v330.lastHeardTime >= v51();
            local v334 = not v331 or v331.isMuted;
            if v333 and v334 or v332 then
                v328[v329] = v23.None;
            end;
        end;
        v326.recentUsersInteractionData = v23.Dictionary.join(v326.recentUsersInteractionData, v328);
    end;
end;
v98.SetupParticipantListeners = function(v335) --[[ Line: 1609 ]] --[[ Name: SetupParticipantListeners ]]
    -- upvalues: v28 (copy), v50 (copy), v34 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v29 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v56 (copy), v73 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v68 (copy), v69 (copy), l_GetFFlagDisconnectToastClientRewrite_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v67 (copy), l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), v39 (copy), v43 (copy), v48 (copy), v49 (copy), v18 (copy), v94 (copy)
    v335:ensureInitialized("setup participant listeners");
    if not v335.participants then
        v335.participants = {};
        v335.recentUsersInteractionData = {};
        v335.updatedParticipants = {};
        v335.participantConnection = v335.service.ParticipantsStateChanged:Connect(function(v336, v337, v338) --[[ Line: 1618 ]]
            -- upvalues: v28 (ref), v50 (ref), v335 (copy), v34 (ref), l_Players_0 (ref), l_VoiceChatService_0 (ref), v29 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v56 (ref), v73 (ref)
            v28:trace("Participants state changed");
            for _, v340 in ipairs(v336) do
                if not v50() and not v335.participants[tostring(v340)].isMuted then
                    v335:_setRecentUserState(v340, {
                        lastHeardTime = os.time()
                    });
                end;
                v335.participants[tostring(v340)] = nil;
                v335.participantLeft:Fire(v335.participants, v340);
                v335:emit("OnVoiceParticipantRemoved", v340);
            end;
            for _, v342 in ipairs(v337) do
                v335.participantJoined:Fire(v335.participants, v342);
                v335:emit("OnVoiceParticipantAdded", v342);
            end;
            for _, v344 in pairs(v338) do
                local l_userId_0 = v344.userId;
                local v346 = if v34 then v335.participants[tostring(l_userId_0)] else v335.participants[l_userId_0];
                if not v344.isMuted or v346 and not v346.isMuted then
                    v335:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v346 or v346.isMuted ~= v344.isMuted then
                    v335:emit("OnVoiceParticipantToggleMuted", l_userId_0, v344.isMuted);
                end;
                if l_VoiceChatService_0.UseNewAudioApi and v29 then
                    v344.isMutedLocally = not not v335.mutedPlayers[l_userId_0];
                end;
                if l_VoiceChatService_0.UseNewAudioApi then
                    v344.isMutedLocally = if v335.mutedPlayers[l_userId_0] then not not v335.mutedPlayers[l_userId_0] else v344.isMutedLocally;
                end;
                if l_FFlagEnablePartyVoiceChangersInLua_0 and l_VoiceChatService_0.UseNewAudioApi then
                    v344.isVoiceChangerActive = if v335.voiceChangerActivePlayers[l_userId_0] then v335.voiceChangerActivePlayers[l_userId_0] else v344.isVoiceChangerActive;
                end;
                if v335.muteAll then
                    v344.isMutedLocally = true;
                end;
                v335.participants[tostring(l_userId_0)] = v344;
                if v56() then
                    v335.updatedParticipants[tostring(l_userId_0)] = v344;
                end;
                if v73 and v335.CaptureService:IsCapturingVideo() then
                    v335.voiceCapturedDuringVideoCapture = v335.voiceCapturedDuringVideoCapture or v344.isSignalActive;
                end;
            end;
            v335:_updateRecentUsersInteractionData();
            if v335.shouldThrottleParticipantUpdate then
                local v347 = tick();
                if v347 - v335.lastParticipantsStateUpdate >= v335.participantsStateThrottleTime and #v338 > 0 then
                    v335.lastParticipantsStateUpdate = v347;
                    v335.participantsUpdate:Fire(if v56() then v335.updatedParticipants else v335.participants);
                    v335.updatedParticipants = {};
                    return;
                elseif #v338 > 0 then
                    local v348 = v335.participantsStateThrottleTime - (v347 - v335.lastParticipantsStateUpdate);
                    v335.lastStateUpdateCounter = (v335.lastStateUpdateCounter + 1) % 100;
                    local l_lastStateUpdateCounter_0 = v335.lastStateUpdateCounter;
                    task.wait(v348);
                    if l_lastStateUpdateCounter_0 == v335.lastStateUpdateCounter then
                        v335.participantsUpdate:Fire(if v56() then v335.updatedParticipants else v335.participants);
                        v335.updatedParticipants = {};
                        return;
                    end;
                end;
            elseif #v338 > 0 then
                v335.participantsUpdate:Fire(if v56() then v335.updatedParticipants else v335.participants);
                v335.updatedParticipants = {};
            end;
        end);
        local function v357(v350, v351) --[[ Line: 1734 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v335 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v28 (ref), v68 (ref), v69 (ref), l_GetFFlagDisconnectToastClientRewrite_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
            v335:emit("OnStateChanged", v350, v351);
            local v352 = v351 == Enum.VoiceChatState.Failed;
            local v353 = v351 == Enum.VoiceChatState.Joining;
            local v354 = v351 == Enum.VoiceChatState.Leaving;
            local v355 = v351 == Enum.VoiceChatState.Ended;
            local v356 = v335.service:IsPublishPaused();
            if v356 ~= v335.localMuted and not v352 and not v353 and not v354 and not v355 then
                v335.localMuted = v356;
                v335.muteChanged:Fire(v356);
            elseif v353 or v354 or v355 then
                v335.localMuted = nil;
            end;
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() and v351 == Enum.VoiceChatState.Joined and v335.isInCall and v356 ~= v335.callMutedState then
                v28:debug("In call, setting local muted to call muted state {}", v335.callMutedState);
                v335:ToggleMic("InitInCall");
            end;
            if v68 and v351 == Enum.VoiceChatState.Joined then
                v335:StartModerationSignal();
            end;
            if v351 == Enum.VoiceChatState.Leaving then
                if not v69 or not v335.previousGroupId then
                    v335.previousGroupId = v335.service:GetGroupId();
                end;
                v335.previousMutedState = v335.service:IsPublishPaused();
            end;
            if v351 == Enum.VoiceChatState.Ended or v352 then
                v335.participants = {};
                v335.localMuted = nil;
                v335.participantsUpdate:Fire(v335.participants);
                if v68 then
                    v335:StopModerationSignal();
                end;
                if v352 then
                    v28:debug("State Changed to Failed. Reason: {}", v335.service:GetAndClearCallFailureMessage());
                end;
                if v350 == Enum.VoiceChatState.Joining or v350 == Enum.VoiceChatState.JoiningRetry or v350 == Enum.VoiceChatState.Joined then
                    if v351 == Enum.VoiceChatState.Ended then
                        v28:debug("State Changed to Ended from {}", v350);
                    end;
                    if not l_GetFFlagDisconnectToastClientRewrite_0() or not v335:IsSeamlessVoice() or v335:GetVoiceConnectCookieValue() then
                        v335:emit("OnRetryRequested");
                    end;
                end;
            end;
            if l_GetFFlagEnableVoiceSignal_0() and v335.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v351 == Enum.VoiceChatState.Joined then
                v335:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                v335:emit("OnVoiceJoin");
            end;
        end;
        if v335.service.VoiceChatState and v335.service.VoiceChatState == Enum.VoiceChatState.Joined then
            v28:debug("Joined voice chat {}", v335.service.VoiceChatState);
            v357(nil, Enum.VoiceChatState.Joined);
        end;
        v335.stateConnection = v335.service.StateChanged:Connect(v357);
        if v67 and l_VoiceChatService_0.UseNewAudioApi then
            if not v335.localMeteringTask then
                v335.localMeteringTask = task.spawn(function() --[[ Line: 1821 ]]
                    -- upvalues: v335 (copy)
                    while true do
                        v335:UpdateLocalMetering();
                        task.wait();
                    end;
                end);
            end;
        elseif v335.service:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 then
            v335.micConnection = v335.service.PlayerMicActivitySignalChange:Connect(function(v358) --[[ Line: 1830 ]]
                -- upvalues: v73 (ref), v335 (copy), l_GetFFlagLocalMutedNilFix_0 (ref), v39 (ref)
                if v73 and v335.CaptureService:IsCapturingVideo() then
                    v335.voiceCapturedDuringVideoCapture = v335.voiceCapturedDuringVideoCapture or v358.isActive;
                end;
                v335.isTalking = v358.isActive;
                if l_GetFFlagLocalMutedNilFix_0() then
                    if v335.localMuted == false then
                        if v39 then
                            v335:FireTalkingChangedDebounced(v335.isTalking);
                            return;
                        else
                            v335.talkingChanged:Fire(v335.isTalking);
                            return;
                        end;
                    end;
                elseif not v335.localMuted then
                    if v39 then
                        v335:FireTalkingChangedDebounced(v335.isTalking);
                        return;
                    else
                        v335.talkingChanged:Fire(v335.isTalking);
                    end;
                end;
            end);
        end;
        if v43() then
            v335:StartModerationSignal();
        elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
            v335.playerModeratedConnection = v335.service.LocalPlayerModerated:connect(function() --[[ Line: 1863 ]]
                -- upvalues: v28 (ref), v335 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
                v28:debug("User Moderated old");
                v335.previousSessionId = v335.service:GetSessionId();
                v335:emit("OnPlayerModerated");
                if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                    l_VoiceChatService_0:leaveVoice();
                    return;
                else
                    v335.service:Leave();
                    return;
                end;
            end);
        end;
        if v48() then
            v28:trace("Setting up voice nudge handlers");
            v335.voiceToxicityModalConnection = v335:GetSignalREvent("VoiceToxicityModal"):Connect(function(v359) --[[ Line: 1877 ]]
                -- upvalues: v335 (copy)
                v335.Analytics:reportReceivedNudge(v359, v335:GetNudgeAnalyticsData());
                v335:emit("OnVoiceToxicityModal");
            end);
            v335.VoiceToxicityToastConnection = v335:GetSignalREvent("VoiceToxicityToast"):Connect(function(v360) --[[ Line: 1883 ]]
                -- upvalues: v335 (copy)
                v335.Analytics:reportReceivedNudge(v360, v335:GetNudgeAnalyticsData());
                v335:emit("OnVoiceToxicityToast");
            end);
        end;
        if v49() then
            v28:trace("Setting up voice reverse nudge handlers");
            v335.voiceReverseNudgeConnection = v335:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(v361) --[[ Line: 1891 ]]
                -- upvalues: v335 (copy)
                v335:emit("OnVoiceReverseNudgeIconColorChange", v361);
            end);
        end;
        v335.blockConnection = v335.BlockStatusChanged:Connect(function(v362, v363) --[[ Line: 1896 ]]
            -- upvalues: v335 (copy), v28 (ref), v18 (ref)
            if v363 then
                if v335.participants[tostring(v362)] then
                    v28:debug("Blocking {}", v18.shorten(v362));
                    v335.service:SubscribeBlock(v362);
                    return;
                end;
            else
                v28:debug("UnBlocking {}", v18.shorten(v362));
                v335.service:SubscribeUnblock(v362);
            end;
        end);
        if l_VoiceChatService_0.UseNewAudioApi then
            v335:hookupAudioDeviceInputListener();
        end;
        if v335.service.TempSetMicMutedToggleMic then
            v335.tempSetMicMutedToggleMicConnection = v335.service.TempSetMicMutedToggleMic:connect(function() --[[ Line: 1914 ]]
                -- upvalues: v335 (copy)
                v335:ToggleMic("TempSetMicMutedToggleMic");
            end);
        end;
        if v73 then
            v335.videoCaptureInProgressConnection = v335.CaptureService.VideoCaptureInProgress:connect(function(v364) --[[ Line: 1921 ]]
                -- upvalues: v335 (copy), v94 (ref)
                if v364 then
                    v335.voiceCapturedDuringVideoCapture = false;
                    return;
                else
                    v335.TelemetryService:LogEvent(v94, {
                        customFields = {
                            voiceCaptured = v335.voiceCapturedDuringVideoCapture
                        }
                    });
                    return;
                end;
            end);
        end;
    end;
end;
local v365 = nil;
v98.CheckAudioInputExists = function(v366) --[[ Line: 1936 ]] --[[ Name: CheckAudioInputExists ]]
    -- upvalues: v28 (copy), v365 (ref), v22 (copy), v23 (copy)
    v28:trace("Checking for AudioDeviceInput");
    if not v365 then
        v365 = v22.new(function(v367, _) --[[ Line: 1939 ]]
            -- upvalues: v23 (ref), v366 (copy), v28 (ref)
            if #v23.Dictionary.keys(v366.audioDevices) > 0 then
                v28:trace("Found existing AudioDeviceInput");
                v367();
                return;
            else
                v366.audioDeviceInputAdded.Event:Connect(function() --[[ Line: 1944 ]]
                    -- upvalues: v28 (ref), v367 (copy)
                    v28:trace("Found new AudioDeviceInput");
                    v367();
                end);
                return;
            end;
        end);
    end;
    return v365;
end;
v98.checkAndUpdateSequence = function(v369, v370, v371) --[[ Line: 1954 ]] --[[ Name: checkAndUpdateSequence ]]
    if not v371 then
        return 0;
    elseif not v369.SequenceNumbers[v370] then
        v369.SequenceNumbers[v370] = v371;
        return 0;
    else
        local v372 = v371 - v369.SequenceNumbers[v370];
        if v372 > 0 then
            v369.SequenceNumbers[v370] = v371;
        end;
        return v372 - 1;
    end;
end;
v98.onInstanceAdded = function(v373, v374) --[[ Line: 1977 ]] --[[ Name: onInstanceAdded ]]
    -- upvalues: v28 (copy)
    if v374:IsA("AudioDeviceInput") then
        v28:debug("Found new audio device instance for {}", v374.Player and v374.Player.Name);
        v373.audioDevices[v374] = v373:CreateAudioDeviceData(v374);
        v373:emit("OnAudioDeviceInputAdded");
        v373:StartAnalysis(v374);
    end;
end;
v98.GetSendMuteEvent = function(v375) --[[ Line: 1987 ]] --[[ Name: GetSendMuteEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v375.SendMuteEvent then
        v375.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v375.SendMuteEvent;
end;
v98.GetToggleVoiceChangerEvent = function(v376) --[[ Line: 1994 ]] --[[ Name: GetToggleVoiceChangerEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v376.SendVoiceChangerEvent then
        v376.SendVoiceChangerEvent = l_ReplicatedStorage_0:WaitForChild("ToggleUserVoiceChanger", 10);
    end;
    return v376.SendVoiceChangerEvent;
end;
v98.GetInputToModifierWire = function(v377) --[[ Line: 2001 ]] --[[ Name: GetInputToModifierWire ]]
    -- upvalues: l_Players_0 (copy)
    if not v377.InputToModifierWire then
        v377.InputToModifierWire = l_Players_0.LocalPlayer:FindFirstChild("InputToModifier");
    end;
    return v377.InputToModifierWire;
end;
v98.GetPartyVoiceDeviceInput = function(v378) --[[ Line: 2008 ]] --[[ Name: GetPartyVoiceDeviceInput ]]
    -- upvalues: l_Players_0 (copy)
    if not v378.PartyVoiceDeviceInput then
        v378.PartyVoiceDeviceInput = l_Players_0.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput");
    end;
    return v378.PartyVoiceDeviceInput;
end;
v98.GetSetVoicePackEvent = function(v379) --[[ Line: 2016 ]] --[[ Name: GetSetVoicePackEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v379.SetVoicePackEvent then
        v379.SetVoicePackEvent = l_ReplicatedStorage_0:WaitForChild("SetVoicePack", 10);
    end;
    return v379.SetVoicePackEvent;
end;
v98.GetVoiceChangerWasToggledEvent = function(v380) --[[ Line: 2023 ]] --[[ Name: GetVoiceChangerWasToggledEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v380.VoiceChangerWasToggledEvent then
        v380.VoiceChangerWasToggledEvent = l_ReplicatedStorage_0:WaitForChild("VoiceChangerWasToggled", 3);
    end;
    return v380.VoiceChangerWasToggledEvent;
end;
local function _(v381, v382) --[[ Line: 2031 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v381;
    l_Wire_0.TargetInstance = v382;
    l_Wire_0.Parent = v382;
    return l_Wire_0;
end;
local function _() --[[ Line: 2040 ]] --[[ Name: GetAnalysisHost ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    return l_RobloxReplicatedStorage_0;
end;
v98.GetAnalyzer = function(_, v387) --[[ Line: 2044 ]] --[[ Name: GetAnalyzer ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v388 = v387.Name .. "_Analyzer";
    local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
    local l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = l_l_RobloxReplicatedStorage_0_0:FindFirstChild(v388);
    if not l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 then
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = Instance.new("AudioAnalyzer");
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.SpectrumEnabled = false;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Name = v388;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Parent = l_l_RobloxReplicatedStorage_0_0;
    end;
    return l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0;
end;
local function _(v391) --[[ Line: 2057 ]] --[[ Name: toDecibels ]]
    return math.log10(v391) * 20;
end;
v98.IsSignalActive = function(v393, v394) --[[ Line: 2061 ]] --[[ Name: IsSignalActive ]]
    -- upvalues: v67 (copy), l_Players_0 (copy)
    if not v67 then
        return false;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v394);
        if not l_l_Players_0_PlayerByUserId_0 then
            return false;
        else
            return math.log10(v393:GetAnalyzer(l_l_Players_0_PlayerByUserId_0).PeakLevel) * 20 > -36;
        end;
    end;
end;
v98.StopAnalysis = function(_, v397) --[[ Line: 2075 ]] --[[ Name: StopAnalysis ]]
    -- upvalues: v67 (copy), l_RobloxReplicatedStorage_0 (copy)
    if not v67 then
        return;
    else
        for _, v399 in v397:GetConnectedWires("Output") do
            local l_TargetInstance_0 = v399.TargetInstance;
            if l_TargetInstance_0 and l_TargetInstance_0:IsDescendantOf(l_RobloxReplicatedStorage_0) then
                v399:Destroy();
            end;
        end;
        return;
    end;
end;
v98.StartAnalysis = function(v401, v402) --[[ Line: 2091 ]] --[[ Name: StartAnalysis ]]
    -- upvalues: v67 (copy)
    if not v67 then
        return;
    else
        v401:StopAnalysis(v402);
        local l_Player_0 = v402.Player;
        if not l_Player_0 then
            return;
        else
            local l_v401_Analyzer_0 = v401:GetAnalyzer(l_Player_0);
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = v402;
            l_Wire_1.TargetInstance = l_v401_Analyzer_0;
            l_Wire_1.Parent = l_v401_Analyzer_0;
            return;
        end;
    end;
end;
v98.GetVoiceConnectCookie = function(v406) --[[ Line: 2105 ]] --[[ Name: GetVoiceConnectCookie ]]
    -- upvalues: v17 (copy)
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 2106 ]]
        -- upvalues: v406 (copy), v17 (ref)
        return v406.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
    end);
    if l_status_8 and l_result_8 then
        return l_result_8;
    else
        return "";
    end;
end;
v98.GetVoiceConnectCookieValue = function(v409) --[[ Line: 2117 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 2119 ]]
            -- upvalues: v409 (copy), v17 (ref)
            return v409.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
        end);
        if l_status_9 then
            return l_result_9 == "true";
        else
            return true;
        end;
    else
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2125 ]]
            -- upvalues: v409 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref)
            return v409.AppStorageService:GetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY);
        end);
        if l_status_10 then
            return l_result_10 == "true";
        else
            return true;
        end;
    end;
end;
v98.SetVoiceConnectCookieValue = function(v414, v415) --[[ Line: 2137 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        return (pcall(function() --[[ Line: 2139 ]]
            -- upvalues: v414 (copy), v17 (ref), v415 (copy)
            v414.AppStorageService:SetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(v415)));
            v414.AppStorageService:Flush();
        end));
    else
        return (pcall(function() --[[ Line: 2145 ]]
            -- upvalues: v414 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref), v415 (copy)
            v414.AppStorageService:SetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY, (tostring(v415)));
            v414.AppStorageService:Flush();
        end));
    end;
end;
v98.SetNewUserFTUXCookieValue = function(v416, v417) --[[ Line: 2158 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    -- upvalues: v17 (copy)
    return (pcall(function() --[[ Line: 2159 ]]
        -- upvalues: v416 (copy), v17 (ref), v417 (copy)
        v416.AppStorageService:SetItem(v17.SEAMLESS_VOICE_FTUX_KEY, (tostring(v417)));
        v416.AppStorageService:Flush();
    end));
end;
v98.SetAndSyncActive = function(v418, v419, v420) --[[ Line: 2166 ]] --[[ Name: SetAndSyncActive ]]
    -- upvalues: l_Players_0 (copy)
    v419.Active = v420;
    local l_v418_SendMuteEvent_0 = v418:GetSendMuteEvent();
    if l_v418_SendMuteEvent_0 and v419.Player == l_Players_0.LocalPlayer then
        l_v418_SendMuteEvent_0:FireServer(v420);
    end;
end;
v98.CreateAudioDeviceData = function(v422, v423) --[[ Line: 2175 ]] --[[ Name: CreateAudioDeviceData ]]
    -- upvalues: l_Players_0 (copy), l_game_EngineFeature_0 (copy), v32 (copy), v28 (copy), v33 (copy)
    local v424 = {};
    local v425 = v423.Player == l_Players_0.LocalPlayer;
    if l_game_EngineFeature_0 then
        if not v423.MutedByLocalUser then
            if v422.muteAll and not v425 then
                v423.MutedByLocalUser = true;
            end;
            if v423.Player and v422.mutedPlayers[v423.Player.UserId] then
                v423.MutedByLocalUser = true;
            end;
        end;
    elseif v423.Active then
        if v422.muteAll and not v425 then
            v423.Active = false;
        end;
        if v423.Player and v422.mutedPlayers[v423.Player.UserId] then
            v423.Active = false;
        end;
    end;
    if v32 and v423.Active and v425 and v422.localMuted == nil then
        v422:SetAndSyncActive(v423, false);
    end;
    if v425 and v422.localMuted ~= nil and v422.localMuted ~= not v423.Active and not v422.isInCall then
        v28:debug("Mismatch between LocalMuted and device.Active");
        local v426 = not v422.localMuted;
        v423.Active = v426;
        local l_v422_SendMuteEvent_0 = v422:GetSendMuteEvent();
        if l_v422_SendMuteEvent_0 then
            l_v422_SendMuteEvent_0:FireServer(v426);
        end;
    elseif v422.isInCall and v425 then
        local v428 = not v422.callMutedState;
        v28:debug("Overwriting Active State to match Iris call. .Active = {}", v428);
        v423.Active = v428;
        local l_v422_SendMuteEvent_1 = v422:GetSendMuteEvent();
        if l_v422_SendMuteEvent_1 then
            l_v422_SendMuteEvent_1:FireServer(v428);
        end;
    end;
    v424.onPlayerChanged = v423:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 2227 ]]
        -- upvalues: v33 (ref), v425 (ref), v423 (copy), l_Players_0 (ref), v32 (ref), v422 (copy), v28 (ref), l_game_EngineFeature_0 (ref)
        if v33 then
            v425 = v423.Player == l_Players_0.LocalPlayer;
            if v425 then
                if v32 and v423.Active and v422.localMuted == nil then
                    v422:SetAndSyncActive(v423, false);
                elseif v422.localMuted ~= nil and v422.localMuted ~= not v423.Active then
                    v28:debug("Mismatch between LocalMuted and device.Active");
                    v422:SetAndSyncActive(v423, not v422.localMuted);
                end;
            elseif v422.muteAll or v423.Player and v422.mutedPlayers[v423.Player.UserId] then
                if l_game_EngineFeature_0 then
                    v423.MutedByLocalUser = true;
                else
                    v423.Active = false;
                end;
            end;
        end;
        v422:emit("OnDevicePlayerChanged");
        v422:StartAnalysis(v423);
    end);
    v424.onMutedChanged = v423:GetPropertyChangedSignal("Muted"):Connect(function() --[[ Line: 2252 ]]
        -- upvalues: v422 (copy)
        v422:emit("OnDeviceMuteChanged");
    end);
    if not l_game_EngineFeature_0 then
        v424.onActiveChanged = v423:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 2257 ]]
            -- upvalues: v422 (copy), v425 (ref), v423 (copy)
            v422:emit("OnDeviceActiveChanged");
            if v422.muteAll and not v425 then
                v423.Active = false;
            end;
            if v423.Player and v422.mutedPlayers[v423.Player.UserId] then
                v423.Active = false;
            end;
        end);
    end;
    return v424;
end;
v98.onInstanceRemove = function(v430, v431) --[[ Line: 2271 ]] --[[ Name: onInstanceRemove ]]
    -- upvalues: v28 (copy), l_game_EngineFeature_0 (copy), v67 (copy)
    if v431:IsA("AudioDeviceInput") then
        v430:StopAnalysis(v431);
        v28:trace("Removing AudioDeviceInput {} {} {}", v431, "for user", v431.Player and v431.Player.UserId);
        local v432 = v430.audioDevices[v431];
        if v432 then
            if not l_game_EngineFeature_0 then
                v432.onActiveChanged:Disconnect();
            end;
            v432.onMutedChanged:Disconnect();
            v432.onPlayerChanged:Disconnect();
        end;
        v430.audioDevices[v431] = nil;
        v430:emit("OnAudioDeviceInputRemoved");
        if v67 and v431.Player then
            v430:GetAnalyzer(v431.Player):Destroy();
        end;
    end;
end;
v98.hookupAudioDeviceInputListener = function(v433) --[[ Line: 2292 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    -- upvalues: v28 (copy), l_Players_0 (copy), v31 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), l_CollectionService_0 (copy), v18 (copy)
    v28:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v31 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v435) --[[ Line: 2296 ]]
            -- upvalues: v433 (copy)
            v433:onInstanceAdded(v435);
        end);
    else
        game.DescendantAdded:Connect(function(v436) --[[ Line: 2300 ]]
            -- upvalues: v433 (copy)
            v433:onInstanceAdded(v436);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v28:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v433:onInstanceAdded(l_AudioDeviceInput_0);
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
        for _, v442 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
            v18.destroyDefaultEmitter(v442);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v18.destroyDefaultEmitter);
        l_LocalPlayer_0.CharacterAdded:Connect(v18.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v18.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v443) --[[ Line: 2336 ]]
        -- upvalues: v433 (copy)
        v433:onInstanceRemove(v443);
    end);
    for _, v445 in game:GetDescendants() do
        v433:onInstanceAdded(v445);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v446) --[[ Line: 2345 ]]
        -- upvalues: v433 (copy)
        for v447 in v433.audioDevices do
            if v447.Player and v447.Player == v446 then
                v433:onInstanceRemove(v447);
            end;
        end;
    end);
end;
v98.RejoinCurrentChannel = function(v448) --[[ Line: 2355 ]] --[[ Name: RejoinCurrentChannel ]]
    -- upvalues: v46 (copy), v28 (copy)
    pcall(function() --[[ Line: 2356 ]]
        -- upvalues: v448 (copy), v46 (ref), v28 (ref)
        local l_GroupId_0 = v448.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v450 = v448.service:IsPublishPaused();
            v448.service:Leave();
            if v46() then
                v28:debug("Rejoining current channel {}", l_GroupId_0);
                v448.participants = {};
                v448.participantsUpdate:Fire(v448.participants);
            end;
            if not v448.service:JoinByGroupIdToken(l_GroupId_0, v450, true) then
                v448:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v98.RejoinChannel = function(v451, v452, v453) --[[ Line: 2375 ]] --[[ Name: RejoinChannel ]]
    -- upvalues: v28 (copy)
    v28:debug("Rejoining previous channel {} with mute status {}", v452, v453);
    if v452 and v452 ~= "" then
        pcall(function() --[[ Line: 2379 ]]
            -- upvalues: v451 (copy), v452 (copy), v453 (copy)
            v451.service:Leave();
            v451.participants = {};
            v451.participantsUpdate:Fire(v451.participants);
            if not v451.service:JoinByGroupIdToken(v452, v453, true) then
                v451:emit("OnInitialJoinFailed");
            end;
        end);
    end;
end;
v98.RejoinVoice = function(v454) --[[ Line: 2391 ]] --[[ Name: RejoinVoice ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v28 (copy), l_VoiceChatService_0 (copy)
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        v28:debug("Rejoining voice");
        v454.participants = {};
        v454.participantsUpdate:Fire(v454.participants);
        l_VoiceChatService_0:rejoinVoice();
    end;
end;
v98.watchSignalR = function(v455) --[[ Line: 2402 ]] --[[ Name: watchSignalR ]]
    -- upvalues: l_WATCHED_NAMESPACES_0 (copy), v18 (copy), v45 (copy), v28 (copy)
    v455.signalRConnection = v455.NotificationService.RobloxEventReceived:Connect(function(v456) --[[ Line: 2403 ]]
        -- upvalues: l_WATCHED_NAMESPACES_0 (ref), v18 (ref), v45 (ref), v455 (copy), v28 (ref)
        local l_namespace_0 = v456.namespace;
        if not l_WATCHED_NAMESPACES_0[l_namespace_0] then
            return;
        else
            local v458 = v18.jsonDecode(v456.detail);
            if v45() then
                local v459 = v455.SignalREventTable[v458.type];
                if v459 then
                    v459:Fire(v458);
                end;
            end;
            local l_SequenceNumber_0 = v458.SequenceNumber;
            v28:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v461 = v455:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v461 > 0 then
                v455.Analytics:reportReconnectDueToMissedSequence();
                return;
            else
                if v461 < -1 then
                    v455.Analytics:reportOutOfOrderSequence();
                end;
                return;
            end;
        end;
    end);
    v455.signalRConnectionChanged = v455.NotificationService.RobloxConnectionChanged:Connect(function(v462, v463, _, v465) --[[ Line: 2429 ]]
        -- upvalues: v28 (ref), v18 (ref), l_WATCHED_NAMESPACES_0 (ref), v455 (copy)
        if v462 == "signalR" then
            if v463 ~= Enum.ConnectionState.Connected then
                v28:info("SignalR disconnected");
                return;
            else
                for v466, v467 in pairs(v18.jsonDecode(v465)) do
                    if l_WATCHED_NAMESPACES_0[v466] then
                        v28:trace("SignalR message {}: {}", v466, v467);
                        local v468 = v455:checkAndUpdateSequence(v466, v467);
                        if v468 > 0 then
                            v455.Analytics:reportReconnectDueToMissedSequence();
                        elseif v468 < -1 then
                            v455.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v98.StopSignalRConnection = function(v469) --[[ Line: 2454 ]] --[[ Name: StopSignalRConnection ]]
    if v469.signalRConnectionChanged then
        v469.signalRConnectionChanged:Disconnect();
        v469.signalRConnectionChanged = nil;
    end;
    if v469.signalRConnection then
        v469.signalRConnection:Disconnect();
        v469.signalRConnection = nil;
    end;
end;
v98.getService = function(v470) --[[ Line: 2465 ]] --[[ Name: getService ]]
    return v470.service;
end;
v98.ToggleMic = function(v471, v472) --[[ Line: 2469 ]] --[[ Name: ToggleMic ]]
    -- upvalues: v28 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), l_PermissionsProtocol_0 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy)
    v471:ensureInitialized("toggle mic");
    if v471.localMuted == nil then
        v28:trace("ToggleMic context: {} - Voice not connected yet", v472);
        return;
    else
        v28:trace("ToggleMic context: {}", v472);
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if v471.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v28:debug("In pending mic mode, requesting permission");
                v471:emit("GetPermissions", function(v473) --[[ Line: 2482 ]]
                    -- upvalues: v471 (copy), l_PERMISSION_STATE_0 (ref), v28 (ref), v472 (copy)
                    v471.permissionState = if v473.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_AND_TALK else l_PERMISSION_STATE_0.LISTEN_ONLY;
                    v28:debug("Got permissions, setting state to {}", v471.permissionState);
                    v471:ToggleMic(v472);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return;
            elseif v471.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v28:debug("User tried to unmute despite being in listen only mode");
                v471:emit("OnPermissionRequested");
                return;
            end;
        end;
        if v471.isPlayerWatchingAd then
            v28:trace("User is watching an ad, skipping toggling mic");
            return;
        else
            if l_VoiceChatService_0.UseNewAudioApi then
                v471.localMuted = not v471.localMuted;
                local v474 = not v471.localMuted;
                v28:trace("Setting self mute to {} context: {}", v474, v472);
                local l_v471_SendMuteEvent_0 = v471:GetSendMuteEvent();
                if l_v471_SendMuteEvent_0 then
                    l_v471_SendMuteEvent_0:FireServer(v474);
                    for v476 in v471.audioDevices do
                        if v476.Player and v476.Player == l_Players_0.LocalPlayer then
                            v476.Active = v474;
                        end;
                    end;
                    v471.muteChanged:Fire(v471.localMuted);
                else
                    v28:error("Could not find SendMuteEvent");
                end;
            else
                local v477 = not v471.service:IsPublishPaused();
                v28:trace("Setting self mute to {} context: {}", v477, v472);
                v471.service:PublishPause(v477);
                v471.localMuted = v477;
                v471.muteChanged:Fire(v477);
            end;
            if not v471.localMuted then
                v471.talkingChanged:Fire(v471.isTalking);
                v471:emit("OnShowDataConsentToast");
            end;
            if v472 then
                v471.Analytics:reportVoiceMuteSelf((v471:JoinWithVoiceMuteData({
                    context = v472, 
                    muted = v471.localMuted
                })));
            end;
            return;
        end;
    end;
end;
v98.ToggleVoiceChanger = function(v478, _) --[[ Line: 2543 ]] --[[ Name: ToggleVoiceChanger ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v478:ensureInitialized("toggle voice changer");
    if v478.localMuted == nil then
        return;
    elseif l_VoiceChatService_0.UseNewAudioApi then
        v478.isVoiceChangerActive = not v478.isVoiceChangerActive;
        v28:trace("setting voice changer active to {}", v478.isVoiceChangerActive);
        local l_v478_ToggleVoiceChangerEvent_0 = v478:GetToggleVoiceChangerEvent();
        if l_v478_ToggleVoiceChangerEvent_0 then
            l_v478_ToggleVoiceChangerEvent_0:FireServer(v478.isVoiceChangerActive);
            v478.voiceChangerChanged:Fire(v478.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    else
        v478.isVoiceChangerActive = false;
        v28:trace("forcibly disabling voice changer since using old audio api", v478.isVoiceChangerActive);
        local l_v478_ToggleVoiceChangerEvent_1 = v478:GetToggleVoiceChangerEvent();
        if l_v478_ToggleVoiceChangerEvent_1 then
            l_v478_ToggleVoiceChangerEvent_1:FireServer(v478.isVoiceChangerActive);
            v478.voiceChangerChanged:Fire(v478.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    end;
end;
v98.ToggleVoiceChangerHearMyself = function(v482, _) --[[ Line: 2573 ]] --[[ Name: ToggleVoiceChangerHearMyself ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    if v482.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v482.isVoiceChangerHearMyselfActive = not v482.isVoiceChangerHearMyselfActive;
            local l_v482_InputToModifierWire_0 = v482:GetInputToModifierWire();
            local l_v482_PartyVoiceDeviceInput_0 = v482:GetPartyVoiceDeviceInput();
            if l_v482_InputToModifierWire_0 and l_v482_PartyVoiceDeviceInput_0 then
                v28:trace("setting voice changer hear myself active to {}", v482.isVoiceChangerHearMyselfActive);
                if v482.isVoiceChangerHearMyselfActive then
                    l_v482_InputToModifierWire_0.SourceInstance = l_v482_PartyVoiceDeviceInput_0;
                else
                    l_v482_InputToModifierWire_0.SourceInstance = nil;
                end;
                v482.voiceChangerHearMyselfChanged:Fire(v482.isVoiceChangerHearMyselfActive);
                return;
            else
                v28:error("Could not find InputToModifierWire or PartyVoiceDeviceInput");
            end;
        end;
        return;
    end;
end;
v98.SetVoicePack = function(v486, v487) --[[ Line: 2598 ]] --[[ Name: SetVoicePack ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v486:ensureInitialized("set voice pack");
    if v486.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v486.currentVoicePack = v487;
            v28:trace("setting current voice pack to {}", v486.currentVoicePack);
            local l_v486_SetVoicePackEvent_0 = v486:GetSetVoicePackEvent();
            if l_v486_SetVoicePackEvent_0 then
                l_v486_SetVoicePackEvent_0:FireServer("VoicePack_" .. v486.currentVoicePack);
                return;
            else
                v28:error("Could not find SetVoicePackEvent");
            end;
        end;
        return;
    end;
end;
v98.JoinWithVoiceMuteData = function(v489, v490) --[[ Line: 2617 ]] --[[ Name: JoinWithVoiceMuteData ]]
    -- upvalues: l_Players_0 (copy), v23 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return v23.Dictionary.join({
        userId = l_LocalPlayer_1.UserId, 
        clientSessionId = v489:GetSessionId(), 
        channelId = v489:GetChannelId()
    }, v490);
end;
v98._reportJoinFailed = function(v492, v493, v494) --[[ Line: 2626 ]] --[[ Name: _reportJoinFailed ]]
    -- upvalues: v44 (copy)
    if v44() then
        v492.Analytics:reportVoiceChatJoinResult(false, v493, v494);
    end;
    v492:emit("OnReportJoinFailed", v493);
end;
v98._asyncInit = function(v495) --[[ Line: 2633 ]] --[[ Name: _asyncInit ]]
    -- upvalues: v28 (copy), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy), v20 (copy), v22 (copy)
    v495:CheckCallState();
    return v495:canUseServiceAsync():andThen(function(_) --[[ Line: 2636 ]]
        -- upvalues: v28 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v495 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref), v20 (ref), v22 (ref)
        local v497 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v497 = "VoiceChatInternal";
            v28:debug("Using VoiceChatInternal");
        end;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 2642 ]]
            -- upvalues: v497 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v495 (ref)
            local l_game_Service_0 = game:GetService(v497);
            if l_game_Service_0 and (l_game_Service_0:GetVoiceChatApiVersion() < l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 or l_game_Service_0:IsContextVoiceEnabled()) then
                v495.voiceEnabled = true;
                v495.service = l_game_Service_0;
                v495:SetupParticipantListeners();
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
            v495:_reportJoinFailed("getServiceFailed", v20.ERROR);
            if v495.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_GET_SERVICE_FAILED"
                });
            else
                return v22.reject();
            end;
        elseif not v495.service then
            v28:debug("VoiceChatService is not set after init");
            v495:_reportJoinFailed("contextNotEnabled");
            if v495.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_CONTEXT_NOT_ENABLED"
                });
            else
                return v22.reject();
            end;
        else
            v495:emit("OnVoiceChatServiceInitialized");
            v495:watchSignalR();
            return v22.resolve();
        end;
    end);
end;
v98.UpdateLocalMetering = function(v502) --[[ Line: 2692 ]] --[[ Name: UpdateLocalMetering ]]
    -- upvalues: l_Players_0 (copy), v39 (copy)
    v502.isTalking = v502:IsSignalActive(l_Players_0.LocalPlayer.UserId);
    if v502.localMuted == false then
        if v39 then
            v502:FireTalkingChangedDebounced(v502.isTalking);
            return;
        else
            v502.talkingChanged:Fire(v502.isTalking);
        end;
    end;
end;
v98.FireTalkingChangedDebounced = function(v503, v504) --[[ Line: 2703 ]] --[[ Name: FireTalkingChangedDebounced ]]
    -- upvalues: v40 (copy)
    local l_v40_0 = v40;
    local v506 = tick() * 1000;
    if l_v40_0 < v506 - v503._lastTalkingChangedFireTime then
        v503._lastTalkingChangedFireTime = v506;
        v503.talkingChanged:Fire(v504);
    end;
end;
v98.asyncInit = function(v507) --[[ Line: 2713 ]] --[[ Name: asyncInit ]]
    -- upvalues: v28 (copy), v22 (copy), v30 (copy), l_HttpService_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v65 (copy), v17 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v34 (copy)
    if v507.service then
        v28:trace("Manager already initialized");
        return v22.resolve();
    else
        if not v507.initPromise then
            v507.initPromise = v507:_asyncInit();
            if v30 and not v507.LikelySpeakingUsersEvent then
                task.spawn(function() --[[ Line: 2725 ]]
                    -- upvalues: v507 (copy), v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref)
                    local l_v507_LikelySpeakingUsersEvent_0 = v507:GetLikelySpeakingUsersEvent();
                    if l_v507_LikelySpeakingUsersEvent_0 then
                        v28:trace("Connecting to likely speaking users");
                        l_v507_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v509) --[[ Line: 2729 ]]
                            -- upvalues: v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v507 (ref)
                            v28:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v509));
                            if l_GetFFlagShowLikelySpeakingBubbles_0() and v507:UserEligibleForLikelySpeakingBubbles() then
                                v507:emit("OnLikelySpeakingUsersUpdated", v509);
                            end;
                        end);
                    end;
                end);
            end;
            if v65 then
                v28:trace("Polling for likely speaking users");
                task.spawn(function() --[[ Line: 2743 ]]
                    -- upvalues: v507 (copy)
                    v507:SendLikelySpeakingPing();
                end);
            end;
            if v507.AdService then
                (function(v510) --[[ Line: 2749 ]] --[[ Name: setupRewardedAdMuting ]]
                    -- upvalues: v17 (ref)
                    local v511 = false;
                    v510.AdService.RewardedVideoAdStarted:Connect(function() --[[ Line: 2751 ]]
                        -- upvalues: v510 (copy), v511 (ref), v17 (ref)
                        if v510.localMuted == nil then
                            return;
                        else
                            v511 = v510.localMuted;
                            if not v510.localMuted then
                                v510:ToggleMic(v17.REWARDED_VIDEO_AD_STARTED);
                            end;
                            v510.isPlayerWatchingAd = true;
                            return;
                        end;
                    end);
                    v510.AdService.RewardedVideoAdEnded:Connect(function() --[[ Line: 2767 ]]
                        -- upvalues: v510 (copy), v511 (ref), v17 (ref)
                        if v510.localMuted == nil then
                            return;
                        else
                            v510.isPlayerWatchingAd = false;
                            if v511 ~= v510.localMuted then
                                v510:ToggleMic(v17.REWARDED_VIDEO_AD_ENDED);
                            end;
                            return;
                        end;
                    end);
                end)(v507);
            end;
            if l_FFlagEnablePartyVoiceChangersInLua_0 and not v507.voiceChangerWasToggledEvent then
                task.spawn(function() --[[ Line: 2787 ]]
                    -- upvalues: v507 (copy), v34 (ref)
                    local l_v507_VoiceChangerWasToggledEvent_0 = v507:GetVoiceChangerWasToggledEvent();
                    if l_v507_VoiceChangerWasToggledEvent_0 then
                        l_v507_VoiceChangerWasToggledEvent_0.OnClientEvent:Connect(function(v513, v514) --[[ Line: 2791 ]]
                            -- upvalues: v34 (ref), v507 (ref)
                            local v515 = if v34 then v507.participants[tostring(v513)] else v507.participants[v513];
                            if v515 then
                                v515.isVoiceChangerActive = v514;
                                v507.voiceChangerActivePlayers[v513] = v514;
                                v507.participantsUpdate:Fire(v507.participants);
                            end;
                        end);
                    end;
                end);
            end;
        end;
        return v507.initPromise;
    end;
end;
v98.GetLikelySpeakingUsersEvent = function(v516) --[[ Line: 2811 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v516.LikelySpeakingUsersEvent then
        v516.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v516.LikelySpeakingUsersEvent;
end;
v98.GetReceiveLikelySpeakingEvent = function(v517) --[[ Line: 2819 ]] --[[ Name: GetReceiveLikelySpeakingEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v517.ReceiveLikelySpeakingUsersEvent then
        v517.ReceiveLikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("ReceiveLikelySpeakingUsers", 3);
    end;
    return v517.ReceiveLikelySpeakingUsersEvent;
end;
v98.SendLikelySpeakingPing = function(v518) --[[ Line: 2827 ]] --[[ Name: SendLikelySpeakingPing ]]
    -- upvalues: v28 (copy)
    v518:FetchVoicePermissions();
    local l_v518_ReceiveLikelySpeakingEvent_0 = v518:GetReceiveLikelySpeakingEvent();
    if not l_v518_ReceiveLikelySpeakingEvent_0 or not v518:UserEligibleForLikelySpeakingBubbles() then
        v28:debug("Could not find likely speaking users event.");
        return;
    else
        v28:trace("Sending likely speaking user event");
        l_v518_ReceiveLikelySpeakingEvent_0:FireServer();
        return;
    end;
end;
v98.IsInitialized = function(v520) --[[ Line: 2838 ]] --[[ Name: IsInitialized ]]
    if v520.service then
        return true;
    else
        return false;
    end;
end;
v98.ensureInitialized = function(v521, v522) --[[ Line: 2842 ]] --[[ Name: ensureInitialized ]]
    if not v521.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v522 .. " before calling init");
    end;
end;
v98.GetSessionId = function(v523) --[[ Line: 2849 ]] --[[ Name: GetSessionId ]]
    v523:ensureInitialized("get session id");
    return v523.service:GetSessionId();
end;
v98.GetChannelId = function(v524) --[[ Line: 2854 ]] --[[ Name: GetChannelId ]]
    v524:ensureInitialized("get channel id");
    return v524.service:GetChannelId();
end;
v98.Disconnect = function(v525) --[[ Line: 2859 ]] --[[ Name: Disconnect ]]
    -- upvalues: v73 (copy)
    if v525.participantConnection then
        v525.participantConnection:Disconnect();
        v525.participantConnection = nil;
    end;
    if v525.stateConnection then
        v525.stateConnection:Disconnect();
        v525.stateConnection = nil;
    end;
    if v525.micConnection then
        v525.micConnection:Disconnect();
        v525.micConnection = nil;
    end;
    if v525.blockConnection then
        v525.blockConnection:Disconnect();
        v525.blockConnection = nil;
    end;
    if v525.playerModeratedConnection then
        v525.playerModeratedConnection:Disconnect();
        v525.playerModeratedConnection = nil;
    end;
    if v525.voiceToxicityModalConnection then
        v525.voiceToxicityModalConnection:Disconnect();
        v525.voiceToxicityModalConnection = nil;
    end;
    if v525.VoiceToxicityToastConnection then
        v525.VoiceToxicityToastConnection:Disconnect();
        v525.VoiceToxicityToastConnection = nil;
    end;
    if v525.voiceReverseNudgeConnection then
        v525.voiceReverseNudgeConnection:Disconnect();
        v525.voiceReverseNudgeConnection = nil;
    end;
    if v525.tempSetMicMutedToggleMicConnection then
        v525.tempSetMicMutedToggleMicConnection:Disconnect();
        v525.tempSetMicMutedToggleMicConnection = nil;
    end;
    if v73 and v525.videoCaptureInProgressConnection then
        v525.videoCaptureInProgressConnection:Disconnect();
        v525.videoCaptureInProgressConnection = nil;
    end;
end;
v98.RequestHidePublicVoiceUI = function(v526) --[[ Line: 2910 ]] --[[ Name: RequestHidePublicVoiceUI ]]
    task.defer(function() --[[ Line: 2911 ]]
        -- upvalues: v526 (copy)
        v526.setVoiceUIVisibility:Fire(false);
    end);
end;
v98.RequestShowPublicVoiceUI = function(v527) --[[ Line: 2916 ]] --[[ Name: RequestShowPublicVoiceUI ]]
    task.defer(function() --[[ Line: 2917 ]]
        -- upvalues: v527 (copy)
        v527.setVoiceUIVisibility:Fire(true);
    end);
end;
v98.default = v98.new(v27:GetAfterBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0, nil, nil, nil, nil, nil, l_ThirdPartyUserService_0, nil, l_AdService_0);
return v98;