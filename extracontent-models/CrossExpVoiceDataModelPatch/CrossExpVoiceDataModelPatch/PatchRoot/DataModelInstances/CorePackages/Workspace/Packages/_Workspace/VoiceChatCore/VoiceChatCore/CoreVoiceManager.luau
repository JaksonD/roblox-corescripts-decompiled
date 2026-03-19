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
local v93 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v94 = require(l_Requests_0.GetShowPhoneVerificationUpsell);
local v95 = {
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
local v96 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v97 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v98 = if v73 then game:GetService("TelemetryService") else nil;
local v99 = {
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
    AvatarChatService = v96, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    ThirdPartyUserService = l_ThirdPartyUserService_0, 
    CaptureService = v97, 
    TelemetryService = v98, 
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
v99.__index = v99;
v99.new = function(v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110) --[[ Line: 306 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v20 (copy), l_AppStorageService_0 (copy), v99 (copy), v45 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v57 (copy), l_Players_1 (copy), v28 (copy), l_IXPServiceWrapper_0 (copy), v63 (copy), v64 (copy)
    local v111 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v102, 
        eventEmitter = v18.EventEmitter.new(), 
        service = v103, 
        PermissionsService = v101, 
        NotificationService = v105, 
        AvatarChatService = v106, 
        Analytics = v20.new(v104), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v100, 
        AppStorageService = v107 or l_AppStorageService_0, 
        ThirdPartyUserService = v108, 
        CaptureService = v109, 
        AdService = v110
    }, v99);
    if v45() then
        for _, v113 in l_WATCHED_MESSAGE_TYPES_0 do
            v111.SignalREventTable[v113] = Instance.new("BindableEvent");
        end;
    end;
    v111.shouldThrottleParticipantUpdate = false;
    v111.participantsStateThrottleTime = 0;
    v111.lastParticipantsStateUpdate = 0;
    v111.lastStateUpdateCounter = 0;
    if v57() > 0 then
        task.spawn(function() --[[ Line: 350 ]]
            -- upvalues: l_Players_1 (ref), v103 (copy), v28 (ref), l_IXPServiceWrapper_0 (ref), v63 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 351 ]]
                -- upvalues: l_Players_1 (ref), v103 (ref)
                if l_Players_1.LocalPlayer then
                    return v103:IsVoiceEnabledForUserIdAsync(l_Players_1.LocalPlayer.UserId);
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
        v111.participantsStateThrottleTime = v57() / 1000;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 367 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v63 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v63);
        end);
        if l_status_1 and l_result_1 and l_result_1[v64] then
            v111.shouldThrottleParticipantUpdate = true;
        end;
    end;
    return v111;
end;
v99.emit = function(v118, v119, ...) --[[ Line: 378 ]] --[[ Name: emit ]]
    v118.eventEmitter:emit(v119, ...);
end;
v99.subscribe = function(v120, v121, v122) --[[ Line: 382 ]] --[[ Name: subscribe ]]
    v120.eventEmitter:addListener(v121, v122);
end;
v99.unsubscribeAll = function(v123) --[[ Line: 386 ]] --[[ Name: unsubscribeAll ]]
    v123.eventEmitter:removeAllListeners();
end;
v99.CheckCallStateWithPromise = function(v124) --[[ Line: 390 ]] --[[ Name: CheckCallStateWithPromise ]]
    -- upvalues: l_default_0 (copy), v28 (copy), l_Enums_0 (copy)
    return l_default_0:getCallState():andThen(function(v125) --[[ Line: 392 ]]
        -- upvalues: v28 (ref), l_Enums_0 (ref), v124 (copy)
        v28:trace("Got user call state");
        if v125.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v125.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
            v124.isInCall = true;
            v124.callMutedState = v125.muted;
            v28:trace("Changing call muted state to {}", v125.muted);
        end;
    end):catch(function(v126) --[[ Line: 404 ]]
        -- upvalues: v28 (ref)
        v28:trace("User not in call {}", v126);
    end);
end;
v99.CheckCallState = function(v127) --[[ Line: 410 ]] --[[ Name: CheckCallState ]]
    -- upvalues: v28 (copy), l_default_0 (copy), l_Enums_0 (copy)
    v28:trace("Checking user call state");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 412 ]]
        -- upvalues: l_default_0 (ref), v28 (ref), l_Enums_0 (ref), v127 (copy)
        l_default_0:getCallState():andThen(function(v128) --[[ Line: 414 ]]
            -- upvalues: v28 (ref), l_Enums_0 (ref), v127 (ref)
            v28:trace("Got user call state");
            if v128.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v128.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v127.isInCall = true;
                v127.callMutedState = v128.muted;
                v28:trace("Changing call muted state to {}", v128.muted);
            end;
        end):catch(function(v129) --[[ Line: 426 ]]
            -- upvalues: v28 (ref)
            v28:trace("User not in call {}", v129);
        end);
    end);
    if not l_status_2 then
        v28:debug("Error checking user call state {}", l_result_2);
    end;
end;
v99._GetShowAgeVerificationOverlay = function(v132, v133) --[[ Line: 445 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: v93 (copy), v18 (copy)
    return v93(v18.bind(v132, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), v133);
end;
v99.FetchAgeVerificationOverlay = function(v134, v135) --[[ Line: 454 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: v22 (copy)
    if not v134._getShowAgeVerificationOverlayResult then
        if not v134._getShowAgeVerificationOverlayPromise then
            v134._getShowAgeVerificationOverlayPromise = v22.new(function(v136, _) --[[ Line: 457 ]]
                -- upvalues: v134 (copy), v135 (copy)
                v134._getShowAgeVerificationOverlayResult = v134:_GetShowAgeVerificationOverlay(v135);
                v136(v134._getShowAgeVerificationOverlayResult);
            end);
        end;
        v134._getShowAgeVerificationOverlayPromise:await();
    end;
    return v134._getShowAgeVerificationOverlayResult;
end;
v99._GetShowPhoneVerificationUpsell = function(v138, v139, v140) --[[ Line: 473 ]] --[[ Name: _GetShowPhoneVerificationUpsell ]]
    -- upvalues: v94 (copy), v18 (copy)
    return (v94(v18.bind(v138, "GetRequest"), tostring(game.GameId), v139, v140));
end;
v99.FetchPhoneVerificationUpsell = function(v141, v142, v143, v144) --[[ Line: 486 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    -- upvalues: v22 (copy), v17 (copy)
    if not v141._getShowPhoneVerificationUpsellResult then
        v141._getShowPhoneVerificationUpsellResult = {};
        v141._getShowPhoneVerificationUpsellPromise = {};
    end;
    if not v141._getShowPhoneVerificationUpsellResult[v142] or v144 then
        if not v141._getShowPhoneVerificationUpsellPromise[v142] or v144 then
            v141._getShowPhoneVerificationUpsellPromise[v142] = v22.new(function(v145, _) --[[ Line: 497 ]]
                -- upvalues: v141 (copy), v142 (copy), v143 (copy), v17 (ref)
                local v147 = v141:_GetShowPhoneVerificationUpsell(v142, v143);
                v141._getShowPhoneVerificationUpsellResult[v142] = if type(v147) == "table" and v147.valueProp ~= nil then v147.valueProp else v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
                v145();
            end);
        end;
        v141._getShowPhoneVerificationUpsellPromise[v142]:await();
    end;
    return v141._getShowPhoneVerificationUpsellResult[v142];
end;
v99.DisablePhoneVerificationUpsell = function(v148) --[[ Line: 511 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    -- upvalues: v23 (copy), v17 (copy)
    v148._getShowPhoneVerificationUpsellResult = v23.Dictionary.map(v148._getShowPhoneVerificationUpsellResult, function() --[[ Line: 514 ]]
        -- upvalues: v17 (ref)
        return v17.PHONE_UPSELL_VOICE_CHAT_PROP.None;
    end);
end;
v99.GetNudgeAnalyticsData = function(v149) --[[ Line: 520 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v149:GetSessionId();
end;
v99.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v150, v151) --[[ Line: 525 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v152 = {
        isUniverseEnabledForVoice = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UniverseAudio), 
        isPlaceEnabledForVoice = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.PlaceAudio), 
        isUniverseEnabledForAvatarVideo = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UniverseVideo), 
        isPlaceEnabledForAvatarVideo = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.PlaceVideo)
    };
    local v153 = {
        isUserEligible = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserAudioEligible), 
        isVoiceEnabled = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserAudio), 
        isAvatarVideoEligible = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserVideoEligible), 
        isAvatarVideoEnabled = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserVideo), 
        isUserVerifiedForVoice = if l_GetFFlagEnableVoiceSignal_0() then v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil, 
        isBanned = v150.AvatarChatService:IsEnabled(v151, Enum.AvatarChatServiceFeature.UserBanned), 
        bannedUntil = nil
    };
    return {
        universePlaceVoiceEnabledSettings = v152, 
        voiceSettings = v153
    };
end;
v99.resolveAvatarChatUserAndPlaceSettings = function(v154) --[[ Line: 572 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    local l_status_3, l_result_3 = pcall(v154.AvatarChatService.GetClientFeaturesAsync, v154.AvatarChatService);
    if not l_status_3 then
        return nil;
    else
        return v154:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_3);
    end;
end;
v99.GetRequest = function(v157, v158, _) --[[ Line: 582 ]] --[[ Name: GetRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 583 ]]
        -- upvalues: v157 (copy), v158 (copy), l_HttpService_0 (ref)
        local l_AsyncFullUrl_0 = v157.HttpRbxApiService:GetAsyncFullUrl(v158, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_AsyncFullUrl_0);
    end);
    return l_status_4 and l_result_4;
end;
v99.PostUserVoiceConnectionStatus = function(v163, v164) --[[ Line: 591 ]] --[[ Name: PostUserVoiceConnectionStatus ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy)
    local l_status_5, _ = pcall(function() --[[ Line: 592 ]]
        -- upvalues: l_HttpService_0 (ref), v164 (copy), v163 (copy), v17 (ref)
        local v165 = l_HttpService_0:JSONEncode({
            IsUserVoiceConnected = v164
        });
        local v166 = v163.HttpRbxApiService:PostAsyncFullUrl(v17.VOICE_URL .. "/v1/user-voice-connection-state", v165);
        return l_HttpService_0:JSONDecode(v166);
    end);
    return l_status_5;
end;
v99.GetVoiceAnalyticsData = function(v169) --[[ Line: 601 ]] --[[ Name: GetVoiceAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_RbxAnalyticsService_0 (copy)
    return {
        universeId = game.GameId, 
        placeId = game.PlaceId, 
        playSessionId = if l_game_EngineFeature_1 then l_RbxAnalyticsService_0:GetPlaySessionId() else "", 
        voiceSessionId = if v169.service then v169:GetSessionId() else "", 
        micAvailability = ""
    };
end;
v99.RecordExperienceJoinMicPermissionStatus = function(v170, v171) --[[ Line: 613 ]] --[[ Name: RecordExperienceJoinMicPermissionStatus ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), l_PERMISSION_STATE_0 (copy)
    local l_v170_VoiceAnalyticsData_0 = v170:GetVoiceAnalyticsData();
    if v171 ~= nil and typeof(v171) == "table" then
        if v171.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
            l_v170_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v170_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    elseif v170.permissionState then
        if v170.permissionState == l_PERMISSION_STATE_0.LISTEN_AND_TALK then
            l_v170_VoiceAnalyticsData_0.micAvailability = "Granted";
        else
            l_v170_VoiceAnalyticsData_0.micAvailability = "Denied";
        end;
    end;
    v170.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", l_v170_VoiceAnalyticsData_0);
end;
v99.CheckCaptureMute = function(v173) --[[ Line: 633 ]] --[[ Name: CheckCaptureMute ]]
    -- upvalues: l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy)
    if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then
        return v173.CaptureService:IsCapturingVideo();
    else
        return false;
    end;
end;
v99.ToggleMuteSome = function(v174, v175, v176, v177, v178) --[[ Line: 642 ]] --[[ Name: ToggleMuteSome ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v174:ensureInitialized("mute some players");
    v174._mutedAnyone = true;
    local v179 = {};
    v176 = v176 or v174:CheckCaptureMute();
    for _, v181 in v175 do
        if l_VoiceChatService_0.UseNewAudioApi then
            v179[v181] = true;
            v174.mutedPlayers[v181] = v176;
        else
            v174.service:SubscribePause(v181, v176);
        end;
        local v182 = v174.participants[tostring(v181)];
        if v182 then
            v182.isMutedLocally = v176;
            v174.participantsUpdate:Fire(v174.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v183 in v174.audioDevices do
            if v183.Player and v179[v183.Player.UserId] then
                if l_game_EngineFeature_0 and v183.Player ~= l_Players_0.LocalPlayer then
                    v183.MutedByLocalUser = v176;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    v183.Active = not v176;
                end;
            end;
        end;
    end;
    if v177 and v178 then
        v174.Analytics:reportVoiceMuteGroup((v174:JoinWithVoiceMuteData({
            groupType = v177, 
            context = v178, 
            muted = v176
        })));
    end;
end;
v99.GetMutedAnyone = function(v184) --[[ Line: 687 ]] --[[ Name: GetMutedAnyone ]]
    return v184._mutedAnyone;
end;
v99.ToggleMutePlayer = function(v185, v186, v187) --[[ Line: 691 ]] --[[ Name: ToggleMutePlayer ]]
    -- upvalues: l_VoiceChatService_0 (copy), v29 (copy), v28 (copy), v18 (copy), v60 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v185:ensureInitialized("mute player " .. v186);
    v185._mutedAnyone = true;
    local v188 = (if l_VoiceChatService_0.UseNewAudioApi and v29 then not v185.mutedPlayers[v186] else not v185.service:IsSubscribePaused(v186)) or v185:CheckCaptureMute();
    v28:trace("Setting mute for {} to {}", v18.shorten(v186), v188);
    if v60() then
        v185.onPlayerMuteToggled:Fire();
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        v185.mutedPlayers[v186] = v188;
        for v189 in v185.audioDevices do
            if v189.Player and v189.Player.UserId == v186 then
                if l_game_EngineFeature_0 and v189.Player ~= l_Players_0.LocalPlayer then
                    v189.MutedByLocalUser = v188;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    local v190 = v185.participants[tostring(v186)];
                    local v191 = v190 and not v190.isMuted;
                    v189.Active = not v188 and v191;
                end;
            end;
        end;
        v185:emit("OnPlayerMuted");
    else
        v185.service:SubscribePause(v186, v188);
    end;
    for _, v193 in pairs(v185.participants) do
        if v193.userId == v186 then
            v193.isMutedLocally = v188;
            v185.participantsUpdate:Fire(v185.participants);
        end;
    end;
    if v187 then
        v185.Analytics:reportVoiceMuteIndividual((v185:JoinWithVoiceMuteData({
            targetUserId = tonumber(v186), 
            context = v187, 
            muted = v188
        })));
    end;
end;
v99.MuteAll = function(v194, v195, v196) --[[ Line: 745 ]] --[[ Name: MuteAll ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v28 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v17 (copy)
    v194:ensureInitialized("mute all");
    v194._mutedAnyone = true;
    v195 = v195 or v194:CheckCaptureMute();
    if l_VoiceChatService_0.UseNewAudioApi then
        v194.muteAll = v195;
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("Setting self mute all to {} context: {}", v195, v196);
        else
            v28:trace("Setting self mute all to {}", v195);
        end;
        for v197 in v194.audioDevices do
            if v197.Player and v197.Player ~= l_Players_0.LocalPlayer then
                v28:debug("Local muting {} to '{} = {}'", v197.Player.Name, v197.Active, v195);
                if l_game_EngineFeature_0 then
                    v197.MutedByLocalUser = v195;
                else
                    local l_UserId_0 = v197.Player.UserId;
                    v194.mutedPlayers[l_UserId_0] = v195;
                    local v199 = v194.participants[tostring(l_UserId_0)];
                    local v200 = v199 and not v199.isMuted;
                    v197.Active = not v195 and v200;
                end;
            end;
        end;
    else
        v194.service:SubscribePauseAll(v195);
    end;
    for _, v202 in pairs(v194.participants) do
        v202.isMutedLocally = v195;
        v194.participantsUpdate:Fire(v194.participants);
    end;
    v194.muteAllChanged:Fire(v195);
    if v196 then
        v194.Analytics:reportVoiceMuteGroup((v194:JoinWithVoiceMuteData({
            groupType = v17.VOICE_GROUP_TYPE.ALL, 
            context = v196, 
            muted = v195
        })));
    end;
end;
v99.FetchVoicePermissions = function(v203) --[[ Line: 792 ]] --[[ Name: FetchVoicePermissions ]]
    if not v203.communicationPermissionsResult then
        v203.communicationPermissionsResult = v203:resolveAvatarChatUserAndPlaceSettings();
    end;
    return v203.communicationPermissionsResult;
end;
v99.verifyUniverseAndPlaceCanUseVoice = function(v204) --[[ Line: 800 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v20 (copy)
    local v205 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v204:resolveAvatarChatUserAndPlaceSettings() else v204:FetchAgeVerificationOverlay();
    if not v205 then
        v204:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_0 = v205.universePlaceVoiceEnabledSettings;
        return l_universePlaceVoiceEnabledSettings_0 and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice and l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice;
    end;
end;
v99.IsUserInFTUX = function(v207) --[[ Line: 820 ]] --[[ Name: IsUserInFTUX ]]
    -- upvalues: l_GetFFlagSeamlessVoiceFTUX_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v28 (copy)
    if not l_GetFFlagSeamlessVoiceFTUX_0() then
        return false;
    elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v207:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local l_AppStorageService_1 = game:GetService("AppStorageService");
        local v209 = nil;
        if not pcall(function() --[[ Line: 830 ]]
            -- upvalues: l_AppStorageService_1 (copy), v209 (ref)
            v209 = l_AppStorageService_1:GetItem("SeamlessVoiceFTUX") == "true";
        end) then
            v28:warning("Failed to read FTUX/STUX from AppStorage");
            return false;
        else
            local v210 = v207:FetchAgeVerificationOverlay();
            if type(v210) == "table" and v210.voiceSettings and v210.voiceSettings.seamlessVoiceStatus ~= 3 then
                v28:debug("User not eligible for FTUX/STUX");
                return false;
            else
                return not v209;
            end;
        end;
    end;
end;
v99.isEnableDefaultVoiceOnForPlace = function(_) --[[ Line: 853 ]] --[[ Name: isEnableDefaultVoiceOnForPlace ]]
    -- upvalues: l_VoiceChatService_0 (copy)
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    return l_VoiceChatService_0.UseNewAudioApi or l_VoiceChatService_0.EnableDefaultVoice;
end;
v99.verifyPlaceCanUseVoice = function(v212, v213, v214) --[[ Line: 864 ]] --[[ Name: verifyPlaceCanUseVoice ]]
    -- upvalues: v20 (copy)
    if not v213 or not v214 then
        v212:_reportJoinFailed("invalidResponse", v20.ERROR);
        return false;
    elseif not v213.isUniverseEnabledForVoice then
        v212:_reportJoinFailed("universeNotEnabled");
        return false;
    else
        v212:emit("OnUserAndPlaceCanUseVoiceResolved", v214, v213);
        if not v213.isPlaceEnabledForVoice then
            v212:_reportJoinFailed("placeNotEnabled");
            return false;
        elseif not v212:isEnableDefaultVoiceOnForPlace() then
            return false;
        else
            return true;
        end;
    end;
end;
v99.EligibleForFaeUpsell = function(v215) --[[ Line: 889 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_FAE_ENABLED_0 (copy)
    local v216 = v215:FetchAgeVerificationOverlay();
    if not v216 or type(v216) ~= "table" then
        return false;
    else
        local v217 = v216.inExperienceFaeUpsell == l_FAE_ENABLED_0;
        local l_isPlaceEnabledForVoice_0 = v216.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        return v217 and l_isPlaceEnabledForVoice_0;
    end;
end;
v99.OptUserToJoinVoice = function(v219) --[[ Line: 899 ]] --[[ Name: OptUserToJoinVoice ]]
    -- upvalues: v28 (copy)
    v28:debug("Opting user to join voice on age verification");
    v219.hasOptedToJoinVoiceOnAgeVerification = true;
end;
v99.SetupFAECompleteListener = function(v220) --[[ Line: 904 ]] --[[ Name: SetupFAECompleteListener ]]
    -- upvalues: v28 (copy)
    v28:debug("Setting up FAE complete listener");
    if game:GetEngineFeature("ChatReconcileAccess") then
        v28:debug("Using ChatService ReconcileCommunicationAccessCompleted event");
        v220.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ Line: 908 ]]
            -- upvalues: v28 (ref), v220 (copy)
            v28:debug("FAE complete listener triggered, re-fetching voice permissions");
            v220.communicationPermissionsResult = nil;
            v220:FetchVoicePermissions();
            v220._getShowAgeVerificationOverlayResult = v220:_GetShowAgeVerificationOverlay();
            if v220.hasOptedToJoinVoiceOnAgeVerification then
                v28:debug("FAE complete listener triggered, attempting voice rejoin");
                if v220:IsSeamlessVoice() then
                    v28:debug("Opting-in user to voice");
                    v220.AvatarChatService:EnableVoice();
                    v220.attemptVoiceRejoin:Fire();
                end;
            end;
        end);
    end;
end;
v99.EligibleForAgeCheckToast = function(v221) --[[ Line: 928 ]] --[[ Name: EligibleForAgeCheckToast ]]
    -- upvalues: l_FAE_SETTINGS_TOAST_0 (copy)
    local v222 = v221:FetchAgeVerificationOverlay();
    if not v222 or type(v222) ~= "table" then
        return false;
    else
        local l_isPlaceEnabledForVoice_1 = v222.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        local v224 = v222.inExperienceFaeUpsell == l_FAE_SETTINGS_TOAST_0;
        return l_isPlaceEnabledForVoice_1 and v221:isEnableDefaultVoiceOnForPlace() and v224;
    end;
end;
v99.userAndPlaceCanUseVoice = function(v225) --[[ Line: 938 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v93 (copy), v18 (copy), v20 (copy), v28 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy)
    if v225.ThirdPartyUserService ~= nil and v225.ThirdPartyUserService:IsChatRestrictionSupported() and v225.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
        return false;
    else
        local v226 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v225:resolveAvatarChatUserAndPlaceSettings() else v93(v18.bind(v225, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
        if not v226 then
            v225:_reportJoinFailed("invalidResponse", v20.ERROR);
            return false;
        else
            if v225.options.forceVoiceEnabled then
                v226.voiceSettings.isVoiceEnabled = true;
                v28:debug("bypassing voice permissions check");
            end;
            local l_universePlaceVoiceEnabledSettings_1 = v226.universePlaceVoiceEnabledSettings;
            local l_voiceSettings_0 = v226.voiceSettings;
            v28:trace("Voice settings endpoint returned {}", v226);
            if not v225:verifyPlaceCanUseVoice(l_universePlaceVoiceEnabledSettings_1, l_voiceSettings_0) then
                return false;
            else
                if l_GetFFlagEnableVoiceSignal_0() then
                    v225.communicationPermissionsResult = v226;
                    local v229 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and os.time();
                    local v230 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v225:UserVoiceEnabled() and not l_voiceSettings_0.isUserVerifiedForVoice and (v225:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v229 and v225:FetchPhoneVerificationUpsell(v17.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v229) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat);
                    if v225:UserEligibleForInExperienceUpsell() or v230 then
                        v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                    end;
                    if l_GetFFlagEnableVoiceUxUpdates_0() then
                        local l_v225_VoiceConnectCookie_0 = v225:GetVoiceConnectCookie();
                        local v232 = v225:HasSeamlessVoiceFeature(v17.SeamlessVoiceFeatures.DeferConnection) and l_v225_VoiceConnectCookie_0 == "";
                        local v233 = v225:IsSeamlessVoice() and l_v225_VoiceConnectCookie_0 == "false";
                        if v232 or v233 then
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v225:EligibleForFaeUpsell() then
                            v28:debug("Suspending voice join for FAE Eligible user");
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                            v225:SetupFAECompleteListener();
                        end;
                    else
                        if l_GetFFlagNonVoiceFTUX_0() and v225:IsUserInFTUX() then
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                        if v225:IsSeamlessVoice() and not v225:GetVoiceConnectCookieValue() then
                            v28:debug("Suspending voice join due to voice connect cookie");
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v225:IsNewSeamlessVoiceUserDisconnect() then
                            v28:debug("Suspending voice join for new seamless voice user");
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        elseif v225:IsSeamlessVoice() and v225:UserOnlyEligibleForVoice() then
                            v28:debug("Suspending voice join for opt-out user");
                            v225:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
                        end;
                    end;
                    task.spawn(function() --[[ Line: 1035 ]]
                        -- upvalues: v225 (copy)
                        v225:FetchAgeVerificationOverlay();
                    end);
                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v225:UserEligibleForLikelySpeakingBubbles() then
                        v225:emit("OnShowLikelySpeakingBubblesChanged", true);
                    end;
                end;
                if not l_voiceSettings_0.isVoiceEnabled then
                    v225:_reportJoinFailed("userNotEnabled");
                end;
                return l_voiceSettings_0.isVoiceEnabled;
            end;
        end;
    end;
end;
v99.voicePermissionGranted = function(_, v235) --[[ Line: 1054 ]] --[[ Name: voicePermissionGranted ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), v23 (copy)
    local _ = false;
    if typeof(v235) == "table" then
        local v237 = true;
        if v235.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v237 = not v23.List.find(v235.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v237;
    else
        return v235 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v99.RawGetPermissions = function(v238, v239) --[[ Line: 1074 ]] --[[ Name: RawGetPermissions ]]
    -- upvalues: v22 (copy)
    return v22.new(function(v240, _) --[[ Line: 1075 ]]
        -- upvalues: v238 (copy), v239 (copy)
        v238:emit("GetPermissions", function(v242) --[[ Line: 1076 ]]
            -- upvalues: v240 (copy)
            v240(v242);
        end, v239, true, true);
    end);
end;
v99.requestMicPermission = function(v243) --[[ Line: 1083 ]] --[[ Name: requestMicPermission ]]
    -- upvalues: v28 (copy), l_PermissionsProtocol_0 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v22 (copy), v55 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), v61 (copy), v20 (copy)
    if v243.permissionPromise then
        v28:trace("PermissionProtocol already invoked");
        return v243.permissionPromise;
    else
        local v244 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v245 = nil;
        if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0(v243:IsSeamlessVoice()) then
            v28:debug("Requesting device permission");
            local v246 = nil;
            local v247 = nil;
            local v248, v249, v250 = pcall(function() --[[ Line: 1097 ]]
                -- upvalues: v243 (copy), v244 (copy)
                return v243:RawGetPermissions(v244):await();
            end);
            v246 = v248 and v249;
            v247 = v250;
            if v246 then
                if v247.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v243.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif v247.missingPermissions then
                    v243.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                elseif v247.deniedPermissions then
                    v243.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v28:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v243.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v28:error("PermissionsService call failed.");
                v243.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            end;
            v28:debug("Joining without mic permissions. Permission State: {}", v243.permissionState);
            v245 = v22.resolve();
        else
            v245 = if v55 then v22.new(function(v251, _) --[[ Line: 1126 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), l_GetFFlagEnableVrVoiceParity_0 (ref), v243 (copy), v244 (copy)
                local function v255(v253) --[[ Line: 1127 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v251 (copy)
                    local v254 = {
                        status = v253.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                    };
                    v251(v254);
                end;
                if l_GetFFlagEnableVrVoiceParity_0() then
                    v243:emit("GetPermissions", v255, v244, false, false);
                    return;
                else
                    v243:emit("GetPermissions", v255, v244);
                    return;
                end;
            end) else v243.PermissionsService:requestPermissions(v244);
        end;
        v243.permissionPromise = v245:andThen(function(v256) --[[ Line: 1146 ]]
            -- upvalues: v61 (ref), v243 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v22 (ref), v28 (ref), v20 (ref), v55 (ref), l_PermissionsProtocol_0 (ref)
            if v61() then
                v243:RecordExperienceJoinMicPermissionStatus(v256);
            end;
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                return v22.resolve();
            elseif not v256 and not v256.status then
                v28:debug("No permission response, rejecting access");
                v243:_reportJoinFailed("noPermissionResponse", v20.ERROR);
                if v243.options.passInitErrorInPromiseReject then
                    return v22.reject({
                        code = "INIT_ERROR_NO_PERM_RESPONSE"
                    });
                else
                    return v22.reject();
                end;
            else
                v28:debug("Permission status {}", v256.status);
                local v257 = nil;
                v257 = if v55 then v243:voicePermissionGranted(v256) else v256.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
                if v243.options.passInitErrorInPromiseReject and not v257 then
                    return v22.reject({
                        code = "INIT_ERROR_PERM_NOT_GRANTED"
                    });
                else
                    return v257 and v22.resolve() or v22.reject();
                end;
            end;
        end):andThen(function() --[[ Line: 1175 ]]
            -- upvalues: v243 (copy), v22 (ref)
            v243:emit("OnRequestMicPermissionResolved");
            return v22.resolve();
        end):catch(function() --[[ Line: 1180 ]]
            -- upvalues: v243 (copy), v22 (ref)
            v243:emit("OnRequestMicPermissionRejected");
            if v243.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_MIC_PERM_REJECTED"
                });
            else
                return v22.reject();
            end;
        end);
        return v243.permissionPromise;
    end;
end;
v99.JoinByGroupIdToken = function(v258, v259, v260) --[[ Line: 1190 ]] --[[ Name: JoinByGroupIdToken ]]
    v258.previousGroupId = v259;
    v258.previousMutedState = v260;
    return v258.service:JoinByGroupIdToken(v259, v260);
end;
v99.EnableVoice = function(v261) --[[ Line: 1196 ]] --[[ Name: EnableVoice ]]
    -- upvalues: v28 (copy)
    v28:trace("Enabling voice");
    v261.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ Line: 1199 ]]
        -- upvalues: v261 (copy)
        v261.attemptVoiceRejoin:Fire();
    end);
    v261.AvatarChatService:EnableVoice();
end;
v99.ChangeVoiceJoinProgress = function(v262, v263) --[[ Line: 1205 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    v262.VoiceJoinProgress = v263;
    v262.VoiceJoinProgressChanged:Fire(v262.VoiceJoinProgress);
end;
v99.setOptions = function(v264, v265) --[[ Line: 1210 ]] --[[ Name: setOptions ]]
    v264.options = v265;
end;
v99.ShouldShowJoinVoiceOnDisconnect = function(v266) --[[ Line: 1214 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy)
    return v266:IsSeamlessVoice() and v266.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended;
end;
v99.IsSeamlessVoice = function(v267) --[[ Line: 1218 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy)
    if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and not v267.options.allowSeamlessVoice then
        return false;
    else
        local v268 = v267:FetchAgeVerificationOverlay();
        if type(v268) ~= "table" or not v268 or not v268.voiceSettings then
            return false;
        elseif l_GetFFlagCheckUniversePlaceBeforeSuspending_0() and not v267:verifyUniverseAndPlaceCanUseVoice() then
            return false;
        else
            local l_seamlessVoiceStatus_0 = v268.voiceSettings.seamlessVoiceStatus;
            local v270 = true;
            if l_seamlessVoiceStatus_0 ~= v17.SeamlessVoiceStatus.EnabledExistingUser then
                v270 = l_seamlessVoiceStatus_0 == v17.SeamlessVoiceStatus.EnabledNewUser;
            end;
            return v270;
        end;
    end;
end;
v99.HasSeamlessVoiceFeature = function(v271, v272) --[[ Line: 1240 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    -- upvalues: v62 (copy), v18 (copy), v17 (copy)
    if not v271.options.allowSeamlessVoice or not v271:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v273 = v271:FetchAgeVerificationOverlay();
        if not v271:_isValidAgeVerificationOverlayData(v273) then
            return false;
        else
            local l_seamlessVoiceVariant_0 = v273.voiceSettings.seamlessVoiceVariant;
            if not l_seamlessVoiceVariant_0 then
                return false;
            else
                if v62() then
                    if type(v272) == "string" then
                        v272 = {
                            v272
                        };
                    end;
                    if v62(v272) then
                        local v275 = v18.jsonDecode(l_seamlessVoiceVariant_0);
                        local v276 = {};
                        for _, v278 in pairs(v275) do
                            v276[v278] = true;
                        end;
                        if #v272 == 1 and v272[1] == v17.SeamlessVoiceFeatures.ConnectDisconnect and l_seamlessVoiceVariant_0 == v17.SeamlessVoiceVariants.OnlyConnectDisconnect then
                            return true;
                        else
                            for _, v280 in pairs(v272) do
                                if not v276[v280] then
                                    return false;
                                end;
                            end;
                            return true;
                        end;
                    end;
                else
                    local v284 = ({
                        [v17.SeamlessVoiceFeatures.ConnectDisconnect] = function(v281) --[[ Line: 1285 ]]
                            -- upvalues: v17 (ref)
                            return v281 ~= v17.SeamlessVoiceVariants.Control;
                        end, 
                        [v17.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(v282) --[[ Line: 1288 ]]
                            -- upvalues: v17 (ref)
                            return v282 == v17.SeamlessVoiceVariants.HearingWithoutMicPermissions;
                        end, 
                        [v17.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function(v283) --[[ Line: 1291 ]]
                            -- upvalues: v17 (ref)
                            return v283 == v17.SeamlessVoiceVariants.LikelySpeakingBubblesRemoved;
                        end
                    })[v272];
                    if v284 then
                        return v284(l_seamlessVoiceVariant_0);
                    end;
                end;
                return false;
            end;
        end;
    end;
end;
v99.IsNewSeamlessVoiceUserDisconnect = function(v285) --[[ Line: 1305 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    -- upvalues: v17 (copy)
    if not v285.options.allowSeamlessVoice or not v285:verifyUniverseAndPlaceCanUseVoice() then
        return false;
    else
        local v286 = v285:FetchAgeVerificationOverlay();
        if not v285:_isValidAgeVerificationOverlayData(v286) then
            return false;
        elseif v286.voiceSettings.seamlessVoiceStatus ~= v17.SeamlessVoiceStatus.EnabledNewUser then
            return false;
        else
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 1324 ]]
                -- upvalues: v285 (copy), v17 (ref)
                return v285.AppStorageService:GetItem(v17.SEAMLESS_VOICE_FTUX_KEY);
            end);
            return l_status_6 and l_result_6 == "false";
        end;
    end;
end;
v99._isValidAgeVerificationOverlayData = function(_, v290) --[[ Line: 1332 ]] --[[ Name: _isValidAgeVerificationOverlayData ]]
    local v291 = false;
    if type(v290) == "table" then
        v291 = v290 and v290.voiceSettings;
    end;
    return v291;
end;
v99.UserInInExperienceUpsellTreatment = function(v292) --[[ Line: 1336 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    -- upvalues: v17 (copy)
    local v293 = v292:FetchAgeVerificationOverlay();
    if not v293 then
        return false;
    else
        local l_showVoiceInExperienceUpsellVariant_0 = v293.showVoiceInExperienceUpsellVariant;
        local v295 = true;
        if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT1 then
            v295 = true;
            if l_showVoiceInExperienceUpsellVariant_0 ~= v17.IN_EXP_UPSELL_VARIANT.VARIANT2 then
                v295 = l_showVoiceInExperienceUpsellVariant_0 == v17.IN_EXP_UPSELL_VARIANT.VARIANT3;
            end;
        end;
        return v295;
    end;
end;
v99.UserOnlyEligibleForVoice = function(v296) --[[ Line: 1348 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    -- upvalues: v35 (copy)
    local l_communicationPermissionsResult_0 = v296.communicationPermissionsResult;
    if not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings or not l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        if v35 then
            v296:FetchVoicePermissions();
            l_communicationPermissionsResult_0 = v296.communicationPermissionsResult;
        else
            return false;
        end;
    end;
    return l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
end;
v99.UserOnlyEligibleForVoiceViaOverlay = function(v298) --[[ Line: 1364 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    local v299 = v298:FetchAgeVerificationOverlay();
    if not v298:_isValidAgeVerificationOverlayData(v299) then
        return false;
    else
        return v299.voiceSettings.isVerifiedForVoice and not v299.voiceSettings.isVoiceEnabled and v299.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v99.UserVoiceEnabled = function(v300) --[[ Line: 1377 ]] --[[ Name: UserVoiceEnabled ]]
    local l_communicationPermissionsResult_1 = v300.communicationPermissionsResult;
    if not l_communicationPermissionsResult_1 or not l_communicationPermissionsResult_1.voiceSettings or not l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_1.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v99.UserEligibleForInExperienceUpsell = function(v302) --[[ Line: 1387 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v303 = v302:UserOnlyEligibleForVoice();
    if not v303 then
        return false;
    elseif l_GetFFlagEnableVoiceSignal_0() then
        local v304 = v302:UserInInExperienceUpsellTreatment();
        return v303 and v304;
    else
        local v305 = v302:FetchAgeVerificationOverlay();
        return v303 and v305 and v305.showVoiceInExperienceUpsell;
    end;
end;
v99.UserEligibleForLikelySpeakingBubbles = function(v306) --[[ Line: 1408 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    local v307 = v306:UserOnlyEligibleForVoice();
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v307 and not v306:UserVoiceEnabled() and v306:FetchPhoneVerificationUpsell(v17.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v17.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then
        return true;
    elseif not l_GetFFlagEnableSeamlessVoiceV2_0() and not v307 then
        return false;
    else
        local v308 = v306:FetchAgeVerificationOverlay();
        if l_GetFFlagEnableSeamlessVoiceV2_0() then
            if not v306:_isValidAgeVerificationOverlayData(v308) then
                return false;
            else
                local v309 = v307 and v308 and v308.showVoiceInExperienceUpsell;
                local l_showM3LikelySpeakingBubbles_0 = v308.showM3LikelySpeakingBubbles;
                return v309 or l_showM3LikelySpeakingBubbles_0;
            end;
        else
            return v307 and v308 and v308.showVoiceInExperienceUpsell;
        end;
    end;
end;
v99.canUseServiceAsync = function(v311) --[[ Line: 1446 ]] --[[ Name: canUseServiceAsync ]]
    -- upvalues: v28 (copy), v22 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy), l_VoiceChatService_0 (copy), v36 (copy), l_IXPServiceWrapper_0 (copy), v37 (copy), v38 (copy)
    if v311.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        v28:debug("Voice Chat is not Available, rejecting canUseService promise");
        if v311.options.passInitErrorInPromiseReject then
            return v22.reject({
                code = "INIT_ERROR_VOICE_NOT_SUPPORTED"
            });
        else
            return v22.reject();
        end;
    else
        if not v311.canUseServicePromise then
            v311.canUseServicePromise = v22.defer(function(v312, v313) --[[ Line: 1456 ]]
                -- upvalues: v311 (copy), l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v28 (ref), l_VOICE_CHAT_AVAILABILITY_0 (ref), l_VoiceChatService_0 (ref), v36 (ref), l_IXPServiceWrapper_0 (ref), v37 (ref), v38 (ref)
                local v314 = v311:userAndPlaceCanUseVoice();
                if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
                    v311.canUseServiceResult = v314;
                    v311:emit("OnCanUseServiceResult", v314);
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v311.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v28:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v311.attemptVoiceRejoin.Event:Wait();
                    v28:debug("Attempting voice rejoin");
                    v311.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true;
                    v311.userEligible = true;
                    v311.initializedPostSuspension = true;
                    v312();
                    v311:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return;
                elseif not v314 then
                    v28:info("Voice access denied");
                    v311.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    if v311.options.passInitErrorInPromiseReject then
                        v313({
                            code = "INIT_ERROR_USER_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v313();
                        return;
                    end;
                elseif game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc or not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                    v28:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                    if not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                        v311:_reportJoinFailed("universeNotEnabled");
                    elseif not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                        v311:_reportJoinFailed("placeNotEnabled");
                    end;
                    v311.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                    if v311.options.passInitErrorInPromiseReject then
                        v313({
                            code = "INIT_ERROR_PLACE_NOT_AVAILABLE"
                        });
                        return;
                    else
                        v313();
                        return;
                    end;
                elseif v36 then
                    l_IXPServiceWrapper_0:WaitForInitialization();
                    local l_status_7, l_result_7 = pcall(function() --[[ Line: 1516 ]]
                        -- upvalues: l_IXPServiceWrapper_0 (ref), v37 (ref)
                        return l_IXPServiceWrapper_0:GetLayerData(v37);
                    end);
                    if l_status_7 and l_result_7 and l_result_7[v38] ~= nil then
                        v311.userEligible = l_result_7[v38];
                        l_IXPServiceWrapper_0:LogUserLayerExposure(v37);
                    end;
                    if v311.userEligible then
                        v312();
                        return;
                    elseif v311.options.passInitErrorInPromiseReject then
                        v313({
                            code = "INIT_ERROR_IXP_NOT_ELIGIBLE"
                        });
                        return;
                    else
                        v313();
                        return;
                    end;
                else
                    v311.userEligible = true;
                    v312();
                    return;
                end;
            end):andThen(function() --[[ Line: 1538 ]]
                -- upvalues: v311 (copy)
                return v311:requestMicPermission();
            end);
        end;
        return v311.canUseServicePromise;
    end;
end;
v99._setRecentUserState = function(v317, v318, v319) --[[ Line: 1545 ]] --[[ Name: _setRecentUserState ]]
    -- upvalues: v23 (copy)
    local v320 = v317.recentUsersInteractionData[tostring(v318)] or {};
    local v321 = v23.Dictionary.join(v320, v319);
    v317.recentUsersInteractionData = v23.Dictionary.join(v317.recentUsersInteractionData, {
        [tostring(v318)] = v321
    });
end;
v99.getRecentUsersInteractionData = function(v322) --[[ Line: 1555 ]] --[[ Name: getRecentUsersInteractionData ]]
    v322:_updateRecentUsersInteractionData();
    return v322.recentUsersInteractionData;
end;
v99.GetSignalREvent = function(v323, v324) --[[ Line: 1560 ]] --[[ Name: GetSignalREvent ]]
    return v323.SignalREventTable[v324].Event;
end;
v99.StartModerationSignal = function(v325) --[[ Line: 1565 ]] --[[ Name: StartModerationSignal ]]
    -- upvalues: v28 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy)
    if not v325.playerModeratedConnection then
        v325.playerModeratedConnection = v325:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ Line: 1568 ]]
            -- upvalues: v28 (ref), v325 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
            v28:debug("User Moderated");
            v325.previousSessionId = v325.service:GetSessionId();
            v325:emit("OnPlayerModerated");
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                l_VoiceChatService_0:notifyServerACSCleanup();
                l_VoiceChatService_0:leaveVoice();
                return;
            else
                l_VoiceChatService_0:notifyServerACSCleanup();
                v325.service:Leave();
                return;
            end;
        end);
    end;
end;
v99.StopModerationSignal = function(v326) --[[ Line: 1583 ]] --[[ Name: StopModerationSignal ]]
    if v326.playerModeratedConnection then
        v326.playerModeratedConnection:Disconnect();
        v326.playerModeratedConnection = nil;
    end;
end;
v99._updateRecentUsersInteractionData = function(v327) --[[ Line: 1590 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    -- upvalues: v34 (copy), v50 (copy), l_Players_0 (copy), v51 (copy), v23 (copy)
    local v328 = os.time();
    local v329 = {};
    if v327.recentUsersInteractionData then
        for v330, v331 in pairs(v327.recentUsersInteractionData) do
            local v332 = if v34 then v327.participants[tostring(v330)] else v327.participants[v330];
            local v333 = v50() and not l_Players_0:GetPlayerByUserId((tonumber(v330)));
            local v334 = v328 - v331.lastHeardTime >= v51();
            local v335 = not v332 or v332.isMuted;
            if v334 and v335 or v333 then
                v329[v330] = v23.None;
            end;
        end;
        v327.recentUsersInteractionData = v23.Dictionary.join(v327.recentUsersInteractionData, v329);
    end;
end;
v99.SetupParticipantListeners = function(v336) --[[ Line: 1614 ]] --[[ Name: SetupParticipantListeners ]]
    -- upvalues: v28 (copy), v50 (copy), v34 (copy), l_Players_0 (copy), l_VoiceChatService_0 (copy), v29 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v56 (copy), v73 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v68 (copy), v69 (copy), l_GetFFlagDisconnectToastClientRewrite_0 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v67 (copy), l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), v39 (copy), v43 (copy), v48 (copy), v49 (copy), v18 (copy), v95 (copy)
    v336:ensureInitialized("setup participant listeners");
    if not v336.participants then
        v336.participants = {};
        v336.recentUsersInteractionData = {};
        v336.updatedParticipants = {};
        v336.participantConnection = v336.service.ParticipantsStateChanged:Connect(function(v337, v338, v339) --[[ Line: 1623 ]]
            -- upvalues: v28 (ref), v50 (ref), v336 (copy), v34 (ref), l_Players_0 (ref), l_VoiceChatService_0 (ref), v29 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v56 (ref), v73 (ref)
            v28:trace("Participants state changed");
            for _, v341 in ipairs(v337) do
                if not v50() and not v336.participants[tostring(v341)].isMuted then
                    v336:_setRecentUserState(v341, {
                        lastHeardTime = os.time()
                    });
                end;
                v336.participants[tostring(v341)] = nil;
                v336.participantLeft:Fire(v336.participants, v341);
                v336:emit("OnVoiceParticipantRemoved", v341);
            end;
            for _, v343 in ipairs(v338) do
                v336.participantJoined:Fire(v336.participants, v343);
                v336:emit("OnVoiceParticipantAdded", v343);
            end;
            for _, v345 in pairs(v339) do
                local l_userId_0 = v345.userId;
                local v347 = if v34 then v336.participants[tostring(l_userId_0)] else v336.participants[l_userId_0];
                if not v345.isMuted or v347 and not v347.isMuted then
                    v336:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v347 or v347.isMuted ~= v345.isMuted then
                    v336:emit("OnVoiceParticipantToggleMuted", l_userId_0, v345.isMuted);
                end;
                if l_VoiceChatService_0.UseNewAudioApi and v29 then
                    v345.isMutedLocally = not not v336.mutedPlayers[l_userId_0];
                end;
                if l_VoiceChatService_0.UseNewAudioApi then
                    v345.isMutedLocally = if v336.mutedPlayers[l_userId_0] then not not v336.mutedPlayers[l_userId_0] else v345.isMutedLocally;
                end;
                if l_FFlagEnablePartyVoiceChangersInLua_0 and l_VoiceChatService_0.UseNewAudioApi then
                    v345.isVoiceChangerActive = if v336.voiceChangerActivePlayers[l_userId_0] then v336.voiceChangerActivePlayers[l_userId_0] else v345.isVoiceChangerActive;
                end;
                if v336.muteAll then
                    v345.isMutedLocally = true;
                end;
                v336.participants[tostring(l_userId_0)] = v345;
                if v56() then
                    v336.updatedParticipants[tostring(l_userId_0)] = v345;
                end;
                if v73 and v336.CaptureService:IsCapturingVideo() then
                    v336.voiceCapturedDuringVideoCapture = v336.voiceCapturedDuringVideoCapture or v345.isSignalActive;
                end;
            end;
            v336:_updateRecentUsersInteractionData();
            if v336.shouldThrottleParticipantUpdate then
                local v348 = tick();
                if v348 - v336.lastParticipantsStateUpdate >= v336.participantsStateThrottleTime and #v339 > 0 then
                    v336.lastParticipantsStateUpdate = v348;
                    v336.participantsUpdate:Fire(if v56() then v336.updatedParticipants else v336.participants);
                    v336.updatedParticipants = {};
                    return;
                elseif #v339 > 0 then
                    local v349 = v336.participantsStateThrottleTime - (v348 - v336.lastParticipantsStateUpdate);
                    v336.lastStateUpdateCounter = (v336.lastStateUpdateCounter + 1) % 100;
                    local l_lastStateUpdateCounter_0 = v336.lastStateUpdateCounter;
                    task.wait(v349);
                    if l_lastStateUpdateCounter_0 == v336.lastStateUpdateCounter then
                        v336.participantsUpdate:Fire(if v56() then v336.updatedParticipants else v336.participants);
                        v336.updatedParticipants = {};
                        return;
                    end;
                end;
            elseif #v339 > 0 then
                v336.participantsUpdate:Fire(if v56() then v336.updatedParticipants else v336.participants);
                v336.updatedParticipants = {};
            end;
        end);
        local function v358(v351, v352) --[[ Line: 1739 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v336 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v28 (ref), v68 (ref), v69 (ref), l_GetFFlagDisconnectToastClientRewrite_0 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
            v336:emit("OnStateChanged", v351, v352);
            local v353 = v352 == Enum.VoiceChatState.Failed;
            local v354 = v352 == Enum.VoiceChatState.Joining;
            local v355 = v352 == Enum.VoiceChatState.Leaving;
            local v356 = v352 == Enum.VoiceChatState.Ended;
            local v357 = v336.service:IsPublishPaused();
            if v357 ~= v336.localMuted and not v353 and not v354 and not v355 and not v356 then
                v336.localMuted = v357;
                v336.muteChanged:Fire(v357);
            elseif v354 or v355 or v356 then
                v336.localMuted = nil;
            end;
            if l_GetFFlagVoiceChatClientRewriteMasterLua_0() and v352 == Enum.VoiceChatState.Joined and v336.isInCall and v357 ~= v336.callMutedState then
                v28:debug("In call, setting local muted to call muted state {}", v336.callMutedState);
                v336:ToggleMic("InitInCall");
            end;
            if v68 and v352 == Enum.VoiceChatState.Joined then
                v336:StartModerationSignal();
            end;
            if v352 == Enum.VoiceChatState.Leaving then
                if not v69 or not v336.previousGroupId then
                    v336.previousGroupId = v336.service:GetGroupId();
                end;
                v336.previousMutedState = v336.service:IsPublishPaused();
            end;
            if v352 == Enum.VoiceChatState.Ended or v353 then
                v336.participants = {};
                v336.localMuted = nil;
                v336.participantsUpdate:Fire(v336.participants);
                if v68 then
                    v336:StopModerationSignal();
                end;
                if v353 then
                    v28:debug("State Changed to Failed. Reason: {}", v336.service:GetAndClearCallFailureMessage());
                end;
                if v351 == Enum.VoiceChatState.Joining or v351 == Enum.VoiceChatState.JoiningRetry or v351 == Enum.VoiceChatState.Joined then
                    if v352 == Enum.VoiceChatState.Ended then
                        v28:debug("State Changed to Ended from {}", v351);
                    end;
                    if not l_GetFFlagDisconnectToastClientRewrite_0() or not v336:IsSeamlessVoice() or v336:GetVoiceConnectCookieValue() then
                        v336:emit("OnRetryRequested");
                    end;
                end;
            end;
            if l_GetFFlagEnableVoiceSignal_0() and v336.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v352 == Enum.VoiceChatState.Joined then
                v336:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                v336:emit("OnVoiceJoin");
            end;
        end;
        if v336.service.VoiceChatState and v336.service.VoiceChatState == Enum.VoiceChatState.Joined then
            v28:debug("Joined voice chat {}", v336.service.VoiceChatState);
            v358(nil, Enum.VoiceChatState.Joined);
        end;
        v336.stateConnection = v336.service.StateChanged:Connect(v358);
        if v67 and l_VoiceChatService_0.UseNewAudioApi then
            if not v336.localMeteringTask then
                v336.localMeteringTask = task.spawn(function() --[[ Line: 1826 ]]
                    -- upvalues: v336 (copy)
                    while true do
                        v336:UpdateLocalMetering();
                        task.wait();
                    end;
                end);
            end;
        elseif v336.service:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 then
            v336.micConnection = v336.service.PlayerMicActivitySignalChange:Connect(function(v359) --[[ Line: 1835 ]]
                -- upvalues: v73 (ref), v336 (copy), l_GetFFlagLocalMutedNilFix_0 (ref), v39 (ref)
                if v73 and v336.CaptureService:IsCapturingVideo() then
                    v336.voiceCapturedDuringVideoCapture = v336.voiceCapturedDuringVideoCapture or v359.isActive;
                end;
                v336.isTalking = v359.isActive;
                if l_GetFFlagLocalMutedNilFix_0() then
                    if v336.localMuted == false then
                        if v39 then
                            v336:FireTalkingChangedDebounced(v336.isTalking);
                            return;
                        else
                            v336.talkingChanged:Fire(v336.isTalking);
                            return;
                        end;
                    end;
                elseif not v336.localMuted then
                    if v39 then
                        v336:FireTalkingChangedDebounced(v336.isTalking);
                        return;
                    else
                        v336.talkingChanged:Fire(v336.isTalking);
                    end;
                end;
            end);
        end;
        if v43() then
            v336:StartModerationSignal();
        elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
            v336.playerModeratedConnection = v336.service.LocalPlayerModerated:connect(function() --[[ Line: 1868 ]]
                -- upvalues: v28 (ref), v336 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref)
                v28:debug("User Moderated old");
                v336.previousSessionId = v336.service:GetSessionId();
                v336:emit("OnPlayerModerated");
                if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
                    l_VoiceChatService_0:leaveVoice();
                    return;
                else
                    v336.service:Leave();
                    return;
                end;
            end);
        end;
        if v48() then
            v28:trace("Setting up voice nudge handlers");
            v336.voiceToxicityModalConnection = v336:GetSignalREvent("VoiceToxicityModal"):Connect(function(v360) --[[ Line: 1882 ]]
                -- upvalues: v336 (copy)
                v336.Analytics:reportReceivedNudge(v360, v336:GetNudgeAnalyticsData());
                v336:emit("OnVoiceToxicityModal");
            end);
            v336.VoiceToxicityToastConnection = v336:GetSignalREvent("VoiceToxicityToast"):Connect(function(v361) --[[ Line: 1888 ]]
                -- upvalues: v336 (copy)
                v336.Analytics:reportReceivedNudge(v361, v336:GetNudgeAnalyticsData());
                v336:emit("OnVoiceToxicityToast");
            end);
        end;
        if v49() then
            v28:trace("Setting up voice reverse nudge handlers");
            v336.voiceReverseNudgeConnection = v336:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(v362) --[[ Line: 1896 ]]
                -- upvalues: v336 (copy)
                v336:emit("OnVoiceReverseNudgeIconColorChange", v362);
            end);
        end;
        v336.blockConnection = v336.BlockStatusChanged:Connect(function(v363, v364) --[[ Line: 1901 ]]
            -- upvalues: v336 (copy), v28 (ref), v18 (ref)
            if v364 then
                if v336.participants[tostring(v363)] then
                    v28:debug("Blocking {}", v18.shorten(v363));
                    v336.service:SubscribeBlock(v363);
                    return;
                end;
            else
                v28:debug("UnBlocking {}", v18.shorten(v363));
                v336.service:SubscribeUnblock(v363);
            end;
        end);
        if l_VoiceChatService_0.UseNewAudioApi then
            v336:hookupAudioDeviceInputListener();
        end;
        if v336.service.TempSetMicMutedToggleMic then
            v336.tempSetMicMutedToggleMicConnection = v336.service.TempSetMicMutedToggleMic:connect(function() --[[ Line: 1919 ]]
                -- upvalues: v336 (copy)
                v336:ToggleMic("TempSetMicMutedToggleMic");
            end);
        end;
        if v73 then
            v336.videoCaptureInProgressConnection = v336.CaptureService.VideoCaptureInProgress:connect(function(v365) --[[ Line: 1926 ]]
                -- upvalues: v336 (copy), v95 (ref)
                if v365 then
                    v336.voiceCapturedDuringVideoCapture = false;
                    return;
                else
                    v336.TelemetryService:LogEvent(v95, {
                        customFields = {
                            voiceCaptured = v336.voiceCapturedDuringVideoCapture
                        }
                    });
                    return;
                end;
            end);
        end;
    end;
end;
local v366 = nil;
v99.CheckAudioInputExists = function(v367) --[[ Line: 1941 ]] --[[ Name: CheckAudioInputExists ]]
    -- upvalues: v28 (copy), v366 (ref), v22 (copy), v23 (copy)
    v28:trace("Checking for AudioDeviceInput");
    if not v366 then
        v366 = v22.new(function(v368, _) --[[ Line: 1944 ]]
            -- upvalues: v23 (ref), v367 (copy), v28 (ref)
            if #v23.Dictionary.keys(v367.audioDevices) > 0 then
                v28:trace("Found existing AudioDeviceInput");
                v368();
                return;
            else
                v367.audioDeviceInputAdded.Event:Connect(function() --[[ Line: 1949 ]]
                    -- upvalues: v28 (ref), v368 (copy)
                    v28:trace("Found new AudioDeviceInput");
                    v368();
                end);
                return;
            end;
        end);
    end;
    return v366;
end;
v99.checkAndUpdateSequence = function(v370, v371, v372) --[[ Line: 1959 ]] --[[ Name: checkAndUpdateSequence ]]
    if not v372 then
        return 0;
    elseif not v370.SequenceNumbers[v371] then
        v370.SequenceNumbers[v371] = v372;
        return 0;
    else
        local v373 = v372 - v370.SequenceNumbers[v371];
        if v373 > 0 then
            v370.SequenceNumbers[v371] = v372;
        end;
        return v373 - 1;
    end;
end;
v99.onInstanceAdded = function(v374, v375) --[[ Line: 1982 ]] --[[ Name: onInstanceAdded ]]
    -- upvalues: v28 (copy)
    if v375:IsA("AudioDeviceInput") then
        v28:debug("Found new audio device instance for {}", v375.Player and v375.Player.Name);
        v374.audioDevices[v375] = v374:CreateAudioDeviceData(v375);
        v374:emit("OnAudioDeviceInputAdded");
        v374:StartAnalysis(v375);
    end;
end;
v99.GetSendMuteEvent = function(v376) --[[ Line: 1992 ]] --[[ Name: GetSendMuteEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v376.SendMuteEvent then
        v376.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v376.SendMuteEvent;
end;
v99.GetToggleVoiceChangerEvent = function(v377) --[[ Line: 1999 ]] --[[ Name: GetToggleVoiceChangerEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v377.SendVoiceChangerEvent then
        v377.SendVoiceChangerEvent = l_ReplicatedStorage_0:WaitForChild("ToggleUserVoiceChanger", 10);
    end;
    return v377.SendVoiceChangerEvent;
end;
v99.GetInputToModifierWire = function(v378) --[[ Line: 2006 ]] --[[ Name: GetInputToModifierWire ]]
    -- upvalues: l_Players_0 (copy)
    if not v378.InputToModifierWire then
        v378.InputToModifierWire = l_Players_0.LocalPlayer:FindFirstChild("InputToModifier");
    end;
    return v378.InputToModifierWire;
end;
v99.GetPartyVoiceDeviceInput = function(v379) --[[ Line: 2013 ]] --[[ Name: GetPartyVoiceDeviceInput ]]
    -- upvalues: l_Players_0 (copy)
    if not v379.PartyVoiceDeviceInput then
        v379.PartyVoiceDeviceInput = l_Players_0.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput");
    end;
    return v379.PartyVoiceDeviceInput;
end;
v99.GetSetVoicePackEvent = function(v380) --[[ Line: 2021 ]] --[[ Name: GetSetVoicePackEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v380.SetVoicePackEvent then
        v380.SetVoicePackEvent = l_ReplicatedStorage_0:WaitForChild("SetVoicePack", 10);
    end;
    return v380.SetVoicePackEvent;
end;
v99.GetVoiceChangerWasToggledEvent = function(v381) --[[ Line: 2028 ]] --[[ Name: GetVoiceChangerWasToggledEvent ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    if not v381.VoiceChangerWasToggledEvent then
        v381.VoiceChangerWasToggledEvent = l_ReplicatedStorage_0:WaitForChild("VoiceChangerWasToggled", 3);
    end;
    return v381.VoiceChangerWasToggledEvent;
end;
local function _(v382, v383) --[[ Line: 2036 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v382;
    l_Wire_0.TargetInstance = v383;
    l_Wire_0.Parent = v383;
    return l_Wire_0;
end;
local function _() --[[ Line: 2045 ]] --[[ Name: GetAnalysisHost ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    return l_RobloxReplicatedStorage_0;
end;
v99.GetAnalyzer = function(_, v388) --[[ Line: 2049 ]] --[[ Name: GetAnalyzer ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v389 = v388.Name .. "_Analyzer";
    local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
    local l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = l_l_RobloxReplicatedStorage_0_0:FindFirstChild(v389);
    if not l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 then
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = Instance.new("AudioAnalyzer");
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.SpectrumEnabled = false;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Name = v389;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Parent = l_l_RobloxReplicatedStorage_0_0;
    end;
    return l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0;
end;
local function _(v392) --[[ Line: 2062 ]] --[[ Name: toDecibels ]]
    return math.log10(v392) * 20;
end;
v99.IsSignalActive = function(v394, v395) --[[ Line: 2066 ]] --[[ Name: IsSignalActive ]]
    -- upvalues: v67 (copy), l_Players_0 (copy)
    if not v67 then
        return false;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v395);
        if not l_l_Players_0_PlayerByUserId_0 then
            return false;
        else
            return math.log10(v394:GetAnalyzer(l_l_Players_0_PlayerByUserId_0).PeakLevel) * 20 > -36;
        end;
    end;
end;
v99.StopAnalysis = function(_, v398) --[[ Line: 2080 ]] --[[ Name: StopAnalysis ]]
    -- upvalues: v67 (copy), l_RobloxReplicatedStorage_0 (copy)
    if not v67 then
        return;
    else
        for _, v400 in v398:GetConnectedWires("Output") do
            local l_TargetInstance_0 = v400.TargetInstance;
            if l_TargetInstance_0 and l_TargetInstance_0:IsDescendantOf(l_RobloxReplicatedStorage_0) then
                v400:Destroy();
            end;
        end;
        return;
    end;
end;
v99.StartAnalysis = function(v402, v403) --[[ Line: 2096 ]] --[[ Name: StartAnalysis ]]
    -- upvalues: v67 (copy)
    if not v67 then
        return;
    else
        v402:StopAnalysis(v403);
        local l_Player_0 = v403.Player;
        if not l_Player_0 then
            return;
        else
            local l_v402_Analyzer_0 = v402:GetAnalyzer(l_Player_0);
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = v403;
            l_Wire_1.TargetInstance = l_v402_Analyzer_0;
            l_Wire_1.Parent = l_v402_Analyzer_0;
            return;
        end;
    end;
end;
v99.GetVoiceConnectCookie = function(v407) --[[ Line: 2110 ]] --[[ Name: GetVoiceConnectCookie ]]
    -- upvalues: v17 (copy)
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 2111 ]]
        -- upvalues: v407 (copy), v17 (ref)
        return v407.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
    end);
    if l_status_8 and l_result_8 then
        return l_result_8;
    else
        return "";
    end;
end;
v99.GetVoiceConnectCookieValue = function(v410) --[[ Line: 2122 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 2124 ]]
            -- upvalues: v410 (copy), v17 (ref)
            return v410.AppStorageService:GetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3);
        end);
        if l_status_9 then
            return l_result_9 == "true";
        else
            return true;
        end;
    else
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 2130 ]]
            -- upvalues: v410 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref)
            return v410.AppStorageService:GetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY);
        end);
        if l_status_10 then
            return l_result_10 == "true";
        else
            return true;
        end;
    end;
end;
v99.SetVoiceConnectCookieValue = function(v415, v416) --[[ Line: 2142 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v17 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        return (pcall(function() --[[ Line: 2144 ]]
            -- upvalues: v415 (copy), v17 (ref), v416 (copy)
            v415.AppStorageService:SetItem(v17.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(v416)));
            v415.AppStorageService:Flush();
        end));
    else
        return (pcall(function() --[[ Line: 2150 ]]
            -- upvalues: v415 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v17 (ref), v416 (copy)
            v415.AppStorageService:SetItem(if l_GetFFlagEnableSeamlessVoiceV2_0() then v17.VOICE_CONNECT_DISCONNECT_KEY_V2 else v17.VOICE_CONNECT_DISCONNECT_KEY, (tostring(v416)));
            v415.AppStorageService:Flush();
        end));
    end;
end;
v99.SetNewUserFTUXCookieValue = function(v417, v418) --[[ Line: 2163 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    -- upvalues: v17 (copy)
    return (pcall(function() --[[ Line: 2164 ]]
        -- upvalues: v417 (copy), v17 (ref), v418 (copy)
        v417.AppStorageService:SetItem(v17.SEAMLESS_VOICE_FTUX_KEY, (tostring(v418)));
        v417.AppStorageService:Flush();
    end));
end;
v99.SetAndSyncActive = function(v419, v420, v421) --[[ Line: 2171 ]] --[[ Name: SetAndSyncActive ]]
    -- upvalues: l_Players_0 (copy)
    v420.Active = v421;
    local l_v419_SendMuteEvent_0 = v419:GetSendMuteEvent();
    if l_v419_SendMuteEvent_0 and v420.Player == l_Players_0.LocalPlayer then
        l_v419_SendMuteEvent_0:FireServer(v421);
    end;
end;
v99.CreateAudioDeviceData = function(v423, v424) --[[ Line: 2180 ]] --[[ Name: CreateAudioDeviceData ]]
    -- upvalues: l_Players_0 (copy), l_game_EngineFeature_0 (copy), v32 (copy), v28 (copy), v33 (copy)
    local v425 = {};
    local v426 = v424.Player == l_Players_0.LocalPlayer;
    if l_game_EngineFeature_0 then
        if not v424.MutedByLocalUser then
            if v423.muteAll and not v426 then
                v424.MutedByLocalUser = true;
            end;
            if v424.Player and v423.mutedPlayers[v424.Player.UserId] then
                v424.MutedByLocalUser = true;
            end;
        end;
    elseif v424.Active then
        if v423.muteAll and not v426 then
            v424.Active = false;
        end;
        if v424.Player and v423.mutedPlayers[v424.Player.UserId] then
            v424.Active = false;
        end;
    end;
    if v32 and v424.Active and v426 and v423.localMuted == nil then
        v423:SetAndSyncActive(v424, false);
    end;
    if v426 and v423.localMuted ~= nil and v423.localMuted ~= not v424.Active and not v423.isInCall then
        v28:debug("Mismatch between LocalMuted and device.Active");
        local v427 = not v423.localMuted;
        v424.Active = v427;
        local l_v423_SendMuteEvent_0 = v423:GetSendMuteEvent();
        if l_v423_SendMuteEvent_0 then
            l_v423_SendMuteEvent_0:FireServer(v427);
        end;
    elseif v423.isInCall and v426 then
        local v429 = not v423.callMutedState;
        v28:debug("Overwriting Active State to match Iris call. .Active = {}", v429);
        v424.Active = v429;
        local l_v423_SendMuteEvent_1 = v423:GetSendMuteEvent();
        if l_v423_SendMuteEvent_1 then
            l_v423_SendMuteEvent_1:FireServer(v429);
        end;
    end;
    v425.onPlayerChanged = v424:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 2232 ]]
        -- upvalues: v33 (ref), v426 (ref), v424 (copy), l_Players_0 (ref), v32 (ref), v423 (copy), v28 (ref), l_game_EngineFeature_0 (ref)
        if v33 then
            v426 = v424.Player == l_Players_0.LocalPlayer;
            if v426 then
                if v32 and v424.Active and v423.localMuted == nil then
                    v423:SetAndSyncActive(v424, false);
                elseif v423.localMuted ~= nil and v423.localMuted ~= not v424.Active then
                    v28:debug("Mismatch between LocalMuted and device.Active");
                    v423:SetAndSyncActive(v424, not v423.localMuted);
                end;
            elseif v423.muteAll or v424.Player and v423.mutedPlayers[v424.Player.UserId] then
                if l_game_EngineFeature_0 then
                    v424.MutedByLocalUser = true;
                else
                    v424.Active = false;
                end;
            end;
        end;
        v423:emit("OnDevicePlayerChanged");
        v423:StartAnalysis(v424);
    end);
    v425.onMutedChanged = v424:GetPropertyChangedSignal("Muted"):Connect(function() --[[ Line: 2257 ]]
        -- upvalues: v423 (copy)
        v423:emit("OnDeviceMuteChanged");
    end);
    if not l_game_EngineFeature_0 then
        v425.onActiveChanged = v424:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 2262 ]]
            -- upvalues: v423 (copy), v426 (ref), v424 (copy)
            v423:emit("OnDeviceActiveChanged");
            if v423.muteAll and not v426 then
                v424.Active = false;
            end;
            if v424.Player and v423.mutedPlayers[v424.Player.UserId] then
                v424.Active = false;
            end;
        end);
    end;
    return v425;
end;
v99.onInstanceRemove = function(v431, v432) --[[ Line: 2276 ]] --[[ Name: onInstanceRemove ]]
    -- upvalues: v28 (copy), l_game_EngineFeature_0 (copy), v67 (copy)
    if v432:IsA("AudioDeviceInput") then
        v431:StopAnalysis(v432);
        v28:trace("Removing AudioDeviceInput {} {} {}", v432, "for user", v432.Player and v432.Player.UserId);
        local v433 = v431.audioDevices[v432];
        if v433 then
            if not l_game_EngineFeature_0 then
                v433.onActiveChanged:Disconnect();
            end;
            v433.onMutedChanged:Disconnect();
            v433.onPlayerChanged:Disconnect();
        end;
        v431.audioDevices[v432] = nil;
        v431:emit("OnAudioDeviceInputRemoved");
        if v67 and v432.Player then
            v431:GetAnalyzer(v432.Player):Destroy();
        end;
    end;
end;
v99.hookupAudioDeviceInputListener = function(v434) --[[ Line: 2297 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    -- upvalues: v28 (copy), l_Players_0 (copy), v31 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), l_CollectionService_0 (copy), v18 (copy)
    v28:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v31 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v436) --[[ Line: 2301 ]]
            -- upvalues: v434 (copy)
            v434:onInstanceAdded(v436);
        end);
    else
        game.DescendantAdded:Connect(function(v437) --[[ Line: 2305 ]]
            -- upvalues: v434 (copy)
            v434:onInstanceAdded(v437);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v28:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v434:onInstanceAdded(l_AudioDeviceInput_0);
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
        for _, v443 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
            v18.destroyDefaultEmitter(v443);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v18.destroyDefaultEmitter);
        l_LocalPlayer_0.CharacterAdded:Connect(v18.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v18.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v444) --[[ Line: 2341 ]]
        -- upvalues: v434 (copy)
        v434:onInstanceRemove(v444);
    end);
    for _, v446 in game:GetDescendants() do
        v434:onInstanceAdded(v446);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v447) --[[ Line: 2350 ]]
        -- upvalues: v434 (copy)
        for v448 in v434.audioDevices do
            if v448.Player and v448.Player == v447 then
                v434:onInstanceRemove(v448);
            end;
        end;
    end);
end;
v99.RejoinCurrentChannel = function(v449) --[[ Line: 2360 ]] --[[ Name: RejoinCurrentChannel ]]
    -- upvalues: v46 (copy), v28 (copy)
    pcall(function() --[[ Line: 2361 ]]
        -- upvalues: v449 (copy), v46 (ref), v28 (ref)
        local l_GroupId_0 = v449.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v451 = v449.service:IsPublishPaused();
            v449.service:Leave();
            if v46() then
                v28:debug("Rejoining current channel {}", l_GroupId_0);
                v449.participants = {};
                v449.participantsUpdate:Fire(v449.participants);
            end;
            if not v449.service:JoinByGroupIdToken(l_GroupId_0, v451, true) then
                v449:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v99.RejoinChannel = function(v452, v453, v454) --[[ Line: 2380 ]] --[[ Name: RejoinChannel ]]
    -- upvalues: v28 (copy)
    v28:debug("Rejoining previous channel {} with mute status {}", v453, v454);
    if v453 and v453 ~= "" then
        pcall(function() --[[ Line: 2384 ]]
            -- upvalues: v452 (copy), v453 (copy), v454 (copy)
            v452.service:Leave();
            v452.participants = {};
            v452.participantsUpdate:Fire(v452.participants);
            if not v452.service:JoinByGroupIdToken(v453, v454, true) then
                v452:emit("OnInitialJoinFailed");
            end;
        end);
    end;
end;
v99.RejoinVoice = function(v455) --[[ Line: 2396 ]] --[[ Name: RejoinVoice ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v28 (copy), l_VoiceChatService_0 (copy)
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        v28:debug("Rejoining voice");
        v455.participants = {};
        v455.participantsUpdate:Fire(v455.participants);
        l_VoiceChatService_0:rejoinVoice();
    end;
end;
v99.watchSignalR = function(v456) --[[ Line: 2407 ]] --[[ Name: watchSignalR ]]
    -- upvalues: l_WATCHED_NAMESPACES_0 (copy), v18 (copy), v45 (copy), v28 (copy)
    v456.signalRConnection = v456.NotificationService.RobloxEventReceived:Connect(function(v457) --[[ Line: 2408 ]]
        -- upvalues: l_WATCHED_NAMESPACES_0 (ref), v18 (ref), v45 (ref), v456 (copy), v28 (ref)
        local l_namespace_0 = v457.namespace;
        if not l_WATCHED_NAMESPACES_0[l_namespace_0] then
            return;
        else
            local v459 = v18.jsonDecode(v457.detail);
            if v45() then
                local v460 = v456.SignalREventTable[v459.type];
                if v460 then
                    v460:Fire(v459);
                end;
            end;
            local l_SequenceNumber_0 = v459.SequenceNumber;
            v28:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v462 = v456:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v462 > 0 then
                v456.Analytics:reportReconnectDueToMissedSequence();
                return;
            else
                if v462 < -1 then
                    v456.Analytics:reportOutOfOrderSequence();
                end;
                return;
            end;
        end;
    end);
    v456.signalRConnectionChanged = v456.NotificationService.RobloxConnectionChanged:Connect(function(v463, v464, _, v466) --[[ Line: 2434 ]]
        -- upvalues: v28 (ref), v18 (ref), l_WATCHED_NAMESPACES_0 (ref), v456 (copy)
        if v463 == "signalR" then
            if v464 ~= Enum.ConnectionState.Connected then
                v28:info("SignalR disconnected");
                return;
            else
                for v467, v468 in pairs(v18.jsonDecode(v466)) do
                    if l_WATCHED_NAMESPACES_0[v467] then
                        v28:trace("SignalR message {}: {}", v467, v468);
                        local v469 = v456:checkAndUpdateSequence(v467, v468);
                        if v469 > 0 then
                            v456.Analytics:reportReconnectDueToMissedSequence();
                        elseif v469 < -1 then
                            v456.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v99.StopSignalRConnection = function(v470) --[[ Line: 2459 ]] --[[ Name: StopSignalRConnection ]]
    if v470.signalRConnectionChanged then
        v470.signalRConnectionChanged:Disconnect();
        v470.signalRConnectionChanged = nil;
    end;
    if v470.signalRConnection then
        v470.signalRConnection:Disconnect();
        v470.signalRConnection = nil;
    end;
end;
v99.getService = function(v471) --[[ Line: 2470 ]] --[[ Name: getService ]]
    return v471.service;
end;
v99.ToggleMic = function(v472, v473) --[[ Line: 2474 ]] --[[ Name: ToggleMic ]]
    -- upvalues: l_GetFFlagPartyVoiceMuteScopeFix_0 (copy), v28 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), l_PermissionsProtocol_0 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy)
    v472:ensureInitialized("toggle mic");
    if v472.localMuted == nil then
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("ToggleMic context: {} - Voice not connected yet", v473);
        end;
        return;
    else
        if l_GetFFlagPartyVoiceMuteScopeFix_0() then
            v28:trace("ToggleMic context: {}", v473);
        end;
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if v472.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v28:debug("In pending mic mode, requesting permission");
                v472:emit("GetPermissions", function(v474) --[[ Line: 2491 ]]
                    -- upvalues: v472 (copy), l_PERMISSION_STATE_0 (ref), v28 (ref), v473 (copy)
                    v472.permissionState = if v474.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_AND_TALK else l_PERMISSION_STATE_0.LISTEN_ONLY;
                    v28:debug("Got permissions, setting state to {}", v472.permissionState);
                    v472:ToggleMic(v473);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return;
            elseif v472.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v28:debug("User tried to unmute despite being in listen only mode");
                v472:emit("OnPermissionRequested");
                return;
            end;
        end;
        if v472.isPlayerWatchingAd then
            v28:trace("User is watching an ad, skipping toggling mic");
            return;
        else
            if l_VoiceChatService_0.UseNewAudioApi then
                v472.localMuted = not v472.localMuted;
                local v475 = not v472.localMuted;
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v28:trace("Setting self mute to {} context: {}", v475, v473);
                else
                    v28:trace("Setting self mute to {}", v475);
                end;
                local l_v472_SendMuteEvent_0 = v472:GetSendMuteEvent();
                if l_v472_SendMuteEvent_0 then
                    l_v472_SendMuteEvent_0:FireServer(v475);
                    for v477 in v472.audioDevices do
                        if v477.Player and v477.Player == l_Players_0.LocalPlayer then
                            v477.Active = v475;
                        end;
                    end;
                    v472.muteChanged:Fire(v472.localMuted);
                else
                    v28:error("Could not find SendMuteEvent");
                end;
            else
                local v478 = not v472.service:IsPublishPaused();
                if l_GetFFlagPartyVoiceMuteScopeFix_0() then
                    v28:trace("Setting self mute to {} context: {}", v478, v473);
                else
                    v28:trace("Setting self mute to {}", v478);
                end;
                v472.service:PublishPause(v478);
                v472.localMuted = v478;
                v472.muteChanged:Fire(v478);
            end;
            if not v472.localMuted then
                v472.talkingChanged:Fire(v472.isTalking);
                v472:emit("OnShowDataConsentToast");
            end;
            if v473 then
                v472.Analytics:reportVoiceMuteSelf((v472:JoinWithVoiceMuteData({
                    context = v473, 
                    muted = v472.localMuted
                })));
            end;
            return;
        end;
    end;
end;
v99.ToggleVoiceChanger = function(v479, _) --[[ Line: 2560 ]] --[[ Name: ToggleVoiceChanger ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v479:ensureInitialized("toggle voice changer");
    if v479.localMuted == nil then
        return;
    elseif l_VoiceChatService_0.UseNewAudioApi then
        v479.isVoiceChangerActive = not v479.isVoiceChangerActive;
        v28:trace("setting voice changer active to {}", v479.isVoiceChangerActive);
        local l_v479_ToggleVoiceChangerEvent_0 = v479:GetToggleVoiceChangerEvent();
        if l_v479_ToggleVoiceChangerEvent_0 then
            l_v479_ToggleVoiceChangerEvent_0:FireServer(v479.isVoiceChangerActive);
            v479.voiceChangerChanged:Fire(v479.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    else
        v479.isVoiceChangerActive = false;
        v28:trace("forcibly disabling voice changer since using old audio api", v479.isVoiceChangerActive);
        local l_v479_ToggleVoiceChangerEvent_1 = v479:GetToggleVoiceChangerEvent();
        if l_v479_ToggleVoiceChangerEvent_1 then
            l_v479_ToggleVoiceChangerEvent_1:FireServer(v479.isVoiceChangerActive);
            v479.voiceChangerChanged:Fire(v479.isVoiceChangerActive);
            return;
        else
            v28:error("Could not find ToggleVoiceChangerEvent");
            return;
        end;
    end;
end;
v99.ToggleVoiceChangerHearMyself = function(v483, _) --[[ Line: 2590 ]] --[[ Name: ToggleVoiceChangerHearMyself ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    if v483.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v483.isVoiceChangerHearMyselfActive = not v483.isVoiceChangerHearMyselfActive;
            local l_v483_InputToModifierWire_0 = v483:GetInputToModifierWire();
            local l_v483_PartyVoiceDeviceInput_0 = v483:GetPartyVoiceDeviceInput();
            if l_v483_InputToModifierWire_0 and l_v483_PartyVoiceDeviceInput_0 then
                v28:trace("setting voice changer hear myself active to {}", v483.isVoiceChangerHearMyselfActive);
                if v483.isVoiceChangerHearMyselfActive then
                    l_v483_InputToModifierWire_0.SourceInstance = l_v483_PartyVoiceDeviceInput_0;
                else
                    l_v483_InputToModifierWire_0.SourceInstance = nil;
                end;
                v483.voiceChangerHearMyselfChanged:Fire(v483.isVoiceChangerHearMyselfActive);
                return;
            else
                v28:error("Could not find InputToModifierWire or PartyVoiceDeviceInput");
            end;
        end;
        return;
    end;
end;
v99.SetVoicePack = function(v487, v488) --[[ Line: 2615 ]] --[[ Name: SetVoicePack ]]
    -- upvalues: l_VoiceChatService_0 (copy), v28 (copy)
    v487:ensureInitialized("set voice pack");
    if v487.localMuted == nil then
        return;
    else
        if l_VoiceChatService_0.UseNewAudioApi then
            v487.currentVoicePack = v488;
            v28:trace("setting current voice pack to {}", v487.currentVoicePack);
            local l_v487_SetVoicePackEvent_0 = v487:GetSetVoicePackEvent();
            if l_v487_SetVoicePackEvent_0 then
                l_v487_SetVoicePackEvent_0:FireServer("VoicePack_" .. v487.currentVoicePack);
                return;
            else
                v28:error("Could not find SetVoicePackEvent");
            end;
        end;
        return;
    end;
end;
v99.JoinWithVoiceMuteData = function(v490, v491) --[[ Line: 2634 ]] --[[ Name: JoinWithVoiceMuteData ]]
    -- upvalues: l_Players_0 (copy), v23 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return v23.Dictionary.join({
        userId = l_LocalPlayer_1.UserId, 
        clientSessionId = v490:GetSessionId(), 
        channelId = v490:GetChannelId()
    }, v491);
end;
v99._reportJoinFailed = function(v493, v494, v495) --[[ Line: 2643 ]] --[[ Name: _reportJoinFailed ]]
    -- upvalues: v44 (copy)
    if v44() then
        v493.Analytics:reportVoiceChatJoinResult(false, v494, v495);
    end;
    v493:emit("OnReportJoinFailed", v494);
end;
v99._asyncInit = function(v496) --[[ Line: 2650 ]] --[[ Name: _asyncInit ]]
    -- upvalues: v28 (copy), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_VoiceChatService_0 (copy), v20 (copy), v22 (copy)
    v496:CheckCallState();
    return v496:canUseServiceAsync():andThen(function(_) --[[ Line: 2653 ]]
        -- upvalues: v28 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v496 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), l_VoiceChatService_0 (ref), v20 (ref), v22 (ref)
        local v498 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v498 = "VoiceChatInternal";
            v28:debug("Using VoiceChatInternal");
        end;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 2659 ]]
            -- upvalues: v498 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v496 (ref)
            local l_game_Service_0 = game:GetService(v498);
            if l_game_Service_0 and (l_game_Service_0:GetVoiceChatApiVersion() < l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 or l_game_Service_0:IsContextVoiceEnabled()) then
                v496.voiceEnabled = true;
                v496.service = l_game_Service_0;
                v496:SetupParticipantListeners();
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
            v496:_reportJoinFailed("getServiceFailed", v20.ERROR);
            if v496.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_GET_SERVICE_FAILED"
                });
            else
                return v22.reject();
            end;
        elseif not v496.service then
            v28:debug("VoiceChatService is not set after init");
            v496:_reportJoinFailed("contextNotEnabled");
            if v496.options.passInitErrorInPromiseReject then
                return v22.reject({
                    code = "INIT_ERROR_CONTEXT_NOT_ENABLED"
                });
            else
                return v22.reject();
            end;
        else
            v496:emit("OnVoiceChatServiceInitialized");
            v496:watchSignalR();
            return v22.resolve();
        end;
    end);
end;
v99.UpdateLocalMetering = function(v503) --[[ Line: 2709 ]] --[[ Name: UpdateLocalMetering ]]
    -- upvalues: l_Players_0 (copy), v39 (copy)
    v503.isTalking = v503:IsSignalActive(l_Players_0.LocalPlayer.UserId);
    if v503.localMuted == false then
        if v39 then
            v503:FireTalkingChangedDebounced(v503.isTalking);
            return;
        else
            v503.talkingChanged:Fire(v503.isTalking);
        end;
    end;
end;
v99.FireTalkingChangedDebounced = function(v504, v505) --[[ Line: 2720 ]] --[[ Name: FireTalkingChangedDebounced ]]
    -- upvalues: v40 (copy)
    local l_v40_0 = v40;
    local v507 = tick() * 1000;
    if l_v40_0 < v507 - v504._lastTalkingChangedFireTime then
        v504._lastTalkingChangedFireTime = v507;
        v504.talkingChanged:Fire(v505);
    end;
end;
v99.asyncInit = function(v508) --[[ Line: 2730 ]] --[[ Name: asyncInit ]]
    -- upvalues: v28 (copy), v22 (copy), v30 (copy), l_HttpService_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v65 (copy), v17 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v34 (copy)
    if v508.service then
        v28:trace("Manager already initialized");
        return v22.resolve();
    else
        if not v508.initPromise then
            v508.initPromise = v508:_asyncInit();
            if v30 and not v508.LikelySpeakingUsersEvent then
                task.spawn(function() --[[ Line: 2742 ]]
                    -- upvalues: v508 (copy), v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref)
                    local l_v508_LikelySpeakingUsersEvent_0 = v508:GetLikelySpeakingUsersEvent();
                    if l_v508_LikelySpeakingUsersEvent_0 then
                        v28:trace("Connecting to likely speaking users");
                        l_v508_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v510) --[[ Line: 2746 ]]
                            -- upvalues: v28 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v508 (ref)
                            v28:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v510));
                            if l_GetFFlagShowLikelySpeakingBubbles_0() and v508:UserEligibleForLikelySpeakingBubbles() then
                                v508:emit("OnLikelySpeakingUsersUpdated", v510);
                            end;
                        end);
                    end;
                end);
            end;
            if v65 then
                v28:trace("Polling for likely speaking users");
                task.spawn(function() --[[ Line: 2760 ]]
                    -- upvalues: v508 (copy)
                    v508:SendLikelySpeakingPing();
                end);
            end;
            if v508.AdService then
                (function(v511) --[[ Line: 2766 ]] --[[ Name: setupRewardedAdMuting ]]
                    -- upvalues: v17 (ref)
                    local v512 = false;
                    v511.AdService.RewardedVideoAdStarted:Connect(function() --[[ Line: 2768 ]]
                        -- upvalues: v511 (copy), v512 (ref), v17 (ref)
                        if v511.localMuted == nil then
                            return;
                        else
                            v512 = v511.localMuted;
                            if not v511.localMuted then
                                v511:ToggleMic(v17.REWARDED_VIDEO_AD_STARTED);
                            end;
                            v511.isPlayerWatchingAd = true;
                            return;
                        end;
                    end);
                    v511.AdService.RewardedVideoAdEnded:Connect(function() --[[ Line: 2784 ]]
                        -- upvalues: v511 (copy), v512 (ref), v17 (ref)
                        if v511.localMuted == nil then
                            return;
                        else
                            v511.isPlayerWatchingAd = false;
                            if v512 ~= v511.localMuted then
                                v511:ToggleMic(v17.REWARDED_VIDEO_AD_ENDED);
                            end;
                            return;
                        end;
                    end);
                end)(v508);
            end;
            if l_FFlagEnablePartyVoiceChangersInLua_0 and not v508.voiceChangerWasToggledEvent then
                task.spawn(function() --[[ Line: 2804 ]]
                    -- upvalues: v508 (copy), v34 (ref)
                    local l_v508_VoiceChangerWasToggledEvent_0 = v508:GetVoiceChangerWasToggledEvent();
                    if l_v508_VoiceChangerWasToggledEvent_0 then
                        l_v508_VoiceChangerWasToggledEvent_0.OnClientEvent:Connect(function(v514, v515) --[[ Line: 2808 ]]
                            -- upvalues: v34 (ref), v508 (ref)
                            local v516 = if v34 then v508.participants[tostring(v514)] else v508.participants[v514];
                            if v516 then
                                v516.isVoiceChangerActive = v515;
                                v508.voiceChangerActivePlayers[v514] = v515;
                                v508.participantsUpdate:Fire(v508.participants);
                            end;
                        end);
                    end;
                end);
            end;
        end;
        return v508.initPromise;
    end;
end;
v99.GetLikelySpeakingUsersEvent = function(v517) --[[ Line: 2828 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v517.LikelySpeakingUsersEvent then
        v517.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v517.LikelySpeakingUsersEvent;
end;
v99.GetReceiveLikelySpeakingEvent = function(v518) --[[ Line: 2836 ]] --[[ Name: GetReceiveLikelySpeakingEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v518.ReceiveLikelySpeakingUsersEvent then
        v518.ReceiveLikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("ReceiveLikelySpeakingUsers", 3);
    end;
    return v518.ReceiveLikelySpeakingUsersEvent;
end;
v99.SendLikelySpeakingPing = function(v519) --[[ Line: 2844 ]] --[[ Name: SendLikelySpeakingPing ]]
    -- upvalues: v28 (copy)
    v519:FetchVoicePermissions();
    local l_v519_ReceiveLikelySpeakingEvent_0 = v519:GetReceiveLikelySpeakingEvent();
    if not l_v519_ReceiveLikelySpeakingEvent_0 or not v519:UserEligibleForLikelySpeakingBubbles() then
        v28:debug("Could not find likely speaking users event.");
        return;
    else
        v28:trace("Sending likely speaking user event");
        l_v519_ReceiveLikelySpeakingEvent_0:FireServer();
        return;
    end;
end;
v99.IsInitialized = function(v521) --[[ Line: 2855 ]] --[[ Name: IsInitialized ]]
    if v521.service then
        return true;
    else
        return false;
    end;
end;
v99.ensureInitialized = function(v522, v523) --[[ Line: 2859 ]] --[[ Name: ensureInitialized ]]
    if not v522.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v523 .. " before calling init");
    end;
end;
v99.GetSessionId = function(v524) --[[ Line: 2866 ]] --[[ Name: GetSessionId ]]
    v524:ensureInitialized("get session id");
    return v524.service:GetSessionId();
end;
v99.GetChannelId = function(v525) --[[ Line: 2871 ]] --[[ Name: GetChannelId ]]
    v525:ensureInitialized("get channel id");
    return v525.service:GetChannelId();
end;
v99.Disconnect = function(v526) --[[ Line: 2876 ]] --[[ Name: Disconnect ]]
    -- upvalues: v73 (copy)
    if v526.participantConnection then
        v526.participantConnection:Disconnect();
        v526.participantConnection = nil;
    end;
    if v526.stateConnection then
        v526.stateConnection:Disconnect();
        v526.stateConnection = nil;
    end;
    if v526.micConnection then
        v526.micConnection:Disconnect();
        v526.micConnection = nil;
    end;
    if v526.blockConnection then
        v526.blockConnection:Disconnect();
        v526.blockConnection = nil;
    end;
    if v526.playerModeratedConnection then
        v526.playerModeratedConnection:Disconnect();
        v526.playerModeratedConnection = nil;
    end;
    if v526.voiceToxicityModalConnection then
        v526.voiceToxicityModalConnection:Disconnect();
        v526.voiceToxicityModalConnection = nil;
    end;
    if v526.VoiceToxicityToastConnection then
        v526.VoiceToxicityToastConnection:Disconnect();
        v526.VoiceToxicityToastConnection = nil;
    end;
    if v526.voiceReverseNudgeConnection then
        v526.voiceReverseNudgeConnection:Disconnect();
        v526.voiceReverseNudgeConnection = nil;
    end;
    if v526.tempSetMicMutedToggleMicConnection then
        v526.tempSetMicMutedToggleMicConnection:Disconnect();
        v526.tempSetMicMutedToggleMicConnection = nil;
    end;
    if v73 and v526.videoCaptureInProgressConnection then
        v526.videoCaptureInProgressConnection:Disconnect();
        v526.videoCaptureInProgressConnection = nil;
    end;
end;
v99.RequestHidePublicVoiceUI = function(v527) --[[ Line: 2927 ]] --[[ Name: RequestHidePublicVoiceUI ]]
    task.defer(function() --[[ Line: 2928 ]]
        -- upvalues: v527 (copy)
        v527.setVoiceUIVisibility:Fire(false);
    end);
end;
v99.RequestShowPublicVoiceUI = function(v528) --[[ Line: 2933 ]] --[[ Name: RequestShowPublicVoiceUI ]]
    task.defer(function() --[[ Line: 2934 ]]
        -- upvalues: v528 (copy)
        v528.setVoiceUIVisibility:Fire(true);
    end);
end;
v99.default = v99.new(v27:GetAfterBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0, nil, nil, nil, nil, nil, l_ThirdPartyUserService_0, nil, l_AdService_0);
return v99;